Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDCD3CC6B08
	for <qemu-arm@archiver.kernel.org>; Tue, 13 Oct 2026 08:46:31 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xGY3l-0007xu-PE; Tue, 13 Oct 2026 04:40:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xGY3P-00071h-UX
 for qemu-arm@nongnu.org; Tue, 13 Oct 2026 04:40:13 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xGY3L-0007cM-Hg
 for qemu-arm@nongnu.org; Tue, 13 Oct 2026 04:40:10 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-4a172eb31f0so20431165e9.1
 for <qemu-arm@nongnu.org>; Tue, 13 Oct 2026 01:39:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1791880793; x=1792485593; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to:content-type;
 bh=qpgEaqwbI8cXhwzqqc5V6TxLN3Im1mcvPlwe4PGvMA8=;
 b=Mut4tNWg+ihZb04jsCn9gVV87CGjj81ZKQtFhZrBQcCPAVUOidAM3xfzySAB1nwHUC
 RBHO0daEUeB0aWlR2yxXv1I/Ra2R305/HY1njSTarJBG9s+9uCHtPttXKpeCrO9Wv9nQ
 dzmYRiRPmuvY16FQWv4bSc/CwUG19smi0JxkiXENFiyDEOtNIRpsW5w36djKRwlirW2b
 DHeLD5WrQaxhbleco/8boDazsv9zeXMy9+oTbpeuR1X96RVi+tjHyHV53HNyy8p8608D
 49UZY+t+01y0nX2XQh4CamLznWGQtq1GUqa3OtORpIilIMvX57Vum8H97IVDEQbJOzCd
 JAMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791880793; x=1792485593;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to:content-type;
 bh=qpgEaqwbI8cXhwzqqc5V6TxLN3Im1mcvPlwe4PGvMA8=;
 b=fIqpoY9NYHo8DCiENfIbBxQBLE5iQnpzmG55+epJm4eMtiF3fYFvHq6h4QGHtFrOuB
 ncK15B4ONc7pSGD87LPY4Rr3xvNZyiE/wE/7WFn64IG/NYKvInbv54+z1/70pqMl8R3Z
 reiSRq25d07jOSYhpAjHNcOrnFBGLuzw4uWC8sQD9lW0/y1BolatYKWyNxbs38qwkC1B
 Lo0Gy83WR0hOy5oQpp5VJbknaaZMZBWTBggaA8LFd6TgBjo9HhrAOfQJs9ur+6YqkpZC
 7KSknLyi4jSvHFl138GM7szfY8ZsN/cNIJ4JiUWIbomUAwiW0WytZCgfLBiUDk5jaFqe
 h/6Q==
X-Gm-Message-State: AFq9FYK2IE8lQUPhkBeNAnvnrF9MCHJ3nwnBoib+caPudH04H693dbz6
 V7kihAJmS8M5wQb/omm/U5rRxLjD3Kcf0wqxp9gdqNFXVq6yHpcWR5uOzJZh/NUpa9+joS8+Ftk
 /qKGUtFU=
X-Gm-Gg: AYBFou2r3NPJVsqDODy97pCnnkbgNFfv4p9bUu8/GpAIznRE1NEa60mTqscBr0FdXBB
 Z3m7yL0ggQ8omQ2H5tyMtJ1/FmJygGtLoT6A9JdEzaYDzEVWR2sSEP2k4AiRd9n9Pn+3Z8bxj0m
 m6mETXaBlRo8pC8ETK0GFZXJh5Ofuu3acI7bz/NdcLf+KmZhCkZcugQDvsIy/AhF96sJfj7wuSs
 LE8GxfIRYkSfHNXs9VZt0KO28dMuUuRhy2SDWcuCfX7477JztWS6LdK+81hLEm/5R82/rgC09Xp
 npaueKos+8Q17IyNFLWUVe/XHZdu/DBbFWXQhnzJk17HutHpwK8iRpRohaJ1YSPWebPS00nOVge
 SSWg3nvxdUNObb7AFsuAjMqwGoRSGMJfqQ96am+DwXOyCScMAyvsXwyqqBVC18SUQvBDR19G6qw
 5uzykWIycFff01zC5nb3rur4EIsY51CI0RfQJhjbs4Lzq2oR6Va4+q+GQJsGYYURIft7YmhtXYj
 ZlH3Z1lCYYeww2ovZex0Q1oYsmfPeOeK2Q3WKJqsaIu0PI8cY55IyCss/eB/4tsiKaVvxH9l4/r
 xALraiJk3QL9vA==
X-Received: by 2002:a05:600c:3b1a:b0:49c:fa20:cbfd with SMTP id
 5b1f17b1804b1-4a18e4b91f8mr200321455e9.20.1791880793162; 
 Tue, 13 Oct 2026 01:39:53 -0700 (PDT)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a18be96549sm495086735e9.6.2026.10.13.01.39.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Oct 2026 01:39:52 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 13/86] target/arm: GICv5 cpuif: Implement ICH_APR_EL2
Date: Tue, 13 Oct 2026 09:38:20 +0100
Message-ID: <20261013083933.1024405-14-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261013083933.1024405-1-peter.maydell@linaro.org>
References: <20261013083933.1024405-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32a.google.com
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

Implement the ICH_APR_EL2 register.  This is part of the hypervisor
control register interface, and is the hypervisor-facing access to
the state which holds the guest's its active priority register.

The only slightly non-straightforward part of this is that because
the GICv5 allows a hypervisor to give its guest a GICv3-compatible
virtual CPU interface, this register has to UNDEF to the inner guest
when legacy-vcpu operation is enabled.  We don't implement
GCIE_LEGACY in QEMU yet, but since we expect to do so in future, the
handling for this is implemented here.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.h             |  2 ++
 target/arm/tcg/gicv5-cpuif.c | 44 ++++++++++++++++++++++++++++++++++++
 2 files changed, 46 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 82c13186b68..a93fd362417 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -594,6 +594,8 @@ typedef struct CPUArchState {
 
         /* Cached highest-priority pending PPI for each domain */
         GICv5PendingIrq ppi_hppi[NUM_GICV5_DOMAINS];
+
+        uint64_t ich_apr_el2;
     } gicv5_cpuif;
 
     struct {
diff --git a/target/arm/tcg/gicv5-cpuif.c b/target/arm/tcg/gicv5-cpuif.c
index 0b1033c1ef0..83c9be2b0e6 100644
--- a/target/arm/tcg/gicv5-cpuif.c
+++ b/target/arm/tcg/gicv5-cpuif.c
@@ -90,6 +90,15 @@ static GICv5Common *gicv5_get_gic(CPUARMState *env)
     return env->gicv5.gicv5state;
 }
 
+/*
+ * Return true if GIC virtual interface legacy operation is enabled.
+ * We don't currently implement FEAT_GCIE_LEGACY.
+ */
+static bool gicv5_legacy_enabled(CPUARMState *env)
+{
+    return false;
+}
+
 static GICv5Domain gicv5_logical_domain(CPUARMState *env)
 {
     /*
@@ -696,6 +705,34 @@ static void gic_cddi_write(CPUARMState *env, const ARMCPRegInfo *ri,
     }
 }
 
+static CPAccessResult access_gicv5_ich_reg(CPUARMState *env,
+                                           const ARMCPRegInfo *ri,
+                                           bool isread)
+{
+    /*
+     * accessfn for GICv5 ICH regs. The NV behaviour here is a little
+     * different from usual because of the optional legacy GIC feature.
+     *
+     * At EL1, if GCIE_LEGACY is disabled or not implemented, these
+     * behave like normal EL2 registers, which is that they redirect
+     * to memory if NV2 is enabled and trap to EL2 if not.  If legacy
+     * operation is enabled, these registers must UNDEF to EL1
+     * (because from the inner guest's point of view it has a GICv3
+     * and this sysreg doesn't exist).
+     *
+     * The UNDEF at EL1 when NV==0 is handled already because of the
+     * .access = PL2_RW setting on the cpreg.
+     */
+    if (arm_current_el(env) == 1 && gicv5_legacy_enabled(env)) {
+        return CP_ACCESS_UNDEFINED;
+    }
+    /*
+     * continue to either redirect-to-memory, trap-to-EL2 or (if
+     * current EL is 2 or 3) access the register
+     */
+    return CP_ACCESS_OK;
+}
+
 static const ARMCPRegInfo gicv5_cpuif_reginfo[] = {
     /*
      * Barrier: wait until the effects of a cpuif system register
@@ -893,6 +930,13 @@ static const ARMCPRegInfo gicv5_cpuif_reginfo[] = {
         .writefn = gic_icc_pcr_el1_write,
         .resetfn = gic_icc_pcr_el1_reset,
     },
+    {   .name = "ICH_APR_EL2", .state = ARM_CP_STATE_AA64,
+        .opc0 = 3, .opc1 = 4, .crn = 12, .crm = 8, .opc2 = 4,
+        .access = PL2_RW, .type = ARM_CP_NO_RAW,
+        .nv2_redirect_offset = 0xb00,
+        .accessfn = access_gicv5_ich_reg,
+        .fieldoffset = offsetof(CPUARMState, gicv5_cpuif.ich_apr_el2),
+    },
 };
 
 void define_gicv5_cpuif_regs(ARMCPU *cpu)
-- 
2.43.0


