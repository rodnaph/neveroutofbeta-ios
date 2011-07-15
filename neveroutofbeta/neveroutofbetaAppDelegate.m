
#import "neveroutofbetaAppDelegate.h"
#import "HomeViewController.h"

@implementation neveroutofbetaAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    HomeViewController *homeView = [[HomeViewController alloc]
                                    initWithNibName:@"HomeView"
                                    bundle:nil];
    
    navigationController = [[UINavigationController alloc] initWithRootViewController:homeView];
    [homeView release];
    
    window.rootViewController = navigationController;
    
    [window makeKeyAndVisible];
    
    return YES;
    
}


- (void)dealloc {

    [navigationController release];
    [window release];
    
    [super dealloc];
    
}

@end
