Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp3101739wrt;
        Thu, 18 Oct 2018 18:12:45 -0700 (PDT)
X-Google-Smtp-Source: ACcGV60KMeAo/86g26H+8/MXEPo8Q7GyzHFTEmk+NeeyIvkkMhRvSuOKi0S6NnOntrcxAIl/vKgq
X-Received: by 2002:a37:1625:: with SMTP id g37-v6mr29640670qkh.185.1539911565818;
        Thu, 18 Oct 2018 18:12:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1539911565; cv=none;
        d=google.com; s=arc-20160816;
        b=irojNRXfj+YvIt5oOV7Zwi76fNMh5gfQH5yfvK0SXxGuEeD9enDfZh5KJo7+rHyC+P
         z2TXCwcMv150A8v7TvN0DBzVxP8aKNpLMYvm+cppMGfpRjuNDC3rgAkF5gwcQRm7mdHQ
         9H/u9fCvO0CEUBuj1sDmset6ZI+HJzQ7t80msbs/l8GfX5cosIWgc5tfrRCjo3lSMiSh
         zLnJ6dudX+MXUtzybO/JPt6jicoShiySy3852zJ8NQ9Ctz9eEqETVdVbKW6M+/9G6Idx
         A78r9XXoxJM1aFoicf+oHe8Vljiok0o+4iVeKHy0cUwPD1K8TLM3kgubuUaiBhrD/i/R
         GKDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:dkim-signature;
        bh=iI/ykmDlaXgjgkFK63LkLLsYDTwc0tBSlU2DkZ/TrM4=;
        b=hXWszTXG7lsv/8h4rAmjxJIEvh9HZg8jZ+BUXm3cg3/HDRiQjK1/MNenCC6JltqI1j
         RpxMuYmO4WCjOavM9DhyrsdWEumCkofElRw64wTxXewZypjb7w5HfZF9A6BJ+JkZXFGU
         CoVBx/iac9evbmKPH5rhP9dILeUTY2B7NDUJHihama0iQTtqtX4ISlaYq7zovsW77vPE
         ePp9EDdRyukS4gArC2aQoqd7wywiX3kS2NgMlLdcb3LHd/Om9bKgU8jbIDpAaZ9lMb2V
         ZhPETd1/xQHoBqTykrY+h7To/0EIHqv6/XZILMxu7fxztQG7AjZaSjQ4VgkLW4IDkRDZ
         yyEg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@braap.org header.s=mesmtp header.b="0y//dBm0";
       dkim=fail header.i=@messagingengine.com header.s=fm1 header.b=ny9pMGlN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n123-v6si467524qkc.99.2018.10.18.18.12.45
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 18 Oct 2018 18:12:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@braap.org header.s=mesmtp header.b="0y//dBm0";
       dkim=fail header.i=@messagingengine.com header.s=fm1 header.b=ny9pMGlN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:45915 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gDJLJ-0001e5-7L
	for alex.bennee@linaro.org; Thu, 18 Oct 2018 21:12:45 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58622)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cota@braap.org>) id 1gDJFR-0004UI-0U
	for qemu-arm@nongnu.org; Thu, 18 Oct 2018 21:06:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <cota@braap.org>) id 1gDJFM-0002m1-LE
	for qemu-arm@nongnu.org; Thu, 18 Oct 2018 21:06:40 -0400
Received: from out5-smtp.messagingengine.com ([66.111.4.29]:54627)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <cota@braap.org>)
	id 1gDJFM-0002jl-6F; Thu, 18 Oct 2018 21:06:36 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id A332922950;
	Thu, 18 Oct 2018 21:06:28 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
	by compute4.internal (MEProxy); Thu, 18 Oct 2018 21:06:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=braap.org; h=
	from:to:cc:subject:date:message-id:in-reply-to:references; s=
	mesmtp; bh=iI/ykmDlaXgjgkFK63LkLLsYDTwc0tBSlU2DkZ/TrM4=; b=0y//d
	Bm0marMkc4qAAC6dfou7l2ZQvMLzeI5zihhIwqxECgqW8cJGLpl9mYu70vhXWq6M
	I6oQ4fqRhmUjl3STlePFgjbQOsuJyTnXS7k79JU/dr5//211u+3Dv/u3wAlwIWYh
	+dskwiHorsKkdoyIL6wKoYpTfBakRQRbXsRmeQ=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:date:from:in-reply-to:message-id
	:references:subject:to:x-me-proxy:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm1; bh=iI/ykmDlaXgjgkFK63LkLLsYDTwc0
	tBSlU2DkZ/TrM4=; b=ny9pMGlNfwhzJWgLCj+3CUc+/FDnxpRGo76D3gUakKZc9
	CEhJVXgnWFhHONmacQfcfEncoSN2oPAc7m3l3XQlFx8ttBmSkj0Y+5q4xa2WsXyk
	FFsSnGUTOn50yx2Yi2QFX+DoAdmExAGvJfWzvRPtqLgdLxtLiGUsI9uBXl3dhi+x
	Lqiq9Bfvtn80uBE6QKLn28WdyFOke1WFgGvBDYrG5fDNt8xizhIedbAuuqurs4Td
	7eCAq/5NzIAl4B0bFvD1lmINmy3Cc3cNrOV2KuTICGLxFx7oocch578uCp+N9EtF
	itnsOFxJnrfUalAhutY2ioU1jG2/KblBdqmcuvnoQ==
X-ME-Sender: <xms:FC7JWwxG8mUobUtyHzO-SS_qf7zBHD0FGUSYEcSezuUVizN5lxoo5w>
X-ME-Proxy: <xmx:FC7JW-bNVetlEmcsiaczzCCPJTj0v0Bnu1O6vamydFtbJtaBxik9ww>
	<xmx:FC7JWw8Vfo3ZU84TIf1XCwqt9y8xM9k9aP22lRCPd92ZrJH6O77BSw>
	<xmx:FC7JW79RWybl2lH7qFfl5WACHUPS7x9rPgOx7oqyWHmqiE8WaW1ZkQ>
	<xmx:FC7JW8peqaZf5TywuEnnAY_sKCIQ6dxI7kagWAX3u1DHaHXKM6VexQ>
	<xmx:FC7JWzwbeLSBdbqbXfunu-WWDX9H8uvouFKlt22w544ZL6DkcZrGEQ>
	<xmx:FC7JW2_33h4YDdon9COUlkpIvqCBnHme-H40g8dq2KyG0bGsJqP9ZA>
Received: from localhost (flamenco.cs.columbia.edu [128.59.20.216])
	by mail.messagingengine.com (Postfix) with ESMTPA id 4BEDC102E4;
	Thu, 18 Oct 2018 21:06:28 -0400 (EDT)
From: "Emilio G. Cota" <cota@braap.org>
To: qemu-devel@nongnu.org
Date: Thu, 18 Oct 2018 21:05:38 -0400
Message-Id: <20181019010625.25294-10-cota@braap.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20181019010625.25294-1-cota@braap.org>
References: <20181019010625.25294-1-cota@braap.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 66.111.4.29
Subject: [Qemu-arm] [RFC v3 09/56] arm: convert to cpu_halted
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
	Andrzej Zaborowski <balrogg@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: K8DBJyuJKhEW

Cc: Andrzej Zaborowski <balrogg@gmail.com>
Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org
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
index ce55eeb682..e4477444fc 100644
--- a/target/arm/arm-powerctl.c
+++ b/target/arm/arm-powerctl.c
@@ -64,7 +64,7 @@ static void arm_set_cpu_on_async_work(CPUState *target_cpu_state,
 
     /* Initialize the cpu we are turning on */
     cpu_reset(target_cpu_state);
-    target_cpu_state->halted = 0;
+    cpu_halted_set(target_cpu_state, 0);
 
     if (info->target_aa64) {
         if ((info->target_el < 3) && arm_feature(&target_cpu->env,
@@ -228,7 +228,7 @@ static void arm_set_cpu_off_async_work(CPUState *target_cpu_state,
 
     assert(qemu_mutex_iothread_locked());
     target_cpu->power_state = PSCI_OFF;
-    target_cpu_state->halted = 1;
+    cpu_halted_set(target_cpu_state, 1);
     target_cpu_state->exception_index = EXCP_HLT;
 }
 
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index b5e61cc177..9c5cda8eb7 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -149,7 +149,7 @@ static void arm_cpu_reset(CPUState *s)
     env->vfp.xregs[ARM_VFP_MVFR2] = cpu->mvfr2;
 
     cpu->power_state = cpu->start_powered_off ? PSCI_OFF : PSCI_ON;
-    s->halted = cpu->start_powered_off;
+    cpu_halted_set(s, cpu->start_powered_off);
 
     if (arm_feature(env, ARM_FEATURE_IWMMXT)) {
         env->iwmmxt.cregs[ARM_IWMMXT_wCID] = 0x69051000 | 'Q';
diff --git a/target/arm/op_helper.c b/target/arm/op_helper.c
index fb15a13e6c..8e393823f8 100644
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

