
#import "EpisodeViewController.h"
#import "Episode.h"
#import "NSAttributedString+HTML.h"
#import "DTAttributedTextView.h"

@implementation EpisodeViewController

@synthesize episode, isVisible;
@synthesize descriptionLabel, descriptionScrollView, playSlider, playButton, timeLabel, titleLabel;

#pragma mark -
#pragma mark init

- (void)dealloc {
    
    [self stop];
    
    [episode release];
    [descriptionLabel release];
    [descriptionScrollView release];
    [playSlider release];
    [playButton release];
    [streamer release];
    [timeLabel release];
    [titleLabel release];
    
    [super dealloc];
    
}

#pragma mark -
#pragma mark View

- (void)viewDidLoad {

    [self initUI];
    [self initAudio];
    
    isVisible = YES;
    
}

- (void)viewDidDisappear:(BOOL)animated {

    isVisible = NO;
    
}

#pragma mark -
#pragma mark Methods

- (void)initUI {
    
    self.title = [episode getVersion];
    titleLabel.text = [episode getTitle];
    
	NSDictionary *options = [NSDictionary dictionaryWithObjectsAndKeys:
                             [NSNumber numberWithFloat:1.0], NSTextSizeMultiplierDocumentOption,
                             [NSValue valueWithCGSize:CGSizeMake(200, 150)], DTMaxImageSize,
                             @"white", DTDefaultTextColor,
                             @"Arial", DTDefaultFontFamily,
                             @"purple", DTDefaultLinkColor, nil];

    NSData *stringData = [episode.description dataUsingEncoding:NSUTF8StringEncoding];
    NSAttributedString *attrString = [[NSAttributedString alloc]
                                      initWithHTML:stringData
                                      options:options
                                      documentAttributes:nil];
    
	descriptionScrollView.contentView.edgeInsets = UIEdgeInsetsMake(10, 10, 10, 10);
    descriptionScrollView.attributedString = attrString;

    [playSlider setMaximumValue:1.0];
    [playSlider setValue:0.0];
    
    [NSThread detachNewThreadSelector:@selector(updatePlaySliderTicker) toTarget:self withObject:nil];

}

- (void)initAudio {

    streamer = nil;

    [self play];
    
}

- (void)updatePlaySliderTicker {

    while ( TRUE ) {
        sleep( 1 );
        if ( self.isVisible ) {
            [self performSelectorOnMainThread:@selector(updatePlaySlider)
                                withObject:nil
                                waitUntilDone:NO];
        }
        else {
            [self performSelectorOnMainThread:@selector(pause)
                                withObject:nil
                                waitUntilDone:NO];
            break;
        }
    }
    
}

- (void)updatePlaySlider {
        
    if ( [streamer isPlaying] ) {

        int minutes = currentTime / 60;
        int seconds = currentTime - (minutes * 60);
            
        self.timeLabel.text = [NSString stringWithFormat:@"%d:%02d", minutes, seconds];

        currentTime++;

    }
    
}

#pragma mark -
#pragma mark Application Methods

- (void)applicationDidEnterBackground {
    
    if ( [streamer isPlaying] ) {
        [streamer pause];
    }
    
    isVisible = NO;
    
}

- (void)applicationDidEnterForeground {
    
    if ( [streamer isPaused] ) {
        [streamer start];
    }
    
    isVisible = YES;
    
}

#pragma mark -
#pragma mark Actions

- (IBAction)playClicked {
    
    if ( [streamer isPlaying] ) {
        [streamer pause];
        [playButton setTitle:@">" forState:UIControlStateNormal];
    }
    
    else if ( [streamer isPaused] ) {
        [streamer start];
        [playButton setTitle:@"||" forState:UIControlStateNormal];
    }
    
}

- (IBAction)playSliderMoved {
    
    if ( [streamer isPlaying] || [streamer isPaused] ) {
        currentTime = [streamer duration] * [playSlider value];
        [streamer seekToTime:currentTime];
    }
    
    else {
        [playSlider setValue:currentTime];
    }
    
}

#pragma mark -
#pragma mark Playing

- (void) play {

    currentTime = 0;
    
    [self stop];

    streamer = [[AudioStreamer alloc] initWithURL:[episode getAudioUrl]];
    [streamer start];
    
}

- (void) pause {
    
    [streamer pause];
    
}

- (void) stop {
    
    if ( streamer != nil ) {
        [streamer stop];
        [streamer release];
        streamer = nil;
    }
    
}

@end
