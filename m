Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp1736659lfb;
        Thu, 21 May 2020 09:43:39 -0700 (PDT)
X-Received: by 2002:a0c:e9c9:: with SMTP id q9mr10621946qvo.215.1590079419212;
        Thu, 21 May 2020 09:43:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1590079419; cv=none;
        d=google.com; s=arc-20160816;
        b=a9jekxBZfXLOOXjA3V0eJkXaVOjpt6ihrSUlMlbgT3HqNEbrQB/bYKeVw4+mDriiEZ
         jOVpLxBY7lPuV6z4LIs/0out0Mbsysh/+BBKtSvLmRgV2ZCoLe1iVGpSV+ViYA/DIrUF
         lv5U1RNlj2xm0PfV7CCfbbiBHMyMiKRFrtOKnOcrZaF+woOTJiHwG0k2GHzo0pJno42o
         xFbOoyJe3br85XCATAWVgmHHx7tVj1aB5AmR3TJu56pFYrsQHC5x03LpmG+gRVy/d2Nj
         gcw8ub5+KZUMgqArfe9/+fnuvo1QxA/oaV/tazLGhoVlX9U0q+1811T3NVKMNSF5cDh9
         J4UA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=dMJD65Hlj8sZEjsVc6zG0Ir/AhvAmDKltVf3k3r4CgY=;
        b=vIeNPpPGQgbLh9v3X5/q136N4t291u8Lg8hprq5zB/T7J+xT17zbdrwPytz4dLxsmz
         d1jl8SAYGfE+vb5FWypxXkpViyalcYzPYc0HAik4hwByL94tY/W9X0lWNQd38Hr53j8t
         wgOwaZoOn29eX9Kd/aHEaUTSSoyQIeh8TheyWFzmyR+i81aGPWBR03NLupq+Jt3NZF0+
         48onwxC6g6+3IQdZYBe+Gz6ZstDFbFw4Sa3U+A1EZPYs9bJ83M9uLN9z4ipLSwJ0rDVb
         fM3WnGmr4RflfvYUOrqMnFHqMjNdeAItIL96zj/VNfDcjbPf5AyqZb1T64Zsr2y4xd1M
         bNgw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qxolO3NH;
       spf=pass (google.com: domain of robert.foley@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=robert.foley@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <robert.foley@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id u5sor8654909qvt.54.2020.05.21.09.43.39
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 21 May 2020 09:43:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of robert.foley@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qxolO3NH;
       spf=pass (google.com: domain of robert.foley@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=robert.foley@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=dMJD65Hlj8sZEjsVc6zG0Ir/AhvAmDKltVf3k3r4CgY=;
        b=qxolO3NHBjbuWSRVm36ecn5krJ1xJDM5MsGZe5bSWEmRz2qykCI/o2yo/NPfJ3CxQP
         UqPRK/+HK3cnZax4qIl/EXV5PqZd/zWzN9uyUetgiB/7NayvCslb5KR2+jKttR6Flm2o
         oXT0VevNgkoD14jUvTXvMbjiDA++0c8Oxv6GGAMV8JWe2+MxNWrBAx2195PKKvY0FGUv
         PG/n6uqVOMcQO9T4xYRpIRjbIaoyaCYpJzMPk/pkLqj/XsNniKiEmGjm9TwiyZqI64dO
         BBWUZDbpuiCo6+JCd2RC0lsYhp/6YKmL9IeXLsLkxmkzObsyg3H/Y7sf+uHiLQXhrWbv
         7/sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=dMJD65Hlj8sZEjsVc6zG0Ir/AhvAmDKltVf3k3r4CgY=;
        b=VEZREgIgb8D3ld9Kd1ityaUdoGGev5ZmTrKGcPWAYVIEcOTNweO7JjaA33+qV9Cohq
         LwZJJNK8cTCSi/gm6lZGXkcEoqNXEIwPBV/2t7Gorqwt+bajtgLcqjXfZs8MD6UZHLLJ
         5+VH1jhKxwSwoKpWINZVEn4ZdWH0kmYtZCTGbh18ArXksPeP62GfayHBKhhwS5S1qUV3
         80LjP6aUIYkkvbz9gbDc8DFBOMsNM+avsd/IBbJhWRkqPayydIsWR9QcQwI5I4RrGqR2
         QeNPMueu59DM372b2ZCcqfkdZEh4dK11/qzwqV4LOQBTZCwKHNvR/yMBV2PkgvKbp46s
         BIpw==
X-Gm-Message-State: AOAM5334td+lQFWXHdASM/ggc+PunrDP587ods9ePJsOdZJSFvjBbff6
	rp0dBjrV3k/WBjmYhK42YrQAs1jK
X-Google-Smtp-Source: ABdhPJzU6+L9m9eKgmFy4T2CpzBwZGdFhnu+SPFlwBxgP8YjJY+IKwveBx7QWv1alWwOabyJgBzpMA==
X-Received: by 2002:a0c:f590:: with SMTP id k16mr11076855qvm.81.1590079418769;
        Thu, 21 May 2020 09:43:38 -0700 (PDT)
Return-Path: <robert.foley@linaro.org>
Received: from Rfoley-MA01.hsd1.ma.comcast.net ([2601:199:4480:60c0:1944:c530:655c:5583])
        by smtp.gmail.com with ESMTPSA id x24sm5923829qth.57.2020.05.21.09.43.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2020 09:43:37 -0700 (PDT)
From: Robert Foley <robert.foley@linaro.org>
To: qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org,
	richard.henderson@linaro.org,
	cota@braap.org,
	peter.puhov@linaro.org,
	robert.foley@linaro.org,
	Andrzej Zaborowski <balrogg@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org
Subject: [PATCH v9 18/74] arm: convert to cpu_halted
Date: Thu, 21 May 2020 12:39:15 -0400
Message-Id: <20200521164011.638-19-robert.foley@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200521164011.638-1-robert.foley@linaro.org>
References: <20200521164011.638-1-robert.foley@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: lN4XddElqkWu

From: "Emilio G. Cota" <cota@braap.org>

Cc: Andrzej Zaborowski <balrogg@gmail.com>
Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Emilio G. Cota <cota@braap.org>
Signed-off-by: Robert Foley <robert.foley@linaro.org>
---
 hw/arm/omap1.c            | 4 ++--
 hw/arm/pxa2xx_gpio.c      | 2 +-
 hw/arm/pxa2xx_pic.c       | 2 +-
 target/arm/arm-powerctl.c | 6 +++---
 target/arm/cpu.c          | 2 +-
 target/arm/op_helper.c    | 2 +-
 6 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/hw/arm/omap1.c b/hw/arm/omap1.c
index 761cc17ea9..83b1d63f27 100644
--- a/hw/arm/omap1.c
+++ b/hw/arm/omap1.c
@@ -1776,7 +1776,7 @@ static uint64_t omap_clkdsp_read(void *opaque, hwaddr addr,
     case 0x18:	/* DSP_SYSST */
         cpu = CPU(s->cpu);
         return (s->clkm.clocking_scheme << 11) | s->clkm.cold_start |
-                (cpu->halted << 6);      /* Quite useless... */
+                (cpu_halted(cpu) << 6);      /* Quite useless... */
     }
 
     OMAP_BAD_REG(addr);
@@ -3797,7 +3797,7 @@ void omap_mpu_wakeup(void *opaque, int irq, int req)
     struct omap_mpu_state_s *mpu = (struct omap_mpu_state_s *) opaque;
     CPUState *cpu = CPU(mpu->cpu);
 
-    if (cpu->halted) {
+    if (cpu_halted(cpu)) {
         cpu_interrupt(cpu, CPU_INTERRUPT_EXITTB);
     }
 }
diff --git a/hw/arm/pxa2xx_gpio.c b/hw/arm/pxa2xx_gpio.c
index f8df3cc227..23b4a06a4f 100644
--- a/hw/arm/pxa2xx_gpio.c
+++ b/hw/arm/pxa2xx_gpio.c
@@ -132,7 +132,7 @@ static void pxa2xx_gpio_set(void *opaque, int line, int level)
         pxa2xx_gpio_irq_update(s);
 
     /* Wake-up GPIOs */
-    if (cpu->halted && (mask & ~s->dir[bank] & pxa2xx_gpio_wake[bank])) {
+    if (cpu_halted(cpu) && (mask & ~s->dir[bank] & pxa2xx_gpio_wake[bank])) {
         cpu_interrupt(cpu, CPU_INTERRUPT_EXITTB);
     }
 }
diff --git a/hw/arm/pxa2xx_pic.c b/hw/arm/pxa2xx_pic.c
index 203d4d28af..057448c2ed 100644
--- a/hw/arm/pxa2xx_pic.c
+++ b/hw/arm/pxa2xx_pic.c
@@ -58,7 +58,7 @@ static void pxa2xx_pic_update(void *opaque)
     PXA2xxPICState *s = (PXA2xxPICState *) opaque;
     CPUState *cpu = CPU(s->cpu);
 
-    if (cpu->halted) {
+    if (cpu_halted(cpu)) {
         mask[0] = s->int_pending[0] & (s->int_enabled[0] | s->int_idle);
         mask[1] = s->int_pending[1] & (s->int_enabled[1] | s->int_idle);
         if (mask[0] || mask[1]) {
diff --git a/target/arm/arm-powerctl.c b/target/arm/arm-powerctl.c
index b75f813b40..f0db413519 100644
--- a/target/arm/arm-powerctl.c
+++ b/target/arm/arm-powerctl.c
@@ -64,7 +64,7 @@ static void arm_set_cpu_on_async_work(CPUState *target_cpu_state,
 
     /* Initialize the cpu we are turning on */
     cpu_reset(target_cpu_state);
-    target_cpu_state->halted = 0;
+    cpu_halted_set(target_cpu_state, 0);
 
     if (info->target_aa64) {
         if ((info->target_el < 3) && arm_feature(&target_cpu->env,
@@ -241,7 +241,7 @@ static void arm_set_cpu_on_and_reset_async_work(CPUState *target_cpu_state,
 
     /* Initialize the cpu we are turning on */
     cpu_reset(target_cpu_state);
-    target_cpu_state->halted = 0;
+    cpu_halted_set(target_cpu_state, 0);
 
     /* Finally set the power status */
     assert(qemu_mutex_iothread_locked());
@@ -297,7 +297,7 @@ static void arm_set_cpu_off_async_work(CPUState *target_cpu_state,
 
     assert(qemu_mutex_iothread_locked());
     target_cpu->power_state = PSCI_OFF;
-    target_cpu_state->halted = 1;
+    cpu_halted_set(target_cpu_state, 1);
     target_cpu_state->exception_index = EXCP_HLT;
 }
 
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 32bec156f2..dc435a18a1 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -175,7 +175,7 @@ static void arm_cpu_reset(DeviceState *dev)
     env->vfp.xregs[ARM_VFP_MVFR2] = cpu->isar.mvfr2;
 
     cpu->power_state = cpu->start_powered_off ? PSCI_OFF : PSCI_ON;
-    s->halted = cpu->start_powered_off;
+    cpu_halted_set(s, cpu->start_powered_off);
 
     if (arm_feature(env, ARM_FEATURE_IWMMXT)) {
         env->iwmmxt.cregs[ARM_IWMMXT_wCID] = 0x69051000 | 'Q';
diff --git a/target/arm/op_helper.c b/target/arm/op_helper.c
index eb0de080f1..88c86a4346 100644
--- a/target/arm/op_helper.c
+++ b/target/arm/op_helper.c
@@ -305,7 +305,7 @@ void HELPER(wfi)(CPUARMState *env, uint32_t insn_len)
     }
 
     cs->exception_index = EXCP_HLT;
-    cs->halted = 1;
+    cpu_halted_set(cs, 1);
     cpu_loop_exit(cs);
 }
 
-- 
2.17.1
