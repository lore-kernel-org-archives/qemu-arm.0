Received: by 10.223.161.27 with SMTP id o27csp237289wro;
        Mon, 23 Oct 2017 13:21:45 -0700 (PDT)
X-Received: by 10.13.226.196 with SMTP id l187mr9851225ywe.103.1508790105230;
        Mon, 23 Oct 2017 13:21:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1508790105; cv=none;
        d=google.com; s=arc-20160816;
        b=fows+z9oCPTVrnPWduEfp4wNTdObxfq1WYoBJL7Yjfsso1RZZkv0RecyA0paFSmy4O
         XaGjlZxCNmAZu0wHl2fmch1mzeY83cykbQygib16Sm8n9E/h12CfQpf3alZPjTjn0wKv
         bq3QHnyEY1cMKKgWL/50xAPW6robKU7QLWPdGV0+tD/sxx4o9RPTrOLPG1ctRxfp1t28
         3IXTyfpvLUBab2HgXgxFQcHO2mkcGQOPpeZ/bREhp6O8z2u9Q0XPx/0cvvytgUp1uF2P
         1d2GlpN0Gzs0tjCfUiD0m7y1WK0QRoWdPTw6tZdVp4o+/IHoYTZjk/NqYnbnSsjOoM0/
         ufUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=zhrBDlSWWsDVD8oOEUvXmefSt3cSiTDeAfcnfhx+Img=;
        b=AHzG5Qoqf/uZFfNbs301dRVPZ2PtMduyxBFFZa5Y7ABpvgcsPTmscj4q6BbotSMDX/
         PG6gFPBfDotX8865rCPH+pwr6Pvesbg6POdoU7fXCrUIoVQ1OrWeJDF0jmuy0194Oxi5
         mumH+JGFg+I1J8Fmakzw5JQKvhrUb3V1l3Ef6auOvbvLAwP6OSMV1yt2WOk17PnYUs+y
         OOjw4wQShhYuHbaUKLqEe+CKbhg1NzwjDZpfg9nwMvKz9TA6xnKvQqXwsPNKGvy9XuPt
         ss2elzAX+EtoZ9XrqyNzkPz624fShRVaIQeBt6olPhlLaLVhDBqjEoAlqApZQGEyibj4
         zk9w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=WChPpUz9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p70si1390903ywp.800.2017.10.23.13.21.45
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 23 Oct 2017 13:21:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=WChPpUz9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:40430 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e6jEG-0000Kk-II
	for alex.bennee@linaro.org; Mon, 23 Oct 2017 16:21:44 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46513)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1e6j4Y-0000XZ-ED
	for qemu-arm@nongnu.org; Mon, 23 Oct 2017 16:11:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1e6j4X-0002cX-8w
	for qemu-arm@nongnu.org; Mon, 23 Oct 2017 16:11:42 -0400
Received: from mail-pg0-x244.google.com ([2607:f8b0:400e:c05::244]:49364)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <andrew.smirnov@gmail.com>)
	id 1e6j4X-0002cE-0B; Mon, 23 Oct 2017 16:11:41 -0400
Received: by mail-pg0-x244.google.com with SMTP id g6so12637471pgn.6;
	Mon, 23 Oct 2017 13:11:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=zhrBDlSWWsDVD8oOEUvXmefSt3cSiTDeAfcnfhx+Img=;
	b=WChPpUz9VtCltK1kO5bUiFAkaYuIQc0EO+GtcXM/iADxPp00DVzDB16392uMPMu0W+
	BtIeW/BTBfqrKUUVDDABqKaKjKnj4D/eXt7TBkD43haUPpRrrclSa2G8ymA8HdOOf/EF
	aXDvms0AMsX6J+Kpk+UXpLamb0+EGEANOK27d2XVpK9/Bk89zgovJKAkRWGHGU42hXrR
	/68+UkiwziCTOeyFdCVixBLWFcqsCAXujZ6LkhQ8Vj685j5vsw8ldU+oPfIaQyL4Ga/r
	tsj+5HyXm2ato0zkvdD7/7jdrz8tRfiizynJQLOVB2OB/Rla7Bmc5v65HViuofmIMaAS
	2LAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=zhrBDlSWWsDVD8oOEUvXmefSt3cSiTDeAfcnfhx+Img=;
	b=tpFncDsZGUNu5Ok4LTWEjkA9U8rHELpXMMIDavvN7KcTeye/CUJpbi7Ojqz1pBFQ6b
	l4B+DlACwwKJy/o3DwT8Jh15Xk4jKMXnsfKGwNdB/CPeoOF4NSr3D3Aq1tP+ITgFKKMP
	90cRG/l95DNHdTkZvN766Ncz8WfF/DTbri8+dzFy1ckqN+FnAlYBex8YbQPqZvQHy+gZ
	L3omAnBgBi42p/sERkL7l81xKHodofAyax0wu5SAPzz8lvLeBB9PtpZ2xyZiaLM47ZvX
	/0MjL8tzMsgeG1sigIZfWsybid+XCWH+yE7+x+iypAliHL0zyp1fOm7RVlh4IqHIoxQZ
	rYpQ==
X-Gm-Message-State: AMCzsaXtt9qca0Nu1uCWi10u7CSJvxdu9ET9MRAi9q+aNqKBnptL0ZeX
	gma+avKSO/cQ+FM8x67nWbhv/BXV
X-Google-Smtp-Source: ABhQp+Rt/jnwW2Ds6lMpy4Uj6WtZUvbFwyCfQ1uaPYs4RGzb4mL1QdCUH8/M0WxJZKyQBXQ06Eo17A==
X-Received: by 10.98.60.14 with SMTP id j14mr14433183pfa.234.1508789499901;
	Mon, 23 Oct 2017 13:11:39 -0700 (PDT)
Received: from squirtle.westlake.spaceflightindustries.com ([173.226.206.194])
	by smtp.gmail.com with ESMTPSA id
	j1sm15181623pfj.108.2017.10.23.13.11.39
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 23 Oct 2017 13:11:39 -0700 (PDT)
From: Andrey Smirnov <andrew.smirnov@gmail.com>
To: qemu-arm@nongnu.org
Date: Mon, 23 Oct 2017 13:10:52 -0700
Message-Id: <20171023201055.21973-25-andrew.smirnov@gmail.com>
X-Mailer: git-send-email 2.13.5
In-Reply-To: <20171023201055.21973-1-andrew.smirnov@gmail.com>
References: <20171023201055.21973-1-andrew.smirnov@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::244
Subject: [Qemu-arm] [PATCH v2 24/27] i.MX: Add code to emulate i.MX7 ADC IP
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
X-TUID: QnfT5QeeFYqw

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
2.13.5

