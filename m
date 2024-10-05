Received: by 2002:a17:505:c89:b0:1be9:327d:8ee3 with SMTP id hp9csp1047847njb;
        Sat, 5 Oct 2024 08:26:06 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWm2xoSQEH4c04U13LSzEdhcPaM02Ce4kkUM9+/eE7P0hfenxoPSH2ZiWy+ydJvOlBK9YEkvAHJxOCY2Q==@linaro.org
X-Received: by 2002:a17:903:22d0:b0:20b:8325:5a2a with SMTP id d9443c01a7336-20bfdfb1f1emr97410895ad.20.1728141965850;
        Sat, 05 Oct 2024 08:26:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1728141965; cv=none;
        d=google.com; s=arc-20240605;
        b=iuk4SloM5BT0ONOHy5hBK/Mldn2XMiEBVMndYsyBSGwq7mGo257zqPIZcQRD8MuzX7
         hGsShLrVR3Vs9atgJB2AErtAO/1nFBj4fzkpHZj9MuwaK52SQ4XuJPbT25ohbctJWINr
         uTjH6Vi+njiA7AJgABsEN1jkVHbPcF1YyXJDopXk16dstPfGAwcqUwQ8gzkYRlg32BLw
         KWCyIuUWvgrBRbhgWetlKZR9WwCDBe/YPkdeyfCxwRmvHDZuwzB260EO8Ek9auTKyxM3
         pS8U88KssMEF0NZMk4Pg1rirtt1d7rLOy32Wrfd/HZwEckBjU9gKGYXUmGvu6qBLZQUc
         PyPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=E1uh5v8Er5HwrssIP/tcmhd1DyyVCAW+cpRhBaU0frQ=;
        fh=sP1eIHkAdz9g4bdlj9FI5d/6yMBB5dswOLoB7dqm+34=;
        b=fjRYbIIKAzJWSnnmqfu52hp9XuaKGT8zG1iwQBORpdiNmWzc/7D1XIlt0XT9HiKR6X
         vnENObL6ahFB39h7R5rPpe5BT74hBgnAip8a+pKz3+ChfSc3FDibqQdkNGNMBuYXrM29
         4nL3Nt8NwsyNw7QDJOk1S8/wCG3/vwjeBssuXdXyDvRx9SQ9AkzqmFMwJ7fXgmY0aNSM
         NZFN/VOqH0YpsKdlW1vkyAWKsfd4FnXyDe+sIYOHHynQ+wnspQ9SgE059rkK+14ahg89
         vaREr07ETYu6Ly8y2L5oKjfC69vFLbnd77tVYB/ehn5GVbp7F6rQ5qDs1nzZ0jMhdrpq
         RR/A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KDOeLanC;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-20c1393be94sor10170675ad.19.2024.10.05.08.26.05
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 05 Oct 2024 08:26:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KDOeLanC;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728141965; x=1728746765; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E1uh5v8Er5HwrssIP/tcmhd1DyyVCAW+cpRhBaU0frQ=;
        b=KDOeLanCztVNfEmb8Rjbi1lFsgeAZQPmk3cPQs/dlu1YP53mzhBxAm3hgLJwbfImqJ
         JnCd4jpyL2SLXsp33yq2hpCG1cZo6j4s4qo9KJFQR+KOW6dikLrloogdfXGkjoA2w/t+
         MC/iOweIrXxK8R0iZsWluq76uDuGXMxwtiQobXkwQvvMCAp6HRFctPFYMQ7OaZyBvQq6
         EPoB0uDDWXJaWRdr2tZsWLmQ/JXR49KK91f53OUKY7i9mp9Ldd7w7K3GWgKpK6Hr6NQF
         1fhJ0LeGhozxTM//S9V5/g513CRRIwBV2eRfrGhvRLS+jN28xRlBfI/JP2E8bthY4SGd
         TAZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728141965; x=1728746765;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E1uh5v8Er5HwrssIP/tcmhd1DyyVCAW+cpRhBaU0frQ=;
        b=BRsMoE9vUWk3FDrKIyWVqyWsSg2YCrd6cltYByjYr+IqGlKppRlnOauBZspQ7oBH79
         rRvNu8j4p21QcE+qfeUkK8ifEkkjKChVyOKW1UK7FDF2rvSFubghToEhOa4V/jYaTPuw
         8BQ7xCJ5q9Hh3w1A48NRsmKmxbYz/NIOqVukRmG/ksB1Qj4MvkrbhROA1c9B+WBUdJ80
         I3CW2MmP8mBMTfBvaicnO5XMAvyDSjdoQY627u4cBMRPQEnwdyaqmEVFgobyrAnZOBmr
         3Lh0nH0BVSvXP+vzGbcSmHdw/eYxRHQ8XFQ6sccph81C/Ee8bSIkldRksv3l/RmGBnR2
         o2QQ==
X-Forwarded-Encrypted: i=1; AJvYcCUvYJRfE9WC/LLeoxi8uDbAvrNgm1QPzp+CNl5hWqdWflnZ1jJp679QSPM3KqAZusCfpZsED60/4sSTpg==@linaro.org
X-Gm-Message-State: AOJu0YyuL/HqLGB7LQNGDa95UYwWKm8oRZDHaVwMR3IG038s+1Vp/E9A
	4jDFnRBLBWWAXCxL+BX/6VmiUVax4abgc4k92Oy89zPhaEN+62sAKN3KfJCeeGfttA==
X-Google-Smtp-Source: AGHT+IHcBazs1KoKTrZ3DdroHH04DM/SKr28uFu00SI0srezv50JszdEiHHXeKd4Hjq+Y6+ipXC1jw==
X-Received: by 2002:a17:903:2307:b0:20b:9088:6545 with SMTP id d9443c01a7336-20bfe95dbcfmr96932395ad.46.1728141965422;
        Sat, 05 Oct 2024 08:26:05 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from stoup.. (174-21-81-121.tukw.qwest.net. [174.21.81.121])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20c1396948dsm14351765ad.225.2024.10.05.08.26.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Oct 2024 08:26:05 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: deller@kernel.org,
	peter.maydell@linaro.org,
	alex.bennee@linaro.org,
	linux-parisc@vger.kernel.org,
	qemu-arm@nongnu.org
Subject: [PATCH 13/20] target/arm: Pass MemOp to get_phys_addr
Date: Sat,  5 Oct 2024 08:25:44 -0700
Message-ID: <20241005152551.307923-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241005152551.307923-1-richard.henderson@linaro.org>
References: <20241005152551.307923-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: SzSbwmUV/lRN

Zero is the safe do-nothing value for callers to use.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/internals.h      | 3 ++-
 target/arm/ptw.c            | 2 +-
 target/arm/tcg/m_helper.c   | 8 ++++----
 target/arm/tcg/tlb_helper.c | 2 +-
 4 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index 1e5da81ce9..2b16579fa5 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1432,6 +1432,7 @@ typedef struct GetPhysAddrResult {
  * @env: CPUARMState
  * @address: virtual address to get physical address for
  * @access_type: 0 for read, 1 for write, 2 for execute
+ * @memop: memory operation feeding this access, or 0 for none
  * @mmu_idx: MMU index indicating required translation regime
  * @result: set on translation success.
  * @fi: set to fault info if the translation fails
@@ -1450,7 +1451,7 @@ typedef struct GetPhysAddrResult {
  *    value.
  */
 bool get_phys_addr(CPUARMState *env, vaddr address,
-                   MMUAccessType access_type, ARMMMUIdx mmu_idx,
+                   MMUAccessType access_type, MemOp memop, ARMMMUIdx mmu_idx,
                    GetPhysAddrResult *result, ARMMMUFaultInfo *fi)
     __attribute__((nonnull));
 
diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 659855133c..373095a339 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -3572,7 +3572,7 @@ bool get_phys_addr_with_space_nogpc(CPUARMState *env, vaddr address,
 }
 
 bool get_phys_addr(CPUARMState *env, vaddr address,
-                   MMUAccessType access_type, ARMMMUIdx mmu_idx,
+                   MMUAccessType access_type, MemOp memop, ARMMMUIdx mmu_idx,
                    GetPhysAddrResult *result, ARMMMUFaultInfo *fi)
 {
     S1Translate ptw = {
diff --git a/target/arm/tcg/m_helper.c b/target/arm/tcg/m_helper.c
index 23d7f73035..f7354f3c6e 100644
--- a/target/arm/tcg/m_helper.c
+++ b/target/arm/tcg/m_helper.c
@@ -222,7 +222,7 @@ static bool v7m_stack_write(ARMCPU *cpu, uint32_t addr, uint32_t value,
     int exc;
     bool exc_secure;
 
-    if (get_phys_addr(env, addr, MMU_DATA_STORE, mmu_idx, &res, &fi)) {
+    if (get_phys_addr(env, addr, MMU_DATA_STORE, 0, mmu_idx, &res, &fi)) {
         /* MPU/SAU lookup failed */
         if (fi.type == ARMFault_QEMU_SFault) {
             if (mode == STACK_LAZYFP) {
@@ -311,7 +311,7 @@ static bool v7m_stack_read(ARMCPU *cpu, uint32_t *dest, uint32_t addr,
     bool exc_secure;
     uint32_t value;
 
-    if (get_phys_addr(env, addr, MMU_DATA_LOAD, mmu_idx, &res, &fi)) {
+    if (get_phys_addr(env, addr, MMU_DATA_LOAD, 0, mmu_idx, &res, &fi)) {
         /* MPU/SAU lookup failed */
         if (fi.type == ARMFault_QEMU_SFault) {
             qemu_log_mask(CPU_LOG_INT,
@@ -2009,7 +2009,7 @@ static bool v7m_read_half_insn(ARMCPU *cpu, ARMMMUIdx mmu_idx, bool secure,
                       "...really SecureFault with SFSR.INVEP\n");
         return false;
     }
-    if (get_phys_addr(env, addr, MMU_INST_FETCH, mmu_idx, &res, &fi)) {
+    if (get_phys_addr(env, addr, MMU_INST_FETCH, 0, mmu_idx, &res, &fi)) {
         /* the MPU lookup failed */
         env->v7m.cfsr[env->v7m.secure] |= R_V7M_CFSR_IACCVIOL_MASK;
         armv7m_nvic_set_pending(env->nvic, ARMV7M_EXCP_MEM, env->v7m.secure);
@@ -2045,7 +2045,7 @@ static bool v7m_read_sg_stack_word(ARMCPU *cpu, ARMMMUIdx mmu_idx,
     ARMMMUFaultInfo fi = {};
     uint32_t value;
 
-    if (get_phys_addr(env, addr, MMU_DATA_LOAD, mmu_idx, &res, &fi)) {
+    if (get_phys_addr(env, addr, MMU_DATA_LOAD, 0, mmu_idx, &res, &fi)) {
         /* MPU/SAU lookup failed */
         if (fi.type == ARMFault_QEMU_SFault) {
             qemu_log_mask(CPU_LOG_INT,
diff --git a/target/arm/tcg/tlb_helper.c b/target/arm/tcg/tlb_helper.c
index 885bf4ec14..1d8b7bcaa2 100644
--- a/target/arm/tcg/tlb_helper.c
+++ b/target/arm/tcg/tlb_helper.c
@@ -344,7 +344,7 @@ bool arm_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
      * return false.  Otherwise populate fsr with ARM DFSR/IFSR fault
      * register format, and signal the fault.
      */
-    ret = get_phys_addr(&cpu->env, address, access_type,
+    ret = get_phys_addr(&cpu->env, address, access_type, 0,
                         core_to_arm_mmu_idx(&cpu->env, mmu_idx),
                         &res, fi);
     if (likely(!ret)) {
-- 
2.43.0
