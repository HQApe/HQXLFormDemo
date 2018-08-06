//
//  HQXLSystemViewController.m
//  HQXLFormDemo
//
//  Created by admin on 2018/8/6.
//  Copyright © 2018年 admin. All rights reserved.
//

#import "HQXLSystemViewController.h"

@interface HQXLSystemViewController ()

@end

@implementation HQXLSystemViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initializeForm];
}

#pragma mark - Helper

-(void)initializeForm
{
    XLFormDescriptor * form;
    XLFormSectionDescriptor * section;
    XLFormRowDescriptor * row;
    
    //表单
    form = [XLFormDescriptor formDescriptor];
    
    //Switch
    section = [XLFormSectionDescriptor formSectionWithTitle:@"Switch"];
    [form addFormSection:section];
    
    row = [XLFormRowDescriptor formRowDescriptorWithTag:@"Switch" rowType:XLFormRowDescriptorTypeBooleanSwitch title:@"标题文字"];
    row.height = 50;
    [section addFormRow:row];
    
    //Slider
    section = [XLFormSectionDescriptor formSectionWithTitle:@"Slider"];
    section.footerTitle = nil;
    [form addFormSection:section];
    //需要改
    row = [XLFormRowDescriptor formRowDescriptorWithTag:@"Slider" rowType:XLFormRowDescriptorTypeSlider title:@"Slider"];
    row.value = @(30);
    [row.cellConfigAtConfigure setObject:@(100) forKey:@"slider.maximumValue"];
    [row.cellConfigAtConfigure setObject:@(10) forKey:@"slider.minimumValue"];
    [row.cellConfigAtConfigure setObject:@(4) forKey:@"steps"];
    [section addFormRow:row];
    
    //TextField
    section = [XLFormSectionDescriptor formSectionWithTitle:@"TextField"];
    [form addFormSection:section];
    
    row = [XLFormRowDescriptor formRowDescriptorWithTag:@"TextField" rowType:XLFormRowDescriptorTypeText title:@"标题文字"];
    [row.cellConfigAtConfigure setObject:[UIColor cyanColor] forKey:@"textField.backgroundColor"];
    row.height = 50;
    [section addFormRow:row];
    
    //Stepper
    section = [XLFormSectionDescriptor formSectionWithTitle:@"Stepper"];
    [form addFormSection:section];
    
    row = [XLFormRowDescriptor formRowDescriptorWithTag:@"Stepper" rowType:XLFormRowDescriptorTypeStepCounter title:@"标题文字"];
    row.height = 50;
    row.value = @10;
    [row.cellConfigAtConfigure setObject:@YES forKey:@"stepControl.wraps"];
    [row.cellConfigAtConfigure setObject:@10 forKey:@"stepControl.stepValue"];
    [row.cellConfigAtConfigure setObject:@10 forKey:@"stepControl.minimumValue"];
    [row.cellConfigAtConfigure setObject:@100 forKey:@"stepControl.maximumValue"];
    [row.cellConfigAtConfigure setObject:UIColor.redColor forKey:@"stepControl.tintColor"];
    [row.cellConfigAtConfigure setObject:UIColor.redColor forKey:@"currentStepValue.textColor"];
    
    [section addFormRow:row];
    
    //Segment
    section = [XLFormSectionDescriptor formSectionWithTitle:@"Segment"];
    [form addFormSection:section];
    
    row = [XLFormRowDescriptor formRowDescriptorWithTag:@"Segment" rowType:XLFormRowDescriptorTypeSelectorSegmentedControl title:@"标题文字"];
    row.height = 50;
    row.selectorOptions = @[@"Apple", @"Orange", @"Pear"];
    row.value = @"Pear";
    [section addFormRow:row];
    
    //Disable
    section = [XLFormSectionDescriptor formSectionWithTitle:@"Disable"];
    [form addFormSection:section];
    
    row = [XLFormRowDescriptor formRowDescriptorWithTag:@"Disable" rowType:XLFormRowDescriptorTypeText];
    row.height = 50;
    row.disabled = @YES;
    row.value = @"本文默认不可编辑";
    [section addFormRow:row];
    
    //PushDetail
    section = [XLFormSectionDescriptor formSectionWithTitle:@"PushDetail"];
    [form addFormSection:section];
    
    row = [XLFormRowDescriptor formRowDescriptorWithTag:@"PushDetail" rowType:XLFormRowDescriptorTypeButton title:@"标题文字"];
    row.action.viewControllerClass = [UIViewController class];
    [section addFormRow:row];
    
    //TextView
    section = [XLFormSectionDescriptor formSectionWithTitle:@"TextView"];
    [form addFormSection:section];

    row = [XLFormRowDescriptor formRowDescriptorWithTag:@"TextView" rowType:XLFormRowDescriptorTypeTextView];
    [row.cellConfigAtConfigure setObject:@"请输入文字" forKey:@"textView.placeholder"];
    row.height = 100;
    [section addFormRow:row];
    
    // Name Section
    section = [XLFormSectionDescriptor formSectionWithTitle:@"Validation Required"];
    [form addFormSection:section];
    // Name
    row = [XLFormRowDescriptor formRowDescriptorWithTag:@"name" rowType:XLFormRowDescriptorTypeText title:@"Name"];
    [row.cellConfigAtConfigure setObject:@"Required..." forKey:@"textField.placeholder"];
    [row.cellConfigAtConfigure setObject:@(NSTextAlignmentRight) forKey:@"textField.textAlignment"];
    row.required = YES;
    row.value = @"Martin";
    [section addFormRow:row];
    
    self.form = form;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
