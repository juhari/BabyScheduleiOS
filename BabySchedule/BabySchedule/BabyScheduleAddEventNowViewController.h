//
//  BabyScheduleAddEventNowViewController.h
//  BabySchedule
//
//  Created by Juha Riippi on 8/11/12.
//
//

#import <UIKit/UIKit.h>
#import "BabyScheduleAddEventDelegate.h"

@interface BabyScheduleAddEventNowViewController : UIViewController

@property (nonatomic, weak) id <BabyScheduleAddEventDelegate> delegate;

-(IBAction)cancel:(id)sender;
-(IBAction)done:(id)sender;

@end
