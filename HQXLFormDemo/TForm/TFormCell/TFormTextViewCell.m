//
//  TFormTextViewCell.m
//  HQXLFormDemo
//
//  Created by admin on 2018/8/3.
//  Copyright © 2018年 admin. All rights reserved.
//

#import "TFormTextViewCell.h"
#import "TFormCommon.h"

@implementation TFormTextViewCell

+(void)load
{
    [XLFormViewController.cellClassesForRowDescriptorTypes setObject:[TFormTextViewCell class] forKey:TFormRowDescriptorTypeTextView];
}

#pragma mark - XLFormDescriptorCell

-(void)configure
{
    [self setSelectionStyle:UITableViewCellSelectionStyleNone];
    [self.contentView addSubview:self.textLabel];
    [self.contentView addSubview:self.textView];
    [self.textLabel addObserver:self forKeyPath:@"text" options:NSKeyValueObservingOptionOld | NSKeyValueObservingOptionNew context:0];
    NSDictionary * views = @{@"label": self.textLabel, @"textView": self.textView};
    [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-12-[label]" options:0 metrics:0 views:views]];
    [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-4-[textView]-4-|" options:0 metrics:0 views:views]];
}

- (void)update {
    [super update];
    self.textLabel.textColor = [UIColor tf_colorWithHexString:@"333333"];
    self.textView.textColor = [UIColor tf_colorWithHexString:@"999999"];
    self.textView.placeholderColor = [UIColor tf_colorWithHexString:@"cccccc"];
    
    if (self.themColor) {
        self.textView.tintColor = self.themColor;
    }
}

-(void)highlight
{
}

@end
