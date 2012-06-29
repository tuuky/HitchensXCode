//
//  LocationsTableViewController.h
//  Hitchens2
//
//  Created by Rodrigo Liberal on 6/29/12.
//  Copyright (c) 2012 Kabrea. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LocationsTableViewController : UITableViewController
{
    NSMutableArray *locations;
    NSDateFormatter *dateFormatter;
    UITableView *tableView;
}

@property (nonatomic, retain) NSMutableArray *locations;
@property (nonatomic, retain, readonly) NSDateFormatter *dateFormatter;
@property (nonatomic, retain) IBOutlet UITableView *tableView;

@end
