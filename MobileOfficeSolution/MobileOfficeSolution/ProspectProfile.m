//
//  ProspectProfile.m
//  MPOS
//
//  Created by Md. Nazmus Saadat on 10/1/12.
//  Copyright (c) 2012 InfoConnect Sdn Bhd. All rights reserved.
//

#import "ProspectProfile.h"

@implementation ProspectProfile

@synthesize NickName;
@synthesize ProspectEmail;
@synthesize ProspectGender;
@synthesize ProspectName;
@synthesize ProspectOccupationCode;
@synthesize ProspectRemark;
@synthesize ResidenceAddress1, ResidenceAddress2, ResidenceAddress3, OfficeAddress1;
@synthesize ResidenceAddressCountry;
@synthesize ResidenceAddressPostCode;
@synthesize ResidenceAddressTown;
@synthesize OfficeAddress2, OfficeAddress3, ExactDuties;
@synthesize DateCreated,DateModified,CreatedBy,ModifiedBy;
@synthesize OfficeAddressCountry;
@synthesize OfficeAddressPostCode;
@synthesize OfficeAddressTown;
@synthesize ProspectDOB;
@synthesize ProspectID;
@synthesize ResidenceAddressState;
@synthesize OfficeAddressState;
@synthesize ProspectGroup,ProspectTitle,IDTypeNo,OtherIDTypeNo,OtherIDType,Smoker,Race,MaritalStatus,Religion,Nationality, registrationNo,registration,registrationDate,registrationExempted, prospect_IsGrouping, countryOfBirth;

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
AndProspectDOB:(NSString*)TheProspectDOB AndExactDuties:(NSString*)TheExactDuties AndGroup:(NSString *)TheGroup AndTitle:(NSString *)TheTitle AndIDTypeNo:(NSString *)TheIDTypeNo AndOtherIDType:(NSString *)TheOtherIDType AndOtherIDTypeNo:(NSString *)TheOtherIDTypeNo AndSmoker:(NSString *)TheSmoker AndAnnIncome:(NSString *)TheIncome AndBussType:(NSString *)TheBussType AndRace:(NSString*)TheRace AndMaritalStatus:(NSString*)TheMaritalStatus AndReligion:(NSString*)TheReligion AndNationality:(NSString*)TheNationality AndRegistrationNo:(NSString*)TheRegistrationNo AndRegistration:(NSString*)TheRegistration AndRegistrationDate:(NSString*)TheRegistrationDate AndRegistrationExempted:(NSString*)TheRegistrationExempted AndProspect_IsGrouping:(NSString*)TheProspect_IsGrouping AndCountryOfBirth:(NSString *)TheCountryOfBirth AndNIP:(NSString *)TheNIP AndBranchCode:(NSString *)TheBranchCode AndBranchName:(NSString *)TheBranchName AndKCU:(NSString *)TheKCU AndReferralSource:(NSString *)TheReferralSource AndReferralName:(NSString *)TheReferralName AndIdentitySubmitted:(NSString *)TheIdentitySubmitted AndIDExpirityDate:(NSString *)TheIDExpirityDate AndNPWPNo:(NSString *)TheNPWPNo AndKanwil:(NSString *)kanwil AndHomeVillage:(NSString *)homeVillage AndHomeDistrict:(NSString *)homeDistrict AndHomeProvince:(NSString *)homeProvince AndOfficeVillage:(NSString *)officeVillage AndOfficeDistrict:(NSString *)officeDistrict AndOfficePorvince:(NSString *)officeProvince AndSourceIncome:(NSString *)sourceIncome AndClientSegmentation:(NSString *)clientSegmentation
{
    self = [super init];
    if(self)
    {
        self.ProspectID = TheProspectID;
        self.NickName = TheNickName;
        self.ProspectName = TheProspectName;
        self.ProspectEmail = TheProspectEmail;
        self.ProspectGender = TheProspectGender;
        self.ProspectOccupationCode = TheProspectOccupationCode;
        self.ProspectRemark = TheProspectRemark;
        self.ResidenceAddress1 = TheResidenceAddress1;
        self.ResidenceAddress2 = TheResidenceAddress2;
        self.ResidenceAddress3 = TheResidenceAddress3;
        self.ResidenceAddressCountry = TheResidenceAddressCountry;
        self.ResidenceAddressPostCode = TheResidenceAddressPostCode;
        self.ResidenceAddressTown = TheResidenceAddressTown;
        self.OfficeAddress1 = TheOfficeAddress1;
        self.OfficeAddress2 = TheOfficeAddress2;
        self.OfficeAddress3 = TheOfficeAddress3;
        self.OfficeAddressCountry = TheOfficeAddressCountry;
        self.OfficeAddressPostCode = TheOfficeAddressPostCode;
        self.OfficeAddressTown = TheOfficeAddressTown;
        self.ProspectDOB = TheProspectDOB;
        self.ResidenceAddressState = TheResidenceAddressState;
        self.OfficeAddressState = TheOfficeAddressState;
        self.ExactDuties = TheExactDuties;
        self.ProspectGroup = TheGroup;
        self.ProspectTitle = TheTitle;
        self.IDTypeNo = TheIDTypeNo;
        self.OtherIDType = TheOtherIDType;
        self.OtherIDTypeNo = TheOtherIDTypeNo;
        self.Smoker = TheSmoker;
        self.AnnualIncome = TheIncome;
        self.BussinessType = TheBussType;
        self.Race = TheRace;
        self.MaritalStatus = TheMaritalStatus;
        self.Nationality = TheNationality;
        self.Religion = TheReligion;
        //basvi added
        self.DateCreated = TheDateCreated;
        self.DateModified = TheDateModified;
        self.CreatedBy = TheDateModified;
        self.ModifiedBy = TheModifiedBy;
        //
		self.registrationNo = TheRegistrationNo;
        self.registration = TheRegistration;
        self.registrationDate = TheRegistrationDate;
        self.registrationExempted = TheRegistrationExempted;
		
		self.prospect_IsGrouping = TheProspect_IsGrouping;
		self.countryOfBirth = TheCountryOfBirth;
        
        self.NIP = TheNIP;
        self.BranchCode = TheBranchCode;
        self.BranchName = TheBranchName;
        self.KCU = TheKCU;
        self.ReferralSource = TheReferralSource;
        self.ReferralName = TheReferralName;
        self.IdentitySubmitted = TheIdentitySubmitted;
        self.IDExpirityDate = TheIDExpirityDate;
        self.NPWPNo = TheNPWPNo;
        self.Kanwil = kanwil;
        self.HomeVillage = homeVillage;
        self.HomeDistrict = homeDistrict;
        self.HomeProvicne = homeProvince;
        self.OfficeVillage = officeVillage;
        self.OfficeDistrict = officeDistrict;
        self.OfficeProvicne = officeProvince;
        self.SourceIncome = sourceIncome;
        self.ClientSegmentation = clientSegmentation;

    }
    return self;
}


@end
