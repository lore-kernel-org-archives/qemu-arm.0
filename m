Received: by 2002:a17:505:c89:b0:1be9:327d:8ee3 with SMTP id hp9csp1147746njb;
        Sat, 5 Oct 2024 13:06:21 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUpfYpX9wxGJeI6ttRXEUgCyTf0U7XxrgxBvIQOSsqGNHRaX/0fR9HaT3OxCVMerz06pWw6FQtH+aUePw==@linaro.org
X-Received: by 2002:a17:903:41ce:b0:20b:b39d:9735 with SMTP id d9443c01a7336-20bff1b044cmr93411165ad.54.1728158781104;
        Sat, 05 Oct 2024 13:06:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1728158781; cv=none;
        d=google.com; s=arc-20240605;
        b=JkfciLT8GvOPoyOuFNEQghSiMibKZ6Ssalb/o1WsXvU/lToL3vRjIG8FFk/FDcdjPz
         oCKN8KgY2w7MMu5sgpH2R2G0PXUoXttw8qkUwszWI6byxVs+Jdy+yy9GYNK7Y5n/Hh+U
         ibCi6BuRS4C7tF3WavB7TO2J1meIVmJCClLYUlXsgAqkuAbhtGw8nrmAzhlCOJiIZ4zg
         jefMiaV2a8q4izY+UbThkppdDvM5+GFIbsXTpYrNiYMJ6X/iR+UmsloekljGwffmkC04
         tEOE0RNFx69Va4QXCt0dYvuOsLL5cRItfovoZE0zZDFmPM58Ddu/4tS8gchPyc8SpKDi
         i0Qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=0AFMCCsh2dZpLpZMXFYavJotm9FHniFYW8AGrgK05Hs=;
        fh=gDVftxzEUfBGNQx8+0fjU310DaHI83kL28X8GR1cWrQ=;
        b=Yq2qizMxzcsOCARaFvc7kNmtelxNsM+pWbE7I7NXJKGThmlnHTcWh46ZyKDjlWDYzf
         P4usL6/FW+RFiwDvV2jI/64uZwLMqSOGXf8EUXEDPha7O/N+SiK74RaBKFgQCgI/o7s6
         N9i2HJ1LSTallMKxtXqoO7LTulXlbBwILQajgQ5LKx+9GOPm9EHJCyIYoHoZ1S5zYlVi
         J/2bv4AxyWe9j9LAMzw2+dd96nwLeNP/pjNI1Qoyo/f1MhuWUckmIcLAUrsfn3WrsHQR
         C7AS14YaJW9bjBt6oecGI0nAKMPk4vdEP/hzSliTk2VkGSf/AVw6PO8U/JWpovIjg1lt
         cjNw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fwjvfK81;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-20c138d562asor9514295ad.6.2024.10.05.13.06.20
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 05 Oct 2024 13:06:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fwjvfK81;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728158780; x=1728763580; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0AFMCCsh2dZpLpZMXFYavJotm9FHniFYW8AGrgK05Hs=;
        b=fwjvfK81CKhfT822L8RfoeIoWR2OYsc0y+UgqUSLLVm5d+D13k3IxH1jgxv3B1JD9C
         fjyLoICKVPy+CyMnwMnsT0cs/JUPR7rZ+ZH+5gfIkrLUbxXOuNxtKdkkqwT8uxrNf4Xw
         PsTuHQSROp6/j4WHxMVSYUMYd3MoqoKb2ovLVEsIrzdtJQs2qXylecDLjemKnKece6Fh
         j6QrSxZ5sF4DnKp+Q4wuXLs2kvFY0P/+kKZC/CurPUTKQgJuB6RNKstebAO9/U1hnJDz
         YxzNXH7NrMiGegjq93VPhPXCGJgpfE9qg/zhL+uNJZg+QRGc7hV4zZRE3Ptxnb13icck
         9Mgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728158780; x=1728763580;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0AFMCCsh2dZpLpZMXFYavJotm9FHniFYW8AGrgK05Hs=;
        b=TQALlADb1nTTnDH6SedCZWyGNhZrAggrNxOQZRvhrW7GtfvX/aYyNTn2EjEfk7DJJ6
         c032CS6we+t/WMhFihxuPb6eWPzk8M90gkZWrrEcU+1ISAVP18IqtdQZvXBC4QOL0oDL
         wr2xQO361dmvuuMjnS3fG6MXe239TPekK04GahCHcvGWgwvb/G6kcSnJ9EzGZH0qy2v+
         BpuNjdDbphs99+XYuxmSCD5b4ig9vt0Z/6HCV/XotRtLqxm/65eTDaG3GlWl4Jwz1W+f
         75q67Dg/ABiFmTuQhx9CwjA+hK4H7csYEwyS6yzl1BYVM00Mv0R8+0TmRH6+61xjGnbB
         iGPQ==
X-Forwarded-Encrypted: i=1; AJvYcCV2BLNfDuF8JqWyfoQVOq4fNfCMPbr1hEU7ARlL2LcJY3shCYra5Jx726yP1GDZ4BRG4Tp0lpdgy/6Y2g==@linaro.org
X-Gm-Message-State: AOJu0YyCHzjGBipS8TYVcgvOxxdj1PBDRc/Fgone89bmJ0WU+Ux7Hw9J
	I/rZokS65V1/nAikr+hacPKQPfbA9JutTo/7ImV6CvvniQhx6HCpyyjQegWxaGDGKw==
X-Google-Smtp-Source: AGHT+IFQWlOaLHXh4IPf9U+1cxmSVfYPLms4xolaX7BFBENlDrFNojC92ydhZIWJvqWY9iSxsqXglg==
X-Received: by 2002:a17:903:32ca:b0:206:9818:5439 with SMTP id d9443c01a7336-20bfdff2fe6mr85317145ad.19.1728158780508;
        Sat, 05 Oct 2024 13:06:20 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from stoup.. (174-21-81-121.tukw.qwest.net. [174.21.81.121])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20c13931055sm16493405ad.139.2024.10.05.13.06.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Oct 2024 13:06:20 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: deller@kernel.org,
	peter.maydell@linaro.org,
	alex.bennee@linaro.org,
	linux-parisc@vger.kernel.org,
	qemu-arm@nongnu.org
Subject: [PATCH v2 20/21] target/arm: Add arm_cpu_tlb_fill_align
Date: Sat,  5 Oct 2024 13:05:59 -0700
Message-ID: <20241005200600.493604-21-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241005200600.493604-1-richard.henderson@linaro.org>
References: <20241005200600.493604-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: sKZeHQrIuaTi

Fill in the tlb_fill_align hook.  So far this is the same
as tlb_fill_align_first, except that we can pass memop to
get_phys_addr as well.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/internals.h      |  3 +++
 target/arm/cpu.c            |  2 +-
 target/arm/tcg/cpu-v7m.c    |  2 +-
 target/arm/tcg/tlb_helper.c | 27 +++++++++++++++++++++++----
 4 files changed, 28 insertions(+), 6 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index a6088d551c..6916d43009 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -819,6 +819,9 @@ void arm_cpu_record_sigbus(CPUState *cpu, vaddr addr,
 bool arm_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
                       MMUAccessType access_type, int mmu_idx,
                       bool probe, uintptr_t retaddr);
+bool arm_cpu_tlb_fill_align(CPUState *cs, vaddr address, MemOp memop,
+                            int size, MMUAccessType access_type,
+                            int mmu_idx, bool probe, uintptr_t retaddr);
 #endif
 
 static inline int arm_to_core_mmu_idx(ARMMMUIdx mmu_idx)
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 08731ed4e0..293eb5949e 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -2663,7 +2663,7 @@ static const TCGCPUOps arm_tcg_ops = {
     .record_sigsegv = arm_cpu_record_sigsegv,
     .record_sigbus = arm_cpu_record_sigbus,
 #else
-    .tlb_fill_align = tlb_fill_align_first,
+    .tlb_fill_align = arm_cpu_tlb_fill_align,
     .tlb_fill = arm_cpu_tlb_fill,
     .cpu_exec_interrupt = arm_cpu_exec_interrupt,
     .cpu_exec_halt = arm_cpu_exec_halt,
diff --git a/target/arm/tcg/cpu-v7m.c b/target/arm/tcg/cpu-v7m.c
index 8874fe0e11..a071979636 100644
--- a/target/arm/tcg/cpu-v7m.c
+++ b/target/arm/tcg/cpu-v7m.c
@@ -242,7 +242,7 @@ static const TCGCPUOps arm_v7m_tcg_ops = {
     .record_sigsegv = arm_cpu_record_sigsegv,
     .record_sigbus = arm_cpu_record_sigbus,
 #else
-    .tlb_fill_align = tlb_fill_align_first,
+    .tlb_fill_align = arm_cpu_tlb_fill_align,
     .tlb_fill = arm_cpu_tlb_fill,
     .cpu_exec_interrupt = arm_v7m_cpu_exec_interrupt,
     .cpu_exec_halt = arm_cpu_exec_halt,
diff --git a/target/arm/tcg/tlb_helper.c b/target/arm/tcg/tlb_helper.c
index 1d8b7bcaa2..e83ece9462 100644
--- a/target/arm/tcg/tlb_helper.c
+++ b/target/arm/tcg/tlb_helper.c
@@ -318,9 +318,9 @@ void arm_cpu_do_transaction_failed(CPUState *cs, hwaddr physaddr,
     arm_deliver_fault(cpu, addr, access_type, mmu_idx, &fi);
 }
 
-bool arm_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
-                      MMUAccessType access_type, int mmu_idx,
-                      bool probe, uintptr_t retaddr)
+static bool tlb_fill_internal(CPUState *cs, vaddr address, int size,
+                              MMUAccessType access_type, MemOp memop,
+                              int mmu_idx, bool probe, uintptr_t retaddr)
 {
     ARMCPU *cpu = ARM_CPU(cs);
     GetPhysAddrResult res = {};
@@ -344,7 +344,7 @@ bool arm_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
      * return false.  Otherwise populate fsr with ARM DFSR/IFSR fault
      * register format, and signal the fault.
      */
-    ret = get_phys_addr(&cpu->env, address, access_type, 0,
+    ret = get_phys_addr(&cpu->env, address, access_type, memop,
                         core_to_arm_mmu_idx(&cpu->env, mmu_idx),
                         &res, fi);
     if (likely(!ret)) {
@@ -371,6 +371,25 @@ bool arm_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
         arm_deliver_fault(cpu, address, access_type, mmu_idx, fi);
     }
 }
+
+bool arm_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
+                      MMUAccessType access_type, int mmu_idx,
+                      bool probe, uintptr_t retaddr)
+{
+    return tlb_fill_internal(cs, address, size, access_type, 0,
+                             mmu_idx, probe, retaddr);
+}
+
+bool arm_cpu_tlb_fill_align(CPUState *cs, vaddr address, MemOp memop,
+                            int size, MMUAccessType access_type,
+                            int mmu_idx, bool probe, uintptr_t retaddr)
+{
+    if (unlikely(address & ((1 << memop_alignment_bits(memop)) - 1))) {
+        arm_cpu_do_unaligned_access(cs, address, access_type, mmu_idx, retaddr);
+    }
+    return tlb_fill_internal(cs, address, size, access_type, memop,
+                             mmu_idx, probe, retaddr);
+}
 #else
 void arm_cpu_record_sigsegv(CPUState *cs, vaddr addr,
                             MMUAccessType access_type,
-- 
2.43.0
