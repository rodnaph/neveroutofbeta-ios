
#import "Episode.h"

@interface EpisodeFeedParser : NSObject <NSXMLParserDelegate> {
    Episode *currentEpisode;
    NSMutableString *currentElementValue;
    NSMutableArray *episodes;
}

- (NSMutableArray *)getEpisodes;

@end
