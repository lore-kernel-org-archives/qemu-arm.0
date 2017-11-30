Received: by 10.223.159.82 with SMTP id f18csp390293wrg;
        Thu, 30 Nov 2017 00:53:46 -0800 (PST)
X-Google-Smtp-Source: AGs4zMb1Mh0Q3XofU1uEwh/auqV650/CA8PuqYftLxQb3F4Gxk+u3iheb3rhW3WuogQWvvNvLpXe
X-Received: by 10.37.172.11 with SMTP id w11mr1086920ybi.254.1512032025990;
        Thu, 30 Nov 2017 00:53:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1512032025; cv=none;
        d=google.com; s=arc-20160816;
        b=kUUA2EJC663IWreF/d32sXQMdrcyBTMGSRTxpoH8CNx4B97NbtUP6vQ/onU+kaEr/Q
         K61YfTgfVsa2YL/RJa0xddO+47nrufVZFewRCcO3t3pKUVTq2zdCoPhPJV3vMbe4WPVY
         4z1iRbYUpSw7n4SHQszSPWT3Fq355zDr3oVvACaaeGTHIBLsHbj/i3UVvvrMl78fs68A
         yco7Cl0+IzMLNpN6YIKtiUHsxhSOHsNSBPHERW0ifg949iyU0WEePFUPz29i1GTxwbga
         dt5HpSKxCiyUZ2i32auuisAJRN7FHWAgDa5MK9xn86QsfqUqdagN9/1mhyYx3evDfSFd
         GAPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=RAw/1730RAGqiLBS8/LUVrSmYOiIbXx2DTnu7nTp7Dc=;
        b=zwrX1SJ9QiesQ/CXgwlDq69EY/4exi9GTBsdIUoWLGa0OcI9tGgE4XMWCPnZLfjDs7
         GGPvs7Ecp+186W0C6rWjIoTodn/bnfyXaW+J5AHSXnUGqEWVN/J4X8ZQ/HYui9ny1I+4
         /oT2gVq/xpWD1AS3qvsoQvsfICgysNYhIWO2E+rDAFvHXdpV3Z+mHyxaBs8F52x2e+tn
         8VlZX8Mb2Go21SlH7+cylL5/1xigp+otPI0vxNJ/SnWwwnOBQvpt/OwhriGCFjiTsE4e
         +ShTI6JR+1CmKpBV2shktJfTWeLjFjA5VnH5p6dQ10nKczot2GUeV555j1CpU1FKjnY4
         Z6lg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l13si711398ywm.797.2017.11.30.00.53.45
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 30 Nov 2017 00:53:45 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:46857 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eKKbJ-0005Mr-B3
	for alex.bennee@linaro.org; Thu, 30 Nov 2017 03:53:45 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49101)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1eKKb4-0005IB-7Z
	for qemu-arm@nongnu.org; Thu, 30 Nov 2017 03:53:31 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1eKKb3-0006t4-C6
	for qemu-arm@nongnu.org; Thu, 30 Nov 2017 03:53:30 -0500
Received: from mx1.redhat.com ([209.132.183.28]:32948)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1eKKb3-0006sU-5p; Thu, 30 Nov 2017 03:53:29 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2C9884A6F3;
	Thu, 30 Nov 2017 08:53:28 +0000 (UTC)
Received: from thh440s.redhat.com (ovpn-116-158.ams2.redhat.com
	[10.36.116.158])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5311E5D6A9;
	Thu, 30 Nov 2017 08:53:25 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Date: Thu, 30 Nov 2017 09:53:06 +0100
Message-Id: <1512031988-32490-6-git-send-email-thuth@redhat.com>
In-Reply-To: <1512031988-32490-1-git-send-email-thuth@redhat.com>
References: <1512031988-32490-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Thu, 30 Nov 2017 08:53:28 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH for-2.12 5/7] hw/moxie/moxiesim: Add support for
 loading a BIOS on moxiesim
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Anthony Green <green@moxielogic.com>, Laurent Vivier <laurent@vivier.eu>,
	qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: o0Pm4hrvoOh+

The moxiesim machine already defines a memory region for a firmware,
but does not provide the possibility to load an image via "-bios" yet.
This will be needed for the boot-serial tester, so let's add support
for "-bios" here now.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 hw/moxie/moxiesim.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/hw/moxie/moxiesim.c b/hw/moxie/moxiesim.c
index 3ba5848..00f56df 100644
--- a/hw/moxie/moxiesim.c
+++ b/hw/moxie/moxiesim.c
@@ -25,6 +25,7 @@
  * THE SOFTWARE.
  */
 #include "qemu/osdep.h"
+#include "qemu/error-report.h"
 #include "qapi/error.h"
 #include "qemu-common.h"
 #include "cpu.h"
@@ -41,6 +42,8 @@
 #include "elf.h"
 
 #define PHYS_MEM_BASE 0x80000000
+#define FIRMWARE_BASE 0x1000
+#define FIRMWARE_SIZE (128 * 0x1000)
 
 typedef struct {
     uint64_t ram_size;
@@ -123,8 +126,8 @@ static void moxiesim_init(MachineState *machine)
     memory_region_init_ram(ram, NULL, "moxiesim.ram", ram_size, &error_fatal);
     memory_region_add_subregion(address_space_mem, ram_base, ram);
 
-    memory_region_init_ram(rom, NULL, "moxie.rom", 128 * 0x1000, &error_fatal);
-    memory_region_add_subregion(get_system_memory(), 0x1000, rom);
+    memory_region_init_ram(rom, NULL, "moxie.rom", FIRMWARE_SIZE, &error_fatal);
+    memory_region_add_subregion(get_system_memory(), FIRMWARE_BASE, rom);
 
     if (kernel_filename) {
         loader_params.ram_size = ram_size;
@@ -133,6 +136,11 @@ static void moxiesim_init(MachineState *machine)
         loader_params.initrd_filename = initrd_filename;
         load_kernel(cpu, &loader_params);
     }
+    if (bios_name) {
+        if (load_image_targphys(bios_name, FIRMWARE_BASE, FIRMWARE_SIZE) < 0) {
+            error_report("Failed to load firmware '%s'", bios_name);
+        }
+    }
 
     /* A single 16450 sits at offset 0x3f8.  */
     if (serial_hds[0]) {
-- 
1.8.3.1

