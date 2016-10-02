Received: by 10.80.163.71 with SMTP id 65csp1172623edn;
        Sun, 2 Oct 2016 09:12:12 -0700 (PDT)
X-Received: by 10.200.40.244 with SMTP id j49mr16562966qtj.43.1475424732182;
        Sun, 02 Oct 2016 09:12:12 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 126si18415324qkd.320.2016.10.02.09.12.12
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 02 Oct 2016 09:12:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:60009 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bqjN5-00039K-Id
	for alex.bennee@linaro.org; Sun, 02 Oct 2016 12:12:11 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58072)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <digetx@gmail.com>) id 1bqjC6-0002iS-N0
	for qemu-devel@nongnu.org; Sun, 02 Oct 2016 12:00:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <digetx@gmail.com>) id 1bqjC4-0003LU-9v
	for qemu-devel@nongnu.org; Sun, 02 Oct 2016 12:00:49 -0400
Received: from mail-lf0-x242.google.com ([2a00:1450:4010:c07::242]:36684)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <digetx@gmail.com>)
	id 1bqjC3-0003KI-SZ; Sun, 02 Oct 2016 12:00:48 -0400
Received: by mail-lf0-x242.google.com with SMTP id b75so429247lfg.3;
	Sun, 02 Oct 2016 09:00:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=qQ4EnurbmMZ5Ockl+4iG4WfWOj2tPLIFocLrU1+8g/E=;
	b=trfoIWbIHoN5x/oql2OtOcqs0H5jSFnFGEZ7M55Qbr7x/pJPnDYOUGWiIDQbx0mDVT
	rtQp2DJzc/2dCqYUWCDUKTagJbYPpoH8eZkElLVzQEfrmTW5GNeAQtqc2GLbtbjefNqD
	XpThWYsWU7rhQ/PbNWkSEU264AZmSO/I87FIFH1JUPMoPUbMHx89pUxsrCRRSYSs3PfS
	KvI+5th7nd860xgJkvwz5CnZ2o6mBYkBbZkPCqF7Fv0oMbQ3BQgBxkNbdXxG/VbOlAyw
	99B25xHveQJVupp7u8B6Gn8YekPN1HHQ09uhjr5wwAqQgAFsyWBt3tIGPVpdq/inwfug
	dkTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=qQ4EnurbmMZ5Ockl+4iG4WfWOj2tPLIFocLrU1+8g/E=;
	b=MNTBwIMDrWIfj2+e9tz/kjfGh0sBg6j5g6OwKA1HNi3JINBf6T2ftrfEzUNX7QynzM
	SmElmXS+LvO5BwcJvE1yUOCdNFFlQPIoOf9S1swK/xY0/f5FhhbDx3muRJF62kZcnT6E
	0NAUS43McBAThvj1h7i0h+8sssaDv7KK7uyscL6C93A4gjmukSY9eiT4Z6+wWO7Tfn9t
	4FyCq1aRa7SaILK8cA8FFcVpUnLJ+CcfPPVZSjOIzw/3SWHgO4Hp0Y6r/+3AFZh2ymLV
	t3Fcm2kaMVFI2HRg9ucsnTYCH1TT8j7apjhuJsbc9vUyo0tYZelJBI5yH7rTBUMKpqGj
	z29A==
X-Gm-Message-State: AA6/9Rk+htd6Q5RzFbKAjA2SrZK9DTKAAnTJwA8/PnSxfpJSgzWMV5IEe/0UoqCax6cinA==
X-Received: by 10.46.33.76 with SMTP id h73mr6265247ljh.37.1475424015743;
	Sun, 02 Oct 2016 09:00:15 -0700 (PDT)
Received: from localhost.localdomain (ppp109-252-52-17.pppoe.spdop.ru.
	[109.252.52.17]) by smtp.gmail.com with ESMTPSA id
	o84sm4864679lfi.34.2016.10.02.09.00.15
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 02 Oct 2016 09:00:15 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: QEMU Developers <qemu-devel@nongnu.org>,
	qemu-arm@nongnu.org
Date: Sun,  2 Oct 2016 18:53:41 +0300
Message-Id: <ef39622d0ebfdc32a0877e59ffdf6910dc3db688.1475421224.git.digetx@gmail.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <cover.1475421224.git.digetx@gmail.com>
References: <cover.1475421224.git.digetx@gmail.com>
In-Reply-To: <cover.1475421224.git.digetx@gmail.com>
References: <cover.1475421224.git.digetx@gmail.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:4010:c07::242
Subject: [Qemu-devel] [PATCH v17 09/14] hw/ptimer: Add "no counter round
 down" policy
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Peter Crosthwaite <crosthwaitepeter@gmail.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 32WsFiOHtQH5

For most of the timers counter starts to decrement after first period
expires. Due to rounding down performed by the ptimer_get_count, it returns
counter - 1 for the running timer, so that for the ptimer user it looks
like counter gets decremented immediately after running the timer. Add "no
counter round down" policy that provides correct behaviour for those timers.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 hw/core/ptimer.c    | 9 +++++++++
 include/hw/ptimer.h | 4 ++++
 2 files changed, 13 insertions(+)

diff --git a/hw/core/ptimer.c b/hw/core/ptimer.c
index 2a69daf..3af82af 100644
--- a/hw/core/ptimer.c
+++ b/hw/core/ptimer.c
@@ -231,6 +231,15 @@ uint64_t ptimer_get_count(ptimer_state *s)
                 }
             }
         }
+
+        if (s->policy_mask & PTIMER_POLICY_NO_COUNTER_ROUND_DOWN) {
+            /* If now == last then delta == limit, i.e. the counter already
+               represents the correct value. It would be rounded down a 1ns
+               later.  */
+            if (now != last) {
+                counter += 1;
+            }
+        }
     } else {
         counter = s->delta;
     }
diff --git a/include/hw/ptimer.h b/include/hw/ptimer.h
index 5455340..48cccbd 100644
--- a/include/hw/ptimer.h
+++ b/include/hw/ptimer.h
@@ -51,6 +51,10 @@
  * immediately, but after a one period.  */
 #define PTIMER_POLICY_NO_IMMEDIATE_RELOAD   (1 << 3)
 
+/* Make counter value of the running timer represent the actual value and
+ * not the one less.  */
+#define PTIMER_POLICY_NO_COUNTER_ROUND_DOWN (1 << 4)
+
 /* ptimer.c */
 typedef struct ptimer_state ptimer_state;
 typedef void (*ptimer_cb)(void *opaque);
-- 
2.9.3

