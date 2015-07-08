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

@interface ESPopoverChoicesSelectionController : UITableViewController
{
    BOOL atLeastOneImage;
}

+ (ESPopoverChoicesSelectionController *)selectionControllerForChoices:(NSArray *)choices
                                                  choiceMadeCompletion:(void(^)(ESPopoverChoice *))completion;

@property (nonatomic) int tag;

@end
