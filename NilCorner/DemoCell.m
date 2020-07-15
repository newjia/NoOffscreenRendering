//
//  DemoCell.m
//  NilCorner
//
//  Created by 李佳 on 2020/7/15.
//  Copyright © 2020 李佳. All rights reserved.
//

#import "DemoCell.h"
#import "UIView+JJCorner.h"
@implementation DemoCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.backgroundColor = [UIColor whiteColor];
        wallIV = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"w.png"]];
        wallIV.frame = CGRectMake(10, 10, 60, 60);
        [wallIV setConer:10];
        [self addSubview:wallIV];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return self;
}

@end
