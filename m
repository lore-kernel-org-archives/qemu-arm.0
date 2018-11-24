Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp3063819wrt;
        Sat, 24 Nov 2018 00:41:24 -0800 (PST)
X-Google-Smtp-Source: AJdET5dZM0wN6xZj9lJ3HADM/aKraAlCS5fsQD+k7LUnd6n8X0vuPKnrRaH2yXfU4bNEKMl13B0s
X-Received: by 2002:a81:34c9:: with SMTP id b192mr20359791ywa.270.1543048883975;
        Sat, 24 Nov 2018 00:41:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1543048883; cv=none;
        d=google.com; s=arc-20160816;
        b=vjSfh5ZSjoAhnkfKxROH85rmoArVttVn0ouB3daDcfVauw3PWYEJDTRcRiSSqiP4IA
         bwIlV9WGfFFAGnfZ5p5nLgP4uVMnUd+kQ6+AayS/EFNNMXbL8vSpKRp3laExDBr8Zru8
         BDzFum5IiTrr2/p6r4oROWGHAu/Ju11L4snj6MfK01fQzXIgSeWFYmNEH0Z159z9LFgs
         VmdgHUhftME84ZubfVvxSSt7TR4u1nhdEb+xO7VdaB6ye9YwwQkVffSbBOt9oxO1eykC
         RBdBylPDeYwbQL/b8BfKOb6Ha0xThcv+9G/mLNMq7ZahdyQrHTTptWaX7IFrYqNUWXRZ
         8Muw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from;
        bh=yHxRYF45j0kvjrO29sM1Vdsx4MNETuIPOQs0MdXwMFI=;
        b=0Eeng91L8HRgHDDxIij1oOs9guxu9YNiNKW5sKAVk0D9AND5aJgNPma60eizOghDhs
         D2+pbzVhkfxcdQHKJro/qFGkM/a4diRIoccJspWlZ4GoAenMpqx26oiGZvnEb2cM5KYu
         egOihJh9F8VPY/sDduHeZ6KOwAKVpTQTitlPQMfOkTDhMfjmoOAApweKabHiHGKmZOaT
         vt5/+9CM85l86bXmh+kzerHocThOu8HN7Rl6i+OU/6MmKk2RDtrj4RWGFNlC3qPGV8ZQ
         SG34qnuQSjGWxbb4GfmkHvfr/GREurJtE/IsU+Cyae2lCoCCEwB/kgBHwDm6Ck+oGZIa
         hQEw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r17-v6si26186567ybb.277.2018.11.24.00.41.23
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 24 Nov 2018 00:41:23 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:55708 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gQTVD-0002qp-Bi
	for alex.bennee@linaro.org; Sat, 24 Nov 2018 03:41:23 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52588)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peng.hao2@zte.com.cn>) id 1gQTUB-0002j7-Bx
	for qemu-devel@nongnu.org; Sat, 24 Nov 2018 03:40:21 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peng.hao2@zte.com.cn>) id 1gQTSe-0000PM-3V
	for qemu-devel@nongnu.org; Sat, 24 Nov 2018 03:38:44 -0500
Received: from mxhk.zte.com.cn ([63.217.80.70]:63174)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <peng.hao2@zte.com.cn>)
	id 1gQTSa-0000Eh-T6; Sat, 24 Nov 2018 03:38:41 -0500
Received: from mse01.zte.com.cn (unknown [10.30.3.20])
	by Forcepoint Email with ESMTPS id D7F90A763577DF9E6090;
	Sat, 24 Nov 2018 16:38:38 +0800 (CST)
Received: from notes_smtp.zte.com.cn ([10.30.1.239])
	by mse01.zte.com.cn with ESMTP id wAO8cUU3035029;
	Sat, 24 Nov 2018 16:38:30 +0800 (GMT-8)
	(envelope-from peng.hao2@zte.com.cn)
Received: from localhost.localdomain.localdomain ([10.74.120.59])
	by szsmtp06.zte.com.cn (Lotus Domino Release 8.5.3FP6)
	with ESMTP id 2018112416391692-12702404 ;
	Sat, 24 Nov 2018 16:39:16 +0800 
From: Peng Hao <peng.hao2@zte.com.cn>
To: peter.maydell@linaro.org, drjones@redhat.com, philmd@redhat.com
Date: Sun, 25 Nov 2018 01:00:17 +0800
Message-Id: <1543078821-16636-7-git-send-email-peng.hao2@zte.com.cn>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1543078821-16636-1-git-send-email-peng.hao2@zte.com.cn>
References: <1543078821-16636-1-git-send-email-peng.hao2@zte.com.cn>
X-MIMETrack: Itemize by SMTP Server on SZSMTP06/server/zte_ltd(Release
	8.5.3FP6|November 21, 2013) at 2018-11-24 16:39:16,
	Serialize by Router on notes_smtp/zte_ltd(Release 9.0.1FP7|August  17,
	2016) at 2018-11-24 16:38:10,
	Serialize complete at 2018-11-24 16:38:10
X-MAIL: mse01.zte.com.cn wAO8cUU3035029
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 63.217.80.70
Subject: [Qemu-devel] [PATCH V8 06/10] hw/arm/virt: add pvpanic device in
 virt acpi table
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
X-TUID: hu/5RC/FFYFs

Add pvpanic device in virt acpi table, so when kenrel command line
uses acpi=force, kernel can get info from acpi table.

Signed-off-by: Peng Hao <peng.hao2@zte.com.cn>
---
 hw/arm/virt-acpi-build.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index 5785fb6..4208e46 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -61,6 +61,20 @@ static void acpi_dsdt_add_cpus(Aml *scope, int smp_cpus)
     }
 }
 
+static void acpi_dsdt_add_pvpanic(Aml *scope, const MemMapEntry *pvpanic_memmap)
+{
+    Aml *dev = aml_device("PEVT");
+    aml_append(dev, aml_name_decl("_HID", aml_string("QEMU0001")));
+    aml_append(dev, aml_name_decl("_UID", aml_int(0)));
+
+    Aml *crs = aml_resource_template();
+    aml_append(crs, aml_memory32_fixed(pvpanic_memmap->base,
+                                       pvpanic_memmap->size, AML_READ_WRITE));
+
+    aml_append(dev, aml_name_decl("_CRS", crs));
+    aml_append(scope, dev);
+}
+
 static void acpi_dsdt_add_uart(Aml *scope, const MemMapEntry *uart_memmap,
                                            uint32_t uart_irq)
 {
@@ -771,6 +785,7 @@ build_dsdt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
     acpi_dsdt_add_uart(scope, &memmap[VIRT_UART],
                        (irqmap[VIRT_UART] + ARM_SPI_BASE));
     acpi_dsdt_add_flash(scope, &memmap[VIRT_FLASH]);
+    acpi_dsdt_add_pvpanic(scope, &memmap[VIRT_PVPANIC]);
     acpi_dsdt_add_fw_cfg(scope, &memmap[VIRT_FW_CFG]);
     acpi_dsdt_add_virtio(scope, &memmap[VIRT_MMIO],
                     (irqmap[VIRT_MMIO] + ARM_SPI_BASE), NUM_VIRTIO_TRANSPORTS);
-- 
1.8.3.1

