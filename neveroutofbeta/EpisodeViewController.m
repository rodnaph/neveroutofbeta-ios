
#import "EpisodeViewController.h"
#import "Episode.h"

@implementation EpisodeViewController

@synthesize episode, descriptionLabel, descriptionScrollView, playSlider, playButton;

- (void)viewDidLoad {

    NSLog( @"Episode: %@", episode.description );
    
    [self initUI];
    [self initAudio];
    
}

- (void)initUI {
    
    self.title = [episode getVersion];
    
    descriptionLabel.text = episode.description;
    [descriptionLabel sizeToFit];
    
    descriptionScrollView.contentSize = descriptionLabel.frame.size;
    
}

- (void)initAudio {
    
    NSURL *audioUrl = [episode getAudioUrl];
    streamer = [[AudioStreamer alloc] initWithURL:audioUrl];
    
    NSLog( @"Audio URL: %@", audioUrl );
    
    [streamer start];
    
}

- (IBAction)playClicked {
    
    NSLog( @"Play clicked" );
    
}

- (void)dealloc {
    
    [streamer stop];
    
    [episode release];
    [descriptionLabel release];
    [descriptionScrollView release];
    [playSlider release];
    [playButton release];
    [streamer release];
    
    [super dealloc];
    
}

@end
