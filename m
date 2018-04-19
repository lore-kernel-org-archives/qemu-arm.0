Received: by 10.28.4.212 with SMTP id 203csp813006wme;
        Thu, 19 Apr 2018 08:56:30 -0700 (PDT)
X-Google-Smtp-Source: AIpwx49K3nlTX1cwTeTsOr7NUGpmrrMxSnBJ/hnuGQQEJAQmbtqGfdQcre46RgaxFiDfHG8QQOGA
X-Received: by 10.28.17.142 with SMTP id 136mr4738812wmr.38.1524153390525;
        Thu, 19 Apr 2018 08:56:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1524153390; cv=none;
        d=google.com; s=arc-20160816;
        b=Rxwk9Dr5gV+BlPR7cmeAW2ctRbkokkvCXnqhgaXB72Rbyezj81/egjQ+Gl5Q7RslgQ
         T0pwvwi3I0/4yg+DV3KR+bvQap+M3tL8y2UpNtmPGIhlVeTivmByV1pBQngIUjCQdvDV
         a/iqTM5vY4ivlJTJiOgE+923m/v6Q1TVfBlWDr9PFo0rrJ4/BlAlvKXchKM/EpBu0IF7
         KgVWEygTtn7snEQwXxYQd2Y5Gwh0tQq3+aJY2Bs49shpC2nNqZy87E9Zm6CHCTAFsmP3
         MMAhqxzSB6YEGiSnT1pGoA9FN038LFffyZg455GgEyJHfUBdMd+EEmaV1bBG9X1sb2eO
         dgjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=message-id:date:subject:cc:to:from:arc-authentication-results;
        bh=nDnRBQTCL/EKZeVTRtt2YSIH9IqlAC0RB4lBnXQJwFk=;
        b=MZZ1Gfbl89t9bsG8qbI4SwEJ5sD8kr2Ic1ZODWlBp6rcGEEYVK7S1LDALfXAontC58
         6cfvbAw1ULoILc/vjqTrxzt72nYPuNOjfcV2qtm/lklow+z9h5Eayih9XJYy4eVQJXsC
         XtHDfDdkupBlW6z6lfqBSQ+QoKDOPt3ueoicmKZTq4ANlExUP4CmE5VxtLWcgi+4PGYp
         rbdc9v9AkGMZK1TLjeV9NCHwwlVFb5L6ynZYRFnD+6ceInk5LUl4uCf4gBUYaHJVH6Rd
         cAtlOqlFKEAQPXqj0QTAEHvG+wHSxDJmMdf1NiGCF/jYBnRlfDOGgdCswrVNndsYv3o3
         Htag==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of abdallah.bouassida@lauterbach.com designates 62.154.241.196 as permitted sender) smtp.mailfrom=abdallah.bouassida@lauterbach.com
Return-Path: <abdallah.bouassida@lauterbach.com>
Received: from smtp1.lauterbach.com (smtp1.lauterbach.com. [62.154.241.196])
        by mx.google.com with ESMTPS id x42-v6si3095274wrb.411.2018.04.19.08.56.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 19 Apr 2018 08:56:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of abdallah.bouassida@lauterbach.com designates 62.154.241.196 as permitted sender) client-ip=62.154.241.196;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of abdallah.bouassida@lauterbach.com designates 62.154.241.196 as permitted sender) smtp.mailfrom=abdallah.bouassida@lauterbach.com
Received: (qmail 22652 invoked by uid 484); 19 Apr 2018 15:56:29 -0000
X-Qmail-Scanner-Diagnostics: from 41.224.44.126 by smtp1.lauterbach.com (envelope-from <abdallah.bouassida@lauterbach.com>, uid 484) with qmail-scanner-2.11 
 (mhr: 1.0. clamdscan: 0.99/21437. spamassassin: 3.4.0.  
 Clear:RC:1(41.224.44.126):. 
 Processed in 0.177506 secs); 19 Apr 2018 15:56:29 -0000
Received: from unknown (HELO abo-VirtualBox.8.8.4.4) (Authenticated_SSL:abouassida@[41.224.44.126])
          (envelope-sender <abdallah.bouassida@lauterbach.com>)
          by smtp1.lauterbach.com (qmail-ldap-1.03) with ECDHE-RSA-AES256-SHA encrypted SMTP
          for <qemu-devel@nongnu.org>; 19 Apr 2018 15:56:29 -0000
From: Abdallah Bouassida <abdallah.bouassida@lauterbach.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org,
	alex.bennee@linaro.org
Cc: qemu-arm@nongnu.org,
	khaled.jmal@lauterbach.com,
	Abdallah Bouassida <abdallah.bouassida@lauterbach.com>
Subject: [PATCH v6 0/3] target/arm: Add a dynamic XML-description of the cp-registers to GDB
Date: Thu, 19 Apr 2018 16:56:23 +0100
Message-Id: <1524153386-3550-1-git-send-email-abdallah.bouassida@lauterbach.com>
X-Mailer: git-send-email 2.7.4
X-TUID: ZWKC+xxsWq0a

The previous version:
http://patchwork.ozlabs.org/project/qemu-devel/list/?series=33714

Abdallah Bouassida (3):
  target/arm: Add "ARM_CP_NO_GDB" as a new bit field for ARMCPRegInfo
    type
  target/arm: Add "_S" suffix to the secure version of a sysreg
  target/arm: Add the XML dynamic generation

 gdbstub.c            | 10 +++++++
 include/qom/cpu.h    |  5 +++-
 target/arm/cpu.c     |  1 +
 target/arm/cpu.h     | 29 +++++++++++++++++++-
 target/arm/gdbstub.c | 76 ++++++++++++++++++++++++++++++++++++++++++++++++++++
 target/arm/helper.c  | 57 ++++++++++++++++++++++++++++++---------
 6 files changed, 164 insertions(+), 14 deletions(-)

-- 
2.7.4
