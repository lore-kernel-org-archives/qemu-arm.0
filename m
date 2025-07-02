Received: by 2002:a05:693c:2909:b0:17e:9665:bf4c with SMTP id rk9csp73046dyc;
        Wed, 2 Jul 2025 11:57:37 -0700 (PDT)
X-Received: by 2002:a05:600c:a085:b0:450:cfa7:5ea1 with SMTP id 5b1f17b1804b1-454a370c52cmr48278205e9.16.1751482657405;
        Wed, 02 Jul 2025 11:57:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751482657; cv=none;
        d=google.com; s=arc-20240605;
        b=Ls0EpdjlNqAo+9OocYj1B3a0CVcGGz4ENPE8+ctTMmSwNXLkY5UcYb8BnBw/pJHmRx
         8bBkctkuFbFLD4DN8o0A6LaIdlYcbC6sbPDjE3ZWRaw0v0+XBfO7VZjldvT068nJYIIu
         ZIp/qatSF195+IQeRkkxcMBW9zaSuWAEKChxSe/IVTV/ZtyrK7yctn68t6xj/lfUjAqs
         M9HYZTw9rFTLF12xKVmwk2nEt3sUV7Eq4wEESRO8Szdio3HZsaiOD8SjG7lKY9sbMvBN
         RrXgHXZHEnWh93nSMc1gsoad2oDM7TBC1oe8N688CpS/cH2KL+0xOwi1thtWINzNK+Ry
         hDKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=rbpcjy4o5ZUQnpuXjuYjR5B0wNodIi5DdAoNAkyy2SM=;
        fh=b2XjpJ2+IYlxCMiX9mmXPpc/Ga6KDz5ZuwLYZUnkBzI=;
        b=CeUm32eS9rjwJAa5G34BVWM0nPkWGLYwd4Pr+8+veAwZorhigCOIj5uvAqB2ZkyrKl
         vx2a9RtvOKtd6YhBm2UkoxBQjc/8m+snXlQtRVAa302GxueON5ZssZYkzNruG68LHS78
         TU7n8Kr2NuiRU9+VyY+X4BLnwJZZGWfP195P9+vKRymP8LQ3uO20IOkXiqoZBtJifMGp
         FBteQdkQVHFOIpEx/XmrR3cnfnQevvxyjzS6IbTRyHWaNu/RcXEg7u4gMVtm3oAW98Vz
         pR0X4Cwp1H9Mqre+x0NmKPoXE59Cy2OnvVaAgRHbfCfvrdJAegtBBUtqUcm0sMSYeBr5
         qlGA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gevbXgvw;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-4538a405babsor68881065e9.7.2025.07.02.11.57.37
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 02 Jul 2025 11:57:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gevbXgvw;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751482657; x=1752087457; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rbpcjy4o5ZUQnpuXjuYjR5B0wNodIi5DdAoNAkyy2SM=;
        b=gevbXgvwxoIfsDmJ4f4wW0iakEf15wkYvDVoYQ7YtuZRQ9aGLGU2sEpUSw0xbpBrkw
         dUr3p/sD98r2J6DyAvzlp5tbd1M+ei8kvrEntaaoWjw9GW4JiVeRGfuSChnu4D+W177P
         +NMIFBX00EvTgG1KKvj+C03ukfu3qKzduMW4v1Ssk6FPgp3mzeqqVggbtG0LWPQGaNRH
         /9KeebhKroLNdHKXTybPg4S+EimHONJ3EJP6p/wte/oDz5WK1LUPiTvJwWZOePgYnG6B
         axDWmmD/qJ5weGSyNoJNJ97UAL1xF7IWQuGV7KBh8F6hNwM3fegOlhjg0ciAIeh/39zt
         NazA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751482657; x=1752087457;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rbpcjy4o5ZUQnpuXjuYjR5B0wNodIi5DdAoNAkyy2SM=;
        b=YVmgjj6gsgYSwhgBjfJjhomtdswWF+g/omSzfPMIrv3qce994y32yXpTeIs33UVQVv
         WWAMH66z8sT/FSl/DElIzyrHSLun7qF5oJ0wDnBG9GRYcWiOIXOrzKU0B6nFm2ZdWJU2
         MHXK6Tpo9cDenuClpZRb1RkEur5+oqzf9Ar9Yv/rLzFYv0bmjNn3CHi9ZFgS+OG9E73m
         vKH1/5vt3pCEFesBnvJ+vpiM2AAbQQ+xSl5HryoeDKIIPwjE3Y4uORYCKlO6nRSpz2nj
         y+kJwQc4ZdwMt4Dz061W54kKG/YUA/8jzGabw51HsrywLTeBPGBQ5ntZ63Y03zwkOHGV
         15mg==
X-Gm-Message-State: AOJu0YyLFIzO1zAPSqPC/uNi3vE02e/+0tmSZbgsUvaCVNmMZegrdSqA
	6WTKjfO+1PMRtX1q8xWhsrDAMeqSQpbuTmmPepPXmvPVnnLJ6DNy3K7IRQCQBW37AgSMDA==
X-Gm-Gg: ASbGncvO3uz6AD/tyUFUW92+aExFDrrSlWDU/Rs/kRnyfkdn4pK8+L4RTdRz4dLyL+9
	GRX8g0fdJbjcdzbSgDldP2o7sQ2Tl1FQEcqCWk3sg/xDEQpjc59JAjrgkxfCH0CNAEuilrEKmGI
	xQIxm2z/d2duW/QDGHxW+FS3/LL+ABCxEzm9KKmpvX7MjoSDbzPYKm+zz+mUqNR33NGuWFpnDsK
	AuvpurfwCuYowyvs4YnYMka6dWBDzTiXABp4JZI3Mu/qm3skSjJhgixbGuGV4Vt7QU3aQriYviz
	A+OeZqXleG2eAJnLkcVczvrY2t9n1b27XIJX0r7q1xy3sgrCuzlI5UdBDfp1wsJXnbPJn9+IcdV
	TeeWZJCyI/FYXYM6FWQ0UslJDdKLP1le7a6J4
X-Google-Smtp-Source: AGHT+IEgwotSVda5UvmeFEw7lmS1prrmGDTnN4mzVIUqw6QUVymWZGRsGXQ4Ab+NSjGmrHxIjZNUGQ==
X-Received: by 2002:a05:600c:3504:b0:453:a95:f07d with SMTP id 5b1f17b1804b1-454a36e6310mr50420695e9.10.1751482656792;
        Wed, 02 Jul 2025 11:57:36 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454a99b1c2esm5568285e9.30.2025.07.02.11.57.35
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 02 Jul 2025 11:57:36 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Cameron Esfahani <dirty@apple.com>,
	Roman Bolshakov <rbolshakov@ddn.com>,
	Phil Dennis-Jordan <phil@philjordan.eu>,
	Mads Ynddal <mads@ynddal.dk>,
	Alexander Graf <agraf@csgraf.de>,
	Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org
Subject: [PATCH v4 33/65] accel/hvf: Replace @dirty field by generic CPUState::vcpu_dirty field
Date: Wed,  2 Jul 2025 20:52:55 +0200
Message-ID: <20250702185332.43650-34-philmd@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250702185332.43650-1-philmd@linaro.org>
References: <20250702185332.43650-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: XeaH4gf6yRO6

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
