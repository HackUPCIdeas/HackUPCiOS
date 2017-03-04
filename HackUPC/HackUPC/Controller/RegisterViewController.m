//
//  RegisterViewController.m
//  HackUPC
//
//  Created by Joan Molinas Ramon on 4/3/17.
//  Copyright © 2017 NSBeard. All rights reserved.
//

#import "RegisterViewController.h"

@interface RegisterViewController ()

@end

@implementation RegisterViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self){
        [self initialize];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self){
        [self initialize];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

#pragma mark - Inits
- (void)initialize {
    XLFormDescriptor *form = [XLFormDescriptor formDescriptorWithTitle:@"Descriptor"];
    XLFormSectionDescriptor *sectionDescriptor = [XLFormSectionDescriptor formSection];
    XLFormRowDescriptor *row = [XLFormRowDescriptor formRowDescriptorWithTag:@"1" rowType:XLFormRowDescriptorTypeText];
    [row.cellConfigAtConfigure setObject:@"Title" forKey:@"textField.placeholder"];
    [sectionDescriptor addFormRow:row];
    [form addFormSection:sectionDescriptor];
    self.form = form;
}

#pragma mark - Actions
- (IBAction)cancel:(UIBarButtonItem *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}


@end
