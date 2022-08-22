Received: by 2002:a17:906:9c0a:0:0:0:0 with SMTP id ff10csp1036242ejc;
        Mon, 22 Aug 2022 10:15:27 -0700 (PDT)
X-Google-Smtp-Source: AA6agR52TE5UGf6sxo9XvlC+Pvi/nFEBg6VubLD9XRd43j+h4RpdvchFgZGiowJb+CQDpXqz3L4q
X-Received: by 2002:a05:620a:1a97:b0:6b8:8aa2:7f23 with SMTP id bl23-20020a05620a1a9700b006b88aa27f23mr13052488qkb.286.1661188527090;
        Mon, 22 Aug 2022 10:15:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1661188527; cv=none;
        d=google.com; s=arc-20160816;
        b=LUgU4StBahYm8yfJQc6F6LyIDuIlYxsPf+nBJLseuTtW9mF36qx2TjbCLBgPArJX8u
         Tic8FFpQTfT7i4U4BbM4a9ixOmvJ3Jn8ytEQW6yVqgzTS6R0NKqAmJluJXRmZq+k/uaA
         VP0B+4mS8TLDUJlz/KbZzT3zagsXMGGbA/UwcwNIx88+z589L801fe4MZdkmyOyguuYS
         KC0cqDy/yZ+hJM3mv3IY28emohOxc+mZt7C05l7DcZFbvHIitAzVluh07mOWDUIpZuTw
         wRIrCbqKftIcn6lY9Z4dsfjiJdutOQcGd+TJ+yy1NTz4nOs7pf+XmwF97bHIJgNEnBOg
         iouQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=izCCuU3gf6AuQLDLTtnxcsJhF9AvhqthHQ21e7M+uSM=;
        b=KzxesHlYOIvqDWYMwT8q6txRnr0Y+dhEWbCleOb7wbS6plvdeT2DlTZ60PGlVuFbeb
         AwLeiHUIZRGwr0eBmLo3E5pK9ey2oSS4z8T7a3HwAviN0Dx+jjJYRWc5yQ9e/bS/osMo
         Mm7y3Di+9WdMojXqQvODS88mGiCTTffAc52/KJ+g7I7kPyFdC6Iw/0TOMvmzdCvBpBf9
         e9fRHY+MG4MVd7l8RetTvA0416A1L/FI1yw6T4Y7khteKyPEgEX65u1PrOxmE2YYFGTB
         blpoIYDhyEBIvihQvBOmqA6bnere358p6lEKhy4NH97JIvjeh840nHUKTmqLM1Hp8SR3
         szwg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SaO8ygmG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d22-20020ac800d6000000b0031eb969344bsi5123946qtg.559.2022.08.22.10.15.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 22 Aug 2022 10:15:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SaO8ygmG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53394 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oQB1K-0002hy-DI
	for alex.bennee@linaro.org; Mon, 22 Aug 2022 13:15:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39436)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQ9PB-0004ts-Lt
 for qemu-arm@nongnu.org; Mon, 22 Aug 2022 11:31:58 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629]:33453)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQ9P0-0001iV-5S
 for qemu-arm@nongnu.org; Mon, 22 Aug 2022 11:31:57 -0400
Received: by mail-pl1-x629.google.com with SMTP id 2so10279011pll.0
 for <qemu-arm@nongnu.org>; Mon, 22 Aug 2022 08:31:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=izCCuU3gf6AuQLDLTtnxcsJhF9AvhqthHQ21e7M+uSM=;
 b=SaO8ygmGMmeUluxN38vfjTiItjvH1m0NHI0Lb/kUEb+KQnzN/Z7U7RQXJe+6NOPMlz
 3UwlxziREax1bZfyRoA09D/pluLkOeviYUuHHl0JjhzCpvoLEdL3YM0KFnPXwkUhR8th
 WitbLrgAa6Yl+oX+OQ80yv4ApjJ567niBY5J7+4vFj961ewKAL8QwirEwoF0TqAsG8op
 buC2nUTDFdxmiq/GmPOTOIuJKXxjjVqZrCmoiw8A9k9jMLrWj7Y2t5SQU4c3AFtGkTMl
 GWp6mRdM9I8s6qLLOHwSH5yJl8MygyogUKBtQseldEfDFSfSmgQ8reJlt0CFUB0vMxjY
 TuBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=izCCuU3gf6AuQLDLTtnxcsJhF9AvhqthHQ21e7M+uSM=;
 b=8RrPV+e7ZVridPPfwMJfrTaDwktt1Q2v16chEv+LQKqVGKN8zGR7tASarYEucVFmXe
 MU3hXkG4jOQJW+iL0S8EeUtjyd7pquFDW0YkeXG2vQoa9To+WxtnAGG5GGEO9nSWy77d
 06ZhLxqBQx4GoAATfRR0ZhQZQ43IngrLFzxx++KCsrOQwb7YNyUKinlxnRG7haGlU2Gg
 Nf4WUZPXppM289FXpC727+qiQn/8vZBr9Jdw48Lz2UGqr5pUqOlUud5cf9/nyhMQNgTP
 kICyAzFTIA3VeCoPZoh2KqrxpwM/smPxMc7fDY6oxc6w8XlO/b4FOVw3eVMQSoi1TTOn
 GD0w==
X-Gm-Message-State: ACgBeo1irPbRwWXCvXTRiYnrBVU/wkFwYxdgFy7wO2O3JUx2wlv1IVl6
 feOXT94O78SBcfqGFeZ8ajNiyw==
X-Received: by 2002:a17:902:f606:b0:172:9c81:d788 with SMTP id
 n6-20020a170902f60600b001729c81d788mr20446546plg.42.1661182299220; 
 Mon, 22 Aug 2022 08:31:39 -0700 (PDT)
Received: from stoup.. ([71.212.157.236]) by smtp.gmail.com with ESMTPSA id
 i6-20020a17090a3d8600b001f262f6f717sm10353835pjc.3.2022.08.22.08.31.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Aug 2022 08:31:38 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v2 66/66] target/arm: Implement FEAT_HAFDBS
Date: Mon, 22 Aug 2022 08:27:41 -0700
Message-Id: <20220822152741.1617527-67-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220822152741.1617527-1-richard.henderson@linaro.org>
References: <20220822152741.1617527-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
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
X-TUID: dgtNU9xqs/iG

Perform the atomic update for hardware management of the access flag
and the dirty bit.

A limitation of the implementation so far is that the page table
itself must already be writable, i.e. the dirty bit for the stage2
page table must already be set, i.e. we cannot set both dirty bits
at the same time.

This is allowed because it is CONSTRAINED UNPREDICTABLE whether any
atomic update happens at all.  The implementation is allowed to simply
fall back on software update at any time.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 docs/system/arm/emulation.rst |   1 +
 target/arm/cpu64.c            |   1 +
 target/arm/ptw.c              | 115 ++++++++++++++++++++++++++++++++--
 3 files changed, 113 insertions(+), 4 deletions(-)

diff --git a/docs/system/arm/emulation.rst b/docs/system/arm/emulation.rst
index 8e494c8bea..3eee95c39b 100644
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
index 78e27f778a..98771918c2 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -1037,6 +1037,7 @@ static void aarch64_max_initfn(Object *obj)
     cpu->isar.id_aa64mmfr0 = t;
 
     t = cpu->isar.id_aa64mmfr1;
+    t = FIELD_DP64(t, ID_AA64MMFR1, HAFDBS, 2);   /* FEAT_HAFDBS */
     t = FIELD_DP64(t, ID_AA64MMFR1, VMIDBITS, 2); /* FEAT_VMID16 */
     t = FIELD_DP64(t, ID_AA64MMFR1, VH, 1);       /* FEAT_VHE */
     t = FIELD_DP64(t, ID_AA64MMFR1, HPDS, 1);     /* FEAT_HPDS */
diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index c38c7d2a65..c81c51f60c 100644
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
@@ -221,6 +222,8 @@ static bool S1_ptw_translate(CPUARMState *env, ARMMMUIdx mmu_idx,
         return false;
     }
 
+    res->rw = full->prot & PAGE_WRITE;
+
     if (s2_mmu_idx == ARMMMUIdx_Stage2 || s2_mmu_idx == ARMMMUIdx_Stage2_S) {
         uint64_t hcr = arm_hcr_el2_eff_secstate(env, is_secure);
         uint8_t s2attrs = full->pte_attrs;
@@ -333,6 +336,56 @@ static uint64_t arm_ldq_ptw(CPUARMState *env, const S1TranslateResult *s1,
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
@@ -1240,6 +1293,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
         goto do_fault;
     }
 
+ restart_atomic_update:
     if (!(descriptor & 1) || (!(descriptor & 2) && (level == 3))) {
         /* Invalid, or the Reserved level 3 encoding */
         goto do_translation_fault;
@@ -1317,8 +1371,26 @@ static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
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
@@ -1335,8 +1407,43 @@ static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
     }
 
     if (!(result->f.prot & (1 << access_type))) {
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
+        result->f.prot |= 1 << MMU_DATA_STORE;
     }
 
     if (ns) {
-- 
2.34.1

