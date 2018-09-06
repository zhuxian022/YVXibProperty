//
//  UIView+YVRealAction.h
//  YVBannerDemo
//
//  Created by yi von on 2018/9/5.
//  Copyright © 2018年 YiVon. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (YVXibProperty)

@property (nonatomic, assign) IBInspectable CGFloat borderWidth; // 边框的宽度
@property (nonatomic, assign) IBInspectable CGFloat cornerRadius; // 圆角的半径
@property (nonatomic, strong) IBInspectable UIColor *borderColor; // 边框的颜色
@property (nonatomic, assign) IBInspectable BOOL masksToBounds; //

@end
