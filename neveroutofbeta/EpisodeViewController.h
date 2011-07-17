
#import "Episode.h"
#import "AudioStreamer.h"

@interface EpisodeViewController : UIViewController {
    AudioStreamer *streamer;
}

@property (nonatomic, retain) Episode *episode;

@property (nonatomic, retain) IBOutlet UILabel *descriptionLabel;
@property (nonatomic, retain) IBOutlet UIScrollView *descriptionScrollView;
@property (nonatomic, retain) IBOutlet UISlider *playSlider;
@property (nonatomic, retain) IBOutlet UIButton *playButton;

- (IBAction)playClicked;

- (void)initUI;
- (void)initAudio;

@end
