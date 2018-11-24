Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp3069027wrt;
        Sat, 24 Nov 2018 00:48:58 -0800 (PST)
X-Google-Smtp-Source: AFSGD/UurMobD5H9Ugt+Vie9eDAWgY50VEg82KPh5ZSfjq690/fmaJvxyos/8ymal0JoEV91gv+O
X-Received: by 2002:a25:a28a:: with SMTP id c10-v6mr19805419ybi.283.1543049338081;
        Sat, 24 Nov 2018 00:48:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1543049338; cv=none;
        d=google.com; s=arc-20160816;
        b=j5iKsNsscOU+kVxi5GZ+9n+jupqbD23Dyoda+MIDUh+vPiSeOaAllgWDpkvHRV/qvG
         9vrNIRFl7aPkwE/5t6TM7Of9+1ON46MdPBLOnr0OnYWKYs6OD79lIcsq5iRISDPWTyba
         DNB8c8K7tWVR94sHwyB/XA5I2VDBxd//JqePungw7s8dHi1IRH6mVZVC7M0WyeUX/gEo
         erW3MWlBABbEJYAW5uysm4qDJPT9qe8gBCIZ+hBkZH2UDeco88hELls5xoO1uFKs9iuO
         IedOzq52h8BKc6noj8U0JptNU+GCsHidAQO3cnXyragl7ywVR3j4ZRGiT5oZGyi6g3ja
         6Asw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from;
        bh=ABB6jf/ROQXuHiaOtkiE6mtF0wpa33YHlOZsQNzTSFQ=;
        b=dQn31AWAEBfci4CCWPn5rPg9uXq4eRenaZhBHtPy3c5MqKqG5SnJD9BwHU/u/upZ70
         Kz2t+82A8bEjJyO4ik0Y59tML44p9IddQFbaRNx0hDFvVLNPHcdAM5hCsSMjhOqG0tl5
         Iq7HJ/N0nCVGqorNHgdAIL2TGjXQ7vOX5vyAZdjx/bmG0e5kLTQtoKQUlSuZyv/ajSAF
         kCKrEKjut2mLSbrxGtGZU+m2WknrXgn7rT3Nrp68doTPv2gD6HSseRnMETjgFooNGWNy
         6h+nPzl4ydbu41fSrOjvDx5i2e0cD7HJMhtYcBgcE8UAA9P+K+Mou/IqTNX07FDN90ac
         QxaA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 203-v6si25644028ywt.97.2018.11.24.00.48.57
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 24 Nov 2018 00:48:58 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:55747 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gQTcX-0002OG-Hp
	for alex.bennee@linaro.org; Sat, 24 Nov 2018 03:48:57 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52498)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peng.hao2@zte.com.cn>) id 1gQTUI-0002Xf-E0
	for qemu-devel@nongnu.org; Sat, 24 Nov 2018 03:40:27 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peng.hao2@zte.com.cn>) id 1gQTSb-0000JH-Ld
	for qemu-devel@nongnu.org; Sat, 24 Nov 2018 03:38:42 -0500
Received: from out1.zte.com.cn ([202.103.147.172]:55512 helo=mxct.zte.com.cn)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <peng.hao2@zte.com.cn>)
	id 1gQTSa-0000D6-4R; Sat, 24 Nov 2018 03:38:40 -0500
Received: from mse01.zte.com.cn (unknown [10.30.3.20])
	by Forcepoint Email with ESMTPS id 184FC236DF3C00419A98;
	Sat, 24 Nov 2018 16:38:38 +0800 (CST)
Received: from notes_smtp.zte.com.cn ([10.30.1.239])
	by mse01.zte.com.cn with ESMTP id wAO8cUHq035026;
	Sat, 24 Nov 2018 16:38:30 +0800 (GMT-8)
	(envelope-from peng.hao2@zte.com.cn)
Received: from localhost.localdomain.localdomain ([10.74.120.59])
	by szsmtp06.zte.com.cn (Lotus Domino Release 8.5.3FP6)
	with ESMTP id 2018112416391651-12702403 ;
	Sat, 24 Nov 2018 16:39:16 +0800 
From: Peng Hao <peng.hao2@zte.com.cn>
To: peter.maydell@linaro.org, drjones@redhat.com, philmd@redhat.com
Date: Sun, 25 Nov 2018 01:00:16 +0800
Message-Id: <1543078821-16636-6-git-send-email-peng.hao2@zte.com.cn>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1543078821-16636-1-git-send-email-peng.hao2@zte.com.cn>
References: <1543078821-16636-1-git-send-email-peng.hao2@zte.com.cn>
X-MIMETrack: Itemize by SMTP Server on SZSMTP06/server/zte_ltd(Release
	8.5.3FP6|November 21, 2013) at 2018-11-24 16:39:16,
	Serialize by Router on notes_smtp/zte_ltd(Release 9.0.1FP7|August  17,
	2016) at 2018-11-24 16:38:10,
	Serialize complete at 2018-11-24 16:38:10
X-MAIL: mse01.zte.com.cn wAO8cUHq035026
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 202.103.147.172
Subject: [Qemu-devel] [PATCH V8 05/10] hw/arm/virt: Use the pvpanic device
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
Cc: Peng Hao <peng.hao2@zte.com.cn>, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: O0RarSC1fxV0

Add pvpanic device in arm virt machine.

Signed-off-by: Peng Hao <peng.hao2@zte.com.cn>
---
 default-configs/arm-softmmu.mak |  1 +
 hw/arm/virt.c                   | 22 ++++++++++++++++++++++
 include/hw/arm/virt.h           |  1 +
 3 files changed, 24 insertions(+)

diff --git a/default-configs/arm-softmmu.mak b/default-configs/arm-softmmu.mak
index 2420491..50345df 100644
--- a/default-configs/arm-softmmu.mak
+++ b/default-configs/arm-softmmu.mak
@@ -159,3 +159,4 @@ CONFIG_PCI_DESIGNWARE=y
 CONFIG_STRONGARM=y
 CONFIG_HIGHBANK=y
 CONFIG_MUSICPAL=y
+CONFIG_PVPANIC=y
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index a2b8d8f..899131a 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -59,6 +59,7 @@
 #include "qapi/visitor.h"
 #include "standard-headers/linux/input.h"
 #include "hw/arm/smmuv3.h"
+#include "hw/misc/pvpanic.h"
 
 #define DEFINE_VIRT_MACHINE_LATEST(major, minor, latest) \
     static void virt_##major##_##minor##_class_init(ObjectClass *oc, \
@@ -143,6 +144,7 @@ static const MemMapEntry a15memmap[] = {
     [VIRT_GPIO] =               { 0x09030000, 0x00001000 },
     [VIRT_SECURE_UART] =        { 0x09040000, 0x00001000 },
     [VIRT_SMMU] =               { 0x09050000, 0x00020000 },
+    [VIRT_PVPANIC] =            { 0x09070000, 0x00000002 },
     [VIRT_MMIO] =               { 0x0a000000, 0x00000200 },
     /* ...repeating for a total of NUM_VIRTIO_TRANSPORTS, each of that size */
     [VIRT_PLATFORM_BUS] =       { 0x0c000000, 0x02000000 },
@@ -190,6 +192,24 @@ static bool cpu_type_valid(const char *cpu)
     return false;
 }
 
+static void create_pvpanic_device(const VirtMachineState *vms)
+{
+     char *nodename;
+     hwaddr base = vms->memmap[VIRT_PVPANIC].base;
+     hwaddr size = vms->memmap[VIRT_PVPANIC].size;
+
+     sysbus_create_simple(TYPE_PVPANIC_MMIO, base, NULL);
+
+     nodename = g_strdup_printf("/pvpanic-mmio@%" PRIx64, base);
+     qemu_fdt_add_subnode(vms->fdt, nodename);
+     qemu_fdt_setprop_string(vms->fdt, nodename,
+                             "compatible", "qemu,pvpanic-mmio");
+     qemu_fdt_setprop_sized_cells(vms->fdt, nodename, "reg",
+                                  2, base, 2, size);
+
+     g_free(nodename);
+}
+
 static void create_fdt(VirtMachineState *vms)
 {
     void *fdt = create_device_tree(&vms->fdt_size);
@@ -1531,6 +1551,8 @@ static void machvirt_init(MachineState *machine)
 
     create_flash(vms, sysmem, secure_sysmem ? secure_sysmem : sysmem);
 
+    create_pvpanic_device(vms);
+
     create_gic(vms, pic);
 
     fdt_add_pmu_nodes(vms);
diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
index 4cc57a7..937c124 100644
--- a/include/hw/arm/virt.h
+++ b/include/hw/arm/virt.h
@@ -66,6 +66,7 @@ enum {
     VIRT_GIC_REDIST,
     VIRT_GIC_REDIST2,
     VIRT_SMMU,
+    VIRT_PVPANIC,
     VIRT_UART,
     VIRT_MMIO,
     VIRT_RTC,
-- 
1.8.3.1

