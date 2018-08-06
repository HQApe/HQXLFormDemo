//
//  TFormRatingCell.m
//  HQXLFormDemo
//
//  Created by admin on 2018/8/6.
//  Copyright © 2018年 admin. All rights reserved.
//

#import "TFormRatingCell.h"
#import "TRatingView.h"
@interface TFormRatingCell ()

@property (strong, nonatomic) TRatingView *ratingView;

@end

@implementation TFormRatingCell

+(void)load
{
    [XLFormViewController.cellClassesForRowDescriptorTypes setObject:[TFormRatingCell class] forKey:TFormRowDescriptorTypeRate];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.ratingView.tf_right = self.contentView.tf_width - 15;
    self.ratingView.tf_centerY = self.contentView.tf_centerY;
}

- (void)configure
{
    [super configure];
    
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    [self.contentView addSubview:self.ratingView];
}

- (void)update
{
    [super update];
    self.ratingView.value = [self.rowDescriptor.value floatValue];
    self.ratingView.enabled = !self.rowDescriptor.isDisabled;
    
    if (self.themColor) {
        self.ratingView.highlightColor = self.themColor;
    }
}

#pragma mark - Events

-(void)rateChanged:(TRatingView *)ratingView
{
    self.rowDescriptor.value = [NSNumber numberWithFloat:ratingView.value];
}



#pragma mark - property

- (TRatingView *)ratingView {
    if (_ratingView == nil) {
        _ratingView = [[TRatingView alloc] initWithFrame:CGRectMake(0, 0, 100, 30)];
        _ratingView.baseColor = [UIColor tf_colorWithHexString:@"E3E3E3"];
        _ratingView.highlightColor = [UIColor tf_colorWithHexString:@"FFB200"];
        _ratingView.markFont = [UIFont systemFontOfSize:23.0f];
        _ratingView.stepInterval = 0.5f;
        [_ratingView addTarget:self action:@selector(rateChanged:) forControlEvents:UIControlEventValueChanged];
    }
    return _ratingView;
}


@end
