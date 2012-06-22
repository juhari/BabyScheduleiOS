//
//  BabyScheduleAddEventViewController.h
//  BabySchedule
//
//  Created by Juha Riippi on 6/21/12.
//  Copyright (c) 2012 Vincit Oy. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BabyScheduleAddEventViewController;

@protocol BabyScheduleAddEventViewControllerDelegate <NSObject>
-(void)babyScheduleAddEventViewControllerDidCancel: (BabyScheduleAddEventViewController *)controller;
-(void)babyScheduleAddEventViewControllerDidSave: (BabyScheduleAddEventViewController *)controller;

@end

@interface BabyScheduleAddEventViewController : UIViewController

@property (nonatomic, weak) id <BabyScheduleAddEventViewControllerDelegate> delegate;
@property (strong, nonatomic) NSArray *eventNames;

-(IBAction)cancel:(id)sender;
-(IBAction)done:(id)sender;

@end
