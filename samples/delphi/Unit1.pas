unit Unit1;

interface

uses
  Windows, ComObj, ActiveX, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Platius_Service_Api_Front_v2_Client_TLB, DateUtils;

type
  TForm1 = class(TForm)
    btnComplex: TButton;
    btnBasic: TButton;
    procedure btnBasicClick(Sender: TObject);
    procedure btnComplexClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    i_Flow : IWorkflow;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}
//{$R c:\Users\andy\Downloads\iikonet-front-api-client-com\Tlb\iikoNet.Service.Api.Front.v2.tlb}
//{$R c:\Users\andy\Downloads\iikonet-front-api-client-com\Tlb\iikoNet.Service.Api.Front.v2.Client.tlb}

procedure TForm1.FormCreate(Sender: TObject);
var
  i_startupParams : IStartupParams;
begin
  i_startupParams := CoStartupParams.Create();
  i_Flow := CoWorkflowImpl.Create();

  //Инициализация
  i_startupParams.Host := 'msk-dborisov.resto.lan';
//  i_startupParams.Host := 'www4.iiko.net';
  i_startupParams.Login := '7796';
  i_startupParams.Password := '7796';
  i_startupParams.TerminalId := 'POS-1';
  i_startupParams.SyncCallTimeoutSec := 10;
  i_startupParams.AsyncCallWaitTimeoutSec := 10;
  i_startupParams.Locale := 'ru-Ru';
  i_startupParams.UseCompression := True;
  i_startupParams.TerminalId := '999';
  i_startupParams.Vendor := 'KKC';
  i_startupParams.Product := 'Intellect Style';
  i_startupParams.ProductVersion := '0.1 beta';
  i_startupParams.PluginVersion := '0.01 alpha';
  i_Flow.Initialize(i_startupParams);
end;


procedure TForm1.btnBasicClick(Sender: TObject);
var
  i_item :  IOrderItem;
  i_productLimit : IProductLimit;
  i_order : IOrder;
  Index: Integer;
  i_checkinResult : ICheckinResult;
  guid, transactionGuid : TGuid;
  Sum : Currency;
  i_userdata : IUserData;
  walletCode : byte;
  discountCode, fullName, productCode, chequeFooter : widestring;
  i_productLimits : IParamsCollection;
  i_loyalityResult : ILoyaltyResult;
  operations, paymentLimits  : IResultsCollection;
  i_operation : ILoyaltyOperation;
  i_programResult : ILoyaltyProgramResult;
  i_paymentLimit : IPaymentLimit;
  i_walletPayment : IWalletPayment;
  i_appliedDiscount : IAppliedDiscount;
  hres : HRESULT;
  i, j, n : integer;
  i_payments, i_discounts : IParamsCollection;
  discountSum, minSum, maxSum : Double;
  i_closeResult : ICloseResult;
  discountsFlag : boolean;
  paymentsFlag : boolean;
  userPhone : String;
begin
  discountsFlag := false;
  paymentsFlag := false;
  try
    //идентификация клиента
    userPhone := '+79169059546';

    //новый счет
    i_order := i_Flow.CreateOrder();
    guid := i_Flow.NewGuid;
    i_order.Id := guid;
    i_order.Number := '444';

    //позиции
    for i := 1 to 3 do begin
      i_item := i_Flow.CreateOrderItem();
      i_item.ProductCode := IntToStr(i*100) + '100';
      i_item.ProductName := 'Product' + IntToStr(i);
      i_item.Amount := 1;
      i_item.Sum:= i * 100;
      i_item.SumAfterDiscount := i * 99;
      i_item.Comment := 'Comment' + IntToStr(i);
      i_item.ProductCategory := 'Category'  + IntToStr(i);
      i_order.AddItem(i_item);
    end;
    //общая сумма счета
    i_order.Sum := 6212;
    //общая сумма счета с учетом скидок ресторана
    i_order.SumAfterDiscount := 6106;

    minSum := i_order.Sum;

    //ограничения
    i_productLimits := i_Flow.CreateParamsCollection();
    i_productLimit := i_Flow.CreateProductLimit();
    i_productLimit.ProductCode := '100100';
    i_productLimit.MaxBonusPayment := 100;
    i_productLimit.MaxDiscount := 100;
    i_productLimits.Add(i_productLimit);

    i_productLimit := i_Flow.CreateProductLimit();
    i_productLimit.ProductCode := '200100';
    //алкоголь не может быть оплачен бонусами
    i_productLimit.MaxBonusPayment := 0;
    //цена не может стать менньше указанной величины
    //можно ли ее не вообще не указывать, что будет?
    i_productLimit.MaxDiscount := 100;
    i_productLimits.Add(i_productLimit);

    //проводим счет
    i_checkinResult := i_Flow.Checkin(userPhone, 1, i_order, i_productLimits);
    // день рождения
    if (i_checkinResult.UserData.GetBirthday = Now) then
      ShowMessage('Happy birthday to you, dear ' + i_checkinResult.UserData.FullName);

    i_checkinResult := i_Flow.Precheque(i_order, i_productLimits);
    //перебираем полученный от iiko скидки на позиции
    for i := 0 to i_checkinResult.LoyaltyResult.Programs.Count - 1 do begin

      i_programResult := i_checkinResult.LoyaltyResult.Programs.Get(i) as ILoyaltyProgramResult;

      for j := 0 to i_programResult.Operations.Count - 1 do begin
        i_operation := i_programResult.Operations.Get(i) as ILoyaltyOperation;
        productCode := i_operation.ProductCode;
        //i_operation.Code надо запомнить в скидке на позицию
        discountCode := i_operation.Code;
        discountSum := i_operation.DiscountSum;
        //флаг - есть ли скидки от айки
        discountsFlag := discountsFlag or (discountSum <> 0);
      end;
    end;

    //флаг - есть ли скидки от айки
    discountsFlag := discountsFlag or (discountSum <> 0);

    //кошельки
    paymentLimits := i_checkinResult.PaymentLimits;
    for i := 0 to paymentLimits.Count - 1 do begin
       i_paymentLimit := paymentLimits.Get(i) as IPaymentLimit;
       //код кошелька
       walletCode := i_paymentLimit.WalletCode;
       //лимиты
       minSum := i_paymentLimit.MinSum;
       maxSum := i_paymentLimit.MaxSum;
       paymentsFlag := paymentsFlag or (maxSum <> 0);
    end;

    //выяснение, есть ли у него средства, и может ли он ими платить
    //тут где-то диалог о том, будет ли он платить бонусами и с какого кошелька или нет
    //если платит бонусами хотя бы часть, то выполняем

    paymentsFlag := paymentsFlag and (MessageBox(0, 'Будете расплачиваться бонусами', '', MB_YESNO) = ID_YES);
    //если есть в счете скидки от iiko или клиент будет платить via  iiko.net, то проводим оплату
    if (discountsFlag or paymentsFlag) then begin
      guid := i_order.Id;
      transactionGuid := i_Flow.NewGuid;
      i_payments := i_Flow.CreateParamsCollection();
      if (paymentsFlag) then begin
        //снимаем средства с указанного клиентом кошелька(кошельков)
        i_walletPayment := i_Flow.CreateWalletPayment();
        i_walletPayment.WalletCode := WalletCode_Bonus;
        i_walletPayment.Sum := 1;
        i_payments.Add(i_walletPayment);
        //снимаем средства с указанного клиентом кошелька(кошельков)
        i_walletPayment := i_Flow.CreateWalletPayment();
        i_walletPayment.WalletCode := WalletCode_PaymentCard;
        i_walletPayment.Sum := 2;
        i_payments.Add(i_walletPayment);
      end;
      i_discounts := i_Flow.CreateParamsCollection();
      if discountsFlag then begin
        //передаем в iiko обратно примененные скидки
        i_appliedDiscount := i_Flow.CreateAppliedDiscount();
        i_appliedDiscount.OperationCode := discountCode;
        i_appliedDiscount.ProductCode := '100100';
        i_appliedDiscount.Sum := 0.5;
        i_discounts.Add(i_appliedDiscount);

        i_appliedDiscount := i_Flow.CreateAppliedDiscount();
        i_appliedDiscount.ProductCode := '100100';
        i_appliedDiscount.Sum := 0.3;
        i_discounts.Add(i_appliedDiscount);
      end;
      //сама операция платежа/снятия средств
      i_Flow.Pay(guid, transactionGuid, i_payments, i_discounts);
    end;

    //тут где-то оплаты недостающих сумм

    //закрываем счет по iiko
    i_order.SetFiscalChequeNumber(223);
    i_order.CashierName := 'Иванова Ивонна';
    i_order.RestarauntSectionName := 'Зал 1';
    i_order.TableNumber := '7';

    i_closeResult := i_Flow.Close(i_order.Id, 100);

    chequeFooter := i_closeResult.ChequeFooter;

    //закрываем свой счет, печатаем дополнительный текст
    ShowMessage(chequeFooter);

    //ShowMessage('Все Ok');
  finally
    i_order := nil;
    i_checkinResult :=  nil;
    i_item := nil;
    i_Flow := nil;
  end;
end;

procedure TForm1.btnComplexClick(Sender: TObject);
var
  i_item :  IOrderItem;
  i_productLimit : IProductLimit;
  i_order : IOrder;
  Index: Integer;
  i_checkinResult : ICheckinResult;
  guid, transactionGuid : TGuid;
  Sum : Currency;
  i_userdata : IUserData;
  walletCode : byte;
  fullName, productCode, chequeFooter : widestring;
  i_productLimits : IParamsCollection;
  i_loyalityResult : ILoyaltyResult;
  operations, paymentLimits  : IResultsCollection;
  i_programResult : ILoyaltyProgramResult;
  i_operation : ILoyaltyOperation;
  i_paymentLimit : IPaymentLimit;
  i_walletPayment : IWalletPayment;
  i_appliedDiscount : IAppliedDiscount;
  hres : HRESULT;
  discountId: WideString;
  i, j, n : integer;
  i_payments, i_discounts : IParamsCollection;
  discountSum, minSum, maxSum : Double;
  i_closeResult : ICloseResult;
  discountsFlag : boolean;
  paymentsFlag : boolean;
  ClientId : String;
begin
  try
    //новый счет,
    i_order := i_Flow.CreateOrder();
    guid := i_Flow.NewGuid;
    i_order.Id := guid;
    i_order.Number := '444';

    //позиции
    for i := 1 to 3 do begin
      i_item := i_Flow.CreateOrderItem();
      i_item.ProductCode := IntToStr(i*100) + '100';
      i_item.ProductName := 'Product' + IntToStr(i);
      i_item.Amount := 1;
      i_item.Sum:= i * 100;
      i_item.SumAfterDiscount := i * 99;
      i_item.Comment := 'Comment' + IntToStr(i);
      i_item.ProductCategory := 'Category'  + IntToStr(i);
      i_order.AddItem(i_item);
    end;
    //общая сумма счета
    i_order.Sum := 6212;
    //общая сумма счета с учетом скидок ресторана
    i_order.SumAfterDiscount := 6106;


   //ограничения
    i_productLimits := i_Flow.CreateParamsCollection();
    i_productLimit := i_Flow.CreateProductLimit();
    i_productLimit.ProductCode := '100100';
    i_productLimit.MaxBonusPayment := 100;
    i_productLimit.MaxDiscount := 100;
    i_productLimits.Add(i_productLimit);

    i_productLimit := i_Flow.CreateProductLimit();
    i_productLimit.ProductCode := '200100';
    //алкоголь не может быть оплачен бонусами
    i_productLimit.MaxBonusPayment := 0;
    //цена не может стать менньше указанной величины
    //можно ли ее не вообще не указывать, что будет?
    i_productLimit.MaxDiscount := 100;
    i_productLimits.Add(i_productLimit);

    //проводим счет
    i_checkinResult := i_Flow.Precheque(i_order, i_productLimits);
    //operations := i_complexFlow.GetPayments(nil);
    ShowMessage('Пречек: ' + i_checkinResult.ChequeFooter);

    //перебираем полученные от iiko скидки на позиции
    if i_checkinResult.LoyaltyResult.Programs <> nil then begin
      for i := 0 to i_checkinResult.LoyaltyResult.Programs.Count - 1 do begin
         i_programResult := i_checkinResult.LoyaltyResult.Programs.Get(i) as ILoyaltyProgramResult;
         for j := 0 to i_programResult.Operations.Count - 1 do begin
           i_operation := i_programResult.Operations.Get(j) as ILoyaltyOperation;
           productCode := i_operation.ProductCode;
           //i_operation.OperationId надо запомнить в скидке на позицию
           discountId := i_operation.Code;
           discountSum := i_operation.DiscountSum;
           //флаг - есть ли скидки от айки
           discountsFlag := discountsFlag or (discountSum <> 0);
         end
      end;
    end;
    //флаг - есть ли скидки от айки
    discountsFlag := discountsFlag or (discountSum <> 0);


    //есть ли оплаты, уже произведенные клиентом
    if i_checkinResult.payments <> nil then begin
      for i := 0 to i_checkinResult.payments.Count - 1 do begin
         i_walletPayment := i_checkinResult.payments.Get(i) as IWalletPayment;
         walletCode := i_walletPayment.WalletCode;
         paymentsFlag := true;
      end;
    end;

    if (discountsFlag or paymentsFlag) then begin
      guid := i_order.Id;
      transactionGuid := i_Flow.NewGuid;
      i_payments := i_Flow.CreateParamsCollection();
      if (paymentsFlag) then begin
        //снимаем средства с указанного клиентом кошелька(кошельков)
        i_walletPayment := i_Flow.CreateWalletPayment();
        i_walletPayment.WalletCode := WalletCode_Bonus;
        i_walletPayment.Sum := 100;
        i_payments.Add(i_walletPayment);
        //снимаем средства с указанного клиентом кошелька(кошельков)
        i_walletPayment := i_Flow.CreateWalletPayment();
        i_walletPayment.WalletCode := WalletCode_PaymentCard;
        i_walletPayment.Sum := 200;
        i_payments.Add(i_walletPayment);
      end;
      i_discounts := i_Flow.CreateParamsCollection();
      if discountsFlag then begin
        //передаем в iiko обратно примененные скидки
        i_appliedDiscount := i_Flow.CreateAppliedDiscount();
        i_appliedDiscount.OperationCode := 'Discount 1';
        i_appliedDiscount.ProductCode := '100100';
        i_appliedDiscount.Sum := 0.5;
        i_discounts.Add(i_appliedDiscount);

        i_appliedDiscount := i_Flow.CreateAppliedDiscount();
        i_appliedDiscount.OperationCode := 'Discount 2';
        i_appliedDiscount.ProductCode := '100100';
        i_appliedDiscount.Sum := 0.3;
        i_discounts.Add(i_appliedDiscount);
      end;
      //сама операция платежа/снятия средств
      i_Flow.Pay(guid, transactionGuid, i_payments, i_discounts);
    end;

    //тут где-то оплаты недостающих сумм

    //закрываем счет по iiko
    i_order.SetFiscalChequeNumber(223);
    i_order.CashierName := 'Иванова Ивонна';
    i_order.RestarauntSectionName := 'Зал 1';
    i_order.TableNumber := '7';

    i_closeResult := i_Flow.Close(i_order.Id, 100);
    //закрываем свой счет, печатаем дополнительный текст
    ShowMessage('Чек: ' + i_closeResult.ChequeFooter);
  finally
    i_checkinResult :=  nil;
    i_order := nil;
  end;

end;

initialization
   ActiveX.CoInitialize(nil);
finalization
   ActiveX.CoUninitialize;
end.
