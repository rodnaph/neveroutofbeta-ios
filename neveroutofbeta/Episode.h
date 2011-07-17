
@interface Episode : NSObject {}

@property (nonatomic, copy) NSString *title, *description;
@property (nonatomic, copy) NSDate *datePosted;
@property (nonatomic, copy) NSURL *link;

- (NSURL *)getAudioUrl;
- (NSString *)getVersion;
- (NSString *)getDate;
- (NSString *)getTitle;

@end
