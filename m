Received: by 10.223.150.237 with SMTP id u100csp2799183wrb;
        Mon, 6 Nov 2017 08:04:38 -0800 (PST)
X-Google-Smtp-Source: ABhQp+TQMtcE83Xwu8WEJ1a7gYgBCac3opaxySBRR+tm1inrQa9xeFXi5hNKiYjzWMXR4jm/dzxM
X-Received: by 10.129.113.3 with SMTP id m3mr10009805ywc.379.1509984277930;
        Mon, 06 Nov 2017 08:04:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1509984277; cv=none;
        d=google.com; s=arc-20160816;
        b=sWs+5rltzPdF/1tt67OZMlAZAFfU2SWlUDMue+hRtGvwtkF4RIOGOFzFw7xseCQ7Gl
         IP612izdtscsRjwluolIL73HZVo/CGbqUi/HVsVYV3DsNfxFeTqXG+h/EOKQckC4cWVB
         LhBdBXviR+mXe2OFCHl+QB3J3wS90O/CdMGzFGu/Rufk6Jm1XNrfRzQNH5cab2X4cK56
         su4Prfgvn4dUFKJUUNi8yT5XqRX7lZc/ieuZLr2SiKXD3QnqI2HjH7BsJAb+KSsp4QuT
         1VpGXP40vIDpK+AeJXuVcL3ggukBv4lhXLUmn0N4TqZ2EwfhuzFvDG7rEFuLuv9AvMlq
         gyww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=PAeBnfqQr1Ccy7km7ONf4FnIRtF48Doga8yQWCuNu/Q=;
        b=IIRmvdFW1Y0QcHDmTU/rZnU+lgaepjTkYCYQL0mrbmFy+TFKkrru8lCoIoaZG3PB85
         lPLTexPWWCKDfuacK/DC1G49+6PK29rBoR5MDeyfZV8enLp49ONNze9Ikjxi6r5jt+Cz
         zby6bgxqiPDTL8VgWyDLk4Xyzmz6oDlS8nPdqqwXE2VbwoQ3IIg4nbsuv55cc2A32s1w
         6Oyho0RL8tX5kPI/GcesDFv5vWOeamhyjg+zVmKySsWyh8+RP2u3Z2uu1nRLjUOtaOmm
         iw+4CUB9Jy8rzRwEv7pnbm4wsoAUr2zEs4XQkDzriDHwf/hkZSIBddmTVXd0xpfw5X3J
         KTlg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=ZjqQbjq9;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m205si2692850ybc.68.2017.11.06.08.04.37
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 06 Nov 2017 08:04:37 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=ZjqQbjq9;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:48861 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eBjt7-0003l0-D0
	for alex.bennee@linaro.org; Mon, 06 Nov 2017 11:04:37 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33953)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1eBje1-0007VR-VX
	for qemu-devel@nongnu.org; Mon, 06 Nov 2017 10:49:05 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1eBje0-0000iF-Hv
	for qemu-devel@nongnu.org; Mon, 06 Nov 2017 10:49:02 -0500
Received: from mail-pg0-x242.google.com ([2607:f8b0:400e:c05::242]:43187)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <andrew.smirnov@gmail.com>)
	id 1eBjdv-0000eX-Mi; Mon, 06 Nov 2017 10:48:55 -0500
Received: by mail-pg0-x242.google.com with SMTP id s75so8527344pgs.0;
	Mon, 06 Nov 2017 07:48:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=PAeBnfqQr1Ccy7km7ONf4FnIRtF48Doga8yQWCuNu/Q=;
	b=ZjqQbjq9oMpzA21Gs+4O8w6v89S6Pnl7KZebuQb0Ekt/RdX8JblIctndIcsc7eUjQ0
	YMPZ34FIt38NmAozexwv2YWYKqa/X9jR68ts1yGWh9ZpCLXaP4YvqbgwCbRK5QHbapU9
	0NgpDyRlH8wSBlYDhFyr1psmUFDkK91I3x/FhytHRYKM/auhaN8WInlp/mz74FJBU3bm
	uTykPrRJh9DNXRFEgiH9CXGWkGN5yBCSzAO8Hq6qjzsb0HjwSsJ5VfIUT2XgzFxSjlag
	Bot4XIG4aNGMrnoNe/G+vuvrDHOAC/drtwt3LM1CDRPaxlRdQSDexiVaa+z1uBQA6HGx
	UgwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=PAeBnfqQr1Ccy7km7ONf4FnIRtF48Doga8yQWCuNu/Q=;
	b=ubOdZsP2YLvKgC8k8QLaTFaYxJoG4OUAHHKhaYo28aCUlsU3mddHxMB5jw8RAeKm/Q
	1HSrUs/Htluwu+MAYvD+cjsvRqiu3QALmmUXGRIE0+w5okxUeJzmNyOa/q5yWr7GfYom
	inUGDMtBBaGZCjxwwFgWjzz3uT/avetQniYs7FhYOEiQmdGv2rwfZzAbQFD9MbezMVb7
	v3LZ16b/zic1E0XDnKUdRcnQapY91p/hMDKDZalIlWgFJRr3C7vOMsaQ4grvf1SP/mCH
	joCsuQM1TtW75XINrPXg5h50x3Iq6/q7t7Wg7+0mIriwnUcur2r3izKT6aQv4/TWJpR6
	alTQ==
X-Gm-Message-State: AMCzsaXTKaiaLoTrRaHZkSd+w9bR58q8/ZGyhwO5Hz84ZdCh94yCyaqv
	1MYQRsFS/503jo/FUiJdZDNAb7jTK3Q=
X-Received: by 10.159.253.71 with SMTP id b7mr15409478plx.169.1509983334388;
	Mon, 06 Nov 2017 07:48:54 -0800 (PST)
Received: from squirtle.lan (c-24-22-235-96.hsd1.wa.comcast.net.
	[24.22.235.96]) by smtp.gmail.com with ESMTPSA id
	x1sm22719590pfh.113.2017.11.06.07.48.53
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 06 Nov 2017 07:48:53 -0800 (PST)
From: Andrey Smirnov <andrew.smirnov@gmail.com>
To: qemu-arm@nongnu.org
Date: Mon,  6 Nov 2017 07:48:06 -0800
Message-Id: <20171106154813.19936-24-andrew.smirnov@gmail.com>
X-Mailer: git-send-email 2.13.6
In-Reply-To: <20171106154813.19936-1-andrew.smirnov@gmail.com>
References: <20171106154813.19936-1-andrew.smirnov@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::242
Subject: [Qemu-devel] [PATCH v3 23/30] i.MX: Add code to emulate i.MX7
 USBMISC IP block
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
X-TUID: YOBMMYBzEtUf

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
2.13.6

