Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp2661308wrw;
        Sun, 11 Nov 2018 19:21:01 -0800 (PST)
X-Google-Smtp-Source: AJdET5cvIW//wgQZNr0ZjUw+yHwxUm4C3neFkjE+jgB1F+pFetSginikMTqjAih59pK4x+j2bToN
X-Received: by 2002:a37:654b:: with SMTP id z72mr17313277qkb.226.1541992861442;
        Sun, 11 Nov 2018 19:21:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1541992861; cv=none;
        d=google.com; s=arc-20160816;
        b=LyuzoZFKykAE2hh6ZMBZLjG5vqL1RwxjRSmk+xM7wpNzdIeENxDFVetDCwFviLRgos
         PVXpFtjoIe0JveuzykrIyBwxr66vfTedq09jDt9A4xZ+X69LrO7r7RwgyZw58FS1vCg6
         iBQOKY3HpL56myDbuviSQrU/Omz4ldPsQOBAn7EbUFwVobqd1kxL3gPIrrXYDZLnI8sW
         kJKAIh0PR2yLvHUS5IjCLv1SX5e4CSrNcI4U8trogHecJPE0hzYQPw3AjhBIM2/axknS
         THuvAMnUsODjbuL0JeueCI0aXj9QErN3a65DfRAP377sf/3I7ZqHs4Eb0/jB9BNO7O+K
         NnMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from;
        bh=msNGHUjP5Tfsg+r3T2wgHMZZJoZCugup/gj2zLjhXyQ=;
        b=YSfn/inMCMuTmAX6SKw/nB+T4r7lIFJeIURwCPEkfWGhR7NizQ9b/RKdAYF01bh9ig
         f86/dNZYDqVj13KofkymI7aQDtwT3hTMqVus8L1snQFDYFRo6mNXqxgCxjA6mpFBBP34
         YDAKfWfNIQs3v2Nnz3y3WzherKaGIi1UGCwEfoNKX8j2TUN4Wuq46/xYb3w+dD8IbZJ3
         xYxb0jueIs3k21vNDALNvac2pE/Sucx8T7orw9O3u52Utjn/1IQVxai69iMg/vpNVruf
         0oAYmEmpDZ8Ewznr9212k6j17ZxxeveBrckhEvUkcaW2Ek4hMBOA3dYHAKxR+b2iFgP0
         yXYg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x11si88534qtb.89.2018.11.11.19.21.01
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 11 Nov 2018 19:21:01 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:44566 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gM2ma-0002Au-8I
	for alex.bennee@linaro.org; Sun, 11 Nov 2018 22:21:00 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40148)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peng.hao2@zte.com.cn>) id 1gM2mM-00029O-HG
	for qemu-arm@nongnu.org; Sun, 11 Nov 2018 22:20:47 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peng.hao2@zte.com.cn>) id 1gM2mJ-000341-Aj
	for qemu-arm@nongnu.org; Sun, 11 Nov 2018 22:20:46 -0500
Received: from mxhk.zte.com.cn ([63.217.80.70]:27458)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <peng.hao2@zte.com.cn>)
	id 1gM2mG-0002oi-Dp; Sun, 11 Nov 2018 22:20:43 -0500
Received: from mse01.zte.com.cn (unknown [10.30.3.20])
	by Forcepoint Email with ESMTPS id BFDCAF8E2D2F23B8E511;
	Mon, 12 Nov 2018 11:20:37 +0800 (CST)
Received: from notes_smtp.zte.com.cn ([10.30.1.239])
	by mse01.zte.com.cn with ESMTP id wAC3JqYF084968;
	Mon, 12 Nov 2018 11:19:52 +0800 (GMT-8)
	(envelope-from peng.hao2@zte.com.cn)
Received: from localhost.localdomain.localdomain ([10.74.120.59])
	by szsmtp06.zte.com.cn (Lotus Domino Release 8.5.3FP6)
	with ESMTP id 2018111211195655-10076103 ;
	Mon, 12 Nov 2018 11:19:56 +0800 
From: Peng Hao <peng.hao2@zte.com.cn>
To: peter.maydell@linaro.org, drjones@redhat.com, philmd@redhat.com
Date: Mon, 12 Nov 2018 19:42:19 +0800
Message-Id: <1542022940-46849-6-git-send-email-peng.hao2@zte.com.cn>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1542022940-46849-1-git-send-email-peng.hao2@zte.com.cn>
References: <1542022940-46849-1-git-send-email-peng.hao2@zte.com.cn>
X-MIMETrack: Itemize by SMTP Server on SZSMTP06/server/zte_ltd(Release
	8.5.3FP6|November 21, 2013) at 2018-11-12 11:19:56,
	Serialize by Router on notes_smtp/zte_ltd(Release 9.0.1FP7|August  17,
	2016) at 2018-11-12 11:19:52,
	Serialize complete at 2018-11-12 11:19:52
X-MAIL: mse01.zte.com.cn wAC3JqYF084968
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 63.217.80.70
Subject: [Qemu-arm] [PATCH V6 5/6] hw/arm/virt: add pvpanic device in virt
 acpi table
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
X-TUID: 2BbOfaqRoRoR

add pvpanic device in virt acpi table, so when kenrel command line uses
acpi=force, kernel can get info from acpi table in aarch64.

Signed-off-by: Peng Hao <peng.hao2@zte.com.cn>
---
 hw/arm/virt-acpi-build.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index 5785fb6..d126cee 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -61,6 +61,21 @@ static void acpi_dsdt_add_cpus(Aml *scope, int smp_cpus)
     }
 }
 
+static void acpi_dsdt_add_pvpanic(Aml *scope, const MemMapEntry *pvpanic_memmap)
+{
+    Aml *dev = aml_device("PANC");
+    aml_append(dev, aml_name_decl("_HID", aml_string("QEMU0001")));
+    aml_append(dev, aml_name_decl("_UID", aml_int(0)));
+
+    Aml *crs = aml_resource_template();
+    aml_append(crs, aml_memory32_fixed(pvpanic_memmap->base,
+                                       pvpanic_memmap->size, AML_READ_WRITE));
+
+    aml_append(dev, aml_name_decl("_CRS", crs));
+
+    aml_append(scope, dev);
+}
+
 static void acpi_dsdt_add_uart(Aml *scope, const MemMapEntry *uart_memmap,
                                            uint32_t uart_irq)
 {
@@ -770,6 +785,7 @@ build_dsdt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
     acpi_dsdt_add_cpus(scope, vms->smp_cpus);
     acpi_dsdt_add_uart(scope, &memmap[VIRT_UART],
                        (irqmap[VIRT_UART] + ARM_SPI_BASE));
+    acpi_dsdt_add_pvpanic(scope, &memmap[VIRT_PVPANIC]);
     acpi_dsdt_add_flash(scope, &memmap[VIRT_FLASH]);
     acpi_dsdt_add_fw_cfg(scope, &memmap[VIRT_FW_CFG]);
     acpi_dsdt_add_virtio(scope, &memmap[VIRT_MMIO],
-- 
1.8.3.1

