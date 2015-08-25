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
// File generated on 18.06.2015 17:52:41 from Type Library described below.

// ************************************************************************  //
// Type Lib: F:\platius\dev\CardService\Api\Front\v2\iikoNet.Service.Api.Front.v2.Client\bin\Debug\Platius.Service.Api.Front.v2.Client.tlb (1)
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

  DIID_INotification: TGUID = '{4B15F48D-D316-40FE-B6FE-93426ACB8DA8}';
  DIID_INotificationCollection: TGUID = '{09D52E06-5CAA-4675-A911-E32F85C02FCD}';
  DIID_IPaymentNotification: TGUID = '{EA3AF29E-E4CC-45C7-8000-45E8D65A0075}';
  DIID_IOrderPaymentsCollection: TGUID = '{611EC775-EF14-496F-AE1D-3655BE6F2736}';
  DIID_ILoyaltyOperationCollection: TGUID = '{80CFC198-43B7-4368-85FB-38F44C5DBEAC}';
  DIID_ILoyaltyProgramResultCollection: TGUID = '{831B55A0-BA50-4782-9D75-FF98BED65C80}';
  DIID_IWalletPaymentCollection: TGUID = '{B3BB1D94-F3B1-4BF3-9BB0-230806876039}';
  DIID_IPaymentLimitCollection: TGUID = '{D54ACC24-3D77-4CA1-A688-9E223CD33CFC}';
  DIID_IWorkflow: TGUID = '{A62D03C7-F896-4298-9640-290DFE622C58}';
  CLASS_WorkflowDummyImpl: TGUID = '{7D4E0DFB-DB89-4D72-9D70-48F78DE447C2}';
  CLASS_WorkflowImpl: TGUID = '{A3D59A39-03FE-436A-88EC-EAD2ECF407D8}';
  DIID_IAppliedDiscount: TGUID = '{0C703C88-DDA1-4531-9FE8-13341FCCD4D7}';
  DIID_ICancelledOrderItem: TGUID = '{D5354BB7-8872-4B6A-81A2-EB589C59B304}';
  DIID_ILoyaltyOperation: TGUID = '{18D27725-489C-4AD3-866C-1BAAF7DD09EC}';
  DIID_ILoyaltyProgramResult: TGUID = '{FC21E48A-DF02-4912-A6FC-E70D63A009E8}';
  DIID_ILoyaltyResult: TGUID = '{0E51AC50-CB03-4172-9E54-50C791F115DC}';
  DIID_IOrder: TGUID = '{BF0CFEFD-A8E3-4276-9252-DE9065EC124E}';
  DIID_IOrderItem: TGUID = '{EC83A828-1316-4605-A67C-60DEFE4D3D13}';
  DIID_IOrderPayments: TGUID = '{996A75C2-87A3-4D20-B89C-9DD7F1F7E61D}';
  DIID_IParamsCollection: TGUID = '{05B11C1E-23D4-4BCC-9388-98B690947AAB}';
  DIID_IPaymentLimit: TGUID = '{C9ACB0C5-2398-4C1D-B737-155E6E075650}';
  DIID_IProductLimit: TGUID = '{0FDBC7F1-C390-41D1-8C3B-8FC7CBBC5083}';
  DIID_IUserData: TGUID = '{9F322DCB-F4C1-45D3-A300-4855EDE6C5DC}';
  DIID_IWalletPayment: TGUID = '{D2DC8B0E-2501-41F9-8061-9CEFBAC1E6D4}';
  DIID_IWalletRefund: TGUID = '{DFCE4062-7498-4802-B1E7-A9131997BE17}';
  DIID_IStartupParams: TGUID = '{2B3E93AD-CFB7-4AEA-81E0-D6D2D360FBE0}';
  DIID_ICheckinResult: TGUID = '{73F1A661-AB59-4B55-A8FE-F417BE2C701C}';
  DIID_ICloseResult: TGUID = '{8B3B11AD-B2F7-428D-9B37-8EC581F6CE78}';
  DIID_IRefundResult: TGUID = '{E10DBDB6-473D-4DC9-921E-F45FCC3CF403}';
  CLASS_StartupParams: TGUID = '{DEFC0114-8AB8-46C3-8E94-03444BF60736}';

// *********************************************************************//
// Declaration of Enumerations defined in Type Library                    
// *********************************************************************//
// Constants for enum UserSearchScope
type
  UserSearchScope = TOleEnum;
const
  UserSearchScope_Reserved = $00000000;
  UserSearchScope_Phone = $00000001;
  UserSearchScope_CardNumber = $00000002;
  UserSearchScope_CardTrack = $00000004;
  UserSearchScope_PaymentCode = $00000008;
  UserSearchScope_All = $0000000F;

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
  INotification = dispinterface;
  INotificationCollection = dispinterface;
  IPaymentNotification = dispinterface;
  IOrderPaymentsCollection = dispinterface;
  ILoyaltyOperationCollection = dispinterface;
  ILoyaltyProgramResultCollection = dispinterface;
  IWalletPaymentCollection = dispinterface;
  IPaymentLimitCollection = dispinterface;
  IWorkflow = dispinterface;
  IAppliedDiscount = dispinterface;
  ICancelledOrderItem = dispinterface;
  ILoyaltyOperation = dispinterface;
  ILoyaltyProgramResult = dispinterface;
  ILoyaltyResult = dispinterface;
  IOrder = dispinterface;
  IOrderItem = dispinterface;
  IOrderPayments = dispinterface;
  IParamsCollection = dispinterface;
  IPaymentLimit = dispinterface;
  IProductLimit = dispinterface;
  IUserData = dispinterface;
  IWalletPayment = dispinterface;
  IWalletRefund = dispinterface;
  IStartupParams = dispinterface;
  ICheckinResult = dispinterface;
  ICloseResult = dispinterface;
  IRefundResult = dispinterface;

// *********************************************************************//
// Declaration of CoClasses defined in Type Library                       
// (NOTE: Here we map each CoClass to its Default Interface)              
// *********************************************************************//
  WorkflowDummyImpl = IWorkflow;
  WorkflowImpl = IWorkflow;
  StartupParams = IStartupParams;


// *********************************************************************//
// DispIntf:  INotification
// Flags:     (4096) Dispatchable
// GUID:      {4B15F48D-D316-40FE-B6FE-93426ACB8DA8}
// *********************************************************************//
  INotification = dispinterface
    ['{4B15F48D-D316-40FE-B6FE-93426ACB8DA8}']
    property Id: WideString readonly dispid 0;
    property OrderId: WideString readonly dispid 1;
    property CreatedOn: TDateTime readonly dispid 2;
    property NotificationType: Integer readonly dispid 3;
    property UserData: IUserData readonly dispid 4;
    property Message: WideString readonly dispid 5;
    function AsPaymentNotification: IPaymentNotification; dispid 101;
  end;

// *********************************************************************//
// DispIntf:  INotificationCollection
// Flags:     (4096) Dispatchable
// GUID:      {09D52E06-5CAA-4675-A911-E32F85C02FCD}
// *********************************************************************//
  INotificationCollection = dispinterface
    ['{09D52E06-5CAA-4675-A911-E32F85C02FCD}']
    property Count: Integer readonly dispid 0;
    function Get(index: Integer): INotification; dispid 1;
  end;

// *********************************************************************//
// DispIntf:  IPaymentNotification
// Flags:     (4096) Dispatchable
// GUID:      {EA3AF29E-E4CC-45C7-8000-45E8D65A0075}
// *********************************************************************//
  IPaymentNotification = dispinterface
    ['{EA3AF29E-E4CC-45C7-8000-45E8D65A0075}']
    property Payments: IWalletPaymentCollection readonly dispid 0;
    property IsPaid: WordBool readonly dispid 1;
    property SumToPay: Double readonly dispid 2;
  end;

// *********************************************************************//
// DispIntf:  IOrderPaymentsCollection
// Flags:     (4096) Dispatchable
// GUID:      {611EC775-EF14-496F-AE1D-3655BE6F2736}
// *********************************************************************//
  IOrderPaymentsCollection = dispinterface
    ['{611EC775-EF14-496F-AE1D-3655BE6F2736}']
    property Count: Integer readonly dispid 0;
    function Get(index: Integer): IOrderPayments; dispid 1;
  end;

// *********************************************************************//
// DispIntf:  ILoyaltyOperationCollection
// Flags:     (4096) Dispatchable
// GUID:      {80CFC198-43B7-4368-85FB-38F44C5DBEAC}
// *********************************************************************//
  ILoyaltyOperationCollection = dispinterface
    ['{80CFC198-43B7-4368-85FB-38F44C5DBEAC}']
    property Count: Integer readonly dispid 0;
    function Get(index: Integer): ILoyaltyOperation; dispid 1;
  end;

// *********************************************************************//
// DispIntf:  ILoyaltyProgramResultCollection
// Flags:     (4096) Dispatchable
// GUID:      {831B55A0-BA50-4782-9D75-FF98BED65C80}
// *********************************************************************//
  ILoyaltyProgramResultCollection = dispinterface
    ['{831B55A0-BA50-4782-9D75-FF98BED65C80}']
    property Count: Integer readonly dispid 0;
    function Get(index: Integer): ILoyaltyProgramResult; dispid 1;
  end;

// *********************************************************************//
// DispIntf:  IWalletPaymentCollection
// Flags:     (4096) Dispatchable
// GUID:      {B3BB1D94-F3B1-4BF3-9BB0-230806876039}
// *********************************************************************//
  IWalletPaymentCollection = dispinterface
    ['{B3BB1D94-F3B1-4BF3-9BB0-230806876039}']
    property Count: Integer readonly dispid 0;
    function Get(index: Integer): IWalletPayment; dispid 1;
  end;

// *********************************************************************//
// DispIntf:  IPaymentLimitCollection
// Flags:     (4096) Dispatchable
// GUID:      {D54ACC24-3D77-4CA1-A688-9E223CD33CFC}
// *********************************************************************//
  IPaymentLimitCollection = dispinterface
    ['{D54ACC24-3D77-4CA1-A688-9E223CD33CFC}']
    property Count: Integer readonly dispid 0;
    function Get(index: Integer): IPaymentLimit; dispid 1;
  end;

// *********************************************************************//
// DispIntf:  IWorkflow
// Flags:     (4096) Dispatchable
// GUID:      {A62D03C7-F896-4298-9640-290DFE622C58}
// *********************************************************************//
  IWorkflow = dispinterface
    ['{A62D03C7-F896-4298-9640-290DFE622C58}']
    property NewGuid: WideString readonly dispid 0;
    function CreateParamsCollection: IParamsCollection; dispid 1;
    function CreateOrder: IOrder; dispid 2;
    function CreateOrderItem: IOrderItem; dispid 3;
    function CreateProductLimit: IProductLimit; dispid 4;
    function CreateWalletPayment: IWalletPayment; dispid 5;
    function CreateAppliedDiscount: IAppliedDiscount; dispid 6;
    function CreateWalletRefund: IWalletRefund; dispid 7;
    function CreateCancelledOrderItem: ICancelledOrderItem; dispid 8;
    property IsOnline: WordBool readonly dispid 99;
    procedure Initialize(const StartupParams: IStartupParams); dispid 100;
    procedure UnInitialize; dispid 1000;
    function Checkin(const credential: WideString; searchScope: UserSearchScope; 
                     const order: IOrder; const limits: IParamsCollection): ICheckinResult; dispid 101;
    procedure Pay(const OrderId: WideString; const transactionId: WideString; 
                  const Payments: IParamsCollection; const discounts: IParamsCollection); dispid 102;
    function Refund(const OrderId: WideString; const transactionId: WideString; 
                    const refunds: IParamsCollection; const cancelledItems: IParamsCollection): IRefundResult; dispid 104;
    function Close(const OrderId: WideString; sumForBonus: Double): ICloseResult; dispid 105;
    procedure Abort(const OrderId: WideString); dispid 106;
    procedure Reset(const OrderId: WideString); dispid 107;
    function UpdateOrder(const order: IOrder; const limits: IParamsCollection): ICheckinResult; dispid 200;
    function Precheque(const order: IOrder; const limits: IParamsCollection): ICheckinResult; dispid 202;
    function GetPayments(const orderIds: IParamsCollection): IOrderPaymentsCollection; dispid 201;
    function GetNotifications(const orderIds: IParamsCollection): INotificationCollection; dispid 203;
  end;

// *********************************************************************//
// DispIntf:  IAppliedDiscount
// Flags:     (4096) Dispatchable
// GUID:      {0C703C88-DDA1-4531-9FE8-13341FCCD4D7}
// *********************************************************************//
  IAppliedDiscount = dispinterface
    ['{0C703C88-DDA1-4531-9FE8-13341FCCD4D7}']
    property ProgramId: WideString dispid 0;
    property OperationCode: WideString dispid 1;
    property ProductCode: WideString dispid 2;
    property ProductName: WideString dispid 3;
    property Sum: Double dispid 4;
    property Comment: WideString dispid 5;
  end;

// *********************************************************************//
// DispIntf:  ICancelledOrderItem
// Flags:     (4096) Dispatchable
// GUID:      {D5354BB7-8872-4B6A-81A2-EB589C59B304}
// *********************************************************************//
  ICancelledOrderItem = dispinterface
    ['{D5354BB7-8872-4B6A-81A2-EB589C59B304}']
    property ProductCode: WideString dispid 0;
    property Amount: Double dispid 1;
  end;

// *********************************************************************//
// DispIntf:  ILoyaltyOperation
// Flags:     (4096) Dispatchable
// GUID:      {18D27725-489C-4AD3-866C-1BAAF7DD09EC}
// *********************************************************************//
  ILoyaltyOperation = dispinterface
    ['{18D27725-489C-4AD3-866C-1BAAF7DD09EC}']
    property Code: WideString dispid 0;
    property ProductCode: WideString dispid 1;
    property ProductName: WideString dispid 2;
    property DiscountSum: Double dispid 3;
    property Comment: WideString dispid 4;
  end;

// *********************************************************************//
// DispIntf:  ILoyaltyProgramResult
// Flags:     (4096) Dispatchable
// GUID:      {FC21E48A-DF02-4912-A6FC-E70D63A009E8}
// *********************************************************************//
  ILoyaltyProgramResult = dispinterface
    ['{FC21E48A-DF02-4912-A6FC-E70D63A009E8}']
    property ProgramId: WideString dispid 0;
    property Name: WideString dispid 1;
    property Operations: ILoyaltyOperationCollection readonly dispid 2;
  end;

// *********************************************************************//
// DispIntf:  ILoyaltyResult
// Flags:     (4096) Dispatchable
// GUID:      {0E51AC50-CB03-4172-9E54-50C791F115DC}
// *********************************************************************//
  ILoyaltyResult = dispinterface
    ['{0E51AC50-CB03-4172-9E54-50C791F115DC}']
    property TotalBonus: Double readonly dispid 0;
    property Programs: ILoyaltyProgramResultCollection readonly dispid 1;
  end;

// *********************************************************************//
// DispIntf:  IOrder
// Flags:     (4096) Dispatchable
// GUID:      {BF0CFEFD-A8E3-4276-9252-DE9065EC124E}
// *********************************************************************//
  IOrder = dispinterface
    ['{BF0CFEFD-A8E3-4276-9252-DE9065EC124E}']
    property Id: WideString dispid 0;
    property SumAfterDiscount: Double dispid 1;
    property Sum: Double dispid 2;
    property RestarauntSectionName: WideString dispid 3;
    property TableNumber: WideString dispid 4;
    property Number: WideString dispid 5;
    property GuestsCount: Integer dispid 6;
    property WaiterName: WideString dispid 7;
    property CashierName: WideString dispid 8;
    procedure SetOpenTime(openTime: TDateTime); dispid 9;
    procedure AddItem(const item: IOrderItem); dispid 10;
    procedure SetFiscalChequeNumber(fiscalChequeNumber: Integer); dispid 11;
  end;

// *********************************************************************//
// DispIntf:  IOrderItem
// Flags:     (4096) Dispatchable
// GUID:      {EC83A828-1316-4605-A67C-60DEFE4D3D13}
// *********************************************************************//
  IOrderItem = dispinterface
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
// DispIntf:  IOrderPayments
// Flags:     (4096) Dispatchable
// GUID:      {996A75C2-87A3-4D20-B89C-9DD7F1F7E61D}
// *********************************************************************//
  IOrderPayments = dispinterface
    ['{996A75C2-87A3-4D20-B89C-9DD7F1F7E61D}']
    property OrderId: WideString readonly dispid 0;
    property Payments: IWalletPaymentCollection readonly dispid 1;
  end;

// *********************************************************************//
// DispIntf:  IParamsCollection
// Flags:     (4096) Dispatchable
// GUID:      {05B11C1E-23D4-4BCC-9388-98B690947AAB}
// *********************************************************************//
  IParamsCollection = dispinterface
    ['{05B11C1E-23D4-4BCC-9388-98B690947AAB}']
    procedure Add(const param: IDispatch); dispid 0;
  end;

// *********************************************************************//
// DispIntf:  IPaymentLimit
// Flags:     (4096) Dispatchable
// GUID:      {C9ACB0C5-2398-4C1D-B737-155E6E075650}
// *********************************************************************//
  IPaymentLimit = dispinterface
    ['{C9ACB0C5-2398-4C1D-B737-155E6E075650}']
    property WalletCode: WalletCode dispid 0;
    property MinSum: Double dispid 1;
    property MaxSum: Double dispid 2;
  end;

// *********************************************************************//
// DispIntf:  IProductLimit
// Flags:     (4096) Dispatchable
// GUID:      {0FDBC7F1-C390-41D1-8C3B-8FC7CBBC5083}
// *********************************************************************//
  IProductLimit = dispinterface
    ['{0FDBC7F1-C390-41D1-8C3B-8FC7CBBC5083}']
    property ProductCode: WideString dispid 0;
    property MaxDiscount: Double dispid 1;
    property MaxBonusPayment: Double dispid 2;
    property IsFullAmountLimit: WordBool dispid 3;
  end;

// *********************************************************************//
// DispIntf:  IUserData
// Flags:     (4096) Dispatchable
// GUID:      {9F322DCB-F4C1-45D3-A300-4855EDE6C5DC}
// *********************************************************************//
  IUserData = dispinterface
    ['{9F322DCB-F4C1-45D3-A300-4855EDE6C5DC}']
    property FullName: WideString dispid 0;
    property PhotoUrl: WideString dispid 1;
    function GetBirthday: TDateTime; dispid 2;
  end;

// *********************************************************************//
// DispIntf:  IWalletPayment
// Flags:     (4096) Dispatchable
// GUID:      {D2DC8B0E-2501-41F9-8061-9CEFBAC1E6D4}
// *********************************************************************//
  IWalletPayment = dispinterface
    ['{D2DC8B0E-2501-41F9-8061-9CEFBAC1E6D4}']
    property WalletCode: WalletCode dispid 0;
    property Sum: Double dispid 1;
  end;

// *********************************************************************//
// DispIntf:  IWalletRefund
// Flags:     (4096) Dispatchable
// GUID:      {DFCE4062-7498-4802-B1E7-A9131997BE17}
// *********************************************************************//
  IWalletRefund = dispinterface
    ['{DFCE4062-7498-4802-B1E7-A9131997BE17}']
    property WalletCode: WalletCode dispid 0;
    property Sum: Double dispid 1;
  end;

// *********************************************************************//
// DispIntf:  IStartupParams
// Flags:     (4096) Dispatchable
// GUID:      {2B3E93AD-CFB7-4AEA-81E0-D6D2D360FBE0}
// *********************************************************************//
  IStartupParams = dispinterface
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
    property UseXmlCheques: WordBool dispid 14;
  end;

// *********************************************************************//
// DispIntf:  ICheckinResult
// Flags:     (4096) Dispatchable
// GUID:      {73F1A661-AB59-4B55-A8FE-F417BE2C701C}
// *********************************************************************//
  ICheckinResult = dispinterface
    ['{73F1A661-AB59-4B55-A8FE-F417BE2C701C}']
    property UserData: IUserData readonly dispid 0;
    property LoyaltyResult: ILoyaltyResult readonly dispid 1;
    property PaymentLimits: IPaymentLimitCollection readonly dispid 2;
    property Payments: IWalletPaymentCollection readonly dispid 3;
    property ChequeFooter: WideString readonly dispid 4;
  end;

// *********************************************************************//
// DispIntf:  ICloseResult
// Flags:     (4096) Dispatchable
// GUID:      {8B3B11AD-B2F7-428D-9B37-8EC581F6CE78}
// *********************************************************************//
  ICloseResult = dispinterface
    ['{8B3B11AD-B2F7-428D-9B37-8EC581F6CE78}']
    property LoyaltyResult: ILoyaltyResult readonly dispid 0;
    property ChequeFooter: WideString readonly dispid 1;
  end;

// *********************************************************************//
// DispIntf:  IRefundResult
// Flags:     (4096) Dispatchable
// GUID:      {E10DBDB6-473D-4DC9-921E-F45FCC3CF403}
// *********************************************************************//
  IRefundResult = dispinterface
    ['{E10DBDB6-473D-4DC9-921E-F45FCC3CF403}']
    property ChequeFooter: WideString dispid 0;
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

end.
