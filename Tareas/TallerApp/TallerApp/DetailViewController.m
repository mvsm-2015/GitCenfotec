//
//  DetailViewController.m
//  TallerApp
//
//  Created by Marco Vinicio on 7/2/15.
//  Copyright (c) 2015 MarcoVinicioSantamariaMartinez. All rights reserved.
//

#import "DetailViewController.h"
#import <Parse/Parse.h>

@interface DetailViewController ()

@end

@implementation DetailViewController

- (void)viewDidLoad
{

    [super viewDidLoad];
    [self initialize];

}

- (void)didReceiveMemoryWarning
{

    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) initialize {
    
    self.lblPrice.text = self.objDetail[@"Price"];
    self.txtDescription.text = self.objDetail[@"Description"];
    
}

@end
