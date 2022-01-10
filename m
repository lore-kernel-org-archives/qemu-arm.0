Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id h10sm2686797ejx.115.2022.01.10.09.51.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jan 2022 09:51:10 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id BC7141FFBD;
	Mon, 10 Jan 2022 17:51:04 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [RFC PATCH  5/6] hw/arm: add mask boot ROM logic
Date: Mon, 10 Jan 2022 17:51:03 +0000
Message-Id: <20220110175104.2908956-6-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220110175104.2908956-1-alex.bennee@linaro.org>
References: <20220110175104.2908956-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: hcLBy6ejEzKF

The mask ROM contains the initial boot code to start the RP2040. It
also contains some common sub-routines as well as the flash
programming code for drag and drop programming. As a result we need to
ensure the full version is available to any user supplied programs we
might want to run.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 hw/arm/rp2040.c | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/hw/arm/rp2040.c b/hw/arm/rp2040.c
index c6cc9b7165..9a5bc20159 100644
--- a/hw/arm/rp2040.c
+++ b/hw/arm/rp2040.c
@@ -8,10 +8,12 @@
 
 #include "qemu/osdep.h"
 #include "qemu/units.h"
+#include "qemu/datadir.h"
 #include "qapi/error.h"
 #include "hw/arm/armv7m.h"
 #include "hw/arm/rp2040.h"
 #include "hw/misc/unimp.h"
+#include "hw/loader.h"
 #include "hw/sysbus.h"
 #include "hw/qdev-properties.h"
 
@@ -33,6 +35,8 @@ typedef struct RP2040Class {
 #define RP2040_SRAM4_BASE 0x20040000
 #define RP2040_SRAM5_BASE 0x20041000
 
+#define RP2040_MASK_ROM   "pipico.rom"
+
 static void rp2040_init(Object *obj)
 {
     RP2040State *s = RP2040(obj);
@@ -61,6 +65,8 @@ static void rp2040_realize(DeviceState *dev, Error **errp)
     RP2040State *s = RP2040(dev);
     Object *obj = OBJECT(dev);
     int n;
+    g_autofree char *mask_rom = qemu_find_file(QEMU_FILE_TYPE_BIOS,
+                                               RP2040_MASK_ROM);
 
     if (!s->memory) {
         error_setg(errp, "%s: memory property was not set", __func__);
@@ -68,9 +74,20 @@ static void rp2040_realize(DeviceState *dev, Error **errp)
     }
 
     /* initialize internal 16 KB internal ROM */
-    memory_region_init_rom(&s->rom, obj, "rp2040.rom0", 16 * KiB, errp);
+    memory_region_init_rom(&s->rom, obj, "rp2040.rom", 16 * KiB, errp);
     memory_region_add_subregion(s->memory, 0, &s->rom);
 
+    if (!mask_rom) {
+        error_setg(errp, "%s: unable to find mask_rom %s",
+                   __func__, RP2040_MASK_ROM);
+        return;
+    }
+    n = load_image_targphys(mask_rom, 0x0, 16 * KiB);
+    if (n <= 0) {
+        error_setg(errp, "%s: failed to load mask rom image: %s",
+                   __func__, RP2040_MASK_ROM);
+    }
+
     /* SRAM (Main 256k bank + two 4k banks)*/
     memory_region_init_ram(&s->sram03, obj, "rp2040.sram03", 256 * KiB, errp);
     memory_region_add_subregion(s->memory, RP2040_SRAM_BASE, &s->sram03);
-- 
2.30.2
