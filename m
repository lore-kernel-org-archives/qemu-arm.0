Received: by 2002:a19:6a18:0:0:0:0:0 with SMTP id u24csp299843lfu;
        Mon, 4 Apr 2022 09:03:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxyxhhq8Novk8BrYv7b9qJoQBaUopr8mteCn8v2WUX/LwXNg0eaSX3+ym3Mubohb/fJaOUc
X-Received: by 2002:a25:9e81:0:b0:624:3b8a:514b with SMTP id p1-20020a259e81000000b006243b8a514bmr487105ybq.266.1649088208482;
        Mon, 04 Apr 2022 09:03:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1649088208; cv=none;
        d=google.com; s=arc-20160816;
        b=u8SQrc5m4lK5xYopZc4Ixqg6yatsX2a5+Ako0sH0qB7SCtlwnvvkT+q7u7S/5Xilcp
         FcLQYwHiaKQc8JeP1KIQ3fBxLlOMH8EQ9B0XYh6Tyi5W07VbwYZFTxiLXoXIg3NoUJXW
         37XnvSgEiqahs/AkGoO783UiKtnwCeb5LgiJKkVsr/fPnOyt3Z8xGJkNSXNxuHBIoaj5
         vElq5PKChwHmxWTpAaCzKEM4gb9WI5ok9wxS8Ag78mEVenspSbden3II05qD1CRoLQ12
         t8/bz0rW2YhJkYYCJl+XLU9ArnBl6MZCUUen71uLHdHtJM32pEsIHBZDzR6on4TLf8j0
         K4XQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=kpRPQxjDKjaM54pfCMvhIMPe2SMElvaXNWBmDpwL9Ng=;
        b=04iXFeqrQCgjboHHoCal6JWbcTenA9uQ8rsSSOk3B+3pOAJYV+aCd/0MQr8FTl/WX/
         +D2q1hYxZq9Y8Je+psexMfrH4HUyeUWy8iacpQzT8LVE5lNUNuRj2igeFxfPmF7zEANW
         IOke0R116yS01vE5cRp59pApRrV+6Sw5JqL5WGMYBAgTf5VAEcEI2A+csi+P37tsNdPn
         JZ8XygzuEY/jQjhFLDS0qtV+Mp1+FafBGkJNZIALGPCdPA5aVA0TGii7qqUNzhDh0hGc
         zKJN3R0X3dRozPTTtaAj7ZMl1AEipI5W5GkIte6ZYnqTCNPrqZT+oV3K4QNeCXTosbjp
         XlJg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="XGBaYK/O";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u7-20020a814707000000b002dc3c591dcasi8109743ywa.1.2022.04.04.09.03.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 04 Apr 2022 09:03:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="XGBaYK/O";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56948 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nbPAt-0001mC-QI
	for alex.bennee@linaro.org; Mon, 04 Apr 2022 12:03:27 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44840)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nbOvK-00053J-Kj
 for qemu-arm@nongnu.org; Mon, 04 Apr 2022 11:47:23 -0400
Received: from [2a00:1450:4864:20::333] (port=39513
 helo=mail-wm1-x333.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nbOvH-0000Xy-2U
 for qemu-arm@nongnu.org; Mon, 04 Apr 2022 11:47:22 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 bi13-20020a05600c3d8d00b0038c2c33d8f3so7978371wmb.4
 for <qemu-arm@nongnu.org>; Mon, 04 Apr 2022 08:47:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kpRPQxjDKjaM54pfCMvhIMPe2SMElvaXNWBmDpwL9Ng=;
 b=XGBaYK/O3T5YSInTRxQVpBq89fj/bAotUc3mnp1k6aYIcqY3lDL9XyQZmNisFh9LmF
 UNFQkT569Ohxqp5XfXWE49z8/7ETpBonhHHrlcK9WO+KXs4dU9ATa15UclIkcMbhjQ9D
 7MI0kEd/xXbjXzSxi3GnWGkWq+vY0VyMS9BA8vsARWYlxuAzq6+K+3Fw/5Vp19if2ghP
 9vyBMuSobqsrNa91DiW/AADiszZZ/ivFEX2kVbuZtCtVj6vcovQ9KZ5n1Rg3C7rio9Mx
 j1Ki5Nx0TLQVkt+A6DvLBqo547PJQAzrtcAGwDK0eaZamK9KZ7lMdAd4LIwR55K1f5rf
 A1kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kpRPQxjDKjaM54pfCMvhIMPe2SMElvaXNWBmDpwL9Ng=;
 b=xYOkKdH4CdRukQiTOMWOnfJbzZAupN6Jhoqi5imNdFkFC96GMlag7z3MMTzPKKIRJC
 SlpJ8ILESYUJiMFHSGxWeEK8675XLmy7boUpJrK09/UnnK3vnsHoNOWoJnSuLL4C4pP4
 wglNUKJtBuGUGwmdV+pGtCB1kPZOh/8g1xPvtrhYbwub1eP+y3jB2SBIyvmA28v+pFj8
 fecYGmK+mS138LIjQ/YJ37dFa6+BHWn22bvYbpVUcJh/WPdZgREvIcyeM87eNqNiL87X
 k2MwsiIlOATHB6ykrNMAIB3NtDzfA/CdInN/9o8wkWKqkxFFcNOQo6yNdCHy60gB7Rsv
 +9Gg==
X-Gm-Message-State: AOAM532r6bQmRw4lc5v2aMJ+n7RpfP7EaqgU3xxYFJrhQZD2SYLRVywM
 jbh3MvlDYsZqez+PU12auRlVaTLy3c1nRw==
X-Received: by 2002:a1c:2744:0:b0:382:a9b7:1c8a with SMTP id
 n65-20020a1c2744000000b00382a9b71c8amr86071wmn.187.1649087237344; 
 Mon, 04 Apr 2022 08:47:17 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 c8-20020a056000184800b002040e925afasm11731347wri.59.2022.04.04.08.47.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Apr 2022 08:47:16 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-7.1 17/18] hw/arm/exynos4210: Put combiners into state
 struct
Date: Mon,  4 Apr 2022 16:46:57 +0100
Message-Id: <20220404154658.565020-18-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220404154658.565020-1-peter.maydell@linaro.org>
References: <20220404154658.565020-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::333
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Igor Mitsyanko <i.mitsyanko@gmail.com>,
 Zongyuan Li <zongyuan.li@smartx.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: BZm9F6uw/QFI

Switch the creation of the combiner devices to the new-style
"embedded in state struct" approach, so we can easily refer
to the object elsewhere during realize.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/arm/exynos4210.h           |  3 ++
 include/hw/intc/exynos4210_combiner.h | 57 +++++++++++++++++++++++++++
 hw/arm/exynos4210.c                   | 20 +++++-----
 hw/intc/exynos4210_combiner.c         | 31 +--------------
 4 files changed, 72 insertions(+), 39 deletions(-)
 create mode 100644 include/hw/intc/exynos4210_combiner.h

diff --git a/include/hw/arm/exynos4210.h b/include/hw/arm/exynos4210.h
index f24617f681d..d38be8767b3 100644
--- a/include/hw/arm/exynos4210.h
+++ b/include/hw/arm/exynos4210.h
@@ -28,6 +28,7 @@
 #include "hw/sysbus.h"
 #include "hw/cpu/a9mpcore.h"
 #include "hw/intc/exynos4210_gic.h"
+#include "hw/intc/exynos4210_combiner.h"
 #include "hw/core/split-irq.h"
 #include "target/arm/cpu-qom.h"
 #include "qom/object.h"
@@ -105,6 +106,8 @@ struct Exynos4210State {
     qemu_or_irq cpu_irq_orgate[EXYNOS4210_NCPUS];
     A9MPPrivState a9mpcore;
     Exynos4210GicState ext_gic;
+    Exynos4210CombinerState int_combiner;
+    Exynos4210CombinerState ext_combiner;
     SplitIRQ splitter[EXYNOS4210_NUM_SPLITTERS];
 };
 
diff --git a/include/hw/intc/exynos4210_combiner.h b/include/hw/intc/exynos4210_combiner.h
new file mode 100644
index 00000000000..429844fed41
--- /dev/null
+++ b/include/hw/intc/exynos4210_combiner.h
@@ -0,0 +1,57 @@
+/*
+ * Samsung exynos4210 Interrupt Combiner
+ *
+ * Copyright (c) 2000 - 2011 Samsung Electronics Co., Ltd.
+ * All rights reserved.
+ *
+ * Evgeny Voevodin <e.voevodin@samsung.com>
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms of the GNU General Public License as published by the
+ * Free Software Foundation; either version 2 of the License, or (at your
+ * option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
+ * See the GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License along
+ * with this program; if not, see <http://www.gnu.org/licenses/>.
+ */
+
+#ifndef HW_INTC_EXYNOS4210_COMBINER
+#define HW_INTC_EXYNOS4210_COMBINER
+
+#include "hw/sysbus.h"
+
+/*
+ * State for each output signal of internal combiner
+ */
+typedef struct CombinerGroupState {
+    uint8_t src_mask;            /* 1 - source enabled, 0 - disabled */
+    uint8_t src_pending;        /* Pending source interrupts before masking */
+} CombinerGroupState;
+
+#define TYPE_EXYNOS4210_COMBINER "exynos4210.combiner"
+OBJECT_DECLARE_SIMPLE_TYPE(Exynos4210CombinerState, EXYNOS4210_COMBINER)
+
+/* Number of groups and total number of interrupts for the internal combiner */
+#define IIC_NGRP 64
+#define IIC_NIRQ (IIC_NGRP * 8)
+#define IIC_REGSET_SIZE 0x41
+
+struct Exynos4210CombinerState {
+    SysBusDevice parent_obj;
+
+    MemoryRegion iomem;
+
+    struct CombinerGroupState group[IIC_NGRP];
+    uint32_t reg_set[IIC_REGSET_SIZE];
+    uint32_t icipsr[2];
+    uint32_t external;          /* 1 means that this combiner is external */
+
+    qemu_irq output_irq[IIC_NGRP];
+};
+
+#endif
diff --git a/hw/arm/exynos4210.c b/hw/arm/exynos4210.c
index 05b28cf5905..27c6ab27123 100644
--- a/hw/arm/exynos4210.c
+++ b/hw/arm/exynos4210.c
@@ -624,25 +624,23 @@ static void exynos4210_realize(DeviceState *socdev, Error **errp)
     }
 
     /* Internal Interrupt Combiner */
-    dev = qdev_new("exynos4210.combiner");
-    busdev = SYS_BUS_DEVICE(dev);
-    sysbus_realize_and_unref(busdev, &error_fatal);
+    busdev = SYS_BUS_DEVICE(&s->int_combiner);
+    sysbus_realize(busdev, &error_fatal);
     for (n = 0; n < EXYNOS4210_MAX_INT_COMBINER_OUT_IRQ; n++) {
         sysbus_connect_irq(busdev, n,
                            qdev_get_gpio_in(DEVICE(&s->a9mpcore), n));
     }
-    exynos4210_combiner_get_gpioin(&s->irqs, dev, 0);
+    exynos4210_combiner_get_gpioin(&s->irqs, DEVICE(&s->int_combiner), 0);
     sysbus_mmio_map(busdev, 0, EXYNOS4210_INT_COMBINER_BASE_ADDR);
 
     /* External Interrupt Combiner */
-    dev = qdev_new("exynos4210.combiner");
-    qdev_prop_set_uint32(dev, "external", 1);
-    busdev = SYS_BUS_DEVICE(dev);
-    sysbus_realize_and_unref(busdev, &error_fatal);
+    qdev_prop_set_uint32(DEVICE(&s->ext_combiner), "external", 1);
+    busdev = SYS_BUS_DEVICE(&s->ext_combiner);
+    sysbus_realize(busdev, &error_fatal);
     for (n = 0; n < EXYNOS4210_MAX_INT_COMBINER_OUT_IRQ; n++) {
         sysbus_connect_irq(busdev, n, qdev_get_gpio_in(DEVICE(&s->ext_gic), n));
     }
-    exynos4210_combiner_get_gpioin(&s->irqs, dev, 1);
+    exynos4210_combiner_get_gpioin(&s->irqs, DEVICE(&s->ext_combiner), 1);
     sysbus_mmio_map(busdev, 0, EXYNOS4210_EXT_COMBINER_BASE_ADDR);
 
     /* Initialize board IRQs. */
@@ -844,6 +842,10 @@ static void exynos4210_init(Object *obj)
 
     object_initialize_child(obj, "a9mpcore", &s->a9mpcore, TYPE_A9MPCORE_PRIV);
     object_initialize_child(obj, "ext-gic", &s->ext_gic, TYPE_EXYNOS4210_GIC);
+    object_initialize_child(obj, "int-combiner", &s->int_combiner,
+                            TYPE_EXYNOS4210_COMBINER);
+    object_initialize_child(obj, "ext-combiner", &s->ext_combiner,
+                            TYPE_EXYNOS4210_COMBINER);
 }
 
 static void exynos4210_class_init(ObjectClass *klass, void *data)
diff --git a/hw/intc/exynos4210_combiner.c b/hw/intc/exynos4210_combiner.c
index 83b42b9bce1..a289510bdb8 100644
--- a/hw/intc/exynos4210_combiner.c
+++ b/hw/intc/exynos4210_combiner.c
@@ -31,7 +31,7 @@
 #include "hw/sysbus.h"
 #include "migration/vmstate.h"
 #include "qemu/module.h"
-
+#include "hw/intc/exynos4210_combiner.h"
 #include "hw/arm/exynos4210.h"
 #include "hw/hw.h"
 #include "hw/irq.h"
@@ -48,36 +48,7 @@
 #define DPRINTF(fmt, ...) do {} while (0)
 #endif
 
-#define    IIC_NGRP        64            /* Internal Interrupt Combiner
-                                            Groups number */
-#define    IIC_NIRQ        (IIC_NGRP * 8)/* Internal Interrupt Combiner
-                                            Interrupts number */
 #define IIC_REGION_SIZE    0x108         /* Size of memory mapped region */
-#define IIC_REGSET_SIZE    0x41
-
-/*
- * State for each output signal of internal combiner
- */
-typedef struct CombinerGroupState {
-    uint8_t src_mask;            /* 1 - source enabled, 0 - disabled */
-    uint8_t src_pending;        /* Pending source interrupts before masking */
-} CombinerGroupState;
-
-#define TYPE_EXYNOS4210_COMBINER "exynos4210.combiner"
-OBJECT_DECLARE_SIMPLE_TYPE(Exynos4210CombinerState, EXYNOS4210_COMBINER)
-
-struct Exynos4210CombinerState {
-    SysBusDevice parent_obj;
-
-    MemoryRegion iomem;
-
-    struct CombinerGroupState group[IIC_NGRP];
-    uint32_t reg_set[IIC_REGSET_SIZE];
-    uint32_t icipsr[2];
-    uint32_t external;          /* 1 means that this combiner is external */
-
-    qemu_irq output_irq[IIC_NGRP];
-};
 
 static const VMStateDescription vmstate_exynos4210_combiner_group_state = {
     .name = "exynos4210.combiner.groupstate",
-- 
2.25.1

