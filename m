Received: by 2002:a17:505:c89:b0:1be9:327d:8ee3 with SMTP id hp9csp1047833njb;
        Sat, 5 Oct 2024 08:26:05 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWwHzSmOGKHlgx8pn6I+Y1DAktHY8pzDGS8R1IBT+bPlPRNvIrvLlOD1rS3M08zAqYALSsSt8A+mXQ7Gg==@linaro.org
X-Received: by 2002:a17:903:1c5:b0:20b:61ec:7d23 with SMTP id d9443c01a7336-20bfe297f32mr69958105ad.39.1728141964810;
        Sat, 05 Oct 2024 08:26:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1728141964; cv=none;
        d=google.com; s=arc-20240605;
        b=Yuv/gCMnZ40pHbgpgMy3AWPb3Ol0UviWwyBCLxXS7VS7ZpVU+Rr1bG0n0HxuF7byrp
         RCo7q/JryWF6fUaSUgiMmONqpoOoyXZuSHqNC/c/bthy7YE7IUa4q/9Hyfi2Y7gaEbvl
         WJeaUiHv7Y3wuS2GjkV5dmdrLf+WzCPZ3OYe6Ev3euPQ1kM1u2epwlPfTgAN5Przq916
         mYdbz/zAeehvn9t1Uah2oTHa0xbhtGqecJY2GVg7OMIH1NWdfzWjpiIptTFXqwOXPfPt
         a2IcLqsLSqOtFC3AwkMlgzeemX/ys0NmwXtF3m5NPitJczXLNxVFCdlin4OnvjM4Eizv
         XE1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=Rc7m2CC+o/vfg9459Vx/ro/giFzSXc14VGjLvy+03yM=;
        fh=6FdCEdggl+gNKJ3PCrwgUNXI8blpCHIilwWCaVwktxg=;
        b=YBte5knJFf7Iy5a7QKCy1on1YrVV51MMIqTLhnWED44CXKKvjgzK8josj+haYiKGb3
         +njhmpPbhkycGsxUl45m1PDq7LrJL1eSJlSwamt0bwW1J4YptoYkmiwzvfRR+5qDPuY8
         5DCX+mEAa2PjSqkyomxmHd5WDnt/2NtcoTUFVS1FSQpGiTaCWlbk+Lxkvt54cgAtn5ca
         uPdudKpg9GT/i8K0osNVmRx18OUpmDL2Z/2ILkYHKisSXYPUkuaema2CMYjTAGw2z65u
         yb7K+pH6Rz6k2nzKFt7oGXgA4OfdtLx/5QkEN43pV7uBvy/0dCOvcis/yOvqlni+eHUb
         9S4w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=szdPxw09;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-20c138b0cabsor14060965ad.1.2024.10.05.08.26.04
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 05 Oct 2024 08:26:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=szdPxw09;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728141964; x=1728746764; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rc7m2CC+o/vfg9459Vx/ro/giFzSXc14VGjLvy+03yM=;
        b=szdPxw093f9TpjHZwpCgiojHZ/Vsy+ZW4ZsrsLsWZ19VFWq1Bqyk0e+HES1+6SbZH4
         am1PxQm/8usKzr0JERc1SSVd1+DC0kwmWFBmTuodQg/LtIXVU8YmffHBkSaHGwGDNPwM
         OUGUC514XLlBAoFMAsQyQ3ZxejetIkwDhjXuegUP5xeSNOqrRNWHISzRhA9zsBo67ChQ
         EvjpHj/dn5J79d0oYra7LuSsqf8DA/y6OSU3598QPrQeHpcX8DDmICmEc7dOiNDigNLq
         MkFRKjKtGZqOaFQt06xivDvtpWKwEzh+kHndiMTa2Xrsc0Zo74fvFH68pV7ul5U+Hvhh
         2BtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728141964; x=1728746764;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Rc7m2CC+o/vfg9459Vx/ro/giFzSXc14VGjLvy+03yM=;
        b=egODOAs+e+dBKaN9xYV7Hri68OUfyMpDwPFFXCw9XlBNE1BR/SrQ/HwBEVL11Ffyjq
         pV+PoWOsiFNt6fIiQghxcpYxJNF0Gz04DjIA/+/H1zBeOkSq96t4LbhxXBDmK/m3vQRg
         mTmYvrHRxFIM0cHyACzVuJEVujMnmpfoMKFdd9kS3+6PXwiOMXJWnSsZFZ0sJO1Et4jg
         ROtMFGSVPe2e1A16og61ieJ6sk0Pdu2R5tV7ZdJK+LnlBG0Mst/MZ6hgVn3NYC6qApJ3
         oVzt2hR5L+O8ei2QKEzXX09feomh5TqhaXPzLPZrB6vm3eHrCGpjUVSbLT0HM3ipvMqy
         RcPw==
X-Forwarded-Encrypted: i=1; AJvYcCUpvYwEwFQ/QmWlWv3StMP83vJkeFep4tCrKL94tJXbql9wZ1XpqvDLPxxAeeTzy+NTECxi9vOUpo6DIg==@linaro.org
X-Gm-Message-State: AOJu0Yx8Ygd/wg2niKRGJnME4tqO79YfUhDAnd/DZTftLeDPBq1R4zkV
	/+112tl1AmNBqrvjx0iBqyRHU6wy2/Yak7rDAgZnxgqYCr2r39vKMM5DckfYoVQ+KQ==
X-Google-Smtp-Source: AGHT+IEvLU9GLG2DeoI40muI2sipayJdhU5jBLMkBCCO1UbeJJe53a/eQXNvSkSI8ZhFOYTqxOfpOg==
X-Received: by 2002:a17:902:db04:b0:205:709e:1949 with SMTP id d9443c01a7336-20bff04dd11mr92195455ad.57.1728141964403;
        Sat, 05 Oct 2024 08:26:04 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from stoup.. (174-21-81-121.tukw.qwest.net. [174.21.81.121])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20c1396948dsm14351765ad.225.2024.10.05.08.26.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Oct 2024 08:26:04 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: deller@kernel.org,
	peter.maydell@linaro.org,
	alex.bennee@linaro.org,
	linux-parisc@vger.kernel.org,
	qemu-arm@nongnu.org
Subject: [PATCH 12/20] target/hppa: Add hppa_cpu_tlb_fill_align
Date: Sat,  5 Oct 2024 08:25:43 -0700
Message-ID: <20241005152551.307923-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241005152551.307923-1-richard.henderson@linaro.org>
References: <20241005152551.307923-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: EDtW3iwFvg5f

Fill in the tlb_fill_align hook, so that we can recognize
alignment exceptions in the correct priority order.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/hppa/cpu.h        |  3 +++
 target/hppa/cpu.c        |  2 +-
 target/hppa/mem_helper.c | 16 ++++++++++++----
 3 files changed, 16 insertions(+), 5 deletions(-)

diff --git a/target/hppa/cpu.h b/target/hppa/cpu.h
index 526855f982..c0567ce0ab 100644
--- a/target/hppa/cpu.h
+++ b/target/hppa/cpu.h
@@ -366,6 +366,9 @@ void hppa_set_ior_and_isr(CPUHPPAState *env, vaddr addr, bool mmu_disabled);
 bool hppa_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
                        MMUAccessType access_type, int mmu_idx,
                        bool probe, uintptr_t retaddr);
+bool hppa_cpu_tlb_fill_align(CPUState *cs, vaddr address, MemOp mop, int size,
+                             MMUAccessType access_type, int mmu_idx,
+                             bool probe, uintptr_t retaddr);
 void hppa_cpu_do_interrupt(CPUState *cpu);
 bool hppa_cpu_exec_interrupt(CPUState *cpu, int int_req);
 int hppa_get_physical_address(CPUHPPAState *env, vaddr addr, int mmu_idx,
diff --git a/target/hppa/cpu.c b/target/hppa/cpu.c
index 3b6c325e09..768abc6e5d 100644
--- a/target/hppa/cpu.c
+++ b/target/hppa/cpu.c
@@ -226,7 +226,7 @@ static const TCGCPUOps hppa_tcg_ops = {
     .restore_state_to_opc = hppa_restore_state_to_opc,
 
 #ifndef CONFIG_USER_ONLY
-    .tlb_fill_align = tlb_fill_align_first,
+    .tlb_fill_align = hppa_cpu_tlb_fill_align,
     .tlb_fill = hppa_cpu_tlb_fill,
     .cpu_exec_interrupt = hppa_cpu_exec_interrupt,
     .cpu_exec_halt = hppa_cpu_has_work,
diff --git a/target/hppa/mem_helper.c b/target/hppa/mem_helper.c
index d38054da8a..35e9170bf3 100644
--- a/target/hppa/mem_helper.c
+++ b/target/hppa/mem_helper.c
@@ -424,9 +424,9 @@ void hppa_cpu_do_transaction_failed(CPUState *cs, hwaddr physaddr,
     }
 }
 
-bool hppa_cpu_tlb_fill(CPUState *cs, vaddr addr, int size,
-                       MMUAccessType type, int mmu_idx,
-                       bool probe, uintptr_t retaddr)
+bool hppa_cpu_tlb_fill_align(CPUState *cs, vaddr addr, MemOp mop, int size,
+                             MMUAccessType type, int mmu_idx,
+                             bool probe, uintptr_t retaddr)
 {
     HPPACPU *cpu = HPPA_CPU(cs);
     CPUHPPAState *env = &cpu->env;
@@ -445,7 +445,7 @@ bool hppa_cpu_tlb_fill(CPUState *cs, vaddr addr, int size,
         break;
     }
 
-    excp = hppa_get_physical_address(env, addr, mmu_idx, a_prot, 0,
+    excp = hppa_get_physical_address(env, addr, mmu_idx, a_prot, mop,
                                      &phys, &prot);
     if (unlikely(excp >= 0)) {
         if (probe) {
@@ -473,6 +473,14 @@ bool hppa_cpu_tlb_fill(CPUState *cs, vaddr addr, int size,
     return true;
 }
 
+bool hppa_cpu_tlb_fill(CPUState *cs, vaddr addr, int size,
+                       MMUAccessType type, int mmu_idx,
+                       bool probe, uintptr_t retaddr)
+{
+    return hppa_cpu_tlb_fill_align(cs, addr, 0, size, type,
+                                   mmu_idx, probe, retaddr);
+}
+
 /* Insert (Insn/Data) TLB Address.  Note this is PA 1.1 only.  */
 void HELPER(itlba_pa11)(CPUHPPAState *env, target_ulong addr, target_ulong reg)
 {
-- 
2.43.0
