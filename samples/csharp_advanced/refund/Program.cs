using System;
using System.Reflection;
using Platius.Service.Api.Common.Front.Data;
using Platius.Service.Api.Front.v2.Client;
using Platius.Service.Api.Front.v2.Data;

namespace Refund
{
    internal class Program
    {
        private static void Main()
        {
            //Предусловие: На кассе существует Закрытый заказ (был вызван метод API Close).
            //Гость через сайт оплатил заказ картой и бонусами. А метод UpdateOrder вернул на кассу информацию о том, сколько пользователь платит картой и бонусами.
            //Касса сама рассчитывает, какой товар получает какую часть этой оплаты, и сохраняет у себя эту информацию, а в будущем передаёт её в метод Refund.

            #region Prerequisites

            // Задаем параметры, с которыми будет работать клиентская библиотека
            var startupParams = new StartupParams
            {
                Host = "http://www4.iiko.net:9010",
                Login = "1714",
                Password = "1714",
                SyncCallTimeoutSec = 15*60,
                UseCompression = true,
                TerminalInfo = new TerminalInfo
                {
                    Vendor = "Platius",
                    TerminalId = "1",
                    Product = "C# Test client",
                    ProductVersion = Assembly.GetExecutingAssembly().GetName().Version.ToString()
                },
                PluginVersion = Assembly.GetExecutingAssembly().GetName().Version.ToString()
            };

            // Создаем экземпляр клиента, подходящий нам по бизнес-процессу
            var flow = new Workflow(startupParams);

            // Создаем заказ с двумя элементами
            var item1 = new OrderItem
            {
                ProductCode = "100100",
                ProductName = "Салат",
                Amount = 1,
                Sum = 600,
                SumAfterDiscount = 600
            };
            var item2 = new OrderItem
            {
                ProductCode = "200100",
                ProductName = "Чай",
                Amount = 2,
                Sum = 50,
                SumAfterDiscount = 25
            };

            var order = new Order
            {
                Id = Guid.NewGuid(),
                Number = "1",
                WaiterName = "Петров Сергей",
                Sum = item1.Sum + item2.Sum,
                SumAfterDiscount = item1.SumAfterDiscount + item2.SumAfterDiscount,
                Items = new[] {item1, item2},
                OpenTime = DateTimeOffset.Now
            };
            const string credential = "555444";
            flow.Checkin(credential, UserSearchScope.CardNumber, order, null);
            //Оплачиваем заказ
            var paymentTransactionId = Guid.NewGuid();
            const decimal cardPayment = 200;
            const decimal bonusPayment = 50;
            flow.Pay(order.Id, paymentTransactionId, new[]
            {
                new WalletPayment {WalletCode = Consts.BonusWalletCode, Sum = bonusPayment},
                // new WalletPayment {WalletCode = Consts.PaymentCardWalletCode, Sum = cardPayment} //В данном примере оплата картой закомментирована, потому что нельзя платить картой с таким способом авторизации.
            }, null);
            //Закрываем заказ - без этого рефанд работать не будет
            flow.CloseOrder(order, cardPayment);

            #endregion

            #region Refunds

            //В первом рефанде отменяем одну позицию item2.
            //Касса считает, сколько средств им надо вернуть (вероятно, пропорционально сумме оплаты).
            const decimal firstBonusRefundSum = 30;
            //Идентификатор первой операции refund. Для каждой Успешной операции нужен новый идентификатор. Для повтора Неуспешной операции (предыдущий вызов кинул исключение) используется этот же идентификатор.
            var firstRefundId = Guid.NewGuid();
            var firstRefundResult = flow.Refund(order.Id,
                firstRefundId,
                new[]
                {
                    new WalletRefund {Sum = firstBonusRefundSum, WalletCode = Consts.BonusWalletCode},
                }, new[]
                {
                    new CancelledOrderItem {Amount = 1, ProductCode = item2.ProductCode}
                });
            var chequeFooter = firstRefundResult.ChequeFooter;
            Console.WriteLine(chequeFooter);
            //Во втором рефанде отменяем все оставшиеся товары (передавая null)
            const decimal secondBonusRefundSum = bonusPayment - firstBonusRefundSum;
            //const decimal secondCardRefundSum = cardPayment;
            //Идентификатор второй операции refund.
            var secondRefundId = Guid.NewGuid();
            var secondRefundResult = flow.Refund(order.Id,
                secondRefundId,
                new[]
                {
                    new WalletRefund {Sum = secondBonusRefundSum, WalletCode = Consts.BonusWalletCode},
                    // new WalletRefund {Sum = secondCardRefundSum, WalletCode = Consts.PaymentCardWalletCode} //Возврат средств на карту закомментирован по той же причине, что и оплата.
                },
                //null - значит полную отмену всех товаров. Сумму при этом касса всё равно должна передать.
                null);
            chequeFooter = secondRefundResult.ChequeFooter;
            Console.WriteLine(chequeFooter);

            #endregion

            Console.ReadLine();

        }
    }
}