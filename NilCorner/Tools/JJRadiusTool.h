//
//  JJRadiusTool.h
//  NilCorner
//
//  Created by 李佳 on 2020/7/15.
//  Copyright © 2020 李佳. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN

@interface JJRadiusTool : NSObject

+ (UIImage *)drawRounderImage: (CGFloat)radius size: (CGSize)rectSize fillColor: (UIColor *)color style: (UIRectCorner)style;

@end

NS_ASSUME_NONNULL_END
