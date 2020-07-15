//
//  JJRadiusTool.m
//  NilCorner
//
//  Created by 李佳 on 2020/7/15.
//  Copyright © 2020 李佳. All rights reserved.
//

#import "JJRadiusTool.h"
#import "JJBezierTool.h"

@implementation JJRadiusTool

+ (UIImage *)drawRounderImage: (CGFloat)radius size: (CGSize)rectSize fillColor: (UIColor *)color style: (UIRectCorner)style{
    
    UIGraphicsBeginImageContextWithOptions(rectSize, false, [UIScreen mainScreen].scale);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    [JJRadiusTool drawPathWithBezierPath:&path radius:radius rectSize:rectSize style:style fillColor:color];
 
    CGContextDrawPath(context, kCGPathFillStroke);
    
    UIImage *antiRoundCornerImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return antiRoundCornerImage;
    
}

+ (void)drawPathWithBezierPath: (UIBezierPath **)bezeier radius: (CGFloat)radius rectSize: (CGSize)rectSize style: (UIRectCorner)style fillColor: (UIColor *)fillColor{
    UIBezierPath *path = *bezeier;
    JJBezierTool *tool = [[JJBezierTool alloc] initWithRadius:radius rectSize:rectSize fillColor:fillColor];
    switch (style) {
        case UIRectCornerAllCorners:
            [tool configAllConer];
            break;
        case UIRectCornerTopLeft:
            [tool configTopLeftPoint];
            break;
        case UIRectCornerTopRight:
            [tool configTopRightPoint];
            break;
        case UIRectCornerBottomLeft:
            [tool configBottomLeftPoint];
            break;
        case UIRectCornerBottomRight:
            [tool configBottomRightPoint];
            break;
        default:
            break;
    }
    path = [tool configCornerBezierPath:path];
}


@end
