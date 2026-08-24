Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9405FC5DF9C
	for <qemu-arm@archiver.kernel.org>; Mon, 24 Aug 2026 10:30:05 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wyRux-00039M-Vo; Mon, 24 Aug 2026 06:28:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wyRuf-00035J-No
 for qemu-arm@nongnu.org; Mon, 24 Aug 2026 06:28:22 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wyRuc-0001r6-3F
 for qemu-arm@nongnu.org; Mon, 24 Aug 2026 06:28:20 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-493b966dd74so14437215e9.3
 for <qemu-arm@nongnu.org>; Mon, 24 Aug 2026 03:28:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1787567296; x=1788172096; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to:content-type;
 bh=so9t/+rpuCfxYBu/lHmsMNKcNwE90G7vRfHB5gvvk6E=;
 b=JbOvrjG8szUwfc+FELQOOGp6Zcy7+e0YQ0MUNtk4UkJ8KhiebWy/4JDp2cvWuwhZ1w
 00d87hvfsIXNhvuuMsd/4LJd2nsFVbeJ8nELuXsou+DWASzy6nh3qQ2AWP47PCXxiHma
 hdE6tlNh2WXkYX9rP5Ls8c5FI7wwb6xOTBwr0k7sj13Vk4VAt71ptGUZH6OVHqGy0k6g
 J3ypVxLsJlN27vqtwnGuVNa886RkUDKZY89kbz+acJG1Lmavuov/TfVg3EW+ldUDw65H
 87mZcrN4n2WJ8/VpDTPlfbqiSK/K/kePmCq8aew7JF5flvc8xyhrajtyVTM/R71A8Kzm
 lMRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787567296; x=1788172096;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to:content-type;
 bh=so9t/+rpuCfxYBu/lHmsMNKcNwE90G7vRfHB5gvvk6E=;
 b=iDp+NMppuv4ZKBltHokgbh2G9ny8qH6+fyV7c3ZUCfEvJXX03PBxVUXjhPyqJYJuOR
 ki5sYyMVRGdJ1NDBFL8nAVsFYLhrr4L0sEbsgEdOlrpENnGCylA+BM2zVYt4TmoacknU
 3gA4n7XVNm+tTs2lKz9HjdavI2ILv10mT39DCmLPuqzUm2JhG0j4OIueWl97SFEPE1m4
 b144ICv/qdp9Tuq2IGNGRyPOTdV0kmq5zhz3glQYomVjuz6f8A/OA+Q/a7roepOydgHz
 X84KSy17NLex0trlH1J+y0POBGHN1TjZSuUME0jYbdwBp+h5j6vgwM4IsE3y22mhL0gB
 FZgw==
X-Gm-Message-State: AFuF++nSUVi6zeSAEJeHojVGu33Ydun4TRYAcL5WsGmT6rjTEh4pkfZs
 JsdgSByO7QHsKOEXbXwwkRxTtPnvklnvH6lKk+Lmc5R+VhKq6guZSJuHiaklppiUkAYsD78f9xC
 805kfxn8=
X-Gm-Gg: AR+sD12ecdDtsPLtr+qsXA4E/GTXnHmSLZyVxZnodtpWFX13+2GbCMFJRLq0GF0OtqX
 VlR7aMTtkUqq0XcPxMv2XXV8xnou4P/jktFStqOR2B1iO1fzL5bXSGAS2q0ZbuY8Nb2PzB9rfkh
 lkQTTKuFiUe6yRcXzkWzWiJKsJMSPUwx78GKhRKMVvHP/jgkeSORJQ38vYwyL9rDb7W4isjiCgg
 tOcJAoZ9IqysPpXGcsB2nOQBqcX12vfrwpQ4Msy5gysEFhMBsEyHxZ2ebXh+8Isc8Vu1TdlEYxB
 Yv6HNU/uinW/R5PIflTYgJGwwXYHgV63ZKBlYkhxDLsMR4W6VjsBuvB2fM0bSts58NQrweE9XzN
 Okdc30iLdlv8m3YMPmd6+Szl5snTI9eYmGSlHypml/3v/FS1ayz7ryz5IgwHcH8XHmQDE6urUf6
 MLSDGgefOfxZuRjSr8+w2uGbSLOiBrasTgGoltL27RPwrAS1M2pvQ/OxNh44fsR2GoYkDhMTeGA
 ZzPGpBZYgewKURIyD0gLESbnQ3y183w5aUbp4qgPgpNW64OSjO9FGxR1u2MCq/hVJuouA==
X-Received: by 2002:a05:600c:1909:b0:493:aa0a:45ad with SMTP id
 5b1f17b1804b1-499c19bfd22mr163967225e9.2.1787567296165; 
 Mon, 24 Aug 2026 03:28:16 -0700 (PDT)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-499c355e6d1sm77730095e9.6.2026.08.24.03.28.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Aug 2026 03:28:15 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 6/6] target/arm: GICv5 cpuif: Use arm_cpu_set_irq() to set
 IRQ/FIQ status
Date: Mon, 24 Aug 2026 11:28:05 +0100
Message-ID: <20260824102805.639072-7-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260824102805.639072-1-peter.maydell@linaro.org>
References: <20260824102805.639072-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Currently the GICv5 cpu interface directly calls cpu_interrupt() and
cpu_reset_interrupt() to raise and lower IRQ and FIQ.  This is almost
but not exactly what we do for GICv2/GICv3 external GPIO IRQ/FIQ line
changes.  Those are handled by arm_cpu_set_irq(), and as well as
calling cpu_interrupt() or cpu_reset_interrupt() they also update
env->irq_line_state.

For IRQ and FIQ it doesn't matter whether we set and clear the bits
in irq_line_state, because nothing looks at them.  But for VIRQ and
VFIQ it will matter, because VIRQ and VFIQ are the logical OR of the
line state and some bits in HCR_EL2.  We're going to need to call
arm_cpu_set_irq() for VIRQ and VFIQ; for consistency, handle IRQ and
FIQ that way too.

Since arm_cpu_set_irq() is now a function called from other parts of
the CPU code, we make its first argument a properly typed one, with a
wrapper taking void* for when we need to use it as a
qemu_irq_handler.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.c             | 14 +++++++++++---
 target/arm/internals.h       | 14 ++++++++++++++
 target/arm/tcg/gicv5-cpuif.c | 35 ++++-------------------------------
 3 files changed, 29 insertions(+), 34 deletions(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 77aa78f00e2..2b1b87b0ed4 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -806,9 +806,8 @@ void arm_emulate_firmware_reset(CPUState *cpustate, int target_el)
 
 
 #ifndef CONFIG_USER_ONLY
-static void arm_cpu_set_irq(void *opaque, int irq, int level)
+void arm_cpu_set_irq(ARMCPU *cpu, int irq, int level)
 {
-    ARMCPU *cpu = opaque;
     CPUARMState *env = &cpu->env;
     CPUState *cs = CPU(cpu);
     static const int mask[] = {
@@ -860,6 +859,15 @@ static void arm_cpu_set_irq(void *opaque, int irq, int level)
     }
 }
 
+/*
+ * Wrapper of arm_cpu_set_irq with the right argument types to be a
+ * qemu_irq_handler function for our inbound GPIO lines.
+ */
+static void arm_cpu_gpio_set_irq(void *opaque, int irq, int level)
+{
+    arm_cpu_set_irq(opaque, irq, level);
+}
+
 static bool arm_cpu_internal_is_big_endian(CPUState *cs)
 {
     ARMCPU *cpu = ARM_CPU(cs);
@@ -1263,7 +1271,7 @@ static void arm_cpu_initfn(Object *obj)
          */
         qdev_init_gpio_in(DEVICE(cpu), arm_cpu_kvm_set_irq, 6);
     } else {
-        qdev_init_gpio_in(DEVICE(cpu), arm_cpu_set_irq, 6);
+        qdev_init_gpio_in(DEVICE(cpu), arm_cpu_gpio_set_irq, 6);
     }
 
     qdev_init_gpio_out(DEVICE(cpu), cpu->gt_timer_outputs,
diff --git a/target/arm/internals.h b/target/arm/internals.h
index f6b4e173a54..f6c9f984952 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1882,6 +1882,20 @@ void define_gcs_cpregs(ARMCPU *cpu);
 /* Add the cpreg definitions for OMAP CP15 regs */
 void define_omap_cp_regs(ARMCPU *cpu);
 
+#ifndef CONFIG_USER_ONLY
+/**
+ * arm_cpu_set_irq: Assert or clear an IRQ/FIQ/etc interrupt line
+ * @cpu: CPU to set interrupt on
+ * @irq: one of the ARM_CPU_IRQ/ARM_CPU_FIQ/ARM_CPU_VIRQ/etc values
+ * @level: 0 to deassert, non-zero to assert
+ *
+ * This function is called by the qemu_irq_handler function
+ * when IRQ etc are real inbound GPIO lines; it is also called
+ * directly by the GICv5 CPU interface.
+ */
+void arm_cpu_set_irq(ARMCPU *cpu, int irq, int level);
+#endif
+
 /* Add the cpreg definitions for the GICv5 CPU interface */
 void define_gicv5_cpuif_regs(ARMCPU *cpu);
 
diff --git a/target/arm/tcg/gicv5-cpuif.c b/target/arm/tcg/gicv5-cpuif.c
index a6e6c440849..517c780d1f7 100644
--- a/target/arm/tcg/gicv5-cpuif.c
+++ b/target/arm/tcg/gicv5-cpuif.c
@@ -173,33 +173,6 @@ static GICv5PendingIrq gic_hppi(CPUARMState *env, GICv5Domain domain)
     return best;
 }
 
-static void cpu_interrupt_update(CPUARMState *env, int irqtype, bool new_state)
-{
-    CPUState *cs = env_cpu(env);
-
-    /*
-     * OPT: calling cpu_interrupt() and cpu_reset_interrupt() has the
-     * correct behaviour, but is not optimal for the case where we're
-     * setting the interrupt line to the same level it already has.
-     *
-     * Clearing an already clear interrupt is free (it's just doing an
-     * atomic AND operation). Signalling an already set interrupt is a
-     * bit less ideal (it might unnecessarily kick the CPU).
-     *
-     * We could potentially use cpu_test_interrupt(), like
-     * arm_cpu_update_{virq,vfiq,vinmi,vserr}, since we always hold
-     * the BQL here; or perhaps there is an abstraction we could
-     * provide in the core code that all these places could call.
-     *
-     * For now, this is simple and definitely correct.
-     */
-    if (new_state) {
-        cpu_interrupt(cs, irqtype);
-    } else {
-        cpu_reset_interrupt(cs, irqtype);
-    }
-}
-
 static void gicv5_update_irq_fiq(CPUARMState *env)
 {
     /*
@@ -243,12 +216,12 @@ static void gicv5_update_irq_fiq(CPUARMState *env)
     /*
      * Unlike a GICv3 or GICv2, there is no external IRQ or FIQ line
      * to the CPU. Instead we directly signal the interrupt via
-     * cpu_interrupt()/cpu_reset_interrupt().
+     * arm_cpu_set_irq().
      */
     trace_gicv5_update_irq_fiq(irq, fiq, superpriority);
-    cpu_interrupt_update(env, CPU_INTERRUPT_HARD, irq);
-    cpu_interrupt_update(env, CPU_INTERRUPT_FIQ, fiq);
-    cpu_interrupt_update(env, CPU_INTERRUPT_NMI, superpriority);
+    arm_cpu_set_irq(env_archcpu(env), ARM_CPU_IRQ, irq);
+    arm_cpu_set_irq(env_archcpu(env), ARM_CPU_FIQ, fiq);
+    arm_cpu_set_irq(env_archcpu(env), ARM_CPU_NMI, superpriority);
 }
 
 static void gic_recalc_ppi_hppi(CPUARMState *env)
-- 
2.43.0


