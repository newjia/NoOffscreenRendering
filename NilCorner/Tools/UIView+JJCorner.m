//
//  UIView+JJCorner.m
//  NilCorner
//
//  Created by 李佳 on 2020/7/15.
//  Copyright © 2020 李佳. All rights reserved.
//

#import "UIView+JJCorner.h"
#import "JJRadiusTool.h"
@implementation UIView (JJCorner)
- (void)setConer: (CGFloat)radius{
    // 遮罩图片
    UIImageView *tempImageView = [[UIImageView alloc] init];
    tempImageView.frame = self.bounds;
    [self addSubview:tempImageView];
    
    UIColor *color =  self.superview.backgroundColor ? : [UIColor whiteColor];

    [self layoutIfNeeded];
 
    tempImageView.image = [JJRadiusTool drawRounderImage: radius
                                                    size: tempImageView.frame.size
                                               fillColor: color
                                                   style: UIRectCornerAllCorners];
    
}
@end
