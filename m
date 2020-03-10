Received: by 2002:a19:f015:0:0:0:0:0 with SMTP id p21csp1226692lfc;
        Tue, 10 Mar 2020 14:32:20 -0700 (PDT)
X-Received: by 2002:a5d:6388:: with SMTP id p8mr25081848wru.51.1583875940632;
        Tue, 10 Mar 2020 14:32:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1583875940; cv=none;
        d=google.com; s=arc-20160816;
        b=sSWGi3drifASKlcWtc1tkp8Ov5LlWehfZ1yUACf9o70z5f1hm+ZgRbhTHsjBoVmyrx
         mDbv2Pd/XZ6OyLxaHcha5qSrqFDmzTVgZTtB7V6GF0V5dRXgnjZZlJ3L15Sw5hlCF6ZA
         jVPtz+A0lP0UQkGECOFUW0qBxEZdJcbhGSWjVyvlt36NboTq9+pTRR6D5X9Z5wheUB2Z
         5FcMYvuza2/bBBUlrPqdgm0gGZk2Y1GhNIIwWr7fa+fHKd2qQia59HEPFqDZqZBVRTyP
         mnUa9nbL0Y6g+Imsn6LT4rjN1//KDFlW8ukSS0yi9lwkjkIPjbb5chgWfLEFmIhM9NOC
         WSng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :dkim-signature;
        bh=KeVWgG0tQOdDh3sW6tFRRQGle6mis16f8XBbusoV4Zo=;
        b=hCf9/TomiAN5vzcg8CmF7Es4jghLHRSt8n+nk25r6Nbt/XbqctoRWPJtIKAvx2L5aN
         A3sxWB+77hL28F2gszOJPPO6Yub7akSx6i9nWYEeXQLGG8Lpcgcvioff8jh4S1gdvUag
         v5DfmBq+x6s+4Nm3LKJqEskoZtb62OYDb1NcbK/B6pd47q3nREQ+rUh76EfHsqnC1EtG
         6UE8AGq3elpZqsYjN2PFwEgDTvpsIJ9EOmH+dcq6xRZMLkopfoTyqU/8L1IBy3Ma/QCL
         /4h/V1p0Zf9u54oK1KSfA0c2Lix+e9syeaCFAJMUovzpr2qKMjhzWPm74Tkw1mA5BG5n
         VLCg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=J0FlkszR;
       spf=pass (google.com: domain of nieklinnenbank@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=nieklinnenbank@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <nieklinnenbank@gmail.com>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id v15sor8357280wra.45.2020.03.10.14.32.20
        (Google Transport Security);
        Tue, 10 Mar 2020 14:32:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of nieklinnenbank@gmail.com designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=J0FlkszR;
       spf=pass (google.com: domain of nieklinnenbank@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=nieklinnenbank@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=KeVWgG0tQOdDh3sW6tFRRQGle6mis16f8XBbusoV4Zo=;
        b=J0FlkszRBqG4Mi7AM0T0DXUxaa6JqVLMAvgdSHOYPFdyaFue0H296OMmcvagtHYs5E
         6MJXhfCIzeqOhAf+IcG3ppIEJZWmMEWdjUr1kakj1illr4XBzoOTBzMGUK7bglpc1HPy
         YCt+7RT+b+fc7ZCNRaeuHqvl643tsVTz86pCPhsZtftOXkUv5QXrfJXP6MuDjBZooxNe
         Yt/c3/29psLZOHnzTSh8DxLvIbR1jVIs1vlh0MgCw25srPy2HGty3LTwbtriCD1YYyvb
         ETe6pBBAoHLskIrkIFcf4xp5YHdOtxH6VCLYjel0QVXXkiV+kuCaOfuDjcWp5WThDV70
         t4Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=KeVWgG0tQOdDh3sW6tFRRQGle6mis16f8XBbusoV4Zo=;
        b=WqAmdm1YmNf//ODg5KjuOXORhH5gyg+7xRldfwZ1A2GOje4dDFJO3aJrp9c+HKRqoV
         EN90FryfiWYUvDR1BPMl6uxDT1yc4tiWnjIsZGlMLu8ju5y/86HMmZz/Yy1pXjdPi+4V
         /CRySl43WkJ2NC/SByoIw6GQ7LsfriPb07jiw5Ql4T687ZUbX/kO/v+aq/zfQeBwLS5d
         wbhcKDk9Z8ohNCRwyhrFMK6T4pB1uZUEmC/+8YVqtiwrzV/iTNGLkGF3IqCMwGycj1Ll
         wXt1oWSvcojQA0rt8CpsqREMLSM005d/AbAegjbgszqGXf0f1jtyHlG8qrV0/3ymDbex
         RI0Q==
X-Gm-Message-State: ANhLgQ3vPke/F/vBq7YQ+DLOZW6x3P9pWHFouoViTTKniE63WS4bsnEb
	XsuaeFhuOB1J5mB0sG0RtKM=
X-Google-Smtp-Source: ADFU+vuxMCRRA2eEHeDV86z9zH9ilJcQiYikHNesEwPucmHY6h6eu2BbNV2c3aHL7tCEWtOkKNchJg==
X-Received: by 2002:adf:ed09:: with SMTP id a9mr13275215wro.307.1583875940220;
        Tue, 10 Mar 2020 14:32:20 -0700 (PDT)
Return-Path: <nieklinnenbank@gmail.com>
Received: from pavilion.home ([2a02:a456:6be8:1:8edc:d4ff:fe8b:18b7])
        by smtp.gmail.com with ESMTPSA id 2sm32803580wrf.79.2020.03.10.14.32.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2020 14:32:19 -0700 (PDT)
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
Subject: [PATCH v7 10/18] hw/arm/allwinner-h3: add Boot ROM support
Date: Tue, 10 Mar 2020 22:31:55 +0100
Message-Id: <20200310213203.18730-11-nieklinnenbank@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200310213203.18730-1-nieklinnenbank@gmail.com>
References: <20200310213203.18730-1-nieklinnenbank@gmail.com>
X-TUID: 2gLSwbG+79h6

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
---
 include/hw/arm/allwinner-h3.h | 21 +++++++++++++++++++++
 hw/arm/allwinner-h3.c         | 18 ++++++++++++++++++
 hw/arm/orangepi.c             |  5 +++++
 3 files changed, 44 insertions(+)

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
index d1245d2b01..56b5c563a8 100644
--- a/hw/arm/allwinner-h3.c
+++ b/hw/arm/allwinner-h3.c
@@ -29,6 +29,7 @@
 #include "hw/char/serial.h"
 #include "hw/misc/unimp.h"
 #include "hw/usb/hcd-ehci.h"
+#include "hw/loader.h"
 #include "sysemu/sysemu.h"
 #include "hw/arm/allwinner-h3.h"
 
@@ -170,6 +171,23 @@ enum {
     AW_H3_GIC_NUM_SPI       = 128
 };
 
+void allwinner_h3_bootrom_setup(AwH3State *s, BlockBackend *blk)
+{
+    const int64_t rom_size = 32 * KiB;
+    uint8_t *buffer = g_new0(uint8_t, rom_size);
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
+    g_free(buffer);
+}
+
 static void allwinner_h3_init(Object *obj)
 {
     AwH3State *s = AW_H3(obj);
diff --git a/hw/arm/orangepi.c b/hw/arm/orangepi.c
index 4299c59b8a..1c32d2898f 100644
--- a/hw/arm/orangepi.c
+++ b/hw/arm/orangepi.c
@@ -98,6 +98,11 @@ static void orangepi_init(MachineState *machine)
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
