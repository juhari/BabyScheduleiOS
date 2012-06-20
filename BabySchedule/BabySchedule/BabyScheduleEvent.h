//
//  BabyScheduleEvent.h
//  BabySchedule
//
//  Created by Juha Riippi on 10.6.2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BabyScheduleEvent : NSObject

@property (strong) NSString *name;
@property (strong) NSDate *date;
@property (assign) int duration;
@property (assign) int freeValue;

- (id)init:(NSString*)name date:(NSDate*)date;
- (id)init:(NSString*)name date:(NSDate*)date duration:(int)duration freeValue:(int)freeValue;

@end
