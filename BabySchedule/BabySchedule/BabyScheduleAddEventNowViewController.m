//
//  BabyScheduleAddEventNowViewController.m
//  BabySchedule
//
//  Created by Juha Riippi on 8/11/12.
//
//

#import "BabyScheduleAddEventNowViewController.h"

@interface BabyScheduleAddEventNowViewController ()

@end

@implementation BabyScheduleAddEventNowViewController

@synthesize delegate;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)cancel:(id)sender
{
    [self.delegate babyScheduleAddEventViewControllerDidCancel:self];
}

- (IBAction)done:(id)sender
{
//    NSString *name = [[BabyScheduleEventTypes allEvents] objectAtIndex:[eventTypePicker selectedRowInComponent:0]];
//    NSDate *startDate = [timePicker date];
//    
//    
//    BabyScheduleEvent *event = nil;
//    if( [name isEqualToString:GO_TO_SLEEP_NAME] )
//    {
//        NSDate *endDate = [timePickerForEnd date];
//        NSTimeInterval interval = [endDate timeIntervalSinceDate:startDate];
//        event = [[BabyScheduleEvent alloc] init:name date:startDate duration:interval freeValue:0];
//    }
//    else if( [name isEqualToString:NURSING_NAME] )
//    {
//        event = [[BabyScheduleEvent alloc] init:name date:startDate];
//    }
//    else {
//        event = [[BabyScheduleEvent alloc] init:name date:startDate];
//    }
//    
//    
//    BabyScheduleDataStorage *storage = [BabyScheduleDataStorage getInstance];
//    [storage insertEvent:event];
    
    [self.delegate babyScheduleAddEventViewControllerDidSave:self];
}

@end
