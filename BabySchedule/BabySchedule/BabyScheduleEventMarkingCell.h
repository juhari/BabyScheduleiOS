//
//  BabyScheduleEventMarkingCell.h
//  BabySchedule
//
//  Created by Juha Riippi on 8/12/12.
//
//

#import <UIKit/UIKit.h>

@interface BabyScheduleEventMarkingCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UIImageView *eventIcon;
@property (strong, nonatomic) IBOutlet UILabel *eventTypeLabel;
@property (strong, nonatomic) IBOutlet UILabel *eventLastOccurredLabel;
@property (strong, nonatomic) IBOutlet UIButton *addNowButton;

@end
