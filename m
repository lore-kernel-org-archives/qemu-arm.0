Received: by 10.80.163.71 with SMTP id 65csp1171563edn;
        Sun, 2 Oct 2016 09:09:07 -0700 (PDT)
X-Received: by 10.200.53.82 with SMTP id z18mr2706160qtb.82.1475424547470;
        Sun, 02 Oct 2016 09:09:07 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x32si18476450qtd.35.2016.10.02.09.09.07
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 02 Oct 2016 09:09:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:59992 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bqjK6-0000Vf-PA
	for alex.bennee@linaro.org; Sun, 02 Oct 2016 12:09:06 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57949)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <digetx@gmail.com>) id 1bqjC2-0002f9-8f
	for qemu-devel@nongnu.org; Sun, 02 Oct 2016 12:00:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <digetx@gmail.com>) id 1bqjBz-0003Hm-L1
	for qemu-devel@nongnu.org; Sun, 02 Oct 2016 12:00:46 -0400
Received: from mail-lf0-x241.google.com ([2a00:1450:4010:c07::241]:33263)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <digetx@gmail.com>)
	id 1bqjBz-0003H6-66; Sun, 02 Oct 2016 12:00:43 -0400
Received: by mail-lf0-x241.google.com with SMTP id l131so7946132lfl.0;
	Sun, 02 Oct 2016 09:00:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=CnG2NcT32VWre/5LKfN4/dgVbWhB4WIQiXbecTlwedY=;
	b=ltEyDyRKF8iwz4oFHhvTJ3EwDWDCNRxbkEvofAIqdBtNQGxZkVMMlmxciRITAep+x7
	tvTxgSDaTX70I+gbIGy8CvGR0nZJ9eCz8KTVAILivuRG4XBIrer1dJ0bFSItkLdNhF6w
	CMDbnl1t5Dtu8qiJkRfycVaUu8Alvbjw00IlTJfUWajVUzEdX46HP5h6cmrRpOCtEmdl
	fbprQaKqtzjViJcdPbOkZxXig1FtnMeNR1vFUfzKdCzdg/TtoobOvj01DIXHpKWhDGy/
	uXoy9S0QKW8mPJ7X0eNQPw+E37jEfYiEnHUZSFCEjFKGZjDvQE3aIvDFJrirV//miBHh
	acNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=CnG2NcT32VWre/5LKfN4/dgVbWhB4WIQiXbecTlwedY=;
	b=UgBvnqei4inumiFXZa9ktkBU4XSASDdf8mvXPSeVN1vtVPP5Ygj/zdSZzGPSbFZtcI
	oQWSagx3GwH8/F4jOhyw5q3NeUOcnGjDisbpLOIdPPdvkuHhCPDKfwaLoHyrs9azOH3R
	X/UWr/PC8QcY1dgoqdjdsxgNbLprPi8zFkcm7N0169lcx7GJw2qKfTlqEwiZzjQ8C0Yb
	xnMgAcWzZ28UVsVvoMzPtcmtADH12ik013QGsA3M/0ejstcl0N5mxNc8vmcsu9EHVxJK
	NEMWBH5A0aJTj06/OQXBrYg7xZjtDjd5Jx8m+01UIxeullCJuGg2oS9E55/5Ng4kxurB
	pWmQ==
X-Gm-Message-State: AA6/9RlfBxgsL8YA5EWQvdlA9SVVohcYI0u7sEXMgOSxgu6G2wEDW0QwiT+RgQ/u6rGsSw==
X-Received: by 10.25.139.66 with SMTP id n63mr6897075lfd.111.1475424011197;
	Sun, 02 Oct 2016 09:00:11 -0700 (PDT)
Received: from localhost.localdomain (ppp109-252-52-17.pppoe.spdop.ru.
	[109.252.52.17]) by smtp.gmail.com with ESMTPSA id
	o84sm4864679lfi.34.2016.10.02.09.00.10
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 02 Oct 2016 09:00:10 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: QEMU Developers <qemu-devel@nongnu.org>,
	qemu-arm@nongnu.org
Date: Sun,  2 Oct 2016 18:53:35 +0300
Message-Id: <632b23dd11055d9bd5e338d66b38fac0bd51462e.1475421224.git.digetx@gmail.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <cover.1475421224.git.digetx@gmail.com>
References: <cover.1475421224.git.digetx@gmail.com>
In-Reply-To: <cover.1475421224.git.digetx@gmail.com>
References: <cover.1475421224.git.digetx@gmail.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:4010:c07::241
Subject: [Qemu-devel] [PATCH v17 03/14] hw/ptimer: Add "continuous trigger"
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
X-TUID: rup94jLZQS+3

Currently, periodic timer that has load = delta = 0 performs trigger
on timer reload and stops, printing a "period zero" error message.
Introduce new policy that makes periodic timer to continuously trigger
with a period interval in case of load = 0.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 hw/core/ptimer.c    | 30 +++++++++++++++++++++++++++---
 include/hw/ptimer.h |  4 ++++
 2 files changed, 31 insertions(+), 3 deletions(-)

diff --git a/hw/core/ptimer.c b/hw/core/ptimer.c
index 1f4122d..1aa0194 100644
--- a/hw/core/ptimer.c
+++ b/hw/core/ptimer.c
@@ -47,7 +47,8 @@ static void ptimer_reload(ptimer_state *s, int delta_adjust)
         ptimer_trigger(s);
         delta = s->delta = s->limit;
     }
-    if (delta == 0 || s->period == 0) {
+
+    if (s->period == 0) {
         if (!qtest_enabled()) {
             fprintf(stderr, "Timer with period zero, disabling\n");
         }
@@ -60,6 +61,21 @@ static void ptimer_reload(ptimer_state *s, int delta_adjust)
         delta += delta_adjust;
     }
 
+    if (delta == 0 && (s->policy_mask & PTIMER_POLICY_CONTINUOUS_TRIGGER)) {
+        if (s->enabled == 1 && s->limit == 0) {
+            delta = 1;
+        }
+    }
+
+    if (delta == 0) {
+        if (!qtest_enabled()) {
+            fprintf(stderr, "Timer with delta zero, disabling\n");
+        }
+        timer_del(s->timer);
+        s->enabled = 0;
+        return;
+    }
+
     /*
      * Artificially limit timeout rate to something
      * achievable under QEMU.  Otherwise, QEMU spends all
@@ -90,7 +106,15 @@ static void ptimer_tick(void *opaque)
     if (s->enabled == 2) {
         s->enabled = 0;
     } else {
-        ptimer_reload(s, DELTA_ADJUST);
+        int delta_adjust = DELTA_ADJUST;
+
+        if (s->limit == 0) {
+            /* If a "continuous trigger" policy is not used and limit == 0,
+               we should error out.  */
+            delta_adjust = 0;
+        }
+
+        ptimer_reload(s, delta_adjust);
     }
 }
 
@@ -98,7 +122,7 @@ uint64_t ptimer_get_count(ptimer_state *s)
 {
     uint64_t counter;
 
-    if (s->enabled) {
+    if (s->enabled && s->delta != 0) {
         int64_t now = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
         int64_t next = s->next_event;
         int64_t last = s->last_event;
diff --git a/include/hw/ptimer.h b/include/hw/ptimer.h
index 03441cb..b2fb4f9 100644
--- a/include/hw/ptimer.h
+++ b/include/hw/ptimer.h
@@ -39,6 +39,10 @@
  * around.  */
 #define PTIMER_POLICY_WRAP_AFTER_ONE_PERIOD (1 << 0)
 
+/* Running periodic timer that has counter = limit = 0 would continuously
+ * re-trigger every period.  */
+#define PTIMER_POLICY_CONTINUOUS_TRIGGER    (1 << 1)
+
 /* ptimer.c */
 typedef struct ptimer_state ptimer_state;
 typedef void (*ptimer_cb)(void *opaque);
-- 
2.9.3

