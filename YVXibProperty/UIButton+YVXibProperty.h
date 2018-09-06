//
//  UIButton+YVRealAction.h
//  YVBannerDemo
//
//  Created by yi von on 2018/9/5.
//  Copyright © 2018年 YiVon. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    YVImagePositionTop = 0,
    YVImagePositionLeft = 1,
    YVImagePositionBottom = 2,
    YVImagePositionRight = 3,
} YVImagePosition;

@interface UIButton (YVXibProperty)

@property (nonatomic, assign) IBInspectable CGFloat space; // 图片和文字间隔

#if TARGET_INTERFACE_BUILDER
@property (nonatomic, assign) IBInspectable NSInteger imagePosition;
#else
@property (nonatomic, assign) YVImagePosition imagePosition;
#endif

- (void)alignWithImagePosition:(YVImagePosition)imagePosition Space:(CGFloat)space;

@end
