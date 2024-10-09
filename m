Received: by 2002:a17:504:1f11:b0:1be9:327d:8ee3 with SMTP id z17csp532057njl;
        Tue, 8 Oct 2024 17:05:07 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCX7sxeba819k2LVRUlliIFydN1aVOR1iIDoOhXL1FqX7Nk58XWYqLaIDXCmd0NgSvCWM1IIi6JTXZg4Ww==@linaro.org
X-Received: by 2002:a17:902:e548:b0:20b:ce88:1b9d with SMTP id d9443c01a7336-20c6378004cmr11521355ad.45.1728432307662;
        Tue, 08 Oct 2024 17:05:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1728432307; cv=none;
        d=google.com; s=arc-20240605;
        b=cfpu61Zz33OnxU6ssDk6jyTI2+wRDo4+lp6z1lOfLUqOVsSm+ySs6BUwfSug8PV+oG
         e3kEWF+DvdZVjA0144ooWK77jthvwYdFiw+vLpwSPNNZ3l0n/dS0M4J4ht+Z7vjXPMih
         iPxlGtkRDUUu2Yiethc8g/gsavfkXCemRrtDDlwNfJfcYMRsVbswq6k4CMDDA3NpEdnI
         Xq4jyXSl9D6HyFvyhIByxW56ZbKljpUMOGKYf3m6bkRJYelLi2fM7xZNjCLJVNmzyz90
         5wFdGY2vtj4AvcdsYQU/COatqxCv63UNINDV1tJB+lI+fNz1cuU5PQiE4Ed1BrVXVkTT
         vteg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=RUID/VOY3Ga2ZN/DeZx4JrZs9/xknXUyzF7dZ/9YQNo=;
        fh=cbU40Zo5MTcMN15bQ5b/GIrxBoe35lvw2EeMaNhvcmw=;
        b=BB69rZjHILm3exEL8MSjjBLRHPt7GuqoVohtx+Ii7JCX68OZUlfzqaIWtE+OPSgGJF
         CdOuCRv+5mYU02BCCIMlg4mnEYkkPzPLJCvxXahDw8jA67UAl8kcxImJZOnxDzTFqHjz
         vUcMe4zNOBaYMHwDRCcUJzCMLN69cTsCd4+AIDMUgY5oByEpQMUMls4buAtk6L5ZOIqU
         0Ruhk9w09nL2gjlP0dDreV0Dp31vKTfbBWgAMKKpfqBskzrEE/lsWyI6QOYE9PRNuLEb
         4egNInQ4QHycKN4Ipf93QWPwnMUFhSpgmyRBirLgYUssZ03+qoHVbpipxrwNMJrs8dVQ
         hnOg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=E6EnWsFT;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-20c138a2d76sor45503305ad.1.2024.10.08.17.05.07
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 08 Oct 2024 17:05:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=E6EnWsFT;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728432307; x=1729037107; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RUID/VOY3Ga2ZN/DeZx4JrZs9/xknXUyzF7dZ/9YQNo=;
        b=E6EnWsFTZgUXTDEZlw/mavO7sY2EMsFargcdEH6ZCJlxRqAOlYWIXp0S4ZZVvN9dZo
         75r4anqSL27jgjP1twA26he9CP6Cg8WzT4FG+38B9uyZOOwM7a8KeINkyFl4y09aTF4J
         xM3/82BNUjakfl+8K652f+4rLKvSiujd4Aeeao6WILR5om524aYzGUtsPVfiRmqJeRB5
         Nc3GzGXWIb55Lk1UHyjsnAXVosB6yIw06xNTgRfTZym412d4mTkcxb+JLUt8WDHWIg9W
         vME7hoiFCGdCzpWCmLD06Wg5oGkNpPoQ3X/xW0wGKPpBNGrXwQu8uxDhSDf3xNXmP7zm
         /Kig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728432307; x=1729037107;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RUID/VOY3Ga2ZN/DeZx4JrZs9/xknXUyzF7dZ/9YQNo=;
        b=Zs6c+Nst9wbkkcxQ3bkdPowvul4r86KwwtxAGXPnmhkJ8+wOoA7r+Dde9C1cbHSRIB
         p65nvMju3r/ekOciqQ9gLg4OOCf1OwYoGGF9m57wXbHwtJ6+8mipZraUgvQOYWikK1EG
         s89x6LA6Gjrk6M1U/G8tNcfrufsg/m957AX6vRwxg8/DkjDgYkOkfJQ3GAs83xjrLyJh
         z1sz53Cmamd9FaDG5IKLT0MEZgx4imDis+ZQxGz2W2gJaU3jtOQ8BhAYtKf6UyZztYOm
         kb+4V+BO9tnCGNNR3u9zv3PY8Ekz2QsVmM3es8NquysnlgoONJ7X/TKb0Cy03E01nVnh
         DXRg==
X-Forwarded-Encrypted: i=1; AJvYcCWHJEcRPc34vjwUJs9S8V+rS7c2m+JHVqphlnhx61K0YagqoOGguwMgvCF/NeA/jv/+37hdKppF/4JSlQ==@linaro.org
X-Gm-Message-State: AOJu0Yx1OH3fOXOJj/ebdgtt4BGhYLDk5NQpqeMZ1i+VRLbBciP9iW3s
	ABlW92httEYsW91Oef8hSyWUJxHu6Fb7N4UbW4N8hImuYhayxKc2XEaE21aFON9MPQ==
X-Google-Smtp-Source: AGHT+IEOzR02cuGQIAfO5rhioXqq6+S1yUdY62tdcjtmeVq0WQ3OZwwN00IC+X3KAkSW8TC6DwnsKg==
X-Received: by 2002:a17:902:e88f:b0:207:2093:99bb with SMTP id d9443c01a7336-20c63743a92mr10917825ad.31.1728432307098;
        Tue, 08 Oct 2024 17:05:07 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from stoup.. (174-21-81-121.tukw.qwest.net. [174.21.81.121])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20c138cecf2sm60705105ad.104.2024.10.08.17.05.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Oct 2024 17:05:06 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: deller@kernel.org,
	peter.maydell@linaro.org,
	alex.bennee@linaro.org,
	linux-parisc@vger.kernel.org,
	qemu-arm@nongnu.org,
	Helge Deller <deller@gmx.de>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v3 12/20] target/arm: Pass MemOp to get_phys_addr
Date: Tue,  8 Oct 2024 17:04:45 -0700
Message-ID: <20241009000453.315652-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241009000453.315652-1-richard.henderson@linaro.org>
References: <20241009000453.315652-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: FwFSZwGMf1Qh

Zero is the safe do-nothing value for callers to use.

Reviewed-by: Helge Deller <deller@gmx.de>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
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
