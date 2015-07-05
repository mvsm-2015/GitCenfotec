//
//  ViewController.m
//  TallerApp
//
//  Created by Marco Vinicio on 6/29/15.
//  Copyright (c) 2015 MarcoVinicioSantamariaMartinez. All rights reserved.
//

#import "ViewController.h"
#import "CarViewController.h"
#import "RecordTableViewController.h"

@interface ViewController ()

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

- (IBAction)btnHistory:(id)sender {
    RecordTableViewController *View = [self.storyboard instantiateViewControllerWithIdentifier:@"RecordTableViewController"];
    [self.navigationController pushViewController:View animated:YES];
    
}

- (IBAction)btnRegister:(id)sender {
    CarViewController *View = [self.storyboard instantiateViewControllerWithIdentifier:@"CarViewController"];
    [self.navigationController pushViewController:View animated:YES];
}
@end
