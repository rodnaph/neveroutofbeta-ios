
@interface HomeViewController : UIViewController <UITableViewDelegate, UITableViewDataSource> {
    IBOutlet UITableView *tableView;
    NSMutableArray *episodes;
}

- (void)loadEpisodes;

@end
