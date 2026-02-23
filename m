Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7EEDEC110C
	for <qemu-arm@archiver.kernel.org>; Mon, 23 Feb 2026 17:08:38 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vuZLt-0003Vk-Md; Mon, 23 Feb 2026 12:04:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vuZKz-0002eY-DK
 for qemu-arm@nongnu.org; Mon, 23 Feb 2026 12:03:17 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vuZKw-0000Nb-Dx
 for qemu-arm@nongnu.org; Mon, 23 Feb 2026 12:03:12 -0500
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-436317c80f7so3750614f8f.1
 for <qemu-arm@nongnu.org>; Mon, 23 Feb 2026 09:03:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1771866189; x=1772470989; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=MdqR4vhujZdCIee6J+u4O26y6fOSqJ7/xzfHb6eSoPU=;
 b=IY4s16KgSvmOVsWtqYBgYlMK/KL25S0Qwkh+yF8p13FnRQpDMt5rVSDgz+74dTk/Tp
 U4jkkQVDeQCgOP4gxfK58zfNQHcxEmCMJUaL6WkjdHCCdP1NWjUARVYcELGdzuQTycaK
 PeaU/fdKOXNZX/LoGC2w2zs7UOO3/ImAA3UnCPWT+GLm+dE4hwXJZSq0N94wUsCj24FU
 ar6kKIgOBfrg0OcAJWuW4WJiGu87WlK2uptPmvU+EbQPE5KsUMfFsh1A7vXVR9zu/Hzg
 qSE5fW+W6PkCFvO4vMQzX//ikofrq3TpuwNam/G2E52e0BaDSU9poq8Ke1A4qDngD2v6
 i/9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771866189; x=1772470989;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=MdqR4vhujZdCIee6J+u4O26y6fOSqJ7/xzfHb6eSoPU=;
 b=RQBtnOVgBAar3OehkGcdho71BsFQC2oxJH2e7fdtLHroa6MYU3tOrVA0pydfa/U6Zy
 YDuOZ9ZxRfU4REqrhwTxA0p8xcOqp0N8icRcejw5i8ZoA4TEOgR8K0GU28WhlxQlZU8V
 pczk/8KFuz8akZzxj4sIwFaaio423bztCgv2wDk4oI0EasUsU8l72c9z2ZYPv4a5KpFr
 BuxW694PxOj/Ue8Pkx3VU4WU52bbEThrW9CJa+qvKC72QYe4b8fSI6WZBzKEYLbJYEvj
 89aVOJ5MjiYNEKga+Amel1Ezrn26461WbDM1CCTlIDZ7jdiiq9Z4IDYRDgZ7cIcMJy1C
 VzDA==
X-Gm-Message-State: AOJu0Yx54RxC5pJiMiWhGvyc8IOUb3f4l70D+KYq0aS7wXrpAQiiXe7/
 pRV/SbDdE2n76zZl0Or+LPaArAPNrufYjGflmgcRnccpYfIRNYbSBmQR7gvv75nN2yIC78s3/VL
 KhguZ
X-Gm-Gg: AZuq6aJKZuKWRdamfuMjr1iJYJCw0/801K9/gtP34rnqeu6pekld6+lVOlxq11ZzhtD
 KBPo9HRj8EqNiF4HEZeFX+oWGY9KX/z+z1m6QhF1KzCa8/ynM9HkqSx7C4aamL2P2hj4YpD0rfq
 tPGw3PYeTuATdwm8ZqPQvAmcgqWRIskxiSc9LHs48O6NIkRlnoKMM1O2avYBkMctiHqPWXNRj59
 TFAPqL9uhMtlNXZWq1bjrM+qoG4acV5MF05MMk9q4uLhrTIeYzuRbgZ4n3PoXEX1VfB8Byt192+
 2is4V9+5fk/cqBggsIv7svNTFPZAQGXxAIc/aZBStH2G+qdsbfnx1E/Mk3aFmHavPHy3FFm0trw
 yx1RD5o2pkUZIY6Jl2XzBPIP4Z5l5UkACuBcUrdQJUZAXEhFQAc8w9dt7dlc0PEkCQAIObxHrmU
 6JaRBn8fbTGrXxUim5RJec+J904v4l4eZ/BSeZWvjBRYHYASLWrYtQb4uZHxSuFTA8Xol1ZS9rV
 gtSRlh9inU4VvDBwupVGwd8DtMDqH8=
X-Received: by 2002:a05:600c:4f13:b0:483:7b99:131d with SMTP id
 5b1f17b1804b1-483a94d9b6cmr199133845e9.16.1771866188652; 
 Mon, 23 Feb 2026 09:03:08 -0800 (PST)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483a9b21ceasm200155625e9.0.2026.02.23.09.03.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Feb 2026 09:03:07 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 48/65] target/arm: GICv5 cpuif: Implement GIC CDEOI
Date: Mon, 23 Feb 2026 17:01:55 +0000
Message-ID: <20260223170212.441276-49-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260223170212.441276-1-peter.maydell@linaro.org>
References: <20260223170212.441276-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x431.google.com
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

Implement the GIC CDEOI instruction, which performs a "priority
drop", clearing the highest set bit in the APR register.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/tcg/gicv5-cpuif.c | 21 +++++++++++++++++++++
 target/arm/tcg/trace-events  |  1 +
 2 files changed, 22 insertions(+)

diff --git a/target/arm/tcg/gicv5-cpuif.c b/target/arm/tcg/gicv5-cpuif.c
index d32263a5b7..c830938bdc 100644
--- a/target/arm/tcg/gicv5-cpuif.c
+++ b/target/arm/tcg/gicv5-cpuif.c
@@ -556,6 +556,22 @@ static uint64_t gicr_cdia_read(CPUARMState *env, const ARMCPRegInfo *ri)
     return hppi.intid | R_GICR_CDIA_VALID_MASK;
 }
 
+static void gic_cdeoi_write(CPUARMState *env, const ARMCPRegInfo *ri,
+                            uint64_t value)
+{
+    /*
+     * Perform Priority Drop in the current interrupt domain.
+     * This is just clearing the lowest set bit in the APR.
+     */
+    GICv5Domain domain = gicv5_current_phys_domain(env);
+    uint64_t *apr = &env->gicv5_cpuif.icc_apr[domain];
+
+    trace_gicv5_cdeoi(domain);
+
+    /* clear lowest bit, doing nothing if already zero */
+    *apr &= *apr - 1;
+}
+
 static const ARMCPRegInfo gicv5_cpuif_reginfo[] = {
     /*
      * Barrier: wait until the effects of a cpuif system register
@@ -608,6 +624,11 @@ static const ARMCPRegInfo gicv5_cpuif_reginfo[] = {
         .access = PL1_W, .type = ARM_CP_IO | ARM_CP_NO_RAW,
         .writefn = gic_cdrcfg_write,
     },
+    {   .name = "GIC_CDEOI", .state = ARM_CP_STATE_AA64,
+        .opc0 = 1, .opc1 = 0, .crn = 12, .crm = 1, .opc2 = 7,
+        .access = PL1_W, .type = ARM_CP_IO | ARM_CP_NO_RAW,
+        .writefn = gic_cdeoi_write,
+    },
     {   .name = "GIC_CDHM", .state = ARM_CP_STATE_AA64,
         .opc0 = 1, .opc1 = 0, .crn = 12, .crm = 2, .opc2 = 1,
         .access = PL1_W, .type = ARM_CP_IO | ARM_CP_NO_RAW,
diff --git a/target/arm/tcg/trace-events b/target/arm/tcg/trace-events
index 13e15cfcfc..fcb3106a96 100644
--- a/target/arm/tcg/trace-events
+++ b/target/arm/tcg/trace-events
@@ -5,3 +5,4 @@
 gicv5_recalc_ppi_hppi(int domain, uint32_t id, uint8_t prio) "domain %d new PPI HPPI id 0x%x prio %u"
 gicv5_gicr_cdia_fail(int domain, const char *reason) "domain %d CDIA attempt failed: %s"
 gicv5_gicr_cdia(int domain, uint32_t id) "domain %d CDIA acknowledge of interrupt 0x%x"
+gicv5_cdeoi(int domain) "domain %d CDEOI performing priority drop"
-- 
2.43.0


