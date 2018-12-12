//
//  UIImage+buffer.h
//  CCFlowerDemo
//
//  Created by dengyouhua on 2018/12/12.
//  Copyright © 2018 cc | ccworld1000@gmail.com. All rights reserved.
//  https://github.com/ccworld1000/CCFlowerDemo

#import <UIKit/UIKit.h>
#import <CoreVideo/CoreVideo.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (buffer)

- (CVPixelBufferRef) buffer;

@end

NS_ASSUME_NONNULL_END
