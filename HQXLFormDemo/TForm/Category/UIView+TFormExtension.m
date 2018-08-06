//
//  UIView+TFormExtension.m
//  HQXLFormDemo
//
//  Created by admin on 2018/8/2.
//  Copyright © 2018年 admin. All rights reserved.
//

#import "UIView+TFormExtension.h"

@implementation UIView (TFormExtension)

- (CGFloat)tf_left {
    return CGRectGetMinX(self.frame);
}

- (void)setTf_left:(CGFloat)x {
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}

- (CGFloat)tf_top {
    return CGRectGetMinY(self.frame);
}

- (void)setTf_top:(CGFloat)y {
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}

- (CGFloat)tf_right {
    return CGRectGetMaxX(self.frame);
}

- (void)setTf_right:(CGFloat)right {
    CGRect frame = self.frame;
    frame.origin.x = right - frame.size.width;
    self.frame = frame;
}

- (CGFloat)tf_bottom {
    return CGRectGetMaxY(self.frame);
}

- (void)setTf_bottom:(CGFloat)bottom {
    CGRect frame = self.frame;
    frame.origin.y = bottom - frame.size.height;
    self.frame = frame;
}

- (CGFloat)tf_width {
    return CGRectGetWidth(self.frame);
}

- (void)setTf_width:(CGFloat)width {
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

- (CGFloat)tf_height {
    return CGRectGetHeight(self.frame);
}

- (void)setTf_height:(CGFloat)height {
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}

- (CGFloat)tf_centerX {
    return self.center.x;
}

- (void)setTf_centerX:(CGFloat)centerX {
    self.center = CGPointMake(centerX, self.center.y);
}

- (CGFloat)tf_centerY {
    return self.center.y;
}

- (void)setTf_centerY:(CGFloat)centerY {
    self.center = CGPointMake(self.center.x, centerY);
}

- (CGPoint)tf_origin {
    return self.frame.origin;
}

- (void)setTf_origin:(CGPoint)origin {
    CGRect frame = self.frame;
    frame.origin = origin;
    self.frame = frame;
}

- (CGSize)tf_size {
    return self.frame.size;
}

- (void)setTf_size:(CGSize)size {
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}

@end
