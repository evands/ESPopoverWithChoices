//
//  ESPopoverChoicesSelectionController.m
//
//  Created by Evan Schoenberg on 10/25/11.
//  Copyright (c) 2011 Regular Rate and Rhythm Software. All rights reserved.
//

#import "ESPopoverChoicesSelectionController.h"
#import "ESPopoverChoice.h"
#import "ESPopoverTableViewCell.h"

@implementation ESPopoverChoicesSelectionController

@synthesize delegate;
@synthesize choices;
@synthesize tag;

#define CHOICES_FONT [UIFont systemFontOfSize:19]


#define IMAGE_SIZE CGSizeMake(20, 20)
#define LEFT_MARGIN_INSET (([UIDevice currentDevice].systemVersion.doubleValue >= 7.0) ? 10 : 5)
#define IMAGE_TO_TEXT_MARGIN 10

- (void)dealloc
{
	self.delegate = nil;
    self.choices = nil;
}

- (float)widthForChoices
{
	UIFont *font = CHOICES_FONT;
	float maxWidth = 0;

	for (ESPopoverChoice *choice in self.choices) {
		NSString *name = choice.name;
		
		float aWidth = [name sizeWithFont:font].width;
		if (atLeastOneImage)
			aWidth += IMAGE_SIZE.width + IMAGE_TO_TEXT_MARGIN;

		maxWidth = MAX(maxWidth, aWidth);
	}

	return maxWidth;
}

- (void)setChoices:(NSArray *)inChoices
{
	choices = inChoices;
    
    atLeastOneImage = NO;
	/* If there is a single image, all choices will be indented that much */
	for (ESPopoverChoice *choice in choices) {
		if (choice.image) {
			atLeastOneImage = YES;
			break;
		}
	}
    
    CGFloat tableHeight = 0;
    for (int i = 0; i < choices.count; i++) {
        tableHeight += [self tableView:self.tableView heightForRowAtIndexPath:[NSIndexPath indexPathForRow:i inSection:0]];
    }

	/* not sure why we need extra space, but we do */
#define MAGIC_NECESSARY_ADDITIONAL_MARGIN (([UIDevice currentDevice].systemVersion.doubleValue >= 7.0) ? LEFT_MARGIN_INSET*2 : 20)
    CGSize desiredSize = CGSizeMake(([self widthForChoices] +
                                     self.tableView.contentInset.left + self.tableView.contentInset.right + MAGIC_NECESSARY_ADDITIONAL_MARGIN),
                                    (tableHeight +
                                     self.tableView.contentInset.top + self.tableView.contentInset.bottom));
    if ([self respondsToSelector:@selector(setPreferredContentSize:)])
        self.preferredContentSize = desiredSize;
    else
        self.contentSizeForViewInPopover = desiredSize;

	[self.tableView reloadData];
}

- (void)viewDidLoad {
    [super viewDidLoad];
	
	self.tableView.rowHeight = 44.0;
	self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
	self.tableView.backgroundColor = [UIColor clearColor];
    self.tableView.bounces = NO;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return choices.count;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ESPopoverChoice *choice = (self.choices)[indexPath.row];
	if (choice.isSeparator)
        return 12.0f;
    else
        return 44.0f;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    ESPopoverTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[ESPopoverTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    if (atLeastOneImage) {
        cell.imageViewSize = IMAGE_SIZE;
		cell.imageViewToTextLabelMargin = IMAGE_TO_TEXT_MARGIN;
    } else {
        cell.imageViewSize = CGSizeZero;
		cell.imageViewToTextLabelMargin = 0;
    }
    cell.insetX = LEFT_MARGIN_INSET;

    
	ESPopoverChoice *choice = (self.choices)[indexPath.row];

	if (choice.isSeparator) {
		cell.textLabel.text = @"";
		cell.selectionStyle = UITableViewCellSelectionStyleNone;
		cell.imageView.image = nil;

	} else {
        BOOL iOSSevenOrAbove = ([UIDevice currentDevice].systemVersion.doubleValue >= 7.0);
        cell.textLabel.textColor = (iOSSevenOrAbove ? [UIColor blackColor] : [UIColor whiteColor]);
		cell.textLabel.text = choice.name;
        cell.textLabel.adjustsFontSizeToFitWidth = YES;
		cell.textLabel.font = CHOICES_FONT;
        cell.textLabel.lineBreakMode = NSLineBreakByTruncatingTail;
		cell.selectionStyle = UITableViewCellSelectionStyleBlue;
		cell.imageView.image = choice.image;

		NSString *accessibilityLabel = choice.accessibilityLabel;
		if (accessibilityLabel)
			cell.accessibilityLabel = choice.accessibilityLabel;
		
		NSString *accessibilityHint = choice.accessibilityHint;
		if (accessibilityHint)
			cell.accessibilityHint = choice.accessibilityHint;
	}

    return cell;
}

#pragma mark - Table view delegate

- (NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	ESPopoverChoice *choice = (self.choices)[indexPath.row];
	if (choice.isSeparator)
		return nil;
	else
		return indexPath;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	[self.delegate popoverChoicesSelectionController:self
									 didSelectChoice:(self.choices)[indexPath.row]];
	
	[self.tableView deselectRowAtIndexPath:indexPath animated:NO];
}

@end
