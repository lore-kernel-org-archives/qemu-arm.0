Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp3050460wrt;
        Sat, 24 Nov 2018 00:23:27 -0800 (PST)
X-Google-Smtp-Source: AJdET5epWcAvjbV47q7q6yDIV7a96sO6wcF+hu4NQnylqBTEOeZnoyxqVe+eV4gJTD5oOLaeoD71
X-Received: by 2002:a81:8043:: with SMTP id q64-v6mr19592118ywf.196.1543047807055;
        Sat, 24 Nov 2018 00:23:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1543047807; cv=none;
        d=google.com; s=arc-20160816;
        b=XSrXxKFn0VFzUIDqAFwnS6/TUaV+DUBQgYUix8DZmFzxKhGODfXoa7esH2bz0C8nxu
         QAE+oEuaVHiivNtK6d9eHi8yHOQ9+7ah/+gnZDO/V3fs11Lbur9VaRo04k2ePaDaXJol
         ZelYgkRHK+nZVcG5aBDvpYWCDlQ/+IfnAYzCOyZgH5Yis83ZjcbnLK4xhWU8NMqc6+We
         r606FjPeNZ3Dxv9dRLcDXpeOHK5oPPr9tpIQ8GzCu598b7sLyYquFTGSpRPNa8JiKX5d
         4UFMbdljyb0oacsxK/KYCDTmNmo5/ZMx2u/YQTq5AWCgCD3rqUwLRYZx/Z/gOn0tRs8l
         UQgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from;
        bh=ABB6jf/ROQXuHiaOtkiE6mtF0wpa33YHlOZsQNzTSFQ=;
        b=AMB7O45PygeMDYAgixXVA9FkxRoUm0vuBAlCs3mQX/ZtLICN2emBNC/8XYoodDcjbj
         hmdB90sBdtD13Xpxt1+7Ra5LYu0kYmOBGOTsF/E1mli93CR2SAR7CKKM3e6sGSXOYjcz
         C11lJFLFRHTStcfF5LeXsNfqnoI/oxF+FHL6iot2Uqv1YRpvMAEBG1do9YQ4Sa4zkZqd
         qQNUWrdZDqSweSk+4OzsapjviZK7AomE29vM8akxrq34Xs/l+rifxeKS5oPr3LKecfGJ
         4hyECJwDhsnf104m8n0DM2ZONYYmKHBEJL3mdErDDuCREXE3t7Xd/zXi2uH2ufaxb4MO
         OU1Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q125-v6si34505029ywq.248.2018.11.24.00.23.26
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 24 Nov 2018 00:23:27 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:55645 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gQTDq-0002JV-FC
	for alex.bennee@linaro.org; Sat, 24 Nov 2018 03:23:26 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47915)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peng.hao2@zte.com.cn>) id 1gQTAs-0008It-QU
	for qemu-arm@nongnu.org; Sat, 24 Nov 2018 03:20:23 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peng.hao2@zte.com.cn>) id 1gQT44-0005ir-Fa
	for qemu-arm@nongnu.org; Sat, 24 Nov 2018 03:13:23 -0500
Received: from out1.zte.com.cn ([202.103.147.172]:40478 helo=mxct.zte.com.cn)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <peng.hao2@zte.com.cn>)
	id 1gQT44-0005gC-48; Sat, 24 Nov 2018 03:13:20 -0500
Received: from mse01.zte.com.cn (unknown [10.30.3.20])
	by Forcepoint Email with ESMTPS id 0AC8FFB902B50B0A3728;
	Sat, 24 Nov 2018 16:13:05 +0800 (CST)
Received: from notes_smtp.zte.com.cn ([10.30.1.239])
	by mse01.zte.com.cn with ESMTP id wAO8CufZ023416;
	Sat, 24 Nov 2018 16:12:56 +0800 (GMT-8)
	(envelope-from peng.hao2@zte.com.cn)
Received: from localhost.localdomain.localdomain ([10.74.120.59])
	by szsmtp06.zte.com.cn (Lotus Domino Release 8.5.3FP6)
	with ESMTP id 2018112416133941-12697204 ;
	Sat, 24 Nov 2018 16:13:39 +0800 
From: Peng Hao <peng.hao2@zte.com.cn>
To: peter.maydell@linaro.org, drjones@redhat.com, philmd@redhat.com
Date: Sun, 25 Nov 2018 00:34:28 +0800
Message-Id: <1543077273-16201-5-git-send-email-peng.hao2@zte.com.cn>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1543077273-16201-1-git-send-email-peng.hao2@zte.com.cn>
References: <1543077273-16201-1-git-send-email-peng.hao2@zte.com.cn>
X-MIMETrack: Itemize by SMTP Server on SZSMTP06/server/zte_ltd(Release
	8.5.3FP6|November 21, 2013) at 2018-11-24 16:13:39,
	Serialize by Router on notes_smtp/zte_ltd(Release 9.0.1FP7|August  17,
	2016) at 2018-11-24 16:12:36,
	Serialize complete at 2018-11-24 16:12:36
X-MAIL: mse01.zte.com.cn wAO8CufZ023416
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 202.103.147.172
Subject: [Qemu-arm] [PATCH 05/10]  hw/arm/virt: Use the pvpanic device
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
X-TUID: zqduwTH5IVTj

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

