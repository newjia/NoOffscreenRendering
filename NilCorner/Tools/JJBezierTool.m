//
//  JJBezierTool.m
//  NilCorner
//
//  Created by 李佳 on 2020/7/15.
//  Copyright © 2020 李佳. All rights reserved.
//

#import "JJBezierTool.h"

@interface JJBezierTool ()

@property (nonatomic, assign) CGFloat radius;

@property (nonatomic, assign) float radius_TopLeft;
@property (nonatomic, assign) float radius_TopRight;
@property (nonatomic, assign) float radius_BottomLeft;
@property (nonatomic, assign) float radius_BottomRight;


@property (nonatomic, assign) CGSize rectSize;
@property (nonatomic, assign) UIColor *fillColor;
 
// 圆角角落的点
@property (nonatomic, assign) CGPoint hLeftUpPoint;
@property (nonatomic, assign) CGPoint hRightUpPoint;
@property (nonatomic, assign) CGPoint hLeftDownPoint;

@property (nonatomic, assign) CGPoint vLeftUpPoint;
@property (nonatomic, assign) CGPoint vRightDownPoint;

@property (nonatomic, assign) CGPoint centerLeftUp;
@property (nonatomic, assign) CGPoint centerRightUp;
@property (nonatomic, assign) CGPoint centerLeftDown;
@property (nonatomic, assign) CGPoint centerRightDown;


@end

@implementation JJBezierTool

- (JJBezierTool *)initWithRadius: (CGFloat)radius rectSize: (CGSize)rectSize fillColor: (UIColor *)fillColor{
    if (self = [super init]) {
        _radius = radius;
        _rectSize = rectSize;
        _fillColor = fillColor;
        [self config];
    }
    return self ;
}

- (void)config{
    _hLeftUpPoint = CGPointMake(0, 0);
    _hRightUpPoint = CGPointMake(_rectSize.width, 0);
    _hLeftDownPoint = CGPointMake(0, _rectSize.height);
    
    _vLeftUpPoint = CGPointMake(0, 0);
    _vRightDownPoint = CGPointMake(_rectSize.width, _rectSize.height);
    
    _centerLeftUp = CGPointMake(0, 0);
    _centerRightUp = CGPointMake(_rectSize.width, 0);
    _centerLeftDown = CGPointMake(0, _rectSize.height);
    _centerRightDown = CGPointMake(_rectSize.width, _rectSize.height);
}

- (void)configAllConer{
    [self configTopLeftPoint];
    [self configTopRightPoint];
    [self configBottomLeftPoint];
    [self configBottomRightPoint];
}

- (void)configTopLeftPoint {
    float radius = _radius_TopLeft ?: _radius;
    _hLeftUpPoint = CGPointMake(radius, 0);//（10,0）
    _vLeftUpPoint = CGPointMake(0, radius);//(0,10)
    _centerLeftUp = CGPointMake(radius, radius);//(10,10)
}

- (void)configTopRightPoint {
    float radius = _radius_TopRight ?: _radius;
    _hRightUpPoint = CGPointMake(_rectSize.width - radius, 0);//(30,0)
    _centerRightUp = CGPointMake(_rectSize.width - radius, radius);//(30,10)
}

- (void)configBottomLeftPoint {
    float radius = _radius_BottomLeft ?: _radius;
    _hLeftDownPoint = CGPointMake(radius, _rectSize.height);//(10,40)
    _centerLeftDown = CGPointMake(radius, _rectSize.height - radius);//(10,30)
}

- (void)configBottomRightPoint {
    float radius = _radius_BottomRight ?: _radius;
    _vRightDownPoint = CGPointMake(_rectSize.width, _rectSize.height - radius);//(40,30)
    _centerRightDown = CGPointMake(_rectSize.width - radius, _rectSize.height - radius);//(30,30)
}


// 绘制贝塞尔曲线
- (UIBezierPath *)configCornerBezierPath:(UIBezierPath *)bezierPath {
    [bezierPath moveToPoint:self.hLeftUpPoint];
    [bezierPath addLineToPoint:self.hRightUpPoint];
    [bezierPath addArcWithCenter:self.centerRightUp radius:self.radius_TopRight ?: self.radius startAngle:(CGFloat)(M_PI * 3 / 2) endAngle:(CGFloat)(M_PI * 2) clockwise: true];
    [bezierPath addLineToPoint:self.vRightDownPoint];
    [bezierPath addArcWithCenter:self.centerRightDown radius:self.radius_BottomRight ?: self.radius startAngle: 0 endAngle: (CGFloat)(M_PI / 2) clockwise: true];
    [bezierPath addLineToPoint:self.hLeftDownPoint];
    [bezierPath addArcWithCenter:self.centerLeftDown radius:self.radius_BottomLeft ?: self.radius startAngle: (CGFloat)(M_PI / 2) endAngle: (CGFloat)(M_PI) clockwise: true];
    [bezierPath addLineToPoint:self.vLeftUpPoint];
    [bezierPath addArcWithCenter:self.centerLeftUp radius:self.radius_TopLeft ?: self.radius startAngle: (CGFloat)(M_PI) endAngle: (CGFloat)(M_PI * 3 / 2) clockwise: true];
    [bezierPath addLineToPoint:self.hLeftUpPoint];
    [bezierPath closePath];
    
    [bezierPath moveToPoint:CGPointZero];
    [bezierPath addLineToPoint:CGPointMake(0, self.rectSize.height)];
    [bezierPath addLineToPoint:CGPointMake(self.rectSize.width, self.rectSize.height)];
    [bezierPath addLineToPoint:CGPointMake(self.rectSize.width, 0)];
    [bezierPath addLineToPoint:CGPointZero];
    [bezierPath closePath];

    [self.fillColor setFill];
    [bezierPath fill];
    return bezierPath;
}


@end
