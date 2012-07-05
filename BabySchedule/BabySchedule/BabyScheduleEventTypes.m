//
//  BabyScheduleEventTypes.m
//  BabySchedule
//
//  Created by Juha Riippi on 6/20/12.
//  Copyright (c) 2012 Vincit Oy. All rights reserved.
//

#import "BabyScheduleEventTypes.h"

NSString *const GO_TO_SLEEP_NAME = @"Go to sleep";
NSString *const WAKE_UP_NAME = @"Wake up";
NSString *const MILK_NAME = @"Milk";
NSString *const NURSING_NAME = @"Nursing";

static NSArray *ALL_EVENTS = nil;
static NSArray *AWAKE_EVENTS = nil;
static NSArray *SLEEP_EVENTS = nil;

@implementation BabyScheduleEventTypes

+(NSArray*)allEvents 
{
    if( ALL_EVENTS == nil )
    {
        ALL_EVENTS = [NSArray arrayWithObjects:GO_TO_SLEEP_NAME, WAKE_UP_NAME, MILK_NAME, NURSING_NAME, nil];
    }
    
    return ALL_EVENTS;
}

+(NSArray*)sleepEvents 
{
    if( SLEEP_EVENTS == nil ) 
    {
        SLEEP_EVENTS = [NSArray arrayWithObjects:WAKE_UP_NAME, MILK_NAME, NURSING_NAME, nil];
    }
    
    return SLEEP_EVENTS;
}

+(NSArray*)awakeEvents
{
    if( AWAKE_EVENTS == nil )
    {
        AWAKE_EVENTS = [NSArray arrayWithObjects:GO_TO_SLEEP_NAME, MILK_NAME, NURSING_NAME, nil];
    }
    
    return AWAKE_EVENTS;
}

@end