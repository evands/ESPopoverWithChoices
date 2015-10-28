//
//  ESPopoverChoicesSelectionController.h
//
//  Created by Evan Schoenberg on 10/25/11.
//  Copyright (c) 2011 Regular Rate and Rhythm Software. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ESPopoverChoice.h"

@class ESPopoverChoicesSelectionController;

typedef int (^ESPopoverChoicesSelectionBlock)(ESPopoverChoice *choice);

#define kESPopoverChoicesDefaultFont [UIFont preferredFontForTextStyle:UIFontTextStyleSubheadline]

@interface ESPopoverChoicesSelectionController : UITableViewController
{
    BOOL atLeastOneImage;
}

+ (ESPopoverChoicesSelectionController *)selectionController;
+ (ESPopoverChoicesSelectionController *)selectionControllerForChoices:(NSArray *)choices
                                                  choiceMadeCompletion:(void(^)(ESPopoverChoice *))completion;

@property (nonatomic, retain) NSArray *choices;
@property (copy) void(^completion)(ESPopoverChoice *);
@property (nonatomic) int tag;
@property (nonatomic) BOOL allowMultilineChoices;

@end
