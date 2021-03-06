//
//  ESPopoverChoicesSelectionController.h
//
//  Created by Evan Schoenberg on 10/25/11.
//  Copyright (c) 2011 Regular Rate and Rhythm Software. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ESPopoverChoice.h"

@class ESPopoverChoicesSelectionController;

typedef void (^ESPopoverChoicesSelectionBlock)(ESPopoverChoicesSelectionController *controller, ESPopoverChoice *choice);

#define kESPopoverChoicesDefaultFont [UIFont preferredFontForTextStyle:UIFontTextStyleSubheadline]

@interface ESPopoverChoicesSelectionController : UITableViewController
{
    BOOL atLeastOneImage;
}

+ (ESPopoverChoicesSelectionController *)selectionController;
+ (ESPopoverChoicesSelectionController *)selectionControllerForChoices:(NSArray *)choices
                                                  choiceMadeCompletion:(ESPopoverChoicesSelectionBlock)completion;

@property (nonatomic, retain) NSArray *choices;
@property (copy) ESPopoverChoicesSelectionBlock completion;
@property (nonatomic) int tag;
@property (nonatomic) BOOL allowMultilineChoices;

@end
