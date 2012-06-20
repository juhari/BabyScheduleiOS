//
//  BabyScheduleEventMarkingListControllerViewController.h
//  BabySchedule
//
//  Created by Juha Riippi on 6/20/12.
//  Copyright (c) 2012 Vincit Oy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BabyScheduleEventMarkingListViewController : UITableViewController

@property (assign) NSMutableArray *eventsToMark;
@property (strong) NSMutableArray *sleepEvents;
@property (strong) NSMutableArray *wakeEvents;

@end
