Received: by 10.182.158.201 with SMTP id ww9csp3414066obb;
        Wed, 2 Dec 2015 16:23:42 -0800 (PST)
X-Received: by 10.140.176.143 with SMTP id w137mr7198137qhw.20.1449102222554;
        Wed, 02 Dec 2015 16:23:42 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b71si1978815qkj.108.2015.12.02.16.23.42
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 02 Dec 2015 16:23:42 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:60956 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1a4HgU-0003y5-2c
	for alex.bennee@linaro.org; Wed, 02 Dec 2015 19:23:42 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36099)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mdavidsaver@gmail.com>) id 1a4Hc0-00049B-AU
	for qemu-devel@nongnu.org; Wed, 02 Dec 2015 19:19:05 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mdavidsaver@gmail.com>) id 1a4Hbz-0001wr-6G
	for qemu-devel@nongnu.org; Wed, 02 Dec 2015 19:19:04 -0500
Received: from mail-qk0-x22e.google.com ([2607:f8b0:400d:c09::22e]:36356)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mdavidsaver@gmail.com>)
	id 1a4Hbz-0001wm-2B; Wed, 02 Dec 2015 19:19:03 -0500
Received: by qkda6 with SMTP id a6so23874819qkd.3;
	Wed, 02 Dec 2015 16:19:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=+3xmU8KDwWJLtqOnoX2n8E9231QHiPgo6nkkW+saefM=;
	b=D4tUX9vMTfJrCymIaP0M42YEbIkhyOoW+5bRXu+/vBNk65wKTCOBkEOQXu77ciV7nt
	y10QnwWO7OA8JszWnVcw7w3vGeu0L9NRSXbS4M6t3OJP4zqySyVJ4sn5s20R6HUo0/m9
	5JjCuUP6JMHeNrAYpxJjaj/0uHajRygmMjP6cxGWA8Tin1Y2TcBLr9vZKoLx+s91iiQz
	De9G57e6W2aRrpEA57Qar6Qn5kVo7D+LEjJAdGRakOE/rq2Lf8sFtVjumViYL19qNcZm
	VhvwS7xMVAqRwcQ/jDPpZrq2ltT0O9TjEI7Z9bjRLm7f43odSFwdJ6ehoxVLB6uL4xu5
	gNLg==
X-Received: by 10.55.82.193 with SMTP id g184mr7561727qkb.65.1449101942666;
	Wed, 02 Dec 2015 16:19:02 -0800 (PST)
Received: from desktop.local (ool-182df582.dyn.optonline.net. [24.45.245.130])
	by smtp.gmail.com with ESMTPSA id
	e31sm2276326qge.11.2015.12.02.16.19.02
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 02 Dec 2015 16:19:02 -0800 (PST)
From: Michael Davidsaver <mdavidsaver@gmail.com>
To: qemu-devel@nongnu.org
Date: Wed,  2 Dec 2015 19:18:32 -0500
Message-Id: <1449101933-24928-6-git-send-email-mdavidsaver@gmail.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1449101933-24928-1-git-send-email-mdavidsaver@gmail.com>
References: <1449101933-24928-1-git-send-email-mdavidsaver@gmail.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400d:c09::22e
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Peter Crosthwaite <crosthwaitepeter@gmail.com>,
	qemu-arm@nongnu.org, Michael Davidsaver <mdavidsaver@gmail.com>
Subject: [Qemu-devel] [PATCH v2 05/26] armv7m: add armv7m_excp_running_prio()
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: bQQoll95TpdI

Implements v7m exception priority algorithm
using FAULTMASK, PRIMASK, BASEPRI, and the highest
priority active exception.

The number returned is the current execution priority
which may be in the range [-2,0x7f] when an exception is active
or 0x100 when no exception is active.
---
 hw/intc/armv7m_nvic.c | 25 +++++++++++++++++++++++++
 target-arm/cpu.h      |  1 +
 2 files changed, 26 insertions(+)

diff --git a/hw/intc/armv7m_nvic.c b/hw/intc/armv7m_nvic.c
index 6fc167e..0145ca7 100644
--- a/hw/intc/armv7m_nvic.c
+++ b/hw/intc/armv7m_nvic.c
@@ -18,6 +18,8 @@
 
 typedef struct {
     GICState gic;
+    uint8_t prigroup;
+
     struct {
         uint32_t control;
         uint32_t reload;
@@ -116,6 +118,29 @@ static void systick_reset(nvic_state *s)
     timer_del(s->systick.timer);
 }
 
+/* @returns the active (running) exception priority.
+ *    only a higher (numerically lower) priority can preempt.
+ */
+int armv7m_excp_running_prio(ARMCPU *cpu)
+{
+    CPUARMState *env = &cpu->env;
+    nvic_state *s = env->nvic;
+    int running;
+
+    if (env->daif & PSTATE_F) { /* FAULTMASK */
+        running = -1;
+    } else if (env->daif & PSTATE_I) { /* PRIMASK */
+        running = 0;
+    } else if (env->v7m.basepri > 0) {
+        /* BASEPRI==1 -> masks [1,255] (not same as PRIMASK==1) */
+        running = env->v7m.basepri >> (s->prigroup+1);
+    } else {
+        running = 0x100; /* lower than any possible priority */
+    }
+    /* consider priority of active handler */
+    return MIN(running, env->v7m.exception_prio);
+}
+
 /* The external routines use the hardware vector numbering, ie. the first
    IRQ is #16.  The internal GIC routines use #32 as the first IRQ.  */
 void armv7m_nvic_set_pending(void *opaque, int irq)
diff --git a/target-arm/cpu.h b/target-arm/cpu.h
index c193fbb..e2d9e75 100644
--- a/target-arm/cpu.h
+++ b/target-arm/cpu.h
@@ -1034,6 +1034,7 @@ uint32_t arm_phys_excp_target_el(CPUState *cs, uint32_t excp_idx,
                                  uint32_t cur_el, bool secure);
 
 /* Interface between CPU and Interrupt controller.  */
+int armv7m_excp_running_prio(ARMCPU *cpu);
 void armv7m_nvic_set_pending(void *opaque, int irq);
 int armv7m_nvic_acknowledge_irq(void *opaque);
 void armv7m_nvic_complete_irq(void *opaque, int irq);
-- 
2.1.4

