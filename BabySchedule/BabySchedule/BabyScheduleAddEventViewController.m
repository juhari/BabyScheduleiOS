//
//  BabyScheduleAddEventViewController.m
//  BabySchedule
//
//  Created by Juha Riippi on 6/21/12.
//  Copyright (c) 2012 Vincit Oy. All rights reserved.
//

#import "BabyScheduleAddEventViewController.h"
#import "BabyScheduleEventTypes.h"
#import "BabyScheduleEvent.h"
#import "BabyScheduleDataStorage.h"
#import "BabyScheduleUtils.h"

@interface BabyScheduleAddEventViewController ()

@end

@implementation BabyScheduleAddEventViewController

@synthesize delegate, eventTypePicker, resultLabel, segmentControl, datePicker;

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
    
    // set maximum date of datepicker to current time
    NSDate* now = [NSDate date];
    [datePicker setMaximumDate:now];
    
    // format resultLabel text
    [self updateResultLabel];    

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
    NSString *name = [[BabyScheduleEventTypes allEvents] objectAtIndex:[eventTypePicker selectedRowInComponent:0]];
    NSDate *date = [datePicker date];
    BabyScheduleEvent *event = [[BabyScheduleEvent alloc] init:name date:date];
    BabyScheduleDataStorage *storage = [BabyScheduleDataStorage getInstance];
    [storage insertEvent:event];
    
    [self.delegate babyScheduleAddEventViewControllerDidSave:self];
}

-(IBAction)textFieldReturn:(id)sender
{
    [sender resignFirstResponder];
}

-(IBAction)segmentChanged:(id)sender
{
    if( [segmentControl selectedSegmentIndex] == 0 )
    {
        [eventTypePicker setHidden:false];
        [datePicker setHidden:true];
    }
    else 
    {
        [eventTypePicker setHidden:true];    
        [datePicker setHidden:false];
    }
    
}

-(IBAction)dateChanged:(id)sender
{
    // format resultLabel text
    [self updateResultLabel];
}

-(void)updateResultLabel
{
    NSString* eventString = [[BabyScheduleEventTypes allEvents] objectAtIndex:[eventTypePicker selectedRowInComponent:0]];
    NSDate* selectedDate = [datePicker date];
    NSString* selectedDateString = [BabyScheduleUtils timeAsString:selectedDate];
    eventString = [eventString stringByAppendingString:@" "];
    eventString = [eventString stringByAppendingString:selectedDateString]; 
    resultLabel.text = eventString;
}

#pragma mark -
#pragma mark PickerView DataSource

- (NSInteger)numberOfComponentsInPickerView:
(UIPickerView *)pickerView
{
    return 1;
}
- (NSInteger)pickerView:(UIPickerView *)pickerView
numberOfRowsInComponent:(NSInteger)component
{
    return [[BabyScheduleEventTypes allEvents] count];
}
- (NSString *)pickerView:(UIPickerView *)pickerView
             titleForRow:(NSInteger)row
            forComponent:(NSInteger)component
{
    return [[BabyScheduleEventTypes allEvents] objectAtIndex:row];
} 

#pragma mark -
#pragma mark PickerView Delegate
-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row
      inComponent:(NSInteger)component
{
    // format resultLabel text
    [self updateResultLabel];
}
@end
