Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp548346wrt;
        Tue, 27 Nov 2018 19:50:24 -0800 (PST)
X-Google-Smtp-Source: AJdET5eeus1PtHV92Tksl3jlXMbapN9F9FghDWtT91HlK/Gte/9CwNmEqmJCDq2wo39vm7HN67l2
X-Received: by 2002:a81:20c6:: with SMTP id g189mr36621058ywg.284.1543377024252;
        Tue, 27 Nov 2018 19:50:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1543377024; cv=none;
        d=google.com; s=arc-20160816;
        b=zmV1onhf/gnZnm+auuiB8Rfw7OtowtSlm59+kGsNx+TvEKl8JLYOJbF/cI4QerxP1d
         bO06w+gRITZ9OexXBuBPuo35oj1Lns43PMEyIeIU9G4nT8pibcMxyF/l2f43ohnn2e8b
         OZSIgp+qoA6KLsUD0hWmqzY4hJMJS0edJIku4uQ5JiWeST3PgZ3SQV0mIHx8BPcFoGoB
         coL03rMGE16zfhBl+VM9WaCtqCWg2rLreGzZ2IghgMFDT4NxJhdupjF6BAUiDFcTEyjx
         LqeOAYI/bWEkneHS+LgXnEswqfxMICabpepB4uYFOPBB+pjHIwcyidPlqVQ3GEXdvORL
         s4yQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from;
        bh=xUpFRrWJbFMR9Da8HCFVloqBlsTZwhUL0GLnWU2WMVc=;
        b=OB3btgWGKm3WdNKz6KidzEG72eIQqy9FQerMtE/p2V/pf+AZuc3a4sULtqGlaDJbCu
         EqCYiEL1dNBkMj3fMbQG+9FVMz4TuMb2dh1E7pVWjWZRc3lNruUng5+SQ8WhDPMH+hji
         X1WMPrNiDZLYg5L3MFTlW59V1Rf+BVhR9F0htA+6a7kdKu1qZpfKMRBdVWplnroU1gah
         4n9lB7HZDkP3Z4mpcO46T85w67jtU4rozHMdhFbLxRrQEoI7zXg0XedDmjCv7t/k8lEw
         xhRxu8rRDTJ17oAQPyeWAkJ/KQEJmnG/k8L7GreE7mt+zA7/KTc5xeygEWl4H9906f3D
         Sl3Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f9-v6si4098271ybo.173.2018.11.27.19.50.24
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 27 Nov 2018 19:50:24 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:45731 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gRqrn-0002Yc-Jd
	for alex.bennee@linaro.org; Tue, 27 Nov 2018 22:50:23 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51395)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peng.hao2@zte.com.cn>) id 1gRqrY-0002YC-1G
	for qemu-arm@nongnu.org; Tue, 27 Nov 2018 22:50:08 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peng.hao2@zte.com.cn>) id 1gRqrX-0003XI-0S
	for qemu-arm@nongnu.org; Tue, 27 Nov 2018 22:50:07 -0500
Received: from out1.zte.com.cn ([202.103.147.172]:33918 helo=mxct.zte.com.cn)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <peng.hao2@zte.com.cn>)
	id 1gRqrW-0003U4-M9; Tue, 27 Nov 2018 22:50:06 -0500
Received: from mse01.zte.com.cn (unknown [10.30.3.20])
	by Forcepoint Email with ESMTPS id 889F1EF05E68043F166F;
	Wed, 28 Nov 2018 11:50:00 +0800 (CST)
Received: from notes_smtp.zte.com.cn ([10.30.1.239])
	by mse01.zte.com.cn with ESMTP id wAS3nqv8058649;
	Wed, 28 Nov 2018 11:49:53 +0800 (GMT-8)
	(envelope-from peng.hao2@zte.com.cn)
Received: from localhost.localdomain.localdomain ([10.74.120.59])
	by szsmtp06.zte.com.cn (Lotus Domino Release 8.5.3FP6)
	with ESMTP id 2018112811501311-13417690 ;
	Wed, 28 Nov 2018 11:50:13 +0800 
From: Peng Hao <peng.hao2@zte.com.cn>
To: peter.maydell@linaro.org, drjones@redhat.com, philmd@redhat.com
Date: Wed, 28 Nov 2018 20:12:47 +0800
Message-Id: <1543407172-16175-5-git-send-email-peng.hao2@zte.com.cn>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1543407172-16175-1-git-send-email-peng.hao2@zte.com.cn>
References: <1543407172-16175-1-git-send-email-peng.hao2@zte.com.cn>
X-MIMETrack: Itemize by SMTP Server on SZSMTP06/server/zte_ltd(Release
	8.5.3FP6|November 21, 2013) at 2018-11-28 11:50:13,
	Serialize by Router on notes_smtp/zte_ltd(Release 9.0.1FP7|August  17,
	2016) at 2018-11-28 11:49:44,
	Serialize complete at 2018-11-28 11:49:44
X-MAIL: mse01.zte.com.cn wAS3nqv8058649
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 202.103.147.172
Subject: [Qemu-arm] [PATCH V10 4/9]  hw/arm/virt: Use the pvpanic device
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
X-TUID: 0T7iSgEG4GaV

Add pvpanic device in arm virt machine.

Signed-off-by: Peng Hao <peng.hao2@zte.com.cn>
---
 default-configs/arm-softmmu.mak |  1 +
 hw/arm/virt.c                   | 21 +++++++++++++++++++++
 include/hw/arm/virt.h           |  1 +
 3 files changed, 23 insertions(+)

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
index a2b8d8f..f2cb5de 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -143,6 +143,7 @@ static const MemMapEntry a15memmap[] = {
     [VIRT_GPIO] =               { 0x09030000, 0x00001000 },
     [VIRT_SECURE_UART] =        { 0x09040000, 0x00001000 },
     [VIRT_SMMU] =               { 0x09050000, 0x00020000 },
+    [VIRT_PVPANIC] =            { 0x09070000, 0x00000002 },
     [VIRT_MMIO] =               { 0x0a000000, 0x00000200 },
     /* ...repeating for a total of NUM_VIRTIO_TRANSPORTS, each of that size */
     [VIRT_PLATFORM_BUS] =       { 0x0c000000, 0x02000000 },
@@ -190,6 +191,24 @@ static bool cpu_type_valid(const char *cpu)
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
@@ -1531,6 +1550,8 @@ static void machvirt_init(MachineState *machine)
 
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

