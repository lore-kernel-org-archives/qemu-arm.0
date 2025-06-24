Received: by 2002:a05:7301:19ab:b0:175:694b:cb76 with SMTP id mc43csp2925686dyb;
        Mon, 23 Jun 2025 19:23:18 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU965C29k/vKcq7rnHthmTDsHgHDDvVZCfm/g5YgS9mLAMzvUg+iCUQqntakculIrp7n1Aoj5FBAc2SYg==@linaro.org
X-Google-Smtp-Source: AGHT+IGR23K7U/d3y10oY8r+96V6cPp/2e+ag26mB31Rl+WvP5QqY8hGI4EK/OTUk5AIhdWPOFFr
X-Received: by 2002:a05:6214:2b82:b0:6f8:c53f:48e with SMTP id 6a1803df08f44-6fd3873eb36mr29919106d6.0.1750731798374;
        Mon, 23 Jun 2025 19:23:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750731798; cv=none;
        d=google.com; s=arc-20240605;
        b=bN8vZZYB1D2lsYH0ctWToKDPbeoOhLQl3UkD4g39HGv2sfyw7nWEWMHoKTFnykB0Fr
         pdh9m/AzWAAq7brCuEuuPrN1FmojdyjnDx0aky5okM5AI6/JYB5yoF/TSvGTKGbfQXgJ
         S6eI7y7SKcYkh2Ny5K2LgVKSY5jBCDmRibucfzvYYpHo0CK5CBkJKx4RciEYsYxiyi4j
         eCwCf/giykkaqJ6g3NqnJDab1YYb57pCqAuH4yqWDzC9LDQPJBSIGxhL3MjfNMnwTmH4
         V9ilOlRhktUNIgBPFkEpx1PbvJvqPIJJK1ReCpUTuZn9jOY0/xyQ/C0kRTWYaqjTSCFB
         +WbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=b4TDNadwbEQBZBobnPLLHwZ5fxgNe8qhwpfogE3aCPE=;
        fh=3E+GgkJ59sv88GyUpaKWpV4DoJlJz+B5Ev7H4uQXan0=;
        b=kkTeRmwfOLL3jGEmvnEHh36pcANmdcFr2afyNBM0kuLnJ7VSvehZaElcB1kkwTY+u+
         3PN3lBgTgnMR24wneWKsO12UJxyUE6e5PvAdwkLv5tl8cJCOMuQGr3uCsULFwhlLaFmE
         pD31xvZef+211TSU8K/C61lYUgOdTcJ/R7ZQ+62UT+nviBUB8py0VJ7nEd7NN/b3YnD0
         4wm9yUJ7vmGNRrlAZnoeJ3bMgz2De9GcF/t5NxIaVjg6LJrHxosekOzYpDVrZL518fIA
         KzoppXqJZvjNllXjR4wPeD+WnmuqT+SwliURc3q6eq9FJY+X78Bw0hP2SQ3Is7cHm2HF
         O+8w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6fd09576236si96699286d6.308.2025.06.23.19.23.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 23 Jun 2025 19:23:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1uTtJ0-0006ef-V5; Mon, 23 Jun 2025 22:22:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kane_chen@aspeedtech.com>)
 id 1uTtIz-0006dw-LS; Mon, 23 Jun 2025 22:22:37 -0400
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kane_chen@aspeedtech.com>)
 id 1uTtIx-0005OR-9e; Mon, 23 Jun 2025 22:22:37 -0400
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Tue, 24 Jun
 2025 10:22:19 +0800
Received: from mail.aspeedtech.com (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Tue, 24 Jun 2025 10:22:19 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Steven Lee <steven_lee@aspeedtech.com>, Troy Lee
 <leetroy@gmail.com>, Jamin Lin <jamin_lin@aspeedtech.com>, Andrew Jeffery
 <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>, "open
 list:ASPEED BMCs" <qemu-arm@nongnu.org>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>
CC: <troy_lee@aspeedtech.com>, Kane-Chen-AS <kane_chen@aspeedtech.com>
Subject: [RFC v6 1/3] hw/misc/aspeed_otp: Add ASPEED OTP memory device model
Date: Tue, 24 Jun 2025 10:22:16 +0800
Message-ID: <20250624022219.3704712-2-kane_chen@aspeedtech.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250624022219.3704712-1-kane_chen@aspeedtech.com>
References: <20250624022219.3704712-1-kane_chen@aspeedtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: pass client-ip=211.20.114.72;
 envelope-from=kane_chen@aspeedtech.com; helo=TWMBX01.aspeed.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_FAIL=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-to:  Kane Chen <kane_chen@aspeedtech.com>
From:  Kane Chen via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: BBqbwORy0Zrf

From: Kane-Chen-AS <kane_chen@aspeedtech.com>

Introduce a QEMU device model for ASPEED's One-Time Programmable (OTP)
memory.

This model simulates a word-addressable OTP region used for secure
fuse storage. The OTP memory can operate with an internal memory
buffer.

The OTP model provides a memory-like interface through a dedicated
AddressSpace, allowing other device models (e.g., SBC) to issue
transactions as if accessing a memory-mapped region.

Signed-off-by: Kane-Chen-AS <kane_chen@aspeedtech.com>
---
 hw/misc/aspeed_otpmem.c         | 85 +++++++++++++++++++++++++++++++++
 hw/misc/meson.build             |  1 +
 include/hw/misc/aspeed_otpmem.h | 33 +++++++++++++
 3 files changed, 119 insertions(+)
 create mode 100644 hw/misc/aspeed_otpmem.c
 create mode 100644 include/hw/misc/aspeed_otpmem.h

diff --git a/hw/misc/aspeed_otpmem.c b/hw/misc/aspeed_otpmem.c
new file mode 100644
index 0000000000..b13b87fae8
--- /dev/null
+++ b/hw/misc/aspeed_otpmem.c
@@ -0,0 +1,85 @@
+/*
+ *  ASPEED OTP (One-Time Programmable) memory
+ *
+ *  Copyright (C) 2025 Aspeed
+ *
+ *  SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#include "qemu/osdep.h"
+#include "qemu/log.h"
+#include "qapi/error.h"
+#include "trace.h"
+#include "system/block-backend-global-state.h"
+#include "system/block-backend-io.h"
+#include "hw/misc/aspeed_otpmem.h"
+
+static uint64_t aspeed_otpmem_read(void *opaque, hwaddr offset, unsigned size)
+{
+    AspeedOTPMemState *s = opaque;
+    uint64_t val = 0;
+
+    memcpy(&val, s->storage + offset, size);
+
+    return val;
+}
+
+static void aspeed_otpmem_write(void *opaque, hwaddr offset,
+                                uint64_t val, unsigned size)
+{
+    AspeedOTPMemState *s = opaque;
+
+    memcpy(s->storage + offset, &val, size);
+}
+
+static const MemoryRegionOps aspeed_otpmem_ops = {
+    .read = aspeed_otpmem_read,
+    .write = aspeed_otpmem_write,
+    .endianness = DEVICE_LITTLE_ENDIAN,
+    .valid.min_access_size = 1,
+    .valid.max_access_size = 4,
+};
+
+static void aspeed_otpmem_realize(DeviceState *dev, Error **errp)
+{
+    AspeedOTPMemState *s = ASPEED_OTPMEM(dev);
+    const size_t size = OTPMEM_SIZE;
+    int i, num;
+    uint32_t *p;
+
+    s->storage = g_malloc(size);
+    if (!s->storage) {
+        error_setg(errp, "Failed to allocate OTP memory storage buffer");
+        return;
+    }
+
+    num = size / sizeof(uint32_t);
+    p = (uint32_t *)s->storage;
+    for (i = 0; i < num; i++) {
+        p[i] = (i % 2 == 0) ? 0x00000000 : 0xFFFFFFFF;
+    }
+
+    memory_region_init_io(&s->mmio, OBJECT(dev), &aspeed_otpmem_ops,
+                          s, "aspeed.otpmem", size);
+    address_space_init(&s->as, &s->mmio, NULL);
+}
+
+static void aspeed_otpmem_class_init(ObjectClass *klass, const void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+    dc->realize = aspeed_otpmem_realize;
+}
+
+static const TypeInfo aspeed_otpmem_info = {
+    .name          = TYPE_ASPEED_OTPMEM,
+    .parent        = TYPE_DEVICE,
+    .instance_size = sizeof(AspeedOTPMemState),
+    .class_init    = aspeed_otpmem_class_init,
+};
+
+static void aspeed_otpmem_register_types(void)
+{
+    type_register_static(&aspeed_otpmem_info);
+}
+
+type_init(aspeed_otpmem_register_types)
diff --git a/hw/misc/meson.build b/hw/misc/meson.build
index 6d47de482c..ed1eaaa2ad 100644
--- a/hw/misc/meson.build
+++ b/hw/misc/meson.build
@@ -136,6 +136,7 @@ system_ss.add(when: 'CONFIG_ASPEED_SOC', if_true: files(
   'aspeed_sbc.c',
   'aspeed_sdmc.c',
   'aspeed_xdma.c',
+  'aspeed_otpmem.c',
   'aspeed_peci.c',
   'aspeed_sli.c'))
 
diff --git a/include/hw/misc/aspeed_otpmem.h b/include/hw/misc/aspeed_otpmem.h
new file mode 100644
index 0000000000..a598e707a9
--- /dev/null
+++ b/include/hw/misc/aspeed_otpmem.h
@@ -0,0 +1,33 @@
+/*
+ *  ASPEED OTP (One-Time Programmable) memory
+ *
+ *  Copyright (C) 2025 Aspeed
+ *
+ *  SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#ifndef ASPEED_OTPMMEM_H
+#define ASPEED_OTPMMEM_H
+
+#include "system/memory.h"
+#include "hw/block/block.h"
+#include "system/memory.h"
+#include "system/address-spaces.h"
+
+#define OTPMEM_SIZE 0x4000
+#define TYPE_ASPEED_OTPMEM "aspeed.otpmem"
+OBJECT_DECLARE_SIMPLE_TYPE(AspeedOTPMemState, ASPEED_OTPMEM)
+
+typedef struct AspeedOTPMemState {
+    DeviceState parent_obj;
+
+    uint64_t size;
+
+    AddressSpace as;
+
+    MemoryRegion mmio;
+
+    uint8_t *storage;
+} AspeedOTPMemState;
+
+#endif /* ASPEED_OTPMMEM_H */
-- 
2.43.0

