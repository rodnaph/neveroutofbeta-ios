
#import "Episode.h"
#import "AudioStreamer.h"
#import "DTAttributedTextView.h"

@interface EpisodeViewController : UIViewController {
    int currentTime;
    AudioStreamer *streamer;
}

@property (nonatomic, retain) Episode *episode;
@property (nonatomic, assign) BOOL isVisible; // used to terminate child threads

@property (nonatomic, retain) IBOutlet UILabel *descriptionLabel, *timeLabel, *titleLabel;
@property (nonatomic, retain) IBOutlet DTAttributedTextView *descriptionScrollView;
@property (nonatomic, retain) IBOutlet UISlider *playSlider;
@property (nonatomic, retain) IBOutlet UIButton *playButton;

- (IBAction)playClicked;
- (IBAction)playSliderMoved;

- (void)initUI;
- (void)initAudio;
- (void)updatePlaySlider;
- (void)updatePlaySliderTicker;

- (void)play;
- (void)pause;
- (void)stop;

- (void)applicationDidEnterForeground;
- (void)applicationDidEnterBackground;

@end
