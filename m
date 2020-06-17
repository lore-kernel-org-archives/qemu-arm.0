Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp966855lfm;
        Wed, 17 Jun 2020 14:03:40 -0700 (PDT)
X-Received: by 2002:ac8:7092:: with SMTP id y18mr1153993qto.354.1592427820609;
        Wed, 17 Jun 2020 14:03:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592427820; cv=none;
        d=google.com; s=arc-20160816;
        b=GvypjlTtV8Mwt4t0LrjcMbYeDOfllP5JAr/ECbLw9rNmzHOaQg0RD1+oloNYntg6B3
         8uddz/i5TVByt7P6O93g3ZzXvpSJ7PG4z+05y+czV/J6RQGx4MQNwbDDjFrXeqFiJoSo
         yslLCMfdaOKM3QMtiTSK11dMMuoq2lBg7zZGyCxRxhUcZJ6/rLN9K2fxPrmdq0jbMDjT
         YOGvv8xoVx37VT8Fy7OvCRvBjmWkUzz0joCpbtL4epgplsfSAlCRIe+CZuDNM2kW2JtQ
         e05oSFOrPRqoWBlto1XR3zH2WohoZYf7CTEHzil9cUVY8gX38YpT5UfcXiZYQUIKmIb5
         1Liw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=8/IOqlv1sAgxjuNf6Y85K/ZDCKml0j6c2FyJ0KPQgug=;
        b=bgSVFCHY3Bu3FRk7ejwmmYV2+tGc/eauexMhzqGH7l0cjXpY4r7y8azM2jUU4wOdRh
         /GtYAA+DX4g+jvew0hAwDG4qlq56Wt1isU82og3XCcSp7FZkKlm+K0JKNpSyk07PPiwy
         cROYb4sTp0NDwaFAkhkZITNNgXKOMWV40msvox+OobDHoMoafTBz9i5T8dC3WlYsBKNr
         SApMsorQ+v0K/sA38rih9gNbA6SEOpvIA0dwZp/tVaXBJJMmrNrBe8GjFxe6ku4ifRnh
         2J0ZT4GNr3LiUMOEcZ4VEKwCOGm4rlEJ0EXwLiuL2t5lYUEQAqvTOBeNU+rW0TMsP4FU
         DpVQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UaETTkwf;
       spf=pass (google.com: domain of robert.foley@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=robert.foley@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <robert.foley@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id p7sor1082296qvy.20.2020.06.17.14.03.40
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 17 Jun 2020 14:03:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of robert.foley@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UaETTkwf;
       spf=pass (google.com: domain of robert.foley@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=robert.foley@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8/IOqlv1sAgxjuNf6Y85K/ZDCKml0j6c2FyJ0KPQgug=;
        b=UaETTkwfDdnYPXLtIYH5paeb1vy/0aphoujhPrx+mgSsso+GIaJR6UIeoBCE78mT7Z
         6FruA6t8aHcrQ98v33eAc8R0suRVo6PUjRdIPuzDyqj7r8NUd4Hzk9pKvYPpdYiEpS6i
         An6MkTkh+l1GxUZSi2Lkmt0rXkOwlj8VVLgZrnZhpSZptW0lg0akKVwJNr73JM/cl7XE
         ZYqUoCwTRY6bKuWMYoKv73msc8QQOe9HEpEYN7i4i4QiVtFxsKW0WX9YEwh937gewEWk
         f0zxdmh/6IlpQeLQsIMUjL81/OUOVjnOFDA9hnWPq0He2VjhTaNkmfiQLyTLiEMeqwnt
         X54A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8/IOqlv1sAgxjuNf6Y85K/ZDCKml0j6c2FyJ0KPQgug=;
        b=KZuqIf51DUkJ4KFyO0+D2AprJwO6ehaT5ahDg3/6sLO3L8PJKtSkJkB9UkhRgS5l/B
         aSuDrIdMgRPTrAxgEzYh/ugjGCD2YT8UW/urIKhZgGDUAOX81N2P5wO1r5BVnB2QDY1K
         JA6YVkSQx1VKhB8JemjuCv0430G4E7vzi9goD0P6cbSiDTRbPUwfymSUPps8yjOd8ZgF
         rxphq3uOAy8EPzSMXjpgi+7ZXtFrTbg2FTULqXM9Jm62fFn+aiEn69W+jp2B1gYZFYoG
         GycoQKCLShr7nujYSRhKY7iwTYsMiq9wP5ZxyjBbUrIVdjraafs8l/iM5mnTai4Js1yG
         y8qg==
X-Gm-Message-State: AOAM5309jJNBBRa06is9aY7tsdXn52Cp3YAy8JTxtQV433lIkA8vCvGo
	WJKvALsLNEb9PjNa/kTVeb+mHDqK
X-Google-Smtp-Source: ABdhPJx5CtnxDhIY41kwToFLmyBYSELYIP1ZEQ6iXrBY4fq47jhx7L1yu6O8g3Uf9MZJNjuAEqbKpw==
X-Received: by 2002:ac8:6bc1:: with SMTP id b1mr1111814qtt.65.1592427820196;
        Wed, 17 Jun 2020 14:03:40 -0700 (PDT)
Return-Path: <robert.foley@linaro.org>
Received: from Rfoley-MA01.hsd1.ma.comcast.net ([2601:199:4480:60c0:fc79:714c:9711:2e9c])
        by smtp.gmail.com with ESMTPSA id w13sm997245qkb.91.2020.06.17.14.03.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2020 14:03:39 -0700 (PDT)
From: Robert Foley <robert.foley@linaro.org>
To: qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org,
	cota@braap.org,
	peter.puhov@linaro.org,
	robert.foley@linaro.org,
	Andrzej Zaborowski <balrogg@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org
Subject: [PATCH v10 17/73] arm: convert to cpu_halted
Date: Wed, 17 Jun 2020 17:01:35 -0400
Message-Id: <20200617210231.4393-18-robert.foley@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200617210231.4393-1-robert.foley@linaro.org>
References: <20200617210231.4393-1-robert.foley@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: /NY3FWOcgHLL

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
index 6ba0df6b6d..d0963a7ff7 100644
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
index d6d0d0b08e..266a1d45b4 100644
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
index 105c5e63f2..3c58546e30 100644
--- a/hw/arm/pxa2xx_pic.c
+++ b/hw/arm/pxa2xx_pic.c
@@ -59,7 +59,7 @@ static void pxa2xx_pic_update(void *opaque)
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
index 5b7a36b5d7..df5c019145 100644
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
