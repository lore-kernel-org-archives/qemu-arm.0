Received: by 2002:a1c:4d4:0:0:0:0:0 with SMTP id 203-v6csp311551wme;
        Mon, 21 May 2018 07:04:24 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZohLc3I/kiIKyr+HBdJ/LwXWJdIeBUy69LuawIyJB2ZuibVvODBO4ho5vNhYIkbJQYzUe7c
X-Received: by 2002:a1c:ecc5:: with SMTP id h66-v6mr10123599wmi.147.1526911464187;
        Mon, 21 May 2018 07:04:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1526911464; cv=none;
        d=google.com; s=arc-20160816;
        b=o/q9m+pXFFbyEB/E2Nk0Tn99GWEovTg/7EYcAWgExxtXyfJftLSGkA/LEfZsZXiASA
         yqjzuVz/02yks74Pt47GoLDJ+9nLWR3eYX6YZisTMpGEIzDVOKGbu6gXV2KE8d1ZMyIT
         MlZiqxAlZq2C9RrIygXX5n4yyVaoPcUamt0RcNYv5SEbjbaJ1qKrDrn68yP/q2VuXZk5
         hdOORBDnePAKqLB8BtAVaSqLWi/J6ydctMWK3otNGkoekAQBS0PNwSBvlrEh6XlKmzoH
         oASN64r5Z2sbpzYHBKAPH+KI3u7QmUqrnw32IOPxVGLZQfnqkrPoFdhTV0DqtiRIOF2I
         uPCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :arc-authentication-results;
        bh=v/9T4p/LCWal/ao0XRn4UMPGLBmizkulrsWAlRAqZ7c=;
        b=la/3qbB84OFbioZDZvZGFxK6Dod2n1QM+RFxRVLeGz7c99gPEkEPdqQDNgkuM0JYIu
         iQVV1SOFgxLz17K62nsZU/sOI8s+7oEz27Loe5IgAviXgnzzv6iLUqqpJ8nfQ+tDXnaH
         bAqqHvj9KBU5BNdVWHd0OTMp5I8rnaF4imfgXWMPbcR/naICmK49QekqxWHBkz87zLlV
         XnN1rUq/WM9sHIa7NTPa4XtlLMkyz8rqIs2vi8/3HcSJ57HBDesXbOjAdNCp5ilUXhcC
         i7BkAAZJ7sAl+QSrdm/3BDI54/UVmIoI0o7qKrg4HXikvJ1HEQ9YozCWXM0b/SmsXUoV
         xN2A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::2 as permitted sender) smtp.mailfrom=pm215@archaic.org.uk;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <pm215@archaic.org.uk>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by mx.google.com with ESMTPS id k2-v6si3155816wrm.323.2018.05.21.07.04.23
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 21 May 2018 07:04:24 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::2 as permitted sender) client-ip=2001:8b0:1d0::2;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::2 as permitted sender) smtp.mailfrom=pm215@archaic.org.uk;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1fKlQF-0007qA-B0; Mon, 21 May 2018 15:04:23 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: patches@linaro.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <rth@twiddle.net>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH 27/27] hw/arm/mps2-tz.c: Instantiate MPCs
Date: Mon, 21 May 2018 15:04:02 +0100
Message-Id: <20180521140402.23318-28-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180521140402.23318-1-peter.maydell@linaro.org>
References: <20180521140402.23318-1-peter.maydell@linaro.org>
X-TUID: F0IZjnbu5X/q

Instantiate and wire up the Memory Protection Controllers
in the MPS2 board itself.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/mps2-tz.c | 71 ++++++++++++++++++++++++++++++------------------
 1 file changed, 44 insertions(+), 27 deletions(-)

diff --git a/hw/arm/mps2-tz.c b/hw/arm/mps2-tz.c
index 8dc8bfd4ab..a58b5dea79 100644
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
@@ -95,16 +95,6 @@ typedef struct {
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
@@ -224,6 +214,44 @@ static MemoryRegion *make_fpgaio(MPS2TZMachineState *mms, void *opaque,
     return sysbus_mmio_get_region(SYS_BUS_DEVICE(fpgaio), 0);
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
@@ -285,14 +313,6 @@ static void mps2tz_common_init(MachineState *machine)
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
@@ -322,12 +342,9 @@ static void mps2tz_common_init(MachineState *machine)
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
2.17.0
