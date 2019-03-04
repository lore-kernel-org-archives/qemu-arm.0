Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp3890850wrx;
        Mon, 4 Mar 2019 10:18:21 -0800 (PST)
X-Google-Smtp-Source: APXvYqxTaUGklY/mEd55ltqXusH6UZeIpGXjOT4TMZHp5Ngv4x3IZZphEySF0GffUEyJsUbaZLcm
X-Received: by 2002:a37:74a:: with SMTP id 71mr14787005qkh.47.1551723501359;
        Mon, 04 Mar 2019 10:18:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1551723501; cv=none;
        d=google.com; s=arc-20160816;
        b=i3aBfEhr/KPhrPq5uJiCO2DhZghg6Ay0Wqb9Gq2WTdlQgwGVlcMyuOUxpFw2EwCJRP
         AGMqdX3qNXGb+LbGZ+siDV5oRbCzKEx9yrk2XmCCSGn1+spH5CUwmiJe3fwlZnSI6Q84
         /LZH1Z//XyW1KVnFX5ChNCd04zBxD8stxLNrLVpmB0MzPxM3nAW17BUxvYssTQisAwD8
         3QApN42fAfE+4vM3numULX0jeTzA6Q/FERWhTN4fuFcttqo9jNeik2fP5mT3H1XIczt5
         jjjVlqvxiU/Zrc496XwmhA93D366vAkplnymAb+yaEJRIPC3WdYnaCagtlxhNTUAn1mS
         6P2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:dkim-signature;
        bh=9Y6rmzBKuNBGzOxnHXlaPyQycc9X65CLAffjzBTsCEE=;
        b=IZRZKXbaosnLq6fxn0ph4d/aeFIMeqRAp34u7SdQ2wZRbO8mHTOt5Ukw4jwAORX0/P
         QxDkkGdFIj+L3nM+y8Jf+EGqHBQs9ymVIJRA0fsX+S+Fk0TWRYIDR9oFE+4hlRM7HbzY
         SB+u3UvoPrey3t72GvenA8qmA5bnz/CIQDMjXaYEWUyTL+fiy9BJe141lU2FWIS8O1oa
         BNqlREp1CZmB4fV6GVayo3gsTeIPDvBH0ui+YoE3MQfAFfhKCtAsImzCm3ZceCashwxC
         tp9XCU31Jq46Vt27l2clLEdMkDla7wYScriUNeADJ6pOkizOWdELJOosN4HlAF+19SDr
         oODg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@braap.org header.s=mesmtp header.b=cV2DT96W;
       dkim=pass header.i=@messagingengine.com header.s=fm2 header.b=jEHRcv6g;
       spf=pass (google.com: domain of cota@braap.org designates 64.147.123.25 as permitted sender) smtp.mailfrom=cota@braap.org
Return-Path: <cota@braap.org>
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com. [64.147.123.25])
        by mx.google.com with ESMTPS id o1si3576146qkk.270.2019.03.04.10.18.21
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 04 Mar 2019 10:18:21 -0800 (PST)
Received-SPF: pass (google.com: domain of cota@braap.org designates 64.147.123.25 as permitted sender) client-ip=64.147.123.25;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@braap.org header.s=mesmtp header.b=cV2DT96W;
       dkim=pass header.i=@messagingengine.com header.s=fm2 header.b=jEHRcv6g;
       spf=pass (google.com: domain of cota@braap.org designates 64.147.123.25 as permitted sender) smtp.mailfrom=cota@braap.org
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.west.internal (Postfix) with ESMTP id D51283709;
	Mon,  4 Mar 2019 13:18:19 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Mon, 04 Mar 2019 13:18:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=braap.org; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding; s=mesmtp;
	 bh=9Y6rmzBKuNBGzOxnHXlaPyQycc9X65CLAffjzBTsCEE=; b=cV2DT96Wclpb
	CqqpHsYf9lkPPWQJ1AMx+sdBckhHPsEtJTgCPNMuPJ4v/y2iOFwe7AINvJgK49l4
	k39lML+rvWk0gflpdwiaEKgWl0UD+wrTE+sBkb3q+MFnykiB1IV6AAHOMXeUlzES
	wLVVOKAU1u0uo3k3zn1Km3BrbwzLzt4=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:date:from:in-reply-to:message-id:mime-version:references
	:subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; bh=9Y6rmzBKuNBGzOxnHXlaPyQycc9X65CLAffjzBTsC
	EE=; b=jEHRcv6gYVo8CJKQ9EU2xJHgBYXW+B9J/6Qkcr1LCTnIjYcJTZep3YD/W
	zvFxW7pGrtUw4jirpUuusr3EvkMuHWj/PTKKghR4EkCA6GeJZhd+M2GPZ4iOYZ6z
	ElTekiPv35flQ/vZSLnETIHjTC6jOmZh+LIj9+/njMYtzhmSW2fuVEb/DeJfBueH
	1tbif4n+vG14imGNwU63xgFdQECNsGq0YZ2bN7S5r/dYQRqHA1vhGKA1MLyByorH
	Ib7cI2UuEl2DJH7OkKMacCIrj2OfKIWxBWwotE3bIfwGD0ITqUD/Nw4LGCz2ObW6
	xhU63+g+X6Tykc/ZrgRuyV4y7aRcQ==
X-ME-Sender: <xms:62t9XFnA42RUACtwzEnDl69zv_U1A4NencdQol3z1o1q5TL0MJ3IPQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedutddrfedugdduuddtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvufffkffojghfgggtgfesthekredtredtjeenucfhrhhomhepfdfgmhhi
    lhhiohcuifdrucevohhtrgdfuceotghothgrsegsrhgrrghprdhorhhgqeenucfkphepud
    dvkedrheelrddvtddrvdduieenucfrrghrrghmpehmrghilhhfrhhomheptghothgrsegs
    rhgrrghprdhorhhgnecuvehluhhsthgvrhfuihiivgepfe
X-ME-Proxy: <xmx:62t9XLcLVZV4xA_UAHONmHFmCCZKxm3BnbEBy5GqlCMWYCeX_rJfCQ>
    <xmx:62t9XBodEo483_hy3p6BFvRQJCD5TawwSUNNlE3Ji-IkVbxzAJ0MWg>
    <xmx:62t9XFO82uz1suKfAPGwsWh3xlh6KU9vxTuCIOf_Ga11clgxQ4q7Dw>
    <xmx:62t9XAywBgbgsUUWsbABOEHgKC_5mhvI895kqy_Iv9lohgNuuY42Bw>
Received: from localhost (flamenco.cs.columbia.edu [128.59.20.216])
	by mail.messagingengine.com (Postfix) with ESMTPA id 2AB0C1033A;
	Mon,  4 Mar 2019 13:18:19 -0500 (EST)
From: "Emilio G. Cota" <cota@braap.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Andrzej Zaborowski <balrogg@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org
Subject: [PATCH v7 17/73] arm: convert to cpu_halted
Date: Mon,  4 Mar 2019 13:17:17 -0500
Message-Id: <20190304181813.8075-18-cota@braap.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190304181813.8075-1-cota@braap.org>
References: <20190304181813.8075-1-cota@braap.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: UTWVCiM5hjmz

Cc: Andrzej Zaborowski <balrogg@gmail.com>
Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Emilio G. Cota <cota@braap.org>
---
 hw/arm/omap1.c            | 4 ++--
 hw/arm/pxa2xx_gpio.c      | 2 +-
 hw/arm/pxa2xx_pic.c       | 2 +-
 target/arm/arm-powerctl.c | 6 +++---
 target/arm/cpu.c          | 2 +-
 target/arm/op_helper.c    | 2 +-
 6 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/hw/arm/omap1.c b/hw/arm/omap1.c
index 539d29ef9c..55a7672976 100644
--- a/hw/arm/omap1.c
+++ b/hw/arm/omap1.c
@@ -1769,7 +1769,7 @@ static uint64_t omap_clkdsp_read(void *opaque, hwaddr addr,
     case 0x18:	/* DSP_SYSST */
         cpu = CPU(s->cpu);
         return (s->clkm.clocking_scheme << 11) | s->clkm.cold_start |
-                (cpu->halted << 6);      /* Quite useless... */
+                (cpu_halted(cpu) << 6);      /* Quite useless... */
     }
 
     OMAP_BAD_REG(addr);
@@ -3790,7 +3790,7 @@ void omap_mpu_wakeup(void *opaque, int irq, int req)
     struct omap_mpu_state_s *mpu = (struct omap_mpu_state_s *) opaque;
     CPUState *cpu = CPU(mpu->cpu);
 
-    if (cpu->halted) {
+    if (cpu_halted(cpu)) {
         cpu_interrupt(cpu, CPU_INTERRUPT_EXITTB);
     }
 }
diff --git a/hw/arm/pxa2xx_gpio.c b/hw/arm/pxa2xx_gpio.c
index e15070188e..5c3fea42e9 100644
--- a/hw/arm/pxa2xx_gpio.c
+++ b/hw/arm/pxa2xx_gpio.c
@@ -128,7 +128,7 @@ static void pxa2xx_gpio_set(void *opaque, int line, int level)
         pxa2xx_gpio_irq_update(s);
 
     /* Wake-up GPIOs */
-    if (cpu->halted && (mask & ~s->dir[bank] & pxa2xx_gpio_wake[bank])) {
+    if (cpu_halted(cpu) && (mask & ~s->dir[bank] & pxa2xx_gpio_wake[bank])) {
         cpu_interrupt(cpu, CPU_INTERRUPT_EXITTB);
     }
 }
diff --git a/hw/arm/pxa2xx_pic.c b/hw/arm/pxa2xx_pic.c
index 61275fa040..46ab4c3fc2 100644
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
index f77a950db6..bd94ac2235 100644
--- a/target/arm/arm-powerctl.c
+++ b/target/arm/arm-powerctl.c
@@ -64,7 +64,7 @@ static void arm_set_cpu_on_async_work(CPUState *target_cpu_state,
 
     /* Initialize the cpu we are turning on */
     cpu_reset(target_cpu_state);
-    target_cpu_state->halted = 0;
+    cpu_halted_set(target_cpu_state, 0);
 
     if (info->target_aa64) {
         if ((info->target_el < 3) && arm_feature(&target_cpu->env,
@@ -235,7 +235,7 @@ static void arm_set_cpu_on_and_reset_async_work(CPUState *target_cpu_state,
 
     /* Initialize the cpu we are turning on */
     cpu_reset(target_cpu_state);
-    target_cpu_state->halted = 0;
+    cpu_halted_set(target_cpu_state, 0);
 
     /* Finally set the power status */
     assert(qemu_mutex_iothread_locked());
@@ -291,7 +291,7 @@ static void arm_set_cpu_off_async_work(CPUState *target_cpu_state,
 
     assert(qemu_mutex_iothread_locked());
     target_cpu->power_state = PSCI_OFF;
-    target_cpu_state->halted = 1;
+    cpu_halted_set(target_cpu_state, 1);
     target_cpu_state->exception_index = EXCP_HLT;
 }
 
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 54b61f917b..845730c00c 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -173,7 +173,7 @@ static void arm_cpu_reset(CPUState *s)
     env->vfp.xregs[ARM_VFP_MVFR2] = cpu->isar.mvfr2;
 
     cpu->power_state = cpu->start_powered_off ? PSCI_OFF : PSCI_ON;
-    s->halted = cpu->start_powered_off;
+    cpu_halted_set(s, cpu->start_powered_off);
 
     if (arm_feature(env, ARM_FEATURE_IWMMXT)) {
         env->iwmmxt.cregs[ARM_IWMMXT_wCID] = 0x69051000 | 'Q';
diff --git a/target/arm/op_helper.c b/target/arm/op_helper.c
index c998eadfaa..f9ccdc9abf 100644
--- a/target/arm/op_helper.c
+++ b/target/arm/op_helper.c
@@ -479,7 +479,7 @@ void HELPER(wfi)(CPUARMState *env, uint32_t insn_len)
     }
 
     cs->exception_index = EXCP_HLT;
-    cs->halted = 1;
+    cpu_halted_set(cs, 1);
     cpu_loop_exit(cs);
 }
 
-- 
2.17.1
