//
//  LabelCell.h
//  Presence2
//
//  Created by Anderson Florence - Dev Acct on 5/27/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum 
{
	VariableHeightCellStylePlain,
	VariableHeightCellStyleGrouped
} VariableHeightCellStyle ;

@interface VariableHeightCell : UITableViewCell {
	UILabel * textLabel ;
}

+ (CGFloat) cellHeightWithText: (NSString *)someText cellStyle: (VariableHeightCellStyle)cellStyle ;
+ (CGFloat) cellHeightWithText: (NSString *)someText width: (CGFloat)width ;

@end
