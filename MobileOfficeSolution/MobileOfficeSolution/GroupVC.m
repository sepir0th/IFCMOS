//
//  GroupVC.m
//  MPOS
//
//  Created by Emi on 21/11/14.
//  Copyright (c) 2014 InfoConnect Sdn Bhd. All rights reserved.
//

#import "GroupVC.h"

#import "ColorHexCode.h"
#import "ListingTbViewController.h"

@interface GroupVC (){
     UIColor *borderColor;
}

@end

@implementation GroupVC	
@synthesize Delete,Cancel, donebtn, Backbtn, AddNew, TitleBar, itemToBeDeleted, indexPaths;
@synthesize GroupName, tableView;
@synthesize prospectPopover = _prospectPopover;
@synthesize titleGroup;
@synthesize UDGroup;
@synthesize delegateGroup;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
	UDGroup = [NSUserDefaults standardUserDefaults];
	borderColor=[[UIColor alloc]initWithRed:250.0/255.0 green:175.0/255.0 blue:50.0/255.0 alpha:1.0];
    
    [super viewDidLoad];
    GroupName.layer.borderColor=borderColor.CGColor;
    GroupName.layer.borderWidth=1.0;
//	GroupName.delegate = self;
	
	[Cancel setTitle:@"Delete" forState:UIControlStateNormal];
	Delete.hidden = YES;
	itemToBeDeleted = [NSMutableArray array];[NSMutableArray array];
	indexPaths = [NSMutableArray array];
	
	[self LoadDataTable];

}

- (void) LoadDataTable {
	
	member = [NSMutableArray array];
	
	TitleBar.text = [UDGroup stringForKey:@"GroupTitle"];
	
	if ([TitleBar.text isEqualToString:@"Edit Group"]) {
		
		GroupName.text = [self.data objectForKey:@"name"];
		
		NSArray *dirPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
		NSString *docsDir = [dirPaths objectAtIndex:0];
		NSString *databasePath = [[NSString alloc] initWithString: [docsDir stringByAppendingPathComponent: @"MOSDB.sqlite"]];
		
		db = [FMDatabase databaseWithPath:databasePath];
		[db open];
		
		NSString *queryStr = [NSString stringWithFormat:@"select IndexNo, ProspectName from prospect_profile where (ProspectGroup = %@ OR ProspectGroup LIKE '%%,%@' OR ProspectGroup LIKE '%@,%%' OR ProspectGroup LIKE '%%,%@,%%') order by ProspectName ASC", [self.data objectForKey:@"id"], [self.data objectForKey:@"id"], [self.data objectForKey:@"id"], [self.data objectForKey:@"id"]];
		FMResultSet *result = [db executeQuery:queryStr];
		
//		FMResultSet *result = [db executeQuery:@"select IndexNo, ProspectName from prospect_profile where ProspectGroup = ? order by ProspectName ASC", [self.data objectForKey:@"id"]];
		
//		FMResultSet *result = [db executeQuery:@"select IndexNo, ProspectName from prospect_profile"];
		
		while ([result next]) {
			NSDictionary *tempData = [[NSDictionary alloc] initWithObjectsAndKeys:[result objectForColumnName:@"IndexNo"], @"id", [result objectForColumnName:@"ProspectName"], @"name", nil];
			[member addObject:[tempData copy]];
		}
		
		[db close];
		
		[self.tableView reloadData];
		isSave = YES;
	}
}

#pragma mark - Action

- (IBAction)donePressed:(id)sender {
	
	BOOL success = NO;
	NSString *prosGroup;
	BOOL toUpdate;
	NSString *msg;
    NSString *Trim_GroupName = [GroupName.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    
	if (!db) {
		NSArray *dirPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
		NSString *docsDir = [dirPaths objectAtIndex:0];
		NSString *databasePath = [[NSString alloc] initWithString: [docsDir stringByAppendingPathComponent: @"MOSDB.sqlite"]];
		db = [FMDatabase databaseWithPath:databasePath];
	}
	[db open];
	
	//check edit/create new
	NSString *pID;
	
	if ([TitleBar.text isEqualToString:@"New"]) {
        
		if ([self CheckValidation]) {
            
            if([self groupName:Trim_GroupName] == 1){
                [db executeUpdate:[NSString stringWithFormat:@"INSERT INTO prospect_groups (name) values ('%@')", Trim_GroupName]];
                
                FMResultSet *result = [db executeQuery:@"select seq from sqlite_sequence where name = 'prospect_groups'"];
                while ([result next]) {
                    pID = [result stringForColumn:@"seq"];
                }
                
                int i = 0;
                while (i < member.count) {
                    
                    NSString *qtr = [NSString stringWithFormat:@"select prospectGroup from prospect_profile WHERE IndexNo = %@", [[member objectAtIndex:i] objectForKey:@"id"]];
                    FMResultSet *result = [db executeQuery:qtr];
                    while ([result next]) {
                        prosGroup = [result stringForColumn:@"prospectGroup"];
                    }
                    if (![prosGroup isEqualToString:@""])
                        prosGroup = [NSString stringWithFormat:@"%@,%@", prosGroup, pID];
                    else
                        prosGroup = pID;
                    
                    [db executeUpdate:[NSString stringWithFormat:@"UPDATE prospect_profile SET ProspectGroup = '%@', Prospect_isGrouping = 'Y'  WHERE IndexNo = %@", prosGroup, [[member objectAtIndex:i] objectForKey:@"id"]]];
                    i = i + 1;
                }
                success = YES;
                msg = @"Group baru berhasil dibuat.";
            }
		}
		
	}
	
	else if ([TitleBar.text isEqualToString:@"Edit Group"]) {
		if ([self CheckValidation]) {
			
			[db executeUpdate:[NSString stringWithFormat:@"UPDATE prospect_groups SET name = '%@'  WHERE ID = %@", Trim_GroupName, [self.data objectForKey:@"id"]]];
			
			int i = 0;
			while (i < member.count) {
				toUpdate = YES;
				prosGroup = @"";
				
				NSString *QueryStr = [NSString stringWithFormat:@"select prospectGroup from prospect_profile WHERE IndexNo = %@ and (ProspectGroup = %@ OR ProspectGroup LIKE '%%,%@' OR ProspectGroup LIKE '%@,%%' OR ProspectGroup LIKE '%%,%@,%%')", [[member objectAtIndex:i] objectForKey:@"id"], [self.data objectForKey:@"id"], [self.data objectForKey:@"id"], [self.data objectForKey:@"id"], [self.data objectForKey:@"id"]];
				FMResultSet *resultCheck = [db executeQuery:QueryStr];
				while ([resultCheck next]) {
					toUpdate = NO;
				}
				
				//No need to update if already belongs to group
				if (toUpdate) {
					
					NSString *qtr = [NSString stringWithFormat:@"select prospectGroup from prospect_profile WHERE IndexNo = %@", [[member objectAtIndex:i] objectForKey:@"id"]];
					FMResultSet *result2 = [db executeQuery:qtr];
					
					while ([result2 next]) {
						prosGroup = [result2 stringForColumn:@"prospectGroup"];
					}
					
					NSLog(@"ashdoaihsd %@",prosGroup);
					
					if (![prosGroup isEqualToString:@""]) {
						prosGroup = [NSString stringWithFormat:@"%@,%@", prosGroup, [self.data objectForKey:@"id"]];
					}
					else {
						prosGroup = [self.data objectForKey:@"id"];
					}
					
					NSString *strUpdate = [NSString stringWithFormat:@"UPDATE prospect_profile SET ProspectGroup = '%@', Prospect_isGrouping = '%@'  WHERE IndexNo = %@", prosGroup, @"Y", [[member objectAtIndex:i] objectForKey:@"id"]];
					
					[db executeUpdate:strUpdate];
					NSLog(@"asd: %@", strUpdate);
				}
				i = i + 1;
			}
			
			success = YES;
			msg = @"Group baru berhasil diperbarui.";
            [delegateGroup clearSearchGroup];
		}
	}
	
	[db close];
	
	if (success) {
		[self hideKeyboard];
		isSave = YES;
		UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@" " message:msg delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
		alert.tag = 1000;
		[alert show];
		[[NSNotificationCenter defaultCenter] postNotificationName:@"ReloadData" object:self];
	}
}

-(int)groupName:(NSString *)newName
{
    sqlite3 *contactDB;
    sqlite3_stmt *statement;
    
    NSArray *dirPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docsDir = [dirPaths objectAtIndex:0];
    NSString *databasePath = [[NSString alloc] initWithString: [docsDir stringByAppendingPathComponent: @"MOSDB.sqlite"]];
    if (sqlite3_open([databasePath UTF8String ], &contactDB) == SQLITE_OK)
    {
        NSString *querySQL = [NSString stringWithFormat: @"SELECT name FROM prospect_groups"];
        
        if (sqlite3_prepare_v2(contactDB, [querySQL UTF8String], -1, &statement, NULL) == SQLITE_OK){
            while (sqlite3_step(statement) == SQLITE_ROW) {
                if((const char *) sqlite3_column_text(statement, 0) != NULL){
                    if([newName caseInsensitiveCompare:([[NSString alloc]
                            initWithUTF8String:
                        (const char *) sqlite3_column_text(statement, 0)])] == NSOrderedSame){
                        UIAlertView* alert = [[UIAlertView alloc]initWithTitle:@"" message:[NSString stringWithFormat:@"Anda tidak dapat memasukan nama group yang telah ada sebelum nya"] delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
                        [alert show];
                        return 0;
                    }
                }
            }
            sqlite3_finalize(statement);
        }
        sqlite3_close(contactDB);
    }
    return 1;
}


-(void)hideKeyboard{
    
	Class UIKeyboardImpl = NSClassFromString(@"UIKeyboardImpl");
	id activeInstance = [UIKeyboardImpl performSelector:@selector(activeInstance)];
	[activeInstance performSelector:@selector(dismissKeyboard)];
    
}

-(BOOL) CountMember {
	
	int count = 0;
	
	if (!db) {
		NSArray *dirPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
		NSString *docsDir = [dirPaths objectAtIndex:0];
		NSString *databasePath = [[NSString alloc] initWithString: [docsDir stringByAppendingPathComponent: @"MOSDB.sqlite"]];
		db = [FMDatabase databaseWithPath:databasePath];
	}
	[db open];
	
	
	FMResultSet *result = [db executeQuery:@"SELECT count (*) as count FROM prospect_profile where ProspectGroup = '%@'", [self.data objectForKey:@"id"]];
	while ([result next]) {
		count = [[result stringForColumn:@"count"] integerValue];
	}
	
	[db close];
	
	if (count == 0)
		return FALSE;
	else if (count > 0)
		return TRUE;
	
	return nil;
}

- (IBAction)backPressed:(id)sender{
	
	[self hideKeyboard];
	
	NSString *Trim_GroupName = [GroupName.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
	if ([titleGroup isEqualToString:@"New"] && (Trim_GroupName.length != 0 || member.count != 0)) {
		UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@" " message:@"Apakah Anda ingin save?" delegate:self cancelButtonTitle:@"Yes" otherButtonTitles:@"No", nil];
		[alert setTag:1003];
		[alert show];
	}
	else if (!isSave) {
		UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@" " message:@"Apakah Anda ingin save?" delegate:self cancelButtonTitle:@"Yes" otherButtonTitles:@"No", nil];
		[alert setTag:1003];
		[alert show];
	}
	else if (Trim_GroupName.length != 0 && member.count == 0) {
		UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@" " message:@"Dibutuhkan minimal 1 anggota untuk membuat group." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
		[alert show];
	}
	else {
		[self dismissModalViewControllerAnimated:YES];
	}

}

- (IBAction)AddNewPress:(id)sender {
	
	CGRect frame = CGRectMake(150, 40, 370, 160);
	
//	if (_ProspectList == nil) {
		self.ProspectList = [[ListingTbViewController alloc] initWithStyle:UITableViewStylePlain];
		_ProspectList.delegate = self;
		_ProspectList.needFiltered = NO;
		_ProspectList.SIOrEAPPS = @"GROUP";
//	}
	
	if (member.count !=0) {
		NSString *blacklist = @"";
		_ProspectList.needFiltered = YES;
		for (int i = 0; i <= member.count-1; i++) {
			if (i==0)
				blacklist = [[member objectAtIndex:i] objectForKey:@"id"];
			else 
				blacklist = [NSString stringWithFormat:@"%@,%@", blacklist, [[member objectAtIndex:i] objectForKey:@"id"]];
		}
		NSLog(@"indxNO: %@", blacklist);
		_ProspectList.blacklistedIndentificationNos = blacklist;
	}
	
	
	self.prospectPopover = [[UIPopoverController alloc] initWithContentViewController:_ProspectList];
	
	[self.prospectPopover presentPopoverFromRect:frame inView:self.view permittedArrowDirections:UIPopoverArrowDirectionLeft animated:YES];
	
}

-(void)listing:(ListingTbViewController *)inController didSelectIndex:(NSString *)aaIndex andName:(NSString *)aaName andDOB:(NSString *)aaDOB andGender:(NSString *)aaGender andOccpCode:(NSString *)aaCode andSmoker:(NSString *)aaSmoker andMaritalStatus:(NSString *)aaaMaritalStatus
{
	
	NSDictionary *tempData = [[NSDictionary alloc] initWithObjectsAndKeys:aaIndex, @"id", aaName, @"name", nil];
	[member addObject:[tempData copy]];
	
	[self.prospectPopover dismissPopoverAnimated:YES];
	[self.tableView reloadData];
	
	//UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@" " message:@"Customer selected has been successfully added into Group." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
	UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@" " message:@"Pelanggan yang dipilih berhasil ditambahkan ke group." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [alert show];
	
	isSave = NO;
}

- (IBAction)CancelPressed:(id)sender{
	
	if ([Cancel.titleLabel.text isEqualToString:@"Delete"]) {
		[Cancel setTitle:@"Cancel" forState:UIControlStateNormal];
		Delete.hidden = NO;
		[self.tableView setEditing:YES animated:TRUE];
	}
	else {
		[Cancel setTitle:@"Delete" forState:UIControlStateNormal];
		Delete.hidden = YES;
		[self.tableView setEditing:NO animated:TRUE];
	}
	
}

- (IBAction)DeletePressed:(id)sender{
	
    int RecCount = 0;
    
    NSString *ss;

	
    for (UITableViewCell *cell in [self.tableView visibleCells])
    {
				
        if (cell.selected == TRUE) {
            NSIndexPath *selectedIndexPath = [self.tableView indexPathForCell:cell];
            if (RecCount == 0) {
                ss = [[member objectAtIndex:selectedIndexPath.row] objectForKey:@"name"];
            }
			
            RecCount = RecCount + 1;
        }
    }
	
		   
    if (RecCount == member.count)
    {
      //  NSString *Row0 =[itemToBeDeleted objectAtIndex:0];
        
        NSString *GroupAlert=[NSString stringWithFormat:@"Group %@ akan otomatis dihapus oleh sistem karena tidak adanya anggota pada group ini.",ss];
        
		UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@" " message:GroupAlert delegate:self cancelButtonTitle:@"Yes" otherButtonTitles:@"No", nil];
		[alert setTag:8001];
		[alert show];
        
       
	}
    
    else if (RecCount >= 1) {
		UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@" " message:@"Apakah Anda yakin akan menghapus member pada group ini?" delegate:self cancelButtonTitle:@"Yes" otherButtonTitles:@"No", nil];
		[alert setTag:1001];
		[alert show];
	}

    
    else {
		UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@" " message:@"Silakan pilih minimal satu anggota untuk menghapus." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
		[alert show];
	}


	
}

#pragma mark - Table view delegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	return member.count;
}

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Remove seperator inset
    if ([cell respondsToSelector:@selector(setSeparatorInset:)]) {
        [cell setSeparatorInset:UIEdgeInsetsZero];
    }
    
    // Prevent the cell from inheriting the Table View's margin settings
    if ([cell respondsToSelector:@selector(setPreservesSuperviewLayoutMargins:)]) {
        [cell setPreservesSuperviewLayoutMargins:NO];
    }
    
    // Explictly set your cell's layout margins
    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
        [cell setLayoutMargins:UIEdgeInsetsZero];
    }
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSMutableArray *tempArray = nil;

	tempArray = member;
    

    static NSString *CellIdentifier = @"Cell";
	
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell==nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
        
    }
    
    
    // Configure the cell...
    cell.textLabel.text = [[tempArray objectAtIndex:indexPath.row] objectForKey:@"name"];
    cell.textLabel.font = [UIFont fontWithName:@"BPreplay" size:14];
    cell.textLabel.textColor = [UIColor colorWithRed:128.0f/255.0f
                                       green:130.0f/255.0f blue:133.0f/255.0f alpha:1];
	
	/*ColorHexCode *CustomColor = [[ColorHexCode alloc]init ];
	if (indexPath.row % 2 == 0) {
        cell.backgroundColor = [CustomColor colorWithHexString:@"D0D8E8"];
    }
    else {
        cell.backgroundColor = [CustomColor colorWithHexString:@"E9EDF4"];
    }*/
    
//    cell.selectionStyle = UITableViewCellSelectionStyleGray;
	
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	if ([self.tableView isEditing] == TRUE ) {
        BOOL gotRowSelected = FALSE;
        
        for (UITableViewCell *zzz in [self.tableView visibleCells])
        {
            if (zzz.selected  == TRUE) {
                gotRowSelected = TRUE;
                break;
            }
        }
        
        if (!gotRowSelected) {
            [Delete setTitleColor:[UIColor grayColor] forState:UIControlStateNormal ];
            Delete.enabled = FALSE;
        }
        else {
            [Delete setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            Delete.enabled = TRUE;
        }
        
        NSString *zzz = [NSString stringWithFormat:@"%d", indexPath.row];
        [itemToBeDeleted addObject:zzz];
        
        NSMutableArray *tempArray = nil;
        
        tempArray = member;

        
      //  NSString *indexpathrowName = [NSString stringWithFormat:@"%@",[tempArray objectAtIndex:indexPath.row] objectForKey:@"name"]];
        
//        [indexPaths addObject:indexPath];
    }
	
}

-(void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([self.tableView isEditing] == TRUE ) {
        BOOL gotRowSelected = FALSE;
        
        for (UITableViewCell *zzz in [self.tableView visibleCells])
        {
            if (zzz.selected  == TRUE) {
                gotRowSelected = TRUE;
                break;
            }
        }
        
        if (!gotRowSelected) {
            [Delete setTitleColor:[UIColor grayColor] forState:UIControlStateNormal ];
            Delete.enabled = FALSE;
        }
        else {
            [Delete setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            Delete.enabled = TRUE;
        }
        
        NSString *zzz = [NSString stringWithFormat:@"%d", indexPath.row];
        [itemToBeDeleted removeObject:zzz];
//        [indexPaths removeObject:indexPath];
    }
}


#pragma mark - Alert & Validation

-(BOOL) CheckValidation {
	
	[self hideKeyboard];
	
	NSString *Trim_GroupName = [GroupName.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
	if (Trim_GroupName.length == 0) {
		UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@" " message:@"Nama group harus diisi." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
		[alert show];
	
		return FALSE;
	}
	else if (member.count == 0) {
		UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@" " message:@"Dibutuhkan minimal 1 anggota untuk membuat group." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
		[alert show];
		
		return FALSE;
	}
	
	return TRUE;
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
	if (alertView.tag == 1000) {
		[self dismissModalViewControllerAnimated:YES];
		[[NSNotificationCenter defaultCenter] postNotificationName:@"reloadTable" object:self];
	}
	else if (alertView.tag == 1001 && buttonIndex == 0)
    {
        if (itemToBeDeleted.count < 1)
        {
        return;
        }
        else
        {
            
//            [self dismissModalViewControllerAnimated:YES];
//            [[NSNotificationCenter defaultCenter] postNotificationName:@"reloadTable" object:self];

            NSLog(@"itemToBeDeleted:%d", itemToBeDeleted.count);
        }
                
	if (!db) {
		NSArray *dirPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
		NSString *docsDir = [dirPaths objectAtIndex:0];
		NSString *databasePath = [[NSString alloc] initWithString: [docsDir stringByAppendingPathComponent: @"MOSDB.sqlite"]];
		db = [FMDatabase databaseWithPath:databasePath];
	}
        
	[db open];
    


	if ([TitleBar.text isEqualToString:@"Edit Group"]) {

			//sorted deleted valued
			NSArray *sorted = [[NSArray alloc] init ];
			sorted = [itemToBeDeleted sortedArrayUsingComparator:^(id firstObject, id secondObject){
				return [((NSString *)firstObject) compare:((NSString *)secondObject) options:NSNumericSearch];
			}];
		
			
			//remove from database
			int i = 0;
			while (i < itemToBeDeleted.count) {
				NSString *indexNodel = [itemToBeDeleted objectAtIndex:i];
				int idxNo = [indexNodel integerValue];
				NSMutableArray *ProsGroupArr = [[NSMutableArray alloc] init ];
				
				//#####start - edit prospectGroup value to only remove certain value
				NSString *prosGroup;
				NSString *prosGroup2;
				NSString *group;
				
				NSString *qtr = [NSString stringWithFormat:@"select prospectGroup from prospect_profile WHERE IndexNo = %@", [[member objectAtIndex:idxNo] objectForKey:@"id"]];
				FMResultSet *result = [db executeQuery:qtr];
				while ([result next]) {
					prosGroup = [result stringForColumn:@"prospectGroup"];
				}
				if (![prosGroup isEqualToString:@""]){

					NSLog(@"bfore: prosGroup %@", prosGroup);

					int numberToRemove = [[self.data objectForKey:@"id"] integerValue];

					int noI = [[prosGroup componentsSeparatedByString:@","] count] - 1;
					for (int a=0; a <= noI; a++) {
						group = [[prosGroup componentsSeparatedByString:@","] objectAtIndex:a];
						group = [group stringByReplacingOccurrencesOfString:@"," withString:@""];
//						NSLog(group);
						[ProsGroupArr addObject:group];
					}
					
					for (int b=ProsGroupArr.count; b > 0; b--) {
						int checking = [[ProsGroupArr objectAtIndex:b-1] integerValue];
						NSLog(@"delete %d, number %d", checking, numberToRemove);
						if (checking == numberToRemove) {
							[ProsGroupArr removeObjectAtIndex:b-1];
						}
					}
					prosGroup2 = @"";
					if (ProsGroupArr.count > 0) {
						for (int b=0; b <= ProsGroupArr.count-1; b++) {
							NSLog(@"%d, %d",b, ProsGroupArr.count);
							if (b==0) {
								prosGroup2 = [NSString stringWithFormat:@"%@", [ProsGroupArr objectAtIndex:b]];
							}
							else {
								prosGroup2 = [NSString stringWithFormat:@"%@,%@", prosGroup2, [ProsGroupArr objectAtIndex:b]];
							}
						}
					}
					NSLog(@"After: prosGroup %@", prosGroup2);
				}

				else
					prosGroup = @"";
				
				
				
				//#####end
				if ([prosGroup2 isEqualToString:@""]) {
					[db executeUpdate:[NSString stringWithFormat:@"UPDATE prospect_profile SET ProspectGroup = '%@', prospect_IsGrouping = 'N'  WHERE IndexNo = %@", prosGroup2, [[member objectAtIndex:idxNo] objectForKey:@"id"]]];
				}
				else {
					[db executeUpdate:[NSString stringWithFormat:@"UPDATE prospect_profile SET ProspectGroup = '%@'  WHERE IndexNo = %@", prosGroup2, [[member objectAtIndex:idxNo] objectForKey:@"id"]]];
				}
				
				i = i + 1;
			}
			//remove from data table
			int j = sorted.count;
			while (j != 0) {
				NSString *indexNodel = [sorted objectAtIndex:(j-1)];
				int idxNo = [indexNodel integerValue];

				[member removeObjectAtIndex:idxNo];
				j = j - 1;
			}
		
		
		
		//UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@" " message:@"Customer selected have been successfully deleted from this Group." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@" " message:@"Pelanggan yang dipilih berhasil dihapus dari group." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
		[alert setTag:1004];
		[alert show];
		
//		[Cancel setTitle:@"Delete" forState:UIControlStateNormal];
//		Delete.hidden = YES;
//		[self.tableView setEditing:NO animated:TRUE];
		
//		}
	}
	
	[db close];
	
	[itemToBeDeleted removeAllObjects]; //clear all in delete array
	[self.tableView reloadData];
	[[NSNotificationCenter defaultCenter] postNotificationName:@"reloadTable" object:self];
	[[NSNotificationCenter defaultCenter] postNotificationName:@"ReloadData" object:self];
		
		
   
    }
    
    else if (alertView.tag == 8001 && buttonIndex == 0)
    {
        if (itemToBeDeleted.count < 1)
        {
            return;
        }
        else
        {
            
            [self dismissModalViewControllerAnimated:YES];
            [[NSNotificationCenter defaultCenter] postNotificationName:@"reloadTable" object:self];
            
            NSLog(@"itemToBeDeleted:%d", itemToBeDeleted.count);
        }
        
        if (!db) {
            NSArray *dirPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
            NSString *docsDir = [dirPaths objectAtIndex:0];
            NSString *databasePath = [[NSString alloc] initWithString: [docsDir stringByAppendingPathComponent: @"MOSDB.sqlite"]];
            db = [FMDatabase databaseWithPath:databasePath];
        }
        
        [db open];
        
        
        
        if ([TitleBar.text isEqualToString:@"Edit Group"]) {
            
			//sorted deleted valued
			NSArray *sorted = [[NSArray alloc] init ];
			sorted = [itemToBeDeleted sortedArrayUsingComparator:^(id firstObject, id secondObject){
				return [((NSString *)firstObject) compare:((NSString *)secondObject) options:NSNumericSearch];
			}];
            
			
			//remove from database
			int i = 0;
			while (i < itemToBeDeleted.count) {
				NSString *indexNodel = [itemToBeDeleted objectAtIndex:i];
				int idxNo = [indexNodel integerValue];
				NSMutableArray *ProsGroupArr = [[NSMutableArray alloc] init ];
				
				//#####start - edit prospectGroup value to only remove certain value
				NSString *prosGroup;
				NSString *prosGroup2;
				NSString *group;
				
				NSString *qtr = [NSString stringWithFormat:@"select prospectGroup from prospect_profile WHERE IndexNo = %@", [[member objectAtIndex:idxNo] objectForKey:@"id"]];
				FMResultSet *result = [db executeQuery:qtr];
				while ([result next]) {
					prosGroup = [result stringForColumn:@"prospectGroup"];
				}
				if (![prosGroup isEqualToString:@""]){
                    
					NSLog(@"bfore: prosGroup %@", prosGroup);
                    
					int numberToRemove = [[self.data objectForKey:@"id"] integerValue];
                    
					int noI = [[prosGroup componentsSeparatedByString:@","] count] - 1;
					for (int a=0; a <= noI; a++) {
						group = [[prosGroup componentsSeparatedByString:@","] objectAtIndex:a];
						group = [group stringByReplacingOccurrencesOfString:@"," withString:@""];
                        //						NSLog(group);
						[ProsGroupArr addObject:group];
					}
					
					for (int b=ProsGroupArr.count; b > 0; b--) {
						int checking = [[ProsGroupArr objectAtIndex:b-1] integerValue];
						NSLog(@"delete %d, number %d", checking, numberToRemove);
						if (checking == numberToRemove) {
							[ProsGroupArr removeObjectAtIndex:b-1];
						}
					}
					prosGroup2 = @"";
					if (ProsGroupArr.count > 0) {
						for (int b=0; b <= ProsGroupArr.count-1; b++) {
							NSLog(@"%d, %d",b, ProsGroupArr.count);
							if (b==0) {
								prosGroup2 = [NSString stringWithFormat:@"%@", [ProsGroupArr objectAtIndex:b]];
							}
							else {
								prosGroup2 = [NSString stringWithFormat:@"%@,%@", prosGroup2, [ProsGroupArr objectAtIndex:b]];
							}
						}
					}
					NSLog(@"After: prosGroup %@", prosGroup2);
				}
                
				else
					prosGroup = @"";
				
				
				
				//#####end
				if ([prosGroup2 isEqualToString:@""]) {
					[db executeUpdate:[NSString stringWithFormat:@"UPDATE prospect_profile SET ProspectGroup = '%@', prospect_IsGrouping = 'N'  WHERE IndexNo = %@", prosGroup2, [[member objectAtIndex:idxNo] objectForKey:@"id"]]];
				}
				else {
					[db executeUpdate:[NSString stringWithFormat:@"UPDATE prospect_profile SET ProspectGroup = '%@'  WHERE IndexNo = %@", prosGroup2, [[member objectAtIndex:idxNo] objectForKey:@"id"]]];
				}
				
				i = i + 1;
			}
			
			
			//remove from data table
			int j = sorted.count;
			while (j != 0) {
				NSString *indexNodel = [sorted objectAtIndex:(j-1)];
				int idxNo = [indexNodel integerValue];
                
				[member removeObjectAtIndex:idxNo];
				j = j - 1;
			}
            
            
            
//            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@" " message:@"Customer selected have been successfully deleted from this Group." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
//            [alert setTag:1004];
//            [alert show];
            
            //		[Cancel setTitle:@"Delete" forState:UIControlStateNormal];
            //		Delete.hidden = YES;
            //		[self.tableView setEditing:NO animated:TRUE];
            
            //		}
        }
		
		
		//DELETE GROUP
		
		
		if (member.count == 0) {
//			NSLog(@"id %@, name %@", [self.data objectForKey:@"id"], [self.data objectForKey:@"name"]);
			
			[db executeUpdate:@"delete from prospect_groups where name = ? and id = ?", [self.data objectForKey:@"name"], [self.data objectForKey:@"id"], nil];
//			NSLog(@"Error2: %@", [db lastErrorMessage]);
			
		}
        
        [db close];
        
        [itemToBeDeleted removeAllObjects]; //clear all in delete array
        [self.tableView reloadData];
		
		
        [[NSNotificationCenter defaultCenter] postNotificationName:@"reloadTable" object:self];
        [[NSNotificationCenter defaultCenter] postNotificationName:@"ReloadData" object:self];
		
		
        
    }
	
	else if (alertView.tag == 1003 && buttonIndex == 0) //Save
    {
		[self donePressed:nil];
	}
	else if (alertView.tag == 1003 && buttonIndex == 1) //not save
    {
		if (![self CountMember] && [TitleBar.text isEqualToString:@"Edit Group"]) {
			if (member.count > 0) {
				UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@" " message:@"Silakan Save sebelum kembali ke Daftar group." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
				[alert show];
			}
			else {
				UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@" " message:@"Dibutuhkan minimal 1 anggota untuk membuat group." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
				[alert show];
			}
		}
		else {
			[self dismissModalViewControllerAnimated:YES];
			[[NSNotificationCenter defaultCenter] postNotificationName:@"reloadTable" object:self];
		}
	}
	else if (alertView.tag == 1004)
    {
		[Cancel setTitle:@"Delete" forState:UIControlStateNormal];
		Delete.hidden = YES;
		[self.tableView setEditing:NO animated:TRUE];
	}

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];

}

- (void)viewDidUnload {
	[self setTitleBar:nil];
	[super viewDidUnload];
}
@end
