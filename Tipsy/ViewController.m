//
//  ViewController.m
//  Tipsy
//
//  Created by Amy Liu on 6/26/18.
//  Copyright © 2018 Amy Liu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextField *billField;
@property (weak, nonatomic) IBOutlet UILabel *tipLabel;
@property (weak, nonatomic) IBOutlet UILabel *totalLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *tipControl;
@property (weak, nonatomic) IBOutlet UILabel *tip;
@property (weak, nonatomic) IBOutlet UILabel *total;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)onTap:(id)sender {
    [self.view endEditing:YES];
    // JAVA --> self.view.endEditing(YES);
    // invoking endEditing on self.view
}

- (IBAction)onEdit:(id)sender {
    double bill = [self.billField.text doubleValue];
    
    NSArray *percentages = @[@(0.15), @(0.18), @(0.2)]; // star sets a pointer (variable name)
    
    // NSString *value = [self.tipControl.selectedSegmentIndex titleForSegment]; // figure out how to select specific segment in segmentcontrol
    double tipPercentage = [percentages[self.tipControl.selectedSegmentIndex] doubleValue]; // directly pulls text from selected segment while casting it to a double
    double tip = tipPercentage * bill;
    double total = bill + tip;
    
    self.tipLabel.text = [NSString stringWithFormat:@"$%.2f", tip];
    self.totalLabel.text = [NSString stringWithFormat:@"$%.2f", total];
    
}

- (IBAction)onEditingBegin:(id)sender {
    
    [UIView animateWithDuration: 0.2 animations:^{
        self.billField.frame = CGRectMake(self.billField.frame.origin.x, self.billField.frame.origin.y + 50, self.billField.frame.size.width, self.billField.frame.size.height);
        
        /* self.tipLabel.frame = CGRectMake(self.tipLabel.frame.origin.x, self.tipLabel.frame.origin.y + 1000000, self.tipLabel.frame.size.width, self.tipLabel.frame.size.height);
        
        self.tipControl.frame = CGRectMake(self.tipControl.frame.origin.x, self.tipControl.frame.origin.y + 1000000, self.tipControl.frame.size.width, self.tipControl.frame.size.height);
        
        self.totalLabel.frame = CGRectMake(self.tipLabel.frame.origin.x, self.totalLabel.frame.origin.y + 1000000, self.totalLabel.frame.size.width, self.totalLabel.frame.size.height);
        
        self.tip.frame = CGRectMake(self.tip.frame.origin.x, self.tip.frame.origin.y + 1000000, self.tip.frame.size.width, self.tip.frame.size.height);
        
        self.total.frame = CGRectMake(self.total.frame.origin.x, self.total.frame.origin.y + 1000000, self.total.frame.size.width, self.total.frame.size.height); */
        
        self.tipLabel.alpha = 0;
        self.totalLabel.alpha = 0;
        self.tip.alpha = 0;
        self.total.alpha = 0;
        self.tipControl.alpha = 0;
    }];
}

- (IBAction)onEditingEnd:(id)sender {
    CGRect billField = self.billField.frame;
    billField.origin.y -= 50;
    
    /* CGRect totalLabel = self.totalLabel.frame;
    totalLabel.origin.y -= 1000000;
    
    CGRect tipLabel = self.tipLabel.frame;
    tipLabel.origin.y -= 1000000;
    
    CGRect tipControl = self.tipControl.frame;
    tipControl.origin.y -= 1000000;
    
    CGRect tip = self.tip.frame;
    tip.origin.y -= 1000000;
    
    CGRect total = self.total.frame;
    total.origin.y -= 1000000;
    */
    [UIView animateWithDuration: 0.2 animations:^{
        /*
        self.totalLabel.frame = totalLabel;
        self.tip.frame = tip;
        self.tipControl.frame = tipControl;
        self.total.frame = total;
        self.tipLabel.frame = tipLabel; */
        
        self.billField.frame = billField;
    
    self.tipLabel.alpha = 1;
    self.totalLabel.alpha = 1;
    self.tip.alpha = 1;
    self.total.alpha = 1;
    self.tipControl.alpha = 1;
    }];
}

@end
