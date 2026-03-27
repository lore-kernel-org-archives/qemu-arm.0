Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A159510ED65C
	for <qemu-arm@archiver.kernel.org>; Fri, 27 Mar 2026 11:23:38 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w65Dl-0001QA-LA; Fri, 27 Mar 2026 07:19:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1w65CN-0007EI-JR
 for qemu-arm@nongnu.org; Fri, 27 Mar 2026 07:17:57 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1w65CL-0008Rp-F3
 for qemu-arm@nongnu.org; Fri, 27 Mar 2026 07:17:55 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-486fe36cfabso15737785e9.1
 for <qemu-arm@nongnu.org>; Fri, 27 Mar 2026 04:17:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1774610271; x=1775215071; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/538nhOyJvTtKUnWgIA1CYfboj+HJJDD3GUusHPw/0c=;
 b=NVgWrZ40Xdwe/MaVLkujszXmbDt7Y+/4UPFoSQxUViRE2iAytC6jMHcfQU8GMYAdSa
 2GqTVvxZvoltPelST+H3Xc13pz5N5T04Rm/Slyl0+lPGUY2XYViAipQhdaCLyFBKOkJ3
 iHsnifLsJZhweZPpW2cBciCNxxhZiNG7UxY58o/iSOLeQZ64C/lOnY3d/9dhq7ltkPLj
 e7dbInzQdMJJM1145ks5p/cmXPfZ7fhlwhsuLqFtbs3ZcfQW8qk8J2m75wMm6wil5RBL
 SV7OP1QF/VOkLRI4pMNnXVclJpBKtuTBCL8rnKR9oF3XK1nK8KMFT7Jm1CZxvwWvyDAP
 Zjng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774610271; x=1775215071;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=/538nhOyJvTtKUnWgIA1CYfboj+HJJDD3GUusHPw/0c=;
 b=TLJYuvSZCOYrtgpAWYuUwsCNhDdK/r+e9kvkgIJy4qwo6KCji53NFSqt4tyK+eaT/q
 qwuFVEbKavEDnBHsm77JMwsTCLlmwKwT3E5mCRxaZM6dZNF7qodVgUEPGCxYQRY+CLqF
 VyeQL9lbpnfACMMPOGNQslwpefS2S8ENwleXkuqFKS5b4f8GHROaESdLV0Xak/QmTgYh
 csFZ0DRYga8zSxgthwnX9jwO87V3JrK1jXcXgxpBVA+OfQzVPw4yJK2ltFJ9+Q44CQES
 6e1cejA7Eb17LHonmodDE7LjZVte1wzR7Qg+wgodyd3Vymq8T84M5WeMW9jKzKDEWt3w
 aI8g==
X-Gm-Message-State: AOJu0Yz1AY/pkADECfo+BIRxZjpg+4Mp+Fo8CuVI7SuwW+fv6AT8LCX+
 r0BKwvbbRe0sTDpaFU+9KDoDI8skRPDO1g4G0zZknj8Z9r1NOYpMpgbICK8sXV4QmDW2kHjsLyE
 JNvi3ag0=
X-Gm-Gg: ATEYQzxQyFgduhvnCrfkpQuhFmZEM6bYFFAjCfyWAPOrOnLUM8HZQ5yUxWfw2s+CnFf
 HD/L2hNrB7uazsXtuNdOx08W5XXCnFRH/CLemPk6nQNlTZtCDudpuxQnJoGtCBSlXMs5MSAdvMp
 RW4XUBItgCL8FxU5FM0fa2GVnJ/Hk0JATY21YHKj3VJKHc6GEnmucU2ZW0hidBIByxfcY40n2LE
 dXbjomH02pnyYXjMKw0aDPwTRVhK6xhMr/PfKOq/QPnM3nicttkQRnlGHNzX3I8rLlPrqkiiJym
 29B9BStrUmsV2DUgBGKbgfJBdnmVNCbl/DLMcMUnN4cNS3krktd+o5IfR0PihQ6E5vrdFKMumtv
 znHy6Glz+vRCeFIMObh4ATJB152UY8p9Xbvf0y6vlUtJj0vm7SyvyKupsxB8sHR90BgZayqxAL4
 hH6u36vVik9IdC2RGodKTcScAr6ZS50bEADme4lmeCdUQhAXBO/6KuE8gKYCy33oFSu8mdcTHXU
 O3nJz4/7QV3LoNgPoBmHSoHeyG+jNE=
X-Received: by 2002:a7b:c44f:0:b0:485:5403:7497 with SMTP id
 5b1f17b1804b1-48722bed60fmr66821275e9.14.1774610271156; 
 Fri, 27 Mar 2026 04:17:51 -0700 (PDT)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43b919cf2b2sm15484227f8f.18.2026.03.27.04.17.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Mar 2026 04:17:50 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Jonathan Cameron <jonathan.cameron@huawei.com>
Subject: [PATCH v2 52/65] target/arm: GICv5 cpuif: Signal IRQ or FIQ
Date: Fri, 27 Mar 2026 11:16:47 +0000
Message-ID: <20260327111700.795099-53-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260327111700.795099-1-peter.maydell@linaro.org>
References: <20260327111700.795099-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32c.google.com
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

The CPU interface must signal IRQ or FIQ (possibly with
superpriority) when there is a pending interrupt of sufficient
priority available.  Implement this logic.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
---
 target/arm/tcg/gicv5-cpuif.c | 87 ++++++++++++++++++++++++++++++++++--
 target/arm/tcg/trace-events  |  1 +
 2 files changed, 85 insertions(+), 3 deletions(-)

diff --git a/target/arm/tcg/gicv5-cpuif.c b/target/arm/tcg/gicv5-cpuif.c
index 94590bd765..7caf2102a9 100644
--- a/target/arm/tcg/gicv5-cpuif.c
+++ b/target/arm/tcg/gicv5-cpuif.c
@@ -170,6 +170,84 @@ static GICv5PendingIrq gic_hppi(CPUARMState *env, GICv5Domain domain)
     return best;
 }
 
+static void cpu_interrupt_update(CPUARMState *env, int irqtype, bool new_state)
+{
+    CPUState *cs = env_cpu(env);
+
+    /*
+     * OPT: calling cpu_interrupt() and cpu_reset_interrupt() has the
+     * correct behaviour, but is not optimal for the case where we're
+     * setting the interrupt line to the same level it already has.
+     *
+     * Clearing an already clear interrupt is free (it's just doing an
+     * atomic AND operation). Signalling an already set interrupt is a
+     * bit less ideal (it might unnecessarily kick the CPU).
+     *
+     * We could potentially use cpu_test_interrupt(), like
+     * arm_cpu_update_{virq,vfiq,vinmi,vserr}, since we always hold
+     * the BQL here; or perhaps there is an abstraction we could
+     * provide in the core code that all these places could call.
+     *
+     * For now, this is simple and definitely correct.
+     */
+    if (new_state) {
+        cpu_interrupt(cs, irqtype);
+    } else {
+        cpu_reset_interrupt(cs, irqtype);
+    }
+}
+
+static void gicv5_update_irq_fiq(CPUARMState *env)
+{
+    /*
+     * Update whether we are signalling IRQ or FIQ based on the
+     * current state of the CPU interface (and in particular on the
+     * HPPI information from the IRS and for the PPIs for each
+     * interrupt domain);
+     *
+     * The logic here for IRQ and FIQ is defined by rules R_QLGBG and
+     * R_ZGHMN; whether to signal with superpriority is defined by
+     * rule R_CSBDX.
+     *
+     * For the moment, we do not consider preemptive interrupts,
+     * because these only occur when there is a HPPI of sufficient
+     * priority for another interrupt domain, and we only support EL1
+     * and the NonSecure interrupt domain currently.
+     *
+     * NB: when we handle more than just EL1 we will need to arrange
+     * to call this function to re-evaluate the IRQ and FIQ state when
+     * we change EL.
+     */
+    GICv5PendingIrq current_hppi;
+    bool irq, fiq, superpriority;
+
+    /*
+     * We will never signal FIQ because FIQ is for preemptive
+     * interrupts or for EL3 HPPIs.
+     */
+    fiq = false;
+
+    /*
+     * We signal IRQ when we are not signalling FIQ and there is a
+     * HPPI of sufficient priority for the current domain. It has
+     * Superpriority if its priority is 0 (in which case it is
+     * CPU_INTERRUPT_NMI rather than CPU_INTERRUPT_HARD).
+     */
+    current_hppi = gic_hppi(env, gicv5_current_phys_domain(env));
+    superpriority = current_hppi.prio == 0;
+    irq = current_hppi.prio != PRIO_IDLE && !superpriority;
+
+    /*
+     * Unlike a GICv3 or GICv2, there is no external IRQ or FIQ line
+     * to the CPU. Instead we directly signal the interrupt via
+     * cpu_interrupt()/cpu_reset_interrupt().
+     */
+    trace_gicv5_update_irq_fiq(irq, fiq, superpriority);
+    cpu_interrupt_update(env, CPU_INTERRUPT_HARD, irq);
+    cpu_interrupt_update(env, CPU_INTERRUPT_FIQ, fiq);
+    cpu_interrupt_update(env, CPU_INTERRUPT_NMI, superpriority);
+}
+
 static void gic_recalc_ppi_hppi(CPUARMState *env)
 {
     /*
@@ -219,15 +297,16 @@ static void gic_recalc_ppi_hppi(CPUARMState *env)
                                   env->gicv5_cpuif.ppi_hppi[i].intid,
                                   env->gicv5_cpuif.ppi_hppi[i].prio);
     }
+    gicv5_update_irq_fiq(env);
 }
 
 void gicv5_forward_interrupt(ARMCPU *cpu, GICv5Domain domain)
 {
     /*
-     * For now, we do nothing. Later we will recalculate the overall
-     * HPPI by combining the IRS HPPI with the PPI HPPI, and possibly
-     * signal IRQ/FIQ.
+     * IRS HPPI has changed: recalculate the IRQ/FIQ levels by
+     * combining the IRS HPPI with the PPI HPPI.
      */
+    gicv5_update_irq_fiq(&cpu->env);
 }
 
 static void gic_cddis_write(CPUARMState *env, const ARMCPRegInfo *ri,
@@ -430,6 +509,7 @@ static void gic_icc_cr0_el1_write(CPUARMState *env, const ARMCPRegInfo *ri,
     value |= R_ICC_CR0_LINK_MASK | R_ICC_CR0_LINK_IDLE_MASK;
 
     env->gicv5_cpuif.icc_cr0[domain] = value;
+    gicv5_update_irq_fiq(env);
 }
 
 static void gic_icc_cr0_el1_reset(CPUARMState *env, const ARMCPRegInfo *ri)
@@ -571,6 +651,7 @@ static void gic_cdeoi_write(CPUARMState *env, const ARMCPRegInfo *ri,
 
     /* clear lowest bit, doing nothing if already zero */
     *apr &= *apr - 1;
+    gicv5_update_irq_fiq(env);
 }
 
 static void gic_cddi_write(CPUARMState *env, const ARMCPRegInfo *ri,
diff --git a/target/arm/tcg/trace-events b/target/arm/tcg/trace-events
index c60ce6834e..2bfa8fc552 100644
--- a/target/arm/tcg/trace-events
+++ b/target/arm/tcg/trace-events
@@ -7,3 +7,4 @@ gicv5_gicr_cdia_fail(int domain, const char *reason) "domain %d CDIA attempt fai
 gicv5_gicr_cdia(int domain, uint32_t id) "domain %d CDIA acknowledge of interrupt 0x%x"
 gicv5_cdeoi(int domain) "domain %d CDEOI performing priority drop"
 gicv5_cddi(int domain, uint32_t id) "domain %d CDDI deactivating interrupt ID 0x%x"
+gicv5_update_irq_fiq(bool irq, bool fiq, bool nmi) "now IRQ %d FIQ %d NMI %d"
-- 
2.43.0


