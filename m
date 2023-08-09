Received: by 2002:a17:906:f20a:b0:98d:b2f5:1316 with SMTP id gt10csp2863391ejb;
        Wed, 9 Aug 2023 05:37:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGwMTJJNkpgJuQIdBw0OxOtl3hQT36JMdM00YOcNOLHZducxY9SrpBAmry+knER1p0qfu6b
X-Received: by 2002:a05:6214:4006:b0:63d:7e3:d9d with SMTP id kd6-20020a056214400600b0063d07e30d9dmr2430963qvb.58.1691584665100;
        Wed, 09 Aug 2023 05:37:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1691584665; cv=none;
        d=google.com; s=arc-20160816;
        b=cCP66zsZxl8FRXjNgvjUpQSTCuuCzTVoh/19e5rcOW940tskdQRBGOXFzs5DZTwj3/
         qUHyGw9zeMi0TWPVt0oKxSrjjqCQe9pDTLAK93Q9E393V52jdKlqMGIPsZMiDdPgIElO
         YFdEwrg3mU9h/aNFYATFCozNYAzXeJMsLbNA3hEtzR0GkGUh9M7uJomJQiyy4Xw9uo74
         bzvH+yhExDl24P94ygMujojN0ramqzR5GhqLhtV2SWHvcJ64iXjUKenSeujMjhS+t2LS
         xlhXIjZFXe1D5SXWhyPcqg4w7WyPRQp7QrbpsO8dDRD+uhtIXkQ7OA98uEZQOS3tjBo8
         594g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=sXJYVEA+2MZ2M64PWy3XM84dhleTXLNQ1mNpSTn0Nl8=;
        fh=zMLmPP9ozJY0jj0bAXqZquWHP0BgmjJZ9lKiHhJNaWU=;
        b=fx1eol/hneo4HBQkHMEWdT22NPEoHgP3D9QKjPxhPKzNk/2oCIfhRsSYi09FEToBwa
         UywEmjY9YjkxCFlpAVPFyqNxjn3sQ8acN5BixxbBD/35lXJ8p/E83FYEAIt8Z5UMHsPt
         wRVX4zchxnhhu93yNS32AE6yhRCdfh3MZGpu33FrwRDgfv5ZrWKxcdQCxMVX5FiLrgq3
         oSq9Qgi8m7brSF6vuiBuHrzKVKm1vuPLjrMbWw9PNRqngPuXm2xmldlZlqvEj2fN0UNR
         qeWQ+w8iQbleFn7AWyXLou6HlmAv1RmtPkZv90ayo28DX42zGTNIoWL56eG7CJPbqiXF
         JCzg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mRpsIs1U;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o19-20020a0cf4d3000000b00625a2fc5e61si7757064qvm.418.2023.08.09.05.37.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 09 Aug 2023 05:37:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mRpsIs1U;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qTiRJ-0002cA-ON; Wed, 09 Aug 2023 08:37:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1qTiRI-0002av-K2
 for qemu-arm@nongnu.org; Wed, 09 Aug 2023 08:37:24 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1qTiRD-0002pA-BU
 for qemu-arm@nongnu.org; Wed, 09 Aug 2023 08:37:24 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-3fe1fc8768aso65039465e9.1
 for <qemu-arm@nongnu.org>; Wed, 09 Aug 2023 05:37:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1691584638; x=1692189438;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sXJYVEA+2MZ2M64PWy3XM84dhleTXLNQ1mNpSTn0Nl8=;
 b=mRpsIs1U0/hkOqvqGbLnZ9jmfHCvJiZTVph9sCavYrULYnP1A+CQRRJ8KOfXlK+Uxc
 qAVzpZ0gxV2E6hcNfi5jAvMfZNssLzEPCiPsTU+ZbOUmKRNU832NCIml2ZuHcFJz8nN6
 dvNGea04e5w5CEpHwYf6yVAe7xOutqC4b5uN0Dyom48N5qA4onp7qaV7VayBqjO8QlfZ
 D11bzABRj+aef7UFMV3sIYLyCW95TFgfJSfkuV7UsaCmmY/XeoSnMPiV3sNiUIKMxz6c
 BIXvzqpwLXCWghGL1Dds9AEgPk63OCbKJQBJqRz/Rtbf7V+Cg2m6S4Dz9pnRl+9HCK1j
 Ud2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691584638; x=1692189438;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sXJYVEA+2MZ2M64PWy3XM84dhleTXLNQ1mNpSTn0Nl8=;
 b=BKa8bRnoR7ze6lHgfOcPqzbznR6KuZV7iuNGDqZWEsdR1E/Qbm4yDDOP5JJqAEJT1N
 syngKLEKNB3hFeoFIrIg45+xbczLBPsOctDt7DcO1kjMpH5L4h41+wHcxGxwEACtZfry
 iuAYL3l/l399Bhe+NoZ4ip4pfypt8W3OHgG8H5evKOlTHDKYc6g2umeqX6ov6QZEIdxp
 eK/J5fda+Mmht/XhR2OOSq7H1YbXQVTlBdxZU/tm/dB+u1oxaxY9lgv9tUwy7/EqjdTO
 dfniW6G7gwblxvtfsP4FJeseIv3C1kjEG0PM8l2tLVIY/bnvnOHQ56Ruis4+JW4wW9lk
 73GA==
X-Gm-Message-State: AOJu0YwO0+4h3Gb7HBcD38Gx8pcah21Eqhqcjkx5ReUZspHOd6pGg9J4
 /ZUiVrTV+DlKpFYJAXMIjqCUPw==
X-Received: by 2002:a5d:5348:0:b0:317:618a:c72 with SMTP id
 t8-20020a5d5348000000b00317618a0c72mr1683172wrv.64.1691584637780; 
 Wed, 09 Aug 2023 05:37:17 -0700 (PDT)
Received: from localhost.localdomain ([2.219.138.198])
 by smtp.gmail.com with ESMTPSA id
 k6-20020a5d5246000000b00317f70240afsm5617888wrc.27.2023.08.09.05.37.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Aug 2023 05:37:17 -0700 (PDT)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: peter.maydell@linaro.org
Cc: richard.henderson@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: [PATCH v3 6/6] target/arm/helper: Implement CNTHCTL_EL2.CNT[VP]MASK
Date: Wed,  9 Aug 2023 13:37:06 +0100
Message-ID: <20230809123706.1842548-7-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230809123706.1842548-1-jean-philippe@linaro.org>
References: <20230809123706.1842548-1-jean-philippe@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=jean-philippe@linaro.org; helo=mail-wm1-x333.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: cUBzzIRX5ysh

When FEAT_RME is implemented, these bits override the value of
CNT[VP]_CTL_EL0.IMASK in Realm and Root state. Move the IRQ state update
into a new gt_update_irq() function and test those bits every time we
recompute the IRQ state.

Since we're removing the IRQ state from some trace events, add a new
trace event for gt_update_irq().

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
 target/arm/cpu.h        |  4 +++
 target/arm/cpu.c        |  4 +++
 target/arm/helper.c     | 65 ++++++++++++++++++++++++++++++++++-------
 target/arm/trace-events |  7 +++--
 4 files changed, 66 insertions(+), 14 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index bcd65a63ca..855a76ae81 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1115,6 +1115,7 @@ struct ArchCPU {
 };
 
 unsigned int gt_cntfrq_period_ns(ARMCPU *cpu);
+void gt_rme_post_el_change(ARMCPU *cpu, void *opaque);
 
 void arm_cpu_post_init(Object *obj);
 
@@ -1743,6 +1744,9 @@ static inline void xpsr_write(CPUARMState *env, uint32_t val, uint32_t mask)
 #define HSTR_TTEE (1 << 16)
 #define HSTR_TJDBX (1 << 17)
 
+#define CNTHCTL_CNTVMASK      (1 << 18)
+#define CNTHCTL_CNTPMASK      (1 << 19)
+
 /* Return the current FPSCR value.  */
 uint32_t vfp_get_fpscr(CPUARMState *env);
 void vfp_set_fpscr(CPUARMState *env, uint32_t val);
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 93c28d50e5..7df1f7600b 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -2169,6 +2169,10 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
         set_feature(env, ARM_FEATURE_VBAR);
     }
 
+    if (cpu_isar_feature(aa64_rme, cpu)) {
+        arm_register_el_change_hook(cpu, &gt_rme_post_el_change, 0);
+    }
+
     register_cp_regs_for_features(cpu);
     arm_cpu_register_gdb_regs_for_features(cpu);
 
diff --git a/target/arm/helper.c b/target/arm/helper.c
index dbfe9f2f5e..86ce6a52bb 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -2608,6 +2608,39 @@ static uint64_t gt_get_countervalue(CPUARMState *env)
     return qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) / gt_cntfrq_period_ns(cpu);
 }
 
+static void gt_update_irq(ARMCPU *cpu, int timeridx)
+{
+    CPUARMState *env = &cpu->env;
+    uint64_t cnthctl = env->cp15.cnthctl_el2;
+    ARMSecuritySpace ss = arm_security_space(env);
+    /* ISTATUS && !IMASK */
+    int irqstate = (env->cp15.c14_timer[timeridx].ctl & 6) == 4;
+
+    /*
+     * If bit CNTHCTL_EL2.CNT[VP]MASK is set, it overrides IMASK.
+     * It is RES0 in Secure and NonSecure state.
+     */
+    if ((ss == ARMSS_Root || ss == ARMSS_Realm) &&
+        ((timeridx == GTIMER_VIRT && (cnthctl & CNTHCTL_CNTVMASK)) ||
+         (timeridx == GTIMER_PHYS && (cnthctl & CNTHCTL_CNTPMASK)))) {
+        irqstate = 0;
+    }
+
+    qemu_set_irq(cpu->gt_timer_outputs[timeridx], irqstate);
+    trace_arm_gt_update_irq(timeridx, irqstate);
+}
+
+void gt_rme_post_el_change(ARMCPU *cpu, void *ignored)
+{
+    /*
+     * Changing security state between Root and Secure/NonSecure, which may
+     * happen when switching EL, can change the effective value of CNTHCTL_EL2
+     * mask bits. Update the IRQ state accordingly.
+     */
+    gt_update_irq(cpu, GTIMER_VIRT);
+    gt_update_irq(cpu, GTIMER_PHYS);
+}
+
 static void gt_recalc_timer(ARMCPU *cpu, int timeridx)
 {
     ARMGenericTimer *gt = &cpu->env.cp15.c14_timer[timeridx];
@@ -2623,13 +2656,9 @@ static void gt_recalc_timer(ARMCPU *cpu, int timeridx)
         /* Note that this must be unsigned 64 bit arithmetic: */
         int istatus = count - offset >= gt->cval;
         uint64_t nexttick;
-        int irqstate;
 
         gt->ctl = deposit32(gt->ctl, 2, 1, istatus);
 
-        irqstate = (istatus && !(gt->ctl & 2));
-        qemu_set_irq(cpu->gt_timer_outputs[timeridx], irqstate);
-
         if (istatus) {
             /* Next transition is when count rolls back over to zero */
             nexttick = UINT64_MAX;
@@ -2648,14 +2677,14 @@ static void gt_recalc_timer(ARMCPU *cpu, int timeridx)
         } else {
             timer_mod(cpu->gt_timer[timeridx], nexttick);
         }
-        trace_arm_gt_recalc(timeridx, irqstate, nexttick);
+        trace_arm_gt_recalc(timeridx, nexttick);
     } else {
         /* Timer disabled: ISTATUS and timer output always clear */
         gt->ctl &= ~4;
-        qemu_set_irq(cpu->gt_timer_outputs[timeridx], 0);
         timer_del(cpu->gt_timer[timeridx]);
         trace_arm_gt_recalc_disabled(timeridx);
     }
+    gt_update_irq(cpu, timeridx);
 }
 
 static void gt_timer_reset(CPUARMState *env, const ARMCPRegInfo *ri,
@@ -2759,10 +2788,8 @@ static void gt_ctl_write(CPUARMState *env, const ARMCPRegInfo *ri,
          * IMASK toggled: don't need to recalculate,
          * just set the interrupt line based on ISTATUS
          */
-        int irqstate = (oldval & 4) && !(value & 2);
-
-        trace_arm_gt_imask_toggle(timeridx, irqstate);
-        qemu_set_irq(cpu->gt_timer_outputs[timeridx], irqstate);
+        trace_arm_gt_imask_toggle(timeridx);
+        gt_update_irq(cpu, timeridx);
     }
 }
 
@@ -2888,6 +2915,21 @@ static void gt_virt_ctl_write(CPUARMState *env, const ARMCPRegInfo *ri,
     gt_ctl_write(env, ri, GTIMER_VIRT, value);
 }
 
+static void gt_cnthctl_write(CPUARMState *env, const ARMCPRegInfo *ri,
+                             uint64_t value)
+{
+    ARMCPU *cpu = env_archcpu(env);
+    uint32_t oldval = env->cp15.cnthctl_el2;
+
+    raw_write(env, ri, value);
+
+    if ((oldval ^ value) & CNTHCTL_CNTVMASK) {
+        gt_update_irq(cpu, GTIMER_VIRT);
+    } else if ((oldval ^ value) & CNTHCTL_CNTPMASK) {
+        gt_update_irq(cpu, GTIMER_PHYS);
+    }
+}
+
 static void gt_cntvoff_write(CPUARMState *env, const ARMCPRegInfo *ri,
                               uint64_t value)
 {
@@ -6202,7 +6244,8 @@ static const ARMCPRegInfo el2_cp_reginfo[] = {
        * reset values as IMPDEF. We choose to reset to 3 to comply with
        * both ARMv7 and ARMv8.
        */
-      .access = PL2_RW, .resetvalue = 3,
+      .access = PL2_RW, .type = ARM_CP_IO, .resetvalue = 3,
+      .writefn = gt_cnthctl_write, .raw_writefn = raw_write,
       .fieldoffset = offsetof(CPUARMState, cp15.cnthctl_el2) },
     { .name = "CNTVOFF_EL2", .state = ARM_CP_STATE_AA64,
       .opc0 = 3, .opc1 = 4, .crn = 14, .crm = 0, .opc2 = 3,
diff --git a/target/arm/trace-events b/target/arm/trace-events
index 2a0ba7bffc..48cc0512db 100644
--- a/target/arm/trace-events
+++ b/target/arm/trace-events
@@ -1,13 +1,14 @@
 # See docs/devel/tracing.rst for syntax documentation.
 
 # helper.c
-arm_gt_recalc(int timer, int irqstate, uint64_t nexttick) "gt recalc: timer %d irqstate %d next tick 0x%" PRIx64
-arm_gt_recalc_disabled(int timer) "gt recalc: timer %d irqstate 0 timer disabled"
+arm_gt_recalc(int timer, uint64_t nexttick) "gt recalc: timer %d next tick 0x%" PRIx64
+arm_gt_recalc_disabled(int timer) "gt recalc: timer %d timer disabled"
 arm_gt_cval_write(int timer, uint64_t value) "gt_cval_write: timer %d value 0x%" PRIx64
 arm_gt_tval_write(int timer, uint64_t value) "gt_tval_write: timer %d value 0x%" PRIx64
 arm_gt_ctl_write(int timer, uint64_t value) "gt_ctl_write: timer %d value 0x%" PRIx64
-arm_gt_imask_toggle(int timer, int irqstate) "gt_ctl_write: timer %d IMASK toggle, new irqstate %d"
+arm_gt_imask_toggle(int timer) "gt_ctl_write: timer %d IMASK toggle"
 arm_gt_cntvoff_write(uint64_t value) "gt_cntvoff_write: value 0x%" PRIx64
+arm_gt_update_irq(int timer, int irqstate) "gt_update_irq: timer %d irqstate %d"
 
 # kvm.c
 kvm_arm_fixup_msi_route(uint64_t iova, uint64_t gpa) "MSI iova = 0x%"PRIx64" is translated into 0x%"PRIx64
-- 
2.41.0

