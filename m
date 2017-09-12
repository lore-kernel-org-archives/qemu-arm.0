Received: by 10.223.172.38 with SMTP id v35csp7464413wrc;
        Tue, 12 Sep 2017 11:14:29 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QBQowj8+zQhGdynfE1S4zSYkYFKvxRV1ZbmqEKFKp+80Zuki+98Vugbsu6XZC3G24Yk2pdO
X-Received: by 10.55.87.133 with SMTP id l127mr9014523qkb.212.1505240069124;
        Tue, 12 Sep 2017 11:14:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1505240069; cv=none;
        d=google.com; s=arc-20160816;
        b=jE2b8dFgMxOEr0J6GWnUmfDq6oPTOfX0cT+6/30dPxCQNcFmsN6LDgH75DlnEzbjQo
         +TQ9iqnIE8SDiyZjZfqom/qxKD0i+QbYHOn8Qe9VdWAkx6t+nUrJbeRTOLhREFAF55lj
         RmdAzG5u+GZrxjcRsJ73lVxrXMqAelhVLFNfzZdyzwqRJMsnyzsbS87fomZUNCRLdY8C
         YooobYOJgVxpUdE9C1oa+kf4mbWXec9iCp9RwSkGtRTwfhYr/JLDrRQoKwccJa93lyof
         5gaM2tBnBUI1xKG+oGUAYcC0z/dVmRe1jRjD6OGnowcn6jnm9a8I8Q5VsmRREvp1fCMT
         0/7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=mg2A4zX2ZTvB3uLwahEsHqpOEORmmkpaaPSUzV5IF8w=;
        b=iFLMeVulCxK4siwwUr35gAjECq1I+OGkbD20UWgNC4hohgRjzR5v5UkANqAt3AhySo
         horPppMtZtPKgeYy9kIZuqJHdrVPHY0Vs85IEu4DDDNCuKd/qLPYW5lHRydoXGR07Wk0
         X/Vd9zLowafUByDR8C+CeZ2VX+6eauiZ26sV9H45RtdIHGBlVIRktf5mNQLNscgODmRU
         4PV+9pUAnmBFbZ5LDOj4K2Hywn0gDojMv5c7mNOJ9H85G1f591m1Xlyso2QjGfpkU0qo
         bzO7isrtqcBi0bgCCOHDX39+qBynmGTd56EWl7ZGbtWA8D0VXYityJYfNwFO14SIQlje
         rckQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e62si12253762qkd.501.2017.09.12.11.14.28
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 12 Sep 2017 11:14:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37941 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1drpha-0003tr-NU
	for alex.bennee@linaro.org; Tue, 12 Sep 2017 14:14:26 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43419)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1drph2-0003Rl-Ip
	for qemu-arm@nongnu.org; Tue, 12 Sep 2017 14:13:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1drph1-0006Rf-DY
	for qemu-arm@nongnu.org; Tue, 12 Sep 2017 14:13:52 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:37316)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1drph1-0006QF-4q; Tue, 12 Sep 2017 14:13:51 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1drpgy-00018i-Ao; Tue, 12 Sep 2017 19:13:48 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue, 12 Sep 2017 19:14:00 +0100
Message-Id: <1505240046-11454-14-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1505240046-11454-1-git-send-email-peter.maydell@linaro.org>
References: <1505240046-11454-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 13/19] nvic: Implement v8M changes to fixed
 priority exceptions
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
Cc: patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: tkhiiDYqHOqz

In v7M, the fixed-priority exceptions are:
 Reset: -3
 NMI: -2
 HardFault: -1

In v8M, this changes because Secure HardFault may need
to be prioritised above NMI:
 Reset: -4
 Secure HardFault if AIRCR.BFHFNMINS == 1: -3
 NMI: -2
 Secure HardFault if AIRCR.BFHFNMINS == 0: -1
 NonSecure HardFault: -1

Make these changes, including support for changing the
priority of Secure HardFault as AIRCR.BFHFNMINS changes.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/armv7m_nvic.c | 22 +++++++++++++++++++---
 1 file changed, 19 insertions(+), 3 deletions(-)

diff --git a/hw/intc/armv7m_nvic.c b/hw/intc/armv7m_nvic.c
index c4670f7..db2f170 100644
--- a/hw/intc/armv7m_nvic.c
+++ b/hw/intc/armv7m_nvic.c
@@ -937,6 +937,12 @@ static void nvic_writel(NVICState *s, uint32_t offset, uint32_t value,
                     (R_V7M_AIRCR_SYSRESETREQS_MASK |
                      R_V7M_AIRCR_BFHFNMINS_MASK |
                      R_V7M_AIRCR_PRIS_MASK);
+                /* BFHFNMINS changes the priority of Secure HardFault */
+                if (cpu->env.v7m.aircr & R_V7M_AIRCR_BFHFNMINS_MASK) {
+                    s->sec_vectors[ARMV7M_EXCP_HARD].prio = -3;
+                } else {
+                    s->sec_vectors[ARMV7M_EXCP_HARD].prio = -1;
+                }
             }
             nvic_irq_update(s);
         }
@@ -1452,9 +1458,12 @@ static int nvic_post_load(void *opaque, int version_id)
 {
     NVICState *s = opaque;
     unsigned i;
+    int resetprio;
 
     /* Check for out of range priority settings */
-    if (s->vectors[ARMV7M_EXCP_RESET].prio != -3 ||
+    resetprio = arm_feature(&s->cpu->env, ARM_FEATURE_V8) ? -4 : -3;
+
+    if (s->vectors[ARMV7M_EXCP_RESET].prio != resetprio ||
         s->vectors[ARMV7M_EXCP_NMI].prio != -2 ||
         s->vectors[ARMV7M_EXCP_HARD].prio != -1) {
         return 1;
@@ -1497,7 +1506,12 @@ static int nvic_security_post_load(void *opaque, int version_id)
     int i;
 
     /* Check for out of range priority settings */
-    if (s->sec_vectors[ARMV7M_EXCP_HARD].prio != -1) {
+    if (s->sec_vectors[ARMV7M_EXCP_HARD].prio != -1
+        && s->sec_vectors[ARMV7M_EXCP_HARD].prio != -3) {
+        /* We can't cross-check against AIRCR.BFHFNMINS as we don't know
+         * if the CPU state has been migrated yet; a mismatch won't
+         * cause the emulation to blow up, though.
+         */
         return 1;
     }
     for (i = ARMV7M_EXCP_MEM; i < ARRAY_SIZE(s->sec_vectors); i++) {
@@ -1544,6 +1558,7 @@ static Property props_nvic[] = {
 
 static void armv7m_nvic_reset(DeviceState *dev)
 {
+    int resetprio;
     NVICState *s = NVIC(dev);
 
     s->vectors[ARMV7M_EXCP_NMI].enabled = 1;
@@ -1556,7 +1571,8 @@ static void armv7m_nvic_reset(DeviceState *dev)
     s->vectors[ARMV7M_EXCP_PENDSV].enabled = 1;
     s->vectors[ARMV7M_EXCP_SYSTICK].enabled = 1;
 
-    s->vectors[ARMV7M_EXCP_RESET].prio = -3;
+    resetprio = arm_feature(&s->cpu->env, ARM_FEATURE_V8) ? -4 : -3;
+    s->vectors[ARMV7M_EXCP_RESET].prio = resetprio;
     s->vectors[ARMV7M_EXCP_NMI].prio = -2;
     s->vectors[ARMV7M_EXCP_HARD].prio = -1;
 
-- 
2.7.4

