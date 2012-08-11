//
//  BabyScheduleAddEventDelegate.h
//  BabySchedule
//
//  Created by Juha Riippi on 8/11/12.
//
//

#import <Foundation/Foundation.h>

@protocol BabyScheduleAddEventDelegate <NSObject>

-(void)babyScheduleAddEventViewControllerDidCancel: (UIViewController *)controller;
-(void)babyScheduleAddEventViewControllerDidSave: (UIViewController *)controller;

@end
