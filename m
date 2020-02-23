Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp4421030lfg;
        Sun, 23 Feb 2020 15:25:44 -0800 (PST)
X-Google-Smtp-Source: APXvYqy40+/xXbVE/tY6F68sO1p0aUw+V+VnokI+XBt/aB9wlLOBKWtPlnFo+WgJnqOnaZ8GAhrA
X-Received: by 2002:a05:620a:579:: with SMTP id p25mr44182738qkp.291.1582500344055;
        Sun, 23 Feb 2020 15:25:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582500344; cv=none;
        d=google.com; s=arc-20160816;
        b=sOCFCRcoTAs2GjoxmrV4XFIlk2DAfu5bLh9Cn0e8/bPXoO4jWfn/Bz+E2ROmveLsZH
         7KmoxP4RPSAcXLd9mz1+Ejltk7R/PSd+IYlh0jdVNr7DZfm4OG8c+WF8YPxHxNihu2Hl
         ImjxZNgpulZyPXVyK/2hR4XQm59eapSRjtR1JoyNRvhHZORgf4tCvd0jnUsJNujWt8Cc
         VU0Ma4qNpOSggkXf4VWo68VW3wjQCmbPTDjFipVjJWUxGWmNpdn5M5TVTGpCJ6PJCRNY
         mVsnI/s2AhyEbTD2VzSQ4mrfYpo+/QzZdcHauJ2GAE7CxnIeNTpfsW93V0BW1srFs8hr
         190g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=jQ/nivgBhDk2dNshKSoYmy6PiOFeo1QcTqHsAm3j+KM=;
        b=EZlaLhm2axzHzuWxyVQ3H76cFUTc9/q9aDiK6oTVvG0hqAxJ9g5RUhHCe+LftH8XAr
         T6zBxw0igllTFfsps8Cq1EUxc6W9GTXdnfCoAuCjSU7S1tC13knHbNVu4VF3+hcEJZ1m
         gzm8gX4yJmKD617u9nJV13bcouAFY2RxI7kF5HnJjsSnZl5i3hFbqFSZephhVnkdfj5S
         YhmDTrr5yLx6ap5p+nZVpbMc/IeoN+8fs7u3Rpb+8+lcRXwhWLOChWUQipza+sOUHMHP
         PIlOoQdV4QTsjYjjitAl7/SPIoFJg1BZNzFbUZpwf84ZOV19EPL0V4ZHnCysl+l9qpfP
         bt4w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=FzpVnskh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q10si5303536qkc.98.2020.02.23.15.25.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 23 Feb 2020 15:25:44 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=FzpVnskh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:57736 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j60d5-0005q2-Fc
	for alex.bennee@linaro.org; Sun, 23 Feb 2020 18:25:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37680)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1j60cr-0005lV-3t
 for qemu-arm@nongnu.org; Sun, 23 Feb 2020 18:25:32 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1j60cp-0004Oi-2A
 for qemu-arm@nongnu.org; Sun, 23 Feb 2020 18:25:28 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:46020
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1j60co-0004OS-VT
 for qemu-arm@nongnu.org; Sun, 23 Feb 2020 18:25:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582500326;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jQ/nivgBhDk2dNshKSoYmy6PiOFeo1QcTqHsAm3j+KM=;
 b=FzpVnskhukP2CdxD3KqRmbp6cdpjWPlV4YzM+1HCokqiGDIpMt4KK1ZFLt3qyN8/eUevhm
 J1wiWbjcdnHx1NoxwpkWYVN5GgimZV4CHrl2a/nm95p6v+H311oUyMIi/lplEKCzwo1MDt
 ws88Cdg3Bu43940D9C6MZVa/pgQVFLY=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-37-lAFdUxwhM7Som9Bm-Bqbtw-1; Sun, 23 Feb 2020 18:25:22 -0500
X-MC-Unique: lAFdUxwhM7Som9Bm-Bqbtw-1
Received: by mail-wr1-f71.google.com with SMTP id d9so1438556wrv.21
 for <qemu-arm@nongnu.org>; Sun, 23 Feb 2020 15:25:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4QI6nH65BLHK26fGTFWTCKLvnsXl/KsAvAgD7fRuHX8=;
 b=Nn77/jAh2yeKToiO9UUgEjerroS3qhQZG6SI6+j692j8vO5CRqS5qyfSrusdMA1Cnf
 gaPAhyQK8t+4ervEAy5/QcNbdGYRsGBDvI59jeQlM6eYxFxTKaFC/74uveAgNQgKyddX
 6+7bVw8dpQg700fypDjFMlL6HShuzbK06ETyMH54GNPL93ZfTCOJh9xyWM5SoCCQ3XEg
 B8tq1T3NJncJnGyZ3Q42MUkkLe1i9Gaji/Q34Bm/CYALItNJaEoEjsFP7tnlZ2q+8zTU
 v8i123H6OcajdqttO1m6qfMu239bLirtC22w5XKLyLKfDMKz5NAPNHorHVvyI85JImS1
 0/eg==
X-Gm-Message-State: APjAAAVzpWIyJJPdjBfminrPcfoOpyOy9BJi6AKDKXMRDQlmZVvbW3ot
 Fe0dSFvPogEH259wig5kv7Wdee/zRgflLsb5Ity65tIwXQaOdP+kfkkwt9OZlUcUS/zf+VjcnQ/
 3FctdL4iW1jCu
X-Received: by 2002:a7b:ce0b:: with SMTP id m11mr18489561wmc.4.1582500321325; 
 Sun, 23 Feb 2020 15:25:21 -0800 (PST)
X-Received: by 2002:a7b:ce0b:: with SMTP id m11mr18489552wmc.4.1582500321111; 
 Sun, 23 Feb 2020 15:25:21 -0800 (PST)
Received: from localhost.localdomain (47.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.47])
 by smtp.gmail.com with ESMTPSA id c9sm15671102wrq.44.2020.02.23.15.25.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Feb 2020 15:25:20 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 2/2] hw/arm/integratorcp: Map a CFI parallel flash
Date: Mon, 24 Feb 2020 00:25:16 +0100
Message-Id: <20200223232516.13802-3-philmd@redhat.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200223232516.13802-1-philmd@redhat.com>
References: <20200223232516.13802-1-philmd@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: iocWJzAgWdm+

From: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

The Linux kernel displays errors why trying to detect the flash:

  Linux version 4.16.0 (linus@genomnajs) (gcc version 7.2.1 20171011 (Linar=
o GCC 7.2-2017.11)) #142 PREEMPT Wed May 9 13:24:55 CEST 2018
  CPU: ARM926EJ-S [41069265] revision 5 (ARMv5TEJ), cr=3D00093177
  CPU: VIVT data cache, VIVT instruction cache
  OF: fdt: Machine model: ARM Integrator/CP
  ...
  of-flash 24000000.flash: Integrator/CP flash protection
  of-flash 24000000.flash: do_map_probe() failed for type cfi_probe
  of-flash 24000000.flash: do_map_probe() failed

Since we have a CFI pflash model available, wire it.
The kernel properly detects it:

  of-flash 24000000.flash: Integrator/CP flash protection
  24000000.flash: Found 1 x32 devices at 0x0 in 32-bit bank. Manufacturer I=
D 0x000000 Chip ID 0x000000
  Intel/Sharp Extended Query Table at 0x0031
  Using buffer write method

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
---
RFC because I have no idea of the flash model, its ID code, and which
default CFI family (1 or 2).
---
 hw/arm/integratorcp.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/hw/arm/integratorcp.c b/hw/arm/integratorcp.c
index 59804140cd..40cedfd55a 100644
--- a/hw/arm/integratorcp.c
+++ b/hw/arm/integratorcp.c
@@ -8,6 +8,7 @@
  */
=20
 #include "qemu/osdep.h"
+#include "qemu/units.h"
 #include "qapi/error.h"
 #include "cpu.h"
 #include "hw/sysbus.h"
@@ -24,6 +25,7 @@
 #include "hw/char/pl011.h"
 #include "hw/hw.h"
 #include "hw/irq.h"
+#include "hw/block/flash.h"
=20
 #define TYPE_INTEGRATOR_CM "integrator_core"
 #define INTEGRATOR_CM(obj) \
@@ -589,6 +591,7 @@ static void integratorcp_init(MachineState *machine)
     MemoryRegion *ram_alias =3D g_new(MemoryRegion, 1);
     qemu_irq pic[32];
     DeviceState *dev, *sic, *icp;
+    DriveInfo *dinfo;
     int i;
=20
     cpuobj =3D object_new(machine->cpu_type);
@@ -646,6 +649,14 @@ static void integratorcp_init(MachineState *machine)
                           qdev_get_gpio_in_named(icp, ICP_GPIO_MMC_CARDIN,=
 0));
     sysbus_create_varargs("pl041", 0x1d000000, pic[25], NULL);
=20
+    dinfo =3D drive_get(IF_PFLASH, 0, 0);
+    if (!pflash_cfi01_register(0x24000000, "pflash", 16 * MiB,
+                               dinfo ? blk_by_legacy_dinfo(dinfo) : NULL,
+                               64 * KiB, 4, 0, 0, 0, 0, 0)) {
+        error_report("Error registering flash memory");
+        exit(1);
+    }
+
     if (nd_table[0].used)
         smc91c111_init(&nd_table[0], 0xc8000000, pic[27]);
=20
--=20
2.21.1

