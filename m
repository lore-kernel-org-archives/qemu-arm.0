Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp1829940lfc;
        Thu, 11 Jun 2020 15:31:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzlCFQopp9UAg8kIWUeATc1K+mYGs9grm1Ud5eXaa9LP6sGZucnm3l2IauYhCT18Hmderld
X-Received: by 2002:a25:a2d1:: with SMTP id c17mr17229150ybn.192.1591914671996;
        Thu, 11 Jun 2020 15:31:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591914671; cv=none;
        d=google.com; s=arc-20160816;
        b=tSvMRqNdPUyEbRZ6ZI9hdkBQnakYeRK5iSQhVMXvh1exN8Z+XQjUM+RGS8GYnXlP1p
         d6NFje12wjk6b86c6k4M8+ypj2UBHa4kAcKFOUtzI12azzGdqQAF0lcAUUaDh016wH5Y
         RfMqWfcAIeGWrX7XVn6NR+L2rG+y2fIzG2wy7IoJtf4M5xSyw/59Yd2PnlBjOIK7Lz/4
         n6C9QpWBdWGimqsANCD6wLAnMiZKFih4zebgfz+0NTKJ+6iOoyEsIArlnTePOm8h4+E5
         ncfO5PI4cPzrXcbpHwybEZgx+fzjRKWtHEigZCwmQATJpwTe9VEHuiSXozwe6bho+WmL
         NmYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :from:subject:references:mime-version:message-id:in-reply-to:date
         :dkim-signature;
        bh=fGqzZjaOSHrJ9KPowxmH4v4ZrSs77KHjpULDUX98fkY=;
        b=XVhp+A8oGGbVyMO2s5A7adDJ5V0dco/py8PE3Yp9MMrKh0JOj05mZozeHs+vUGf4hK
         QnXyG8nlafd3q8kTIGTblZjywh6qDjGlUjVHZ6znhN0vo38KEbQDET9cxA8KbGUz88kN
         kzv7gEsQBNIgHG1LQjI1rtGmU4A29+u4R+4Lbnrct/GWjik3aRYrYSMouo6UYMrniNAE
         kBXGmKg1KKz556qPz0DEp748+JnUcji/azZGfdetwQkBbxj24Lvu7/t6lHY45ttoUflD
         5ldkg3aUhugehgvLr3S9oZs1eghleRKRl6qD42ffPS7P+xHQqkOAxLURIQ/zGzNdMR0g
         TdeQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20161025 header.b=BZmOfyET;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j126si3434849ybb.172.2020.06.11.15.31.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 11 Jun 2020 15:31:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20161025 header.b=BZmOfyET;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1]:56152 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jjVj5-0004Nj-9O
	for alex.bennee@linaro.org; Thu, 11 Jun 2020 18:31:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33588)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3h7DiXgsKCHAVgYWbbSacSbUccUZS.QcaeSai-OfabcbUbi.cfU@flex--hskinnemoen.bounces.google.com>)
 id 1jjVib-0003t2-BN
 for qemu-arm@nongnu.org; Thu, 11 Jun 2020 18:30:41 -0400
Received: from mail-qt1-x849.google.com ([2607:f8b0:4864:20::849]:49242)
 by eggs.gnu.org with esmtps (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3h7DiXgsKCHAVgYWbbSacSbUccUZS.QcaeSai-OfabcbUbi.cfU@flex--hskinnemoen.bounces.google.com>)
 id 1jjViY-00042Y-Gf
 for qemu-arm@nongnu.org; Thu, 11 Jun 2020 18:30:41 -0400
Received: by mail-qt1-x849.google.com with SMTP id x21so5959631qtp.16
 for <qemu-arm@nongnu.org>; Thu, 11 Jun 2020 15:30:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc:content-transfer-encoding;
 bh=fGqzZjaOSHrJ9KPowxmH4v4ZrSs77KHjpULDUX98fkY=;
 b=BZmOfyETED+a9c8Ju2PY28g511lU68/FbD6DhdsyXM0XN1kug5NMqI9qsboFq3+AGr
 ppFRxW7nFI/gWb7WYz6zRZSwM1agzZq2HLO7WkVLOQ4LsgHfkI3vUMkRx+cvu0tSLDxu
 XhkmkcdE2JiutP0HBXXeogtEk1WWorLFurFfdRbDAe00Y0eEUqYrZN50XsHaClhP7bh9
 HMOp8AyYOX70RlB0mjkYhsm6ZErFQBspCHt6dcFRPNej+CtFsdVrT5wEt8novEyUTqzN
 jgdD7xOPKziiqVMpxLCRrtrtP9PVAgtnV+RTPIzZff39+NJAGX79r8+5QNpbQ+HcaOKn
 yklQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc:content-transfer-encoding;
 bh=fGqzZjaOSHrJ9KPowxmH4v4ZrSs77KHjpULDUX98fkY=;
 b=QTol4LQqqP94hlu5LI6+RaiGN18rG4+TtuEOOjH8vStcm8dvY2fIFxU5DAn9n0oz+d
 6JxR5sV6qwrIEcK2MaSQRox5pIoBkm+v0NzPBuTpQ45/y5casjZNIgbGN9s08Zh/FHss
 gsCWjjvhX7IBmRxUTjGVq1ipuaKVCfRm17WWxqw56QK7Iwlrko/ezROvX5UidCizDWl4
 qC81p9lQ4K3ByLeqlDu4e/pRlfRgLRQz8UwTATrScFrC+HOvgmRLImWGeqyiwWvJ+Rch
 Jb6muv94FpUGRcCxtSHBUCRoGNfew7rpUTM2rH20e9U5kCOEsKvRnI53A/fv7v0ATSeT
 X3og==
X-Gm-Message-State: AOAM5328zbMHte0TmQCfy0N+BsmT8z4AEB9L923ELQV837s4jSAjvFy8
 0AhsiJtmltKXiIr1S6ZddjVWCDjOfw8q7AW7YA==
X-Received: by 2002:a05:6214:b30:: with SMTP id
 w16mr10058712qvj.28.1591914631456; 
 Thu, 11 Jun 2020 15:30:31 -0700 (PDT)
Date: Thu, 11 Jun 2020 15:30:06 -0700
In-Reply-To: <20200611223016.259837-1-hskinnemoen@google.com>
Message-Id: <20200611223016.259837-3-hskinnemoen@google.com>
Mime-Version: 1.0
References: <20200611223016.259837-1-hskinnemoen@google.com>
X-Mailer: git-send-email 2.27.0.290.gba653c62da-goog
Subject: [PATCH v2 02/12] hw/misc: Add NPCM7xx System Global Control Registers
 device model
From: Havard Skinnemoen <hskinnemoen@google.com>
To: peter.maydell@linaro.org, clg@kaod.org, joel@jms.id.au
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, Avi.Fishman@nuvoton.com, 
 kfting@nuvoton.com, Havard Skinnemoen <hskinnemoen@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::849;
 envelope-from=3h7DiXgsKCHAVgYWbbSacSbUccUZS.QcaeSai-OfabcbUbi.cfU@flex--hskinnemoen.bounces.google.com;
 helo=mail-qt1-x849.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -105
X-Spam_score: -10.6
X-Spam_bar: ----------
X-Spam_report: (-10.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=_AUTOLEARN
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
X-TUID: SXDve5n1k7yz

Implement a device model for the System Global Control Registers in the
NPCM730 and NPCM750 BMC SoCs.

This is primarily used to enable SMP boot (the boot ROM spins reading
the SCRPAD register) and DDR memory initialization; other registers are
best effort for now.

The reset values of the MDLR and PWRON registers are determined by the
SoC variant (730 vs 750) and board straps respectively.

Change-Id: Ifeb596be28f4d5463f0b386df38b3bbbb57677d1
Reviewed-by: Joel Stanley <joel@jms.id.au>
Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>
Signed-off-by: Havard Skinnemoen <hskinnemoen@google.com>
---
 MAINTAINERS                   |   8 ++
 hw/misc/Makefile.objs         |   1 +
 hw/misc/npcm7xx_gcr.c         | 211 ++++++++++++++++++++++++++++++++++
 hw/misc/trace-events          |   4 +
 include/hw/misc/npcm7xx_gcr.h |  76 ++++++++++++
 5 files changed, 300 insertions(+)
 create mode 100644 hw/misc/npcm7xx_gcr.c
 create mode 100644 include/hw/misc/npcm7xx_gcr.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 3abe3faa4e..efe7f499e3 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -721,6 +721,14 @@ S: Odd Fixes
 F: hw/arm/musicpal.c
 F: docs/system/arm/musicpal.rst
=20
+Nuvoton NPCM7xx
+M: Havard Skinnemoen <hskinnemoen@google.com>
+M: Tyrone Ting <kfting@nuvoton.com>
+L: qemu-arm@nongnu.org
+S: Supported
+F: hw/misc/npcm7xx*
+F: include/hw/misc/npcm7xx*
+
 nSeries
 M: Andrzej Zaborowski <balrogg@gmail.com>
 M: Peter Maydell <peter.maydell@linaro.org>
diff --git a/hw/misc/Makefile.objs b/hw/misc/Makefile.objs
index 5aaca8a039..40a9d1c01e 100644
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
index 0000000000..af03bf4a01
--- /dev/null
+++ b/hw/misc/npcm7xx_gcr.c
@@ -0,0 +1,211 @@
+/*
+ * Nuvoton NPCM7xx System Global Control Registers.
+ *
+ * Copyright 2020 Google LLC
+ *
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU General Public License
+ * version 2 as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
+ * GNU General Public License for more details.
+ */
+
+#include "qemu/osdep.h"
+
+#include "hw/misc/npcm7xx_gcr.h"
+#include "hw/qdev-properties.h"
+#include "qapi/error.h"
+#include "qemu/log.h"
+#include "qemu/module.h"
+#include "qemu/units.h"
+
+#include "trace.h"
+
+static const uint32_t cold_reset_values[NPCM7XX_GCR_NR_REGS] =3D {
+    [NPCM7XX_GCR_PDID]          =3D 0x04A92750,   /* Poleg A1 */
+    [NPCM7XX_GCR_MISCPE]        =3D 0x0000FFFF,
+    [NPCM7XX_GCR_SPSWC]         =3D 0x00000003,
+    [NPCM7XX_GCR_INTCR]         =3D 0x0000035E,
+    [NPCM7XX_GCR_HIFCR]         =3D 0x0000004E,
+    [NPCM7XX_GCR_INTCR2]        =3D (1U << 19),   /* DDR initialized */
+    [NPCM7XX_GCR_RESSR]         =3D 0x80000000,
+    [NPCM7XX_GCR_DSCNT]         =3D 0x000000c0,
+    [NPCM7XX_GCR_DAVCLVLR]      =3D 0x5A00F3CF,
+    [NPCM7XX_GCR_SCRPAD]        =3D 0x00000008,
+    [NPCM7XX_GCR_USB1PHYCTL]    =3D 0x034730E4,
+    [NPCM7XX_GCR_USB2PHYCTL]    =3D 0x034730E4,
+};
+
+static uint64_t npcm7xx_gcr_read(void *opaque, hwaddr offset, unsigned siz=
e)
+{
+    uint32_t reg =3D offset / sizeof(uint32_t);
+    NPCM7xxGCRState *s =3D opaque;
+
+    if (reg >=3D NPCM7XX_GCR_NR_REGS) {
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: offset 0x%04x out of range\n",
+                      __func__, (unsigned int)offset);
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
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: offset 0x%04x out of range\n",
+                      __func__, (unsigned int)offset);
+        return;
+    }
+
+    switch (reg) {
+    case NPCM7XX_GCR_PDID:
+    case NPCM7XX_GCR_PWRON:
+    case NPCM7XX_GCR_INTSR:
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: register @ 0x%04x is read-only=
\n",
+                      __func__, (unsigned int)offset);
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
+    NPCM7xxGCRState *s =3D NPCM7XX_GCR(dev);
+    uint64_t dram_size;
+
+    if (!s->dram) {
+        error_setg(errp, "npcm7xx_gcr: 'dram' link not set");
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
iB or
+     * more of DRAM will be interpreted as 128 MiB.
+     *
+     * https://github.com/Nuvoton-Israel/u-boot/blob/2aef993bd2aafeb5408db=
aad0f3ce099ee40c4aa/board/nuvoton/poleg/poleg.c#L244
+     */
+    dram_size =3D int128_get64(s->dram->size);
+    if (dram_size >=3D 2 * GiB) {
+        s->reset_intcr3 |=3D 4 << 8;
+    } else if (dram_size >=3D 1 * GiB) {
+        s->reset_intcr3 |=3D 3 << 8;
+    } else if (dram_size >=3D 512 * MiB) {
+        s->reset_intcr3 |=3D 2 << 8;
+    } else if (dram_size >=3D 256 * MiB) {
+        s->reset_intcr3 |=3D 1 << 8;
+    } else if (dram_size >=3D 128 * MiB) {
+        s->reset_intcr3 |=3D 0 << 8;
+    } else {
+        error_setg(errp,
+                   "npcm7xx_gcr: DRAM size %" PRIu64
+                   " is too small (need 128 MiB minimum)",
+                   dram_size);
+        return;
+    }
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
+static Property npcm7xx_gcr_properties[] =3D {
+    DEFINE_PROP_UINT32("disabled-modules", NPCM7xxGCRState, reset_mdlr, 0)=
,
+    DEFINE_PROP_UINT32("power-on-straps", NPCM7xxGCRState, reset_pwron, 0)=
,
+    DEFINE_PROP_LINK("dram", NPCM7xxGCRState, dram, TYPE_MEMORY_REGION,
+                     MemoryRegion *),
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
index 5561746866..1a20ce659a 100644
--- a/hw/misc/trace-events
+++ b/hw/misc/trace-events
@@ -107,6 +107,10 @@ mos6522_set_sr_int(void) "set sr_int"
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
index 0000000000..a881ac41a3
--- /dev/null
+++ b/include/hw/misc/npcm7xx_gcr.h
@@ -0,0 +1,76 @@
+/*
+ * Nuvoton NPCM7xx System Global Control Registers.
+ *
+ * Copyright 2020 Google LLC
+ *
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU General Public License
+ * version 2 as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
+ * GNU General Public License for more details.
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
+    NPCM7XX_GCR_MFSEL1          =3D 0x0C / sizeof(uint32_t),
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
+    NPCM7XX_GCR_VSINTR          =3D 0x0AC / sizeof(uint32_t),
+    NPCM7XX_GCR_MFSEL4,
+    NPCM7XX_GCR_CPBPNTR         =3D 0x0C4 / sizeof(uint32_t),
+    NPCM7XX_GCR_CPCTL           =3D 0x0D0 / sizeof(uint32_t),
+    NPCM7XX_GCR_CP2BST,
+    NPCM7XX_GCR_B2CPNT,
+    NPCM7XX_GCR_CPPCTL,
+    NPCM7XX_GCR_I2CSEGSEL,
+    NPCM7XX_GCR_I2CSEGCTL,
+    NPCM7XX_GCR_VSRCR,
+    NPCM7XX_GCR_MLOCKR,
+    NPCM7XX_GCR_SCRPAD          =3D 0x013C / sizeof(uint32_t),
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
+    MemoryRegion *dram;
+} NPCM7xxGCRState;
+
+#define TYPE_NPCM7XX_GCR "npcm7xx-gcr"
+#define NPCM7XX_GCR(obj) OBJECT_CHECK(NPCM7xxGCRState, (obj), TYPE_NPCM7XX=
_GCR)
+
+#endif /* NPCM7XX_GCR_H */
--=20
2.27.0.290.gba653c62da-goog

