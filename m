Received: by 2002:a19:f015:0:0:0:0:0 with SMTP id p21csp1294449lfc;
        Wed, 11 Mar 2020 15:19:12 -0700 (PDT)
X-Received: by 2002:adf:f2ca:: with SMTP id d10mr6883936wrp.247.1583965152911;
        Wed, 11 Mar 2020 15:19:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1583965152; cv=none;
        d=google.com; s=arc-20160816;
        b=QkipFRAyDBhhu/uGpCxhWTeL8BYGH7LMZDXtVwFAEDeCQiAJAh/i7XSeowd/Aqu3Po
         tNWdx1KMFqAopbQVyaTAAAJkSlJu+wAQVXh12Fil9MRbdib7xDmAD+h9perdnclg6Z29
         41wK4J7grU94H0Gsy4KTi3sljZ9PuuyXTh2CSltBphNLZ1toXuEs+7DbfbqlpQbGbxRQ
         Dx1J8Nq+6ErAVEJyobyJTv2qpa5FKaZ6KAAbxaVjUMNAQgA+84BXRdKBD5MPGCUDqV/T
         DV6wWbCttHPZoldSmhDnLEc5x3PzuGU1poR95Vudmp1iFxz7dMWlxLIPJGWHj8021E2R
         fRdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=Qq6b6ICYIOoBAymh+VHaM26CGU8Ea8JY2eFdBqFq9Ok=;
        b=ac1aMyNpZnX1U9xKg26Mf1HCteU+B4rEx0pT9gfNCOn02VFQEN/bz2Gl59LaTJiUmr
         z5YSLOdJEqezb16wsh/C+mYwglmxPqmXlFvYyQkJHr01Ht4SvSFS0xeLMDPf/vhacqvK
         3+WRUc7pOyWfBjzlBvzMxZOiuvGK467KLZ8Rilahe9ODsZqKwYelIoTQ1dfO/2gJ3SCX
         vK/wFuC98C00lbNdnt8QA5LxiFteY4Ox0TEvIb7f/ssH1FfPWXSzX5oExWQRnBOvEnmK
         PsLrerWebSmBhql1/B4VDfm2C63qTaKajBDuDDVz1KvkJFF5G6LksvGj28XjccDdpzCI
         nWhg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=SbPUho9b;
       spf=pass (google.com: domain of nieklinnenbank@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=nieklinnenbank@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <nieklinnenbank@gmail.com>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id p10sor2045479wrj.41.2020.03.11.15.19.12
        (Google Transport Security);
        Wed, 11 Mar 2020 15:19:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of nieklinnenbank@gmail.com designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=SbPUho9b;
       spf=pass (google.com: domain of nieklinnenbank@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=nieklinnenbank@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Qq6b6ICYIOoBAymh+VHaM26CGU8Ea8JY2eFdBqFq9Ok=;
        b=SbPUho9bzLUffCbg9f0+tPZYRdexvqVQqEs+9mq5jUl2ieCqtOBVmDiHfWNWg2D8sK
         K4MNjLIsa/mDyGdHkaAYJOXdQp9Mh7IrVKC/sfU/ro2vmSm63LgsWEfHm10Qq6+xBN7F
         O3XDQiR6Uno4VqSe+gvJ34jLIcTeac/tEF2AVk0peMlPj4bYyhErMpxQXRuOqTFrnyrr
         D6aM18biwqcYi7HKPIthvygMGLkUsNUxq9lF+hZv4tM26+3d1MgJLC1JNF0QdY5hvxxS
         AiAeCm9/JHotNh3w3YO5kA1pvYgw/2LpNnpNf5JV4rNyGDCUPV8j+p+5FhqTDdu3+GCV
         dhKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Qq6b6ICYIOoBAymh+VHaM26CGU8Ea8JY2eFdBqFq9Ok=;
        b=Cof9/WpfTKXicv0TGwyskEzwp/UKQk3tbyimBNrYcJH/cKm+6nPPslJ2LyvXXSX230
         s+eSjDouIoGg1ZyDYFZtKXveQmACNSJpiJmYxLpp7EVuuOzrAWQHqNOU2MNEeiTtlKIb
         gqVXbkxnOVTGhijLLDe8GNgNugMQ+j0Mz5tTgkZdXvGi6+MzWbZTTRWr/tnyLImkt+M4
         vXteupVkEC4E4h8NUJ096jkqMwIazf2sbPZxxE98HHGFP0/d6iLxMZJAqJoFVjBOVAXT
         aNfd68yldTVhszNBVy7A8cBz5nGYWx7K0hsWmguGPgFNllHPxni593lJrDZ28R8REvZu
         6uIQ==
X-Gm-Message-State: ANhLgQ0TU88pwOxRTFoU4VwxROfuSotnY5iBK1crNQ1ji1f0unaqzDnV
	+JE/1rNe/cBKddw04BLbvxc=
X-Google-Smtp-Source: ADFU+vsRt9mGcBaofv6nzhL9eneE1acOwU4fR857ckpzHAEyipHxWapo37PJawlg5AhDrMF7AUDzZg==
X-Received: by 2002:adf:c5c8:: with SMTP id v8mr2327487wrg.111.1583965152499;
        Wed, 11 Mar 2020 15:19:12 -0700 (PDT)
Return-Path: <nieklinnenbank@gmail.com>
Received: from pavilion.home ([2a02:a456:6be8:1:8edc:d4ff:fe8b:18b7])
        by smtp.gmail.com with ESMTPSA id q7sm19346796wrd.54.2020.03.11.15.19.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2020 15:19:12 -0700 (PDT)
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
Subject: [PATCH v8 10/18] hw/arm/allwinner-h3: add Boot ROM support
Date: Wed, 11 Mar 2020 23:18:46 +0100
Message-Id: <20200311221854.30370-11-nieklinnenbank@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200311221854.30370-1-nieklinnenbank@gmail.com>
References: <20200311221854.30370-1-nieklinnenbank@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: s1rpgSG5kWXG

A real Allwinner H3 SoC contains a Boot ROM which is the
first code that runs right after the SoC is powered on.
The Boot ROM is responsible for loading user code (e.g. a bootloader)
from any of the supported external devices and writing the downloaded
code to internal SRAM. After loading the SoC begins executing the code
written to SRAM.

This commits adds emulation of the Boot ROM firmware setup functionality
by loading user code from SD card in the A1 SRAM. While the A1 SRAM is
64KiB, we limit the size to 32KiB because the real H3 Boot ROM also rejects
sizes larger than 32KiB. For reference, this behaviour is documented
by the Linux Sunxi project wiki at:

  https://linux-sunxi.org/BROM#U-Boot_SPL_limitations

Signed-off-by: Niek Linnenbank <nieklinnenbank@gmail.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
---
 include/hw/arm/allwinner-h3.h | 21 +++++++++++++++++++++
 hw/arm/allwinner-h3.c         | 17 +++++++++++++++++
 hw/arm/orangepi.c             |  5 +++++
 3 files changed, 43 insertions(+)

diff --git a/include/hw/arm/allwinner-h3.h b/include/hw/arm/allwinner-h3.h
index f9b9a02373..d338003724 100644
--- a/include/hw/arm/allwinner-h3.h
+++ b/include/hw/arm/allwinner-h3.h
@@ -46,6 +46,7 @@
 #include "hw/sd/allwinner-sdhost.h"
 #include "hw/net/allwinner-sun8i-emac.h"
 #include "target/arm/cpu.h"
+#include "sysemu/block-backend.h"
 
 /**
  * Allwinner H3 device list
@@ -129,4 +130,24 @@ typedef struct AwH3State {
     MemoryRegion sram_c;
 } AwH3State;
 
+/**
+ * Emulate Boot ROM firmware setup functionality.
+ *
+ * A real Allwinner H3 SoC contains a Boot ROM
+ * which is the first code that runs right after
+ * the SoC is powered on. The Boot ROM is responsible
+ * for loading user code (e.g. a bootloader) from any
+ * of the supported external devices and writing the
+ * downloaded code to internal SRAM. After loading the SoC
+ * begins executing the code written to SRAM.
+ *
+ * This function emulates the Boot ROM by copying 32 KiB
+ * of data from the given block device and writes it to
+ * the start of the first internal SRAM memory.
+ *
+ * @s: Allwinner H3 state object pointer
+ * @blk: Block backend device object pointer
+ */
+void allwinner_h3_bootrom_setup(AwH3State *s, BlockBackend *blk);
+
 #endif /* HW_ARM_ALLWINNER_H3_H */
diff --git a/hw/arm/allwinner-h3.c b/hw/arm/allwinner-h3.c
index d1245d2b01..a9767c70c0 100644
--- a/hw/arm/allwinner-h3.c
+++ b/hw/arm/allwinner-h3.c
@@ -29,6 +29,7 @@
 #include "hw/char/serial.h"
 #include "hw/misc/unimp.h"
 #include "hw/usb/hcd-ehci.h"
+#include "hw/loader.h"
 #include "sysemu/sysemu.h"
 #include "hw/arm/allwinner-h3.h"
 
@@ -170,6 +171,22 @@ enum {
     AW_H3_GIC_NUM_SPI       = 128
 };
 
+void allwinner_h3_bootrom_setup(AwH3State *s, BlockBackend *blk)
+{
+    const int64_t rom_size = 32 * KiB;
+    g_autofree uint8_t *buffer = g_new0(uint8_t, rom_size);
+
+    if (blk_pread(blk, 8 * KiB, buffer, rom_size) < 0) {
+        error_setg(&error_fatal, "%s: failed to read BlockBackend data",
+                   __func__);
+        return;
+    }
+
+    rom_add_blob("allwinner-h3.bootrom", buffer, rom_size,
+                  rom_size, s->memmap[AW_H3_SRAM_A1],
+                  NULL, NULL, NULL, NULL, false);
+}
+
 static void allwinner_h3_init(Object *obj)
 {
     AwH3State *s = AW_H3(obj);
diff --git a/hw/arm/orangepi.c b/hw/arm/orangepi.c
index d65bbf8a2f..b8ebcb08b7 100644
--- a/hw/arm/orangepi.c
+++ b/hw/arm/orangepi.c
@@ -97,6 +97,11 @@ static void orangepi_init(MachineState *machine)
     memory_region_add_subregion(get_system_memory(), h3->memmap[AW_H3_SDRAM],
                                 machine->ram);
 
+    /* Load target kernel or start using BootROM */
+    if (!machine->kernel_filename && blk_is_available(blk)) {
+        /* Use Boot ROM to copy data from SD card to SRAM */
+        allwinner_h3_bootrom_setup(h3, blk);
+    }
     orangepi_binfo.loader_start = h3->memmap[AW_H3_SDRAM];
     orangepi_binfo.ram_size = machine->ram_size;
     arm_load_kernel(ARM_CPU(first_cpu), machine, &orangepi_binfo);
-- 
2.17.1
