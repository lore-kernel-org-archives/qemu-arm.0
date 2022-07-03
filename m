Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp2458928lft;
        Sun, 3 Jul 2022 02:30:15 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tKa8RdfwmboN7n3uMAl61497H+Cq9anq0Etlzdn1l7pZxeVb1GM4YBgzAPwZc7KOdSng/Q
X-Received: by 2002:a25:d043:0:b0:66e:31d6:4606 with SMTP id h64-20020a25d043000000b0066e31d64606mr3746265ybg.241.1656840615549;
        Sun, 03 Jul 2022 02:30:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656840615; cv=none;
        d=google.com; s=arc-20160816;
        b=axkyr5BDdhSebsFDxgQdLpA5xEXpdlDwHQdgUIHA7eeJ3d/Q4wq2hLDo+jFzsxukLT
         ORi3W457860mEJ7ljwAMEYIdIsKPYEMqLxPyAysq4J1mOgwbAVcANjXhsiAqzQUGkrrd
         J4MD9jxW663+9x3774MhNUx+DqR3QIujxGepxii2bmc+nGD30qdtaDJF0O++qelrWBVQ
         HZwsIrT5Lc3Jtc9qvPk+VL+td4lo7erNjHoBK5wK02IxJShMuV9ByignGew4iQzl7E3Z
         q3KDuYHiSORCem5iZawKOSN5TSjal6hivdlN7730qDTjXPGoJyokUCxYot1GOH4nAUcD
         ZWzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=7/Z8gbQenSvpu+j6hmlZ/8di1MxPW1VxNbRQmZjhvR4=;
        b=fd7teXrWqV0lJsZWbGrgSnNCYfb5XVF/87Q596EcGE2mAEIznNSvzT9fIHTlh4nTw8
         jC3+sHDxlryY8DwNjUONbM7ouxCysKa4rPbO4JvruO8Wi6HGU+iOBNQC01R/F7dxz8oG
         jjCyrmPhONoZWUDw+O0eTcxdVL/ePooP7/KGIz44ZkL5geRVvD/LWli8by8kS1ChMo35
         BA/cd09j5tn6+5J2TYOqYPahRUZVNkyAC5hlpLZwtGa4c4L6/tLo9Zp5iuvlzp1RHwHb
         YzaT2ub/bNC/O9zmNDldYoT91+7dNejWxpe36LNJy6ti3zkquzZaU4s6wTLsZS56gi47
         c9Eg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fkRvBdXw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o141-20020a254193000000b0065d672caf5csi4155824yba.584.2022.07.03.02.30.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 03 Jul 2022 02:30:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fkRvBdXw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48440 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o7vvi-0007Li-QO
	for alex.bennee@linaro.org; Sun, 03 Jul 2022 05:30:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54992)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o7v00-0002C4-UL
 for qemu-arm@nongnu.org; Sun, 03 Jul 2022 04:30:39 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:53800)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o7uzz-00072c-2h
 for qemu-arm@nongnu.org; Sun, 03 Jul 2022 04:30:36 -0400
Received: by mail-pj1-x102f.google.com with SMTP id ju17so1432095pjb.3
 for <qemu-arm@nongnu.org>; Sun, 03 Jul 2022 01:30:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7/Z8gbQenSvpu+j6hmlZ/8di1MxPW1VxNbRQmZjhvR4=;
 b=fkRvBdXwYldU43aVr6whfmoNdoJqe+/U9Al13yIqcgoJJ+TAEt8rXOHG4hZ4XJbCi2
 E/5q6v/1k9Yq9wYVkBdj70TlwplWOg908pJ22zlSfWNM8h4WlL03Ato/oXF9wLV4O4fI
 Rqjcn0I4/7VPNmXGsiMlxu8W4H+UvW2EY7rcdCrLU91+gjGMLqs5U1+oB+NF0SE6/j/c
 S1LcSAjnfqbadFi9p6U2vrS/vjSPTj/Q0ko7aVHsx00l615aKXgSWuQt7W1NgUIUCDal
 7SEZk0Zxaat75xyNwljAbyRi2S03BZVnX3PyyxPwriKIrJSkQvOISP/Y4kfPdr8Gb3II
 RqlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7/Z8gbQenSvpu+j6hmlZ/8di1MxPW1VxNbRQmZjhvR4=;
 b=2jUgJke1Pun6Ws0v+ckx/4WQmgDl/GKsD39cgwJ0Z5kllO0BSwF6Lu2+b11RXI35dU
 qz2YFLaD/V23LxoK7cd9GAyVI9PGupgMTtThIRgc1pnUQYZaKIfLZcBuySWA6d8B5/ui
 8Q3z5R+G/yfGK0AgrP4PQWgl6tNy7zFvAI/G9L5hSd/1rI+JEFQjoe5IesckDYA1qD6Q
 2j1LXS/IxpLiMJQZw9Cqn5qX82G7kuXnZEJqa3vI6iRmWVHEGFmw5gT5LYQBVjmV84Kd
 V1qwQVG0kFABxmb1A9IChGh7rA4ecEjTXj+oFZaI+jsCHdwx6jCsQGRzmt6xcxZNWCLW
 BmgQ==
X-Gm-Message-State: AJIora8Rg3zDwIuiFnJgJzwA7GIB2uODyulTYX2xl3q/5Hm8o79v65Oy
 8LOjrx/gDVPmxnzCH5+lpxPW1Zvl0T1jIL1n
X-Received: by 2002:a17:903:1108:b0:16a:a0ab:8f89 with SMTP id
 n8-20020a170903110800b0016aa0ab8f89mr29922369plh.12.1656837033786; 
 Sun, 03 Jul 2022 01:30:33 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 g6-20020a1709026b4600b0016788487357sm18574523plt.132.2022.07.03.01.30.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Jul 2022 01:30:33 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 62/62] target/arm: Implement FEAT_HAFDBS
Date: Sun,  3 Jul 2022 13:54:19 +0530
Message-Id: <20220703082419.770989-63-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220703082419.770989-1-richard.henderson@linaro.org>
References: <20220703082419.770989-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 1/25tFMxHWzQ

Perform the atomic update for hardware management of the
access flag and the dirty bit.

A limitation of the implementation so far is that the
page table must itself be writable.  This is allowed because
it is CONSTRAINED UNPREDICTABLE whether any atomic update
happens at all.  Any implementation is allowed to simply
fall back on software update at any time.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 docs/system/arm/emulation.rst |   1 +
 target/arm/cpu64.c            |   1 +
 target/arm/ptw.c              | 128 ++++++++++++++++++++++++++++++++--
 3 files changed, 123 insertions(+), 7 deletions(-)

diff --git a/docs/system/arm/emulation.rst b/docs/system/arm/emulation.rst
index 83b4410065..ccbb61feb1 100644
--- a/docs/system/arm/emulation.rst
+++ b/docs/system/arm/emulation.rst
@@ -30,6 +30,7 @@ the following architecture extensions:
 - FEAT_FRINTTS (Floating-point to integer instructions)
 - FEAT_FlagM (Flag manipulation instructions v2)
 - FEAT_FlagM2 (Enhancements to flag manipulation instructions)
+- FEAT_HAFDBS (Hardware management of the access flag and dirty bit state)
 - FEAT_HCX (Support for the HCRX_EL2 register)
 - FEAT_HPDS (Hierarchical permission disables)
 - FEAT_I8MM (AArch64 Int8 matrix multiplication instructions)
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 19188d6cc2..0eb2e46bbc 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -1030,6 +1030,7 @@ static void aarch64_max_initfn(Object *obj)
     cpu->isar.id_aa64mmfr0 = t;
 
     t = cpu->isar.id_aa64mmfr1;
+    t = FIELD_DP64(t, ID_AA64MMFR1, HAFDBS, 2);   /* FEAT_HAFDBS */
     t = FIELD_DP64(t, ID_AA64MMFR1, VMIDBITS, 2); /* FEAT_VMID16 */
     t = FIELD_DP64(t, ID_AA64MMFR1, VH, 1);       /* FEAT_VHE */
     t = FIELD_DP64(t, ID_AA64MMFR1, HPDS, 1);     /* FEAT_HPDS */
diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 07ed49bd70..608956bee6 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -193,6 +193,7 @@ static bool regime_translation_disabled(CPUARMState *env, ARMMMUIdx mmu_idx,
 typedef struct {
     bool is_secure;
     bool be;
+    bool rw;
     void *hphys;
     hwaddr gphys;
 } S1TranslateResult;
@@ -205,11 +206,12 @@ static bool S1_ptw_translate(CPUARMState *env, ARMMMUIdx mmu_idx,
 {
     MemTxAttrs attrs = {};
     PageEntryExtra extra;
-    int flags;
+    CPUTLBEntry *entry;
+    int flags, s2_core_idx;
 
     env->tlb_fi = fi;
-    flags = probe_access_extra(env, addr, MMU_DATA_LOAD,
-                               arm_to_core_mmu_idx(s2_mmu_idx),
+    s2_core_idx = arm_to_core_mmu_idx(s2_mmu_idx);
+    flags = probe_access_extra(env, addr, MMU_DATA_LOAD, s2_core_idx,
                                true, &res->hphys, &attrs, &extra, 0);
     env->tlb_fi = NULL;
 
@@ -222,6 +224,14 @@ static bool S1_ptw_translate(CPUARMState *env, ARMMMUIdx mmu_idx,
         return false;
     }
 
+    /*
+     * The page must be in the tlb, because we just probed it.
+     * Remember if the page is also writable, for FEAT_HAFDBS.
+     */
+    entry = tlb_entry(env, s2_core_idx, addr);
+    assert(tlb_hit(entry->addr_read, addr));
+    res->rw = tlb_hit(tlb_addr_write(entry), addr);
+
     if (s2_mmu_idx == ARMMMUIdx_Stage2 || s2_mmu_idx == ARMMMUIdx_Stage2_S) {
         uint64_t hcr = arm_hcr_el2_eff_secstate(env, is_secure);
         uint8_t s2attrs = FIELD_EX64(extra.x, PAGEENTRYEXTRA, ATTRS);
@@ -334,6 +344,56 @@ static uint64_t arm_ldq_ptw(CPUARMState *env, const S1TranslateResult *s1,
     return data;
 }
 
+static uint64_t arm_casq_ptw(CPUARMState *env, uint64_t old_val,
+                             uint64_t new_val, const S1TranslateResult *s1,
+                             ARMMMUFaultInfo *fi)
+{
+    uint64_t cur_val;
+
+    if (unlikely(!s1->hphys)) {
+        fi->type = ARMFault_UnsuppAtomicUpdate;
+        fi->s1ptw = true;
+        return 0;
+    }
+
+#ifndef CONFIG_ATOMIC64
+    /*
+     * We can't support the atomic operation on the host.  We should be
+     * running in round-robin mode though, which means that we would only
+     * race with dma i/o.
+     */
+    qemu_mutex_lock_iothread();
+    if (s1->be) {
+        cur_val = ldq_be_p(s1->hphys);
+        if (cur_val == old_val) {
+            stq_be_p(s1->hphys, new_val);
+        }
+    } else {
+        cur_val = ldq_le_p(s1->hphys);
+        if (cur_val == old_val) {
+            stq_le_p(s1->hphys, new_val);
+        }
+    }
+    qemu_mutex_unlock_iothread();
+#else
+    if (s1->be) {
+        old_val = cpu_to_be64(old_val);
+        new_val = cpu_to_be64(new_val);
+        cur_val = qatomic_cmpxchg__nocheck((uint64_t *)s1->hphys,
+                                           old_val, new_val);
+        cur_val = be64_to_cpu(cur_val);
+    } else {
+        old_val = cpu_to_le64(old_val);
+        new_val = cpu_to_le64(new_val);
+        cur_val = qatomic_cmpxchg__nocheck((uint64_t *)s1->hphys,
+                                           old_val, new_val);
+        cur_val = le64_to_cpu(cur_val);
+    }
+#endif
+
+    return cur_val;
+}
+
 static bool get_level1_table_address(CPUARMState *env, ARMMMUIdx mmu_idx,
                                      uint32_t *table, uint32_t address)
 {
@@ -1237,6 +1297,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
         goto do_fault;
     }
 
+ restart_atomic_update:
     if (!(descriptor & 1) || (!(descriptor & 2) && (level == 3))) {
         /* Invalid, or the Reserved level 3 encoding */
         goto do_translation_fault;
@@ -1314,8 +1375,26 @@ static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
      */
     if ((attrs & (1 << 10)) == 0) {
         /* Access flag */
-        fi->type = ARMFault_AccessFlag;
-        goto do_fault;
+        uint64_t new_des, old_des;
+
+        /*
+         * If HA is disabled, or if the pte is not writable,
+         * pass on the access fault to software.
+         */
+        if (!param.ha || !s1.rw) {
+            fi->type = ARMFault_AccessFlag;
+            goto do_fault;
+        }
+
+        old_des = descriptor;
+        new_des = descriptor | (1 << 10); /* AF */
+        descriptor = arm_casq_ptw(env, old_des, new_des, &s1, fi);
+        if (fi->type != ARMFault_None) {
+            goto do_fault;
+        }
+        if (old_des != descriptor) {
+            goto restart_atomic_update;
+        }
     }
 
     ap = extract32(attrs, 6, 2);
@@ -1332,8 +1411,43 @@ static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
     }
 
     if (!(result->prot & (1 << access_type))) {
-        fi->type = ARMFault_Permission;
-        goto do_fault;
+        uint64_t new_des, old_des;
+
+        /* Writes may set dirty if DBM attribute is set. */
+        if (!param.hd
+            || access_type != MMU_DATA_STORE
+            || !extract64(attrs, 51, 1)  /* DBM */
+            || !s1.rw) {
+            fi->type = ARMFault_Permission;
+            goto do_fault;
+        }
+
+        old_des = descriptor;
+        if (mmu_idx == ARMMMUIdx_Stage2 || mmu_idx == ARMMMUIdx_Stage2_S) {
+            new_des = descriptor | (1ull << 7);   /* S2AP[1] */
+        } else {
+            new_des = descriptor & ~(1ull << 7);  /* AP[2] */
+        }
+
+        /*
+         * If the descriptor didn't change, then attributes weren't the
+         * reason for the permission fault, so deliver it.
+         */
+        if (old_des == new_des) {
+            fi->type = ARMFault_Permission;
+            goto do_fault;
+        }
+
+        descriptor = arm_casq_ptw(env, old_des, new_des, &s1, fi);
+        if (fi->type != ARMFault_None) {
+            goto do_fault;
+        }
+        if (old_des != descriptor) {
+            goto restart_atomic_update;
+        }
+
+        /* Success: the page is now writable. */
+        result->prot |= 1 << MMU_DATA_STORE;
     }
 
     if (ns) {
-- 
2.34.1

