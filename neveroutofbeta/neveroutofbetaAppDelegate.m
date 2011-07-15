
#import "neveroutofbetaAppDelegate.h"
#import "HomeViewController.h"

@implementation neveroutofbetaAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    HomeViewController *homeView = [[HomeViewController alloc]
                                    initWithNibName:@"HomeView"
                                    bundle:nil];
    
    window.rootViewController = homeView;
    [homeView release];
    
    [window makeKeyAndVisible];
    
    return YES;
    
}


- (void)dealloc {

    [window release];
    
    [super dealloc];
    
}

@end
