//
//  UIView+Autolayout.m
//  SBTest
//
//  Created by Ralbatr Yi on 14-10-30.
//  Copyright (c) 2014年 Ralbatr Yi. All rights reserved.
//

#import "UIView+Autolayout.h"

@implementation UIView (Autolayout)
+(id)autolayoutView
{
    UIView *view = [self new];
    view.translatesAutoresizingMaskIntoConstraints = NO;
    return view;
}
@end