Received: by 10.223.172.38 with SMTP id v35csp7472739wrc;
        Tue, 12 Sep 2017 11:20:38 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QCAjG37Rd8SqYh+r9lSOX+9gsKdHx7fcKAoGxDPO/Xe1r9IcNK2EgB/tecGadjeSYhwprs5
X-Received: by 10.55.12.16 with SMTP id 16mr19924910qkm.213.1505240438207;
        Tue, 12 Sep 2017 11:20:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1505240438; cv=none;
        d=google.com; s=arc-20160816;
        b=gInBupmfPdjK1HQaRrRZ7i3RBwOCib552QMd/RVphlpltrgY3Lvpmlm2RCps2M0WJN
         2K1Z558sSjFxy/TP062i4Rl9oSyiT2SK2dILg1C/nyBftjSqNP0BFHrjepaygPd584+v
         yvhkEjBFttmvYSKQrFASNNodNd0LXzxXpBVPYhj9NNnitIIt6D5cH4PYyokmUOvybxrd
         wy5fDTljoQPklmm755BaT8BZb4gE0VeG3eZSrqxsaBeVloySR205pwkFYmZsIlDwTL3m
         DhaqEhNFjC2uWNXz3jlACC4c0mLbJybldcwdzyvO6rwnfdWpfgtpRJewXNjiOhjz0dDr
         nA0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=KZ8pI30d7RlPgjW/BmNZTegucgHmwQZlWm+4BUcmTI0=;
        b=vwLmve1EGL2lvMXuWliwmT6KqMrE3V5qLP3V7yxNyITNYuPmZQHMnD19co4TFi0/zd
         cQR4WkEeQgfq7InHzgEx6sx4tPS1F7tWLhcdhBzw2tvZuTjxYuyrVPNpH2Y6vy/rUTmV
         dvaM+W8xVMzV1oLqa0G5hxhW6OGxcQDnwGfVeqHVoyn3NAKqqdJs5HXxP/hnBzgC3Tw8
         xYk050aJP0xA/taf9cvmjwgMZu1PK5oZBd6KciYMiESt9ygHgsS6t027t1hfc4U/fVlE
         31EcVFWogdbo86xiMBQBOmUkzQrPQidCekZ137mchcwYJh+CZStSixcke1ZMsuLTvzn7
         J+BQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d51si12897358qtb.383.2017.09.12.11.20.37
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 12 Sep 2017 11:20:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37985 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1drpnX-0001E8-Qf
	for alex.bennee@linaro.org; Tue, 12 Sep 2017 14:20:35 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43431)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1drph2-0003SJ-Vb
	for qemu-arm@nongnu.org; Tue, 12 Sep 2017 14:13:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1drph1-0006Rm-Lg
	for qemu-arm@nongnu.org; Tue, 12 Sep 2017 14:13:52 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:37324)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1drph1-0006R3-Cj; Tue, 12 Sep 2017 14:13:51 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1drph0-0001A4-BP; Tue, 12 Sep 2017 19:13:50 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue, 12 Sep 2017 19:14:03 +0100
Message-Id: <1505240046-11454-17-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1505240046-11454-1-git-send-email-peter.maydell@linaro.org>
References: <1505240046-11454-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 16/19] target/arm: Handle banking in
 negative-execution-priority check in cpu_mmu_index()
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
X-TUID: svmYXEAgGpsf

Now that we have a banked FAULTMASK register and banked exceptions,
we can implement the correct check in cpu_mmu_index() for whether
the MPU_CTRL.HFNMIENA bit's effect should apply. This bit causes
handlers which have requested a negative execution priority to run
with the MPU disabled. In v8M the test has to check this for the
current security state and so takes account of banking.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.h      | 21 ++++++++++++++++-----
 hw/intc/armv7m_nvic.c | 29 +++++++++++++++++++++++++++++
 2 files changed, 45 insertions(+), 5 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 7a93354..02be3ca 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1498,6 +1498,21 @@ int armv7m_nvic_complete_irq(void *opaque, int irq);
  * (v8M ARM ARM I_PKLD.)
  */
 int armv7m_nvic_raw_execution_priority(void *opaque);
+/**
+ * armv7m_nvic_neg_prio_requested: return true if the requested execution
+ * priority is negative for the specified security state.
+ * @opaque: the NVIC
+ * @secure: the security state to test
+ * This corresponds to the pseudocode IsReqExecPriNeg().
+ */
+#ifndef CONFIG_USER_ONLY
+bool armv7m_nvic_neg_prio_requested(void *opaque, bool secure);
+#else
+static inline bool armv7m_nvic_neg_prio_requested(void *opaque, bool secure)
+{
+    return false;
+}
+#endif
 
 /* Interface for defining coprocessor registers.
  * Registers are defined in tables of arm_cp_reginfo structs
@@ -2280,11 +2295,7 @@ static inline int cpu_mmu_index(CPUARMState *env, bool ifetch)
     if (arm_feature(env, ARM_FEATURE_M)) {
         ARMMMUIdx mmu_idx = el == 0 ? ARMMMUIdx_MUser : ARMMMUIdx_MPriv;
 
-        /* Execution priority is negative if FAULTMASK is set or
-         * we're in a HardFault or NMI handler.
-         */
-        if ((env->v7m.exception > 0 && env->v7m.exception <= 3)
-            || env->v7m.faultmask[env->v7m.secure]) {
+        if (armv7m_nvic_neg_prio_requested(env->nvic, env->v7m.secure)) {
             mmu_idx = ARMMMUIdx_MNegPri;
         }
 
diff --git a/hw/intc/armv7m_nvic.c b/hw/intc/armv7m_nvic.c
index b13327d..5e5aecd 100644
--- a/hw/intc/armv7m_nvic.c
+++ b/hw/intc/armv7m_nvic.c
@@ -368,6 +368,35 @@ static inline int nvic_exec_prio(NVICState *s)
     return MIN(running, s->exception_prio);
 }
 
+bool armv7m_nvic_neg_prio_requested(void *opaque, bool secure)
+{
+    /* Return true if the requested execution priority is negative
+     * for the specified security state, ie that security state
+     * has an active NMI or HardFault or has set its FAULTMASK.
+     * Note that this is not the same as whether the execution
+     * priority is actually negative (for instance AIRCR.PRIS may
+     * mean we don't allow FAULTMASK_NS to actually make the execution
+     * priority negative). Compare pseudocode IsReqExcPriNeg().
+     */
+    NVICState *s = opaque;
+
+    if (s->cpu->env.v7m.faultmask[secure]) {
+        return true;
+    }
+
+    if (secure ? s->sec_vectors[ARMV7M_EXCP_HARD].active :
+        s->vectors[ARMV7M_EXCP_HARD].active) {
+        return true;
+    }
+
+    if (s->vectors[ARMV7M_EXCP_NMI].active &&
+        exc_targets_secure(s, ARMV7M_EXCP_NMI) == secure) {
+        return true;
+    }
+
+    return false;
+}
+
 bool armv7m_nvic_can_take_pending_exception(void *opaque)
 {
     NVICState *s = opaque;
-- 
2.7.4

