Received: by 2002:a17:505:c89:b0:1be9:327d:8ee3 with SMTP id hp9csp1047787njb;
        Sat, 5 Oct 2024 08:26:00 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW+ir+nugjpQTBLrAivJ16P0GDkose2RAFa+FipFmfYkfnT3P55mXOWOKVzn7ey5z3dBEC5Lf7xVai+mg==@linaro.org
X-Received: by 2002:a17:902:d484:b0:20b:8d7f:d13 with SMTP id d9443c01a7336-20bff18bcdemr104895485ad.58.1728141960437;
        Sat, 05 Oct 2024 08:26:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1728141960; cv=none;
        d=google.com; s=arc-20240605;
        b=MJVOvayAkC1RGN5XaZkhS/9sNRkmmPJkAnEL+T5nfK8pfU7XrBZ56o6FkRGz0e0kOx
         k1fnL7E8p7RyJHB4ezRxSRdwReS03StLiMci7yMMxen1678N3gCoJSKnmlo6SRnlHY2b
         wcCiOJboPKxgRly5X9bpEvWdImqP0/q4Oj9ps9fzLjMoYVwAqoOuQUfVONauFKi0e8Y6
         VAcXAcZHwvhioUFdohUJMwQe430W+j5PHi+lK97DSBWyE1EsRna/HsRzJTUHoxf4lrRa
         7kZW7gRlfZvOmZjqQDr4priYlxvSeyMPtGQUSWVlrSY/LiltUdQ0VbXESolOTcFBpMQT
         eHNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=aSpIks7wgvzrdGiSzq/HYW4dr1jFM7gjMRozlRGemJM=;
        fh=JfsvzwRN4o+/4zvnfrqpJ/S45oN4u3bBpU3jtFSM9w0=;
        b=cPNH7x8Xhd4fQmNoiTjwXZbf6DiSotUDKxGFCW6YeomOEvCZQKiJP3pXmGZK/ZFvFz
         SWizFvJD/YPF9ZBH4xBBpOAOc6GNShZkMYnpURHiITXozRRoXR05RDoZ+p8QlPKeDndf
         flQuEEqWUysRqFMhWUT5M9f1sE9tHFv5nd6AompxKV/tN/EtKSNJTt1ppcGsG38Kz+Yv
         lrDEPjbjxYXBe7JdiMyonRUzxr9xjvmzSeV63b1Izf92f9ZflYE7Ci2IgJmmL9ums+fR
         e72S7NcIQ1GTzrrsINrWpfYAvYoBd0HSkRvRLMjCimL24+wsBSCXfCzQtpa9qDn4CJV5
         efzA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BTwroetB;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-20c138d4788sor10159815ad.8.2024.10.05.08.26.00
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 05 Oct 2024 08:26:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BTwroetB;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728141960; x=1728746760; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aSpIks7wgvzrdGiSzq/HYW4dr1jFM7gjMRozlRGemJM=;
        b=BTwroetB1R2r96QbdE78mdST07iQiJA3iezFDSQtQu6ualT7/dNVCQl/DvosZpXi4P
         4BEmYdPiB9RxlU8FlIKTZDDH1zuvy1g2cTZF0fUtng5H30gQ1MNv1c+L5JRNBy5ToMFv
         QAtM9bNNhtkUQ6WJc90MgU1tZHXru+T83R62gyXautU4kjFegKRaqD/opJ7k4kU+yo9C
         cuMQA+qK140UA6ySos7grccJY5JPy8IEWgcIx/gwIBmjmFKChW6xvzPN90xV5Si2McQc
         955YXPcVESnUpanZospp+DC8AmLkLdCGMe2+DRz3GvW/bI9Y1Q4vczzEPkqgl1D4s0R4
         5BaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728141960; x=1728746760;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aSpIks7wgvzrdGiSzq/HYW4dr1jFM7gjMRozlRGemJM=;
        b=g5eLEq6EKHdeF6NyBb/ipeQYGeK208EhJDqE21S+gvp3dERXiNJ2SzbifPfHVzmBrl
         lG/8YFVt4pdv5U704Hd3Tv0fn/S9XGhdbvJrN2Bs1beC7ygKrSvLnINlcwePA5r7Qrvc
         5OXoUBb49bhAS/xAhw4mOuVxmDUrie15QPPVPUj3XmGsIf5ViaAboxyo8znBGBO6Y1Fs
         guZnLv/7R1Sfrrs8tfU+K6ZRKcuNH8QC6YTpdZ95iNjfFE8kLpqUQkDh6xw0r/zCtXqB
         Kw6zQIxPCnJWKECB0ZAcdW0mL3DBmZzuH79HDkHoC7PLR1ycaosAu/IYvSmYljmq84Ft
         mW5g==
X-Forwarded-Encrypted: i=1; AJvYcCXBzEIx9DCs/HYLRqWxMWkg+VGHp30xv10eg0pWEhjOrBjuLeKSkWcNlBZgWN3ASnn7lo09OQ/QsBg2qw==@linaro.org
X-Gm-Message-State: AOJu0YzLfMFd2GwSiYmbKDtEbq/IhZYhN1ov5/VEWLz09DyIZfdzy9sE
	yhrms0BGvDumL4L5grbEQ8yhQxzHQRU1sK3e8m8rlWKPR+f2MItcoE8XtAXM711ATg==
X-Google-Smtp-Source: AGHT+IHHBcTpm+lN7YnCUB3+U4K5he75In85ERBx3pFwVufluTULuz7p5KPxpM3Bc//CGD+sBFjKUg==
X-Received: by 2002:a17:902:ec89:b0:20b:982e:73d6 with SMTP id d9443c01a7336-20bff043851mr82009865ad.49.1728141959618;
        Sat, 05 Oct 2024 08:25:59 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from stoup.. (174-21-81-121.tukw.qwest.net. [174.21.81.121])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20c1396948dsm14351765ad.225.2024.10.05.08.25.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Oct 2024 08:25:59 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: deller@kernel.org,
	peter.maydell@linaro.org,
	alex.bennee@linaro.org,
	linux-parisc@vger.kernel.org,
	qemu-arm@nongnu.org
Subject: [PATCH 07/20] accel/tcg: Use the tlb_fill_align hook
Date: Sat,  5 Oct 2024 08:25:38 -0700
Message-ID: <20241005152551.307923-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241005152551.307923-1-richard.henderson@linaro.org>
References: <20241005152551.307923-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: 0/5CQjQ8Alwk

When we have a tlb miss, defer the alignment check to
the new tlb_fill_align hook.  Move the existing alignment
check so that we only perform it with a tlb hit.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/cputlb.c | 89 +++++++++++++++++++++++++---------------------
 1 file changed, 49 insertions(+), 40 deletions(-)

diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index 4bc34c8a37..0e6ae65a39 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -1616,14 +1616,14 @@ typedef struct MMULookupLocals {
  * tlb_fill will longjmp out.  Return true if the softmmu tlb for
  * @mmu_idx may have resized.
  */
-static bool mmu_lookup1(CPUState *cpu, MMULookupPageData *data,
+static bool mmu_lookup1(CPUState *cpu, MMULookupPageData *data, MemOp memop,
                         int mmu_idx, MMUAccessType access_type, uintptr_t ra)
 {
     vaddr addr = data->addr;
     uintptr_t index = tlb_index(cpu, mmu_idx, addr);
     CPUTLBEntry *entry = tlb_entry(cpu, mmu_idx, addr);
     uint64_t tlb_addr = tlb_read_idx(entry, access_type);
-    bool maybe_resized = false;
+    bool did_tlb_fill = false;
     CPUTLBEntryFull *full;
     int flags;
 
@@ -1631,17 +1631,26 @@ static bool mmu_lookup1(CPUState *cpu, MMULookupPageData *data,
     if (!tlb_hit(tlb_addr, addr)) {
         if (!victim_tlb_hit(cpu, mmu_idx, index, access_type,
                             addr & TARGET_PAGE_MASK)) {
-            bool ok = cpu->cc->tcg_ops->tlb_fill(cpu, addr, data->size,
-                                                 access_type, mmu_idx,
-                                                 false, ra);
+            bool ok = cpu->cc->tcg_ops->tlb_fill_align(cpu, addr, memop,
+                                                       data->size, access_type,
+                                                       mmu_idx, false, ra);
             assert(ok);
-            maybe_resized = true;
+            did_tlb_fill = true;
             index = tlb_index(cpu, mmu_idx, addr);
             entry = tlb_entry(cpu, mmu_idx, addr);
         }
         tlb_addr = tlb_read_idx(entry, access_type) & ~TLB_INVALID_MASK;
     }
 
+    if (!did_tlb_fill) {
+        /* We didn't use tlb_fill_align, so alignment not yet checked. */
+        unsigned a_bits = memop_alignment_bits(memop);
+
+        if (unlikely(addr & ((1 << a_bits) - 1))) {
+            cpu_unaligned_access(cpu, addr, access_type, mmu_idx, ra);
+        }
+    }
+
     full = &cpu->neg.tlb.d[mmu_idx].fulltlb[index];
     flags = tlb_addr & (TLB_FLAGS_MASK & ~TLB_FORCE_SLOW);
     flags |= full->slow_flags[access_type];
@@ -1651,7 +1660,7 @@ static bool mmu_lookup1(CPUState *cpu, MMULookupPageData *data,
     /* Compute haddr speculatively; depending on flags it might be invalid. */
     data->haddr = (void *)((uintptr_t)addr + entry->addend);
 
-    return maybe_resized;
+    return did_tlb_fill;
 }
 
 /**
@@ -1702,7 +1711,6 @@ static void mmu_watch_or_dirty(CPUState *cpu, MMULookupPageData *data,
 static bool mmu_lookup(CPUState *cpu, vaddr addr, MemOpIdx oi,
                        uintptr_t ra, MMUAccessType type, MMULookupLocals *l)
 {
-    unsigned a_bits;
     bool crosspage;
     int flags;
 
@@ -1711,12 +1719,6 @@ static bool mmu_lookup(CPUState *cpu, vaddr addr, MemOpIdx oi,
 
     tcg_debug_assert(l->mmu_idx < NB_MMU_MODES);
 
-    /* Handle CPU specific unaligned behaviour */
-    a_bits = memop_alignment_bits(l->memop);
-    if (addr & ((1 << a_bits) - 1)) {
-        cpu_unaligned_access(cpu, addr, type, l->mmu_idx, ra);
-    }
-
     l->page[0].addr = addr;
     l->page[0].size = memop_size(l->memop);
     l->page[1].addr = (addr + l->page[0].size - 1) & TARGET_PAGE_MASK;
@@ -1724,7 +1726,7 @@ static bool mmu_lookup(CPUState *cpu, vaddr addr, MemOpIdx oi,
     crosspage = (addr ^ l->page[1].addr) & TARGET_PAGE_MASK;
 
     if (likely(!crosspage)) {
-        mmu_lookup1(cpu, &l->page[0], l->mmu_idx, type, ra);
+        mmu_lookup1(cpu, &l->page[0], l->memop, l->mmu_idx, type, ra);
 
         flags = l->page[0].flags;
         if (unlikely(flags & (TLB_WATCHPOINT | TLB_NOTDIRTY))) {
@@ -1743,8 +1745,8 @@ static bool mmu_lookup(CPUState *cpu, vaddr addr, MemOpIdx oi,
          * Lookup both pages, recognizing exceptions from either.  If the
          * second lookup potentially resized, refresh first CPUTLBEntryFull.
          */
-        mmu_lookup1(cpu, &l->page[0], l->mmu_idx, type, ra);
-        if (mmu_lookup1(cpu, &l->page[1], l->mmu_idx, type, ra)) {
+        mmu_lookup1(cpu, &l->page[0], l->memop, l->mmu_idx, type, ra);
+        if (mmu_lookup1(cpu, &l->page[1], 0, l->mmu_idx, type, ra)) {
             uintptr_t index = tlb_index(cpu, l->mmu_idx, addr);
             l->page[0].full = &cpu->neg.tlb.d[l->mmu_idx].fulltlb[index];
         }
@@ -1770,7 +1772,7 @@ static bool mmu_lookup(CPUState *cpu, vaddr addr, MemOpIdx oi,
      * Device memory type require alignment.
      */
     if (unlikely(flags & TLB_CHECK_ALIGNED)) {
-        a_bits = memop_atomicity_bits(l->memop);
+        unsigned a_bits = memop_atomicity_bits(l->memop);
         if (addr & ((1 << a_bits) - 1)) {
             cpu_unaligned_access(cpu, addr, type, l->mmu_idx, ra);
         }
@@ -1788,34 +1790,18 @@ static void *atomic_mmu_lookup(CPUState *cpu, vaddr addr, MemOpIdx oi,
 {
     uintptr_t mmu_idx = get_mmuidx(oi);
     MemOp mop = get_memop(oi);
-    int a_bits = memop_alignment_bits(mop);
     uintptr_t index;
     CPUTLBEntry *tlbe;
     vaddr tlb_addr;
     void *hostaddr;
     CPUTLBEntryFull *full;
+    bool did_tlb_fill = false;
 
     tcg_debug_assert(mmu_idx < NB_MMU_MODES);
 
     /* Adjust the given return address.  */
     retaddr -= GETPC_ADJ;
 
-    /* Enforce guest required alignment.  */
-    if (unlikely(a_bits > 0 && (addr & ((1 << a_bits) - 1)))) {
-        /* ??? Maybe indicate atomic op to cpu_unaligned_access */
-        cpu_unaligned_access(cpu, addr, MMU_DATA_STORE,
-                             mmu_idx, retaddr);
-    }
-
-    /* Enforce qemu required alignment.  */
-    if (unlikely(addr & (size - 1))) {
-        /* We get here if guest alignment was not requested,
-           or was not enforced by cpu_unaligned_access above.
-           We might widen the access and emulate, but for now
-           mark an exception and exit the cpu loop.  */
-        goto stop_the_world;
-    }
-
     index = tlb_index(cpu, mmu_idx, addr);
     tlbe = tlb_entry(cpu, mmu_idx, addr);
 
@@ -1824,10 +1810,11 @@ static void *atomic_mmu_lookup(CPUState *cpu, vaddr addr, MemOpIdx oi,
     if (!tlb_hit(tlb_addr, addr)) {
         if (!victim_tlb_hit(cpu, mmu_idx, index, MMU_DATA_STORE,
                             addr & TARGET_PAGE_MASK)) {
-            bool ok = cpu->cc->tcg_ops->tlb_fill(cpu, addr, size,
-                                                 MMU_DATA_STORE, mmu_idx,
-                                                 false, retaddr);
+            bool ok = cpu->cc->tcg_ops->tlb_fill_align(cpu, addr, mop, size,
+                                                       MMU_DATA_STORE, mmu_idx,
+                                                       false, retaddr);
             assert(ok);
+            did_tlb_fill = true;
             index = tlb_index(cpu, mmu_idx, addr);
             tlbe = tlb_entry(cpu, mmu_idx, addr);
         }
@@ -1841,8 +1828,8 @@ static void *atomic_mmu_lookup(CPUState *cpu, vaddr addr, MemOpIdx oi,
      * but addr_read will only be -1 if PAGE_READ was unset.
      */
     if (unlikely(tlbe->addr_read == -1)) {
-        cpu->cc->tcg_ops->tlb_fill(cpu, addr, size, MMU_DATA_LOAD,
-                                   mmu_idx, false, retaddr);
+        cpu->cc->tcg_ops->tlb_fill_align(cpu, addr, mop, size, MMU_DATA_LOAD,
+                                         mmu_idx, false, retaddr);
         /*
          * Since we don't support reads and writes to different
          * addresses, and we do have the proper page loaded for
@@ -1850,6 +1837,28 @@ static void *atomic_mmu_lookup(CPUState *cpu, vaddr addr, MemOpIdx oi,
          */
         g_assert_not_reached();
     }
+
+    /* Enforce guest required alignment, if not handled by tlb_fill_align. */
+    if (!did_tlb_fill) {
+        int a_bits = memop_alignment_bits(mop);
+        if (unlikely(a_bits > 0 && (addr & ((1 << a_bits) - 1)))) {
+            /* ??? Maybe indicate atomic op to cpu_unaligned_access */
+            cpu_unaligned_access(cpu, addr, MMU_DATA_STORE,
+                                 mmu_idx, retaddr);
+        }
+    }
+
+    /* Enforce qemu required alignment.  */
+    if (unlikely(addr & (size - 1))) {
+        /*
+         * We get here if guest alignment was not requested,
+         * or was not enforced by cpu_unaligned_access above.
+         * We might widen the access and emulate, but for now
+         * mark an exception and exit the cpu loop.
+         */
+        goto stop_the_world;
+    }
+
     /* Collect tlb flags for read. */
     tlb_addr |= tlbe->addr_read;
 
-- 
2.43.0
