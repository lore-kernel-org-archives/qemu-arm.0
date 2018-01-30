Received: by 10.28.71.27 with SMTP id u27csp1473941wma;
        Tue, 30 Jan 2018 07:03:03 -0800 (PST)
X-Google-Smtp-Source: AH8x227cK1SonMu5lEm1dF62fZtpY8SNfDLlpjT/NnFnGjQirm2FdOjeS23jE/Vp52mgjsDMR+Yk
X-Received: by 10.129.112.15 with SMTP id l15mr19692579ywc.494.1517324583789;
        Tue, 30 Jan 2018 07:03:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1517324583; cv=none;
        d=google.com; s=arc-20160816;
        b=HC7d7797E2kTuIIhK4V2W1pGpSM6i0JbiDeOamu7lr/FyQWi6NWzGUHW5rXNhRqV3S
         aiWYP/Yk/d2gn9JZSgCnwypxSF3Mk1CCATelUwaAYNKBzVXyaOkm1uGeiTh8PYQUmxYh
         Hsq33eNVjNOemyCDd8iNOkQiegGiaxjLwbu4auyzzFeJJcCKwkPEdu0s3l0NzQTAqcAo
         8GWPQSuc+zbl3Tp7GnWjBQuqwcr6J7n2pm/zkhXm9j2gPuZqRfvhBkQYJNeaCyRGdt2F
         RMOlsUWHHyaB1qMrYVYZSZmPLk9oSwG3rKTlo1mFnQJlvyy2g+PxmMsnCsMlvleiEu+L
         Gg1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=psVjRHoe0C43PjgjG3wNDvUfC3MZX8TMbmJOJRupe0Y=;
        b=b2XGOVxFBbDiKwrQCsgbWusLC3gYa0rJIV08Fi3cZ1tCLY+eXp1rGZTP4sFUyTQp8e
         9esX4lVVW32MklPdNbZ8JOTJqcaTamUBEcxiAH0dBF7uK0PlF6wM67Cd0HLaJZzYKw9q
         On8LIc34M+20Oz9QdNE1X4VBdwYwFD0zC07FmPtezxhKfHXrYhePjDJuKN1MPmOY18xN
         88nfm1nHFW5RLGiwi1OxpqTTIYfUqRkfGuk9FDRdgx60y3uYBa6UwQ3N9rSFmD6dMmhO
         C5EXCxjKFddsug/3Ay/oZw1xNkAQpLt/fp+U9JoW2eEGL2I78ZDq2Jc50wR6LdeVS3l5
         7AvQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d17si2104297ybl.291.2018.01.30.07.03.03
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 30 Jan 2018 07:03:03 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42062 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1egXR9-0000Q8-58
	for alex.bennee@linaro.org; Tue, 30 Jan 2018 10:03:03 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49077)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1egXQi-0000Bb-UV
	for qemu-arm@nongnu.org; Tue, 30 Jan 2018 10:02:41 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1egXQd-0005Zm-49
	for qemu-arm@nongnu.org; Tue, 30 Jan 2018 10:02:37 -0500
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:46108)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1egXQc-0005Uz-Rr; Tue, 30 Jan 2018 10:02:31 -0500
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1egXQa-0005tc-Fs; Tue, 30 Jan 2018 15:02:28 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue, 30 Jan 2018 15:02:21 +0000
Message-Id: <1517324542-6607-7-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1517324542-6607-1-git-send-email-peter.maydell@linaro.org>
References: <1517324542-6607-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 6/7] target/arm: Make exception vector loads
 honour the SAU
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
X-TUID: rKi9a5/+jYhS

Make the load of the exception vector from the vector table honour
the SAU and any bus error on the load (possibly provoking a derived
exception), rather than simply aborting if the load fails.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.c | 71 +++++++++++++++++++++++++++++++++++++++++------------
 1 file changed, 55 insertions(+), 16 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index de0031b..6931a9d 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -6449,28 +6449,63 @@ static uint32_t *get_v7m_sp_ptr(CPUARMState *env, bool secure, bool threadmode,
     }
 }
 
-static uint32_t arm_v7m_load_vector(ARMCPU *cpu, int exc, bool targets_secure)
+static bool arm_v7m_load_vector(ARMCPU *cpu, int exc, bool targets_secure,
+                                uint32_t *pvec)
 {
     CPUState *cs = CPU(cpu);
     CPUARMState *env = &cpu->env;
     MemTxResult result;
-    hwaddr vec = env->v7m.vecbase[targets_secure] + exc * 4;
-    uint32_t addr;
+    uint32_t addr = env->v7m.vecbase[targets_secure] + exc * 4;
+    uint32_t vector_entry;
+    MemTxAttrs attrs = {};
+    ARMMMUIdx mmu_idx;
+    bool exc_secure;
+
+    mmu_idx = arm_v7m_mmu_idx_for_secstate_and_priv(env, targets_secure, true);
 
-    addr = address_space_ldl(cs->as, vec,
-                             MEMTXATTRS_UNSPECIFIED, &result);
+    /* We don't do a get_phys_addr() here because the rules for vector
+     * loads are special: they always use the default memory map, and
+     * the default memory map permits reads from all addresses.
+     * Since there's no easy way to pass through to pmsav8_mpu_lookup()
+     * that we want this special case which would always say "yes",
+     * we just do the SAU lookup here followed by a direct physical load.
+     */
+    attrs.secure = targets_secure;
+    attrs.user = false;
+
+    if (arm_feature(env, ARM_FEATURE_M_SECURITY)) {
+        V8M_SAttributes sattrs = {};
+
+        v8m_security_lookup(env, addr, MMU_DATA_LOAD, mmu_idx, &sattrs);
+        if (sattrs.ns) {
+            attrs.secure = false;
+        } else if (!targets_secure) {
+            /* NS access to S memory */
+            goto load_fail;
+        }
+    }
+
+    vector_entry = address_space_ldl(arm_addressspace(cs, attrs), addr,
+                                     attrs, &result);
     if (result != MEMTX_OK) {
-        /* Architecturally this should cause a HardFault setting HSFR.VECTTBL,
-         * which would then be immediately followed by our failing to load
-         * the entry vector for that HardFault, which is a Lockup case.
-         * Since we don't model Lockup, we just report this guest error
-         * via cpu_abort().
-         */
-        cpu_abort(cs, "Failed to read from %s exception vector table "
-                  "entry %08x\n", targets_secure ? "secure" : "nonsecure",
-                  (unsigned)vec);
+        goto load_fail;
     }
-    return addr;
+    *pvec = vector_entry;
+    return true;
+
+load_fail:
+    /* All vector table fetch fails are reported as HardFault, with
+     * HFSR.VECTTBL and .FORCED set. (FORCED is set because
+     * technically the underlying exception is a MemManage or BusFault
+     * that is escalated to HardFault.) This is a terminal exception,
+     * so we will either take the HardFault immediately or else enter
+     * lockup (the latter case is handled in armv7m_nvic_set_pending_derived()).
+     */
+    exc_secure = targets_secure ||
+        !(cpu->env.v7m.aircr & R_V7M_AIRCR_BFHFNMINS_MASK);
+    env->v7m.hfsr |= R_V7M_HFSR_VECTTBL_MASK | R_V7M_HFSR_FORCED_MASK;
+    armv7m_nvic_set_pending_derived(env->nvic, ARMV7M_EXCP_HARD, exc_secure);
+    return false;
 }
 
 static bool v7m_push_callee_stack(ARMCPU *cpu, uint32_t lr, bool dotailchain,
@@ -6623,7 +6658,11 @@ static void v7m_exception_taken(ARMCPU *cpu, uint32_t lr, bool dotailchain,
         return;
     }
 
-    addr = arm_v7m_load_vector(cpu, exc, targets_secure);
+    if (!arm_v7m_load_vector(cpu, exc, targets_secure, &addr)) {
+        /* Vector load failed: derived exception */
+        v7m_exception_taken(cpu, lr, true, true);
+        return;
+    }
 
     /* Now we've done everything that might cause a derived exception
      * we can go ahead and activate whichever exception we're going to
-- 
2.7.4

