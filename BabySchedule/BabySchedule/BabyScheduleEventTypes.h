//
//  BabyScheduleEventTypes.h
//  BabySchedule
//
//  Created by Juha Riippi on 6/20/12.
//  Copyright (c) 2012 Vincit Oy. All rights reserved.
//

#import <Foundation/Foundation.h>

FOUNDATION_EXPORT NSString *const GO_TO_SLEEP_NAME;
FOUNDATION_EXPORT NSString *const WAKE_UP_NAME;
FOUNDATION_EXPORT NSString *const MILK_NAME;
FOUNDATION_EXPORT NSString *const NURSING_NAME;



@interface BabyScheduleEventTypes
+(NSArray*)awakeEvents;
+(NSArray*)sleepEvents;
+(NSArray*)allEvents;

@end