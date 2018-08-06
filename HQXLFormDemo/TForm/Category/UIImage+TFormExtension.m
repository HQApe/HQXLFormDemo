//
//  UIImage+ImageColor.m
//  SVGDemo
//
//  Created by admin on 2018/8/1.
//  Copyright © 2018年 admin. All rights reserved.
//

#import "UIImage+TFormExtension.h"
#import <SVGKit/SVGKit.h>
@implementation UIImage (TFormExtension)

+ (UIImage *)tf_svgimageWithName:(NSString *)imageName maskColor:(UIColor *)maskColor
{
    SVGKImage *svgImg = [SVGKImage imageNamed:imageName];
    UIImage *image = svgImg.UIImage;
    if (maskColor) {
        image = [image tf_imageMaskWithColor:maskColor];
    }
    return image;
}


- (UIImage *)tf_imageMaskWithColor:(UIColor *)maskColor {
    if (!maskColor) {
        return nil;
    }
    
    UIImage *newImage = nil;
    
    CGRect imageRect = (CGRect){CGPointZero,self.size};
    UIGraphicsBeginImageContextWithOptions(imageRect.size, NO, self.scale);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextScaleCTM(context, 1.0, -1.0);
    CGContextTranslateCTM(context, 0.0, -(imageRect.size.height));
    
    CGContextClipToMask(context, imageRect, self.CGImage);//选中选区 获取不透明区域路径
    CGContextSetFillColorWithColor(context, maskColor.CGColor);//设置颜色
    CGContextFillRect(context, imageRect);//绘制
    
    newImage = UIGraphicsGetImageFromCurrentImageContext();//提取图片
    
    UIGraphicsEndImageContext();
    return newImage;
}

@end
