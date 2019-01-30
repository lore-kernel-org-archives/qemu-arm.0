Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp5068876wrt;
        Tue, 29 Jan 2019 16:56:14 -0800 (PST)
X-Google-Smtp-Source: ALg8bN5/9nqfwLPe/qcs3Rg/ZN7CchN0YTaKeDAWAljdog8WWvFsBvhJYzWMl1TOkpEJXEextdpX
X-Received: by 2002:a81:794d:: with SMTP id u74mr27298239ywc.129.1548809774094;
        Tue, 29 Jan 2019 16:56:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1548809774; cv=none;
        d=google.com; s=arc-20160816;
        b=fqbFp69+t2qd5BgT1Scjq9hnZpenJ5SSS7PsQGY3JKDBLemye/8nUscmFXx+v3dLp7
         FwCWovBpUXqRjUWQ5DuxvQYD+6dN84zqLz3NJjAXjDs3yr26sb+JqhyNATTpVa+ATwS/
         0BBqfiQF9YTvUoWYDcUZL2o7yHQUlmQfLx8SBWtDl7HxqsI0zz9aVHocSfFyNTy1flhg
         aRJFpDS9qfcbcWjhdwOZUzT2a/nZPkVoCTm/+VwWpaOVVCqu+M7fPv36KWr6Wz2KtzBu
         oCO/Yib58Q7D8G1U/73Ys6oNekAfMNFeu+HR3ipY+vJUHF3cm7LdJp9JACziHhIzW/dE
         ZrYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:dkim-signature;
        bh=vTJvbxpBU4eOFfsiY9y7x8qOJQHNwQmc9QTOLwCiUI0=;
        b=lypJSX78V0owSkO9nPOnqB5F5kIOyTQV8Q/I8JNVgOWAPdxOYlzb3RIyanPEOendLN
         Heol852TnajtaImQRDAhWTgn2TpVvleUbXaDDCK1HKY88TNmjMrZGC0Wxw2Zzqpzz6NE
         fJa0OSEuCt7QIqcVRJgx+R0aE7xZyhgxR7LALFRSL8BQIIZiVujVG6W6BtG43FMx1uUR
         /BULluOHKd5OTTdCv4kJV4oteJpo8VEvl/ehBsAbJ6pwfYdVz8KwF+hflELqbEdPRbRs
         L9X8kkh9USYUbcZHipxn/F2bVRqx/HVfftNToMhCBJ5TpPgp0vQB1UF8Y2rIRstB4XkB
         Cjdw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@braap.org header.s=mesmtp header.b=y9RKQGoK;
       dkim=fail header.i=@messagingengine.com header.s=fm1 header.b=FUMIy6ga;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k8si6108ybp.98.2019.01.29.16.56.13
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 29 Jan 2019 16:56:14 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@braap.org header.s=mesmtp header.b=y9RKQGoK;
       dkim=fail header.i=@messagingengine.com header.s=fm1 header.b=FUMIy6ga;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:57878 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1goeAn-00061a-BG
	for alex.bennee@linaro.org; Tue, 29 Jan 2019 19:56:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35397)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cota@braap.org>) id 1goe3d-0008Iq-5l
	for qemu-arm@nongnu.org; Tue, 29 Jan 2019 19:48:50 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <cota@braap.org>) id 1goe3c-00012S-3h
	for qemu-arm@nongnu.org; Tue, 29 Jan 2019 19:48:49 -0500
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:53481)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <cota@braap.org>)
	id 1goe3b-0000gi-Tt; Tue, 29 Jan 2019 19:48:48 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id 3A0AD220D7;
	Tue, 29 Jan 2019 19:48:17 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
	by compute4.internal (MEProxy); Tue, 29 Jan 2019 19:48:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=braap.org; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding; s=mesmtp;
	bh=vTJvbxpBU4eOFfsiY9y7x8qOJQHNwQmc9QTOLwCiUI0=; b=y9RKQGoKDEAs
	85pavS1yb/v7+dD8yykRW/Bh26epojEmI2jexMfAkbpY3aWxU6fqjPrfvsWup7iX
	RPszzafbA+i3bXDw/gu36GLsrfKvTZkUGPExrTheaq55tOj6oGeDMLdw9UHXYRUW
	x8Wzri9rWEswipjaZ8KsgucZGmnyzfI=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:date:from:in-reply-to:message-id:mime-version:references
	:subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; bh=vTJvbxpBU4eOFfsiY9y7x8qOJQHNwQmc9QTOLwCiU
	I0=; b=FUMIy6gaoI3Cmie9Ftblr8laYpoVyMl3j/gS0iLhYLAV4Z7yc6em6oxSr
	IJ+YhLmYkftMY+LxEhBFGgP7nQt5wAs4ICnYqdP9ZBKdQtfA43ktN4AAss45KKkW
	csNsz0SRl337k+dai4DjN3g1ne9XpW6uhOAlnvyHTJgkiuTMoS71u+bsD/bky0LT
	+sJvupK0RrI8N7ejYwAVuzEtm0DJaX7br3deRSxMKHiQ5/rW4d64zx708Nv6jx0c
	mBpSxuW5T59dulKc1vOKgREUuLm7bauo8VDh+i795kSbWISHvAMssZMpVxfCKAPy
	ww31/LBMJD4lOXi22FOZSeCCJIYIQ==
X-ME-Sender: <xms:UfRQXFXLK-sdevTQvIVUduMGjaSI91pMcmv9OHRJGBvcIxl6wefLjw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedtledrjeefgddvkecutefuodetggdotefrodftvf
	curfhrohhfihhlvgemucfhrghsthforghilhdpqfhuthenuceurghilhhouhhtmecufedt
	tdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvufffkffojg
	hfgggtgfesthekredtredtjeenucfhrhhomhepfdfgmhhilhhiohcuifdrucevohhtrgdf
	uceotghothgrsegsrhgrrghprdhorhhgqeenucfkphepuddvkedrheelrddvtddrvdduie
	enucfrrghrrghmpehmrghilhhfrhhomheptghothgrsegsrhgrrghprdhorhhgnecuvehl
	uhhsthgvrhfuihiivgepke
X-ME-Proxy: <xmx:UfRQXEk7ZVyd-MGB5I9Fenh7vBJrxmIjj7ZZoLFxVSiQp21foRwdEA>
	<xmx:UfRQXODBxCXtyjl4u59Pgl7HkIwUqxLXtAtEJ4QmMrCeC7tayYKgvg>
	<xmx:UfRQXCijoFKmgAFzQNkTGF1fMQ5nQGR1Nwf6feGPDxMcrMlJGmJ3Qw>
	<xmx:UfRQXMaVfb4F4HHCi7xG5Aoov-5yZSqahvCOD8vojRUMBJ3aHhTzzQ>
Received: from localhost (flamenco.cs.columbia.edu [128.59.20.216])
	by mail.messagingengine.com (Postfix) with ESMTPA id B1ED8E4667;
	Tue, 29 Jan 2019 19:48:16 -0500 (EST)
From: "Emilio G. Cota" <cota@braap.org>
To: qemu-devel@nongnu.org
Date: Tue, 29 Jan 2019 19:47:15 -0500
Message-Id: <20190130004811.27372-18-cota@braap.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190130004811.27372-1-cota@braap.org>
References: <20190130004811.27372-1-cota@braap.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 66.111.4.25
Subject: [Qemu-arm] [PATCH v6 17/73] arm: convert to cpu_halted
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
	Richard Henderson <richard.henderson@linaro.org>,
	Andrzej Zaborowski <balrogg@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: iFJbde7Uf+qp

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
index d6da3f4fed..8cf2f5466b 100644
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

