//
//  UIImage+ImageColor.h
//  SVGDemo
//
//  Created by admin on 2018/8/1.
//  Copyright © 2018年 admin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (TFormExtension)


/**
 通过SVG矢量图获得UIImage

 @param imageName 矢量图名称
 @param maskColor 渲染颜色
 @return UIImage
 */
+ (UIImage *)tf_svgimageWithName:(NSString *)imageName maskColor:(UIColor *)maskColor;

- (UIImage *)tf_imageMaskWithColor:(UIColor *)maskColor;

@end
