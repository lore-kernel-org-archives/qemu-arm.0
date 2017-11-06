Received: by 10.223.150.237 with SMTP id u100csp2803228wrb;
        Mon, 6 Nov 2017 08:08:24 -0800 (PST)
X-Google-Smtp-Source: ABhQp+TSmSLyyz2VZxGHdu8KjKABWCh/Tf3fl9MxTySc0I6puwEDTfwaElIOmwM+K19EHVuPiqsx
X-Received: by 10.129.26.208 with SMTP id a199mr9651199ywa.280.1509984504011;
        Mon, 06 Nov 2017 08:08:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1509984504; cv=none;
        d=google.com; s=arc-20160816;
        b=Pvwy7/YNd4WpnXu6Dv8e+zImK/6Xbpl8gR26Zz0erRRF9QUTHpyxzSxd63N7qJzkiw
         sfnwLdwEJQ4EIUZhDYL7xRCix6iECuEDTiefFlUXkKw2js8F4bdrj6bcY7TMNdkhFffK
         Ljg2jRx2H63jVTH/ZRVDgLSbHDxu+htleCoOAa8fdS7gJ4M+VJ/QtaBYN2hbPVLnoiDh
         bjyUthh+yUDvnY7ScGvbSzP+UmvarU3Ge4XAQRUDxkF2HvUfGxEDrT9M8CwcjzGebDn1
         erLoin89ZqzIoXzgpXWdsfCFQD/qUBseSTGevWuiZhVSPMDO8i61tjC8RUddkE0zZruR
         k3zQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=CGPk7Ng1tIwV5S1MJFlEkA0gMhnET7XjfyWWWjY3dVQ=;
        b=QPgKHDXJ/jBybmdlm+lrl3d65vyKBuS6JQ+dySfp+U0CpfLwl50c3185tWgfx5hG5D
         FiW8NARruWmuG1LirTGVs1tvvl+Vl5vSHD/+CjkQCiG66EsoM0s9gP16xPnAt9jsN1H6
         2Tosm8eyMM8xjr/5uYq/itaGs3KcYqRykaB1eKmEJKar702DVoVipN4FAcoHCUvT8Cg3
         z+rBVNM33YoJ21s0ifb+mkkvvFukFBqHl396SWZ1N02z6Rwq6bizcUXkS53TsayXFBTb
         RDRkR6QFizKTvldH+j/6wehWsy+mvvRyqoyDEzcTv7bh/hg+ymEjt13EEGCZLbAiSeda
         ml4A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=UA7S/cdc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v64si2806405ywd.630.2017.11.06.08.08.23
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 06 Nov 2017 08:08:23 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=UA7S/cdc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:48886 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eBjwl-0007Gs-Cy
	for alex.bennee@linaro.org; Mon, 06 Nov 2017 11:08:23 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34046)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1eBje6-0007Xn-2y
	for qemu-arm@nongnu.org; Mon, 06 Nov 2017 10:49:10 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1eBje1-0000jl-JI
	for qemu-arm@nongnu.org; Mon, 06 Nov 2017 10:49:06 -0500
Received: from mail-pg0-x241.google.com ([2607:f8b0:400e:c05::241]:43188)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <andrew.smirnov@gmail.com>)
	id 1eBje1-0000ij-DW; Mon, 06 Nov 2017 10:49:01 -0500
Received: by mail-pg0-x241.google.com with SMTP id s75so8527542pgs.0;
	Mon, 06 Nov 2017 07:49:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=CGPk7Ng1tIwV5S1MJFlEkA0gMhnET7XjfyWWWjY3dVQ=;
	b=UA7S/cdcLzOiLN16spc4qXDdlcmM4J6mjaQSEdqiTDm8JWPpSuvxFK9mFYWfkDMHLm
	0Gty0T+0kK2cWx6PNbdMOkzwP/3BztNreN2CVXk/UATLdYPQyQ1iBo7DU02DmTqTJoGq
	Aw87r3D+NE2BnfbrXgQFmF1Dk7WuYQ3VpGIK09dszyLPsUESyCbv/i9CPbpbdEDN+quf
	UIR1POHUbZ31ucVNw3sJn5H41AtEV5aaSszFo2NUiCK3apaWhd/JfYV+fOdPH4EaQAA3
	jMFqQUtwHLZbcXhItH7j08Br74FrXKBJZ0i/dEt7oEjk7Lrs0E1wloBgagyuYSyhTWsE
	2+nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=CGPk7Ng1tIwV5S1MJFlEkA0gMhnET7XjfyWWWjY3dVQ=;
	b=oSDRhGgAKRtMzoJI7hCA1H04lxpVVK9xQNyFh0WnjG7xhn9GfBxwkYalHzYN5n3r8v
	f6obSG1ir6FBZoEI/lnjgOHK0QcHxhPbsiX2pyC4eEGrbOtrRO87fzOpS4txGcztmhfU
	Uhc6TQqZYKPOAtI3J40ZLwwc1GITMmJcLK0gMIl96yj9dR3Iwv/+3VDX4RHNeCx9pT7Z
	62REXAnG8835EZ6JZ7OQrP1FpriAMsPcD1gGRUGEsDUCzAswXvNXonuka6zN48db8wFl
	fd/EHoJ61R8yOPDB+lEKPVxARAG0UO6JT/FnX7XkF1MzPKxTVeU6I2KU7SgIDG2AQ+D5
	7+/Q==
X-Gm-Message-State: AMCzsaUgGDs2xbIjBZjqnyoLSX+QDSY1wrNDO+jsAW2DjCffjb5nKX+M
	jeE/Zga+2Gapfmu/uzAQuWUvdgsjs2w=
X-Received: by 10.84.128.72 with SMTP id 66mr14840683pla.250.1509983340156;
	Mon, 06 Nov 2017 07:49:00 -0800 (PST)
Received: from squirtle.lan (c-24-22-235-96.hsd1.wa.comcast.net.
	[24.22.235.96]) by smtp.gmail.com with ESMTPSA id
	x1sm22719590pfh.113.2017.11.06.07.48.59
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 06 Nov 2017 07:48:59 -0800 (PST)
From: Andrey Smirnov <andrew.smirnov@gmail.com>
To: qemu-arm@nongnu.org
Date: Mon,  6 Nov 2017 07:48:11 -0800
Message-Id: <20171106154813.19936-29-andrew.smirnov@gmail.com>
X-Mailer: git-send-email 2.13.6
In-Reply-To: <20171106154813.19936-1-andrew.smirnov@gmail.com>
References: <20171106154813.19936-1-andrew.smirnov@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::241
Subject: [Qemu-arm] [PATCH v3 28/30] i.MX: Add code to emulate i.MX LCD block
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
X-TUID: F4KhMFaeCPoI

Add basic i.MX LCD block emulation code needed to boot Linux guest.

Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: Jason Wang <jasowang@redhat.com>
Cc: Philippe Mathieu-Daudé <f4bug@amsat.org>
Cc: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Cc: yurovsky@gmail.com
Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
---
 hw/display/Makefile.objs       |  2 ++
 hw/display/imx_lcdif.c         | 71 ++++++++++++++++++++++++++++++++++++++++++
 include/hw/display/imx_lcdif.h | 16 ++++++++++
 3 files changed, 89 insertions(+)
 create mode 100644 hw/display/imx_lcdif.c
 create mode 100644 include/hw/display/imx_lcdif.h

diff --git a/hw/display/Makefile.objs b/hw/display/Makefile.objs
index 551c050a6a..a7b34be231 100644
--- a/hw/display/Makefile.objs
+++ b/hw/display/Makefile.objs
@@ -41,3 +41,5 @@ virtio-gpu-3d.o-cflags := $(VIRGL_CFLAGS)
 virtio-gpu-3d.o-libs += $(VIRGL_LIBS)
 obj-$(CONFIG_DPCD) += dpcd.o
 obj-$(CONFIG_XLNX_ZYNQMP) += xlnx_dp.o
+
+obj-$(CONFIG_IMX) += imx_lcdif.o
diff --git a/hw/display/imx_lcdif.c b/hw/display/imx_lcdif.c
new file mode 100644
index 0000000000..1d7ad4a77b
--- /dev/null
+++ b/hw/display/imx_lcdif.c
@@ -0,0 +1,71 @@
+/*
+ * Copyright (c) 2017, Impinj, Inc.
+ *
+ * i.MX LCD block emulation code
+ *
+ * Author: Andrey Smirnov <andrew.smirnov@gmail.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+
+#include "qemu/osdep.h"
+#include "hw/display/imx_lcdif.h"
+#include "qemu/log.h"
+
+static uint64_t imx_lcdif_read(void *opaque, hwaddr offset,
+                               unsigned size)
+{
+    return 0;
+}
+
+static void imx_lcdif_write(void *opaque, hwaddr offset,
+                            uint64_t value, unsigned size)
+{
+}
+
+static const struct MemoryRegionOps imx_lcdif_ops = {
+    .read       = imx_lcdif_read,
+    .write      = imx_lcdif_write,
+    .endianness = DEVICE_NATIVE_ENDIAN,
+    .impl = {
+        .min_access_size = 4,
+        .max_access_size = 4,
+        .unaligned       = false,
+    },
+};
+
+static void imx_lcdif_init(Object *obj)
+{
+    SysBusDevice *sd = SYS_BUS_DEVICE(obj);
+    IMXLCDState *s = IMX_LCDIF(obj);
+
+    memory_region_init_io(&s->iomem,
+                          obj,
+                          &imx_lcdif_ops,
+                          s,
+                          TYPE_IMX_LCDIF ".iomem",
+                          0x10000);
+    sysbus_init_mmio(sd, &s->iomem);
+}
+
+static void imx_lcdif_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+
+    dc->desc  = "i.MX LCD Controller";
+}
+
+static const TypeInfo imx_lcdif_info = {
+    .name          = TYPE_IMX_LCDIF,
+    .parent        = TYPE_SYS_BUS_DEVICE,
+    .instance_size = sizeof(IMXLCDState),
+    .instance_init = imx_lcdif_init,
+    .class_init    = imx_lcdif_class_init,
+};
+
+static void imx_lcdif_register_type(void)
+{
+    type_register_static(&imx_lcdif_info);
+}
+type_init(imx_lcdif_register_type)
diff --git a/include/hw/display/imx_lcdif.h b/include/hw/display/imx_lcdif.h
new file mode 100644
index 0000000000..51985d3054
--- /dev/null
+++ b/include/hw/display/imx_lcdif.h
@@ -0,0 +1,16 @@
+#ifndef IMX_LCDIF_H
+#define IMX_LCDIF_H
+
+#include "hw/sysbus.h"
+
+typedef struct IMXLCDState {
+    /*< private >*/
+    SysBusDevice parent_obj;
+
+    MemoryRegion iomem;
+} IMXLCDState;
+
+#define TYPE_IMX_LCDIF "imx:lcdif"
+#define IMX_LCDIF(obj) OBJECT_CHECK(IMXLCDState, (obj), TYPE_IMX_LCDIF)
+
+#endif /* IMX_LCDIF_H */
-- 
2.13.6

