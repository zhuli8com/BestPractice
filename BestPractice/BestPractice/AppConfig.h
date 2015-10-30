//
//  AppConfig.h
//  BestPractice
//
//  Created by lizhu on 15/10/27.
//  Copyright © 2015年 zhuli. All rights reserved.
//

//一共有四套环境：开发环境、测试环境、预上线环境、发布环境
#ifndef AppConfig_h
#define AppConfig_h

#ifdef _APP_DEV_

#define _URL_SCHEME_    @"jfdev"
#endif

#ifdef _APP_TEST_

#define _URL_SCHEME_    @"jftest"
#endif

#ifdef _APP_RC_

#define _URL_SCHEME_    @"jfrc"
#endif

#ifdef _APP_APPSTORE_

#define _URL_SCHEME_    @"jointforce"
#define _URL_HOST_      @"http://localhost"
#endif
#endif /* AppConfig_h */
