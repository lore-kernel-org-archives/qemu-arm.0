Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5EE810ED659
	for <qemu-arm@archiver.kernel.org>; Fri, 27 Mar 2026 11:26:44 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w65By-0006hK-P8; Fri, 27 Mar 2026 07:17:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1w65Bu-0006Zi-K1
 for qemu-arm@nongnu.org; Fri, 27 Mar 2026 07:17:26 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1w65Bs-0007wf-Lw
 for qemu-arm@nongnu.org; Fri, 27 Mar 2026 07:17:26 -0400
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-43b40fb7f95so1730885f8f.3
 for <qemu-arm@nongnu.org>; Fri, 27 Mar 2026 04:17:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1774610243; x=1775215043; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mSHOw0ePxFClS8VZTB3TfGftr7NcOYKm+ePZhUgk940=;
 b=TGnF7eNsFnoe819AkskCup9UCZ+xJ0B19aHNyQj+KzhHxY5mJjErZY71/ybs461ipv
 7ibyVtRlY/yoTarPcmbP7zXnxxeLSLkllt0XNTG92wQo+bbwW91dIC2wfLCTR2w9/xAl
 EJuMB8TXP+EypuKdDzKg61PUFPIL4F5eFsOWFZgCudgdpjwyJyl7aXIEwDueN5caROjn
 ZNQeEsgbxWUqynqg1O76OGuOLewsjk+OiMzmIcxIq3zfOWWXLw0MgKn3oB9J8piEdEhn
 PKSyN5ZWNkpg4obVMfXBlcPKr9+yGlGEQsNofQA8DB/3qAiFBi3mMngktSth094jWTUD
 Q39w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774610243; x=1775215043;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=mSHOw0ePxFClS8VZTB3TfGftr7NcOYKm+ePZhUgk940=;
 b=oUIvB/Ca6lsp9N8nP5J+yVqUTh+y5vw8KYGZwt51MfA6bvewEpmImO32gE+/RxpHQU
 L7cGNucZyupOB06sYeMVl5cBaxzl7pafTH9gg5343gLPVrp9MxauVrvI6n90/HV08j5C
 nQulVDdHrUAvBtvFQJerywoL8V7bQPNfue+YgoAhAYlzJ1e4ijnOqpJ7NUYSS6R9MpXh
 QN89k8XiD5XFHYS7kJmt3HIrgQ0ObIxJZH9N7VMdZ5Aw49NivbEFife9w81gG1o5eFAp
 RhKVb4Zlnhapk/t+yc4RF9qvYsmN+GW5VyU2mucUdv8qhnCwyQB80dvETllw2ackVERH
 GuJw==
X-Gm-Message-State: AOJu0YyrSJtXQ4dpGs7gSZUmikXaBFK9f/YirH/zhhrNEHX3jtrJlBdH
 Y1Rs+frBFzqHsPMUZHeqCwofzsM3Xoynkv1D+L31J1Eytnqt5ZWEl1t/tbSyGarnEom1ubkSYgQ
 UJp0GgJo=
X-Gm-Gg: ATEYQzzrZT57A2HFSRt0XkftrlGAWp38vqoh2LADXfe4VvLVada3b9zNgib2tKPnvWd
 LjavqARYcBl3XG8bALclR5sNc5DAAy6ogs7j3VO2EHdYgf3Y+zBbH4y5iaw71twiK8hsUlDvjci
 L38+cI6wdy1RKjlt8pGFgS8M5v58jXzflKRd98keU676K9LRj5c/q/6zXOGUMUK1dJC2pKg04hX
 h0ichc0lQkU8Am7DKCXc96FmYeDozCMiBp4/y0bUd0mlr92wAch8OWcHwTrx1pN5yn8bx3Rcjth
 9+VM4DXCnWBK/cLkJaPtLv22a5ThCxxwNVzGAoWIX9VsGbUuJYaczoyryG2kXMhmg5tfj3pgNV4
 nlhOy92C3Pnp/83LUrqx/QB58x2hiPrfcTM+jOSxMsfO4alKIEcpeGpNF+HaqCC5DzSqKUnCxds
 Pa90C9SOu/Y5+GH0BV/YMIkmkTB84gRU62SbPSAHffk9E/6lg7Sq22oxVubbFWV2UvyI97gvMBR
 ZXfXC+FUK5E2LPQNAg7yqa06oALurk=
X-Received: by 2002:a05:6000:250d:b0:439:bf55:f5ec with SMTP id
 ffacd0b85a97d-43b9ea77b12mr3260198f8f.50.1774610242563; 
 Fri, 27 Mar 2026 04:17:22 -0700 (PDT)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43b919cf2b2sm15484227f8f.18.2026.03.27.04.17.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Mar 2026 04:17:21 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Jonathan Cameron <jonathan.cameron@huawei.com>
Subject: [PATCH v2 22/65] target/arm: GICv5 cpuif: Implement GIC CD* insns for
 setting config
Date: Fri, 27 Mar 2026 11:16:17 +0000
Message-ID: <20260327111700.795099-23-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260327111700.795099-1-peter.maydell@linaro.org>
References: <20260327111700.795099-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42e.google.com
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

Implement the GIC CDDIS, GIC CDEN, GIC CDAFF, GIC CDPEND and GIC CDHM
system instructions.  These are all simple wrappers around the
equivalent gicv5_set_* functions, like GIC CDPRI.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
---
 target/arm/tcg/gicv5-cpuif.c | 108 +++++++++++++++++++++++++++++++++++
 1 file changed, 108 insertions(+)

diff --git a/target/arm/tcg/gicv5-cpuif.c b/target/arm/tcg/gicv5-cpuif.c
index 0c2bba5ce9..0c4349f8a7 100644
--- a/target/arm/tcg/gicv5-cpuif.c
+++ b/target/arm/tcg/gicv5-cpuif.c
@@ -16,6 +16,25 @@ FIELD(GIC_CDPRI, ID, 0, 24)
 FIELD(GIC_CDPRI, TYPE, 29, 3)
 FIELD(GIC_CDPRI, PRIORITY, 35, 5)
 
+FIELD(GIC_CDDIS, ID, 0, 24)
+FIELD(GIC_CDDIS, TYPE, 29, 3)
+
+FIELD(GIC_CDEN, ID, 0, 24)
+FIELD(GIC_CDEN, TYPE, 29, 3)
+
+FIELD(GIC_CDAFF, ID, 0, 24)
+FIELD(GIC_CDAFF, IRM, 28, 1)
+FIELD(GIC_CDAFF, TYPE, 29, 3)
+FIELD(GIC_CDAFF, IAFFID, 32, 16)
+
+FIELD(GIC_CDPEND, ID, 0, 24)
+FIELD(GIC_CDPEND, TYPE, 29, 3)
+FIELD(GIC_CDPEND, PENDING, 32, 1)
+
+FIELD(GIC_CDHM, ID, 0, 24)
+FIELD(GIC_CDHM, TYPE, 29, 3)
+FIELD(GIC_CDHM, HM, 32, 1)
+
 static GICv5Common *gicv5_get_gic(CPUARMState *env)
 {
     return env->gicv5state;
@@ -51,6 +70,30 @@ static GICv5Domain gicv5_current_phys_domain(CPUARMState *env)
     return gicv5_logical_domain(env);
 }
 
+static void gic_cddis_write(CPUARMState *env, const ARMCPRegInfo *ri,
+                            uint64_t value)
+{
+    GICv5Common *gic = gicv5_get_gic(env);
+    GICv5IntType type = FIELD_EX64(value, GIC_CDDIS, TYPE);
+    uint32_t id = FIELD_EX64(value, GIC_CDDIS, ID);
+    bool virtual = false;
+    GICv5Domain domain = gicv5_current_phys_domain(env);
+
+    gicv5_set_enabled(gic, id, false, domain, type, virtual);
+}
+
+static void gic_cden_write(CPUARMState *env, const ARMCPRegInfo *ri,
+                           uint64_t value)
+{
+    GICv5Common *gic = gicv5_get_gic(env);
+    GICv5IntType type = FIELD_EX64(value, GIC_CDEN, TYPE);
+    uint32_t id = FIELD_EX64(value, GIC_CDEN, ID);
+    bool virtual = false;
+    GICv5Domain domain = gicv5_current_phys_domain(env);
+
+    gicv5_set_enabled(gic, id, true, domain, type, virtual);
+}
+
 static void gic_cdpri_write(CPUARMState *env, const ARMCPRegInfo *ri,
                             uint64_t value)
 {
@@ -64,6 +107,46 @@ static void gic_cdpri_write(CPUARMState *env, const ARMCPRegInfo *ri,
     gicv5_set_priority(gic, id, priority, domain, type, virtual);
 }
 
+static void gic_cdaff_write(CPUARMState *env, const ARMCPRegInfo *ri,
+                            uint64_t value)
+{
+    GICv5Common *gic = gicv5_get_gic(env);
+    uint32_t iaffid = FIELD_EX64(value, GIC_CDAFF, IAFFID);
+    GICv5RoutingMode irm = FIELD_EX64(value, GIC_CDAFF, IRM);
+    GICv5IntType type = FIELD_EX64(value, GIC_CDAFF, TYPE);
+    uint32_t id = FIELD_EX64(value, GIC_CDAFF, ID);
+    bool virtual = false;
+    GICv5Domain domain = gicv5_current_phys_domain(env);
+
+    gicv5_set_target(gic, id, iaffid, irm, domain, type, virtual);
+}
+
+static void gic_cdpend_write(CPUARMState *env, const ARMCPRegInfo *ri,
+                             uint64_t value)
+{
+    GICv5Common *gic = gicv5_get_gic(env);
+    bool pending = FIELD_EX64(value, GIC_CDPEND, PENDING);
+    GICv5IntType type = FIELD_EX64(value, GIC_CDPEND, TYPE);
+    uint32_t id = FIELD_EX64(value, GIC_CDPEND, ID);
+    bool virtual = false;
+    GICv5Domain domain = gicv5_current_phys_domain(env);
+
+    gicv5_set_pending(gic, id, pending, domain, type, virtual);
+}
+
+static void gic_cdhm_write(CPUARMState *env, const ARMCPRegInfo *ri,
+                           uint64_t value)
+{
+    GICv5Common *gic = gicv5_get_gic(env);
+    GICv5HandlingMode hm = FIELD_EX64(value, GIC_CDHM, HM);
+    GICv5IntType type = FIELD_EX64(value, GIC_CDAFF, TYPE);
+    uint32_t id = FIELD_EX64(value, GIC_CDAFF, ID);
+    bool virtual = false;
+    GICv5Domain domain = gicv5_current_phys_domain(env);
+
+    gicv5_set_handling(gic, id, hm, domain, type, virtual);
+}
+
 static const ARMCPRegInfo gicv5_cpuif_reginfo[] = {
     /*
      * Barrier: wait until the effects of a cpuif system register
@@ -86,11 +169,36 @@ static const ARMCPRegInfo gicv5_cpuif_reginfo[] = {
         .opc0 = 1, .opc1 = 0, .crn = 12, .crm = 0, .opc2 = 1,
         .access = PL1_W, .type = ARM_CP_NOP,
     },
+    {   .name = "GIC_CDDIS", .state = ARM_CP_STATE_AA64,
+        .opc0 = 1, .opc1 = 0, .crn = 12, .crm = 1, .opc2 = 0,
+        .access = PL1_W, .type = ARM_CP_IO | ARM_CP_NO_RAW,
+        .writefn = gic_cddis_write,
+    },
+    {   .name = "GIC_CDEN", .state = ARM_CP_STATE_AA64,
+        .opc0 = 1, .opc1 = 0, .crn = 12, .crm = 1, .opc2 = 1,
+        .access = PL1_W, .type = ARM_CP_IO | ARM_CP_NO_RAW,
+        .writefn = gic_cden_write,
+    },
     {   .name = "GIC_CDPRI", .state = ARM_CP_STATE_AA64,
         .opc0 = 1, .opc1 = 0, .crn = 12, .crm = 1, .opc2 = 2,
         .access = PL1_W, .type = ARM_CP_IO | ARM_CP_NO_RAW,
         .writefn = gic_cdpri_write,
     },
+    {   .name = "GIC_CDAFF", .state = ARM_CP_STATE_AA64,
+        .opc0 = 1, .opc1 = 0, .crn = 12, .crm = 1, .opc2 = 3,
+        .access = PL1_W, .type = ARM_CP_IO | ARM_CP_NO_RAW,
+        .writefn = gic_cdaff_write,
+    },
+    {   .name = "GIC_CDPEND", .state = ARM_CP_STATE_AA64,
+        .opc0 = 1, .opc1 = 0, .crn = 12, .crm = 1, .opc2 = 4,
+        .access = PL1_W, .type = ARM_CP_IO | ARM_CP_NO_RAW,
+        .writefn = gic_cdpend_write,
+    },
+    {   .name = "GIC_CDHM", .state = ARM_CP_STATE_AA64,
+        .opc0 = 1, .opc1 = 0, .crn = 12, .crm = 2, .opc2 = 1,
+        .access = PL1_W, .type = ARM_CP_IO | ARM_CP_NO_RAW,
+        .writefn = gic_cdhm_write,
+    },
 };
 
 void define_gicv5_cpuif_regs(ARMCPU *cpu)
-- 
2.43.0


