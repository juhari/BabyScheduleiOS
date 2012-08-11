//
//  BabyScheduleAddEventViewController.h
//  BabySchedule
//
//  Created by Juha Riippi on 6/21/12.
//  Copyright (c) 2012 Vincit Oy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BabyScheduleAddEventDelegate.h"

@class BabyScheduleAddEventViewController;

@interface BabyScheduleAddEventViewController : UIViewController <UIPickerViewDelegate, UIPickerViewDataSource> 
{
    UIPickerView       *eventTypePicker;
    UITextField        *startTimeField;
    UITextField        *additionalInfoField;
    UIDatePicker       *timePicker;
    UIDatePicker       *timePickerForEnd;
    UIToolbar          *timePickerToolbar;
    UILabel            *additionalInfoLabel;
    int                selectedEventIndex;
}

@property (nonatomic, weak) id <BabyScheduleAddEventDelegate> delegate;
@property (strong, nonatomic) IBOutlet UIPickerView *eventTypePicker;
@property (strong, nonatomic) IBOutlet UITextField *startTimeField;
@property (strong, nonatomic) IBOutlet UITextField *additionalInfoField;
@property (strong, nonatomic) IBOutlet UIDatePicker *timePicker;
@property (strong, nonatomic) IBOutlet UIDatePicker *timePickerForEnd;
@property (strong, nonatomic) IBOutlet UIToolbar *timePickerToolbar;
@property (strong, nonatomic) IBOutlet UILabel *additionalInfoLabel;

-(IBAction)cancel:(id)sender;
-(IBAction)done:(id)sender;
-(IBAction)timePickerDateChanged:(id)sender;
-(IBAction)timePickerToolbarDone:(id)sender;

-(void)updateStartTimeField;
-(void)updateAdditionalInfoField;
-(void)setPickerViewSelectedValue:(NSString*)value;
-(void)selectedEventTypeChanged;

@end
