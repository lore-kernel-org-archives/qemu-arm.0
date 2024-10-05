Received: by 2002:a17:505:c89:b0:1be9:327d:8ee3 with SMTP id hp9csp1147627njb;
        Sat, 5 Oct 2024 13:06:08 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVZZw3v0dmEslRl5t10O8Zh2YTfpre3olqYoQ4Kr9xZPksEWHfpWGCOq340h5NAFT7l3mO7YJlbiqeu2Q==@linaro.org
X-Received: by 2002:a17:903:2452:b0:205:6552:1099 with SMTP id d9443c01a7336-20bfe022cd9mr86609355ad.8.1728158768508;
        Sat, 05 Oct 2024 13:06:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1728158768; cv=none;
        d=google.com; s=arc-20240605;
        b=TJjyEOFoctlxEbHeUSwFnTJyrVdmfEA7h0uF/K2khCpG11Ha3fJKUCrwcnrb2WdGz/
         KY/ezb9JWvo/Lc1kpLrSji5Rk9tABJgLnB9DCMkL3X9N+kr/0kZwlnSYipvpRtl0/umo
         focohkkuI0w7DNN8abw0pB9MVtHzRu9w5aO3HXvMUQsb8BhwlMh9cfEKVMnymEfTzcX0
         Cb9KuZfV3E6OVSPlFXAD6bIKIgnpr+gltKr6sTfNKmHvmCV/+nnjh557EFpMM5qO4Fie
         mXAmZuZ/j40vS5fVKY8vfhZ8KlKFaT6mL5xvbpDrO1kGl3sLuFWP59FIuW2X4GTLAkEH
         qSdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=aSpIks7wgvzrdGiSzq/HYW4dr1jFM7gjMRozlRGemJM=;
        fh=gm94RItQkOvSlWNCghXjcsxXceDBv2nJakNQ+lM8Dog=;
        b=Mj9s1X4OpoiRDJySXBs4YyOj4S/63FeUNCeo8CNCUO1b4AZHbXMHtoUCQdNeIs1qRK
         wMhFRuUxJ2k/YrNWeDqMZflGSQgE3phqkJSakQIGGYgZbLqA87nhSOBK8VEmZVEiAS6S
         owc574xDIjrsaDlby1yQYgRTwXmYsG96E2lgs2tIvxVOP8KSwGHC8NflvNI+ZpYuTPm/
         wfJVbG+ia7wWhrkUrWnk0pvGy16GMBrZ28jZCCKzztTMunggaKTZEmUhC9jZFbvmspmb
         mlDIUwjgvJhmQTxkydgFfds5i9fOsxUUF3J9x+38hZ9IdiqMDkiGtdIzJxyCdRy/uq9m
         RUQw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EIBygv+m;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-20c139558efsor12391835ad.16.2024.10.05.13.06.08
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 05 Oct 2024 13:06:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EIBygv+m;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728158768; x=1728763568; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aSpIks7wgvzrdGiSzq/HYW4dr1jFM7gjMRozlRGemJM=;
        b=EIBygv+muVxnU4gu2IO+STHtirBaw8JxfHZMKIyRiFTJxM+iYrP+W8bLUz31xctzLo
         OMST/bfr15lzfBfxDi+RpYbY9aZT6ttv5WACshbI//84r2HKJyqs94LbTAvx/vdqGfaV
         /+e8dFJSJXhDSQlodNQpI4lAZmcunOn6gEvMjCECcSrEuhyDOC4cVAD53DqlTuqN01/5
         06Peo/huzBji23o4QH2rUzL41wkabRMVrrvXgZAFlHTdcnnLw5dLs4QK7GTchwTttzlL
         ao05UHiPl6Y7yjZ+wxZMRf2E71HxriiiMnibX+wsFqAQMR0zSQrh+R9zlxzKpjhFRVVk
         DJRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728158768; x=1728763568;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aSpIks7wgvzrdGiSzq/HYW4dr1jFM7gjMRozlRGemJM=;
        b=ulFakjM3ikZRSNL+aO1z+9cBxwK6i7JQ+fTiD+MVU/kqNIZBIq8hTQjvy7DjdsrPLh
         jp5epip+91ow2Uc/2jcUlTfoceUwRgIWVX4dLJq3rK3+rKgkHgmRBQyhx+UscVBGYqZY
         EHTqoVn24ZYyWlgCN++l6ZPNgNWLrtwBEbDP201kqqvjO5FEfk0Avog3NsWfnJrM3RWw
         6E6yGu7/EQijmHdh76LwX/4hC5TGVQCY51J2JeyoWoq9qT5HnkH/h4y1/o2ulnu+7OqK
         LzGcnP6ADjJ6ViSsF45uvtAmqXng1295/rpMxwgHGKVrKBoxnmZOIwv5bqfezYHnXOcc
         8fag==
X-Forwarded-Encrypted: i=1; AJvYcCVtbkRgL9nS/oMB2f/PjF612JGzCjCcNWTRTts440VTMVI5BUf+Sh0GOrUj5oH28Cay+Y6OtdadgKKTEg==@linaro.org
X-Gm-Message-State: AOJu0Yxf0Cd651a+gY4KxEy/n4HacSr8gxbflrJiU0Cn+xO2U3D/b1nU
	l/z9t0a2Zk/Kv6l95KtdKh+9P7ANWdBXmJg9KljTwYAfFR3DqJwet+yr0sQx1W5U3aV1oJwqkAF
	j1pA=
X-Google-Smtp-Source: AGHT+IEaeCLxh/V4FYDHhcizmCqrbA2X6RtS9JLzATD1GoweD02dQoKPmQSlloLgWaenfDYRsJ7amg==
X-Received: by 2002:a17:90a:a107:b0:2e0:7560:9334 with SMTP id 98e67ed59e1d1-2e1e636f75bmr8187622a91.36.1728158768046;
        Sat, 05 Oct 2024 13:06:08 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from stoup.. (174-21-81-121.tukw.qwest.net. [174.21.81.121])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20c13931055sm16493405ad.139.2024.10.05.13.06.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Oct 2024 13:06:07 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: deller@kernel.org,
	peter.maydell@linaro.org,
	alex.bennee@linaro.org,
	linux-parisc@vger.kernel.org,
	qemu-arm@nongnu.org
Subject: [PATCH v2 07/21] accel/tcg: Use the tlb_fill_align hook
Date: Sat,  5 Oct 2024 13:05:46 -0700
Message-ID: <20241005200600.493604-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241005200600.493604-1-richard.henderson@linaro.org>
References: <20241005200600.493604-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: gg9uJUbEY8tE

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
