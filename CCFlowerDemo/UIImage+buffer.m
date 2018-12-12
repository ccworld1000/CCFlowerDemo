//
//  UIImage+buffer.m
//  CCFlowerDemo
//
//  Created by dengyouhua on 2018/12/12.
//  Copyright © 2018 cc | ccworld1000@gmail.com. All rights reserved.
//  https://github.com/ccworld1000/CCFlowerDemo

#import "UIImage+buffer.h"

@implementation UIImage (buffer)

- (CVPixelBufferRef) buffer {
    NSDictionary *options = [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithBool:YES], kCVPixelBufferCGImageCompatibilityKey, [NSNumber numberWithBool:YES], kCVPixelBufferCGBitmapContextCompatibilityKey, nil];
    
    int width = (int)self.size.width;
    int height = (int)self.size.height;
    
    CVPixelBufferRef pixelBuffer = nil;
    
    CVPixelBufferCreate(kCFAllocatorDefault, width, height, kCVPixelFormatType_32ARGB, (__bridge CFDictionaryRef _Nullable)(options), &pixelBuffer);
    
    CVPixelBufferLockBaseAddress(pixelBuffer, 0);
    
    CGColorSpaceRef colorspace = CGColorSpaceCreateDeviceRGB();
    CGColorSpaceRelease(colorspace);
    
    CGContextRef bitmapContext = CGBitmapContextCreate(CVPixelBufferGetBaseAddress(pixelBuffer), width, height, 8, CVPixelBufferGetBytesPerRow(pixelBuffer), colorspace,  kCGImageAlphaNoneSkipFirst);

    CGContextDrawImage(bitmapContext, CGRectMake(0, 0, width, height), self.CGImage);
    CGContextRelease(bitmapContext);
    
    CVPixelBufferUnlockBaseAddress(pixelBuffer, 0);
    
    return pixelBuffer;
    
}

@end
