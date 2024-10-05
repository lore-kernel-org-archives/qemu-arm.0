Received: by 2002:a17:505:c89:b0:1be9:327d:8ee3 with SMTP id hp9csp1047801njb;
        Sat, 5 Oct 2024 08:26:01 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXyp2XWsUu+1zUcm1WOmFUmjz1ZVCORRZE4IAGX3TPNiZ8DZckvMFuECxmzBK6+OC1k4De8x1V9yaPbaA==@linaro.org
X-Received: by 2002:a17:902:ea08:b0:20b:8f04:b076 with SMTP id d9443c01a7336-20bfdf816a1mr95907675ad.13.1728141961036;
        Sat, 05 Oct 2024 08:26:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1728141961; cv=none;
        d=google.com; s=arc-20240605;
        b=FI3jDJVBteilzmX4dJbF99hxIh7G+qJM+40IWjpUhqtOms/5wi1NlB1FsyBY2JpHJ1
         6G822y3OhggAy6SXybB5gStndlqPC/8q3dM6nL9eS66MDb0Lldx4vBzGXreAZCyjeXqm
         Rm/uvEssek9WENxEHJ0CTCVTszSUIzzAiEKbpIcPr+BYq3Fi9/6Iw/Fp67/QXl+nRaZu
         2eLcREzkBW0WxwxDmek2sa2kh+3EJhXzJ0OtczApkIYt6oCipHY8MDtMnvfoEZ2NbTLt
         l8EPdhqksMP+NKD+csmCzgkdmIy8xL782Gpu4DgqLhoLU0Us9H4Ve+TKJbnvpxSxxfDS
         T4fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=MP+WvwE/XecW9wPOVCpjk+gA5jxWiH/v3HQ4ejXK7hQ=;
        fh=Di3cqo1gKBOoZqpGZKhY3roE+WXR106M/I8ZQqV/5x4=;
        b=EO+NAnHC2w8vE8+mx4T8ISi4XiEZ3bA5k8U9sBUeMaEBc0FC763ciHsuaWG022uiOj
         nDR0tBk0KsjE6nUGwOAjW/9mv1OK3pSN916gCQW8tvOyx3KUCxdlh4eQzhlnmCav0cTY
         cVeXAbQVDSP5JoI9YSYcLa0oOThIgT4HEBphvFYhKd5xgruPtfN+bN6jiAmgrt0OZ2wt
         7gtEg6iaGSfssIePiKP3CI3cz9Dz9G62qEkZmzl/fH2uPiE5Ry2dG/QrLClU498l8eQH
         wJ4H9uv2R9VTDDk6DWZVFIezsP1BbW+us/hxYNQ60XTuRu5c6AiojiEmTYtyufkimkFA
         Uqzg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="YKRx09/D";
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-20c138f9d40sor15484335ad.12.2024.10.05.08.26.00
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 05 Oct 2024 08:26:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="YKRx09/D";
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728141960; x=1728746760; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MP+WvwE/XecW9wPOVCpjk+gA5jxWiH/v3HQ4ejXK7hQ=;
        b=YKRx09/Dqgz+xJNA+RQEQ+yXyGsVaL/esfq25+UmRmqvgYCAb+X03m/ofXHbiXaivO
         K/CXk9q3FNtj1QVwA2uKT7eYPWrIhtHuTeR5UeZ4aWSyXFswLZ16Z060tk4p0XeqLxtQ
         PE+cJjQebKTxIxVlYgLBTSX/nD/T+w4AYAxp+Z8Ij2EvcaXyoq8yOhgblC53qcCL0q/6
         GfU+njhTVExd4A9ClFly9d9KoOFiJM+jhjT31G9W9XefpLJq+adTmbSuGXLFVwsPyaYV
         G3OlVBdwH0RYFwq2tyd7XfTX+fYH6DzQYEnrkSAViwBlP3U50uzyG2QqwbxiavXo40uk
         /Pog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728141960; x=1728746760;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MP+WvwE/XecW9wPOVCpjk+gA5jxWiH/v3HQ4ejXK7hQ=;
        b=OUP2mDKTmjnngayfdjm5W0pFQdKSGMxTr74Tz+Z9KvTLXT08kXOpEjeDYBvTZrc5UG
         l7PluiNYFIuPOrf5/D3iAZ5pDl9Y82ZJnk86O09CI3GVrFzTMaBNRXaZDAqBHrPOvTKY
         Kzk66aiQnnyX++ZjOrvh5RK9Bp2HpAYVWHjIKhH5mMfoGZtS8aCHdwFky9xF2dudLwO2
         Ccz/1GSmNTEGBHMAfLx/OXzjY+xpDQp4avNRIkn25aUo6wY4AHpBHILON/tp7JhndMee
         PzgBUCwgKdXel+z85g6/ifX3yWVpaZdiReAOtpcMSarX/XuqXFe9PMLWybu++wGwucLS
         3z0Q==
X-Forwarded-Encrypted: i=1; AJvYcCVasqi4ACdfvllh0zskQqvcJx1TKodSGIIeojtPOgP4rBo+gUQslY3GW7WkrDt+fTQXsZCG4s/vEUppcw==@linaro.org
X-Gm-Message-State: AOJu0Yy98/s8Z8ruz3LHzUYSA4YU3TovPmYmKyBkwz9IoZkZmO1TG6+m
	JfcdDLGkYDPMwtpoXu8pERvTh59EmlaB/8DEcyZSZYTAifIZ44XlWDykPRh6xXgzOA==
X-Google-Smtp-Source: AGHT+IESYzC42ts/+MgAFBURTMzI6DPqe+lqay1qM2V34nvaOe/CY71VOZQTw0rCb6RzMXOSgxY+yw==
X-Received: by 2002:a17:902:db02:b0:20b:ba72:37c with SMTP id d9443c01a7336-20bfea542c6mr100209775ad.48.1728141960541;
        Sat, 05 Oct 2024 08:26:00 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from stoup.. (174-21-81-121.tukw.qwest.net. [174.21.81.121])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20c1396948dsm14351765ad.225.2024.10.05.08.25.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Oct 2024 08:26:00 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: deller@kernel.org,
	peter.maydell@linaro.org,
	alex.bennee@linaro.org,
	linux-parisc@vger.kernel.org,
	qemu-arm@nongnu.org
Subject: [PATCH 08/20] target/hppa: Add MemOp argument to hppa_get_physical_address
Date: Sat,  5 Oct 2024 08:25:39 -0700
Message-ID: <20241005152551.307923-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241005152551.307923-1-richard.henderson@linaro.org>
References: <20241005152551.307923-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: chakxzFjMAW8

Just add the argument, unused at this point.
Zero is the safe do-nothing value for all callers.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/hppa/cpu.h        | 2 +-
 target/hppa/int_helper.c | 2 +-
 target/hppa/mem_helper.c | 9 +++++----
 target/hppa/op_helper.c  | 2 +-
 4 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/target/hppa/cpu.h b/target/hppa/cpu.h
index f4e051f176..526855f982 100644
--- a/target/hppa/cpu.h
+++ b/target/hppa/cpu.h
@@ -369,7 +369,7 @@ bool hppa_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
 void hppa_cpu_do_interrupt(CPUState *cpu);
 bool hppa_cpu_exec_interrupt(CPUState *cpu, int int_req);
 int hppa_get_physical_address(CPUHPPAState *env, vaddr addr, int mmu_idx,
-                              int type, hwaddr *pphys, int *pprot);
+                              int type, MemOp mop, hwaddr *pphys, int *pprot);
 void hppa_cpu_do_transaction_failed(CPUState *cs, hwaddr physaddr,
                                      vaddr addr, unsigned size,
                                      MMUAccessType access_type,
diff --git a/target/hppa/int_helper.c b/target/hppa/int_helper.c
index 391f32f27d..58695def82 100644
--- a/target/hppa/int_helper.c
+++ b/target/hppa/int_helper.c
@@ -167,7 +167,7 @@ void hppa_cpu_do_interrupt(CPUState *cs)
 
                     vaddr = hppa_form_gva_psw(old_psw, env->iasq_f, vaddr);
                     t = hppa_get_physical_address(env, vaddr, MMU_KERNEL_IDX,
-                                                  0, &paddr, &prot);
+                                                  0, 0, &paddr, &prot);
                     if (t >= 0) {
                         /* We can't re-load the instruction.  */
                         env->cr[CR_IIR] = 0;
diff --git a/target/hppa/mem_helper.c b/target/hppa/mem_helper.c
index b984f730aa..a386c80fa4 100644
--- a/target/hppa/mem_helper.c
+++ b/target/hppa/mem_helper.c
@@ -197,7 +197,7 @@ static int match_prot_id64(CPUHPPAState *env, uint32_t access_id)
 }
 
 int hppa_get_physical_address(CPUHPPAState *env, vaddr addr, int mmu_idx,
-                              int type, hwaddr *pphys, int *pprot)
+                              int type, MemOp mop, hwaddr *pphys, int *pprot)
 {
     hwaddr phys;
     int prot, r_prot, w_prot, x_prot, priv;
@@ -340,7 +340,7 @@ hwaddr hppa_cpu_get_phys_page_debug(CPUState *cs, vaddr addr)
     mmu_idx = (cpu->env.psw & PSW_D ? MMU_KERNEL_IDX :
                cpu->env.psw & PSW_W ? MMU_ABS_W_IDX : MMU_ABS_IDX);
 
-    excp = hppa_get_physical_address(&cpu->env, addr, mmu_idx, 0,
+    excp = hppa_get_physical_address(&cpu->env, addr, mmu_idx, 0, 0,
                                      &phys, &prot);
 
     /* Since we're translating for debugging, the only error that is a
@@ -438,7 +438,8 @@ bool hppa_cpu_tlb_fill(CPUState *cs, vaddr addr, int size,
         break;
     }
 
-    excp = hppa_get_physical_address(env, addr, mmu_idx, a_prot, &phys, &prot);
+    excp = hppa_get_physical_address(env, addr, mmu_idx, a_prot, 0,
+                                     &phys, &prot);
     if (unlikely(excp >= 0)) {
         if (probe) {
             return false;
@@ -678,7 +679,7 @@ target_ulong HELPER(lpa)(CPUHPPAState *env, target_ulong addr)
     hwaddr phys;
     int prot, excp;
 
-    excp = hppa_get_physical_address(env, addr, MMU_KERNEL_IDX, 0,
+    excp = hppa_get_physical_address(env, addr, MMU_KERNEL_IDX, 0, 0,
                                      &phys, &prot);
     if (excp >= 0) {
         if (excp == EXCP_DTLB_MISS) {
diff --git a/target/hppa/op_helper.c b/target/hppa/op_helper.c
index 7f79196fff..744325969f 100644
--- a/target/hppa/op_helper.c
+++ b/target/hppa/op_helper.c
@@ -334,7 +334,7 @@ target_ulong HELPER(probe)(CPUHPPAState *env, target_ulong addr,
     }
 
     mmu_idx = PRIV_P_TO_MMU_IDX(level, env->psw & PSW_P);
-    excp = hppa_get_physical_address(env, addr, mmu_idx, 0, &phys, &prot);
+    excp = hppa_get_physical_address(env, addr, mmu_idx, 0, 0, &phys, &prot);
     if (excp >= 0) {
         cpu_restore_state(env_cpu(env), GETPC());
         hppa_set_ior_and_isr(env, addr, MMU_IDX_MMU_DISABLED(mmu_idx));
-- 
2.43.0
