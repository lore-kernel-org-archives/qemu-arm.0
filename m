Received: by 2002:a19:8c50:0:0:0:0:0 with SMTP id i16csp215591lfj;
        Wed, 15 Dec 2021 06:41:54 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz6ikcLCrRQKb6xL6gZqCHyxq6xXizbfV/vnTW6rfbPjGl3D7XS5jdJodiHpHj1HdprQVUM
X-Received: by 2002:a05:6638:32a2:: with SMTP id f34mr6134542jav.63.1639579314382;
        Wed, 15 Dec 2021 06:41:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1639579314; cv=none;
        d=google.com; s=arc-20160816;
        b=hlULbrQt3upUduL7XT6SXAF1D5DFmV90xCvqxKFDRrqgKAVyA4/eOUa5vsDSRNAsFw
         JTb0ghH/iN2nyDxPf8jW4L9jzy2i4IeUiWlsY30VKjJgtdglQj4I8WElPINg8I3j9JI+
         Suj2/d8vjU3DFIi/5rHmqUsv1pcBwaIXj9nNBEXpZ2GuX8AkkWUga1T3EaW4a+Og8A6o
         Sn273Fj0sDo5V+pNJh6JHx09C8pMy0PxN+7tbCBTi49WDzSUWc0eqzbt17HuzFtadoML
         glEMgGUFFZFGrr64xBxBcwppH1dO/4YjQMAzOPW5YSJEyW5CPyq4Ej2jrKPLmdVOvJ/N
         vXkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=iKVPkz9NNPK+XT+b4Bt6ivhsAzyu4GAkCY/lbZ5NflU=;
        b=F51sC6hIoirOAl4ayfTjB0g1VFbAfYp01hkfqsVLljv6jSysoiD+nr4pKQ2DWitQrZ
         bCrdcaFhYSzHGkzgTH92zUkJ2ixBCzduTwLCu2cXvvc1vOsvtm95Jrh7oVZbVZSEoF1H
         QbOd2yBuzhsI6hXKNho9HBpEzhaLm+LTkOG/Fvc+Ru1gW+Z1+O35nAWtctOxbbHhT4F1
         bKszvZ2vxHwHyGqDEhvVW8Hgpy1bgKUBnf9SiQDj+w17iC6oxl/M1copw+XlPwQBSQUh
         562vmbUjaDNV6zL/WImD6jP2hF3nIER1sMbTdFjWW27gEIA/YCDRlzj59aB5sXDbp/NA
         EV2A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=YAXvLDPp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y3si1423508iov.37.2021.12.15.06.41.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 15 Dec 2021 06:41:54 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=YAXvLDPp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:39780 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mxVTd-0001dw-PL
	for alex.bennee@linaro.org; Wed, 15 Dec 2021 09:41:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43350)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mxUrb-0000rA-Vf
 for qemu-arm@nongnu.org; Wed, 15 Dec 2021 09:02:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38412)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mxUrY-0001Rz-KV
 for qemu-arm@nongnu.org; Wed, 15 Dec 2021 09:02:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639576950;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iKVPkz9NNPK+XT+b4Bt6ivhsAzyu4GAkCY/lbZ5NflU=;
 b=YAXvLDPpEk9n8d1bc/7SCnMwO5UdYzRn8kK/46X/B2dXpJUd0Ykag/hPB5DLQ63uRjjGcL
 E4ufEom50fEpaVzoQazKRNUO5YWgxvfNRZhjLp6b69J1W26n2vDA3Xo0NyqHCyAVJGIhlf
 LooK0BfBcsEePaCmN8ZYvb0vDXGrIgY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-264-i_JtSjA3OE6tTHF3jfP5pg-1; Wed, 15 Dec 2021 09:02:26 -0500
X-MC-Unique: i_JtSjA3OE6tTHF3jfP5pg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 888701023F4F;
 Wed, 15 Dec 2021 14:02:24 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-2.ams2.redhat.com [10.36.112.2])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CC03845D87;
 Wed, 15 Dec 2021 14:02:23 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 5001B113860F; Wed, 15 Dec 2021 15:02:22 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 02/13] hw: Replace trivial drive_get_next() by drive_get()
Date: Wed, 15 Dec 2021 15:02:11 +0100
Message-Id: <20211215140222.769652-3-armbru@redhat.com>
In-Reply-To: <20211215140222.769652-1-armbru@redhat.com>
References: <20211215140222.769652-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.719,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-riscv@nongnu.org,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Michael Tokarev <mjt@tls.msk.ru>, Bin Meng <bin.meng@windriver.com>,
 richard.henderson@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>,
 Beniamino Galvani <b.galvani@gmail.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm@nongnu.org,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: lobNGm6I0V5M

drive_get_next() is basically a bad idea.  It returns the "next" block
backend of a certain interface type.  "Next" means bus=0,unit=N, where
subsequent calls count N up from zero, per interface type.

This lets you define unit numbers implicitly by execution order.  If the
order changes, or new calls appear "in the middle", unit numbers change.
ABI break.  Hard to spot in review.

A number of machines connect just one backend with drive_get_next().
Change them to use drive_get() directly.  This makes the (zero) unit
number explicit in the code.

Cc: Beniamino Galvani <b.galvani@gmail.com>
Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: Subbaraya Sundeep <sundeep.lkml@gmail.com>
Cc: Niek Linnenbank <nieklinnenbank@gmail.com>
Cc: Andrew Baumann <Andrew.Baumann@microsoft.com>
Cc: "Philippe Mathieu-Daudé" <f4bug@amsat.org>
Cc: Jean-Christophe Dubois <jcd@tribudubois.net>
Cc: Alistair Francis <Alistair.Francis@wdc.com>
Cc: Bin Meng <bin.meng@windriver.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Artyom Tarasenko <atar4qemu@gmail.com>
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Cc: Michael Tokarev <mjt@tls.msk.ru>
Cc: Laurent Vivier <laurent@vivier.eu>
Cc: qemu-arm@nongnu.org
Cc: qemu-riscv@nongnu.org
Signed-off-by: Markus Armbruster <armbru@redhat.com>
Message-Id: <20211117163409.3587705-3-armbru@redhat.com>
---
 hw/arm/cubieboard.c        | 2 +-
 hw/arm/integratorcp.c      | 2 +-
 hw/arm/msf2-som.c          | 2 +-
 hw/arm/orangepi.c          | 2 +-
 hw/arm/raspi.c             | 2 +-
 hw/arm/realview.c          | 2 +-
 hw/arm/sabrelite.c         | 2 +-
 hw/misc/sifive_u_otp.c     | 4 ++--
 hw/riscv/microchip_pfsoc.c | 2 +-
 hw/riscv/sifive_u.c        | 2 +-
 hw/sparc64/niagara.c       | 2 +-
 11 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/hw/arm/cubieboard.c b/hw/arm/cubieboard.c
index 294ba5de6e..5e3372a3c7 100644
--- a/hw/arm/cubieboard.c
+++ b/hw/arm/cubieboard.c
@@ -81,7 +81,7 @@ static void cubieboard_init(MachineState *machine)
     }
 
     /* Retrieve SD bus */
-    di = drive_get_next(IF_SD);
+    di = drive_get(IF_SD, 0, 0);
     blk = di ? blk_by_legacy_dinfo(di) : NULL;
     bus = qdev_get_child_bus(DEVICE(a10), "sd-bus");
 
diff --git a/hw/arm/integratorcp.c b/hw/arm/integratorcp.c
index 16e8985953..b109ece3ae 100644
--- a/hw/arm/integratorcp.c
+++ b/hw/arm/integratorcp.c
@@ -649,7 +649,7 @@ static void integratorcp_init(MachineState *machine)
                           qdev_get_gpio_in_named(icp, ICP_GPIO_MMC_WPROT, 0));
     qdev_connect_gpio_out_named(dev, "card-inserted", 0,
                           qdev_get_gpio_in_named(icp, ICP_GPIO_MMC_CARDIN, 0));
-    dinfo = drive_get_next(IF_SD);
+    dinfo = drive_get(IF_SD, 0, 0);
     if (dinfo) {
         DeviceState *card;
 
diff --git a/hw/arm/msf2-som.c b/hw/arm/msf2-som.c
index 396e8b9913..d9f881690e 100644
--- a/hw/arm/msf2-som.c
+++ b/hw/arm/msf2-som.c
@@ -45,7 +45,7 @@ static void emcraft_sf2_s2s010_init(MachineState *machine)
     DeviceState *spi_flash;
     MSF2State *soc;
     MachineClass *mc = MACHINE_GET_CLASS(machine);
-    DriveInfo *dinfo = drive_get_next(IF_MTD);
+    DriveInfo *dinfo = drive_get(IF_MTD, 0, 0);
     qemu_irq cs_line;
     BusState *spi_bus;
     MemoryRegion *sysmem = get_system_memory();
diff --git a/hw/arm/orangepi.c b/hw/arm/orangepi.c
index 0cf9895ce7..e796382236 100644
--- a/hw/arm/orangepi.c
+++ b/hw/arm/orangepi.c
@@ -85,7 +85,7 @@ static void orangepi_init(MachineState *machine)
     qdev_realize(DEVICE(h3), NULL, &error_abort);
 
     /* Retrieve SD bus */
-    di = drive_get_next(IF_SD);
+    di = drive_get(IF_SD, 0, 0);
     blk = di ? blk_by_legacy_dinfo(di) : NULL;
     bus = qdev_get_child_bus(DEVICE(h3), "sd-bus");
 
diff --git a/hw/arm/raspi.c b/hw/arm/raspi.c
index 146d35382b..b4dd6c1e99 100644
--- a/hw/arm/raspi.c
+++ b/hw/arm/raspi.c
@@ -284,7 +284,7 @@ static void raspi_machine_init(MachineState *machine)
     qdev_realize(DEVICE(&s->soc), NULL, &error_fatal);
 
     /* Create and plug in the SD cards */
-    di = drive_get_next(IF_SD);
+    di = drive_get(IF_SD, 0, 0);
     blk = di ? blk_by_legacy_dinfo(di) : NULL;
     bus = qdev_get_child_bus(DEVICE(&s->soc), "sd-bus");
     if (bus == NULL) {
diff --git a/hw/arm/realview.c b/hw/arm/realview.c
index 1c54316ba3..ddc70b54a5 100644
--- a/hw/arm/realview.c
+++ b/hw/arm/realview.c
@@ -237,7 +237,7 @@ static void realview_init(MachineState *machine,
         qemu_irq_invert(qdev_get_gpio_in(gpio2, 0)));
     qdev_connect_gpio_out_named(dev, "card-read-only", 0, mmc_irq[0]);
     qdev_connect_gpio_out_named(dev, "card-inserted", 0, mmc_irq[1]);
-    dinfo = drive_get_next(IF_SD);
+    dinfo = drive_get(IF_SD, 0, 0);
     if (dinfo) {
         DeviceState *card;
 
diff --git a/hw/arm/sabrelite.c b/hw/arm/sabrelite.c
index 553608e583..cce49aa25c 100644
--- a/hw/arm/sabrelite.c
+++ b/hw/arm/sabrelite.c
@@ -76,7 +76,7 @@ static void sabrelite_init(MachineState *machine)
             if (spi_bus) {
                 DeviceState *flash_dev;
                 qemu_irq cs_line;
-                DriveInfo *dinfo = drive_get_next(IF_MTD);
+                DriveInfo *dinfo = drive_get(IF_MTD, 0, 0);
 
                 flash_dev = qdev_new("sst25vf016b");
                 if (dinfo) {
diff --git a/hw/misc/sifive_u_otp.c b/hw/misc/sifive_u_otp.c
index 52fdb750c0..6d5f84e6c2 100644
--- a/hw/misc/sifive_u_otp.c
+++ b/hw/misc/sifive_u_otp.c
@@ -209,9 +209,9 @@ static void sifive_u_otp_realize(DeviceState *dev, Error **errp)
                           TYPE_SIFIVE_U_OTP, SIFIVE_U_OTP_REG_SIZE);
     sysbus_init_mmio(SYS_BUS_DEVICE(dev), &s->mmio);
 
-    dinfo = drive_get_next(IF_PFLASH);
+    dinfo = drive_get(IF_PFLASH, 0, 0);
     if (!dinfo) {
-        dinfo = drive_get_next(IF_NONE);
+        dinfo = drive_get(IF_NONE, 0, 0);
         if (dinfo) {
             warn_report("using \"-drive if=none\" for the OTP is deprecated, "
                         "use \"-drive if=pflash\" instead.");
diff --git a/hw/riscv/microchip_pfsoc.c b/hw/riscv/microchip_pfsoc.c
index 57d779fb55..d1d065efbc 100644
--- a/hw/riscv/microchip_pfsoc.c
+++ b/hw/riscv/microchip_pfsoc.c
@@ -458,7 +458,7 @@ static void microchip_icicle_kit_machine_init(MachineState *machine)
     target_ulong firmware_end_addr, kernel_start_addr;
     uint64_t kernel_entry;
     uint32_t fdt_load_addr;
-    DriveInfo *dinfo = drive_get_next(IF_SD);
+    DriveInfo *dinfo = drive_get(IF_SD, 0, 0);
 
     /* Sanity check on RAM size */
     if (machine->ram_size < mc->default_ram_size) {
diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
index a4ecadaf12..aa74e67889 100644
--- a/hw/riscv/sifive_u.c
+++ b/hw/riscv/sifive_u.c
@@ -672,7 +672,7 @@ static void sifive_u_machine_init(MachineState *machine)
 
     /* Connect an SPI flash to SPI0 */
     flash_dev = qdev_new("is25wp256");
-    dinfo = drive_get_next(IF_MTD);
+    dinfo = drive_get(IF_MTD, 0, 0);
     if (dinfo) {
         qdev_prop_set_drive_err(flash_dev, "drive",
                                 blk_by_legacy_dinfo(dinfo),
diff --git a/hw/sparc64/niagara.c b/hw/sparc64/niagara.c
index f3e42d0326..ccad2c43a3 100644
--- a/hw/sparc64/niagara.c
+++ b/hw/sparc64/niagara.c
@@ -98,7 +98,7 @@ static void add_rom_or_fail(const char *file, const hwaddr addr)
 static void niagara_init(MachineState *machine)
 {
     NiagaraBoardState *s = g_new(NiagaraBoardState, 1);
-    DriveInfo *dinfo = drive_get_next(IF_PFLASH);
+    DriveInfo *dinfo = drive_get(IF_PFLASH, 0, 0);
     MemoryRegion *sysmem = get_system_memory();
 
     /* init CPUs */
-- 
2.31.1

