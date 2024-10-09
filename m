Received: by 2002:a17:504:1f11:b0:1be9:327d:8ee3 with SMTP id z17csp532044njl;
        Tue, 8 Oct 2024 17:05:06 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW0GN/AdFyDwUXi2W6yKr2htjwEVwchzWoMCXCvnrChiZFj7i8Zv4BXnC64wbS3T9yd9LSypGRTsyoS9A==@linaro.org
X-Received: by 2002:a17:902:f54f:b0:20b:4bc6:1132 with SMTP id d9443c01a7336-20c6377fe83mr11344945ad.46.1728432306531;
        Tue, 08 Oct 2024 17:05:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1728432306; cv=none;
        d=google.com; s=arc-20240605;
        b=Ma+VZ4J7PNoP/RdyLBcxLs0LdNf+duk/tz8PnO+bJfK+E7LWBl5nv7LJjllJMoyGiL
         Ad1cq7tI61M5fta8AKtFmLBEFbUmUx3W67cnceCI1t9PKdGhiUTGvkvgfjW0jSvznfF1
         a2F0y5CEs1KwXr0HWhZZStWvW8h8hcnGIJDUW68jGBFs2rJTvNZ4Ky6HWarj2FVzioTq
         ZcNjfJ1zdNqP0o0kByUep84Ak4lEaiDgAC+Pdg98faMUUdFX8K84xiaAKqwNeNXO78OA
         0V7CsYU8iW2EHnZv3RHwbeB3rVfR6QVWhr0xCQjJU3v8oL+frATEOtPS9d4DnR6g83FC
         9gtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=iV2KSUuCTdEDpKpG+VIBV8pupsJQOA9ecDi8J+rVd34=;
        fh=WqTKh41r/rHHGlNR3qnLoqAGZdYZQkprRmjSjnQuo1s=;
        b=FBRDxvwtRCcHduvohH84czV0SeDScdwcrqcylvA3+hIUGTnijInSJmItGeBc8/O5PI
         +CL1rBmYCLtMIawvg7UwXZXpD3evycxa89kcNVn/8IOXwkNiTaKhTfteIHHd00ZqEDL7
         zTl8dIfLAw96iIwYQw7NQVhBYvkdOPAi/jehNxgRp+jvEhYo52bWCVFct0NERcjn1Kr9
         4NpkrraYdhdzQeZXH3o2zaVDSmWOMeh4bH5idlLrv9xfjSNTA/Q31pBCDWXlawEUziWh
         Yg/BrS5PLXU0CWyLKzg6+828tpG02wPuh4YIPggHAa+s/N8ZnOlZdN61d4I728eldjEj
         lkSA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rZLHCiUJ;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-20c138d4788sor53942165ad.8.2024.10.08.17.05.06
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 08 Oct 2024 17:05:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rZLHCiUJ;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728432306; x=1729037106; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iV2KSUuCTdEDpKpG+VIBV8pupsJQOA9ecDi8J+rVd34=;
        b=rZLHCiUJLdBK9IXWpotavhEQNkxdJq8qiY1jzwiqyANN7Ofmkg4SQd/JyR58gvbVFE
         vgXfdJMa/aTmvvcmVL6eahF+ZkprUqX2/f4c/+hoEczutvuOeR/jxhahhmDU1sn5J2vB
         jh+GwIZzhm8MlFR/THH59pNl8a1G4EOU7K4jZgidUVQWBBwJGVi4hdXRzVW8g502Fj0N
         G16ufDCFQG1QKjEK3zbCgdXk4ZSEj10ZvbQUXSoBoXPpg+VTynxgBbGPOeGH0AOZAp26
         CIwVvWev+zNMxuXTQY75QV+Kn2dOfd+M1YHBDkFMTR0sSHyDHhHenOsMkBMm+6NPBvr0
         WZeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728432306; x=1729037106;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iV2KSUuCTdEDpKpG+VIBV8pupsJQOA9ecDi8J+rVd34=;
        b=Q7kB6knfskA4eOETqc7YiRBwhHa4vjVfMEm5ewnoQVGIvZDyQAl40pjciORFWVbtgN
         OSmnW0Vy+wQGBPF3jN1SseV5V4YeOiBhfsHdH8rp+xY0kJbk9RY0E5tViNcldovtvd0D
         vMe3b3z6GSp5eTMgBRK4JXtqK9P43Vk3TnVhVNVTf8cIBpKSFo5yj7cavKKNbiuqSC+1
         1/U6jzpMCX5vUDTG7sEkmU620yLpKeHrH4jJRnHOtJNM/+7GgTVVHbS9b65jhlT9JrPa
         G74rj8RtgSft/RJF7Rt1quWxGdHnyKxwLUeS9dpbeuFud4eKtf3dXQTiRZB9lM44E7v0
         /AUw==
X-Forwarded-Encrypted: i=1; AJvYcCW9iQLFVOqjOU/ZezZbBSUmYZkedsNoTxDgP9Mmn43MAEdc3asrEZsbEr3avIKcYd6rVeqmuVl/BSfUJA==@linaro.org
X-Gm-Message-State: AOJu0YzSYKkZ+7Gr46uqIwKHGZXj1qEp53kjmROx8N1P0Kl2nIwQhQaj
	1Yw9/FkTuhc9FWKQInjqykhvASnttz9Gsl0El+lKfRW1QBopnzoE4+Zcjh0QXioUbQ==
X-Google-Smtp-Source: AGHT+IEKU+69FGHaarUOvElg72DCHkm1xPG7wfOM2NLThus+mTJDQJLk8D0LtS7DglEQU4MbeYyvAA==
X-Received: by 2002:a17:903:110c:b0:20c:5698:75cd with SMTP id d9443c01a7336-20c636eb2a7mr13032315ad.2.1728432306088;
        Tue, 08 Oct 2024 17:05:06 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from stoup.. (174-21-81-121.tukw.qwest.net. [174.21.81.121])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20c138cecf2sm60705105ad.104.2024.10.08.17.05.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Oct 2024 17:05:05 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: deller@kernel.org,
	peter.maydell@linaro.org,
	alex.bennee@linaro.org,
	linux-parisc@vger.kernel.org,
	qemu-arm@nongnu.org
Subject: [PATCH v3 11/20] target/hppa: Implement TCGCPUOps.tlb_fill_align
Date: Tue,  8 Oct 2024 17:04:44 -0700
Message-ID: <20241009000453.315652-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241009000453.315652-1-richard.henderson@linaro.org>
References: <20241009000453.315652-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: yLIb7uaGNIhr

Convert hppa_cpu_tlb_fill to hppa_cpu_tlb_fill_align so that we
can recognize alignment exceptions in the correct priority order.

Resolves: https://bugzilla.kernel.org/show_bug.cgi?id=219339
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/hppa/cpu.h        |  6 +++---
 target/hppa/cpu.c        |  2 +-
 target/hppa/mem_helper.c | 21 ++++++++++++---------
 3 files changed, 16 insertions(+), 13 deletions(-)

diff --git a/target/hppa/cpu.h b/target/hppa/cpu.h
index 526855f982..e45ba50a59 100644
--- a/target/hppa/cpu.h
+++ b/target/hppa/cpu.h
@@ -363,9 +363,9 @@ void hppa_cpu_dump_state(CPUState *cs, FILE *f, int);
 void hppa_ptlbe(CPUHPPAState *env);
 hwaddr hppa_cpu_get_phys_page_debug(CPUState *cs, vaddr addr);
 void hppa_set_ior_and_isr(CPUHPPAState *env, vaddr addr, bool mmu_disabled);
-bool hppa_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
-                       MMUAccessType access_type, int mmu_idx,
-                       bool probe, uintptr_t retaddr);
+bool hppa_cpu_tlb_fill_align(CPUState *cs, CPUTLBEntryFull *out, vaddr addr,
+                             MMUAccessType access_type, int mmu_idx,
+                             MemOp memop, int size, bool probe, uintptr_t ra);
 void hppa_cpu_do_interrupt(CPUState *cpu);
 bool hppa_cpu_exec_interrupt(CPUState *cpu, int int_req);
 int hppa_get_physical_address(CPUHPPAState *env, vaddr addr, int mmu_idx,
diff --git a/target/hppa/cpu.c b/target/hppa/cpu.c
index 7cf2e2f266..c38439c180 100644
--- a/target/hppa/cpu.c
+++ b/target/hppa/cpu.c
@@ -226,7 +226,7 @@ static const TCGCPUOps hppa_tcg_ops = {
     .restore_state_to_opc = hppa_restore_state_to_opc,
 
 #ifndef CONFIG_USER_ONLY
-    .tlb_fill = hppa_cpu_tlb_fill,
+    .tlb_fill_align = hppa_cpu_tlb_fill_align,
     .cpu_exec_interrupt = hppa_cpu_exec_interrupt,
     .cpu_exec_halt = hppa_cpu_has_work,
     .do_interrupt = hppa_cpu_do_interrupt,
diff --git a/target/hppa/mem_helper.c b/target/hppa/mem_helper.c
index d38054da8a..b8c3e55170 100644
--- a/target/hppa/mem_helper.c
+++ b/target/hppa/mem_helper.c
@@ -424,12 +424,11 @@ void hppa_cpu_do_transaction_failed(CPUState *cs, hwaddr physaddr,
     }
 }
 
-bool hppa_cpu_tlb_fill(CPUState *cs, vaddr addr, int size,
-                       MMUAccessType type, int mmu_idx,
-                       bool probe, uintptr_t retaddr)
+bool hppa_cpu_tlb_fill_align(CPUState *cs, CPUTLBEntryFull *out, vaddr addr,
+                             MMUAccessType type, int mmu_idx,
+                             MemOp memop, int size, bool probe, uintptr_t ra)
 {
-    HPPACPU *cpu = HPPA_CPU(cs);
-    CPUHPPAState *env = &cpu->env;
+    CPUHPPAState *env = cpu_env(cs);
     int prot, excp, a_prot;
     hwaddr phys;
 
@@ -445,7 +444,7 @@ bool hppa_cpu_tlb_fill(CPUState *cs, vaddr addr, int size,
         break;
     }
 
-    excp = hppa_get_physical_address(env, addr, mmu_idx, a_prot, 0,
+    excp = hppa_get_physical_address(env, addr, mmu_idx, a_prot, memop,
                                      &phys, &prot);
     if (unlikely(excp >= 0)) {
         if (probe) {
@@ -454,7 +453,7 @@ bool hppa_cpu_tlb_fill(CPUState *cs, vaddr addr, int size,
         trace_hppa_tlb_fill_excp(env, addr, size, type, mmu_idx);
 
         /* Failure.  Raise the indicated exception.  */
-        raise_exception_with_ior(env, excp, retaddr, addr,
+        raise_exception_with_ior(env, excp, ra, addr,
                                  MMU_IDX_MMU_DISABLED(mmu_idx));
     }
 
@@ -468,8 +467,12 @@ bool hppa_cpu_tlb_fill(CPUState *cs, vaddr addr, int size,
      * the large page protection mask.  We do not require this,
      * because we record the large page here in the hppa tlb.
      */
-    tlb_set_page(cs, addr & TARGET_PAGE_MASK, phys & TARGET_PAGE_MASK,
-                 prot, mmu_idx, TARGET_PAGE_SIZE);
+    memset(out, 0, sizeof(*out));
+    out->phys_addr = phys;
+    out->prot = prot;
+    out->attrs = MEMTXATTRS_UNSPECIFIED;
+    out->lg_page_size = TARGET_PAGE_BITS;
+
     return true;
 }
 
-- 
2.43.0
