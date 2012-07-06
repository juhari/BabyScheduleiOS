//
//  BabyScheduleAddEventViewController.h
//  BabySchedule
//
//  Created by Juha Riippi on 6/21/12.
//  Copyright (c) 2012 Vincit Oy. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BabyScheduleAddEventViewController;

@protocol BabyScheduleAddEventViewControllerDelegate <NSObject>
-(void)babyScheduleAddEventViewControllerDidCancel: (BabyScheduleAddEventViewController *)controller;
-(void)babyScheduleAddEventViewControllerDidSave: (BabyScheduleAddEventViewController *)controller;

@end

@interface BabyScheduleAddEventViewController : UIViewController <UIPickerViewDelegate, UIPickerViewDataSource> 
{
    UIPickerView       *eventTypePicker;
    UILabel            *resultLabel;
    UISegmentedControl *segmentControl;
    UIDatePicker       *datePicker;
    int                selectedEventIndex;
}

@property (nonatomic, weak) id <BabyScheduleAddEventViewControllerDelegate> delegate;
@property (strong, nonatomic) IBOutlet UIPickerView *eventTypePicker;
@property (strong, nonatomic) IBOutlet UILabel *resultLabel;
@property (strong, nonatomic) IBOutlet UISegmentedControl *segmentControl;
@property (strong, nonatomic) IBOutlet UIDatePicker *datePicker;

-(IBAction)cancel:(id)sender;
-(IBAction)done:(id)sender;
-(IBAction)segmentChanged:(id)sender;
-(IBAction)textFieldReturn:(id)sender;
-(IBAction)dateChanged:(id)sender;

-(void)updateResultLabel;
-(void)setPickerViewSelectedValue:(NSString*)value;

@end
