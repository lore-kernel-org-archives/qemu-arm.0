Received: by 2002:a17:504:1f11:b0:1be9:327d:8ee3 with SMTP id z17csp532106njl;
        Tue, 8 Oct 2024 17:05:14 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWK9p9gvu2GVrXkpFwTX0EM/YWMQpIOW0mR6dMNFOpZglbwBDJhEiquS2gMbspdTaOJgkQ4LIjxYEn7sQ==@linaro.org
X-Received: by 2002:a17:90b:1987:b0:2d8:9506:5dfd with SMTP id 98e67ed59e1d1-2e2a2563117mr767443a91.35.1728432313911;
        Tue, 08 Oct 2024 17:05:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1728432313; cv=none;
        d=google.com; s=arc-20240605;
        b=RKSzg6PxiU8YNYj5qFCdgEOcQs+chhHflhl0AwFpgA5kmb4LSZM+iiRVIOXJxywmLe
         /1yVxGVmLu2tuC5hBCBlkgv7Pj9pbSActmsaQmR1eYcdySBDLwyN64mXl1ilSxdFzUhx
         YB2mbxgbbsRx//c8TLT6q2TGysGL3lfhIt0mCJKZiLC0KBWzqbeLW6XrrDjdA/1PWgSx
         GhgzojF+C8AncvtQ+ttArRVaz8AJK8GH4E0VzuGQ25SssKjCLCHV05FUzo0dNutKflVD
         7ztBN3qkGvSGWMUteUrfF0R8GLlUAVmT5J7n5wp/KkV7KhKge9261EXULy0l557+NRnf
         9fBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=AsNmQx87g0SWMKNuiqJxyPNh2jiF8Ss0MC8Fky2xo4U=;
        fh=JdB0a3NBE+7TomECqjFxCbgiPK2pYfR3sq+o+4dmQls=;
        b=lCEXRI7Ii8gyThZYA/c7GAeLGOoCWHK/Esnt9R1dcHsDHFr87edOctPNHUrtZkvHP/
         Dp2oIEYfVxH5Kmyda68Eq8nt7xBQ3HAmHYLxvi4AwKxywswN2nqWA9az8naSQwz8T1aZ
         QGL0NR7hPrhVTDEO502BfzvuMPCunB8UpJMGrb9qnK9ErzoA1L/ZqAsXYhiXulLKWb97
         Thkj+pBRe7KvcMRCgqH1H5SkIxfPXzCg3m+AHz1VKYE/Yt1fn945z7BehVsM6nefoPBt
         kyOo3OpAlWVAfUO7I3qHfOKZzSnj/koT7HLml1qDzs6us4AUCzj75d0oTxmpXWACQX7z
         29Ew==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=prjF6pJ9;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-20c1395639bsor76812295ad.19.2024.10.08.17.05.13
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 08 Oct 2024 17:05:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=prjF6pJ9;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728432313; x=1729037113; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AsNmQx87g0SWMKNuiqJxyPNh2jiF8Ss0MC8Fky2xo4U=;
        b=prjF6pJ9/sbIjKQHRppyHnQOObZMgM5GMLM7DhCJd49nuSvl4mSBDsekutmIaIt3Vy
         HqWc24P7J+MCacrQcgVZ0/hvDIJET+y8C7yACKMTFhDRNgjWB2aAF+X9mClwJTxfalpr
         L99c5P6tAVRhUlymIzbMERN4n3grzDQMN/+3vM2SWW6IGqbcGgq2iKuv+TKKhogqkzJC
         WlgVKZfIEvv4vHGYEb382UvfG91K6fSvQ/01hHP8E4dd39dDLRiHcTf5RTO7D8Vt/AXn
         5jt+5CypW30+Q8ZBbFLlJIZJfXpX/4SxGxuzpXX0hd+cPX5jALGc0ce4WbWy5t3o27dG
         P6xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728432313; x=1729037113;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AsNmQx87g0SWMKNuiqJxyPNh2jiF8Ss0MC8Fky2xo4U=;
        b=nVUWbXZBeXK2P5ZTCfOmrxb+JNg3YlF9da9tfbFiQ7M2NFy8mzfqjhmcYh2p/Bmh2P
         mhq+yldS4jRa/oPTMcFmlGW55WE09Azu0fLqmzlD6ss7jYt6YkKY9/RKV99Bxf7UYlSm
         kVZfPOvXHWRPf3Jg0hi9QwnpgZrrqfy66iNHayiwYr1zt9o61oGyxxX6ph+cNei32/4k
         9pkVQ5om/L8+4HXz7Zg+eHhLI/YJ77EJ4DBtAIKTYR81tYaAfcjQ6ZRVSxo8SJueQYOx
         kHt4AzVy21oVwK4vosq0TtOoxll62NrF/RVf371/aOwfgVJ47siaEEa7ctl83rENqIEq
         EX+A==
X-Forwarded-Encrypted: i=1; AJvYcCVKz1s630AZj2XGi2Fkx+D0cYexofkRc/bUEUCuFAPDPo0uAxJAn1BnZ3ux9X2JqBz1t5pct0gQ/JdzXQ==@linaro.org
X-Gm-Message-State: AOJu0YzQqYSmQLKlTZa2fy4VBDzhxaIJ3z8PXK8DjDuW+oNAXQnMOKFr
	iE+oGLIQ3I2KkPXCQLoIRrrQJoBU6OIrJZ0e8LLAAwGT3WEXgcMafo6SqpimGlmPzw==
X-Google-Smtp-Source: AGHT+IFwettQe3bNvU+s7lxTJSvr2zVnYgznFgHUWVsZdUYFjaAq3kofjLpeFOF7iswFe+1y64JOcA==
X-Received: by 2002:a17:903:228a:b0:20c:5a64:9bc6 with SMTP id d9443c01a7336-20c6378e9c4mr11368345ad.50.1728432313486;
        Tue, 08 Oct 2024 17:05:13 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from stoup.. (174-21-81-121.tukw.qwest.net. [174.21.81.121])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20c138cecf2sm60705105ad.104.2024.10.08.17.05.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Oct 2024 17:05:13 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: deller@kernel.org,
	peter.maydell@linaro.org,
	alex.bennee@linaro.org,
	linux-parisc@vger.kernel.org,
	qemu-arm@nongnu.org
Subject: [PATCH v3 19/20] target/arm: Implement TCGCPUOps.tlb_fill_align
Date: Tue,  8 Oct 2024 17:04:52 -0700
Message-ID: <20241009000453.315652-20-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241009000453.315652-1-richard.henderson@linaro.org>
References: <20241009000453.315652-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: obm3fiXmufhH

Fill in the tlb_fill_align hook.  Handle alignment not due to
memory type, since that's no longer handled by generic code.
Pass memop to get_phys_addr.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/internals.h      |  6 ++---
 target/arm/cpu.c            |  2 +-
 target/arm/tcg/cpu-v7m.c    |  2 +-
 target/arm/tcg/tlb_helper.c | 49 ++++++++++++++-----------------------
 4 files changed, 24 insertions(+), 35 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index a6088d551c..299a96a81a 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -816,9 +816,9 @@ void arm_cpu_record_sigsegv(CPUState *cpu, vaddr addr,
 void arm_cpu_record_sigbus(CPUState *cpu, vaddr addr,
                            MMUAccessType access_type, uintptr_t ra);
 #else
-bool arm_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
-                      MMUAccessType access_type, int mmu_idx,
-                      bool probe, uintptr_t retaddr);
+bool arm_cpu_tlb_fill_align(CPUState *cs, CPUTLBEntryFull *out, vaddr addr,
+                            MMUAccessType access_type, int mmu_idx,
+                            MemOp memop, int size, bool probe, uintptr_t ra);
 #endif
 
 static inline int arm_to_core_mmu_idx(ARMMMUIdx mmu_idx)
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 19191c2391..1320fd8c8f 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -2663,7 +2663,7 @@ static const TCGCPUOps arm_tcg_ops = {
     .record_sigsegv = arm_cpu_record_sigsegv,
     .record_sigbus = arm_cpu_record_sigbus,
 #else
-    .tlb_fill = arm_cpu_tlb_fill,
+    .tlb_fill_align = arm_cpu_tlb_fill_align,
     .cpu_exec_interrupt = arm_cpu_exec_interrupt,
     .cpu_exec_halt = arm_cpu_exec_halt,
     .do_interrupt = arm_cpu_do_interrupt,
diff --git a/target/arm/tcg/cpu-v7m.c b/target/arm/tcg/cpu-v7m.c
index 5496f14dc1..58e54578d6 100644
--- a/target/arm/tcg/cpu-v7m.c
+++ b/target/arm/tcg/cpu-v7m.c
@@ -242,7 +242,7 @@ static const TCGCPUOps arm_v7m_tcg_ops = {
     .record_sigsegv = arm_cpu_record_sigsegv,
     .record_sigbus = arm_cpu_record_sigbus,
 #else
-    .tlb_fill = arm_cpu_tlb_fill,
+    .tlb_fill_align = arm_cpu_tlb_fill_align,
     .cpu_exec_interrupt = arm_v7m_cpu_exec_interrupt,
     .cpu_exec_halt = arm_cpu_exec_halt,
     .do_interrupt = arm_v7m_cpu_do_interrupt,
diff --git a/target/arm/tcg/tlb_helper.c b/target/arm/tcg/tlb_helper.c
index 1d8b7bcaa2..8841f039bc 100644
--- a/target/arm/tcg/tlb_helper.c
+++ b/target/arm/tcg/tlb_helper.c
@@ -318,14 +318,13 @@ void arm_cpu_do_transaction_failed(CPUState *cs, hwaddr physaddr,
     arm_deliver_fault(cpu, addr, access_type, mmu_idx, &fi);
 }
 
-bool arm_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
-                      MMUAccessType access_type, int mmu_idx,
-                      bool probe, uintptr_t retaddr)
+bool arm_cpu_tlb_fill_align(CPUState *cs, CPUTLBEntryFull *out, vaddr address,
+                            MMUAccessType access_type, int mmu_idx,
+                            MemOp memop, int size, bool probe, uintptr_t ra)
 {
     ARMCPU *cpu = ARM_CPU(cs);
     GetPhysAddrResult res = {};
     ARMMMUFaultInfo local_fi, *fi;
-    int ret;
 
     /*
      * Allow S1_ptw_translate to see any fault generated here.
@@ -339,37 +338,27 @@ bool arm_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
     }
 
     /*
-     * Walk the page table and (if the mapping exists) add the page
-     * to the TLB.  On success, return true.  Otherwise, if probing,
-     * return false.  Otherwise populate fsr with ARM DFSR/IFSR fault
-     * register format, and signal the fault.
+     * Per R_XCHFJ, alignment fault not due to memory type has
+     * highest precedence.  Otherwise, walk the page table and
+     * and collect the page description.
      */
-    ret = get_phys_addr(&cpu->env, address, access_type, 0,
-                        core_to_arm_mmu_idx(&cpu->env, mmu_idx),
-                        &res, fi);
-    if (likely(!ret)) {
-        /*
-         * Map a single [sub]page. Regions smaller than our declared
-         * target page size are handled specially, so for those we
-         * pass in the exact addresses.
-         */
-        if (res.f.lg_page_size >= TARGET_PAGE_BITS) {
-            res.f.phys_addr &= TARGET_PAGE_MASK;
-            address &= TARGET_PAGE_MASK;
-        }
-
+    if (address & ((1 << memop_alignment_bits(memop)) - 1)) {
+        fi->type = ARMFault_Alignment;
+    } else if (!get_phys_addr(&cpu->env, address, access_type, memop,
+                              core_to_arm_mmu_idx(&cpu->env, mmu_idx),
+                              &res, fi)) {
         res.f.extra.arm.pte_attrs = res.cacheattrs.attrs;
         res.f.extra.arm.shareability = res.cacheattrs.shareability;
-
-        tlb_set_page_full(cs, mmu_idx, address, &res.f);
+        *out = res.f;
         return true;
-    } else if (probe) {
-        return false;
-    } else {
-        /* now we have a real cpu fault */
-        cpu_restore_state(cs, retaddr);
-        arm_deliver_fault(cpu, address, access_type, mmu_idx, fi);
     }
+    if (probe) {
+        return false;
+    }
+
+    /* Now we have a real cpu fault. */
+    cpu_restore_state(cs, ra);
+    arm_deliver_fault(cpu, address, access_type, mmu_idx, fi);
 }
 #else
 void arm_cpu_record_sigsegv(CPUState *cs, vaddr addr,
-- 
2.43.0
