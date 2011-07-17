
#import "EpisodeTest.h"

@implementation EpisodeTest

- (void)setUp {
    episode = [[Episode alloc] init];
}

- (void)tearDown {
    [episode release];
}

- (void)testAudioUrlExtractedFromDescription {
    episode.description = @"foo bar baz http://mydomain.com/some/audio_file-0.9.1.mp3 blah";
    STAssertTrue( [[episode getAudioUrl] isEqual:[NSURL URLWithString:@"http://mydomain.com/some/audio_file-0.9.1.mp3"]], @"Audio URL not extracted" );
}

- (void)testHttpsUrlsCanBeExtractedAsAudioUrls {
    episode.description = @"foo bar baz https://mydomain.com/some/audio_file-0.9.1.mp3 blah";
    STAssertTrue( [[episode getAudioUrl] isEqual:[NSURL URLWithString:@"https://mydomain.com/some/audio_file-0.9.1.mp3"]], @"HTTPS Audio URL not extracted" );
}

- (void)testFirstMp3UrlExtractedAsAudioUrl {
    episode.description = @"foo bar baz http://mydomain.com/some/audio_file-0.9.1.mp3 http://mydomain-other.com/some/audio_file-0.9.1.mp3 blah";
    STAssertTrue( [[episode getAudioUrl] isEqual:[NSURL URLWithString:@"http://mydomain.com/some/audio_file-0.9.1.mp3"]], @"First Audio URL not extracted" );
}

- (void)testNilReturnedWhenNoAudioUrlInDescription {
    episode.description = @"foo bar baz blah";
    STAssertTrue( [episode getAudioUrl] == nil, @"Audio URL is not nil" );
}

- (void)testGetversionReturnsVersionFromTitle {
    episode.title = @"Episode 0.9.1 - we are live!";
    STAssertTrue( [[episode getVersion] isEqualToString:@"0.9.1"], @"Version incorrect" );
}

- (void)testGetversionReturnsFirstVersionFromTitle {
    episode.title = @"Episode 0.9.1 - we are live not 0.9.2!";
    STAssertTrue( [[episode getVersion] isEqualToString:@"0.9.1"], @"First version expected" );
}

- (void)testGetversionReturnsNilWhenNoVersionInTitle {
    episode.title = @"Some title with a version number";
    STAssertTrue( [episode getVersion] == nil, @"Version not nil" );
}

@end
