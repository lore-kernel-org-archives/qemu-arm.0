Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp5518619lfp;
        Mon, 17 Feb 2020 15:24:34 -0800 (PST)
X-Received: by 2002:a5d:528e:: with SMTP id c14mr24856128wrv.308.1581981874106;
        Mon, 17 Feb 2020 15:24:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581981874; cv=none;
        d=google.com; s=arc-20160816;
        b=RdzdjhOTJeKgr1VeSq/tcnkk1bn/md07Y1m2MVTN5p0lAI2V570eZ4yS7jrTQAw+Ug
         EbHUckZw0qc+b1bISYEplOEsnTxmVTHoL3dod6GOPnmWEmVsOTqsg++jRsrurp75d9Qf
         kSwzj8dDXutl2t4hUdDRDwteQRS1YTEANk12rZouhZJ1R/nGfHvVNOW8hsJvXB4wzI0V
         P5MuRf0NGn8L7gUMnbtLjMEibo4PPbUaIbQGDGe5pQDqNk+DNN9st6ZkkCCmNDxBq9e3
         Ze+vOjsMUDmlJTof699uyCK0zgzOC8riIxeUtZGh2tF6iMT2YSj4v6fBMzj1Cf/NgaA5
         Cw8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :dkim-signature;
        bh=UElMFsqrdt3KN3cYNw35xyRl1xIMwrIbp2KPqeCB5HA=;
        b=kuJWcocq9RXk9E1U/eySftJItbcJZ6Kxid/tSRd4y8x9tq10EztB4PMYv3jFJlIRs4
         YCh69ym8pYDFVmxvMcHLRAth9G2X9Pivo/WtP4jich0e671Xvs9gVDHFNzUN8fYxIC3r
         GQ2/Z39GFttRIQVdIswSwYgGYvdekTX3K+kKsHdhOFQjkC4y2t4UvkNfgC7/07qZfZus
         jXmlKTnBSyi4QqlcbA7g/zwzOjuZM9tzJMLgYUGcsuJC1ncRa2QJUqMyt90hGgRR5dbc
         KyhQF2cNk9FVZj6vTyrKMXO9Ka6fcKq+rEOZWHcFx9zZn/48zpcB8w/QEuPKGsmKGJwv
         X7WQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=FIA08VNv;
       spf=pass (google.com: domain of nieklinnenbank@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=nieklinnenbank@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <nieklinnenbank@gmail.com>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id h5sor1325298wrv.64.2020.02.17.15.24.33
        (Google Transport Security);
        Mon, 17 Feb 2020 15:24:34 -0800 (PST)
Received-SPF: pass (google.com: domain of nieklinnenbank@gmail.com designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=FIA08VNv;
       spf=pass (google.com: domain of nieklinnenbank@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=nieklinnenbank@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=UElMFsqrdt3KN3cYNw35xyRl1xIMwrIbp2KPqeCB5HA=;
        b=FIA08VNvV+T3T8NkTbvBTSGuNkXKkc9ezjuuYraNndyNmlpUETlADkA5fnuW+/p8Zx
         H8zxxYCmjDP/La/dJKe7J15HSaT8oae+wug/jgKQhCtoCEGhqYwL61PM/m0HIUt9e91T
         i/ToxAc7gB17h82x/shmwwPDcdcHBZqEC6qTBL8XbAI2sJLS7ni/BjQpL6eTGWk7ZWu2
         cfF4roa+zwdnsmzR4ePeWIqWjNRLyq98bnWbVjGzWdev7aXE0Zw5IsQ2sQth/qSBLzr7
         kCEEf4/xr/xF9Qn45wq1JRHrE8rBQGX6G4cmfZsWSlB2spre1xkvd3E2CkHd4eyjdQjb
         tOjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=UElMFsqrdt3KN3cYNw35xyRl1xIMwrIbp2KPqeCB5HA=;
        b=Xh1dFXOSb2S1aAJoW+IXZ5Ce3vxl/jgVSv2HxiIMtDryp/ncwxzkYrdzT5nDzTvsO5
         SzW+J1v2c7DnpPaEDNXlxhF62UNi0HzUc5BLCnhhWFUlPrGGWh7RNr4WGSuIWO1ct4fa
         dmAFIc7wCd/eZoitfajCmBy4WoSJu3cuTEEFWFPEy0cVaOVSQF8XJ/DpHKFI3r3K6XBT
         f91wHDtELyFME63QIvkirLMo5c4RjMlwZ+ALIOkuZy3wYbZtdNdqXozwr6ovzxJG9n9p
         rDErbhhm2bprNdUOCE6fpp7UOGuxEU4yCb9EiB91QdJs2a2JCgHe/UegnL5CMkYCTcOA
         5kFQ==
X-Gm-Message-State: APjAAAXsJ7Jcc90yCQiSl0QzXEoD+7a42pBProeCqz5H0vc4s9Ht26oC
	Uxq2gLuPR0E2OJP9cNMyVTQ=
X-Google-Smtp-Source: APXvYqwn69p0GWvYaokuf4e5yxrjOmJLmzjHAaOtOMbPZyNp3UEvH4cQxKSiA77cASVlnFXoFO+ePA==
X-Received: by 2002:a5d:484f:: with SMTP id n15mr24411936wrs.365.1581981873708;
        Mon, 17 Feb 2020 15:24:33 -0800 (PST)
Return-Path: <nieklinnenbank@gmail.com>
Received: from pavilion.home ([2a02:a456:6be8:1:8edc:d4ff:fe8b:18b7])
        by smtp.gmail.com with ESMTPSA id w1sm3244831wro.72.2020.02.17.15.24.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2020 15:24:33 -0800 (PST)
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
Subject: [PATCH v5 10/18] hw/arm/allwinner-h3: add Boot ROM support
Date: Tue, 18 Feb 2020 00:24:03 +0100
Message-Id: <20200217232411.30096-11-nieklinnenbank@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200217232411.30096-1-nieklinnenbank@gmail.com>
References: <20200217232411.30096-1-nieklinnenbank@gmail.com>
X-TUID: kuMDua/CHUGr

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
index 6bb49bf2a8..902fcfd11f 100644
--- a/hw/arm/orangepi.c
+++ b/hw/arm/orangepi.c
@@ -102,6 +102,11 @@ static void orangepi_init(MachineState *machine)
     memory_region_add_subregion(get_system_memory(), s->h3->memmap[AW_H3_SDRAM],
                                 &s->sdram);
 
+    /* Load target kernel or start using BootROM */
+    if (!machine->kernel_filename && blk_is_available(blk)) {
+        /* Use Boot ROM to copy data from SD card to SRAM */
+        allwinner_h3_bootrom_setup(s->h3, blk);
+    }
     orangepi_binfo.loader_start = s->h3->memmap[AW_H3_SDRAM];
     orangepi_binfo.ram_size = machine->ram_size;
     arm_load_kernel(ARM_CPU(first_cpu), machine, &orangepi_binfo);
-- 
2.17.1
