#import <Foundation/Foundation.h>

%hook FBSystemService
-(BOOL)_isTrustedRequest:(id)request forCaller:(id)caller fromClient:(id)client forBundleInfo:(id)bundleInfo withOptions:(id)options fatalError:(NSError **)fatalError {
	BOOL result = %orig;

	if (fatalError && *fatalError) {
		NSError *err = *fatalError;

		// if the system gave a Security error, swap it with a generic NotFound
		if ([err.domain isEqualToString:@"FBSOpenApplicationErrorDomain"] && err.code == 3) {
			*fatalError = [NSError errorWithDomain:err.domain code:4 userInfo:err.userInfo];
		}
	}

	return result;
}
%end
