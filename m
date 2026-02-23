Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1FE5EC110C
	for <qemu-arm@archiver.kernel.org>; Mon, 23 Feb 2026 17:04:34 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vuZKk-0002TO-Js; Mon, 23 Feb 2026 12:02:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vuZKi-0002Ry-U4
 for qemu-arm@nongnu.org; Mon, 23 Feb 2026 12:02:56 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vuZKh-0000Hh-5Z
 for qemu-arm@nongnu.org; Mon, 23 Feb 2026 12:02:56 -0500
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-483abed83b6so14148595e9.0
 for <qemu-arm@nongnu.org>; Mon, 23 Feb 2026 09:02:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1771866174; x=1772470974; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=/Mw22eOdEKGVrHgSJcdy0DJe9ef4kO7Rp5jrpc0VMn8=;
 b=qJADO7yvPw292zSD2Jkki4HHi5KIPUwQBhKxqg/tgZCsWlU7AkxDFc0X5Ygu8/6+nI
 YXgoUWDNb+UtCi8BTNvuv8q2Cx754s0F3wL6aNWOgaNiaLHbPGGsbVBptDXq9CPAb/DW
 CflsoIAZNOFPv+YCzdZPwRcfqMZN7A+Vp30CXTod8poK/DF9QaU15ysx6IZuTcipZJNQ
 mw1SnSoemNDke9RGey4JIsyDogkMjnxoTzpHFyUJ7txo7wfpezsPawThgpTyZwJqXiNG
 4OzpNwH2xqefj3XNSLi49E2RdajjuLZPnf+xWySwypWrEIsux/Cp+x8SzcKcgOgtz4T3
 iXiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771866174; x=1772470974;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=/Mw22eOdEKGVrHgSJcdy0DJe9ef4kO7Rp5jrpc0VMn8=;
 b=cyv3y+CCL8IAgt136pDJ4BKUqxxa/V34e0G6XkgB9mt2PAXW6C5ND0zSQzKKyhV4kP
 9+ZqI8x6GxMEO8uVxzxD9d3B1k2gLrUayqJ+K/4HwlLcn87+LCR7z26sCyvTRaCyXeVX
 IJPHUH1lU3MZYH9MX4xXYER8t1vrfvFT72U2b8vzTI+bQY2ySJK4kd5YH0dl474GDDmS
 TMHJIvBA01DAmoq8ajBRVM70PWz+RDtXEfe/vRJhv5485RqTKpWD3ePCRB27kNDQRJsM
 VV0CyXdSLJhOG8OsfpWEGP0l7699yhYaHuzabOfsh74sZSDBa2iWI3xuv1v4KdYH8uSX
 4Y3Q==
X-Gm-Message-State: AOJu0YzoLokJbZZ3X3K8RYDHU6oZvnXY6QZva7AwXvJAvOO1ZQ4H64Zs
 i6qhW/JGNFlYWbgoMYDbSM+lGQVVyVzGXuj0QnIHDxdzGVCjc5rmNy9wuIM7MKy0fJrYCHFyGBp
 p1Tmr
X-Gm-Gg: AZuq6aJMXgs+w/vIbE9Ldll1Hyk9QfkhqEoD/E/CATXajvzPoW6LNC7bACCIEJqMILn
 G1Id1rwdpxbe8epTSCOgFV9PPsucJ89hFgo0O9ZqQIi3BDgNpze1wO8CpSXwj0I4KQuapt9nsmf
 /KJR/1hnhv8AfwY1CMvsk24WcB4vPEBgPvOpIrBdefQigHJZUWEdUGMapK+TcxKykYQRnpB6p45
 oXhbCc3/QzTr9J6eTkKLVGVMXEx2+olDhY/cDSwlzIpLr1SRRlwetzPYVSkEH7/B+JaId1oLIYv
 lPRBgw7CG7ub3sBjXdUllJC2+4vKKmvUmxsBSmfBid6gD6dbwJEjP0QWYh97kW3DgOa1W/QuRY1
 G3wyWNCMMU5YuDufQR907xKIIIBlZXJwEMAMLflNjR303vPw/jmcg6T5zAQ42M+mH+IWh7wZ/AX
 EPeeqpwa3t+MDrULTRT1M9swUmqExg+rXQto0YiJbCKr3dNXDf7YaUjmYhHMkRIDj3/bPkn7aQa
 k0tliTBtl87ryDSgeZ38mwfWUrWik8BD1ARHkuV9w==
X-Received: by 2002:a05:600c:1c22:b0:483:79ad:f3b9 with SMTP id
 5b1f17b1804b1-483a95eada4mr163288105e9.28.1771866173689; 
 Mon, 23 Feb 2026 09:02:53 -0800 (PST)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483a9b21ceasm200155625e9.0.2026.02.23.09.02.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Feb 2026 09:02:52 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 35/65] target/arm: GICv5 cpuif: Implement GICv5 PPI active
 set/clear registers
Date: Mon, 23 Feb 2026 17:01:42 +0000
Message-ID: <20260223170212.441276-36-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260223170212.441276-1-peter.maydell@linaro.org>
References: <20260223170212.441276-1-peter.maydell@linaro.org>
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

In the GICv5 PPI state and control lives in the CPU interface; this
is different from the GICv3 where this was all in the redistributor.

Implement the access system registers for the PPI active state; this
is a pair of registers, one of which has "write 1 to clear" behaviour
and the other of which has "write 1 to set".  In both cases, reads
return the current state.

We start here by implementing the accessors for the underlying state;
we don't yet attempt to do anything (e.g.  recalculating the highest
priority pending PPI) when the state changes.  That will come in
subsequent commits.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.h             |  5 +++++
 target/arm/tcg/gicv5-cpuif.c | 38 ++++++++++++++++++++++++++++++++++++
 2 files changed, 43 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index a32c5f3ab1..dd4dc12feb 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -257,6 +257,9 @@ typedef enum ARMFPStatusFlavour {
 } ARMFPStatusFlavour;
 #define FPST_COUNT  10
 
+/* Architecturally there are 128 PPIs in a GICv5 */
+#define GICV5_NUM_PPIS 128
+
 typedef struct CPUArchState {
     /* Regs for current mode.  */
     uint32_t regs[16];
@@ -600,6 +603,8 @@ typedef struct CPUArchState {
     struct {
         /* GICv5 CPU interface data */
         uint64_t icc_icsr_el1;
+        /* Most PPI registers have 1 bit per PPI, so 64 PPIs to a register */
+        uint64_t ppi_active[GICV5_NUM_PPIS / 64];
     } gicv5_cpuif;
 
     struct {
diff --git a/target/arm/tcg/gicv5-cpuif.c b/target/arm/tcg/gicv5-cpuif.c
index 36d1c196a8..0132b13853 100644
--- a/target/arm/tcg/gicv5-cpuif.c
+++ b/target/arm/tcg/gicv5-cpuif.c
@@ -175,6 +175,20 @@ static void gic_cdhm_write(CPUARMState *env, const ARMCPRegInfo *ri,
     gicv5_set_handling(gic, id, hm, domain, type, virtual);
 }
 
+static void gic_ppi_cactive_write(CPUARMState *env, const ARMCPRegInfo *ri,
+                                  uint64_t value)
+{
+    uint64_t old = raw_read(env, ri);
+    raw_write(env, ri, old & ~value);
+}
+
+static void gic_ppi_sactive_write(CPUARMState *env, const ARMCPRegInfo *ri,
+                                  uint64_t value)
+{
+    uint64_t old = raw_read(env, ri);
+    raw_write(env, ri, old | value);
+}
+
 static const ARMCPRegInfo gicv5_cpuif_reginfo[] = {
     /*
      * Barrier: wait until the effects of a cpuif system register
@@ -254,6 +268,30 @@ static const ARMCPRegInfo gicv5_cpuif_reginfo[] = {
          */
         .resetfn = arm_cp_reset_ignore,
     },
+    {   .name = "ICC_PPI_CACTIVER0_EL1", .state = ARM_CP_STATE_AA64,
+        .opc0 = 3, .opc1 = 0, .crn = 12, .crm = 13, .opc2 = 0,
+        .access = PL1_RW, .type = ARM_CP_ALIAS | ARM_CP_IO | ARM_CP_NO_RAW,
+        .fieldoffset = offsetof(CPUARMState, gicv5_cpuif.ppi_active[0]),
+        .writefn = gic_ppi_cactive_write,
+    },
+    {   .name = "ICC_PPI_CACTIVER1_EL1", .state = ARM_CP_STATE_AA64,
+        .opc0 = 3, .opc1 = 0, .crn = 12, .crm = 13, .opc2 = 1,
+        .access = PL1_RW, .type = ARM_CP_ALIAS | ARM_CP_IO | ARM_CP_NO_RAW,
+        .fieldoffset = offsetof(CPUARMState, gicv5_cpuif.ppi_active[1]),
+        .writefn = gic_ppi_cactive_write,
+    },
+    {   .name = "ICC_PPI_SACTIVER0_EL1", .state = ARM_CP_STATE_AA64,
+        .opc0 = 3, .opc1 = 0, .crn = 12, .crm = 13, .opc2 = 2,
+        .access = PL1_RW, .type = ARM_CP_IO | ARM_CP_NO_RAW,
+        .fieldoffset = offsetof(CPUARMState, gicv5_cpuif.ppi_active[0]),
+        .writefn = gic_ppi_sactive_write,
+    },
+    {   .name = "ICC_PPI_SACTIVER1_EL1", .state = ARM_CP_STATE_AA64,
+        .opc0 = 3, .opc1 = 0, .crn = 12, .crm = 13, .opc2 = 3,
+        .access = PL1_RW, .type = ARM_CP_IO | ARM_CP_NO_RAW,
+        .fieldoffset = offsetof(CPUARMState, gicv5_cpuif.ppi_active[1]),
+        .writefn = gic_ppi_sactive_write,
+    },
 };
 
 void define_gicv5_cpuif_regs(ARMCPU *cpu)
-- 
2.43.0


