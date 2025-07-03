Received: by 2002:a05:693c:2909:b0:17e:9665:bf4c with SMTP id rk9csp450094dyc;
        Thu, 3 Jul 2025 03:59:05 -0700 (PDT)
X-Received: by 2002:a05:6000:2f85:b0:3a6:d5fd:4687 with SMTP id ffacd0b85a97d-3b1fe6b72c6mr5834732f8f.18.1751540345266;
        Thu, 03 Jul 2025 03:59:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751540345; cv=none;
        d=google.com; s=arc-20240605;
        b=EqPADQJLHkS3NwEWE+aiIfaufOBsLkjT6xPfPbG0n3+k8S3VV9rgSUPwHeGtLpU6tw
         zXaRehv9xnLC7Rg+HoqolULdXZ6WpFXudtdl00CI5xNoqxCMyF7UgMhXbJNNjho5Ovwy
         WMe4lC65mDg4M1GdFXrxQaOQ5CT1digZF30+i25F42yUr8F4z7QJXr3MB51mYgfrKSBr
         QuqqAzWqoidIyirPkwmSu6DxD9xZPVBcTDDmmoUeIREZrUVpqr95Vh2mlKcgFCLE7LyR
         HDMMyTN0S33xV+/BQ7zRLktJlYdOZdMNaQ4PXbGJODEuahRFaXxSZWooJwMsruyNKJrq
         iCuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=rbpcjy4o5ZUQnpuXjuYjR5B0wNodIi5DdAoNAkyy2SM=;
        fh=uJ3dFTbL6U4oY1jR+3e9dBFvfZBH369kHbvQi/mdha8=;
        b=Td5LUJsOUHfHu2e1qh85DUL7bwAKc7+6eOOQZt73h2NGRFyi4ziT3jAWbzqsurT4D4
         4N+Vqezb8Fse1/eyJgm7pa+vXD/+ezHr8ugfCw/tFnDjrJ76Sc0m+P5nsdm147FJ5XqR
         y5JO1FK6MP3CsKro+metuhDTnrqCshMKfUa217YByfJ3rXgEPd+mueDTbF3dL1o8tD2d
         34JMdju0KyG+2Q47IXpwz9Mz4FLHm7U86Glg6OzMa31aE9M/1T27PqPNadSCIO05UwsR
         kLs940eDaq/cAxaz/l0w1L7wHH06E3RVUx6HnDooKqIL6bStG2xNf7qncyh6hmqhYAWr
         p50A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=q8HK7olC;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ffacd0b85a97d-3b427e2979fsor35012f8f.6.2025.07.03.03.59.05
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 03 Jul 2025 03:59:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=q8HK7olC;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751540345; x=1752145145; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rbpcjy4o5ZUQnpuXjuYjR5B0wNodIi5DdAoNAkyy2SM=;
        b=q8HK7olClkovErh14qp8aNAWIWa1QsdnKHdMKE2ewXn/Nc/8o7R1I7zzJaKeIaAOaG
         EmGKFtTctvMRpAuHt/ctVDydxc2lmMWY3zCRh7RMCddRtmanChfHfjseT6dHgeALc46x
         I0vlnrTuucZRNFkLHqc4Up5nKGrQR9sESUq8r6SxWbnxcgjIeEOzuCe5YVTv0aPbWqyk
         bgLiOMPqFLlDYt4spnh1hMbkeZy+C7DsmDxplPd0ViOiP9CJ/A2Z9/yPAOnqem2888XI
         A0xJLALNK2B06tJNsd8VDCgxVTxsEGEbdykdtunqFH7TIPxRNBSbcOVGNbQ5cJxHqSBr
         LOlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751540345; x=1752145145;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rbpcjy4o5ZUQnpuXjuYjR5B0wNodIi5DdAoNAkyy2SM=;
        b=ezYZanwK+Lf/iYC9tC30oqc+wvEzIXl6+oZHhAmrzvILz5L/5bl6mYuTzNB9djtiUP
         cUUXCqgW2Ad4Vf1IRhaBCuTrNasqw0Q4Biiqk1SjJWQYxnPYGQ+NNz/EOo5GCpc89Rmd
         ove7umXKRmFRXbS7BKQ2UehUZUuC3FYTQtnmnZdbtE+1qZzWnoQMEEkKzBwnKcPD/lKc
         jB6y7urF7KTU6PP9oqtqCzR6MR0SlottrRwtdHRR9lOfWt1yzQXv5UN2NwIprKtcV32o
         KHiqVY4AtbaIqgAxp7/HQb3suPCz8/dIiBReyLFVRRqUoLReKtYBgqkrZR/zjAp6Cbgi
         BJwg==
X-Gm-Message-State: AOJu0Yy1fNj1IMZXAQ8LSim2nCmiX+sXPiv0y7zXNozTrQDv4hjPj7Pk
	e1eGpTuxhc6+2FGX7qaQ/QTg8GfYVLcktJFwbSqLLRofVfACnGkRGs2EleXbJcOJxjVYgQ==
X-Gm-Gg: ASbGnct6gJMBbQvsVlqlXnSfhx9yq/bhxTkcgg7R7iFMY28Go50ABz0QRKxuQ/b7/ga
	r3emi6ArfxoCCuvL0yjDw6YKlBiebNtZ4e5Pu4hbFpB40cgtSemfzOuuNOIpqGdqNggYkDGdFH+
	IVw91cuSuXW97UGoem069Ko7/1II5cn/l6Ji3VPDEAisOTUc/P4wtHNKNq1jzz+4sZ468v6XYVe
	S9vdLPEkpBhLV/JR6XT4ErgUm4KyOwh+iv37Pw0JlNpwD7fN3nagYMkuHKmqn6djvPmRbSi7HbM
	3znNOu2y6LJJdbUeBq2rZjZJH/lSNeQFDEVBd9oYmx+yOcFTHmPJhtWXwYUPzmIOXHn6H1az4BJ
	1jnKDFYfdMZI=
X-Google-Smtp-Source: AGHT+IGYxtS1oEgE+wPV64Af3YSVbtZnoBNIR61h6tPaEQk84SaFj2CgxdVoLgHbVl+oBToAAhLlkA==
X-Received: by 2002:a5d:5f4e:0:b0:3a4:d6ed:8e2e with SMTP id ffacd0b85a97d-3b200b4673amr4801917f8f.41.1751540344516;
        Thu, 03 Jul 2025 03:59:04 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain ([83.247.137.20])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3aba76e40c0sm14278820f8f.59.2025.07.03.03.59.03
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 03 Jul 2025 03:59:04 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	kvm@vger.kernel.org,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Cameron Esfahani <dirty@apple.com>,
	Roman Bolshakov <rbolshakov@ddn.com>,
	Phil Dennis-Jordan <phil@philjordan.eu>,
	Mads Ynddal <mads@ynddal.dk>,
	Alexander Graf <agraf@csgraf.de>,
	Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org
Subject: [PATCH v5 38/69] accel/hvf: Replace @dirty field by generic CPUState::vcpu_dirty field
Date: Thu,  3 Jul 2025 12:55:04 +0200
Message-ID: <20250703105540.67664-39-philmd@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250703105540.67664-1-philmd@linaro.org>
References: <20250703105540.67664-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 0NbvgJZd+sIb

No need for accel-specific @dirty field when we have
a generic one in CPUState.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/system/hvf_int.h  |  1 -
 accel/hvf/hvf-accel-ops.c | 10 +++++-----
 target/arm/hvf/hvf.c      |  4 ++--
 target/i386/hvf/hvf.c     |  4 ++--
 target/i386/hvf/x86hvf.c  |  2 +-
 5 files changed, 10 insertions(+), 11 deletions(-)

diff --git a/include/system/hvf_int.h b/include/system/hvf_int.h
index ea6730f255d..a8ee7c7dae6 100644
--- a/include/system/hvf_int.h
+++ b/include/system/hvf_int.h
@@ -62,7 +62,6 @@ struct AccelCPUState {
     bool vtimer_masked;
     sigset_t unblock_ipi_mask;
     bool guest_debug_enabled;
-    bool dirty;
 };
 
 void assert_hvf_ok_impl(hv_return_t ret, const char *file, unsigned int line,
diff --git a/accel/hvf/hvf-accel-ops.c b/accel/hvf/hvf-accel-ops.c
index 319c30f703c..c91e18bc3dd 100644
--- a/accel/hvf/hvf-accel-ops.c
+++ b/accel/hvf/hvf-accel-ops.c
@@ -79,15 +79,15 @@ hvf_slot *hvf_find_overlap_slot(uint64_t start, uint64_t size)
 
 static void do_hvf_cpu_synchronize_state(CPUState *cpu, run_on_cpu_data arg)
 {
-    if (!cpu->accel->dirty) {
+    if (!cpu->vcpu_dirty) {
         hvf_get_registers(cpu);
-        cpu->accel->dirty = true;
+        cpu->vcpu_dirty = true;
     }
 }
 
 static void hvf_cpu_synchronize_state(CPUState *cpu)
 {
-    if (!cpu->accel->dirty) {
+    if (!cpu->vcpu_dirty) {
         run_on_cpu(cpu, do_hvf_cpu_synchronize_state, RUN_ON_CPU_NULL);
     }
 }
@@ -96,7 +96,7 @@ static void do_hvf_cpu_synchronize_set_dirty(CPUState *cpu,
                                              run_on_cpu_data arg)
 {
     /* QEMU state is the reference, push it to HVF now and on next entry */
-    cpu->accel->dirty = true;
+    cpu->vcpu_dirty = true;
 }
 
 static void hvf_cpu_synchronize_post_reset(CPUState *cpu)
@@ -156,8 +156,8 @@ static int hvf_init_vcpu(CPUState *cpu)
 #else
     r = hv_vcpu_create(&cpu->accel->fd, HV_VCPU_DEFAULT);
 #endif
-    cpu->accel->dirty = true;
     assert_hvf_ok(r);
+    cpu->vcpu_dirty = true;
 
     cpu->accel->guest_debug_enabled = false;
 
diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
index bd19a9f475d..44a831d004f 100644
--- a/target/arm/hvf/hvf.c
+++ b/target/arm/hvf/hvf.c
@@ -813,9 +813,9 @@ int hvf_put_registers(CPUState *cpu)
 
 static void flush_cpu_state(CPUState *cpu)
 {
-    if (cpu->accel->dirty) {
+    if (cpu->vcpu_dirty) {
         hvf_put_registers(cpu);
-        cpu->accel->dirty = false;
+        cpu->vcpu_dirty = false;
     }
 }
 
diff --git a/target/i386/hvf/hvf.c b/target/i386/hvf/hvf.c
index bcf30662bec..c893aaac1b0 100644
--- a/target/i386/hvf/hvf.c
+++ b/target/i386/hvf/hvf.c
@@ -738,9 +738,9 @@ int hvf_vcpu_exec(CPUState *cpu)
     }
 
     do {
-        if (cpu->accel->dirty) {
+        if (cpu->vcpu_dirty) {
             hvf_put_registers(cpu);
-            cpu->accel->dirty = false;
+            cpu->vcpu_dirty = false;
         }
 
         if (hvf_inject_interrupts(cpu)) {
diff --git a/target/i386/hvf/x86hvf.c b/target/i386/hvf/x86hvf.c
index 2057314892a..17fce1d3cdd 100644
--- a/target/i386/hvf/x86hvf.c
+++ b/target/i386/hvf/x86hvf.c
@@ -427,7 +427,7 @@ int hvf_process_events(CPUState *cs)
     X86CPU *cpu = X86_CPU(cs);
     CPUX86State *env = &cpu->env;
 
-    if (!cs->accel->dirty) {
+    if (!cs->vcpu_dirty) {
         /* light weight sync for CPU_INTERRUPT_HARD and IF_MASK */
         env->eflags = rreg(cs->accel->fd, HV_X86_RFLAGS);
     }
-- 
2.49.0
