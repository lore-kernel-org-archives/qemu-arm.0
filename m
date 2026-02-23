Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C4E9EC110C
	for <qemu-arm@archiver.kernel.org>; Mon, 23 Feb 2026 17:10:44 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vuZKZ-0002AM-AF; Mon, 23 Feb 2026 12:02:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vuZKV-0001vt-UV
 for qemu-arm@nongnu.org; Mon, 23 Feb 2026 12:02:43 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vuZKS-0000AZ-UE
 for qemu-arm@nongnu.org; Mon, 23 Feb 2026 12:02:43 -0500
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-4806ce0f97bso36858435e9.0
 for <qemu-arm@nongnu.org>; Mon, 23 Feb 2026 09:02:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1771866159; x=1772470959; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=FzYN9ygidJdhGyDwIINOqZeaIIMy2JouxjcXfZjOhMI=;
 b=HvI3vFygYfFA0/R1Z2ZTccUtH/6Y+NLQHq6xONzzkMQfRBThv2p4TJ6MhOHdEVNSu4
 H27rGofG2EjDABHbeMLhuy2dzwXDvoZZvVFn6phrf5lC8bHkq2H6OHWxbUC5iIZGmuoK
 8Zcv6LYk5G3eVxhOHnLlxuimo+e3XyM2sUVciUrLVgCObNHkA1o+/a3DxEunGNs9YH9c
 u3NdOXrcjji7b+IelJ7JcdPJlTeIfZNDGU9fy5IfDrgTw8X/Ib0hTtgvEennCkZbvUXT
 hElO5ZTbC/nk0tQlion5GDg4J8nC5cI9tCgY25owWqkGEjIucHtJW52L/LssmoOEinlM
 Aaug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771866159; x=1772470959;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=FzYN9ygidJdhGyDwIINOqZeaIIMy2JouxjcXfZjOhMI=;
 b=QuQTsyvIKBM8huWzXxyx4LG/9s3p7lcGcM3GtfXb3GAqGAG3FcYQEXooJe+4wmi4wE
 zqg2Sv4KqYpJk9G5xrnGKH8jdUgplxZSTKmTT10aI1z876P3zgWZQMi9O9le7KdRfjC/
 F87GOjHHQoik78iz9VfDZoAy7Z8X6Dt13Nji8js+HdapBLSy+HkyIv9YlHZfwCFOdOpY
 Prck6GBWDLEa/lGN1CLmdAHeAYjMFz1B7pps3n/7pMzwKCTIwveSgTvPZOvrQ8bipTsV
 uwBtEsU0oJP6dFCvh7utw8CNBsvjXmx+bsKIBaUyWcLI/kVLaqfx8DlLp2VS4eu4UCWv
 xKzA==
X-Gm-Message-State: AOJu0YyxjbuHWiKbmCtrckEphE0AUAgy+mlSv/GZLCOAcN0VpnCNCrR7
 fw/5toCXKHN1ynH+KVXOymx3M8SXdplc0CU3ffW/kOX9VE3WOyCEddJlBOzTCBOVOqHMvncH85r
 Jw7QX
X-Gm-Gg: AZuq6aJdBMlRg+IzqmVR/LMtWYGgG2jwR0HBQGzlfgiptAkNsKbMrNG/M+k7IvUT6Es
 HBVzD/RqZ4W2apL2oPSGpJAAiam7TNfNRSX/jFo1wNeVkWJ0hZikCzCDhgp7rNNsFKR2QKyuo7t
 Cq4WzdF3OY/jePw9RMAUs3Lwjpe2hqsAAO7WsClpvom2KNtKiiDLSygbkGP3CV4q2nOorAGR/RE
 +/CRC4S9E9YKAHgBFt5uRTanGkKKOpSPuQXmtKwimivL3kN2V1boR+sjcqCID+5oiUZXV3OuQV8
 79+LE6HagTh0udMgReVV/R5jRuDS6jhYXXjJeDXVRk4Sf37UHuWHltz1W0XYJ0SiEU4pkfGG7JN
 fOljC4kMXAmU+YpXQsXL6M46bCHLWI32xZfseDqD+AuW+06/IvzxZItC3Yw237ZBu9i8E7q1emo
 3cbjaXx5+vwrUuKUwBOo0iF4aRIM5wabsc5HNboaGKtXdb5qZVYFLYTuI3XAqB8zQzKTi8xU2yB
 qNyZO/8PLcD7fNuDQIXV/X2705WcbI=
X-Received: by 2002:a05:600c:6990:b0:483:6a8d:b2f9 with SMTP id
 5b1f17b1804b1-483a95aa328mr156841225e9.5.1771866159369; 
 Mon, 23 Feb 2026 09:02:39 -0800 (PST)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483a9b21ceasm200155625e9.0.2026.02.23.09.02.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Feb 2026 09:02:38 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 21/65] target/arm: GICv5 cpuif: Implement GIC CD* insns for
 setting config
Date: Mon, 23 Feb 2026 17:01:28 +0000
Message-ID: <20260223170212.441276-22-peter.maydell@linaro.org>
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

Implement the GIC CDDIS, GIC CDEN, GIC CDAFF, GIC CDPEND and GIC CDHM
system instructions.  These are all simple wrappers around the
equivalent gicv5_set_* functions, like GIC CDPRI.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/tcg/gicv5-cpuif.c | 108 +++++++++++++++++++++++++++++++++++
 1 file changed, 108 insertions(+)

diff --git a/target/arm/tcg/gicv5-cpuif.c b/target/arm/tcg/gicv5-cpuif.c
index 072b38e785..c426e045d9 100644
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


