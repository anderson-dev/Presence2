//
//  PersonDetailTableViewController.m
//  Presence2
//
//  Created by Anderson Florence - Dev Acct on 5/18/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "PersonDetailTableViewController.h"


@implementation PersonDetailTableViewController

@synthesize person ;

/*
- (id)initWithStyle:(UITableViewStyle)style {
    // Override initWithStyle: if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
    if (self = [super initWithStyle:style]) {
    }
    return self;
}
*/

+ (id) viewControllerWithPerson: (Person *)aPerson
{
	PersonDetailTableViewController * tempController = [[[PersonDetailTableViewController alloc] initWithStyle: UITableViewStyleGrouped] autorelease] ;
	tempController.person = aPerson ;
	return tempController ;
}

- (void)viewDidLoad
{
	[super viewDidLoad] ;
	self.title = person.fullName ;
}

/*
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}
*/
/*
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}
*/
/*
- (void)viewWillDisappear:(BOOL)animated {
	[super viewWillDisappear:animated];
}
*/
/*
- (void)viewDidDisappear:(BOOL)animated {
	[super viewDidDisappear:animated];
}
*/

/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning]; // Releases the view if it doesn't have a superview
    // Release anything that's not essential, such as cached data
}

#pragma mark Table view methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

// Set the Header
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
	switch (section) {
		case 0:
			return @"Statuses" ;
			break;
		default:
			break;
	}
	
	return nil ;
}

// Customize the number of rows in the table view.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[person statusMessages] count] ;
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	
	static NSString *CellIdentifier = @"VariableHeightCellStyleGrouped";
	VariableHeightCell * cell = (VariableHeightCell *)[tableView dequeueReusableCellWithIdentifier: CellIdentifier] ;
	if (cell == nil) {
		cell = [[[VariableHeightCell alloc] initWithFrame: CGRectZero reuseIdentifier: CellIdentifier] autorelease] ;
	}
	[cell setText:[[person statusMessages] objectAtIndex:indexPath.row]];
	return cell ;

}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath: 
(NSIndexPath *)indexPath 
{ 
    NSString *text = [[person statusMessages] objectAtIndex:indexPath.row];
	
	return [VariableHeightCell cellHeightWithText: text cellStyle: VariableHeightCellStyleGrouped] ;
}



- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // Navigation logic may go here. Create and push another view controller.
	// AnotherViewController *anotherViewController = [[AnotherViewController alloc] initWithNibName:@"AnotherView" bundle:nil];
	// [self.navigationController pushViewController:anotherViewController];
	// [anotherViewController release];
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/


/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:YES];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/


/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/


/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


- (void)dealloc {
    [super dealloc] ;
	[person release] ;
	person = nil ;
}


@end

