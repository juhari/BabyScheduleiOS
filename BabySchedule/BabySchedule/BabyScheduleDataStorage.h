//
//  BabyScheduleDataStorage.h
//  BabySchedule
//
//  Created by Juha Riippi on 6/20/12.
//  Copyright (c) 2012 Vincit Oy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BabyScheduleEvent.h"

@interface BabyScheduleDataStorage : NSObject 
{
    NSMutableArray *allEventsList;
}

+(BabyScheduleDataStorage*)getInstance;
-(void)insertEvent:(BabyScheduleEvent*)eventToAdd;
-(NSMutableArray*)allEvents;

@end
