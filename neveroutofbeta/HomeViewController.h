
@interface HomeViewController : UIViewController <UITableViewDelegate, UITableViewDataSource> {
    IBOutlet UITableView *episodeTable;
    NSMutableArray *episodes;
}

- (void)loadEpisodes;

@end
