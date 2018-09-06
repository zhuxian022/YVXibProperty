//
//  UIView+YVRealAction.m
//  YVBannerDemo
//
//  Created by yi von on 2018/9/5.
//  Copyright © 2018年 YiVon. All rights reserved.
//

#import "UIView+YVXibProperty.h"

@implementation UIView (YVXibProperty)

- (void)setBorderWidth:(CGFloat)borderWidth{
    self.layer.borderWidth = borderWidth;
}

- (CGFloat)borderWidth{
    return self.layer.borderWidth;
}

- (void)setBorderColor:(UIColor *)borderColor{
    self.layer.borderColor = borderColor.CGColor;
}

- (UIColor *)borderColor{
    return [UIColor colorWithCGColor:self.layer.borderColor];
}

- (void)setCornerRadius:(CGFloat)cornerRadius{
    self.layer.cornerRadius = cornerRadius;
}

- (CGFloat)cornerRadius{
    return self.layer.cornerRadius;
}

- (void)setMasksToBounds:(BOOL)masksToBounds{
    self.layer.masksToBounds = masksToBounds;
}

- (BOOL)masksToBounds{
    return self.layer.masksToBounds;
}

@end
