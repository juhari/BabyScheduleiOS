//
//  BabyScheduleEventMarkingListControllerViewController.m
//  BabySchedule
//
//  Created by Juha Riippi on 6/20/12.
//  Copyright (c) 2012 Vincit Oy. All rights reserved.
//

#import "BabyScheduleEventMarkingListViewController.h"
#import "BabyScheduleEvent.h"
#import "BabyScheduleEventTypes.h"
#import "BabyScheduleAddEventViewController.h"

@interface BabyScheduleEventMarkingListViewController ()

@end

@implementation BabyScheduleEventMarkingListViewController

@synthesize eventsToMark = _eventsToMark;
@synthesize sleepEvents = _sleepEvents;
@synthesize wakeEvents = _wakeEvents;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSDate* now = [NSDate date];
    
    BabyScheduleEvent *sleepEvent = [[BabyScheduleEvent alloc] init:GO_TO_SLEEP_NAME date:now];
    BabyScheduleEvent *wakeEvent = [[BabyScheduleEvent alloc] init:WAKE_UP_NAME date:now];
    BabyScheduleEvent *milkEvent = [[BabyScheduleEvent alloc] init:MILK_NAME date:now];
    BabyScheduleEvent *nursingEvent = [[BabyScheduleEvent alloc] init:NURSING_NAME date:now];
    
    self.wakeEvents = [NSMutableArray arrayWithObjects:sleepEvent, milkEvent, nursingEvent, nil];
    self.sleepEvents = [NSMutableArray arrayWithObjects:wakeEvent, milkEvent, nursingEvent, nil];
    
    self.eventsToMark = self.wakeEvents;
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [_eventsToMark count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"BasicMarkingCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    // Configure the cell...
    BabyScheduleEvent *event = [self.eventsToMark objectAtIndex:indexPath.row];
    cell.textLabel.text = event.name;
    
    
    return cell;
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.identifier isEqualToString:@"AddEvent"])
    {
        UINavigationController *navigationController = segue.destinationViewController;
        BabyScheduleAddEventViewController *addEventController = [[navigationController viewControllers] objectAtIndex:0];
        addEventController.delegate = self;
    }
    else if([segue.identifier isEqualToString:@"AddEventFromTable"])
    {
        UINavigationController *navigationController = segue.destinationViewController;
        BabyScheduleAddEventViewController *addEventController = [[navigationController viewControllers] objectAtIndex:0];
        addEventController.delegate = self;
        
        UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:[self.tableView indexPathForSelectedRow]];
        [addEventController setPickerViewSelectedValue:cell.textLabel.text];
    }
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
}

#pragma mark - BabyScheduleAddEventViewControllerDelegate

- (void) babyScheduleAddEventViewControllerDidCancel:(BabyScheduleAddEventViewController *)controller
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void) babyScheduleAddEventViewControllerDidSave:(BabyScheduleAddEventViewController *)controller
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
