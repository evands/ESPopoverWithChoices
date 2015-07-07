//
//  UITableViewConsistentImageCell.m
//  SkinAdvocate
//
//  Created by Evan Schoenberg on 6/22/11.
//  Copyright 2011 Regular Rate and Rhythm Software. All rights reserved.
//

#import "UITableViewConsistentImageCell.h"

/*!
 * @class UITableViewConsistentImageCell
 * @brief A table view cell whose image view doesn't change position if its height changes.
 *
 * Useful for a table of variable height cells with images that should line up horizontally.
 */
@implementation UITableViewConsistentImageCell

@synthesize imageViewSize;
@synthesize insetX;
@synthesize imageViewToTextLabelMargin;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
	if ((self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])) {
		self.imageViewSize = CGSizeMake(50, 50);
		self.imageView.contentMode = UIViewContentModeScaleAspectFit;
		self.insetX = 5;
		self.imageViewToTextLabelMargin = 10;		
	}
	
	return self;
}

- (void) layoutSubviews
{
	[super layoutSubviews];
	
	CGRect imageViewFrame = self.imageView.frame;
	CGRect contentViewFrame = self.contentView.frame;	
	CGRect textLabelFrame;
	
	imageViewFrame.size = self.imageViewSize;	
	imageViewFrame.origin.x = self.insetX;
	imageViewFrame.origin.y = (CGRectGetHeight(contentViewFrame) - CGRectGetHeight(imageViewFrame))/2;
	self.imageView.frame = imageViewFrame;
	
	textLabelFrame = self.textLabel.frame;
	textLabelFrame.origin.x = CGRectGetMaxX(imageViewFrame) + self.imageViewToTextLabelMargin;
	textLabelFrame.size.width = (CGRectGetWidth(contentViewFrame) - CGRectGetMinX(textLabelFrame) - self.insetX);
	self.textLabel.frame = textLabelFrame;
	
	textLabelFrame = self.detailTextLabel.frame;
	textLabelFrame.origin.x = CGRectGetMaxX(imageViewFrame) + self.imageViewToTextLabelMargin;
	textLabelFrame.size.width = (CGRectGetWidth(contentViewFrame) - CGRectGetMinX(textLabelFrame) - self.insetX);
	self.detailTextLabel.frame = textLabelFrame;
}

@end
