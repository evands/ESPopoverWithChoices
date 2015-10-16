//
//  ESPopoverChoice.h
//
//  Created by Evan Schoenberg on 10/25/11.
//  Copyright (c) 2011 Regular Rate and Rhythm Software. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ESPopoverChoice : NSObject
+ (ESPopoverChoice *)popoverChoiceWithName:(NSString *)name value:(NSObject *)value image:(UIImage *)image;
+ (ESPopoverChoice *)popoverChoiceWithAttributedName:(NSAttributedString *)attributedName value:(NSObject *)value image:(UIImage *)image;

+ (ESPopoverChoice *)popoverChoiceSeparator;

/* If attributedText is specified, it is preferred over name */
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSAttributedString *attributedName;


@property (nonatomic, strong) NSObject *value;
@property (nonatomic, strong) UIImage *image;

@property (nonatomic) BOOL isSeparator;

@end
