//
//  CarViewController.h
//  TallerApp
//
//  Created by Marco Vinicio on 6/29/15.
//  Copyright (c) 2015 MarcoVinicioSantamariaMartinez. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CarViewController : UIViewController<UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *txtModel;
@property (weak, nonatomic) IBOutlet UITextField *txtMarc;
@property (weak, nonatomic) IBOutlet UITextField *txtYear;
@property (weak, nonatomic) IBOutlet UITextField *txtOwner;
@property (weak, nonatomic) IBOutlet UITextField *txtPrice;
@property (weak, nonatomic) IBOutlet UITextField *txtDescription;

@end
