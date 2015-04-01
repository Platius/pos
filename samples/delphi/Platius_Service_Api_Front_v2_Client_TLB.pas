unit Platius_Service_Api_Front_v2_Client_TLB;

// ************************************************************************ //
// WARNING                                                                    
// -------                                                                    
// The types declared in this file were generated from data read from a       
// Type Library. If this type library is explicitly or indirectly (via        
// another type library referring to this type library) re-imported, or the   
// 'Refresh' command of the Type Library Editor activated while editing the   
// Type Library, the contents of this file will be regenerated and all        
// manual modifications will be lost.                                         
// ************************************************************************ //

// PASTLWTR : 1.2
// File generated on 01.04.2015 23:08:06 from Type Library described below.

// ************************************************************************  //
// Type Lib: F:\pos-api-sdk\bin\Client\Platius.Service.Api.Front.v2.Client.tlb (1)
// LIBID: {730D7675-109C-45AF-987C-64F46561454C}
// LCID: 0
// Helpfile: 
// HelpString: 
// DepndLst: 
//   (1) v2.0 stdole, (C:\Windows\SysWOW64\stdole2.tlb)
//   (2) v2.4 mscorlib, (C:\Windows\Microsoft.NET\Framework\v4.0.30319\mscorlib.tlb)
// ************************************************************************ //
{$TYPEDADDRESS OFF} // Unit must be compiled without type-checked pointers. 
{$WARN SYMBOL_PLATFORM OFF}
{$WRITEABLECONST ON}
{$VARPROPSETTER ON}
interface

uses Windows, ActiveX, Classes, Graphics, OleServer, StdVCL, Variants;
  


// *********************************************************************//
// GUIDS declared in the TypeLibrary. Following prefixes are used:        
//   Type Libraries     : LIBID_xxxx                                      
//   CoClasses          : CLASS_xxxx                                      
//   DISPInterfaces     : DIID_xxxx                                       
//   Non-DISP interfaces: IID_xxxx                                        
// *********************************************************************//
const
  // TypeLibrary Major and minor versions
  Platius_Service_Api_Front_v2_ClientMajorVersion = 1;
  Platius_Service_Api_Front_v2_ClientMinorVersion = 0;

  LIBID_Platius_Service_Api_Front_v2_Client: TGUID = '{730D7675-109C-45AF-987C-64F46561454C}';

  IID_IWorkflow: TGUID = '{A62D03C7-F896-4298-9640-290DFE622C58}';
  CLASS_WorkflowDummyImpl: TGUID = '{7D4E0DFB-DB89-4D72-9D70-48F78DE447C2}';
  CLASS_WorkflowImpl: TGUID = '{A3D59A39-03FE-436A-88EC-EAD2ECF407D8}';
  IID_IAppliedDiscount: TGUID = '{0C703C88-DDA1-4531-9FE8-13341FCCD4D7}';
  IID_ICancelledOrderItem: TGUID = '{D5354BB7-8872-4B6A-81A2-EB589C59B304}';
  IID_ILoyaltyOperation: TGUID = '{18D27725-489C-4AD3-866C-1BAAF7DD09EC}';
  IID_ILoyaltyProgramResult: TGUID = '{FC21E48A-DF02-4912-A6FC-E70D63A009E8}';
  IID_ILoyaltyResult: TGUID = '{0E51AC50-CB03-4172-9E54-50C791F115DC}';
  IID_IOrder: TGUID = '{BF0CFEFD-A8E3-4276-9252-DE9065EC124E}';
  IID_IOrderItem: TGUID = '{EC83A828-1316-4605-A67C-60DEFE4D3D13}';
  IID_IOrderPayments: TGUID = '{996A75C2-87A3-4D20-B89C-9DD7F1F7E61D}';
  IID_IParamsCollection: TGUID = '{05B11C1E-23D4-4BCC-9388-98B690947AAB}';
  IID_IPaymentLimit: TGUID = '{C9ACB0C5-2398-4C1D-B737-155E6E075650}';
  IID_IProductLimit: TGUID = '{0FDBC7F1-C390-41D1-8C3B-8FC7CBBC5083}';
  IID_IResultsCollection: TGUID = '{4F822F90-6DD4-415E-83E5-7A20747C6E17}';
  IID_IUserData: TGUID = '{9F322DCB-F4C1-45D3-A300-4855EDE6C5DC}';
  IID_IWalletPayment: TGUID = '{D2DC8B0E-2501-41F9-8061-9CEFBAC1E6D4}';
  IID_IWalletRefund: TGUID = '{DFCE4062-7498-4802-B1E7-A9131997BE17}';
  IID_IStartupParams: TGUID = '{2B3E93AD-CFB7-4AEA-81E0-D6D2D360FBE0}';
  IID_ICheckinResult: TGUID = '{73F1A661-AB59-4B55-A8FE-F417BE2C701C}';
  IID_ICloseResult: TGUID = '{8B3B11AD-B2F7-428D-9B37-8EC581F6CE78}';
  IID_IRefundResult: TGUID = '{E10DBDB6-473D-4DC9-921E-F45FCC3CF403}';
  IID__LogConfigurer: TGUID = '{8996E85A-3F93-30E1-914D-F35855F58D9E}';
  CLASS_StartupParams: TGUID = '{DEFC0114-8AB8-46C3-8E94-03444BF60736}';
  CLASS_LogConfigurer: TGUID = '{48C70BA1-9C74-35D9-8571-22911C73BA12}';

// *********************************************************************//
// Declaration of Enumerations defined in Type Library                    
// *********************************************************************//
// Constants for enum WalletCode
type
  WalletCode = TOleEnum;
const
  WalletCode_Bonus = $00000000;
  WalletCode_PaymentCard = $00000001;

type

// *********************************************************************//
// Forward declaration of types defined in TypeLibrary                    
// *********************************************************************//
  IWorkflow = interface;
  IWorkflowDisp = dispinterface;
  IAppliedDiscount = interface;
  IAppliedDiscountDisp = dispinterface;
  ICancelledOrderItem = interface;
  ICancelledOrderItemDisp = dispinterface;
  ILoyaltyOperation = interface;
  ILoyaltyOperationDisp = dispinterface;
  ILoyaltyProgramResult = interface;
  ILoyaltyProgramResultDisp = dispinterface;
  ILoyaltyResult = interface;
  ILoyaltyResultDisp = dispinterface;
  IOrder = interface;
  IOrderDisp = dispinterface;
  IOrderItem = interface;
  IOrderItemDisp = dispinterface;
  IOrderPayments = interface;
  IOrderPaymentsDisp = dispinterface;
  IParamsCollection = interface;
  IParamsCollectionDisp = dispinterface;
  IPaymentLimit = interface;
  IPaymentLimitDisp = dispinterface;
  IProductLimit = interface;
  IProductLimitDisp = dispinterface;
  IResultsCollection = interface;
  IResultsCollectionDisp = dispinterface;
  IUserData = interface;
  IUserDataDisp = dispinterface;
  IWalletPayment = interface;
  IWalletPaymentDisp = dispinterface;
  IWalletRefund = interface;
  IWalletRefundDisp = dispinterface;
  IStartupParams = interface;
  IStartupParamsDisp = dispinterface;
  ICheckinResult = interface;
  ICheckinResultDisp = dispinterface;
  ICloseResult = interface;
  ICloseResultDisp = dispinterface;
  IRefundResult = interface;
  IRefundResultDisp = dispinterface;
  _LogConfigurer = interface;
  _LogConfigurerDisp = dispinterface;

// *********************************************************************//
// Declaration of CoClasses defined in Type Library                       
// (NOTE: Here we map each CoClass to its Default Interface)              
// *********************************************************************//
  WorkflowDummyImpl = IWorkflow;
  WorkflowImpl = IWorkflow;
  StartupParams = IStartupParams;
  LogConfigurer = _LogConfigurer;


// *********************************************************************//
// Interface: IWorkflow
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {A62D03C7-F896-4298-9640-290DFE622C58}
// *********************************************************************//
  IWorkflow = interface(IDispatch)
    ['{A62D03C7-F896-4298-9640-290DFE622C58}']
    function Get_NewGuid: TGUID; safecall;
    function CreateParamsCollection: IParamsCollection; safecall;
    function CreateOrder: IOrder; safecall;
    function CreateOrderItem: IOrderItem; safecall;
    function CreateProductLimit: IProductLimit; safecall;
    function CreateWalletPayment: IWalletPayment; safecall;
    function CreateAppliedDiscount: IAppliedDiscount; safecall;
    function CreateWalletRefund: IWalletRefund; safecall;
    function CreateCancelledOrderItem: ICancelledOrderItem; safecall;
    procedure Initialize(const StartupParams: IStartupParams); safecall;
    function Checkin(const credential: WideString; searchScope: Integer; const order: IOrder; 
                     const limits: IParamsCollection): ICheckinResult; safecall;
    procedure Pay(orderId: TGUID; transactionId: TGUID; const payments: IParamsCollection; 
                  const discounts: IParamsCollection); safecall;
    procedure CancelPay(orderId: TGUID; transactionId: TGUID); safecall;
    function Refund(orderId: TGUID; transactionId: TGUID; const refunds: IParamsCollection; 
                    const cancelledItems: IParamsCollection): IRefundResult; safecall;
    function Close(const order: IOrder; sumForBonus: Double): ICloseResult; safecall;
    procedure Abort(orderId: TGUID); safecall;
    procedure Reset(orderId: TGUID); safecall;
    function UpdateOrder(const order: IOrder; const limits: IParamsCollection): ICheckinResult; safecall;
    function GetPayments(const orderIds: IParamsCollection): IResultsCollection; safecall;
    property NewGuid: TGUID read Get_NewGuid;
  end;

// *********************************************************************//
// DispIntf:  IWorkflowDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {A62D03C7-F896-4298-9640-290DFE622C58}
// *********************************************************************//
  IWorkflowDisp = dispinterface
    ['{A62D03C7-F896-4298-9640-290DFE622C58}']
    property NewGuid: {??TGUID}OleVariant readonly dispid 0;
    function CreateParamsCollection: IParamsCollection; dispid 1;
    function CreateOrder: IOrder; dispid 2;
    function CreateOrderItem: IOrderItem; dispid 3;
    function CreateProductLimit: IProductLimit; dispid 4;
    function CreateWalletPayment: IWalletPayment; dispid 5;
    function CreateAppliedDiscount: IAppliedDiscount; dispid 6;
    function CreateWalletRefund: IWalletRefund; dispid 7;
    function CreateCancelledOrderItem: ICancelledOrderItem; dispid 8;
    procedure Initialize(const StartupParams: IStartupParams); dispid 100;
    function Checkin(const credential: WideString; searchScope: Integer; const order: IOrder; 
                     const limits: IParamsCollection): ICheckinResult; dispid 101;
    procedure Pay(orderId: {??TGUID}OleVariant; transactionId: {??TGUID}OleVariant; 
                  const payments: IParamsCollection; const discounts: IParamsCollection); dispid 102;
    procedure CancelPay(orderId: {??TGUID}OleVariant; transactionId: {??TGUID}OleVariant); dispid 103;
    function Refund(orderId: {??TGUID}OleVariant; transactionId: {??TGUID}OleVariant; 
                    const refunds: IParamsCollection; const cancelledItems: IParamsCollection): IRefundResult; dispid 104;
    function Close(const order: IOrder; sumForBonus: Double): ICloseResult; dispid 105;
    procedure Abort(orderId: {??TGUID}OleVariant); dispid 106;
    procedure Reset(orderId: {??TGUID}OleVariant); dispid 107;
    function UpdateOrder(const order: IOrder; const limits: IParamsCollection): ICheckinResult; dispid 200;
    function GetPayments(const orderIds: IParamsCollection): IResultsCollection; dispid 201;
  end;

// *********************************************************************//
// Interface: IAppliedDiscount
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {0C703C88-DDA1-4531-9FE8-13341FCCD4D7}
// *********************************************************************//
  IAppliedDiscount = interface(IDispatch)
    ['{0C703C88-DDA1-4531-9FE8-13341FCCD4D7}']
    function Get_ProgramId: TGUID; safecall;
    procedure Set_ProgramId(pRetVal: TGUID); safecall;
    function Get_OperationCode: WideString; safecall;
    procedure Set_OperationCode(const pRetVal: WideString); safecall;
    function Get_ProductCode: WideString; safecall;
    procedure Set_ProductCode(const pRetVal: WideString); safecall;
    function Get_ProductName: WideString; safecall;
    procedure Set_ProductName(const pRetVal: WideString); safecall;
    function Get_Sum: Double; safecall;
    procedure Set_Sum(pRetVal: Double); safecall;
    function Get_Comment: WideString; safecall;
    procedure Set_Comment(const pRetVal: WideString); safecall;
    property ProgramId: TGUID read Get_ProgramId write Set_ProgramId;
    property OperationCode: WideString read Get_OperationCode write Set_OperationCode;
    property ProductCode: WideString read Get_ProductCode write Set_ProductCode;
    property ProductName: WideString read Get_ProductName write Set_ProductName;
    property Sum: Double read Get_Sum write Set_Sum;
    property Comment: WideString read Get_Comment write Set_Comment;
  end;

// *********************************************************************//
// DispIntf:  IAppliedDiscountDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {0C703C88-DDA1-4531-9FE8-13341FCCD4D7}
// *********************************************************************//
  IAppliedDiscountDisp = dispinterface
    ['{0C703C88-DDA1-4531-9FE8-13341FCCD4D7}']
    property ProgramId: {??TGUID}OleVariant dispid 0;
    property OperationCode: WideString dispid 1;
    property ProductCode: WideString dispid 2;
    property ProductName: WideString dispid 3;
    property Sum: Double dispid 4;
    property Comment: WideString dispid 5;
  end;

// *********************************************************************//
// Interface: ICancelledOrderItem
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {D5354BB7-8872-4B6A-81A2-EB589C59B304}
// *********************************************************************//
  ICancelledOrderItem = interface(IDispatch)
    ['{D5354BB7-8872-4B6A-81A2-EB589C59B304}']
    function Get_ProductCode: WideString; safecall;
    procedure Set_ProductCode(const pRetVal: WideString); safecall;
    function Get_Amount: Double; safecall;
    procedure Set_Amount(pRetVal: Double); safecall;
    property ProductCode: WideString read Get_ProductCode write Set_ProductCode;
    property Amount: Double read Get_Amount write Set_Amount;
  end;

// *********************************************************************//
// DispIntf:  ICancelledOrderItemDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {D5354BB7-8872-4B6A-81A2-EB589C59B304}
// *********************************************************************//
  ICancelledOrderItemDisp = dispinterface
    ['{D5354BB7-8872-4B6A-81A2-EB589C59B304}']
    property ProductCode: WideString dispid 0;
    property Amount: Double dispid 1;
  end;

// *********************************************************************//
// Interface: ILoyaltyOperation
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {18D27725-489C-4AD3-866C-1BAAF7DD09EC}
// *********************************************************************//
  ILoyaltyOperation = interface(IDispatch)
    ['{18D27725-489C-4AD3-866C-1BAAF7DD09EC}']
    function Get_Code: WideString; safecall;
    procedure Set_Code(const pRetVal: WideString); safecall;
    function Get_ProductCode: WideString; safecall;
    procedure Set_ProductCode(const pRetVal: WideString); safecall;
    function Get_ProductName: WideString; safecall;
    procedure Set_ProductName(const pRetVal: WideString); safecall;
    function Get_DiscountSum: Double; safecall;
    procedure Set_DiscountSum(pRetVal: Double); safecall;
    function Get_Comment: WideString; safecall;
    procedure Set_Comment(const pRetVal: WideString); safecall;
    property Code: WideString read Get_Code write Set_Code;
    property ProductCode: WideString read Get_ProductCode write Set_ProductCode;
    property ProductName: WideString read Get_ProductName write Set_ProductName;
    property DiscountSum: Double read Get_DiscountSum write Set_DiscountSum;
    property Comment: WideString read Get_Comment write Set_Comment;
  end;

// *********************************************************************//
// DispIntf:  ILoyaltyOperationDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {18D27725-489C-4AD3-866C-1BAAF7DD09EC}
// *********************************************************************//
  ILoyaltyOperationDisp = dispinterface
    ['{18D27725-489C-4AD3-866C-1BAAF7DD09EC}']
    property Code: WideString dispid 0;
    property ProductCode: WideString dispid 1;
    property ProductName: WideString dispid 2;
    property DiscountSum: Double dispid 3;
    property Comment: WideString dispid 4;
  end;

// *********************************************************************//
// Interface: ILoyaltyProgramResult
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {FC21E48A-DF02-4912-A6FC-E70D63A009E8}
// *********************************************************************//
  ILoyaltyProgramResult = interface(IDispatch)
    ['{FC21E48A-DF02-4912-A6FC-E70D63A009E8}']
    function Get_ProgramId: TGUID; safecall;
    procedure Set_ProgramId(pRetVal: TGUID); safecall;
    function Get_Name: WideString; safecall;
    procedure Set_Name(const pRetVal: WideString); safecall;
    function Get_Operations: IResultsCollection; safecall;
    property ProgramId: TGUID read Get_ProgramId write Set_ProgramId;
    property Name: WideString read Get_Name write Set_Name;
    property Operations: IResultsCollection read Get_Operations;
  end;

// *********************************************************************//
// DispIntf:  ILoyaltyProgramResultDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {FC21E48A-DF02-4912-A6FC-E70D63A009E8}
// *********************************************************************//
  ILoyaltyProgramResultDisp = dispinterface
    ['{FC21E48A-DF02-4912-A6FC-E70D63A009E8}']
    property ProgramId: {??TGUID}OleVariant dispid 0;
    property Name: WideString dispid 1;
    property Operations: IResultsCollection readonly dispid 2;
  end;

// *********************************************************************//
// Interface: ILoyaltyResult
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {0E51AC50-CB03-4172-9E54-50C791F115DC}
// *********************************************************************//
  ILoyaltyResult = interface(IDispatch)
    ['{0E51AC50-CB03-4172-9E54-50C791F115DC}']
    function Get_TotalBonus: Double; safecall;
    function Get_Programs: IResultsCollection; safecall;
    property TotalBonus: Double read Get_TotalBonus;
    property Programs: IResultsCollection read Get_Programs;
  end;

// *********************************************************************//
// DispIntf:  ILoyaltyResultDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {0E51AC50-CB03-4172-9E54-50C791F115DC}
// *********************************************************************//
  ILoyaltyResultDisp = dispinterface
    ['{0E51AC50-CB03-4172-9E54-50C791F115DC}']
    property TotalBonus: Double readonly dispid 0;
    property Programs: IResultsCollection readonly dispid 1;
  end;

// *********************************************************************//
// Interface: IOrder
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {BF0CFEFD-A8E3-4276-9252-DE9065EC124E}
// *********************************************************************//
  IOrder = interface(IDispatch)
    ['{BF0CFEFD-A8E3-4276-9252-DE9065EC124E}']
    function Get_Id: TGUID; safecall;
    procedure Set_Id(pRetVal: TGUID); safecall;
    function Get_SumAfterDiscount: Double; safecall;
    procedure Set_SumAfterDiscount(pRetVal: Double); safecall;
    function Get_Sum: Double; safecall;
    procedure Set_Sum(pRetVal: Double); safecall;
    function Get_RestarauntSectionName: WideString; safecall;
    procedure Set_RestarauntSectionName(const pRetVal: WideString); safecall;
    function Get_TableNumber: WideString; safecall;
    procedure Set_TableNumber(const pRetVal: WideString); safecall;
    function Get_Number: WideString; safecall;
    procedure Set_Number(const pRetVal: WideString); safecall;
    function Get_GuestsCount: Integer; safecall;
    procedure Set_GuestsCount(pRetVal: Integer); safecall;
    function Get_WaiterName: WideString; safecall;
    procedure Set_WaiterName(const pRetVal: WideString); safecall;
    function Get_CashierName: WideString; safecall;
    procedure Set_CashierName(const pRetVal: WideString); safecall;
    procedure SetOpenTime(openTime: TDateTime); safecall;
    procedure SetPrechequeTime(prechequeTime: TDateTime); safecall;
    procedure SetCloseTime(closeTime: TDateTime); safecall;
    procedure AddItem(const item: IOrderItem); safecall;
    procedure SetFiscalChequeNumber(fiscalChequeNumber: Integer); safecall;
    property Id: TGUID read Get_Id write Set_Id;
    property SumAfterDiscount: Double read Get_SumAfterDiscount write Set_SumAfterDiscount;
    property Sum: Double read Get_Sum write Set_Sum;
    property RestarauntSectionName: WideString read Get_RestarauntSectionName write Set_RestarauntSectionName;
    property TableNumber: WideString read Get_TableNumber write Set_TableNumber;
    property Number: WideString read Get_Number write Set_Number;
    property GuestsCount: Integer read Get_GuestsCount write Set_GuestsCount;
    property WaiterName: WideString read Get_WaiterName write Set_WaiterName;
    property CashierName: WideString read Get_CashierName write Set_CashierName;
  end;

// *********************************************************************//
// DispIntf:  IOrderDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {BF0CFEFD-A8E3-4276-9252-DE9065EC124E}
// *********************************************************************//
  IOrderDisp = dispinterface
    ['{BF0CFEFD-A8E3-4276-9252-DE9065EC124E}']
    property Id: {??TGUID}OleVariant dispid 0;
    property SumAfterDiscount: Double dispid 1;
    property Sum: Double dispid 2;
    property RestarauntSectionName: WideString dispid 3;
    property TableNumber: WideString dispid 4;
    property Number: WideString dispid 5;
    property GuestsCount: Integer dispid 6;
    property WaiterName: WideString dispid 7;
    property CashierName: WideString dispid 8;
    procedure SetOpenTime(openTime: TDateTime); dispid 9;
    procedure SetPrechequeTime(prechequeTime: TDateTime); dispid 10;
    procedure SetCloseTime(closeTime: TDateTime); dispid 11;
    procedure AddItem(const item: IOrderItem); dispid 12;
    procedure SetFiscalChequeNumber(fiscalChequeNumber: Integer); dispid 13;
  end;

// *********************************************************************//
// Interface: IOrderItem
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {EC83A828-1316-4605-A67C-60DEFE4D3D13}
// *********************************************************************//
  IOrderItem = interface(IDispatch)
    ['{EC83A828-1316-4605-A67C-60DEFE4D3D13}']
    function Get_ProductCode: WideString; safecall;
    procedure Set_ProductCode(const pRetVal: WideString); safecall;
    function Get_ProductName: WideString; safecall;
    procedure Set_ProductName(const pRetVal: WideString); safecall;
    function Get_Amount: Double; safecall;
    procedure Set_Amount(pRetVal: Double); safecall;
    function Get_Sum: Double; safecall;
    procedure Set_Sum(pRetVal: Double); safecall;
    function Get_SumAfterDiscount: Double; safecall;
    procedure Set_SumAfterDiscount(pRetVal: Double); safecall;
    function Get_Comment: WideString; safecall;
    procedure Set_Comment(const pRetVal: WideString); safecall;
    function Get_ProductCategory: WideString; safecall;
    procedure Set_ProductCategory(const pRetVal: WideString); safecall;
    procedure SetPrintTime(printTime: TDateTime); safecall;
    property ProductCode: WideString read Get_ProductCode write Set_ProductCode;
    property ProductName: WideString read Get_ProductName write Set_ProductName;
    property Amount: Double read Get_Amount write Set_Amount;
    property Sum: Double read Get_Sum write Set_Sum;
    property SumAfterDiscount: Double read Get_SumAfterDiscount write Set_SumAfterDiscount;
    property Comment: WideString read Get_Comment write Set_Comment;
    property ProductCategory: WideString read Get_ProductCategory write Set_ProductCategory;
  end;

// *********************************************************************//
// DispIntf:  IOrderItemDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {EC83A828-1316-4605-A67C-60DEFE4D3D13}
// *********************************************************************//
  IOrderItemDisp = dispinterface
    ['{EC83A828-1316-4605-A67C-60DEFE4D3D13}']
    property ProductCode: WideString dispid 0;
    property ProductName: WideString dispid 1;
    property Amount: Double dispid 2;
    property Sum: Double dispid 3;
    property SumAfterDiscount: Double dispid 4;
    property Comment: WideString dispid 5;
    property ProductCategory: WideString dispid 6;
    procedure SetPrintTime(printTime: TDateTime); dispid 7;
  end;

// *********************************************************************//
// Interface: IOrderPayments
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {996A75C2-87A3-4D20-B89C-9DD7F1F7E61D}
// *********************************************************************//
  IOrderPayments = interface(IDispatch)
    ['{996A75C2-87A3-4D20-B89C-9DD7F1F7E61D}']
    function Get_orderId: TGUID; safecall;
    function Get_payments: IResultsCollection; safecall;
    property orderId: TGUID read Get_orderId;
    property payments: IResultsCollection read Get_payments;
  end;

// *********************************************************************//
// DispIntf:  IOrderPaymentsDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {996A75C2-87A3-4D20-B89C-9DD7F1F7E61D}
// *********************************************************************//
  IOrderPaymentsDisp = dispinterface
    ['{996A75C2-87A3-4D20-B89C-9DD7F1F7E61D}']
    property orderId: {??TGUID}OleVariant readonly dispid 0;
    property payments: IResultsCollection readonly dispid 1;
  end;

// *********************************************************************//
// Interface: IParamsCollection
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {05B11C1E-23D4-4BCC-9388-98B690947AAB}
// *********************************************************************//
  IParamsCollection = interface(IDispatch)
    ['{05B11C1E-23D4-4BCC-9388-98B690947AAB}']
    procedure Add(const param: IUnknown); safecall;
  end;

// *********************************************************************//
// DispIntf:  IParamsCollectionDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {05B11C1E-23D4-4BCC-9388-98B690947AAB}
// *********************************************************************//
  IParamsCollectionDisp = dispinterface
    ['{05B11C1E-23D4-4BCC-9388-98B690947AAB}']
    procedure Add(const param: IUnknown); dispid 0;
  end;

// *********************************************************************//
// Interface: IPaymentLimit
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {C9ACB0C5-2398-4C1D-B737-155E6E075650}
// *********************************************************************//
  IPaymentLimit = interface(IDispatch)
    ['{C9ACB0C5-2398-4C1D-B737-155E6E075650}']
    function Get_WalletCode: Byte; safecall;
    procedure Set_WalletCode(pRetVal: Byte); safecall;
    function Get_MinSum: Double; safecall;
    procedure Set_MinSum(pRetVal: Double); safecall;
    function Get_MaxSum: Double; safecall;
    procedure Set_MaxSum(pRetVal: Double); safecall;
    property WalletCode: Byte read Get_WalletCode write Set_WalletCode;
    property MinSum: Double read Get_MinSum write Set_MinSum;
    property MaxSum: Double read Get_MaxSum write Set_MaxSum;
  end;

// *********************************************************************//
// DispIntf:  IPaymentLimitDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {C9ACB0C5-2398-4C1D-B737-155E6E075650}
// *********************************************************************//
  IPaymentLimitDisp = dispinterface
    ['{C9ACB0C5-2398-4C1D-B737-155E6E075650}']
    property WalletCode: Byte dispid 0;
    property MinSum: Double dispid 1;
    property MaxSum: Double dispid 2;
  end;

// *********************************************************************//
// Interface: IProductLimit
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {0FDBC7F1-C390-41D1-8C3B-8FC7CBBC5083}
// *********************************************************************//
  IProductLimit = interface(IDispatch)
    ['{0FDBC7F1-C390-41D1-8C3B-8FC7CBBC5083}']
    function Get_ProductCode: WideString; safecall;
    procedure Set_ProductCode(const pRetVal: WideString); safecall;
    function Get_MinPrice: Double; safecall;
    procedure Set_MinPrice(pRetVal: Double); safecall;
    function Get_CanBePaidByBonuses: WordBool; safecall;
    procedure Set_CanBePaidByBonuses(pRetVal: WordBool); safecall;
    property ProductCode: WideString read Get_ProductCode write Set_ProductCode;
    property MinPrice: Double read Get_MinPrice write Set_MinPrice;
    property CanBePaidByBonuses: WordBool read Get_CanBePaidByBonuses write Set_CanBePaidByBonuses;
  end;

// *********************************************************************//
// DispIntf:  IProductLimitDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {0FDBC7F1-C390-41D1-8C3B-8FC7CBBC5083}
// *********************************************************************//
  IProductLimitDisp = dispinterface
    ['{0FDBC7F1-C390-41D1-8C3B-8FC7CBBC5083}']
    property ProductCode: WideString dispid 0;
    property MinPrice: Double dispid 1;
    property CanBePaidByBonuses: WordBool dispid 2;
  end;

// *********************************************************************//
// Interface: IResultsCollection
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {4F822F90-6DD4-415E-83E5-7A20747C6E17}
// *********************************************************************//
  IResultsCollection = interface(IDispatch)
    ['{4F822F90-6DD4-415E-83E5-7A20747C6E17}']
    function Get_Count: Integer; safecall;
    function Get(index: Integer): IUnknown; safecall;
    property Count: Integer read Get_Count;
  end;

// *********************************************************************//
// DispIntf:  IResultsCollectionDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {4F822F90-6DD4-415E-83E5-7A20747C6E17}
// *********************************************************************//
  IResultsCollectionDisp = dispinterface
    ['{4F822F90-6DD4-415E-83E5-7A20747C6E17}']
    property Count: Integer readonly dispid 0;
    function Get(index: Integer): IUnknown; dispid 1;
  end;

// *********************************************************************//
// Interface: IUserData
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {9F322DCB-F4C1-45D3-A300-4855EDE6C5DC}
// *********************************************************************//
  IUserData = interface(IDispatch)
    ['{9F322DCB-F4C1-45D3-A300-4855EDE6C5DC}']
    function Get_FullName: WideString; safecall;
    procedure Set_FullName(const pRetVal: WideString); safecall;
    function Get_PhotoUrl: WideString; safecall;
    procedure Set_PhotoUrl(const pRetVal: WideString); safecall;
    function GetBirthday: TDateTime; safecall;
    property FullName: WideString read Get_FullName write Set_FullName;
    property PhotoUrl: WideString read Get_PhotoUrl write Set_PhotoUrl;
  end;

// *********************************************************************//
// DispIntf:  IUserDataDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {9F322DCB-F4C1-45D3-A300-4855EDE6C5DC}
// *********************************************************************//
  IUserDataDisp = dispinterface
    ['{9F322DCB-F4C1-45D3-A300-4855EDE6C5DC}']
    property FullName: WideString dispid 0;
    property PhotoUrl: WideString dispid 1;
    function GetBirthday: TDateTime; dispid 2;
  end;

// *********************************************************************//
// Interface: IWalletPayment
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {D2DC8B0E-2501-41F9-8061-9CEFBAC1E6D4}
// *********************************************************************//
  IWalletPayment = interface(IDispatch)
    ['{D2DC8B0E-2501-41F9-8061-9CEFBAC1E6D4}']
    function Get_WalletCode: Byte; safecall;
    procedure Set_WalletCode(pRetVal: Byte); safecall;
    function Get_Sum: Double; safecall;
    procedure Set_Sum(pRetVal: Double); safecall;
    property WalletCode: Byte read Get_WalletCode write Set_WalletCode;
    property Sum: Double read Get_Sum write Set_Sum;
  end;

// *********************************************************************//
// DispIntf:  IWalletPaymentDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {D2DC8B0E-2501-41F9-8061-9CEFBAC1E6D4}
// *********************************************************************//
  IWalletPaymentDisp = dispinterface
    ['{D2DC8B0E-2501-41F9-8061-9CEFBAC1E6D4}']
    property WalletCode: Byte dispid 0;
    property Sum: Double dispid 1;
  end;

// *********************************************************************//
// Interface: IWalletRefund
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {DFCE4062-7498-4802-B1E7-A9131997BE17}
// *********************************************************************//
  IWalletRefund = interface(IDispatch)
    ['{DFCE4062-7498-4802-B1E7-A9131997BE17}']
    function Get_WalletCode: Byte; safecall;
    procedure Set_WalletCode(pRetVal: Byte); safecall;
    function Get_Sum: Double; safecall;
    procedure Set_Sum(pRetVal: Double); safecall;
    property WalletCode: Byte read Get_WalletCode write Set_WalletCode;
    property Sum: Double read Get_Sum write Set_Sum;
  end;

// *********************************************************************//
// DispIntf:  IWalletRefundDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {DFCE4062-7498-4802-B1E7-A9131997BE17}
// *********************************************************************//
  IWalletRefundDisp = dispinterface
    ['{DFCE4062-7498-4802-B1E7-A9131997BE17}']
    property WalletCode: Byte dispid 0;
    property Sum: Double dispid 1;
  end;

// *********************************************************************//
// Interface: IStartupParams
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {2B3E93AD-CFB7-4AEA-81E0-D6D2D360FBE0}
// *********************************************************************//
  IStartupParams = interface(IDispatch)
    ['{2B3E93AD-CFB7-4AEA-81E0-D6D2D360FBE0}']
    function Get_Host: WideString; safecall;
    procedure Set_Host(const pRetVal: WideString); safecall;
    function Get_Login: WideString; safecall;
    procedure Set_Login(const pRetVal: WideString); safecall;
    function Get_Password: WideString; safecall;
    procedure Set_Password(const pRetVal: WideString); safecall;
    function Get_SyncCallTimeoutSec: Integer; safecall;
    procedure Set_SyncCallTimeoutSec(pRetVal: Integer); safecall;
    function Get_AsyncCallWaitTimeoutSec: Integer; safecall;
    procedure Set_AsyncCallWaitTimeoutSec(pRetVal: Integer); safecall;
    function Get_UseCompression: WordBool; safecall;
    procedure Set_UseCompression(pRetVal: WordBool); safecall;
    function Get_Locale: WideString; safecall;
    procedure Set_Locale(const pRetVal: WideString); safecall;
    function Get_TapeWidth: Integer; safecall;
    procedure Set_TapeWidth(pRetVal: Integer); safecall;
    function Get_DataDir: WideString; safecall;
    procedure Set_DataDir(const pRetVal: WideString); safecall;
    function Get_TerminalId: WideString; safecall;
    procedure Set_TerminalId(const pRetVal: WideString); safecall;
    function Get_Vendor: WideString; safecall;
    procedure Set_Vendor(const pRetVal: WideString); safecall;
    function Get_Product: WideString; safecall;
    procedure Set_Product(const pRetVal: WideString); safecall;
    function Get_ProductVersion: WideString; safecall;
    procedure Set_ProductVersion(const pRetVal: WideString); safecall;
    function Get_PluginVersion: WideString; safecall;
    procedure Set_PluginVersion(const pRetVal: WideString); safecall;
    property Host: WideString read Get_Host write Set_Host;
    property Login: WideString read Get_Login write Set_Login;
    property Password: WideString read Get_Password write Set_Password;
    property SyncCallTimeoutSec: Integer read Get_SyncCallTimeoutSec write Set_SyncCallTimeoutSec;
    property AsyncCallWaitTimeoutSec: Integer read Get_AsyncCallWaitTimeoutSec write Set_AsyncCallWaitTimeoutSec;
    property UseCompression: WordBool read Get_UseCompression write Set_UseCompression;
    property Locale: WideString read Get_Locale write Set_Locale;
    property TapeWidth: Integer read Get_TapeWidth write Set_TapeWidth;
    property DataDir: WideString read Get_DataDir write Set_DataDir;
    property TerminalId: WideString read Get_TerminalId write Set_TerminalId;
    property Vendor: WideString read Get_Vendor write Set_Vendor;
    property Product: WideString read Get_Product write Set_Product;
    property ProductVersion: WideString read Get_ProductVersion write Set_ProductVersion;
    property PluginVersion: WideString read Get_PluginVersion write Set_PluginVersion;
  end;

// *********************************************************************//
// DispIntf:  IStartupParamsDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {2B3E93AD-CFB7-4AEA-81E0-D6D2D360FBE0}
// *********************************************************************//
  IStartupParamsDisp = dispinterface
    ['{2B3E93AD-CFB7-4AEA-81E0-D6D2D360FBE0}']
    property Host: WideString dispid 0;
    property Login: WideString dispid 1;
    property Password: WideString dispid 2;
    property SyncCallTimeoutSec: Integer dispid 3;
    property AsyncCallWaitTimeoutSec: Integer dispid 4;
    property UseCompression: WordBool dispid 5;
    property Locale: WideString dispid 6;
    property TapeWidth: Integer dispid 7;
    property DataDir: WideString dispid 8;
    property TerminalId: WideString dispid 9;
    property Vendor: WideString dispid 10;
    property Product: WideString dispid 11;
    property ProductVersion: WideString dispid 12;
    property PluginVersion: WideString dispid 13;
  end;

// *********************************************************************//
// Interface: ICheckinResult
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {73F1A661-AB59-4B55-A8FE-F417BE2C701C}
// *********************************************************************//
  ICheckinResult = interface(IDispatch)
    ['{73F1A661-AB59-4B55-A8FE-F417BE2C701C}']
    function Get_UserData: IUserData; safecall;
    function Get_LoyaltyResult: ILoyaltyResult; safecall;
    function Get_PaymentLimits: IResultsCollection; safecall;
    function Get_payments: IResultsCollection; safecall;
    function Get_ChequeFooter: WideString; safecall;
    property UserData: IUserData read Get_UserData;
    property LoyaltyResult: ILoyaltyResult read Get_LoyaltyResult;
    property PaymentLimits: IResultsCollection read Get_PaymentLimits;
    property payments: IResultsCollection read Get_payments;
    property ChequeFooter: WideString read Get_ChequeFooter;
  end;

// *********************************************************************//
// DispIntf:  ICheckinResultDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {73F1A661-AB59-4B55-A8FE-F417BE2C701C}
// *********************************************************************//
  ICheckinResultDisp = dispinterface
    ['{73F1A661-AB59-4B55-A8FE-F417BE2C701C}']
    property UserData: IUserData readonly dispid 0;
    property LoyaltyResult: ILoyaltyResult readonly dispid 1;
    property PaymentLimits: IResultsCollection readonly dispid 2;
    property payments: IResultsCollection readonly dispid 3;
    property ChequeFooter: WideString readonly dispid 4;
  end;

// *********************************************************************//
// Interface: ICloseResult
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {8B3B11AD-B2F7-428D-9B37-8EC581F6CE78}
// *********************************************************************//
  ICloseResult = interface(IDispatch)
    ['{8B3B11AD-B2F7-428D-9B37-8EC581F6CE78}']
    function Get_LoyaltyResult: ILoyaltyResult; safecall;
    function Get_ChequeFooter: WideString; safecall;
    property LoyaltyResult: ILoyaltyResult read Get_LoyaltyResult;
    property ChequeFooter: WideString read Get_ChequeFooter;
  end;

// *********************************************************************//
// DispIntf:  ICloseResultDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {8B3B11AD-B2F7-428D-9B37-8EC581F6CE78}
// *********************************************************************//
  ICloseResultDisp = dispinterface
    ['{8B3B11AD-B2F7-428D-9B37-8EC581F6CE78}']
    property LoyaltyResult: ILoyaltyResult readonly dispid 0;
    property ChequeFooter: WideString readonly dispid 1;
  end;

// *********************************************************************//
// Interface: IRefundResult
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {E10DBDB6-473D-4DC9-921E-F45FCC3CF403}
// *********************************************************************//
  IRefundResult = interface(IDispatch)
    ['{E10DBDB6-473D-4DC9-921E-F45FCC3CF403}']
    function Get_ChequeFooter: WideString; safecall;
    procedure Set_ChequeFooter(const pRetVal: WideString); safecall;
    property ChequeFooter: WideString read Get_ChequeFooter write Set_ChequeFooter;
  end;

// *********************************************************************//
// DispIntf:  IRefundResultDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {E10DBDB6-473D-4DC9-921E-F45FCC3CF403}
// *********************************************************************//
  IRefundResultDisp = dispinterface
    ['{E10DBDB6-473D-4DC9-921E-F45FCC3CF403}']
    property ChequeFooter: WideString dispid 0;
  end;

// *********************************************************************//
// Interface: _LogConfigurer
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {8996E85A-3F93-30E1-914D-F35855F58D9E}
// *********************************************************************//
  _LogConfigurer = interface(IDispatch)
    ['{8996E85A-3F93-30E1-914D-F35855F58D9E}']
  end;

// *********************************************************************//
// DispIntf:  _LogConfigurerDisp
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {8996E85A-3F93-30E1-914D-F35855F58D9E}
// *********************************************************************//
  _LogConfigurerDisp = dispinterface
    ['{8996E85A-3F93-30E1-914D-F35855F58D9E}']
  end;

// *********************************************************************//
// The Class CoWorkflowDummyImpl provides a Create and CreateRemote method to          
// create instances of the default interface IWorkflow exposed by              
// the CoClass WorkflowDummyImpl. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoWorkflowDummyImpl = class
    class function Create: IWorkflow;
    class function CreateRemote(const MachineName: string): IWorkflow;
  end;

// *********************************************************************//
// The Class CoWorkflowImpl provides a Create and CreateRemote method to          
// create instances of the default interface IWorkflow exposed by              
// the CoClass WorkflowImpl. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoWorkflowImpl = class
    class function Create: IWorkflow;
    class function CreateRemote(const MachineName: string): IWorkflow;
  end;

// *********************************************************************//
// The Class CoStartupParams provides a Create and CreateRemote method to          
// create instances of the default interface IStartupParams exposed by              
// the CoClass StartupParams. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoStartupParams = class
    class function Create: IStartupParams;
    class function CreateRemote(const MachineName: string): IStartupParams;
  end;

// *********************************************************************//
// The Class CoLogConfigurer provides a Create and CreateRemote method to          
// create instances of the default interface _LogConfigurer exposed by              
// the CoClass LogConfigurer. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoLogConfigurer = class
    class function Create: _LogConfigurer;
    class function CreateRemote(const MachineName: string): _LogConfigurer;
  end;

implementation

uses ComObj;

class function CoWorkflowDummyImpl.Create: IWorkflow;
begin
  Result := CreateComObject(CLASS_WorkflowDummyImpl) as IWorkflow;
end;

class function CoWorkflowDummyImpl.CreateRemote(const MachineName: string): IWorkflow;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_WorkflowDummyImpl) as IWorkflow;
end;

class function CoWorkflowImpl.Create: IWorkflow;
begin
  Result := CreateComObject(CLASS_WorkflowImpl) as IWorkflow;
end;

class function CoWorkflowImpl.CreateRemote(const MachineName: string): IWorkflow;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_WorkflowImpl) as IWorkflow;
end;

class function CoStartupParams.Create: IStartupParams;
begin
  Result := CreateComObject(CLASS_StartupParams) as IStartupParams;
end;

class function CoStartupParams.CreateRemote(const MachineName: string): IStartupParams;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_StartupParams) as IStartupParams;
end;

class function CoLogConfigurer.Create: _LogConfigurer;
begin
  Result := CreateComObject(CLASS_LogConfigurer) as _LogConfigurer;
end;

class function CoLogConfigurer.CreateRemote(const MachineName: string): _LogConfigurer;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_LogConfigurer) as _LogConfigurer;
end;

end.
