Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp848608wro;
        Thu, 25 Oct 2018 08:25:13 -0700 (PDT)
X-Google-Smtp-Source: AJdET5cLJAHT9RDndCywfc6ASIUmZQxR44kSY0FgAMhsP9canobTkoyMkzrhT8toHPfbFKdCg9Kc
X-Received: by 2002:a37:a48d:: with SMTP id n135-v6mr1854783qke.160.1540481113152;
        Thu, 25 Oct 2018 08:25:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1540481113; cv=none;
        d=google.com; s=arc-20160816;
        b=OmZu7EiESysTG5ItapLXuqcPd6Moc69dQimQ1McwnL8BIbgvxxIDgJd5u1zFGtxysE
         zYl/2/Tuf6CkOlRO1sBAHhWrbCiF7wlsiJG4jxFUL3XS3zhiiPbGyAvYwEo+bSA+lQhn
         05OA8yahoifKmSnbeKOd7sOENqoBCe7Mm/8bRnoUipQPZ89LNpygPqmSeoHXG5oHC2h6
         ExbxspDGUlrzUzCApscZL1c+isEeS8wBOpKs80tD8RYepy/Ase/9JfWJC9YrWCC7tdeQ
         1WFcVKl2c0lXlVVa3Qq5lKSUP9EVYS8G4caEVKyG9ceDkIqB4epD/YGoa59ziVNO4Dx3
         aJlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:dkim-signature;
        bh=3j9F53GR3YtLPEfc6I3qE4RlsSU6R+YltslfjdjAowM=;
        b=bSuxGnPn6XY3ooCSPm/V4DGQ/TGE7/bwWl/9Y71pAjdc45IleM5Z5PK2rsN8jLL0pb
         mWuDXbxZdjY9pBm5kfCB5SbRqK/g1QT9p6QSGpf9mVDA+/dpup/WZdHqKF0zGmMowQ85
         O4pL1DElcJmd8bscTT5i2Xj+LUzw8Y0tZHWcEjTqiel8z5SvAJv+MKyoE4jSVyoXfQLJ
         U9YXXMz3mZ0q1Le1swAoIENGEKLaUJZpZCeUwCEvom6+6efT2Wvpw51Tz4HYYtARU5Zx
         Ws3b6ceJXEpepra7PqYpEoqMlwSqYJ/GM6qBeeHoOuB/YImMKnZ26OJthrSqNlUazGS4
         10AA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@braap.org header.s=mesmtp header.b="zD/urpk/";
       dkim=fail header.i=@messagingengine.com header.s=fm1 header.b=iTW5T6cF;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y8si1736569qvr.117.2018.10.25.08.25.12
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 25 Oct 2018 08:25:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@braap.org header.s=mesmtp header.b="zD/urpk/";
       dkim=fail header.i=@messagingengine.com header.s=fm1 header.b=iTW5T6cF;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:55153 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gFhVY-0005JP-Gq
	for alex.bennee@linaro.org; Thu, 25 Oct 2018 11:25:12 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60330)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cota@braap.org>) id 1gFh5K-0004FR-Nd
	for qemu-devel@nongnu.org; Thu, 25 Oct 2018 10:58:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <cota@braap.org>) id 1gFgvG-0008Et-Pa
	for qemu-devel@nongnu.org; Thu, 25 Oct 2018 10:47:48 -0400
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:53107)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <cota@braap.org>)
	id 1gFgvB-0007mb-Hw; Thu, 25 Oct 2018 10:47:38 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id 620AC220A4;
	Thu, 25 Oct 2018 10:46:49 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
	by compute4.internal (MEProxy); Thu, 25 Oct 2018 10:46:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=braap.org; h=
	from:to:cc:subject:date:message-id:in-reply-to:references; s=
	mesmtp; bh=3j9F53GR3YtLPEfc6I3qE4RlsSU6R+YltslfjdjAowM=; b=zD/ur
	pk/RMlANZiR5t3kCVBo3mo05ua9/OjXxOXecsoqFlhg+Pwdk8sLOfYfMco1R7Liv
	hennJ+CopAU/B8GBHjIbmCp+aanK/dZj4juoj4eR6JmE0bNiJR0TgcfMeVPnWSOj
	tb9hnT+mC0hCCkbKT7YD06Cuyxl/ta84DCroYc=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:date:from:in-reply-to:message-id
	:references:subject:to:x-me-proxy:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm1; bh=3j9F53GR3YtLPEfc6I3qE4RlsSU6R
	+YltslfjdjAowM=; b=iTW5T6cFMLX7oQUo9Dh5QYu4fRAwm0ZL+ck6W1KenzxQK
	MVQO794ciLyIj3xt4my1GnQtlF5Jy+FTxDNOUZuoimKw+7skj2/16zVrUU2fe9CV
	nr3lphBVN2EiHpA9juo4kj+//zX8hr6JxW+FLejEza6uX9AYg4ieyn5SdHZxD0hy
	TrW8d8eBBZNnSqv5iviM71yDQWgW3pFPBL+bL1PDO+mH8+a/2JLMyzpscNFoj/lW
	GkYoYcGz4NhMmx5V2+gy2+A0y2x5NAc9T5e24E30ffnGTC108YXV6WVsAjcItfIk
	JHgJnj+e0vWFhkwiUxy5l+4hi+RgQq0KwzoPC8e0g==
X-ME-Sender: <xms:WdfRWzaurVb5wUGnmQngzJyEEvPWfRssakIwu6NiXJqTe74114sVNw>
X-ME-Proxy: <xmx:WdfRW808aCjCxj_lIz18P7r5sbVAmxNZxxLvK6pKfI0m0bhOah9EXA>
	<xmx:WdfRW-0EhF2cQJpg3HaUcp32TSs7N1oMePBm6zEZnx2M5hB3oN-hfg>
	<xmx:WdfRWzctkWGmdG1dXW9ilBFUqyRS7JL9a1EWJR5qUXVGveVcTFNgyw>
	<xmx:WdfRWwKstlM4Fii8MiHw_GSACe6DM5LZ_h6YG5MtgScivqpRu8aMJA>
	<xmx:WdfRWy-06ZwSw5b0gdRvBnLj_7FAPF13Jq2sVReincv-xRrSTVToiw>
	<xmx:WdfRWx1OphpRcTwttnwtZFrZNbSFvWleOGYnKQ20Dw8ch-tHoYqXsg>
Received: from localhost (flamenco.cs.columbia.edu [128.59.20.216])
	by mail.messagingengine.com (Postfix) with ESMTPA id 087E6E44D4;
	Thu, 25 Oct 2018 10:46:49 -0400 (EDT)
From: "Emilio G. Cota" <cota@braap.org>
To: qemu-devel@nongnu.org
Date: Thu, 25 Oct 2018 10:45:49 -0400
Message-Id: <20181025144644.15464-16-cota@braap.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20181025144644.15464-1-cota@braap.org>
References: <20181025144644.15464-1-cota@braap.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 66.111.4.27
Subject: [Qemu-devel] [RFC v4 16/71] arm: convert to cpu_halted
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
	Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: JuARPQS2+/ro

Cc: Andrzej Zaborowski <balrogg@gmail.com>
Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
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

