//
//  JobTableViewCell.h
//  TallerApp
//
//  Created by Marco Vinicio on 7/2/15.
//  Copyright (c) 2015 MarcoVinicioSantamariaMartinez. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JobTableViewCell : UITableViewCell


@property (weak, nonatomic) IBOutlet UILabel *lblName;
@property (weak, nonatomic) IBOutlet UILabel *lblMarc;
@property (weak, nonatomic) IBOutlet UILabel *lblModel;
@property (weak, nonatomic) IBOutlet UILabel *lblYear;

@end
