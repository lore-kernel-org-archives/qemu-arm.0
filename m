Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A47CFCA9ED2
	for <qemu-arm@archiver.kernel.org>; Tue, 13 Oct 2026 08:54:25 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xGY38-0006s3-0j; Tue, 13 Oct 2026 04:39:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xGY33-0006pi-R2
 for qemu-arm@nongnu.org; Tue, 13 Oct 2026 04:39:49 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xGY32-0007a5-1g
 for qemu-arm@nongnu.org; Tue, 13 Oct 2026 04:39:49 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-4a17baef589so22009625e9.0
 for <qemu-arm@nongnu.org>; Tue, 13 Oct 2026 01:39:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1791880787; x=1792485587; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=OaiC0A3kyB7u1DNetaci/CV68nbx8shGZnFz0+Agagc=;
 b=jbC+iR6IM/jPCOZ93TZBCKHTV/Rl0HR1ao7tSFPv5xTV/XV4EfrAPohihmASrv4l+3
 3dddkp9BjZXuwWeGWNW0qFExt3H7aiiveKFnxm+oanBvwCbji8p3/CC/bs09Xb5YJUel
 nMnJvPGWg33K6E+89Jfeq7LMQWx2d7EZdFceGdZU0UaU+KCRwYsMa11zYQlvrw7S9A8Q
 SnO35kmDoqrcrTJM1AgUBZQVclntjWkGo/Dx9GUNiJFM+KZoA3mgtprGHNtB5uLBAJ5W
 pht2JFpYAdoxmEVq6RaCB/Qxakm0FAaB7yknll4whaka1scHTv0L5oKm81eOSOHHEfzI
 v2Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791880787; x=1792485587;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=OaiC0A3kyB7u1DNetaci/CV68nbx8shGZnFz0+Agagc=;
 b=i7DAXVQHuLKzFbPkowP3JN9upi1M3byyGsXoK2HnAGaDFXbhTGsETcKv1OGop/Gq6r
 gWB35PXlVg/ydHSk9t0lO6jO0AbQ9w6EWpSvsxemrUHwE6E8CQpVoVu12a2V4ZZcbG8G
 z37qA11WRUk9mHNpx47X0v1mULZ615lduRMkUIm8rLlGs+tG3VphkEOS0WgZ76F1OJcI
 RefK7Gno3KVXGgTucdNLog6sloJcJhS9IFZqagaTZDpOXAbaa7aVl8PTu12Z4AztPhML
 pkgGaWOZJJADiLxk71bcFeCrWfdc93W/vn2rCMC66M/yFTzP0djoQ1YCRV73k9yWxUsq
 ycbw==
X-Gm-Message-State: AFq9FYJGsKjn/D+mK8M7DT+qlgUpb2JFi70DaS+Nvff9LnLSthzp2DmG
 1LuL64fxQ2VbcQxmhsJYEJsMA7t4ZNjdpp+OgBOOKb8hpdPdynYD5ev3Y/y24MQ7nvxyHTOrfvx
 /EetvIdg=
X-Gm-Gg: AYBFou0JwInF91zFsfWCnbPwhER3e+SGRTtWtvqKh6GBUsUiMtSKr5aoygIxi335RKe
 whZQ9BLiHzoTTVryOzVhKOCGy5W16ceK0yEya3qNzqAb3aWcKE+ZgnsldtEOknQcF9d9Ufg26OZ
 W/q+UVUao5TlAsvN+sfwrhRIWrm+RuQyW3L2xVsgfxzwgy3Arw4aXmbHP6dkW1fiiK3tJlx1tJt
 AygOBKaBo6KI/vDz6aN7Yp3qnxSJa1rBEd7XURveSfrsvZAM0avfkPefguT7xK8U1t+90rq9o0j
 zxvOlqnr52iWwhp+ANPZxIjD4Nq2t2RVBesoBqO+SecL74HGp/CceGXI7vGK48lMG3MZtp2ZIns
 1k1Tf2zsctkLkHnNsUtUmuqIiPOMKdmD7Po29VFpkA8gxOS1o1hi+TxuBJza4IXucBNYBeOkFgB
 G0CpcIDvHG6saOl1qusQvhTsFPGx6Fa0+JUapFRqPKqSkhiyoKc/M9F2ASP2PgYmBPOjDTZf6CS
 RvcczQonflKwWXtRW5a7/l7V8rT0VARonyzIkSd617FvmI9sGMXqtF4FftY99jP/K/9+H95LEPW
 3F0=
X-Received: by 2002:a05:600c:c167:b0:4a1:a3cc:3c5c with SMTP id
 5b1f17b1804b1-4a1a3cc3c71mr70054675e9.16.1791880786633; 
 Tue, 13 Oct 2026 01:39:46 -0700 (PDT)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a18be96549sm495086735e9.6.2026.10.13.01.39.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Oct 2026 01:39:45 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 07/86] target/arm: GICv5 cpuif: Use arm_cpu_set_irq() to set
 IRQ/FIQ status
Date: Tue, 13 Oct 2026 09:38:14 +0100
Message-ID: <20261013083933.1024405-8-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261013083933.1024405-1-peter.maydell@linaro.org>
References: <20261013083933.1024405-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.c             | 14 +++++++++++---
 target/arm/internals.h       | 14 ++++++++++++++
 target/arm/tcg/gicv5-cpuif.c | 35 ++++-------------------------------
 3 files changed, 29 insertions(+), 34 deletions(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 10ac6c98318..014ec6a945e 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -808,9 +808,8 @@ void arm_emulate_firmware_reset(CPUState *cpustate, int target_el)
 
 
 #ifndef CONFIG_USER_ONLY
-static void arm_cpu_set_irq(void *opaque, int irq, int level)
+void arm_cpu_set_irq(ARMCPU *cpu, int irq, int level)
 {
-    ARMCPU *cpu = opaque;
     CPUARMState *env = &cpu->env;
     CPUState *cs = CPU(cpu);
     static const int mask[] = {
@@ -862,6 +861,15 @@ static void arm_cpu_set_irq(void *opaque, int irq, int level)
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
@@ -1265,7 +1273,7 @@ static void arm_cpu_initfn(Object *obj)
          */
         qdev_init_gpio_in(DEVICE(cpu), arm_cpu_kvm_set_irq, 6);
     } else {
-        qdev_init_gpio_in(DEVICE(cpu), arm_cpu_set_irq, 6);
+        qdev_init_gpio_in(DEVICE(cpu), arm_cpu_gpio_set_irq, 6);
     }
 
     qdev_init_gpio_out(DEVICE(cpu), cpu->gt_timer_outputs,
diff --git a/target/arm/internals.h b/target/arm/internals.h
index c41fa5225c7..9d817961c67 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1886,6 +1886,20 @@ void define_gcs_cpregs(ARMCPU *cpu);
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


