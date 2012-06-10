//
//  BabyScheduleEvent.m
//  BabySchedule
//
//  Created by Juha Riippi on 10.6.2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "BabyScheduleEvent.h"

@implementation BabyScheduleEvent

@synthesize name = _name;
@synthesize date = _date;
@synthesize duration = _duration;
@synthesize freeValue = _freeValue;

- (id)init:(NSString*)name date:(NSDate*)date {
    if((self = [super init])) {
        self.name = name;
        self.date = date;
    }
    return self;
}

- (id)init:(NSString*)name date:(NSDate*)date duration:(int)duration freeValue:(int)freeValue {
    if((self = [super init])) {
        self.name = name;
        self.date = date;
        self.duration = duration;
        self.freeValue = freeValue;
    }
    return self;
}
@end
