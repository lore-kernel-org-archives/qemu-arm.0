Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp5753889lfy;
        Mon, 10 Aug 2020 17:46:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy6P87pDJwTTgF5uP1TTkO29MIA6jN6Oou2eNHN8DsxGCTjrcKAp7hDpS5GvQzNCGlCnZZf
X-Received: by 2002:a25:5808:: with SMTP id m8mr45060460ybb.246.1597106804674;
        Mon, 10 Aug 2020 17:46:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1597106804; cv=none;
        d=google.com; s=arc-20160816;
        b=lUfg727Oioz32O2uyGDpMqKXWRtatZjzotyCU0XhnnUEfsaVQW5pk5ipCMljbw/6BB
         wI1+hks8jVXMHKH2rQlZkuMYJbXdb+CHE9c5ApC5KH+bjcmGhGPXksXcD/FXCAFqfJQu
         3P9ubc6G7pLve9pHLkMF+z31SoWcBD2I9tSvzg6CZxOs4jjsA6wyj85aPv87eUwq7zCs
         Y/UfbiBSY8RLgSo73swNjKpwnZGgZr2d56XZAfjaVqmGhIJUukZDPyt9112A3t128TOu
         KltQ3qk+vw1WQrvs2f7sSMqycUGgTkv7E75TRen/sGOJqLK3Vi7IW1EnpsODXWWDeX5q
         QECQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :from:subject:references:mime-version:message-id:in-reply-to:date
         :dkim-signature;
        bh=hUqYYNePiojhVtQYtVb8fdC5e+/y82Kl8mPj9wk2OGA=;
        b=Nz2JOxNfMdXduVYej1FmWkdqAxretwgdNHKuNfZpKUXBo08edcY2o05zHUDkWUJgbn
         pobc6zrswceip65toGzLmwC33WhM8kNWymhWsBdatO5YFiD504scjY8boaUcF+Ym+2CN
         NqRPkXqcmm4oUP7beglztBFkoXp/ctBwA4J1+bJJtyMrThHjoyA7tBRVdLK0GMcFT1Td
         PE+CfnTcbxr8SmwbU7lbi6tmYOAvai8KHYzx8IG/HFwbiulUYe6+sPXZzkmTV6F3VV58
         rmFEb40Ql4MB2r6Bv6g+UA4yy1zC/d3zgadih+pbqJSDQKz2LMoDIsHEJYK6qgHywuE6
         JJCA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20161025 header.b=jj1ZRXMh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 17si15605529ybx.41.2020.08.10.17.46.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 10 Aug 2020 17:46:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20161025 header.b=jj1ZRXMh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1]:37938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k5IR9-0007L6-SD
	for alex.bennee@linaro.org; Mon, 10 Aug 2020 20:46:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46710)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3V-oxXwsKCPIbmechhYgiYhaiiafY.WigkYgo-Ulghihaho.ila@flex--hskinnemoen.bounces.google.com>)
 id 1k5IQn-0006xl-Bn
 for qemu-arm@nongnu.org; Mon, 10 Aug 2020 20:46:21 -0400
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49]:33983)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3V-oxXwsKCPIbmechhYgiYhaiiafY.WigkYgo-Ulghihaho.ila@flex--hskinnemoen.bounces.google.com>)
 id 1k5IQj-0004gN-Mz
 for qemu-arm@nongnu.org; Mon, 10 Aug 2020 20:46:21 -0400
Received: by mail-yb1-xb49.google.com with SMTP id k11so14855947ybp.1
 for <qemu-arm@nongnu.org>; Mon, 10 Aug 2020 17:46:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc:content-transfer-encoding;
 bh=hUqYYNePiojhVtQYtVb8fdC5e+/y82Kl8mPj9wk2OGA=;
 b=jj1ZRXMhTB8PTJP8wRr4wEikdfB3IzhU0uRG+cOEFwjFPjK67QTBWqqn+GFulD+wQH
 NKwkZ11OvcjvfQo2T6Vp+mgrg6pDRXt3zxh9B55F1X5ra3Kqmt3xbgodmNPRP+KVfFo5
 tIS8dTFXklNML1Z+r/1KLrFZK05WIPbzmURwhmZ/SFuWK1JyQbh8o9Gk/KxcJa7oLHUy
 GzJ5Hi9nWV3beA37Mq1Zb50sTKt3zfIlJ7+KtFwChcHloPW7QbDGippby2fJwjutbPvN
 teVoNywlEe70bOob5aM0U6DUMgium/Qoq/IR4gfgLe+Al2NKkb5lvF9+RDPUFCl1oBP3
 dMqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc:content-transfer-encoding;
 bh=hUqYYNePiojhVtQYtVb8fdC5e+/y82Kl8mPj9wk2OGA=;
 b=StTkH5BauZye09XnDpgs4psFWWgobzs8ON43qRxZEABRHuMyZXE/gpPP7n5d/vJWbB
 zcHZ2j3zlSOSQtjcDlZXTtT4/bJZKSv8P1YeOhrY8M6dfUrAytWObKWt9+4ZsH4etc51
 EEOfGrWBWvWZKlOWfOERJUdL4xI2IZIUvpq7JhG5Bjba9AVg/9m1N/G7eXiOm8NPqUA5
 BU6bZ4Hu1+rtbKkcS7Jyv+0KqrZWKcw8JSmzGRubSjwzYIFtmCwPah1VbYKIzMYz20Lf
 s/WanYiD/v0nd6pOeZePzKDFROnP63qbQxfAZuVJvEoHWXa9vfYYfcDmKs97qQG2KeYN
 hpPA==
X-Gm-Message-State: AOAM5332/+qOW+J5QISeSDwXD3S1pkAkFV+flGnF9kb6HXXHSudPO9+U
 7RTo106dioP3WqfxKnopi0zFkCcQygZZ5RRTjw==
X-Received: by 2002:a05:6902:4af:: with SMTP id
 r15mr42515845ybs.32.1597106775568; 
 Mon, 10 Aug 2020 17:46:15 -0700 (PDT)
Date: Tue, 11 Aug 2020 00:45:55 +0000
In-Reply-To: <20200811004607.2133149-1-hskinnemoen@google.com>
Message-Id: <20200811004607.2133149-2-hskinnemoen@google.com>
Mime-Version: 1.0
References: <20200811004607.2133149-1-hskinnemoen@google.com>
X-Mailer: git-send-email 2.28.0.236.gb10cc79966-goog
Subject: [PATCH v7 01/13] hw/misc: Add NPCM7xx System Global Control Registers
 device model
From: Havard Skinnemoen <hskinnemoen@google.com>
To: peter.maydell@linaro.org, f4bug@amsat.org, clg@kaod.org, joel@jms.id.au
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, Avi.Fishman@nuvoton.com, 
 kfting@nuvoton.com, Havard Skinnemoen <hskinnemoen@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b49;
 envelope-from=3V-oxXwsKCPIbmechhYgiYhaiiafY.WigkYgo-Ulghihaho.ila@flex--hskinnemoen.bounces.google.com;
 helo=mail-yb1-xb49.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -105
X-Spam_score: -10.6
X-Spam_bar: ----------
X-Spam_report: (-10.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Iy7sF29+Z7GL

Implement a device model for the System Global Control Registers in the
NPCM730 and NPCM750 BMC SoCs.

This is primarily used to enable SMP boot (the boot ROM spins reading
the SCRPAD register) and DDR memory initialization; other registers are
best effort for now.

The reset values of the MDLR and PWRON registers are determined by the
SoC variant (730 vs 750) and board straps respectively.

Reviewed-by: Joel Stanley <joel@jms.id.au>
Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
Signed-off-by: Havard Skinnemoen <hskinnemoen@google.com>
---
 MAINTAINERS                   |   8 ++
 hw/arm/Kconfig                |   3 +
 hw/misc/Makefile.objs         |   1 +
 hw/misc/npcm7xx_gcr.c         | 228 ++++++++++++++++++++++++++++++++++
 hw/misc/trace-events          |   4 +
 include/hw/misc/npcm7xx_gcr.h |  76 ++++++++++++
 6 files changed, 320 insertions(+)
 create mode 100644 hw/misc/npcm7xx_gcr.c
 create mode 100644 include/hw/misc/npcm7xx_gcr.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 0886eb3d2b..c1066053d0 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -749,6 +749,14 @@ S: Odd Fixes
 F: hw/arm/musicpal.c
 F: docs/system/arm/musicpal.rst
=20
+Nuvoton NPCM7xx
+M: Havard Skinnemoen <hskinnemoen@google.com>
+M: Tyrone Ting <kfting@nuvoton.com>
+L: qemu-arm@nongnu.org
+S: Supported
+F: hw/*/npcm7xx*
+F: include/hw/*/npcm7xx*
+
 nSeries
 M: Andrzej Zaborowski <balrogg@gmail.com>
 M: Peter Maydell <peter.maydell@linaro.org>
diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index bc3a423940..4aec9c63f8 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -355,6 +355,9 @@ config XLNX_VERSAL
     select VIRTIO_MMIO
     select UNIMP
=20
+config NPCM7XX
+    bool
+
 config FSL_IMX25
     bool
     select IMX
diff --git a/hw/misc/Makefile.objs b/hw/misc/Makefile.objs
index 6be3d255ab..e00b839f03 100644
--- a/hw/misc/Makefile.objs
+++ b/hw/misc/Makefile.objs
@@ -51,6 +51,7 @@ common-obj-$(CONFIG_IMX) +=3D imx_rngc.o
 common-obj-$(CONFIG_MILKYMIST) +=3D milkymist-hpdmc.o
 common-obj-$(CONFIG_MILKYMIST) +=3D milkymist-pfpu.o
 common-obj-$(CONFIG_MAINSTONE) +=3D mst_fpga.o
+common-obj-$(CONFIG_NPCM7XX) +=3D npcm7xx_gcr.o
 common-obj-$(CONFIG_OMAP) +=3D omap_clk.o
 common-obj-$(CONFIG_OMAP) +=3D omap_gpmc.o
 common-obj-$(CONFIG_OMAP) +=3D omap_l4.o
diff --git a/hw/misc/npcm7xx_gcr.c b/hw/misc/npcm7xx_gcr.c
new file mode 100644
index 0000000000..d4ac8137e6
--- /dev/null
+++ b/hw/misc/npcm7xx_gcr.c
@@ -0,0 +1,228 @@
+/*
+ * Nuvoton NPCM7xx System Global Control Registers.
+ *
+ * Copyright 2020 Google LLC
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms of the GNU General Public License as published by the
+ * Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful, but WIT=
HOUT
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License
+ * for more details.
+ */
+
+#include "qemu/osdep.h"
+
+#include "hw/misc/npcm7xx_gcr.h"
+#include "hw/qdev-properties.h"
+#include "migration/vmstate.h"
+#include "qapi/error.h"
+#include "qemu/cutils.h"
+#include "qemu/log.h"
+#include "qemu/module.h"
+#include "qemu/units.h"
+
+#include "trace.h"
+
+#define NPCM7XX_GCR_MIN_DRAM_SIZE   (128 * MiB)
+#define NPCM7XX_GCR_MAX_DRAM_SIZE   (2 * GiB)
+
+static const uint32_t cold_reset_values[NPCM7XX_GCR_NR_REGS] =3D {
+    [NPCM7XX_GCR_PDID]          =3D 0x04a92750,   /* Poleg A1 */
+    [NPCM7XX_GCR_MISCPE]        =3D 0x0000ffff,
+    [NPCM7XX_GCR_SPSWC]         =3D 0x00000003,
+    [NPCM7XX_GCR_INTCR]         =3D 0x0000035e,
+    [NPCM7XX_GCR_HIFCR]         =3D 0x0000004e,
+    [NPCM7XX_GCR_INTCR2]        =3D (1U << 19),   /* DDR initialized */
+    [NPCM7XX_GCR_RESSR]         =3D 0x80000000,
+    [NPCM7XX_GCR_DSCNT]         =3D 0x000000c0,
+    [NPCM7XX_GCR_DAVCLVLR]      =3D 0x5a00f3cf,
+    [NPCM7XX_GCR_SCRPAD]        =3D 0x00000008,
+    [NPCM7XX_GCR_USB1PHYCTL]    =3D 0x034730e4,
+    [NPCM7XX_GCR_USB2PHYCTL]    =3D 0x034730e4,
+};
+
+static uint64_t npcm7xx_gcr_read(void *opaque, hwaddr offset, unsigned siz=
e)
+{
+    uint32_t reg =3D offset / sizeof(uint32_t);
+    NPCM7xxGCRState *s =3D opaque;
+
+    if (reg >=3D NPCM7XX_GCR_NR_REGS) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: offset 0x%04" HWADDR_PRIx " out of range\n",
+                      __func__, offset);
+        return 0;
+    }
+
+    trace_npcm7xx_gcr_read(offset, s->regs[reg]);
+
+    return s->regs[reg];
+}
+
+static void npcm7xx_gcr_write(void *opaque, hwaddr offset,
+                              uint64_t v, unsigned size)
+{
+    uint32_t reg =3D offset / sizeof(uint32_t);
+    NPCM7xxGCRState *s =3D opaque;
+    uint32_t value =3D v;
+
+    trace_npcm7xx_gcr_write(offset, value);
+
+    if (reg >=3D NPCM7XX_GCR_NR_REGS) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: offset 0x%04" HWADDR_PRIx " out of range\n",
+                      __func__, offset);
+        return;
+    }
+
+    switch (reg) {
+    case NPCM7XX_GCR_PDID:
+    case NPCM7XX_GCR_PWRON:
+    case NPCM7XX_GCR_INTSR:
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: register @ 0x%04" HWADDR_PRIx " is read-only\n"=
,
+                      __func__, offset);
+        return;
+
+    case NPCM7XX_GCR_RESSR:
+    case NPCM7XX_GCR_CP2BST:
+        /* Write 1 to clear */
+        value =3D s->regs[reg] & ~value;
+        break;
+
+    case NPCM7XX_GCR_RLOCKR1:
+    case NPCM7XX_GCR_MDLR:
+        /* Write 1 to set */
+        value |=3D s->regs[reg];
+        break;
+    };
+
+    s->regs[reg] =3D value;
+}
+
+static const struct MemoryRegionOps npcm7xx_gcr_ops =3D {
+    .read       =3D npcm7xx_gcr_read,
+    .write      =3D npcm7xx_gcr_write,
+    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .valid      =3D {
+        .min_access_size        =3D 4,
+        .max_access_size        =3D 4,
+        .unaligned              =3D false,
+    },
+};
+
+static void npcm7xx_gcr_enter_reset(Object *obj, ResetType type)
+{
+    NPCM7xxGCRState *s =3D NPCM7XX_GCR(obj);
+
+    QEMU_BUILD_BUG_ON(sizeof(s->regs) !=3D sizeof(cold_reset_values));
+
+    switch (type) {
+    case RESET_TYPE_COLD:
+        memcpy(s->regs, cold_reset_values, sizeof(s->regs));
+        s->regs[NPCM7XX_GCR_PWRON] =3D s->reset_pwron;
+        s->regs[NPCM7XX_GCR_MDLR] =3D s->reset_mdlr;
+        s->regs[NPCM7XX_GCR_INTCR3] =3D s->reset_intcr3;
+        break;
+    }
+}
+
+static void npcm7xx_gcr_realize(DeviceState *dev, Error **errp)
+{
+    ERRP_GUARD();
+    NPCM7xxGCRState *s =3D NPCM7XX_GCR(dev);
+    uint64_t dram_size;
+    Object *obj;
+
+    obj =3D object_property_get_link(OBJECT(dev), "dram-mr", errp);
+    if (!obj) {
+        error_prepend(errp, "%s: required dram-mr link not found: ", __fun=
c__);
+        return;
+    }
+    dram_size =3D memory_region_size(MEMORY_REGION(obj));
+    if (!is_power_of_2(dram_size) ||
+        dram_size < NPCM7XX_GCR_MIN_DRAM_SIZE ||
+        dram_size > NPCM7XX_GCR_MAX_DRAM_SIZE) {
+        g_autofree char *sz =3D size_to_str(dram_size);
+        g_autofree char *min_sz =3D size_to_str(NPCM7XX_GCR_MIN_DRAM_SIZE)=
;
+        g_autofree char *max_sz =3D size_to_str(NPCM7XX_GCR_MAX_DRAM_SIZE)=
;
+        error_setg(errp, "%s: unsupported DRAM size %s", __func__, sz);
+        error_append_hint(errp,
+                          "DRAM size must be a power of two between %s and=
 %s,"
+                          " inclusive.\n", min_sz, max_sz);
+        return;
+    }
+
+    /* Power-on reset value */
+    s->reset_intcr3 =3D 0x00001002;
+
+    /*
+     * The GMMAP (Graphics Memory Map) field is used by u-boot to detect t=
he
+     * DRAM size, and is normally initialized by the boot block as part of=
 DRAM
+     * training. However, since we don't have a complete emulation of the
+     * memory controller and try to make it look like it has already been
+     * initialized, the boot block will skip this initialization, and we n=
eed
+     * to make sure this field is set correctly up front.
+     *
+     * WARNING: some versions of u-boot only looks at bits 8 and 9, so 2 G=
iB of
+     * DRAM will be interpreted as 128 MiB.
+     *
+     * https://github.com/Nuvoton-Israel/u-boot/blob/2aef993bd2aafeb5408db=
aad0f3ce099ee40c4aa/board/nuvoton/poleg/poleg.c#L244
+     */
+    s->reset_intcr3 |=3D ctz64(dram_size / NPCM7XX_GCR_MIN_DRAM_SIZE) << 8=
;
+}
+
+static void npcm7xx_gcr_init(Object *obj)
+{
+    NPCM7xxGCRState *s =3D NPCM7XX_GCR(obj);
+
+    memory_region_init_io(&s->iomem, obj, &npcm7xx_gcr_ops, s,
+                          TYPE_NPCM7XX_GCR, 4 * KiB);
+    sysbus_init_mmio(&s->parent, &s->iomem);
+}
+
+static const VMStateDescription vmstate_npcm7xx_gcr =3D {
+    .name =3D "npcm7xx-gcr",
+    .version_id =3D 0,
+    .minimum_version_id =3D 0,
+    .fields =3D (VMStateField[]) {
+        VMSTATE_UINT32_ARRAY(regs, NPCM7xxGCRState, NPCM7XX_GCR_NR_REGS),
+        VMSTATE_END_OF_LIST(),
+    },
+};
+
+static Property npcm7xx_gcr_properties[] =3D {
+    DEFINE_PROP_UINT32("disabled-modules", NPCM7xxGCRState, reset_mdlr, 0)=
,
+    DEFINE_PROP_UINT32("power-on-straps", NPCM7xxGCRState, reset_pwron, 0)=
,
+    DEFINE_PROP_END_OF_LIST(),
+};
+
+static void npcm7xx_gcr_class_init(ObjectClass *klass, void *data)
+{
+    ResettableClass *rc =3D RESETTABLE_CLASS(klass);
+    DeviceClass *dc =3D DEVICE_CLASS(klass);
+
+    dc->desc =3D "NPCM7xx System Global Control Registers";
+    dc->realize =3D npcm7xx_gcr_realize;
+    dc->vmsd =3D &vmstate_npcm7xx_gcr;
+    rc->phases.enter =3D npcm7xx_gcr_enter_reset;
+
+    device_class_set_props(dc, npcm7xx_gcr_properties);
+}
+
+static const TypeInfo npcm7xx_gcr_info =3D {
+    .name               =3D TYPE_NPCM7XX_GCR,
+    .parent             =3D TYPE_SYS_BUS_DEVICE,
+    .instance_size      =3D sizeof(NPCM7xxGCRState),
+    .instance_init      =3D npcm7xx_gcr_init,
+    .class_init         =3D npcm7xx_gcr_class_init,
+};
+
+static void npcm7xx_gcr_register_type(void)
+{
+    type_register_static(&npcm7xx_gcr_info);
+}
+type_init(npcm7xx_gcr_register_type);
diff --git a/hw/misc/trace-events b/hw/misc/trace-events
index 066752aa90..dbf90db8ed 100644
--- a/hw/misc/trace-events
+++ b/hw/misc/trace-events
@@ -111,6 +111,10 @@ mos6522_set_sr_int(void) "set sr_int"
 mos6522_write(uint64_t addr, uint64_t val) "reg=3D0x%"PRIx64 " val=3D0x%"P=
RIx64
 mos6522_read(uint64_t addr, unsigned val) "reg=3D0x%"PRIx64 " val=3D0x%x"
=20
+# npcm7xx_gcr.c
+npcm7xx_gcr_read(uint64_t offset, uint32_t value) " offset: 0x%04" PRIx64 =
" value: 0x%08" PRIx32
+npcm7xx_gcr_write(uint64_t offset, uint32_t value) "offset: 0x%04" PRIx64 =
" value: 0x%08" PRIx32
+
 # stm32f4xx_syscfg
 stm32f4xx_syscfg_set_irq(int gpio, int line, int level) "Interupt: GPIO: %=
d, Line: %d; Level: %d"
 stm32f4xx_pulse_exti(int irq) "Pulse EXTI: %d"
diff --git a/include/hw/misc/npcm7xx_gcr.h b/include/hw/misc/npcm7xx_gcr.h
new file mode 100644
index 0000000000..4884676be2
--- /dev/null
+++ b/include/hw/misc/npcm7xx_gcr.h
@@ -0,0 +1,76 @@
+/*
+ * Nuvoton NPCM7xx System Global Control Registers.
+ *
+ * Copyright 2020 Google LLC
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms of the GNU General Public License as published by the
+ * Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful, but WIT=
HOUT
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License
+ * for more details.
+ */
+#ifndef NPCM7XX_GCR_H
+#define NPCM7XX_GCR_H
+
+#include "exec/memory.h"
+#include "hw/sysbus.h"
+
+enum NPCM7xxGCRRegisters {
+    NPCM7XX_GCR_PDID,
+    NPCM7XX_GCR_PWRON,
+    NPCM7XX_GCR_MFSEL1          =3D 0x0c / sizeof(uint32_t),
+    NPCM7XX_GCR_MFSEL2,
+    NPCM7XX_GCR_MISCPE,
+    NPCM7XX_GCR_SPSWC           =3D 0x038 / sizeof(uint32_t),
+    NPCM7XX_GCR_INTCR,
+    NPCM7XX_GCR_INTSR,
+    NPCM7XX_GCR_HIFCR           =3D 0x050 / sizeof(uint32_t),
+    NPCM7XX_GCR_INTCR2          =3D 0x060 / sizeof(uint32_t),
+    NPCM7XX_GCR_MFSEL3,
+    NPCM7XX_GCR_SRCNT,
+    NPCM7XX_GCR_RESSR,
+    NPCM7XX_GCR_RLOCKR1,
+    NPCM7XX_GCR_FLOCKR1,
+    NPCM7XX_GCR_DSCNT,
+    NPCM7XX_GCR_MDLR,
+    NPCM7XX_GCR_SCRPAD3,
+    NPCM7XX_GCR_SCRPAD2,
+    NPCM7XX_GCR_DAVCLVLR        =3D 0x098 / sizeof(uint32_t),
+    NPCM7XX_GCR_INTCR3,
+    NPCM7XX_GCR_VSINTR          =3D 0x0ac / sizeof(uint32_t),
+    NPCM7XX_GCR_MFSEL4,
+    NPCM7XX_GCR_CPBPNTR         =3D 0x0c4 / sizeof(uint32_t),
+    NPCM7XX_GCR_CPCTL           =3D 0x0d0 / sizeof(uint32_t),
+    NPCM7XX_GCR_CP2BST,
+    NPCM7XX_GCR_B2CPNT,
+    NPCM7XX_GCR_CPPCTL,
+    NPCM7XX_GCR_I2CSEGSEL,
+    NPCM7XX_GCR_I2CSEGCTL,
+    NPCM7XX_GCR_VSRCR,
+    NPCM7XX_GCR_MLOCKR,
+    NPCM7XX_GCR_SCRPAD          =3D 0x013c / sizeof(uint32_t),
+    NPCM7XX_GCR_USB1PHYCTL,
+    NPCM7XX_GCR_USB2PHYCTL,
+    NPCM7XX_GCR_NR_REGS,
+};
+
+typedef struct NPCM7xxGCRState {
+    SysBusDevice parent;
+
+    MemoryRegion iomem;
+
+    uint32_t regs[NPCM7XX_GCR_NR_REGS];
+
+    uint32_t reset_pwron;
+    uint32_t reset_mdlr;
+    uint32_t reset_intcr3;
+} NPCM7xxGCRState;
+
+#define TYPE_NPCM7XX_GCR "npcm7xx-gcr"
+#define NPCM7XX_GCR(obj) OBJECT_CHECK(NPCM7xxGCRState, (obj), TYPE_NPCM7XX=
_GCR)
+
+#endif /* NPCM7XX_GCR_H */
--=20
2.28.0.236.gb10cc79966-goog

