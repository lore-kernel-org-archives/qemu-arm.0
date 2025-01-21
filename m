Received: by 2002:a17:505:840b:b0:1be9:327d:8ee3 with SMTP id lq11csp24314njc;
        Tue, 21 Jan 2025 03:41:12 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVKz22VFJ0B4VgfB7//QpcDR+yCoMFlQtYG7xVs3SRN2gUcVRBWAimNG1cJ2nPvQ5iD/hoSf6Ksks4YOQ==@linaro.org
X-Received: by 2002:a05:600c:218b:b0:436:51bb:7a43 with SMTP id 5b1f17b1804b1-438919191f6mr169373475e9.5.1737459672553;
        Tue, 21 Jan 2025 03:41:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737459672; cv=none;
        d=google.com; s=arc-20240605;
        b=BRGZ3pmGtG90nUqM5wgKJ3eA4YIdIcjpbBzWa2yWIcRPKpFitGHIGPa05cnW5EB/nQ
         Gf//DW3oWK6osURPyvgqzQHReoFFbI8p7SRRxgmLFDqaWJOKE3tALuLHus9YTbbEfPBZ
         bAiv3GpKB05RecV0qlXYD7M7zyLuNrRaIvaidZTKU9USImxyDkdJmedKeBClI/soc2Ba
         r4GJa+8LF4XV733Hu5nBElAHDEe/p7vXwdMaRTKgq3toWcunJ7F53s6xerslby4P+9NB
         LqlZ3Cj2ND2heX3bpy5zu489QEq4XeXqyR2JhrnfeUP32pGCLImUeT53HdHlCR90Tp01
         sAeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=6+sqenivOKOaIj/HGMbrfNMWNgVlPE7OSpRM12hfj2M=;
        fh=VJwDSZzwMDFUPpr46yYsIBOEmGvx0IDz2mqqeAY64xI=;
        b=ltjv3enwO/mig2/peNZPGolpnM3SpxfZR+lIN9GpQwSs/buWPaKk7uEcN8vpdEbeX1
         ggt6zEAIBvVsZi88fMYyaK5APYZeQfkC8olc3UdLDhY/Za+g1GrgLLS2YEiqaH/GBC4U
         ywIRLhOR/FopgL9xgPz9BsawsnqFZZvrN6vHjY2pUk+nByZICeAyCXRjR6gBInGEPcyN
         kDcy0OALEPVDxvVe+hIhOZjZqXovVkqi7Itz5Th3QMipJVWeWHPsMSq00TTDmOD98GcK
         9hcDykQnRWaeNwIYmZJ2tjPVUkZA3oYg+hjEALU2UekN2f0wTu2aJ4defwlyPKQyCS3z
         GU0Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=y7ZBappl;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-43890467d32sor34791205e9.7.2025.01.21.03.41.12
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 21 Jan 2025 03:41:12 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=y7ZBappl;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737459672; x=1738064472; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6+sqenivOKOaIj/HGMbrfNMWNgVlPE7OSpRM12hfj2M=;
        b=y7ZBapplPCOMyfO8t9+8jeBO/0gbg/A+46FEL0YeI4ph2guSI2KX53KOaWxK6s/Vbk
         CNOxoEY3iHHDOl0Go9d29ljGOTOCZFpB23J2rgq/beGpnD3JBnJOk7L87JDgW0hzCvwd
         lMmUSZwgH5Y/1AUuLZ6/FPnQuS94y7z+5cNYoPKfGrdK0VsdIfJs3lWIjAxTs60qieNY
         hB+9mcKQ26kvdaUQaX+q0+ZDYDUH1hkxTs7FpnAvSLrNSdP4dE8Qv0CMkwxuPPVTGZDs
         0jh1/4Z6PXmOlf/0Mf6OujLzqXUq1At8x0ZskGKJx1j0gc4BZng5tc1FiyUukSgOHnSl
         Q2Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737459672; x=1738064472;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6+sqenivOKOaIj/HGMbrfNMWNgVlPE7OSpRM12hfj2M=;
        b=o1sWV3SsB7R6fHSuPPGbd50WkHCqClkyMcgrfF3Rg1tEXVehgY1ToTJ+h4Es5IWNHn
         cpSdzsyUB8eWxX9A9ZtDZeCj8WbJSj9zcWHBySrg2fOWbE8xxk5Ut+TTBJ1FRsF+ZNwx
         +Ghc+kMFPSYDTBopnm2PoEk0wFkcBFMqwGpb6JLwV0ztJlG3wWvh2+F2/4zadJ0GwMmi
         yZia3o8JFhhszXNEdIlB/+1Bhtt+9oh30L3KDvl2X5s0OXng3RxsDG2B0XHSWUlg0e/O
         eaCswFSsruh3McO8p5pKDciz7SnVgQG8dDDcpPR/W3R2BsgC3WqL+Mttk6Xar4Nbk6/l
         T+6A==
X-Forwarded-Encrypted: i=1; AJvYcCXC3/WkYxbKwM8ahYfRr0aJCPkKewuNj2GtV37nVyrz04IDSum/ijZDBeezAFsUBCwSkPhe9HBtK69EhA==@linaro.org
X-Gm-Message-State: AOJu0Yz+q1iXNon0SEUEvtU4Cb977ajQwmIf25qr+0EWJDIsy4dHOXVQ
	S9D6qyLcSC0STZ+3ejMTxkA64ob59Mn0JyfgrLfEChwr395Jk8z4OIxGMkP/F7ey3A==
X-Gm-Gg: ASbGncsxeQWiun5LEvPD6RTOMwivPJI4631VhS86bgFEVyvppBe4quGXZxmXjwbIVS0
	eVB5o6ZrY9ddB9raQiTh2rWP+kzzKqwrftMGVHWswKaBW+D6lYE/xIfbUzUMRPxy0fHE8BWYIcR
	kyWD7OlbUbD7RXZrUcnS3o9dY4qgsbUieNngsAY2BLQz321h2Kmy7PyXP9a7/yABghZ0tvL1zBC
	bU/UzOV3Y1HOjPIAZq0Sxchhmm5LhD8glpF8yhrmOb4SDuATTFNme4UBnBdgRR+1ZQ/hbQzengs
	FWcZ7ye3N6bU9S9i7p0wpxPYXBegcgziKa6KcFVMbJk1
X-Google-Smtp-Source: AGHT+IFAV++RtKn1KotX+3ii/fxqKc/fb8NWI3UzdXKs0eo21SJuKzQB4kr02Ht3HAyC4Lmg9PLMTg==
X-Received: by 2002:a05:600c:138f:b0:436:ed50:4f8a with SMTP id 5b1f17b1804b1-438913caeb9mr178310015e9.10.1737459672025;
        Tue, 21 Jan 2025 03:41:12 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-437c1664e8dsm179961565e9.1.2025.01.21.03.41.11
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 21 Jan 2025 03:41:11 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 03/11] accel: Prefer cached CpuClass over CPU_GET_CLASS() macro
Date: Tue, 21 Jan 2025 12:40:48 +0100
Message-ID: <20250121114056.53949-4-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250121114056.53949-1-philmd@linaro.org>
References: <20250121114056.53949-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: bQHSLPTFO26t

CpuState caches its CPUClass since commit 6fbdff87062
("cpu: cache CPUClass in CPUState for hot code paths"),
use it.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 accel/accel-target.c      | 12 +++++-------
 accel/tcg/tcg-accel-ops.c |  3 +--
 accel/tcg/translate-all.c |  2 +-
 accel/tcg/watchpoint.c    |  9 ++++-----
 4 files changed, 11 insertions(+), 15 deletions(-)

diff --git a/accel/accel-target.c b/accel/accel-target.c
index 08626c00c2d..8a16c0c3ae0 100644
--- a/accel/accel-target.c
+++ b/accel/accel-target.c
@@ -112,22 +112,20 @@ void accel_init_interfaces(AccelClass *ac)
 
 void accel_cpu_instance_init(CPUState *cpu)
 {
-    CPUClass *cc = CPU_GET_CLASS(cpu);
-
-    if (cc->accel_cpu && cc->accel_cpu->cpu_instance_init) {
-        cc->accel_cpu->cpu_instance_init(cpu);
+    if (cpu->cc->accel_cpu && cpu->cc->accel_cpu->cpu_instance_init) {
+        cpu->cc->accel_cpu->cpu_instance_init(cpu);
     }
 }
 
 bool accel_cpu_common_realize(CPUState *cpu, Error **errp)
 {
-    CPUClass *cc = CPU_GET_CLASS(cpu);
     AccelState *accel = current_accel();
     AccelClass *acc = ACCEL_GET_CLASS(accel);
 
     /* target specific realization */
-    if (cc->accel_cpu && cc->accel_cpu->cpu_target_realize
-        && !cc->accel_cpu->cpu_target_realize(cpu, errp)) {
+    if (cpu->cc->accel_cpu
+        && cpu->cc->accel_cpu->cpu_target_realize
+        && !cpu->cc->accel_cpu->cpu_target_realize(cpu, errp)) {
         return false;
     }
 
diff --git a/accel/tcg/tcg-accel-ops.c b/accel/tcg/tcg-accel-ops.c
index 6e3f1fa92b2..299d6176cfb 100644
--- a/accel/tcg/tcg-accel-ops.c
+++ b/accel/tcg/tcg-accel-ops.c
@@ -120,10 +120,9 @@ static inline int xlat_gdb_type(CPUState *cpu, int gdbtype)
         [GDB_WATCHPOINT_ACCESS] = BP_GDB | BP_MEM_ACCESS,
     };
 
-    CPUClass *cc = CPU_GET_CLASS(cpu);
     int cputype = xlat[gdbtype];
 
-    if (cc->gdb_stop_before_watchpoint) {
+    if (cpu->cc->gdb_stop_before_watchpoint) {
         cputype |= BP_STOP_BEFORE_ACCESS;
     }
     return cputype;
diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
index d56ca13cddf..5a378cb0281 100644
--- a/accel/tcg/translate-all.c
+++ b/accel/tcg/translate-all.c
@@ -622,7 +622,7 @@ void cpu_io_recompile(CPUState *cpu, uintptr_t retaddr)
      * to account for the re-execution of the branch.
      */
     n = 1;
-    cc = CPU_GET_CLASS(cpu);
+    cc = cpu->cc;
     if (cc->tcg_ops->io_recompile_replay_branch &&
         cc->tcg_ops->io_recompile_replay_branch(cpu, tb)) {
         cpu->neg.icount_decr.u16.low++;
diff --git a/accel/tcg/watchpoint.c b/accel/tcg/watchpoint.c
index af57d182d5b..52e550dec6b 100644
--- a/accel/tcg/watchpoint.c
+++ b/accel/tcg/watchpoint.c
@@ -69,7 +69,6 @@ int cpu_watchpoint_address_matches(CPUState *cpu, vaddr addr, vaddr len)
 void cpu_check_watchpoint(CPUState *cpu, vaddr addr, vaddr len,
                           MemTxAttrs attrs, int flags, uintptr_t ra)
 {
-    CPUClass *cc = CPU_GET_CLASS(cpu);
     CPUWatchpoint *wp;
 
     assert(tcg_enabled());
@@ -85,9 +84,9 @@ void cpu_check_watchpoint(CPUState *cpu, vaddr addr, vaddr len,
         return;
     }
 
-    if (cc->tcg_ops->adjust_watchpoint_address) {
+    if (cpu->cc->tcg_ops->adjust_watchpoint_address) {
         /* this is currently used only by ARM BE32 */
-        addr = cc->tcg_ops->adjust_watchpoint_address(cpu, addr, len);
+        addr = cpu->cc->tcg_ops->adjust_watchpoint_address(cpu, addr, len);
     }
 
     assert((flags & ~BP_MEM_ACCESS) == 0);
@@ -119,8 +118,8 @@ void cpu_check_watchpoint(CPUState *cpu, vaddr addr, vaddr len,
             wp->hitattrs = attrs;
 
             if (wp->flags & BP_CPU
-                && cc->tcg_ops->debug_check_watchpoint
-                && !cc->tcg_ops->debug_check_watchpoint(cpu, wp)) {
+                && cpu->cc->tcg_ops->debug_check_watchpoint
+                && !cpu->cc->tcg_ops->debug_check_watchpoint(cpu, wp)) {
                 wp->flags &= ~BP_WATCHPOINT_HIT;
                 continue;
             }
-- 
2.47.1
