Received: by 10.28.91.67 with SMTP id p64csp595827wmb;
        Mon, 12 Mar 2018 03:32:18 -0700 (PDT)
X-Google-Smtp-Source: AG47ELscppyJhFQETw1ndOi2bYm8uoOWgE+QU/jcMyJ8KQ58XxJAL+FNR8xM/2ej+A20IMqz0KVN
X-Received: by 2002:a25:86d2:: with SMTP id y18-v6mr4070328ybm.228.1520850738321;
        Mon, 12 Mar 2018 03:32:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1520850738; cv=none;
        d=google.com; s=arc-20160816;
        b=fdaNLs+ekfyd93XQ9YZb+w4Ewtxz9Q2JYy8Ts+6+BiwlwbKo93RqlOtnsFQ4ugyRkR
         vwjPEJfkHRt78EFz//B3tOE1l4Qsp4vi5OOoY9KLQBzfvIfjAgUS9Um0MX8W1CAphmlG
         ziA/AOToO+Ua41Clqtj5aiRokmL6EWYtDJ0pVDxQQLAbAG8yQusEkpYlTNd4xGbxtSqr
         1/8uRxAHEjetbf2ouqgYN+eQWJNEb3GELDYlCiB10CChQ5Ng4DherT/VHQlrgzdNYWli
         8Jia2yQz0wgC62ZQ+7hoP3DaDqko4M5ts4NnqB+sXaWThb8NTBbKtgxwlI4r3MrNx+GB
         JJKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :arc-authentication-results;
        bh=tt7gkHEWoElewl1DDRTTvgob8bOLLcEJoeLd1vEPY0o=;
        b=P5hK5CTIOS+3qVZD9hJNhvDtW1+xUIAhGq+NIAcKeBDjotFqoBVL2bFiehM7M/K0NK
         UYMCYW4DuUtdmBBmispEjuPWtF03CUqpGam92Tp5z4Fy8kF5UZiPevEoweKWonAjWang
         uhj/yQqDsEFLCMNsefRQOuqwPWR00OJBhOTanPOYBChi/WKVokKDx0sPfcbt6H5FOoKC
         bLs+hhf28ft0Cj5MKwZyOudkc9VWof87JxK/apofZV7MT1zAXk3lZvRwE1ujgnQf7t++
         13tHARyy+JXCVA1tO+z5AT/LxvSNcsou+YRw+ERksUaHSfHZ4y31m3HtIOMfYiH8JC/d
         DyQg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c14-v6si1166202ybg.83.2018.03.12.03.32.18
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 12 Mar 2018 03:32:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:57595 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1evKka-0004Om-Ng
	for alex.bennee@linaro.org; Mon, 12 Mar 2018 06:32:16 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38970)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <abdallah.bouassida@lauterbach.com>)
	id 1evKkI-0004Mh-9e
	for qemu-arm@nongnu.org; Mon, 12 Mar 2018 06:31:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <abdallah.bouassida@lauterbach.com>)
	id 1evKkF-0003aK-5c
	for qemu-arm@nongnu.org; Mon, 12 Mar 2018 06:31:58 -0400
Received: from smtp1.lauterbach.com ([62.154.241.196]:43714)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <abdallah.bouassida@lauterbach.com>)
	id 1evKkE-00032u-Rl
	for qemu-arm@nongnu.org; Mon, 12 Mar 2018 06:31:55 -0400
Received: (qmail 13343 invoked by uid 484); 12 Mar 2018 10:31:36 -0000
X-Qmail-Scanner-Diagnostics: from 41.224.44.126 by smtp1.lauterbach.com
	(envelope-from <abdallah.bouassida@lauterbach.com>,
	uid 484) with qmail-scanner-2.11 
	(mhr: 1.0. clamdscan: 0.99/21437. spamassassin: 3.4.0.  
	Clear:RC:1(41.224.44.126):. 
	Processed in 0.175769 secs); 12 Mar 2018 10:31:36 -0000
Received: from unknown (HELO localhost.localdomain)
	(Authenticated_SSL:abouassida@[41.224.44.126])
	(envelope-sender <abdallah.bouassida@lauterbach.com>)
	by smtp1.lauterbach.com (qmail-ldap-1.03) with ECDHE-RSA-AES256-SHA
	encrypted SMTP
	for <qemu-devel@nongnu.org>; 12 Mar 2018 10:31:36 -0000
From: Abdallah Bouassida <abdallah.bouassida@lauterbach.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Date: Mon, 12 Mar 2018 11:31:26 +0100
Message-Id: <1520850690-23245-1-git-send-email-abdallah.bouassida@lauterbach.com>
X-Mailer: git-send-email 2.7.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 62.154.241.196
Subject: [Qemu-arm] [PATCH v4 0/4] Add a dynamic XML-description of the
 cp-registers to GDB
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: khaled.jmal@lauterbach.com, qemu-arm@nongnu.org,
	Abdallah Bouassida <abdallah.bouassida@lauterbach.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: bjIW4s/ZIflI

The previous version:
http://patchwork.ozlabs.org/project/qemu-devel/list/?series=30973

Abdallah Bouassida (4):
  target/arm: Add "ARM_CP_NO_GDB" as a new bit field for ARMCPRegInfo
    type
  target/arm: Add "_S" suffix to the secure version of a sysreg
  target/arm: Add the XML dynamic generation
  target/arm: Add arm_gdb_set_sysreg() callback

 gdbstub.c            | 10 ++++++++
 include/qom/cpu.h    |  5 +++-
 target/arm/cpu.c     |  1 +
 target/arm/cpu.h     | 20 ++++++++++++++-
 target/arm/gdbstub.c | 71 +++++++++++++++++++++++++++++++++++++++++++++++++++
 target/arm/helper.c  | 72 +++++++++++++++++++++++++++++++++++++++++++---------
 6 files changed, 165 insertions(+), 14 deletions(-)

-- 
2.7.4

