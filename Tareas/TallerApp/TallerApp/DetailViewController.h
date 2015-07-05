//
//  DetailViewController.h
//  TallerApp
//
//  Created by Marco Vinicio on 7/2/15.
//  Copyright (c) 2015 MarcoVinicioSantamariaMartinez. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface DetailViewController : UIViewController

@property (nonatomic, weak) PFObject *objDetail;
@property (weak, nonatomic) IBOutlet UILabel *lblPrice;
@property (weak, nonatomic) IBOutlet UITextView *txtDescription;



@end
