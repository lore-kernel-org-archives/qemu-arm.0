Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6C4FEC1113
	for <qemu-arm@archiver.kernel.org>; Mon, 23 Feb 2026 17:04:22 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vuZKP-0001Xl-5V; Mon, 23 Feb 2026 12:02:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vuZKO-0001Vk-0a
 for qemu-arm@nongnu.org; Mon, 23 Feb 2026 12:02:36 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vuZKM-00008Q-4U
 for qemu-arm@nongnu.org; Mon, 23 Feb 2026 12:02:35 -0500
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-4837634de51so20463445e9.1
 for <qemu-arm@nongnu.org>; Mon, 23 Feb 2026 09:02:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1771866152; x=1772470952; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=vu8NALcSqni2ue7OROnSn9kpXExYg7A/4C4f2kfjzgg=;
 b=LPLP+3l+tUi0qBS0eBbfOOotj4RgjWARTp7Ygr3K68du3dOWIFjsdgmo48MluAfkuh
 O6nxsXO+HqzsfCujjNXjBZeCV8p3j0IVe1zSRZJHQ3XOs1eYRWAF54lw3Qg2weiBGwp6
 xI928RP/ar7w8Umi7///vV2K+OQsvxA30/VJLh9i9LOntiWWkH2X4YLyDyBIeMiYxf1e
 eNKnrYNauW9+QRGdMXGafSxGOCd1zgJeXG1efMhI+36XiRFFmCa5wfYnbOx2Se0hR8m9
 jMUYFH3l5A1DUzURbo33CGxDULDFQxnEYsO+OUuyWA5I/LUT9cGCFqeUi0H3LcwFIZON
 HjHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771866152; x=1772470952;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=vu8NALcSqni2ue7OROnSn9kpXExYg7A/4C4f2kfjzgg=;
 b=SSSPya+1Cp+ydeafbIxLOMeSIz8aMKQvGIOJtMXVzUB2OQYgXRMVnZBm5DhHv3vmH8
 kIDHluBk9m6WczODzgBMzeQIzRl+0UP1Q0qIwBxbzhUznU35wdmhJrU47JW+rtgm0sk3
 8UCnDu657IO1+Xx+3jT7ThvFUH67sUdCN101le93B99x2ht+BGI6CuZcRVj08ID0XFrc
 P21MIzb+22oWBwriYdglWd/YNSQXaKi6+uaQOLJbY7Xqvc+Eo8NVdYzw81FEs69am9qb
 t5XVN5qi9EytwfqIYls83PLtsWifAgVeM8dIbUkkRicvI12douxjetanwKIxVGI7V0tR
 momg==
X-Gm-Message-State: AOJu0YxDPwM+CFnnWa4HRYVqwRr5FzV/gkRfL9vVEvxFJ8eMt2Oaqmdj
 DI74jLDsTp8yk9wEquqttTrYHzgA0dnedCV8OljRxqvn7gj50IH8RUeNjmuqafzzTFhsuwgsNbE
 h65ah
X-Gm-Gg: AZuq6aKqJbsqSxq8ZiQGTECQcFU2MK2hdR42vDf7CcNZJL7ejtekSnya6E2pX3FNsJf
 zP6JQsbaH//yQG3Q9BylxveiMn0XSpq29WpMInaewJH0jEDWI9uSsNSKS9HWdcl8n9wpUxRn2wn
 ELQHnIL4kaeG8Vc0BmxX9+AJ6jEFR0IWxZ26GMkPiT8y7TsM7HGKQzRBJGcTNJjjW8bPZk3yiTa
 bvVefbgsQiHPmiF6ZjQWqiX5dsVeOFOtUWE2Q8bFXkVs9cKageEfHe1dD8jcVIKdMe1tc83A+W3
 MPZeXhzY4c+tXrW4OD0DAD3yBlhRtISXccS5V1ubArXDQyYNdjRnzzMlSOJfktvu09OwAHPO6mA
 IOiO8rsVdB7X7labb4EMKhchftiZexj3tHWTcjfz4oeVOFM73eogfggNLuZ7Vdzs+YYdXWd0qj8
 nhgcZlN1i9AH9itfa533LuftVtD/aBpvHYqOfJ6uwI0zjlZouk+91r1vBPToU7pl5lHQ3wgv5Ta
 TXbHm9u7z+ru3XPhhmKdFxwGJeFlyM=
X-Received: by 2002:a05:600c:3553:b0:480:53ce:45d3 with SMTP id
 5b1f17b1804b1-483a962e3edmr169574395e9.18.1771866150293; 
 Mon, 23 Feb 2026 09:02:30 -0800 (PST)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483a9b21ceasm200155625e9.0.2026.02.23.09.02.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Feb 2026 09:02:29 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 13/65] target/arm: GICv5 cpuif: Initial skeleton and GSB
 barrier insns
Date: Mon, 23 Feb 2026 17:01:20 +0000
Message-ID: <20260223170212.441276-14-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260223170212.441276-1-peter.maydell@linaro.org>
References: <20260223170212.441276-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x333.google.com
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
index 6bfab90981..5e7cc039aa 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -6315,6 +6315,7 @@ void register_cp_regs_for_features(ARMCPU *cpu)
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
index 0000000000..76c2577c09
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
+     * effect on the {IRQ,FIQ,vIRQ,vFIQ} pending state. This is
+     * a weaker version of GSB SYS. Again, for QEMU this is a nop.
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


