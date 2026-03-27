Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD48E10ED65C
	for <qemu-arm@archiver.kernel.org>; Fri, 27 Mar 2026 11:20:29 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w65C0-0006iY-1i; Fri, 27 Mar 2026 07:17:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1w65Bo-0006TF-Qw
 for qemu-arm@nongnu.org; Fri, 27 Mar 2026 07:17:20 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1w65Bm-0007tV-QY
 for qemu-arm@nongnu.org; Fri, 27 Mar 2026 07:17:20 -0400
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-439b9cf8cb5so1918993f8f.0
 for <qemu-arm@nongnu.org>; Fri, 27 Mar 2026 04:17:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1774610236; x=1775215036; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GBC/rL6SP5hiYwiIrNz8t3Gc0wlQxRngYUrU09KceNM=;
 b=AdgUgXPYMvoY+y+GmKrcLV+kumWGQBQkXPdnSkgtFw8RoIJ3e1yYN0sckLCYQ4LCEI
 k5neLOl2Y0QTV6E17DINdwYz/DPyAyfNmmGViIH81wKc+Bvg1uNXWRveS6YYMrZ6TSGb
 ITqBNU5N5lgx3IiUxhq+bqWd/RfvmVZei+mM0is1SFqTMEJeMMcc9P984jMe71VMkZna
 DXKvSnuq/Ir+aeMV0IaJGHGgmMwyn1N2eW2tQJOjYYAd8GyX81MZFKQJ+YZTHKX+IGlE
 vfZtziPsQeveG6ZYR9xDMPgz1Nh/LdL8ZDu2M/xGH5DsLnTBcGCGEX/WQkDAOL7JJSlv
 T9/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774610236; x=1775215036;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=GBC/rL6SP5hiYwiIrNz8t3Gc0wlQxRngYUrU09KceNM=;
 b=p+UBvFnUKNWg12ZcIRmXkBIaHW36TLRKjwfl5NUnYqDj9CoGwJTUuydAr5MV0XJ9NW
 KSdOWvgDWcNjsL7rRhndU9iuohFyqUjC0eTpxR1gPXObrdxM8XAqB5VQhyQzhMG2HVbA
 3kBTWZdBi/NLNmjDlp8u0P2wASGUbkUKEEPE3pQhPWy5scAdFcJHZStfwUOowYcY+PAV
 +vN5HFFqgtJ6ytbBd/EBTsqz9kc1QJU0YPPW1sRAgqB/8Nd3FL1yLD9j6SymdzSLuzEW
 LdB5aIt0H4w+gGFZ0ZGWupWL2Pg+97GG+pPK+6g8wuvL5aTm6wkCmNIJJ09R/yp6K12q
 ybzw==
X-Gm-Message-State: AOJu0YwhmgWDDkikmiYY1YI8lzzX6Tvf301NKNxemu40WYu06S8CPtmx
 LzygisnlYWnOUaHudDWaXoOe/EDDHLZT/mque2+hyqUYRomFiPPlQ2zEmrHL4aNAkDltA0DkitC
 AcWS9cFo=
X-Gm-Gg: ATEYQzxgi7/xpCap+AkCecyoPyugvU1J64dwBAWdEF1WKdEJ6qy4Pfi/wjrxH3+vBUj
 EMu9f8We3aRBh5hfMGZuf7VEtjFdAV4qB5fNvslxUPxfC8q3Z9iNDs2KKqq7fmySMgon8DTe4DY
 YxDQ7UUyTz4IMN0ShyVA9A+xehFJFBTE4FeQMBNmuwaIPsua9qyrwO85AUsSptsY3DEFSzXnq0I
 pXfnyTuJIoENEvDmdbqUHRbJ+21+zBj87ZU8nbpynUNBt82WQQfREewRZi49+ond6G+f0+29M9T
 yuDDrmiTL7bpvAs+okWyCN8g/BU7CkTQTh10yDAEZ9GvZyUS2hDkJWxkYzlv0bqARxCAhZ5AmDT
 0UCG6XkVFxtSe94E3zQwr/lvBYOmztNc1TeEDXzKQYnZ8dC/Q9mZcPPAiWZPCqM+mAxfuu79O7W
 55eVqx9gUNAwVGohLlAd7OjB4tjh0uRrilwuDQSwK5fpNqLPNeDuxcDA58Kd4m4NzA5sKm1cNd+
 hMEvrRRroxH6LMNxMnyxKyS5BB5XqY=
X-Received: by 2002:a05:6000:144f:b0:43b:998c:d82b with SMTP id
 ffacd0b85a97d-43b9ea34871mr3246050f8f.19.1774610236192; 
 Fri, 27 Mar 2026 04:17:16 -0700 (PDT)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43b919cf2b2sm15484227f8f.18.2026.03.27.04.17.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Mar 2026 04:17:15 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Jonathan Cameron <jonathan.cameron@huawei.com>
Subject: [PATCH v2 15/65] target/arm: Set up pointer to GICv5 in each CPU
Date: Fri, 27 Mar 2026 11:16:10 +0000
Message-ID: <20260327111700.795099-16-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260327111700.795099-1-peter.maydell@linaro.org>
References: <20260327111700.795099-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x436.google.com
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

The qdev link property array gives the IRS a pointer to each CPU that
is connected to it, but the CPU also needs a pointer to the IRS so
that it can issue commands.  Set this up in a similar way to how we
do it for the GICv3: have the GIC's realize function call
gicv5_set_gicv5state() to set a pointer in the CPUARMState.

The CPU will only allow this link to be made if it actually
implements the GICv5 CPU interface; it will be the responsibility of
the board code to configure the CPU to have a GICv5 cpuif if it wants
to connect a GICv5 to it.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
---
 hw/intc/arm_gicv5_common.c         |  9 +++++++++
 include/hw/intc/arm_gicv5_stream.h | 32 ++++++++++++++++++++++++++++++
 target/arm/cpu.c                   | 16 +++++++++++++++
 target/arm/cpu.h                   |  2 ++
 4 files changed, 59 insertions(+)
 create mode 100644 include/hw/intc/arm_gicv5_stream.h

diff --git a/hw/intc/arm_gicv5_common.c b/hw/intc/arm_gicv5_common.c
index 7f15e3c7c8..54d75db014 100644
--- a/hw/intc/arm_gicv5_common.c
+++ b/hw/intc/arm_gicv5_common.c
@@ -8,6 +8,7 @@
 
 #include "qemu/osdep.h"
 #include "hw/intc/arm_gicv5_common.h"
+#include "hw/intc/arm_gicv5_stream.h"
 #include "hw/core/qdev-properties.h"
 #include "qapi/error.h"
 #include "trace.h"
@@ -129,6 +130,14 @@ static void gicv5_common_realize(DeviceState *dev, Error **errp)
         return;
     }
 
+    for (int i = 0; i < cs->num_cpus; i++) {
+        if (!gicv5_set_gicv5state(cs->cpus[i], cs)) {
+            error_setg(errp,
+                       "CPU %d does not implement GICv5 CPU interface", i);
+            return;
+        }
+    }
+
     address_space_init(&cs->dma_as, cs->dma, "gicv5-sysmem");
 
     trace_gicv5_common_realize(cs->irsid, cs->num_cpus,
diff --git a/include/hw/intc/arm_gicv5_stream.h b/include/hw/intc/arm_gicv5_stream.h
new file mode 100644
index 0000000000..7257ddde90
--- /dev/null
+++ b/include/hw/intc/arm_gicv5_stream.h
@@ -0,0 +1,32 @@
+/*
+ * Interface between GICv5 CPU interface and GICv5 IRS
+ * Loosely modelled on the GICv5 Stream Protocol interface documented
+ * in the GICv5 specification.
+ *
+ * Copyright (c) 2025 Linaro Limited
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#ifndef HW_INTC_ARM_GICV5_STREAM_H
+#define HW_INTC_ARM_GICV5_STREAM_H
+
+#include "target/arm/cpu-qom.h"
+
+typedef struct GICv5Common GICv5Common;
+
+/**
+ * gicv5_set_gicv5state
+ * @cpu: CPU object to tell about its IRS
+ * @cs: the GIC IRS it is connected to
+ *
+ * Set the CPU object's GICv5 pointer to point to this GIC IRS.  The
+ * IRS must call this when it is realized, for each CPU it is
+ * connected to.
+ *
+ * Returns true on success, false if the CPU doesn't implement the
+ * GICv5 CPU interface.
+ */
+bool gicv5_set_gicv5state(ARMCPU *cpu, GICv5Common *cs);
+
+#endif
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index ccc47c8a9a..4044bce5b6 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -41,6 +41,7 @@
 #include "hw/core/boards.h"
 #ifdef CONFIG_TCG
 #include "hw/intc/armv7m_nvic.h"
+#include "hw/intc/arm_gicv5_stream.h"
 #endif /* CONFIG_TCG */
 #endif /* !CONFIG_USER_ONLY */
 #include "system/tcg.h"
@@ -1085,6 +1086,21 @@ static void arm_cpu_dump_state(CPUState *cs, FILE *f, int flags)
     }
 }
 
+#ifndef CONFIG_USER_ONLY
+bool gicv5_set_gicv5state(ARMCPU *cpu, GICv5Common *cs)
+{
+    /*
+     * Set this CPU's gicv5state pointer to point to the GIC that we are
+     * connected to.
+     */
+    if (!cpu_isar_feature(aa64_gcie, cpu)) {
+        return false;
+    }
+    cpu->env.gicv5state = cs;
+    return true;
+}
+#endif
+
 uint64_t arm_build_mp_affinity(int idx, uint8_t clustersz)
 {
     uint32_t Aff1 = idx / clustersz;
diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 657ff4ab20..16de0ebfa8 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -812,6 +812,8 @@ typedef struct CPUArchState {
     const struct arm_boot_info *boot_info;
     /* Store GICv3CPUState to access from this struct */
     void *gicv3state;
+    /* Similarly, for a GICv5Common */
+    void *gicv5state;
 #else /* CONFIG_USER_ONLY */
     /* For usermode syscall translation.  */
     bool eabi;
-- 
2.43.0


