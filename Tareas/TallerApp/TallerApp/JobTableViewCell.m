//
//  JobTableViewCell.m
//  TallerApp
//
//  Created by Marco Vinicio on 7/2/15.
//  Copyright (c) 2015 MarcoVinicioSantamariaMartinez. All rights reserved.
//

#import "JobTableViewCell.h"

@implementation JobTableViewCell

@synthesize lblName = _lblName;
@synthesize lblMarc = _lblMarc;
@synthesize lblModel = _lblModel;
@synthesize lblYear = _lblYear;

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
