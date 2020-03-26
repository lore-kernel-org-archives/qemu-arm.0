Received: by 2002:ac2:5937:0:0:0:0:0 with SMTP id v23csp2305419lfi;
        Thu, 26 Mar 2020 12:37:57 -0700 (PDT)
X-Received: by 2002:a37:8044:: with SMTP id b65mr9102341qkd.238.1585251476842;
        Thu, 26 Mar 2020 12:37:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1585251476; cv=none;
        d=google.com; s=arc-20160816;
        b=OgAIwwc8fnApwNnleya20i65/raMHkWE4kBOYWRvteTdSd95oOZSj5C8HvZhcHlvCv
         Df8hvMZUHit+FkubiUETa6Komc26WYrdJbbX7UOwu7bYMmh8JjEj/r8iZmaokRymblFI
         lLTd87+joU/wPGw1SlZiL2pupHW+EIYbH7MJaZy/CvWAO8hg7C1BqgY2CeuDhAgEThOg
         jZSfR4PwG3KjNxHDPWPpta62M6RA6t+Sfya8P//wei2PrlTrn6L487+Jaivc821Kwrfx
         TqoDC0z2rltxWiAngAUHEqmFxCXPPPwXRQIbRNib6tJ5qbSRN7pgXkbVCyE0F5rs0FQ+
         v7eA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=/m+IiebGsEqbgq5gGcyp7fO4NhJnxMLvbJZusMVHD1E=;
        b=xcywQyi4Jr0zDfTLuW66PnogxMnmNaS37yIhqO+5Nc6MHQ9WavWwjKSAl8XH27IQxa
         doiT7x40FQhLqU46Ru+4Pm0eEhCjy2Dnbo8NyZ97GVUD/nA6KAmp3CHYE00y2xHa3PQZ
         QTv8xwU+7lkw5Q+zbN9Yj1J7rkm6DAaPmLaezNQBOimcJaZa0DNQZp8C0a094y3Kbeuu
         I5MrJ3UJX+v1fjFW7BFdcvEOOgowHYl4sHQVLCWGIUMS2F/CeRa5I9DHgI4gHDSOEihv
         RPjnWn266KR5E+z5xji+IQwaM0hSsAj3fzR+FBtAw3ufjIVlWOtXd/ROGmm1H7eSDr4n
         JF+A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="v7/zUnkg";
       spf=pass (google.com: domain of robert.foley@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=robert.foley@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <robert.foley@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id m22sor994199qtu.1.2020.03.26.12.37.56
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 26 Mar 2020 12:37:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of robert.foley@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="v7/zUnkg";
       spf=pass (google.com: domain of robert.foley@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=robert.foley@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/m+IiebGsEqbgq5gGcyp7fO4NhJnxMLvbJZusMVHD1E=;
        b=v7/zUnkg75DmSoSn6s2WWDbBrGYmW6rd5cDhHhnJh2xXkxKzWj2vUqvO2XZUqNfg2A
         95XMrI4JyvBqu6wVWBPQl55XnVza+/EujjyihEJvhVVaJC5Ls6PReHWWjCmMoamzo2Wt
         UrwmNMFQf7Mz6gGFhOl8J2I642o7AKf2shGcEOZ9xbsC7eZiU/My23hDOr2iB7g4UEPt
         NCNPCuvZ65jfQebTYvIDVhTKtymbcNSQCV7cn0brmsPXEgDtxF5PFBzGjr3vuctHkZi/
         LDa1g+brfnJQOv/MYkOgQdA/j6SXV20abNP9RAL0+gyYtexKmTmnVREV8ZhPVF2ZfvPq
         A1jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/m+IiebGsEqbgq5gGcyp7fO4NhJnxMLvbJZusMVHD1E=;
        b=RwA5JcAqQeZhv2sNrXpAtYyWpDHXONmU9fqwKZFfPBxS+T1zmuvrjyZOGtNfJwX+uo
         jtsOBGXlSwee/aEXWxEZZDRB2TURb8sCgQu+5rbn6ewCHIZ1hNdyPpr6j9wMmzST/S/2
         f9Re5FRPu04MSh712n+442oIjhEGkAsk3pgBoiP55PgA2qL5g7ZRZlP6Vz7SnZUv4cX6
         o4GcuQtCKQ1uHCNAkLFHl6NAimRZhUTLxepSqLvxP1RtBjXIrIzxyvY6o5gHo2GAzk/Q
         dVQo/j+wgirG+1bouZx4nnu+vr4/cJG006PrjelmLjD77P1QGt8HiiGRhz4nwVC6iSjL
         6weQ==
X-Gm-Message-State: ANhLgQ3ZAAYSghLApSTmIAw7aS+//P6KQh4/5fFAIgdwBu+SOKA8fOYq
	2SZ9+wTQXm1he7hcNys0h57wVNix
X-Google-Smtp-Source: ADFU+vs2fRJ3M6rV9nk74aJ1oqNaLqGco21pfYcb3Onacni1tTfXg5t5TtiVuNC6ml64uCsVxuq5mA==
X-Received: by 2002:aed:2f01:: with SMTP id l1mr10266198qtd.37.1585251476384;
        Thu, 26 Mar 2020 12:37:56 -0700 (PDT)
Return-Path: <robert.foley@linaro.org>
Received: from Rfoley-MA01.hsd1.ma.comcast.net ([2601:199:4480:60c0:fd55:4e67:1038:8302])
        by smtp.gmail.com with ESMTPSA id u51sm2161916qth.46.2020.03.26.12.37.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2020 12:37:55 -0700 (PDT)
From: Robert Foley <robert.foley@linaro.org>
To: qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org,
	richard.henderson@linaro.org,
	peter.puhov@linaro.org,
	robert.foley@linaro.org,
	"Emilio G. Cota" <cota@braap.org>,
	Andrzej Zaborowski <balrogg@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org
Subject: [PATCH v8 18/74] arm: convert to cpu_halted
Date: Thu, 26 Mar 2020 15:31:00 -0400
Message-Id: <20200326193156.4322-19-robert.foley@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200326193156.4322-1-robert.foley@linaro.org>
References: <20200326193156.4322-1-robert.foley@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: /aAbA+qcBgrN

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
index a79f233b17..9fa514c999 100644
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
