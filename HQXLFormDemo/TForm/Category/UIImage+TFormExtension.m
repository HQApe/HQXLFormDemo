//
//  UIImage+ImageColor.m
//  SVGDemo
//
//  Created by admin on 2018/8/1.
//  Copyright © 2018年 admin. All rights reserved.
//

#import "UIImage+TFormExtension.h"
//#import <SVGKit/SVGKit.h>
#import "TFormBasicCell.h"
#import <CoreText/CoreText.h>

@implementation UIImage (TFormExtension)

+ (UIImage *)tf_svgimageWithName:(NSString *)imageName maskColor:(UIColor *)maskColor
{
    return [self iconWithName:imageName markSize:22 color:maskColor];
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

+ (UIImage *)iconWithName:(NSString *)markCharacter markSize:(CGFloat)markSize color:(UIColor *)maskColor
{
    CGFloat scale = [UIScreen mainScreen].scale;
    CGFloat realSize = markSize * scale;
    UIFont *font = [UIFont fontWithName:@"iconfont" size:realSize];
    CGSize imageSize = [self markCharacterSize:markCharacter font:font];
    UIGraphicsBeginImageContext(imageSize);
    CGContextRef context = UIGraphicsGetCurrentContext();
    if ([markCharacter respondsToSelector:@selector(drawAtPoint:withAttributes:)]) {
        [markCharacter drawAtPoint:CGPointZero withAttributes:@{NSFontAttributeName:font, NSForegroundColorAttributeName:maskColor}];
    } else {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
        CGContextSetFillColorWithColor(context, maskColor.CGColor);
        [markCharacter drawAtPoint:CGPointZero withFont:font];
#pragma clang pop
    }
    UIImage *image = [UIImage imageWithCGImage:UIGraphicsGetImageFromCurrentImageContext().CGImage scale:scale orientation:UIImageOrientationUp];
    UIGraphicsEndImageContext();

    return image;
}

+ (CGSize)markCharacterSize:(NSString *)markCharacter font:(UIFont *)markFont{
        CGSize size = CGSizeZero;
        if ([markCharacter respondsToSelector:@selector(sizeWithAttributes:)]) {
            size = [markCharacter sizeWithAttributes:@{NSFontAttributeName:markFont}];
        } else {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
            size = [markCharacter sizeWithFont:markFont];
#pragma clang diagnostic pop
        }
    return size;
}

@end
