Received: by 2002:a17:505:c89:b0:1be9:327d:8ee3 with SMTP id hp9csp1147675njb;
        Sat, 5 Oct 2024 13:06:14 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU3qG6cXhxFVQIB6TeLOXILqL7EUWXNxPPGyGrF/hldvdEdTXn9r2bWzNoU2GBgPZ5++97fvNw+PDbuXQ==@linaro.org
X-Received: by 2002:a17:902:cf10:b0:20b:af36:ea5 with SMTP id d9443c01a7336-20bfdfaf7bdmr109507795ad.18.1728158774213;
        Sat, 05 Oct 2024 13:06:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1728158774; cv=none;
        d=google.com; s=arc-20240605;
        b=QPQdycZpBRQgPeT4U7iZ8QjVvjoXxQCDnkja1pkwkzMOApWOl4LEcZZsOo1F+03Z15
         uIjlRR2Ea+3QejUyGLJ7RD2JMgqp9NA/avOnrkOhWFePYEg1mrZIYaCqVa2NIGaJv7/F
         GxluWCr5ImRu/j0tVGc3G7mgcbKw/SDFzXpmO7VD8rnNee/sm0V+RhRrCVJiKVNAR4mc
         rohEQXryIKvmrS01/SvZ0q1upez69nJqZ3LixyBYpvmiW7xqvqrxxde/p0rgObpQo1aR
         k6PviDlnJHDrqfarSiwxE7IYpUjnpECRvu/6YuJzYdh4YPk5KkePBZ4enALXvxpIgguQ
         mc6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=E1uh5v8Er5HwrssIP/tcmhd1DyyVCAW+cpRhBaU0frQ=;
        fh=cIy9wDAJ8hDRILSXG4ifZb7922P9cCEwvDUKPCB9ZrA=;
        b=RPPFzww9Ree5Tvb5WBXNFh+kowGK/KAB5yIkkOnC7WbQ8HLxSj5cN/YJSw27zs/aZy
         RfcnME/MaZmcKq1n67HZnFyxcOo3RYspFegTSvQe/Yevkj0ypxLPip44VRz+vCcaG6z1
         juL7HaDFJkzAE1DDk/rA46uue2IY8aO+m+2ZsQO1eYSFwiLI1bHH8qj+WLoiRga4wqaq
         Oot6yEG9UeOCkVJx5sMhqHbCqE3K7lTeUfTPG1BgfNHb9+guK9+yNk0UskNum3XCd8v5
         LrjGOL8/X7BDxA5dhfYzwi4Af4aaY10QtTfxEPy7h95PzG5Glqu77zgQAUgRMCFNB38O
         qN9w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Bgcc4HsY;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-20c1393f835sor10086515ad.20.2024.10.05.13.06.14
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 05 Oct 2024 13:06:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Bgcc4HsY;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728158774; x=1728763574; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E1uh5v8Er5HwrssIP/tcmhd1DyyVCAW+cpRhBaU0frQ=;
        b=Bgcc4HsYHfEMA9Fu2lcFkTdEuVb5jt9OVTR/d8cUdsqqLrxkhf3A3YDvocNLB3YId1
         VHgqCsX77Ot9XlNrun+OSnb/auPZsb7QPRNSzdtFpZWQ4KluZcj0p/VALededd5B/62q
         iafFVlqRhldrOYQ6ZxWz3vD0pLCkcxUh5xc8OmklykGdCvlRSA3pAho5A3jSWvgc554w
         eyRWvJxfxJT2a958OimKeeNy7BJhzUcjm+cdypyrd3aAbI4IPmfsaYXG0LdKdOMlTQPH
         7IoYUt53ohoEfDhdOA7fy5RFq4bkGIcijqnwGqnUfQ6p+M8ehZIxWMZddQe9LyfmasjJ
         lbEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728158774; x=1728763574;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E1uh5v8Er5HwrssIP/tcmhd1DyyVCAW+cpRhBaU0frQ=;
        b=OFF5ffIraWXu5U/tiINXGxHuiELKzf3jvC0cGc8msOQua2WdYtk+dtK5Sl6MCPSy9Y
         CgnRyN3ltNwzTYSBIUw1uCVaByma+cPSibdyemJpfHHiJa8JvCBXWNtvH7TL+DaHpH9e
         yI7OYrdvrlTvuhMeT8qfcU1nBXZcmOOPcD1ZRd/xKW0nJzSgJu4K7ZFCWYxCZkU2tjNC
         58yXinoi+gilPXQ6MWMRc/k66ZRbnSGzzkrpeHaGx4HawFsGEMlUbZEprdZQnms52DMW
         IdbtGeNisQkcpw3ivp5MsaiC+76djyOyiuElloOBudGoptT6zEdfeBj6LM/FXB+tBVdI
         Q7yA==
X-Forwarded-Encrypted: i=1; AJvYcCW4ZYJRGagpHoC2f6QpmCRVHVwjNh4hyYUjZgHa1f0AwP27aeqMvT92OIK0IH71oIORAnGfphmD8VLhDQ==@linaro.org
X-Gm-Message-State: AOJu0YwVbzqsXb4htJ+xPV4fNgcWxq8l/HvqFI1u29kM9amq3Zik54j3
	7qKLKa+JPLfCIjz1OtS9niFE5jY352OQkBmujoDKfVxB1/zO8Ac4RZhnaX+O+Fac7k8otfk3CSF
	GnUs=
X-Google-Smtp-Source: AGHT+IFuIEZa4i6J0XzDsWHUBnGbrBzjQrdOCbbZFKtwtRYvhgzw6qHzcnt8mJfy/cgTXRoh5crEPg==
X-Received: by 2002:a17:902:d4c6:b0:20b:b48d:68e with SMTP id d9443c01a7336-20bfde57cf8mr99495885ad.7.1728158773783;
        Sat, 05 Oct 2024 13:06:13 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from stoup.. (174-21-81-121.tukw.qwest.net. [174.21.81.121])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20c13931055sm16493405ad.139.2024.10.05.13.06.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Oct 2024 13:06:13 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: deller@kernel.org,
	peter.maydell@linaro.org,
	alex.bennee@linaro.org,
	linux-parisc@vger.kernel.org,
	qemu-arm@nongnu.org
Subject: [PATCH v2 13/21] target/arm: Pass MemOp to get_phys_addr
Date: Sat,  5 Oct 2024 13:05:52 -0700
Message-ID: <20241005200600.493604-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241005200600.493604-1-richard.henderson@linaro.org>
References: <20241005200600.493604-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: wkTKYMJX+UxL

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
