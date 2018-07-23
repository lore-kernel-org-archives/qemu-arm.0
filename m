Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp5608762wru;
        Mon, 23 Jul 2018 05:38:42 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpe8ZVqFEVhLcnKGx8dP8JREMLyCJWYP4F2yEdNCCVxRjblTbCcb95cXxmVTTz+L0AaMr38Q
X-Received: by 2002:ac8:427:: with SMTP id v39-v6mr11866913qtg.120.1532349522519;
        Mon, 23 Jul 2018 05:38:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1532349522; cv=none;
        d=google.com; s=arc-20160816;
        b=w65s3l/pUKNT9DDT787xezOWh7hqXvfrKKsZe8RsnolKWeJulwzScoXjufLFdP1KIl
         YhDmU38rjkU5g0VHpkGwGxrJsC8dd3Z05M9Nbzm6ClimMe5Ud3pGV6sBfzdcCJQ8B8Sh
         yXn3P6ozZHufFdIwKoOS1g+xnEiQcO4l8AHOAMj/t/sgiyjzl9sRSVTo3e/Qrh52BTm0
         IZdl7RSOYlNRPWd4f7lsaZ5N9kYpMBxeo+FweAHd16maJ1aizgsAaZ2UmBQqpp4Wh2Pb
         WLdlipRaiaeI2opIOEvf1ogd9eSZC1NdOCNZNixVgeWKU/kenCpObFzxVzEJdoM3Im41
         CX7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :arc-authentication-results;
        bh=SRdaonARrlnL+3Md7oPjjFEL4eQT+ZFNVVNs7eLRuTs=;
        b=a5AJemt7//Q0lqOWFdXidqlOVot6t4zyhcA8Nq/vKAagVmse3hkj7adne0uNGt8hno
         XbH6gBbmzaPxQZzzKnpbf/5aVgKFEOvfOooAV0nk0PplYJtb2EUr82fW0NgnRM064Unj
         K+1oO8MkcXI6fs8aiWoxVFSyPYYGkT3NCfA/RY+OkZf04DH/pak32ORUuDgq1+Hpxk3C
         BW+e72bxFbiVJ79tzeimIjm9/GKVvaC+Pj4/mLMJSAZt7XBBE2e3qIlItr+MlD8S283h
         9/5tKUW1EXLb4+7/3wzyoRG0wfskmXcOoP8X6xmvLjo0q0fm1aZoVH+QqhTYBJKnHs4o
         WWQA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f8-v6si3971702qtk.135.2018.07.23.05.38.42
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 23 Jul 2018 05:38:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34409 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fha6r-0007eM-Uj
	for alex.bennee@linaro.org; Mon, 23 Jul 2018 08:38:41 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38842)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1fha3Q-0005Az-5o
	for qemu-arm@nongnu.org; Mon, 23 Jul 2018 08:35:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1fha3P-0005u1-6z
	for qemu-arm@nongnu.org; Mon, 23 Jul 2018 08:35:08 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:43682)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1fha3O-0005lh-V0; Mon, 23 Jul 2018 08:35:07 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1fha3G-0007eT-KS; Mon, 23 Jul 2018 13:34:58 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Mon, 23 Jul 2018 13:34:57 +0100
Message-Id: <20180723123457.2038-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.17.1
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH] target/arm: Escalate to correct HardFault when
 AIRCR.BFHFNMINS is set
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
X-TUID: 2HMVo/sgphct

When we escalate a v8M exception to HardFault, if AIRCR.BFHFNMINNS is
set then we need to decide whether it should become a secure HardFault
or a nonsecure HardFault. We should always escalate to the same
target security state as the original exception. The current code
tries to test this using the 'secure' bool, which is not right because
that flag indicates whether the target security state only for
banked exceptions; the effect was that we were incorrectly escalating
always-secure exceptions like SecureFault to a nonsecure HardFault.

Fix this by defining, logging and using a new 'targets_secure' bool
which tracks the condition we actually want.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/armv7m_nvic.c | 8 ++++++--
 hw/intc/trace-events  | 2 +-
 2 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/hw/intc/armv7m_nvic.c b/hw/intc/armv7m_nvic.c
index bf92fe0972c..e160b02eab4 100644
--- a/hw/intc/armv7m_nvic.c
+++ b/hw/intc/armv7m_nvic.c
@@ -529,13 +529,17 @@ static void do_armv7m_nvic_set_pending(void *opaque, int irq, bool secure,
     NVICState *s = (NVICState *)opaque;
     bool banked = exc_is_banked(irq);
     VecInfo *vec;
+    bool targets_secure;
 
     assert(irq > ARMV7M_EXCP_RESET && irq < s->num_irq);
     assert(!secure || banked);
 
     vec = (banked && secure) ? &s->sec_vectors[irq] : &s->vectors[irq];
 
-    trace_nvic_set_pending(irq, secure, derived, vec->enabled, vec->prio);
+    targets_secure = banked ? secure : exc_targets_secure(s, irq);
+
+    trace_nvic_set_pending(irq, secure, targets_secure,
+                           derived, vec->enabled, vec->prio);
 
     if (derived) {
         /* Derived exceptions are always synchronous. */
@@ -615,7 +619,7 @@ static void do_armv7m_nvic_set_pending(void *opaque, int irq, bool secure,
              */
             irq = ARMV7M_EXCP_HARD;
             if (arm_feature(&s->cpu->env, ARM_FEATURE_M_SECURITY) &&
-                (secure ||
+                (targets_secure ||
                  !(s->cpu->env.v7m.aircr & R_V7M_AIRCR_BFHFNMINS_MASK))) {
                 vec = &s->sec_vectors[irq];
             } else {
diff --git a/hw/intc/trace-events b/hw/intc/trace-events
index b6cb5e6048d..33e932fb918 100644
--- a/hw/intc/trace-events
+++ b/hw/intc/trace-events
@@ -177,7 +177,7 @@ nvic_set_prio(int irq, bool secure, uint8_t prio) "NVIC set irq %d secure-bank %
 nvic_irq_update(int vectpending, int pendprio, int exception_prio, int level) "NVIC vectpending %d pending prio %d exception_prio %d: setting irq line to %d"
 nvic_escalate_prio(int irq, int irqprio, int runprio) "NVIC escalating irq %d to HardFault: insufficient priority %d >= %d"
 nvic_escalate_disabled(int irq) "NVIC escalating irq %d to HardFault: disabled"
-nvic_set_pending(int irq, bool secure, bool derived, int en, int prio) "NVIC set pending irq %d secure-bank %d derived %d (enabled: %d priority %d)"
+nvic_set_pending(int irq, bool secure, bool targets_secure, bool derived, int en, int prio) "NVIC set pending irq %d secure-bank %d targets_secure %d derived %d (enabled: %d priority %d)"
 nvic_clear_pending(int irq, bool secure, int en, int prio) "NVIC clear pending irq %d secure-bank %d (enabled: %d priority %d)"
 nvic_set_pending_level(int irq) "NVIC set pending: irq %d higher prio than vectpending: setting irq line to 1"
 nvic_acknowledge_irq(int irq, int prio) "NVIC acknowledge IRQ: %d now active (prio %d)"
-- 
2.17.1

