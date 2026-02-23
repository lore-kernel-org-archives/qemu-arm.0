Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D979DEC1112
	for <qemu-arm@archiver.kernel.org>; Mon, 23 Feb 2026 17:10:37 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vuZLu-0003Wz-Sl; Mon, 23 Feb 2026 12:04:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vuZKv-0002cL-E3
 for qemu-arm@nongnu.org; Mon, 23 Feb 2026 12:03:11 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vuZKt-0000MD-Gu
 for qemu-arm@nongnu.org; Mon, 23 Feb 2026 12:03:09 -0500
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-48375f1defeso32337485e9.0
 for <qemu-arm@nongnu.org>; Mon, 23 Feb 2026 09:03:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1771866186; x=1772470986; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=mVkOLAQp5zvH8Zemc4wj3jGGnDzUhMplQS5DRD9P+iI=;
 b=M5Lt5gJI+x0miRvyChclRePjExC7G1ZV7gktNoNhNplHH23ADiBtDxb9J0ax5XNDxH
 6YB7UCJa7O2F+WlFZLWdH4yM6QdKYwCi0YEdfZSc+SlrPdbY7iNIfEiQWKe1eCZVXA7f
 UJVohDNqBV7fX+t83DEeKeirf5avHNqoPqIK43GIec1w0bHivb9AzvejW1EXGvizhpr8
 qk14evf2bSEVObwfkDQHmMajLEHK4eOi1jlPywO06c7IvmDNBuHOl0iCHWrxeclz7eud
 e0/CXz1ICBKSPEve7McGCgiy8xXC2YmcvFCu4F+5RmqyFF8oUtkJ72mUJMSoXuPEdge8
 AIng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771866186; x=1772470986;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=mVkOLAQp5zvH8Zemc4wj3jGGnDzUhMplQS5DRD9P+iI=;
 b=nlsAZOh8UV3nrzET0XDFKP59zHueuyiExmJ2TBFs7X4RjR0cAkyxlS7oGZ+xY2QQ36
 MBo6IHoRp6jgdnlh8GtA55RYXdrQEzyNuiW/Q4gC0oVm4NWxPL2+lNbbk/vF26HgyZcf
 8ehV1NEP8CLhT0Qn78XKRLkI7JF/dxfwlxV8f99fk19ZfLFCzQScEs3mvfHq0LWzusWL
 A9m40QHFZxZn+uD+Tv+lpwi7UgleNMcoHXD+KphoUGjFH4gSXxO+/NLiR7bqVET4VDLt
 U7ekYb6Y35HCCwwUCcahbFvjI4IcySxmB2WUrKPXkV+QAwt4Oi1IxptW6z8a22Fum1Fq
 1oXQ==
X-Gm-Message-State: AOJu0YyJAgvSIF6ISfZGdASYEwFVjIHya5vSw7RfvfmJEnw9RU9XWp7p
 1hW1ShCVOJd6nmtDAcEofIpUsD6/Qt0kmGibmiqZtYCWcHHCNoVKy8ugGOsZA4Bzf1svoT0PjcP
 vg9WS
X-Gm-Gg: AZuq6aK4z7bYPFcTt5fVD1Afud7HPPrc6FetU5OOckv3bRtaUYi+flJf7E9GCmlH93H
 ClHAo19UG4UE4bQNnQnufuD8+ZOaINistB46kmYo2dbSjzC9dypGK+vD2X4dOKHGyMBVzX/CAkR
 zmpOCPHSo+bt4NKA7es0cfMKH9ihW6rO4HIDZE5ox5B3ptqhmoeVRXciGi0fQ9M2T5xZUXSNfOd
 xY+I4qyRMOVeNiNJDbdSE/OlIx7ops0nEAZ6EHHibfqooXG6fZj2W3EnwROyy4GWvUQQyQmjcC5
 Y9XXZZhGroTA8hpU8m65wzAB2kY3/QTXlvlAh3XkBeLlsjY++/mo8LEnwwy5iZ9XcKkE1z3dwRe
 n64ETC0KEu8WiL24OCZlgZTsQVeRZOsCZPL5uAoD53zXUR7Fu34+cV0wLPjs1j6uZD3k2kcEHv7
 HUHBUeFcYMY+6RwJ4PCC/wqXP07qDprWRxPtvSmDjdW7ZdAjkeFckKI/rGHxxFeVe7VV7WZgUzF
 hXAC54nKYkJ8o8mETqhwMJpMzZA7OoruurEgfdylw==
X-Received: by 2002:a05:600c:1c1f:b0:477:6d96:b3e5 with SMTP id
 5b1f17b1804b1-483a95eb50bmr181508635e9.7.1771866185585; 
 Mon, 23 Feb 2026 09:03:05 -0800 (PST)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483a9b21ceasm200155625e9.0.2026.02.23.09.03.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Feb 2026 09:03:04 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 45/65] target/arm: GICv5 cpuif: Implement ICC_HPPIR_EL1
Date: Mon, 23 Feb 2026 17:01:52 +0000
Message-ID: <20260223170212.441276-46-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260223170212.441276-1-peter.maydell@linaro.org>
References: <20260223170212.441276-1-peter.maydell@linaro.org>
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

Implement ICC_HPPIR_EL1, which the guest can use to read the current
highest priority pending interrupt.  Like APR, PCR and CR0, this is
banked, with the _EL1 register reading the answer for the current
logical interrupt domain, and the _EL3 register reading the answer
for the EL3 interrupt domain.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/arm_gicv5.c                | 11 ++++++
 include/hw/intc/arm_gicv5_stream.h | 14 +++++++
 target/arm/tcg/gicv5-cpuif.c       | 62 ++++++++++++++++++++++++++++++
 3 files changed, 87 insertions(+)

diff --git a/hw/intc/arm_gicv5.c b/hw/intc/arm_gicv5.c
index 070d414d67..6cb81123e5 100644
--- a/hw/intc/arm_gicv5.c
+++ b/hw/intc/arm_gicv5.c
@@ -527,6 +527,17 @@ static void irs_recall_hppis(GICv5 *s, GICv5Domain domain)
     }
 }
 
+GICv5PendingIrq gicv5_get_hppi(GICv5Common *cs, GICv5Domain domain,
+                               uint32_t iaffid)
+{
+    GICv5 *s = ARM_GICV5(cs);
+
+    int cpuidx = irs_cpuidx_from_iaffid(cs, iaffid);
+
+    assert(cpuidx >= 0);
+    return s->hppi[domain][cpuidx];
+}
+
 static hwaddr l1_iste_addr(GICv5Common *cs, const GICv5ISTConfig *cfg,
                            uint32_t id)
 {
diff --git a/include/hw/intc/arm_gicv5_stream.h b/include/hw/intc/arm_gicv5_stream.h
index 13b343504d..6850f03b74 100644
--- a/include/hw/intc/arm_gicv5_stream.h
+++ b/include/hw/intc/arm_gicv5_stream.h
@@ -175,4 +175,18 @@ uint64_t gicv5_request_config(GICv5Common *cs, uint32_t id, GICv5Domain domain,
  */
 void gicv5_forward_interrupt(ARMCPU *cpu, GICv5Domain domain);
 
+/**
+ * gicv5_get_hppi
+ * @cs: GIC IRS to query
+ * @domain: interrupt domain to act on
+ * @iaffid: IAFFID of this CPU interface
+ *
+ * Ask the IRS for the highest priority pending interrupt
+ * that it has for this CPU. This returns the equivalent of what in the
+ * stream protocol is the outstanding interrupt sent with
+ * a Forward packet.
+ */
+GICv5PendingIrq gicv5_get_hppi(GICv5Common *cs, GICv5Domain domain,
+                               uint32_t iaffid);
+
 #endif
diff --git a/target/arm/tcg/gicv5-cpuif.c b/target/arm/tcg/gicv5-cpuif.c
index 45ef80ca87..adb4d2018f 100644
--- a/target/arm/tcg/gicv5-cpuif.c
+++ b/target/arm/tcg/gicv5-cpuif.c
@@ -51,6 +51,10 @@ FIELD(ICC_CR0, PID, 38, 1)
 
 FIELD(ICC_PCR, PRIORITY, 0, 5)
 
+FIELD(ICC_HPPIR_EL1, ID, 0, 24)
+FIELD(ICC_HPPIR_EL1, TYPE, 29, 3)
+FIELD(ICC_HPPIR_EL1, HPPIV, 32, 1)
+
 /*
  * We implement 24 bits of interrupt ID, the mandated 5 bits of priority,
  * and no legacy GICv3.3 vcpu interface (yet)
@@ -114,6 +118,52 @@ static uint64_t gic_running_prio(CPUARMState *env, GICv5Domain domain)
     return hap < 32 ? hap : PRIO_IDLE;
 }
 
+static GICv5PendingIrq gic_hppi(CPUARMState *env, GICv5Domain domain)
+{
+    /*
+     * Return the current highest priority pending
+     * interrupt for the specified domain, if it has sufficient
+     * priority to preempt. The intid field of the return value
+     * will be in the format of the ICC_HPPIR register (and will
+     * be zero if and only if there is no interrupt that can preempt).
+     */
+
+    GICv5Common *gic = gicv5_get_gic(env);
+    GICv5PendingIrq best;
+    GICv5PendingIrq irs_hppi;
+
+    if (!(env->gicv5_cpuif.icc_cr0[domain] & R_ICC_CR0_EN_MASK)) {
+        /* If cpuif is disabled there is no HPPI */
+        return (GICv5PendingIrq) { .intid = 0, .prio = PRIO_IDLE };
+    }
+
+    irs_hppi = gicv5_get_hppi(gic, domain, env->gicv5_iaffid);
+
+    /*
+     * If the best PPI and the best interrupt from the IRS have the
+     * same priority, it's IMPDEF which we pick (R_VVBPS). We choose
+     * the PPI.
+     */
+    if (env->gicv5_cpuif.ppi_hppi[domain].prio <= irs_hppi.prio) {
+        best = env->gicv5_cpuif.ppi_hppi[domain];
+    } else {
+        best = irs_hppi;
+    }
+
+    /*
+     * D_MSQKF: an interrupt has sufficient priority if its priority
+     * is higher than the current running priority and equal to or
+     * higher than the priority mask.
+     */
+    if (best.prio == PRIO_IDLE ||
+        best.prio > env->gicv5_cpuif.icc_pcr[domain] ||
+        best.prio >= gic_running_prio(env, domain)) {
+        return (GICv5PendingIrq) { .intid = 0, .prio = PRIO_IDLE };
+    }
+    best.intid |= R_ICC_HPPIR_EL1_HPPIV_MASK;
+    return best;
+}
+
 static void gic_recalc_ppi_hppi(CPUARMState *env)
 {
     /*
@@ -407,6 +457,13 @@ static void gic_icc_pcr_el1_reset(CPUARMState *env, const ARMCPRegInfo *ri)
     }
 }
 
+static uint64_t gic_icc_hppir_el1_read(CPUARMState *env, const ARMCPRegInfo *ri)
+{
+    GICv5Domain domain = gicv5_logical_domain(env);
+    GICv5PendingIrq hppi = gic_hppi(env, domain);
+    return hppi.intid;
+}
+
 static const ARMCPRegInfo gicv5_cpuif_reginfo[] = {
     /*
      * Barrier: wait until the effects of a cpuif system register
@@ -522,6 +579,11 @@ static const ARMCPRegInfo gicv5_cpuif_reginfo[] = {
         .fieldoffset = offsetof(CPUARMState, gicv5_cpuif.ppi_hm[1]),
         .resetvalue = PPI_HMR1_RESET,
     },
+    {   .name = "ICC_HPPIR_EL1", .state = ARM_CP_STATE_AA64,
+        .opc0 = 3, .opc1 = 0, .crn = 12, .crm = 10, .opc2 = 3,
+        .access = PL1_R, .type = ARM_CP_IO | ARM_CP_NO_RAW,
+        .readfn = gic_icc_hppir_el1_read,
+    },
     {   .name = "ICC_PPI_ENABLER0_EL1", .state = ARM_CP_STATE_AA64,
         .opc0 = 3, .opc1 = 0, .crn = 12, .crm = 10, .opc2 = 6,
         .access = PL1_RW, .type = ARM_CP_IO | ARM_CP_NO_RAW,
-- 
2.43.0


