//
//  CarViewController.m
//  TallerApp
//
//  Created by Marco Vinicio on 6/29/15.
//  Copyright (c) 2015 MarcoVinicioSantamariaMartinez. All rights reserved.
//

#import "CarViewController.h"
#import <Parse/Parse.h>

@interface CarViewController ()

@end

@implementation CarViewController

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

- (void) initialize
{
    self.txtMarc.delegate = self;
    self.txtModel.delegate = self;
    self.txtYear.delegate = self;
    self.txtOwner.delegate = self;
    self.txtDescription.delegate = self;
    self.txtPrice.delegate = self;

    UIBarButtonItem *addButton =[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(Registration)];
    self.navigationItem.rightBarButtonItem = addButton;
    
    UITapGestureRecognizer *tap =[[UITapGestureRecognizer alloc]
        initWithTarget:self action:@selector(dismissKeyboard)];
    
    [self.view addGestureRecognizer:tap];
}

- (void) saveWithParse
{
    PFObject *obj = [PFObject objectWithClassName:@"Cars"];
    obj[@"Model"] = self.txtModel.text;
    obj[@"Marc"] = self.txtMarc.text;
    obj[@"Year"] = self.txtYear.text;
    obj[@"Owner"] = self.txtOwner.text;
    obj[@"Price"] = self.txtPrice.text;
    obj[@"Description"] = self.txtDescription.text;
    
    [obj saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        
        if (succeeded) {
            
            [self.navigationController popViewControllerAnimated:YES];
            
        } else {
            
            NSString *errorString = [error userInfo][@"error"];
            NSLog(@"ERROR %@",errorString);
            
        }
    }];
}

-(void) Registration
{
    BOOL textFieldDontHaveSpacesInWhite = [self validateAllSpacesInWhiteInTextFields];
    
    if (textFieldDontHaveSpacesInWhite) {
        
        [self saveWithParse];
        
    } else {
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"ERROR" message:@"Verifique los campos ingresados" delegate:nil cancelButtonTitle:@"Aceptar" otherButtonTitles:nil, nil]
        ;
        [alert show];
    }
}


- (BOOL)validateWhiteSpaces:(NSString*)textToEvaluate
{
    NSCharacterSet *whitespace = [NSCharacterSet whitespaceAndNewlineCharacterSet];
    NSString *trimmed = [textToEvaluate stringByTrimmingCharactersInSet:whitespace];
    
    if ([trimmed length] == 0) {
        
        return NO;
        
    } else {
        
        return YES;
        
    }
}

- (BOOL)validateAllSpacesInWhiteInTextFields
{
    BOOL marc = [self validateWhiteSpaces:self.txtMarc.text];
    BOOL model = [self validateWhiteSpaces:self.txtModel.text];
    BOOL year = [self validateWhiteSpaces:self.txtYear.text];
    BOOL owner = [self validateWhiteSpaces:self.txtOwner.text];
    BOOL price = [self validateWhiteSpaces:self.txtPrice.text];
    BOOL description = [self validateWhiteSpaces:self.txtDescription.text];
    
    if (marc && model && year && owner && price && description) {
        
        return YES;
        
    } else {
        
        return NO;
        
    }
}

// THESE FUNCTIONS HIDE THE KEYBOARD.

-(void) dismissKeyboard
{
    [self.txtMarc resignFirstResponder];
    [self.txtModel resignFirstResponder];
    [self.txtYear resignFirstResponder];
    [self.txtOwner resignFirstResponder];
    [self.txtPrice resignFirstResponder];
    [self.txtDescription resignFirstResponder];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    
    [textField resignFirstResponder];
    
    return YES;
    
}

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    if(textField == self.txtMarc || textField == self.txtModel || textField == self.txtOwner|| textField == self.txtDescription){
        
        [self animateTextField: textField up: YES];
        
    }
    
}


- (void)textFieldDidEndEditing:(UITextField *)textField
{
    if(textField == self.txtMarc || textField == self.txtModel || textField == self.txtOwner|| textField == self.txtDescription){
        
        [self animateTextField: textField up: NO];
        
    }
    
}

- (void)animateTextField: (UITextField*) textField up: (BOOL) up
{
    
    const int movementDistance = 30;
    const float movementDuration = 0.3f;
    
    int movement = (up ? -movementDistance : movementDistance);
    
    [UIView beginAnimations: @"anim" context: nil];
    [UIView setAnimationBeginsFromCurrentState: YES];
    [UIView setAnimationDuration: movementDuration];
    self.view.frame = CGRectOffset(self.view.frame, 0, movement);
    [UIView commitAnimations];
    
}


@end
