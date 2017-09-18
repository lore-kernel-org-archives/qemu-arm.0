Received: by 10.223.172.38 with SMTP id v35csp4146827wrc;
        Mon, 18 Sep 2017 13:02:16 -0700 (PDT)
X-Received: by 10.55.98.214 with SMTP id w205mr20594207qkb.355.1505764935952;
        Mon, 18 Sep 2017 13:02:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1505764935; cv=none;
        d=google.com; s=arc-20160816;
        b=tGQw8nrTlFGspGpctAlU/3LBmJnPVCgzRi6XjZDFAnWGBzk0X6t0hK2g1HKXm6/5Xu
         JAvGJxaXUXWhpZvjPNU/hwv/nSlpr5uDHi3psf0+XFAxX2HUiGhjYyB92/ztonP+gjby
         T7WCKMF3iFfiTxDZM9IKvhTPnRC/IC6l+u5SE37yfIZBUKf0KRFYhZK92zel5wedxiGK
         NlfpKnFX3lyeRqW97FqhK6p9Jx3eTbQcTazaPh93I5GAdsE9K7sT0rS/Ij6oK121dms5
         dqwcpnIkQyKzMVn38niF9d+HnBbrQlNLfkb8a/WcKs2yyOE2bBusuxIPijFdsvyXhSfF
         yLrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=6p+10rc6YYbqewfpta9jJYHFIPg1mG9RV6MDxk6YOZ8=;
        b=Xm8RvgEhs0+UYpT7KVP/glN5oGCCTbQNwruRbD4nckBnogGBIyS3P2/ojsyZc2blHD
         8SwjNypKvDhWr2H8lmJpKoz8AlDEvDujIvUe2k3KXyyIiHdP5zEqlMVVdoy4GrTQOvAW
         EjL77sTXlffLuNvbvxAEF40BG5Q2g4KstjzyoWccoB31dG/IyheZ33g156P5IIFKCEne
         TmSFGWHyvj3Bk7pBCXozO51bc+T/PpzJJ+y3dmh/2giQe03nyF+C0zF1Src6CYqI6VTx
         Nj4JAN0EYfS9GGBkcVs1XvG2pDGQO3O8dJz45saSFzMAHP1o4RG88Y7mgfWlF2RECt1b
         WtQQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=a7UzIfMs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d25si7529045qtj.34.2017.09.18.13.02.15
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 18 Sep 2017 13:02:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=a7UzIfMs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:38677 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1du2FB-0007nK-MK
	for alex.bennee@linaro.org; Mon, 18 Sep 2017 16:02:13 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37494)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1du24y-0006vw-R7
	for qemu-arm@nongnu.org; Mon, 18 Sep 2017 15:51:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1du24x-0006MV-P5
	for qemu-arm@nongnu.org; Mon, 18 Sep 2017 15:51:40 -0400
Received: from mail-pf0-x243.google.com ([2607:f8b0:400e:c00::243]:33802)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <andrew.smirnov@gmail.com>)
	id 1du24x-0006Lm-HO; Mon, 18 Sep 2017 15:51:39 -0400
Received: by mail-pf0-x243.google.com with SMTP id g65so597786pfe.1;
	Mon, 18 Sep 2017 12:51:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=6p+10rc6YYbqewfpta9jJYHFIPg1mG9RV6MDxk6YOZ8=;
	b=a7UzIfMsFNGTXAB0BbaoMxuT96Lb+A1N7MMP93Vxmt1E/BPd78mQ+Z65FFGiTsYHfi
	XDXGg80TqHaumhUfW0wE5v79OXC3RuZ7BB1Mv8uXfKmaljU1ii0dfmYvdQ4TiY1qgkfQ
	QtB7XUuXS9HH4GlTkWw48FKQFEAf/rTWYoYDO09R2h/XX0T3G+2ZigfeV9eLT81ck2xY
	/4HtRS+t4uJpeeCxPVTpC+ooNWTHYb/sv/u9HVCs5rmEZwZ1zSfGRzjDEIi6qCsZdqfS
	Uzr8bL347zY/jOCu6sM+PAAUyHDJ9gup+NQn7pU9OcrRw6cGaj65pHw1SjV+S02YrsC5
	KaEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=6p+10rc6YYbqewfpta9jJYHFIPg1mG9RV6MDxk6YOZ8=;
	b=g9a3owYbUuklV5f4F2qF5FmZzRJTFU6hJvySpZ2yZktykzDacCT1+ChtIjC50rAdei
	QLR62qM1/XwkCDxP9mZ5CDxo9w5ItyCUhakchUrwbpkxlfRot8uHZZU8ThKabKAmMitO
	MSGoVSIwdIzHPKmZJ6C2j8XoiGXQMwc4ZXIpnV/Eqt06Kxd3mnA7eDHGvLlK4R8qROWt
	8D8v4FVSinDM5TqUKmvkDLUb8kjhIkY6evF+ykcNCCyEZpNMJunw1Rg1qXcyBKF+vWoG
	ljypncQoyqUzvWkqvy/wO+dxgQLgW6Zo4BQAh99WqgyyGuwGdMaAmUUIInEV2W+NCp9x
	KNvQ==
X-Gm-Message-State: AHPjjUix6phkDG42xMMI+Gmn5Yu9t3knfnnoIF6WiHSA25I1bMXoHiC3
	A38MvYJFERC9gGw5dvo=
X-Google-Smtp-Source: ADKCNb5wG7SdaukUOnoeF8cX6LGFVIZzG8fTHTCbseNX33yq+xeESfFnXTKKIipEUdS07UrHBA3mqw==
X-Received: by 10.84.225.134 with SMTP id u6mr36332223plj.177.1505764298282;
	Mon, 18 Sep 2017 12:51:38 -0700 (PDT)
Received: from squirtle.westlake.spaceflightindustries.com ([173.226.206.194])
	by smtp.gmail.com with ESMTPSA id
	d186sm200791pfd.117.2017.09.18.12.51.37
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 18 Sep 2017 12:51:37 -0700 (PDT)
From: Andrey Smirnov <andrew.smirnov@gmail.com>
To: qemu-arm@nongnu.org
Date: Mon, 18 Sep 2017 12:50:57 -0700
Message-Id: <20170918195100.17593-15-andrew.smirnov@gmail.com>
X-Mailer: git-send-email 2.13.5
In-Reply-To: <20170918195100.17593-1-andrew.smirnov@gmail.com>
References: <20170918195100.17593-1-andrew.smirnov@gmail.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c00::243
Subject: [Qemu-arm] [PATCH 14/17] i.MX7: Add code to emulate SNVS IP-block
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
Cc: Andrey Smirnov <andrew.smirnov@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
	yurovsky@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: YiY0HevPNSoQ

Add code to emulate SNVS IP-block. Currently only the bits needed to
be able to emulate machine shutdown are implemented.

Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Cc: yurovsky@gmail.com
Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
---
 hw/misc/Makefile.objs       |  1 +
 hw/misc/imx7_snvs.c         | 84 +++++++++++++++++++++++++++++++++++++++++++++
 include/hw/misc/imx7_snvs.h | 35 +++++++++++++++++++
 3 files changed, 120 insertions(+)
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
index 0000000000..efce0a760f
--- /dev/null
+++ b/hw/misc/imx7_snvs.c
@@ -0,0 +1,84 @@
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
+#include "qemu/sizes.h"
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
+    .valid = {
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
2.13.5

