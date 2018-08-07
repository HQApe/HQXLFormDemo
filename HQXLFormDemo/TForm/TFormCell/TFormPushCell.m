//
//  TFormPushCell.m
//  HQXLFormDemo
//
//  Created by admin on 2018/8/2.
//  Copyright © 2018年 admin. All rights reserved.
//

#import "TFormPushCell.h"
#import <SVGKit/SVGKit.h>
@interface TFormPushCell ()

@property (strong, nonatomic) UILabel *detailLB;
@property (strong, nonatomic) UIImageView *arrowIV;

@end


@implementation TFormPushCell

+(void)load
{
    [XLFormViewController.cellClassesForRowDescriptorTypes setObject:[TFormPushCell class] forKey:TFormRowDescriptorTypePush];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.arrowIV.tf_right = self.contentView.tf_width - 15;
    self.arrowIV.tf_centerY = self.contentView.tf_centerY;
    
    self.detailLB.tf_centerY = self.contentView.tf_centerY;
    self.detailLB.tf_width = self.contentView.tf_width - (self.titleLB.tf_right > self.subTitleLB.tf_right ? self.titleLB.tf_right:self.subTitleLB.tf_right) - 46;
    self.detailLB.tf_right = self.arrowIV.tf_left - 11;
    
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

-(void)formDescriptorCellDidSelectedWithFormController:(XLFormViewController *)controller
{
    if (self.rowDescriptor.action.formBlock){
        self.rowDescriptor.action.formBlock(self.rowDescriptor);
    }
    else if (self.rowDescriptor.action.formSelector){
        [controller performFormSelector:self.rowDescriptor.action.formSelector withObject:self.rowDescriptor];
    }
    else if ([self.rowDescriptor.action.formSegueIdentifier length] != 0){
        [controller performSegueWithIdentifier:self.rowDescriptor.action.formSegueIdentifier sender:self.rowDescriptor];
    }
    else if (self.rowDescriptor.action.formSegueClass){
        UIViewController * controllerToPresent = [self controllerToPresent];
        NSAssert(controllerToPresent, @"either rowDescriptor.action.viewControllerClass or rowDescriptor.action.viewControllerStoryboardId or rowDescriptor.action.viewControllerNibName must be assigned");
        UIStoryboardSegue * segue = [[self.rowDescriptor.action.formSegueClass alloc] initWithIdentifier:self.rowDescriptor.tag source:controller destination:controllerToPresent];
        [controller prepareForSegue:segue sender:self.rowDescriptor];
        [segue perform];
    }
    else{
        UIViewController * controllerToPresent = [self controllerToPresent];
        if (controllerToPresent){
            if ([controllerToPresent conformsToProtocol:@protocol(XLFormRowDescriptorViewController)]){
                ((UIViewController<XLFormRowDescriptorViewController> *)controllerToPresent).rowDescriptor = self.rowDescriptor;
            }
            if (controller.navigationController == nil || [controllerToPresent isKindOfClass:[UINavigationController class]] || self.rowDescriptor.action.viewControllerPresentationMode == XLFormPresentationModePresent){
                [controller presentViewController:controllerToPresent animated:YES completion:nil];
            }
            else{
                [controller.navigationController pushViewController:controllerToPresent animated:YES];
            }
        }
        
    }
}

#pragma mark - Helpers

-(UIViewController *)controllerToPresent
{
    if (self.rowDescriptor.action.viewControllerClass){
        return [[self.rowDescriptor.action.viewControllerClass alloc] init];
    }
    else if ([self.rowDescriptor.action.viewControllerStoryboardId length] != 0){
        UIStoryboard * storyboard =  [self storyboardToPresent];
        NSAssert(storyboard != nil, @"You must provide a storyboard when rowDescriptor.action.viewControllerStoryboardId is used");
        return [storyboard instantiateViewControllerWithIdentifier:self.rowDescriptor.action.viewControllerStoryboardId];
    }
    else if ([self.rowDescriptor.action.viewControllerNibName length] != 0){
        Class viewControllerClass = NSClassFromString(self.rowDescriptor.action.viewControllerNibName);
        NSAssert(viewControllerClass, @"class owner of self.rowDescriptor.action.viewControllerNibName must be equal to %@", self.rowDescriptor.action.viewControllerNibName);
        return [[viewControllerClass alloc] initWithNibName:self.rowDescriptor.action.viewControllerNibName bundle:nil];
    }
    return nil;
}

-(UIStoryboard *)storyboardToPresent
{
    if ([self.formViewController respondsToSelector:@selector(storyboardForRow:)]){
        return [self.formViewController storyboardForRow:self.rowDescriptor];
    }
    if (self.formViewController.storyboard){
        return self.formViewController.storyboard;
    }
    return nil;
}

#pragma mark - Private
- (void)configureSubviews {
    [self.contentView addSubview:self.detailLB];
    [self.contentView addSubview:self.arrowIV];
}

- (void)updateSubviews {
    if ([self.rowDescriptor isKindOfClass:[TFormRowDescriptor class]]) {
        TFormRowDescriptorConfig *config = ((TFormRowDescriptor *)self.rowDescriptor).rowConfig;
        self.detailLB.text = config.detail;
    }
    
    self.arrowIV.image = [UIImage tf_svgimageWithName:@"tf_arrow" maskColor:self.themColor];
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

- (UIImageView *)arrowIV {
    if (_arrowIV == nil) {
        _arrowIV = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 10, 16)];
    }
    return _arrowIV;
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
