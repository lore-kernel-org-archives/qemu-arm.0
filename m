Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp969908lff;
        Sat, 18 Jan 2020 16:51:24 -0800 (PST)
X-Received: by 2002:a1c:7ed0:: with SMTP id z199mr12050429wmc.58.1579395083956;
        Sat, 18 Jan 2020 16:51:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579395083; cv=none;
        d=google.com; s=arc-20160816;
        b=HufepBWEvEpDEY4RczQ0Xq7rpl5oZGlKfVThOWGAHJ1R64T7OTu7y4fa36s086Ev9C
         5YNpJj3WE1OjuAQY8b1yjYKltBtQXWiCyXnnV5EZNHiYQ95QeFo30cjt8J/4Qbq/boTY
         1E0vs+qg3c/STqjqb52nYTcRhFk+unv1iiKenrdcgLlnohIi1kpvvoz7cPfIcjsX/O0i
         lz4M3aQdysT8zuJnICCDpsDSyrrtnMXV1dw4+biWtkIqEaY2v7biDkiZomhriPxpOss3
         FAw4ybzbKljgWCuH4Z1ZBaqhpmFv/+PygqDVqRO0JXFPYykOA5kkir5qOd/uXVzoitcI
         dLoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :dkim-signature;
        bh=7JgmHjSodSknZwo9B2SadfCQ2yAYDzWDNqB65Av5uI4=;
        b=EfqpQ2Uyg95JRrG1TvYz+OIDelp/ISmEc5y/iza5tSB7AYW1xHJ6wgzdrj42k3fbNW
         Dby1h5QqTCyBIwkrTJxROEsM9/mzwVtzu0CwskXL1k8kYuOzNFIXUJPJh7wV9EE4JlMA
         VPe8iecxQNKArXMntSORT0x83nIHwQAeb/C7o8Z9/0D2UJPJITcSrQmjLDfkYnLKAYA5
         NWa3Mncc+EgRchbPD3000DaHEdGXwttMBRxplubagW7n6uhqbYU69MUNkB9oF/a1Q84/
         hV7s+B4VUylVDw7I9UMUBR6QiYNlOy5vKX7qimpFQ6D8x8AS2/P4IFxIg0UTlA/H2Fb4
         ZbYA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=FzIWYNTi;
       spf=pass (google.com: domain of nieklinnenbank@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=nieklinnenbank@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <nieklinnenbank@gmail.com>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id a18sor6433000wmj.5.2020.01.18.16.51.23
        (Google Transport Security);
        Sat, 18 Jan 2020 16:51:23 -0800 (PST)
Received-SPF: pass (google.com: domain of nieklinnenbank@gmail.com designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=FzIWYNTi;
       spf=pass (google.com: domain of nieklinnenbank@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=nieklinnenbank@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=7JgmHjSodSknZwo9B2SadfCQ2yAYDzWDNqB65Av5uI4=;
        b=FzIWYNTi9x6ROrc0xv4WHtHn2qDl8tHWBj4XjWoVqeShj68SvgLFiV2Qn/mlIR2O1L
         s38Ls/cZXEEAvZRWle81l3Xh7w7oZTBi7Ujr+uQh13tgOom7YR2wzrIcw6Fn140HAQhD
         FT1KA6IKC5veXZFpAvfhCG3cPe+rcN4ke9Sv2KLDM9rX2ElFaAJ9Ay3Oio4VnzxBupue
         2ixdXoTyARTCEFnztQtmNl4Olta9Pp9x3/xREXze2Svf75VzMAtQhSMMMOz0hWggz5bp
         Oz7Q/Fp66OVTsqCo2cUJmBDv+2t8sG07AK1U/+nzdqt5g0QVLjAn3eCUHmMWETVJ+9F1
         dN3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=7JgmHjSodSknZwo9B2SadfCQ2yAYDzWDNqB65Av5uI4=;
        b=ZjyqN4a+FAREhI8uzAHISaTtKHlnhxiyfnlgtiE3/8tfHwCHVOK20TlD2ws/gGRhJq
         vS4qBOwqy+pYfu6334yjKe3K60lQi2z0MQZgT68waUFUk7Qe97rajxebBaC4an3eS673
         EsZj4AooP0eZXBfQp3HG49eeU8Q/ULro7Bff53snPj9LfMwiozxEEIQNaQDSqgQtU8Uc
         fP+DJAMoyyMhAS9JGDXqKjgvX++VoAyVy59oWTtuo2WmfhC5HLGAt7SuzsbCfC5mkn5p
         tFxwVXlNDP20cGEn4Cx0e1Gb1UtvjgrsmDfUdcqCgwI6exTkeilHBNIYZ250aZjMCOpT
         dcwA==
X-Gm-Message-State: APjAAAUW8BvHmNBA8SFYpzY9DIOygWFBzyXyo0zG4uEjIsInnWm7Xw3X
	8OS0I4QYU7is147cjrHpZpA=
X-Google-Smtp-Source: APXvYqwV6ecDmvp2ob9v9+s2NvMjEQJvaRuIeeWegY2JtxuKOjfrQhHmGADWEmf7/64nmeM9JlUrYg==
X-Received: by 2002:a1c:81ce:: with SMTP id c197mr11179691wmd.96.1579395083386;
        Sat, 18 Jan 2020 16:51:23 -0800 (PST)
Return-Path: <nieklinnenbank@gmail.com>
Received: from pavilion.home ([2a02:a456:6be8:1:8edc:d4ff:fe8b:18b7])
        by smtp.gmail.com with ESMTPSA id h2sm41763568wrv.66.2020.01.18.16.51.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jan 2020 16:51:22 -0800 (PST)
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
Subject: [PATCH v4 11/20] hw/arm/allwinner-h3: add SDRAM controller device
Date: Sun, 19 Jan 2020 01:50:53 +0100
Message-Id: <20200119005102.3847-12-nieklinnenbank@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200119005102.3847-1-nieklinnenbank@gmail.com>
References: <20200119005102.3847-1-nieklinnenbank@gmail.com>
X-TUID: 7nN68HU2RUPm

In the Allwinner H3 SoC the SDRAM controller is responsible
for interfacing with the external Synchronous Dynamic Random
Access Memory (SDRAM). Types of memory that the SDRAM controller
supports are DDR2/DDR3 and capacities of up to 2GiB. This commit
adds emulation support of the Allwinner H3 SDRAM controller.

Signed-off-by: Niek Linnenbank <nieklinnenbank@gmail.com>
---
 include/hw/arm/allwinner-h3.h        |   5 +
 include/hw/misc/allwinner-h3-dramc.h | 106 ++++++++
 hw/arm/allwinner-h3.c                |  19 +-
 hw/arm/orangepi.c                    |   6 +
 hw/misc/allwinner-h3-dramc.c         | 358 +++++++++++++++++++++++++++
 hw/misc/Makefile.objs                |   1 +
 hw/misc/trace-events                 |  10 +
 7 files changed, 502 insertions(+), 3 deletions(-)
 create mode 100644 include/hw/misc/allwinner-h3-dramc.h
 create mode 100644 hw/misc/allwinner-h3-dramc.c

diff --git a/include/hw/arm/allwinner-h3.h b/include/hw/arm/allwinner-h3.h
index f5e16266cd..8bcfc4a164 100644
--- a/include/hw/arm/allwinner-h3.h
+++ b/include/hw/arm/allwinner-h3.h
@@ -41,6 +41,7 @@
 #include "hw/intc/arm_gic.h"
 #include "hw/misc/allwinner-h3-ccu.h"
 #include "hw/misc/allwinner-cpucfg.h"
+#include "hw/misc/allwinner-h3-dramc.h"
 #include "hw/misc/allwinner-h3-sysctrl.h"
 #include "hw/misc/allwinner-sid.h"
 #include "hw/sd/allwinner-sdhost.h"
@@ -80,6 +81,9 @@ enum {
     AW_H3_UART2,
     AW_H3_UART3,
     AW_H3_EMAC,
+    AW_H3_DRAMCOM,
+    AW_H3_DRAMCTL,
+    AW_H3_DRAMPHY,
     AW_H3_GIC_DIST,
     AW_H3_GIC_CPU,
     AW_H3_GIC_HYP,
@@ -120,6 +124,7 @@ typedef struct AwH3State {
     AwA10PITState timer;
     AwH3ClockCtlState ccu;
     AwCpuCfgState cpucfg;
+    AwH3DramCtlState dramc;
     AwH3SysCtrlState sysctrl;
     AwSidState sid;
     AwSdHostState mmc0;
diff --git a/include/hw/misc/allwinner-h3-dramc.h b/include/hw/misc/allwinner-h3-dramc.h
new file mode 100644
index 0000000000..bacdf236b7
--- /dev/null
+++ b/include/hw/misc/allwinner-h3-dramc.h
@@ -0,0 +1,106 @@
+/*
+ * Allwinner H3 SDRAM Controller emulation
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
+#ifndef HW_MISC_ALLWINNER_H3_DRAMC_H
+#define HW_MISC_ALLWINNER_H3_DRAMC_H
+
+#include "qom/object.h"
+#include "hw/sysbus.h"
+#include "exec/hwaddr.h"
+
+/**
+ * Constants
+ * @{
+ */
+
+/** Highest register address used by DRAMCOM module */
+#define AW_H3_DRAMCOM_REGS_MAXADDR  (0x804)
+
+/** Total number of known DRAMCOM registers */
+#define AW_H3_DRAMCOM_REGS_NUM      (AW_H3_DRAMCOM_REGS_MAXADDR / \
+                                     sizeof(uint32_t))
+
+/** Highest register address used by DRAMCTL module */
+#define AW_H3_DRAMCTL_REGS_MAXADDR  (0x88c)
+
+/** Total number of known DRAMCTL registers */
+#define AW_H3_DRAMCTL_REGS_NUM      (AW_H3_DRAMCTL_REGS_MAXADDR / \
+                                     sizeof(uint32_t))
+
+/** Highest register address used by DRAMPHY module */
+#define AW_H3_DRAMPHY_REGS_MAXADDR  (0x4)
+
+/** Total number of known DRAMPHY registers */
+#define AW_H3_DRAMPHY_REGS_NUM      (AW_H3_DRAMPHY_REGS_MAXADDR / \
+                                     sizeof(uint32_t))
+
+/** @} */
+
+/**
+ * Object model
+ * @{
+ */
+
+#define TYPE_AW_H3_DRAMC "allwinner-h3-dramc"
+#define AW_H3_DRAMC(obj) \
+    OBJECT_CHECK(AwH3DramCtlState, (obj), TYPE_AW_H3_DRAMC)
+
+/** @} */
+
+/**
+ * Allwinner H3 SDRAM Controller object instance state.
+ */
+typedef struct AwH3DramCtlState {
+    /*< private >*/
+    SysBusDevice parent_obj;
+    /*< public >*/
+
+    /** Physical base address for start of RAM */
+    hwaddr ram_addr;
+
+    /** Total RAM size in megabytes */
+    uint32_t ram_size;
+
+    /**
+     * @name Memory Regions
+     * @{
+     */
+
+    MemoryRegion row_mirror;       /**< Simulates rows for RAM size detection */
+    MemoryRegion row_mirror_alias; /**< Alias of the row which is mirrored */
+    MemoryRegion dramcom_iomem;    /**< DRAMCOM module I/O registers */
+    MemoryRegion dramctl_iomem;    /**< DRAMCTL module I/O registers */
+    MemoryRegion dramphy_iomem;    /**< DRAMPHY module I/O registers */
+
+    /** @} */
+
+    /**
+     * @name Hardware Registers
+     * @{
+     */
+
+    uint32_t dramcom[AW_H3_DRAMCOM_REGS_NUM]; /**< Array of DRAMCOM registers */
+    uint32_t dramctl[AW_H3_DRAMCTL_REGS_NUM]; /**< Array of DRAMCTL registers */
+    uint32_t dramphy[AW_H3_DRAMPHY_REGS_NUM] ;/**< Array of DRAMPHY registers */
+
+    /** @} */
+
+} AwH3DramCtlState;
+
+#endif /* HW_MISC_ALLWINNER_H3_DRAMC_H */
diff --git a/hw/arm/allwinner-h3.c b/hw/arm/allwinner-h3.c
index 3d0470825a..cf3a60bfd1 100644
--- a/hw/arm/allwinner-h3.c
+++ b/hw/arm/allwinner-h3.c
@@ -56,6 +56,9 @@ const hwaddr allwinner_h3_memmap[] = {
     [AW_H3_UART2]      = 0x01c28800,
     [AW_H3_UART3]      = 0x01c28c00,
     [AW_H3_EMAC]       = 0x01c30000,
+    [AW_H3_DRAMCOM]    = 0x01c62000,
+    [AW_H3_DRAMCTL]    = 0x01c63000,
+    [AW_H3_DRAMPHY]    = 0x01c65000,
     [AW_H3_GIC_DIST]   = 0x01c81000,
     [AW_H3_GIC_CPU]    = 0x01c82000,
     [AW_H3_GIC_HYP]    = 0x01c84000,
@@ -110,9 +113,6 @@ struct AwH3Unimplemented {
     { "scr",       0x01c2c400, 1 * KiB },
     { "gpu",       0x01c40000, 64 * KiB },
     { "hstmr",     0x01c60000, 4 * KiB },
-    { "dramcom",   0x01c62000, 4 * KiB },
-    { "dramctl0",  0x01c63000, 4 * KiB },
-    { "dramphy0",  0x01c65000, 4 * KiB },
     { "spi0",      0x01c68000, 4 * KiB },
     { "spi1",      0x01c69000, 4 * KiB },
     { "csi",       0x01cb0000, 320 * KiB },
@@ -239,6 +239,13 @@ static void allwinner_h3_init(Object *obj)
 
     sysbus_init_child_obj(obj, "emac", &s->emac, sizeof(s->emac),
                           TYPE_AW_SUN8I_EMAC);
+
+    sysbus_init_child_obj(obj, "dramc", &s->dramc, sizeof(s->dramc),
+                          TYPE_AW_H3_DRAMC);
+    object_property_add_alias(obj, "ram-addr", OBJECT(&s->dramc),
+                             "ram-addr", &error_abort);
+    object_property_add_alias(obj, "ram-size", OBJECT(&s->dramc),
+                              "ram-size", &error_abort);
 }
 
 static void allwinner_h3_realize(DeviceState *dev, Error **errp)
@@ -423,6 +430,12 @@ static void allwinner_h3_realize(DeviceState *dev, Error **errp)
                    qdev_get_gpio_in(DEVICE(&s->gic), AW_H3_GIC_SPI_UART3),
                    115200, serial_hd(3), DEVICE_NATIVE_ENDIAN);
 
+    /* DRAMC */
+    qdev_init_nofail(DEVICE(&s->dramc));
+    sysbus_mmio_map(SYS_BUS_DEVICE(&s->dramc), 0, s->memmap[AW_H3_DRAMCOM]);
+    sysbus_mmio_map(SYS_BUS_DEVICE(&s->dramc), 1, s->memmap[AW_H3_DRAMCTL]);
+    sysbus_mmio_map(SYS_BUS_DEVICE(&s->dramc), 2, s->memmap[AW_H3_DRAMPHY]);
+
     /* Unimplemented devices */
     for (i = 0; i < ARRAY_SIZE(unimplemented); i++) {
         create_unimplemented_device(unimplemented[i].device_name,
diff --git a/hw/arm/orangepi.c b/hw/arm/orangepi.c
index 9d4c79885e..60f893d70b 100644
--- a/hw/arm/orangepi.c
+++ b/hw/arm/orangepi.c
@@ -72,6 +72,12 @@ static void orangepi_init(MachineState *machine)
     /* Setup EMAC properties */
     object_property_set_int(OBJECT(&s->h3->emac), 1, "phy-addr", &error_abort);
 
+    /* DRAMC */
+    object_property_set_uint(OBJECT(s->h3), s->h3->memmap[AW_H3_SDRAM],
+                             "ram-addr", &error_abort);
+    object_property_set_int(OBJECT(s->h3), machine->ram_size / MiB, "ram-size",
+                            &error_abort);
+
     /* Mark H3 object realized */
     object_property_set_bool(OBJECT(s->h3), true, "realized", &error_abort);
 
diff --git a/hw/misc/allwinner-h3-dramc.c b/hw/misc/allwinner-h3-dramc.c
new file mode 100644
index 0000000000..06ce1d92f5
--- /dev/null
+++ b/hw/misc/allwinner-h3-dramc.c
@@ -0,0 +1,358 @@
+/*
+ * Allwinner H3 SDRAM Controller emulation
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
+#include "qemu/error-report.h"
+#include "hw/sysbus.h"
+#include "migration/vmstate.h"
+#include "qemu/log.h"
+#include "qemu/module.h"
+#include "exec/address-spaces.h"
+#include "hw/qdev-properties.h"
+#include "qapi/error.h"
+#include "hw/misc/allwinner-h3-dramc.h"
+#include "trace.h"
+
+#define REG_INDEX(offset)    (offset / sizeof(uint32_t))
+
+/* DRAMCOM register offsets */
+enum {
+    REG_DRAMCOM_CR    = 0x0000, /* Control Register */
+};
+
+/* DRAMCTL register offsets */
+enum {
+    REG_DRAMCTL_PIR   = 0x0000, /* PHY Initialization Register */
+    REG_DRAMCTL_PGSR  = 0x0010, /* PHY General Status Register */
+    REG_DRAMCTL_STATR = 0x0018, /* Status Register */
+};
+
+/* DRAMCTL register flags */
+enum {
+    REG_DRAMCTL_PGSR_INITDONE = (1 << 0),
+};
+
+enum {
+    REG_DRAMCTL_STATR_ACTIVE  = (1 << 0),
+};
+
+static void allwinner_h3_dramc_map_rows(AwH3DramCtlState *s, uint8_t row_bits,
+                                        uint8_t bank_bits, uint16_t page_size)
+{
+    /*
+     * This function simulates row addressing behavior when bootloader
+     * software attempts to detect the amount of available SDRAM. In U-Boot
+     * the controller is configured with the widest row addressing available.
+     * Then a pattern is written to RAM at an offset on the row boundary size.
+     * If the value read back equals the value read back from the
+     * start of RAM, the bootloader knows the amount of row bits.
+     *
+     * This function inserts a mirrored memory region when the configured row
+     * bits are not matching the actual emulated memory, to simulate the
+     * same behavior on hardware as expected by the bootloader.
+     */
+    uint8_t row_bits_actual = 0;
+
+    /* Calculate the actual row bits using the ram_size property */
+    for (uint8_t i = 8; i < 12; i++) {
+        if (1 << i == s->ram_size) {
+            row_bits_actual = i + 3;
+            break;
+        }
+    }
+
+    if (s->ram_size == (1 << (row_bits - 3))) {
+        /* When row bits is the expected value, remove the mirror */
+        memory_region_set_enabled(&s->row_mirror_alias, false);
+        trace_allwinner_h3_dramc_rowmirror_disable();
+
+    } else if (row_bits_actual) {
+        /* Row bits not matching ram_size, install the rows mirror */
+        hwaddr row_mirror = s->ram_addr + ((1 << (row_bits_actual +
+                                                  bank_bits)) * page_size);
+
+        memory_region_set_enabled(&s->row_mirror_alias, true);
+        memory_region_set_address(&s->row_mirror_alias, row_mirror);
+
+        trace_allwinner_h3_dramc_rowmirror_enable(row_mirror);
+    }
+}
+
+static uint64_t allwinner_h3_dramcom_read(void *opaque, hwaddr offset,
+                                          unsigned size)
+{
+    const AwH3DramCtlState *s = AW_H3_DRAMC(opaque);
+    const uint32_t idx = REG_INDEX(offset);
+
+    if (idx >= AW_H3_DRAMCOM_REGS_NUM) {
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: out-of-bounds offset 0x%04x\n",
+                      __func__, (uint32_t)offset);
+        return 0;
+    }
+
+    trace_allwinner_h3_dramcom_read(offset, s->dramcom[idx], size);
+
+    return s->dramcom[idx];
+}
+
+static void allwinner_h3_dramcom_write(void *opaque, hwaddr offset,
+                                       uint64_t val, unsigned size)
+{
+    AwH3DramCtlState *s = AW_H3_DRAMC(opaque);
+    const uint32_t idx = REG_INDEX(offset);
+
+    trace_allwinner_h3_dramcom_write(offset, val, size);
+
+    if (idx >= AW_H3_DRAMCOM_REGS_NUM) {
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: out-of-bounds offset 0x%04x\n",
+                      __func__, (uint32_t)offset);
+        return;
+    }
+
+    switch (offset) {
+    case REG_DRAMCOM_CR:   /* Control Register */
+        allwinner_h3_dramc_map_rows(s, ((val >> 4) & 0xf) + 1,
+                                       ((val >> 2) & 0x1) + 2,
+                                       1 << (((val >> 8) & 0xf) + 3));
+        break;
+    default:
+        break;
+    };
+
+    s->dramcom[idx] = (uint32_t) val;
+}
+
+static uint64_t allwinner_h3_dramctl_read(void *opaque, hwaddr offset,
+                                          unsigned size)
+{
+    const AwH3DramCtlState *s = AW_H3_DRAMC(opaque);
+    const uint32_t idx = REG_INDEX(offset);
+
+    if (idx >= AW_H3_DRAMCTL_REGS_NUM) {
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: out-of-bounds offset 0x%04x\n",
+                      __func__, (uint32_t)offset);
+        return 0;
+    }
+
+    trace_allwinner_h3_dramctl_read(offset, s->dramctl[idx], size);
+
+    return s->dramctl[idx];
+}
+
+static void allwinner_h3_dramctl_write(void *opaque, hwaddr offset,
+                                       uint64_t val, unsigned size)
+{
+    AwH3DramCtlState *s = AW_H3_DRAMC(opaque);
+    const uint32_t idx = REG_INDEX(offset);
+
+    trace_allwinner_h3_dramctl_write(offset, val, size);
+
+    if (idx >= AW_H3_DRAMCTL_REGS_NUM) {
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: out-of-bounds offset 0x%04x\n",
+                      __func__, (uint32_t)offset);
+        return;
+    }
+
+    switch (offset) {
+    case REG_DRAMCTL_PIR:    /* PHY Initialization Register */
+        s->dramctl[REG_INDEX(REG_DRAMCTL_PGSR)] |= REG_DRAMCTL_PGSR_INITDONE;
+        s->dramctl[REG_INDEX(REG_DRAMCTL_STATR)] |= REG_DRAMCTL_STATR_ACTIVE;
+        break;
+    default:
+        break;
+    }
+
+    s->dramctl[idx] = (uint32_t) val;
+}
+
+static uint64_t allwinner_h3_dramphy_read(void *opaque, hwaddr offset,
+                                          unsigned size)
+{
+    const AwH3DramCtlState *s = AW_H3_DRAMC(opaque);
+    const uint32_t idx = REG_INDEX(offset);
+
+    if (idx >= AW_H3_DRAMPHY_REGS_NUM) {
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: out-of-bounds offset 0x%04x\n",
+                      __func__, (uint32_t)offset);
+        return 0;
+    }
+
+    trace_allwinner_h3_dramphy_read(offset, s->dramphy[idx], size);
+
+    return s->dramphy[idx];
+}
+
+static void allwinner_h3_dramphy_write(void *opaque, hwaddr offset,
+                                       uint64_t val, unsigned size)
+{
+    AwH3DramCtlState *s = AW_H3_DRAMC(opaque);
+    const uint32_t idx = REG_INDEX(offset);
+
+    trace_allwinner_h3_dramphy_write(offset, val, size);
+
+    if (idx >= AW_H3_DRAMPHY_REGS_NUM) {
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: out-of-bounds offset 0x%04x\n",
+                      __func__, (uint32_t)offset);
+        return;
+    }
+
+    s->dramphy[idx] = (uint32_t) val;
+}
+
+static const MemoryRegionOps allwinner_h3_dramcom_ops = {
+    .read = allwinner_h3_dramcom_read,
+    .write = allwinner_h3_dramcom_write,
+    .endianness = DEVICE_NATIVE_ENDIAN,
+    .valid = {
+        .min_access_size = 4,
+        .max_access_size = 4,
+    },
+    .impl.min_access_size = 4,
+};
+
+static const MemoryRegionOps allwinner_h3_dramctl_ops = {
+    .read = allwinner_h3_dramctl_read,
+    .write = allwinner_h3_dramctl_write,
+    .endianness = DEVICE_NATIVE_ENDIAN,
+    .valid = {
+        .min_access_size = 4,
+        .max_access_size = 4,
+    },
+    .impl.min_access_size = 4,
+};
+
+static const MemoryRegionOps allwinner_h3_dramphy_ops = {
+    .read = allwinner_h3_dramphy_read,
+    .write = allwinner_h3_dramphy_write,
+    .endianness = DEVICE_NATIVE_ENDIAN,
+    .valid = {
+        .min_access_size = 4,
+        .max_access_size = 4,
+    },
+    .impl.min_access_size = 4,
+};
+
+static void allwinner_h3_dramc_reset(DeviceState *dev)
+{
+    AwH3DramCtlState *s = AW_H3_DRAMC(dev);
+
+    /* Set default values for registers */
+    memset(&s->dramcom, 0, sizeof(s->dramcom));
+    memset(&s->dramctl, 0, sizeof(s->dramctl));
+    memset(&s->dramphy, 0, sizeof(s->dramphy));
+}
+
+static void allwinner_h3_dramc_realize(DeviceState *dev, Error **errp)
+{
+    AwH3DramCtlState *s = AW_H3_DRAMC(dev);
+
+    /* Only power of 2 RAM sizes from 256MiB up to 2048MiB are supported */
+    for (uint8_t i = 8; i < 13; i++) {
+        if (1 << i == s->ram_size) {
+            break;
+        } else if (i == 12) {
+            error_report("%s: ram-size %u MiB is not supported",
+                          __func__, s->ram_size);
+            exit(1);
+        }
+    }
+
+    /* Setup row mirror mappings */
+    memory_region_init_ram(&s->row_mirror, OBJECT(s),
+                           "allwinner-h3-dramc.row-mirror",
+                            4 * KiB, &error_abort);
+    memory_region_add_subregion_overlap(get_system_memory(), s->ram_addr,
+                                       &s->row_mirror, 10);
+
+    memory_region_init_alias(&s->row_mirror_alias, OBJECT(s),
+                            "allwinner-h3-dramc.row-mirror-alias",
+                            &s->row_mirror, 0, 4 * KiB);
+    memory_region_add_subregion_overlap(get_system_memory(),
+                                        s->ram_addr + 1 * MiB,
+                                       &s->row_mirror_alias, 10);
+    memory_region_set_enabled(&s->row_mirror_alias, false);
+}
+
+static void allwinner_h3_dramc_init(Object *obj)
+{
+    SysBusDevice *sbd = SYS_BUS_DEVICE(obj);
+    AwH3DramCtlState *s = AW_H3_DRAMC(obj);
+
+    /* DRAMCOM registers */
+    memory_region_init_io(&s->dramcom_iomem, OBJECT(s),
+                          &allwinner_h3_dramcom_ops, s,
+                           TYPE_AW_H3_DRAMC, 4 * KiB);
+    sysbus_init_mmio(sbd, &s->dramcom_iomem);
+
+    /* DRAMCTL registers */
+    memory_region_init_io(&s->dramctl_iomem, OBJECT(s),
+                          &allwinner_h3_dramctl_ops, s,
+                           TYPE_AW_H3_DRAMC, 4 * KiB);
+    sysbus_init_mmio(sbd, &s->dramctl_iomem);
+
+    /* DRAMPHY registers */
+    memory_region_init_io(&s->dramphy_iomem, OBJECT(s),
+                          &allwinner_h3_dramphy_ops, s,
+                          TYPE_AW_H3_DRAMC, 4 * KiB);
+    sysbus_init_mmio(sbd, &s->dramphy_iomem);
+}
+
+static Property allwinner_h3_dramc_properties[] = {
+    DEFINE_PROP_UINT64("ram-addr", AwH3DramCtlState, ram_addr, 0x0),
+    DEFINE_PROP_UINT32("ram-size", AwH3DramCtlState, ram_size, 256 * MiB),
+    DEFINE_PROP_END_OF_LIST()
+};
+
+static const VMStateDescription allwinner_h3_dramc_vmstate = {
+    .name = "allwinner-h3-dramc",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .fields = (VMStateField[]) {
+        VMSTATE_UINT32_ARRAY(dramcom, AwH3DramCtlState, AW_H3_DRAMCOM_REGS_NUM),
+        VMSTATE_UINT32_ARRAY(dramctl, AwH3DramCtlState, AW_H3_DRAMCTL_REGS_NUM),
+        VMSTATE_UINT32_ARRAY(dramphy, AwH3DramCtlState, AW_H3_DRAMPHY_REGS_NUM),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
+static void allwinner_h3_dramc_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+
+    dc->reset = allwinner_h3_dramc_reset;
+    dc->vmsd = &allwinner_h3_dramc_vmstate;
+    dc->props = allwinner_h3_dramc_properties;
+    dc->realize = allwinner_h3_dramc_realize;
+}
+
+static const TypeInfo allwinner_h3_dramc_info = {
+    .name          = TYPE_AW_H3_DRAMC,
+    .parent        = TYPE_SYS_BUS_DEVICE,
+    .instance_init = allwinner_h3_dramc_init,
+    .instance_size = sizeof(AwH3DramCtlState),
+    .class_init    = allwinner_h3_dramc_class_init,
+};
+
+static void allwinner_h3_dramc_register(void)
+{
+    type_register_static(&allwinner_h3_dramc_info);
+}
+
+type_init(allwinner_h3_dramc_register)
diff --git a/hw/misc/Makefile.objs b/hw/misc/Makefile.objs
index daa734036e..68aae2eabb 100644
--- a/hw/misc/Makefile.objs
+++ b/hw/misc/Makefile.objs
@@ -30,6 +30,7 @@ common-obj-$(CONFIG_IVSHMEM_DEVICE) += ivshmem.o
 
 common-obj-$(CONFIG_ALLWINNER_H3) += allwinner-h3-ccu.o
 obj-$(CONFIG_ALLWINNER_H3) += allwinner-cpucfg.o
+common-obj-$(CONFIG_ALLWINNER_H3) += allwinner-h3-dramc.o
 common-obj-$(CONFIG_ALLWINNER_H3) += allwinner-h3-sysctrl.o
 common-obj-$(CONFIG_ALLWINNER_H3) += allwinner-sid.o
 common-obj-$(CONFIG_REALVIEW) += arm_sysctl.o
diff --git a/hw/misc/trace-events b/hw/misc/trace-events
index 4f38328d9c..a5862b2bed 100644
--- a/hw/misc/trace-events
+++ b/hw/misc/trace-events
@@ -5,6 +5,16 @@ allwinner_cpucfg_cpu_reset(uint8_t cpu_id, uint32_t reset_addr) "id %u, reset_ad
 allwinner_cpucfg_read(uint64_t offset, uint64_t data, unsigned size) "offset 0x%" PRIx64 " data 0x%" PRIx64 " size %" PRIu32
 allwinner_cpucfg_write(uint64_t offset, uint64_t data, unsigned size) "offset 0x%" PRIx64 " data 0x%" PRIx64 " size %" PRIu32
 
+# allwinner-h3-dramc.c
+allwinner_h3_dramc_rowmirror_disable(void) "Disable row mirror"
+allwinner_h3_dramc_rowmirror_enable(uint64_t addr) "Enable row mirror: addr 0x%" PRIx64
+allwinner_h3_dramcom_read(uint64_t offset, uint64_t data, unsigned size) "Read: offset 0x%" PRIx64 " data 0x%" PRIx64 " size %" PRIu32
+allwinner_h3_dramcom_write(uint64_t offset, uint64_t data, unsigned size) "Write: offset 0x%" PRIx64 " data 0x%" PRIx64 " size %" PRIu32
+allwinner_h3_dramctl_read(uint64_t offset, uint64_t data, unsigned size) "Read: offset 0x%" PRIx64 " data 0x%" PRIx64 " size %" PRIu32
+allwinner_h3_dramctl_write(uint64_t offset, uint64_t data, unsigned size) "Write: offset 0x%" PRIx64 " data 0x%" PRIx64 " size %" PRIu32
+allwinner_h3_dramphy_read(uint64_t offset, uint64_t data, unsigned size) "Read: offset 0x%" PRIx64 " data 0x%" PRIx64 " size %" PRIu32
+allwinner_h3_dramphy_write(uint64_t offset, uint64_t data, unsigned size) "write: offset 0x%" PRIx64 " data 0x%" PRIx64 " size %" PRIu32
+
 # allwinner-sid.c
 allwinner_sid_read(uint64_t offset, uint64_t data, unsigned size) "offset 0x%" PRIx64 " data 0x%" PRIx64 " size %" PRIu32
 allwinner_sid_write(uint64_t offset, uint64_t data, unsigned size) "offset 0x%" PRIx64 " data 0x%" PRIx64 " size %" PRIu32
-- 
2.17.1
