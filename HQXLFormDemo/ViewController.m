//
//  ViewController.m
//  HQXLFormDemo
//
//  Created by admin on 2018/7/23.
//  Copyright © 2018年 admin. All rights reserved.
//

#import "ViewController.h"

#import "TFormCommon.h"
#import <Toast.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self initializeForm];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"动作" style:UIBarButtonItemStylePlain target:self action:@selector(action:)];
}



#pragma mark - Helper

-(void)initializeForm
{
    XLFormDescriptor * form;
    XLFormSectionDescriptor * section;
    XLFormRowDescriptor * row;
    
    //表单
    form = [XLFormDescriptor formDescriptor];
    
    //DispalyOnly
    section = [XLFormSectionDescriptor formSectionWithTitle:@"DispalyOnly"];
    [form addFormSection:section];
    
    
    TFormRowDescriptorConfig *config = [TFormRowDescriptorConfig configWithIcon:nil title:@"标题文字标题标题表" subTitle:nil detail:@"标题文字标题文字标题文字标题文字标题文字" action:nil];
    row = [TFormRowDescriptor formRowDescriptorWithTag:@"DispalyOnly" rowType:TFormRowDescriptorTypeDisplayOnly rowConfig:config];
    [row.cellConfigAtConfigure setObject:[UIColor purpleColor] forKey:@"titleLB.textColor"];
    [section addFormRow:row];
    
    config = [TFormRowDescriptorConfig configWithIcon:@"progress" title:@"标题文字标题" subTitle:@"子标题dfssfsd子标题啊" detail:@"标题文字标题文字标题文字" action:nil];
    row = [TFormRowDescriptor formRowDescriptorWithTag:@"DispalyOnly" rowType:TFormRowDescriptorTypeDisplayOnly rowConfig:config];
    
    [row.cellConfigAtConfigure setObject:[UIColor purpleColor] forKey:@"themColor"];
    [row.cellConfigAtConfigure setObject:[UIColor purpleColor] forKey:@"titleLB.textColor"];
    [row.cellConfigAtConfigure setObject:[UIColor purpleColor] forKey:@"subTitleLB.textColor"];
    [section addFormRow:row];
    
    //ShowPush
    section = [XLFormSectionDescriptor formSectionWithTitle:@"ShowAndPush"];
    [form addFormSection:section];
    config = [TFormRowDescriptorConfig configWithIcon:nil title:@"标题文字" subTitle:nil detail:nil action:^(NSIndexPath *indexPath) {
        [self showToast:[NSString stringWithFormat:@"点击了Section==%ld， row==%ld", indexPath.section, indexPath.row]];
    }];
    row = [TFormRowDescriptor formRowDescriptorWithTag:@"ShowPush" rowType:TFormRowDescriptorTypeShowPush rowConfig:config];
    [row.cellConfigAtConfigure setObject:[UIColor purpleColor] forKey:@"themColor"];
    row.action.formBlock = ^(XLFormRowDescriptor * _Nonnull sender) {
        UIViewController *vc = [[UIViewController alloc] init];
        vc.view.backgroundColor = [UIColor whiteColor];
        [self.navigationController pushViewController:vc animated:YES];
    };
    [section addFormRow:row];
    
    config = [TFormRowDescriptorConfig configWithIcon:@"progress" title:@"标题文字标题" subTitle:@"子标题" detail:@"详情标" action:^(NSIndexPath *indexPath) {
        [self showToast:[NSString stringWithFormat:@"点击了Section==%ld， row==%ld", indexPath.section, indexPath.row]];
    }];
    row = [TFormRowDescriptor formRowDescriptorWithTag:@"ShowPush" rowType:TFormRowDescriptorTypeShowPush rowConfig:config];
    [row.cellConfigAtConfigure setObject:[UIColor purpleColor] forKey:@"themColor"];
    row.action.formBlock = ^(XLFormRowDescriptor * _Nonnull sender) {
        UIViewController *vc = [[UIViewController alloc] init];
        vc.view.backgroundColor = [UIColor whiteColor];
        [self.navigationController pushViewController:vc animated:YES];
    };
    [section addFormRow:row];
    
    //Show
    section = [XLFormSectionDescriptor formSectionWithTitle:@"Show"];
    [form addFormSection:section];
    config = [TFormRowDescriptorConfig configWithIcon:nil title:@"标题文字" subTitle:nil detail:nil action:^(NSIndexPath *indexPath) {
        [self showToast:[NSString stringWithFormat:@"点击了Section==%ld， row==%ld", indexPath.section, indexPath.row]];
    }];
    row = [TFormRowDescriptor formRowDescriptorWithTag:@"Show" rowType:TFormRowDescriptorTypeShow rowConfig:config];
    [row.cellConfigAtConfigure setObject:[UIColor purpleColor] forKey:@"themColor"];
    [section addFormRow:row];
    
    config = [TFormRowDescriptorConfig configWithIcon:@"progress" title:@"标题文字" subTitle:@"子标题" detail:@"详情" action:^(NSIndexPath *indexPath) {
        [self showToast:[NSString stringWithFormat:@"点击了Section==%ld， row==%ld", indexPath.section, indexPath.row]];
    }];
    row = [TFormRowDescriptor formRowDescriptorWithTag:@"Show" rowType:TFormRowDescriptorTypeShow rowConfig:config];
    [row.cellConfigAtConfigure setObject:[UIColor purpleColor] forKey:@"themColor"];
    [section addFormRow:row];
    
    //Push
    section = [XLFormSectionDescriptor formSectionWithTitle:@"Push"];
    [form addFormSection:section];
    config = [TFormRowDescriptorConfig configWithIcon:nil title:@"标题文字" subTitle:nil detail:nil action:nil];
    row = [TFormRowDescriptor formRowDescriptorWithTag:@"Push" rowType:TFormRowDescriptorTypePush rowConfig:config];
    [row.cellConfigAtConfigure setObject:[UIColor purpleColor] forKey:@"themColor"];
    row.action.formBlock = ^(XLFormRowDescriptor * _Nonnull sender) {
        UIViewController *vc = [[UIViewController alloc] init];
        vc.view.backgroundColor = [UIColor whiteColor];
        [self.navigationController pushViewController:vc animated:YES];
    };
    [section addFormRow:row];
    
    config = [TFormRowDescriptorConfig configWithIcon:@"progress" title:@"标题文字" subTitle:@"子标题" detail:@"详情" action:nil];
    row = [TFormRowDescriptor formRowDescriptorWithTag:@"Push" rowType:TFormRowDescriptorTypePush rowConfig:config];
    [row.cellConfigAtConfigure setObject:[UIColor purpleColor] forKey:@"themColor"];
    row.action.formBlock = ^(XLFormRowDescriptor * _Nonnull sender) {
        UIViewController *vc = [[UIViewController alloc] init];
        vc.view.backgroundColor = [UIColor whiteColor];
        [self.navigationController pushViewController:vc animated:YES];
    };
    [section addFormRow:row];
    
    //Check
    section = [XLFormSectionDescriptor formSectionWithTitle:@"Check"];
    [form addFormSection:section];
    config = [TFormRowDescriptorConfig configWithIcon:nil title:@"标题文字" subTitle:nil detail:nil action:nil];
    row = [TFormRowDescriptor formRowDescriptorWithTag:@"Check" rowType:TFormRowDescriptorTypeBooleanCheck rowConfig:config];
    [row.cellConfigAtConfigure setObject:[UIColor purpleColor] forKey:@"themColor"];
    row.value = @(YES);
    row.required = YES;
    [section addFormRow:row];
    
    config = [TFormRowDescriptorConfig configWithIcon:@"progress" title:@"标题文字" subTitle:@"子标题" detail:@"详情" action:nil];
    row = [TFormRowDescriptor formRowDescriptorWithTag:@"Check" rowType:TFormRowDescriptorTypeBooleanCheck rowConfig:config];
    [row.cellConfigAtConfigure setObject:[UIColor purpleColor] forKey:@"themColor"];
    row.required = YES;
    [section addFormRow:row];
    
    //Switch
    section = [XLFormSectionDescriptor formSectionWithTitle:@"Switch"];
    [form addFormSection:section];
    config = [TFormRowDescriptorConfig configWithIcon:nil title:@"标题文字" subTitle:nil detail:nil action:nil];
    row = [TFormRowDescriptor formRowDescriptorWithTag:@"PushDetail" rowType:TFormRowDescriptorTypeBooleanSwitch rowConfig:config];
    [row.cellConfigAtConfigure setObject:[UIColor purpleColor] forKey:@"themColor"];
    row.value = @(YES);
    row.required = YES;
    [section addFormRow:row];

    config = [TFormRowDescriptorConfig configWithIcon:@"progress" title:@"标题文字" subTitle:@"子标题" detail:@"详情" action:nil];
    row = [TFormRowDescriptor formRowDescriptorWithTag:@"Switch" rowType:TFormRowDescriptorTypeBooleanSwitch rowConfig:config];
    [row.cellConfigAtConfigure setObject:[UIColor purpleColor] forKey:@"themColor"];
    row.required = YES;
    [section addFormRow:row];
    
    //StepCounter
    section = [XLFormSectionDescriptor formSectionWithTitle:@"StepCounter"];
    [form addFormSection:section];
    config = [TFormRowDescriptorConfig configWithIcon:nil title:@"标题文字" subTitle:nil detail:nil action:nil];
    row = [TFormRowDescriptor formRowDescriptorWithTag:@"Stepper" rowType:TFormRowDescriptorTypeStepCounter rowConfig:config];
    [row.cellConfigAtConfigure setObject:[UIColor purpleColor] forKey:@"themColor"];
    row.required = YES;
    [section addFormRow:row];
    
    config = [TFormRowDescriptorConfig configWithIcon:@"progress" title:@"标题文字" subTitle:@"子标题" detail:@"详情" action:nil];
    row = [TFormRowDescriptor formRowDescriptorWithTag:@"Stepper" rowType:TFormRowDescriptorTypeStepCounter rowConfig:config];
    [row.cellConfigAtConfigure setObject:[UIColor purpleColor] forKey:@"themColor"];
    row.required = YES;
    [section addFormRow:row];
    
    //TextField
    section = [XLFormSectionDescriptor formSectionWithTitle:@"TextField"];
    [form addFormSection:section];
    config = [TFormRowDescriptorConfig configWithIcon:@"progress" title:@"标题文字" subTitle:@"子标题" detail:nil action:nil];
    row = [TFormRowDescriptor formRowDescriptorWithTag:@"textField" rowType:TFormRowDescriptorTypeTextFeild rowConfig:config];
    [row.cellConfigAtConfigure setObject:[UIColor purpleColor] forKey:@"themColor"];
    [row.cellConfigAtConfigure setObject:@"请输入" forKey:@"textField.placeholder"];
    row.required = YES;
    [section addFormRow:row];
    
    config = [TFormRowDescriptorConfig configWithIcon:nil title:@"标题文字" subTitle:nil detail:nil action:nil];
    row = [TFormRowDescriptor formRowDescriptorWithTag:@"textFieldNumber" rowType:TFormRowDescriptorTypeDecimal rowConfig:config];
    [row.cellConfigAtConfigure setObject:[UIColor purpleColor] forKey:@"themColor"];
    [row.cellConfigAtConfigure setObject:@"请输入" forKey:@"textField.placeholder"];
    row.required = YES;
    [section addFormRow:row];
    
    //TexView
    section = [XLFormSectionDescriptor formSectionWithTitle:@"TexView"];
    [form addFormSection:section];
    row = [TFormRowDescriptor formRowDescriptorWithTag:@"TexView" rowType:TFormRowDescriptorTypeTextView];
    [row.cellConfigAtConfigure setObject:[UIColor purpleColor] forKey:@"themColor"];
    [row.cellConfigAtConfigure setObject:@"请输入" forKey:@"textView.placeholder"];
    row.height = 150;
    [section addFormRow:row];
    
    //Slider
    section = [XLFormSectionDescriptor formSectionWithTitle:@"Slider"];
    [form addFormSection:section];
    row = [TFormRowDescriptor formRowDescriptorWithTag:@"Slider" rowType:TFormRowDescriptorTypeSlider];
    [row.cellConfigAtConfigure setObject:[UIColor purpleColor] forKey:@"themColor"];
    [section addFormRow:row];
    row = [TFormRowDescriptor formRowDescriptorWithTag:@"Slider" rowType:TFormRowDescriptorTypeSliderVoice];
    [row.cellConfigAtConfigure setObject:[UIColor purpleColor] forKey:@"themColor"];
    row.required = YES;
    [section addFormRow:row];
    
    //Segment
    section = [XLFormSectionDescriptor formSectionWithTitle:@"Segment"];
    [form addFormSection:section];
    config = [TFormRowDescriptorConfig configWithIcon:nil title:@"标题文字" subTitle:nil detail:nil action:nil];
    row = [TFormRowDescriptor formRowDescriptorWithTag:@"Segment" rowType:TFormRowDescriptorTypeSegmentedControl rowConfig:config];
    [row.cellConfigAtConfigure setObject:[UIColor purpleColor] forKey:@"themColor"];
    row.selectorOptions = @[@"1", @"2", @"3"];
    [section addFormRow:row];
    config = [TFormRowDescriptorConfig configWithIcon:nil title:@"标题文字" subTitle:@"子标题" detail:nil action:nil];
    row = [TFormRowDescriptor formRowDescriptorWithTag:@"Segment" rowType:TFormRowDescriptorTypeSegmentedControl rowConfig:config];
    [row.cellConfigAtConfigure setObject:[UIColor purpleColor] forKey:@"themColor"];
    row.selectorOptions = @[@"互动上发", @"2", @"3"];
    row.required = YES;
    [section addFormRow:row];
    
    //Rating
    section = [XLFormSectionDescriptor formSectionWithTitle:@"Rating"];
    [form addFormSection:section];
    config = [TFormRowDescriptorConfig configWithIcon:nil title:@"标题文字" subTitle:nil detail:nil action:nil];
    row = [TFormRowDescriptor formRowDescriptorWithTag:@"Rating" rowType:TFormRowDescriptorTypeRate rowConfig:config];
    [row.cellConfigAtConfigure setObject:[UIColor purpleColor] forKey:@"themColor"];
    row.value = @3;
    [section addFormRow:row];
    config = [TFormRowDescriptorConfig configWithIcon:nil title:@"标题文字" subTitle:@"子标题" detail:nil action:nil];
    row = [TFormRowDescriptor formRowDescriptorWithTag:@"Rating" rowType:TFormRowDescriptorTypeRate rowConfig:config];
    [row.cellConfigAtConfigure setObject:[UIColor purpleColor] forKey:@"themColor"];
    row.value = @3;
    row.disabled = @YES;
    row.required = YES;
    [section addFormRow:row];
    
    //Selector
    section = [XLFormSectionDescriptor formSectionWithTitle:@"Selector"];
    [form addFormSection:section];
    config = [TFormRowDescriptorConfig configWithIcon:nil title:@"标题文字" subTitle:@"子标题" detail:@"详情" action:nil];
    row = [TFormRowDescriptor formRowDescriptorWithTag:@"Selector" rowType:TFormRowDescriptorTypeSelector rowConfig:config];
    [row.cellConfigAtConfigure setObject:[UIColor purpleColor] forKey:@"themColor"];
    [section addFormRow:row];
    
    config = [TFormRowDescriptorConfig configWithIcon:nil title:@"标题文字" subTitle:nil detail:nil action:nil];
    row = [TFormRowDescriptor formRowDescriptorWithTag:@"Selector" rowType:TFormRowDescriptorTypeSelector rowConfig:config];
    [row.cellConfigAtConfigure setObject:[UIColor purpleColor] forKey:@"themColor"];
    [section addFormRow:row];
    
    config = [TFormRowDescriptorConfig configWithIcon:nil title:@"标题文字" subTitle:nil detail:nil action:nil];
    row = [TFormRowDescriptor formRowDescriptorWithTag:@"Selector" rowType:TFormRowDescriptorTypeSelector rowConfig:config];
    [row.cellConfigAtConfigure setObject:[UIColor purpleColor] forKey:@"themColor"];
    [section addFormRow:row];
    
    
    self.form = form;
    
}

- (void)action:(UIBarButtonItem *)item {
    NSArray * array = [self formValidationErrors];
    [array enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        XLFormValidationStatus * validationStatus = [[obj userInfo] objectForKey:XLValidationStatusErrorKey];
        UITableViewCell * cell = [self.tableView cellForRowAtIndexPath:[self.form indexPathOfFormRow:validationStatus.rowDescriptor]];
        cell.backgroundColor = [UIColor orangeColor];
        [UIView animateWithDuration:0.3 animations:^{
            cell.backgroundColor = [UIColor whiteColor];
        }];
        return ;
    }];
    if (array.count) {
        [self showToast:@"请填写完整信息"];
    }else {
       [self showToast:@"提交成功"];
    }
}



- (void)showToast:(NSString *)string
{
    [self.view makeToast:string];
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return CGFLOAT_MIN;
}

//- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
//    return CGFLOAT_MIN;
//}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
