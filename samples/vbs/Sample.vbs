Option Explicit

'Init
Dim startupParams
Set startupParams = CreateObject("Platius.Service.Api.Front.v2.Client.StartupParams")
startupParams.Host = "http://www4.platius.ru:9010"
startupParams.Login = "5536"
startupParams.Password = "5536"
startupParams.SyncCallTimeoutSec = 15
startupParams.AsyncCallWaitTimeoutSec = 3
startupParams.Locale = "ru-Ru"
startupParams.UseCompression = True
startupParams.TerminalId = "<TerminalId>"
startupParams.Vendor = "<VendorName>"
startupParams.Product = "<ProductName>"
startupParams.ProductVersion = "<ProductVersion>"
startupParams.PluginVersion = "<ProductVersion>"

Dim flow
Set flow = CreateObject("Platius.Service.Api.Front.v2.Client.Extensions.WorkflowDummy")
flow.Initialize (startupParams)

'Checkin
Dim order
Set order = flow.CreateOrder()
order.Id = flow.NewGuid
MsgBox (order.Id)
order.Number = "444"
order.Sum = 621.2
order.SumAfterDiscount = 610.6

Dim item1
Set item1 = flow.CreateOrderItem()
item1.ProductCode = "100100"
item1.ProductName = "Product1"
item1.Amount = 1
item1.Sum = 600
item1.SumAfterDiscount = 600
order.AddItem(item1)

Dim item2
Set item2 = flow.CreateOrderItem()
item2.ProductCode = "200100"
item2.ProductName = "Product2"
item2.Amount = 0.53
item2.Sum = 21.2
item2.SumAfterDiscount = 10.6
order.AddItem(item2)

Dim productLimit
Set productLimit = flow.CreateProductLimit()
productLimit.ProductCode = "100100"
productLimit.MaxBonusPayment = 500
productLimit.IsFullAmountLimit = True

Dim limits
Set limits = flow.CreateParamsCollection()
limits.Add(productLimit)

Dim checkinResult
Set checkinResult = flow.Checkin("12345", 2, order, Nothing)

'Pay
Dim walletPayment
Set walletPayment = flow.CreateWalletPayment()
' 0 - бонусы, 1 - банковские карты
walletPayment.WalletCode = 1 
walletPayment.Sum = 100

Dim payments
Set payments = flow.CreateParamsCollection()
payments.Add(walletPayment)

Dim appliedDiscount
Set appliedDiscount = flow.CreateAppliedDiscount()
appliedDiscount.ProgramId = flow.NewGuid
appliedDiscount.OperationCode = "Test"
appliedDiscount.ProductCode = "123"
appliedDiscount.Sum = 100

Dim discounts
Set discounts = flow.CreateParamsCollection()
discounts.Add(appliedDiscount)

Call flow.Pay(order.Id, flow.NewGuid, payments, discounts)

'Close
Dim closeResult
Set closeResult = flow.Close(order.Id, 100)

MsgBox (startupParams.Host)
