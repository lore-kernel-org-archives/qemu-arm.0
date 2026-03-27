Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D525710ED65C
	for <qemu-arm@archiver.kernel.org>; Fri, 27 Mar 2026 11:23:12 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w65CD-00072A-RX; Fri, 27 Mar 2026 07:17:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1w65CC-00070o-53
 for qemu-arm@nongnu.org; Fri, 27 Mar 2026 07:17:44 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1w65C9-0008FD-Nb
 for qemu-arm@nongnu.org; Fri, 27 Mar 2026 07:17:43 -0400
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-43b9d3ebed5so631715f8f.1
 for <qemu-arm@nongnu.org>; Fri, 27 Mar 2026 04:17:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1774610260; x=1775215060; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zO8+icgVC1WFthhuPn3fXGZ2vtbwSvDSsbRmXizchEg=;
 b=K0GALIVUDmPhEb5XC8jfilPkeXQOC787b12Aufx4QcU1urwnyknIRuqU40HlPvJ4OP
 wM3x6A0HMSsf9heH1zTmAqLnjN5QEiRUTfvIGpTWmPSeD9bMsIcwDcWOFrHX+f8cvHP4
 JGf9S0UPkjBPcBP693XaZqIom4roLBoGzT0+zBBPxAHuhDrqTfVQ1Sn+ttBpHBFgiRZh
 TAC28VEQ66ZCFM74Pu7J73zMZZGe0Qb2++Ka2Q0h4S7ZrljVVAKw0iLtzsjAIoLXOJUm
 YcAny0oRZzhUfJmQVN8BfSBr+x5mctD1jXmX0lDHEaRHv3E2mdTqrp3KEmHh8Cm0klbK
 1cdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774610260; x=1775215060;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=zO8+icgVC1WFthhuPn3fXGZ2vtbwSvDSsbRmXizchEg=;
 b=aiijOmWEmKPvjh3KlJqW1eqEXiTefcMceQhbMqGxNleilkleXgKS/FGo+z1UZSQP9m
 G7KXTuFX9UpCwAkMtsn4/akCfj5LBcg3rtoF/SO6ctliiZfiQBu/suuw3hFMvbv50FlZ
 YQ4OhdfiRjQjpAlIeDVntwD5A8F4MoWyyxMFbz3/WWLPPn3EVRSoMzg9BQ6m8WBTTxy3
 UB4OzDvQw5b2hOM9Qli2mMALQXrQZA2XaMIpk19r/IoN3MCTM4ZI1xB0fvzA8tBMsCE6
 U/gLUHOwG9PvR9QnfLavmPAkz6O8Av1qq7L2FbiAjTp3JDRcRHUzN8xAE4tLr4P7YU3i
 6Wkg==
X-Gm-Message-State: AOJu0Yy+eXVdWZJI5mujjWnLnQvSXJoiFfVOAI03qhQTQ2ieZJKU0FbN
 imcxXQ8egTak3PBXFnia5AplF5yqHLO4XN64GZD2MuQoxbzBCyC/eDPI+lL1AyReKH9hoHFVtOy
 ZlJ6G18U=
X-Gm-Gg: ATEYQzwSyFJ7mOaIn4qzfLOMzGZClpznAhkjXIMT5Zb2P46geFMSKfuCobMMDdibuGT
 WxdyaWmtvKFcqRhSJ/sPYaXpGOW4Qx8W+l1bEX/xE2iNNezJGh43wPwiMD7TADSp2WNN0xidfqN
 LGlyDJD49udIoyAQwBEk8t7d6MzDW1N4/Y1Av1MwZd1r+R+d6WQddTd0xiztKHUJpSq3YQZv6u7
 29lz+h/e8GRXMgoLu0WJQCvqaP5PlMSO2y9SFAVq670+3gbH0pyoKTiDuKUH94H7OIqa2kwpMnY
 M4L2Vr8IB+eYv22Q6IK/gSgR7fkJtUxBOOys36K9TQJk+dXC19Q2m7ROT/zCoQRUMyGmEx/9WOe
 d9m0x20UXh6kmhIdlC/mgv+D8bv7WTJ6pV1+q1NYumzPJ3orhVR100EnbBm0tTe51HZqUi1gjJp
 3nFdaO2oBa7Wqg0iuh5Qk3fLxd/uPdo1ldIvEoqutk3Ckny62QJxZRG5ArtAAjQMav2DAqGlxqy
 zT4Qzc8ddSo6n8dFrxXlqSESTGbUK4=
X-Received: by 2002:a05:600c:4e55:b0:485:4533:9c47 with SMTP id
 5b1f17b1804b1-48727ec77a9mr37014825e9.22.1774610260204; 
 Fri, 27 Mar 2026 04:17:40 -0700 (PDT)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43b919cf2b2sm15484227f8f.18.2026.03.27.04.17.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Mar 2026 04:17:39 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Jonathan Cameron <jonathan.cameron@huawei.com>
Subject: [PATCH v2 40/65] target/arm: GICv5 cpuif: Implement PPI priority
 registers
Date: Fri, 27 Mar 2026 11:16:35 +0000
Message-ID: <20260327111700.795099-41-peter.maydell@linaro.org>
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
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_FILL_THIS_FORM_SHORT=0.01 autolearn=ham autolearn_force=no
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

Implement the GICv5 registers which hold the priority of the PPIs.
Each 64-bit register has the priority fields for 8 PPIs, so there are
16 registers in total.  This would be a lot of duplication if we
wrote it out statically in the array, so instead create each register
via a loop in define_gicv5_cpuif_regs().

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
---
 target/arm/cpu.h             |  2 ++
 target/arm/tcg/gicv5-cpuif.c | 23 +++++++++++++++++++++++
 2 files changed, 25 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 915a225f8e..b97f659352 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -608,6 +608,8 @@ typedef struct CPUArchState {
         uint64_t ppi_hm[GICV5_NUM_PPIS / 64];
         uint64_t ppi_pend[GICV5_NUM_PPIS / 64];
         uint64_t ppi_enable[GICV5_NUM_PPIS / 64];
+        /* The PRIO regs have 1 byte per PPI, so 8 PPIs to a register */
+        uint64_t ppi_priority[GICV5_NUM_PPIS / 8];
     } gicv5_cpuif;
 
     struct {
diff --git a/target/arm/tcg/gicv5-cpuif.c b/target/arm/tcg/gicv5-cpuif.c
index 09cd56cbfa..74132ca097 100644
--- a/target/arm/tcg/gicv5-cpuif.c
+++ b/target/arm/tcg/gicv5-cpuif.c
@@ -225,6 +225,12 @@ static void gic_ppi_enable_write(CPUARMState *env, const ARMCPRegInfo *ri,
     raw_write(env, ri, value);
 }
 
+static void gic_ppi_priority_write(CPUARMState *env, const ARMCPRegInfo *ri,
+                                   uint64_t value)
+{
+    raw_write(env, ri, value);
+}
+
 static const ARMCPRegInfo gicv5_cpuif_reginfo[] = {
     /*
      * Barrier: wait until the effects of a cpuif system register
@@ -382,5 +388,22 @@ void define_gicv5_cpuif_regs(ARMCPU *cpu)
 {
     if (cpu_isar_feature(aa64_gcie, cpu)) {
         define_arm_cp_regs(cpu, gicv5_cpuif_reginfo);
+
+        /*
+         * There are 16 ICC_PPI_PRIORITYR<n>_EL1 regs, so define them
+         * programmatically rather than listing them all statically.
+         */
+        for (int i = 0; i < 16; i++) {
+            g_autofree char *name = g_strdup_printf("ICC_PPI_PRIORITYR%d_EL1", i);
+            ARMCPRegInfo ppi_prio = {
+                .name = name, .state = ARM_CP_STATE_AA64,
+                .opc0 = 3, .opc1 = 0, .crn = 12,
+                .crm = 14 + (i >> 3), .opc2 = i & 7,
+                .access = PL1_RW, .type = ARM_CP_IO,
+                .fieldoffset = offsetof(CPUARMState, gicv5_cpuif.ppi_priority[i]),
+                .writefn = gic_ppi_priority_write, .raw_writefn = raw_write,
+            };
+            define_one_arm_cp_reg(cpu, &ppi_prio);
+        }
     }
 }
-- 
2.43.0


