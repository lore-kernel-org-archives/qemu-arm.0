Received: by 10.25.87.130 with SMTP id l124csp311573lfb;
        Wed, 7 Sep 2016 06:31:05 -0700 (PDT)
X-Received: by 10.55.169.134 with SMTP id s128mr7712960qke.32.1473255064986;
        Wed, 07 Sep 2016 06:31:04 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s129si25050913qkf.110.2016.09.07.06.31.04
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 07 Sep 2016 06:31:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:41018 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bhcwS-0000Xe-7F
	for alex.bennee@linaro.org; Wed, 07 Sep 2016 09:31:04 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46458)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <digetx@gmail.com>) id 1bhcp5-0001bI-LT
	for qemu-devel@nongnu.org; Wed, 07 Sep 2016 09:23:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <digetx@gmail.com>) id 1bhcp4-0005iE-MG
	for qemu-devel@nongnu.org; Wed, 07 Sep 2016 09:23:27 -0400
Received: from mail-lf0-x242.google.com ([2a00:1450:4010:c07::242]:32847)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <digetx@gmail.com>)
	id 1bhcp4-0005hl-Fw; Wed, 07 Sep 2016 09:23:26 -0400
Received: by mail-lf0-x242.google.com with SMTP id l131so830810lfl.0;
	Wed, 07 Sep 2016 06:23:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=efneMR4rhnsLbyAsS4DP7pkZpJp0fWarxH2A/JyZF9M=;
	b=cxpLuWW7ZTlbEfRYqWXJMkIbYc9MVEIlQFDAvFh8ppizxif5iO94RZb/XQk/q0DIU9
	dPp9dbKH8qQllbFnDC9cJ0skpFl5DDRbyEXN79zwim6MV3PgLExnhKeiwJZoDEfV6AhP
	ssd6HHcnSDTy+2Sps2iCw3RmcQHTMveTQaHKKFmVZAafdJUzQBmWL/RGjE7tpdkZECND
	bAQ3f5l5vapde/nqS4OTKPlB9ptvuvLAEXBkeeej5eD8ljlV115lGZr1d3yJfIJNid4T
	LQoYslKQDw7qbnWxW6zS95oTy4e7/gg+GUQR3rocqNfAfPUphOkogHJMtSAlrMdTp1ha
	/sUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=efneMR4rhnsLbyAsS4DP7pkZpJp0fWarxH2A/JyZF9M=;
	b=J7y1Xgz3NGm3tBXaUM2KOK/LiBI6VvGrXD9DZNRBfZhHfuj7CEsSO89X1jLfSypQy2
	JVCO7KARetecQ0Eajv56SmiP5G7A5fEaTBFz1AhEKgIUlXNwmk3hIso4ugfmiY597Dc1
	Tpn0tKMCrspW5+LwY2DjNxgVh4xKt7zlVX6kvzcjGWGw4D/4tDrk/lmaia7pIr4lh7LO
	onLuMd0A6glqWA4SkxQvS7m+CNcBnZxQfsItOUuA5qymPQZbZV55C42wKGXup/gWNNG7
	sTCnIygfuyeltAcwxr4nUUvowSM5+n0j95cGQBtR3AsuFJAsf7HRlnQ4JPNKr8iEFcxL
	D1wg==
X-Gm-Message-State: AE9vXwOPmhJ3j6wA7fC5Lvxn3/g5BynFGu8FMVE5mQqBkSHjUhn7+jc3GpBRFQXw5wWNDw==
X-Received: by 10.25.81.146 with SMTP id f140mr19154lfb.13.1473254605486;
	Wed, 07 Sep 2016 06:23:25 -0700 (PDT)
Received: from localhost.localdomain (ppp109-252-52-17.pppoe.spdop.ru.
	[109.252.52.17])
	by smtp.gmail.com with ESMTPSA id h29sm11375lfi.18.2016.09.07.06.23.24
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 07 Sep 2016 06:23:24 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: QEMU Developers <qemu-devel@nongnu.org>,
	qemu-arm@nongnu.org
Date: Wed,  7 Sep 2016 16:22:22 +0300
Message-Id: <18ca577ca44d4b4ee8d72a089b1eee90a45b1c8b.1473252818.git.digetx@gmail.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <cover.1473252818.git.digetx@gmail.com>
References: <cover.1473252818.git.digetx@gmail.com>
In-Reply-To: <cover.1473252818.git.digetx@gmail.com>
References: <cover.1473252818.git.digetx@gmail.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:4010:c07::242
Subject: [Qemu-devel] [PATCH v16 11/16] hw/ptimer: Add "no immediate reload"
 policy
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
X-TUID: zOHAYrvfJ2Zp

Immediate counter re-load on setting (or on starting to run with)
counter = 0 is a wrong behaviour for some of the timers. Add "no
immediate reload" policy that provides correct behaviour for such timers.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 hw/core/ptimer.c    | 8 +++++---
 include/hw/ptimer.h | 3 +++
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/hw/core/ptimer.c b/hw/core/ptimer.c
index 018589d..f7f5538 100644
--- a/hw/core/ptimer.c
+++ b/hw/core/ptimer.c
@@ -45,7 +45,7 @@ static void ptimer_reload(ptimer_state *s, int delta_adjust)
         ptimer_trigger(s);
     }
 
-    if (delta == 0) {
+    if (delta == 0 && !(s->policy_mask & PTIMER_POLICY_NO_IMMEDIATE_RELOAD)) {
         delta = s->delta = s->limit;
     }
 
@@ -107,11 +107,13 @@ static void ptimer_tick(void *opaque)
 {
     ptimer_state *s = (ptimer_state *)opaque;
     ptimer_trigger(s);
-    s->delta = 0;
     if (s->enabled == 2) {
+        s->delta = 0;
         s->enabled = 0;
     } else {
-        ptimer_reload(s, 1);
+        int delta_adjust = (s->delta != 0 && s->limit != 0) ? 1 : 0;
+        s->delta = s->limit;
+        ptimer_reload(s, delta_adjust);
     }
 }
 
diff --git a/include/hw/ptimer.h b/include/hw/ptimer.h
index 4b7c53c..131fed1 100644
--- a/include/hw/ptimer.h
+++ b/include/hw/ptimer.h
@@ -46,6 +46,9 @@
  * trigger.  */
 #define PTIMER_POLICY_NO_IMMEDIATE_TRIGGER  (1 << 2)
 
+/* Starting to run with/setting counter = 0 won't re-load counter.  */
+#define PTIMER_POLICY_NO_IMMEDIATE_RELOAD   (1 << 3)
+
 /* ptimer.c */
 typedef struct ptimer_state ptimer_state;
 typedef void (*ptimer_cb)(void *opaque);
-- 
2.9.3

