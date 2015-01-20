'Init
Set startupParams = CreateObject("iikoNet.Service.Api.Front.v2.Client.StartupParams")
startupParams.Host = "iiko.net"
startupParams.Login = "test"
startupParams.Password = "test"
startupParams.TerminalId = "POS-1"
startupParams.SyncCallTimeoutSec = 15
startupParams.AsyncCallWaitTimeoutSec = 3
startupParams.Locale = "ru-Ru"
startupParams.UseCompression = True
startupParams.PosInfo = "POS system, ver.1.0.0 build at 2014.10.14"

Set flow = CreateObject("iikoNet.Service.Api.Front.v2.Client.Extensions.BasicWorkflowDummy")
flow.Initialize (startupParams)

'Checkin
Set order = flow.CreateOrder()
order.Id = flow.NewGuid
order.Number = "444"
order.Sum = 621.2
order.SumAfterDiscount = 610.6

Set item1 = flow.CreateOrderItem()
item1.ProductCode = "100100"
item1.ProductName = "Product1"
item1.Amount = 1
item1.Sum = 600
item1.SumAfterDiscount = 600
order.AddItem(item1)

Set item2 = flow.CreateOrderItem()
item2.ProductCode = "200100"
item2.ProductName = "Product2"
item2.Amount = 0.53
item2.Sum = 21.2
item2.SumAfterDiscount = 10.6
order.AddItem(item2)

Set productLimit = flow.CreateProductLimit()
productLimit.ProductCode = "100100"
productLimit.CanBePaidByBonuses = false
productLimit.MinPrice = 500

Set limits = flow.CreateParamsCollection()
limits.Add(productLimit)

Set checkinResult =  flow.Checkin("12345", 16, order, limits)

'Pay
Set walletPayment = flow.CreateWalletPayment()
walletPayment.WalletCode = "paymentCard"
walletPayment.Sum = 100

Set payments = flow.CreateParamsCollection()
payments.Add(walletPayment)

Set appliedDiscount = flow.CreateAppliedDiscount()
appliedDiscount.DiscountName = "Test"
appliedDiscount.ProductCode = "123"
appliedDiscount.Sum = 100

Set discounts = flow.CreateParamsCollection()
discounts.Add(appliedDiscount)

Call flow.Pay(order.Id, flow.NewGuid, payments, discounts)

'Close
Set closeResult = flow.Close(order, 100)

MsgBox (startupParams.Host)
