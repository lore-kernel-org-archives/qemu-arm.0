Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp896460wrt;
        Fri, 12 Oct 2018 07:43:20 -0700 (PDT)
X-Google-Smtp-Source: ACcGV636f1MpsVElYfZTgx6g59pBxCOlTcfUUSumtng3yxXBhxZRDNOaKAOV+Y+cpLSmuYY3t7WL
X-Received: by 2002:ac8:289a:: with SMTP id i26-v6mr6094582qti.276.1539355400407;
        Fri, 12 Oct 2018 07:43:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1539355400; cv=none;
        d=google.com; s=arc-20160816;
        b=FmVlBWV/zAMj1mNDS+//ZP9MV5LsAuryILu6B481WQo1cbD6weLCLPS6UXo6BqpSJA
         L5oPyXWx6hGjgon0NUKFo051j9c7vFhpAQ4BqYxspy6vrSm7mDtwQXx3hAvwRtteAld0
         UvhcFctpZAyhmeFZ/+UWqJQTVUaWoOZXdoCPj9YdOzXovK7YqesNFMH1wNT7QPgC/Uft
         Hp+RqiaJedwg/jyMfGgkLZ1NWfu0rUsLiQZR0CsHO+/mepZV3QIjhGXtBpjoNBzfNyBP
         K/i0Su5yuM3bi9DhKWmgTz5YoPhLiuZzss7uYv0RGgvDNaCAa55TCl/ReRRH60sbGJVw
         DVWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=UEAf8biAmwcJHLotS/pBLVi9BNB2NcVIiigaL73Q284=;
        b=0KMDeEbHnaE4TpxNuP21NY9iaCgz4jl8XKSGBSyeoKRw3QTlnfVmhj3qX8aIBgin2z
         86D6MoCRvHRfs2NJ2kvqzMVvnvS0YUf8JTaUoPvqownw/HCwpBylzZ3v4a3Row+NFzWZ
         pyZdxUSoOQYHIq2AH2il4Mry3J6Sgp4zEqzUNg+0eZZbgrOqW/yCbKh9axPK48InCd4f
         1IrH6xNp3fz86/PJw26tm0JbeLewq7EdOIlOXkFNWjnDl+9lN6x0U07MGuiKQjMfLZpz
         c4DT7+3L2SyRw7SSW6jWlVBAj3GOFrtez3v+b3WPWEMxMroRp1LO7q7k9sWCJFe1u71y
         rKoQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k4-v6si286495qkl.131.2018.10.12.07.43.20
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 12 Oct 2018 07:43:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41075 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gAyet-0008HU-Lv
	for alex.bennee@linaro.org; Fri, 12 Oct 2018 10:43:19 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55248)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1gAyeK-0007xK-36
	for qemu-arm@nongnu.org; Fri, 12 Oct 2018 10:42:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1gAyeI-0002oc-Ua
	for qemu-arm@nongnu.org; Fri, 12 Oct 2018 10:42:44 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:51796)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1gAyeI-0002nI-Jo; Fri, 12 Oct 2018 10:42:42 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1gAyeH-0000OI-F1; Fri, 12 Oct 2018 15:42:41 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Fri, 12 Oct 2018 15:42:28 +0100
Message-Id: <20181012144235.19646-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.19.0
In-Reply-To: <20181012144235.19646-1-peter.maydell@linaro.org>
References: <20181012144235.19646-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 03/10] target/arm: Implement HCR.FB
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
X-TUID: gJD0bW1MkZLS

The HCR.FB virtualization configuration register bit requests that
TLB maintenance, branch predictor invalidate-all and icache
invalidate-all operations performed in NS EL1 should be upgraded
from "local CPU only to "broadcast within Inner Shareable domain".
For QEMU we NOP the branch predictor and icache operations, so
we only need to upgrade the TLB invalidates:
 AArch32 TLBIALL, TLBIMVA, TLBIASID, DTLBIALL, DTLBIMVA, DTLBIASID,
         ITLBIALL, ITLBIMVA, ITLBIASID, TLBIMVAA, TLBIMVAL, TLBIMVAAL
 AArch64 TLBI VMALLE1, TLBI VAE1, TLBI ASIDE1, TLBI VAAE1,
         TLBI VALE1, TLBI VAALE1

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.c | 191 +++++++++++++++++++++++++++-----------------
 1 file changed, 116 insertions(+), 75 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 0253a971099..cbec6844a44 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -554,42 +554,6 @@ static void contextidr_write(CPUARMState *env, const ARMCPRegInfo *ri,
     raw_write(env, ri, value);
 }
 
-static void tlbiall_write(CPUARMState *env, const ARMCPRegInfo *ri,
-                          uint64_t value)
-{
-    /* Invalidate all (TLBIALL) */
-    ARMCPU *cpu = arm_env_get_cpu(env);
-
-    tlb_flush(CPU(cpu));
-}
-
-static void tlbimva_write(CPUARMState *env, const ARMCPRegInfo *ri,
-                          uint64_t value)
-{
-    /* Invalidate single TLB entry by MVA and ASID (TLBIMVA) */
-    ARMCPU *cpu = arm_env_get_cpu(env);
-
-    tlb_flush_page(CPU(cpu), value & TARGET_PAGE_MASK);
-}
-
-static void tlbiasid_write(CPUARMState *env, const ARMCPRegInfo *ri,
-                           uint64_t value)
-{
-    /* Invalidate by ASID (TLBIASID) */
-    ARMCPU *cpu = arm_env_get_cpu(env);
-
-    tlb_flush(CPU(cpu));
-}
-
-static void tlbimvaa_write(CPUARMState *env, const ARMCPRegInfo *ri,
-                           uint64_t value)
-{
-    /* Invalidate single entry by MVA, all ASIDs (TLBIMVAA) */
-    ARMCPU *cpu = arm_env_get_cpu(env);
-
-    tlb_flush_page(CPU(cpu), value & TARGET_PAGE_MASK);
-}
-
 /* IS variants of TLB operations must affect all cores */
 static void tlbiall_is_write(CPUARMState *env, const ARMCPRegInfo *ri,
                              uint64_t value)
@@ -623,6 +587,73 @@ static void tlbimvaa_is_write(CPUARMState *env, const ARMCPRegInfo *ri,
     tlb_flush_page_all_cpus_synced(cs, value & TARGET_PAGE_MASK);
 }
 
+/*
+ * Non-IS variants of TLB operations are upgraded to
+ * IS versions if we are at NS EL1 and HCR_EL2.FB is set to
+ * force broadcast of these operations.
+ */
+static bool tlb_force_broadcast(CPUARMState *env)
+{
+    return (env->cp15.hcr_el2 & HCR_FB) &&
+        arm_current_el(env) == 1 && arm_is_secure_below_el3(env);
+}
+
+static void tlbiall_write(CPUARMState *env, const ARMCPRegInfo *ri,
+                          uint64_t value)
+{
+    /* Invalidate all (TLBIALL) */
+    ARMCPU *cpu = arm_env_get_cpu(env);
+
+    if (tlb_force_broadcast(env)) {
+        tlbiall_is_write(env, NULL, value);
+        return;
+    }
+
+    tlb_flush(CPU(cpu));
+}
+
+static void tlbimva_write(CPUARMState *env, const ARMCPRegInfo *ri,
+                          uint64_t value)
+{
+    /* Invalidate single TLB entry by MVA and ASID (TLBIMVA) */
+    ARMCPU *cpu = arm_env_get_cpu(env);
+
+    if (tlb_force_broadcast(env)) {
+        tlbimva_is_write(env, NULL, value);
+        return;
+    }
+
+    tlb_flush_page(CPU(cpu), value & TARGET_PAGE_MASK);
+}
+
+static void tlbiasid_write(CPUARMState *env, const ARMCPRegInfo *ri,
+                           uint64_t value)
+{
+    /* Invalidate by ASID (TLBIASID) */
+    ARMCPU *cpu = arm_env_get_cpu(env);
+
+    if (tlb_force_broadcast(env)) {
+        tlbiasid_is_write(env, NULL, value);
+        return;
+    }
+
+    tlb_flush(CPU(cpu));
+}
+
+static void tlbimvaa_write(CPUARMState *env, const ARMCPRegInfo *ri,
+                           uint64_t value)
+{
+    /* Invalidate single entry by MVA, all ASIDs (TLBIMVAA) */
+    ARMCPU *cpu = arm_env_get_cpu(env);
+
+    if (tlb_force_broadcast(env)) {
+        tlbimvaa_is_write(env, NULL, value);
+        return;
+    }
+
+    tlb_flush_page(CPU(cpu), value & TARGET_PAGE_MASK);
+}
+
 static void tlbiall_nsnh_write(CPUARMState *env, const ARMCPRegInfo *ri,
                                uint64_t value)
 {
@@ -3082,22 +3113,6 @@ static CPAccessResult aa64_cacheop_access(CPUARMState *env,
  * Page D4-1736 (DDI0487A.b)
  */
 
-static void tlbi_aa64_vmalle1_write(CPUARMState *env, const ARMCPRegInfo *ri,
-                                    uint64_t value)
-{
-    CPUState *cs = ENV_GET_CPU(env);
-
-    if (arm_is_secure_below_el3(env)) {
-        tlb_flush_by_mmuidx(cs,
-                            ARMMMUIdxBit_S1SE1 |
-                            ARMMMUIdxBit_S1SE0);
-    } else {
-        tlb_flush_by_mmuidx(cs,
-                            ARMMMUIdxBit_S12NSE1 |
-                            ARMMMUIdxBit_S12NSE0);
-    }
-}
-
 static void tlbi_aa64_vmalle1is_write(CPUARMState *env, const ARMCPRegInfo *ri,
                                       uint64_t value)
 {
@@ -3115,6 +3130,27 @@ static void tlbi_aa64_vmalle1is_write(CPUARMState *env, const ARMCPRegInfo *ri,
     }
 }
 
+static void tlbi_aa64_vmalle1_write(CPUARMState *env, const ARMCPRegInfo *ri,
+                                    uint64_t value)
+{
+    CPUState *cs = ENV_GET_CPU(env);
+
+    if (tlb_force_broadcast(env)) {
+        tlbi_aa64_vmalle1_write(env, NULL, value);
+        return;
+    }
+
+    if (arm_is_secure_below_el3(env)) {
+        tlb_flush_by_mmuidx(cs,
+                            ARMMMUIdxBit_S1SE1 |
+                            ARMMMUIdxBit_S1SE0);
+    } else {
+        tlb_flush_by_mmuidx(cs,
+                            ARMMMUIdxBit_S12NSE1 |
+                            ARMMMUIdxBit_S12NSE0);
+    }
+}
+
 static void tlbi_aa64_alle1_write(CPUARMState *env, const ARMCPRegInfo *ri,
                                   uint64_t value)
 {
@@ -3204,29 +3240,6 @@ static void tlbi_aa64_alle3is_write(CPUARMState *env, const ARMCPRegInfo *ri,
     tlb_flush_by_mmuidx_all_cpus_synced(cs, ARMMMUIdxBit_S1E3);
 }
 
-static void tlbi_aa64_vae1_write(CPUARMState *env, const ARMCPRegInfo *ri,
-                                 uint64_t value)
-{
-    /* Invalidate by VA, EL1&0 (AArch64 version).
-     * Currently handles all of VAE1, VAAE1, VAALE1 and VALE1,
-     * since we don't support flush-for-specific-ASID-only or
-     * flush-last-level-only.
-     */
-    ARMCPU *cpu = arm_env_get_cpu(env);
-    CPUState *cs = CPU(cpu);
-    uint64_t pageaddr = sextract64(value << 12, 0, 56);
-
-    if (arm_is_secure_below_el3(env)) {
-        tlb_flush_page_by_mmuidx(cs, pageaddr,
-                                 ARMMMUIdxBit_S1SE1 |
-                                 ARMMMUIdxBit_S1SE0);
-    } else {
-        tlb_flush_page_by_mmuidx(cs, pageaddr,
-                                 ARMMMUIdxBit_S12NSE1 |
-                                 ARMMMUIdxBit_S12NSE0);
-    }
-}
-
 static void tlbi_aa64_vae2_write(CPUARMState *env, const ARMCPRegInfo *ri,
                                  uint64_t value)
 {
@@ -3274,6 +3287,34 @@ static void tlbi_aa64_vae1is_write(CPUARMState *env, const ARMCPRegInfo *ri,
     }
 }
 
+static void tlbi_aa64_vae1_write(CPUARMState *env, const ARMCPRegInfo *ri,
+                                 uint64_t value)
+{
+    /* Invalidate by VA, EL1&0 (AArch64 version).
+     * Currently handles all of VAE1, VAAE1, VAALE1 and VALE1,
+     * since we don't support flush-for-specific-ASID-only or
+     * flush-last-level-only.
+     */
+    ARMCPU *cpu = arm_env_get_cpu(env);
+    CPUState *cs = CPU(cpu);
+    uint64_t pageaddr = sextract64(value << 12, 0, 56);
+
+    if (tlb_force_broadcast(env)) {
+        tlbi_aa64_vae1is_write(env, NULL, value);
+        return;
+    }
+
+    if (arm_is_secure_below_el3(env)) {
+        tlb_flush_page_by_mmuidx(cs, pageaddr,
+                                 ARMMMUIdxBit_S1SE1 |
+                                 ARMMMUIdxBit_S1SE0);
+    } else {
+        tlb_flush_page_by_mmuidx(cs, pageaddr,
+                                 ARMMMUIdxBit_S12NSE1 |
+                                 ARMMMUIdxBit_S12NSE0);
+    }
+}
+
 static void tlbi_aa64_vae2is_write(CPUARMState *env, const ARMCPRegInfo *ri,
                                    uint64_t value)
 {
-- 
2.19.0

