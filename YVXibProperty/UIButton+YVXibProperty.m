//
//  UIButton+YVRealAction.m
//  YVBannerDemo
//
//  Created by yi von on 2018/9/5.
//  Copyright © 2018年 YiVon. All rights reserved.
//

#import "UIButton+YVXibProperty.h"
#import <objc/runtime.h>

@implementation UIButton (YVXibProperty)

static const char propertySpace = '\0';
- (void)setSpace:(CGFloat)space{
    objc_setAssociatedObject(self, &propertySpace, [NSString stringWithFormat:@"%f",space], OBJC_ASSOCIATION_COPY_NONATOMIC);
    
    [self reAlign];
}

- (CGFloat)space{
    NSString *spaceStr = objc_getAssociatedObject(self, &propertySpace);
    return spaceStr?[spaceStr floatValue]:0.0f;
}

static const char propertyImagePosition = '\1';
- (void)setImagePosition:(YVImagePosition)imagePosition{
    NSInteger position = imagePosition;
    if (position<0) {
        position = 0;
    }
    else if (position>3){
        position = 3;
    }
    objc_setAssociatedObject(self, &propertyImagePosition, [NSString stringWithFormat:@"%lu",(unsigned long)position], OBJC_ASSOCIATION_COPY_NONATOMIC);

    [self reAlign];
}

- (YVImagePosition)imagePosition{
    NSString *imagePositionStr = objc_getAssociatedObject(self, &propertyImagePosition);
    return imagePositionStr?[imagePositionStr integerValue]:YVImagePositionLeft;
}

#pragma mark -Align-
- (void)reAlign{
    switch (self.imagePosition) {
        case YVImagePositionTop:
        {
            [self.titleLabel sizeToFit];
            CGFloat imageW = self.imageView.frame.size.width;
            CGFloat imageH = self.imageView.frame.size.height;
            CGFloat labelW = self.titleLabel.frame.size.width;
            CGFloat labelH = self.titleLabel.frame.size.height;
            self.imageEdgeInsets = UIEdgeInsetsMake(0, labelW / 2.0, labelH + self.space, - labelW / 2.0);
            self.titleEdgeInsets = UIEdgeInsetsMake(imageH + self.space, -imageW / 2.0, 0, imageW / 2.0);
        }
            break;
            
        case YVImagePositionLeft:
        {
            self.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, self.space);
            self.titleEdgeInsets = UIEdgeInsetsMake(0, self.space, 0, 0);
        }
            break;
            
        case YVImagePositionBottom:
        {
            [self.titleLabel sizeToFit];
            CGFloat imageW = self.imageView.frame.size.width;
            CGFloat imageH = self.imageView.frame.size.height;
            CGFloat labelW = self.titleLabel.frame.size.width;
            CGFloat labelH = self.titleLabel.frame.size.height;
            self.imageEdgeInsets = UIEdgeInsetsMake(labelH + self.space, labelW / 2.0, 0, -labelW / 2.0);
            self.titleEdgeInsets = UIEdgeInsetsMake(0, -imageW / 2.0, imageH + self.space, imageW / 2.0);
        }
            break;
            
        case YVImagePositionRight:
        {
            [self.titleLabel sizeToFit];
            CGFloat imageW = self.imageView.frame.size.width;
            CGFloat labelW = self.titleLabel.frame.size.width;
            self.imageEdgeInsets = UIEdgeInsetsMake(0, labelW, 0, -labelW - self.space);
            self.titleEdgeInsets = UIEdgeInsetsMake(0, -imageW - self.space, 0, imageW);
        }
            break;
            
        default:
            break;
    }
}

#pragma mark -Event-
- (void)alignWithImagePosition:(YVImagePosition)imagePosition Space:(CGFloat)space{
    self.imagePosition = imagePosition;
    self.space = space;
}

@end
