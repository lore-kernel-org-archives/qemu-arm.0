Received: by 10.80.163.71 with SMTP id 65csp1172801edn;
        Sun, 2 Oct 2016 09:12:46 -0700 (PDT)
X-Received: by 10.55.192.130 with SMTP id v2mr15235515qkv.162.1475424766523;
        Sun, 02 Oct 2016 09:12:46 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c186si9224275qkf.208.2016.10.02.09.12.46
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 02 Oct 2016 09:12:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:60016 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bqjNd-0003jN-Sh
	for alex.bennee@linaro.org; Sun, 02 Oct 2016 12:12:45 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57950)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <digetx@gmail.com>) id 1bqjC2-0002fB-9G
	for qemu-devel@nongnu.org; Sun, 02 Oct 2016 12:00:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <digetx@gmail.com>) id 1bqjC1-0003IT-2D
	for qemu-devel@nongnu.org; Sun, 02 Oct 2016 12:00:46 -0400
Received: from mail-lf0-x242.google.com ([2a00:1450:4010:c07::242]:34360)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <digetx@gmail.com>)
	id 1bqjC0-0003IA-OO; Sun, 02 Oct 2016 12:00:44 -0400
Received: by mail-lf0-x242.google.com with SMTP id p80so146945lfp.1;
	Sun, 02 Oct 2016 09:00:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=6iCf7q4/5Tl/+vuygZeosQyTvlPAlOqY1NPy01GRczY=;
	b=V7mkeQwNW6/hl4diZQECh7wTXKDUxrR9Ixj2k+Mcxcwbb53LtklTOfXpHUCiOMWa3y
	OCdrrIrQ5uqZBKXksthvZHlw2TuK2k60Nc8GhxSz6qUVMwTQ7HXYaBViWyRfz1gHKwV9
	onM40J+KSoyQ741iGFmej1/nFlktzCRPYNdjIbelehoqvmyo1lPWcAT5/N3p+VOuYnsM
	5HzSt3mbXDMKFZPC9zK5O4Mou1PELKkjNN85dweSCwDNfVphgzrenzVkdfWe4K/v9mDe
	5QiGLip91q1pNYB5c9onnRA8Cgt3uKldVL05C4eva0h6PPXSVGGviIR8gw2bWrghqQk9
	OxXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=6iCf7q4/5Tl/+vuygZeosQyTvlPAlOqY1NPy01GRczY=;
	b=Ze1+Y1iHK6p/2p42bJy8SS+XRrHV1JJJEaZPL1Qi74gqe0VocB4jGWqnFgFIAYMwH0
	K+/belt1sezzi11RQvajkswmlO04oh2J0vFALl7djv1ryVZ9Q+/DyslnVb8Lj1izKVhI
	qwdSmwjVSnVUNr25IlwilVsXzO8hZaGCfca4bYx3ks5yj4e9vHV/Aw1NOCEVe+p25iVE
	92xMxxL2Yt15eVjRgSmjP8erV1BSsnzBEk3GWMZ5IALYv5X/YQbJr/7BaPLA7TlorW4u
	LIqxaIotNb55kkxnGPrSCNsS1Skp2ZQh1wvBEwr1daR5uYPt6e5hivNDgC9J8MoymEI+
	eJIg==
X-Gm-Message-State: AA6/9Rm4UW4OI5ftoTnYkzpFWLJrPTlCPfKKcJ1yFMXTR3khDesbxNrrUOg5AtCkcMTulQ==
X-Received: by 10.25.157.67 with SMTP id g64mr6293798lfe.137.1475424012821;
	Sun, 02 Oct 2016 09:00:12 -0700 (PDT)
Received: from localhost.localdomain (ppp109-252-52-17.pppoe.spdop.ru.
	[109.252.52.17]) by smtp.gmail.com with ESMTPSA id
	o84sm4864679lfi.34.2016.10.02.09.00.11
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 02 Oct 2016 09:00:12 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: QEMU Developers <qemu-devel@nongnu.org>,
	qemu-arm@nongnu.org
Date: Sun,  2 Oct 2016 18:53:37 +0300
Message-Id: <72c0319cf2ec599f22397b7da280c06c34dc40dd.1475421224.git.digetx@gmail.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <cover.1475421224.git.digetx@gmail.com>
References: <cover.1475421224.git.digetx@gmail.com>
In-Reply-To: <cover.1475421224.git.digetx@gmail.com>
References: <cover.1475421224.git.digetx@gmail.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:4010:c07::242
Subject: [Qemu-devel] [PATCH v17 05/14] hw/ptimer: Add "no immediate
 trigger" policy
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
X-TUID: qtYPT4dLZK7q

Performing trigger on setting (or starting to run with) counter = 0 could
be a wrong behaviour for some of the timers, provide "no immediate trigger"
policy to maintain correct behaviour for such timers.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 hw/core/ptimer.c    | 20 ++++++++++++++++----
 include/hw/ptimer.h |  4 ++++
 2 files changed, 20 insertions(+), 4 deletions(-)

diff --git a/hw/core/ptimer.c b/hw/core/ptimer.c
index 1aa0194..ed3fb6c 100644
--- a/hw/core/ptimer.c
+++ b/hw/core/ptimer.c
@@ -13,7 +13,8 @@
 #include "sysemu/replay.h"
 #include "sysemu/qtest.h"
 
-#define DELTA_ADJUST    1
+#define DELTA_ADJUST     1
+#define DELTA_NO_ADJUST -1
 
 struct ptimer_state
 {
@@ -43,8 +44,11 @@ static void ptimer_reload(ptimer_state *s, int delta_adjust)
     uint64_t period = s->period;
     uint64_t delta = s->delta;
 
-    if (delta == 0) {
+    if (delta == 0 && !(s->policy_mask & PTIMER_POLICY_NO_IMMEDIATE_TRIGGER)) {
         ptimer_trigger(s);
+    }
+
+    if (delta == 0) {
         delta = s->delta = s->limit;
     }
 
@@ -58,7 +62,9 @@ static void ptimer_reload(ptimer_state *s, int delta_adjust)
     }
 
     if (s->policy_mask & PTIMER_POLICY_WRAP_AFTER_ONE_PERIOD) {
-        delta += delta_adjust;
+        if (delta_adjust != DELTA_NO_ADJUST) {
+            delta += delta_adjust;
+        }
     }
 
     if (delta == 0 && (s->policy_mask & PTIMER_POLICY_CONTINUOUS_TRIGGER)) {
@@ -67,6 +73,12 @@ static void ptimer_reload(ptimer_state *s, int delta_adjust)
         }
     }
 
+    if (delta == 0 && (s->policy_mask & PTIMER_POLICY_NO_IMMEDIATE_TRIGGER)) {
+        if (delta_adjust != DELTA_NO_ADJUST) {
+            delta = 1;
+        }
+    }
+
     if (delta == 0) {
         if (!qtest_enabled()) {
             fprintf(stderr, "Timer with delta zero, disabling\n");
@@ -111,7 +123,7 @@ static void ptimer_tick(void *opaque)
         if (s->limit == 0) {
             /* If a "continuous trigger" policy is not used and limit == 0,
                we should error out.  */
-            delta_adjust = 0;
+            delta_adjust = DELTA_NO_ADJUST;
         }
 
         ptimer_reload(s, delta_adjust);
diff --git a/include/hw/ptimer.h b/include/hw/ptimer.h
index b2fb4f9..911cc11 100644
--- a/include/hw/ptimer.h
+++ b/include/hw/ptimer.h
@@ -43,6 +43,10 @@
  * re-trigger every period.  */
 #define PTIMER_POLICY_CONTINUOUS_TRIGGER    (1 << 1)
 
+/* Starting to run with/setting counter to "0" won't trigger immediately,
+ * but after a one period for both oneshot and periodic modes.  */
+#define PTIMER_POLICY_NO_IMMEDIATE_TRIGGER  (1 << 2)
+
 /* ptimer.c */
 typedef struct ptimer_state ptimer_state;
 typedef void (*ptimer_cb)(void *opaque);
-- 
2.9.3

