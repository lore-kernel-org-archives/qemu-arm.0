Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AC9CCD98DA
	for <qemu-arm@archiver.kernel.org>; Mon, 15 Jun 2026 10:53:03 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wZ4uc-0000VB-QY; Mon, 15 Jun 2026 06:51:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wZ4u2-0000Rz-Al
 for qemu-arm@nongnu.org; Mon, 15 Jun 2026 06:50:57 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wZ4tv-0001T2-BS
 for qemu-arm@nongnu.org; Mon, 15 Jun 2026 06:50:47 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-490b4a8e28bso22052455e9.1
 for <qemu-arm@nongnu.org>; Mon, 15 Jun 2026 03:50:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1781520636; x=1782125436; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=VF/90mu1QzOsJ+7ZowfFihlzaRYu0ah8ryr9I5YseZI=;
 b=g73xlwBm/vIprogLc4h4oDNUkrv9ThDrePagF+Mnz7u7TCDQU9/5CyMZChK8Kt6RIU
 x02tPyUIOwAnD4ukQtQEtTQZwBH0wiC4HvkIZLnHRwHip5OiyKCfPH1dH6dmiWVBYxfj
 wdgzS6ajxoPsSjP78xAbw5RzCCn9fhidufjXWCTuwo4KVabhJluBdFqRO382QkgjpbAH
 dKQCTmnxPtC5yopKv/vgrqBS5gn69nCm8JtlQpe6bGR9+Zc87OMJ8tu3baf5c5d486yY
 8obk3unpMO7FqZtRdEIVfX8DtVxKWupPTsEgJRMupeTc+xavC0GaW2yhpH34FQr8QWSc
 IfEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781520636; x=1782125436;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=VF/90mu1QzOsJ+7ZowfFihlzaRYu0ah8ryr9I5YseZI=;
 b=QUqzusUdEn/jnbw0WiMMoSedG8fcHveJKEotZcQ0/kw7nDDOfnJeJ13jrSP2flIVhN
 dz7NSuvvMTaemg7KvzJrst7dRi7F6RAGa+FySEwkL62OBrfjt5chSrE7pHqiBPpg3u+m
 BS0e5VUWjmH8Fi3FADiNs70FunKO5ZdwYCRDNQOnl/pV4Se307rQdveQKn5FQjCohxmL
 eEzw4CgjgaMKqSISofj2tFLBotW3deN649GiSb623f415YcEOyCV+vd9Mx9EYYeYEsgT
 439L4KPhv98y5OuVSXd6P0s9kj1qqPFWLYByEeeTgSIAGqTrqBHYBxhxbDrUJjaZUl5O
 JpQg==
X-Gm-Message-State: AOJu0Yx+oUQlCtcfSeULBWMR0RuUcCxzMk/UbNQxiRZeg4sjMnG8zs52
 Amu7rLhfb/8LpUo0tjn7Q0LjfzJk4rhKW9T24d5liwXJCryYw/G5xs9o8MnHpHshwysMDMgkb95
 ncjYS
X-Gm-Gg: Acq92OGew+R8FrBjRa8NyPdHF/vQ0oYC4p7fFajg0sgt734fmzC8mjUoTip0P14LmhP
 CM4Vw7sS5X7Oifv3S9icZ5OVxV8JOT2ioyGxPpADVMjwGHEkfTsEuQRNWmjXSPpxqifAXVN58+/
 HRWiQhwMYw/OKD1Jk53M3EtLlRj7++fBOj4PQSQdy3xyJEi8yjWB7rbDyp0C5oPXlqPOSM0ZOrq
 4fSqO1GNagdUem0E+9wjJ+hZ2HVWmUeOzuQ6RT6pbmXoBwwilHKiDDlclOuX6aIDL9G/9dwtqUW
 /KiIqHQAv0DMILTzwFjDcyBZgButZbPk68dWzpBMSRdT8L1ZZK1vJSUrDWqmsqvhpLitVtUbd5B
 VRLcF5M1J31pp7jRvH4/lrc7q85WbE74EIfjW1G0BHG6ju5W1biWABaKDXN2k0McOAY43Z/vozO
 7hM1rlDm7U6RtkTgl92mt+9GD0JlmmQxc71IpYQnPizVExUsIVNew2JIEzfEEkncCVlbQW880MM
 Lr6fKg9tbGFgSq6a5MRSCt6wRvTQYEP
X-Received: by 2002:a05:600d:844e:10b0:490:bfda:7d7e with SMTP id
 5b1f17b1804b1-490ec4bfe57mr126374635e9.3.1781520635744; 
 Mon, 15 Jun 2026 03:50:35 -0700 (PDT)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4606f263945sm33863674f8f.8.2026.06.15.03.50.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Jun 2026 03:50:35 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 5/5] hw/intc/gicv5: Define and use GICV5_PENDING_IRQ_NONE
Date: Mon, 15 Jun 2026 11:50:29 +0100
Message-ID: <20260615105029.2898872-6-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260615105029.2898872-1-peter.maydell@linaro.org>
References: <20260615105029.2898872-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32d.google.com
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

The GICv5PendingIrq struct representation of "there is no pending
interrupt" sets the prio field to PRIO_IDLE, and generally to avoid
confusion we also set the intid to 0.  We want to return this value
or initialize some variable to it in several places in the GICv5
implementation, and the support for the virtual interrupt domain
introduces more.

Define a convenience macro for this special-case struct value, and
use it instead of opencoding either the structure initializer or
explicit assignment to the two fields.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/arm_gicv5.c               | 6 ++----
 include/hw/intc/arm_gicv5_types.h | 4 ++++
 target/arm/tcg/gicv5-cpuif.c      | 7 +++----
 3 files changed, 9 insertions(+), 8 deletions(-)

diff --git a/hw/intc/arm_gicv5.c b/hw/intc/arm_gicv5.c
index 0fa3d6b601..08878193df 100644
--- a/hw/intc/arm_gicv5.c
+++ b/hw/intc/arm_gicv5.c
@@ -429,8 +429,7 @@ static void irs_recalc_hppi(GICv5 *s, GICv5Domain domain, uint32_t iaffid)
     ARMCPU *cpu = cpuidx >= 0 ? cs->cpus[cpuidx] : NULL;
     GICv5PendingIrq best;
 
-    best.intid = 0;
-    best.prio = PRIO_IDLE;
+    best = GICV5_PENDING_IRQ_NONE;
 
     if (!cpu) {
         /* Nothing happens for iaffids targeting nonexistent CPUs */
@@ -526,8 +525,7 @@ static void irs_recall_hppis(GICv5 *s, GICv5Domain domain)
     GICv5Common *cs = ARM_GICV5_COMMON(s);
 
     for (int i = 0; i < cs->num_cpus; i++) {
-        s->hppi[domain][i].intid = 0;
-        s->hppi[domain][i].prio = PRIO_IDLE;
+        s->hppi[domain][i] = GICV5_PENDING_IRQ_NONE;
         gicv5_forward_interrupt(cs->cpus[i], domain);
     }
 }
diff --git a/include/hw/intc/arm_gicv5_types.h b/include/hw/intc/arm_gicv5_types.h
index de4f78a149..851286b1b5 100644
--- a/include/hw/intc/arm_gicv5_types.h
+++ b/include/hw/intc/arm_gicv5_types.h
@@ -105,6 +105,10 @@ typedef struct GICv5PendingIrq {
     uint8_t prio;
 } GICv5PendingIrq;
 
+/* A GICv5PendingIrq struct initializer for "no pending interrupt" */
+#define GICV5_PENDING_IRQ_NONE \
+    ((GICv5PendingIrq) { .intid = 0, .prio = PRIO_IDLE })
+
 /* Fields in a generic 32-bit INTID, per R_TJPHS */
 FIELD(INTID, ID, 0, 24)
 FIELD(INTID, TYPE, 29, 3)
diff --git a/target/arm/tcg/gicv5-cpuif.c b/target/arm/tcg/gicv5-cpuif.c
index a868adca66..1cdd4103d0 100644
--- a/target/arm/tcg/gicv5-cpuif.c
+++ b/target/arm/tcg/gicv5-cpuif.c
@@ -144,7 +144,7 @@ static GICv5PendingIrq gic_hppi(CPUARMState *env, GICv5Domain domain)
 
     if (!(env->gicv5_cpuif.icc_cr0[domain] & R_ICC_CR0_EN_MASK)) {
         /* If cpuif is disabled there is no HPPI */
-        return (GICv5PendingIrq) { .intid = 0, .prio = PRIO_IDLE };
+        return GICV5_PENDING_IRQ_NONE;
     }
 
     irs_hppi = gicv5_get_hppi(gic, domain, env->gicv5_iaffid);
@@ -168,7 +168,7 @@ static GICv5PendingIrq gic_hppi(CPUARMState *env, GICv5Domain domain)
     if (best.prio == PRIO_IDLE ||
         best.prio > env->gicv5_cpuif.icc_pcr[domain] ||
         best.prio >= gic_running_prio(env, domain)) {
-        return (GICv5PendingIrq) { .intid = 0, .prio = PRIO_IDLE };
+        return GICV5_PENDING_IRQ_NONE;
     }
     return best;
 }
@@ -258,8 +258,7 @@ static void gic_recalc_ppi_hppi(CPUARMState *env)
      * enabled, pending and not active.
      */
     for (int i = 0; i < ARRAY_SIZE(env->gicv5_cpuif.ppi_hppi); i++) {
-        env->gicv5_cpuif.ppi_hppi[i].intid = 0;
-        env->gicv5_cpuif.ppi_hppi[i].prio = PRIO_IDLE;
+        env->gicv5_cpuif.ppi_hppi[i] = GICV5_PENDING_IRQ_NONE;
     };
 
     for (int i = 0; i < ARRAY_SIZE(env->gicv5_cpuif.ppi_active); i++) {
-- 
2.43.0


