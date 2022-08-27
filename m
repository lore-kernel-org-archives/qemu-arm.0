Received: by 2002:a17:906:1c87:0:0:0:0 with SMTP id g7csp918613ejh;
        Sat, 27 Aug 2022 11:07:16 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7vgliRqqNAQz+c7qWIi0Zli/xZGGu1zzv7VXSHoJxtaoTS/pi3bidXUW9hYcAPNJqubozF
X-Received: by 2002:a05:6402:350e:b0:448:4918:af81 with SMTP id b14-20020a056402350e00b004484918af81mr848321edd.384.1661623636059;
        Sat, 27 Aug 2022 11:07:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1661623636; cv=none;
        d=google.com; s=arc-20160816;
        b=DC1m2CzmghLouHrPGG8RswROzxTur529ppFzyHm520mIwu/jUuo2XNkZxvXSwJCRNJ
         7Velj5SYXW+Jtgq+L3M2f0k5NM0xEf5Kv8f0UAMbVwJDJMEWkGM8zEg6sNP1uYFR8J52
         qThX+hIklOQX25p/abEyRoRqqdfhUFHKKktY6IdhRlb21QQxtLuq3fmrNP1ofJE0m1NA
         eoQBckO95b4AAd34uEd3z1q8xDu4bwNIQSWaRG/KAkeFQmE+n4Wk/Zk7B7yop4s7d9/E
         MfMx3OjTg5MCYjb3s2c28Iogo8mh7I1yc+CPcyI8d88efCiINlm6NFYqZ7LeBN/ikBJ+
         uGlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=pRUphrUOT5ThydUemlvF42u27K3oW2orOW3AGjBkre0=;
        b=rcMNcdvFN9hZ8BrW8Zwruf+aZxPr2hB06V0wdhiq8Q95JsNQsKmJEFpjFlJV1Om81+
         VjzaCkl7zLUvJUOYygOmq5xohHenfYI03io0WE7oD8KyPitt+n5uCyoet/dQ9XVTYVLO
         dr8fenQ8sY1ky46djIMCZr3BwQxulUK65cWFT65jjjm8pdLf/vvNHVEmlVwAs4Ho6wpR
         xGq/cXRDqAqnJ/ma68mqHsODwErCILz2GrqDxvviU1K0XHwyD4bzcF+NpFicxeY3XuhZ
         UhjipDaTqru4uAFBMjOna+PfRad7Ht+WSuR25hDnN1elKcWcNrCmbwyyvuDxqFnk5oZ/
         KfIQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@fvhovell.nl header.s=soverin header.b=z+WMcLny;
       spf=pass (google.com: domain of frederik@fvhovell.nl designates 185.233.34.146 as permitted sender) smtp.mailfrom=frederik@fvhovell.nl
Return-Path: <frederik@fvhovell.nl>
Received: from outbound.soverin.net (outbound.soverin.net. [185.233.34.146])
        by mx.google.com with ESMTPS id p1-20020a1709060dc100b0073d671012c7si2898905eji.486.2022.08.27.11.07.15
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Aug 2022 11:07:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of frederik@fvhovell.nl designates 185.233.34.146 as permitted sender) client-ip=185.233.34.146;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@fvhovell.nl header.s=soverin header.b=z+WMcLny;
       spf=pass (google.com: domain of frederik@fvhovell.nl designates 185.233.34.146 as permitted sender) smtp.mailfrom=frederik@fvhovell.nl
Received: from smtp.freedom.nl (c04smtp-lb01.int.sover.in [10.10.4.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by outbound.soverin.net (Postfix) with ESMTPS id 4MFPmg54x7zK5;
	Sat, 27 Aug 2022 18:07:15 +0000 (UTC)
Received: from smtp.freedom.nl (smtp.freedom.nl [10.10.4.108]) by freedom.nl
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=fvhovell.nl;
	s=soverin; t=1661623634;
	bh=RXPaBlKKV4KA1lt3oCcUQ/B2ERn90P4TrBJa/8wFD9E=;
	h=From:To:Cc:Subject:Date:From;
	b=z+WMcLnyyD9xcr3C9+TNNJcCIUwNQCLFMVU4qt0upEPqd9aD8LdvXBQztXOqW04WR
	 v5mxCYZj20QfGddG4rnqKg/4PcouInAQcGMz4UIlaEosSfXVQ6cu5hpsxelLdmUK5Z
	 UugGNLPuGXRHcUqjWYM/4KYnOxPMsNoHbCZyrps6K7HnF2ssLSDC7bTJjs9zl9KprK
	 DaIcZpdSWlAJNWudrcNC9MvUeXpV8EFUC+MwFnvDsAClZMkX6SCvfloZXzUsJQEa38
	 cimh0/TySQcSWJZVuUX/pw7HzV7s7VWmAS1MdFxUpgQMqL2t/j67QhCqJTHRP67O7C
	 bKewn+TOrY2ag==
From: =?UTF-8?q?Frederik=20van=20H=C3=B6vell?= <frederik@fvhovell.nl>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Michael Bishop <cleverca22@gmail.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	=?UTF-8?q?Frederik=20van=20H=C3=B6vell?= <frederik@fvhovell.nl>
Subject: [PATCH v2] hw/arm: fix the position of vcram for raspi
Date: Sat, 27 Aug 2022 20:07:02 +0200
Message-Id: <20220827180702.39462-1-frederik@fvhovell.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: Y0qiPMsi07cD

From: Alex Bennée <alex.bennee@linaro.org>

The previous calculation fell over when I tried to create a 8gb Pi 4
because the values were only 32 bit. However the quirk of the Pi
hardware is the vcram can only appear in the first 1gb of address
space. This also limits where the initial kernel and DTB can be
loaded (notice the DTS for the 8gb Pi4 still only uses 32 bit sizes).
Fix this cleaning up setup_boot to directly use vcram_base and
documenting what is going on.

NB: the aliases are confusing.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: Michael Bishop <cleverca22@gmail.com>
Cc: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20211001174243.128157-1-alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Frederik van Hövell <frederik@fvhovell.nl>
---
 hw/arm/bcm2835_peripherals.c | 14 +++++++++++---
 hw/arm/bcm2836.c             |  2 ++
 hw/arm/raspi.c               | 19 ++++++++++++-------
 3 files changed, 25 insertions(+), 10 deletions(-)

diff --git a/hw/arm/bcm2835_peripherals.c b/hw/arm/bcm2835_peripherals.c
index 3c2a4160cd..1ef7f7f372 100644
--- a/hw/arm/bcm2835_peripherals.c
+++ b/hw/arm/bcm2835_peripherals.c
@@ -12,6 +12,7 @@
 #include "qemu/osdep.h"
 #include "qapi/error.h"
 #include "qemu/module.h"
+#include "qemu/units.h"
 #include "hw/arm/bcm2835_peripherals.h"
 #include "hw/misc/bcm2835_mbox_defs.h"
 #include "hw/arm/raspi_platform.h"
@@ -81,6 +82,7 @@ static void bcm2835_peripherals_init(Object *obj)
     /* Framebuffer */
     object_initialize_child(obj, "fb", &s->fb, TYPE_BCM2835_FB);
     object_property_add_alias(obj, "vcram-size", OBJECT(&s->fb), "vcram-size");
+    object_property_add_alias(obj, "vcram-base", OBJECT(&s->fb), "vcram-base");
 
     object_property_add_const_link(OBJECT(&s->fb), "dma-mr",
                                    OBJECT(&s->gpu_bus_mr));
@@ -150,7 +152,7 @@ static void bcm2835_peripherals_realize(DeviceState *dev, Error **errp)
     Object *obj;
     MemoryRegion *ram;
     Error *err = NULL;
-    uint64_t ram_size, vcram_size;
+    uint64_t ram_size, vcram_size, vcram_base;
     int n;
 
     obj = object_property_get_link(OBJECT(dev), "ram", &error_abort);
@@ -247,15 +249,21 @@ static void bcm2835_peripherals_realize(DeviceState *dev, Error **errp)
         qdev_get_gpio_in_named(DEVICE(&s->ic), BCM2835_IC_ARM_IRQ,
                                INTERRUPT_ARM_MAILBOX));
 
-    /* Framebuffer */
+    /*
+     * The framebuffer has to live in the first 1gb of addressable
+     * space which is fine for older Pi's with less than 1gb of RAM
+     * but we need to take care not to put it too high otherwise
+     */
     vcram_size = object_property_get_uint(OBJECT(s), "vcram-size", &err);
     if (err) {
         error_propagate(errp, err);
         return;
     }
 
+    vcram_base = MIN(ram_size, 1 * GiB) - vcram_size;
+
     if (!object_property_set_uint(OBJECT(&s->fb), "vcram-base",
-                                  ram_size - vcram_size, errp)) {
+                                  vcram_base, errp)) {
         return;
     }
 
diff --git a/hw/arm/bcm2836.c b/hw/arm/bcm2836.c
index 24354338ca..255ba8265a 100644
--- a/hw/arm/bcm2836.c
+++ b/hw/arm/bcm2836.c
@@ -62,6 +62,8 @@ static void bcm2836_init(Object *obj)
                               "board-rev");
     object_property_add_alias(obj, "vcram-size", OBJECT(&s->peripherals),
                               "vcram-size");
+    object_property_add_alias(obj, "vcram-base", OBJECT(&s->peripherals),
+                              "vcram-base");
 }
 
 static bool bcm283x_common_realize(DeviceState *dev, Error **errp)
diff --git a/hw/arm/raspi.c b/hw/arm/raspi.c
index 92d068d1f9..3992e371a1 100644
--- a/hw/arm/raspi.c
+++ b/hw/arm/raspi.c
@@ -196,14 +196,19 @@ static void reset_secondary(ARMCPU *cpu, const struct arm_boot_info *info)
     cpu_set_pc(cs, info->smp_loader_start);
 }
 
+/*
+ * NB: ram_limit isn't the same as ram_size - it indicates the portion
+ * of RAM that boot components can live in (up to the first 1gb - the
+ * vcram_size, aka vcram_base)
+ */
 static void setup_boot(MachineState *machine, RaspiProcessorId processor_id,
-                       size_t ram_size)
+                       size_t ram_limit)
 {
     RaspiMachineState *s = RASPI_MACHINE(machine);
     int r;
 
     s->binfo.board_id = MACH_TYPE_BCM2708;
-    s->binfo.ram_size = ram_size;
+    s->binfo.ram_size = ram_limit;
 
     if (processor_id <= PROCESSOR_ID_BCM2836) {
         /*
@@ -238,7 +243,7 @@ static void setup_boot(MachineState *machine, RaspiProcessorId processor_id,
                              ? FIRMWARE_ADDR_2 : FIRMWARE_ADDR_3;
         /* load the firmware image (typically kernel.img) */
         r = load_image_targphys(machine->firmware, firmware_addr,
-                                ram_size - firmware_addr);
+                                ram_limit - firmware_addr);
         if (r < 0) {
             error_report("Failed to load firmware from %s", machine->firmware);
             exit(1);
@@ -257,7 +262,7 @@ static void raspi_machine_init(MachineState *machine)
     RaspiMachineState *s = RASPI_MACHINE(machine);
     uint32_t board_rev = mc->board_rev;
     uint64_t ram_size = board_ram_size(board_rev);
-    uint32_t vcram_size;
+    uint32_t vcram_base;
     DriveInfo *di;
     BlockBackend *blk;
     BusState *bus;
@@ -294,10 +299,10 @@ static void raspi_machine_init(MachineState *machine)
     qdev_prop_set_drive_err(carddev, "drive", blk, &error_fatal);
     qdev_realize_and_unref(carddev, bus, &error_fatal);
 
-    vcram_size = object_property_get_uint(OBJECT(&s->soc), "vcram-size",
+    vcram_base = object_property_get_uint(OBJECT(&s->soc), "vcram-base",
                                           &error_abort);
-    setup_boot(machine, board_processor_id(mc->board_rev),
-               machine->ram_size - vcram_size);
+
+    setup_boot(machine, board_processor_id(mc->board_rev), vcram_base);
 }
 
 static void raspi_machine_class_common_init(MachineClass *mc,
-- 
2.37.2
