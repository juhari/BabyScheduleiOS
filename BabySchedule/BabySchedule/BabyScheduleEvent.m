//
//  BabyScheduleEvent.m
//  BabySchedule
//
//  Created by Juha Riippi on 10.6.2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "BabyScheduleEvent.h"
#import "BabyScheduleEventTypes.h"

@implementation BabyScheduleEvent

@synthesize name = _name;
@synthesize date = _date;
@synthesize durationInSeconds = _duration;
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
        self.durationInSeconds = duration;
        self.freeValue = freeValue;
    }
    return self;
}

-(UIImage*)eventIcon {
    if( [self.name isEqualToString:GO_TO_SLEEP_NAME] ||
       [self.name isEqualToString:WAKE_UP_NAME] ) {
        return [UIImage imageNamed:@"sleep_icon.png"];
    }
    else if( [self.name isEqualToString:MILK_NAME]) {
        return [UIImage imageNamed:@"milk_icon.png"];
    }
    else if( [self.name isEqualToString:NURSING_NAME]) {
        return [UIImage imageNamed:@"nurse_icon.png"];
    }
    
    return nil;
}
@end
