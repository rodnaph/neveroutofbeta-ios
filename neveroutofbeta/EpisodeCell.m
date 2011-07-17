
#import "EpisodeCell.h"

@implementation EpisodeCell

@synthesize titleLabel, descriptionLabel, dateLabel;

- (void)dealloc {
    
    [titleLabel release];
    [descriptionLabel release];
    [dateLabel release];
    
    [super dealloc];
    
}

@end
