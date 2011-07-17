
#import "EpisodeFeedParserTest.h"
#import "EpisodeFeedParser.h"
#import "Episode.h"

@implementation EpisodeFeedParserTest

- (void)setUp {
    NSString *xmlPath = [[NSBundle bundleForClass:[self class]] pathForResource:@"feed" ofType:@"xml"];
    xmlUrl = [NSURL fileURLWithPath:xmlPath];
    parser = [[EpisodeFeedParser alloc] init];
}

- (void)tearDown {
    [parser release];
}

- (void)testAllEpisodesFromFeedReturned {
    NSMutableArray *episodes = [parser getEpisodesFromUrl:xmlUrl];
    STAssertTrue( [episodes count] == 2, @"Expected 2" );
}

- (void)testEpisodesInFeedHavePropertiesCorrectlySet {
    Episode *episode = (Episode *) [[parser getEpisodesFromUrl:xmlUrl] objectAtIndex:1];
    STAssertTrue( [episode.title isEqualToString:@"the episode title"], @"Title incorrect" );
    STAssertTrue( [episode.description isEqualToString:@"The <b>episode</b> description"], @"Description incorrect" );
}

@end
