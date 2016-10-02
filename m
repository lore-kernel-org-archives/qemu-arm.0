Received: by 10.80.163.71 with SMTP id 65csp1175860edn;
        Sun, 2 Oct 2016 09:21:55 -0700 (PDT)
X-Received: by 10.55.6.197 with SMTP id 188mr9363002qkg.133.1475425315540;
        Sun, 02 Oct 2016 09:21:55 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g23si18468911qte.114.2016.10.02.09.21.55
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 02 Oct 2016 09:21:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:60068 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bqjWU-0002bA-Sw
	for alex.bennee@linaro.org; Sun, 02 Oct 2016 12:21:54 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58090)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <digetx@gmail.com>) id 1bqjC7-0002jC-Hu
	for qemu-arm@nongnu.org; Sun, 02 Oct 2016 12:00:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <digetx@gmail.com>) id 1bqjC5-0003Ma-Ix
	for qemu-arm@nongnu.org; Sun, 02 Oct 2016 12:00:50 -0400
Received: from mail-lf0-x244.google.com ([2a00:1450:4010:c07::244]:35784)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <digetx@gmail.com>)
	id 1bqjC2-0003J6-7T; Sun, 02 Oct 2016 12:00:46 -0400
Received: by mail-lf0-x244.google.com with SMTP id s64so7954939lfs.2;
	Sun, 02 Oct 2016 09:00:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=3pehwTlOe0n70CfQAjC/Vzsvzay8PCWbwC58SgDqBT4=;
	b=a5WbeWXdo13zpRy11WnJ651cuci2JXdhuXczsXG4fMqsPDO+U2p4EXSEiFYLNjqpAu
	f0GJ8Jf94g/Zy079yzy5Er7h1aIZtQ4CHt/05rLuuteqzORfZ4oYNsLB32GKPk6U23mG
	G+CrqXW2RFof9nVkDApSsCia7KE3GNyVMk993iKasP5w9+IBI+Gdi3R0wHKMYuEqbDDI
	KCxXOpIzp0sl5yav6msOB6y7o6WcpMXR28bS5OsTrDSCJ9OofxscM6amlQPJZ77VbOZw
	SP0BxSl4CMyomugOao3w27nFKZwdEJZ39Bd2TuK2m0iyoocgaEM7Dv3Gq0EbbwX99pR9
	oYCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=3pehwTlOe0n70CfQAjC/Vzsvzay8PCWbwC58SgDqBT4=;
	b=mAHkTlwOmkrecVxSX0ixOYGi9qcqi7qQbBdcapB4fKkJGG/O9PSdVFjqs0IWU7wHcO
	x8byxUx0sBmDTdc2NDpfXQgisxwWe2x706F5xK6cDi7mFzGMljU+h+fQ3KLYQedg6PMT
	tmeTbIxyS2YV0fQk4IkUK4nsFVfRRyN4ulC08Nb8+RGtrrm5BrrCSFQvH8/E99Kvfcgo
	wof4n4EGslgKp20SF4tvl7erszsb8Dvv9AF9x6dCH8YkRS8G/RiZvme4JHdmuCKJq9W5
	Zb+EfSYPHWIIzqRq2XtrTAEbYrpHwBOV/6pVyBROZarzHbO6HfCRXiN2O8GAgCp0Eiry
	X62Q==
X-Gm-Message-State: AA6/9RkNBATbEoGDmBWFxE8EOsuic80JwvSFBBRunzRwQgGW+m8MY5p4RFKgoRw6y2AQEQ==
X-Received: by 10.46.9.131 with SMTP id 125mr6289092ljj.6.1475424014315;
	Sun, 02 Oct 2016 09:00:14 -0700 (PDT)
Received: from localhost.localdomain (ppp109-252-52-17.pppoe.spdop.ru.
	[109.252.52.17]) by smtp.gmail.com with ESMTPSA id
	o84sm4864679lfi.34.2016.10.02.09.00.13
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 02 Oct 2016 09:00:13 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: QEMU Developers <qemu-devel@nongnu.org>,
	qemu-arm@nongnu.org
Date: Sun,  2 Oct 2016 18:53:39 +0300
Message-Id: <bf9385cd2550ca451d564fa46007688cee3f3d9d.1475421224.git.digetx@gmail.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <cover.1475421224.git.digetx@gmail.com>
References: <cover.1475421224.git.digetx@gmail.com>
In-Reply-To: <cover.1475421224.git.digetx@gmail.com>
References: <cover.1475421224.git.digetx@gmail.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:4010:c07::244
Subject: [Qemu-arm] [PATCH v17 07/14] hw/ptimer: Add "no immediate reload"
 policy
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Peter Crosthwaite <crosthwaitepeter@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: UXQaC5suJGdR

Immediate counter re-load on setting (or on starting to run with)
counter = 0 is a wrong behaviour for some of the timers. Add "no
immediate reload" policy that provides correct behaviour for such timers.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 hw/core/ptimer.c    | 31 ++++++++++++++++++++++++++-----
 include/hw/ptimer.h |  4 ++++
 2 files changed, 30 insertions(+), 5 deletions(-)

diff --git a/hw/core/ptimer.c b/hw/core/ptimer.c
index ed3fb6c..2a69daf 100644
--- a/hw/core/ptimer.c
+++ b/hw/core/ptimer.c
@@ -48,7 +48,7 @@ static void ptimer_reload(ptimer_state *s, int delta_adjust)
         ptimer_trigger(s);
     }
 
-    if (delta == 0) {
+    if (delta == 0 && !(s->policy_mask & PTIMER_POLICY_NO_IMMEDIATE_RELOAD)) {
         delta = s->delta = s->limit;
     }
 
@@ -79,6 +79,12 @@ static void ptimer_reload(ptimer_state *s, int delta_adjust)
         }
     }
 
+    if (delta == 0 && (s->policy_mask & PTIMER_POLICY_NO_IMMEDIATE_RELOAD)) {
+        if (s->enabled == 1 && s->limit != 0) {
+            delta = 1;
+        }
+    }
+
     if (delta == 0) {
         if (!qtest_enabled()) {
             fprintf(stderr, "Timer with delta zero, disabling\n");
@@ -113,21 +119,36 @@ static void ptimer_reload(ptimer_state *s, int delta_adjust)
 static void ptimer_tick(void *opaque)
 {
     ptimer_state *s = (ptimer_state *)opaque;
-    ptimer_trigger(s);
-    s->delta = 0;
+    bool trigger = true;
+
     if (s->enabled == 2) {
+        s->delta = 0;
         s->enabled = 0;
     } else {
         int delta_adjust = DELTA_ADJUST;
 
-        if (s->limit == 0) {
+        if (s->delta == 0 || s->limit == 0) {
             /* If a "continuous trigger" policy is not used and limit == 0,
-               we should error out.  */
+               we should error out. delta == 0 means that this tick is
+               caused by a "no immediate reload" policy, so it shouldn't
+               be adjusted.  */
             delta_adjust = DELTA_NO_ADJUST;
         }
 
+        if (!(s->policy_mask & PTIMER_POLICY_NO_IMMEDIATE_TRIGGER)) {
+            /* Avoid re-trigger on deferred reload if "no immediate trigger"
+               policy isn't used.  */
+            trigger = (delta_adjust == DELTA_ADJUST);
+        }
+
+        s->delta = s->limit;
+
         ptimer_reload(s, delta_adjust);
     }
+
+    if (trigger) {
+        ptimer_trigger(s);
+    }
 }
 
 uint64_t ptimer_get_count(ptimer_state *s)
diff --git a/include/hw/ptimer.h b/include/hw/ptimer.h
index 911cc11..5455340 100644
--- a/include/hw/ptimer.h
+++ b/include/hw/ptimer.h
@@ -47,6 +47,10 @@
  * but after a one period for both oneshot and periodic modes.  */
 #define PTIMER_POLICY_NO_IMMEDIATE_TRIGGER  (1 << 2)
 
+/* Starting to run with/setting counter to "0" won't re-load counter
+ * immediately, but after a one period.  */
+#define PTIMER_POLICY_NO_IMMEDIATE_RELOAD   (1 << 3)
+
 /* ptimer.c */
 typedef struct ptimer_state ptimer_state;
 typedef void (*ptimer_cb)(void *opaque);
-- 
2.9.3

