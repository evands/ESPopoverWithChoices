//
//  UITableViewConsistentImageCell.h
//  SkinAdvocate
//
//  Created by Evan Schoenberg on 6/22/11.
//  Copyright 2011 Regular Rate and Rhythm Software. All rights reserved.
//

#import <Foundation/Foundation.h>

/*!
 * @class UITableViewConsistentImageCell
 * @brief A table view cell whose image view doesn't change position if its height changes.
 *
 * Useful for a table of variable height cells with images that should line up horizontally.
 */
@interface UITableViewConsistentImageCell : UITableViewCell {

}

@property (nonatomic) CGSize imageViewSize;

/* the image view will always be centered vertically in the cell */
@property (nonatomic) float insetX;

@property (nonatomic) float imageViewToTextLabelMargin;

@end
