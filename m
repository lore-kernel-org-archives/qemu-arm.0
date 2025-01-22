Received: by 2002:a17:505:840b:b0:1be9:327d:8ee3 with SMTP id lq11csp654796njc;
        Wed, 22 Jan 2025 01:30:54 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCV/p4pit7uOp29pUW2AHj14oI9uY+YmK9zOl6t32YujE9N+05iPb5o5uVH+6oU7Xpb3JPMtwbA/GBqcIw==@linaro.org
X-Received: by 2002:a5d:6c66:0:b0:385:fae2:f443 with SMTP id ffacd0b85a97d-38bf57a91a1mr17462228f8f.34.1737538254061;
        Wed, 22 Jan 2025 01:30:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737538254; cv=none;
        d=google.com; s=arc-20240605;
        b=Mks4Gb+d3+qD2oFwqm8pTnUMZGuc49xmPKmHDj3EN3ygqrgMctwnlcZvCOi9qBcPKb
         mf/+V3qynQQI3W/dC81HznkvWPBurcVl900iAwDM/8iDqmhsLpf+pVs57pw8+g6gbB8e
         beV1XWLleKFAYe14pfXK94Awl/v9ldCE9yCb6PXoNj+1d/T2/qHBrcs1Npj8ZVjj0YmE
         7E+PZ0j5N+dKBYk8B3Gd0C7IRHy/g/WHXDDb4LovcHkV+g6YmrsOnkV8/wUtR4TwrzxM
         tjl0tnOqnetMqsAiNidVkSReUb/ftHwQ92ip8jVpQDyHlliLTtE6aeOIq+Q52ARhq5Bh
         bMaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=3ds9Wj0QZU42GLHBsVwmUFq56bCDGO06IGIH+Sdiodc=;
        fh=ECGup+0e8AAqeg+gejHU78lsPJmh+tXsk4rPamELtoQ=;
        b=XTsT5yIEhzZLVNz2UMI4LIXxjAx38SFif6PDGAZfCST0zjzbaoA5v0t/Slvgua9Q++
         ODHnNaui+01OCvL1Vf+SoFxR40HPq5Pguh2Te0DxZlxVr8fKMNha16w/1UZpdGG/EYl7
         LR9vlVk0LZ6Cg1gAfBvcJBGemk9QBp/ccoehprDLdgGzP5nkeG9dd3SYOXXGRARFP951
         sCTpkNd9kRtGQwWoMtiiVdmzPYbRTrPAsGeZ/N6zWYubORx2rBewrmlJQUrXccLBwveR
         9PHBTkE+KP5TIBG4laQhlV4To2T/LjD/88n4KvC6w+6eTK5crloxXKYqDlwSGE3TrWIM
         gQoQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FzMIaehI;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ffacd0b85a97d-38bf321dd5fsor4137850f8f.3.2025.01.22.01.30.53
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 22 Jan 2025 01:30:54 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FzMIaehI;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737538253; x=1738143053; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3ds9Wj0QZU42GLHBsVwmUFq56bCDGO06IGIH+Sdiodc=;
        b=FzMIaehISOUDtTC4S2ayBtM6aghNO1UDbmmLD7cVxPmHyf/LP4yOW2SPzQTwRh7vDU
         R4PbuHK+ReeNH2pC34kEiwifMFVFNl9qdwAVIaSl/f5z9IVq1m0mxF5Umyjo44OztyFX
         atoHLINatF/fjDpETpSQ0BqyJhrZTDHRbRf7aD//QSIj48FLSk/3Tf4DquLnCvmOGrPa
         6ZjY0TqaH8hdtN0yIwtZukt7OdoWUMAO6qwkBLORrfTJa6rI00ns3vTH5eidlrKmqZRa
         jBHr8fJnNyb17QXUvcKTw0MYcx6kBcrds8EnexVAA+bnoQRUdvjcHVdHr1cKWBeApYgt
         E4zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737538253; x=1738143053;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3ds9Wj0QZU42GLHBsVwmUFq56bCDGO06IGIH+Sdiodc=;
        b=YkM5du7scPGvm+9Ddj4jasmzc1UsQYcQiodz70xoZBMjumLk5DnBg13jElUHXc0jIz
         bNpCIOA2GG/yAaxnOL6eSCIk+5gtVdFVM+i+OANAVDRnmIhm7CfDhyl6wGWSn4Jlwk72
         mYlnedzQcLKjH+3LXlgPi6SgxfqQkSpjTYeI/qevOkQMsPmTa4W3rNP+hULGjpNEj/g6
         nJ5NQAqhxhCfOJpv6wY/EOlfhWhxgkWVeGgKYVr8XLgpth0ohEfdeMjrHwR9q7VZBQQI
         vD74aH5duuGu0TV4hrEO9nr50ofifQf4PemZ9THFXlvWDKlAS0uRoqfRTdarR26PQoWs
         SKwA==
X-Forwarded-Encrypted: i=1; AJvYcCXbBRnJIrjkmsmwsYYwpyyuskAMdlumwBMYAsBAEq8PeU+vuVrrh4Al7BuEAThBJyHJH/oGC7YyY04y3g==@linaro.org
X-Gm-Message-State: AOJu0YxR5uBY4lbgVvy/ofL4UbhnEyUtxt44+QXpkfly4Pq2yHzxQd00
	DEjJ946h69XleOlTMr0sEZau/SknKwMUy4hBiI8OLu7Qnr9/9czin/hGgLaOVBBOUA==
X-Gm-Gg: ASbGncvgUHh/DaAkTVsQZkhHrbX6S4TF9Dd62DxRLSEt7emQWTzE82n54cc809hvMYF
	7MKMyDlJrZpDglKL5p2RtbyqGEpwIALo0aI2ygczithyUxLZ+c0o+RTe32PqZaHiDDbmC3+ONkL
	EB2cJ29Q1WCq3wDsTMIlemI3249A+AEb+wvG2zWwpxkyFGGxfBLtikBkntC2gG+hCPtGkMX5cfg
	EWmtc5BY9nQTXPT509SVUzXkaHtiJRMQO4QEEo4xQRIhf2Qbs28v811s/71aNRxAwmQW4klLvT7
	aAcKvaRHn35kxYC6r9DvBKxymfnj/K6RNeLma91ZuSJB
X-Google-Smtp-Source: AGHT+IGpVW92Redmqgr+HmUbpNm8hsX+p2uNrDpzZR1xgMtAGnI2STvmEVxhrXqPqFc+p4wVYOA0OQ==
X-Received: by 2002:a05:6000:1f81:b0:386:3213:5b9b with SMTP id ffacd0b85a97d-38bf57a9477mr21266255f8f.43.1737538253473;
        Wed, 22 Jan 2025 01:30:53 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38bf322acdcsm16022223f8f.55.2025.01.22.01.30.52
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 22 Jan 2025 01:30:53 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 05/10] accel: Prefer cached CpuClass over CPU_GET_CLASS() macro
Date: Wed, 22 Jan 2025 10:30:23 +0100
Message-ID: <20250122093028.52416-6-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250122093028.52416-1-philmd@linaro.org>
References: <20250122093028.52416-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: kGhmFQuctxKc

CpuState caches its CPUClass since commit 6fbdff87062
("cpu: cache CPUClass in CPUState for hot code paths"),
use it.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
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
