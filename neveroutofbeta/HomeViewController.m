
#import "HomeViewController.h"
#import "ASIHTTPRequest.h"
#import "EpisodeCell.h"
#import "EpisodeViewController.h"

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

- (int)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSArray *objects = [[NSBundle mainBundle] loadNibNamed:@"EpisodeCell" owner:self options:nil];
    EpisodeCell *cell = (EpisodeCell *) [objects objectAtIndex:0];
    
    cell.titleLabel.text = @"0.9.1";
    cell.descriptionLabel.text = @"We are live!";
    cell.dateLabel.text = @"2011-07-10";
    
    return cell;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 60;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    EpisodeViewController *ctrl = [[EpisodeViewController alloc]
                                   initWithNibName:@"EpisodeView"
                                   bundle:nil];
    
    [self.navigationController pushViewController:ctrl animated:YES];
    
    [ctrl release];
    
}

@end
