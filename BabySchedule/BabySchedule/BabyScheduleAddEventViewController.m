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

@synthesize delegate, eventTypePicker, additionalInfoField, startTimeField, timePicker, timePickerToolbar, additionalInfoLabel;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
    }
    return self;
}

- (void) viewWillAppear:(BOOL)animated
{
    [eventTypePicker selectRow:selectedEventIndex inComponent:0 animated:YES];
    
    // set timePicker max value to current moment
    timePicker.maximumDate = [NSDate date];
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
    NSDate *date = [timePicker date];
    BabyScheduleEvent *event = [[BabyScheduleEvent alloc] init:name date:date];
    BabyScheduleDataStorage *storage = [BabyScheduleDataStorage getInstance];
    [storage insertEvent:event];
    
    [self.delegate babyScheduleAddEventViewControllerDidSave:self];
}

-(IBAction)timePickerToolbarDone:(id)sender
{
    [self.startTimeField resignFirstResponder];
}

-(IBAction)startTimeDateChanged:(id)sender
{
    NSDate* date = [timePicker date];
    startTimeField.text = [BabyScheduleUtils timeAsString:date];
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
    
}
@end
