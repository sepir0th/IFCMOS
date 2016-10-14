//
//  EditProspect.h
//  MPOS
//
//  Created by Md. Nazmus Saadat on 10/1/12.
//  Copyright (c) 2012 InfoConnect Sdn Bhd. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "ProspectProfile.h"
#import <sqlite3.h>
#import "OccupationList.h"
#import "SIDate.h"
#import "IDTypeViewController.h"
#import "TitleViewController.h"
#import "GroupClass.h"
#import "Nationality.h"
#import "Country.h"
#import "Country2.h"
#import "Race.h"
#import "MaritalStatus.h"
#import "Religion.h"
#import "ClearData.h"
#import "SourceIncome.h"
#import "BranchInfo.h"
#import "VIPClass.h"
#import "ReferralSource.h"
#import "ModelAgentProfile.h"
#import "ModelDataReferral.h"
#import "KodePosInfo.h"
#import "ModelSIPOData.h"
#import "Model_SI_Master.h"
#import "Model_SI_Premium.h"
#import "ModelSIRider.h"
#import "NIPInfo.h"

@class DataTable,DBController;
@protocol EditProspectDelegate
- (void)FinishEdit;
@end

@interface EditProspect : UIViewController<OccupationListDelegate,IDTypeDelegate,SIDateDelegate,UITextViewDelegate,TitleDelegate,GroupDelegate,UITextFieldDelegate,NatinalityDelegate,CountryDelegate,RaceDelegate,ReligionDelegate,MaritalStatusDelegate, Country2Delegate,SourceIncomeDelegate,VIPClassDelegate,ReferralSourceDelegate,BranchInfoDelegate,KodeposInfoDelegate,NIPInfoDelegate>{
    NSString *databasePath;
    sqlite3 *contactDB;
    UITextField *activeField;
    UITextView *activeView;
    GroupClass *_GroupList;
    TitleViewController *_TitlePicker;
    SIDate *_SIDate;
    OccupationList *_OccupationList;
    Nationality *_nationalityList;
    Nationality *_nationalityList2;
    
    //added  by faiz
    ModelSIPOData* modelSIPOData;
    ModelSIRider* modelSIRider;
    Model_SI_Premium* modelSIPremium;
    Model_SI_Master* modelSIMaster;
    ModelDataReferral* modelDataReferral;
    ModelAgentProfile* modelAgentProfil;
    SourceIncome *_sourceIncome;
    BranchInfo *_branchInfo;
    NIPInfo *_nipInfo;
    VIPClass *_vipClass;
    KodePosInfo *_kodePosInfo;
    ReferralSource *_referralSource;
    //end of add
    
    UIPopoverController *_GroupPopover;
    UIPopoverController *_TitlePickerPopover;
    UIPopoverController *_SIDatePopover;
    UIPopoverController *_OccupationListPopover;
    UIPopoverController *_CountryListPopover;
    UIPopoverController *_nationalityPopover;
    UIPopoverController *_nationalityPopover2;
    //added by faiz
    UIPopoverController *_sourceIncomePopover;
    UIPopoverController *_branchInfoPopover;
    UIPopoverController *_vipClassPopover;
    UIPopoverController *_nipInfoPopover;
    UIPopoverController *_kodePosPopover;
    UIPopoverController *_referralSourcePopover;
    //end of added by faiz
    UIPopoverController *_ReligionListPopover;
    UIPopoverController *_RaceListPopover;
    UIPopoverController *_MaritalStatusPopover;
    id<EditProspectDelegate> _delegate;
    UIAlertView *rrr;
    UIAlertView *errormsg;
    BOOL checked;
    BOOL checked2;
    BOOL isHomeCountry;
    BOOL isOffCountry;
    BOOL companyCase;
    int count_eApp;
    int name_repeat;
    
    bool ToDissAlertforRegDate;
    NSMutableArray *DelGroupArr;
    bool HomePostcodeContinue;
    bool OfficePostcodeContinue;
}


@property (strong, nonatomic) ProspectProfile* prospectprofile;

@property (strong, nonatomic) DBController* db;

@property (strong, nonatomic) DataTable * tableDB;
@property (strong, nonatomic) DataTable * tableCheckSameRecord;

@property (nonatomic, strong) Race *raceList;
@property (nonatomic, strong) Country *CountryList;
@property (nonatomic, strong) Country2 *Country2List;
@property (nonatomic, strong) MaritalStatus *MaritalStatusList;
@property (nonatomic, strong) Religion *ReligionList;
@property (nonatomic, strong) UIPopoverController *ReligionListPopover;
@property (nonatomic, strong) UIPopoverController *CountryListPopover;
@property (nonatomic, strong) UIPopoverController *Country2ListPopover;
@property (nonatomic, strong) UIPopoverController *raceListPopover;
@property (nonatomic, strong) UIPopoverController *MaritalStatusPopover;
@property (weak, nonatomic) IBOutlet UIScrollView *myScrollView;
@property (nonatomic, strong) id<EditProspectDelegate> delegate;
@property (strong, nonatomic) ProspectProfile* pp;
@property (nonatomic, strong) IDTypeViewController *IDTypePicker;
@property (nonatomic, strong) UIPopoverController *IDTypePickerPopover;
@property (nonatomic, retain) OccupationList *OccupationList;
@property (nonatomic, retain) UIPopoverController *OccupationListPopover;
@property (nonatomic, retain) SIDate *SIDate;
@property (nonatomic, retain) UIPopoverController *SIDatePopover;
@property (nonatomic, strong) TitleViewController *TitlePicker;
@property (nonatomic, strong) UIPopoverController *TitlePickerPopover;
@property (nonatomic, strong) GroupClass *GroupList;
@property (nonatomic, strong) UIPopoverController *GroupPopover;
@property (nonatomic,strong) Nationality *nationalityList;
@property (nonatomic, strong) UIPopoverController *nationalityPopover;
@property (nonatomic,strong) Nationality *nationalityList2;
@property (nonatomic, strong) UIPopoverController *nationalityPopover2;
@property (nonatomic, copy) NSString *GSTRigperson;
@property (nonatomic, copy) NSString *GSTRigExempted;


@property (weak, nonatomic) IBOutlet UIButton *outletRace;
@property (weak, nonatomic) IBOutlet UIButton *outletMaritalStatus;
@property (weak, nonatomic) IBOutlet UIButton *outletReligion;
@property (weak, nonatomic) IBOutlet UIButton *outletNationality;
@property (strong, nonatomic) IBOutlet UIButton *outletGroup;

@property (weak, nonatomic) IBOutlet UIButton *outletProvinsi;
@property (weak, nonatomic) IBOutlet UIButton *outletKota;
@property (weak, nonatomic) IBOutlet UIButton *outletProvinsiOffice;
@property (weak, nonatomic) IBOutlet UIButton *outletKotaOffice;

@property (strong, nonatomic) IBOutlet UIButton *outletTitle;
@property (weak, nonatomic) IBOutlet UITextField *txtrFullName;
@property (weak, nonatomic) IBOutlet UIButton *outletDOB;
@property (strong, nonatomic) IBOutlet UITextField *txtDOB;
@property (strong, nonatomic) IBOutlet UITextField *txtIDType;
@property (strong, nonatomic) IBOutlet UIButton *OtherIDType;
@property (strong, nonatomic) IBOutlet UITextField *txtOtherIDType;
@property (weak, nonatomic) IBOutlet UITextField *txtHomeAddr1;
@property (weak, nonatomic) IBOutlet UITextField *txtHomeAddr2;
@property (weak, nonatomic) IBOutlet UITextField *txtHomeAddr3;
@property (weak, nonatomic) IBOutlet UITextField *txtHomePostCode;
@property (weak, nonatomic) IBOutlet UITextField *txtHomeTown;
@property (weak, nonatomic) IBOutlet UITextField *txtHomeState;
@property (weak, nonatomic) IBOutlet UITextField *txtHomeCountry;
@property (weak, nonatomic) IBOutlet UITextView *txtRemark;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segGender;
@property (strong, nonatomic) IBOutlet UISegmentedControl *segSmoker;
@property (weak, nonatomic) IBOutlet UIButton *outletOccup;
@property (strong, nonatomic) IBOutlet UITextView *txtExactDuties;
@property (strong, nonatomic) IBOutlet UITextField *txtAnnIncome;
@property (strong, nonatomic) IBOutlet UITextField *txtBussinessType;
@property (weak, nonatomic) IBOutlet UILabel *lblOfficeAddr;
@property (weak, nonatomic) IBOutlet UILabel *lblPostCode;
@property (weak, nonatomic) IBOutlet UITextField *txtOfficeAddr1;
@property (weak, nonatomic) IBOutlet UITextField *txtOfficeAddr2;
@property (weak, nonatomic) IBOutlet UITextField *txtOfficeAddr3;
@property (weak, nonatomic) IBOutlet UITextField *txtOfficePostCode;
@property (weak, nonatomic) IBOutlet UITextField *txtOfficeTown;
@property (weak, nonatomic) IBOutlet UITextField *txtOfficeState;
@property (weak, nonatomic) IBOutlet UITextField *txtOfficeCountry;
@property (weak, nonatomic) IBOutlet UITextField *txtPrefix1;
@property (weak, nonatomic) IBOutlet UITextField *txtPrefix2;
@property (weak, nonatomic) IBOutlet UITextField *txtPrefix3;
@property (weak, nonatomic) IBOutlet UITextField *txtPrefix4;
@property (weak, nonatomic) IBOutlet UITextField *txtContact1;
@property (weak, nonatomic) IBOutlet UITextField *txtContact2;
@property (weak, nonatomic) IBOutlet UITextField *txtContact3;
@property (weak, nonatomic) IBOutlet UITextField *txtContact4;
@property (weak, nonatomic) IBOutlet UITextField *txtEmail;
@property (weak, nonatomic) IBOutlet UIButton *outletDelete;
@property (strong, nonatomic) IBOutlet UITextField *txtClass;
@property (strong, nonatomic) IBOutlet UIButton *btnForeignHome;
@property (strong, nonatomic) IBOutlet UIButton *btnForeignOffice;
@property (strong, nonatomic) IBOutlet UIButton *btnOfficeCountry;
@property (strong, nonatomic) IBOutlet UIButton *btnHomeCountry;
@property (nonatomic,assign,readwrite) BOOL edited;
@property (weak, nonatomic) IBOutlet UITextField *txtRigNO;
@property (weak, nonatomic) IBOutlet UITextField *txtRigDate;
@property (strong, nonatomic) IBOutlet UISegmentedControl *segRigPerson;
@property (strong, nonatomic) IBOutlet UISegmentedControl *segRigExempted;
@property (weak, nonatomic) IBOutlet UIButton *outletRigDOB;

@property (weak, nonatomic) IBOutlet UISegmentedControl *SegIsGrouping;
@property (weak, nonatomic) IBOutlet UIButton *AddGroup;
@property (weak, nonatomic) IBOutlet UIButton *ViewGroup;
@property (nonatomic, copy) NSString *isGrouping;

@property (strong, nonatomic) NSMutableArray* ProsGroupArr;
@property (strong, nonatomic) NSUserDefaults *UDGroup;
@property (nonatomic, copy) NSString *ProsGroupStr;

/*added by faiz*/
@property (strong,nonatomic) IBOutlet UIScrollView *scrollViewEditProspect;
@property (strong,nonatomic) IBOutlet UIView *viewReferralInfo;
@property (strong,nonatomic) IBOutlet UIView *viewPersonalInfo;
@property (strong,nonatomic) IBOutlet UIView *viewAddressDetail;
@property (strong,nonatomic) IBOutlet UIView *viewAddressDetailOffice;
@property (strong,nonatomic) IBOutlet UIView *viewOccupationInfo;
@property (strong,nonatomic) IBOutlet UIView *viewOtherInfo;
@property (weak, nonatomic) IBOutlet UITextField *txtNip;
@property (weak, nonatomic) IBOutlet UITextField *txtBranchCode;
@property (weak, nonatomic) IBOutlet UITextField *txtBranchName;
@property (weak, nonatomic) IBOutlet UITextField *txtKanwil;
@property (weak, nonatomic) IBOutlet UITextField *txtKcu;
@property (weak, nonatomic) IBOutlet UITextField *txtChannelName;
@property (weak, nonatomic) IBOutlet UITextField *txtReferralName;
@property (weak, nonatomic) IBOutlet UITextField *txtHomeVillage;
@property (weak, nonatomic) IBOutlet UITextField *txtHomeDistrict;
@property (weak, nonatomic) IBOutlet UITextField *txtHomeProvince;
@property (weak, nonatomic) IBOutlet UITextField *txtOfficeVillage;
@property (weak, nonatomic) IBOutlet UITextField *txtOfficeDistrict;
@property (weak, nonatomic) IBOutlet UITextField *txtOfficeProvince;
@property (weak, nonatomic) IBOutlet UITextField *txtCountryOfBirth;
@property (weak, nonatomic) IBOutlet UIButton *outletReferralSource;
@property (weak, nonatomic) IBOutlet UIButton *outletExpiryDate;
@property (weak, nonatomic) IBOutlet UIButton *outletSourceIncome;
@property (weak, nonatomic) IBOutlet UIButton *outletVIPClass;
@property (weak, nonatomic) IBOutlet UIButton *outletBranchCode;
@property (weak, nonatomic) IBOutlet UIButton *outletBranchName;
@property (strong, nonatomic) IBOutlet UISegmentedControl *segReferralType;
@property (weak, nonatomic) IBOutlet UITextField *txtNPWPNo;
@property (weak, nonatomic) IBOutlet UISwitch *switchCountryHome;
@property (weak, nonatomic) IBOutlet UISwitch *switchCountryOffice;

-(IBAction)textFieldDidChangeEditing:(UITextField *)sender;
-(IBAction)textFieldNIPDidEndEditing:(UITextField *)sender;
- (IBAction)actionProvinsiInfo:(UIButton *)sender;
- (IBAction)actionKotaInfo:(UIButton *)sender;
/*end of added by faiz*/

- (IBAction)actionGrouping:(id)sender;
- (IBAction)addNewGroup:(id)sender;
- (IBAction)ViewGroup:(id)sender;

- (IBAction)actionNationality:(id)sender;
- (IBAction)actionRace:(id)sender;
- (IBAction)actionMaritalStatus:(id)sender;
- (IBAction)actionReligion:(id)sender;
- (IBAction)ActionHomeCountry:(id)sender;

- (IBAction)ActionOfficeCountry:(id)sender;
- (IBAction)isForeign:(id)sender;
- (IBAction)btnGroup:(id)sender;
- (IBAction)btnTitle:(id)sender;
- (IBAction)btnDOB:(id)sender;
- (IBAction)btnOtherIDType:(id)sender;
- (IBAction)ActionGender:(id)sender;
- (IBAction)ActionSmoker:(id)sender;
- (IBAction)btnOccup:(id)sender;
- (IBAction)btnDelete:(id)sender;
- (IBAction)ActionRigPerson:(id)sender;
- (IBAction)ActionRigDate:(id)sender;

@property (weak, nonatomic) IBOutlet UIButton *BtnCountryOfBirth;
- (IBAction)actionCountryOfBirth:(id)sender;

- (IBAction)ActionforRegDate:(id)sender;
- (IBAction)ActionExempted:(id)sender;

@property (strong, nonatomic) IBOutlet UIButton *btnregDate;

@property (nonatomic, copy) NSString *gender;
@property (nonatomic, copy) NSString *DOB;
@property (nonatomic, copy) NSString *IDTypeCodeSelected;
@property (nonatomic, copy) NSString *IDTypeIdentifierSelected;
@property (nonatomic, copy) NSString *TitleCodeSelected;
@property (nonatomic, copy) NSString *OccpCatCode;
@property (nonatomic, copy) NSString *OccupCodeSelected;
@property (nonatomic, copy) NSString *SelectedStateCode;
@property (nonatomic, copy) NSString *SelectedOfficeStateCode;
@property (nonatomic, copy) NSString *strChanges;
@property (nonatomic, copy) NSString *ClientSmoker;

-(void)keyboardDidShow:(NSNotificationCenter *)notification;
-(void)keyboardDidHide:(NSNotificationCenter *)notification;

-(void)SaveEdit2;
-(void)check_edited;
-(void)EditTextFieldDidChange:(id) sender;

@end
