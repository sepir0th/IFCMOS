//
//  PlanList.m
//  HLA Ipad
//
//  Created by shawal sapuan on 10/16/12.
//  Copyright (c) 2012 InfoConnect Sdn Bhd. All rights reserved.
//

#import "Frekeunsi.h"

@interface Frekeunsi ()

@end

@implementation Frekeunsi
@synthesize ListOfPlan,ListOfCode,selectedCode,selectedDesc, TradOrEver, Frekuensi;
@synthesize delegate;

-(id)init {
    self = [super init];
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    if ([Frekuensi isEqualToString:@"Premi Tunggal"])
    {
        ListOfPlan = [[NSMutableArray alloc] initWithObjects: @"Pembayaran Sekaligus", nil ];
        ListOfCode = [[NSMutableArray alloc] initWithObjects:@"", nil ];

    }
    if ([Frekuensi isEqualToString:@"Premi 5 Tahun"])
    {
        ListOfPlan = [[NSMutableArray alloc] initWithObjects: @"Tahunan",@"Bulanan", nil ];
        ListOfCode = [[NSMutableArray alloc] initWithObjects:@"", @"", nil ];

    }
    
    if ([Frekuensi isEqualToString:@"10 Tahun"])
    {
        ListOfPlan = [[NSMutableArray alloc] initWithObjects: @"Tahunan",@"Semester",@"Kuartal",@"Bulanan", nil ];
        ListOfCode = [[NSMutableArray alloc] initWithObjects:@"", @"",@"", @"" ,nil ];
        
    }


//	if([TradOrEver isEqualToString:@"TRAD"]){
//		ListOfPlan = [[NSMutableArray alloc] initWithObjects:@"Secure100", @"HLA Wealth Plan", nil ];
//		ListOfCode = [[NSMutableArray alloc] initWithObjects:@"S100", @"HLAWP", nil ];
//        ListOfPlan = [[NSMutableArray alloc] initWithObjects:@"Premi Tunggal",@"Premi 5 Tahun",nil];
//        ListOfCode = [[NSMutableArray alloc] initWithObjects:@"BCALH",@"BCAKK", nil ];
//        
////		ListOfPlan = [[NSMutableArray alloc] initWithObjects:@"HLA Wealth Plan", nil ];
////		ListOfCode = [[NSMutableArray alloc] initWithObjects:@"HLAWP", nil ];
//        
//        //ListOfPlan = [[NSMutableArray alloc] initWithObjects:@"Life100", nil ];
//        //ListOfCode = [[NSMutableArray alloc] initWithObjects:@"L100", nil ];
//	}
//	else{
//		ListOfPlan = [[NSMutableArray alloc] initWithObjects:@"HLA EverLife Plus",@"test", nil ];
//		ListOfCode = [[NSMutableArray alloc] initWithObjects:@"UV",@"test2", nil ];
//		
//		[ListOfPlan addObject:@"HLA EverGain Plus"];
//		[ListOfCode addObject:@"UP" ];
//	}
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return YES;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [ListOfPlan count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    
	cell.textLabel.text = [ListOfPlan objectAtIndex:indexPath.row];
    
	if (indexPath.row == selectedIndex) {
		cell.accessoryType = UITableViewCellAccessoryCheckmark;
	}
	else {
		cell.accessoryType = UITableViewCellAccessoryNone;
	}
    
    cell.textLabel.font = [UIFont fontWithName:@"TreBuchet MS" size:16 ];
    return cell;
}


#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    selectedIndex = indexPath.row;
    
    
  //  [delegate Planlisting:self didSelectCode:self.selectedCode andDesc:self.selectedDesc];
    [delegate PlanFrekuensi:self didSelectCode:self.selectedCode andDesc:self.selectedDesc];
    
    [tableView reloadData];
}

-(NSString *)selectedCode
{
    return [ListOfCode objectAtIndex:selectedIndex];
}

-(NSString *)selectedDesc
{
    return [ListOfPlan objectAtIndex:selectedIndex];
}

- (void)viewDidUnload
{
    [self setDelegate:nil];
    [super viewDidUnload];
}

@end
