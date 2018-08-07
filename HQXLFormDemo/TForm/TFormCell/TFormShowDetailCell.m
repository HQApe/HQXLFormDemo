//
//  TFormShowDetailCell.m
//  HQXLFormDemo
//
//  Created by admin on 2018/8/2.
//  Copyright © 2018年 admin. All rights reserved.
//

#import "TFormShowDetailCell.h"
@interface TFormShowDetailCell ()

@property (strong, nonatomic) UILabel *detailLB;
@property (strong, nonatomic) UIButton *showBtn;

@end

@implementation TFormShowDetailCell

+(void)load
{
    [XLFormViewController.cellClassesForRowDescriptorTypes setObject:[TFormShowDetailCell class] forKey:TFormRowDescriptorTypeShow];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.showBtn.tf_right = self.contentView.tf_width - 15;
    self.showBtn.tf_centerY = self.contentView.tf_centerY;
    
    self.detailLB.tf_centerY = self.contentView.tf_centerY;
    self.detailLB.tf_width = self.contentView.tf_width - (self.titleLB.tf_right > self.subTitleLB.tf_right ? self.titleLB.tf_right:self.subTitleLB.tf_right) - 58;
    self.detailLB.tf_right = self.showBtn.tf_left - 11;
}

#pragma mark - XLFormDescriptorCell

- (void)configure
{
    [super configure];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    [self configureSubviews];
}

-(void)update
{
    [super update];
    [self updateSubviews];
}

#pragma mark - Private
- (void)configureSubviews {
    [self.contentView addSubview:self.detailLB];
    [self.contentView addSubview:self.showBtn];
}

- (void)updateSubviews {
    if ([self.rowDescriptor isKindOfClass:[TFormRowDescriptor class]]) {
        TFormRowDescriptorConfig *config = ((TFormRowDescriptor *)self.rowDescriptor).rowConfig;
        self.detailLB.text = config.detail;
    }
    UIImage *infoImage = [UIImage tf_svgimageWithName:@"tf_info" maskColor:self.themColor];
    [self.showBtn setImage:infoImage forState:UIControlStateNormal];
}


- (void)show:(UIButton *)button {
    if ([self.rowDescriptor isKindOfClass:[TFormRowDescriptor class]]) {
        TFormRowDescriptorConfig *config = ((TFormRowDescriptor *)self.rowDescriptor).rowConfig;
        if (config.showAction) {
            NSIndexPath *indexPath = [self.formViewController.form indexPathOfFormRow:self.rowDescriptor];
            config.showAction(indexPath);
        }
    }
}

#pragma mark - property

- (UILabel *)detailLB {
    if (_detailLB == nil) {
        _detailLB = [[UILabel alloc] initWithFrame:CGRectMake(KTFScreenW - 180, 15, KTFScreenW * 0.3, 20)];
        _detailLB.font = [UIFont systemFontOfSize:17];
        _detailLB.textColor = [UIColor tf_colorWithHexString:@"999999"];
        _detailLB.textAlignment = NSTextAlignmentRight;
    }
    return _detailLB;
}

- (UIButton *)showBtn {
    if (_showBtn == nil) {
        _showBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _showBtn.frame = CGRectMake(KTFScreenW - 160, 10, 22, 22);
        [_showBtn addTarget:self action:@selector(show:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _showBtn;
}


- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}



@end
