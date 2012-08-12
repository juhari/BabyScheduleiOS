//
//  BabyScheduleEventMarkingListControllerViewController.h
//  BabySchedule
//
//  Created by Juha Riippi on 6/20/12.
//  Copyright (c) 2012 Vincit Oy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BabyScheduleAddEventViewController.h"
#import "BabyScheduleAddEventDelegate.h"

@interface BabyScheduleEventMarkingListViewController : UITableViewController <BabyScheduleAddEventDelegate>

@property (assign) NSMutableArray *eventsToMark;
@property (strong) NSMutableArray *sleepEvents;
@property (strong) NSMutableArray *wakeEvents;

-(IBAction)addNowButtonPushed:(id)sender;

@end
