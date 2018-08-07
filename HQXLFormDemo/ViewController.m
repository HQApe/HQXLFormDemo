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
    self.view.backgroundColor = [UIColor whiteColor];
    self.tableView.backgroundColor = [UIColor whiteColor];
    self.tableView.separatorStyle = UITableViewCellSelectionStyleNone;
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
    
    
    TFormRowDescriptorConfig *config = [TFormRowDescriptorConfig configWithIcon:nil title:@"标题文字标题文字" subTitle:nil detail:@"标题文字" action:nil];
    row = [TFormRowDescriptor formRowDescriptorWithTag:@"DispalyOnly1" rowType:TFormRowDescriptorTypeDisplayOnly rowConfig:config];
    [row.cellConfigAtConfigure setObject:[UIColor purpleColor] forKey:@"titleLB.textColor"];
    [section addFormRow:row];
    
    config = [TFormRowDescriptorConfig configWithIcon:nil title:@"标题文字标题" subTitle:@"子标题和子标题" detail:@"标题文字" action:nil];
    row = [TFormRowDescriptor formRowDescriptorWithTag:@"DispalyOnly2" rowType:TFormRowDescriptorTypeDisplayOnly rowConfig:config];
    [section addFormRow:row];
    
    config = [TFormRowDescriptorConfig configWithIcon:@"ios1024" title:@"标题文字标题" subTitle:@"子标题和子标题" detail:@"标题文字" action:nil];
    row = [TFormRowDescriptor formRowDescriptorWithTag:@"DispalyOnly3" rowType:TFormRowDescriptorTypeDisplayOnly rowConfig:config];
    [section addFormRow:row];
    
    
    //ShowPush
    section = [XLFormSectionDescriptor formSectionWithTitle:@"ShowAndPush"];
    [form addFormSection:section];
    
    config = [TFormRowDescriptorConfig configWithIcon:nil title:@"标题文字" subTitle:nil detail:@"详情" action:^(NSIndexPath *indexPath) {
        [self showToast:[NSString stringWithFormat:@"点击了Section==%ld， row==%ld", indexPath.section, indexPath.row]];
    }];
    row = [TFormRowDescriptor formRowDescriptorWithTag:@"ShowPush1" rowType:TFormRowDescriptorTypeShowPush rowConfig:config];
    [row.cellConfigAtConfigure setObject:[UIColor purpleColor] forKey:@"themColor"];
    row.action.formBlock = ^(XLFormRowDescriptor * _Nonnull sender) {
        UIViewController *vc = [[UIViewController alloc] init];
        vc.view.backgroundColor = [UIColor whiteColor];
        [self.navigationController pushViewController:vc animated:YES];
    };
    [section addFormRow:row];
    
    config = [TFormRowDescriptorConfig configWithIcon:nil title:@"标题文字" subTitle:@"子标题" detail:@"详情" action:^(NSIndexPath *indexPath) {
        [self showToast:[NSString stringWithFormat:@"点击了Section==%ld， row==%ld", indexPath.section, indexPath.row]];
    }];
    row = [TFormRowDescriptor formRowDescriptorWithTag:@"ShowPush2" rowType:TFormRowDescriptorTypeShowPush rowConfig:config];
    [row.cellConfigAtConfigure setObject:[UIColor purpleColor] forKey:@"themColor"];
    row.action.formBlock = ^(XLFormRowDescriptor * _Nonnull sender) {
        UIViewController *vc = [[UIViewController alloc] init];
        vc.view.backgroundColor = [UIColor whiteColor];
        [self.navigationController pushViewController:vc animated:YES];
    };
    [section addFormRow:row];
    
    config = [TFormRowDescriptorConfig configWithIcon:@"ios1024" title:@"标题文字标题" subTitle:@"子标题" detail:@"详情标" action:^(NSIndexPath *indexPath) {
        [self showToast:[NSString stringWithFormat:@"点击了Section==%ld， row==%ld", indexPath.section, indexPath.row]];
    }];
    row = [TFormRowDescriptor formRowDescriptorWithTag:@"ShowPush3" rowType:TFormRowDescriptorTypeShowPush rowConfig:config];
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
    
    config = [TFormRowDescriptorConfig configWithIcon:nil title:@"标题文字" subTitle:nil detail:@"详情" action:^(NSIndexPath *indexPath) {
        [self showToast:[NSString stringWithFormat:@"点击了Section==%ld， row==%ld", indexPath.section, indexPath.row]];
    }];
    row = [TFormRowDescriptor formRowDescriptorWithTag:@"Show1" rowType:TFormRowDescriptorTypeShow rowConfig:config];
    [row.cellConfigAtConfigure setObject:[UIColor purpleColor] forKey:@"themColor"];
    [section addFormRow:row];
    
    config = [TFormRowDescriptorConfig configWithIcon:nil title:@"标题文字" subTitle:@"子标题" detail:@"详情" action:^(NSIndexPath *indexPath) {
        [self showToast:[NSString stringWithFormat:@"点击了Section==%ld， row==%ld", indexPath.section, indexPath.row]];
    }];
    row = [TFormRowDescriptor formRowDescriptorWithTag:@"Show2" rowType:TFormRowDescriptorTypeShow rowConfig:config];
    [row.cellConfigAtConfigure setObject:[UIColor purpleColor] forKey:@"themColor"];
    [section addFormRow:row];
    
    config = [TFormRowDescriptorConfig configWithIcon:@"ios1024" title:@"标题文字" subTitle:@"子标题" detail:@"详情" action:^(NSIndexPath *indexPath) {
        [self showToast:[NSString stringWithFormat:@"点击了Section==%ld， row==%ld", indexPath.section, indexPath.row]];
    }];
    row = [TFormRowDescriptor formRowDescriptorWithTag:@"Show3" rowType:TFormRowDescriptorTypeShow rowConfig:config];
    [row.cellConfigAtConfigure setObject:[UIColor purpleColor] forKey:@"themColor"];
    [section addFormRow:row];
    
    
    //Push
    section = [XLFormSectionDescriptor formSectionWithTitle:@"Push"];
    [form addFormSection:section];
    
    config = [TFormRowDescriptorConfig configWithIcon:nil title:@"标题文字" subTitle:nil detail:@"详情" action:nil];
    row = [TFormRowDescriptor formRowDescriptorWithTag:@"Push1" rowType:TFormRowDescriptorTypePush rowConfig:config];
    [row.cellConfigAtConfigure setObject:[UIColor purpleColor] forKey:@"themColor"];
    row.action.formBlock = ^(XLFormRowDescriptor * _Nonnull sender) {
        UIViewController *vc = [[UIViewController alloc] init];
        vc.view.backgroundColor = [UIColor whiteColor];
        [self.navigationController pushViewController:vc animated:YES];
    };
    [section addFormRow:row];
    
    config = [TFormRowDescriptorConfig configWithIcon:nil title:@"标题文字" subTitle:@"子标题" detail:@"详情" action:nil];
    row = [TFormRowDescriptor formRowDescriptorWithTag:@"Push2" rowType:TFormRowDescriptorTypePush rowConfig:config];
    [row.cellConfigAtConfigure setObject:[UIColor purpleColor] forKey:@"themColor"];
    row.action.formBlock = ^(XLFormRowDescriptor * _Nonnull sender) {
        UIViewController *vc = [[UIViewController alloc] init];
        vc.view.backgroundColor = [UIColor whiteColor];
        [self.navigationController pushViewController:vc animated:YES];
    };
    [section addFormRow:row];
    
    config = [TFormRowDescriptorConfig configWithIcon:@"ios1024" title:@"标题文字" subTitle:@"子标题" detail:@"详情" action:nil];
    row = [TFormRowDescriptor formRowDescriptorWithTag:@"Push3" rowType:TFormRowDescriptorTypePush rowConfig:config];
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
    config = [TFormRowDescriptorConfig configWithIcon:nil title:@"标题文字" subTitle:nil detail:@"详情" action:nil];
    row = [TFormRowDescriptor formRowDescriptorWithTag:@"Check1" rowType:TFormRowDescriptorTypeBooleanCheck rowConfig:config];
    [row.cellConfigAtConfigure setObject:[UIColor purpleColor] forKey:@"themColor"];
    row.value = @(YES);
    row.required = YES;
    [section addFormRow:row];
    
    config = [TFormRowDescriptorConfig configWithIcon:nil title:@"标题文字" subTitle:@"子标题" detail:@"详情" action:nil];
    row = [TFormRowDescriptor formRowDescriptorWithTag:@"Check2" rowType:TFormRowDescriptorTypeBooleanCheck rowConfig:config];
    [row.cellConfigAtConfigure setObject:[UIColor purpleColor] forKey:@"themColor"];
    row.value = @(YES);
    row.required = YES;
    [section addFormRow:row];
    
    config = [TFormRowDescriptorConfig configWithIcon:@"ios1024" title:@"标题文字" subTitle:@"子标题" detail:@"详情" action:nil];
    row = [TFormRowDescriptor formRowDescriptorWithTag:@"Check3" rowType:TFormRowDescriptorTypeBooleanCheck rowConfig:config];
    [row.cellConfigAtConfigure setObject:[UIColor purpleColor] forKey:@"themColor"];
    row.required = YES;
    [section addFormRow:row];
    
    
    
    //Switch
    section = [XLFormSectionDescriptor formSectionWithTitle:@"Switch"];
    [form addFormSection:section];
    config = [TFormRowDescriptorConfig configWithIcon:nil title:@"标题文字" subTitle:nil detail:@"详情" action:nil];
    row = [TFormRowDescriptor formRowDescriptorWithTag:@"Switch1" rowType:TFormRowDescriptorTypeBooleanSwitch rowConfig:config];
    [row.cellConfigAtConfigure setObject:[UIColor purpleColor] forKey:@"themColor"];
    row.value = @(YES);
    row.required = YES;
    [section addFormRow:row];
    
    config = [TFormRowDescriptorConfig configWithIcon:nil title:@"标题文字" subTitle:@"子标题" detail:@"详情" action:nil];
    row = [TFormRowDescriptor formRowDescriptorWithTag:@"Switch2" rowType:TFormRowDescriptorTypeBooleanSwitch rowConfig:config];
    [row.cellConfigAtConfigure setObject:[UIColor purpleColor] forKey:@"themColor"];
    row.value = @(YES);
    row.required = YES;
    [section addFormRow:row];

    config = [TFormRowDescriptorConfig configWithIcon:@"ios1024" title:@"标题文字" subTitle:@"子标题" detail:@"详情" action:nil];
    row = [TFormRowDescriptor formRowDescriptorWithTag:@"Switch3" rowType:TFormRowDescriptorTypeBooleanSwitch rowConfig:config];
    [row.cellConfigAtConfigure setObject:[UIColor purpleColor] forKey:@"themColor"];
    row.required = YES;
    [section addFormRow:row];
    
    
    //StepCounter
    section = [XLFormSectionDescriptor formSectionWithTitle:@"StepCounter"];
    [form addFormSection:section];
    config = [TFormRowDescriptorConfig configWithIcon:nil title:@"标题文字" subTitle:nil detail:@"详情" action:nil];
    row = [TFormRowDescriptor formRowDescriptorWithTag:@"Stepper1" rowType:TFormRowDescriptorTypeStepCounter rowConfig:config];
    [row.cellConfigAtConfigure setObject:[UIColor purpleColor] forKey:@"themColor"];
    row.required = YES;
    [section addFormRow:row];
    
    config = [TFormRowDescriptorConfig configWithIcon:nil title:@"标题文字" subTitle:@"子标题" detail:@"详情" action:nil];
    row = [TFormRowDescriptor formRowDescriptorWithTag:@"Stepper2" rowType:TFormRowDescriptorTypeStepCounter rowConfig:config];
    [row.cellConfigAtConfigure setObject:[UIColor purpleColor] forKey:@"themColor"];
    row.required = YES;
    [section addFormRow:row];
    
    config = [TFormRowDescriptorConfig configWithIcon:@"ios1024" title:@"标题文字" subTitle:@"子标题" detail:@"详情" action:nil];
    row = [TFormRowDescriptor formRowDescriptorWithTag:@"Stepper3" rowType:TFormRowDescriptorTypeStepCounter rowConfig:config];
    [row.cellConfigAtConfigure setObject:[UIColor purpleColor] forKey:@"themColor"];
    row.required = YES;
    [section addFormRow:row];
    
    //TextField
    section = [XLFormSectionDescriptor formSectionWithTitle:@"TextField"];
    [form addFormSection:section];
    config = [TFormRowDescriptorConfig configWithIcon:nil title:@"标题文字" subTitle:nil detail:nil action:nil];
    row = [TFormRowDescriptor formRowDescriptorWithTag:@"textField1" rowType:TFormRowDescriptorTypeTextFeild rowConfig:config];
    [row.cellConfigAtConfigure setObject:[UIColor purpleColor] forKey:@"themColor"];
    [row.cellConfigAtConfigure setObject:@"请输入" forKey:@"textField.placeholder"];
    row.required = YES;
    [section addFormRow:row];
    
    row = [TFormRowDescriptor formRowDescriptorWithTag:@"textField2" rowType:TFormRowDescriptorTypeTextFeild rowConfig:nil];
    [row.cellConfigAtConfigure setObject:[UIColor purpleColor] forKey:@"themColor"];
    [row.cellConfigAtConfigure setObject:@"请输入" forKey:@"textField.placeholder"];
    row.required = YES;
    [section addFormRow:row];
    
    config = [TFormRowDescriptorConfig configWithIcon:@"ios1024" title:@"标题文字" subTitle:@"子标题" detail:nil action:nil];
    row = [TFormRowDescriptor formRowDescriptorWithTag:@"textField3" rowType:TFormRowDescriptorTypeTextFeild rowConfig:config];
    [row.cellConfigAtConfigure setObject:[UIColor purpleColor] forKey:@"themColor"];
    [row.cellConfigAtConfigure setObject:@"请输入" forKey:@"textField.placeholder"];
    row.required = YES;
    [section addFormRow:row];
    
    
    //TexView
    section = [XLFormSectionDescriptor formSectionWithTitle:@"TexView"];
    [form addFormSection:section];
    row = [TFormRowDescriptor formRowDescriptorWithTag:@"TexView1" rowType:TFormRowDescriptorTypeTextView];
    [row.cellConfigAtConfigure setObject:[UIColor purpleColor] forKey:@"themColor"];
    [row.cellConfigAtConfigure setObject:@"请输入" forKey:@"textView.placeholder"];
    row.height = 150;
    [section addFormRow:row];
    
    
    //Slider
    section = [XLFormSectionDescriptor formSectionWithTitle:@"Slider"];
    [form addFormSection:section];
    row = [TFormRowDescriptor formRowDescriptorWithTag:@"Slider1" rowType:TFormRowDescriptorTypeSlider];
    [row.cellConfigAtConfigure setObject:[UIColor purpleColor] forKey:@"themColor"];
    [section addFormRow:row];
    
    row = [TFormRowDescriptor formRowDescriptorWithTag:@"Slider2" rowType:TFormRowDescriptorTypeSliderVoice];
    [row.cellConfigAtConfigure setObject:[UIColor purpleColor] forKey:@"themColor"];
    row.required = YES;
    [section addFormRow:row];
    
    //Segment
    section = [XLFormSectionDescriptor formSectionWithTitle:@"Segment"];
    [form addFormSection:section];
    config = [TFormRowDescriptorConfig configWithIcon:nil title:@"标题文字" subTitle:nil detail:nil action:nil];
    row = [TFormRowDescriptor formRowDescriptorWithTag:@"Segment1" rowType:TFormRowDescriptorTypeSegmentedControl rowConfig:config];
    [row.cellConfigAtConfigure setObject:[UIColor purpleColor] forKey:@"themColor"];
    row.selectorOptions = @[@"1", @"2", @"3"];
    [section addFormRow:row];
    
    config = [TFormRowDescriptorConfig configWithIcon:nil title:@"标题文字" subTitle:@"子标题" detail:nil action:nil];
    row = [TFormRowDescriptor formRowDescriptorWithTag:@"Segment2" rowType:TFormRowDescriptorTypeSegmentedControl rowConfig:config];
    [row.cellConfigAtConfigure setObject:[UIColor purpleColor] forKey:@"themColor"];
    row.selectorOptions = @[@"互动上发", @"2", @"3"];
    row.required = YES;
    [section addFormRow:row];
    
    config = [TFormRowDescriptorConfig configWithIcon:@"ios1024" title:@"标题文字" subTitle:@"子标题" detail:nil action:nil];
    row = [TFormRowDescriptor formRowDescriptorWithTag:@"Segment2" rowType:TFormRowDescriptorTypeSegmentedControl rowConfig:config];
    [row.cellConfigAtConfigure setObject:[UIColor purpleColor] forKey:@"themColor"];
    row.selectorOptions = @[@"2", @"3"];
    row.required = YES;
    [section addFormRow:row];
    

    //Rating
    section = [XLFormSectionDescriptor formSectionWithTitle:@"Rating"];
    [form addFormSection:section];
    config = [TFormRowDescriptorConfig configWithIcon:nil title:@"标题文字" subTitle:nil detail:nil action:nil];
    row = [TFormRowDescriptor formRowDescriptorWithTag:@"Rating1" rowType:TFormRowDescriptorTypeRate rowConfig:config];
    [row.cellConfigAtConfigure setObject:[UIColor purpleColor] forKey:@"themColor"];
    row.value = @3;
    [section addFormRow:row];
    
    config = [TFormRowDescriptorConfig configWithIcon:nil title:@"标题文字" subTitle:@"子标题" detail:nil action:nil];
    row = [TFormRowDescriptor formRowDescriptorWithTag:@"Rating2" rowType:TFormRowDescriptorTypeRate rowConfig:config];
    [row.cellConfigAtConfigure setObject:[UIColor purpleColor] forKey:@"themColor"];
    row.value = @3;
    row.disabled = @YES;
    row.required = YES;
    [section addFormRow:row];
    
    config = [TFormRowDescriptorConfig configWithIcon:@"ios1024" title:@"标题文字" subTitle:@"子标题" detail:nil action:nil];
    row = [TFormRowDescriptor formRowDescriptorWithTag:@"Rating3" rowType:TFormRowDescriptorTypeRate rowConfig:config];
    [row.cellConfigAtConfigure setObject:[UIColor purpleColor] forKey:@"themColor"];
    row.value = @3;
    row.disabled = @YES;
    row.required = YES;
    [section addFormRow:row];
    
    //Selector
    section = [XLFormSectionDescriptor formSectionWithTitle:@"Selector"];
    [form addFormSection:section];
    
    config = [TFormRowDescriptorConfig configWithIcon:nil title:@"标题文字" subTitle:nil detail:nil action:nil];
    row = [TFormRowDescriptor formRowDescriptorWithTag:@"Selector1" rowType:TFormRowDescriptorTypeSelector rowConfig:config];
    [row.cellConfigAtConfigure setObject:[UIColor purpleColor] forKey:@"themColor"];
    [section addFormRow:row];
    
    config = [TFormRowDescriptorConfig configWithIcon:nil title:@"标题文字" subTitle:nil detail:@"详情" action:nil];
    row = [TFormRowDescriptor formRowDescriptorWithTag:@"Selector2" rowType:TFormRowDescriptorTypeSelector rowConfig:config];
    [row.cellConfigAtConfigure setObject:[UIColor purpleColor] forKey:@"themColor"];
    [section addFormRow:row];
    
    config = [TFormRowDescriptorConfig configWithIcon:@"ios1024" title:@"标题文字" subTitle:@"子标题" detail:@"详情" action:nil];
    row = [TFormRowDescriptor formRowDescriptorWithTag:@"Selector3" rowType:TFormRowDescriptorTypeSelector rowConfig:config];
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

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *header = [[UIView alloc] initWithFrame:CGRectMake(0, 0, KTFScreenW, 30)];
    header.backgroundColor = [UIColor tf_colorWithHexString:@"F4F4F4"];
    return header;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 30.0;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
