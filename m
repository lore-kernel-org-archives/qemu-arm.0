Received: by 10.223.150.237 with SMTP id u100csp2799602wrb;
        Mon, 6 Nov 2017 08:05:00 -0800 (PST)
X-Google-Smtp-Source: ABhQp+R3DW7ptiQ2y1qIUdJSQXfVTaEa5qCHnK7zObBic3NzA4WWFT+K0/vdH2QrkItEn6qOxS1D
X-Received: by 10.129.227.5 with SMTP id q5mr9852969ywl.456.1509984300670;
        Mon, 06 Nov 2017 08:05:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1509984300; cv=none;
        d=google.com; s=arc-20160816;
        b=ovKDQ9W2qQTIO8fLWkzKuBHV/uX+xmutAPQjlrXsKTNkvha+hTnoIQQmidPp2xMDCy
         H/yyXZfIX00nTU0Kg1W5tDjxPs+kvzp/PwnU+W3l6+iUuGengW9Fn1ta2SUaEp+MWP+6
         dAMPv7JUiUvqchTy85ly7MQuMsJm95AEj0ALDTfJqR5EixRGzg6axjux33Z6gPgsXnT2
         7p7IPAHaRKur/WTw4T+5j1MTPCYQCpuZZQ+0HtzVKCMBg8sEkeZRnnWF6p64Rrs7Lot1
         yXQjZirRCOCIL1eyUaCdCjOan0tnYujmhHoyypX4iWBJyRmlICKzhL6/VOxCgobIOWS1
         ONEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=DNuqbOiWH523lA4UB/5UPnT/j1XNs778+PlP4bAzEPk=;
        b=GpbfGcnPZScN99bPDez2Ox8AOk7h8sNSwNIslGykChHQokmxYMRFI1/B6F6kN04Zi5
         QmzLoDxjKVOk9fBBAydmrNnvLrfDwCMQASMH66GBSl0wHnZyi8v3F6sCbpGz1NNbtzuI
         +vggNXaxXshgWW64TBx7CFCfZmnAfnMrmTg3gbt8SaCfduaCwmU/O72z/RyRsLT4kFEP
         LcU6vdzgUHXcUiFLw5gF40cQYa6UTsJP+s6xbxEkkpGUS/FaBCHwZviY/tXGJL1TTwwZ
         QIB+Hcd7WV/L/QAUpUlG8DfDoevfZK5HZAhSgdQbQDPFcf+vvq+kSYvOLKQUuBQIeCvE
         MieQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=lIzw/XSe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w4si2872057ywb.181.2017.11.06.08.05.00
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 06 Nov 2017 08:05:00 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=lIzw/XSe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:48868 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eBjtU-0004Ia-2j
	for alex.bennee@linaro.org; Mon, 06 Nov 2017 11:05:00 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33907)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1eBje0-0007U7-Qv
	for qemu-arm@nongnu.org; Mon, 06 Nov 2017 10:49:02 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1eBjdz-0000hb-Dx
	for qemu-arm@nongnu.org; Mon, 06 Nov 2017 10:49:00 -0500
Received: from mail-pf0-x244.google.com ([2607:f8b0:400e:c00::244]:47613)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <andrew.smirnov@gmail.com>)
	id 1eBjdz-0000hG-5y; Mon, 06 Nov 2017 10:48:59 -0500
Received: by mail-pf0-x244.google.com with SMTP id z11so8015268pfk.4;
	Mon, 06 Nov 2017 07:48:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=DNuqbOiWH523lA4UB/5UPnT/j1XNs778+PlP4bAzEPk=;
	b=lIzw/XSesKOVZR5s+7hY/End8m/KlEDTyBJj7moBeRF0UeP7ZmdnVZ510Cd5lC5l/Q
	6HyLEM2nDIcOB1W83TTlDllevZJq+0LVT+dlgJuqxBUbhWrBeP2nRw+oP1bv7zh7q+vC
	dVPbqOv97iyxGQGtPcu+Cu/WDjMQqmtMBKzGxr5mRDkDGQsnwb30kRsvZIPEaj9z8CZT
	PrCK72al3wbGb5eG7VRnWiZq6LZJSuthfGKL7yHo4t3GPZ4V6/F27FBG/cq6XtoO4HcE
	98Kwcyd7asqltgd97t8YKH+dpzQA2pXWDO00qj8QC1Gne88t7BeXsOHLob71w5U62wKu
	aIow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=DNuqbOiWH523lA4UB/5UPnT/j1XNs778+PlP4bAzEPk=;
	b=RBqtvko60tVr2fVR3bAhBEKMBQVdA22O4sO9y1K+vUCeGEpS6VAyyVVTnyH5OJDWWL
	Ma4nrepkRr1As8v/P4rHGADqo5b5BhSho1troBLLFfAjuZJEjWkbvcyjcn/XSWq+J5PB
	JmL6EXIzl0jXm64Mm324CDpezTD9JGTduaWJ+4wQbMdaF+FfDgtuzZ4sb1Rxj8Isdyws
	ehLUFZ+8CyqT6yZoQCiNi3T3GW2dZRq0bn6o7e44ctZZxhgwJ9tG7DQ265CUuj+kKFjz
	9Nk7+XjdmzFNgjXvIkCwZMrqk7lwLSZE8J08BhlNdoksl8HCRd57IVCW/5moMxZlUjSj
	eI7Q==
X-Gm-Message-State: AMCzsaVZb3d2QWecCDvI6VPSijCOxvsALti/63KRWLf2kpUn5cW/lEsr
	ck2V9kYkKfgFGNoHVKDDfmna0QIR88E=
X-Received: by 10.84.232.76 with SMTP id f12mr14987042pln.269.1509983337869;
	Mon, 06 Nov 2017 07:48:57 -0800 (PST)
Received: from squirtle.lan (c-24-22-235-96.hsd1.wa.comcast.net.
	[24.22.235.96]) by smtp.gmail.com with ESMTPSA id
	x1sm22719590pfh.113.2017.11.06.07.48.56
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 06 Nov 2017 07:48:57 -0800 (PST)
From: Andrey Smirnov <andrew.smirnov@gmail.com>
To: qemu-arm@nongnu.org
Date: Mon,  6 Nov 2017 07:48:09 -0800
Message-Id: <20171106154813.19936-27-andrew.smirnov@gmail.com>
X-Mailer: git-send-email 2.13.6
In-Reply-To: <20171106154813.19936-1-andrew.smirnov@gmail.com>
References: <20171106154813.19936-1-andrew.smirnov@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c00::244
Subject: [Qemu-arm] [PATCH v3 26/30] usb: Add basic code to emulate Chipidea
 USB IP
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
X-TUID: yLGRaePDx7h+

Add code to emulate Chipidea USB IP (used in i.MX SoCs). Tested to
work against:

-usb -drive if=none,id=stick,file=usb.img,format=raw -device \
 usb-storage,bus=usb-bus.0,drive=stick

Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: Jason Wang <jasowang@redhat.com>
Cc: Philippe Mathieu-Daudé <f4bug@amsat.org>
Cc: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Cc: yurovsky@gmail.com
Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
---
 hw/usb/Makefile.objs      |   1 +
 hw/usb/chipidea.c         | 176 ++++++++++++++++++++++++++++++++++++++++++++++
 include/hw/usb/chipidea.h |  16 +++++
 3 files changed, 193 insertions(+)
 create mode 100644 hw/usb/chipidea.c
 create mode 100644 include/hw/usb/chipidea.h

diff --git a/hw/usb/Makefile.objs b/hw/usb/Makefile.objs
index 813359fadc..fe8a4a6c64 100644
--- a/hw/usb/Makefile.objs
+++ b/hw/usb/Makefile.objs
@@ -13,6 +13,7 @@ common-obj-$(CONFIG_USB_MUSB) += hcd-musb.o
 
 obj-$(CONFIG_TUSB6010) += tusb6010.o
 obj-$(CONFIG_IMX)      += imx-usbmisc.o
+obj-$(CONFIG_IMX)      += chipidea.o
 
 # emulated usb devices
 common-obj-$(CONFIG_USB) += dev-hub.o
diff --git a/hw/usb/chipidea.c b/hw/usb/chipidea.c
new file mode 100644
index 0000000000..9bc8df448c
--- /dev/null
+++ b/hw/usb/chipidea.c
@@ -0,0 +1,176 @@
+/*
+ * Copyright (c) 2017, Impinj, Inc.
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
2.13.6

