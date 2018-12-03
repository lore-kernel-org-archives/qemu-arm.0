Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp6646756wrt;
        Mon, 3 Dec 2018 03:04:47 -0800 (PST)
X-Google-Smtp-Source: AFSGD/VNargn1G0mFCWNaf79uAjjoqw/D+z0ASoCQrDNeFq5vrDaj75dlFRKSGWfOmqSxTq+65Rp
X-Received: by 2002:a81:2848:: with SMTP id o69mr15603878ywo.225.1543835087500;
        Mon, 03 Dec 2018 03:04:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1543835087; cv=none;
        d=google.com; s=arc-20160816;
        b=EUSuAt/HVCdAYKGp6XDETNCaYyqiz0Xl4At5yjoWmPuZJlGDFWzl+tX3Uxwkzz5eEM
         8k740p4N/iFozzqw376T2W/W2C8ABt6tgo3+KGclgYZX+luoUXI0JvlSWPZF9W0uypWO
         ASJUa2m1OpV6fLD9vLDe+61i6blp4+pxq5JX3vKn3rNjAqeTgPQ/oLsGzED5o9jKg3S7
         XybRka4QZ5QWIbVvrlWhiXpt4ORidxQuczsNCKjJuFCmTMLG7v3BTUpxFKmTpOBSF5VR
         sHcExA4wusgJYcbj0+wc0gpv07XjxXfFHL/wfOakpDGSl8gNl/zLvuseJSSK5DnO822/
         9C0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from;
        bh=TbLSgXZURnf1Ew2SPdv+KkmZ1Uzo27/zhL6dz300zaw=;
        b=X8fiJxSKFMY5Ehv0iH2I/eC9tVji2R+SYJWPiBNjT2SckeRt/kR9e/HsWaJ61W87vw
         lyEYg+40rJ7EIql6gsmMSACgMNvsp5bzOcQleYAa3c1g42oKXrXHYXR6q9iLB1ZAmdyb
         Sco0x0RosmrgKX32uqgj2+4dQmpDh02nekFOs4webcvuU5vWrEHQA/P1L16EgsAHdhFm
         Tb1zuWdBnXhDh7wxdhWNfyEIa7PSir7Wm9nwlvW/o4x0gS2NP0TUqlyXwSofJIyUFasS
         CVI6eCUapAj5HyLJE58j7bPX5+3MGXgpBqe+hj1w29FsB52eXyHmhrq5TpIwFjEY7WIE
         K9yQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m18-v6si7847775ybm.95.2018.12.03.03.04.47
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 03 Dec 2018 03:04:47 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:47938 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gTm1u-00048G-T3
	for alex.bennee@linaro.org; Mon, 03 Dec 2018 06:04:46 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51773)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peng.hao2@zte.com.cn>) id 1gTm1f-00045U-A5
	for qemu-arm@nongnu.org; Mon, 03 Dec 2018 06:04:33 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peng.hao2@zte.com.cn>) id 1gTm1c-0002Zh-6B
	for qemu-arm@nongnu.org; Mon, 03 Dec 2018 06:04:31 -0500
Received: from mxhk.zte.com.cn ([63.217.80.70]:20014)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <peng.hao2@zte.com.cn>)
	id 1gTm1b-0002U7-RW; Mon, 03 Dec 2018 06:04:28 -0500
Received: from mse01.zte.com.cn (unknown [10.30.3.20])
	by Forcepoint Email with ESMTPS id E3DFAED810EA6A15529E;
	Mon,  3 Dec 2018 19:04:21 +0800 (CST)
Received: from notes_smtp.zte.com.cn ([10.30.1.239])
	by mse01.zte.com.cn with ESMTP id wB3B4APN097899;
	Mon, 3 Dec 2018 19:04:10 +0800 (GMT-8)
	(envelope-from peng.hao2@zte.com.cn)
Received: from localhost.localdomain.localdomain ([10.74.120.59])
	by szsmtp06.zte.com.cn (Lotus Domino Release 8.5.3FP6)
	with ESMTP id 2018120319041802-14451312 ;
	Mon, 3 Dec 2018 19:04:18 +0800 
From: Peng Hao <peng.hao2@zte.com.cn>
To: peter.maydell@linaro.org, drjones@redhat.com, philmd@redhat.com
Date: Tue, 4 Dec 2018 03:26:45 +0800
Message-Id: <1543865209-50994-5-git-send-email-peng.hao2@zte.com.cn>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1543865209-50994-1-git-send-email-peng.hao2@zte.com.cn>
References: <1543865209-50994-1-git-send-email-peng.hao2@zte.com.cn>
X-MIMETrack: Itemize by SMTP Server on SZSMTP06/server/zte_ltd(Release
	8.5.3FP6|November 21, 2013) at 2018-12-03 19:04:18,
	Serialize by Router on notes_smtp/zte_ltd(Release 9.0.1FP7|August  17,
	2016) at 2018-12-03 19:04:10,
	Serialize complete at 2018-12-03 19:04:10
X-MAIL: mse01.zte.com.cn wB3B4APN097899
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 63.217.80.70
Subject: [Qemu-arm] [PATCH V11 4/8]  hw/arm/virt: Use the pvpanic device
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
Cc: Peng Hao <peng.hao2@zte.com.cn>, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 4oMdti+6QE3c

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
index a2b8d8f..a4541fa 100644
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
+    char *nodename;
+    hwaddr base = vms->memmap[VIRT_PVPANIC].base;
+    hwaddr size = vms->memmap[VIRT_PVPANIC].size;
+
+    sysbus_create_simple(TYPE_PVPANIC_MMIO, base, NULL);
+
+    nodename = g_strdup_printf("/pvpanic-mmio@%" PRIx64, base);
+    qemu_fdt_add_subnode(vms->fdt, nodename);
+    qemu_fdt_setprop_string(vms->fdt, nodename,
+                            "compatible", "qemu,pvpanic-mmio");
+    qemu_fdt_setprop_sized_cells(vms->fdt, nodename, "reg",
+                                 2, base, 2, size);
+
+    g_free(nodename);
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

