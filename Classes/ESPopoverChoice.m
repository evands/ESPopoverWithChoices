//
//  ESPopoverChoice.m
//
//  Created by Evan Schoenberg on 10/25/11.
//  Copyright (c) 2011 Regular Rate and Rhythm Software. All rights reserved.
//

#import "ESPopoverChoice.h"

#define INVERT_IOS7_IMAGES 1
@implementation ESPopoverChoice

@synthesize name = _name, value, image;
@synthesize isSeparator;


+ (ESPopoverChoice *)popoverChoiceWithAttributedName:(NSAttributedString *)attributedName value:(NSObject *)value image:(UIImage *)image
{
    ESPopoverChoice *p = [[ESPopoverChoice alloc] init];
    p.attributedName = attributedName;
    p.value = value;
    
#if INVERT_IOS7_IMAGES
    [p invertAndSetImage:image];
#else
    p.image = image;
#endif
    
    return p;
}

+ (ESPopoverChoice *)popoverChoiceWithName:(NSString *)name value:(NSObject *)value image:(UIImage *)image
{
	ESPopoverChoice *p = [[ESPopoverChoice alloc] init];
	p.name = name;
	p.value = value;

#if INVERT_IOS7_IMAGES
    [p invertAndSetImage:image];
#else
    p.image = image;
#endif

	return p;
}

+ (ESPopoverChoice *)popoverChoiceSeparator
{
	ESPopoverChoice *p = [[ESPopoverChoice alloc] init];
	p.isSeparator = YES;
	return p;
}

- (NSString *)name
{
    if (self.attributedName)
        return self.attributedName.string;
    else
        return _name;
}

- (void)invertAndSetImage:(UIImage *)inImage
{
    if (inImage) {
        CIFilter* filter = [CIFilter filterWithName:@"CIColorInvert"];
        [filter setDefaults];
        
        [filter setValue:[[CIImage alloc] initWithCGImage:inImage.CGImage]
                  forKey:@"inputImage"];
        inImage = [[UIImage alloc] initWithCIImage:filter.outputImage scale:inImage.scale orientation:inImage.imageOrientation];
    }
    
    self.image = inImage;
}

- (NSString *)description
{
	return [NSString stringWithFormat:@"<%@: %p %@ = %@>", NSStringFromClass([self class]), self, self.name, self.value];
}

@end
