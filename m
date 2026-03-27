Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE2D310ED65E
	for <qemu-arm@archiver.kernel.org>; Fri, 27 Mar 2026 11:19:23 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w65Bp-0006UB-QX; Fri, 27 Mar 2026 07:17:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1w65Bo-0006SR-BZ
 for qemu-arm@nongnu.org; Fri, 27 Mar 2026 07:17:20 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1w65Bl-0007sL-Bs
 for qemu-arm@nongnu.org; Fri, 27 Mar 2026 07:17:19 -0400
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-439b6d9c981so1274349f8f.1
 for <qemu-arm@nongnu.org>; Fri, 27 Mar 2026 04:17:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1774610235; x=1775215035; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=je7B5zDvIcs1KYXJyPR11CmwTDqna8zeEJTkuZaNBM8=;
 b=NkcC/4IlLZhGN1xPFumh+zIoKQkuwcch6zqnFNr+GTaI927GHAFTEBkLtf0j4ufNkc
 /FOka5oZASfqMMZzSsCfJPGoWkhbnGNmgRkLXhfNQPRv4a44SoosuMkAx98pmDxCfoGG
 aWlZncslEMKobI03S0I/2xtG3FFAqg9d8z1lmOmLo98/xchZC9lD8vuy+DN6DkOvUBjz
 hGp2KLzRDkdQ2z4Wha6yL1N2pfAWT6qX/YiKMsVRXQRRQj6nZNgv0ASamsaG3pQPr4tM
 wU0RTrRMuS7LVyaZMtTTWmZy5z3JUaIp2et5ryxfJQk3HzpORkHVpLOhORC/QHdaaPDy
 tZPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774610235; x=1775215035;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=je7B5zDvIcs1KYXJyPR11CmwTDqna8zeEJTkuZaNBM8=;
 b=r0SCaiQVKKusZnt8y6hZhzQb6EFFsuY/O/R8n2gmd0auWTiPVnDisYwOBsAS+Yk+Jk
 2vtRy0Rn1DsgkSxSKIEqsdTblNd40+31Wgg7qA5KLKcc5AB6Ynj+s1qtixruPmtJ87nC
 RkWvo/3jeYhWhdeV3p6RdSLLQTBLmeOJzG4wyZ7KxlTKK3lGvTYMMuZk3IhOBYMKLlq1
 NRq5nG+kRsTJffOzw3zO7MkOcE1tkArvUrav3JZr1pBhmUtWGZoe9ydkBKCGAddR5fVC
 hkOrZpfl/nYPB78WJwFyIjTYse/HvRfG+ad7hgiMcD/DzekqafLf5VOqaPav6+YY1zrs
 PPFw==
X-Gm-Message-State: AOJu0Yx3GUAVszTYxejP5ILIAkbXCcGv66LnhhsyahvytXylciJkCyO4
 XM+E1LLO5Rx1KxKhCKcu/A8qvfDXmgSzhoc6iCAPImfQbCOPAPO4qiA0KU1qC+b3fk1S3xBVXVU
 i4SbA0I8=
X-Gm-Gg: ATEYQzyAeTbtnnOi3+lj1BTgt10DEdpjS8CC2l6GD3RGqYeTn+CZD7rG25kz5yJHtmh
 G70/WeDOziXj+bySLi2mQrOrbHCGLtQI0nC/gKbA6COBO1GZlBBQkSERFZjW/qOzEirDIqMEjlY
 QXhMjhNAipqYwg79YpILWI06H9PEM0KwPprOgol3q3lHBu8O0Fj2OMWOhBlYgDBwGTmg/5sBjMI
 LuTb4q1LuJ8QSHoYTLWojGbVyMb2Qj8e4R6IyPFjwR8bb3e4MVRoj0bzAbaVJMAVzilf/FGD+ba
 w1uVkkRmUdiYLfIBC8Cqy/PdEC3i+aSeo3vIPXWGUthNLkFsn/QR4CHdVVtghgk8dcAIiGvxn3B
 hFepATMZqkyD96wDO+Ov6ziAK+FuopCPvKpZ6zzMeIUyfGF0z543ENst7Hw5+qn9ToAqEndjpty
 bbwxrlE/679JQ8rRmDK7qfJ+B4B3rJJTlvEPIvNRG4jGrVQSbdjnmcm3qWfs5rspe+m6DFXdm96
 N4G4WWRPrtWjBGyWJ9wFN2ObXHSvQc=
X-Received: by 2002:a05:6000:2d08:b0:43b:8add:e469 with SMTP id
 ffacd0b85a97d-43b97a58725mr5526371f8f.22.1774610235373; 
 Fri, 27 Mar 2026 04:17:15 -0700 (PDT)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43b919cf2b2sm15484227f8f.18.2026.03.27.04.17.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Mar 2026 04:17:14 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Jonathan Cameron <jonathan.cameron@huawei.com>
Subject: [PATCH v2 14/65] target/arm: GICv5 cpuif: Initial skeleton and GSB
 barrier insns
Date: Fri, 27 Mar 2026 11:16:09 +0000
Message-ID: <20260327111700.795099-15-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260327111700.795099-1-peter.maydell@linaro.org>
References: <20260327111700.795099-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x429.google.com
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

In the GICv5 architecture, part of the GIC is implemented inside the
CPU: this is the CPU interface, which presents software with system
instructions and system registers, and communicates with the external
part of the GIC (the Interrupt Routing Service, IRS) via an
architected stream interface where both sides can send commands and
receive responses.

Add the initial source files for the GICv5 CPU interface, with
initial content implementing just the two GSB GIC barrier
instructions, which are no-ops for QEMU.

Since we will not initially implement virtualization or the "legacy
GICv3" interface that can be provided to a VM guest, we don't have
the ICH_VCTLR_EL2 register and do not need to implement an accessfn
for the "trap if at EL1 and EL2 enabled and legacy GICv3 is enabled"
handling.  We will come back and add this later as part of the
legacy-GICv3 code.

(The GICv3 has a similar architecture with part of the GIC being in
the CPU and part external; for QEMU we implemented the CPU interface
in hw/intc/, but in retrospect I think this was something of a design
mistake, and for GICv5 I am going to stick a bit closer to how the
hardware architecture splits things up; hence this code is in
target/arm.)

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
---
 target/arm/cpu-features.h    |  6 +++++
 target/arm/helper.c          |  1 +
 target/arm/internals.h       |  3 +++
 target/arm/tcg/gicv5-cpuif.c | 43 ++++++++++++++++++++++++++++++++++++
 target/arm/tcg/meson.build   |  1 +
 5 files changed, 54 insertions(+)
 create mode 100644 target/arm/tcg/gicv5-cpuif.c

diff --git a/target/arm/cpu-features.h b/target/arm/cpu-features.h
index b683c9551a..e391b394ba 100644
--- a/target/arm/cpu-features.h
+++ b/target/arm/cpu-features.h
@@ -280,6 +280,7 @@ FIELD(ID_AA64PFR1, PFAR, 60, 4)
 FIELD(ID_AA64PFR2, MTEPERM, 0, 4)
 FIELD(ID_AA64PFR2, MTESTOREONLY, 4, 4)
 FIELD(ID_AA64PFR2, MTEFAR, 8, 4)
+FIELD(ID_AA64PFR2, GCIE, 12, 4)
 FIELD(ID_AA64PFR2, FPMR, 32, 4)
 
 FIELD(ID_AA64MMFR0, PARANGE, 0, 4)
@@ -1159,6 +1160,11 @@ static inline bool isar_feature_aa64_gcs(const ARMISARegisters *id)
     return FIELD_EX64_IDREG(id, ID_AA64PFR1, GCS) != 0;
 }
 
+static inline bool isar_feature_aa64_gcie(const ARMISARegisters *id)
+{
+    return FIELD_EX64_IDREG(id, ID_AA64PFR2, GCIE) != 0;
+}
+
 static inline bool isar_feature_aa64_tgran4_lpa2(const ARMISARegisters *id)
 {
     return FIELD_SEX64_IDREG(id, ID_AA64MMFR0, TGRAN4) >= 1;
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 7389f2988c..8faca360fc 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -6310,6 +6310,7 @@ void register_cp_regs_for_features(ARMCPU *cpu)
     if (tcg_enabled()) {
         define_tlb_insn_regs(cpu);
         define_at_insn_regs(cpu);
+        define_gicv5_cpuif_regs(cpu);
     }
 #endif
 
diff --git a/target/arm/internals.h b/target/arm/internals.h
index 8ec2750847..9bde58cf00 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1797,6 +1797,9 @@ void define_pm_cpregs(ARMCPU *cpu);
 /* Add the cpreg definitions for GCS cpregs */
 void define_gcs_cpregs(ARMCPU *cpu);
 
+/* Add the cpreg definitions for the GICv5 CPU interface */
+void define_gicv5_cpuif_regs(ARMCPU *cpu);
+
 /* Effective value of MDCR_EL2 */
 static inline uint64_t arm_mdcr_el2_eff(CPUARMState *env)
 {
diff --git a/target/arm/tcg/gicv5-cpuif.c b/target/arm/tcg/gicv5-cpuif.c
new file mode 100644
index 0000000000..7392a98c49
--- /dev/null
+++ b/target/arm/tcg/gicv5-cpuif.c
@@ -0,0 +1,43 @@
+/*
+ * GICv5 CPU interface
+ *
+ * Copyright (c) 2025 Linaro Limited
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#include "qemu/osdep.h"
+#include "cpu.h"
+#include "internals.h"
+#include "cpregs.h"
+
+static const ARMCPRegInfo gicv5_cpuif_reginfo[] = {
+    /*
+     * Barrier: wait until the effects of a cpuif system register
+     * write have definitely made it to the IRS (and will thus show up
+     * in cpuif reads from the IRS by this or other CPUs and in the
+     * status of IRQ, FIQ etc). For QEMU we do all interaction with
+     * the IRS synchronously, so we can make this a nop.
+     */
+    {   .name = "GSB_SYS", .state = ARM_CP_STATE_AA64,
+        .opc0 = 1, .opc1 = 0, .crn = 12, .crm = 0, .opc2 = 0,
+        .access = PL1_W, .type = ARM_CP_NOP,
+    },
+    /*
+     * Barrier: wait until the effects of acknowledging an interrupt
+     * (via GICR CDIA or GICR CDNMIA) are visible, including the
+     * effect on the {IRQ,FIQ,vIRQ,vFIQ} pending state. This is a
+     * weaker version of GSB SYS. Again, for QEMU this is a nop.
+     */
+    {   .name = "GSB_ACK", .state = ARM_CP_STATE_AA64,
+        .opc0 = 1, .opc1 = 0, .crn = 12, .crm = 0, .opc2 = 1,
+        .access = PL1_W, .type = ARM_CP_NOP,
+    },
+};
+
+void define_gicv5_cpuif_regs(ARMCPU *cpu)
+{
+    if (cpu_isar_feature(aa64_gcie, cpu)) {
+        define_arm_cp_regs(cpu, gicv5_cpuif_reginfo);
+    }
+}
diff --git a/target/arm/tcg/meson.build b/target/arm/tcg/meson.build
index 5f59156055..a67911f8dc 100644
--- a/target/arm/tcg/meson.build
+++ b/target/arm/tcg/meson.build
@@ -62,6 +62,7 @@ arm_common_ss.add(files(
 arm_common_system_ss.add(files(
   'cpregs-at.c',
   'debug.c',
+  'gicv5-cpuif.c',
   'hflags.c',
   'neon_helper.c',
   'psci.c',
-- 
2.43.0


