Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79506C87FD3
	for <qemu-arm@archiver.kernel.org>; Sat,  2 Aug 2025 23:56:11 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uiLjl-0005Hx-9B; Sat, 02 Aug 2025 19:34:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uiLi1-0000XJ-Kl
 for qemu-arm@nongnu.org; Sat, 02 Aug 2025 19:32:13 -0400
Received: from mail-ot1-x32c.google.com ([2607:f8b0:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uiLhz-00059H-ME
 for qemu-arm@nongnu.org; Sat, 02 Aug 2025 19:32:13 -0400
Received: by mail-ot1-x32c.google.com with SMTP id
 46e09a7af769-741a6272c8fso140860a34.3
 for <qemu-arm@nongnu.org>; Sat, 02 Aug 2025 16:32:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1754177530; x=1754782330; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1d9dQVqrNWqrEXWej/JwzyJrCDkscWOsMBodTniFYpE=;
 b=oIyUWgZzkuy2d9Vt4lH7cY47dld5bwbnWIzvC1V4GFFFy9si6dXqSXmop8j/Anzp9T
 25akouLFLthqxIKUUb8GjM1EsnT+c+FcEr9bNML4MQcvdWq64lQwwV3593H/+B2oIRU2
 7f84bjUU/1QAkZ7pv1wLA/sxv/F2zsXHsuMwnLwNZJVRzPc57oJgyQwDSt63LpGK5oWD
 MPiborCptozRYMwVm/xCG0iapHHOlVgkabAX+BO7Xmx20MhtpWh25FWnvzpu9YqB518q
 AckrN/YDntEs1so9WkGVhVTt+OYhzgv38NnbfiPU9fAitY0fAdsyYkOH6wcFuIcxntvI
 T9pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754177530; x=1754782330;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1d9dQVqrNWqrEXWej/JwzyJrCDkscWOsMBodTniFYpE=;
 b=nTHZu9ETtYNy3RTVkz0Q3RYf9fPSZdM5EUaQaCPGFcs9jMt7Hhb0bNQuny1afeisQO
 s60vm4CAWW/L3XmO0H79mliYs5Lp5jxpmIYB87HInqK8mVcStfgJzVPeGtrjKFF2N5KG
 NG6zVnVhjCBWh6+8fnGoqnNTtSHLm4h0LAyxv3hlUoOMaNtOIwURmcGx3jMPo3Zd2L2/
 B8txfn6pIQ3Fn3dsipR3F5O37KlhxQ182OlyDWj31DIsmOIQboA+yFjnJXMmYxUGEjuU
 5h8PKKzNnVkkT4bcNftfUX52jiVMRJn0tZTEi2Ydq3581vxHPUWk4po0U75UZLT8Gx7O
 dmug==
X-Gm-Message-State: AOJu0Yw6x/n+ff7/kdz2iAQwutO7GOd81pdpfxXO7H/ukTuRKM1jjf1v
 nAUFJFZyauijMZXYZ6E3uSv+dRm0e7f1X7VDMakELmx7J5HXKrKXZvhDWtHHZXbJLJg=
X-Gm-Gg: ASbGncuyqHXtE6ZieYyqmv0g/i+7kOw1kOzgDrKqCHn2EPcgLhrvyDvAtk5w79WNw2N
 NIQOMrJaCV1UHdokohEWa7FNMAWV2drcD/NLM/Pk3l5z/tqWoDV9OMdhzdWc8Fs7FtGMdwqbYeP
 atF6wzPLIEHcpQEMRK4bwieHBRhmlLsgVhiWm9l5xLZcpU4OcmKtPRbRf+UR6p2NbjO/ulBnSrN
 dNdhSgVR/Tp2Ztd6A7VCOKcNw/ILQ0hmN9ka4G5RNldVlb5FfVs7Xv7WlB/rerx2PLngYovoSki
 LniRdGZon7eEZwqRohsZHD/5kgSY0eFGd0cmyJtSs8oUtPFqJTWgJnCxsQenxXGd7Arw8hNLjO1
 a4mofLtwuI0ObU8jYigzRIFrHu4VyOC6vh/XaZJ/OP5ASnMkP1JMu
X-Google-Smtp-Source: AGHT+IHgcPZ5Lzyeh1ys/R0BlrxMmuQonLdotkK3Mu5rKHzjSEd9UKKV2Vae2U+3ukwyRWoOd1spHA==
X-Received: by 2002:a05:6871:4519:b0:308:51fe:ea07 with SMTP id
 586e51a60fabf-30b67558bf1mr2385170fac.1.1754177530420; 
 Sat, 02 Aug 2025 16:32:10 -0700 (PDT)
Received: from stoup.. ([172.58.111.133]) by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-30b8e3c9b32sm71031fac.24.2025.08.02.16.32.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Aug 2025 16:32:10 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v2 27/85] include/hw/core/cpu: Introduce cpu_tlb_fast
Date: Sun,  3 Aug 2025 09:28:55 +1000
Message-ID: <20250802232953.413294-28-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250802232953.413294-1-richard.henderson@linaro.org>
References: <20250802232953.413294-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32c;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x32c.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Encapsulate access to cpu->neg.tlb.f[] in a function.

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/hw/core/cpu.h        |  7 +++++++
 accel/tcg/cputlb.c           | 16 ++++++++--------
 tcg/aarch64/tcg-target.c.inc |  2 +-
 tcg/arm/tcg-target.c.inc     |  2 +-
 4 files changed, 17 insertions(+), 10 deletions(-)

diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index 1153cadb70..bd835b07d5 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -593,6 +593,13 @@ static inline CPUArchState *cpu_env(CPUState *cpu)
     return (CPUArchState *)(cpu + 1);
 }
 
+#ifdef CONFIG_TCG
+static inline CPUTLBDescFast *cpu_tlb_fast(CPUState *cpu, int mmu_idx)
+{
+    return &cpu->neg.tlb.f[mmu_idx];
+}
+#endif
+
 typedef QTAILQ_HEAD(CPUTailQ, CPUState) CPUTailQ;
 extern CPUTailQ cpus_queue;
 
diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index d324f33339..2a6aa01c57 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -129,7 +129,7 @@ static inline uint64_t tlb_addr_write(const CPUTLBEntry *entry)
 static inline uintptr_t tlb_index(CPUState *cpu, uintptr_t mmu_idx,
                                   vaddr addr)
 {
-    uintptr_t size_mask = cpu->neg.tlb.f[mmu_idx].mask >> CPU_TLB_ENTRY_BITS;
+    uintptr_t size_mask = cpu_tlb_fast(cpu, mmu_idx)->mask >> CPU_TLB_ENTRY_BITS;
 
     return (addr >> TARGET_PAGE_BITS) & size_mask;
 }
@@ -138,7 +138,7 @@ static inline uintptr_t tlb_index(CPUState *cpu, uintptr_t mmu_idx,
 static inline CPUTLBEntry *tlb_entry(CPUState *cpu, uintptr_t mmu_idx,
                                      vaddr addr)
 {
-    return &cpu->neg.tlb.f[mmu_idx].table[tlb_index(cpu, mmu_idx, addr)];
+    return &cpu_tlb_fast(cpu, mmu_idx)->table[tlb_index(cpu, mmu_idx, addr)];
 }
 
 static void tlb_window_reset(CPUTLBDesc *desc, int64_t ns,
@@ -292,7 +292,7 @@ static void tlb_flush_one_mmuidx_locked(CPUState *cpu, int mmu_idx,
                                         int64_t now)
 {
     CPUTLBDesc *desc = &cpu->neg.tlb.d[mmu_idx];
-    CPUTLBDescFast *fast = &cpu->neg.tlb.f[mmu_idx];
+    CPUTLBDescFast *fast = cpu_tlb_fast(cpu, mmu_idx);
 
     tlb_mmu_resize_locked(desc, fast, now);
     tlb_mmu_flush_locked(desc, fast);
@@ -331,7 +331,7 @@ void tlb_init(CPUState *cpu)
     cpu->neg.tlb.c.dirty = 0;
 
     for (i = 0; i < NB_MMU_MODES; i++) {
-        tlb_mmu_init(&cpu->neg.tlb.d[i], &cpu->neg.tlb.f[i], now);
+        tlb_mmu_init(&cpu->neg.tlb.d[i], cpu_tlb_fast(cpu, i), now);
     }
 }
 
@@ -342,7 +342,7 @@ void tlb_destroy(CPUState *cpu)
     qemu_spin_destroy(&cpu->neg.tlb.c.lock);
     for (i = 0; i < NB_MMU_MODES; i++) {
         CPUTLBDesc *desc = &cpu->neg.tlb.d[i];
-        CPUTLBDescFast *fast = &cpu->neg.tlb.f[i];
+        CPUTLBDescFast *fast = cpu_tlb_fast(cpu, i);
 
         g_free(fast->table);
         g_free(desc->fulltlb);
@@ -667,7 +667,7 @@ static void tlb_flush_range_locked(CPUState *cpu, int midx,
                                    unsigned bits)
 {
     CPUTLBDesc *d = &cpu->neg.tlb.d[midx];
-    CPUTLBDescFast *f = &cpu->neg.tlb.f[midx];
+    CPUTLBDescFast *f = cpu_tlb_fast(cpu, midx);
     vaddr mask = MAKE_64BIT_MASK(0, bits);
 
     /*
@@ -923,7 +923,7 @@ void tlb_reset_dirty(CPUState *cpu, uintptr_t start, uintptr_t length)
     qemu_spin_lock(&cpu->neg.tlb.c.lock);
     for (mmu_idx = 0; mmu_idx < NB_MMU_MODES; mmu_idx++) {
         CPUTLBDesc *desc = &cpu->neg.tlb.d[mmu_idx];
-        CPUTLBDescFast *fast = &cpu->neg.tlb.f[mmu_idx];
+        CPUTLBDescFast *fast = cpu_tlb_fast(cpu, mmu_idx);
         unsigned int n = tlb_n_entries(fast);
         unsigned int i;
 
@@ -1316,7 +1316,7 @@ static bool victim_tlb_hit(CPUState *cpu, size_t mmu_idx, size_t index,
 
         if (cmp == page) {
             /* Found entry in victim tlb, swap tlb and iotlb.  */
-            CPUTLBEntry tmptlb, *tlb = &cpu->neg.tlb.f[mmu_idx].table[index];
+            CPUTLBEntry tmptlb, *tlb = &cpu_tlb_fast(cpu, mmu_idx)->table[index];
 
             qemu_spin_lock(&cpu->neg.tlb.c.lock);
             copy_tlb_helper_locked(&tmptlb, tlb);
diff --git a/tcg/aarch64/tcg-target.c.inc b/tcg/aarch64/tcg-target.c.inc
index 3b088b7bd9..caf79c742d 100644
--- a/tcg/aarch64/tcg-target.c.inc
+++ b/tcg/aarch64/tcg-target.c.inc
@@ -1668,7 +1668,7 @@ static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, HostAddress *h,
         ldst->oi = oi;
         ldst->addr_reg = addr_reg;
 
-        /* Load cpu->neg.tlb.f[mmu_idx].{mask,table} into {tmp0,tmp1}. */
+        /* Load CPUTLBDescFast.{mask,table} into {tmp0,tmp1}. */
         QEMU_BUILD_BUG_ON(offsetof(CPUTLBDescFast, mask) != 0);
         QEMU_BUILD_BUG_ON(offsetof(CPUTLBDescFast, table) != 8);
         tcg_out_insn(s, 3314, LDP, TCG_REG_TMP0, TCG_REG_TMP1, TCG_AREG0,
diff --git a/tcg/arm/tcg-target.c.inc b/tcg/arm/tcg-target.c.inc
index 836894b16a..4069508272 100644
--- a/tcg/arm/tcg-target.c.inc
+++ b/tcg/arm/tcg-target.c.inc
@@ -1420,7 +1420,7 @@ static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, HostAddress *h,
         ldst->oi = oi;
         ldst->addr_reg = addr;
 
-        /* Load cpu->neg.tlb.f[mmu_idx].{mask,table} into {r0,r1}.  */
+        /* Load CPUTLBDescFast.{mask,table} into {r0,r1}.  */
         QEMU_BUILD_BUG_ON(offsetof(CPUTLBDescFast, mask) != 0);
         QEMU_BUILD_BUG_ON(offsetof(CPUTLBDescFast, table) != 4);
         tcg_out_ldrd_8(s, COND_AL, TCG_REG_R0, TCG_AREG0, fast_off);
-- 
2.43.0


