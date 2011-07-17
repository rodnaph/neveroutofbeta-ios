
#import "HomeViewController.h"
#import "EpisodeCell.h"
#import "EpisodeViewController.h"
#import "EpisodeFeedParser.h"

@implementation HomeViewController

#pragma mark -
#pragma mark Init

- (void)dealloc {
    
    [episodes release];
    [tableView release];
    
    [super dealloc];
    
}

#pragma mark -
#pragma mark View

- (void)viewDidLoad {
    
    self.title = @"Home";
    
    episodes = nil;
    
}

- (void)viewDidAppear:(BOOL)animated {
    
    if ( episodes == nil ) {
        [self loadEpisodes];
    }
    
}

#pragma mark -
#pragma mark Methods

- (void)loadEpisodes {
    
    EpisodeFeedParser *parser = [[EpisodeFeedParser alloc] init];
    
    episodes = [[parser getEpisodes] retain];
    [parser release];
    
    [tableView reloadData];
    
}

#pragma mark -
#pragma mark Table View

- (int)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [episodes count];
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSArray *objects = [[NSBundle mainBundle] loadNibNamed:@"EpisodeCell" owner:self options:nil];
    EpisodeCell *cell = (EpisodeCell *) [objects objectAtIndex:0];
    
    Episode *episode = [episodes objectAtIndex:indexPath.row];
    
    cell.titleLabel.text = [episode getVersion];
    cell.descriptionLabel.text = episode.title;
    cell.dateLabel.text = [episode getDate];
    
    return cell;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 60;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    EpisodeViewController *ctrl = [[EpisodeViewController alloc]
                                   initWithNibName:@"EpisodeView"
                                   bundle:nil];
  
    ctrl.episode = (Episode *) [episodes objectAtIndex:[indexPath row]];
    
    [self.navigationController pushViewController:ctrl animated:YES];
    
    [ctrl release];
    
}

@end
