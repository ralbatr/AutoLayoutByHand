//
//  ViewController.m
//  SBTest
//
//  Created by Ralbatr Yi on 14-10-29.
//  Copyright (c) 2014年 Ralbatr Yi. All rights reserved.
//

#import "ViewController.h"
#import "UIView+Autolayout.h"

@interface ViewController ()
@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UILabel *label;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    [self layout4];
    [self layoutCenter];
}

- (void)layoutCenter
{
    self.imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"delete_default.png"]];
    [self.view addSubview:self.imageView];
    
    self.label = [[UILabel alloc] init];
    self.label.text = @"WATCH";
    self.label.font = [UIFont boldSystemFontOfSize:45.0];
    [self.view addSubview:self.label];
    
    UIView *helperView = [[UIView alloc] init];
    [self.view addSubview:helperView];
    
    self.imageView.translatesAutoresizingMaskIntoConstraints = NO;
    self.label.translatesAutoresizingMaskIntoConstraints = NO;
    helperView.translatesAutoresizingMaskIntoConstraints = NO;
    
    NSDictionary *viewsDictionary = @{@"imageView":self.imageView,
                                      @"label":self.label};
    
    NSArray *constraintH = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-(>=0)-[imageView]-[label]-(>=0)-|"
                                                                   options:0
                                                                   metrics:nil
                                                                     views:viewsDictionary];
    
    
    NSLayoutConstraint *constraint1 =[NSLayoutConstraint constraintWithItem:self.imageView
                                                                  attribute:NSLayoutAttributeTop
                                                                  relatedBy:NSLayoutRelationEqual
                                                                     toItem:self.view
                                                                  attribute:NSLayoutAttributeTop
                                                                 multiplier:1
                                                                   constant:100];
    
    NSLayoutConstraint *constraint2 = [NSLayoutConstraint constraintWithItem:self.label
                                                                   attribute:NSLayoutAttributeCenterY
                                                                   relatedBy:NSLayoutRelationEqual
                                                                      toItem:self.imageView
                                                                   attribute:NSLayoutAttributeCenterY
                                                                  multiplier:1
                                                                    constant:5];
    
    // nix 的妙想：利用 helperView 将 iconImage 和 label “合起来” X 居中
    NSLayoutConstraint *constraint3 =[NSLayoutConstraint constraintWithItem:helperView
                                                                  attribute:NSLayoutAttributeLeft
                                                                  relatedBy:NSLayoutRelationEqual
                                                                     toItem:self.imageView
                                                                  attribute:NSLayoutAttributeLeft
                                                                 multiplier:1
                                                                   constant:0];
    
    NSLayoutConstraint *constraint4 =[NSLayoutConstraint constraintWithItem:helperView
                                                                  attribute:NSLayoutAttributeRight
                                                                  relatedBy:NSLayoutRelationEqual
                                                                     toItem:self.label
                                                                  attribute:NSLayoutAttributeRight
                                                                 multiplier:1
                                                                   constant:0];
    
    NSLayoutConstraint *constraint5 =[NSLayoutConstraint constraintWithItem:helperView
                                                                  attribute:NSLayoutAttributeCenterX
                                                                  relatedBy:NSLayoutRelationEqual
                                                                     toItem:self.view
                                                                  attribute:NSLayoutAttributeCenterX
                                                                 multiplier:1
                                                                   constant:0];
    
    
    
    [self.view addConstraints:constraintH];
    
    [self.view addConstraint:constraint1];
    [self.view addConstraint:constraint2];
    
    [self.view addConstraint:constraint3];
    [self.view addConstraint:constraint4];
    [self.view addConstraint:constraint5];
}

- (void)layout1
{
//    UIButton *headImageView = [[UIButton alloc] init];
    UIImageView *headImageView = [[UIImageView alloc] init];
    headImageView.image = [UIImage imageNamed:@"delete_default.png"];
//    headImageView.backgroundColor = [UIColor orangeColor];
    headImageView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:headImageView];
    
    NSDictionary *imageDic = NSDictionaryOfVariableBindings(headImageView);
    NSArray *constraintsArray1 = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[headImageView]" options:0 metrics:nil views:imageDic];
    [self.view addConstraints:constraintsArray1];
    NSArray *constraintsArray2 = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-20-[headImageView]" options:NSLayoutFormatAlignAllTop metrics:nil views:imageDic];
    [self.view addConstraints:constraintsArray1];
    [self.view addConstraints:constraintsArray2];
    
    UILabel *nameLabel = [[UILabel alloc] init];
    nameLabel.text = @"张国荣";
    nameLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:nameLabel];
    
    NSDictionary *constrainsArray2 = NSDictionaryOfVariableBindings(headImageView,nameLabel);
    NSArray *constraintsArray3 = [NSLayoutConstraint constraintsWithVisualFormat:@"[headImageView]-20-[nameLabel]" options:0 metrics:0 views:constrainsArray2];
    NSArray *constraintsArray4 = [NSLayoutConstraint constraintsWithVisualFormat:@"[headImageView]-20-[nameLabel]" options:0 metrics:0 views:constrainsArray2];
    [self.view addConstraints:constraintsArray3];
}

- (void)layout2
{
    // Get a reference to the superview
    UIView *superview = self.view;
    
    //Create a label
    UILabel *mylabel = [[UILabel alloc]init];
    mylabel.bounds = CGRectMake(0, 0, 50, 30);
    [mylabel setTranslatesAutoresizingMaskIntoConstraints:NO];
    mylabel.text = @"My Label";
    
    //Create a button
    UIButton *mybutton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    mybutton.bounds = CGRectMake(0, 0, 50, 30);
    [mybutton setTitle:@"My Button" forState:UIControlStateNormal];
    [mybutton setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    //Add the button and label to the superview
    [superview addSubview:mylabel];
    [superview addSubview:mybutton];
    
    // Get the views dictionary
    NSDictionary *viewsDictionary =
    NSDictionaryOfVariableBindings(mylabel, mybutton);
    
     //两个控件 宽度相等
    NSArray *constraintsArray = [NSLayoutConstraint
                                 constraintsWithVisualFormat:@"H:|-60-[mybutton]-[mylabel(==mybutton)]-|"
                                 options:NSLayoutFormatAlignAllBaseline metrics:nil
                                 views:viewsDictionary];
   
    // mybutton 距离上边的距离为 100
    NSArray *constraintsArray1 = [NSLayoutConstraint
                                 constraintsWithVisualFormat:@"V:|-100-[mybutton]"
                                 options:NSLayoutFormatAlignAllBaseline metrics:nil
                                 views:viewsDictionary];
    
    NSLog(@"constrains count %d",constraintsArray.count);
    //Work through the array of constraints, applying each to the superview
    for (int i = 0; i<constraintsArray.count; i++) {
        [superview addConstraint:constraintsArray[i]];
    }
    [superview addConstraints:constraintsArray1];
}

- (void)layout3
{
    // Create our three labels using the category method
    
    UILabel *one = [UILabel autolayoutView];
    UILabel *two = [UILabel autolayoutView];
    UILabel *three = [UILabel autolayoutView];
    
    // Put some content in there for illustrations
    NSInteger labelNumber = 0;
    for (UILabel *label in @[one,two,three])
    {
        label.backgroundColor = [UIColor redColor];
        label.textAlignment = NSTextAlignmentCenter;
        label.text = [NSString stringWithFormat:@"%d",labelNumber++];
        [self.view addSubview:label];
    }
    
    // Create the views and metrics dictionaries
    NSDictionary *metrics = @{@"height":@50.0};
    NSDictionary *views = NSDictionaryOfVariableBindings(one,two,three);
    
    // Horizontal layout - note the options for aligning the top and bottom of all views
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"|-[one(two)]-[two(three)]-[three]-|" options:NSLayoutFormatAlignAllTop | NSLayoutFormatAlignAllBottom metrics:metrics views:views]];
    
    // Vertical layout - we only need one "column" of information because of the alignment options used when creating the horizontal layout
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[one(height)]-|" options:0 metrics:metrics views:views]];
}

- (void)layout4
{
    
    UIView *headerView = [UIView autolayoutView];
    headerView.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:headerView];
    
    UILabel *headline = [UILabel autolayoutView];
    headline.font = [UIFont systemFontOfSize:30.0];
    headline.numberOfLines = 0;
    headline.preferredMaxLayoutWidth = 125.0; // This is necessary to allow the label to use multi-line text properly
    headline.backgroundColor = [UIColor yellowColor]; // So we can see the sizing
    headline.text = @"Kitten kills again";
    [headerView addSubview:headline];
    
    UILabel *byline = [UILabel autolayoutView];
    byline.font = [UIFont systemFontOfSize:14.0];
    byline.backgroundColor = [UIColor greenColor]; // So we can see the sizing
    byline.text = @"Paws McGruff";
    
    [headerView addSubview:byline];
    
    UIImageView *imageView = [UIImageView autolayoutView];
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    [headerView addSubview:imageView];
    
    // Lovely image loaded for example purposes
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        UIImage *kitten = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:@"http://placekitten.com/150/150"] options:0 error:nil]];
        dispatch_async(dispatch_get_main_queue(), ^{
            imageView.image = kitten;
        });
    });
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.translatesAutoresizingMaskIntoConstraints = NO;
    button.backgroundColor = [UIColor orangeColor];
    [button setTitle:@"Button" forState:UIControlStateNormal];
    [headerView addSubview:button];
    
    // Layout
    
    NSDictionary *views = NSDictionaryOfVariableBindings(headerView,headline,byline,imageView,button);
    NSDictionary *metrics = @{@"imageEdge":@150.0,@"padding":@15.0};
    //  图像 大小 ，边缘 宽度
    // Header view fills the width of its superview
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"|[headerView]|" options:0 metrics:metrics views:views]];
    // Header view is pinned to the top of the superview
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-22-[headerView]" options:0 metrics:metrics views:views]];
    
    // Headline and image horizontal layout
    [headerView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"|-padding-[headline]-padding-[imageView(imageEdge)]-padding-|" options:0 metrics:metrics views:views]];
    
    // Headline and byline vertical layout - spacing at least zero between the two
    [headerView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-padding-[headline]->=0-[byline]-padding-|" options:NSLayoutFormatAlignAllLeft metrics:metrics views:views]];
    
    // Image and button vertical layout - spacing at least 15 between the two
    [headerView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-padding-[imageView(imageEdge)]->=padding-[button]-padding-|" options:NSLayoutFormatAlignAllLeft | NSLayoutFormatAlignAllRight metrics:metrics views:views]];
}

- (void)layout5 {
    UIImageView *headImageView = [UIImageView autolayoutView];
    headImageView.image = [UIImage imageNamed:@"delete_default.png"];
    [self.view addSubview:headImageView];
    
    UIImageView *sexImageView = [UIImageView autolayoutView];
    sexImageView.image = [UIImage imageNamed:@"more_point.png"];
    [self.view addSubview:sexImageView];
    
    UILabel *nameLabel = [UILabel autolayoutView];
    nameLabel.text = @"我的名字是";
    [self.view addSubview:nameLabel];
    
    UILabel *ageLabel = [UILabel autolayoutView];
    ageLabel.text = @"100年";
    [self.view addSubview:ageLabel];
    
    UILabel *majorLabel = [UILabel autolayoutView];
    majorLabel.text = @"计算机";
    [self.view addSubview:majorLabel];
    
    UIImageView *detailImageView = [UIImageView autolayoutView];
    detailImageView.image = [UIImage imageNamed:@"delete_default.png"];
    [self.view addSubview:detailImageView];
    
    NSDictionary *metrics = @{@"imageEdge":@150.0,@"padding":@15.0};
    
    NSDictionary *viewsDic = NSDictionaryOfVariableBindings(headImageView,sexImageView,nameLabel,detailImageView,ageLabel,majorLabel);
    // 水平排列 头像 姓名 性别 年龄 ->=0-[detailImageView]-5-
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[headImageView]-20-[nameLabel]-4-[sexImageView]-4-[ageLabel]" options:NSLayoutFormatAlignAllTop metrics:0 views:viewsDic]];
    //距离 上方 22 点
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-22-[headImageView]" options:0 metrics:0 views:viewsDic]];
    // 与 姓名 左对齐
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-[nameLabel]-[majorLabel]" options:NSLayoutFormatAlignAllLeft metrics:0 views:viewsDic]];
    // 详细按钮 从左边 标准间隔
//    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[detailImageView]-0-|" options:0 metrics:0 views:viewsDic]];
    // 详细按钮 距离上边
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-25-[detailImageView]" options:0 metrics:0 views:viewsDic]];
    
//    |-padding-[headline]-padding-[imageView(imageEdge)]-padding-|
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"|->=0-[detailImageView]-0-|" options:0 metrics:metrics views:viewsDic]];
}

@end
