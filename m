Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp408066wrt;
        Wed, 12 Dec 2018 21:07:25 -0800 (PST)
X-Google-Smtp-Source: AFSGD/WsGgeROTZdFPOtQyGfIECcOKQbAzYtlw90jsX2BYY9R0/3j4BwEddAMdojBTd8zYW3HE3b
X-Received: by 2002:a37:b2c2:: with SMTP id b185mr20315850qkf.194.1544677541395;
        Wed, 12 Dec 2018 21:05:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1544677541; cv=none;
        d=google.com; s=arc-20160816;
        b=BdovI6igkvL3j5QPawQXWITiIA2crKrYCv6BPO0VuCa6STnA54VInQBr/628yg32VQ
         4YHns4gvYpWvGIrcKFxFmznzpjpw6e6+dnhGsMbhwK6DB3/TIBZcJZrReBzZlzcFPPr5
         dVTX4JWrqw8oTsIgomcrtzKg5nB5rFCuf+yoqlcGsJ/ommM7G6kLoYNaTZPIeg2Eq1ZD
         ISPb2y0q7Eql38Y9XuN4nxg6+LNKdJfXOLhR/42gJoJId5a2GAssslNc70U42sruOQB/
         MQqgOGxfUwaIPoXJ+9lqexO2Y2zC2ARJC+K9pL0g4DkGpxn601Sv51zsmc2cKZ5ioEgN
         EJbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:dkim-signature;
        bh=OVMrptELVSmCKNAMrt88X1bWJJvhSbWMVZBXwl+hXjk=;
        b=L71MsGcc/RfBlEy/bKHG3Aub2A3n/+4+2KyMOz/E4EOoOXM5X1DYuYthXFA/VNqJmx
         c7AttzAXV+0Lz0MJ2nkthA0dx+W/R/MRdFP/Yh3R3dpK8V325e1wJZ7TMldRKFovLN6K
         xYM25Ry05NVHE7FmQY2kOhBiOV9LCq7d79aY8vVb+QWp+qCeow6aU/6TabFC8vLWaZek
         ucpD5TjPOQtBuBZTpCJIZhfErkL2gzdV6vWF7BqAyRNwQ5OR4EQTaKy9NrESbSSG9R75
         AJhWLCByO7apqw/DfyJ2zCXBDzPEJafwA3hG5cwLwt/yKQ4u1qs6vyw73RK2xo6b1/TC
         kWqg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@braap.org header.s=mesmtp header.b=aRUPefEG;
       dkim=pass header.i=@messagingengine.com header.s=fm1 header.b=PILFzx5w;
       spf=pass (google.com: domain of cota@braap.org designates 66.111.4.25 as permitted sender) smtp.mailfrom=cota@braap.org
Return-Path: <cota@braap.org>
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com. [66.111.4.25])
        by mx.google.com with ESMTPS id l2si527456qtj.22.2018.12.12.21.05.41
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 12 Dec 2018 21:05:41 -0800 (PST)
Received-SPF: pass (google.com: domain of cota@braap.org designates 66.111.4.25 as permitted sender) client-ip=66.111.4.25;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@braap.org header.s=mesmtp header.b=aRUPefEG;
       dkim=pass header.i=@messagingengine.com header.s=fm1 header.b=PILFzx5w;
       spf=pass (google.com: domain of cota@braap.org designates 66.111.4.25 as permitted sender) smtp.mailfrom=cota@braap.org
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id 10E79221C7;
	Thu, 13 Dec 2018 00:05:41 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Thu, 13 Dec 2018 00:05:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=braap.org; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding; s=mesmtp;
	 bh=OVMrptELVSmCKNAMrt88X1bWJJvhSbWMVZBXwl+hXjk=; b=aRUPefEGjXM1
	hWVG7NJ2lhH6nsOSr7EmKNmO+OVXoYcMKJNE/p73ObBV/XyJJK9AzzQ4DZCKi9Xp
	Hv3hKLpLRDPtKmZxbbvh5zyYiIow6X+jjWehJhZP6OlGlcEGfXeYzXqtADjKkjco
	UhnOBaCkYJVNP1OFRCEeO/ytr8JpOlI=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:date:from:in-reply-to:message-id:mime-version:references
	:subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; bh=OVMrptELVSmCKNAMrt88X1bWJJvhSbWMVZBXwl+hX
	jk=; b=PILFzx5wf6oBEU6Gq8JxpA9EuqqgkTTu+RFU+Cu1z/RXQWozYKRMTuPnR
	8n7LtyedEaXZk9MLvgoZxI8jt1ShHWOCWKLDjgH9Xrl7b2tk1U7FTKaQ6MG9WeoO
	1MJTvd1O9LgunZzV6Gh432010S3+LI/gB6dypn4/aIDCyUnZVnEcu2lwRJA5Vldn
	CyWTYIH42PjRhYb79//ISrwmT4e9rWnFwyapW7Otc1LyHcSoMGHmnw3UWZ2XICXD
	VuHCPH5bE2+UI2xW0v/8Ga2/LJBf54YlOwL5Hk1nuT1N9p08vSNtiNAe7nJUeggI
	/924CNEiI0u/thuCAO1A9AHublANA==
X-ME-Sender: <xms:pOgRXLjX26P08p9dFHS--NXkQai0XUYGV7URYp735hRmr1lotJslkQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedtkedrudehuddgkedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfquhhtnecuuegrihhlohhuthemucef
    tddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvffufffkof
    gjfhggtgfgsehtkeertdertdejnecuhfhrohhmpedfgfhmihhlihhoucfirdcuvehothgr
    fdcuoegtohhtrgessghrrggrphdrohhrgheqnecukfhppeduvdekrdehledrvddtrddvud
    einecurfgrrhgrmhepmhgrihhlfhhrohhmpegtohhtrgessghrrggrphdrohhrghenucev
    lhhushhtvghrufhiiigvpeeg
X-ME-Proxy: <xmx:pOgRXIGKiiPJtY7BSC4CtDfUaCxC-87cp930J8GFYOyOTO6s1a7Low>
    <xmx:pOgRXLmxKdGQeWqqPgVrBtj5ocmTv26nlD3BaQVbY8OitRR9lsN3mA>
    <xmx:pOgRXO-aEAmDaYmvA2N1rUGFEytCFe6jGOvHwzxjoGYk5V959WUuPw>
    <xmx:pegRXGydaG6Kl5hiI3A49YK-elqGI8SUjctSmSfvqIkQiQIKu9JAFA>
Received: from localhost (flamenco.cs.columbia.edu [128.59.20.216])
	by mail.messagingengine.com (Postfix) with ESMTPA id A9E3110084;
	Thu, 13 Dec 2018 00:05:40 -0500 (EST)
From: "Emilio G. Cota" <cota@braap.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Andrzej Zaborowski <balrogg@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org
Subject: [PATCH v5 17/73] arm: convert to cpu_halted
Date: Thu, 13 Dec 2018 00:03:57 -0500
Message-Id: <20181213050453.9677-18-cota@braap.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20181213050453.9677-1-cota@braap.org>
References: <20181213050453.9677-1-cota@braap.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: a6Pu/+lOR+yc

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
 target/arm/arm-powerctl.c | 4 ++--
 target/arm/cpu.c          | 2 +-
 target/arm/op_helper.c    | 2 +-
 6 files changed, 8 insertions(+), 8 deletions(-)

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
index 2b856930fb..003bf6c184 100644
--- a/target/arm/arm-powerctl.c
+++ b/target/arm/arm-powerctl.c
@@ -64,7 +64,7 @@ static void arm_set_cpu_on_async_work(CPUState *target_cpu_state,
 
     /* Initialize the cpu we are turning on */
     cpu_reset(target_cpu_state);
-    target_cpu_state->halted = 0;
+    cpu_halted_set(target_cpu_state, 0);
 
     if (info->target_aa64) {
         if ((info->target_el < 3) && arm_feature(&target_cpu->env,
@@ -238,7 +238,7 @@ static void arm_set_cpu_off_async_work(CPUState *target_cpu_state,
 
     assert(qemu_mutex_iothread_locked());
     target_cpu->power_state = PSCI_OFF;
-    target_cpu_state->halted = 1;
+    cpu_halted_set(target_cpu_state, 1);
     target_cpu_state->exception_index = EXCP_HLT;
 }
 
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 60411f6bfe..8baa5bb891 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -149,7 +149,7 @@ static void arm_cpu_reset(CPUState *s)
     env->vfp.xregs[ARM_VFP_MVFR2] = cpu->isar.mvfr2;
 
     cpu->power_state = cpu->start_powered_off ? PSCI_OFF : PSCI_ON;
-    s->halted = cpu->start_powered_off;
+    cpu_halted_set(s, cpu->start_powered_off);
 
     if (arm_feature(env, ARM_FEATURE_IWMMXT)) {
         env->iwmmxt.cregs[ARM_IWMMXT_wCID] = 0x69051000 | 'Q';
diff --git a/target/arm/op_helper.c b/target/arm/op_helper.c
index 0d6e89e474..4c8c7204d4 100644
--- a/target/arm/op_helper.c
+++ b/target/arm/op_helper.c
@@ -465,7 +465,7 @@ void HELPER(wfi)(CPUARMState *env, uint32_t insn_len)
     }
 
     cs->exception_index = EXCP_HLT;
-    cs->halted = 1;
+    cpu_halted_set(cs, 1);
     cpu_loop_exit(cs);
 }
 
-- 
2.17.1
