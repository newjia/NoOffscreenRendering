//
//  JJBezierTool.h
//  NilCorner
//
//  Created by 李佳 on 2020/7/15.
//  Copyright © 2020 李佳. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN

@interface JJBezierTool : NSObject

- (JJBezierTool *)initWithRadius: (CGFloat)radius rectSize: (CGSize)rectSize fillColor: (UIColor *)color;

- (void)configAllConer;

- (void)configTopLeftPoint;

- (void)configTopRightPoint ;

- (void)configBottomLeftPoint;

- (void)configBottomRightPoint;

- (UIBezierPath *)configCornerBezierPath:(UIBezierPath *)bezierPath;
@end

NS_ASSUME_NONNULL_END
