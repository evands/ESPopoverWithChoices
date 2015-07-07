//
//  UITableViewConsistentImageCell.h
//  SkinAdvocate
//
//  Created by Evan Schoenberg on 6/22/11.
//  Copyright 2011 Regular Rate and Rhythm Software. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface UITableViewConsistentImageCell : UITableViewCell {

}

@property (nonatomic) CGSize imageViewSize;

/* the image view will always be centered vertically in the cell */
@property (nonatomic) float insetX;

@property (nonatomic) float imageViewToTextLabelMargin;

@end
