//
//  GroupViewVC.h
//  MPOS
//
//  Created by Emi on 16/12/14.
//  Copyright (c) 2014 InfoConnect Sdn Bhd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FMDatabase.h"
@class GroupViewVC;
@protocol GroupViewVCDelegate

@end

@interface GroupViewVC : UIViewController <UITableViewDelegate,UITableViewDataSource>

{
    
    NSMutableArray *groupArr;
    FMDatabase *db;
	
}

@property (strong, nonatomic) IBOutlet UIBarButtonItem *Backbtn;
@property (weak, nonatomic) IBOutlet UILabel *LblTitle;
@property (weak, nonatomic) IBOutlet UITableView *tableViewGroup;

@property (strong, nonatomic) NSUserDefaults *UDGroup;

- (IBAction)backPressed:(id)sender;

@end
