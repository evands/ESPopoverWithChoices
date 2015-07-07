//
//  ESPopoverChoice.h
//
//  Created by Evan Schoenberg on 10/25/11.
//  Copyright (c) 2011 Regular Rate and Rhythm Software. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ESPopoverChoice : NSObject
+ (ESPopoverChoice *)popoverChoiceWithName:(NSString *)newName value:(NSObject *)newValue image:(UIImage *)image;

+ (ESPopoverChoice *)popoverChoiceSeparator;

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSObject *value;
@property (nonatomic, strong) UIImage *image;

@property (nonatomic) BOOL isSeparator;

@end
