//
//  ProspectProfile.h
//  MPOS
//
//  Created by Md. Nazmus Saadat on 10/1/12.
//  Copyright (c) 2012 InfoConnect Sdn Bhd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ProspectProfile : NSObject

@property (nonatomic, retain) NSString* ProspectID;
@property (nonatomic, retain) NSString* NickName;
@property (nonatomic, retain) NSString* ProspectName;
@property (nonatomic, retain) NSString* ProspectGender;
@property (nonatomic, retain) NSString* ProspectDOB;
@property (nonatomic, retain) NSString* ResidenceAddress1;
@property (nonatomic, retain) NSString* ResidenceAddress2;
@property (nonatomic, retain) NSString* ResidenceAddress3;
@property (nonatomic, retain) NSString* ResidenceAddressTown;
@property (nonatomic, retain) NSString* ResidenceAddressState;
@property (nonatomic, retain) NSString* ResidenceAddressPostCode;
@property (nonatomic, retain) NSString* ResidenceAddressCountry;
@property (nonatomic, retain) NSString* OfficeAddress1;
@property (nonatomic, retain) NSString* OfficeAddress2;
@property (nonatomic, retain) NSString* OfficeAddress3;
@property (nonatomic, retain) NSString* OfficeAddressTown;
@property (nonatomic, retain) NSString* OfficeAddressState;
@property (nonatomic, retain) NSString* OfficeAddressPostCode;
@property (nonatomic, retain) NSString* OfficeAddressCountry;
@property (nonatomic, retain) NSString* ProspectEmail;
@property (nonatomic, retain) NSString* ProspectRemark;
//basvi added
@property (nonatomic, retain) NSString* DateCreated;
@property (nonatomic, retain) NSString* CreatedBy;
@property (nonatomic, retain) NSString* DateModified;
@property (nonatomic, retain) NSString* ModifiedBy;

//
@property (nonatomic, retain) NSString* ProspectOccupationCode;
@property (nonatomic, retain) NSString* ExactDuties;
@property (nonatomic, retain) NSString* ProspectGroup;
@property (nonatomic, retain) NSString* ProspectTitle;
@property (nonatomic, retain) NSString* IDTypeNo;
@property (nonatomic, retain) NSString* OtherIDType;
@property (nonatomic, retain) NSString* OtherIDTypeNo;
@property (nonatomic, retain) NSString* Smoker;
@property (nonatomic, retain) NSString* AnnualIncome;
@property (nonatomic, retain) NSString* BussinessType;
@property (nonatomic, retain) NSString* Race;
@property (nonatomic, retain) NSString* MaritalStatus;
@property (nonatomic, retain) NSString* Religion;
@property (nonatomic, retain) NSString* Nationality;

@property (nonatomic, retain) NSString* registrationNo;
@property (nonatomic, retain) NSString* registration;
@property (nonatomic, retain) NSString* registrationDate;
@property (nonatomic, retain) NSString* registrationExempted;

@property (nonatomic, retain) NSString* prospect_IsGrouping;
@property (nonatomic, retain) NSString* countryOfBirth;

/*added by faiz*/
@property (nonatomic, retain) NSString* NIP;
@property (nonatomic, retain) NSString* BranchCode;
@property (nonatomic, retain) NSString* BranchName;
@property (nonatomic, retain) NSString* KCU;
@property (nonatomic, retain) NSString* ReferralSource;
@property (nonatomic, retain) NSString* ReferralName;
@property (nonatomic, retain) NSString* IdentitySubmitted;
@property (nonatomic, retain) NSString* IDExpirityDate;
@property (nonatomic, retain) NSString* NPWPNo;
@property (nonatomic, retain) NSString* Kanwil;
@property (nonatomic, retain) NSString* HomeVillage;
@property (nonatomic, retain) NSString* HomeDistrict;
@property (nonatomic, retain) NSString* HomeProvicne;
@property (nonatomic, retain) NSString* OfficeVillage;
@property (nonatomic, retain) NSString* OfficeDistrict;
@property (nonatomic, retain) NSString* OfficeProvicne;
@property (nonatomic, retain) NSString* SourceIncome;
@property (nonatomic, retain) NSString* ClientSegmentation;
/*end of added by faiz*/






/*-(id) initWithName:(NSString*) TheNickName AndProspectID:(NSString*)TheProspectID AndProspectName:(NSString*)TheProspectName
  AndProspecGender:(NSString*)TheProspectGender AndResidenceAddress1:(NSString*)TheResidenceAddress1
AndResidenceAddress2:(NSString*)TheResidenceAddress2 AndResidenceAddress3:(NSString*)TheResidenceAddress3
AndResidenceAddressTown:(NSString*)TheResidenceAddressTown AndResidenceAddressState:(NSString*)TheResidenceAddressState
AndResidenceAddressPostCode:(NSString*)TheResidenceAddressPostCode
AndResidenceAddressCountry:(NSString*)TheResidenceAddressCountry AndOfficeAddress1:(NSString*)TheOfficeAddress1
 AndOfficeAddress2:(NSString*)TheOfficeAddress2 AndOfficeAddress3:(NSString*)TheOfficeAddress3
AndOfficeAddressTown:(NSString*)TheOfficeAddressTown AndOfficeAddressState:(NSString*)TheOfficeAddressState
AndOfficeAddressPostCode:(NSString*)TheOfficeAddressPostCode
AndOfficeAddressCountry:(NSString*)TheOfficeAddressCountry AndProspectEmail:(NSString*)TheProspectEmail AndProspectRemark:(NSString*)TheProspectRemark AndDateCreated:(NSString*)TheDateCreated AndDateModified:(NSString*)TheDateModified AndCreatedBy:(NSString*)TheCreatedBy AndModifiedBy:(NSString*)TheModifiedBy AndProspectOccupationCode:(NSString*)TheProspectOccupationCode
AndProspectDOB:(NSString*)TheProspectDOB AndExactDuties:(NSString*)TheExactDuties AndGroup:(NSString *)TheGroup AndTitle:(NSString *)TheTitle AndIDTypeNo:(NSString *)TheIDTypeNo AndOtherIDType:(NSString *)TheOtherIDType AndOtherIDTypeNo:(NSString *)TheOtherIDTypeNo AndSmoker:(NSString *)TheSmoker AndAnnIncome:(NSString *)TheIncome AndBussType:(NSString *)TheBussType AndRace:(NSString*)TheRace AndMaritalStatus:(NSString*)TheMaritalStatus AndReligion:(NSString*)TheReligion AndNationality:(NSString*)TheNationality AndRegistrationNo:(NSString*)TheRegistrationNo AndRegistration:(NSString*)TheRegistration AndRegistrationDate:(NSString*)TheRegistrationDate AndRegistrationExempted:(NSString*)TheRegistrationExempted AndProspect_IsGrouping:(NSString*)TheProspect_IsGrouping AndCountryOfBirth:(NSString*)CountryOfBirth;*/
-(id) initWithName:(NSString*) TheNickName AndProspectID:(NSString*)TheProspectID AndProspectName:(NSString*)TheProspectName
  AndProspecGender:(NSString*)TheProspectGender AndResidenceAddress1:(NSString*)TheResidenceAddress1
AndResidenceAddress2:(NSString*)TheResidenceAddress2 AndResidenceAddress3:(NSString*)TheResidenceAddress3
AndResidenceAddressTown:(NSString*)TheResidenceAddressTown AndResidenceAddressState:(NSString*)TheResidenceAddressState
AndResidenceAddressPostCode:(NSString*)TheResidenceAddressPostCode
AndResidenceAddressCountry:(NSString*)TheResidenceAddressCountry AndOfficeAddress1:(NSString*)TheOfficeAddress1
 AndOfficeAddress2:(NSString*)TheOfficeAddress2 AndOfficeAddress3:(NSString*)TheOfficeAddress3
AndOfficeAddressTown:(NSString*)TheOfficeAddressTown AndOfficeAddressState:(NSString*)TheOfficeAddressState
AndOfficeAddressPostCode:(NSString*)TheOfficeAddressPostCode
AndOfficeAddressCountry:(NSString*)TheOfficeAddressCountry AndProspectEmail:(NSString*)TheProspectEmail AndProspectRemark:(NSString*)TheProspectRemark AndDateCreated:(NSString*)TheDateCreated AndDateModified:(NSString*)TheDateModified AndCreatedBy:(NSString*)TheCreatedBy AndModifiedBy:(NSString*)TheModifiedBy AndProspectOccupationCode:(NSString*)TheProspectOccupationCode
    AndProspectDOB:(NSString*)TheProspectDOB AndExactDuties:(NSString*)TheExactDuties AndGroup:(NSString *)TheGroup AndTitle:(NSString *)TheTitle AndIDTypeNo:(NSString *)TheIDTypeNo AndOtherIDType:(NSString *)TheOtherIDType AndOtherIDTypeNo:(NSString *)TheOtherIDTypeNo AndSmoker:(NSString *)TheSmoker AndAnnIncome:(NSString *)TheIncome AndBussType:(NSString *)TheBussType AndRace:(NSString*)TheRace AndMaritalStatus:(NSString*)TheMaritalStatus AndReligion:(NSString*)TheReligion AndNationality:(NSString*)TheNationality AndRegistrationNo:(NSString*)TheRegistrationNo AndRegistration:(NSString*)TheRegistration AndRegistrationDate:(NSString*)TheRegistrationDate AndRegistrationExempted:(NSString*)TheRegistrationExempted AndProspect_IsGrouping:(NSString*)TheProspect_IsGrouping AndCountryOfBirth:(NSString *)TheCountryOfBirth AndNIP:(NSString *)TheNIP AndBranchCode:(NSString *)TheBranchCode AndBranchName:(NSString *)TheBranchName AndKCU:(NSString *)TheKCU AndReferralSource:(NSString *)TheReferralSource AndReferralName:(NSString *)TheReferralName AndIdentitySubmitted:(NSString *)TheIdentitySubmitted AndIDExpirityDate:(NSString *)TheIDExpirityDate AndNPWPNo:(NSString *)TheNPWPNo AndKanwil:(NSString *)kanwil AndHomeVillage:(NSString *)homeVillage AndHomeDistrict:(NSString *)homeDistrict AndHomeProvince:(NSString *)homeProvince AndOfficeVillage:(NSString *)officeVillage AndOfficeDistrict:(NSString *)officeDistrict AndOfficePorvince:(NSString *)officeProvince AndSourceIncome:(NSString *)sourceIncome AndClientSegmentation:(NSString *)clientSegmentation;

@end
