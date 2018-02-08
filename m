Received: by 10.28.71.27 with SMTP id u27csp1606196wma;
        Wed, 7 Feb 2018 21:54:17 -0800 (PST)
X-Google-Smtp-Source: AH8x226vIhmBJ1WnCiyP9WMmgBhdn2qMfWVB6Np+1spALD97aU4OX/TodwHocrqzO3YpuKH7Mvkx
X-Received: by 10.13.245.193 with SMTP id e184mr5524674ywf.410.1518069257090;
        Wed, 07 Feb 2018 21:54:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1518069257; cv=none;
        d=google.com; s=arc-20160816;
        b=Un5m2vNcY0qu4vjq0nHR6aylk9zWBUpSrjTmXd8zxprVVhOelGhSqfedevlh10Diq2
         iAWG+hJmRkcAoxnFobmBOn65DCiT/P52al+FlzaxdGD9NMUUcIiITNIL/ls12hi8xKMb
         H+z9eK5+4Q7Etibt6g0YfnstpY8Rt5vKkHSAc5RlnmsD5As19yjo3U3Pyn/WDkQibAS1
         TUUVPljiZ97Lr9AGXiw9T+LCYvMl9OtyDs8ub8HR+hIckoFfOClIyBBciGn34we48d96
         siYhkHRPxHV8/B1UgckHdLvi42/xgDuWg41DPnvAzRcaegDzVBd9NPnfYlcx6BFNKbM4
         ELQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=gsI41yUflBN/sQ70WetF37+jFA+IW07JvL0bXId/0rQ=;
        b=KKqghnHu4NiZSZAMnSsgW+NmKuOtlq0teKHqiVhK7O3wgADoyo8mIDfJCVYhLj1Bov
         kSdiyfCd9wKkGAXpsTH1VwPYcZSeI86JxqL/IkjuQGBb0uVwMbMJEkIpQ1+B86F4SfaG
         MfRsWj5Y9hFarI5KSOE2fIVBJKma5d0anaVmLeY7CkemFOGwdOSKq4pfY559KEce3T58
         vFrqpsG7vPYPb7dPWUT95TGnFA9ZBdZqEnGJk46UOzW3/fN+0jtYjC/t7o0igQt6e78y
         Fn+J20YZkHqKvkh/n+0RD7YW6T3jGqu6C6Y7Vp2pRY48JNTQggkLSN539EhX5ZawWa2b
         +WmA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=ohQr8nhY;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k30si534111ywh.539.2018.02.07.21.54.16
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 07 Feb 2018 21:54:17 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=ohQr8nhY;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:47658 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ejfA0-0003Y9-Ir
	for alex.bennee@linaro.org; Thu, 08 Feb 2018 00:54:16 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50630)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <penberg@gmail.com>) id 1ejf7E-0001sc-3u
	for qemu-devel@nongnu.org; Thu, 08 Feb 2018 00:51:25 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <penberg@gmail.com>) id 1ejf7C-0000QL-S7
	for qemu-devel@nongnu.org; Thu, 08 Feb 2018 00:51:24 -0500
Received: from mail-lf0-x243.google.com ([2a00:1450:4010:c07::243]:36227)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <penberg@gmail.com>)
	id 1ejf7C-0000Pq-GM; Thu, 08 Feb 2018 00:51:22 -0500
Received: by mail-lf0-x243.google.com with SMTP id t79so4722471lfe.3;
	Wed, 07 Feb 2018 21:51:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=gsI41yUflBN/sQ70WetF37+jFA+IW07JvL0bXId/0rQ=;
	b=ohQr8nhYx3cYzMZd1grGvIpmbPD8W+G0s3IzRJWG9Q5pvn0MAkYhEdxWdkKz/F3oh7
	8FpGZ4l1lfjsrG6JAeEAoSDP77Hm21zIMcf6Yn7nY4pMe7XL267SCUDqr+Jrw9P00fNF
	TzXRW96ctpUB03MzHPA6ga3uO/fWSTJxoEnUfUqT06V/8HXpgjEFxMn7OLC/NsS3RAbw
	OrqZMIFaD/NtTo7TJnaOm7j1IoAzGR/mh/b/qjpxqmI4VWi71OmT5WZpYl0QsCc2Pfh+
	tu4UxNqwlw/fjieCoF1dQwjgIR3JZEX/ch5uG2BF+DUGivPuUsLFqa3Z810VjEVKLcd3
	/5tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=gsI41yUflBN/sQ70WetF37+jFA+IW07JvL0bXId/0rQ=;
	b=Xqnar8FpBPojt7oWBRN0iP9cmL23/x7yUSp8Kxj6zagvaavASrn8/y1IY/whYQ2PA9
	bK9y09ifG6LqZHhP06T6FNGh3V9UsFBD4TCjlmff8/4owCoIESITa546k0s/6EpcnGVE
	Fna4sCpsvAtU8x13F8PSyVNO3Zf02tdLGVkZuyLWVLzUIdIYAvNpoqOqZ+TPun+k+NZg
	H3YrfhQP4OaQ6DGkkaUEIFJo5KldOdwaDhJemhvTreeJ+QtJDYDuSM7tsjaw75AKmIuV
	GX4PASMdNlz1WlHzMcuEQQUeJ+9fkX+mM4/8ZZRBY0fpSyF8FhTna1qHMTnTJIc7+mT0
	FJ5g==
X-Gm-Message-State: APf1xPCpo4lfWyBYMAANhSWsmy0y/39kGuVgaitYQ+5gb69aYlShtKpR
	+hUK20r2LrnbRkh4y8Nys3v1d0Nm
X-Received: by 10.25.216.233 with SMTP id r102mr6127077lfi.139.1518069080839; 
	Wed, 07 Feb 2018 21:51:20 -0800 (PST)
Received: from localhost.localdomain (81-175-247-183.bb.dnainternet.fi.
	[81.175.247.183])
	by smtp.gmail.com with ESMTPSA id u24sm222525lje.5.2018.02.07.21.51.19
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 07 Feb 2018 21:51:20 -0800 (PST)
From: Pekka Enberg <penberg@iki.fi>
To: qemu-devel@nongnu.org
Date: Thu,  8 Feb 2018 07:50:38 +0200
Message-Id: <20180208055039.24666-3-penberg@iki.fi>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180208055039.24666-1-penberg@iki.fi>
References: <20180208055039.24666-1-penberg@iki.fi>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4010:c07::243
Subject: [Qemu-devel] [PATCH v1 2/3] raspi: Raspberry Pi 3 support
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org,
	Pekka Enberg <penberg@iki.fi>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: bdodsQ04fUWm

This patch adds Raspberry Pi 3 support to hw/arm/raspi.c. The
differences to Pi 2 are:

 - Firmware address
 - Board ID
 - Board revision

The CPU is different too, but that's going to be configured as part of
the machine default CPU when we introduce a new machine type.

The patch was written from scratch by me but the logic is similar to
Zoltán Baldaszti's previous work, which I used as a reference (with
permission from the author):

  https://github.com/bztsrc/qemu-raspi3

Signed-off-by: Pekka Enberg <penberg@iki.fi>
---
 hw/arm/raspi.c | 31 +++++++++++++++++++++----------
 1 file changed, 21 insertions(+), 10 deletions(-)

diff --git a/hw/arm/raspi.c b/hw/arm/raspi.c
index c24a4a1b14..66fe10e376 100644
--- a/hw/arm/raspi.c
+++ b/hw/arm/raspi.c
@@ -5,6 +5,9 @@
  * Rasperry Pi 2 emulation Copyright (c) 2015, Microsoft
  * Written by Andrew Baumann
  *
+ * Raspberry Pi 3 emulation Copyright (c) 2018 Zoltán Baldaszti
+ * Upstream code cleanup (c) 2018 Pekka Enberg 
+ *
  * This code is licensed under the GNU GPLv2 and later.
  */
 
@@ -22,10 +25,11 @@
 #define SMPBOOT_ADDR    0x300 /* this should leave enough space for ATAGS */
 #define MVBAR_ADDR      0x400 /* secure vectors */
 #define BOARDSETUP_ADDR (MVBAR_ADDR + 0x20) /* board setup code */
-#define FIRMWARE_ADDR   0x8000 /* Pi loads kernel.img here by default */
+#define FIRMWARE_ADDR_2 0x8000 /* Pi 2 loads kernel.img here by default */
+#define FIRMWARE_ADDR_3 0x80000 /* Pi 3 loads kernel.img here by default */
 
 /* Table of Linux board IDs for different Pi versions */
-static const int raspi_boardid[] = {[1] = 0xc42, [2] = 0xc43};
+static const int raspi_boardid[] = {[1] = 0xc42, [2] = 0xc43, [3] = 0xc44};
 
 typedef struct RasPiState {
     BCM2836State soc;
@@ -83,8 +87,8 @@ static void setup_boot(MachineState *machine, int version, size_t ram_size)
     binfo.secure_board_setup = true;
     binfo.secure_boot = true;
 
-    /* Pi2 requires SMP setup */
-    if (version == 2) {
+    /* Pi2 and Pi3 requires SMP setup */
+    if (version >= 2) {
         binfo.smp_loader_start = SMPBOOT_ADDR;
         binfo.write_secondary_boot = write_smpboot;
         binfo.secondary_cpu_reset_hook = reset_secondary;
@@ -94,15 +98,16 @@ static void setup_boot(MachineState *machine, int version, size_t ram_size)
      * the normal Linux boot process
      */
     if (machine->firmware) {
+        hwaddr firmware_addr = version == 3 ? FIRMWARE_ADDR_3 : FIRMWARE_ADDR_2;
         /* load the firmware image (typically kernel.img) */
-        r = load_image_targphys(machine->firmware, FIRMWARE_ADDR,
-                                ram_size - FIRMWARE_ADDR);
+        r = load_image_targphys(machine->firmware, firmware_addr,
+                                ram_size - firmware_addr);
         if (r < 0) {
             error_report("Failed to load firmware from %s", machine->firmware);
             exit(1);
         }
 
-        binfo.entry = FIRMWARE_ADDR;
+        binfo.entry = firmware_addr;
         binfo.firmware_loaded = true;
     } else {
         binfo.kernel_filename = machine->kernel_filename;
@@ -113,7 +118,7 @@ static void setup_boot(MachineState *machine, int version, size_t ram_size)
     arm_load_kernel(ARM_CPU(first_cpu), &binfo);
 }
 
-static void raspi2_init(MachineState *machine)
+static void raspi_init(MachineState *machine, int version)
 {
     RasPiState *s = g_new0(RasPiState, 1);
     uint32_t vcram_size;
@@ -139,7 +144,8 @@ static void raspi2_init(MachineState *machine)
                             &error_abort);
     object_property_set_int(OBJECT(&s->soc), smp_cpus, "enabled-cpus",
                             &error_abort);
-    object_property_set_int(OBJECT(&s->soc), 0xa21041, "board-rev",
+    int board_rev = version == 3 ? 0xa02082 : 0xa21041;
+    object_property_set_int(OBJECT(&s->soc), board_rev, "board-rev",
                             &error_abort);
     object_property_set_bool(OBJECT(&s->soc), true, "realized", &error_abort);
 
@@ -157,7 +163,12 @@ static void raspi2_init(MachineState *machine)
 
     vcram_size = object_property_get_uint(OBJECT(&s->soc), "vcram-size",
                                           &error_abort);
-    setup_boot(machine, 2, machine->ram_size - vcram_size);
+    setup_boot(machine, version, machine->ram_size - vcram_size);
+}
+
+static void raspi2_init(MachineState *machine)
+{
+    raspi_init(machine, 2);
 }
 
 static void raspi2_machine_init(MachineClass *mc)
-- 
2.14.3

