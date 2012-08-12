//
//  BabyScheduleEventMarkingCell.m
//  BabySchedule
//
//  Created by Juha Riippi on 8/12/12.
//
//

#import "BabyScheduleEventMarkingCell.h"

@implementation BabyScheduleEventMarkingCell

@synthesize eventIcon, eventLastOccurredLabel, eventTypeLabel, addNowButton;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
