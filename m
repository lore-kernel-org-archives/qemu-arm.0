Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp5706765lfg;
        Wed, 3 Mar 2021 13:49:11 -0800 (PST)
X-Received: by 2002:a1c:7415:: with SMTP id p21mr823125wmc.187.1614808151329;
        Wed, 03 Mar 2021 13:49:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1614808151; cv=none;
        d=google.com; s=arc-20160816;
        b=MqRH5b0k45hKa42SNoYyEQpuVjlOo6M3UDVnXDaTzNfEgMU3/8XdogjR4PvU0OBqSj
         Am4YRbmuz1p06R8FZnvM+YkAhvn2owqMKX7FZC49UXFq6DNcOht4oAqywhSFg8d/jk+W
         jUTMgM9XCwxk7ra/h1sQqrshMJDUJfS/d37/aDVrnYX1rkna4Z4NWBs5A/SARhDECefN
         7BmXgWrUO1ekv8QU/lAMLeZ1LXdmArLL/9Fb2Y3UIAJ42pawB+lM8jQKnwM/vHcy5ejb
         mqPIPf3q8cldE+hqlkOUAZdPJ3/UzzKntZyCQVJ/0iUbzGJP7PDl1PqJDkPgiZ7ITbP3
         OfQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=S715M+675Z0PbXHD9I+O0NRlMeoHb9x2yw8235n4aD4=;
        b=RHf9DOD2d/srAArbfZUEZZPvojt5lJFVp8ZwziDfqOWlimkCBnpBDUfFeP1rnws7R7
         PuiZ3hdy1eUqd6Ut4ikl4dLkwsgL++He7aHYOKbAGYRg1cU99bsJp4HFa85C0MXDlZAl
         Roe5ekJGL0s7ujEMbzJRvhqCJyMNq18tYjV/Ft6/5meBzdWvwBzBgGhhBTE5aE2pU1Bg
         a+nKU2uekd7RF7BsIn7bDwPudnh3n/Jt25x2FZcXe0pjT3DiI9uPPUNJTO8Bw/qnVKut
         jAYZUz5WtizjZKtak56TJyP2AQMA6qmCFoEtCb+kFdo9RvzXsDsX0dy4kW1tLoOrPTPI
         msXw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=DNtWkruq;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id r10sor869710wma.24.2021.03.03.13.49.11
        (Google Transport Security);
        Wed, 03 Mar 2021 13:49:11 -0800 (PST)
Received-SPF: pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=DNtWkruq;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=S715M+675Z0PbXHD9I+O0NRlMeoHb9x2yw8235n4aD4=;
        b=DNtWkruqQxMBHcQBamIrB4xsS7MiGaAHrAuEuSs5YOzzpdCnZZm7sKSNOXBWI5liGW
         H2lDY0QTTk+AyiIejw1ZHVZJlLHGPtQ9o/o3k8LwkPNwIO4cVZZSDE519gmSckUlxsDf
         tr53Ze5OuSq4JewiMuHpFs6rIGKIXGCNLIgcsQLwQkXIxRRkjsxmnXR7wKfByBpXIlfw
         z5Y01cxTBhYxiYtpta2UG4LMabBcIGwunB56wdmrFy3qOypaepMshPs4m8+mE/Gws6XD
         1lVReeu3obRyPgms1cnCdr7zV+MSK37qVJ2U1H/Dp66kQYwD6/8D3VTXjZnqD2vCALbS
         nSYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=S715M+675Z0PbXHD9I+O0NRlMeoHb9x2yw8235n4aD4=;
        b=cWcY8fndMo/1k7xlnAlyJcBifLUAK2KytSYVh1+4celmqL9GeVweGjC2LKMZNyfxdo
         v9jvohBYAgLHF2OLMafvJdWCifi4W1Zezu0cTAxF02K0uOyxg34aZ7vwcNf/cP7zxjv5
         1RQoLrQGW0n1mPfvsGqmqjGwIUNvB3xllrJjn3NghpTWU6z31Yk0BJMXtKS0pbZnPKFT
         eWxi97js208gQrxTAjjpV3uiTIxx0fQOXfBk5dvKBOlI2FPGb/6Uv81d4uF1nHIMrpqz
         ieGX5IUgbCbXt19CtuBAZ3u6RCFcEMk+VI1HpUpG1M6r+9bF4tpsw+DSUWB+Jhb+qrdn
         mRFg==
X-Gm-Message-State: AOAM533NryaZIMruUReWI9wKxFnBSPsGP5SAVJS1Arkhf16nPxJRpBiW
	l0kR4BURd+T2EtU+P0deOgg=
X-Google-Smtp-Source: ABdhPJyzq/395EXQ7e4rc/g9RXP3aHnx4RSP9K994E5vIztFHzllmbAJ3xzDwYr2hRTxnQ8Y/iALCg==
X-Received: by 2002:a05:600c:2254:: with SMTP id a20mr852186wmm.115.1614808150922;
        Wed, 03 Mar 2021 13:49:10 -0800 (PST)
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net. [83.57.175.68])
        by smtp.gmail.com with ESMTPSA id i8sm39345178wry.90.2021.03.03.13.49.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Mar 2021 13:49:10 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Cc: Claudio Fontana <cfontana@suse.de>,
	qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	qemu-s390x@nongnu.org,
	Thomas Huth <thuth@redhat.com>,
	qemu-ppc@nongnu.org,
	Laurent Vivier <laurent@vivier.eu>,
	Cornelia Huck <cohuck@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v4 22/28] target/arm: Restrict watchpoint code to system emulation
Date: Wed,  3 Mar 2021 22:47:02 +0100
Message-Id: <20210303214708.1727801-23-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210303214708.1727801-1-f4bug@amsat.org>
References: <20210303214708.1727801-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: qSiUZSv/IpJV

We can not use watchpoints in user-mode emulation because we
need the softmmu slow path to detect accesses to watchpointed
memory. Add #ifdef'ry around it.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/arm/internals.h    |  2 ++
 target/arm/cpu.c          |  4 ++--
 target/arm/debug_helper.c |  8 ++++++++
 target/arm/helper.c       |  4 ++++
 target/arm/sve_helper.c   | 12 ++++++++++++
 5 files changed, 28 insertions(+), 2 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index 3fb295431ae..8fa0a244d59 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -263,6 +263,7 @@ static inline bool extended_addresses_enabled(CPUARMState *env)
            (arm_feature(env, ARM_FEATURE_LPAE) && (tcr->raw_tcr & TTBCR_EAE));
 }
 
+#ifndef CONFIG_USER_ONLY
 /*
  * Update a QEMU watchpoint based on the information the guest has set in the
  * DBGWCR<n>_EL1 and DBGWVR<n>_EL1 registers.
@@ -286,6 +287,7 @@ bool arm_debug_check_watchpoint(CPUState *cs, CPUWatchpoint *wp);
  * addresses.
  */
 vaddr arm_adjust_watchpoint_address(CPUState *cs, vaddr addr, int len);
+#endif /* !CONFIG_USER_ONLY */
 
 void hw_breakpoint_update(ARMCPU *cpu, int n);
 /*
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 09566a535e5..efc338b24eb 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -432,10 +432,10 @@ static void arm_cpu_reset(DeviceState *dev)
     if (kvm_enabled()) {
         kvm_arm_reset_vcpu(cpu);
     }
-#endif
 
-    hw_breakpoint_update_all(cpu);
     hw_watchpoint_update_all(cpu);
+#endif
+    hw_breakpoint_update_all(cpu);
     arm_rebuild_hflags(env);
 }
 
diff --git a/target/arm/debug_helper.c b/target/arm/debug_helper.c
index 980110e1328..b8b7d81762d 100644
--- a/target/arm/debug_helper.c
+++ b/target/arm/debug_helper.c
@@ -11,6 +11,8 @@
 #include "exec/exec-all.h"
 #include "exec/helper-proto.h"
 
+#ifndef CONFIG_USER_ONLY
+
 /* Return true if the linked breakpoint entry lbn passes its checks */
 static bool linked_bp_matches(ARMCPU *cpu, int lbn)
 {
@@ -227,6 +229,8 @@ bool arm_debug_check_watchpoint(CPUState *cs, CPUWatchpoint *wp)
     return check_watchpoints(cpu);
 }
 
+#endif /* !CONFIG_USER_ONLY */
+
 static bool check_breakpoints(ARMCPU *cpu)
 {
     CPUARMState *env = &cpu->env;
@@ -240,11 +244,13 @@ static bool check_breakpoints(ARMCPU *cpu)
         return false;
     }
 
+#ifndef CONFIG_USER_ONLY
     for (int n = 0; n < ARRAY_SIZE(env->cpu_breakpoint); n++) {
         if (bp_wp_matches(cpu, n, false)) {
             return true;
         }
     }
+#endif /* !CONFIG_USER_ONLY */
     return false;
 }
 
@@ -267,6 +273,7 @@ void arm_debug_excp_handler(CPUState *cs)
     CPUARMState *env = &cpu->env;
     uint64_t pc;
     bool same_el;
+#ifndef CONFIG_USER_ONLY
     CPUWatchpoint *wp_hit = cs->watchpoint_hit;
 
     if (wp_hit && (wp_hit->flags & BP_CPU)) {
@@ -282,6 +289,7 @@ void arm_debug_excp_handler(CPUState *cs)
                         arm_debug_target_el(env));
         return;
     }
+#endif /* !CONFIG_USER_ONLY */
 
     pc = is_a64(env) ? env->pc : env->regs[15];
     same_el = (arm_debug_target_el(env) == arm_current_el(env));
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 54648c7fbb6..2e7a6356ae3 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -6345,6 +6345,7 @@ static const ARMCPRegInfo zcr_el3_reginfo = {
     .writefn = zcr_write, .raw_writefn = raw_write
 };
 
+#ifndef CONFIG_USER_ONLY
 void hw_watchpoint_update(ARMCPU *cpu, int n)
 {
     CPUARMState *env = &cpu->env;
@@ -6470,6 +6471,7 @@ static void dbgwcr_write(CPUARMState *env, const ARMCPRegInfo *ri,
     raw_write(env, ri, value);
     hw_watchpoint_update(cpu, i);
 }
+#endif /* !CONFIG_USER_ONLY */
 
 void hw_breakpoint_update(ARMCPU *cpu, int n)
 {
@@ -6643,6 +6645,7 @@ static void define_debug_regs(ARMCPU *cpu)
         define_arm_cp_regs(cpu, dbgregs);
     }
 
+#ifndef CONFIG_USER_ONLY
     for (i = 0; i < arm_num_wrps(cpu); i++) {
         ARMCPRegInfo dbgregs[] = {
             { .name = "DBGWVR", .state = ARM_CP_STATE_BOTH,
@@ -6661,6 +6664,7 @@ static void define_debug_regs(ARMCPU *cpu)
         };
         define_arm_cp_regs(cpu, dbgregs);
     }
+#endif /* !CONFIG_USER_ONLY */
 }
 
 static void define_pmu_regs(ARMCPU *cpu)
diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index 844db08bd57..ed3f22d78a5 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -4849,6 +4849,7 @@ void sve_ldnfff1_r(CPUARMState *env, void *vg, const target_ulong addr,
                 /* Some page is MMIO, see below. */
                 goto do_fault;
             }
+#ifndef CONFIG_USER_ONLY
             if (unlikely(flags & TLB_WATCHPOINT) &&
                 (cpu_watchpoint_address_matches
                  (env_cpu(env), addr + mem_off, 1 << msz)
@@ -4856,6 +4857,7 @@ void sve_ldnfff1_r(CPUARMState *env, void *vg, const target_ulong addr,
                 /* Watchpoint hit, see below. */
                 goto do_fault;
             }
+#endif
             if (mtedesc && !mte_probe1(env, mtedesc, addr + mem_off)) {
                 goto do_fault;
             }
@@ -4900,12 +4902,14 @@ void sve_ldnfff1_r(CPUARMState *env, void *vg, const target_ulong addr,
         uint64_t pg = *(uint64_t *)(vg + (reg_off >> 3));
         do {
             if ((pg >> (reg_off & 63)) & 1) {
+#ifndef CONFIG_USER_ONLY
                 if (unlikely(flags & TLB_WATCHPOINT) &&
                     (cpu_watchpoint_address_matches
                      (env_cpu(env), addr + mem_off, 1 << msz)
                      & BP_MEM_READ)) {
                     goto do_fault;
                 }
+#endif
                 if (mtedesc && !mte_probe1(env, mtedesc, addr + mem_off)) {
                     goto do_fault;
                 }
@@ -5355,10 +5359,12 @@ void sve_ld1_z(CPUARMState *env, void *vd, uint64_t *vg, void *vm,
                                mmu_idx, retaddr);
 
                 if (likely(in_page >= msize)) {
+#ifndef CONFIG_USER_ONLY
                     if (unlikely(info.flags & TLB_WATCHPOINT)) {
                         cpu_check_watchpoint(env_cpu(env), addr, msize,
                                              info.attrs, BP_MEM_READ, retaddr);
                     }
+#endif
                     if (mtedesc && arm_tlb_mte_tagged(&info.attrs)) {
                         mte_check1(env, mtedesc, addr, retaddr);
                     }
@@ -5367,11 +5373,13 @@ void sve_ld1_z(CPUARMState *env, void *vd, uint64_t *vg, void *vm,
                     /* Element crosses the page boundary. */
                     sve_probe_page(&info2, false, env, addr + in_page, 0,
                                    MMU_DATA_LOAD, mmu_idx, retaddr);
+#ifndef CONFIG_USER_ONLY
                     if (unlikely((info.flags | info2.flags) & TLB_WATCHPOINT)) {
                         cpu_check_watchpoint(env_cpu(env), addr,
                                              msize, info.attrs,
                                              BP_MEM_READ, retaddr);
                     }
+#endif
                     if (mtedesc && arm_tlb_mte_tagged(&info.attrs)) {
                         mte_check1(env, mtedesc, addr, retaddr);
                     }
@@ -5568,11 +5576,13 @@ void sve_ldff1_z(CPUARMState *env, void *vd, uint64_t *vg, void *vm,
                 if (unlikely(info.flags & (TLB_INVALID_MASK | TLB_MMIO))) {
                     goto fault;
                 }
+#ifndef CONFIG_USER_ONLY
                 if (unlikely(info.flags & TLB_WATCHPOINT) &&
                     (cpu_watchpoint_address_matches
                      (env_cpu(env), addr, msize) & BP_MEM_READ)) {
                     goto fault;
                 }
+#endif
                 if (mtedesc &&
                     arm_tlb_mte_tagged(&info.attrs) &&
                     !mte_probe1(env, mtedesc, addr)) {
@@ -5754,10 +5764,12 @@ void sve_st1_z(CPUARMState *env, void *vd, uint64_t *vg, void *vm,
                     info.flags |= info2.flags;
                 }
 
+#ifndef CONFIG_USER_ONLY
                 if (unlikely(info.flags & TLB_WATCHPOINT)) {
                     cpu_check_watchpoint(env_cpu(env), addr, msize,
                                          info.attrs, BP_MEM_WRITE, retaddr);
                 }
+#endif
 
                 if (mtedesc && arm_tlb_mte_tagged(&info.attrs)) {
                     mte_check1(env, mtedesc, addr, retaddr);
-- 
2.26.2
