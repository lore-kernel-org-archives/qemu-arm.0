Received: by 2002:a17:907:10c8:b0:98d:b2f5:1316 with SMTP id rv8csp502320ejb;
        Wed, 2 Aug 2023 10:03:32 -0700 (PDT)
X-Google-Smtp-Source: APBJJlEZBBL6Q2Y1mayRCo45cl4XtJ1exSAtFvb0dgPAJ+A+kp5/wYXV+wuUyfoOKe4EPVzgFhEL
X-Received: by 2002:a05:622a:24d:b0:40f:d27a:4370 with SMTP id c13-20020a05622a024d00b0040fd27a4370mr7093091qtx.49.1690995812523;
        Wed, 02 Aug 2023 10:03:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1690995812; cv=none;
        d=google.com; s=arc-20160816;
        b=BKlrLX9IfbsjDkzaDqQIk1WD0QonrRNXWa4fqiOk/P1BZQpV9sefU6KlSqlV9x16sG
         KCm25OrG9hgla378Fy0b9zfmpO9pbT4mwMqlzAgch5q5k3KM0q5XvmsygutHMFuO1HaK
         Nv15h8gPg4Pk2u4mqxmjw/FfFmjvCwnHJPs5+pPc7cOJzRGg7IefGFUj+rbQWXGYPHM4
         T6Mj9c1Si2zqRZ2UekgAXsej57Le1LumHydQHrf+Nf0OrGZvH/ZYSHhjMwBpQskQ9ux9
         cLcvKrJDLAqgIwVt2QfHE1E/KGEehsHi3ekwwT8Z8bis99CCuzDtAcdlY41rw+koLBSb
         ABlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=WLjLyC8gD2fbH6jSf2NcFADaJFvM1nR5WGv252TlLAM=;
        fh=zMLmPP9ozJY0jj0bAXqZquWHP0BgmjJZ9lKiHhJNaWU=;
        b=wo/17cU+IspWbHIQ1OzGVnCyiP3YBq0bRm8xdPqXYIrTsHvBzLI23v9GLCOSP8GKm1
         hVvcPcV5fDMZRj9FvG78qVnq571HQzMycVKPUYOdufPs+yecAM8gA4+624ioOMJ4+Dvk
         6aUr/8ONCF5GsO9e4X2kwJphsmBpnbuT8CzqprXqcrlXz6+sgr7ffIPoRfviN/xVkGMO
         zQ7yHN2Ws0ZujDkOJLkZNZAGAwYmhUmODdUEKhFr0i470CstkSNL6AsCn7kAkHE77Qfy
         xq8nsyhoVmwjPtluYgbgFz/Cr++Cz0Ox+NZmdARwijtVU8GNSwThkr5UwtO7A4bOCGXg
         kKBA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fcT2NSQn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 1-20020ac85941000000b00403b8559384si1562848qtz.576.2023.08.02.10.03.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 02 Aug 2023 10:03:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fcT2NSQn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qRFEj-0000S2-Qs; Wed, 02 Aug 2023 13:02:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1qRFEj-0000Qk-3l
 for qemu-arm@nongnu.org; Wed, 02 Aug 2023 13:02:13 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1qRFEf-0003V5-7N
 for qemu-arm@nongnu.org; Wed, 02 Aug 2023 13:02:12 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-3fbc59de009so645205e9.3
 for <qemu-arm@nongnu.org>; Wed, 02 Aug 2023 10:02:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1690995728; x=1691600528;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WLjLyC8gD2fbH6jSf2NcFADaJFvM1nR5WGv252TlLAM=;
 b=fcT2NSQnqa5UWIRu65XaIsC3/04BInHoxpquOW/rauceV37IGp7JpeHXi4C+EvMwCO
 fy38Ocettnl5UTbflIKu38oafEbcJNMjxgKkz80GK08DQzQ6wvM1rL35UqgmSmSJCTAt
 dC67ocvJ0ZEJJMqJivqTxGXQ+dFDSBgzF1n2Es3MCEBKHNshniRdIuL79J520BEPXaIg
 W1pCO1gVRshHFv7NAGZeOr7PNtfW09tj9ShPQwfBPyqBzn5UN81l5KKM5syou6LYROgR
 ch6LINKb1XSs8WfVQ+t87jPZRooC3XxpcHUnN57AivKSYEgoVQ80Tidg4cWlHT7DRBeD
 EP3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690995728; x=1691600528;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WLjLyC8gD2fbH6jSf2NcFADaJFvM1nR5WGv252TlLAM=;
 b=eVfFyBvtaBCID19nM9bqWAhXWR/jqUUkjIVq0FUtvl5uoZwdbLIAj3Koa6zIYys+Mk
 /7PZ7ZRqKU7MaWy39kecALu8HS/k8PFzEaSy/6zO9e/n8zOB8sRMB+Ss4WoSRvwp38FQ
 uqb7ze0xmJ5wmNcdQNo0+QxPaa4DBxhPxM2I2EXrodhX248kQ0hYcbRsJOb6MrT51oWX
 z2cz6988N8OF3s1QH2zADivHR0OS4zx4dISRKBYa0ux1ky3sGrKPj/fHj9HgATTukILq
 75/6RDzeRLxrQjDiHw5lEs6uW1C2Ho6P8r7FYpYVgh0V9mDZ8kmQLRgePq4LQoao2TTQ
 dWoQ==
X-Gm-Message-State: ABy/qLZgTWGvfB0FXIhgUb8g3Bp95PFtFGr6vVm3vbglMq9cgQHERHHP
 /2HaV9dDsJmc6vbrUwTOJdzL8A==
X-Received: by 2002:a7b:c5d9:0:b0:3f7:678c:74b0 with SMTP id
 n25-20020a7bc5d9000000b003f7678c74b0mr5514907wmk.12.1690995727720; 
 Wed, 02 Aug 2023 10:02:07 -0700 (PDT)
Received: from localhost.localdomain ([2.219.138.198])
 by smtp.gmail.com with ESMTPSA id
 q7-20020a1cf307000000b003fa98908014sm2149081wmq.8.2023.08.02.10.02.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Aug 2023 10:02:07 -0700 (PDT)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: peter.maydell@linaro.org
Cc: richard.henderson@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: [PATCH v2 6/6] target/arm/helper: Implement CNTHCTL_EL2.CNT[VP]MASK
Date: Wed,  2 Aug 2023 18:01:57 +0100
Message-ID: <20230802170157.401491-7-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230802170157.401491-1-jean-philippe@linaro.org>
References: <20230802170157.401491-1-jean-philippe@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=jean-philippe@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: dWub6YMt50iF

When FEAT_RME is implemented, these bits override the value of
CNT[VP]_CTL_EL0.IMASK in Realm and Root state. Move the IRQ state update
into a new gt_update_irq() function and test those bits every time we
recompute the IRQ state.

Since we're removing the IRQ state from some trace events, add a new
trace event for gt_update_irq().

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
 target/arm/cpu.h        |  3 +++
 target/arm/helper.c     | 54 ++++++++++++++++++++++++++++++++---------
 target/arm/trace-events |  7 +++---
 3 files changed, 50 insertions(+), 14 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index bcd65a63ca..bedc7ec6dc 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1743,6 +1743,9 @@ static inline void xpsr_write(CPUARMState *env, uint32_t val, uint32_t mask)
 #define HSTR_TTEE (1 << 16)
 #define HSTR_TJDBX (1 << 17)
 
+#define CNTHCTL_CNTVMASK      (1 << 18)
+#define CNTHCTL_CNTPMASK      (1 << 19)
+
 /* Return the current FPSCR value.  */
 uint32_t vfp_get_fpscr(CPUARMState *env);
 void vfp_set_fpscr(CPUARMState *env, uint32_t val);
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 77dd80ad28..68e915ddda 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -2608,6 +2608,28 @@ static uint64_t gt_get_countervalue(CPUARMState *env)
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
 static void gt_recalc_timer(ARMCPU *cpu, int timeridx)
 {
     ARMGenericTimer *gt = &cpu->env.cp15.c14_timer[timeridx];
@@ -2623,13 +2645,9 @@ static void gt_recalc_timer(ARMCPU *cpu, int timeridx)
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
@@ -2648,14 +2666,14 @@ static void gt_recalc_timer(ARMCPU *cpu, int timeridx)
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
@@ -2759,10 +2777,8 @@ static void gt_ctl_write(CPUARMState *env, const ARMCPRegInfo *ri,
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
 
@@ -2888,6 +2904,21 @@ static void gt_virt_ctl_write(CPUARMState *env, const ARMCPRegInfo *ri,
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
@@ -6200,7 +6231,8 @@ static const ARMCPRegInfo el2_cp_reginfo[] = {
        * reset values as IMPDEF. We choose to reset to 3 to comply with
        * both ARMv7 and ARMv8.
        */
-      .access = PL2_RW, .resetvalue = 3,
+      .access = PL2_RW, .type = ARM_CP_IO, .resetvalue = 3,
+      .writefn = gt_cnthctl_write,
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

