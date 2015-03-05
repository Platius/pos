unit Unit1;

interface

uses
  Windows, ComObj, ActiveX, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, iikoNet_Service_Api_Front_v2_Client_TLB, DateUtils;

type
  TForm1 = class(TForm)
    btnComplex: TButton;
    btnBasic: TButton;
    procedure btnBasicClick(Sender: TObject);
    procedure btnComplexClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    i_complexFlow : IComplexWorkflow;
    i_basicFlow : IBasicWorkflow;
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
  i_complexFlow := CoComplexWorkflowImpl.Create();
  i_basicFlow := i_complexFlow as IBasicWorkflow;

  //�������������
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
  i_basicFlow.Initialize(i_startupParams);
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
    //������������� �������
    userPhone := '+79169059546';

    //����� ����
    i_order := i_basicFlow.CreateOrder();
    guid := i_basicFlow.NewGuid;
    i_order.Id := guid;
    i_order.Number := '444';

    //�������
    for i := 1 to 3 do begin
      i_item := i_basicFlow.CreateOrderItem();
      i_item.ProductCode := IntToStr(i*100) + '100';
      i_item.ProductName := 'Product' + IntToStr(i);
      i_item.Amount := 1;
      i_item.Sum:= i * 100;
      i_item.SumAfterDiscount := i * 99;
      i_item.Comment := 'Comment' + IntToStr(i);
      i_item.ProductCategory := 'Category'  + IntToStr(i);
      i_order.AddItem(i_item);
    end;
    //����� ����� �����
    i_order.Sum := 6212;
    //����� ����� ����� � ������ ������ ���������
    i_order.SumAfterDiscount := 6106;

    minSum := i_order.Sum;

    //�����������
    i_productLimits := i_basicFlow.CreateParamsCollection();
    i_productLimit := i_basicFlow.CreateProductLimit();
    i_productLimit.ProductCode := '100100';
    //i_productLimit.CanBePaidByBonuses := false;
    i_productLimit.MinPrice := 500;
    i_productLimits.Add(i_productLimit);

    i_productLimit := i_basicFlow.CreateProductLimit();
    i_productLimit.ProductCode := '200100';
    //�������� �� ����� ���� ������� ��������
    i_productLimit.CanBePaidByBonuses := false;
    //���� �� ����� ����� ������� ��������� ��������
    //����� �� �� �� ������ �� ���������, ��� �����?
    i_productLimit.MinPrice := 500;
    i_productLimits.Add(i_productLimit);

    //�������� ����
    i_checkinResult := i_basicFlow.Checkin(userPhone, 1, i_order, i_productLimits);
    // ���� ��������
    if (i_checkinResult.UserData.GetBirthday = Now) then
      ShowMessage('Happy birthday to you, dear ' + i_checkinResult.UserData.FullName);

    //���������� ���������� �� iiko ������ �� �������
    for i := 0 to i_checkinResult.LoyaltyResult.Programs.Count - 1 do begin

      i_programResult := i_checkinResult.LoyaltyResult.Programs.Get(i) as ILoyaltyProgramResult;

      for j := 0 to i_programResult.Operations.Count - 1 do begin
        i_operation := i_programResult.Operations.Get(i) as ILoyaltyOperation;
        productCode := i_operation.ProductCode;
        //i_operation.Code ���� ��������� � ������ �� �������
        discountCode := i_operation.Code;
        discountSum := i_operation.DiscountSum;
        //���� - ���� �� ������ �� ����
        discountsFlag := discountsFlag or (discountSum <> 0);
      end;
    end;

    //���� - ���� �� ������ �� ����
    discountsFlag := discountsFlag or (discountSum <> 0);

    //��������
    paymentLimits := i_checkinResult.PaymentLimits;
    for i := 0 to paymentLimits.Count - 1 do begin
       i_paymentLimit := paymentLimits.Get(i) as IPaymentLimit;
       //��� ��������
       walletCode := i_paymentLimit.WalletCode;
       //������
       minSum := i_paymentLimit.MinSum;
       maxSum := i_paymentLimit.MaxSum;
       paymentsFlag := paymentsFlag or (maxSum <> 0);
    end;

    //���������, ���� �� � ���� ��������, � ����� �� �� ��� �������
    //��� ���-�� ������ � ���, ����� �� �� ������� �������� � � ������ �������� ��� ���
    //���� ������ �������� ���� �� �����, �� ���������

    paymentsFlag := paymentsFlag and (MessageBox(0, '������ �������������� ��������', '', MB_YESNO) = ID_YES);
    //���� ���� � ����� ������ �� iiko ��� ������ ����� ������� via  iiko.net, �� �������� ������
    if (discountsFlag or paymentsFlag) then begin
      guid := i_order.Id;
      transactionGuid := i_basicFlow.NewGuid;
      i_payments := i_basicFlow.CreateParamsCollection();
      if (paymentsFlag) then begin
        //������� �������� � ���������� �������� ��������(���������)
        i_walletPayment := i_basicFlow.CreateWalletPayment();
        i_walletPayment.WalletCode := WalletCode_Bonus;
        i_walletPayment.Sum := 1;
        i_payments.Add(i_walletPayment);
        //������� �������� � ���������� �������� ��������(���������)
        i_walletPayment := i_basicFlow.CreateWalletPayment();
        i_walletPayment.WalletCode := WalletCode_PaymentCard;
        i_walletPayment.Sum := 2;
        i_payments.Add(i_walletPayment);
      end;
      i_discounts := i_basicFlow.CreateParamsCollection();
      if discountsFlag then begin
        //�������� � iiko ������� ����������� ������
        i_appliedDiscount := i_basicFlow.CreateAppliedDiscount();
        i_appliedDiscount.OperationCode := discountCode;
        i_appliedDiscount.ProductCode := '100100';
        i_appliedDiscount.Sum := 0.5;
        i_discounts.Add(i_appliedDiscount);

        i_appliedDiscount := i_basicFlow.CreateAppliedDiscount();
        i_appliedDiscount.DiscountName := 'Discount 2';
        i_appliedDiscount.ProductCode := '100100';
        i_appliedDiscount.Sum := 0.3;
        i_discounts.Add(i_appliedDiscount);
      end;
      //���� �������� �������/������ �������
      i_basicFlow.Pay(guid, transactionGuid, i_payments, i_discounts);
    end;

    //��� ���-�� ������ ����������� ����

    //��������� ���� �� iiko
    i_order.SetFiscalChequeNumber(223);
    i_order.CashierName := '������� ������';
    i_order.SetPrechequeTime(Now - OneHour);
    i_order.SetCloseTime(Now);
    i_order.RestarauntSectionName := '��� 1';
    i_order.TableNumber := '7';

    i_closeResult := i_basicFlow.Close(i_order, 100);

    chequeFooter := i_closeResult.ChequeFooter;

    //��������� ���� ����, �������� �������������� �����
    ShowMessage(chequeFooter);

    //ShowMessage('��� Ok');
  finally
    i_order := nil;
    i_checkinResult :=  nil;
    i_item := nil;
    i_basicFlow := nil;
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
  i_operation : ILoyaltyOperation;
  i_paymentLimit : IPaymentLimit;
  i_walletPayment : IWalletPayment;
  i_appliedDiscount : IAppliedDiscount;
  hres : HRESULT;
  discountId: TGUID;
  i, n : integer;
  i_payments, i_discounts : IParamsCollection;
  discountSum, minSum, maxSum : Double;
  i_closeResult : ICloseResult;
  discountsFlag : boolean;
  paymentsFlag : boolean;
  ClientId : String;
begin
  try
    //����� ����,
    i_order := i_basicFlow.CreateOrder();
    guid := i_basicFlow.NewGuid;
    i_order.Id := guid;
    i_order.Number := '444';

    //�������
    for i := 1 to 3 do begin
      i_item := i_basicFlow.CreateOrderItem();
      i_item.ProductCode := IntToStr(i*100) + '100';
      i_item.ProductName := 'Product' + IntToStr(i);
      i_item.Amount := 1;
      i_item.Sum:= i * 100;
      i_item.SumAfterDiscount := i * 99;
      i_item.Comment := 'Comment' + IntToStr(i);
      i_item.ProductCategory := 'Category'  + IntToStr(i);
      i_order.AddItem(i_item);
    end;
    //����� ����� �����
    i_order.Sum := 6212;
    //����� ����� ����� � ������ ������ ���������
    i_order.SumAfterDiscount := 6106;


   //�����������
    i_productLimits := i_basicFlow.CreateParamsCollection();
    i_productLimit := i_basicFlow.CreateProductLimit();
    i_productLimit.ProductCode := '100100';
    //i_productLimit.CanBePaidByBonuses := false;
    i_productLimit.MinPrice := 500;
    i_productLimits.Add(i_productLimit);

    i_productLimit := i_basicFlow.CreateProductLimit();
    i_productLimit.ProductCode := '200100';
    //�������� �� ����� ���� ������� ��������
    i_productLimit.CanBePaidByBonuses := false;
    //���� �� ����� ����� ������� ��������� ��������
    //����� �� �� �� ������ �� ���������, ��� �����?
    i_productLimit.MinPrice := 500;
    i_productLimits.Add(i_productLimit);

    //�������� ����
    i_checkinResult := i_complexFlow.UpdateOrder(i_order, i_productLimits);
    //operations := i_complexFlow.GetPayments(nil);
    ShowMessage('������: ' + i_checkinResult.ChequeFooter);

    //���������� ���������� �� iiko ������ �� �������
    if i_checkinResult.LoyaltyResult.Operations <> nil then begin
      for i := 0 to i_checkinResult.LoyaltyResult.Operations.Count - 1 do begin
         i_operation := i_checkinResult.LoyaltyResult.Operations.Get(i) as ILoyaltyOperation;
         productCode := i_operation.ProductCode;
         //i_operation.OperationId ���� ��������� � ������ �� �������
         discountId := i_operation.OperationId;
         discountSum := i_operation.DiscountSum;
         //���� - ���� �� ������ �� ����
         discountsFlag := discountsFlag or (discountSum <> 0);
      end;
    end;
    //������ �� ����, ���� ��������� i_loyalityResult.OperationId � ������ �� ����
    discountId := i_checkinResult.LoyaltyResult.OperationId;
    discountSum := i_checkinResult.LoyaltyResult.TotalDiscount;
    //���� - ���� �� ������ �� ����
    discountsFlag := discountsFlag or (discountSum <> 0);


    //���� �� ������, ��� ������������� ��������
    if i_checkinResult.payments <> nil then begin
      for i := 0 to i_checkinResult.payments.Count - 1 do begin
         i_walletPayment := i_checkinResult.payments.Get(i) as IWalletPayment;
         walletCode := i_walletPayment.WalletCode;
         paymentsFlag := true;
      end;
    end;

    if (discountsFlag or paymentsFlag) then begin
      guid := i_order.Id;
      transactionGuid := i_basicFlow.NewGuid;
      i_payments := i_basicFlow.CreateParamsCollection();
      if (paymentsFlag) then begin
        //������� �������� � ���������� �������� ��������(���������)
        i_walletPayment := i_basicFlow.CreateWalletPayment();
        i_walletPayment.WalletCode := WalletCode_Bonus;
        i_walletPayment.Sum := 100;
        i_payments.Add(i_walletPayment);
        //������� �������� � ���������� �������� ��������(���������)
        i_walletPayment := i_basicFlow.CreateWalletPayment();
        i_walletPayment.WalletCode := WalletCode_PaymentCard;
        i_walletPayment.Sum := 200;
        i_payments.Add(i_walletPayment);
      end;
      i_discounts := i_basicFlow.CreateParamsCollection();
      if discountsFlag then begin
        //�������� � iiko ������� ����������� ������
        i_appliedDiscount := i_basicFlow.CreateAppliedDiscount();
        i_appliedDiscount.DiscountName := 'Discount 1';
        i_appliedDiscount.ProductCode := '100100';
        i_appliedDiscount.Sum := 0.5;
        i_discounts.Add(i_appliedDiscount);

        i_appliedDiscount := i_basicFlow.CreateAppliedDiscount();
        i_appliedDiscount.DiscountName := 'Discount 2';
        i_appliedDiscount.ProductCode := '100100';
        i_appliedDiscount.Sum := 0.3;
        i_discounts.Add(i_appliedDiscount);
      end;
      //���� �������� �������/������ �������
      i_basicFlow.Pay(guid, transactionGuid, i_payments, i_discounts);
    end;

    //��� ���-�� ������ ����������� ����

    //��������� ���� �� iiko
    i_order.SetFiscalChequeNumber(223);
    i_order.CashierName := '������� ������';
    i_order.SetPrechequeTime(Now - OneHour);
    i_order.SetCloseTime(Now);
    i_order.RestarauntSectionName := '��� 1';
    i_order.TableNumber := '7';

    i_closeResult := i_basicFlow.Close(i_order, 100);
    //��������� ���� ����, �������� �������������� �����
    ShowMessage('���: ' + i_closeResult.ChequeFooter);
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
