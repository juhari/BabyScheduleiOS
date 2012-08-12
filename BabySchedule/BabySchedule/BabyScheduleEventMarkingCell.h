//
//  BabyScheduleEventMarkingCell.h
//  BabySchedule
//
//  Created by Juha Riippi on 8/12/12.
//
//

#import <UIKit/UIKit.h>

@interface BabyScheduleEventMarkingCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *eventIcon;
@property (weak, nonatomic) IBOutlet UILabel *eventTypeLabel;
@property (weak, nonatomic) IBOutlet UILabel *eventLastOccurredLabel;
@property (weak, nonatomic) IBOutlet UIButton *addNowButton;

@end
