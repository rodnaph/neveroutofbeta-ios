
@interface HomeViewController : UIViewController <UITableViewDelegate, UITableViewDataSource> {
    IBOutlet UITableView *tableView;
}

- (void)loadEpisodes;

@end
