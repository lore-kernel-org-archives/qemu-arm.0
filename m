Received: by 10.223.161.27 with SMTP id o27csp237322wro;
        Mon, 23 Oct 2017 13:21:47 -0700 (PDT)
X-Received: by 10.129.1.22 with SMTP id 22mr9435797ywb.472.1508790107364;
        Mon, 23 Oct 2017 13:21:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1508790107; cv=none;
        d=google.com; s=arc-20160816;
        b=J+lCcZoIHUH2s36bbzLf4XZjNZTnPYXy6eLQdKuKIhE/gUx2Pr6u44ZgXVh0SeCnSr
         NsWIHOhYMkMsyKNpyMXQO3SsRr2U0Mw9MSUE8BKZoeyywhD/n4jcQnHwyNo1Gd6KpWv6
         /6yP96BW8eg0vUwkt0Uuq4wqHt2icMhgLDdSpppocT688bioSkShKEuN3GsMDTccJqIU
         puvjkogbToEQ5VzLfi0eKmpawTyV8FKaV8W3tZFSGFn6oBkE8+FkU9mC5T74EGWXWC2w
         qfL+1I7IZX639UocUQXxvXOcLnr5Mv8JXjW1hIPNwEzvptgPNmzVeb7sMPxKCFkvalHo
         jhow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=c7oKDANsZe23txWQdmmhB+gJLvpxtN+/0XQLSJwaIGs=;
        b=GuAqx2MF/xC/QeuOtN8NxybaZLEoX3HixOh41BuZDfz/eKummYW/58OLrEb4yHBtTR
         vw5W/oWJndxXBlJ8asmhgEmKrsz1EqHaOwNhNZHrfAuGS1iyLKXFuTZF2XAG1DfYHNdH
         pNICpowIrzf9GvpQP1roagxXvRt66wnC4726ycBrNG06LIW2+KrkzagRcjQyIpkdgaUg
         riE/70AstjbE/8W9i/AOQ0cJYAEEngVNzaSgi8soLPw+Af+jMtdu9CSlCBmq4zY7H4Kq
         V1kavusPHfmg6ZEAURm4xfcyPNCXdz/pVjjc3zhPTaVXaNOpKJRYrmyFUYtwUGfuZpAU
         trQw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Sm/du1fk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y4si1386149ywd.727.2017.10.23.13.21.47
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 23 Oct 2017 13:21:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Sm/du1fk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:40431 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e6jEI-0000Nf-L3
	for alex.bennee@linaro.org; Mon, 23 Oct 2017 16:21:46 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46322)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1e6j4Q-0000LR-2G
	for qemu-arm@nongnu.org; Mon, 23 Oct 2017 16:11:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1e6j4O-0002Xy-PC
	for qemu-arm@nongnu.org; Mon, 23 Oct 2017 16:11:34 -0400
Received: from mail-pg0-x244.google.com ([2607:f8b0:400e:c05::244]:49362)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <andrew.smirnov@gmail.com>)
	id 1e6j4O-0002Xd-Hu; Mon, 23 Oct 2017 16:11:32 -0400
Received: by mail-pg0-x244.google.com with SMTP id g6so12637209pgn.6;
	Mon, 23 Oct 2017 13:11:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=c7oKDANsZe23txWQdmmhB+gJLvpxtN+/0XQLSJwaIGs=;
	b=Sm/du1fkaloxRU2BSpLeqmApEZce4AO2F7uF7fQ/W52ALRpqCjczx9FVCujhz+qWJH
	80USEZ7S9IV2Qn9zE6ulxkTB1Xjg7d6O05ZPvqHDgMz0orMxSF1fKETt1M/JVyc76Ec3
	o7bWRLUJ193j7XK59irJCEjZsGiR+sN+6EBJJCe3lujW5ilPVqa7k+yPPapJwT+2drpH
	Nvpa6uHBzvT7yW/fsuC7RIBAajN1XQGC4vlIuqa/CI7fkb8oWufpc+E7LWjFG+2FAoos
	IGu8cloZjyqYB+k4Jtq5o2ugSjP8qwxPXRtnRiYd1CQhMppa60nFnSLS2rDVQYy65PRg
	+Khw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=c7oKDANsZe23txWQdmmhB+gJLvpxtN+/0XQLSJwaIGs=;
	b=uSUMMNjVSkHn1MvxxcSm19F5Uq17c8gDQJztoBmGaYli8HiVH421l/f3DryQrTUzP0
	l5bztz8YZL7PDkskk8GR6dltC8nrrpChAF9YUYC+HYAk4C9syw56TTxMK17SULZmpM03
	FnL1pCgPT2Ko5S5R9Sd5mLooKvq1UC5v/B1voG80pnbKQ9yOo+okfus3SWwacHuwoK5A
	6VsnQBGMNP2W3tg7OptbpMwcRc9dsDxP0bOR9jirNYNOFbe07Tuq2ieXGSFpL4suq8X4
	MO7vXvPtg+NFRQjtUchJDe6p8otC6kHImeMrBwzQ2NQ6DwsgGLPX0xFwcvciKl5Al7F9
	qVhQ==
X-Gm-Message-State: AMCzsaUdpDncc79INs5obzqwVZcIu0DHez1I8sk5VWUI8MFMdiZw/ftR
	PfXIKvwoBPdKrQDiPhZB9g2xdgOD
X-Google-Smtp-Source: ABhQp+TuZ6yzkCmB71iVJw6ueAsTX+4VSe14E2s0VyBlxXIWPhhn0IKP5DM3EjXF3CQCVGeMk0YVYw==
X-Received: by 10.98.213.194 with SMTP id d185mr14313194pfg.107.1508789491496; 
	Mon, 23 Oct 2017 13:11:31 -0700 (PDT)
Received: from squirtle.westlake.spaceflightindustries.com ([173.226.206.194])
	by smtp.gmail.com with ESMTPSA id
	j1sm15181623pfj.108.2017.10.23.13.11.30
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 23 Oct 2017 13:11:30 -0700 (PDT)
From: Andrey Smirnov <andrew.smirnov@gmail.com>
To: qemu-arm@nongnu.org
Date: Mon, 23 Oct 2017 13:10:43 -0700
Message-Id: <20171023201055.21973-16-andrew.smirnov@gmail.com>
X-Mailer: git-send-email 2.13.5
In-Reply-To: <20171023201055.21973-1-andrew.smirnov@gmail.com>
References: <20171023201055.21973-1-andrew.smirnov@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::244
Subject: [Qemu-arm] [PATCH v2 15/27] i.MX: Add code to emulate i.MX7 SNVS
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
X-TUID: 0iMyT3WxjoJS

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
2.13.5

