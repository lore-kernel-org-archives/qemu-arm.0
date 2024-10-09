Received: by 2002:a17:504:1f11:b0:1be9:327d:8ee3 with SMTP id z17csp531996njl;
        Tue, 8 Oct 2024 17:05:02 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUtHObsiNl06DhZoBKEd7sEX2STpNCUyZR+MH6kiIAaBHBPCYi0+qGcAr05EdmOx3gjR7Le0eKGUa9iTg==@linaro.org
X-Received: by 2002:a17:903:32d0:b0:205:810a:190a with SMTP id d9443c01a7336-20c636f44famr10017085ad.2.1728432301998;
        Tue, 08 Oct 2024 17:05:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1728432301; cv=none;
        d=google.com; s=arc-20240605;
        b=V0XHymM5FUYxUL6WyHfb6JQuByOqxMWLkcHGPqr1bjQOKGJH/GFXA+HKd4LifSp3LJ
         +PGSl91K88scM+EOmbJBZhXk3+0DsiMdeRCDcPbEefznG8QL7ATFLgxz/EVUpEux6x0M
         k7qATrY4VwVNMQl5P7JSd4BT1NQT//xmVJApNlX5D/mztMFfBlvY5Rq6wEdZqD1+I0FP
         e9qTacQXcEPLDe8S5JoqAnsB/1nq6za4YZ+ptqxt7tVWQjYRzgzoJ4wVWneMUxtVtOye
         m+5+96BQn4+/XplxNaQtzN/XxqH7bQCmf23mS3/4wWNK9DCHgS4xUTM1IxGpdIodOtiw
         tkAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=/dFojoXE4+jjskAlQVsQMp2S+E0WFZ4r9iQmpRIn1e0=;
        fh=kvesrx9onYfkJv/ZkbBvs21ugOA52lZ616cGKL3eILk=;
        b=gD1Eb5qxVOlD/WDM545QZvCDNR5MduVU6LImYDn7HuefKWLZUo4MpHeqWjN1wo6oLu
         bg3M/B2sHZo3jnugy8rfSTvBbCFJDZKNj0Zr5FVsbl+ui0qqOgJ0qWJsEyvJ10Uz+5x1
         YcbERWZew3ATckoplf5EtJ7nY/I9WgLAkHDR/oXxnZnczNbeoi2/LCvkxSrgYK85hmNP
         UFU/kcu6IrCANYS2SIZ+bXBCNTPrp2sAzfKI+CdLsTCQjTA8veW6kewKi8bSNY3TCvDx
         jo60OV/uc5v/SsVOdDSAT06zph+JHYbMz/sqDgN2JsytraSnlv+pMMN8F9PokKpIgHQX
         Ikhw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BQgY+39G;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-20c138ea005sor63559445ad.9.2024.10.08.17.05.01
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 08 Oct 2024 17:05:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BQgY+39G;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728432301; x=1729037101; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/dFojoXE4+jjskAlQVsQMp2S+E0WFZ4r9iQmpRIn1e0=;
        b=BQgY+39GEyg5gA4QhxLYY1lf8fw+UEIeov0gorZghHY+Tk2v/oRwRLAKkh/c2rKGSz
         qt8p4R68zXBQyZo+jjmbP1b8vbTFpNDJs/eT74T8R24PyD3/j8zNdnxF7kT7JSggqvVl
         7enVSfCekPUmdwn6A+W+GnWbrMObtEsEBx/woaf0Qr8Ax02hKGm/67JxQp9JS9BKFzT9
         Dk7FeIUJM/Nm7ZKdZ/yHC+9yh5DmFJsjEsT0HhIFxlIih3IafhyipLeviFzVx3qVrZbd
         TrJb8fhYiZxNAGybHaOcujnfKlSaGy4zv8tgPANSI/qPepQyp75CFcYkKNRQO1mpuqit
         D1rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728432301; x=1729037101;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/dFojoXE4+jjskAlQVsQMp2S+E0WFZ4r9iQmpRIn1e0=;
        b=eJnmrTs2/ksnOe8xGWoI8kgk6MMGGPEa3R7hMsAlm0ysxfJTeAc3Q+1jfhcceaaGJs
         Dt6abo5BlG82dNJpbxv+LgfGJBHSSLLXk3W0ovufHR5mbd8fR0gyj9Sbx4YPTZTgXdt5
         Qxj8vostYDjQmyFtIegYy1qckwAiDsQbhZaf8/7kDko9NCcYG+z4hQhlbhVL+YyiAD81
         zK4MbBF0rxU6uNkHLULFxVLMqYHqK3HbmhBI5c9TIQK+qxmx1fKCJPemF/X2Mjoi4SBs
         wX5jgvSS+yfGo6qu7Cg30IQ1UhFh6xP6ScJwptmqGf+lcbjMUMPSc+Wj2tREk2gAYtU/
         abAw==
X-Forwarded-Encrypted: i=1; AJvYcCWQ4Rn09lX1ap7D1vFICHZdmjTTnl29L/XQ5aOe6kHRRS0qa56p6hB30fPlEZh/mfzoakNd1rtwGNgTHA==@linaro.org
X-Gm-Message-State: AOJu0YxxBld/9K7FtXFG2uPhG42iQtE81QUpYXqQLUqlG5CaaEBHiv9h
	Yl555E4QTMX+5rnnYzAyaaZjHS5hu6pvQVpManE9lXeyxjhV0crKudhLlOKOTHvtrA==
X-Google-Smtp-Source: AGHT+IEqHXg8mWURHcAfVqAuEFw3SPebibRlwH8KpqMvpctboOYhLIxxyQyaRkxFDrswJJ24vV5qqA==
X-Received: by 2002:a17:903:32d0:b0:205:810a:190a with SMTP id d9443c01a7336-20c636f44famr10016545ad.2.1728432301297;
        Tue, 08 Oct 2024 17:05:01 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from stoup.. (174-21-81-121.tukw.qwest.net. [174.21.81.121])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20c138cecf2sm60705105ad.104.2024.10.08.17.05.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Oct 2024 17:05:00 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: deller@kernel.org,
	peter.maydell@linaro.org,
	alex.bennee@linaro.org,
	linux-parisc@vger.kernel.org,
	qemu-arm@nongnu.org
Subject: [PATCH v3 06/20] accel/tcg: Use the alignment test in tlb_fill_align
Date: Tue,  8 Oct 2024 17:04:39 -0700
Message-ID: <20241009000453.315652-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241009000453.315652-1-richard.henderson@linaro.org>
References: <20241009000453.315652-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: 5y3imlZZVzRh

When we have a tlb miss, defer the alignment check to
the new tlb_fill_align hook.  Move the existing alignment
check so that we only perform it with a tlb hit.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/cputlb.c | 88 ++++++++++++++++++++++++----------------------
 1 file changed, 45 insertions(+), 43 deletions(-)

diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index d72f454e9e..b76a4eac4e 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -1620,6 +1620,7 @@ typedef struct MMULookupLocals {
  * mmu_lookup1: translate one page
  * @cpu: generic cpu state
  * @data: lookup parameters
+ * @memop: memory operation for the access, or 0
  * @mmu_idx: virtual address context
  * @access_type: load/store/code
  * @ra: return address into tcg generated code, or 0
@@ -1629,7 +1630,7 @@ typedef struct MMULookupLocals {
  * tlb_fill_align will longjmp out.  Return true if the softmmu tlb for
  * @mmu_idx may have resized.
  */
-static bool mmu_lookup1(CPUState *cpu, MMULookupPageData *data,
+static bool mmu_lookup1(CPUState *cpu, MMULookupPageData *data, MemOp memop,
                         int mmu_idx, MMUAccessType access_type, uintptr_t ra)
 {
     vaddr addr = data->addr;
@@ -1645,7 +1646,7 @@ static bool mmu_lookup1(CPUState *cpu, MMULookupPageData *data,
         if (!victim_tlb_hit(cpu, mmu_idx, index, access_type,
                             addr & TARGET_PAGE_MASK)) {
             tlb_fill_align(cpu, addr, access_type, mmu_idx,
-                           0, data->size, false, ra);
+                           memop, data->size, false, ra);
             maybe_resized = true;
             index = tlb_index(cpu, mmu_idx, addr);
             entry = tlb_entry(cpu, mmu_idx, addr);
@@ -1657,6 +1658,25 @@ static bool mmu_lookup1(CPUState *cpu, MMULookupPageData *data,
     flags = tlb_addr & (TLB_FLAGS_MASK & ~TLB_FORCE_SLOW);
     flags |= full->slow_flags[access_type];
 
+    if (likely(!maybe_resized)) {
+        /* Alignment has not been checked by tlb_fill_align. */
+        int a_bits = memop_alignment_bits(memop);
+
+        /*
+         * This alignment check differs from the one above, in that this is
+         * based on the atomicity of the operation. The intended use case is
+         * the ARM memory type field of each PTE, where access to pages with
+         * Device memory type require alignment.
+         */
+        if (unlikely(flags & TLB_CHECK_ALIGNED)) {
+            int at_bits = memop_atomicity_bits(memop);
+            a_bits = MAX(a_bits, at_bits);
+        }
+        if (unlikely(addr & ((1 << a_bits) - 1))) {
+            cpu_unaligned_access(cpu, addr, access_type, mmu_idx, ra);
+        }
+    }
+
     data->full = full;
     data->flags = flags;
     /* Compute haddr speculatively; depending on flags it might be invalid. */
@@ -1713,7 +1733,6 @@ static void mmu_watch_or_dirty(CPUState *cpu, MMULookupPageData *data,
 static bool mmu_lookup(CPUState *cpu, vaddr addr, MemOpIdx oi,
                        uintptr_t ra, MMUAccessType type, MMULookupLocals *l)
 {
-    unsigned a_bits;
     bool crosspage;
     int flags;
 
@@ -1722,12 +1741,6 @@ static bool mmu_lookup(CPUState *cpu, vaddr addr, MemOpIdx oi,
 
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
@@ -1735,7 +1748,7 @@ static bool mmu_lookup(CPUState *cpu, vaddr addr, MemOpIdx oi,
     crosspage = (addr ^ l->page[1].addr) & TARGET_PAGE_MASK;
 
     if (likely(!crosspage)) {
-        mmu_lookup1(cpu, &l->page[0], l->mmu_idx, type, ra);
+        mmu_lookup1(cpu, &l->page[0], l->memop, l->mmu_idx, type, ra);
 
         flags = l->page[0].flags;
         if (unlikely(flags & (TLB_WATCHPOINT | TLB_NOTDIRTY))) {
@@ -1754,8 +1767,8 @@ static bool mmu_lookup(CPUState *cpu, vaddr addr, MemOpIdx oi,
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
@@ -1774,19 +1787,6 @@ static bool mmu_lookup(CPUState *cpu, vaddr addr, MemOpIdx oi,
         tcg_debug_assert((flags & TLB_BSWAP) == 0);
     }
 
-    /*
-     * This alignment check differs from the one above, in that this is
-     * based on the atomicity of the operation. The intended use case is
-     * the ARM memory type field of each PTE, where access to pages with
-     * Device memory type require alignment.
-     */
-    if (unlikely(flags & TLB_CHECK_ALIGNED)) {
-        a_bits = memop_atomicity_bits(l->memop);
-        if (addr & ((1 << a_bits) - 1)) {
-            cpu_unaligned_access(cpu, addr, type, l->mmu_idx, ra);
-        }
-    }
-
     return crosspage;
 }
 
@@ -1799,34 +1799,18 @@ static void *atomic_mmu_lookup(CPUState *cpu, vaddr addr, MemOpIdx oi,
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
 
@@ -1836,7 +1820,8 @@ static void *atomic_mmu_lookup(CPUState *cpu, vaddr addr, MemOpIdx oi,
         if (!victim_tlb_hit(cpu, mmu_idx, index, MMU_DATA_STORE,
                             addr & TARGET_PAGE_MASK)) {
             tlb_fill_align(cpu, addr, MMU_DATA_STORE, mmu_idx,
-                           0, size, false, retaddr);
+                           mop, size, false, retaddr);
+            did_tlb_fill = true;
             index = tlb_index(cpu, mmu_idx, addr);
             tlbe = tlb_entry(cpu, mmu_idx, addr);
         }
@@ -1859,6 +1844,23 @@ static void *atomic_mmu_lookup(CPUState *cpu, vaddr addr, MemOpIdx oi,
          */
         g_assert_not_reached();
     }
+
+    /* Enforce guest required alignment, if not handled by tlb_fill_align. */
+    if (!did_tlb_fill && (addr & ((1 << memop_alignment_bits(mop)) - 1))) {
+        cpu_unaligned_access(cpu, addr, MMU_DATA_STORE, mmu_idx, retaddr);
+    }
+
+    /* Enforce qemu required alignment.  */
+    if (unlikely(addr & (size - 1))) {
+        /*
+         * We get here if guest alignment was not requested, or was not
+         * enforced by cpu_unaligned_access or tlb_fill_align above.
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
