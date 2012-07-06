//
//  BabyScheduleUtils.m
//  BabySchedule
//
//  Created by Juha Riippi on 7/6/12.
//  Copyright (c) 2012 Vincit Oy. All rights reserved.
//

#import "BabyScheduleUtils.h"

@implementation BabyScheduleUtils

+(NSString*)timeAsString:(NSDate*)date
{
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc]init];
    [dateFormat setDateFormat:@"dd/MM/yyyy HH:mm"];
    NSString *dateString = [dateFormat stringFromDate:date];
    return dateString;
}

@end
