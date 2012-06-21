//
//  BabyScheduleDataStorage.m
//  BabySchedule
//
//  Created by Juha Riippi on 6/20/12.
//  Copyright (c) 2012 Vincit Oy. All rights reserved.
//

#import "BabyScheduleDataStorage.h"

@implementation BabyScheduleDataStorage

static BabyScheduleDataStorage* _sharedInstance = nil;

@synthesize allEventsList = _allEventsList;

+(BabyScheduleDataStorage*)getInstance {
    @synchronized([BabyScheduleDataStorage class]) {
        if( !_sharedInstance) {
            [[self alloc] init];
        }
        
        return _sharedInstance;
    }
    
    return nil;
}

+(id)alloc {
    @synchronized([BabyScheduleDataStorage class]) {
        NSAssert(_sharedInstance == nil, @"Attempted to allocate BabyScheduleDataStorage for second time");
        _sharedInstance = [super alloc];
        return _sharedInstance;
    }
    
    return nil;
}

-(id)init {
    self = [super init];
    return self;
}

-(void)insertEvent:(BabyScheduleEvent *)eventToAdd {
    [_allEventsList addObject:(eventToAdd)];
}

@end
