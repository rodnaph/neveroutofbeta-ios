
#import "Episode.h"

@implementation Episode

@synthesize title, description, datePosted;

- (void)dealloc {
    
    [title release];
    [description release];
    [datePosted release];
    
    [super dealloc];
    
}

@end
