Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp2722896wrm;
        Sat, 19 Oct 2019 16:57:03 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwYcnOJH9IWVS9LBNuhY2AI98yK+l61JY/ArwSqBoPceHK1foTel9wi1CgeFDjJXEbf0j1o
X-Received: by 2002:a0c:eb11:: with SMTP id j17mr17124933qvp.73.1571529423771;
        Sat, 19 Oct 2019 16:57:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571529423; cv=none;
        d=google.com; s=arc-20160816;
        b=NKyCOngTt0F1odiSiiiDCUB2bzKOD+X2LQO+sra1ojJiIlO1zwL4E7+xxAafx2gC5v
         /F1SmXC7LIl3I1Z3FLeZQiKfqvdbvc5Ls8eP3IFV0BCsl6KsHhT9JHOQ6XwtMvGdrPT6
         5YTZEtlavNPIzmaZkcQsMlT4eWYMuyyHCM3X9JNrNvXkx9qiJMtNIRG5uY/Pw3NPNzKS
         blAJgidCAdpa/5mVbZD14a0ctwuUSYs/X+M6HgWoWltqw2gtF6V+gl6mcN4PtYaoZuA2
         9KaXL9SaLmIAzsEHEhKgzPP1Gs7Ak5xnlvqixmMNcvzbeuP7RYznqpp+AxF7Rh2pteL/
         D+ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=/zFVPjuAiYGtT3eOPkbE1HDbnoPdHl9DaAfhFHqH+Qw=;
        b=M/xJIoSlHgAKIfoBXNyGKjPj/pG0Mx7COWo9gJw40j2U86xNVhOLbt6IgweWpP39ch
         B4RcXNmVApmIGmSfUyxaucB0vWDlwGA6zgxB61TwWFx8bWlKvxPgNItl5wigBK1VPrW/
         ksSXwI0Dt3ZBL7V7fMGstbdLOzuhO82GU7AS5Xk8kos4l1QcwJNW8adAuOUejJS4jIBC
         G/xgp0Lc9s1ZeOYjH+VHR81Ei8Id3RJDX7IaFhOP4tMKmk+qsB+QTzDIX0eU9s9DSdUE
         iIrGmWo300AwYrTxjoGtCU8BfMMSHsM6CcSYSSQdYRDCdnH6gWM3Nqvr5Af7bSpBXQPw
         FX0A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="t/pEgVtG";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 13si10008663qtt.174.2019.10.19.16.57.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 19 Oct 2019 16:57:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="t/pEgVtG";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:42236 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iLyak-00056N-M0
	for alex.bennee@linaro.org; Sat, 19 Oct 2019 19:57:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34740)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1iLyRm-0000b1-FP
 for qemu-arm@nongnu.org; Sat, 19 Oct 2019 19:47:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1iLyRl-0005hp-04
 for qemu-arm@nongnu.org; Sat, 19 Oct 2019 19:47:46 -0400
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:33755)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1iLyRh-0005fo-L8; Sat, 19 Oct 2019 19:47:41 -0400
Received: by mail-wm1-x341.google.com with SMTP id r17so11892155wme.0;
 Sat, 19 Oct 2019 16:47:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/zFVPjuAiYGtT3eOPkbE1HDbnoPdHl9DaAfhFHqH+Qw=;
 b=t/pEgVtGZdKrTtAtQtarzSMXmo07HjtOI3GpSUmw6fKHOQ6M0V0ZS/NuBb23I6RTsu
 BfI7OL9QxVhnfVVceeGfNLwxk3JuvSj801MPMPbHKc6qH2XSoGuM8Zn67SIWc7Z5vX72
 Q7gKlMkFzCS91c5eeKlPjOrlqjAMrR5tOR28zosWLAksg/TSa6e+09H1ucJapFUMQ6Wg
 bOBoSMjdR24Q7pZLgTB3dWVGpHfOMAKd7qecBLoT3Bxvh+XE/ioNtmDwsu87CH5AswvI
 De6y+n9x12uMaJAykdwag+WuVa+mw+aCtrLiEEyrWU3Sxe/WIqma55B8OLvcvl4QE4vG
 Rvig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=/zFVPjuAiYGtT3eOPkbE1HDbnoPdHl9DaAfhFHqH+Qw=;
 b=nONkAclewCtjLGBlPTT4vOMNDpJhBP3ChD3dc73CYjdVOYYmTeyb+6BdJpkztasB30
 Ry0PwRFCD7vpuaVluvNIdLl4wvWIWMhYJ8sU80/goIsbzBfjU2gXiuSU+KJh2q3iJ0AQ
 SzuApAKpviVb655JnC6MSZ8jsw5gB3QaEw2V3YUO6gZAlWhJPsKhjHKOqJk5QhWk1w4x
 i1tLeWZE/YIsaL3xrOWr+WSoOOQKwe8GdXVx8PX6rDfV/aDwEBHo360xEgcR3CPst4uQ
 VmMMGQx0eo1fGAU2KsD9B/7yGDTflZq/PqOlTpWzZMapEkqqUBaZkcsjLFrLwCuq3sOW
 h7/g==
X-Gm-Message-State: APjAAAUyo4nt18h3zXGwWhyBegvKTWSKP5VE8Awt8NIKD3tTucZ4URaZ
 y8lqeLIwIynd1i1EemujGEkTNbDr
X-Received: by 2002:a1c:1bd8:: with SMTP id b207mr12774993wmb.62.1571528860433; 
 Sat, 19 Oct 2019 16:47:40 -0700 (PDT)
Received: from x1w.redhat.com (14.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.14])
 by smtp.gmail.com with ESMTPSA id u1sm10433763wrp.56.2019.10.19.16.47.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 19 Oct 2019 16:47:39 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 13/16] hw/arm/raspi: Make the board code modular
Date: Sun, 20 Oct 2019 01:47:12 +0200
Message-Id: <20191019234715.25750-14-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191019234715.25750-1-f4bug@amsat.org>
References: <20191019234715.25750-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::341
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Matthias Brugger <mbrugger@suse.com>, Rob Herring <robh@kernel.org>,
 Alistair Francis <alistair@alistair23.me>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Esteban Bosse <estebanbosse@gmail.com>, "Emilio G . Cota" <cota@braap.org>,
 Clement Deschamps <clement.deschamps@antfield.fr>, qemu-arm@nongnu.org,
 Cleber Rosa <crosa@redhat.com>, Laurent Bonnans <laurent.bonnans@here.com>,
 Cheng Xiang <ext-cheng.xiang@here.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Pekka Enberg <penberg@iki.fi>, Pete Batard <pete@akeo.ie>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: HLS0+2VMLGEc

Our code currently create the raspi2 (based on the BCM2836)
and the raspi3 (on the BCM2837). Similarly, the raspi4 is
based on the BCM2838. To be able to add the new board,
make the current code more modular:

- Dynamically fills the 'board-rev' value
- Allow DRAM sizes different than 1 GiB

Rename the board model name as 'B' since this is the one
encoded in the 'board-rev' tag.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/arm/raspi.c | 107 +++++++++++++++++++++++++++++++++++++++++++------
 1 file changed, 94 insertions(+), 13 deletions(-)

diff --git a/hw/arm/raspi.c b/hw/arm/raspi.c
index b1b488ca53..004804bdb3 100644
--- a/hw/arm/raspi.c
+++ b/hw/arm/raspi.c
@@ -13,6 +13,7 @@
 
 #include "qemu/osdep.h"
 #include "qemu/units.h"
+#include "qemu/cutils.h"
 #include "qapi/error.h"
 #include "cpu.h"
 #include "hw/arm/bcm2836.h"
@@ -29,8 +30,67 @@
 #define FIRMWARE_ADDR_3 0x80000 /* Pi 3 loads kernel.img here by default */
 #define SPINTABLE_ADDR  0xd8 /* Pi 3 bootloader spintable */
 
-/* Table of Linux board IDs for different Pi versions */
-static const int raspi_boardid[] = {[1] = 0xc42, [2] = 0xc43, [3] = 0xc44};
+enum BoardIdManufacturer {
+    M_SONY_UK = 0,
+    M_EMBEST = 2,
+};
+
+enum BoardIdChip {
+    C_BCM2835 = 0,
+    C_BCM2836 = 1,
+    C_BCM2837 = 2,
+};
+
+enum BoardIdType {
+    T_2B = 0x04,
+    T_3B = 0x08,
+};
+
+enum BoardIdRevision {
+    R_1_0 = 0,
+    R_1_1 = 1,
+    R_1_2 = 2,
+    R_1_3 = 3,
+};
+
+static const char *processor_typename[] = {
+    [C_BCM2836] = TYPE_BCM2836,
+    [C_BCM2837] = TYPE_BCM2837,
+};
+
+typedef struct BoardInfo BoardInfo;
+
+struct BoardInfo {
+    /* Table of Linux board IDs for different Pi versions */
+    int board_id;
+    /*
+     * Board revision codes:
+     * www.raspberrypi.org/documentation/hardware/raspberrypi/revision-codes/
+     */
+    struct {
+        enum BoardIdType type;
+        enum BoardIdRevision revision;
+        enum BoardIdChip chip;
+        enum BoardIdManufacturer manufacturer;
+    } board_rev;
+    uint64_t ram_size_min;
+    uint64_t ram_size_max;
+};
+
+static const BoardInfo bcm283x_boards[] = {
+    [2] = {
+        .board_id = 0xc43,
+        .board_rev = { T_2B, R_1_1, C_BCM2836, M_EMBEST },
+        .ram_size_min = 1 * GiB,
+        .ram_size_max = 1 * GiB,
+    },
+    [3] = {
+        .board_id = 0xc44,
+        .board_rev = { T_3B, R_1_2, C_BCM2837, M_SONY_UK },
+        .ram_size_min = 1 * GiB,
+        .ram_size_max = 1 * GiB,
+    },
+};
 
 typedef struct RasPiState {
     BCM283XState soc;
@@ -116,7 +176,7 @@ static void setup_boot(MachineState *machine, int version, size_t ram_size)
     static struct arm_boot_info binfo;
     int r;
 
-    binfo.board_id = raspi_boardid[version];
+    binfo.board_id = bcm283x_boards[version].board_id;
     binfo.ram_size = ram_size;
     binfo.nb_cpus = machine->smp.cpus;
 
@@ -148,7 +208,7 @@ static void setup_boot(MachineState *machine, int version, size_t ram_size)
      * the normal Linux boot process
      */
     if (machine->firmware) {
-        hwaddr firmware_addr = version == 3 ? FIRMWARE_ADDR_3 : FIRMWARE_ADDR_2;
+        hwaddr firmware_addr = version >= 3 ? FIRMWARE_ADDR_3 : FIRMWARE_ADDR_2;
         /* load the firmware image (typically kernel.img) */
         r = load_image_targphys(machine->firmware, firmware_addr,
                                 ram_size - firmware_addr);
@@ -172,16 +232,32 @@ static void raspi_init(MachineState *machine, int version)
     BlockBackend *blk;
     BusState *bus;
     DeviceState *carddev;
+    char *size_str;
+    int board_rev;
+    const char *soc_type;
 
-    if (machine->ram_size > 1 * GiB) {
+    if (machine->ram_size < bcm283x_boards[version].ram_size_min) {
+        size_str = size_to_str(bcm283x_boards[version].ram_size_min);
+        error_report("Requested ram size is too small for this machine: "
+                     "minimum is %s", size_str);
+        g_free(size_str);
+        exit(1);
+    }
+    if (machine->ram_size > bcm283x_boards[version].ram_size_max) {
+        size_str = size_to_str(bcm283x_boards[version].ram_size_max);
         error_report("Requested ram size is too large for this machine: "
-                     "maximum is 1GB");
+                     "maximum is %s", size_str);
+        g_free(size_str);
+        exit(1);
+    }
+    if (!is_power_of_2(machine->ram_size)) {
+        error_report("Requested ram size is not a power of 2");
         exit(1);
     }
 
+    soc_type = processor_typename[bcm283x_boards[version].board_rev.chip];
     object_initialize_child(OBJECT(machine), "soc", &s->soc, sizeof(s->soc),
-                            version == 3 ? TYPE_BCM2837 : TYPE_BCM2836,
-                            &error_abort, NULL);
+                            soc_type, &error_abort, NULL);
 
     /* Allocate and map RAM */
     memory_region_allocate_system_memory(&s->ram, OBJECT(machine), "ram",
@@ -192,9 +268,14 @@ static void raspi_init(MachineState *machine, int version)
                                    &error_abort);
     object_property_set_int(OBJECT(&s->soc), machine->smp.cores,
                             "enabled-cores", &error_abort);
-    int board_rev = version == 3 ? 0xa02082 : 0xa21041;
-    object_property_set_int(OBJECT(&s->soc), board_rev, "board-rev",
-                            &error_abort);
+
+    board_rev = ((63 - clz64(machine->ram_size / MiB)) << 20)
+                | (bcm283x_boards[version].board_rev.manufacturer << 16)
+                | (bcm283x_boards[version].board_rev.chip << 12)
+                | (bcm283x_boards[version].board_rev.type << 4)
+                | (bcm283x_boards[version].board_rev.revision << 0);
+    object_property_set_int(OBJECT(&s->soc), board_rev,
+                            "board-rev", &error_abort);
     object_property_set_bool(OBJECT(&s->soc), true, "realized", &error_abort);
 
     /* Create and plug in the SD cards */
@@ -221,7 +302,7 @@ static void raspi2_init(MachineState *machine)
 
 static void raspi2_machine_init(MachineClass *mc)
 {
-    mc->desc = "Raspberry Pi 2";
+    mc->desc = "Raspberry Pi 2B";
     mc->init = raspi2_init;
     mc->block_default_type = IF_SD;
     mc->no_parallel = 1;
@@ -243,7 +324,7 @@ static void raspi3_init(MachineState *machine)
 
 static void raspi3_machine_init(MachineClass *mc)
 {
-    mc->desc = "Raspberry Pi 3";
+    mc->desc = "Raspberry Pi 3B";
     mc->init = raspi3_init;
     mc->block_default_type = IF_SD;
     mc->no_parallel = 1;
-- 
2.21.0

