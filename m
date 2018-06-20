Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp761902wrq;
        Wed, 20 Jun 2018 06:20:41 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKL9NJy5cPRglZEqKSHULU0IMqclrmNLa1CPNI2MO++gD+hORjqb25ycZjUysf4dr1aJpdzJ
X-Received: by 2002:a1c:1695:: with SMTP id 143-v6mr1713028wmw.12.1529500841945;
        Wed, 20 Jun 2018 06:20:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1529500841; cv=none;
        d=google.com; s=arc-20160816;
        b=rbyef3rJLCytGn2QVRXIDqLT5/Noo/JA5NTcCiS7bqTzJlvX69SDXYv5A2B9OhxY2V
         IHjuxAgKZfzdBjM5GtjuMtwCNDluJvZQZEknmaTtoioZmKhibKC6Gy+OknMGKChfNo3/
         nKFgubfbbyjq/OLmvak6CIfbwmyA7S2ZDevtQkF5Ectzz0UXoz6L0GlpJzwVywjhBpZm
         vcWivJdmNUMT/TGaI75JV5cszAJ9eetHVx9XCLVUJuG7wwtCyrJ0rhEcTp5B2P5LTOh/
         gAvOqa7LHMdOiXCTu6nRa8tHAAkde9dAEBwYDjhQX0adhmD2dvJMkppWJtJ5/WYtXsyh
         xgZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:arc-authentication-results;
        bh=bnM3LH+WSZMu0ce7j4RyyFivQaOkmXzjLASm48hnMsQ=;
        b=YW9M1vzx3+L0vX69G4///C0RSHoFF41Vi5xKUgtMdG4Ntl1KrKfqn/B4uzhlcGRIjD
         2f/ym/r+KEnVR6zqBuxEljQtrOXiR15PZ6tTiw1HFoatTvgCO1jigzLO7oREOHX2RRpa
         Afh3gLQbQxdi4Ip/kKRkKnnHD5vEuit0KS7KmOFYexfHnyGXdWKNNokCVNeUonBWrCe+
         /CEzTE/aGJKDkFZIxRcZDpY34JjxlmNtg5EIMcM0dfaJeahOVyxwBfiJ7WbSnpockOhD
         USb46GATS9PGh4LG3QJE/VMxf2FmaQM77Evm/a1/HWFCohrIXgPfVxnvbGGCiQKN3tqs
         m4rw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::2 as permitted sender) smtp.mailfrom=pm215@archaic.org.uk;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <pm215@archaic.org.uk>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by mx.google.com with ESMTPS id v203-v6si250681wma.96.2018.06.20.06.20.41
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 20 Jun 2018 06:20:41 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::2 as permitted sender) client-ip=2001:8b0:1d0::2;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::2 as permitted sender) smtp.mailfrom=pm215@archaic.org.uk;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1fVd2P-0001cO-EN; Wed, 20 Jun 2018 14:20:41 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: patches@linaro.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Eric Auger <eric.auger@redhat.com>
Subject: [PATCH v3 8/8] hw/arm/mps2-tz.c: Instantiate MPCs
Date: Wed, 20 Jun 2018 14:20:32 +0100
Message-Id: <20180620132032.28865-9-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180620132032.28865-1-peter.maydell@linaro.org>
References: <20180620132032.28865-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 27/9dDoq6joW

Instantiate and wire up the Memory Protection Controllers
in the MPS2 board itself.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
---
 hw/arm/mps2-tz.c | 71 ++++++++++++++++++++++++++++++------------------
 1 file changed, 44 insertions(+), 27 deletions(-)

diff --git a/hw/arm/mps2-tz.c b/hw/arm/mps2-tz.c
index c5ef95e4cc0..22180c56fb7 100644
--- a/hw/arm/mps2-tz.c
+++ b/hw/arm/mps2-tz.c
@@ -44,6 +44,7 @@
 #include "hw/timer/cmsdk-apb-timer.h"
 #include "hw/misc/mps2-scc.h"
 #include "hw/misc/mps2-fpgaio.h"
+#include "hw/misc/tz-mpc.h"
 #include "hw/arm/iotkit.h"
 #include "hw/devices.h"
 #include "net/net.h"
@@ -64,13 +65,12 @@ typedef struct {
 
     IoTKit iotkit;
     MemoryRegion psram;
-    MemoryRegion ssram1;
+    MemoryRegion ssram[3];
     MemoryRegion ssram1_m;
-    MemoryRegion ssram23;
     MPS2SCC scc;
     MPS2FPGAIO fpgaio;
     TZPPC ppc[5];
-    UnimplementedDeviceState ssram_mpc[3];
+    TZMPC ssram_mpc[3];
     UnimplementedDeviceState spi[5];
     UnimplementedDeviceState i2c[4];
     UnimplementedDeviceState i2s_audio;
@@ -96,16 +96,6 @@ typedef struct {
 /* Main SYSCLK frequency in Hz */
 #define SYSCLK_FRQ 20000000
 
-/* Initialize the auxiliary RAM region @mr and map it into
- * the memory map at @base.
- */
-static void make_ram(MemoryRegion *mr, const char *name,
-                     hwaddr base, hwaddr size)
-{
-    memory_region_init_ram(mr, NULL, name, size, &error_fatal);
-    memory_region_add_subregion(get_system_memory(), base, mr);
-}
-
 /* Create an alias of an entire original MemoryRegion @orig
  * located at @base in the memory map.
  */
@@ -245,6 +235,44 @@ static MemoryRegion *make_eth_dev(MPS2TZMachineState *mms, void *opaque,
     return sysbus_mmio_get_region(s, 0);
 }
 
+static MemoryRegion *make_mpc(MPS2TZMachineState *mms, void *opaque,
+                              const char *name, hwaddr size)
+{
+    TZMPC *mpc = opaque;
+    int i = mpc - &mms->ssram_mpc[0];
+    MemoryRegion *ssram = &mms->ssram[i];
+    MemoryRegion *upstream;
+    char *mpcname = g_strdup_printf("%s-mpc", name);
+    static uint32_t ramsize[] = { 0x00400000, 0x00200000, 0x00200000 };
+    static uint32_t rambase[] = { 0x00000000, 0x28000000, 0x28200000 };
+
+    memory_region_init_ram(ssram, NULL, name, ramsize[i], &error_fatal);
+
+    init_sysbus_child(OBJECT(mms), mpcname, mpc,
+                      sizeof(mms->ssram_mpc[0]), TYPE_TZ_MPC);
+    object_property_set_link(OBJECT(mpc), OBJECT(ssram),
+                             "downstream", &error_fatal);
+    object_property_set_bool(OBJECT(mpc), true, "realized", &error_fatal);
+    /* Map the upstream end of the MPC into system memory */
+    upstream = sysbus_mmio_get_region(SYS_BUS_DEVICE(mpc), 1);
+    memory_region_add_subregion(get_system_memory(), rambase[i], upstream);
+    /* and connect its interrupt to the IoTKit */
+    qdev_connect_gpio_out_named(DEVICE(mpc), "irq", 0,
+                                qdev_get_gpio_in_named(DEVICE(&mms->iotkit),
+                                                       "mpcexp_status", i));
+
+    /* The first SSRAM is a special case as it has an alias; accesses to
+     * the alias region at 0x00400000 must also go to the MPC upstream.
+     */
+    if (i == 0) {
+        make_ram_alias(&mms->ssram1_m, "mps.ssram1_m", upstream, 0x00400000);
+    }
+
+    g_free(mpcname);
+    /* Return the register interface MR for our caller to map behind the PPC */
+    return sysbus_mmio_get_region(SYS_BUS_DEVICE(mpc), 0);
+}
+
 static void mps2tz_common_init(MachineState *machine)
 {
     MPS2TZMachineState *mms = MPS2TZ_MACHINE(machine);
@@ -306,14 +334,6 @@ static void mps2tz_common_init(MachineState *machine)
                                          NULL, "mps.ram", 0x01000000);
     memory_region_add_subregion(system_memory, 0x80000000, &mms->psram);
 
-    /* The SSRAM memories should all be behind Memory Protection Controllers,
-     * but we don't implement that yet.
-     */
-    make_ram(&mms->ssram1, "mps.ssram1", 0x00000000, 0x00400000);
-    make_ram_alias(&mms->ssram1_m, "mps.ssram1_m", &mms->ssram1, 0x00400000);
-
-    make_ram(&mms->ssram23, "mps.ssram23", 0x28000000, 0x00400000);
-
     /* The overflow IRQs for all UARTs are ORed together.
      * Tx, Rx and "combined" IRQs are sent to the NVIC separately.
      * Create the OR gate for this.
@@ -343,12 +363,9 @@ static void mps2tz_common_init(MachineState *machine)
     const PPCInfo ppcs[] = { {
             .name = "apb_ppcexp0",
             .ports = {
-                { "ssram-mpc0", make_unimp_dev, &mms->ssram_mpc[0],
-                  0x58007000, 0x1000 },
-                { "ssram-mpc1", make_unimp_dev, &mms->ssram_mpc[1],
-                  0x58008000, 0x1000 },
-                { "ssram-mpc2", make_unimp_dev, &mms->ssram_mpc[2],
-                  0x58009000, 0x1000 },
+                { "ssram-0", make_mpc, &mms->ssram_mpc[0], 0x58007000, 0x1000 },
+                { "ssram-1", make_mpc, &mms->ssram_mpc[1], 0x58008000, 0x1000 },
+                { "ssram-2", make_mpc, &mms->ssram_mpc[2], 0x58009000, 0x1000 },
             },
         }, {
             .name = "apb_ppcexp1",
-- 
2.17.1
