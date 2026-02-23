Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C88DEC110C
	for <qemu-arm@archiver.kernel.org>; Mon, 23 Feb 2026 17:09:29 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vuZKm-0002Vu-He; Mon, 23 Feb 2026 12:03:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vuZKl-0002UG-Cr
 for qemu-arm@nongnu.org; Mon, 23 Feb 2026 12:02:59 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vuZKj-0000Il-Oz
 for qemu-arm@nongnu.org; Mon, 23 Feb 2026 12:02:59 -0500
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-480706554beso55476215e9.1
 for <qemu-arm@nongnu.org>; Mon, 23 Feb 2026 09:02:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1771866176; x=1772470976; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=HXAErUH26qog8NLwcGHpVWf2yib3kbn8Xkw9zUFi3XE=;
 b=n1BRVyzd3r3M5hMt0jlbZhSHfWAmwO4q6UUzNbtc9tG2x5HYPVE0ac7WMoak8qvcTg
 tgwi/t1zCct7Eom1vGNnKXIZpZavqTn+8yJWDrkKC5+rXc/2E8vXwzzYlcQFej6yq0tf
 Gd/xNLeF/J7GnRSNPYCexQQmLMP3bt2DPNQ1ZLLHxeDsoCNeE6qyNI0acSP5K+Zkn+YG
 yTArkkzdLdhpDrXsua3hUz773Uu8B/ARAYdDjN7MrKd8Ew9M45NzBZFvlwMkYe59UlI/
 f+PS0pAQqVr50l38IwaV/aGkLrPnctlW+dYp+kAnWGxcrETN4fwe8v4DAfDC9JbwWfyy
 73aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771866176; x=1772470976;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=HXAErUH26qog8NLwcGHpVWf2yib3kbn8Xkw9zUFi3XE=;
 b=RZ4Eg7PNtssBY8QGLgW2FRfnvpM3x64Bcfk8VguV9hhJRIdfl6FJBefYBWCTJLX7lY
 37Z4cH7dzajnVJ1T7a5mdXsKPWr2iTv47umcKiJkBGfrs5T9bI1A53gNFNnywhCwmAjk
 oM6gz/oWsTcIyOGPI85iV/MJzHq0ek59ui/Ka+6g3gj0+Gyqm6GgR/tXoiuD9WeF/txx
 /xWMjlPLivPQBczhnxSK1VMOcpl2fNTBm830tnIrQ5RVoFoU6csuKwomp5bQztRRQMVX
 xqkabEMT4XeugQ+tmZMUyiLgIw7gDcRIzjek6a3ZXzHrKhkhXCwbTKkdWk15q3WAWvnV
 bd8w==
X-Gm-Message-State: AOJu0YyrbQc7qOVGr/E9ZwIt8cEK+7HzzWJJ/gO7K9N9FoOhWzpA2nDD
 Cr7HSgqSi7ppf3KlBzO6te6Yl5OXATtwLwEvgI2e2nSSwIdawY+Hxtll+OhgySlu6TSMNkP50lQ
 dXnIR
X-Gm-Gg: AZuq6aLFLievZB1po0mv3oZi37I+7/lbeEkqnW1HYuFX1sMIvBx5m64Vo5SqBCHoRW1
 un13WNULjTaalgfVZMhQEd0LkxFLSgZHUv29WPmUCWkuZBnkhiTi95GJZQAxn4q68EZ9t50EXMl
 t94+KWgvr0m3VAlPLTJo1Fcjv36Hq/Q4/ceNf/xTD5nMQRbHNdlEuOUO89uJNEr338kHAU3yTSa
 iUhEXdIUYUrXzIAxi7vQf2zvt4aTqjugJNJWIGA2r8GapIC4R9YhJ4uvP5aLo7/0BJ2nNieMth5
 mUUwuchu/LAszFkAXfpOd2NEoMjPa1QtEUrELHkUrqPzuTqHoKBK62KSZ1UtS2aCZ09pB2SfPfT
 FnLb0JPVII14Cl2y38N+8MkPwZBAYyVasq/WhNDPN9n5jx6GwONnWaIbcfCYy894+rNM+06ALKt
 cv/+0+qxUNmVa62I7UbnA0Huz2NaK3QJf9zZSWj2TK0keUuvkkzybAlcWgvXAWJyzqN/eKrezik
 Rz7SmWnUoEea3eXCMSPuRu7+QVBm2Y=
X-Received: by 2002:a05:600c:3106:b0:483:afbb:a077 with SMTP id
 5b1f17b1804b1-483afbba2afmr85773125e9.1.1771866176102; 
 Mon, 23 Feb 2026 09:02:56 -0800 (PST)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483a9b21ceasm200155625e9.0.2026.02.23.09.02.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Feb 2026 09:02:55 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 37/65] target/arm: GICv5 cpuif: Implement PPI pending status
 registers
Date: Mon, 23 Feb 2026 17:01:44 +0000
Message-ID: <20260223170212.441276-38-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260223170212.441276-1-peter.maydell@linaro.org>
References: <20260223170212.441276-1-peter.maydell@linaro.org>
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

The GICv5 PPI pending status is handled by two registers, one of
which is write-1-to-set and one of which is write-1-to-clear.  The
pending state is read-only for PPIs where the handling mode is Edge.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.h             |  1 +
 target/arm/tcg/gicv5-cpuif.c | 44 ++++++++++++++++++++++++++++++++++++
 2 files changed, 45 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 4574f7005d..980abda3ca 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -606,6 +606,7 @@ typedef struct CPUArchState {
         /* Most PPI registers have 1 bit per PPI, so 64 PPIs to a register */
         uint64_t ppi_active[GICV5_NUM_PPIS / 64];
         uint64_t ppi_hm[GICV5_NUM_PPIS / 64];
+        uint64_t ppi_pend[GICV5_NUM_PPIS / 64];
     } gicv5_cpuif;
 
     struct {
diff --git a/target/arm/tcg/gicv5-cpuif.c b/target/arm/tcg/gicv5-cpuif.c
index 6fbc962131..4647fd40ba 100644
--- a/target/arm/tcg/gicv5-cpuif.c
+++ b/target/arm/tcg/gicv5-cpuif.c
@@ -199,6 +199,26 @@ static void gic_ppi_sactive_write(CPUARMState *env, const ARMCPRegInfo *ri,
     raw_write(env, ri, old | value);
 }
 
+static void gic_ppi_cpend_write(CPUARMState *env, const ARMCPRegInfo *ri,
+                                uint64_t value)
+{
+    uint64_t old = raw_read(env, ri);
+    /* If ICC_PPI_HMR_EL1[n].HM is 1, PEND bits are RO */
+    uint64_t hm = env->gicv5_cpuif.ppi_hm[ri->opc2 & 1];
+    value &= ~hm;
+    raw_write(env, ri, old & ~value);
+}
+
+static void gic_ppi_spend_write(CPUARMState *env, const ARMCPRegInfo *ri,
+                                uint64_t value)
+{
+    uint64_t old = raw_read(env, ri);
+    /* If ICC_PPI_HMR_EL1[n].HM is 1, PEND bits are RO */
+    uint64_t hm = env->gicv5_cpuif.ppi_hm[ri->opc2 & 1];
+    value &= ~hm;
+    raw_write(env, ri, old | value);
+}
+
 static const ARMCPRegInfo gicv5_cpuif_reginfo[] = {
     /*
      * Barrier: wait until the effects of a cpuif system register
@@ -314,6 +334,30 @@ static const ARMCPRegInfo gicv5_cpuif_reginfo[] = {
         .fieldoffset = offsetof(CPUARMState, gicv5_cpuif.ppi_hm[1]),
         .resetvalue = PPI_HMR1_RESET,
     },
+    {   .name = "ICC_PPI_CPENDR0_EL1", .state = ARM_CP_STATE_AA64,
+        .opc0 = 3, .opc1 = 0, .crn = 12, .crm = 13, .opc2 = 4,
+        .access = PL1_RW, .type = ARM_CP_ALIAS | ARM_CP_IO | ARM_CP_NO_RAW,
+        .fieldoffset = offsetof(CPUARMState, gicv5_cpuif.ppi_pend[0]),
+        .writefn = gic_ppi_cpend_write,
+    },
+    {   .name = "ICC_PPI_CPENDR1_EL1", .state = ARM_CP_STATE_AA64,
+        .opc0 = 3, .opc1 = 0, .crn = 12, .crm = 13, .opc2 = 5,
+        .access = PL1_RW, .type = ARM_CP_ALIAS | ARM_CP_IO | ARM_CP_NO_RAW,
+        .fieldoffset = offsetof(CPUARMState, gicv5_cpuif.ppi_pend[1]),
+        .writefn = gic_ppi_cpend_write,
+    },
+    {   .name = "ICC_PPI_SPENDR0_EL1", .state = ARM_CP_STATE_AA64,
+        .opc0 = 3, .opc1 = 0, .crn = 12, .crm = 13, .opc2 = 6,
+        .access = PL1_RW, .type = ARM_CP_IO | ARM_CP_NO_RAW,
+        .fieldoffset = offsetof(CPUARMState, gicv5_cpuif.ppi_pend[0]),
+        .writefn = gic_ppi_spend_write,
+    },
+    {   .name = "ICC_PPI_SPENDR0_EL1", .state = ARM_CP_STATE_AA64,
+        .opc0 = 3, .opc1 = 0, .crn = 12, .crm = 13, .opc2 = 7,
+        .access = PL1_RW, .type = ARM_CP_IO | ARM_CP_NO_RAW,
+        .fieldoffset = offsetof(CPUARMState, gicv5_cpuif.ppi_pend[1]),
+        .writefn = gic_ppi_spend_write,
+    },
 };
 
 void define_gicv5_cpuif_regs(ARMCPU *cpu)
-- 
2.43.0


