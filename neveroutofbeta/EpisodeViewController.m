
#import "EpisodeViewController.h"
#import "Episode.h"

@implementation EpisodeViewController

@synthesize episode, descriptionLabel, descriptionScrollView;

- (void)viewDidLoad {

    self.title = @"0.9.1";
    
    descriptionLabel.text = @"foo foo foo foo GGGG GGGG GGGG GGGG GGGG GGGG GGGG GGGG GGGG GGGG GGGG GGGG GGGG GGGG GGGG GGGG GGGG GGGG GGGG GGGG GGGG GGGG foo foo foo foo foo foo foo foo foo foo foo foo foo foo foo foo foo foo foo foo foo foo foo foo foo foo foo foo foo foo foo foo foo foo foo foo foo foo foo foo foo foo foo foo foo foo foo foo foo foo foo foo foo foo foo foo foo foo foo foo foo foo foo foo foo foo foo foo foo foo foo foo foo foo foo foo foo foo foo foo foo foo foo foo foo foo foo foo foo foo foo foo foo foo foo  foo foo foo foo foo foo foo foo foo foo foo foo  foo foo foo foo foo foo foo foo foo foo foo foo END";
    [descriptionLabel sizeToFit];
    
    descriptionScrollView.contentSize = descriptionLabel.frame.size;
    
}

- (void)dealloc {
    
    [episode release];
    [descriptionLabel release];
    [descriptionScrollView release];
    
    [super dealloc];
    
}

@end
