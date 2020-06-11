Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp1834317lfc;
        Thu, 11 Jun 2020 15:38:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyVmIdXfWgYinhYq3N5ciNqTDB6I8EsvYaVfVbXB7QeD/HR1IR7ddx4cUZ9A7Pe0T6/vRPs
X-Received: by 2002:a25:7b44:: with SMTP id w65mr12182301ybc.199.1591915088599;
        Thu, 11 Jun 2020 15:38:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591915088; cv=none;
        d=google.com; s=arc-20160816;
        b=iiseO4C4netiCBsczzeQFcvZHIOuhZMO0IKxoFT0MabWHSVwQhhFqjDJHa92NaeEMC
         /Nm3jU4Cxl8RKLGVZsMfTjZamhv3H4cqgtC9s2FFZ1T1ua3+pkhxdKCV/4jhT2FUeXzH
         5bZYjCayqrF0ghwnmqL/OI4h903S809hGBjwsCQmga9Sbrr+p1nL8Yg12umaowHZYsFO
         NoD9ZiGVjXdKuyHRTBJM9vw05EUocMxhSiboytPQ7g0c7rqWg+i1TbsbSp2dgEttcJ0w
         aaytg4uDA27xuYuk811Tbe4mYzdiNygK2VYOvXtJHhDntzPmXKEgdDdDgrt8p3MZ0Q+G
         WU5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:references
         :mime-version:message-id:in-reply-to:date:dkim-signature;
        bh=z5aae+ulEUK36/+EU0k/QX5fzrntAEb4TfxbdpR4q+E=;
        b=lBU62KY6nECZHo4zrPxMOFkBq+klC0pEQJEX6IZAOkqC0m2cbIBHAqt5TU9brdsMR9
         Agoe747bEiI5UgrAoc/xi5E6xnmjBPRM3XrA05HI0Q2u82GxLbDFt0GktLYIMdD90zNz
         W/QyiJysnYx8yBS4iBgkjK3EXbUneDKByyILcUnwymvOnB/gzmS9ZTJPpVAwT1srXt6r
         kbyEYTK0s0hdyN17z781NTnhWAUpBaysgUW0MfsXRQavWaXsMx6bS53eojxlv1SQgZVK
         YL8Ff6oURgdHFcDZJlj2AiXa0/UYpjwbUp94ixT1dbwdK17VHc/4IG4DzGYe+ovYWwWv
         Ym0A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20161025 header.b=Dq5yOKPs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b71si3135732ybg.277.2020.06.11.15.38.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 11 Jun 2020 15:38:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20161025 header.b=Dq5yOKPs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1]:52474 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jjVpn-00084F-9X
	for alex.bennee@linaro.org; Thu, 11 Jun 2020 18:38:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34048)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3lLDiXgsKCH0itljoofnpfohpphmf.dpnrfnv-bsnopohov.psh@flex--hskinnemoen.bounces.google.com>)
 id 1jjVin-000482-DM
 for qemu-arm@nongnu.org; Thu, 11 Jun 2020 18:30:53 -0400
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a]:34849)
 by eggs.gnu.org with esmtps (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3lLDiXgsKCH0itljoofnpfohpphmf.dpnrfnv-bsnopohov.psh@flex--hskinnemoen.bounces.google.com>)
 id 1jjVil-0004Cj-04
 for qemu-arm@nongnu.org; Thu, 11 Jun 2020 18:30:52 -0400
Received: by mail-yb1-xb4a.google.com with SMTP id w9so8339591ybt.2
 for <qemu-arm@nongnu.org>; Thu, 11 Jun 2020 15:30:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=z5aae+ulEUK36/+EU0k/QX5fzrntAEb4TfxbdpR4q+E=;
 b=Dq5yOKPsDL70LTwsJNsmbJzATvmIqQxoJwbKDgYFusQUAAcWBjh2AXW48dObXeKxoO
 uITiGsU+lDWrNkYN7EiwOknKgJveXEGqIA5CR/Mc4UfhSPuCGROHK+wvt0HDZ65hffxC
 GQuE37fq7rUh0maGsiXZwtm8yzB78P6xvK8MG4Y90+RmGbf/XoURsyhJHN8tPodOXEZD
 3zDiLPfZBQBOKxikn+SVXsKbAL5wSk0IGJhXsZ1oZDddNSwytV4BWBlIqtnx+KaW8UqM
 Q0//5pI8Nv5q6uBfQjgUVrU9/GHGQtNs9+erNNrM//1YCdXNkvmiwLlcpJdEr1KKyDys
 936g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=z5aae+ulEUK36/+EU0k/QX5fzrntAEb4TfxbdpR4q+E=;
 b=TDa1BLx/dgJL4VyrEEubNOPZGCp7t8EPr7UqsRHL81jnci4XiDBF29jyAnK0N2rZ8m
 XIrENGQxdIRlDknx67t6Q/twixtqUwqlEzR1RQIfMdhkie/XNhHaNVZRhxO7km9D8QRu
 ISnl1m5GuY00zdN9lI4S+mwVcfCvepkumPIXXEIqWOGgyUYnMZQqiNMmRPsGFZORx+Jm
 WLWcj0PF24R4uNVLMysGwBHCwO56Z9Iash38Fa8LTk5iiuM79unyhsTkCcQG3R5iWNkP
 PcDSlXplr4ec9XA7WcxWj7ncS6GFsCdiGoTmBgwvDH008XU+veplSwG17Fv/P+UGV5aA
 4yMA==
X-Gm-Message-State: AOAM5306lkFvgzkmnFTe7ZFpk0Oe+R1th8009aoWDNj3tg5kKQnLxCuy
 Tzr+lM+be3w+Wk0S4AtlHVbH9rSZnuNbucuZnA==
X-Received: by 2002:a25:d088:: with SMTP id
 h130mr18262495ybg.451.1591914644261; 
 Thu, 11 Jun 2020 15:30:44 -0700 (PDT)
Date: Thu, 11 Jun 2020 15:30:13 -0700
In-Reply-To: <20200611223016.259837-1-hskinnemoen@google.com>
Message-Id: <20200611223016.259837-10-hskinnemoen@google.com>
Mime-Version: 1.0
References: <20200611223016.259837-1-hskinnemoen@google.com>
X-Mailer: git-send-email 2.27.0.290.gba653c62da-goog
Subject: [PATCH v2 09/12] hw/mem: Stubbed out NPCM7xx Memory Controller model
From: Havard Skinnemoen <hskinnemoen@google.com>
To: peter.maydell@linaro.org, clg@kaod.org, joel@jms.id.au
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, Avi.Fishman@nuvoton.com, 
 kfting@nuvoton.com, Havard Skinnemoen <hskinnemoen@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b4a;
 envelope-from=3lLDiXgsKCH0itljoofnpfohpphmf.dpnrfnv-bsnopohov.psh@flex--hskinnemoen.bounces.google.com;
 helo=mail-yb1-xb4a.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -105
X-Spam_score: -10.6
X-Spam_bar: ----------
X-Spam_report: (-10.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 3kjlUOAAd3Ch

This just implements the bare minimum to cause the boot block to skip
memory intialization.

Change-Id: I26fd5f3b2af5d07a24911e7e58789f7b52f78d71
Reviewed-by: Tyrone Ting <kfting@nuvoton.com>
Signed-off-by: Havard Skinnemoen <hskinnemoen@google.com>
---
 MAINTAINERS                 |  2 +
 hw/arm/npcm7xx.c            | 11 +++++
 hw/mem/Makefile.objs        |  1 +
 hw/mem/npcm7xx_mc.c         | 83 +++++++++++++++++++++++++++++++++++++
 include/hw/arm/npcm7xx.h    |  2 +
 include/hw/mem/npcm7xx_mc.h | 35 ++++++++++++++++
 6 files changed, 134 insertions(+)
 create mode 100644 hw/mem/npcm7xx_mc.c
 create mode 100644 include/hw/mem/npcm7xx_mc.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 9814e7b4c4..9a289366ba 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -727,10 +727,12 @@ M: Tyrone Ting <kfting@nuvoton.com>
 L: qemu-arm@nongnu.org
 S: Supported
 F: hw/arm/npcm7xx*
+F: hw/mem/npcm7xx*
 F: hw/misc/npcm7xx*
 F: hw/nvram/npcm7xx*
 F: hw/timer/npcm7xx*
 F: include/hw/arm/npcm7xx*
+F: include/hw/mem/npcm7xx*
 F: include/hw/misc/npcm7xx*
 F: include/hw/nvram/npcm7xx*
 F: include/hw/timer/npcm7xx*
diff --git a/hw/arm/npcm7xx.c b/hw/arm/npcm7xx.c
index f9e3b5842b..54d84bafa1 100644
--- a/hw/arm/npcm7xx.c
+++ b/hw/arm/npcm7xx.c
@@ -46,6 +46,7 @@
 #define NPCM7XX_CPUP_BA         (0xF03FE000)
 #define NPCM7XX_GCR_BA          (0xF0800000)
 #define NPCM7XX_CLK_BA          (0xF0801000)
+#define NPCM7XX_MC_BA           (0xF0824000)
 
 /* Memory blocks at the end of the address space */
 #define NPCM7XX_RAM2_BA         (0xFFFD0000)
@@ -161,6 +162,8 @@ static void npcm7xx_init(Object *obj)
                           sizeof(s->key_storage), TYPE_NPCM7XX_KEY_STORAGE);
     sysbus_init_child_obj(obj, "otp2", OBJECT(&s->fuse_array),
                           sizeof(s->fuse_array), TYPE_NPCM7XX_FUSE_ARRAY);
+    sysbus_init_child_obj(obj, "mc", OBJECT(&s->mc), sizeof(s->mc),
+                          TYPE_NPCM7XX_MC);
 
     for (i = 0; i < ARRAY_SIZE(s->tim); i++) {
         sysbus_init_child_obj(obj, "tim[*]", OBJECT(&s->tim[i]),
@@ -258,6 +261,14 @@ static void npcm7xx_realize(DeviceState *dev, Error **errp)
     sysbus_mmio_map(SYS_BUS_DEVICE(&s->fuse_array), 0, NPCM7XX_OTP2_BA);
     npcm7xx_init_fuses(s);
 
+    /* Fake Memory Controller (MC) */
+    object_property_set_bool(OBJECT(&s->mc), true, "realized", &err);
+    if (err) {
+        error_propagate(errp, err);
+        return;
+    }
+    sysbus_mmio_map(SYS_BUS_DEVICE(&s->mc), 0, NPCM7XX_MC_BA);
+
     /* Timer Modules (TIM) */
     QEMU_BUILD_BUG_ON(ARRAY_SIZE(npcm7xx_tim_addr) != ARRAY_SIZE(s->tim));
     for (i = 0; i < ARRAY_SIZE(s->tim); i++) {
diff --git a/hw/mem/Makefile.objs b/hw/mem/Makefile.objs
index 56345befd0..9a33ef7b35 100644
--- a/hw/mem/Makefile.objs
+++ b/hw/mem/Makefile.objs
@@ -1,3 +1,4 @@
 common-obj-$(CONFIG_DIMM) += pc-dimm.o
 common-obj-y += memory-device.o
+common-obj-$(CONFIG_NPCM7XX) += npcm7xx_mc.o
 common-obj-$(CONFIG_NVDIMM) += nvdimm.o
diff --git a/hw/mem/npcm7xx_mc.c b/hw/mem/npcm7xx_mc.c
new file mode 100644
index 0000000000..03a7fb53dc
--- /dev/null
+++ b/hw/mem/npcm7xx_mc.c
@@ -0,0 +1,83 @@
+/*
+ * Nuvoton NPCM7xx Memory Controller stub
+ *
+ * Copyright 2020 Google LLC
+ *
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU General Public License
+ * version 2 as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
+ * GNU General Public License for more details.
+ */
+
+#include "qemu/osdep.h"
+
+#include "hw/mem/npcm7xx_mc.h"
+#include "qapi/error.h"
+#include "qemu/log.h"
+#include "qemu/module.h"
+#include "qemu/units.h"
+
+#define NPCM7XX_MC_REGS_SIZE (4 * KiB)
+
+static uint64_t npcm7xx_mc_read(void *opaque, hwaddr addr, unsigned int size)
+{
+    /*
+     * If bits 8..11 @ offset 0 are not zero, the boot block thinks the memory
+     * controller has already been initialized and will skip DDR training.
+     */
+    if (addr == 0) {
+        return 0x100;
+    }
+
+    qemu_log_mask(LOG_UNIMP, "%s: mostly unimplemented\n", __func__);
+
+    return 0;
+}
+
+static void npcm7xx_mc_write(void *opaque, hwaddr addr, uint64_t v,
+                             unsigned int size)
+{
+    qemu_log_mask(LOG_UNIMP, "%s: mostly unimplemented\n", __func__);
+}
+
+static const MemoryRegionOps npcm7xx_mc_ops = {
+    .read = npcm7xx_mc_read,
+    .write = npcm7xx_mc_write,
+    .endianness = DEVICE_LITTLE_ENDIAN,
+    .valid = {
+        .min_access_size = 4,
+        .max_access_size = 4,
+        .unaligned = false,
+    },
+};
+
+static void npcm7xx_mc_realize(DeviceState *dev, Error **errp)
+{
+    NPCM7xxMCState *s = NPCM7XX_MC(dev);
+
+    memory_region_init_io(&s->mmio, OBJECT(s), &npcm7xx_mc_ops, s, "regs",
+                          NPCM7XX_MC_REGS_SIZE);
+    sysbus_init_mmio(&s->parent, &s->mmio);
+}
+
+static void npcm7xx_mc_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+
+    dc->desc = "NPCM7xx Memory Controller stub";
+    dc->realize = npcm7xx_mc_realize;
+}
+
+static const TypeInfo npcm7xx_mc_types[] = {
+    {
+        .name = TYPE_NPCM7XX_MC,
+        .parent = TYPE_SYS_BUS_DEVICE,
+        .instance_size = sizeof(NPCM7xxMCState),
+        .class_init = npcm7xx_mc_class_init,
+    },
+};
+DEFINE_TYPES(npcm7xx_mc_types);
diff --git a/include/hw/arm/npcm7xx.h b/include/hw/arm/npcm7xx.h
index 360cd965a7..8f49f7015c 100644
--- a/include/hw/arm/npcm7xx.h
+++ b/include/hw/arm/npcm7xx.h
@@ -17,6 +17,7 @@
 
 #include "hw/boards.h"
 #include "hw/cpu/a9mpcore.h"
+#include "hw/mem/npcm7xx_mc.h"
 #include "hw/misc/npcm7xx_clk.h"
 #include "hw/misc/npcm7xx_gcr.h"
 #include "hw/nvram/npcm7xx_otp.h"
@@ -65,6 +66,7 @@ typedef struct NPCM7xxState {
     NPCM7xxTimerCtrlState tim[3];
     NPCM7xxOTPState     key_storage;
     NPCM7xxOTPState     fuse_array;
+    NPCM7xxMCState      mc;
 } NPCM7xxState;
 
 #define TYPE_NPCM7XX    "npcm7xx"
diff --git a/include/hw/mem/npcm7xx_mc.h b/include/hw/mem/npcm7xx_mc.h
new file mode 100644
index 0000000000..8781f5c979
--- /dev/null
+++ b/include/hw/mem/npcm7xx_mc.h
@@ -0,0 +1,35 @@
+/*
+ * Nuvoton NPCM7xx Memory Controller stub
+ *
+ * Copyright 2020 Google LLC
+ *
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU General Public License
+ * version 2 as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
+ * GNU General Public License for more details.
+ */
+#ifndef NPCM7XX_MC_H
+#define NPCM7XX_MC_H
+
+#include "exec/memory.h"
+#include "hw/sysbus.h"
+
+/**
+ * struct NPCM7xxMCState - Device state for the memory controller.
+ * @parent: System bus device.
+ * @mmio: Memory region through which registers are accessed.
+ */
+typedef struct NPCM7xxMCState {
+    SysBusDevice parent;
+
+    MemoryRegion mmio;
+} NPCM7xxMCState;
+
+#define TYPE_NPCM7XX_MC "npcm7xx-mc"
+#define NPCM7XX_MC(obj) OBJECT_CHECK(NPCM7xxMCState, (obj), TYPE_NPCM7XX_MC)
+
+#endif /* NPCM7XX_MC_H */
-- 
2.27.0.290.gba653c62da-goog

