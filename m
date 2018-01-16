Received: by 10.28.173.206 with SMTP id w197csp3379363wme;
        Mon, 15 Jan 2018 17:41:41 -0800 (PST)
X-Google-Smtp-Source: ACJfBotbWC/AYMixw8k0IdU6oIt4jpVUsYDL9JW9Y+jEFQQczZ6U2NjsxAUA2xjYSAe05ieUEPWB
X-Received: by 10.129.159.140 with SMTP id w134mr5891882ywg.469.1516066901300;
        Mon, 15 Jan 2018 17:41:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1516066901; cv=none;
        d=google.com; s=arc-20160816;
        b=yFUlMh3Pw/LgLIuznfeDsQwZtY5fLcEjm/TGCIkDRKZEMO9lc0g6Mv+RMd1WYXEhPC
         pcFL13IT2AxxB4Vx8/pZ0AC7sTvaVjatWnIYGjZxcT0zE/xBo7I8A69Kgb3U/XVMd4Mt
         448y5h2NZNnwjkxgr/5u8JBrSWIUiZjykpjQ8OOzF0a6lk/Yz8k6niUPLgLzb6+x6CMz
         lhU9Poy11tYrag5jWb60Tz0JaWXqC8c/PRz9KpEqKSYGzucUs10g0nnOFGQfm6fDMujn
         1ZTwjNHm1BA0jYiTqxnPBbjJXoq2CfQ7RTANmr+SZMqu1rmcUecXDMRlILstrifcbXOS
         wtjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=AzIXeyvCwL5dglnqyMXtbVIXumFfGtWpQ5s214lcqB4=;
        b=LLW9dClJ480r/vlN4WXqNzcO14SQGDl/VcNHzjJJfqZt7pC0Ylq0ZLcNYXL69/2P+w
         Zc7ooMq2qqJY4h8e5ptGpTFIzkXGqYvbfhjEJi7dlFEiQr3l0i+kwCACiDmVreU51lKy
         t0k9FO+iggsrkAO4qnz6Zg1q3JU3F8dIiUR45kjpnHlJj5rHo2jxZwNj1q1q1BWw/ESj
         TLyY3/RSCeTKmsyHSlevZZ/xN2GUYIISU/5VM+dOK42n16Vsdf/82hCXAETQGej7Xhov
         CKXsVX1p39qM39sk/RtmVqsCYz0QtS2pofXKud6uZbD/72oAEspychMIGo9Gvh8pluUY
         LFGQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=EX8V5d5w;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l140si251708ybl.343.2018.01.15.17.41.41
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 15 Jan 2018 17:41:41 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=EX8V5d5w;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:52033 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ebGFw-0001CO-Gg
	for alex.bennee@linaro.org; Mon, 15 Jan 2018 20:41:40 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38793)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1ebGCA-00069i-Lz
	for qemu-arm@nongnu.org; Mon, 15 Jan 2018 20:37:48 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1ebGC9-0005Nd-5p
	for qemu-arm@nongnu.org; Mon, 15 Jan 2018 20:37:46 -0500
Received: from mail-pg0-x242.google.com ([2607:f8b0:400e:c05::242]:46952)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <andrew.smirnov@gmail.com>)
	id 1ebGC8-0005Lr-TC; Mon, 15 Jan 2018 20:37:45 -0500
Received: by mail-pg0-x242.google.com with SMTP id s9so6905960pgq.13;
	Mon, 15 Jan 2018 17:37:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=AzIXeyvCwL5dglnqyMXtbVIXumFfGtWpQ5s214lcqB4=;
	b=EX8V5d5wB9YflFGjhGt/3rLuXOBnIXKmVRutqay5jwAq7N7w900DmdDmdayxciOSWE
	GtVBbVWocDV0bTFXDHX8/vLhfgmapcOwu/ANDBU4FxoYqH7L15sAF3h3geIGDUnvsAsu
	OTeolZC3sPgC2gwV1zUNJdXP112Rl9PkQiamknDt2/A9Q4/Gq8Ust90vsn/jVHBoNp+u
	jfua+TAAsh75DqNh05xIQUt6/mNzcpb/SqO65Yk30kT6u5usQrFHPghA0ZtoEHOnZG9c
	1enoGuYjjetbVA9lr2rqnavMPt5M3r5n7opw0GSmMFSzGBEob6gBMoO8J5gIvc6jabpa
	loyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=AzIXeyvCwL5dglnqyMXtbVIXumFfGtWpQ5s214lcqB4=;
	b=AHu/sPlLEBwOaoPqP6v6aWCw7SL2kqvDqIyh2H+7rFGPjaXjbwpjsWLjAPiUwOwwM2
	P/tKAMQIwrZ1V4gCKlbAlTK756e6p4zu3lsSAqhsc+d1JlIITu5/2LK6gMW4EYf2WYqi
	PRq6axLKtU06DxMKGDzYrIHOf+JhP4x2rivQokMVDCsNwN0lXT/WzPrHMopcWPOEn8v0
	wa4jXPqNmEqc5a0kniipyGb8o9pvVQHoYx+6Q+zadr8veGZAneCjoQgB4EeAS/jmcURe
	Wh5WiuQkRYczhKU6pYcrLqhjxaKGMlXlxHnPR3l0GkR67icGFEUnPolGtG2MArtqFPT5
	9rhQ==
X-Gm-Message-State: AKwxyte9NVnDO5bQHTdLFKNnptabtRIkBD0icPZifjEjjF+w2uhUfnpv
	OkJhF/nqStpmrMIA4+CkAfV2B1PU
X-Received: by 10.99.103.69 with SMTP id b66mr4615428pgc.233.1516066663583;
	Mon, 15 Jan 2018 17:37:43 -0800 (PST)
Received: from squirtle.lan (c-24-22-235-96.hsd1.wa.comcast.net.
	[24.22.235.96])
	by smtp.gmail.com with ESMTPSA id s65sm1023795pfk.7.2018.01.15.17.37.42
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 15 Jan 2018 17:37:43 -0800 (PST)
From: Andrey Smirnov <andrew.smirnov@gmail.com>
To: qemu-arm@nongnu.org
Date: Mon, 15 Jan 2018 17:37:05 -0800
Message-Id: <20180116013709.13830-11-andrew.smirnov@gmail.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180116013709.13830-1-andrew.smirnov@gmail.com>
References: <20180116013709.13830-1-andrew.smirnov@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::242
Subject: [Qemu-arm] [PATCH v4 10/14] usb: Add basic code to emulate Chipidea
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
X-TUID: 1/NFOVfEqym0

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
index bdfead6701..5573c182d4 100644
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
2.14.3

