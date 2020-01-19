Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp969899lff;
        Sat, 18 Jan 2020 16:51:23 -0800 (PST)
X-Received: by 2002:a1c:f008:: with SMTP id a8mr11632058wmb.81.1579395082970;
        Sat, 18 Jan 2020 16:51:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579395082; cv=none;
        d=google.com; s=arc-20160816;
        b=YvQ0FZj/8ZFbIlqhkEXrw0YLV773oTBWqvrew/YDtpud12Akh4FI+Yv0M4JnWDaO/0
         uBa/osj/avAaTW/P390Zzo3t0llS6kcPJ8dR11Sh/tKvyzk+sg01CaPKXbO49avGqoMn
         /akAGNS1Mb1lsU4zHPPpwtFV4KGRzzudNY0ELyRNGYoukjy9RBBF2e1cJHPOYC/pGJi6
         ZXhR/MiLHzH9OM39Wr8uMS/f4rATxpy2D20/rRZ0qUJMUVU6Yu0LWEcPb25yYhKktemG
         svZkz4P1kJezZAT8Ceu5P04ljfyWF2/2GJz2bAinL3EV5uWxEBKUuvvaEF94y6dvy8KJ
         F9MQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :dkim-signature;
        bh=G999Gq0fdq01jCg9kAdMJxYO34Fu4j9UBCr1xo3cI5k=;
        b=k08qp1yoUo6hfhGVo0M1V7NMibqtVYd7XbJsahAyejn6WxQbAMAq/9dycIkXECyyC0
         vkGRjmYl33iep4yblndZ3dm/fSmy+QT7CXL9kRDApc2b+jsKeuA1HNs5p3zH8Yt0v4qq
         dj6YFRkjkPdmNexPUuGWnFbG10H3+lAHo/1LLXDwg78iK31Vv2xmvJCOGuyAoVIxwFZM
         DMp8CLKUEMfOQSLK9R+Vtzd6dM/1KJjlVJd5s/YGBWYxmSrkqrGFcSApwHxVJFBf2Oks
         1YP8Or+6D0ESFgk1nC1buVqF7EN3dOctxcVrYy3C6J9YGYWuKBIQq1AA19QY53OTrtzM
         QeXw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=OAs9A+bW;
       spf=pass (google.com: domain of nieklinnenbank@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=nieklinnenbank@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <nieklinnenbank@gmail.com>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id n15sor6445958wmc.21.2020.01.18.16.51.22
        (Google Transport Security);
        Sat, 18 Jan 2020 16:51:22 -0800 (PST)
Received-SPF: pass (google.com: domain of nieklinnenbank@gmail.com designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=OAs9A+bW;
       spf=pass (google.com: domain of nieklinnenbank@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=nieklinnenbank@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=G999Gq0fdq01jCg9kAdMJxYO34Fu4j9UBCr1xo3cI5k=;
        b=OAs9A+bWJGTVAOqCUTsgDiAzmf9ZQR153PZppMVhV8aXPUquJrZtLaaADtSsp8hRGq
         EenQcMmMeHRtivQ7ueH9mvwNU3ZET2i/tKV12jYWaFU/yZkwK9kARKMLgwo/xbCpFI/A
         kZC9/mOCpXY0ZYviIWdLPpiAOOaTFnuga1C9s18SymQZD+u9oF1vYcksN4yPWXmqf7I+
         ldOoHAbIbQjCz8LHncd/hwYrsjaK0p/yKUdAonoZNoAMqz+At/Gh7OBq3bYJRALWtC8/
         XcRxhiWwsZHykw6CzLKT0W3ZrSUiUQdpzH4Vp3DmCR5KxN0OtcAulG1/WlAC3suopk1F
         E+SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=G999Gq0fdq01jCg9kAdMJxYO34Fu4j9UBCr1xo3cI5k=;
        b=WElPROoThQPGl0z3Z32pOQ5x216NPntfzL2xwm/mJMDeuKitthc8AIceLwFYZyiBCk
         MvifiMKQYrQvSRAjujpKb4lZsVw4CFC7zwmgn5j/TnUbcs8Q2CK3TGek7wFThT/qLBfK
         amUw1XEzjKjh5a14nWhL6tuQf/Tmtb2wbS7gOWDZCbJX0tks5n31YWRMoDXoKt6qgBAB
         83c0oZPmP/KZ/OM5y/aB5Gyl0MCG23OhjNFpKQOZcy9SnLfuzu4GoRop+F1I9H+lgFh0
         DRPZRQ+4O9fYIj+Q0aaRH6urKlYYDWUBUwJaPkUjRVtL/FVxrfOq/dzL6kic3DaD1vUz
         WQgA==
X-Gm-Message-State: APjAAAUZwDgZ0fyhl5p6JYX4LsUbIpmKinfTw1jaK/GZddxSolLJHFt2
	tajS5lvtyQLOYFzqUZmHmnE=
X-Google-Smtp-Source: APXvYqzYDxCVT2pxd8F0m0NvTAR9nISPI1QY1+aeYXJggx8iFuKLxK9Q/EOjnd/9fRRvZQ/QmkHr3w==
X-Received: by 2002:a1c:7203:: with SMTP id n3mr11810175wmc.119.1579395082611;
        Sat, 18 Jan 2020 16:51:22 -0800 (PST)
Return-Path: <nieklinnenbank@gmail.com>
Received: from pavilion.home ([2a02:a456:6be8:1:8edc:d4ff:fe8b:18b7])
        by smtp.gmail.com with ESMTPSA id h2sm41763568wrv.66.2020.01.18.16.51.21
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
Subject: [PATCH v4 10/20] hw/arm/allwinner-h3: add Boot ROM support
Date: Sun, 19 Jan 2020 01:50:52 +0100
Message-Id: <20200119005102.3847-11-nieklinnenbank@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200119005102.3847-1-nieklinnenbank@gmail.com>
References: <20200119005102.3847-1-nieklinnenbank@gmail.com>
X-TUID: JzGW36tZjSGJ

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
 include/hw/arm/allwinner-h3.h | 23 +++++++++++++++++++++++
 hw/arm/allwinner-h3.c         | 28 ++++++++++++++++++++++++++++
 hw/arm/orangepi.c             |  5 +++++
 3 files changed, 56 insertions(+)

diff --git a/include/hw/arm/allwinner-h3.h b/include/hw/arm/allwinner-h3.h
index f9b9a02373..f5e16266cd 100644
--- a/include/hw/arm/allwinner-h3.h
+++ b/include/hw/arm/allwinner-h3.h
@@ -46,6 +46,7 @@
 #include "hw/sd/allwinner-sdhost.h"
 #include "hw/net/allwinner-sun8i-emac.h"
 #include "target/arm/cpu.h"
+#include "sysemu/block-backend.h"
 
 /**
  * Allwinner H3 device list
@@ -129,4 +130,26 @@ typedef struct AwH3State {
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
+ * @errp: Error object pointer for raising errors
+ */
+void allwinner_h3_bootrom_setup(AwH3State *s, BlockBackend *blk,
+                                Error **errp);
+
 #endif /* HW_ARM_ALLWINNER_H3_H */
diff --git a/hw/arm/allwinner-h3.c b/hw/arm/allwinner-h3.c
index 1085223812..3d0470825a 100644
--- a/hw/arm/allwinner-h3.c
+++ b/hw/arm/allwinner-h3.c
@@ -29,6 +29,7 @@
 #include "hw/char/serial.h"
 #include "hw/misc/unimp.h"
 #include "hw/usb/hcd-ehci.h"
+#include "hw/loader.h"
 #include "sysemu/sysemu.h"
 #include "hw/arm/allwinner-h3.h"
 
@@ -170,6 +171,33 @@ enum {
     AW_H3_GIC_NUM_SPI       = 128
 };
 
+void allwinner_h3_bootrom_setup(AwH3State *s, BlockBackend *blk, Error **errp)
+{
+    uint8_t *buffer;
+    int64_t rom_size = 32 * KiB;
+
+    int64_t blk_size = blk_getlength(blk);
+    if (blk_size <= 0) {
+        error_setg(errp, "%s: failed to get BlockBackend size", __func__);
+        return;
+    }
+
+    if (rom_size > blk_size) {
+        rom_size = blk_size;
+    }
+
+    buffer = g_new0(uint8_t, rom_size);
+    if (blk_pread(blk, 8 * KiB, buffer, rom_size) < 0) {
+        error_setg(errp, "%s: failed to read BlockBackend data", __func__);
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
index 25bf85f8fc..9d4c79885e 100644
--- a/hw/arm/orangepi.c
+++ b/hw/arm/orangepi.c
@@ -95,6 +95,11 @@ static void orangepi_init(MachineState *machine)
     memory_region_add_subregion(get_system_memory(), s->h3->memmap[AW_H3_SDRAM],
                                 &s->sdram);
 
+    /* Load target kernel or start using BootROM */
+    if (!machine->kernel_filename && blk_is_available(blk)) {
+        /* Use Boot ROM to copy data from SD card to SRAM */
+        allwinner_h3_bootrom_setup(s->h3, blk, &error_fatal);
+    }
     orangepi_binfo.loader_start = s->h3->memmap[AW_H3_SDRAM];
     orangepi_binfo.ram_size = machine->ram_size;
     arm_load_kernel(ARM_CPU(first_cpu), machine, &orangepi_binfo);
-- 
2.17.1
