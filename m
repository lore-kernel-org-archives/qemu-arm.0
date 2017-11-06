Received: by 10.223.150.237 with SMTP id u100csp2794026wrb;
        Mon, 6 Nov 2017 08:00:37 -0800 (PST)
X-Google-Smtp-Source: ABhQp+TdA+Bd43sPvJH2a4sO2wwnB8DMymkUUotMN1iphbbtR1F3ZjYXbAnnvkZ4dwWz3+eAgIIQ
X-Received: by 10.37.162.193 with SMTP id c1mr10168132ybn.57.1509984037700;
        Mon, 06 Nov 2017 08:00:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1509984037; cv=none;
        d=google.com; s=arc-20160816;
        b=NNlmwLFN47zmGWRETH3YeYKl/dIMn94DcKwKh/DWpcBj/3XgO455+pP1CpNGQ9QZq6
         8GICREbQjcFCGoE/gyMRooyEIpKsUi6sLwSsuThVokKb1qBLZWowzSV5AAkWawJA9OUZ
         rTtQNzO+jnGCGhrMo6T9XFVVochMjmiiahJKg4LkHgOEgLiozrR/V5FvkbJ6Abxv2VOz
         +waPCnqSeA33jptoOIb+SKl0RyyEc4yCDZ0B9VpIOGWGe7JQ1Qz0k7PeFMKCsX7zSEEy
         b/bKiZ5mNirQBr0rZ8eVHJqAKc2RxX01VzPVCw9tQngZeoMySbwY67KJTxD3vDT6/eCR
         DIdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=68RK4C9nJtWwMbaZBhmPVrd1Wrg0vRfcmdCK+AAHH8o=;
        b=wEOCe9JEk4aBAbCanrHx9srT4dmRMcSYkZJ2vu4qoNTMZQVFCeOUiXyiEBFwyr4+PC
         TDwiG76JpxYfvuBPKqjs+FKB+y9s3SkbtYrxQuxXHwvXSUK4ppuZ14TkbHrzuun/JUQG
         RgWtsMP2zm99vl3IcE266nrNXBCbcdzIVFK38EQUxeHqrXha6mSqVHmZvwUtTaHhqlEe
         Jb/Ow4Wfg/44zUyDUuzgVq+ARN5sSBWhgItc+t/i54oTzt8Mtdj6VpQ31xWgxfWjIVNg
         sI4XQboHxjzQpt11QXOwS4Jaq6iOjlN3W+/KX9T3OeCDo+EvkQM7UW3ne3M/BnvT4LcD
         C99A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=FgheuHVT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m1si2690885ybm.368.2017.11.06.08.00.37
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 06 Nov 2017 08:00:37 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=FgheuHVT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:48840 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eBjpF-0000lb-3Y
	for alex.bennee@linaro.org; Mon, 06 Nov 2017 11:00:37 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33893)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1eBje0-0007TT-A6
	for qemu-arm@nongnu.org; Mon, 06 Nov 2017 10:49:01 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1eBjdx-0000g0-3z
	for qemu-arm@nongnu.org; Mon, 06 Nov 2017 10:49:00 -0500
Received: from mail-pg0-x242.google.com ([2607:f8b0:400e:c05::242]:46150)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <andrew.smirnov@gmail.com>)
	id 1eBjdw-0000fM-TP; Mon, 06 Nov 2017 10:48:57 -0500
Received: by mail-pg0-x242.google.com with SMTP id k7so8513688pga.3;
	Mon, 06 Nov 2017 07:48:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=68RK4C9nJtWwMbaZBhmPVrd1Wrg0vRfcmdCK+AAHH8o=;
	b=FgheuHVTgIY7uRznqOcjI166obGbGfad6VrEeNtfeUGPnRAr9jy5VDl0nZuplk8VFh
	N+T5BLNmJjeOgIrFFdSwHklPQMD4Hxqe7yhfC+7azr7RH5Drm/gPeMCyg6o9DmWAnutQ
	KW9QBL4OhpYaZmgBnYJScCH/fDXeBlIr/cnUtCP2y0vgC0Q6EdV0NwEiCd41IbjeoyjX
	0JgGJAAAryeFrSklg2/7UktHI+b6X5qaHQTvGO9GWsKu01RWZE08/Lp/xVfIa0hUhwoq
	U/37tbmhEAAOOFombQ1jUh8OMUkLDihml9W1teiyMUyKoZ5pY9cKmCvn2S3qRU2+XtZx
	gp3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=68RK4C9nJtWwMbaZBhmPVrd1Wrg0vRfcmdCK+AAHH8o=;
	b=f6W/y8B4p8ReauhiFKquwUAosuebMQQWFycfpbAcTZRA/bx+5+qmphUzbS0+2fu6+L
	7sjQasJfaxTgf3M/X7hNVwblSI19G6+xhnaOcagRzsQA5W7RVu5t8SzQReI+L6BcRVx0
	4afLN8FDVCc2kuf+OA1Hmmzw27jq88H+CGArfuB1mpcn6k9taHDf5htT08goKJ/qc8G8
	uv/NFuqpxjOmDbsZwba8+/OVD0NKQN6vb3iJGxVxlWT3YBMZuhxWk26RSb44Sft3MV3S
	1cUzQKFbrzx7PCOdoTwE4UDwALcbbgavTNG6ylF9igK2N7d7n6ZteFDvFTxoVQy9q/7A
	6flQ==
X-Gm-Message-State: AMCzsaXnZw3M2JnI6G9nfVPjf1M/0ELiZ4meZNf/egKkcGHUP5PAZ2y5
	XqZuqIXZ8g7efqSk4d9PdR18oeWI5Cg=
X-Received: by 10.99.152.68 with SMTP id l4mr15675989pgo.443.1509983335625;
	Mon, 06 Nov 2017 07:48:55 -0800 (PST)
Received: from squirtle.lan (c-24-22-235-96.hsd1.wa.comcast.net.
	[24.22.235.96]) by smtp.gmail.com with ESMTPSA id
	x1sm22719590pfh.113.2017.11.06.07.48.54
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 06 Nov 2017 07:48:55 -0800 (PST)
From: Andrey Smirnov <andrew.smirnov@gmail.com>
To: qemu-arm@nongnu.org
Date: Mon,  6 Nov 2017 07:48:07 -0800
Message-Id: <20171106154813.19936-25-andrew.smirnov@gmail.com>
X-Mailer: git-send-email 2.13.6
In-Reply-To: <20171106154813.19936-1-andrew.smirnov@gmail.com>
References: <20171106154813.19936-1-andrew.smirnov@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::242
Subject: [Qemu-arm] [PATCH v3 24/30] i.MX: Add code to emulate i.MX7 ADC IP
 block
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Andrey Smirnov <andrew.smirnov@gmail.com>,
	Jason Wang <jasowang@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, yurovsky@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: zUoMo6BoZAuw

Add minimal code needed to allow upstream Linux guest to boot.

Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: Jason Wang <jasowang@redhat.com>
Cc: Philippe Mathieu-Daudé <f4bug@amsat.org>
Cc: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Cc: yurovsky@gmail.com
Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
---
 hw/misc/Makefile.objs      |  1 +
 hw/misc/imx7_adc.c         | 99 ++++++++++++++++++++++++++++++++++++++++++++++
 include/hw/misc/imx7_adc.h | 22 +++++++++++
 3 files changed, 122 insertions(+)
 create mode 100644 hw/misc/imx7_adc.c
 create mode 100644 include/hw/misc/imx7_adc.h

diff --git a/hw/misc/Makefile.objs b/hw/misc/Makefile.objs
index c9944161bd..b578bd0cba 100644
--- a/hw/misc/Makefile.objs
+++ b/hw/misc/Makefile.objs
@@ -39,6 +39,7 @@ obj-$(CONFIG_IMX) += imx2_wdt.o
 obj-$(CONFIG_IMX) += imx7_snvs.o
 obj-$(CONFIG_IMX) += imx7_iomuxc.o
 obj-$(CONFIG_IMX) += imx_flexcan.o
+obj-$(CONFIG_IMX) += imx7_adc.o
 obj-$(CONFIG_IMX) += imx7_gpr.o
 obj-$(CONFIG_MILKYMIST) += milkymist-hpdmc.o
 obj-$(CONFIG_MILKYMIST) += milkymist-pfpu.o
diff --git a/hw/misc/imx7_adc.c b/hw/misc/imx7_adc.c
new file mode 100644
index 0000000000..7945e99075
--- /dev/null
+++ b/hw/misc/imx7_adc.c
@@ -0,0 +1,99 @@
+/*
+ * Copyright (c) 2017, Impinj, Inc.
+ *
+ * i.MX7 ADC block emulation code
+ *
+ * Author: Andrey Smirnov <andrew.smirnov@gmail.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+
+#include "qemu/osdep.h"
+#include "hw/misc/imx7_adc.h"
+#include "qemu/log.h"
+
+static void imx7_adc_reset(DeviceState *dev)
+{
+    IMX7ADCState *s = IMX7_ADC(dev);
+
+    memset(s->regs, 0, sizeof(s->regs));
+}
+
+static uint64_t imx7_adc_read(void *opaque, hwaddr offset,
+                               unsigned size)
+{
+    IMX7ADCState *s = opaque;
+    return s->regs[offset / sizeof(uint32_t)];
+}
+
+static void imx7_adc_write(void *opaque, hwaddr offset,
+                            uint64_t value, unsigned size)
+{
+    IMX7ADCState *s = opaque;
+    s->regs[offset / sizeof(uint32_t)] = value;
+}
+
+static const struct MemoryRegionOps imx7_adc_ops = {
+    .read = imx7_adc_read,
+    .write = imx7_adc_write,
+    .endianness = DEVICE_NATIVE_ENDIAN,
+    .impl = {
+        /*
+         * Our device would not work correctly if the guest was doing
+         * unaligned access. This might not be a limitation on the real
+         * device but in practice there is no reason for a guest to access
+         * this device unaligned.
+         */
+        .min_access_size = 4,
+        .max_access_size = 4,
+        .unaligned = false,
+    },
+};
+
+static void imx7_adc_init(Object *obj)
+{
+    SysBusDevice *sd = SYS_BUS_DEVICE(obj);
+    IMX7ADCState *s = IMX7_ADC(obj);
+
+    memory_region_init_io(&s->iomem,
+                          obj,
+                          &imx7_adc_ops,
+                          s,
+                          TYPE_IMX7_ADC ".iomem",
+                          sizeof(s->regs));
+    sysbus_init_mmio(sd, &s->iomem);
+}
+
+static const VMStateDescription vmstate_imx7_adc = {
+    .name = TYPE_IMX7_ADC,
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .fields = (VMStateField[]) {
+        VMSTATE_UINT32_ARRAY(regs, IMX7ADCState, ADC_NUM),
+        VMSTATE_END_OF_LIST()
+    },
+};
+
+static void imx7_adc_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+
+    dc->reset = imx7_adc_reset;
+    dc->vmsd  = &vmstate_imx7_adc;
+    dc->desc  = "i.MX ADC Module";
+}
+
+static const TypeInfo imx7_adc_info = {
+    .name          = TYPE_IMX7_ADC,
+    .parent        = TYPE_SYS_BUS_DEVICE,
+    .instance_size = sizeof(IMX7ADCState),
+    .instance_init = imx7_adc_init,
+    .class_init    = imx7_adc_class_init,
+};
+
+static void imx7_adc_register_type(void)
+{
+    type_register_static(&imx7_adc_info);
+}
+type_init(imx7_adc_register_type)
diff --git a/include/hw/misc/imx7_adc.h b/include/hw/misc/imx7_adc.h
new file mode 100644
index 0000000000..4a61c52caf
--- /dev/null
+++ b/include/hw/misc/imx7_adc.h
@@ -0,0 +1,22 @@
+#ifndef IMX7_ADC_H
+#define IMX7_ADC_H
+
+#include "hw/sysbus.h"
+
+enum IMX7ADCRegisters {
+    ADC_NUM = 0x130 / sizeof(uint32_t) + 1,
+};
+
+typedef struct IMX7ADCState {
+    /*< private >*/
+    SysBusDevice parent_obj;
+
+    /*< public >*/
+    MemoryRegion iomem;
+    uint32_t     regs[ADC_NUM];
+} IMX7ADCState;
+
+#define TYPE_IMX7_ADC "imx7-adc"
+#define IMX7_ADC(obj) OBJECT_CHECK(IMX7ADCState, (obj), TYPE_IMX7_ADC)
+
+#endif /* IMX7_ADC_H */
-- 
2.13.6

