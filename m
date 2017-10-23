Received: by 10.223.161.27 with SMTP id o27csp236862wro;
        Mon, 23 Oct 2017 13:21:14 -0700 (PDT)
X-Received: by 10.129.131.212 with SMTP id t203mr9767542ywf.314.1508790074596;
        Mon, 23 Oct 2017 13:21:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1508790074; cv=none;
        d=google.com; s=arc-20160816;
        b=HPaEEOO89U6CO4N+9PT79H07t14WLJiMeAQ46SDSLsEepDpz8AYRhIrn7rQ4hLV0GH
         N8yR1HjXcubtzM5bZzhG3B6wkAgM6ccXS7jU8RgxU11tThjukoOpsu45johiTsHvOhkI
         ZjE+M29kDegoak2IG1C/EXyMIhskr9Kz8CzimBZNVwOyCfJeuV8D4NYyYnbUgB7QGgUW
         zimHiITbOIKavfykdITzpUlqegutNmYFgE/Q71ghq5lU9469WjZMux47y42Pdb1LO1Yb
         tKqq7tX5JmsleynEbTvhvRWanFL+seQ4/IvVvHpAAzKO/7d1jOtdYVgl5DYmkHb0CCUL
         vO3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=BP2wjUTzBiiI1GdGtAFFSlKFOluJorl+FYgJoXEQHkM=;
        b=ZzHhCx/mWv/Tte152Kuhn7ynOSkWs88GAjAuZ3xeb9crustYMqo0CSPEepqGD5NEA1
         ZebaY9aS9J/XUAwRNg+AS3s/gA21PozhUg7qBrIp+HEr496mzSQyVqkCuQx6nerC/23o
         9PsCFMXwK2mbr4HkKU5L/8YdxGX/i2zLDBEMyUdZ5NI+mP+IS0Ua1J7ykiyp4zk3LmdP
         m4bVz4U/4vRKJ10gSkt+8bKz9XluS+mWCm/ZJjq82BrCJTht2KcjYMY7M0UcU72E6DGF
         WID6jGhc9ldFfeyebmxTFh84K4koeUS04KKbvPtx5E3U2dhN4YSAk1u6blwyJDuGswjw
         Skbw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=MC/sRKLB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v22si1355528ybd.779.2017.10.23.13.21.14
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 23 Oct 2017 13:21:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=MC/sRKLB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:40425 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e6jDl-0008NK-Rz
	for alex.bennee@linaro.org; Mon, 23 Oct 2017 16:21:13 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46424)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1e6j4V-0000Td-3p
	for qemu-arm@nongnu.org; Mon, 23 Oct 2017 16:11:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1e6j4T-0002aU-Ib
	for qemu-arm@nongnu.org; Mon, 23 Oct 2017 16:11:39 -0400
Received: from mail-pg0-x243.google.com ([2607:f8b0:400e:c05::243]:43242)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <andrew.smirnov@gmail.com>)
	id 1e6j4T-0002aF-82; Mon, 23 Oct 2017 16:11:37 -0400
Received: by mail-pg0-x243.google.com with SMTP id s75so12631023pgs.0;
	Mon, 23 Oct 2017 13:11:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=BP2wjUTzBiiI1GdGtAFFSlKFOluJorl+FYgJoXEQHkM=;
	b=MC/sRKLBld8sAOBhEyPFLlK7lKXaaIm4ADKYnK+SaAkjcG7Y2uEVCEKLZowwqmcs3J
	ioq88x0rcjbMVZufsKyDwadpqeII3omCQd6DDUKMvPOQqh8Bfj5Z5YKKou9OB5Khjlyc
	k1GyfHermKnYX2CZiRonbQ7/WE798jz3lnOyr+Cma3GngF9nM217VdpfYiaEwjBNsr3n
	BW+soWghh5VDKy1eOjMKYpKRt3BjCQtNrZgr8spGeOqdQWQm0hr1AoCHRJfUSKjFna5e
	9M8Q2WazcG9HzttaQP4RKPXUbik/uVomNe+MbSkRw8E3sPSQsgZWdo9Wt7T4daML5ie5
	8p0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=BP2wjUTzBiiI1GdGtAFFSlKFOluJorl+FYgJoXEQHkM=;
	b=S1XVd8RwWyKzxF5rS3dwvELKm1uuT18TpyNoV2cvHdg/8vSK7TCWJ/AQfjXF+NAPqS
	NEB6A0IT87Ij2G2tbyUudyrfj+91mVmmQyp9vfvZowfwFJWZsoCxunCrl2wiDcLMVudX
	f4IXmUEbmn6/2d87tFUBEFEZ+L2MZXKti1Dy/3cIhil6QpviTQ/C5QrFdHgm7VC0AcBH
	948fwuuUTn/F/psWqxOnIRnwx2o+3m9BoYZ2QFPXu6hVGimTqV23EoO5pceGLrZe0VoE
	VZ08AAy+Ghqxo13OV0NZs6FXfvEIMZwa34qwG/5D868QPj4GFS99Kj9khVrdUsTgxje1
	ZK9g==
X-Gm-Message-State: AMCzsaXsIu8iBJfQCjzSjdIEM9f1Qy6oNXgzaib4x6GzLuNi6EM9LFpF
	fgX7brbDqQrixe0sGD3LTGpi7eTK
X-Google-Smtp-Source: ABhQp+QYbzaSOJuZVJVTm8OjweprLuFZiaz41cwTGW49WhU0LYFvRM4eeCjYkQNw+MObGto/8QOfOA==
X-Received: by 10.98.194.16 with SMTP id l16mr14015416pfg.139.1508789496186;
	Mon, 23 Oct 2017 13:11:36 -0700 (PDT)
Received: from squirtle.westlake.spaceflightindustries.com ([173.226.206.194])
	by smtp.gmail.com with ESMTPSA id
	j1sm15181623pfj.108.2017.10.23.13.11.35
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 23 Oct 2017 13:11:35 -0700 (PDT)
From: Andrey Smirnov <andrew.smirnov@gmail.com>
To: qemu-arm@nongnu.org
Date: Mon, 23 Oct 2017 13:10:48 -0700
Message-Id: <20171023201055.21973-21-andrew.smirnov@gmail.com>
X-Mailer: git-send-email 2.13.5
In-Reply-To: <20171023201055.21973-1-andrew.smirnov@gmail.com>
References: <20171023201055.21973-1-andrew.smirnov@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::243
Subject: [Qemu-arm] [PATCH v2 20/27] i.MX: Add code to emulate FlexCAN IP
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
X-TUID: /fE2D/NoRqxt

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
 hw/misc/imx_flexcan.c         | 99 +++++++++++++++++++++++++++++++++++++++++++
 include/hw/misc/imx_flexcan.h | 22 ++++++++++
 3 files changed, 122 insertions(+)
 create mode 100644 hw/misc/imx_flexcan.c
 create mode 100644 include/hw/misc/imx_flexcan.h

diff --git a/hw/misc/Makefile.objs b/hw/misc/Makefile.objs
index 492c535330..943b22af40 100644
--- a/hw/misc/Makefile.objs
+++ b/hw/misc/Makefile.objs
@@ -38,6 +38,7 @@ obj-$(CONFIG_IMX) += imx7_ccm.o
 obj-$(CONFIG_IMX) += imx2_wdt.o
 obj-$(CONFIG_IMX) += imx7_snvs.o
 obj-$(CONFIG_IMX) += imx7_iomuxc.o
+obj-$(CONFIG_IMX) += imx_flexcan.o
 obj-$(CONFIG_MILKYMIST) += milkymist-hpdmc.o
 obj-$(CONFIG_MILKYMIST) += milkymist-pfpu.o
 obj-$(CONFIG_MAINSTONE) += mst_fpga.o
diff --git a/hw/misc/imx_flexcan.c b/hw/misc/imx_flexcan.c
new file mode 100644
index 0000000000..dd4d3d6dc1
--- /dev/null
+++ b/hw/misc/imx_flexcan.c
@@ -0,0 +1,99 @@
+/*
+ * Copyright (c) 2017, Impinj, Inc.
+ *
+ * i.MX FlexCAN block emulation code
+ *
+ * Author: Andrey Smirnov <andrew.smirnov@gmail.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+
+#include "qemu/osdep.h"
+#include "hw/misc/imx_flexcan.h"
+#include "qemu/log.h"
+
+static void imx_flexcan_reset(DeviceState *dev)
+{
+    IMXFlexCANState *s = IMX_FLEXCAN(dev);
+
+    memset(s->regs, 0, sizeof(s->regs));
+}
+
+static uint64_t imx_flexcan_read(void *opaque, hwaddr offset,
+                               unsigned size)
+{
+    IMXFlexCANState *s = opaque;
+    return s->regs[offset / sizeof(uint32_t)];
+}
+
+static void imx_flexcan_write(void *opaque, hwaddr offset,
+                            uint64_t value, unsigned size)
+{
+    IMXFlexCANState *s = opaque;
+    s->regs[offset / sizeof(uint32_t)] = value;
+}
+
+static const struct MemoryRegionOps imx_flexcan_ops = {
+    .read = imx_flexcan_read,
+    .write = imx_flexcan_write,
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
+static void imx_flexcan_init(Object *obj)
+{
+    SysBusDevice *sd = SYS_BUS_DEVICE(obj);
+    IMXFlexCANState *s = IMX_FLEXCAN(obj);
+
+    memory_region_init_io(&s->iomem,
+                          obj,
+                          &imx_flexcan_ops,
+                          s,
+                          TYPE_IMX_FLEXCAN ".iomem",
+                          sizeof(s->regs));
+    sysbus_init_mmio(sd, &s->iomem);
+}
+
+static const VMStateDescription vmstate_imx_flexcan = {
+    .name = TYPE_IMX_FLEXCAN,
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .fields = (VMStateField[]) {
+        VMSTATE_UINT32_ARRAY(regs, IMXFlexCANState, FLEXCAN_NUM),
+        VMSTATE_END_OF_LIST()
+    },
+};
+
+static void imx_flexcan_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+
+    dc->reset = imx_flexcan_reset;
+    dc->vmsd  = &vmstate_imx_flexcan;
+    dc->desc  = "i.MX FlexCAN Module";
+}
+
+static const TypeInfo imx_flexcan_info = {
+    .name          = TYPE_IMX_FLEXCAN,
+    .parent        = TYPE_SYS_BUS_DEVICE,
+    .instance_size = sizeof(IMXFlexCANState),
+    .instance_init = imx_flexcan_init,
+    .class_init    = imx_flexcan_class_init,
+};
+
+static void imx_flexcan_register_type(void)
+{
+    type_register_static(&imx_flexcan_info);
+}
+type_init(imx_flexcan_register_type)
diff --git a/include/hw/misc/imx_flexcan.h b/include/hw/misc/imx_flexcan.h
new file mode 100644
index 0000000000..da9980cf86
--- /dev/null
+++ b/include/hw/misc/imx_flexcan.h
@@ -0,0 +1,22 @@
+#ifndef IMX_FLEXCAN_H
+#define IMX_FLEXCAN_H
+
+#include "hw/sysbus.h"
+
+enum IMXFlexCANRegisters {
+    FLEXCAN_NUM = 0x9E0 / sizeof(uint32_t) + 1,
+};
+
+typedef struct IMXFlexCANState {
+    /*< private >*/
+    SysBusDevice parent_obj;
+
+    /*< public >*/
+    MemoryRegion iomem;
+    uint32_t     regs[FLEXCAN_NUM];
+} IMXFlexCANState;
+
+#define TYPE_IMX_FLEXCAN "imx-flexcan"
+#define IMX_FLEXCAN(obj) OBJECT_CHECK(IMXFlexCANState, (obj), TYPE_IMX_FLEXCAN)
+
+#endif /* IMX_FLEXCAN_H */
-- 
2.13.5

