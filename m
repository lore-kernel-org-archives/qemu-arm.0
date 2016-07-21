Received: by 10.25.21.156 with SMTP id 28csp437094lfv;
        Thu, 21 Jul 2016 07:39:07 -0700 (PDT)
X-Received: by 10.200.54.28 with SMTP id m28mr82347836qtb.87.1469111947175;
        Thu, 21 Jul 2016 07:39:07 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 41si5176105qkq.172.2016.07.21.07.39.06
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 21 Jul 2016 07:39:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:41209 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bQF7y-0008FE-Ez
	for alex.bennee@linaro.org; Thu, 21 Jul 2016 10:39:06 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39856)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <digetx@gmail.com>) id 1bQF1a-00032J-5F
	for qemu-devel@nongnu.org; Thu, 21 Jul 2016 10:32:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <digetx@gmail.com>) id 1bQF1Z-0003kl-3Y
	for qemu-devel@nongnu.org; Thu, 21 Jul 2016 10:32:30 -0400
Received: from mail-lf0-x241.google.com ([2a00:1450:4010:c07::241]:36080)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <digetx@gmail.com>)
	id 1bQF1Y-0003kK-Sg; Thu, 21 Jul 2016 10:32:29 -0400
Received: by mail-lf0-x241.google.com with SMTP id 33so5660710lfw.3;
	Thu, 21 Jul 2016 07:32:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=9ygNI2xroLdsEcg8Ty03eK8ln3q4mUAuapPHXWt6ge0=;
	b=CcSVlzCo9p+C98k0X2psvSNHuWcDhrUnpwzXBa4LZHMg2SHSyYaKpd+qpolOT3hR6F
	NSYoLL0tyJVC1tWj5+bs6bUln2P7BrN0IjJ5F3+oaT1R8XkAtWjEMvKlbYCEhpSJIfR7
	9E4UdL3AV0FxNlauxYmQetT+2pHfrTXOE5b1K02yscyFlmqg5cCaiUSccvarfeF3W7us
	TsXhdSsYwW7WXLrDvbKJgwzauSCHAfVyC9tix2lATkx/Vl7AEKYTBBog1mUr9EI1ICss
	hI/Sg3ukipGU/el0sXnkcaJ9gULSJi5pnyBfrK+g+0uiCZ2i/HTwk97wVsGA3lKH8UIC
	Rvag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=9ygNI2xroLdsEcg8Ty03eK8ln3q4mUAuapPHXWt6ge0=;
	b=RO7iMilp68a3zQrY/ed38Qln0h9Mm2FGn3oBYD7JaO35gHx4Q6fRywEtV3EeoO1trH
	SO5isPvdvQFQZip260bBwjg8y7vvEU9HraAgaQpqpQ1PLu0ZCMoMgle9IA0ddqsCm+E0
	H2iwCIFLPC66Idde5hW9T2QQ4nif5HmYxenhwc0r2nHyYsiQIaqxuwewF8Csyg6PCvM6
	hA7gNq+MypwzJu3AilEl3eezIyKZ2EoqMUZLKh8HqRoLnoj4mH5UAXK9a1zev+QKX0q8
	KIuvbpcUindOWnYPYTwerWfIbqzLeSrxbQscnF+MGZmAo1uXKJj2/yGtYw2iPGl5u1GX
	RWRw==
X-Gm-Message-State: ALyK8tJu5CILdM9SatWEOiTIuuNxWHWEXIlyWUBvYCkjkzIdmfy4iPy16IlmPEq0hqGPQg==
X-Received: by 10.25.35.19 with SMTP id j19mr21662285lfj.106.1469111547897;
	Thu, 21 Jul 2016 07:32:27 -0700 (PDT)
Received: from localhost.localdomain (ppp109-252-52-30.pppoe.spdop.ru.
	[109.252.52.30]) by smtp.gmail.com with ESMTPSA id
	c12sm1887932lfc.40.2016.07.21.07.32.27
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 21 Jul 2016 07:32:27 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: QEMU Developers <qemu-devel@nongnu.org>,
	qemu-arm@nongnu.org
Date: Thu, 21 Jul 2016 17:31:19 +0300
Message-Id: <e26bd83e8044e6d1a613a750b90a34b30c4f2b46.1469110137.git.digetx@gmail.com>
X-Mailer: git-send-email 2.9.2
In-Reply-To: <cover.1469110137.git.digetx@gmail.com>
References: <cover.1469110137.git.digetx@gmail.com>
In-Reply-To: <cover.1469110137.git.digetx@gmail.com>
References: <cover.1469110137.git.digetx@gmail.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:4010:c07::241
Subject: [Qemu-devel] [PATCH v15 08/15] hw/ptimer: Add "continuous trigger"
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
X-TUID: jB6c+GrqIuBB

Currently, periodic timer that has load = delta = 0 performs trigger
on timer reload and stops, printing a "period zero" error message.
Introduce new policy that makes periodic timer to continuously trigger
with a period interval in case of load = 0.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 hw/core/ptimer.c    | 16 +++++++++++++++-
 include/hw/ptimer.h |  3 +++
 2 files changed, 18 insertions(+), 1 deletion(-)

diff --git a/hw/core/ptimer.c b/hw/core/ptimer.c
index c697c08..8578861 100644
--- a/hw/core/ptimer.c
+++ b/hw/core/ptimer.c
@@ -44,7 +44,8 @@ static void ptimer_reload(ptimer_state *s, int delta_adjust)
         ptimer_trigger(s);
         delta = s->delta = s->limit;
     }
-    if (delta == 0 || s->period == 0) {
+
+    if (s->period == 0) {
         fprintf(stderr, "Timer with period zero, disabling\n");
         timer_del(s->timer);
         s->enabled = 0;
@@ -55,6 +56,19 @@ static void ptimer_reload(ptimer_state *s, int delta_adjust)
         delta += delta_adjust;
     }
 
+    if (delta == 0 && (s->policy_mask & PTIMER_POLICY_CONTINUOUS_TRIGGER)) {
+        if (s->enabled == 1) {
+            delta = 1;
+        }
+    }
+
+    if (delta == 0) {
+        fprintf(stderr, "Timer with delta zero, disabling\n");
+        timer_del(s->timer);
+        s->enabled = 0;
+        return;
+    }
+
     /*
      * Artificially limit timeout rate to something
      * achievable under QEMU.  Otherwise, QEMU spends all
diff --git a/include/hw/ptimer.h b/include/hw/ptimer.h
index e8de48d..c97f02e 100644
--- a/include/hw/ptimer.h
+++ b/include/hw/ptimer.h
@@ -16,6 +16,9 @@
 /* Periodic timer counter stays with "0" for a one period before wrapping
  * around.  */
 #define PTIMER_POLICY_WRAP_AFTER_ONE_PERIOD (1 << 0)
+/* Periodic timer that has load = 0 would continuously re-trigger every
+ * period.  */
+#define PTIMER_POLICY_CONTINUOUS_TRIGGER    (1 << 1)
 
 /* ptimer.c */
 typedef struct ptimer_state ptimer_state;
-- 
2.9.2

