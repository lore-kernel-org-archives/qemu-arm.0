Received: by 10.28.71.27 with SMTP id u27csp241942wma;
        Tue, 6 Feb 2018 20:31:09 -0800 (PST)
X-Google-Smtp-Source: AH8x226JBBP1XL4gGDAqS3Xtuugdh/FPLrNIQSJiozXhVIAmt4+w06HgfqDOCPMG/RcrIYGHKbxb
X-Received: by 10.129.132.142 with SMTP id u136mr3010367ywf.432.1517977869533;
        Tue, 06 Feb 2018 20:31:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1517977869; cv=none;
        d=google.com; s=arc-20160816;
        b=i2UCf1HIUMmXqQ+pYPVtmQyFfqsg3V9f8Db1cmkDlRsCelTav2aIDJIanMsszgM+Xj
         +M6oh8fBzDkfFiM+mUWiawlBt1q76BdXXDdCdAqR99WwlyWEtz9fsMvMoKq2sGyVOLHV
         capNa4uNTBgw19mF3CRBljvHxhsNfjeQhRk2GrjBsA++IZVcAf93At3rMWBhw++T87WI
         E/0YYzNvTjdYVtlEhbwHtpFqlLoRYIGF5y0Bj6PgNktPDR3l4vP/c10k8KBTjXJCAAYu
         GREupI6swdK8ZFwEFGlW7im8QDEcRnCwGgRubFC0I2aNSEz41zlec5b0FGA3d1EYNKSe
         JsrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=hdzgmCtTlkltj/dbzhmcq9fOR30UBd+OkUQAESIZCR0=;
        b=ZZAvX9Cu/ZEfEKwBtrziM9D651Y5Eb4my1JvptyqReAALZ2H3PnbqZdmNc+E5dJMJn
         iEOwTlKX69kT8UDQRgqkjd7i+m5szIm8mJF9wDwATHaiMQQlumamVkGGRKySCNKItXYe
         bWLczcAnwtJxbQNX/JUie2aSelZyOtQS2aY5ebMgGNLzOu6c6ulIhgOIoUzU4wgGDAOw
         UarAPJVYX2ubrhIPC3Bmc7bnQqsCyiiXkFLLBAeHu9PjGa5dbhPA36eMBzUXJOgfeylw
         QpqqX1c4knizgTQ7LCAcAd8Y4jZLejffCFBlZ36VFK7VD45JHKEKjnS6k3mNTwTpMpCb
         28kQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=ccDWIEsQ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g184si102102ywa.722.2018.02.06.20.31.09
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 06 Feb 2018 20:31:09 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=ccDWIEsQ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:46908 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ejHO0-00052W-Q4
	for alex.bennee@linaro.org; Tue, 06 Feb 2018 23:31:08 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43843)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1ejHIW-0000ZE-7e
	for qemu-devel@nongnu.org; Tue, 06 Feb 2018 23:25:29 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1ejHIV-0003WP-18
	for qemu-devel@nongnu.org; Tue, 06 Feb 2018 23:25:28 -0500
Received: from mail-pf0-x241.google.com ([2607:f8b0:400e:c00::241]:34352)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <andrew.smirnov@gmail.com>)
	id 1ejHIP-0003KJ-SR; Tue, 06 Feb 2018 23:25:22 -0500
Received: by mail-pf0-x241.google.com with SMTP id g17so1648902pfh.1;
	Tue, 06 Feb 2018 20:25:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=hdzgmCtTlkltj/dbzhmcq9fOR30UBd+OkUQAESIZCR0=;
	b=ccDWIEsQPXpuLU0S6pqP7jdkFtb5gJCu5BRHzzdE4CR1Mu3SL0HPpwFrOVh4SyprW2
	hPEvIjqx/kZtu4kiesPVtEbIoXNdpPNjT47+eQeais8I0VP9ukK3LdW+NEg1LZk3Im40
	jr36hvzvVB2tBO9dH/wo13MqCNTjCFyF9uls4BtTfU960bN34zqQP0cmB+eb1Qq1LL0V
	WzzTFZJ3LpTa2hTRvJimIeFZqWwwOrf+FR3sjusGGu8XBRWzoirT7kBrrU2pGK+nl0B4
	CVaHIrQ0iBuTpbrNvSEgfzGvffy3ZTEoTD4EuXQxRF8ctOcBh9Ib0t4Maistmp0Nq3ww
	XBzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=hdzgmCtTlkltj/dbzhmcq9fOR30UBd+OkUQAESIZCR0=;
	b=eWl8xyHxc2BGHYhe4TQfBjQRc7iokaRw0RM+EM1wbeOMHDqRvA8Yh+nWu/7nkz/CW4
	aZO4OPf+OLUGwQSJonp8lA6z0g81ZwPx38q56uLxRwDf7rJP5zUa6Dch7Tn9oSVlRUG7
	Mb6SaYkavT8qjY90JcwjfLrvmanq/TrkXhRWtkHLJOGA0BJqnFUJy3b/6bxIh3bURIC/
	YMUaJUb8gLHkwPOdetS4XqLV17gErwbNdY3Lt/u+cg2gHF6T6/BVLq2E7ltMDQfU3y0Y
	6OLF/7ng8LGK47oZiHue9xpFCEnDt2IlFLWect6pL8+20m8QM/nC6eJuLrG52kPfLfgu
	EMvw==
X-Gm-Message-State: APf1xPDWM5RlAgNxuPGuu1VIff6eyxAa8MH0ETBLYb9Nv13eZ8UQ7pFB
	xRkWSmpgjX1JMhBHKDzbuM9JyBt0
X-Received: by 10.98.75.11 with SMTP id y11mr4583916pfa.169.1517977520716;
	Tue, 06 Feb 2018 20:25:20 -0800 (PST)
Received: from squirtle.lan (c-24-22-235-96.hsd1.wa.comcast.net.
	[24.22.235.96]) by smtp.gmail.com with ESMTPSA id
	x8sm1076095pfk.123.2018.02.06.20.25.19
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 06 Feb 2018 20:25:20 -0800 (PST)
From: Andrey Smirnov <andrew.smirnov@gmail.com>
To: qemu-arm@nongnu.org
Date: Tue,  6 Feb 2018 20:24:35 -0800
Message-Id: <20180207042438.15422-12-andrew.smirnov@gmail.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180207042438.15422-1-andrew.smirnov@gmail.com>
References: <20180207042438.15422-1-andrew.smirnov@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c00::241
Subject: [Qemu-devel] [PATCH v5 11/14] usb: Add basic code to emulate
 Chipidea USB IP
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
	"Michael S . Tsirkin" <mst@redhat.com>,
	Andrey Smirnov <andrew.smirnov@gmail.com>,
	Jason Wang <jasowang@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@zoho.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, yurovsky@gmail.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: dm/6emCHkGjn

Add code to emulate Chipidea USB IP (used in i.MX SoCs). Tested to
work against:

-usb -drive if=none,id=stick,file=usb.img,format=raw -device \
 usb-storage,bus=usb-bus.0,drive=stick

Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: Jason Wang <jasowang@redhat.com>
Cc: Philippe Mathieu-Daudé <f4bug@amsat.org>
Cc: Marcel Apfelbaum <marcel.apfelbaum@zoho.com>
Cc: Michael S. Tsirkin <mst@redhat.com>
Cc: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Cc: yurovsky@gmail.com
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
---
 hw/usb/Makefile.objs      |   1 +
 hw/usb/chipidea.c         | 176 ++++++++++++++++++++++++++++++++++++++++++++++
 include/hw/usb/chipidea.h |  16 +++++
 3 files changed, 193 insertions(+)
 create mode 100644 hw/usb/chipidea.c
 create mode 100644 include/hw/usb/chipidea.h

diff --git a/hw/usb/Makefile.objs b/hw/usb/Makefile.objs
index fbcd498c59..41be700812 100644
--- a/hw/usb/Makefile.objs
+++ b/hw/usb/Makefile.objs
@@ -12,6 +12,7 @@ common-obj-$(CONFIG_USB_XHCI_NEC) += hcd-xhci-nec.o
 common-obj-$(CONFIG_USB_MUSB) += hcd-musb.o
 
 obj-$(CONFIG_TUSB6010) += tusb6010.o
+obj-$(CONFIG_IMX)      += chipidea.o
 
 # emulated usb devices
 common-obj-$(CONFIG_USB) += dev-hub.o
diff --git a/hw/usb/chipidea.c b/hw/usb/chipidea.c
new file mode 100644
index 0000000000..60d67f88b8
--- /dev/null
+++ b/hw/usb/chipidea.c
@@ -0,0 +1,176 @@
+/*
+ * Copyright (c) 2018, Impinj, Inc.
+ *
+ * Chipidea USB block emulation code
+ *
+ * Author: Andrey Smirnov <andrew.smirnov@gmail.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+
+#include "qemu/osdep.h"
+#include "hw/usb/hcd-ehci.h"
+#include "hw/usb/chipidea.h"
+#include "qemu/log.h"
+
+enum {
+    CHIPIDEA_USBx_DCIVERSION   = 0x000,
+    CHIPIDEA_USBx_DCCPARAMS    = 0x004,
+    CHIPIDEA_USBx_DCCPARAMS_HC = BIT(8),
+};
+
+static uint64_t chipidea_read(void *opaque, hwaddr offset,
+                               unsigned size)
+{
+    return 0;
+}
+
+static void chipidea_write(void *opaque, hwaddr offset,
+                            uint64_t value, unsigned size)
+{
+}
+
+static const struct MemoryRegionOps chipidea_ops = {
+    .read = chipidea_read,
+    .write = chipidea_write,
+    .endianness = DEVICE_NATIVE_ENDIAN,
+    .impl = {
+        /*
+         * Our device would not work correctly if the guest was doing
+         * unaligned access. This might not be a limitation on the
+         * real device but in practice there is no reason for a guest
+         * to access this device unaligned.
+         */
+        .min_access_size = 4,
+        .max_access_size = 4,
+        .unaligned = false,
+    },
+};
+
+static uint64_t chipidea_dc_read(void *opaque, hwaddr offset,
+                                 unsigned size)
+{
+    switch (offset) {
+    case CHIPIDEA_USBx_DCIVERSION:
+        return 0x1;
+    case CHIPIDEA_USBx_DCCPARAMS:
+        /*
+         * Real hardware (at least i.MX7) will also report the
+         * controller as "Device Capable" (and 8 supported endpoints),
+         * but there doesn't seem to be much point in doing so, since
+         * we don't emulate that part.
+         */
+        return CHIPIDEA_USBx_DCCPARAMS_HC;
+    }
+
+    return 0;
+}
+
+static void chipidea_dc_write(void *opaque, hwaddr offset,
+                              uint64_t value, unsigned size)
+{
+}
+
+static const struct MemoryRegionOps chipidea_dc_ops = {
+    .read = chipidea_dc_read,
+    .write = chipidea_dc_write,
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
+static void chipidea_init(Object *obj)
+{
+    EHCIState *ehci = &SYS_BUS_EHCI(obj)->ehci;
+    ChipideaState *ci = CHIPIDEA(obj);
+    int i;
+
+    for (i = 0; i < ARRAY_SIZE(ci->iomem); i++) {
+        const struct {
+            const char *name;
+            hwaddr offset;
+            uint64_t size;
+            const struct MemoryRegionOps *ops;
+        } regions[ARRAY_SIZE(ci->iomem)] = {
+            /*
+             * Registers located between offsets 0x000 and 0xFC
+             */
+            {
+                .name   = TYPE_CHIPIDEA ".misc",
+                .offset = 0x000,
+                .size   = 0x100,
+                .ops    = &chipidea_ops,
+            },
+            /*
+             * Registers located between offsets 0x1A4 and 0x1DC
+             */
+            {
+                .name   = TYPE_CHIPIDEA ".endpoints",
+                .offset = 0x1A4,
+                .size   = 0x1DC - 0x1A4 + 4,
+                .ops    = &chipidea_ops,
+            },
+            /*
+             * USB_x_DCIVERSION and USB_x_DCCPARAMS
+             */
+            {
+                .name   = TYPE_CHIPIDEA ".dc",
+                .offset = 0x120,
+                .size   = 8,
+                .ops    = &chipidea_dc_ops,
+            },
+        };
+
+        memory_region_init_io(&ci->iomem[i],
+                              obj,
+                              regions[i].ops,
+                              ci,
+                              regions[i].name,
+                              regions[i].size);
+
+        memory_region_add_subregion(&ehci->mem,
+                                    regions[i].offset,
+                                    &ci->iomem[i]);
+    }
+}
+
+static void chipidea_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+    SysBusEHCIClass *sec = SYS_BUS_EHCI_CLASS(klass);
+
+    /*
+     * Offsets used were taken from i.MX7Dual Applications Processor
+     * Reference Manual, Rev 0.1, p. 3177, Table 11-59
+     */
+    sec->capsbase   = 0x100;
+    sec->opregbase  = 0x140;
+    sec->portnr     = 1;
+
+    set_bit(DEVICE_CATEGORY_USB, dc->categories);
+    dc->desc = "Chipidea USB Module";
+}
+
+static const TypeInfo chipidea_info = {
+    .name          = TYPE_CHIPIDEA,
+    .parent        = TYPE_SYS_BUS_EHCI,
+    .instance_size = sizeof(ChipideaState),
+    .instance_init = chipidea_init,
+    .class_init    = chipidea_class_init,
+};
+
+static void chipidea_register_type(void)
+{
+    type_register_static(&chipidea_info);
+}
+type_init(chipidea_register_type)
diff --git a/include/hw/usb/chipidea.h b/include/hw/usb/chipidea.h
new file mode 100644
index 0000000000..1ec2e9dbda
--- /dev/null
+++ b/include/hw/usb/chipidea.h
@@ -0,0 +1,16 @@
+#ifndef CHIPIDEA_H
+#define CHIPIDEA_H
+
+#include "hw/usb/hcd-ehci.h"
+
+typedef struct ChipideaState {
+    /*< private >*/
+    EHCISysBusState parent_obj;
+
+    MemoryRegion iomem[3];
+} ChipideaState;
+
+#define TYPE_CHIPIDEA "usb-chipidea"
+#define CHIPIDEA(obj) OBJECT_CHECK(ChipideaState, (obj), TYPE_CHIPIDEA)
+
+#endif /* CHIPIDEA_H */
-- 
2.14.3

