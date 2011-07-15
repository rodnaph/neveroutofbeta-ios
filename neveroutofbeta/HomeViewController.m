
#import "HomeViewController.h"
#import "ASIHTTPRequest.h"

@implementation HomeViewController

- (void)viewDidLoad {
    
    [self loadEpisodes];
    [tableView reloadData];
    
}

- (void)loadEpisodes {
    
//    NSString *urlString = @"http://www.neveroutofbeta.com/feed/";
//    NSURL *url = [NSURL URLWithString:urlString];
//    ASIHTTPRequest *request = [[ASIHTTPRequest alloc] initWithURL:url];
    
}

- (int)numberOfSectionsInTableView:(UITableView *)tableView {
    return 10;
}

- (int)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [[[NSBundle mainBundle] loadNibNamed:@"EpisodeCell" owner:self options:nil] objectAtIndex:0];
    
    return cell;
    
}

@end
