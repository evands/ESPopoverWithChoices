//
//  ESPopoverChoice.m
//
//  Created by Evan Schoenberg on 10/25/11.
//  Copyright (c) 2011 Regular Rate and Rhythm Software. All rights reserved.
//

#import "ESPopoverChoice.h"

@implementation ESPopoverChoice

@synthesize name, value;

+ (ESPopoverChoice *)popoverChoiceWithName:(NSString *)newName value:(NSNumber *)newValue
{
	ESPopoverChoice *p = [[ESPopoverChoice alloc] init];
	p.name = newName;
	p.value = newValue;
	return p;
}


@end
