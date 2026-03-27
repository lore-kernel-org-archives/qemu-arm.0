Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAAF010ED659
	for <qemu-arm@archiver.kernel.org>; Fri, 27 Mar 2026 11:24:57 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w65Bj-0006PP-5T; Fri, 27 Mar 2026 07:17:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1w65Bd-0006Ly-Pb
 for qemu-arm@nongnu.org; Fri, 27 Mar 2026 07:17:09 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1w65Ba-0007Xa-J7
 for qemu-arm@nongnu.org; Fri, 27 Mar 2026 07:17:09 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-48538c5956bso18874535e9.0
 for <qemu-arm@nongnu.org>; Fri, 27 Mar 2026 04:17:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1774610225; x=1775215025; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5qPLM2gLCdt83kwhZKIHo0FfWvDkC4ZVgw2/WPDb1Y0=;
 b=q40FJV2jTSCfrIT3/p6g7OaRsQXgGWpN1Ov6/dLn62kxfnVJB4cfl8xL40u++uU5Wb
 h7SDCQaVxnVl0cS7RvgULjqiDFts235fgsCGzJNonuX79PoFN55QUPWzUSHLA1/zQNNs
 cVUImbdWA44KZTy5xsyhR3I5iIhEIdmCFoRJ4qoR1a8//He38+fHgB6AZIwe2mikpfpc
 xa0zoUKxSM0poskc2FeCL3LSF+rCgXLsDKoy3eiEamRphT2iZd4CLXrxqtXQgPpfwscB
 C7fozvFQ/f/DEZ77YlODu0vEy6sS3VPPjtdiKsT7U342f3roQ+d45BV9Z4vqyqzPl0OX
 Ykpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774610225; x=1775215025;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=5qPLM2gLCdt83kwhZKIHo0FfWvDkC4ZVgw2/WPDb1Y0=;
 b=mUWzruVv8qTFw88cZ8UN9X+0YK63YGwt7Dip8smo7t/x01dzxGSElxRBfUdWav6RM1
 YMZw+DBFwQjczU52ite/VOLv6beXceIlqUQVEHmHwewDtLo0zB51lmf+Kg8hRKgODxZr
 daCjE8WsgZ5Ku0vSw7uwkMnuohLvqXg0/P6fcpyCzsQUH7/HYt9xvJS/emilFAc6pNc2
 bSM/02bJyUwVGxkHoc1Hks3TA+VzVy0lDKMHYrTP18EFeYjs1IftN/JJhsnceg00F3UH
 3xESjwQy6awEy8yRHeOrzShH3XF8yx3qR4HzuiqK9iucw1DRh1AiuHQczEJcQRZlGRE3
 IVRg==
X-Gm-Message-State: AOJu0YyqyzQQdTCZMaL6NbJ2CwyR+mCr3BaNQ4Cy/+KroL4Gp0MntY/g
 PcFfezHMIon94VZRXMU1z7OuSuZdROu3XBlzOEsLZam+TwI9CL0kxwLO89RliqAkRKyPdt9Eb3M
 g30NUBrA=
X-Gm-Gg: ATEYQzxwZEVq5LF92P7V9ySm5+UwOWFmKZ7f7AjYMRXxgHU1+nY0Z57s3TjgpmjmaRh
 WN6Adu7U4O2OmmqKFZJ5uoe6h6NGqYNWhXBCQ6DjxTkNtI4uRcWJENVd/gljlgMRY3cC74NE4Gk
 /4yWayZ4NH1o9eiQKB7ocqqpUb8ppzMtSCuHcZ3vVbhstEZoShl4De2sZbnPnFCfW4IxBQ3k9PB
 AN3kr5KbsLK1Ozy0jhAdlC0lviFYOav/duSGPYlc7rIr7oh5YhR2zsfOjI5xOasA+evKL+xjNqc
 /CnHmU6aRpr3O3cGGah5VFwAqu56a5/orKBRvD6cYCPUOJqQCw3suPmRh8hObfwChhe9EnS5/Gm
 ThTW5a9dd+yqQZkiHY8tZPGdUVUiUzf1PJRxWeNZ93swV8i5pebD0a9EF8pE5Yz3wHUUUUZbnJv
 8LDiYYHJbAUnWCrcadEFkraJndS9dHmU8Ki1qVwl49FIhHxILUYVndoQ5OTmz6v50nytp5Kb8fV
 O2uyZcbZFdz+2JLKKKkZeNiRhlOtL0=
X-Received: by 2002:a05:600d:1c:b0:485:6e55:28b0 with SMTP id
 5b1f17b1804b1-48722be447fmr68753875e9.12.1774610224729; 
 Fri, 27 Mar 2026 04:17:04 -0700 (PDT)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43b919cf2b2sm15484227f8f.18.2026.03.27.04.17.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Mar 2026 04:17:04 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Jonathan Cameron <jonathan.cameron@huawei.com>
Subject: [PATCH v2 03/65] hw/intc: Skeleton of GICv5 IRS classes
Date: Fri, 27 Mar 2026 11:15:58 +0000
Message-ID: <20260327111700.795099-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260327111700.795099-1-peter.maydell@linaro.org>
References: <20260327111700.795099-1-peter.maydell@linaro.org>
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
Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
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


