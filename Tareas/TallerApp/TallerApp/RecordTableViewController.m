//
//  RecordTableViewController.m
//  TallerApp
//
//  Created by Marco Vinicio on 6/29/15.
//  Copyright (c) 2015 MarcoVinicioSantamariaMartinez. All rights reserved.
//

#import "RecordTableViewController.h"
#import "DetailViewController.h"
#import "JobTableViewCell.h"
#import <Parse/Parse.h>

static int NUMBER_SECTION = 1;

@interface RecordTableViewController ()

@end

@implementation RecordTableViewController

- (void)viewDidLoad
{

    [super viewDidLoad];
    [self performSelector:@selector(retrieveFromParse)];

}

- (void)didReceiveMemoryWarning
{

    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.

}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{

    // Return the number of sections.
    return NUMBER_SECTION;

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    // Return the number of rows in the section.
    return self.ParkingLot.count;

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *simpleTableIdentifier = @"CARS";
    
    JobTableViewCell *cell = (JobTableViewCell *)[tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil)
    {
        
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"JobTableViewCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
        
    }
    
    PFObject *tempObject = [self.ParkingLot objectAtIndex:indexPath.row];
    
    if(tempObject != nil)
    {
        
        cell.lblName.text = [tempObject objectForKey:@"Owner"];
        cell.lblMarc.text = [tempObject objectForKey:@"Marc"];
        cell.lblModel.text =[tempObject objectForKey:@"Model"];
        cell.lblYear.text =[tempObject objectForKey:@"Year"];
    
    }
    
    return cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    PFObject *selectedObject = [self.ParkingLot objectAtIndex:indexPath.row];
    DetailViewController *view =[self.storyboard instantiateViewControllerWithIdentifier:@"DetailViewController"];
    
    view.objDetail = selectedObject;
    [self.navigationController pushViewController:view animated:YES];
    
}

- (void) retrieveFromParse
{
    
    PFQuery *retrievePlayers = [PFQuery queryWithClassName:@"Cars"];
    [retrievePlayers findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        
        if (!error) {
            
            self.ParkingLot = [[NSMutableArray alloc] initWithArray:objects];
            
        }
        
        [self.tableView reloadData];
        
    }];
    
    [self.tableView reloadData];
    [self.refreshControl endRefreshing];
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    return 78;
    
}

@end
