Received: by 2002:a17:504:749a:b0:1be9:327d:8ee3 with SMTP id a26csp510853njk;
        Wed, 16 Apr 2025 20:11:10 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWltDcnOBdaht/Utf6AQRRNNffwmjoSgIthRFLQIVXmXAva9/WqKb3pTq5cKuZF1ptN382j53wLwOwlkw==@linaro.org
X-Google-Smtp-Source: AGHT+IGdclfPfSoRfK2Y9skCFtlom55hqc0KdKVG8yKgKBvVc3w1kBEVuORoDSRLPI6OD+R7K8ix
X-Received: by 2002:ad4:5cab:0:b0:6d4:e0a:230e with SMTP id 6a1803df08f44-6f2b2f389d8mr66786296d6.16.1744859470127;
        Wed, 16 Apr 2025 20:11:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1744859470; cv=none;
        d=google.com; s=arc-20240605;
        b=eoayX7Ss/fY94KXoPsA2OLPI90YH0OVm3QixEdgvrqg9aJXspAhI4Im60/GVTr6M+9
         XH5jK+sdT32YeMHiaWA0SOzxP8Ac/kzFBrdEKtLtjbdUUdCuTnhQKYg1F8bZUmX8y6xV
         FdALOTIPPVqfaSnYbcyq8w1IiWAr05GpyLR3lHeKA/xozJ+wh5u1q1TNHLTfnz1+ydlx
         C7Cyo004fDq9x/b26zc+f56n0Dv8SaPtLpHE/lvHN9j0qPDcc/Ym3LYOpR5h+xg8Z5pV
         evVemaA4xIbkZQVDdpNt9y2NKPVVdZoavi6u6KRRLREaysa/Q8IRccaju8dN7ZGch8b5
         6UhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=djUkYb5cEKtm2vQ5HA5jLxSOp7umrEQ+H89N60eQqhU=;
        fh=3E+GgkJ59sv88GyUpaKWpV4DoJlJz+B5Ev7H4uQXan0=;
        b=dwYrgZUtqSG+51a0OOv3iY+hN25cDmolRt5cNKJljYJOu9N+tud3W7/P48PvBBVktc
         hLHKPyPOWBnDJywMqlENo4u1iLmHlP2Tv3KdkxAJLu56cvN0Z5xcUkIjfPdUtpHx2Ksz
         bTOVHUf8lP/GxT1E5L+ngoZhfrK8kzqdz08N3HSvrem+MZ1ms5TAkGWsbnrjtN1p4reg
         TbNV46I3u9MdWi5IC/aniyMnuw2LCCDX/d1DDQ8LGsS+CBINEnGuQkCK4AoOjnSCsP7Y
         JNApb8EiYQiUD5NQpFwksy4wyhaB8S3QA/W4ixdcv1P3nkM97eqv2z+teqifSXC6lVp6
         S9Jw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6f2b8221954si17265446d6.149.2025.04.16.20.11.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 16 Apr 2025 20:11:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1u5Fds-00063T-DP; Wed, 16 Apr 2025 23:10:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kane_chen@aspeedtech.com>)
 id 1u5Fdn-0005zH-FB; Wed, 16 Apr 2025 23:10:16 -0400
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kane_chen@aspeedtech.com>)
 id 1u5Fdl-0000B0-69; Wed, 16 Apr 2025 23:10:15 -0400
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Thu, 17 Apr
 2025 11:09:57 +0800
Received: from mail.aspeedtech.com (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Thu, 17 Apr 2025 11:09:57 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Steven Lee <steven_lee@aspeedtech.com>, Troy Lee
 <leetroy@gmail.com>, Jamin Lin <jamin_lin@aspeedtech.com>, Andrew Jeffery
 <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>, "open
 list:ASPEED BMCs" <qemu-arm@nongnu.org>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>
CC: <troy_lee@aspeedtech.com>, Kane-Chen-AS <kane_chen@aspeedtech.com>
Subject: [PATCH v2 1/3] hw/misc/aspeed_otp: Add Aspeed OTP memory device model
Date: Thu, 17 Apr 2025 11:09:53 +0800
Message-ID: <20250417030957.2586802-2-kane_chen@aspeedtech.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250417030957.2586802-1-kane_chen@aspeedtech.com>
References: <20250417030957.2586802-1-kane_chen@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=211.20.114.72;
 envelope-from=kane_chen@aspeedtech.com; helo=TWMBX01.aspeed.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_FAIL=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-to:  Kane Chen <kane_chen@aspeedtech.com>
From:  Kane Chen via <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: V1cC/VMW7J7M

From: Kane-Chen-AS <kane_chen@aspeedtech.com>

This introduces a new model for the ASPEED OTP (One-Time Programmable)
memory. The device is implemented as a `SysBusDevice` and provides an
abstracted interface for OTP read, write (program), and default value
initialization.

OTP content is backed by a block device and supports QEMU’s drive
infrastructure via the "drive" property.

Features:
- Enforces irreversible bit programming logic (0->1 or 1->0)
- Provides interface for SoC/secure controller integration
- Validates bounds and bit-level constraints
- Uses QEMU error handling conventions and logging

Signed-off-by: Kane-Chen-AS <kane_chen@aspeedtech.com>
---
 hw/misc/aspeed_otpmem.c         | 217 ++++++++++++++++++++++++++++++++
 hw/misc/meson.build             |   1 +
 include/hw/misc/aspeed_otpmem.h |  40 ++++++
 3 files changed, 258 insertions(+)
 create mode 100644 hw/misc/aspeed_otpmem.c
 create mode 100644 include/hw/misc/aspeed_otpmem.h

diff --git a/hw/misc/aspeed_otpmem.c b/hw/misc/aspeed_otpmem.c
new file mode 100644
index 0000000000..cf4b3aa4d2
--- /dev/null
+++ b/hw/misc/aspeed_otpmem.c
@@ -0,0 +1,217 @@
+/*
+ *  ASPEED OTP (One-Time Programmable) memory
+ *
+ *  Copyright (C) 2025 Aspeed
+ *
+ * This code is licensed under the GPL version 2 or later.  See
+ * the COPYING file in the top-level directory.
+ */
+
+#include "qemu/osdep.h"
+#include "hw/block/block.h"
+#include "hw/block/flash.h"
+#include "hw/qdev-properties.h"
+#include "hw/qdev-properties-system.h"
+#include "system/block-backend.h"
+#include "qemu/log.h"
+#include "qemu/option.h"
+#include "hw/sysbus.h"
+#include "qemu/error-report.h"
+#include "hw/misc/aspeed_otpmem.h"
+
+static const Property aspeed_otpmem_properties[] = {
+    DEFINE_PROP_DRIVE("drive", AspeedOTPMemState, blk),
+};
+
+static void aspeed_otpmem_read(void *opaque, uint32_t addr,
+                               uint32_t *out, Error **errp)
+{
+    AspeedOTPMemState *otp = ASPEED_OTPMEM(opaque);
+
+    if (!otp->blk) {
+        error_setg(errp, "OTP memory is not initialized");
+        return;
+    }
+
+    if (out == NULL) {
+        error_setg(errp, "out is NULL");
+        return;
+    }
+
+    if (addr > (otp->max_size - 4)) {
+        error_setg(errp, "OTP memory 0x%x is exceeded", addr);
+        return;
+    }
+
+    if (blk_pread(otp->blk, (int64_t)addr, sizeof(uint32_t), out, 0) < 0) {
+        error_setg(errp, "Failed to read data 0x%x", addr);
+        return;
+    }
+    return;
+}
+
+static bool valid_program_data(uint32_t otp_addr,
+                                 uint32_t value, uint32_t prog_bit)
+{
+    uint32_t programmed_bits, has_programmable_bits;
+    bool is_odd = otp_addr & 1;
+
+    /*
+     * prog_bit uses 0s to indicate target bits to program:
+     *   - if OTP word is even-indexed, programmed bits flip 0->1
+     *   - if odd, bits flip 1->0
+     * Bit programming is one-way only and irreversible.
+     */
+    if (is_odd) {
+        programmed_bits = ~value & prog_bit;
+    } else {
+        programmed_bits = value & (~prog_bit);
+    }
+
+    /* If there is some bit can be programed, to accept the request */
+    has_programmable_bits = value ^ (~prog_bit);
+
+    if (programmed_bits) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: Found programmed bits in addr %x\n",
+                      __func__, otp_addr);
+        for (int i = 0; i < 32; ++i) {
+            if (programmed_bits & (1U << i)) {
+                qemu_log_mask(LOG_GUEST_ERROR,
+                              "  Programmed bit %d\n",
+                              i);
+            }
+        }
+    }
+
+    return has_programmable_bits != 0;
+}
+
+static bool program_otpmem_data(void *opaque, uint32_t otp_addr,
+                             uint32_t prog_bit, uint32_t *value)
+{
+    AspeedOTPMemState *s = ASPEED_OTPMEM(opaque);
+    bool is_odd = otp_addr & 1;
+    uint32_t otp_offset = otp_addr << 2;
+
+    if (blk_pread(s->blk, (int64_t)otp_offset,
+                  sizeof(uint32_t), value, 0) < 0) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: Failed to read data 0x%x\n",
+                      __func__, otp_offset);
+        return false;
+    }
+
+    if (!valid_program_data(otp_addr, *value, prog_bit)) {
+        return false;
+    }
+
+    if (is_odd) {
+        *value &= ~prog_bit;
+    } else {
+        *value |= ~prog_bit;
+    }
+
+    return true;
+}
+
+static void aspeed_otpmem_prog(void *s, uint32_t otp_addr,
+                               uint32_t data, Error **errp)
+{
+    AspeedOTPMemState *otp = ASPEED_OTPMEM(s);
+    uint32_t otp_offset, value;
+
+    if (!otp->blk) {
+        error_setg(errp, "OTP memory is not initialized");
+        return;
+    }
+
+    if (otp_addr > (otp->max_size >> 2)) {
+        error_setg(errp, "OTP memory 0x%x is exceeded", otp_addr);
+        return;
+    }
+
+    otp_offset = otp_addr << 2;
+    if (!program_otpmem_data(s, otp_addr, data, &value)) {
+        error_setg(errp, "Failed to program data");
+        return;
+    }
+
+    if (blk_pwrite(otp->blk, (int64_t)otp_offset,
+                   sizeof(value), &value, 0) < 0) {
+        error_setg(errp, "Failed to write data");
+    }
+
+    return;
+}
+
+static void aspeed_otpmem_set_default(void *s, uint32_t otp_offset,
+                                      uint32_t data, Error **errp)
+{
+    AspeedOTPMemState *otp = ASPEED_OTPMEM(s);
+
+    if ((otp_offset + 4) > otp->max_size) {
+        error_setg(errp, "OTP memory 0x%x is exceeded", otp_offset);
+        return;
+    }
+
+    if (blk_pwrite(otp->blk, (int64_t)otp_offset,
+                   sizeof(data), &data, 0) < 0) {
+        error_setg(errp, "Failed to write data");
+    }
+    return;
+}
+
+static AspeedOTPMemOps aspeed_otpmem_ops = {
+    .read = aspeed_otpmem_read,
+    .prog = aspeed_otpmem_prog,
+    .set_default_value = aspeed_otpmem_set_default
+};
+
+static void aspeed_otpmem_realize(DeviceState *dev, Error **errp)
+{
+    AspeedOTPMemState *s = ASPEED_OTPMEM(dev);
+
+    if (!s->blk) {
+        error_setg(&error_fatal, "OTP memory is not initialized");
+        return;
+    }
+
+    s->max_size = blk_getlength(s->blk);
+    if (s->max_size < 0 || (s->max_size % 4)) {
+        error_setg(&error_fatal,
+                   "Unexpected OTP memory size: %" PRId64 "",
+                   s->max_size);
+        return;
+    }
+
+    s->ops = &aspeed_otpmem_ops;
+
+    return;
+}
+
+static void aspeed_otpmem_system_reset(DeviceState *dev)
+{
+    return;
+}
+
+static void aspeed_otpmem_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+
+    device_class_set_legacy_reset(dc, aspeed_otpmem_system_reset);
+    dc->realize = aspeed_otpmem_realize;
+    device_class_set_props(dc, aspeed_otpmem_properties);
+
+}
+
+static const TypeInfo aspeed_otpmem_types[] = {
+    {
+        .name           = TYPE_ASPEED_OTPMEM,
+        .parent         = TYPE_SYS_BUS_DEVICE,
+        .instance_size  = sizeof(AspeedOTPMemState),
+        .class_init     = aspeed_otpmem_class_init,
+    },
+};
+
+DEFINE_TYPES(aspeed_otpmem_types)
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
index 0000000000..11e2de70b6
--- /dev/null
+++ b/include/hw/misc/aspeed_otpmem.h
@@ -0,0 +1,40 @@
+/*
+ *  ASPEED OTP (One-Time Programmable) memory
+ *
+ *  Copyright (C) 2025 Aspeed
+ *
+ * This code is licensed under the GPL version 2 or later.  See
+ * the COPYING file in the top-level directory.
+ */
+
+#ifndef ASPEED_OTPMMEM_H
+#define ASPEED_OTPMMEM_H
+
+#include "hw/sysbus.h"
+#include "qapi/error.h"
+
+#define TYPE_ASPEED_OTPMEM "aspeed.otpmem"
+#define ASPEED_OTPMEM_DRIVE "otpmem"
+
+#define ASPEED_OTPMEM(obj) OBJECT_CHECK(AspeedOTPMemState, (obj), \
+                                        TYPE_ASPEED_OTPMEM)
+
+typedef struct AspeedOTPMemOps {
+    void (*read)(void *s, uint32_t addr, uint32_t *out, Error **errp);
+    void (*prog)(void *s, uint32_t addr, uint32_t data, Error **errp);
+    void (*set_default_value)(void *s, uint32_t otp_offset,
+                              uint32_t data, Error **errp);
+} AspeedOTPMemOps;
+
+typedef struct AspeedOTPMemState {
+    SysBusDevice parent_obj;
+
+    MemoryRegion mmio;
+    BlockBackend *blk;
+    int64_t max_size;
+
+    AspeedOTPMemOps *ops;
+} AspeedOTPMemState;
+
+#endif /* ASPEED_OTPMMEM_H */
+
-- 
2.43.0

