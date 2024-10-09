Received: by 2002:a17:504:1f11:b0:1be9:327d:8ee3 with SMTP id z17csp531979njl;
        Tue, 8 Oct 2024 17:05:00 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXNSfDb5IHeu1bg403PVhXNAuvrGThKsSY6SHhUQZhML3aJ7xsmLjpf9rwJrvHPI6IBMYnHPf40d/MZ9g==@linaro.org
X-Received: by 2002:a17:902:d1d4:b0:20b:937e:ca1e with SMTP id d9443c01a7336-20c6370feb5mr8063695ad.18.1728432300563;
        Tue, 08 Oct 2024 17:05:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1728432300; cv=none;
        d=google.com; s=arc-20240605;
        b=FUO0hehAOOeIcZE9MHSNZ7ODklBJxvcxC0Kyl8sYl1C97DJBaKTzUCMDfx7FCCzC+g
         1f8YJHtBg7gKWcHTtQyCM+VpefZqbJ7Tm+9Prn5OeljTbcNg1g8zxR3SRW0mA0A2hQjI
         mRwe6Y2ghe/v7Xxn6VsEltTjgpYw7Fn1I0naMhxYjh4ZC2is456c6Z4E3cN0NbA928CB
         Gpv9mYaJj+CEr0ZX60G6imNCqkZdZ9NQz+MOCBJGYzJiTbn0M1KlxJfB85odXU/AQdJD
         ZJ79Dd85b9mqarMZYFmVgSd7Zk8BT0bs0sYFYLk7nUZHBPnpC1yxlRgE8igZZV9JkE27
         /xIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=KRlC3mms3e9Sb+Qb/UGEoW53IughvKHiILVrUessrrs=;
        fh=lAxyzv4FrTIjCehdDOOFsXIAXMpWm5ClVAqlRVPoR0s=;
        b=EUiSEvW2XDhu3uW+Hi6hwiF4Xc7CJRaLkOEUXVQKl55inqzLciDx9W/z8dcJC/qTKM
         3VY2+jJQR4BOog8KZ9WNmcOqacp1gO+szq49KOmZhqfQXaBGr8QwZzXxE/HPRF27+1on
         O75DEDfkPpDVKlXUV8Fmuixx6pMTRxBpt81UNdQ/6bfU1YBl4n7CF+Y1Vyu5fk3AiPSl
         xiU2bP+3rAkmJFSNCoEWPsNwONjco6seebpJEj7Ppwyqn4xRuWMyXArFfcYwriDGjwfH
         qHJ6isat29bc6TGDJSojZdS0teWJnVjKiurHvX9GaoZUiO0C9c7PUrtmExi73gj8K6Vf
         5NoQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=L9s6FkD0;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-20c138a743esor64049455ad.2.2024.10.08.17.05.00
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 08 Oct 2024 17:05:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=L9s6FkD0;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728432300; x=1729037100; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KRlC3mms3e9Sb+Qb/UGEoW53IughvKHiILVrUessrrs=;
        b=L9s6FkD0siG7JPmNQBfPBBl2y4gJmx+X+/47LkXDRKsnAMDNsW1a3Od+OZR34aL/0J
         3u2fi5R89KWEKmNrKjoFuWfgYquP7m8BphB8ZxG4AndJCGbQ+Y1asoh/HRwS1UCUke3p
         uUkKbJnu0EUKR7RGZEAzlVFmy9wfcZIIklipgf65oaGjzEkLgt6l4AO+00NGE4q6yLC3
         spBbK91MLVm98SRtzew39xmMQdnwxMFWR7pMjI5PF1kiWcAjKvRdRyI0s0BCQaqLcR0u
         Qnn7ajg1XoGxMtTfQTkizgwcVg15jMuAxjkPqvQtgZYzzj00zN6x8X5WX2qjN/R6QO3c
         B2OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728432300; x=1729037100;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KRlC3mms3e9Sb+Qb/UGEoW53IughvKHiILVrUessrrs=;
        b=HtKHMwBmEwnQwnriAfNAMs0YHt1L5vUxTbfKEY3z5gR3q/XrUnKBiMTEQ70iTw1lw2
         Cl4y7ArXitL2alMm1cFebmfT+j99y/7eR2qsaJA6gQf44rWhhLQJaTrdxG2wRlOHzjv8
         OZwo9fTd7sJr5U1D6FrIKmTpeVUCcyj/TG14H5lCfUzfD804r3T77ky3ZaYjoIbzVoLy
         Zc6xzI0HPLWacm+rSH81A8LVEnljB1lTBlSFzltgPP1JyoXHutnmmkn+nyY4jf0CiFXk
         og4fTzwS55UcmpSO6S/lgr2XxC6NRa2lVZSGLlQu4S86QQTmFvQMdk1KPKmJWkEjS2oI
         ig+Q==
X-Forwarded-Encrypted: i=1; AJvYcCXiarJ3g2dt6JKytN7y147xNVRIoiBbzcXYf8rZEl9YZfD6x7f1u8tBEgGjZEAJZ2g3/W4xEpmH7NqAJQ==@linaro.org
X-Gm-Message-State: AOJu0YxBQJyH+3+BDJ0zDBFYPap2+RjUjPD8uPAIm6tFphMVbv1ixMIM
	W9ZkTatL+u055lq1UVY1q10t/6/VAetEka6XtrJQI2vRUs+tk9YH3XH8h80WACFNCA==
X-Google-Smtp-Source: AGHT+IFCFvVKxRyLlvfGXYLtSu9ozN9PdneS174Hz9Cj7lMpmt/cbo6+LfjS0UmFUu6tz4mWEHkH6A==
X-Received: by 2002:a17:903:98b:b0:208:b468:db21 with SMTP id d9443c01a7336-20c63748357mr13630815ad.30.1728432299990;
        Tue, 08 Oct 2024 17:04:59 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from stoup.. (174-21-81-121.tukw.qwest.net. [174.21.81.121])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20c138cecf2sm60705105ad.104.2024.10.08.17.04.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Oct 2024 17:04:59 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: deller@kernel.org,
	peter.maydell@linaro.org,
	alex.bennee@linaro.org,
	linux-parisc@vger.kernel.org,
	qemu-arm@nongnu.org
Subject: [PATCH v3 05/20] accel/tcg: Add TCGCPUOps.tlb_fill_align
Date: Tue,  8 Oct 2024 17:04:38 -0700
Message-ID: <20241009000453.315652-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241009000453.315652-1-richard.henderson@linaro.org>
References: <20241009000453.315652-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: OYYn8RVz8wF4

Add a new callback to handle softmmu paging.  Return the page
details directly, instead of passing them indirectly to
tlb_set_page.  Handle alignment simultaneously with paging so
that faults are handled with target-specific priority.

Route all calls the two hooks through a tlb_fill_align
function local to cputlb.c.

As yet no targets implement the new hook.
As yet cputlb.c does not use the new alignment check.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/hw/core/cpu.h         |  4 +--
 include/hw/core/tcg-cpu-ops.h | 26 +++++++++++++++
 include/qemu/typedefs.h       |  1 +
 accel/tcg/cputlb.c            | 61 ++++++++++++++++++++++-------------
 4 files changed, 67 insertions(+), 25 deletions(-)

diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index 04e9ad4996..d21a24c82f 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -205,7 +205,7 @@ struct CPUClass {
  * so the layout is not as critical as that of CPUTLBEntry. This is
  * also why we don't want to combine the two structs.
  */
-typedef struct CPUTLBEntryFull {
+struct CPUTLBEntryFull {
     /*
      * @xlat_section contains:
      *  - in the lower TARGET_PAGE_BITS, a physical section number
@@ -261,7 +261,7 @@ typedef struct CPUTLBEntryFull {
             bool guarded;
         } arm;
     } extra;
-} CPUTLBEntryFull;
+};
 
 /*
  * Data elements that are per MMU mode, minus the bits accessed by
diff --git a/include/hw/core/tcg-cpu-ops.h b/include/hw/core/tcg-cpu-ops.h
index 34318cf0e6..c932690621 100644
--- a/include/hw/core/tcg-cpu-ops.h
+++ b/include/hw/core/tcg-cpu-ops.h
@@ -13,6 +13,7 @@
 #include "exec/breakpoint.h"
 #include "exec/hwaddr.h"
 #include "exec/memattrs.h"
+#include "exec/memop.h"
 #include "exec/mmu-access-type.h"
 #include "exec/vaddr.h"
 
@@ -131,6 +132,31 @@ struct TCGCPUOps {
      * same function signature.
      */
     bool (*cpu_exec_halt)(CPUState *cpu);
+    /**
+     * @tlb_fill_align: Handle a softmmu tlb miss
+     * @cpu: cpu context
+     * @out: output page properties
+     * @addr: virtual address
+     * @access_type: read, write or execute
+     * @mmu_idx: mmu context
+     * @memop: memory operation for the access
+     * @size: memory access size, or 0 for whole page
+     * @probe: test only, no fault
+     * @ra: host return address for exception unwind
+     *
+     * If the access is valid, fill in @out and return true.
+     * Otherwise if probe is true, return false.
+     * Otherwise raise and exception and do not return.
+     *
+     * The alignment check for the access is deferred to this hook,
+     * so that the target can determine the priority of any alignment
+     * fault with respect to other potential faults from paging.
+     * Zero may be passed for @memop to skip any alignment check
+     * for non-memory-access operations such as probing.
+     */
+    bool (*tlb_fill_align)(CPUState *cpu, CPUTLBEntryFull *out, vaddr addr,
+                           MMUAccessType access_type, int mmu_idx,
+                           MemOp memop, int size, bool probe, uintptr_t ra);
     /**
      * @tlb_fill: Handle a softmmu tlb miss
      *
diff --git a/include/qemu/typedefs.h b/include/qemu/typedefs.h
index 9d222dc376..3d84efcac4 100644
--- a/include/qemu/typedefs.h
+++ b/include/qemu/typedefs.h
@@ -40,6 +40,7 @@ typedef struct ConfidentialGuestSupport ConfidentialGuestSupport;
 typedef struct CPUArchState CPUArchState;
 typedef struct CPUPluginState CPUPluginState;
 typedef struct CPUState CPUState;
+typedef struct CPUTLBEntryFull CPUTLBEntryFull;
 typedef struct DeviceState DeviceState;
 typedef struct DirtyBitmapSnapshot DirtyBitmapSnapshot;
 typedef struct DisasContextBase DisasContextBase;
diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index 35cda1e2b0..d72f454e9e 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -1221,22 +1221,35 @@ void tlb_set_page(CPUState *cpu, vaddr addr,
 }
 
 /*
- * Note: tlb_fill() can trigger a resize of the TLB. This means that all of the
- * caller's prior references to the TLB table (e.g. CPUTLBEntry pointers) must
- * be discarded and looked up again (e.g. via tlb_entry()).
+ * Note: tlb_fill_align() can trigger a resize of the TLB.
+ * This means that all of the caller's prior references to the TLB table
+ * (e.g. CPUTLBEntry pointers) must be discarded and looked up again
+ * (e.g. via tlb_entry()).
  */
-static void tlb_fill(CPUState *cpu, vaddr addr, int size,
-                     MMUAccessType access_type, int mmu_idx, uintptr_t retaddr)
+static bool tlb_fill_align(CPUState *cpu, vaddr addr, MMUAccessType type,
+                           int mmu_idx, MemOp memop, int size,
+                           bool probe, uintptr_t ra)
 {
-    bool ok;
+    const TCGCPUOps *ops = cpu->cc->tcg_ops;
+    CPUTLBEntryFull full;
 
-    /*
-     * This is not a probe, so only valid return is success; failure
-     * should result in exception + longjmp to the cpu loop.
-     */
-    ok = cpu->cc->tcg_ops->tlb_fill(cpu, addr, size,
-                                    access_type, mmu_idx, false, retaddr);
-    assert(ok);
+    if (ops->tlb_fill_align) {
+        if (ops->tlb_fill_align(cpu, &full, addr, type, mmu_idx,
+                                memop, size, probe, ra)) {
+            tlb_set_page_full(cpu, mmu_idx, addr, &full);
+            return true;
+        }
+    } else {
+        /* Legacy behaviour is alignment before paging. */
+        if (addr & ((1u << memop_alignment_bits(memop)) - 1)) {
+            ops->do_unaligned_access(cpu, addr, type, mmu_idx, ra);
+        }
+        if (ops->tlb_fill(cpu, addr, size, type, mmu_idx, probe, ra)) {
+            return true;
+        }
+    }
+    assert(probe);
+    return false;
 }
 
 static inline void cpu_unaligned_access(CPUState *cpu, vaddr addr,
@@ -1351,22 +1364,22 @@ static int probe_access_internal(CPUState *cpu, vaddr addr,
 
     if (!tlb_hit_page(tlb_addr, page_addr)) {
         if (!victim_tlb_hit(cpu, mmu_idx, index, access_type, page_addr)) {
-            if (!cpu->cc->tcg_ops->tlb_fill(cpu, addr, fault_size, access_type,
-                                            mmu_idx, nonfault, retaddr)) {
+            if (!tlb_fill_align(cpu, addr, access_type, mmu_idx,
+                                0, fault_size, nonfault, retaddr)) {
                 /* Non-faulting page table read failed.  */
                 *phost = NULL;
                 *pfull = NULL;
                 return TLB_INVALID_MASK;
             }
 
-            /* TLB resize via tlb_fill may have moved the entry.  */
+            /* TLB resize via tlb_fill_align may have moved the entry.  */
             index = tlb_index(cpu, mmu_idx, addr);
             entry = tlb_entry(cpu, mmu_idx, addr);
 
             /*
              * With PAGE_WRITE_INV, we set TLB_INVALID_MASK immediately,
-             * to force the next access through tlb_fill.  We've just
-             * called tlb_fill, so we know that this entry *is* valid.
+             * to force the next access through tlb_fill_align.  We've just
+             * called tlb_fill_align, so we know that this entry *is* valid.
              */
             flags &= ~TLB_INVALID_MASK;
         }
@@ -1613,7 +1626,7 @@ typedef struct MMULookupLocals {
  *
  * Resolve the translation for the one page at @data.addr, filling in
  * the rest of @data with the results.  If the translation fails,
- * tlb_fill will longjmp out.  Return true if the softmmu tlb for
+ * tlb_fill_align will longjmp out.  Return true if the softmmu tlb for
  * @mmu_idx may have resized.
  */
 static bool mmu_lookup1(CPUState *cpu, MMULookupPageData *data,
@@ -1631,7 +1644,8 @@ static bool mmu_lookup1(CPUState *cpu, MMULookupPageData *data,
     if (!tlb_hit(tlb_addr, addr)) {
         if (!victim_tlb_hit(cpu, mmu_idx, index, access_type,
                             addr & TARGET_PAGE_MASK)) {
-            tlb_fill(cpu, addr, data->size, access_type, mmu_idx, ra);
+            tlb_fill_align(cpu, addr, access_type, mmu_idx,
+                           0, data->size, false, ra);
             maybe_resized = true;
             index = tlb_index(cpu, mmu_idx, addr);
             entry = tlb_entry(cpu, mmu_idx, addr);
@@ -1821,8 +1835,8 @@ static void *atomic_mmu_lookup(CPUState *cpu, vaddr addr, MemOpIdx oi,
     if (!tlb_hit(tlb_addr, addr)) {
         if (!victim_tlb_hit(cpu, mmu_idx, index, MMU_DATA_STORE,
                             addr & TARGET_PAGE_MASK)) {
-            tlb_fill(cpu, addr, size,
-                     MMU_DATA_STORE, mmu_idx, retaddr);
+            tlb_fill_align(cpu, addr, MMU_DATA_STORE, mmu_idx,
+                           0, size, false, retaddr);
             index = tlb_index(cpu, mmu_idx, addr);
             tlbe = tlb_entry(cpu, mmu_idx, addr);
         }
@@ -1836,7 +1850,8 @@ static void *atomic_mmu_lookup(CPUState *cpu, vaddr addr, MemOpIdx oi,
      * but addr_read will only be -1 if PAGE_READ was unset.
      */
     if (unlikely(tlbe->addr_read == -1)) {
-        tlb_fill(cpu, addr, size, MMU_DATA_LOAD, mmu_idx, retaddr);
+        tlb_fill_align(cpu, addr, MMU_DATA_LOAD, mmu_idx,
+                       0, size, false, retaddr);
         /*
          * Since we don't support reads and writes to different
          * addresses, and we do have the proper page loaded for
-- 
2.43.0
