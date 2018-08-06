//
//  TFormSegmentCell.m
//  HQXLFormDemo
//
//  Created by admin on 2018/8/6.
//  Copyright © 2018年 admin. All rights reserved.
//

#import "TFormSegmentCell.h"
#import "NSObject+XLFormAdditions.h"
@interface TFormSegmentCell ()

@property (strong, nonatomic) UISegmentedControl *segmentedControl;

@end

@implementation TFormSegmentCell

+(void)load
{
    [XLFormViewController.cellClassesForRowDescriptorTypes setObject:[TFormSegmentCell class] forKey:TFormRowDescriptorTypeSegmentedControl];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.segmentedControl.tf_right = self.contentView.tf_width - 15;
    self.segmentedControl.tf_centerY = self.contentView.tf_centerY;
}

- (void)configure
{
    [super configure];
    
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    [self.contentView addSubview:self.segmentedControl];
}

- (void)update
{
    [super update];
    [self updateSegmentedControl];
    self.segmentedControl.selectedSegmentIndex = [self selectedIndex];
    self.segmentedControl.enabled = !self.rowDescriptor.isDisabled;
    self.segmentedControl.tf_width = [self getItems].count * 69;
    
    if (self.themColor) {
        self.segmentedControl.tintColor = self.themColor;
    }
}

#pragma mark - Helper

-(NSArray *)getItems
{
    NSMutableArray * result = [[NSMutableArray alloc] init];
    for (id option in self.rowDescriptor.selectorOptions)
        [result addObject:[option displayText]];
    return result;
}

-(void)updateSegmentedControl
{
    [self.segmentedControl removeAllSegments];
    
    [[self getItems] enumerateObjectsUsingBlock:^(id object, NSUInteger idex, __unused BOOL *stop){
        [self.segmentedControl insertSegmentWithTitle:[object displayText] atIndex:idex animated:NO];
    }];
}

-(NSInteger)selectedIndex
{
    if (self.rowDescriptor.value){
        for (id option in self.rowDescriptor.selectorOptions){
            if ([[option valueData] isEqual:[self.rowDescriptor.value valueData]]){
                return [self.rowDescriptor.selectorOptions indexOfObject:option];
            }
        }
    }
    return UISegmentedControlNoSegment;
}

#pragma mark - Events
-(void)valueChanged
{
    self.rowDescriptor.value = [self.rowDescriptor.selectorOptions objectAtIndex:self.segmentedControl.selectedSegmentIndex];
}

#pragma mark - Properties

-(UISegmentedControl *)segmentedControl
{
    if (_segmentedControl) return _segmentedControl;
    _segmentedControl = [[UISegmentedControl alloc] initWithFrame:CGRectMake(0, 0, 69, 28)];
    _segmentedControl.tintColor = [UIColor tf_colorWithHexString:@"24C77E"];
    [_segmentedControl addTarget:self action:@selector(valueChanged) forControlEvents:UIControlEventValueChanged];
    return _segmentedControl;
}

@end
