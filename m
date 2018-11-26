Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp5411405wrt;
        Mon, 26 Nov 2018 03:33:32 -0800 (PST)
X-Google-Smtp-Source: AFSGD/X/0H242ZKpKm4a9q4a0IUmeqDs51lDFdrWk2H/JlojrGFsTXOPDTNoeRU8ug2giApTQBca
X-Received: by 2002:a25:844e:: with SMTP id r14-v6mr26996829ybm.298.1543232012740;
        Mon, 26 Nov 2018 03:33:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1543232012; cv=none;
        d=google.com; s=arc-20160816;
        b=PXLFgWpSR4Y6F2Q2BtafBiSkKG7UIWfO1WSx/mhjAsm9ha4SDqvpT+UXOAjDzJhdag
         53IlrGoifLg6YVJ6Fue8Az9THB6yA1ZWfBhcyx+yT84QheAW8VdKpvRQFWr11baJKfye
         aA3SU2JM5TM6+8kIPQaNwBkh97KUpcNO0efJ76oHw16iAPZOF/tXs965fwUb2AAX61Ux
         E1iSTV9gHS0NxfANlOIw69j6VUp+jtsY5u4yROVbPBy7Pe+bh3g30rWueFSzEZs9m9EN
         NEJAYVKESDyVu1syThTwOnpuVyGmXZlXq/V5CJb7gZ1jRNSHlDXQ8b21G79CRB8HGsS1
         N9LQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from;
        bh=xUpFRrWJbFMR9Da8HCFVloqBlsTZwhUL0GLnWU2WMVc=;
        b=lYYgQNtoLMWUyx9L0Om7OvCtVafm63vJJdAZZUwuncUukc3PTvwmZVxka5MLP+Sg34
         tCI1vSxDJ0WO1uegyFxt5dllknsSZHZ7Kj5HvKDjbeH0/VAbqiN/HhLWIAG/Lp2M/9Lw
         JSl0YYWM1N1Wfma5WxKDZMpyPRtOAYYyZgYYoM5kRx3qHUiEw/0gOh3LnaZS717BJ3Y1
         oGf1K6+DAFhOEShW7ldn5axcNRuk4hJuJ5Txgplrv8rbB2Ytx8seetz8tcCEmqo59rUg
         8k9wpunwX4e+RsVALUNOljhAVf/VlITvDmcsuSK6kp6oPk1ZNnb/e8F5O7dg9iRZyTnX
         WkbQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s125si38347ywe.87.2018.11.26.03.33.32
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 26 Nov 2018 03:33:32 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:35263 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gRF8u-0000Gm-3z
	for alex.bennee@linaro.org; Mon, 26 Nov 2018 06:33:32 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56741)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peng.hao2@zte.com.cn>) id 1gRF8c-0000DV-4M
	for qemu-arm@nongnu.org; Mon, 26 Nov 2018 06:33:15 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peng.hao2@zte.com.cn>) id 1gRF8X-0001sA-8A
	for qemu-arm@nongnu.org; Mon, 26 Nov 2018 06:33:13 -0500
Received: from out1.zte.com.cn ([202.103.147.172]:56460 helo=mxct.zte.com.cn)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <peng.hao2@zte.com.cn>)
	id 1gRF8W-0001pd-EW; Mon, 26 Nov 2018 06:33:08 -0500
Received: from mse01.zte.com.cn (unknown [10.30.3.20])
	by Forcepoint Email with ESMTPS id 3A5A2772E8E9E8E46DAA;
	Mon, 26 Nov 2018 19:33:05 +0800 (CST)
Received: from notes_smtp.zte.com.cn ([10.30.1.239])
	by mse01.zte.com.cn with ESMTP id wAQBWv84031717;
	Mon, 26 Nov 2018 19:32:57 +0800 (GMT-8)
	(envelope-from peng.hao2@zte.com.cn)
Received: from localhost.localdomain.localdomain ([10.74.120.59])
	by szsmtp06.zte.com.cn (Lotus Domino Release 8.5.3FP6)
	with ESMTP id 2018112619330544-13057780 ;
	Mon, 26 Nov 2018 19:33:05 +0800 
From: Peng Hao <peng.hao2@zte.com.cn>
To: peter.maydell@linaro.org, drjones@redhat.com, philmd@redhat.com
Date: Tue, 27 Nov 2018 03:55:57 +0800
Message-Id: <1543262162-6351-5-git-send-email-peng.hao2@zte.com.cn>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1543262162-6351-1-git-send-email-peng.hao2@zte.com.cn>
References: <1543262162-6351-1-git-send-email-peng.hao2@zte.com.cn>
X-MIMETrack: Itemize by SMTP Server on SZSMTP06/server/zte_ltd(Release
	8.5.3FP6|November 21, 2013) at 2018-11-26 19:33:05,
	Serialize by Router on notes_smtp/zte_ltd(Release 9.0.1FP7|August  17,
	2016) at 2018-11-26 19:32:57,
	Serialize complete at 2018-11-26 19:32:57
X-MAIL: mse01.zte.com.cn wAQBWv84031717
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 202.103.147.172
Subject: [Qemu-arm] [PATCH V9 4/9]  hw/arm/virt: Use the pvpanic device
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
X-TUID: woDFsvlbsuNJ

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

