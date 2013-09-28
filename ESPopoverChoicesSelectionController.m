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
		
		maxWidth = MAX(maxWidth, aWidth);
	}

	return maxWidth;
}

- (void)setChoices:(NSArray *)inChoices
{
	choices = inChoices;

	/* not sure why we need extra space, but we do */
#define MAGIC_NECESSARY_ADDITIONAL_MARGIN (([UIDevice currentDevice].systemVersion.doubleValue >= 7.0) ? 36 : 20)
    
	self.contentSizeForViewInPopover = CGSizeMake(([self widthForChoices] +
												  self.tableView.contentInset.left + self.tableView.contentInset.right + MAGIC_NECESSARY_ADDITIONAL_MARGIN),
												  (choices.count * self.tableView.rowHeight + 
												   self.tableView.contentInset.top + self.tableView.contentInset.bottom));

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

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    ESPopoverTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[ESPopoverTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
	ESPopoverChoice *choice = [self.choices objectAtIndex:indexPath.row];
    
    BOOL iOSSevenOrAbove = ([UIDevice currentDevice].systemVersion.doubleValue >= 7.0);
	cell.textLabel.textColor = (iOSSevenOrAbove ? [UIColor blackColor] : [UIColor whiteColor]);
    cell.textLabel.font = CHOICES_FONT;
    cell.textLabel.lineBreakMode = NSLineBreakByTruncatingTail;
    cell.textLabel.adjustsFontSizeToFitWidth = YES;
	cell.selectionStyle = UITableViewCellSelectionStyleBlue;
	cell.textLabel.text = choice.name;

    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	[self.delegate popoverChoicesSelectionController:self
									 didSelectChoice:[self.choices objectAtIndex:indexPath.row]];
	
	[self.tableView deselectRowAtIndexPath:indexPath animated:NO];
}

@end
