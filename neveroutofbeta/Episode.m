
#import "Episode.h"
#import "RegexKitLite.h"

@implementation Episode

@synthesize title, description, datePosted, link;

#pragma mark -
#pragma mark init

- (void)dealloc {
    
    [title release];
    [description release];
    [datePosted release];
    [link release];
    
    [super dealloc];
    
}

#pragma mark -
#pragma mark Accessors

- (NSURL *)getAudioUrl {
    
    NSString *urlRegex = @"((https?):((//)|(\\\\))+[\\w\\d:#@%/;$()~_?\\+-=\\\\.&]*)";
    NSArray *matches = [description componentsMatchedByRegex:urlRegex];
    
    if ( [matches count] > 0 ) {
        return [NSURL URLWithString:[matches objectAtIndex:0]];
    }
    
    return nil;
    
}

- (NSString *)getVersion {
    
    NSString *versionRegex = @"(\\d+\\.\\d+\\.\\d+)";
    NSArray *matches = [title componentsMatchedByRegex:versionRegex];
    
    if ( [matches count] > 0 ) {
        return [matches objectAtIndex:0];
    }
    
    return nil;
    
}

@end
