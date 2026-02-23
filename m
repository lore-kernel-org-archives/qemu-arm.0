Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACF31EC1112
	for <qemu-arm@archiver.kernel.org>; Mon, 23 Feb 2026 17:08:10 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vuZK9-0001BX-Tk; Mon, 23 Feb 2026 12:02:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vuZK9-0001Aq-91
 for qemu-arm@nongnu.org; Mon, 23 Feb 2026 12:02:21 -0500
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vuZK6-0008UD-BO
 for qemu-arm@nongnu.org; Mon, 23 Feb 2026 12:02:20 -0500
Received: by mail-wm1-x344.google.com with SMTP id
 5b1f17b1804b1-48370174e18so24809285e9.2
 for <qemu-arm@nongnu.org>; Mon, 23 Feb 2026 09:02:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1771866137; x=1772470937; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=QC2jCmUmDa22pq2M5e1IUAC/xLyvzU6A+/CopHKbGoc=;
 b=r+jNM1/qTLbNKGTBa1+KkH5GxpFsJRaVb6+AKqUzF1tDdeegUVkPgHyDGLHyVhKjyF
 CKvuOTJYjmsjLZ/SlKSwwLmje1E7bdyNdUK/axWINDiIzKQEV91POGAgYZXAdz2g4dDQ
 K8lTsvH8jOMHSpCROlPO7H3sHRjwX+9cZWXmByTBkttxmlzIZ5PSBeYB8T5BRcz6eFJE
 O3th+LeyaoAPR27Dg4N2sW1RaQ8nJUXhId0Pc5q3JrdFh+PP0KnjrcmSte6CvMfgM4Cd
 ciEQP+XREEsTYj698PMlYiDYooiRtbT84GLcAHEbdbejgBhnAVi4BbGnG8NuSsi+PA92
 IvSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771866137; x=1772470937;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=QC2jCmUmDa22pq2M5e1IUAC/xLyvzU6A+/CopHKbGoc=;
 b=mIRnelnQ4krutSXW66Or9eZHHdbZrA68ukGCTRq/5C8UZZEkilsi9llQc5T9wAww5r
 3KeJSZe8yCLxDGzC+6obgcqcWJRMOaw4oo2nlgV3kw1JiNcMtGnK5kS5isTNWt2qmNVj
 K1mNUq0u1ptw3vhH3aj3Degv1FqfIyxa4zIniZh4zIy+AYp7puQ/zY7axHoG4I25DHpI
 40juIqhuwexRTvPmyU4u4blPk6DpYyPp3J9CgipRlf7RMqx6Wk/WRG5C5C5ouqFtxkHL
 EJvWcRo0OoMEdRBk4Z2sIFSjnxfyNjxk5N4b5jGDKmvvdCHX308bKFompn0E+HlQrEL5
 NoLw==
X-Gm-Message-State: AOJu0YwwPXAJIiT525u0aV136J+ASBjdnDfTvIGRMlpFxuDfw5og5rhS
 +1i6KlcsX0sHeMTVngO+zMvDtfG42LOgwgGvQQK6rDKn6lfNtSe94wpnlxxKtEVeL1mKXM/uu4U
 4p9JLYKM=
X-Gm-Gg: AZuq6aIIIWrQpKronraTWndno/msKIA8+sK/g/r7Cbn4jIUwSpPO9bjq6tc5Uu8A15i
 kgWWxPrOPcHAQ5PDe2GfXs2w+KRYjp+sfY/lSxumIIkWvzgI5/soRI6oAGHTBUcGVQ4zqB5m/kl
 gnuvAH7xp3xly/YK+gYa69hgwtvvdY7/I4Yak1Bri6Pw78IZTIu441kZSGF4kB0bHuc9dZrELBE
 CspmDY6C8KRbtm8liwt9vSQoXjI+FNG6EFqWveE/XMrwMb46s2MNky07YM69MUDyqmn0Wgp1pgk
 DYyleKnYYauZ+x+i4pz1aF/aoaC0YQGGjkFFENbCjmnv+o0G2mKotV0Wrzpp9y9grTHN3DhbK/C
 rdcEiaFqImR4ZOJuAzChAJ3TvWPosvL2khKlVukcfI+4Gu8BWg1VCBQyh/wai47Qufw+RA/w1qO
 f02QzIp6X9tiCa+RlEY30WVXGtX3rDIlPJO0mwivNCcNdtWAY2LGiN/z97HKBlPe4mgJ/nhG1mi
 Rzvhw4oJfewwIstqS6V+CDyCdn88ec=
X-Received: by 2002:a05:600c:8b27:b0:480:69ae:f0e9 with SMTP id
 5b1f17b1804b1-483a95eb3bamr185842405e9.16.1771866136485; 
 Mon, 23 Feb 2026 09:02:16 -0800 (PST)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483a9b21ceasm200155625e9.0.2026.02.23.09.02.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Feb 2026 09:02:15 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 02/65] hw/intc: Skeleton of GICv5 IRS classes
Date: Mon, 23 Feb 2026 17:01:09 +0000
Message-ID: <20260223170212.441276-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260223170212.441276-1-peter.maydell@linaro.org>
References: <20260223170212.441276-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::344;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x344.google.com
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

This commit adds the skeleton of the classes for the GICv5 IRS
(Interrupt Routing Service).  Since the IRS is the main (and only
non-optional) part of the GICv5 outside the CPU, we call it simply
"GICv5", in line with how we've handled the GICv3.

Since we're definitely going to need to have support for KVM VMs
where we present the guest with a GICv5, we use the same split
between an abstract "common" and a concrete specific-to-TCG child
class that we have for the various GICv3 components.  This avoids
having to refactor out the base class later.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/Kconfig                    |  4 +++
 hw/intc/arm_gicv5.c                | 39 ++++++++++++++++++++++++++++++
 hw/intc/arm_gicv5_common.c         | 31 ++++++++++++++++++++++++
 hw/intc/meson.build                |  4 +++
 include/hw/intc/arm_gicv5.h        | 32 ++++++++++++++++++++++++
 include/hw/intc/arm_gicv5_common.h | 31 ++++++++++++++++++++++++
 6 files changed, 141 insertions(+)
 create mode 100644 hw/intc/arm_gicv5.c
 create mode 100644 hw/intc/arm_gicv5_common.c
 create mode 100644 include/hw/intc/arm_gicv5.h
 create mode 100644 include/hw/intc/arm_gicv5_common.h

diff --git a/hw/intc/Kconfig b/hw/intc/Kconfig
index 9f456d7e43..a3241fc1eb 100644
--- a/hw/intc/Kconfig
+++ b/hw/intc/Kconfig
@@ -35,6 +35,10 @@ config ARM_GIC_KVM
     bool
     depends on ARM_GIC && KVM
 
+config ARM_GICV5
+    bool
+    select MSI_NONBROKEN
+
 config XICS
     bool
 
diff --git a/hw/intc/arm_gicv5.c b/hw/intc/arm_gicv5.c
new file mode 100644
index 0000000000..f9dab710d3
--- /dev/null
+++ b/hw/intc/arm_gicv5.c
@@ -0,0 +1,39 @@
+/*
+ * ARM GICv5 emulation: Interrupt Routing Service (IRS)
+ *
+ * Copyright (c) 2025 Linaro Limited
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#include "qemu/osdep.h"
+#include "hw/intc/arm_gicv5.h"
+
+OBJECT_DEFINE_TYPE(GICv5, gicv5, ARM_GICV5, ARM_GICV5_COMMON)
+
+static void gicv5_reset_hold(Object *obj, ResetType type)
+{
+    GICv5 *s = ARM_GICV5(obj);
+    GICv5Class *c = ARM_GICV5_GET_CLASS(s);
+
+    if (c->parent_phases.hold) {
+        c->parent_phases.hold(obj, type);
+    }
+}
+
+static void gicv5_init(Object *obj)
+{
+}
+
+static void gicv5_finalize(Object *obj)
+{
+}
+
+static void gicv5_class_init(ObjectClass *oc, const void *data)
+{
+    ResettableClass *rc = RESETTABLE_CLASS(oc);
+    GICv5Class *gc = ARM_GICV5_CLASS(oc);
+
+    resettable_class_set_parent_phases(rc, NULL, gicv5_reset_hold, NULL,
+                                       &gc->parent_phases);
+}
diff --git a/hw/intc/arm_gicv5_common.c b/hw/intc/arm_gicv5_common.c
new file mode 100644
index 0000000000..b0194f7f26
--- /dev/null
+++ b/hw/intc/arm_gicv5_common.c
@@ -0,0 +1,31 @@
+/*
+ * Common base class for GICv5 IRS
+ *
+ * Copyright (c) 2025 Linaro Limited
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#include "qemu/osdep.h"
+#include "hw/intc/arm_gicv5_common.h"
+
+OBJECT_DEFINE_ABSTRACT_TYPE(GICv5Common, gicv5_common, ARM_GICV5_COMMON, SYS_BUS_DEVICE)
+
+static void gicv5_common_reset_hold(Object *obj, ResetType type)
+{
+}
+
+static void gicv5_common_init(Object *obj)
+{
+}
+
+static void gicv5_common_finalize(Object *obj)
+{
+}
+
+static void gicv5_common_class_init(ObjectClass *oc, const void *data)
+{
+    ResettableClass *rc = RESETTABLE_CLASS(oc);
+
+    rc->phases.hold = gicv5_common_reset_hold;
+}
diff --git a/hw/intc/meson.build b/hw/intc/meson.build
index 96742df090..e4ddc5107f 100644
--- a/hw/intc/meson.build
+++ b/hw/intc/meson.build
@@ -12,6 +12,10 @@ system_ss.add(when: 'CONFIG_ARM_GICV3', if_true: files(
   'arm_gicv3_its.c',
   'arm_gicv3_redist.c',
 ))
+system_ss.add(when: 'CONFIG_ARM_GICV5', if_true: files(
+  'arm_gicv5_common.c',
+  'arm_gicv5.c',
+))
 system_ss.add(when: 'CONFIG_ALLWINNER_A10_PIC', if_true: files('allwinner-a10-pic.c'))
 system_ss.add(when: 'CONFIG_ASPEED_SOC', if_true: files('aspeed_vic.c'))
 system_ss.add(when: 'CONFIG_ASPEED_SOC', if_true: files('aspeed_intc.c'))
diff --git a/include/hw/intc/arm_gicv5.h b/include/hw/intc/arm_gicv5.h
new file mode 100644
index 0000000000..3cd9652f6f
--- /dev/null
+++ b/include/hw/intc/arm_gicv5.h
@@ -0,0 +1,32 @@
+/*
+ * ARM GICv5 emulation: Interrupt Routing Service (IRS)
+ *
+ * Copyright (c) 2025 Linaro Limited
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#ifndef HW_INTC_ARM_GICV5_H
+#define HW_INTC_ARM_GICV5_H
+
+#include "qom/object.h"
+#include "hw/core/sysbus.h"
+#include "hw/intc/arm_gicv5_common.h"
+
+#define TYPE_ARM_GICV5 "arm-gicv5"
+
+OBJECT_DECLARE_TYPE(GICv5, GICv5Class, ARM_GICV5)
+
+/*
+ * This class is for TCG-specific state for the GICv5.
+ */
+struct GICv5 {
+    GICv5Common parent_obj;
+};
+
+struct GICv5Class {
+    GICv5CommonClass parent_class;
+    ResettablePhases parent_phases;
+};
+
+#endif
diff --git a/include/hw/intc/arm_gicv5_common.h b/include/hw/intc/arm_gicv5_common.h
new file mode 100644
index 0000000000..d2243c7660
--- /dev/null
+++ b/include/hw/intc/arm_gicv5_common.h
@@ -0,0 +1,31 @@
+/*
+ * Common base class for GICv5 IRS
+ *
+ * Copyright (c) 2025 Linaro Limited
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#ifndef HW_INTC_ARM_GICV5_COMMON_H
+#define HW_INTC_ARM_GICV5_COMMON_H
+
+#include "qom/object.h"
+#include "hw/core/sysbus.h"
+
+#define TYPE_ARM_GICV5_COMMON "arm-gicv5-common"
+
+OBJECT_DECLARE_TYPE(GICv5Common, GICv5CommonClass, ARM_GICV5_COMMON)
+
+/*
+ * This class is for common state that will eventually be shared
+ * between TCG and KVM implementations of the GICv5.
+ */
+struct GICv5Common {
+    SysBusDevice parent_obj;
+};
+
+struct GICv5CommonClass {
+    SysBusDeviceClass parent_class;
+};
+
+#endif
-- 
2.43.0


