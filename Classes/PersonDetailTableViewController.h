//
//  PersonDetailTableViewController.h
//  Presence2
//
//  Created by Anderson Florence - Dev Acct on 5/18/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Person.h"
#import "VariableHeightCell.h"


@interface PersonDetailTableViewController : UITableViewController
{
	Person * person ;
}

@property (retain) Person * person ;

+ (id) viewControllerWithPerson: (Person *)aPerson ;

@end
