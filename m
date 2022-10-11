Received: by 2002:ac9:4144:0:0:0:0:0 with SMTP id u4csp2892416ocg;
        Mon, 10 Oct 2022 20:43:19 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4ZKu9iDc8lljSZQ7fCb6+v7w1Us/z/omg2LovLr1BWulLe1Jcjn7NNG723aELeRP06notV
X-Received: by 2002:ac8:7f0b:0:b0:392:4001:64b3 with SMTP id f11-20020ac87f0b000000b00392400164b3mr17263972qtk.132.1665459799534;
        Mon, 10 Oct 2022 20:43:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1665459799; cv=none;
        d=google.com; s=arc-20160816;
        b=hBi4ZlocPHCeCgAfd6ZWKZONVgNAosIIF8nnaG6qCIDAjNJhmvamVzocSaIrv/ctO3
         4eL+rsyRsSyLwTA6XroqpLr9tEaOm++8snbvlPfjtoVknJO/gPbI5cudDqDdDc3keegI
         2nbG7hgV9ch8pT2pBwYpeE0fhSDOIOA8Tz0EFF1y4JDX6wlRw7XCa5inzgs9xxvYoWRU
         7/BG/S4usm691eKYjhpT8XEraHc23/2gu3oiWcvAwFHCe6wz7NiouLjF3C/qNy7UniZx
         ZpFbrekmJzzN5c4SGi3I6lJMxlLwLx6UnjeyvBNefhtw07n+K1b0CHaNBIbaRZ9YuqVE
         QEgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=bJPEC3BwoVIhsSgzWNhUHVugWdZpjXqWRjZ6hFgZtFg=;
        b=vLQhkcCZ6E15VS4GkwmRf+MXhduqSgxWusRNCJZKhawLPYIW28ufveJTf395oVGPC+
         +KJEnMoJ+OHnqNc09QmrzFZxTIOu+HlN9Eq7ndte41UqeK9apsEoIc40gJ8lFMVvNJ84
         7Qggr0oLztFd9c0lA6f4K9DfcqNH25l4lZ70tnLK50s0K3czHnRnRX7GEmJbiaSxm0dl
         o8JMg4XnNZGWu1dvQESLp58NY/77O18gTUXZRTyM1UB/Q4RhruaPhobBiHxDJD351FZV
         SuD4M0LKqJCUGMbnqHNnZNsfhWftpYOrqCgama9oWq6qJS1OjonbWP6bRrAlxmcacYi5
         /g/g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uBmYOatX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h22-20020a05620a245600b006cfb4be549csi6380003qkn.555.2022.10.10.20.43.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 10 Oct 2022 20:43:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uBmYOatX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56918 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oi6Ao-0006kZ-V0
	for alex.bennee@linaro.org; Mon, 10 Oct 2022 23:43:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59860)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oi5oI-00037e-Mw
 for qemu-arm@nongnu.org; Mon, 10 Oct 2022 23:20:02 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a]:38879)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oi5oG-000399-I7
 for qemu-arm@nongnu.org; Mon, 10 Oct 2022 23:20:02 -0400
Received: by mail-pf1-x42a.google.com with SMTP id p14so8023172pfq.5
 for <qemu-arm@nongnu.org>; Mon, 10 Oct 2022 20:20:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bJPEC3BwoVIhsSgzWNhUHVugWdZpjXqWRjZ6hFgZtFg=;
 b=uBmYOatXBQ4Gq10m3eVqeul1KfHowje7VNuDaTSNvpgmzzfvTuL4v4vPE79uDIljyT
 RbG5/4QeEh1PBkiWHIxsZZn/QGNJMvAoly/RqMgqh38vc02DhfAhAifCEHtmSAyrulNb
 J3gmCxnikJngcbuOZrWdWvEs7dY4BoKL/O7MrDpq1XR4tmgCrvim16huIIMxS5b/o0Er
 LbL8FD3QwLKEQcCckAZn1plJkG5/dmPCnKJyJUszVXfnq6Q5aGyshX8VLhRWI6gx9XXQ
 sizszswFTpzEXbhbSrYULHWWaRsRu/5iISrTdyA4aEa46HAutjoLxR5ztxg8pj6bMHiR
 g6kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bJPEC3BwoVIhsSgzWNhUHVugWdZpjXqWRjZ6hFgZtFg=;
 b=fKEbLGGDTRTc5n0SWGt+2mtvWOL2SfymY66Xnq7meeuortouUEv5x+zZzqqh4KqCIf
 oR4SSItpHw29Sv1TEMcIaLLmxXzNO2zOBU4bWyvyqfRC0tGOY4a3AZhvJa0tDb8TzdA6
 wgWfWoXH5ReglFXRAbzn4saeJ2IKVBp9XrVMxUwecQtELBcgTJ4CirRWFJnmqfejjXNq
 u8bZfHOWwhhrFe57BjCmY0Hi6w0k2/eAenkNT9qbCpj5WKXKLFVGtGaILj+urhJOrdvg
 /XPDaswJmXyVz9PkA22zmjzosZ9PD7tQZgd943rdkIWHDaKUBczAKN6jx1WkHzsotQdj
 TvJQ==
X-Gm-Message-State: ACrzQf16tBcsbR7WwGshTej7yFQnTqCf/dpg/sqSPsqCZYWWdVBIhV90
 NlwuieoHYF/Dsur23e1/aWKRgQ==
X-Received: by 2002:aa7:8d57:0:b0:562:b63c:c2ba with SMTP id
 s23-20020aa78d57000000b00562b63cc2bamr21613982pfe.29.1665458399668; 
 Mon, 10 Oct 2022 20:19:59 -0700 (PDT)
Received: from stoup.. ([2602:47:d49d:ec01:5aa4:aba1:1c91:a9b7])
 by smtp.gmail.com with ESMTPSA id
 o74-20020a62cd4d000000b0055f209690c0sm7663567pfg.50.2022.10.10.20.19.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Oct 2022 20:19:57 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v4 22/24] target/arm: Implement FEAT_HAFDBS,
 access flag portion
Date: Mon, 10 Oct 2022 20:19:09 -0700
Message-Id: <20221011031911.2408754-23-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221011031911.2408754-1-richard.henderson@linaro.org>
References: <20221011031911.2408754-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: WveZEI4e3c0w

Perform the atomic update for hardware management of the access flag.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v4: Raise permission fault if pte read-only and atomic update reqd.
    Split out dirty bit portion.
    Prepare for a single update for AF + DB.
---
 docs/system/arm/emulation.rst |   1 +
 target/arm/cpu64.c            |   1 +
 target/arm/ptw.c              | 147 +++++++++++++++++++++++++++++++---
 3 files changed, 138 insertions(+), 11 deletions(-)

diff --git a/docs/system/arm/emulation.rst b/docs/system/arm/emulation.rst
index cfb4b0768b..580e67b190 100644
--- a/docs/system/arm/emulation.rst
+++ b/docs/system/arm/emulation.rst
@@ -32,6 +32,7 @@ the following architecture extensions:
 - FEAT_FlagM (Flag manipulation instructions v2)
 - FEAT_FlagM2 (Enhancements to flag manipulation instructions)
 - FEAT_GTG (Guest translation granule size)
+- FEAT_HAFDBS (Hardware management of the access flag and dirty bit state)
 - FEAT_HCX (Support for the HCRX_EL2 register)
 - FEAT_HPDS (Hierarchical permission disables)
 - FEAT_I8MM (AArch64 Int8 matrix multiplication instructions)
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 85e0d1daf1..fe1369fe96 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -1165,6 +1165,7 @@ static void aarch64_max_initfn(Object *obj)
     cpu->isar.id_aa64mmfr0 = t;
 
     t = cpu->isar.id_aa64mmfr1;
+    t = FIELD_DP64(t, ID_AA64MMFR1, HAFDBS, 1);   /* FEAT_HAFDBS, AF only */
     t = FIELD_DP64(t, ID_AA64MMFR1, VMIDBITS, 2); /* FEAT_VMID16 */
     t = FIELD_DP64(t, ID_AA64MMFR1, VH, 1);       /* FEAT_VHE */
     t = FIELD_DP64(t, ID_AA64MMFR1, HPDS, 1);     /* FEAT_HPDS */
diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 8db635ca98..82b6ab029e 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -21,7 +21,9 @@ typedef struct S1Translate {
     bool in_secure;
     bool in_debug;
     bool out_secure;
+    bool out_rw;
     bool out_be;
+    hwaddr out_virt;
     hwaddr out_phys;
     void *out_host;
 } S1Translate;
@@ -240,6 +242,8 @@ static bool S1_ptw_translate(CPUARMState *env, S1Translate *ptw,
     uint8_t pte_attrs;
     bool pte_secure;
 
+    ptw->out_virt = addr;
+
     if (unlikely(ptw->in_debug)) {
         /*
          * From gdbstub, do not use softmmu so that we don't modify the
@@ -267,6 +271,7 @@ static bool S1_ptw_translate(CPUARMState *env, S1Translate *ptw,
             pte_secure = s2.f.attrs.secure;
         }
         ptw->out_host = NULL;
+        ptw->out_rw = false;
     } else {
         CPUTLBEntryFull *full;
         int flags;
@@ -281,6 +286,7 @@ static bool S1_ptw_translate(CPUARMState *env, S1Translate *ptw,
             goto fail;
         }
         ptw->out_phys = full->phys_addr;
+        ptw->out_rw = full->prot & PROT_WRITE;
         pte_attrs = full->pte_attrs;
         pte_secure = full->attrs.secure;
     }
@@ -324,14 +330,16 @@ static uint32_t arm_ldl_ptw(CPUARMState *env, S1Translate *ptw,
                             ARMMMUFaultInfo *fi)
 {
     CPUState *cs = env_cpu(env);
+    void *host = ptw->out_host;
     uint32_t data;
 
-    if (likely(ptw->out_host)) {
+    if (likely(host)) {
         /* Page tables are in RAM, and we have the host address. */
+        data = qatomic_read((uint32_t *)host);
         if (ptw->out_be) {
-            data = ldl_be_p(ptw->out_host);
+            data = be32_to_cpu(data);
         } else {
-            data = ldl_le_p(ptw->out_host);
+            data = le32_to_cpu(data);
         }
     } else {
         /* Page tables are in MMIO. */
@@ -357,15 +365,25 @@ static uint64_t arm_ldq_ptw(CPUARMState *env, S1Translate *ptw,
                             ARMMMUFaultInfo *fi)
 {
     CPUState *cs = env_cpu(env);
+    void *host = ptw->out_host;
     uint64_t data;
 
-    if (likely(ptw->out_host)) {
+    if (likely(host)) {
         /* Page tables are in RAM, and we have the host address. */
+#ifdef CONFIG_ATOMIC64
+        data = qatomic_read__nocheck((uint64_t *)host);
         if (ptw->out_be) {
-            data = ldq_be_p(ptw->out_host);
+            data = be64_to_cpu(data);
         } else {
-            data = ldq_le_p(ptw->out_host);
+            data = le64_to_cpu(data);
         }
+#else
+        if (ptw->out_be) {
+            data = ldq_be_p(host);
+        } else {
+            data = ldq_le_p(host);
+        }
+#endif
     } else {
         /* Page tables are in MMIO. */
         MemTxAttrs attrs = { .secure = ptw->out_secure };
@@ -386,6 +404,91 @@ static uint64_t arm_ldq_ptw(CPUARMState *env, S1Translate *ptw,
     return data;
 }
 
+static uint64_t arm_casq_ptw(CPUARMState *env, uint64_t old_val,
+                             uint64_t new_val, S1Translate *ptw,
+                             ARMMMUFaultInfo *fi)
+{
+    uint64_t cur_val;
+    void *host = ptw->out_host;
+
+    if (unlikely(!host)) {
+        fi->type = ARMFault_UnsuppAtomicUpdate;
+        fi->s1ptw = true;
+        return 0;
+    }
+
+    /*
+     * Raising a stage2 Protection fault for an atomic update to a read-only
+     * page is delayed until it is certain that there is a change to make.
+     */
+    if (unlikely(!ptw->out_rw)) {
+        int flags;
+        void *discard;
+
+        env->tlb_fi = fi;
+        flags = probe_access_flags(env, ptw->out_virt, MMU_DATA_STORE,
+                                   arm_to_core_mmu_idx(ptw->in_ptw_idx),
+                                   true, &discard, 0);
+        env->tlb_fi = NULL;
+
+        if (unlikely(flags & TLB_INVALID_MASK)) {
+            assert(fi->type != ARMFault_None);
+            fi->s2addr = ptw->out_virt;
+            fi->stage2 = true;
+            fi->s1ptw = true;
+            fi->s1ns = ptw->in_secure;
+            return 0;
+        }
+
+        /* In case CAS mismatches and we loop, remember writability. */
+        ptw->out_rw = true;
+    }
+
+#ifdef CONFIG_ATOMIC64
+    if (ptw->out_be) {
+        old_val = cpu_to_be64(old_val);
+        new_val = cpu_to_be64(new_val);
+        cur_val = qatomic_cmpxchg__nocheck((uint64_t *)host, old_val, new_val);
+        cur_val = be64_to_cpu(cur_val);
+    } else {
+        old_val = cpu_to_le64(old_val);
+        new_val = cpu_to_le64(new_val);
+        cur_val = qatomic_cmpxchg__nocheck((uint64_t *)host, old_val, new_val);
+        cur_val = le64_to_cpu(cur_val);
+    }
+#else
+    /*
+     * We can't support the full 64-bit atomic cmpxchg on the host.
+     * Because this is only used for FEAT_HAFDBS, which is only for AA64,
+     * we know that TCG_OVERSIZED_GUEST is set, which means that we are
+     * running in round-robin mode and could only race with dma i/o.
+     */
+#ifndef TCG_OVERSIZED_GUEST
+# error "Unexpected configuration"
+#endif
+    bool locked = qemu_mutex_iothread_locked();
+    if (!locked) {
+       qemu_mutex_lock_iothread();
+    }
+    if (ptw->out_be) {
+        cur_val = ldq_be_p(host);
+        if (cur_val == old_val) {
+            stq_be_p(host, new_val);
+        }
+    } else {
+        cur_val = ldq_le_p(host);
+        if (cur_val == old_val) {
+            stq_le_p(host, new_val);
+        }
+    }
+    if (!locked) {
+        qemu_mutex_unlock_iothread();
+    }
+#endif
+
+    return cur_val;
+}
+
 static bool get_level1_table_address(CPUARMState *env, ARMMMUIdx mmu_idx,
                                      uint32_t *table, uint32_t address)
 {
@@ -1079,7 +1182,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
     uint32_t el = regime_el(env, mmu_idx);
     uint64_t descaddrmask;
     bool aarch64 = arm_el_is_aa64(env, el);
-    uint64_t descriptor;
+    uint64_t descriptor, new_descriptor;
     bool nstable;
 
     /* TODO: This code does not support shareability levels. */
@@ -1286,7 +1389,9 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
     if (fi->type != ARMFault_None) {
         goto do_fault;
     }
+    new_descriptor = descriptor;
 
+ restart_atomic_update:
     if (!(descriptor & 1) || (!(descriptor & 2) && (level == 3))) {
         /* Invalid, or the Reserved level 3 encoding */
         goto do_translation_fault;
@@ -1362,10 +1467,18 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
      * Here descaddr is the final physical address, and attributes
      * are all in attrs.
      */
-    if ((attrs & (1 << 10)) == 0) {
-        /* Access flag */
-        fi->type = ARMFault_AccessFlag;
-        goto do_fault;
+    if (!(attrs & (1 << 10)) && !ptw->in_debug) {
+        /*
+         * Access flag.
+         * If HA is enabled, prepare to update the descriptor below.
+         * Otherwise, pass the access fault on to software.
+         */
+        if (param.ha) {
+            new_descriptor |= 1 << 10; /* AF */
+        } else {
+            fi->type = ARMFault_AccessFlag;
+            goto do_fault;
+        }
     }
 
     ap = extract32(attrs, 6, 2);
@@ -1381,6 +1494,18 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
         result->f.prot = get_S1prot(env, mmu_idx, aarch64, ap, ns, xn, pxn);
     }
 
+    /* If FEAT_HAFDBS has made changes, update the PTE. */
+    if (new_descriptor != descriptor) {
+        new_descriptor = arm_casq_ptw(env, descriptor, new_descriptor, ptw, fi);
+        if (fi->type != ARMFault_None) {
+            goto do_fault;
+        }
+        if (new_descriptor != descriptor) {
+            descriptor = new_descriptor;
+            goto restart_atomic_update;
+        }
+    }
+
     if (!(result->f.prot & (1 << access_type))) {
         fi->type = ARMFault_Permission;
         goto do_fault;
-- 
2.34.1

