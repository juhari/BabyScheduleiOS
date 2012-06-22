//
//  BabyScheduleEventMarkingListControllerViewController.h
//  BabySchedule
//
//  Created by Juha Riippi on 6/20/12.
//  Copyright (c) 2012 Vincit Oy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BabyScheduleAddEventViewController.h"

@interface BabyScheduleEventMarkingListViewController : UITableViewController <BabyScheduleAddEventViewControllerDelegate>

@property (assign) NSMutableArray *eventsToMark;
@property (strong) NSMutableArray *sleepEvents;
@property (strong) NSMutableArray *wakeEvents;

@end
