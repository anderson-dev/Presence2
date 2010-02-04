//
//  LabelCell.m
//  Presence2
//
//  Created by Anderson Florence - Dev Acct on 5/27/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "VariableHeightCell.h"

#define CELLPADDING 20
#define LABELPADDING 20
#define VERTICALSPACING 10

#define LABELPOSX (LABELPADDING / 2)
#define LABELPOSY (VERTICALSPACING / 2)

#define CELLSTYLEPLAINWIDTH 320
#define CELLSTYLEGROUPEDWIDTH 300 // Width is 320 px - SIDEPADDING

static CGFloat cellHeight ;
static CGFloat labelHeight ;
static CGFloat labelWidth ;

@implementation VariableHeightCell

+ (CGFloat) cellHeightWithText: (NSString *)someText cellStyle: (VariableHeightCellStyle)cellStyle
{
	if ( cellStyle == VariableHeightCellStyleGrouped )
	{
		return [[self class] cellHeightWithText: someText width: CELLSTYLEGROUPEDWIDTH - LABELPADDING] ;
	}
	
	// if cellStyle == VariableHeightCellStylePlain...
	return [[self class] cellHeightWithText: someText width: CELLSTYLEPLAINWIDTH - LABELPADDING] ;
}

+ (CGFloat) cellHeightWithText: (NSString *)someText width: (CGFloat)width
{	
	CGSize withinSize = CGSizeMake( width , MAXFLOAT );
	CGSize size = [someText sizeWithFont: [UIFont systemFontOfSize: [UIFont systemFontSize]]  constrainedToSize:withinSize] ;
	return size.height + VERTICALSPACING ;  // 5 pixel padding on top and bottom of cell
}

// Designated Initializer
- (id)initWithFrame:(CGRect)frame reuseIdentifier:(NSString *)reuseIdentifier 
{	
	if ( [reuseIdentifier isEqualToString: @"VariableHeightCellStyleGrouped"] )
	{
		labelWidth = CELLSTYLEGROUPEDWIDTH - LABELPADDING ;
		labelHeight = ([[self class] cellHeightWithText: @"One Line of Text" width: labelWidth] - VERTICALSPACING ) ;
		cellHeight = labelWidth + VERTICALSPACING ;
		frame = CGRectMake( CELLPADDING / 2, 0, CELLSTYLEGROUPEDWIDTH, cellHeight ) ;
		
	}
	
	if (self = [super initWithFrame:frame reuseIdentifier:reuseIdentifier]) {
				
		// Set up a label and add it as a subView
		
		CGRect textLabelFrame = CGRectMake( LABELPOSX, LABELPOSY, labelWidth, labelHeight) ;
		textLabel = [[UILabel alloc] initWithFrame: textLabelFrame] ;
		[textLabel setNumberOfLines:0];
		[textLabel setFont:[UIFont systemFontOfSize: [UIFont systemFontSize]]];
		[ self.contentView addSubview:textLabel];
    }
	
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {

    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (NSString *) text
{
	return textLabel.text ;
}

- (void) setText: (NSString *)aString
{
	textLabel.text = aString ;
	labelHeight = [[self class] cellHeightWithText: textLabel.text width: CGRectGetWidth(textLabel.frame)] - VERTICALSPACING ;
	[textLabel setFrame: CGRectMake( CGRectGetMinX(textLabel.frame), CGRectGetMinY(textLabel.frame), CGRectGetWidth(textLabel.frame), labelHeight )] ;
	

}
- (void)dealloc {
	[textLabel release] ;
    [super dealloc];
}


@end
