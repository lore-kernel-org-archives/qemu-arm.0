Received: by 10.223.161.27 with SMTP id o27csp239162wro;
        Mon, 23 Oct 2017 13:24:00 -0700 (PDT)
X-Received: by 10.129.56.134 with SMTP id f128mr9226024ywa.360.1508790240578;
        Mon, 23 Oct 2017 13:24:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1508790240; cv=none;
        d=google.com; s=arc-20160816;
        b=oBWwAYJaSbzvry9TOGGdgRElKpDOSyMv62bF/ilsW2LGg1dUblQGF9bWh/QKep2otr
         DFrVHoatFW/xRZETW1IKj9c6hJpR95W5BQj2Gc9tD28Atki5QsH6DrsVA/TD4Plj47UC
         8m/0Z/F7v3g+LiYdouGGWNqYwE8VXeJWrwNLybilKeBxz7OB/4DYP2AVybq/z+9ubNUq
         Hx7HWjVsSlKKZjBUubNI0D+VEPVhQ8HmMzfN2Cd9yulQ4I6cAYV/Afk9cvRrP96AXdrc
         NeG0Q+0KuOO5RFOVtDHQG/+hMdUc+zsPovIB1omkceVDZXzIomV1ypsPXl+kKMs5EqA5
         Rjkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=7t+ZDjqSpzKpg+o2VFXn4tJy6UHFfByRU0KStUusdYI=;
        b=qeQluIFzg50uCGPITkri9jjABqI1pvBB8G+r3ImzcfD1mzOJMTT+qtDGDwSexeTiHt
         X7txRq/bMVNuokXC/yPh9RS+cDeHw/cE2U1rwG19gEuDHILE1nr8ag27aHcJh01brW0r
         6OsIrxL6vUme+meE+ZZTR3KBaNpWE5waPMcrqXmcdy0bOQj70fTvwT+i4z+ozpSSQad0
         lWudKh+v7H1n67P4wZU8tX8oWZV78UKWJn6+IAPSKQWgLnmmc0hfT9ehMfw6PyHD1hdz
         wK8jDe8kPqjl2yBjL2mtk3h9HUL6f/Kmg9xq+d0HgaNe3eqznBpaIeBgQHIEyeF8pSgR
         yLxw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=vKacZD+j;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 206si1358506ywf.103.2017.10.23.13.24.00
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 23 Oct 2017 13:24:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=vKacZD+j;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:40443 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e6jGR-0002EV-SS
	for alex.bennee@linaro.org; Mon, 23 Oct 2017 16:23:59 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46491)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1e6j4X-0000XN-IT
	for qemu-arm@nongnu.org; Mon, 23 Oct 2017 16:11:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1e6j4W-0002cA-BS
	for qemu-arm@nongnu.org; Mon, 23 Oct 2017 16:11:41 -0400
Received: from mail-pf0-x241.google.com ([2607:f8b0:400e:c00::241]:47363)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <andrew.smirnov@gmail.com>)
	id 1e6j4W-0002bq-3V; Mon, 23 Oct 2017 16:11:40 -0400
Received: by mail-pf0-x241.google.com with SMTP id z11so17897134pfk.4;
	Mon, 23 Oct 2017 13:11:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=7t+ZDjqSpzKpg+o2VFXn4tJy6UHFfByRU0KStUusdYI=;
	b=vKacZD+jMBkVNNwnUn3I/oXdzCzdhi/oMQ5tkVOrfXOn3SrbWFa5TM3dqipsfAr2//
	DSDzRCGf2/aWK09sj3ZTLuDdcgLLm6ePfwie6w7iPtvS1cX0iGX+3zyCQvr0Wn4QrH5l
	QV94WZqL5JjRWT/nCSMuWE2b8T8oMMCY/BNB+CIi+aKQP8N9QgaRQ5LQ//jqfJ9qH6Tq
	4t2PNj8fC6odnOhl+Ge880eY+9J5o7zIseltiO46zqCmghtmb0Ar1f3RyuHFrQS4WMzQ
	sDsVKaF3VVxZUKSD8O6K6fr2htWaKpZG3uN3yDQwyrkgGL7oB3hbrLJckPPFPqEUK4ny
	fJ5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=7t+ZDjqSpzKpg+o2VFXn4tJy6UHFfByRU0KStUusdYI=;
	b=LJQRXQc7xZBYPWPz9J15erLeCIUoQ552B0RImzhRx/HwVtgZl1PtCc/5B3LC5RmTCM
	85idXj6f3ZgCsneAX/0ccUqUgKEdGG2bq5fi6w5i0gJdN1swe+CLsUurXvBvn2nQTMpM
	wUYxLpHRKo9K+AV2Zir7sS389MAXMO9IfEAtUXSlxx6wpl7KsLgB7K0asAEhBTxLEqwi
	i7FBkVnc1bjKkBla94n8juuXQW5/hO7AymIDyr9+J9geEsIxOuVSgayB/avHfoOwex1f
	OouCHQGyEAGvSWznJOsKzkhqw06xjKRQqXzobLNZ2nxdiLbii7TRx8KI271mTnECnuFT
	bj4A==
X-Gm-Message-State: AMCzsaWVftkJlYmzZNzwQoAmGHyEmomgejTAitXj8WT9Xn3tPk0VNgAE
	eLy6a87pGmz6HCjKyMukHQli6n3J
X-Google-Smtp-Source: ABhQp+Sm5kW2HUBOD+xAGhVq2gSEDEenxdyeALAksXV9SoW0SvNJqiQl43+kaKQJPNWxTU3GuFc6pA==
X-Received: by 10.84.171.195 with SMTP id l61mr10974635plb.64.1508789499029;
	Mon, 23 Oct 2017 13:11:39 -0700 (PDT)
Received: from squirtle.westlake.spaceflightindustries.com ([173.226.206.194])
	by smtp.gmail.com with ESMTPSA id
	j1sm15181623pfj.108.2017.10.23.13.11.38
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 23 Oct 2017 13:11:38 -0700 (PDT)
From: Andrey Smirnov <andrew.smirnov@gmail.com>
To: qemu-arm@nongnu.org
Date: Mon, 23 Oct 2017 13:10:51 -0700
Message-Id: <20171023201055.21973-24-andrew.smirnov@gmail.com>
X-Mailer: git-send-email 2.13.5
In-Reply-To: <20171023201055.21973-1-andrew.smirnov@gmail.com>
References: <20171023201055.21973-1-andrew.smirnov@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c00::241
Subject: [Qemu-arm] [PATCH v2 23/27] i.MX: Add code to emulate i.MX7 USBMISC
 IP block
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
X-TUID: Pvt45qbVAX/i

Add minimal code needed to allow upstream Linux guest to boot.

Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: Jason Wang <jasowang@redhat.com>
Cc: Philippe Mathieu-Daudé <f4bug@amsat.org>
Cc: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Cc: yurovsky@gmail.com
Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
---
 hw/usb/Makefile.objs         |  1 +
 hw/usb/imx-usbmisc.c         | 99 ++++++++++++++++++++++++++++++++++++++++++++
 include/hw/usb/imx-usbmisc.h | 22 ++++++++++
 3 files changed, 122 insertions(+)
 create mode 100644 hw/usb/imx-usbmisc.c
 create mode 100644 include/hw/usb/imx-usbmisc.h

diff --git a/hw/usb/Makefile.objs b/hw/usb/Makefile.objs
index 97f1c4561a..813359fadc 100644
--- a/hw/usb/Makefile.objs
+++ b/hw/usb/Makefile.objs
@@ -12,6 +12,7 @@ common-obj-$(CONFIG_USB_XHCI_NEC) += hcd-xhci-nec.o
 common-obj-$(CONFIG_USB_MUSB) += hcd-musb.o
 
 obj-$(CONFIG_TUSB6010) += tusb6010.o
+obj-$(CONFIG_IMX)      += imx-usbmisc.o
 
 # emulated usb devices
 common-obj-$(CONFIG_USB) += dev-hub.o
diff --git a/hw/usb/imx-usbmisc.c b/hw/usb/imx-usbmisc.c
new file mode 100644
index 0000000000..d5e236a4be
--- /dev/null
+++ b/hw/usb/imx-usbmisc.c
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
+#include "hw/usb/imx-usbmisc.h"
+#include "qemu/log.h"
+
+static void imx_usbmisc_reset(DeviceState *dev)
+{
+    IMXUSBMiscState *s = IMX_USBMISC(dev);
+
+    memset(s->regs, 0, sizeof(s->regs));
+}
+
+static uint64_t imx_usbmisc_read(void *opaque, hwaddr offset,
+                               unsigned size)
+{
+    IMXUSBMiscState *s = opaque;
+    return s->regs[offset / sizeof(uint32_t)];
+}
+
+static void imx_usbmisc_write(void *opaque, hwaddr offset,
+                            uint64_t value, unsigned size)
+{
+    IMXUSBMiscState *s = opaque;
+    s->regs[offset / sizeof(uint32_t)] = value;
+}
+
+static const struct MemoryRegionOps imx_usbmisc_ops = {
+    .read = imx_usbmisc_read,
+    .write = imx_usbmisc_write,
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
+static void imx_usbmisc_init(Object *obj)
+{
+    SysBusDevice *sd = SYS_BUS_DEVICE(obj);
+    IMXUSBMiscState *s = IMX_USBMISC(obj);
+
+    memory_region_init_io(&s->iomem,
+                          obj,
+                          &imx_usbmisc_ops,
+                          s,
+                          TYPE_IMX_USBMISC ".iomem",
+                          sizeof(s->regs));
+    sysbus_init_mmio(sd, &s->iomem);
+}
+
+static const VMStateDescription vmstate_imx_usbmisc = {
+    .name = TYPE_IMX_USBMISC,
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .fields = (VMStateField[]) {
+        VMSTATE_UINT32_ARRAY(regs, IMXUSBMiscState, USBMISC_NUM),
+        VMSTATE_END_OF_LIST()
+    },
+};
+
+static void imx_usbmisc_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+
+    dc->reset = imx_usbmisc_reset;
+    dc->vmsd  = &vmstate_imx_usbmisc;
+    dc->desc  = "i.MX IOMUXC Module";
+}
+
+static const TypeInfo imx_usbmisc_info = {
+    .name          = TYPE_IMX_USBMISC,
+    .parent        = TYPE_SYS_BUS_DEVICE,
+    .instance_size = sizeof(IMXUSBMiscState),
+    .instance_init = imx_usbmisc_init,
+    .class_init    = imx_usbmisc_class_init,
+};
+
+static void imx_usbmisc_register_type(void)
+{
+    type_register_static(&imx_usbmisc_info);
+}
+type_init(imx_usbmisc_register_type)
diff --git a/include/hw/usb/imx-usbmisc.h b/include/hw/usb/imx-usbmisc.h
new file mode 100644
index 0000000000..64b06f3d3c
--- /dev/null
+++ b/include/hw/usb/imx-usbmisc.h
@@ -0,0 +1,22 @@
+#ifndef IMX_USBMISC_H
+#define IMX_USBMISC_H
+
+#include "hw/sysbus.h"
+
+enum IMXUSBMiscRegisters {
+    USBMISC_NUM = 0x24 / sizeof(uint32_t) + 1,
+};
+
+typedef struct IMXUSBMiscState {
+    /*< private >*/
+    SysBusDevice parent_obj;
+
+    /*< public >*/
+    MemoryRegion iomem;
+    uint32_t     regs[USBMISC_NUM];
+} IMXUSBMiscState;
+
+#define TYPE_IMX_USBMISC "imx-usbmisc"
+#define IMX_USBMISC(obj) OBJECT_CHECK(IMXUSBMiscState, (obj), TYPE_IMX_USBMISC)
+
+#endif /* IMX_USBMISC_H */
-- 
2.13.5

