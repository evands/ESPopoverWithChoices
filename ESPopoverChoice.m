//
//  ESPopoverChoice.m
//
//  Created by Evan Schoenberg on 10/25/11.
//  Copyright (c) 2011 Regular Rate and Rhythm Software. All rights reserved.
//

#import "ESPopoverChoice.h"

#define INVERT_IOS7_IMAGES 1
@implementation ESPopoverChoice

@synthesize name, value, image;
@synthesize isSeparator;

+ (ESPopoverChoice *)popoverChoiceWithName:(NSString *)newName value:(NSObject *)newValue image:(UIImage *)inImage
{
	ESPopoverChoice *p = [[ESPopoverChoice alloc] init];
	p.name = newName;
	p.value = newValue;
    
#if INVERT_IOS7_IMAGES
    BOOL iOSSevenOrAbove = ([UIDevice currentDevice].systemVersion.doubleValue >= 7.0);
    if (iOSSevenOrAbove) {
        CIFilter* filter = [CIFilter filterWithName:@"CIColorInvert"];
        [filter setDefaults];
        
        [filter setValue:[[CIImage alloc] initWithCGImage:inImage.CGImage]
                  forKey:@"inputImage"];
        inImage = [[UIImage alloc] initWithCIImage:filter.outputImage scale:inImage.scale orientation:inImage.imageOrientation];
    }
#endif

    p.image = inImage;

	return p;
}

+ (ESPopoverChoice *)popoverChoiceSeparator
{
	ESPopoverChoice *p = [[ESPopoverChoice alloc] init];
	p.isSeparator = YES;
	return p;
}

- (NSString *)description
{
	return [NSString stringWithFormat:@"<%@: %p %@ = %@>", NSStringFromClass([self class]), self, self.name, self.value];
}

@end
