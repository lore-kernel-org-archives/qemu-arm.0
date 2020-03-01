Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp1709183lfg;
        Sun, 1 Mar 2020 13:50:44 -0800 (PST)
X-Received: by 2002:adf:f002:: with SMTP id j2mr1251910wro.296.1583099444553;
        Sun, 01 Mar 2020 13:50:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1583099444; cv=none;
        d=google.com; s=arc-20160816;
        b=v6k5khBLVFiIlwRI6tdbVUefBqr4iD5GxlOJn4bOGy7KIu702s2vHNbbectU4PM7sF
         yzZDCwYPpTiLR3lRxALbUO+C3LuGawT+uz+r9v863mNxiELkEBd7pcZcKa3vnBZpOzn7
         qKqOH97sb10LLwA1cwlqlhGt8AdtIR4CivKY03pky5GRQU4M41RycfaVVPEd5pm6TP/g
         SPTH/QuhwjtJUwZis+LyvGu2XibpWZSpdQwvVkRrj5n6BOfC7nWolpbdQjW+jVEg7+b8
         qGvUP9v29zEwBRV+hBecboEfRo8Udq7QPX0ZANtBYaZ56o0O8yApNKuNfjfoFhSIQtzZ
         8jXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :dkim-signature;
        bh=2M2cBdnjCKHbTffAxygjNzzW3DY3E7nE5HBQsMj2p64=;
        b=AQJshwrniTEzJA+I5wWhp0yJhGhk98ZSlc4NqS0Fq3ycfr1h3u/krXib0kcp+610nj
         S7RTHZpPdo9HGsrw9LhOD08l0rW4PRQZFOFCBmvdZK+qpr5IAGOlkEJ4ltJr7v47UKho
         4ASaS8TGTfsnPMx+rhYz3K2OP9RFJtrclGpwmCkozvDPrjEbE0j4h6W/kCzERIvnKifn
         Kq1JMqTmXNN1JGeQ6wnEqTfsN0C/UIBemPlSXya9M/XUtg4b1y+UDAOG7VwI7oV3XQVt
         8HamP76vZEf400Uifa+KCHsCPRqKyz74UZ/kVavbwRL01gtYq06NtgSWhKoqJ4wVc4aS
         h2XQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=Bv2SIBQw;
       spf=pass (google.com: domain of nieklinnenbank@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=nieklinnenbank@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <nieklinnenbank@gmail.com>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id g16sor4867152wrw.35.2020.03.01.13.50.44
        (Google Transport Security);
        Sun, 01 Mar 2020 13:50:44 -0800 (PST)
Received-SPF: pass (google.com: domain of nieklinnenbank@gmail.com designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=Bv2SIBQw;
       spf=pass (google.com: domain of nieklinnenbank@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=nieklinnenbank@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=2M2cBdnjCKHbTffAxygjNzzW3DY3E7nE5HBQsMj2p64=;
        b=Bv2SIBQwgrdym/6DigaM9aJOHKMlGctBoYR11Q4fnJOmuQT/Lv6PO/6VbcaqaqclEH
         QVUn4qblqMIM7xzaxU7414NFm9thn5ztgSAyhEf1hK60U5u9gjXhWKZqfJHvrQRbmd0t
         kFhA4BT8cbW9woijWk1i43W0wjnqyqxA1r6Tb7arPz1fioeUpv92yKCM+8QtwAys9ev7
         q8B94lowzmpAAMVrUij01h+o4qduv/AhYz8/hjnjV+ZkBGxuciJag1Wx8kw38VKbJ4NZ
         xn5lQXFf6u1R70ykbtOdCrYRIuxqD2g/anzCVTh9lcvJF2GIwwcZYzeefccVhzBKHnhE
         21/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=2M2cBdnjCKHbTffAxygjNzzW3DY3E7nE5HBQsMj2p64=;
        b=ShgDbpH+ErpTOJ7HNVLjQikvx/XcFHRJtItQPjh8aFQNaPlKrAEuUecXBxnyyV/8T3
         YkpQh30EzU5IuQv6StpobWOoeAOtx5Ne+NGo9H+U8EDGua1IL0fgtw9o7lacRqqn1bE7
         NtkZfxEe2b/vm1/+dCkZ3v3gKUeflO8+Rbgd8rErKb2Od0YavDNTd/I9AW99LbmJHcHl
         FvPaPmROHrN5XWmKm5skdcinQ1pDHLUjRHGONhNQZNLH+qfPfZFIUM7I9rryZrDdYQxs
         ZLfLq/szc+nb+k6onAN/lnw9ZwrR/v8Q2GBFHIxnaK7F5ZdfDSMvtuLGvWS94cY8zxls
         3a7g==
X-Gm-Message-State: APjAAAWpv0OwN7Xm/pOhvKSyz6luvydqFhakz3fUA+hbnvqsOCz5Z7Le
	heRmLks8NIllvaoLeugVp6w=
X-Google-Smtp-Source: APXvYqz24XUKEOzjJSxaZTHUfu0JBVrNnW0N1UaxrYC2i5fYEeuH4V3F7bKj2Fm5D3vt7Z1pSMlRCA==
X-Received: by 2002:adf:fecf:: with SMTP id q15mr18795819wrs.360.1583099444190;
        Sun, 01 Mar 2020 13:50:44 -0800 (PST)
Return-Path: <nieklinnenbank@gmail.com>
Received: from pavilion.home ([2a02:a456:6be8:1:8edc:d4ff:fe8b:18b7])
        by smtp.gmail.com with ESMTPSA id e8sm25033124wrr.69.2020.03.01.13.50.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Mar 2020 13:50:43 -0800 (PST)
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
Subject: [PATCH v6 10/18] hw/arm/allwinner-h3: add Boot ROM support
Date: Sun,  1 Mar 2020 22:50:21 +0100
Message-Id: <20200301215029.15196-11-nieklinnenbank@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200301215029.15196-1-nieklinnenbank@gmail.com>
References: <20200301215029.15196-1-nieklinnenbank@gmail.com>
X-TUID: 9MMftiTsANSN

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
index d5cfc1f611..8a2b8919c9 100644
--- a/hw/arm/orangepi.c
+++ b/hw/arm/orangepi.c
@@ -95,6 +95,11 @@ static void orangepi_init(MachineState *machine)
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
