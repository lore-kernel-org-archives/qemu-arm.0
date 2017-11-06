Received: by 10.223.150.237 with SMTP id u100csp2801619wrb;
        Mon, 6 Nov 2017 08:06:52 -0800 (PST)
X-Google-Smtp-Source: ABhQp+SYAcfKtxJ4INgWyov5nMiitjTdmOaJnHoatibQcNqBwxHbcxl80DcKlC0lXuHb8Ew/7vwl
X-Received: by 10.129.117.9 with SMTP id q9mr10395601ywc.79.1509984412353;
        Mon, 06 Nov 2017 08:06:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1509984412; cv=none;
        d=google.com; s=arc-20160816;
        b=RyiXRKjp+MtP+mIoHXcs74N6sjPPv8T6c2lTbPfwU/Qc3t2ep7O/rTJsY5fwjw/E49
         pj1KnPaFT2cNCyzD+pRDHWLjIy1sEZzbjjnI+o7zYo5Y3yWRbXUAxMiib0GElAHYQGO9
         O1vioJWM8UOtOgcMCi/jafrl3NP1n0vOKJJYhWO+B5felqZdCUrGoNvz6HNh4AggUJhv
         m0EL6Kc7oL0DWJeCTqlOQnBYxkG38zrIrd6yDoAq7fXWZY0UVAVcOz1eE82lMP3rtH/0
         EeDohZ6rJ3GKXz5RLVIdfMWGP9QqvSjcSFD0dux3DHX0DgxhZ6+4YK71xRo8OU/FvD9c
         2/PA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=N1ZnmuYRonRpkjXoeq4cTKhyAwmMupUymvJbG2fPWH4=;
        b=pLmElbJJ8YdHPwuo/PBK8ht345KhElyhsmvRVZttn1Bt5tfso6ab5+beVeIcG/YBUQ
         rIp2CuRQlBWkhjEAGAniOwNY/x8ncrI6gwoE/bnuNH9R8smO3/WCnNzC3XKLWhu10m2z
         sgAg4/Ls2TMmcoM4SDmHB6rkga8M7hqdddkM9te3s3CAdGOe21I0t3G2+xqnEOTh6fUb
         +LgJ0HSktQdAscgfo8S9m3Wu2oQvka54npX0ckWR3ScEIM+VPM2VCnPEoRLKgB0XBSzG
         9ABLwgrJyU3GD0EjKu7Z65xVo6z0RQ1MyFZS52p30MTENVJ8Od0ITNLgVejbUL6gTpoD
         NU8Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=OYi6Vf+G;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q17si2659495ybm.658.2017.11.06.08.06.52
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 06 Nov 2017 08:06:52 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=OYi6Vf+G;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:48878 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eBjvH-0005LF-JP
	for alex.bennee@linaro.org; Mon, 06 Nov 2017 11:06:51 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33980)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1eBje2-0007W5-WE
	for qemu-devel@nongnu.org; Mon, 06 Nov 2017 10:49:05 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1eBje1-0000jz-Op
	for qemu-devel@nongnu.org; Mon, 06 Nov 2017 10:49:03 -0500
Received: from mail-pg0-x242.google.com ([2607:f8b0:400e:c05::242]:49471)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <andrew.smirnov@gmail.com>)
	id 1eBjdy-0000gR-1e; Mon, 06 Nov 2017 10:48:58 -0500
Received: by mail-pg0-x242.google.com with SMTP id g6so8511304pgn.6;
	Mon, 06 Nov 2017 07:48:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=N1ZnmuYRonRpkjXoeq4cTKhyAwmMupUymvJbG2fPWH4=;
	b=OYi6Vf+G0LJynkxL0KUYEgwdVyffLHXflANNeaoV5/pSiWHEsADrJD4YKkCXWO4HSH
	PQaQWJn84qm9K7o1w93Ir2PrPfUcD0OMpnB6tMlag/AaR+0VtA34KLI8f2uuZsIHlcc4
	XchStsXFzGfZK2Wwsfg+0mQPCkqkIFxEBM+HjKMO2I1uQ8uz7/hqG1sbzE4dFLUkHR53
	7PgWy2+o8SouR7O/wZk1db0GPYb+DNKCKWNoru51p7gqEBQeA18VyTnpCb/8y5RhWNuP
	lXWuI//QePYEj4Fe+JRm69jsaFFdC+027JvDGi6OMCikPOGv/nx3cJu7UuE+MVAjxKXb
	c3MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=N1ZnmuYRonRpkjXoeq4cTKhyAwmMupUymvJbG2fPWH4=;
	b=T1qSIcIc59QB3/lmm777f2JSILsrwQrrQfNIQTtqP9K6FJlBDsTP4Yo5x8m5zglWby
	8QI3schl/Q+gPoo7Qp6qWnPmhoH0hz8vcTMvSBz5+oTaivifNz89hVJfZoCMjX3zEPsz
	kU16lLh7ViRIjYa1WDXWFe8K8OEk18EPgSfP5P0tqlUikTtk8FlfGT1zrabvuU2+NTfH
	ANdTYJwP32JtI+ltPwk8REBSBShW3GPUsnCrESmzwJCvk5fU9leoy5CBHMFTfPO1vVb2
	b/oM1tlIqqb19xtDzH+onEKmg5LYI/eDkhiDJycva7SXKEcpyL2hAzlMAbW4yGGj2+48
	GJJg==
X-Gm-Message-State: AMCzsaW2MFj0XbEvfvvzsPDZPakUbE0Pezp2/1InNAwy+R0ZYTITsqeC
	Q+3r5UPiAEsZWD3NYNpTQUlp2014WQk=
X-Received: by 10.99.44.214 with SMTP id s205mr15510871pgs.80.1509983336796;
	Mon, 06 Nov 2017 07:48:56 -0800 (PST)
Received: from squirtle.lan (c-24-22-235-96.hsd1.wa.comcast.net.
	[24.22.235.96]) by smtp.gmail.com with ESMTPSA id
	x1sm22719590pfh.113.2017.11.06.07.48.55
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 06 Nov 2017 07:48:56 -0800 (PST)
From: Andrey Smirnov <andrew.smirnov@gmail.com>
To: qemu-arm@nongnu.org
Date: Mon,  6 Nov 2017 07:48:08 -0800
Message-Id: <20171106154813.19936-26-andrew.smirnov@gmail.com>
X-Mailer: git-send-email 2.13.6
In-Reply-To: <20171106154813.19936-1-andrew.smirnov@gmail.com>
References: <20171106154813.19936-1-andrew.smirnov@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::242
Subject: [Qemu-devel] [PATCH v3 25/30] i.MX: Add code to emulate i.MX7 SRC
 IP-block
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
X-TUID: g8GS2ZLgU0Fg

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
 hw/misc/imx7_src.c         | 93 ++++++++++++++++++++++++++++++++++++++++++++++
 include/hw/misc/imx7_src.h | 22 +++++++++++
 3 files changed, 116 insertions(+)
 create mode 100644 hw/misc/imx7_src.c
 create mode 100644 include/hw/misc/imx7_src.h

diff --git a/hw/misc/Makefile.objs b/hw/misc/Makefile.objs
index b578bd0cba..6c0bf4d519 100644
--- a/hw/misc/Makefile.objs
+++ b/hw/misc/Makefile.objs
@@ -41,6 +41,7 @@ obj-$(CONFIG_IMX) += imx7_iomuxc.o
 obj-$(CONFIG_IMX) += imx_flexcan.o
 obj-$(CONFIG_IMX) += imx7_adc.o
 obj-$(CONFIG_IMX) += imx7_gpr.o
+obj-$(CONFIG_IMX) += imx7_src.o
 obj-$(CONFIG_MILKYMIST) += milkymist-hpdmc.o
 obj-$(CONFIG_MILKYMIST) += milkymist-pfpu.o
 obj-$(CONFIG_MAINSTONE) += mst_fpga.o
diff --git a/hw/misc/imx7_src.c b/hw/misc/imx7_src.c
new file mode 100644
index 0000000000..2634e60ad7
--- /dev/null
+++ b/hw/misc/imx7_src.c
@@ -0,0 +1,93 @@
+/*
+ * Copyright (c) 2017, Impinj, Inc.
+ *
+ * i.MX7 SRC block emulation code
+ *
+ * Author: Andrey Smirnov <andrew.smirnov@gmail.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+
+#include "qemu/osdep.h"
+#include "hw/misc/imx7_src.h"
+#include "qemu/log.h"
+
+static void imx7_src_reset(DeviceState *dev)
+{
+    IMX7SRCState *s = IMX7_SRC(dev);
+
+    memset(s->regs, 0, sizeof(s->regs));
+}
+
+static uint64_t imx7_src_read(void *opaque, hwaddr offset,
+                               unsigned size)
+{
+    IMX7SRCState *s = opaque;
+    return s->regs[offset / sizeof(uint32_t)];
+}
+
+static void imx7_src_write(void *opaque, hwaddr offset,
+                            uint64_t value, unsigned size)
+{
+    IMX7SRCState *s = opaque;
+    s->regs[offset / sizeof(uint32_t)] = value;
+}
+
+static const struct MemoryRegionOps imx7_src_ops = {
+    .read       = imx7_src_read,
+    .write      = imx7_src_write,
+    .endianness = DEVICE_NATIVE_ENDIAN,
+    .impl = {
+        .min_access_size = 4,
+        .max_access_size = 4,
+        .unaligned       = false,
+    },
+};
+
+static void imx7_src_init(Object *obj)
+{
+    SysBusDevice *sd = SYS_BUS_DEVICE(obj);
+    IMX7SRCState *s = IMX7_SRC(obj);
+
+    memory_region_init_io(&s->iomem,
+                          obj,
+                          &imx7_src_ops,
+                          s,
+                          TYPE_IMX7_SRC ".iomem",
+                          sizeof(s->regs));
+    sysbus_init_mmio(sd, &s->iomem);
+}
+
+static const VMStateDescription vmstate_imx7_src = {
+    .name = TYPE_IMX7_SRC,
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .fields = (VMStateField[]) {
+        VMSTATE_UINT32_ARRAY(regs, IMX7SRCState, SRC_NUM),
+        VMSTATE_END_OF_LIST()
+    },
+};
+
+static void imx7_src_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+
+    dc->reset = imx7_src_reset;
+    dc->vmsd  = &vmstate_imx7_src;
+    dc->desc  = "i.MX7 System Reset Controller";
+}
+
+static const TypeInfo imx7_src_info = {
+    .name          = TYPE_IMX7_SRC,
+    .parent        = TYPE_SYS_BUS_DEVICE,
+    .instance_size = sizeof(IMX7SRCState),
+    .instance_init = imx7_src_init,
+    .class_init    = imx7_src_class_init,
+};
+
+static void imx7_src_register_type(void)
+{
+    type_register_static(&imx7_src_info);
+}
+type_init(imx7_src_register_type)
diff --git a/include/hw/misc/imx7_src.h b/include/hw/misc/imx7_src.h
new file mode 100644
index 0000000000..aaca091fa8
--- /dev/null
+++ b/include/hw/misc/imx7_src.h
@@ -0,0 +1,22 @@
+#ifndef IMX7_SRC_H
+#define IMX7_SRC_H
+
+#include "hw/sysbus.h"
+
+enum IMX7SRCRegisters {
+    SRC_NUM = 0x1000 / sizeof(uint32_t) + 1,
+};
+
+typedef struct IMX7SRCState {
+    /*< private >*/
+    SysBusDevice parent_obj;
+
+    /*< public >*/
+    MemoryRegion iomem;
+    uint32_t     regs[SRC_NUM];
+} IMX7SRCState;
+
+#define TYPE_IMX7_SRC "imx7-src"
+#define IMX7_SRC(obj) OBJECT_CHECK(IMX7SRCState, (obj), TYPE_IMX7_SRC)
+
+#endif /* IMX7_SRC_H */
-- 
2.13.6

