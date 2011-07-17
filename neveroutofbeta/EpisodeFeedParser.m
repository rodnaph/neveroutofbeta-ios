
#import "EpisodeFeedParser.h"

@implementation EpisodeFeedParser

#pragma mark -
#pragma mark Init

- (void)dealloc {
    
    [episodes release];
    [currentEpisode release];
    
    [super dealloc];
    
}

#pragma mark -
#pragma mark Querying

- (NSMutableArray *)getEpisodes {
    
    NSString *urlString = @"http://www.neveroutofbeta.com/feed/";
    NSURL *url = [NSURL URLWithString:urlString];
    
    return [self getEpisodesFromUrl:url];
    
}

- (NSMutableArray *)getEpisodesFromUrl:(NSURL *)url {
    
    NSXMLParser *parser = [[NSXMLParser alloc] initWithContentsOfURL:url];
    
    if ( episodes != nil ) {
        [episodes release];
    }
    
    currentElementValue = [[NSMutableString alloc] init];
    episodes = [[NSMutableArray alloc] init];
    
    [parser setShouldReportNamespacePrefixes:NO];
    [parser setDelegate:self];
    [parser parse];
    
    return [episodes copy];
    
}

#pragma mark -
#pragma mark XML Parsing

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict {
    
    
    
    if ( [elementName isEqualToString:@"item"] ) {
        
        if ( currentEpisode != nil ) {
            [currentEpisode release];
            currentEpisode = nil;
        }
        
        currentEpisode = [[Episode alloc] init];
        
    }
    
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName {
    
    if ( [elementName isEqualToString:@"item"] ) {
        [episodes addObject:currentEpisode];
    }
    
    else if ( currentEpisode != nil ) {

        NSString *string = [currentElementValue stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
        
        if ( [elementName isEqualToString:@"link"] ) {
            currentEpisode.link = [NSURL URLWithString:string];
        }
        
        else if ( [elementName isEqualToString:@"title"] ) {
            currentEpisode.title = string;
        }
        
        else if ( [elementName isEqualToString:@"content:encoded"] ) {
            currentEpisode.description = string;
        }

    }
    
    [currentElementValue deleteCharactersInRange:NSMakeRange(0,[currentElementValue length])];
    
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string {

    if ( currentElementValue != nil ) {
        [currentElementValue appendString:string];
    }
    
}

@end
