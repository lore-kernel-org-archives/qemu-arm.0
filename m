Received: by 10.223.150.237 with SMTP id u100csp2788784wrb;
        Mon, 6 Nov 2017 07:54:54 -0800 (PST)
X-Google-Smtp-Source: ABhQp+TpnmVgKfMnMnznpqtthGgcMW6+b3Bh2gqO2OIuCpSU46dLVrTf52f958JNeewAwextcnoQ
X-Received: by 10.129.112.72 with SMTP id l69mr9916302ywc.63.1509983694509;
        Mon, 06 Nov 2017 07:54:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1509983694; cv=none;
        d=google.com; s=arc-20160816;
        b=o0K23r/JImSq+MKGy7jwKTmEyjZ7HJpQMqJEKPUTv5A008nJmN4kNm4CNUfTcO3tUj
         NSQe41GcOs8ultg2Pss6N+twHqE7eqATK/PmgM7vqIPYojuGlV7bLS5DEkumXzPkvWJj
         NjOXFGs28/r+9Fu3UgOxEipeWzIVdTnuU2e8j8nVWxbXsvzSON7173UPw5FytUYQVwrs
         o2Fk6rXjp0fI7DZk9p2ZvXKWjKEGviwaXiuOgHAE+MlbY0JR5NaRnRHaIUCrvPzgZITo
         rXIAVRm4u/1CGv1+3BHm/Nq/hvRAht/ViVkATKj96ko5Y+PauhykflZRlgVC8gEauRyo
         kGCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=CXPwIs0XKpIGF/8KwUCGHQvDap798u23+J2FrHWZfKc=;
        b=aEjhMY6UUkvmaHpcLQCIvArs773Pjg62IgDvDPyNmZc/9EUHXrFvJYsG4Qp2/BcfNu
         xOnYCpZrnlgXhpdXb8LNN4T7/Tlg/DcgxxfVHXwrUvAknHRpJNzpI4OQMVGhkb/48hbI
         zor3ScuOpHkf+gqXKWo1ASAyP5O4bifXr9exMQMMudyfz0ek119MsHVgkE2IFjh+j6ux
         pWDwpy1Hk4ZlV6SIdV6SFCiLMLN0oeJJW8KYeq/DinkrQE8FStqJvNSTIbYikg66b9m9
         scMFipyhYrRaK9g+cFNPqpRll4eLcw/1ozXK7f2/rzHWyHVKgRXAQDMsHn9+In5Ip2GV
         uXYQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Bp/rFCes;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q204si2753264ybq.106.2017.11.06.07.54.54
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 06 Nov 2017 07:54:54 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Bp/rFCes;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:48797 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eBjjh-0003xA-S9
	for alex.bennee@linaro.org; Mon, 06 Nov 2017 10:54:53 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33622)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1eBjdn-0007E9-Pe
	for qemu-arm@nongnu.org; Mon, 06 Nov 2017 10:48:51 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1eBjdm-0000YI-Ky
	for qemu-arm@nongnu.org; Mon, 06 Nov 2017 10:48:47 -0500
Received: from mail-pf0-x231.google.com ([2607:f8b0:400e:c00::231]:44545)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <andrew.smirnov@gmail.com>)
	id 1eBjdm-0000XX-CF; Mon, 06 Nov 2017 10:48:46 -0500
Received: by mail-pf0-x231.google.com with SMTP id x7so8028810pfa.1;
	Mon, 06 Nov 2017 07:48:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=CXPwIs0XKpIGF/8KwUCGHQvDap798u23+J2FrHWZfKc=;
	b=Bp/rFCesyi2njrSGlwJMxYsDVNG1NHZlZ9N24i4+/p/kbM/73tXOAyicdmYfZqf+jU
	/gIkhoCsiSJCr6RLKnSmFJWs0zdqu0W+NIlDCAGuDQhkT9A+DO2KTt8P2/Km5rnbFc2h
	uT4p+Pmvnz06907/Z8ocLbpgVlNGljt7zkJcY5bY/nmY3uqPCrfn5D/bazFbdDKrABND
	Ih7s5RDAGyjJw9RgWvgmcJ4q2TkdzKXeMsHgd4SMncMzHBqsgh0vQeNtuEhszgDebOYf
	q5wMcSW9GLtEIxuw0vI7JfjDkMgNOznZK9vyhC5KqiE7fV+XgXfbgdqa+TdGaW7Wkfz8
	YusQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=CXPwIs0XKpIGF/8KwUCGHQvDap798u23+J2FrHWZfKc=;
	b=mWqmUGtksH2OosbyIB+UwWN2OSVNIzIY8/kZkvnABsM/+RqX+bRodiP2ejoxczffJN
	wRPWOup+sxzZGhggGigKNm7RhKB7URWJIRPo4A95E8oCEt82lWpFnYhi496vBy0rkjxY
	cyO0mz2pgW9R9DtJ+i4g7BKcc01w76MTiAPitozbBiH98J7BdJ5lGN9H35jRnMj67Zf/
	ZbvNLSqy07kIfQsKBnYdVT5EuOAiMHe+8RMH0vayg3GDNjQyFCjpST4AhZGvt4FdIUmM
	+ZjOZErpX6Ds8hq2CubALihhuHDGTHUp/tqvIFviUAmQVn8RKZtCT0p6JNLMonpV5s3Y
	YnJg==
X-Gm-Message-State: AMCzsaXnGpcq12cFmG+fhSCQgTC1p/mYXhFu4dsdMVP4hvSEtXzVvnAJ
	bcGLbqjqyqVpCb72t04M369FZ3hslXQ=
X-Received: by 10.98.245.66 with SMTP id n63mr17529953pfh.102.1509983325025;
	Mon, 06 Nov 2017 07:48:45 -0800 (PST)
Received: from squirtle.lan (c-24-22-235-96.hsd1.wa.comcast.net.
	[24.22.235.96]) by smtp.gmail.com with ESMTPSA id
	x1sm22719590pfh.113.2017.11.06.07.48.43
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 06 Nov 2017 07:48:44 -0800 (PST)
From: Andrey Smirnov <andrew.smirnov@gmail.com>
To: qemu-arm@nongnu.org
Date: Mon,  6 Nov 2017 07:47:58 -0800
Message-Id: <20171106154813.19936-16-andrew.smirnov@gmail.com>
X-Mailer: git-send-email 2.13.6
In-Reply-To: <20171106154813.19936-1-andrew.smirnov@gmail.com>
References: <20171106154813.19936-1-andrew.smirnov@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c00::231
Subject: [Qemu-arm] [PATCH v3 15/30] i.MX: Add code to emulate i.MX7 SNVS
 IP-block
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
X-TUID: 2lU3VwZ9UAV0

Add code to emulate SNVS IP-block. Currently only the bits needed to
be able to emulate machine shutdown are implemented.

Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: Jason Wang <jasowang@redhat.com>
Cc: Philippe Mathieu-Daudé <f4bug@amsat.org>
Cc: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Cc: yurovsky@gmail.com
Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
---
 hw/misc/Makefile.objs       |  1 +
 hw/misc/imx7_snvs.c         | 83 +++++++++++++++++++++++++++++++++++++++++++++
 include/hw/misc/imx7_snvs.h | 35 +++++++++++++++++++
 3 files changed, 119 insertions(+)
 create mode 100644 hw/misc/imx7_snvs.c
 create mode 100644 include/hw/misc/imx7_snvs.h

diff --git a/hw/misc/Makefile.objs b/hw/misc/Makefile.objs
index c393a93456..16cee88e0f 100644
--- a/hw/misc/Makefile.objs
+++ b/hw/misc/Makefile.objs
@@ -36,6 +36,7 @@ obj-$(CONFIG_IMX) += imx6_ccm.o
 obj-$(CONFIG_IMX) += imx6_src.o
 obj-$(CONFIG_IMX) += imx7_ccm.o
 obj-$(CONFIG_IMX) += imx2_wdt.o
+obj-$(CONFIG_IMX) += imx7_snvs.o
 obj-$(CONFIG_MILKYMIST) += milkymist-hpdmc.o
 obj-$(CONFIG_MILKYMIST) += milkymist-pfpu.o
 obj-$(CONFIG_MAINSTONE) += mst_fpga.o
diff --git a/hw/misc/imx7_snvs.c b/hw/misc/imx7_snvs.c
new file mode 100644
index 0000000000..670b9f4639
--- /dev/null
+++ b/hw/misc/imx7_snvs.c
@@ -0,0 +1,83 @@
+/*
+ * IMX7 Secure Non-Volatile Storage
+ *
+ * Copyright (c) 2017, Impinj, Inc.
+ *
+ * Author: Andrey Smirnov <andrew.smirnov@gmail.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ *
+ * Bare minimum emulation code needed to support being able to shut
+ * down linux guest gracefully.
+ */
+
+#include "qemu/osdep.h"
+#include "hw/misc/imx7_snvs.h"
+#include "qemu/log.h"
+#include "sysemu/sysemu.h"
+
+static uint64_t imx7_snvs_read(void *opaque, hwaddr offset, unsigned size)
+{
+    return 0;
+}
+
+static void imx7_snvs_write(void *opaque, hwaddr offset,
+                            uint64_t v, unsigned size)
+{
+    const uint32_t value = v;
+    const uint32_t mask  = SNVS_LPCR_TOP | SNVS_LPCR_DP_EN;
+
+    if (offset == SNVS_LPCR && ((value & mask) == mask)) {
+        qemu_system_shutdown_request(SHUTDOWN_CAUSE_GUEST_SHUTDOWN);
+    }
+}
+
+static const struct MemoryRegionOps imx7_snvs_ops = {
+    .read = imx7_snvs_read,
+    .write = imx7_snvs_write,
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
+static void imx7_snvs_init(Object *obj)
+{
+    SysBusDevice *sd = SYS_BUS_DEVICE(obj);
+    IMX7SNVSState *s = IMX7_SNVS(obj);
+
+    memory_region_init_io(&s->mmio, obj, &imx7_snvs_ops, s,
+                          TYPE_IMX7_SNVS, 0x1000);
+
+    sysbus_init_mmio(sd, &s->mmio);
+}
+
+static void imx7_snvs_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+
+    dc->desc  = "i.MX7 Secure Non-Volatile Storage Module";
+}
+
+static const TypeInfo imx7_snvs_info = {
+    .name          = TYPE_IMX7_SNVS,
+    .parent        = TYPE_SYS_BUS_DEVICE,
+    .instance_size = sizeof(IMX7SNVSState),
+    .instance_init = imx7_snvs_init,
+    .class_init    = imx7_snvs_class_init,
+};
+
+static void imx7_snvs_register_type(void)
+{
+    type_register_static(&imx7_snvs_info);
+}
+type_init(imx7_snvs_register_type)
diff --git a/include/hw/misc/imx7_snvs.h b/include/hw/misc/imx7_snvs.h
new file mode 100644
index 0000000000..255f8f26f9
--- /dev/null
+++ b/include/hw/misc/imx7_snvs.h
@@ -0,0 +1,35 @@
+/*
+ * Copyright (c) 2017, Impinj, Inc.
+ *
+ * i.MX7 SNVS block emulation code
+ *
+ * Author: Andrey Smirnov <andrew.smirnov@gmail.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+
+#ifndef IMX7_SNVS_H
+#define IMX7_SNVS_H
+
+#include "qemu/bitops.h"
+#include "hw/sysbus.h"
+
+
+enum IMX7SNVSRegisters {
+    SNVS_LPCR = 0x38,
+    SNVS_LPCR_TOP   = BIT(6),
+    SNVS_LPCR_DP_EN = BIT(5)
+};
+
+#define TYPE_IMX7_SNVS "imx7.snvs"
+#define IMX7_SNVS(obj) OBJECT_CHECK(IMX7SNVSState, (obj), TYPE_IMX7_SNVS)
+
+typedef struct IMX7SNVSState {
+    /* <private> */
+    SysBusDevice parent_obj;
+
+    MemoryRegion mmio;
+} IMX7SNVSState;
+
+#endif /* IMX7_SNVS_H */
-- 
2.13.6

