//
//  ESPopoverChoice.h
//
//  Created by Evan Schoenberg on 10/25/11.
//  Copyright (c) 2011 Regular Rate and Rhythm Software. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ESPopoverChoice : NSObject
+ (ESPopoverChoice *)popoverChoiceWithName:(NSString *)newName value:(NSNumber *)newValue;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSNumber *value;
@end
