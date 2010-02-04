//
//  PersonListViewController.h
//  Presence1
//
//  Created by Anderson R. Florence on 5/7/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PersonDetailViewController.h"
#import "Person.h"


@interface PersonListViewController : UIViewController {

	NSMutableArray * people ;
	
	IBOutlet UIImageView * imageOfSteveJobs, * imageOfSteveWozniak, * imageOfBillGates, * imageOfSteveBallmer ;
	IBOutlet UILabel * nameLabelForSteveJobs, * nameLabelForSteveWozniak, * nameLabelForBillGates, * nameLabelForSteveBallmer ;
	
}

- (void) importPeople ;

- (void) updateView ;

- (IBAction) viewDetails: (id)sender ;

@end
