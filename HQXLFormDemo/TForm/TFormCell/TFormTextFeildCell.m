//
//  TFormTextFeildCell.m
//  HQXLFormDemo
//
//  Created by admin on 2018/8/1.
//  Copyright © 2018年 admin. All rights reserved.
//

#import "TFormTextFeildCell.h"

@interface TFormTextFeildCell ()<UITextFieldDelegate>

@property (nonatomic) UITextField *textField;

@end

@implementation TFormTextFeildCell

@synthesize returnKeyType = _returnKeyType;
@synthesize nextReturnKeyType = _nextReturnKeyType;

+(void)load
{
    [XLFormViewController.cellClassesForRowDescriptorTypes setObject:[TFormTextFeildCell class] forKey:TFormRowDescriptorTypeTextFeild];
    [XLFormViewController.cellClassesForRowDescriptorTypes setObject:[TFormTextFeildCell class] forKey:TFormRowDescriptorTypePassword];
    [XLFormViewController.cellClassesForRowDescriptorTypes setObject:[TFormTextFeildCell class] forKey:TFormRowDescriptorTypePhone];
    [XLFormViewController.cellClassesForRowDescriptorTypes setObject:[TFormTextFeildCell class] forKey:TFormRowDescriptorTypeDecimal];
    [XLFormViewController.cellClassesForRowDescriptorTypes setObject:[TFormTextFeildCell class] forKey:TFormRowDescriptorTypeURL];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.textField.tf_left = self.titleLB.text.length ?  (self.titleLB.tf_right > self.subTitleLB.tf_right ? self.titleLB.tf_right:self.subTitleLB.tf_right) + 10 : 15;
    self.textField.tf_width = self.contentView.tf_width - self.textField.tf_left - 15;
    self.textField.tf_height = self.contentView.tf_height - 20;
    self.textField.tf_centerY = self.contentView.tf_centerY + 1;
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _returnKeyType = UIReturnKeyDefault;
        _nextReturnKeyType = UIReturnKeyNext;
    }
    return self;
}

#pragma mark - XLFormDescriptorCell

-(void)configure
{
    [super configure];
    [self setSelectionStyle:UITableViewCellSelectionStyleNone];
    [self.contentView addSubview:self.textField];
}

-(void)update
{
    [super update];
    if ([self.rowDescriptor.rowType isEqualToString:TFormRowDescriptorTypeTextFeild]){
        self.textField.autocorrectionType = UITextAutocorrectionTypeDefault;
        self.textField.autocapitalizationType = UITextAutocapitalizationTypeSentences;
    }
    else if ([self.rowDescriptor.rowType isEqualToString:TFormRowDescriptorTypePassword]){
        self.textField.autocorrectionType = UITextAutocorrectionTypeNo;
        self.textField.autocapitalizationType = UITextAutocapitalizationTypeNone;
        self.textField.keyboardType = UIKeyboardTypeASCIICapable;
        self.textField.secureTextEntry = YES;
    }
    else if ([self.rowDescriptor.rowType isEqualToString:TFormRowDescriptorTypePhone]){
        self.textField.keyboardType = UIKeyboardTypePhonePad;
    }
    else if ([self.rowDescriptor.rowType isEqualToString:TFormRowDescriptorTypeDecimal]){
        self.textField.keyboardType = UIKeyboardTypeDecimalPad;
    }
    else if ([self.rowDescriptor.rowType isEqualToString:TFormRowDescriptorTypeURL]){
        self.textField.autocorrectionType = UITextAutocorrectionTypeNo;
        self.textField.autocapitalizationType = UITextAutocapitalizationTypeNone;
        self.textField.keyboardType = UIKeyboardTypeURL;
    }
    
    self.textField.text = self.rowDescriptor.value ? [self.rowDescriptor displayTextValue] : self.rowDescriptor.noValueDisplayText;
    [self.textField setEnabled:!self.rowDescriptor.isDisabled];
    if (self.themColor) {
        self.textField.tintColor = self.themColor;
    }
}


-(BOOL)formDescriptorCellCanBecomeFirstResponder
{
    return (!self.rowDescriptor.isDisabled);
}

-(BOOL)formDescriptorCellBecomeFirstResponder
{
    return [self.textField becomeFirstResponder];
}

-(void)highlight
{
    [super highlight];
}

-(void)unhighlight
{
    [super unhighlight];
//    [self.formViewController updateFormRow:self.rowDescriptor];
}

#pragma mark - Properties

-(UITextField *)textField
{
    if (_textField) return _textField;
    _textField = [[UITextField alloc] init];
    _textField.textColor = [UIColor tf_colorWithHexString:@"333333"];
    _textField.font = [UIFont systemFontOfSize:17];
    _textField.delegate = self;
    _textField.clearButtonMode = UITextFieldViewModeWhileEditing;
    [_textField addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
    return _textField;
}


#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldClear:(UITextField *)textField
{
    return [self.formViewController textFieldShouldClear:textField];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    return [self.formViewController textFieldShouldReturn:textField];
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    return [self.formViewController textFieldShouldBeginEditing:textField];
}

- (BOOL)textFieldShouldEndEditing:(UITextField *)textField
{
    return [self.formViewController textFieldShouldEndEditing:textField];
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    if (self.textFieldMaxNumberOfCharacters) {
        // Check maximum length requirement
        NSString *newString = [textField.text stringByReplacingCharactersInRange:range withString:string];
        if (newString.length > self.textFieldMaxNumberOfCharacters.integerValue) {
            return NO;
        }
    }
    
    // Otherwise, leave response to view controller
    return [self.formViewController textField:textField shouldChangeCharactersInRange:range replacementString:string];
}

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    [self.formViewController beginEditing:self.rowDescriptor];
    [self.formViewController textFieldDidBeginEditing:textField];
    // set the input to the raw value if we have a formatter and it shouldn't be used during input
    if (self.rowDescriptor.valueFormatter) {
        self.textField.text = [self.rowDescriptor editTextValue];
    }
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    // process text change before we stick a formatted value in the UITextField
    [self textFieldDidChange:textField];
    
    // losing input, replace the text field with the formatted value
//    if (self.rowDescriptor.valueFormatter) {
//        self.textField.text = [self.rowDescriptor.value displayText];
//    }
    
    [self.formViewController endEditing:self.rowDescriptor];
    [self.formViewController textFieldDidEndEditing:textField];
}


#pragma mark - Helper

- (void)textFieldDidChange:(UITextField *)textField{
    if([self.textField.text length] > 0) {
        BOOL didUseFormatter = NO;
        
        if (self.rowDescriptor.valueFormatter && self.rowDescriptor.useValueFormatterDuringInput)
        {
            // use generic getObjectValue:forString:errorDescription and stringForObjectValue
            NSString *errorDescription = nil;
            NSString *objectValue = nil;
            
            if ([ self.rowDescriptor.valueFormatter getObjectValue:&objectValue forString:textField.text errorDescription:&errorDescription]) {
                NSString *formattedValue = [self.rowDescriptor.valueFormatter stringForObjectValue:objectValue];
                
                self.rowDescriptor.value = objectValue;
                textField.text = formattedValue;
                didUseFormatter = YES;
            }
        }
        
        // only do this conversion if we didn't use the formatter
        if (!didUseFormatter)
        {
            if ([self.rowDescriptor.rowType isEqualToString:TFormRowDescriptorTypeDecimal]){
                self.rowDescriptor.value =  [NSDecimalNumber decimalNumberWithString:self.textField.text locale:NSLocale.currentLocale];
            } else {
                self.rowDescriptor.value = self.textField.text;
            }
        }
    } else {
        self.rowDescriptor.value = nil;
    }
}

-(void)setReturnKeyType:(UIReturnKeyType)returnKeyType
{
    _returnKeyType = returnKeyType;
    self.textField.returnKeyType = returnKeyType;
}

-(UIReturnKeyType)returnKeyType
{
    return _returnKeyType;
}



@end
