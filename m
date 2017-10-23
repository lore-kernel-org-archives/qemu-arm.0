Received: by 10.223.161.27 with SMTP id o27csp240955wro;
        Mon, 23 Oct 2017 13:26:18 -0700 (PDT)
X-Received: by 10.37.174.148 with SMTP id b20mr2997076ybj.153.1508790378625;
        Mon, 23 Oct 2017 13:26:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1508790378; cv=none;
        d=google.com; s=arc-20160816;
        b=tQGWRSvoDpUP38JyngHf0B4ZOS76BPk9TNfNHIx0n5Ly6iWP1ucAIYM8QG800G8CaI
         VQps9D1A37MDOsbJuq72OvdNMnMrBP9rgKO4iEkaXJ+P9QFFopstAhLYv2dxLQdiJjJy
         E4hjo3bvCCi1d0Fdd5FzhsBIy2aUknGKGMyvJdji4A93ScGFodxBMr6ZMSW7QCqSW2gw
         rpanFlqEbMBFugbcKBgn8UrbwMuTr71RU+UHHmNqbw6CwNeIhMd85ON2t6QvmSM3WBmj
         K9hwdc/bjoTbg2f3+pmGnttzFEbP0dbNVGe8Uocplel9+u2495rdtj/x1TwVtVPsCuEb
         Nw0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=EWY1y56rwLYcrZe8rnSmo2oLAKliC4aWqu9Ofm+PUjc=;
        b=H/SA0e55yo4NaqW8ZzRakXRked0TKOaxE57cmy5LUCYGkYlo8wbXxTZG0qKXtRGuXQ
         LPYbR/Tici+RRJfQxpO2tLe6uYhPHd8JffV4/NaUpFcQEadZjU6KsDOs/YQ/8Wmc5eg6
         /e/OmFi2thnD+mq0XSp0YB5L9PGMQV2UzHF4ZfWmSBqJ0ZNzenzOL100FHyTcyhm9VfJ
         LSi89YXaSxTHy3EMDH1gkMSnoLZMJ6VZa10roagjBuvO/P0A8aZdmrIQnadYzlFULqfk
         KL/NlojTtTo+UEuTvr0YrNRCYruYADSPBt7jjxQLR5WINLMjjWVPB12T242DClWwgFmO
         sDmQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=MlHSKOIq;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u15si1308151ybu.216.2017.10.23.13.26.18
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 23 Oct 2017 13:26:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=MlHSKOIq;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:40461 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e6jIf-0003pa-W6
	for alex.bennee@linaro.org; Mon, 23 Oct 2017 16:26:18 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46576)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1e6j4c-0000ag-JP
	for qemu-devel@nongnu.org; Mon, 23 Oct 2017 16:11:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1e6j4a-0002e0-86
	for qemu-devel@nongnu.org; Mon, 23 Oct 2017 16:11:46 -0400
Received: from mail-pg0-x244.google.com ([2607:f8b0:400e:c05::244]:52103)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <andrew.smirnov@gmail.com>)
	id 1e6j4Q-0002Yp-A1; Mon, 23 Oct 2017 16:11:34 -0400
Received: by mail-pg0-x244.google.com with SMTP id p9so12623824pgc.8;
	Mon, 23 Oct 2017 13:11:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=EWY1y56rwLYcrZe8rnSmo2oLAKliC4aWqu9Ofm+PUjc=;
	b=MlHSKOIqtn6pLepp0lO7p3GrqjT8nS3h+VtVBo4trCxZ0WUAOCbCHbxPBHwOILF2fM
	6gg7PuptEjuon0En3/kEpTdtP0HcQ49W/ROocz5794+iQaPJLPVsNlY7gnOYqL2JpyxE
	7EiMygDHD6ZibaTKYe+Keonw3cZOzNJEzZKDH/lSeFgtZETzUzCbsWaLHe3ZGsH3BDP7
	QORPyA9ZnCAk3DfYPP5MUCrBkI8ArR/1CKqJ+VD0cQ1KXgL3hyixzBaJxmcyOVMFMWwl
	Bl+3RcY02vByxyUyihQ4/TQU5GTA7YNJL/VCWevOg/T/fzx8ckgzuEWdcFOv3BAlvDUQ
	LmHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=EWY1y56rwLYcrZe8rnSmo2oLAKliC4aWqu9Ofm+PUjc=;
	b=OxnA2d0qMLQ9BJDamFKJmaLmDt3QKt+dZmAXxSgmXpVY5u1OSWQNJhdM5Oi7LLu7T6
	V1SFAWwqFb3JXP5HI6PwT8XwHLgkh08FvMpj8BnItGtvZhIuoQwK120C4DLtgMhysMI8
	GzYrhz8E0VK2GyJ3kwflcC/ohm6YiHUtqY+UbmLM6+fAlZkZiPFhx9sBgZQCh5U768F5
	3qdU+CtYAThHWf6euCFZVGdvR9CqRlRARpthnopvNjFIODtGFaOpMQVvbxS8vmRhXo73
	sMDjVVUTW6Ycoph5oCjWuOUpWImMu7pg4pcY74eZVTVqSV7j8EDQd9QqrWGdlQC+TCIK
	vsmQ==
X-Gm-Message-State: AMCzsaX7Z0Ryjd6IX8SPW3AU+sIUCmdsT0Jve5P6wFhGr/w7Bzdaw8jr
	mDMdeZAdnr4da0MAVryXiMHm8kO7
X-Google-Smtp-Source: ABhQp+S40MRIMBGtNrYyMibWMfsUMEGdik1SSLzKsF+wp3p0C8UqZ6/onDPVkl/qSx0YUWUz4kaS9A==
X-Received: by 10.101.65.11 with SMTP id w11mr7663253pgp.207.1508789493285;
	Mon, 23 Oct 2017 13:11:33 -0700 (PDT)
Received: from squirtle.westlake.spaceflightindustries.com ([173.226.206.194])
	by smtp.gmail.com with ESMTPSA id
	j1sm15181623pfj.108.2017.10.23.13.11.32
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 23 Oct 2017 13:11:32 -0700 (PDT)
From: Andrey Smirnov <andrew.smirnov@gmail.com>
To: qemu-arm@nongnu.org
Date: Mon, 23 Oct 2017 13:10:45 -0700
Message-Id: <20171023201055.21973-18-andrew.smirnov@gmail.com>
X-Mailer: git-send-email 2.13.5
In-Reply-To: <20171023201055.21973-1-andrew.smirnov@gmail.com>
References: <20171023201055.21973-1-andrew.smirnov@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::244
Subject: [Qemu-devel] [PATCH v2 17/27] i.MX: Add code to emulate i.MX7
 IOMUXC IP block
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Andrey Smirnov <andrew.smirnov@gmail.com>,
	Jason Wang <jasowang@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, yurovsky@gmail.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: PC+0kf1yKjM6

Add minimal code needed to allow upstream Linux guest to boot.

Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: Jason Wang <jasowang@redhat.com>
Cc: Philippe Mathieu-Daudé <f4bug@amsat.org>
Cc: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Cc: yurovsky@gmail.com
Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
---
 hw/misc/Makefile.objs         |  1 +
 hw/misc/imx7_iomuxc.c         | 99 +++++++++++++++++++++++++++++++++++++++++++
 include/hw/misc/imx7_iomuxc.h | 22 ++++++++++
 3 files changed, 122 insertions(+)
 create mode 100644 hw/misc/imx7_iomuxc.c
 create mode 100644 include/hw/misc/imx7_iomuxc.h

diff --git a/hw/misc/Makefile.objs b/hw/misc/Makefile.objs
index 16cee88e0f..492c535330 100644
--- a/hw/misc/Makefile.objs
+++ b/hw/misc/Makefile.objs
@@ -37,6 +37,7 @@ obj-$(CONFIG_IMX) += imx6_src.o
 obj-$(CONFIG_IMX) += imx7_ccm.o
 obj-$(CONFIG_IMX) += imx2_wdt.o
 obj-$(CONFIG_IMX) += imx7_snvs.o
+obj-$(CONFIG_IMX) += imx7_iomuxc.o
 obj-$(CONFIG_MILKYMIST) += milkymist-hpdmc.o
 obj-$(CONFIG_MILKYMIST) += milkymist-pfpu.o
 obj-$(CONFIG_MAINSTONE) += mst_fpga.o
diff --git a/hw/misc/imx7_iomuxc.c b/hw/misc/imx7_iomuxc.c
new file mode 100644
index 0000000000..aa26a7485f
--- /dev/null
+++ b/hw/misc/imx7_iomuxc.c
@@ -0,0 +1,99 @@
+/*
+ * Copyright (c) 2017, Impinj, Inc.
+ *
+ * i.MX7 IOMUXC block emulation code
+ *
+ * Author: Andrey Smirnov <andrew.smirnov@gmail.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+
+#include "qemu/osdep.h"
+#include "hw/misc/imx7_iomuxc.h"
+#include "qemu/log.h"
+
+static void imx7_iomuxc_reset(DeviceState *dev)
+{
+    IMX7IOMUXCState *s = IMX7_IOMUXC(dev);
+
+    memset(s->regs, 0, sizeof(s->regs));
+}
+
+static uint64_t imx7_iomuxc_read(void *opaque, hwaddr offset,
+                               unsigned size)
+{
+    IMX7IOMUXCState *s = opaque;
+    return s->regs[offset / sizeof(uint32_t)];
+}
+
+static void imx7_iomuxc_write(void *opaque, hwaddr offset,
+                            uint64_t value, unsigned size)
+{
+    IMX7IOMUXCState *s = opaque;
+    s->regs[offset / sizeof(uint32_t)] = value;
+}
+
+static const struct MemoryRegionOps imx7_iomuxc_ops = {
+    .read = imx7_iomuxc_read,
+    .write = imx7_iomuxc_write,
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
+static void imx7_iomuxc_init(Object *obj)
+{
+    SysBusDevice *sd = SYS_BUS_DEVICE(obj);
+    IMX7IOMUXCState *s = IMX7_IOMUXC(obj);
+
+    memory_region_init_io(&s->iomem,
+                          obj,
+                          &imx7_iomuxc_ops,
+                          s,
+                          TYPE_IMX7_IOMUXC ".iomem",
+                          sizeof(s->regs));
+    sysbus_init_mmio(sd, &s->iomem);
+}
+
+static const VMStateDescription vmstate_imx7_iomuxc = {
+    .name = TYPE_IMX7_IOMUXC,
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .fields = (VMStateField[]) {
+        VMSTATE_UINT32_ARRAY(regs, IMX7IOMUXCState, IOMUXC_NUM),
+        VMSTATE_END_OF_LIST()
+    },
+};
+
+static void imx7_iomuxc_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+
+    dc->reset = imx7_iomuxc_reset;
+    dc->vmsd  = &vmstate_imx7_iomuxc;
+    dc->desc  = "i.MX IOMUXC Module";
+}
+
+static const TypeInfo imx7_iomuxc_info = {
+    .name          = TYPE_IMX7_IOMUXC,
+    .parent        = TYPE_SYS_BUS_DEVICE,
+    .instance_size = sizeof(IMX7IOMUXCState),
+    .instance_init = imx7_iomuxc_init,
+    .class_init    = imx7_iomuxc_class_init,
+};
+
+static void imx7_iomuxc_register_type(void)
+{
+    type_register_static(&imx7_iomuxc_info);
+}
+type_init(imx7_iomuxc_register_type)
diff --git a/include/hw/misc/imx7_iomuxc.h b/include/hw/misc/imx7_iomuxc.h
new file mode 100644
index 0000000000..7041a1ff42
--- /dev/null
+++ b/include/hw/misc/imx7_iomuxc.h
@@ -0,0 +1,22 @@
+#ifndef IMX7_IOMUXC_H
+#define IMX7_IOMUXC_H
+
+#include "hw/sysbus.h"
+
+enum IMX7IOMUXCRegisters {
+    IOMUXC_NUM = 0x740 / sizeof(uint32_t),
+};
+
+typedef struct IMX7IOMUXCState {
+    /*< private >*/
+    SysBusDevice parent_obj;
+
+    /*< public >*/
+    MemoryRegion iomem;
+    uint32_t     regs[IOMUXC_NUM];
+} IMX7IOMUXCState;
+
+#define TYPE_IMX7_IOMUXC "imx7-iomuxc"
+#define IMX7_IOMUXC(obj) OBJECT_CHECK(IMX7IOMUXCState, (obj), TYPE_IMX7_IOMUXC)
+
+#endif /* IMX7_IOMUXC_H */
-- 
2.13.5

