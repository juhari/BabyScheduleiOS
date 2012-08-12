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

@synthesize delegate, eventTypePicker, additionalInfoField, startTimeField, timePicker, timePickerForEnd, timePickerToolbar, additionalInfoLabel;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
    }
    return self;
}

- (void) viewWillAppear:(BOOL)animated
{
    [self.eventTypePicker selectRow:selectedEventIndex inComponent:0 animated:YES];
    
    // set timePicker max value to current moment
    self.timePicker.maximumDate = [NSDate date];
    self.timePickerForEnd.minimumDate = [NSDate date];
    self.timePickerForEnd.maximumDate = [NSDate date];
    
    // set start time field to now
    self.startTimeField.text = [BabyScheduleUtils timeAsString:[NSDate date]];

    [self selectedEventTypeChanged];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // setup time picker dialog to be input view for startTimeField
    self.startTimeField.inputView = self.timePicker;
    self.startTimeField.inputAccessoryView = self.timePickerToolbar;
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
    NSDate *startDate = [timePicker date];
    
    
    BabyScheduleEvent *event = nil;
    if( [name isEqualToString:GO_TO_SLEEP_NAME] )
    {
        NSDate *endDate = [timePickerForEnd date];
        NSTimeInterval interval = [endDate timeIntervalSinceDate:startDate];
        event = [[BabyScheduleEvent alloc] init:name date:startDate duration:interval freeValue:0];
    }
    else if( [name isEqualToString:NURSING_NAME] )
    {
        event = [[BabyScheduleEvent alloc] init:name date:startDate];
    }
    else {
        event = [[BabyScheduleEvent alloc] init:name date:startDate];
    }


    BabyScheduleDataStorage *storage = [BabyScheduleDataStorage getInstance];
    [storage insertEvent:event];
    
    [self.delegate babyScheduleAddEventViewControllerDidSave:self];
}

-(IBAction)timePickerToolbarDone:(id)sender
{
    [self.startTimeField resignFirstResponder];
    [self.additionalInfoField resignFirstResponder];
}

-(IBAction)timePickerDateChanged:(id)sender
{
    if([timePicker isEqual:sender] )
    {
        NSDate* date = [timePicker date];
        self.startTimeField.text = [BabyScheduleUtils timeAsString:date];
        self.timePickerForEnd.minimumDate = date;

    }
    else if([timePickerForEnd isEqual:sender])
    {
        NSDate* date = [timePickerForEnd date];
        self.additionalInfoField.text = [BabyScheduleUtils timeAsString:date];
    }
    
}

-(void)updateStartTimeField
{
    
}

-(void)updateAdditionalInfoField 
{
    
}

-(void)setPickerViewSelectedValue:(NSString*)value
{
    selectedEventIndex = [[BabyScheduleEventTypes allEvents] indexOfObjectIdenticalTo:value];
}

-(void)selectedEventTypeChanged
{
    // update the label for additional info 
    NSString *selectedEventType = [[BabyScheduleEventTypes allEvents] objectAtIndex:selectedEventIndex];
    if( [selectedEventType isEqualToString:GO_TO_SLEEP_NAME] )
    {
        self.additionalInfoLabel.text = @"Select wake up time";
        self.additionalInfoField.inputView = self.timePickerForEnd;
        self.additionalInfoField.inputAccessoryView = self.timePickerToolbar;
    }
    else if( [selectedEventType isEqualToString:NURSING_NAME] )
    {
        self.additionalInfoLabel.text = @"Select duration";
    }
    else {
        self.additionalInfoLabel.text = @"Additional info";
    }
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
    selectedEventIndex = row;
    [self selectedEventTypeChanged];
}
@end
