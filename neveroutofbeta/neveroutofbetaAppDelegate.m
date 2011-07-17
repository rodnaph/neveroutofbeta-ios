
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

- (void)applicationDidEnterForeground:(UIApplication *)application {
    
    if ( [navigationController.visibleViewController respondsToSelector:@selector(applicationDidEnterBackground)] ) {
        [navigationController.visibleViewController performSelector:@selector(applicationDidEnterBackground)];
    }
    
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    
    if ( [navigationController.visibleViewController respondsToSelector:@selector(applicationDidEnterBackground)] ) {
        [navigationController.visibleViewController performSelector:@selector(applicationDidEnterBackground)];
    }
    
}

- (void)dealloc {

    [window release];
    
    [super dealloc];
    
}

@end
