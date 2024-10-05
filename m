Received: by 2002:a17:505:c89:b0:1be9:327d:8ee3 with SMTP id hp9csp1047778njb;
        Sat, 5 Oct 2024 08:25:59 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVGsy3rci9lxlLCCkOMqwnrQFMCX3TZzoLq4NXoYngI66RPCLkKt0Du4Iqtm+vUQXwGRttPZlJqigGTLw==@linaro.org
X-Received: by 2002:a17:903:1247:b0:20b:51b0:4b22 with SMTP id d9443c01a7336-20bff1a599fmr91487575ad.47.1728141959236;
        Sat, 05 Oct 2024 08:25:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1728141959; cv=none;
        d=google.com; s=arc-20240605;
        b=Bpnznyi/4mEyT35VxE6Er342a3k6AFZ4gCBWon2d71pQvzj3mp4oosIoKc0GIgkkaW
         H25qItPrIzYQHOkDOZ9GcAosbckxVTTXKe5hX3oFtF2sAHsZuPki5m26Ctz8fBa/DDmp
         kHnGol2QKTzL7JmQfmzgaAqbaH9evjq9rnVwbararHe0ErBvvmdbezr7BakNDHTMFy4P
         OUqsHRLlRil4bd9/VeHfOet4NYe20vBnqVnlPRDnp94HPWTh3zjb9py7igdnzc4ZD/OC
         E8wYrl+teV//0pdskhA88s9eSm4KAnFQI8yUaQTJAN2jOiUy8I6AFaetWRmlO+toTS5D
         2rpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=1f/qgYd1hp1mLwoixEUX+NfB0hBePURRnKwRiQEkN3A=;
        fh=ZneBF5lGs1Yrin3FXrkMEnExj1AhUWBZAi0wa3q4cjk=;
        b=WPVB/maO4CAJjGMIMvVeSgXq0Nm+Rb+kCxFvstpuKJ7MrD1S1cELeGUMhh7o4nKefM
         af9cYFbss07DsKVqarIlKde6UcNBlGxUWZ1f4Va5Hvm2Yd2WT86CYerHeHYqmAj6rhOE
         g1uG4Fq3AQ19gW/pWRgsemR2rOqCLCCw8ZfaJX1fWvVSWFDvd2b2UqEIm+KCFtsnxPnc
         /JgBsLyrv/VhwTVa6YdNTW1MXvUsnVRJlNE1yODpSMD5hRKttWaRSgha8J8XnuaAs/24
         WER3PWzAiF9sl/WQJgoO5vvE0f2n3obBLpxpaaMitMRtFZU5gtX3hW7EUmydo5VEK9Hi
         0lAg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QlHY7suR;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-20c1394ee18sor9538965ad.13.2024.10.05.08.25.59
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 05 Oct 2024 08:25:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QlHY7suR;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728141959; x=1728746759; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1f/qgYd1hp1mLwoixEUX+NfB0hBePURRnKwRiQEkN3A=;
        b=QlHY7suRB7Ah6xA4OqXi2ugnxDSUABwZBQTC42SrGI9PCi6+k/Ox+V5FML+LsCxbUp
         9dHeaQQRjSNoDbVe4dCht8uTpKa0T+sPh5keUOjLmxMLJbGIBrGvvokp7RsIvRr2kolL
         QijtLehb5A71KAGFGFuQFycBCJuOlQHDSnrU8k0ocNV9QOiWqB9jMZQr82i9t9YbGC4u
         nzGzi2mkEM1vIp4DQADAqWXH2PFGVd1Uvn8fOQvoju7ayBaBXxnEynypCpBhdVrsRYku
         WLBGhAcPJb1mi77URk2dAknAzRatrQja6zXVSOw0QGI+V0wsBusvU9ImBR+GhjGU6vu1
         7mkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728141959; x=1728746759;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1f/qgYd1hp1mLwoixEUX+NfB0hBePURRnKwRiQEkN3A=;
        b=SBFBFzSRhOF1NuxfwTis7tspiMvfoxrBD/foxTIcPBYCLCPRS2Z6TdKl4JOT4ZSn17
         KLpHVxL9q+3hutFkc8GhEGmJzJRggCi2osuG0QnEVyPrOwZc6TfjzSRQAD3VOROMURM8
         A44vjNfN6tnFYZmO2LwLVrgQuDgX3F7/dYw0ZJQFhJEk7M9rKLgMprAR64d4HCH6Qj5/
         5UQ6V5SU71DRSMkswGn0FHSP6PwLo0V8rsiD6wEA49ZdR7N2ht9OLUruKdNP4qqPfldw
         JhsmMFjDFCxW2sRMqDHvU2/+rxCKxi7rO2CPnotWMeF+J7+fuURgmBjZhb1S9vAICiLV
         rv5w==
X-Forwarded-Encrypted: i=1; AJvYcCXc13CmzAv42dZziGCJ0HKKptrjDARWxG4QeBHSemhG3RsRk/8XAPYvhW50ODa4TpaMiXl7lBs+NnRqUw==@linaro.org
X-Gm-Message-State: AOJu0YxCh0HDg2hgBqAf62GB4Z0idEbuZOOUdiehRXohtxtPtEsW0WH3
	VcsVKW5FJ7gSq76gh4BbS9vYLKY/B+M6q7lWMlvuGsr2YLPUQf6mRkpxCdDaEzagiA==
X-Google-Smtp-Source: AGHT+IFNgJgHqy/VR+xV+JwXb1EIli9R1fK+5kP2TeHrRKEb6qUaztlEMB6BdUtTQMmyRZuU4erYGw==
X-Received: by 2002:a17:903:41d1:b0:20b:80e6:bcdf with SMTP id d9443c01a7336-20bfe17e008mr91058345ad.23.1728141958687;
        Sat, 05 Oct 2024 08:25:58 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from stoup.. (174-21-81-121.tukw.qwest.net. [174.21.81.121])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20c1396948dsm14351765ad.225.2024.10.05.08.25.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Oct 2024 08:25:58 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: deller@kernel.org,
	peter.maydell@linaro.org,
	alex.bennee@linaro.org,
	linux-parisc@vger.kernel.org,
	qemu-arm@nongnu.org
Subject: [PATCH 06/20] hw/core/tcg-cpu-ops: Introduce tlb_fill_align hook
Date: Sat,  5 Oct 2024 08:25:37 -0700
Message-ID: <20241005152551.307923-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241005152551.307923-1-richard.henderson@linaro.org>
References: <20241005152551.307923-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: TeEUgQtdf38n

Add the hook to struct TCGCPUOps.  Add a default implementation
that recognizes alignment faults before page faults.  Populate
all TCGCPUOps structures with the default implementation.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/hw/core/tcg-cpu-ops.h | 25 +++++++++++++++++++++++++
 accel/tcg/cputlb.c            | 19 +++++++++++++++++++
 target/alpha/cpu.c            |  1 +
 target/arm/cpu.c              |  1 +
 target/arm/tcg/cpu-v7m.c      |  1 +
 target/avr/cpu.c              |  1 +
 target/hppa/cpu.c             |  1 +
 target/i386/tcg/tcg-cpu.c     |  1 +
 target/loongarch/cpu.c        |  1 +
 target/m68k/cpu.c             |  1 +
 target/microblaze/cpu.c       |  1 +
 target/mips/cpu.c             |  1 +
 target/openrisc/cpu.c         |  1 +
 target/ppc/cpu_init.c         |  1 +
 target/riscv/tcg/tcg-cpu.c    |  1 +
 target/rx/cpu.c               |  1 +
 target/s390x/cpu.c            |  1 +
 target/sh4/cpu.c              |  1 +
 target/sparc/cpu.c            |  1 +
 target/tricore/cpu.c          |  1 +
 target/xtensa/cpu.c           |  1 +
 21 files changed, 63 insertions(+)

diff --git a/include/hw/core/tcg-cpu-ops.h b/include/hw/core/tcg-cpu-ops.h
index 34318cf0e6..49420bc93d 100644
--- a/include/hw/core/tcg-cpu-ops.h
+++ b/include/hw/core/tcg-cpu-ops.h
@@ -13,6 +13,7 @@
 #include "exec/breakpoint.h"
 #include "exec/hwaddr.h"
 #include "exec/memattrs.h"
+#include "exec/memop.h"
 #include "exec/mmu-access-type.h"
 #include "exec/vaddr.h"
 
@@ -131,6 +132,21 @@ struct TCGCPUOps {
      * same function signature.
      */
     bool (*cpu_exec_halt)(CPUState *cpu);
+
+    /**
+     * @tlb_fill_align: Handle a softmmu tlb miss, and alignment fault
+     *
+     * If the access is valid, call tlb_set_page and return true;
+     * if the access is invalid and probe is true, return false;
+     * otherwise raise an exception and do not return.
+     *
+     * The alignment check is deferred to this hook, so that the
+     * target can choose to recognize either before or after the
+     * permission check.
+     */
+    bool (*tlb_fill_align)(CPUState *cpu, vaddr address, MemOp mop, int size,
+                           MMUAccessType access_type, int mmu_idx,
+                           bool probe, uintptr_t retaddr);
     /**
      * @tlb_fill: Handle a softmmu tlb miss
      *
@@ -234,6 +250,15 @@ void cpu_check_watchpoint(CPUState *cpu, vaddr addr, vaddr len,
  */
 int cpu_watchpoint_address_matches(CPUState *cpu, vaddr addr, vaddr len);
 
+/*
+ * tlb_fill_align_first:
+ *
+ * Prioritize alignment faults over page faults.
+ */
+bool tlb_fill_align_first(CPUState *cpu, vaddr address, MemOp mop, int size,
+                          MMUAccessType access_type, int mmu_idx,
+                          bool probe, uintptr_t retaddr);
+
 #endif
 
 #endif /* TCG_CPU_OPS_H */
diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index f5fca5a118..4bc34c8a37 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -1565,6 +1565,25 @@ bool tlb_plugin_lookup(CPUState *cpu, vaddr addr, int mmu_idx,
 }
 #endif
 
+
+/*
+ * Generic implementation of tlb_fill_align which recognizes
+ * alignment faults before page faults.
+ */
+bool tlb_fill_align_first(CPUState *cpu, vaddr addr, MemOp mop, int size,
+                          MMUAccessType access_type, int mmu_idx,
+                          bool probe, uintptr_t retaddr)
+{
+    unsigned a_bits = memop_alignment_bits(mop);
+
+    if (unlikely(addr & ((1 << a_bits) - 1))) {
+        cpu_unaligned_access(cpu, addr, access_type, mmu_idx, retaddr);
+    }
+
+    return cpu->cc->tcg_ops->tlb_fill(cpu, addr, size, access_type,
+                                      mmu_idx, probe, retaddr);
+}
+
 /*
  * Probe for a load/store operation.
  * Return the host address and into @flags.
diff --git a/target/alpha/cpu.c b/target/alpha/cpu.c
index 9db1dffc03..2eb5afd34a 100644
--- a/target/alpha/cpu.c
+++ b/target/alpha/cpu.c
@@ -217,6 +217,7 @@ static const TCGCPUOps alpha_tcg_ops = {
     .record_sigsegv = alpha_cpu_record_sigsegv,
     .record_sigbus = alpha_cpu_record_sigbus,
 #else
+    .tlb_fill_align = tlb_fill_align_first,
     .tlb_fill = alpha_cpu_tlb_fill,
     .cpu_exec_interrupt = alpha_cpu_exec_interrupt,
     .cpu_exec_halt = alpha_cpu_has_work,
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 19191c2391..08731ed4e0 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -2663,6 +2663,7 @@ static const TCGCPUOps arm_tcg_ops = {
     .record_sigsegv = arm_cpu_record_sigsegv,
     .record_sigbus = arm_cpu_record_sigbus,
 #else
+    .tlb_fill_align = tlb_fill_align_first,
     .tlb_fill = arm_cpu_tlb_fill,
     .cpu_exec_interrupt = arm_cpu_exec_interrupt,
     .cpu_exec_halt = arm_cpu_exec_halt,
diff --git a/target/arm/tcg/cpu-v7m.c b/target/arm/tcg/cpu-v7m.c
index 5496f14dc1..8874fe0e11 100644
--- a/target/arm/tcg/cpu-v7m.c
+++ b/target/arm/tcg/cpu-v7m.c
@@ -242,6 +242,7 @@ static const TCGCPUOps arm_v7m_tcg_ops = {
     .record_sigsegv = arm_cpu_record_sigsegv,
     .record_sigbus = arm_cpu_record_sigbus,
 #else
+    .tlb_fill_align = tlb_fill_align_first,
     .tlb_fill = arm_cpu_tlb_fill,
     .cpu_exec_interrupt = arm_v7m_cpu_exec_interrupt,
     .cpu_exec_halt = arm_cpu_exec_halt,
diff --git a/target/avr/cpu.c b/target/avr/cpu.c
index 3132842d56..6ac4434f1d 100644
--- a/target/avr/cpu.c
+++ b/target/avr/cpu.c
@@ -211,6 +211,7 @@ static const TCGCPUOps avr_tcg_ops = {
     .restore_state_to_opc = avr_restore_state_to_opc,
     .cpu_exec_interrupt = avr_cpu_exec_interrupt,
     .cpu_exec_halt = avr_cpu_has_work,
+    .tlb_fill_align = tlb_fill_align_first,
     .tlb_fill = avr_cpu_tlb_fill,
     .do_interrupt = avr_cpu_do_interrupt,
 };
diff --git a/target/hppa/cpu.c b/target/hppa/cpu.c
index 7cf2e2f266..3b6c325e09 100644
--- a/target/hppa/cpu.c
+++ b/target/hppa/cpu.c
@@ -226,6 +226,7 @@ static const TCGCPUOps hppa_tcg_ops = {
     .restore_state_to_opc = hppa_restore_state_to_opc,
 
 #ifndef CONFIG_USER_ONLY
+    .tlb_fill_align = tlb_fill_align_first,
     .tlb_fill = hppa_cpu_tlb_fill,
     .cpu_exec_interrupt = hppa_cpu_exec_interrupt,
     .cpu_exec_halt = hppa_cpu_has_work,
diff --git a/target/i386/tcg/tcg-cpu.c b/target/i386/tcg/tcg-cpu.c
index cca19cd40e..83cfb86346 100644
--- a/target/i386/tcg/tcg-cpu.c
+++ b/target/i386/tcg/tcg-cpu.c
@@ -117,6 +117,7 @@ static const TCGCPUOps x86_tcg_ops = {
     .record_sigsegv = x86_cpu_record_sigsegv,
     .record_sigbus = x86_cpu_record_sigbus,
 #else
+    .tlb_fill_align = tlb_fill_align_first,
     .tlb_fill = x86_cpu_tlb_fill,
     .do_interrupt = x86_cpu_do_interrupt,
     .cpu_exec_halt = x86_cpu_exec_halt,
diff --git a/target/loongarch/cpu.c b/target/loongarch/cpu.c
index 7212fb5f8f..ae8856d988 100644
--- a/target/loongarch/cpu.c
+++ b/target/loongarch/cpu.c
@@ -755,6 +755,7 @@ static const TCGCPUOps loongarch_tcg_ops = {
     .restore_state_to_opc = loongarch_restore_state_to_opc,
 
 #ifndef CONFIG_USER_ONLY
+    .tlb_fill_align = tlb_fill_align_first,
     .tlb_fill = loongarch_cpu_tlb_fill,
     .cpu_exec_interrupt = loongarch_cpu_exec_interrupt,
     .cpu_exec_halt = loongarch_cpu_has_work,
diff --git a/target/m68k/cpu.c b/target/m68k/cpu.c
index 1d49f4cb23..295ebd941b 100644
--- a/target/m68k/cpu.c
+++ b/target/m68k/cpu.c
@@ -534,6 +534,7 @@ static const TCGCPUOps m68k_tcg_ops = {
     .restore_state_to_opc = m68k_restore_state_to_opc,
 
 #ifndef CONFIG_USER_ONLY
+    .tlb_fill_align = tlb_fill_align_first,
     .tlb_fill = m68k_cpu_tlb_fill,
     .cpu_exec_interrupt = m68k_cpu_exec_interrupt,
     .cpu_exec_halt = m68k_cpu_has_work,
diff --git a/target/microblaze/cpu.c b/target/microblaze/cpu.c
index 135947ee80..6e63600631 100644
--- a/target/microblaze/cpu.c
+++ b/target/microblaze/cpu.c
@@ -411,6 +411,7 @@ static const TCGCPUOps mb_tcg_ops = {
     .restore_state_to_opc = mb_restore_state_to_opc,
 
 #ifndef CONFIG_USER_ONLY
+    .tlb_fill_align = tlb_fill_align_first,
     .tlb_fill = mb_cpu_tlb_fill,
     .cpu_exec_interrupt = mb_cpu_exec_interrupt,
     .cpu_exec_halt = mb_cpu_has_work,
diff --git a/target/mips/cpu.c b/target/mips/cpu.c
index 89655b1900..5a36b22256 100644
--- a/target/mips/cpu.c
+++ b/target/mips/cpu.c
@@ -553,6 +553,7 @@ static const TCGCPUOps mips_tcg_ops = {
     .restore_state_to_opc = mips_restore_state_to_opc,
 
 #if !defined(CONFIG_USER_ONLY)
+    .tlb_fill_align = tlb_fill_align_first,
     .tlb_fill = mips_cpu_tlb_fill,
     .cpu_exec_interrupt = mips_cpu_exec_interrupt,
     .cpu_exec_halt = mips_cpu_has_work,
diff --git a/target/openrisc/cpu.c b/target/openrisc/cpu.c
index 6ec54ad7a6..9223228758 100644
--- a/target/openrisc/cpu.c
+++ b/target/openrisc/cpu.c
@@ -231,6 +231,7 @@ static const TCGCPUOps openrisc_tcg_ops = {
     .restore_state_to_opc = openrisc_restore_state_to_opc,
 
 #ifndef CONFIG_USER_ONLY
+    .tlb_fill_align = tlb_fill_align_first,
     .tlb_fill = openrisc_cpu_tlb_fill,
     .cpu_exec_interrupt = openrisc_cpu_exec_interrupt,
     .cpu_exec_halt = openrisc_cpu_has_work,
diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
index 23881d09e9..42a38ec155 100644
--- a/target/ppc/cpu_init.c
+++ b/target/ppc/cpu_init.c
@@ -7482,6 +7482,7 @@ static const TCGCPUOps ppc_tcg_ops = {
 #ifdef CONFIG_USER_ONLY
   .record_sigsegv = ppc_cpu_record_sigsegv,
 #else
+  .tlb_fill_align = tlb_fill_align_first,
   .tlb_fill = ppc_cpu_tlb_fill,
   .cpu_exec_interrupt = ppc_cpu_exec_interrupt,
   .cpu_exec_halt = ppc_cpu_has_work,
diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
index dea8ab7a43..42c4ea13af 100644
--- a/target/riscv/tcg/tcg-cpu.c
+++ b/target/riscv/tcg/tcg-cpu.c
@@ -137,6 +137,7 @@ static const TCGCPUOps riscv_tcg_ops = {
     .restore_state_to_opc = riscv_restore_state_to_opc,
 
 #ifndef CONFIG_USER_ONLY
+    .tlb_fill_align = tlb_fill_align_first,
     .tlb_fill = riscv_cpu_tlb_fill,
     .cpu_exec_interrupt = riscv_cpu_exec_interrupt,
     .cpu_exec_halt = riscv_cpu_has_work,
diff --git a/target/rx/cpu.c b/target/rx/cpu.c
index 36d2a6f189..27fc372ca4 100644
--- a/target/rx/cpu.c
+++ b/target/rx/cpu.c
@@ -188,6 +188,7 @@ static const TCGCPUOps rx_tcg_ops = {
     .initialize = rx_translate_init,
     .synchronize_from_tb = rx_cpu_synchronize_from_tb,
     .restore_state_to_opc = rx_restore_state_to_opc,
+    .tlb_fill_align = tlb_fill_align_first,
     .tlb_fill = rx_cpu_tlb_fill,
 
 #ifndef CONFIG_USER_ONLY
diff --git a/target/s390x/cpu.c b/target/s390x/cpu.c
index 4e41a3dff5..8120ddeb5b 100644
--- a/target/s390x/cpu.c
+++ b/target/s390x/cpu.c
@@ -363,6 +363,7 @@ static const TCGCPUOps s390_tcg_ops = {
     .record_sigsegv = s390_cpu_record_sigsegv,
     .record_sigbus = s390_cpu_record_sigbus,
 #else
+    .tlb_fill_align = tlb_fill_align_first,
     .tlb_fill = s390_cpu_tlb_fill,
     .cpu_exec_interrupt = s390_cpu_exec_interrupt,
     .cpu_exec_halt = s390_cpu_has_work,
diff --git a/target/sh4/cpu.c b/target/sh4/cpu.c
index 8f07261dcf..b03f6dfad8 100644
--- a/target/sh4/cpu.c
+++ b/target/sh4/cpu.c
@@ -252,6 +252,7 @@ static const TCGCPUOps superh_tcg_ops = {
     .restore_state_to_opc = superh_restore_state_to_opc,
 
 #ifndef CONFIG_USER_ONLY
+    .tlb_fill_align = tlb_fill_align_first,
     .tlb_fill = superh_cpu_tlb_fill,
     .cpu_exec_interrupt = superh_cpu_exec_interrupt,
     .cpu_exec_halt = superh_cpu_has_work,
diff --git a/target/sparc/cpu.c b/target/sparc/cpu.c
index 54cb269e0a..da1bfad5f0 100644
--- a/target/sparc/cpu.c
+++ b/target/sparc/cpu.c
@@ -924,6 +924,7 @@ static const TCGCPUOps sparc_tcg_ops = {
     .restore_state_to_opc = sparc_restore_state_to_opc,
 
 #ifndef CONFIG_USER_ONLY
+    .tlb_fill_align = tlb_fill_align_first,
     .tlb_fill = sparc_cpu_tlb_fill,
     .cpu_exec_interrupt = sparc_cpu_exec_interrupt,
     .cpu_exec_halt = sparc_cpu_has_work,
diff --git a/target/tricore/cpu.c b/target/tricore/cpu.c
index 1a26171590..9d8f8f13d2 100644
--- a/target/tricore/cpu.c
+++ b/target/tricore/cpu.c
@@ -173,6 +173,7 @@ static const TCGCPUOps tricore_tcg_ops = {
     .initialize = tricore_tcg_init,
     .synchronize_from_tb = tricore_cpu_synchronize_from_tb,
     .restore_state_to_opc = tricore_restore_state_to_opc,
+    .tlb_fill_align = tlb_fill_align_first,
     .tlb_fill = tricore_cpu_tlb_fill,
     .cpu_exec_interrupt = tricore_cpu_exec_interrupt,
     .cpu_exec_halt = tricore_cpu_has_work,
diff --git a/target/xtensa/cpu.c b/target/xtensa/cpu.c
index a08c7a0b1f..b0f84403f0 100644
--- a/target/xtensa/cpu.c
+++ b/target/xtensa/cpu.c
@@ -232,6 +232,7 @@ static const TCGCPUOps xtensa_tcg_ops = {
     .restore_state_to_opc = xtensa_restore_state_to_opc,
 
 #ifndef CONFIG_USER_ONLY
+    .tlb_fill_align = tlb_fill_align_first,
     .tlb_fill = xtensa_cpu_tlb_fill,
     .cpu_exec_interrupt = xtensa_cpu_exec_interrupt,
     .cpu_exec_halt = xtensa_cpu_has_work,
-- 
2.43.0
