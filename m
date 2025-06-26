Received: by 2002:a05:7300:232a:b0:178:84eb:402c with SMTP id r42csp83377dye;
        Thu, 26 Jun 2025 00:58:10 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVVUXMtWkJ4ppQJcgeoCo/C6P5Jm4ZRP/jSWOREwk4HgSTStg6zOQ6QFR8mcLs19ltWsH3Lu9iw0FGuEA==@linaro.org
X-Google-Smtp-Source: AGHT+IHtLSdHQaZX44MdHXSNsL61K/OM5Xd5ihAgyOyN+k2AAgt2p1rOdIxNMAXWs3LnOFk6ouwh
X-Received: by 2002:a05:6000:2a03:b0:3a4:e393:11e2 with SMTP id ffacd0b85a97d-3a6f2eac64emr1448085f8f.34.1750924690576;
        Thu, 26 Jun 2025 00:58:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750924690; cv=none;
        d=google.com; s=arc-20240605;
        b=BCFOTG9Yrn+T4ZZ9tKFQlqzWmTlbys/6L/Is4rCruuSTgPSW1cdlpn5U11zBSh3j3v
         7t/4lc8IBJyCY1+WQgmXQWv765BihXl3A7TSuQHGUfBQHrG6nDuD1/RaY7mCxKl3bAvX
         XAikBmQUQxWV/b1WgnHNFx6n7J2JasY8HqXg8kCHVA3qb2Q7XlTvqpNSFGJdFT4QKT6f
         0w8+NKJCmpC9ePSHz7/KJe+JoOSi872U6OT+nOS2KIOT5if/mfklMlmK8md1W+ky8lsO
         VaUddzUaAoaJHqMMuDxQOzLuTLH5vzOA4z9sOaBA/5IF+QO5c+nzyEXGJwLDoHqV1M3A
         3R+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=TrbZDWSTSiSrRvM5wUcFlFP4hP2PdU9MmMTcCPt6fMU=;
        fh=3E+GgkJ59sv88GyUpaKWpV4DoJlJz+B5Ev7H4uQXan0=;
        b=Ney09HpUrF0vABz0/rC/OIGQxKptFsGG/eAbD4iJbB2CNZ310NBZ70JGAFUO37OPOH
         cCXMbeobauqu+Z6PIo7MEg3vBgE0Om87JmGnNmWbof0LOj2vMPXRUoYI604KiHku8//t
         AHhdkW0s+Oo3SHstCuRcQHq6nzSHLaAB8bUuBCfOp+GCb8FO/I1xGuGOgXX4d0BwUsjw
         RWHxKym2VqRnldLFZASuwdqDXv5ZNj+M7gzliD/lBiq0a4qE9j6i09VAknrML1swj0oy
         iw8BfPm6zvoeQmWKQTiD0yqe9QyF6K/W4f9kYlIH5Fq+DEGq7dAwQJmXxqnW4jAXkiHv
         yMlw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ffacd0b85a97d-3a6e810fe1bsi4552492f8f.793.2025.06.26.00.58.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 26 Jun 2025 00:58:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1uUhUC-00042P-Gk; Thu, 26 Jun 2025 03:57:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kane_chen@aspeedtech.com>)
 id 1uUhU9-0003u2-RN; Thu, 26 Jun 2025 03:57:30 -0400
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kane_chen@aspeedtech.com>)
 id 1uUhU7-0003xl-Rc; Thu, 26 Jun 2025 03:57:29 -0400
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Thu, 26 Jun
 2025 15:57:11 +0800
Received: from mail.aspeedtech.com (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Thu, 26 Jun 2025 15:57:11 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Steven Lee <steven_lee@aspeedtech.com>, Troy Lee
 <leetroy@gmail.com>, Jamin Lin <jamin_lin@aspeedtech.com>, Andrew Jeffery
 <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>, "open
 list:ASPEED BMCs" <qemu-arm@nongnu.org>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>
CC: <troy_lee@aspeedtech.com>, Kane-Chen-AS <kane_chen@aspeedtech.com>
Subject: [PATCH v1 1/3] hw/misc/aspeed_otp: Add ASPEED OTP memory device model
Date: Thu, 26 Jun 2025 15:57:08 +0800
Message-ID: <20250626075711.1589039-2-kane_chen@aspeedtech.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250626075711.1589039-1-kane_chen@aspeedtech.com>
References: <20250626075711.1589039-1-kane_chen@aspeedtech.com>
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
X-TUID: QL8RY9Myax0b

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
 include/hw/misc/aspeed_otpmem.h | 33 ++++++++++++
 hw/misc/aspeed_otpmem.c         | 91 +++++++++++++++++++++++++++++++++
 hw/misc/meson.build             |  1 +
 3 files changed, 125 insertions(+)
 create mode 100644 include/hw/misc/aspeed_otpmem.h
 create mode 100644 hw/misc/aspeed_otpmem.c

diff --git a/include/hw/misc/aspeed_otpmem.h b/include/hw/misc/aspeed_otpmem.h
new file mode 100644
index 0000000000..64cd4d1a7c
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
+#ifndef ASPEED_OTPMEM_H
+#define ASPEED_OTPMEM_H
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
+#endif /* ASPEED_OTPMEM_H */
diff --git a/hw/misc/aspeed_otpmem.c b/hw/misc/aspeed_otpmem.c
new file mode 100644
index 0000000000..a77d4186f8
--- /dev/null
+++ b/hw/misc/aspeed_otpmem.c
@@ -0,0 +1,91 @@
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
+static void aspeed_otpmem_init_storage(uint8_t *storage, uint64_t size)
+{
+    uint32_t *p;
+    int i, num;
+
+    num = size / sizeof(uint32_t);
+    p = (uint32_t *)storage;
+    for (i = 0; i < num; i++) {
+        p[i] = (i % 2 == 0) ? 0x00000000 : 0xFFFFFFFF;
+    }
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
+
+    s->storage = g_malloc(s->size);
+
+    aspeed_otpmem_init_storage(s->storage, s->size);
+
+    memory_region_init_io(&s->mmio, OBJECT(dev), &aspeed_otpmem_ops,
+                          s, "aspeed.otpmem", s->size);
+    address_space_init(&s->as, &s->mmio, NULL);
+}
+
+static const Property aspeed_otpmem_properties[] = {
+    DEFINE_PROP_UINT64("size", AspeedOTPMemState, size, OTPMEM_SIZE),
+};
+
+static void aspeed_otpmem_class_init(ObjectClass *klass, const void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+    dc->realize = aspeed_otpmem_realize;
+    device_class_set_props(dc, aspeed_otpmem_properties);
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
 
-- 
2.43.0

