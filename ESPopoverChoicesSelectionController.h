//
//  ESPopoverChoicesSelectionController.h
//
//  Created by Evan Schoenberg on 10/25/11.
//  Copyright (c) 2011 Regular Rate and Rhythm Software. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ESPopoverChoice.h"

@class ESPopoverChoicesSelectionController;

@protocol ESPopoverChoicesSelectionControllerDelegate
- (void)popoverChoicesSelectionController:(ESPopoverChoicesSelectionController *)controller didSelectChoice:(ESPopoverChoice *)choice; 
@end

@interface ESPopoverChoicesSelectionController : UITableViewController
{
    BOOL atLeastOneImage;
}
@property (nonatomic, strong) NSArray *choices;
@property (nonatomic, unsafe_unretained) id<ESPopoverChoicesSelectionControllerDelegate> delegate;
@property (nonatomic) int tag;

@end
