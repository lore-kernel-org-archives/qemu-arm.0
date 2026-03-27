Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDB4F10ED659
	for <qemu-arm@archiver.kernel.org>; Fri, 27 Mar 2026 11:25:33 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w65CP-0007Fx-FO; Fri, 27 Mar 2026 07:17:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1w65CH-00075T-3J
 for qemu-arm@nongnu.org; Fri, 27 Mar 2026 07:17:49 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1w65CE-0008Mk-IU
 for qemu-arm@nongnu.org; Fri, 27 Mar 2026 07:17:48 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-487035181a7so12305505e9.2
 for <qemu-arm@nongnu.org>; Fri, 27 Mar 2026 04:17:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1774610265; x=1775215065; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SXyrPHrNeuNNGz1d/8IK0Sz1v5blPipkCHt4LvQFUGQ=;
 b=HqKr8RpycMwHJTiydBjRkSsLu16gqDwVlY1zhgcV+5YWkFFKwnxptMDdddvEU1qp1p
 D7HrIipZnBQPqp9i6ZWGCisET0L9iOId39HBy8VkGPD4lB0IQknkOdx6BMWKf3Igyh2t
 /D4MOQ9b/Brrqp+0ZKO1N6Z/EXWJCQvuegvn+KbEiGGpi2ZP6KuX/rB8PzG1NAOzQEH2
 sHm0tsxRI8NbNL66G92DfsoHDC4SSfFlZPTZ822yZBYfsw5EaOaIOF2VjA84cWPkpGcY
 IcLA+WIS+XBR8pT+NOTZ889VBAW1iNmSSCD+oIxX8OmKZR04hrRvrClwca3UQsNKf6Mi
 ZG+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774610265; x=1775215065;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=SXyrPHrNeuNNGz1d/8IK0Sz1v5blPipkCHt4LvQFUGQ=;
 b=Hl30hwSDgtJ3UEy0EspVj3MzrSXLAP5/lnMp5S7xV28BOasIEu6Qnakiv8BAFHKSI/
 lC2JaYZfw6tGSBWmh1J9lFxi8X065AcaLy/Rk9YkmQHYZXckuxULqaWgguLjKtY2z8K5
 uFq7mKNHn2Jjg9l1cOv2zBCywPqsuqZstBa8iqkLvDz9Q38/wmP++bu8jEwYaIdMz0bn
 hYRIjZK89EdxZJOmdKMdpcEyJXxB0PLNY3gBxvNLvcwnAHURWUNnnvPgc+hbfHk/zc7N
 kIgVkIGBmm8gJfOM+IfCZhOlDKax3lTvJJZnjklDJ9hdRJlY8qn2xRkD52uzgCs+BpRt
 5RWQ==
X-Gm-Message-State: AOJu0YyoUi7C8ifvJ5bO3IJ0pb3U7tyu4QbFyXqzDNE/7X11Fio7NxmG
 vphPJiUpF8BKX/vxNqwoyjuzyHkUjN/sgeICm8+9nQ1xCvXUcCAPQYv0EEs+VybjKsxhua4DQS+
 HoewH13M=
X-Gm-Gg: ATEYQzxB/NmCr5unWG5e8wxxMP3BJR/WNJhRykQI7oFbYKCnlQLQw/NRSSv8TvHU6b1
 ELE5+Gqe9xmCKtsA0St/cODFbYN0yfCi/kjFyTa3LhxU9C341n9gxpQoW7EIS8z3bjcJEX9r0co
 aVT8xB6BNQUJccRgvWJPUyRG36Y9/5kz6cd4x7U7vc6FUId9OmkH0xeMjMl+Mgg14/5nvSpknVg
 Oor6G6EvemFfSZDLAdbKKIT9/bJYNSCD0rs6+iZVJkzSpN34Md8+ZouF34jMyFwY2g8abkIwjBk
 9/CeljacWAj644y7S5X1KnZbTzrH7WC0LwO5Hu9mhNVi5VkaBpTAxl04QKQqoUVhIpd6luk1aGP
 Bi4C7rFppJWC1uWzUo+b77mx2c8Xdmgd6YozaCJboF8vq+yb45zxB6snR8d3w/z/V9+7jodFOuC
 68Kzg06hfd/z7+nWr+f5KvkYDEFwrvGndsbvqTxq3wewbuTkCWma4prmGHOcfzEolfncACDwnVn
 t8gs0sZPYT/Ip9FI8EFGxX4XatR7a0=
X-Received: by 2002:a05:600c:3586:b0:487:1fbf:e0bb with SMTP id
 5b1f17b1804b1-48727d5a17cmr37323865e9.6.1774610264855; 
 Fri, 27 Mar 2026 04:17:44 -0700 (PDT)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43b919cf2b2sm15484227f8f.18.2026.03.27.04.17.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Mar 2026 04:17:44 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Jonathan Cameron <jonathan.cameron@huawei.com>
Subject: [PATCH v2 45/65] target/arm: GICv5 cpuif: Implement ICC_PCR_EL1
Date: Fri, 27 Mar 2026 11:16:40 +0000
Message-ID: <20260327111700.795099-46-peter.maydell@linaro.org>
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

Implement the ICC_PCR_* registers.  These hold the physical priority
mask for each interrupt domain -- an HPPI is only sufficiently high
priority to preempt if it is higher priority than this mask value.
Here we just implement the access to this data.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
---
 target/arm/cpu.h             |  1 +
 target/arm/tcg/gicv5-cpuif.c | 31 +++++++++++++++++++++++++++++++
 2 files changed, 32 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 1263841a1d..651fccd59b 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -606,6 +606,7 @@ typedef struct CPUArchState {
         uint64_t icc_icsr_el1;
         uint64_t icc_apr[NUM_GICV5_DOMAINS];
         uint64_t icc_cr0[NUM_GICV5_DOMAINS];
+        uint64_t icc_pcr[NUM_GICV5_DOMAINS];
         /* Most PPI registers have 1 bit per PPI, so 64 PPIs to a register */
         uint64_t ppi_active[GICV5_NUM_PPIS / 64];
         uint64_t ppi_hm[GICV5_NUM_PPIS / 64];
diff --git a/target/arm/tcg/gicv5-cpuif.c b/target/arm/tcg/gicv5-cpuif.c
index 50aa81d74f..b44b0d5398 100644
--- a/target/arm/tcg/gicv5-cpuif.c
+++ b/target/arm/tcg/gicv5-cpuif.c
@@ -49,6 +49,8 @@ FIELD(ICC_CR0, LINK_IDLE, 2, 1)
 FIELD(ICC_CR0, IPPT, 32, 6)
 FIELD(ICC_CR0, PID, 38, 1)
 
+FIELD(ICC_PCR, PRIORITY, 0, 5)
+
 /*
  * We implement 24 bits of interrupt ID, the mandated 5 bits of priority,
  * and no legacy GICv3.3 vcpu interface (yet)
@@ -383,6 +385,28 @@ static void gic_icc_cr0_el1_reset(CPUARMState *env, const ARMCPRegInfo *ri)
     }
 }
 
+static uint64_t gic_icc_pcr_el1_read(CPUARMState *env, const ARMCPRegInfo *ri)
+{
+    GICv5Domain domain = gicv5_logical_domain(env);
+    return env->gicv5_cpuif.icc_pcr[domain];
+}
+
+static void gic_icc_pcr_el1_write(CPUARMState *env, const ARMCPRegInfo *ri,
+                                  uint64_t value)
+{
+    GICv5Domain domain = gicv5_logical_domain(env);
+
+    value &= R_ICC_PCR_PRIORITY_MASK;
+    env->gicv5_cpuif.icc_pcr[domain] = value;
+}
+
+static void gic_icc_pcr_el1_reset(CPUARMState *env, const ARMCPRegInfo *ri)
+{
+    for (int i = 0; i < ARRAY_SIZE(env->gicv5_cpuif.icc_pcr); i++) {
+        env->gicv5_cpuif.icc_pcr[i] = 0;
+    }
+}
+
 static const ARMCPRegInfo gicv5_cpuif_reginfo[] = {
     /*
      * Barrier: wait until the effects of a cpuif system register
@@ -548,6 +572,13 @@ static const ARMCPRegInfo gicv5_cpuif_reginfo[] = {
         .writefn = gic_icc_cr0_el1_write,
         .resetfn = gic_icc_cr0_el1_reset,
     },
+    {   .name = "ICC_PCR_EL1", .state = ARM_CP_STATE_AA64,
+        .opc0 = 3, .opc1 = 1, .crn = 12, .crm = 0, .opc2 = 2,
+        .access = PL1_RW, .type = ARM_CP_IO | ARM_CP_NO_RAW,
+        .readfn = gic_icc_pcr_el1_read,
+        .writefn = gic_icc_pcr_el1_write,
+        .resetfn = gic_icc_pcr_el1_reset,
+    },
     {   .name = "ICC_HAPR_EL1", .state = ARM_CP_STATE_AA64,
         .opc0 = 3, .opc1 = 1, .crn = 12, .crm = 0, .opc2 = 3,
         .access = PL1_R, .type = ARM_CP_IO | ARM_CP_NO_RAW,
-- 
2.43.0


