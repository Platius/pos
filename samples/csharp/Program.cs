using System;
using System.Reflection;
using Platius.Service.Api.Common.Front.Data;
using Platius.Service.Api.Front.v2.Client;
using Platius.Service.Api.Front.v2.Client.Extensions;
using Platius.Service.Api.Front.v2.Data;

namespace Client
{
    internal class Program
    {
        private static void Main(string[] args)
        {
            // Задаем параметры, с которыми будет работать клиентская библиотека iiko.net
            var startupParams = new StartupParams
            {
                Host = "http://www4.iiko.net:9010",
                Login = "1714",
                Password = "1714",
                SyncCallTimeoutSec = 15*60,
                UseCompression = true,
                TerminalId = "1",
                Vendor = "Platius",
                Product = "C# Test client",
                ProductVersion = Assembly.GetExecutingAssembly().GetName().Version.ToString(),
                PluginVersion = Assembly.GetExecutingAssembly().GetName().Version.ToString()
            };

            // Создаем экземпляр клиента, подходящий нам по бизнеспроцессу
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
                Amount = 1,
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
                Items = new[] {item1, item2}
            };

            const string credential = "555444";
            var errStr = string.Empty;
            try
            {
                var result = flow.Checkin(credential, UserSearchScope.CardNumber, order, null);
            }
            catch (Exception ex)
            {
                errStr = ex.ToString();
            }
            Console.WriteLine(errStr);
            Console.ReadLine();

        }
    }
}
