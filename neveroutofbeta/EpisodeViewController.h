
#import "Episode.h"

@interface EpisodeViewController : UIViewController {}

@property (nonatomic, retain) Episode *episode;

@property (nonatomic, retain) IBOutlet UILabel *descriptionLabel;
@property (nonatomic, retain) IBOutlet UIScrollView *descriptionScrollView;

@end
