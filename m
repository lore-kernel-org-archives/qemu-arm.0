Received: by 10.103.124.15 with SMTP id x15csp523260vsc;
        Fri, 19 May 2017 17:28:01 -0700 (PDT)
X-Received: by 10.233.216.196 with SMTP id u187mr10494283qkf.99.1495240081020;
        Fri, 19 May 2017 17:28:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1495240081; cv=none;
        d=google.com; s=arc-20160816;
        b=EkHRBEOaRptBcAABviiWza1qGUPKjBvflPkS5e0fdDx5BipQ6uJU2+NYa6oO9FA0Mu
         cvjubWFv1Ciboej/eGWIiqdGGGuUZlnrf6zmAlbY41ywQ06O02BDY3Mz2b4O6/L3wBoZ
         s31LJWkFR11IHPqAIYBQ/TaD6etDGrmOlpUx0x2RU8osotYb/bRZsfguW8JqXT4bstRu
         vDaRxmojA7oKf0j3bJ6K/vWjjRrCUUavYPEi5luKQZdJ/wPkTfGq9YqgwZa8D7penurY
         TgadObckhHjmhdNSr0JgFzcWyUe/DXbzOfuA7WBGBbtZuDI2tLj9WLvw4hRCXruvLaID
         RGGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:dkim-signature
         :arc-authentication-results;
        bh=YIMoUue5kLhsKHBlkpl5uRzviDxg7m1sWa50vwojKuE=;
        b=MV+RW3texe+RLgppnwZRRSBOa4xB6lg0B7QPDXuGeGCV3786N9HCXYEGQZ9CMIG576
         oM9unuldeoWeT8DDLkYWsPp2bCru89zezq+dNyPCC0/8EOjYB9o7M5G1kw5Fm4gKYo58
         XAVlBXC7uQFA/ICvcZf9yNzagdiYdUjGGwBxgy5oPnxIyFfKRisEphegTDq9Gra5XV3q
         aIqdoXPhVjkF23tGTrSnziw25M7y8JckfQ7W6tutZmTd8mpag0AS7HPlB6QpyNRkWf+L
         iu/ChCRN/zKdutqB1UODq6ZZuRW+OCdPyViax8nwyqbYCXxEUmDfPX44iEyZkUzISoai
         tM3w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@aj.id.au;
       dkim=fail header.i=@messagingengine.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w127si519487qkd.61.2017.05.19.17.28.00
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 19 May 2017 17:28:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@aj.id.au;
       dkim=fail header.i=@messagingengine.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:60720 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dBsFU-0004F7-IJ
	for alex.bennee@linaro.org; Fri, 19 May 2017 20:28:00 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58956)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew@aj.id.au>) id 1dBsFN-0004Du-Jr
	for qemu-arm@nongnu.org; Fri, 19 May 2017 20:27:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andrew@aj.id.au>) id 1dBsFK-0001Zz-CB
	for qemu-arm@nongnu.org; Fri, 19 May 2017 20:27:53 -0400
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:39263)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <andrew@aj.id.au>)
	id 1dBsFK-0001Zu-6b; Fri, 19 May 2017 20:27:50 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id 6268520496;
	Fri, 19 May 2017 20:27:49 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
	by compute4.internal (MEProxy); Fri, 19 May 2017 20:27:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
	:date:from:in-reply-to:message-id:references:subject:to
	:x-me-sender:x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=YIMoUu
	e5kLhsKHBlkpl5uRzviDxg7m1sWa50vwojKuE=; b=UlKSnuhX3APkW9Q3ZCTqcF
	hnsUlS3LQC/G2YIZjZaAd75ImgGH9aug+mmbgVG1IOG1+0u7WWdFkDxYy3ReX8Ww
	9GitJfbZg+wR50aDe8OYehY0AEvyslU45xuW4QtFGa3eycWeuGZMzobqRpW17eRb
	uf+zrFRsD3ca9T95BSxnAfqGiSytG56hS1YWoJi9G0OlRJTWYhbZvZlj/IwU7X6S
	cN8C40c7u+CqxpFGut8cK5gc9CQGlk0xDkXYad53zaqr6R4aeMhpOmmGKBlIIwxU
	mTNxb1Dmfpoh7rvM/k5s2KwKwrWpiHmnCed0nEYU/mkokk827OABB09PXjEX0g7g
	==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:date:from:in-reply-to:message-id
	:references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
	:x-sasl-enc; s=fm1; bh=YIMoUue5kLhsKHBlkpl5uRzviDxg7m1sWa50vwojK
	uE=; b=O6qiOH+Iu4FTdYqeNfL7CZjmxEiUIpdoI9IUExaIhZ74CQKYWBjgEQjnd
	nQs2unvlhHjnAt9eDq16EV3ATQSb0jSSimjW1rW6UC5vjeJxaB06WfFx83+ooLVT
	JFYZBCxQVIhBeb97wV4EafnObaFxCaw49KuMjibc/0eBg/P4fdS0GRCeLC97/xV9
	J1hRW+rPlF/RHYKlFOARKhAbhxqdVxzJPGyWFW9QXyNULyeielIYoR/Sh+35sZtX
	cGaY4iqn+4nuSNg8JANmYD6Ps96cNhK7Bw1HY6S1bl4gyn1G9eA188EBwvcLgNrf
	crpdPsc4HLEcDAAJbH+8trlhLws3w==
X-ME-Sender: <xms:hY0fWRx74KXaLCrjhcgvsbNeeFALqrYoUFw10AbeTkheTvlSKh-vHg>
X-Sasl-enc: tfrcbcDKwHnG3uRad3FOQe/73JxlS/TMi1mlTCPlvUDj 1495240068
Received: from keelia.au.ibm.com (unknown [202.90.207.97])
	by mail.messagingengine.com (Postfix) with ESMTPA id 7D8CC241E3;
	Fri, 19 May 2017 20:27:38 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: qemu-arm@nongnu.org
Date: Sat, 20 May 2017 08:26:52 +0800
Message-Id: <20170520002653.20213-2-andrew@aj.id.au>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <20170520002653.20213-1-andrew@aj.id.au>
References: <20170520002653.20213-1-andrew@aj.id.au>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.111.4.25
Subject: [Qemu-arm] [PATCH 1/2] hw/adc: Add basic Aspeed ADC model
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
	Ryan Chen <ryan_chen@aspeedtech.com>, Andrew Jeffery <andrew@aj.id.au>,
	Alistair Francis <alistair@alistair23.me>, qemu-devel@nongnu.org,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: KqmRQY5brFng

This model implements enough behaviour to do basic functionality tests
such as device initialisation and read out of dummy sample values. The
sample value generation strategy is similar to the STM ADC already in
the tree.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 hw/adc/Makefile.objs        |   1 +
 hw/adc/aspeed_adc.c         | 246 ++++++++++++++++++++++++++++++++++++++++++++
 include/hw/adc/aspeed_adc.h |  33 ++++++
 3 files changed, 280 insertions(+)
 create mode 100644 hw/adc/aspeed_adc.c
 create mode 100644 include/hw/adc/aspeed_adc.h

diff --git a/hw/adc/Makefile.objs b/hw/adc/Makefile.objs
index 3f6dfdedaec7..2bf9362ba3c4 100644
--- a/hw/adc/Makefile.objs
+++ b/hw/adc/Makefile.objs
@@ -1 +1,2 @@
 obj-$(CONFIG_STM32F2XX_ADC) += stm32f2xx_adc.o
+obj-$(CONFIG_ASPEED_SOC) += aspeed_adc.o
diff --git a/hw/adc/aspeed_adc.c b/hw/adc/aspeed_adc.c
new file mode 100644
index 000000000000..d08f1684f7bc
--- /dev/null
+++ b/hw/adc/aspeed_adc.c
@@ -0,0 +1,246 @@
+/*
+ * Aspeed ADC
+ *
+ * Andrew Jeffery <andrew@aj.id.au>
+ *
+ * Copyright 2017 IBM Corp.
+ *
+ * This code is licensed under the GPL version 2 or later.  See
+ * the COPYING file in the top-level directory.
+ */
+
+#include "qemu/osdep.h"
+#include "hw/adc/aspeed_adc.h"
+#include "qapi/error.h"
+#include "qemu/log.h"
+
+#define ASPEED_ADC_ENGINE_CTRL                  0x00
+#define  ASPEED_ADC_ENGINE_CH_EN_MASK           0xffff0000
+#define   ASPEED_ADC_ENGINE_CH_EN(x)            ((BIT(x)) << 16)
+#define  ASPEED_ADC_ENGINE_INIT                 BIT(8)
+#define  ASPEED_ADC_ENGINE_AUTO_COMP            BIT(5)
+#define  ASPEED_ADC_ENGINE_COMP                 BIT(4)
+#define  ASPEED_ADC_ENGINE_MODE_MASK            0x0000000e
+#define   ASPEED_ADC_ENGINE_MODE_OFF            (0b000 << 1)
+#define   ASPEED_ADC_ENGINE_MODE_STANDBY        (0b001 << 1)
+#define   ASPEED_ADC_ENGINE_MODE_NORMAL         (0b111 << 1)
+#define  ASPEED_ADC_ENGINE_EN                   BIT(0)
+
+#define ASPEED_ADC_L_MASK       ((1 << 10) - 1)
+#define ASPEED_ADC_L(x)         ((x) & ASPEED_ADC_L_MASK)
+#define ASPEED_ADC_H(x)         (((x) >> 16) & ASPEED_ADC_L_MASK)
+#define ASPEED_ADC_LH_MASK      (ASPEED_ADC_L_MASK << 16 | ASPEED_ADC_L_MASK)
+
+static inline uint32_t update_channels(uint32_t current)
+{
+    const uint32_t next = (current + 7) & 0x3ff;
+
+    return (next << 16) | next;
+}
+
+static bool breaks_threshold(AspeedADCState *s, int ch_off)
+{
+    const uint32_t a = ASPEED_ADC_L(s->channels[ch_off]);
+    const uint32_t a_lower = ASPEED_ADC_L(s->bounds[2 * ch_off]);
+    const uint32_t a_upper = ASPEED_ADC_H(s->bounds[2 * ch_off]);
+    const uint32_t b = ASPEED_ADC_H(s->channels[ch_off]);
+    const uint32_t b_lower = ASPEED_ADC_L(s->bounds[2 * ch_off + 1]);
+    const uint32_t b_upper = ASPEED_ADC_H(s->bounds[2 * ch_off + 1]);
+
+    return ((a < a_lower || a > a_upper)) ||
+           ((b < b_lower || b > b_upper));
+}
+
+static uint32_t read_channel_sample(AspeedADCState *s, int ch_off)
+{
+    uint32_t ret;
+
+    /* Poor man's sampling */
+    ret = s->channels[ch_off];
+    s->channels[ch_off] = update_channels(s->channels[ch_off]);
+
+    if (breaks_threshold(s, ch_off)) {
+        qemu_irq_raise(s->irq);
+    }
+
+    return ret;
+}
+
+#define TO_INDEX(addr, base) (((addr) - (base)) >> 2)
+
+static uint64_t aspeed_adc_read(void *opaque, hwaddr addr,
+                                     unsigned int size)
+{
+    AspeedADCState *s = ASPEED_ADC(opaque);
+    uint64_t ret;
+
+    switch (addr) {
+    case 0x00:
+        ret = s->engine_ctrl;
+        break;
+    case 0x04:
+        ret = s->irq_ctrl;
+        break;
+    case 0x08:
+        ret = s->vga_detect_ctrl;
+        break;
+    case 0x0c:
+        ret = s->adc_clk_ctrl;
+        break;
+    case 0x10 ... 0x2e:
+        ret = read_channel_sample(s, TO_INDEX(addr, 0x10));
+        break;
+    case 0x30 ... 0x6e:
+        ret = s->bounds[TO_INDEX(addr, 0x30)];
+        break;
+    case 0x70 ... 0xae:
+        ret = s->hysteresis[TO_INDEX(addr, 0x70)];
+        break;
+    case 0xc0:
+        ret = s->irq_src;
+        break;
+    case 0xc4:
+        ret = s->comp_trim;
+        break;
+    default:
+        qemu_log_mask(LOG_UNIMP, "%s: addr: 0x%lx, size: %u\n", __func__, addr,
+                size);
+        ret = 0;
+        break;
+    }
+
+    return ret;
+}
+
+static void aspeed_adc_write(void *opaque, hwaddr addr,
+                       uint64_t val, unsigned int size)
+{
+    AspeedADCState *s = ASPEED_ADC(opaque);
+
+    switch (addr) {
+    case 0x00:
+        {
+            uint32_t init;
+
+            init = !!(val & ASPEED_ADC_ENGINE_EN);
+            init *= ASPEED_ADC_ENGINE_INIT;
+
+            val &= ~ASPEED_ADC_ENGINE_INIT;
+            val |= init;
+        }
+
+        val &= ~ASPEED_ADC_ENGINE_AUTO_COMP;
+        s->engine_ctrl = val;
+
+        break;
+    case 0x04:
+        s->irq_ctrl = val;
+        break;
+    case 0x08:
+        s->vga_detect_ctrl = val;
+        break;
+    case 0x0c:
+        s->adc_clk_ctrl = val;
+        break;
+    case 0x10 ... 0x2e:
+        s->channels[TO_INDEX(addr, 0x10)] = val;
+        break;
+    case 0x30 ... 0x6e:
+        s->bounds[TO_INDEX(addr, 0x30)] = (val & ASPEED_ADC_LH_MASK);
+        break;
+    case 0x70 ... 0xae:
+        s->hysteresis[TO_INDEX(addr, 0x70)] =
+            (val & (BIT(31) | ASPEED_ADC_LH_MASK));
+        break;
+    case 0xc0:
+        s->irq_src = (val & 0xffff);
+        break;
+    case 0xc4:
+        s->comp_trim = (val & 0xf);
+        break;
+    default:
+        qemu_log_mask(LOG_UNIMP, "%s: %lu\n", __func__, addr);
+        break;
+    }
+}
+
+static const MemoryRegionOps aspeed_adc_ops = {
+    .read = aspeed_adc_read,
+    .write = aspeed_adc_write,
+    .endianness = DEVICE_LITTLE_ENDIAN,
+    .valid.min_access_size = 4,
+    .valid.max_access_size = 4,
+    .valid.unaligned = false,
+};
+
+static void aspeed_adc_reset(DeviceState *dev)
+{
+    struct AspeedADCState *s = ASPEED_ADC(dev);
+
+    s->engine_ctrl = 0;
+    s->irq_ctrl = 0;
+    s->vga_detect_ctrl = 0x0000000f;
+    s->adc_clk_ctrl = 0x0000000f;
+    memset(s->channels, 0, sizeof(s->channels));
+    memset(s->bounds, 0, sizeof(s->bounds));
+    memset(s->hysteresis, 0, sizeof(s->hysteresis));
+    s->irq_src = 0;
+    s->comp_trim = 0;
+}
+
+static void aspeed_adc_realize(DeviceState *dev, Error **errp)
+{
+    AspeedADCState *s = ASPEED_ADC(dev);
+    SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
+
+    sysbus_init_irq(sbd, &s->irq);
+
+    memory_region_init_io(&s->mmio, OBJECT(s), &aspeed_adc_ops, s,
+            TYPE_ASPEED_ADC, 0x1000);
+
+    sysbus_init_mmio(sbd, &s->mmio);
+}
+
+static const VMStateDescription vmstate_aspeed_adc = {
+    .name = TYPE_ASPEED_ADC,
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .fields = (VMStateField[]) {
+        VMSTATE_UINT32(engine_ctrl, AspeedADCState),
+        VMSTATE_UINT32(irq_ctrl, AspeedADCState),
+        VMSTATE_UINT32(vga_detect_ctrl, AspeedADCState),
+        VMSTATE_UINT32(adc_clk_ctrl, AspeedADCState),
+        VMSTATE_UINT32_ARRAY(channels, AspeedADCState,
+                ASPEED_ADC_NR_CHANNELS / 2),
+        VMSTATE_UINT32_ARRAY(bounds, AspeedADCState, ASPEED_ADC_NR_CHANNELS),
+        VMSTATE_UINT32_ARRAY(hysteresis, AspeedADCState,
+                ASPEED_ADC_NR_CHANNELS),
+        VMSTATE_UINT32(irq_src, AspeedADCState),
+        VMSTATE_UINT32(comp_trim, AspeedADCState),
+        VMSTATE_END_OF_LIST(),
+    }
+};
+
+static void aspeed_adc_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+
+    dc->realize = aspeed_adc_realize;
+    dc->reset = aspeed_adc_reset;
+    dc->desc = "Aspeed Analog-to-Digital Converter",
+    dc->vmsd = &vmstate_aspeed_adc;
+}
+
+static const TypeInfo aspeed_adc_info = {
+    .name = TYPE_ASPEED_ADC,
+    .parent = TYPE_SYS_BUS_DEVICE,
+    .instance_size = sizeof(AspeedADCState),
+    .class_init = aspeed_adc_class_init,
+};
+
+static void aspeed_adc_register_types(void)
+{
+    type_register_static(&aspeed_adc_info);
+}
+
+type_init(aspeed_adc_register_types);
diff --git a/include/hw/adc/aspeed_adc.h b/include/hw/adc/aspeed_adc.h
new file mode 100644
index 000000000000..ae2089ac62ca
--- /dev/null
+++ b/include/hw/adc/aspeed_adc.h
@@ -0,0 +1,33 @@
+#ifndef _ASPEED_ADC_H_
+#define _ASPEED_ADC_H_
+
+#include <stdint.h>
+
+#include "hw/hw.h"
+#include "hw/irq.h"
+#include "hw/sysbus.h"
+
+#define TYPE_ASPEED_ADC "aspeed.adc"
+#define ASPEED_ADC(obj) OBJECT_CHECK(AspeedADCState, (obj), TYPE_ASPEED_ADC)
+
+#define ASPEED_ADC_NR_CHANNELS 16
+
+typedef struct AspeedADCState {
+    /* <private> */
+    SysBusDevice parent;
+
+    MemoryRegion mmio;
+    qemu_irq irq;
+
+    uint32_t engine_ctrl;
+    uint32_t irq_ctrl;
+    uint32_t vga_detect_ctrl;
+    uint32_t adc_clk_ctrl;
+    uint32_t channels[ASPEED_ADC_NR_CHANNELS / 2];
+    uint32_t bounds[ASPEED_ADC_NR_CHANNELS];
+    uint32_t hysteresis[ASPEED_ADC_NR_CHANNELS];
+    uint32_t irq_src;
+    uint32_t comp_trim;
+} AspeedADCState;
+
+#endif /* _ASPEED_ADC_H_ */
-- 
2.9.3

