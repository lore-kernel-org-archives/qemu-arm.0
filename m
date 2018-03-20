Received: by 10.28.91.67 with SMTP id p64csp3851642wmb;
        Tue, 20 Mar 2018 06:44:20 -0700 (PDT)
X-Google-Smtp-Source: AG47ELtU4TfP6lxQfulXivepNsQ8hsRZ6ok90mF+APlUA5sb6jLgRtUlbW1zqK8ePd3x4Jx1ZQjo
X-Received: by 10.55.153.133 with SMTP id b127mr24506547qke.245.1521553460382;
        Tue, 20 Mar 2018 06:44:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1521553460; cv=none;
        d=google.com; s=arc-20160816;
        b=jFQxh2fRL96c6+YQAbl85bf/cFXqA+wXwLDQO/Id+ZMuVfmeXKUsO2m23BCWxJdchl
         6y6Jlpty4gTVsf/nwoQKSRDChseQA+9k32GITLA4+2Jmx19Yc9ErbMnx5NEnEp6NlJFB
         eTz8lhgKOUp0IAloTP+4QJyyPimiP6+7O/xbpTaH9I204WyNm656nEsGnT3PXmuvucR4
         1jN3g3CY3tD72tN7hDfj+/KU1aWsmNLpu1rPjCFv+quRnfVFJuux0ouKgDIMmtgulb/u
         OaYvPUmedSk73N/I7KB7oaIp5S1sPm0ZTcRqs0MuMS4DCjnJC3SHWKxiKIa1+f7kMDgX
         l3Pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=edgydhp+zW1vB7+kgJzn06q30B4HyUexobq4kbva/nc=;
        b=VvEEmFqpaiyosP6Bsm7M7Zojl0ZYDYa8xSzueaJt0Nm7zmpuIGCTJhbrstVxs3H0U+
         mnwXTxex31BFVRuYVRJ1yphqX6YBtpUp1AMDjcghM3o8XvykQT2QE6VZNZbgJDAOguKz
         34SNNHJ9EbomgQnnlO+AdIC5QPxYlFiKhjjB2Gzinhl5iS+MMo/5xEbJWhrA40FZ4CSa
         +JirRx6l7wV6MQ/bcfoykD/8+QQUizYn3aUBDcpLkarz4AKk4UJdmz9rMYGdW58YPC8Y
         sGojrI1wpFIZZBK0FmoYZSnQxgFofMnFru0fsdyUHNIrK80inhgOfpX/bx1pay2llL9i
         YzfA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m22si2011557qtm.56.2018.03.20.06.44.20
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 20 Mar 2018 06:44:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48735 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eyHYp-0005NF-SR
	for alex.bennee@linaro.org; Tue, 20 Mar 2018 09:44:19 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:32924)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1eyHW7-00038m-8y
	for qemu-arm@nongnu.org; Tue, 20 Mar 2018 09:41:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1eyHW3-00042J-5G
	for qemu-arm@nongnu.org; Tue, 20 Mar 2018 09:41:31 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:40476)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1eyHW2-0003s8-Um; Tue, 20 Mar 2018 09:41:27 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1eyHVt-00044f-Jw; Tue, 20 Mar 2018 13:41:17 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue, 20 Mar 2018 13:41:12 +0000
Message-Id: <20180320134114.30418-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.16.2
In-Reply-To: <20180320134114.30418-1-peter.maydell@linaro.org>
References: <20180320134114.30418-1-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH for-2.12 2/4] target/arm: Factor out code to
 calculate FSR for debug exceptions
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
X-TUID: YW6PnNdg95Mh

When a debug exception is taken to AArch32, it appears as a Prefetch
Abort, and the Instruction Fault Status Register (IFSR) must be set.
The IFSR has two possible formats, depending on whether LPAE is in
use. Factor out the code in arm_debug_excp_handler() which picks
an FSR value into its own utility function, update it to use
arm_fi_to_lfsc() and arm_fi_to_sfsc() rather than hard-coded constants,
and use the correct condition to select long or short format.

In particular this fixes a bug where we could select the short
format because we're at EL0 and the EL1 translation regime is
not using LPAE, but then route the debug exception to EL2 because
of MDCR_EL2.TDE and hand EL2 the wrong format FSR.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/internals.h | 25 +++++++++++++++++++++++++
 target/arm/op_helper.c | 12 ++----------
 2 files changed, 27 insertions(+), 10 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index 47cc224a46..8ce944b7a0 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -763,4 +763,29 @@ static inline bool regime_is_secure(CPUARMState *env, ARMMMUIdx mmu_idx)
     }
 }
 
+/* Return the FSR value for a debug exception (watchpoint, hardware
+ * breakpoint or BKPT insn) targeting the specified exception level.
+ */
+static inline uint32_t arm_debug_exception_fsr(CPUARMState *env)
+{
+    ARMMMUFaultInfo fi = { .type = ARMFault_Debug };
+    int target_el = arm_debug_target_el(env);
+    bool using_lpae = false;
+
+    if (target_el == 2 || arm_el_is_aa64(env, target_el)) {
+        using_lpae = true;
+    } else {
+        if (arm_feature(env, ARM_FEATURE_LPAE) &&
+            (env->cp15.tcr_el[target_el].raw_tcr & TTBCR_EAE)) {
+            using_lpae = true;
+        }
+    }
+
+    if (using_lpae) {
+        return arm_fi_to_lfsc(&fi);
+    } else {
+        return arm_fi_to_sfsc(&fi);
+    }
+}
+
 #endif
diff --git a/target/arm/op_helper.c b/target/arm/op_helper.c
index 4b123d2bd6..75efff9edf 100644
--- a/target/arm/op_helper.c
+++ b/target/arm/op_helper.c
@@ -1330,11 +1330,7 @@ void arm_debug_excp_handler(CPUState *cs)
 
             cs->watchpoint_hit = NULL;
 
-            if (extended_addresses_enabled(env)) {
-                env->exception.fsr = (1 << 9) | 0x22;
-            } else {
-                env->exception.fsr = 0x2;
-            }
+            env->exception.fsr = arm_debug_exception_fsr(env);
             env->exception.vaddress = wp_hit->hitaddr;
             raise_exception(env, EXCP_DATA_ABORT,
                     syn_watchpoint(same_el, 0, wnr),
@@ -1354,11 +1350,7 @@ void arm_debug_excp_handler(CPUState *cs)
             return;
         }
 
-        if (extended_addresses_enabled(env)) {
-            env->exception.fsr = (1 << 9) | 0x22;
-        } else {
-            env->exception.fsr = 0x2;
-        }
+        env->exception.fsr = arm_debug_exception_fsr(env);
         /* FAR is UNKNOWN, so doesn't need setting */
         raise_exception(env, EXCP_PREFETCH_ABORT,
                         syn_breakpoint(same_el),
-- 
2.16.2

