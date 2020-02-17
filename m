Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp5518655lfp;
        Mon, 17 Feb 2020 15:24:36 -0800 (PST)
X-Received: by 2002:a05:600c:2150:: with SMTP id v16mr1205425wml.156.1581981876363;
        Mon, 17 Feb 2020 15:24:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581981876; cv=none;
        d=google.com; s=arc-20160816;
        b=FBt765h48P0+OztRZ6w1vSuPVZqnz9Es7mT/olw5xnGXYLBQ07/mLdGNjV7gGdjUSG
         n7b9ZFW9YiNxBwIq5aH3VsR1xqQWHQ+t/Xs4aj3yE0YW/qhZu+2wRkEN+ocfIBIBvRPv
         J18pCtzz1v9O/C39XgK682WP7RWaw0RTt/m3FIxP2hPpY7SIy4wP/8dp2ydrdufrlu28
         gzZEJ6d+IhWQ2uBwBvaCtBchuXvWIJAwbUSAZiMKeFWNIuUuu3IUgTdR2geViCdW6BMX
         PAje4EvgUi4ytTSr7buElE+wNuOtPXLFqNAsxAAtGkVHuZbCLcHkALzxowPh1aDEV2QI
         ucvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :dkim-signature;
        bh=Nx+TtO22BJscJfxf//XhPThhierD92+b/vbXTLY3yXQ=;
        b=oiQi4C4Qt95eOdTG7xXp3aQsaiHBRvopppUnc4Xk7/OeaG86OGlkQP7x/ZGKR5vky/
         fFmZuawUIVdpkMQzzDMK46kRQKyd+vEX8fPX+xV7AVY1OULuMHsJK+3DJYNvQoG/Yp3Z
         MYEQLpqSeOZIexExI8P72eJWpXJFgZ+RRhSIXv+e+galQec3M6tPXXUD6kS6rUnKBbJW
         DUxa5S30hcReDniOdt3Gzk302foC63ymB9iw8/eaXUrK+OGvw+5+RwZEWuTu6CIOEN6v
         0HK1psiJP0ngR2Dw7bdFVDDeY2A27RXZngwZS5EsoFaYuqvdGsei+h2Z77aEN4WZfIPI
         j6lQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=um+udyZL;
       spf=pass (google.com: domain of nieklinnenbank@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=nieklinnenbank@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <nieklinnenbank@gmail.com>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id h3sor1362313wro.48.2020.02.17.15.24.36
        (Google Transport Security);
        Mon, 17 Feb 2020 15:24:36 -0800 (PST)
Received-SPF: pass (google.com: domain of nieklinnenbank@gmail.com designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=um+udyZL;
       spf=pass (google.com: domain of nieklinnenbank@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=nieklinnenbank@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=Nx+TtO22BJscJfxf//XhPThhierD92+b/vbXTLY3yXQ=;
        b=um+udyZLwkpujh1tMwgDkM4oWCP5R+ZhZnWw7pciwLbdytmFS+ZTR1AxWcc83Af5eT
         jaq0eKLxIxOp4lo/5DCPxDEHt43tZb1GS8NIO7aqXxSo2tXr/i9Id343AJ7uLtR5viXB
         OQm6xOBEkIuKwMdW4i2v1dVa+DB9VFXxtieh0Cl46B5aUHRevMJAhQ7mLH+JN1UURJXP
         0q9l3M/sm8CP6uFneqbQ0Hrna6jzQMo9Uk1JHORfydAm7fnzcY262d2s0lVDMVxKtkH5
         IQJ/GNubekUl26j/wtT7satougl1Ogucm+e1juqmgNvnFkKGeVQYhuvh38ycDiUvG+4u
         MFsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=Nx+TtO22BJscJfxf//XhPThhierD92+b/vbXTLY3yXQ=;
        b=bk3vS86X9eGzbhmrQoTcV3P1QWgx+W4s0oDfDlBJwDdzlmoxrrIiV4HHSi2YRRIwIW
         Y8tQDplC7z2dI2NB8lVk8gaEXQzqS66Oe+rARI1yJxR1YwWpORLrVtBUYDANzDAvOd0Y
         XQFW5Kb3HKPV+QaZoRfPeM5xtD4RE13dTFFyZmW0T2uNqNsa9h0nUvmWDmpn9RDjFBYC
         XZr4kl7YjiJpXie6iRMUJfCiIFwl9I6pYJHFSQIW/QzPbYDG3/DkIVurrrj6taO6AaUV
         jcQKaxXCvFJB9EzImfdy+4ymDn0y61vLJStdS8zavVToafjnjsQlK5jjcrvuc3SzZ3DB
         dKjA==
X-Gm-Message-State: APjAAAXROuuHJHFFKRbSpeeOAOukYbeS8WMVC+wQUekKnvT7fwNlrW2X
	UeGo7OMw0Na9kF9WKo4XDMPqGRMKQjc=
X-Google-Smtp-Source: APXvYqxq4dF44XwnjrhHHudz/pOsh0MQZemaoxhZ5HZ+6rgx7FFyGPIkI4UEaMy3h0pCTDjekl35cA==
X-Received: by 2002:adf:f80c:: with SMTP id s12mr24690280wrp.1.1581981875557;
        Mon, 17 Feb 2020 15:24:35 -0800 (PST)
Return-Path: <nieklinnenbank@gmail.com>
Received: from pavilion.home ([2a02:a456:6be8:1:8edc:d4ff:fe8b:18b7])
        by smtp.gmail.com with ESMTPSA id w1sm3244831wro.72.2020.02.17.15.24.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2020 15:24:35 -0800 (PST)
From: Niek Linnenbank <nieklinnenbank@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	peter.maydell@linaro.org,
	philmd@redhat.com,
	b.galvani@gmail.com,
	jasowang@redhat.com,
	alex.bennee@linaro.org,
	imammedo@redhat.com,
	Niek Linnenbank <nieklinnenbank@gmail.com>
Subject: [PATCH v5 12/18] hw/arm/allwinner: add RTC device support
Date: Tue, 18 Feb 2020 00:24:05 +0100
Message-Id: <20200217232411.30096-13-nieklinnenbank@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200217232411.30096-1-nieklinnenbank@gmail.com>
References: <20200217232411.30096-1-nieklinnenbank@gmail.com>
X-TUID: UCC2QXRUDBCB

Allwinner System-on-Chips usually contain a Real Time Clock (RTC)
for non-volatile system date and time keeping. This commit adds a generic
Allwinner RTC device that supports the RTC devices found in Allwinner SoC
family sun4i (A10), sun7i (A20) and sun6i and newer (A31, H2+, H3, etc).
The following RTC functionality and features are implemented:

 * Year-Month-Day read/write
 * Hour-Minute-Second read/write
 * General Purpose storage

The following boards are extended with the RTC device:

 * Cubieboard (hw/arm/cubieboard.c)
 * Orange Pi PC (hw/arm/orangepi.c)

Signed-off-by: Niek Linnenbank <nieklinnenbank@gmail.com>
---
 include/hw/arm/allwinner-a10.h |   2 +
 include/hw/arm/allwinner-h3.h  |   3 +
 include/hw/rtc/allwinner-rtc.h | 134 +++++++++++
 hw/arm/allwinner-a10.c         |   8 +
 hw/arm/allwinner-h3.c          |   9 +-
 hw/rtc/allwinner-rtc.c         | 411 +++++++++++++++++++++++++++++++++
 hw/rtc/Makefile.objs           |   1 +
 hw/rtc/trace-events            |   4 +
 8 files changed, 571 insertions(+), 1 deletion(-)
 create mode 100644 include/hw/rtc/allwinner-rtc.h
 create mode 100644 hw/rtc/allwinner-rtc.c

diff --git a/include/hw/arm/allwinner-a10.h b/include/hw/arm/allwinner-a10.h
index d009616eef..fc979985e6 100644
--- a/include/hw/arm/allwinner-a10.h
+++ b/include/hw/arm/allwinner-a10.h
@@ -9,6 +9,7 @@
 #include "hw/net/allwinner_emac.h"
 #include "hw/sd/allwinner-sdhost.h"
 #include "hw/ide/ahci.h"
+#include "hw/rtc/allwinner-rtc.h"
 
 #include "target/arm/cpu.h"
 
@@ -29,6 +30,7 @@ typedef struct AwA10State {
     AwEmacState emac;
     AllwinnerAHCIState sata;
     AwSdHostState mmc0;
+    AwRtcState rtc;
     MemoryRegion sram_a;
 } AwA10State;
 
diff --git a/include/hw/arm/allwinner-h3.h b/include/hw/arm/allwinner-h3.h
index 065d020c73..82e4e59216 100644
--- a/include/hw/arm/allwinner-h3.h
+++ b/include/hw/arm/allwinner-h3.h
@@ -46,6 +46,7 @@
 #include "hw/misc/allwinner-sid.h"
 #include "hw/sd/allwinner-sdhost.h"
 #include "hw/net/allwinner-sun8i-emac.h"
+#include "hw/rtc/allwinner-rtc.h"
 #include "target/arm/cpu.h"
 #include "sysemu/block-backend.h"
 
@@ -88,6 +89,7 @@ enum {
     AW_H3_GIC_CPU,
     AW_H3_GIC_HYP,
     AW_H3_GIC_VCPU,
+    AW_H3_RTC,
     AW_H3_CPUCFG,
     AW_H3_SDRAM
 };
@@ -129,6 +131,7 @@ typedef struct AwH3State {
     AwSidState sid;
     AwSdHostState mmc0;
     AwSun8iEmacState emac;
+    AwRtcState rtc;
     GICState gic;
     MemoryRegion sram_a1;
     MemoryRegion sram_a2;
diff --git a/include/hw/rtc/allwinner-rtc.h b/include/hw/rtc/allwinner-rtc.h
new file mode 100644
index 0000000000..7893f74795
--- /dev/null
+++ b/include/hw/rtc/allwinner-rtc.h
@@ -0,0 +1,134 @@
+/*
+ * Allwinner Real Time Clock emulation
+ *
+ * Copyright (C) 2019 Niek Linnenbank <nieklinnenbank@gmail.com>
+ *
+ * This program is free software: you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation, either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program.  If not, see <http://www.gnu.org/licenses/>.
+ */
+
+#ifndef HW_MISC_ALLWINNER_RTC_H
+#define HW_MISC_ALLWINNER_RTC_H
+
+#include "qom/object.h"
+#include "hw/sysbus.h"
+
+/**
+ * Constants
+ * @{
+ */
+
+/** Highest register address used by RTC device */
+#define AW_RTC_REGS_MAXADDR     (0x200)
+
+/** Total number of known registers */
+#define AW_RTC_REGS_NUM         (AW_RTC_REGS_MAXADDR / sizeof(uint32_t))
+
+/** @} */
+
+/**
+ * Object model types
+ * @{
+ */
+
+/** Generic Allwinner RTC device (abstract) */
+#define TYPE_AW_RTC          "allwinner-rtc"
+
+/** Allwinner RTC sun4i family (A10, A12) */
+#define TYPE_AW_RTC_SUN4I    TYPE_AW_RTC "-sun4i"
+
+/** Allwinner RTC sun6i family and newer (A31, H2+, H3, etc) */
+#define TYPE_AW_RTC_SUN6I    TYPE_AW_RTC "-sun6i"
+
+/** Allwinner RTC sun7i family (A20) */
+#define TYPE_AW_RTC_SUN7I    TYPE_AW_RTC "-sun7i"
+
+/** @} */
+
+/**
+ * Object model macros
+ * @{
+ */
+
+#define AW_RTC(obj) \
+    OBJECT_CHECK(AwRtcState, (obj), TYPE_AW_RTC)
+#define AW_RTC_CLASS(klass) \
+     OBJECT_CLASS_CHECK(AwRtcClass, (klass), TYPE_AW_RTC)
+#define AW_RTC_GET_CLASS(obj) \
+     OBJECT_GET_CLASS(AwRtcClass, (obj), TYPE_AW_RTC)
+
+/** @} */
+
+/**
+ * Allwinner RTC per-object instance state.
+ */
+typedef struct AwRtcState {
+    /*< private >*/
+    SysBusDevice parent_obj;
+    /*< public >*/
+
+    /**
+     * Actual year represented by the device when year counter is zero
+     *
+     * Can be overridden by the user using the corresponding 'base-year'
+     * property. The base year used by the target OS driver can vary, for
+     * example the Linux driver for sun6i uses 1970 while NetBSD uses 2000.
+     */
+    int base_year;
+
+    /** Maps I/O registers in physical memory */
+    MemoryRegion iomem;
+
+    /** Array of hardware registers */
+    uint32_t regs[AW_RTC_REGS_NUM];
+
+} AwRtcState;
+
+/**
+ * Allwinner RTC class-level struct.
+ *
+ * This struct is filled by each sunxi device specific code
+ * such that the generic code can use this struct to support
+ * all devices.
+ */
+typedef struct AwRtcClass {
+    /*< private >*/
+    SysBusDeviceClass parent_class;
+    /*< public >*/
+
+    /** Defines device specific register map */
+    const uint8_t *regmap;
+
+    /** Size of the regmap in bytes */
+    size_t regmap_size;
+
+    /**
+     * Read device specific register
+     *
+     * @offset: register offset to read
+     * @return true if register read successful, false otherwise
+     */
+    bool (*read)(AwRtcState *s, uint32_t offset);
+
+    /**
+     * Write device specific register
+     *
+     * @offset: register offset to write
+     * @data: value to set in register
+     * @return true if register write successful, false otherwise
+     */
+    bool (*write)(AwRtcState *s, uint32_t offset, uint32_t data);
+
+} AwRtcClass;
+
+#endif /* HW_MISC_ALLWINNER_RTC_H */
diff --git a/hw/arm/allwinner-a10.c b/hw/arm/allwinner-a10.c
index a80319bcbc..db8dc2dfc2 100644
--- a/hw/arm/allwinner-a10.c
+++ b/hw/arm/allwinner-a10.c
@@ -31,6 +31,7 @@
 #define AW_A10_UART0_REG_BASE   0x01c28000
 #define AW_A10_EMAC_BASE        0x01c0b000
 #define AW_A10_SATA_BASE        0x01c18000
+#define AW_A10_RTC_BASE         0x01c20d00
 
 static void aw_a10_init(Object *obj)
 {
@@ -53,6 +54,9 @@ static void aw_a10_init(Object *obj)
 
     sysbus_init_child_obj(obj, "mmc0", &s->mmc0, sizeof(s->mmc0),
                           TYPE_AW_SDHOST_SUN4I);
+
+    sysbus_init_child_obj(obj, "rtc", &s->rtc, sizeof(s->rtc),
+                          TYPE_AW_RTC_SUN4I);
 }
 
 static void aw_a10_realize(DeviceState *dev, Error **errp)
@@ -132,6 +136,10 @@ static void aw_a10_realize(DeviceState *dev, Error **errp)
     sysbus_connect_irq(SYS_BUS_DEVICE(&s->mmc0), 0, qdev_get_gpio_in(dev, 32));
     object_property_add_alias(OBJECT(s), "sd-bus", OBJECT(&s->mmc0),
                               "sd-bus", &error_abort);
+
+    /* RTC */
+    qdev_init_nofail(DEVICE(&s->rtc));
+    sysbus_mmio_map_overlap(SYS_BUS_DEVICE(&s->rtc), 0, AW_A10_RTC_BASE, 10);
 }
 
 static void aw_a10_class_init(ObjectClass *oc, void *data)
diff --git a/hw/arm/allwinner-h3.c b/hw/arm/allwinner-h3.c
index 0e0fea6223..f1edb679d5 100644
--- a/hw/arm/allwinner-h3.c
+++ b/hw/arm/allwinner-h3.c
@@ -63,6 +63,7 @@ const hwaddr allwinner_h3_memmap[] = {
     [AW_H3_GIC_CPU]    = 0x01c82000,
     [AW_H3_GIC_HYP]    = 0x01c84000,
     [AW_H3_GIC_VCPU]   = 0x01c86000,
+    [AW_H3_RTC]        = 0x01f00000,
     [AW_H3_CPUCFG]     = 0x01f01c00,
     [AW_H3_SDRAM]      = 0x40000000
 };
@@ -118,7 +119,6 @@ struct AwH3Unimplemented {
     { "csi",       0x01cb0000, 320 * KiB },
     { "tve",       0x01e00000, 64 * KiB },
     { "hdmi",      0x01ee0000, 128 * KiB },
-    { "rtc",       0x01f00000, 1 * KiB },
     { "r_timer",   0x01f00800, 1 * KiB },
     { "r_intc",    0x01f00c00, 1 * KiB },
     { "r_wdog",    0x01f01000, 1 * KiB },
@@ -236,6 +236,9 @@ static void allwinner_h3_init(Object *obj)
                              "ram-addr", &error_abort);
     object_property_add_alias(obj, "ram-size", OBJECT(&s->dramc),
                               "ram-size", &error_abort);
+
+    sysbus_init_child_obj(obj, "rtc", &s->rtc, sizeof(s->rtc),
+                          TYPE_AW_RTC_SUN6I);
 }
 
 static void allwinner_h3_realize(DeviceState *dev, Error **errp)
@@ -426,6 +429,10 @@ static void allwinner_h3_realize(DeviceState *dev, Error **errp)
     sysbus_mmio_map(SYS_BUS_DEVICE(&s->dramc), 1, s->memmap[AW_H3_DRAMCTL]);
     sysbus_mmio_map(SYS_BUS_DEVICE(&s->dramc), 2, s->memmap[AW_H3_DRAMPHY]);
 
+    /* RTC */
+    qdev_init_nofail(DEVICE(&s->rtc));
+    sysbus_mmio_map(SYS_BUS_DEVICE(&s->rtc), 0, s->memmap[AW_H3_RTC]);
+
     /* Unimplemented devices */
     for (i = 0; i < ARRAY_SIZE(unimplemented); i++) {
         create_unimplemented_device(unimplemented[i].device_name,
diff --git a/hw/rtc/allwinner-rtc.c b/hw/rtc/allwinner-rtc.c
new file mode 100644
index 0000000000..5606a51d5c
--- /dev/null
+++ b/hw/rtc/allwinner-rtc.c
@@ -0,0 +1,411 @@
+/*
+ * Allwinner Real Time Clock emulation
+ *
+ * Copyright (C) 2019 Niek Linnenbank <nieklinnenbank@gmail.com>
+ *
+ * This program is free software: you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation, either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program.  If not, see <http://www.gnu.org/licenses/>.
+ */
+
+#include "qemu/osdep.h"
+#include "qemu/units.h"
+#include "hw/sysbus.h"
+#include "migration/vmstate.h"
+#include "qemu/log.h"
+#include "qemu/module.h"
+#include "qemu-common.h"
+#include "hw/qdev-properties.h"
+#include "hw/rtc/allwinner-rtc.h"
+#include "trace.h"
+
+/* RTC registers */
+enum {
+    REG_LOSC = 1,        /* Low Oscillator Control */
+    REG_YYMMDD,          /* RTC Year-Month-Day */
+    REG_HHMMSS,          /* RTC Hour-Minute-Second */
+    REG_ALARM1_WKHHMMSS, /* Alarm1 Week Hour-Minute-Second */
+    REG_ALARM1_EN,       /* Alarm1 Enable */
+    REG_ALARM1_IRQ_EN,   /* Alarm1 IRQ Enable */
+    REG_ALARM1_IRQ_STA,  /* Alarm1 IRQ Status */
+    REG_GP0,             /* General Purpose Register 0 */
+    REG_GP1,             /* General Purpose Register 1 */
+    REG_GP2,             /* General Purpose Register 2 */
+    REG_GP3,             /* General Purpose Register 3 */
+
+    /* sun4i registers */
+    REG_ALARM1_DDHHMMSS, /* Alarm1 Day Hour-Minute-Second */
+    REG_CPUCFG,          /* CPU Configuration Register */
+
+    /* sun6i registers */
+    REG_LOSC_AUTOSTA,    /* LOSC Auto Switch Status */
+    REG_INT_OSC_PRE,     /* Internal OSC Clock Prescaler */
+    REG_ALARM0_COUNTER,  /* Alarm0 Counter */
+    REG_ALARM0_CUR_VLU,  /* Alarm0 Counter Current Value */
+    REG_ALARM0_ENABLE,   /* Alarm0 Enable */
+    REG_ALARM0_IRQ_EN,   /* Alarm0 IRQ Enable */
+    REG_ALARM0_IRQ_STA,  /* Alarm0 IRQ Status */
+    REG_ALARM_CONFIG,    /* Alarm Config */
+    REG_LOSC_OUT_GATING, /* LOSC Output Gating Register */
+    REG_GP4,             /* General Purpose Register 4 */
+    REG_GP5,             /* General Purpose Register 5 */
+    REG_GP6,             /* General Purpose Register 6 */
+    REG_GP7,             /* General Purpose Register 7 */
+    REG_RTC_DBG,         /* RTC Debug Register */
+    REG_GPL_HOLD_OUT,    /* GPL Hold Output Register */
+    REG_VDD_RTC,         /* VDD RTC Regulate Register */
+    REG_IC_CHARA,        /* IC Characteristics Register */
+};
+
+/* RTC register flags */
+enum {
+    REG_LOSC_YMD   = (1 << 7),
+    REG_LOSC_HMS   = (1 << 8),
+};
+
+/* RTC sun4i register map (offset to name) */
+const uint8_t allwinner_rtc_sun4i_regmap[] = {
+    [0x0000] = REG_LOSC,
+    [0x0004] = REG_YYMMDD,
+    [0x0008] = REG_HHMMSS,
+    [0x000C] = REG_ALARM1_DDHHMMSS,
+    [0x0010] = REG_ALARM1_WKHHMMSS,
+    [0x0014] = REG_ALARM1_EN,
+    [0x0018] = REG_ALARM1_IRQ_EN,
+    [0x001C] = REG_ALARM1_IRQ_STA,
+    [0x0020] = REG_GP0,
+    [0x0024] = REG_GP1,
+    [0x0028] = REG_GP2,
+    [0x002C] = REG_GP3,
+    [0x003C] = REG_CPUCFG,
+};
+
+/* RTC sun6i register map (offset to name) */
+const uint8_t allwinner_rtc_sun6i_regmap[] = {
+    [0x0000] = REG_LOSC,
+    [0x0004] = REG_LOSC_AUTOSTA,
+    [0x0008] = REG_INT_OSC_PRE,
+    [0x0010] = REG_YYMMDD,
+    [0x0014] = REG_HHMMSS,
+    [0x0020] = REG_ALARM0_COUNTER,
+    [0x0024] = REG_ALARM0_CUR_VLU,
+    [0x0028] = REG_ALARM0_ENABLE,
+    [0x002C] = REG_ALARM0_IRQ_EN,
+    [0x0030] = REG_ALARM0_IRQ_STA,
+    [0x0040] = REG_ALARM1_WKHHMMSS,
+    [0x0044] = REG_ALARM1_EN,
+    [0x0048] = REG_ALARM1_IRQ_EN,
+    [0x004C] = REG_ALARM1_IRQ_STA,
+    [0x0050] = REG_ALARM_CONFIG,
+    [0x0060] = REG_LOSC_OUT_GATING,
+    [0x0100] = REG_GP0,
+    [0x0104] = REG_GP1,
+    [0x0108] = REG_GP2,
+    [0x010C] = REG_GP3,
+    [0x0110] = REG_GP4,
+    [0x0114] = REG_GP5,
+    [0x0118] = REG_GP6,
+    [0x011C] = REG_GP7,
+    [0x0170] = REG_RTC_DBG,
+    [0x0180] = REG_GPL_HOLD_OUT,
+    [0x0190] = REG_VDD_RTC,
+    [0x01F0] = REG_IC_CHARA,
+};
+
+static bool allwinner_rtc_sun4i_read(AwRtcState *s, uint32_t offset)
+{
+    /* no sun4i specific registers currently implemented */
+    return false;
+}
+
+static bool allwinner_rtc_sun4i_write(AwRtcState *s, uint32_t offset,
+                                      uint32_t data)
+{
+    /* no sun4i specific registers currently implemented */
+    return false;
+}
+
+static bool allwinner_rtc_sun6i_read(AwRtcState *s, uint32_t offset)
+{
+    const AwRtcClass *c = AW_RTC_GET_CLASS(s);
+
+    switch (c->regmap[offset]) {
+    case REG_GP4:             /* General Purpose Register 4 */
+    case REG_GP5:             /* General Purpose Register 5 */
+    case REG_GP6:             /* General Purpose Register 6 */
+    case REG_GP7:             /* General Purpose Register 7 */
+        return true;
+    default:
+        break;
+    }
+    return false;
+}
+
+static bool allwinner_rtc_sun6i_write(AwRtcState *s, uint32_t offset,
+                                      uint32_t data)
+{
+    const AwRtcClass *c = AW_RTC_GET_CLASS(s);
+
+    switch (c->regmap[offset]) {
+    case REG_GP4:             /* General Purpose Register 4 */
+    case REG_GP5:             /* General Purpose Register 5 */
+    case REG_GP6:             /* General Purpose Register 6 */
+    case REG_GP7:             /* General Purpose Register 7 */
+        return true;
+    default:
+        break;
+    }
+    return false;
+}
+
+static uint64_t allwinner_rtc_read(void *opaque, hwaddr offset,
+                                   unsigned size)
+{
+    AwRtcState *s = AW_RTC(opaque);
+    const AwRtcClass *c = AW_RTC_GET_CLASS(s);
+    uint64_t val = 0;
+
+    if (offset >= c->regmap_size) {
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: out-of-bounds offset 0x%04x\n",
+                      __func__, (uint32_t)offset);
+        return 0;
+    }
+
+    if (!c->regmap[offset]) {
+            qemu_log_mask(LOG_GUEST_ERROR, "%s: invalid register 0x%04x\n",
+                          __func__, (uint32_t)offset);
+        return 0;
+    }
+
+    switch (c->regmap[offset]) {
+    case REG_LOSC:       /* Low Oscillator Control */
+        val = s->regs[REG_LOSC];
+        s->regs[REG_LOSC] &= ~(REG_LOSC_YMD | REG_LOSC_HMS);
+        break;
+    case REG_YYMMDD:     /* RTC Year-Month-Day */
+    case REG_HHMMSS:     /* RTC Hour-Minute-Second */
+    case REG_GP0:        /* General Purpose Register 0 */
+    case REG_GP1:        /* General Purpose Register 1 */
+    case REG_GP2:        /* General Purpose Register 2 */
+    case REG_GP3:        /* General Purpose Register 3 */
+        val = s->regs[c->regmap[offset]];
+        break;
+    default:
+        if (!c->read(s, offset)) {
+            qemu_log_mask(LOG_UNIMP, "%s: unimplemented register 0x%04x\n",
+                          __func__, (uint32_t)offset);
+        }
+        val = s->regs[c->regmap[offset]];
+        break;
+    }
+
+    trace_allwinner_rtc_read(offset, val);
+    return val;
+}
+
+static void allwinner_rtc_write(void *opaque, hwaddr offset,
+                                uint64_t val, unsigned size)
+{
+    AwRtcState *s = AW_RTC(opaque);
+    const AwRtcClass *c = AW_RTC_GET_CLASS(s);
+
+    if (offset >= c->regmap_size) {
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: out-of-bounds offset 0x%04x\n",
+                      __func__, (uint32_t)offset);
+        return;
+    }
+
+    if (!c->regmap[offset]) {
+            qemu_log_mask(LOG_GUEST_ERROR, "%s: invalid register 0x%04x\n",
+                          __func__, (uint32_t)offset);
+        return;
+    }
+
+    trace_allwinner_rtc_write(offset, val);
+
+    switch (c->regmap[offset]) {
+    case REG_YYMMDD:     /* RTC Year-Month-Day */
+        s->regs[REG_YYMMDD] = val;
+        s->regs[REG_LOSC]  |= REG_LOSC_YMD;
+        break;
+    case REG_HHMMSS:     /* RTC Hour-Minute-Second */
+        s->regs[REG_HHMMSS] = val;
+        s->regs[REG_LOSC]  |= REG_LOSC_HMS;
+        break;
+    case REG_GP0:        /* General Purpose Register 0 */
+    case REG_GP1:        /* General Purpose Register 1 */
+    case REG_GP2:        /* General Purpose Register 2 */
+    case REG_GP3:        /* General Purpose Register 3 */
+        s->regs[c->regmap[offset]] = val;
+        break;
+    default:
+        if (!c->write(s, offset, val)) {
+            qemu_log_mask(LOG_UNIMP, "%s: unimplemented register 0x%04x\n",
+                          __func__, (uint32_t)offset);
+        }
+        break;
+    }
+}
+
+static const MemoryRegionOps allwinner_rtc_ops = {
+    .read = allwinner_rtc_read,
+    .write = allwinner_rtc_write,
+    .endianness = DEVICE_NATIVE_ENDIAN,
+    .valid = {
+        .min_access_size = 4,
+        .max_access_size = 4,
+    },
+    .impl.min_access_size = 4,
+};
+
+static void allwinner_rtc_reset(DeviceState *dev)
+{
+    AwRtcState *s = AW_RTC(dev);
+    struct tm now;
+
+    /* Clear registers */
+    memset(s->regs, 0, sizeof(s->regs));
+
+    /* Get current datetime */
+    qemu_get_timedate(&now, 0);
+
+    /* Set RTC with current datetime */
+    if (s->base_year > 1900) {
+        s->regs[REG_YYMMDD] =  ((now.tm_year + 1900 - s->base_year) << 16) |
+                               ((now.tm_mon + 1) << 8) |
+                                 now.tm_mday;
+        s->regs[REG_HHMMSS] = (((now.tm_wday + 6) % 7) << 29) |
+                                  (now.tm_hour << 16) |
+                                  (now.tm_min << 8) |
+                                   now.tm_sec;
+    }
+}
+
+static void allwinner_rtc_init(Object *obj)
+{
+    SysBusDevice *sbd = SYS_BUS_DEVICE(obj);
+    AwRtcState *s = AW_RTC(obj);
+
+    /* Memory mapping */
+    memory_region_init_io(&s->iomem, OBJECT(s), &allwinner_rtc_ops, s,
+                          TYPE_AW_RTC, 1 * KiB);
+    sysbus_init_mmio(sbd, &s->iomem);
+}
+
+static const VMStateDescription allwinner_rtc_vmstate = {
+    .name = "allwinner-rtc",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .fields = (VMStateField[]) {
+        VMSTATE_UINT32_ARRAY(regs, AwRtcState, AW_RTC_REGS_NUM),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
+static Property allwinner_rtc_properties[] = {
+    DEFINE_PROP_INT32("base-year", AwRtcState, base_year, 0),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
+static void allwinner_rtc_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+
+    dc->reset = allwinner_rtc_reset;
+    dc->vmsd = &allwinner_rtc_vmstate;
+    device_class_set_props(dc, allwinner_rtc_properties);
+}
+
+static void allwinner_rtc_sun4i_init(Object *obj)
+{
+    AwRtcState *s = AW_RTC(obj);
+    s->base_year = 2010;
+}
+
+static void allwinner_rtc_sun4i_class_init(ObjectClass *klass, void *data)
+{
+    AwRtcClass *arc = AW_RTC_CLASS(klass);
+
+    arc->regmap = allwinner_rtc_sun4i_regmap;
+    arc->regmap_size = sizeof(allwinner_rtc_sun4i_regmap);
+    arc->read = allwinner_rtc_sun4i_read;
+    arc->write = allwinner_rtc_sun4i_write;
+}
+
+static void allwinner_rtc_sun6i_init(Object *obj)
+{
+    AwRtcState *s = AW_RTC(obj);
+    s->base_year = 1970;
+}
+
+static void allwinner_rtc_sun6i_class_init(ObjectClass *klass, void *data)
+{
+    AwRtcClass *arc = AW_RTC_CLASS(klass);
+
+    arc->regmap = allwinner_rtc_sun6i_regmap;
+    arc->regmap_size = sizeof(allwinner_rtc_sun6i_regmap);
+    arc->read = allwinner_rtc_sun6i_read;
+    arc->write = allwinner_rtc_sun6i_write;
+}
+
+static void allwinner_rtc_sun7i_init(Object *obj)
+{
+    AwRtcState *s = AW_RTC(obj);
+    s->base_year = 1970;
+}
+
+static void allwinner_rtc_sun7i_class_init(ObjectClass *klass, void *data)
+{
+    AwRtcClass *arc = AW_RTC_CLASS(klass);
+    allwinner_rtc_sun4i_class_init(klass, arc);
+}
+
+static const TypeInfo allwinner_rtc_info = {
+    .name          = TYPE_AW_RTC,
+    .parent        = TYPE_SYS_BUS_DEVICE,
+    .instance_init = allwinner_rtc_init,
+    .instance_size = sizeof(AwRtcState),
+    .class_init    = allwinner_rtc_class_init,
+    .class_size    = sizeof(AwRtcClass),
+    .abstract      = true,
+};
+
+static const TypeInfo allwinner_rtc_sun4i_info = {
+    .name          = TYPE_AW_RTC_SUN4I,
+    .parent        = TYPE_AW_RTC,
+    .class_init    = allwinner_rtc_sun4i_class_init,
+    .instance_init = allwinner_rtc_sun4i_init,
+};
+
+static const TypeInfo allwinner_rtc_sun6i_info = {
+    .name          = TYPE_AW_RTC_SUN6I,
+    .parent        = TYPE_AW_RTC,
+    .class_init    = allwinner_rtc_sun6i_class_init,
+    .instance_init = allwinner_rtc_sun6i_init,
+};
+
+static const TypeInfo allwinner_rtc_sun7i_info = {
+    .name          = TYPE_AW_RTC_SUN7I,
+    .parent        = TYPE_AW_RTC,
+    .class_init    = allwinner_rtc_sun7i_class_init,
+    .instance_init = allwinner_rtc_sun7i_init,
+};
+
+static void allwinner_rtc_register(void)
+{
+    type_register_static(&allwinner_rtc_info);
+    type_register_static(&allwinner_rtc_sun4i_info);
+    type_register_static(&allwinner_rtc_sun6i_info);
+    type_register_static(&allwinner_rtc_sun7i_info);
+}
+
+type_init(allwinner_rtc_register)
diff --git a/hw/rtc/Makefile.objs b/hw/rtc/Makefile.objs
index aa208d0d10..e4c1b8617c 100644
--- a/hw/rtc/Makefile.objs
+++ b/hw/rtc/Makefile.objs
@@ -12,3 +12,4 @@ obj-$(CONFIG_MC146818RTC) += mc146818rtc.o
 common-obj-$(CONFIG_SUN4V_RTC) += sun4v-rtc.o
 common-obj-$(CONFIG_ASPEED_SOC) += aspeed_rtc.o
 common-obj-$(CONFIG_GOLDFISH_RTC) += goldfish_rtc.o
+common-obj-$(CONFIG_ALLWINNER_H3) += allwinner-rtc.o
diff --git a/hw/rtc/trace-events b/hw/rtc/trace-events
index c9894e1747..1bc7147d0e 100644
--- a/hw/rtc/trace-events
+++ b/hw/rtc/trace-events
@@ -1,5 +1,9 @@
 # See docs/devel/tracing.txt for syntax documentation.
 
+# allwinner-rtc.c
+allwinner_rtc_read(uint64_t addr, uint64_t value) "addr 0x%" PRIx64 " value 0x%" PRIx64
+allwinner_rtc_write(uint64_t addr, uint64_t value) "addr 0x%" PRIx64 " value 0x%" PRIx64
+
 # sun4v-rtc.c
 sun4v_rtc_read(uint64_t addr, uint64_t value) "read: addr 0x%" PRIx64 " value 0x%" PRIx64
 sun4v_rtc_write(uint64_t addr, uint64_t value) "write: addr 0x%" PRIx64 " value 0x%" PRIx64
-- 
2.17.1
