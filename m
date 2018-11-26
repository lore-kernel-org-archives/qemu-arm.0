Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp5411893wrt;
        Mon, 26 Nov 2018 03:33:57 -0800 (PST)
X-Google-Smtp-Source: AJdET5dP+pxQubucpJpmB9swzQKXP8NMPm4VOzQrq5tEAZ3ZrgCLhqyq9IwEGPLrIWOF/MUgKVpB
X-Received: by 2002:a81:b61a:: with SMTP id u26mr27322189ywh.428.1543232037475;
        Mon, 26 Nov 2018 03:33:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1543232037; cv=none;
        d=google.com; s=arc-20160816;
        b=Q3BRCy+147VTZR2xS8LuouGjCNHaGRuU0/yskAQ/8/YFvX8ML/hRvfGwH4q0Y3b64c
         791nyCEvRuCk7GTv9EOIcgeRYjwgRMYDW+O1zBg2CBsuTCFHmb0N0GwD0e3QraqCWsZr
         EMHu3VMD3u68dqQg5zVNuWXmxpT0Fj/wV902sB6BiMSbmob5MGefMzdGsZN6YXbqVriK
         Hh4k92W0DFwfD9RpNCndG7y65hWWpkVKVi0MMQ7VZYAz6jk1x0YjBPLYfVXLhHyCpG9q
         Sj2euZPsg7s27OBU8qgttzzJWq7TIPJt16HBjoAMiXBK7qd/FYrtltteh89xFUueCNz/
         T/+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from;
        bh=LGsExfBcmU1wB+4pz/Vit1KlnBarCZjzASUT+u1eGDc=;
        b=fkUCd4A2+nbM7P7y+fNVoLpLxX+gicIJurLxR7j5qTu4pDQtlzU7L3+2aG+9j+Ogru
         RF4QiB10Hr6+2vG+zOwEIC2F9uVL3/ba0JvjYFSlF4t2b5Kmr7TWRs3xvZxVQKlTD8zi
         P3kkaU+dgxVpmiUWUCeckq9+mCxXIC2cmfKW4iKZ73Lbi8yjphUQgteLNkLheQllPgA0
         e6Ju8mQHfAwn5pt5X1HwwRqO4KKKLqFpfp2BAtGd5NXqRGG8q10XXCuTl/+/iKL2WILx
         fEkeAAdsDkLzHi5vmwZmpbfhezYhZ4TqAyf2mkLtIchvqAJCB+qz75Tm70YTeYQta8EQ
         CTeQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w199si46158ywd.45.2018.11.26.03.33.57
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 26 Nov 2018 03:33:57 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:35266 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gRF9I-0000ZM-Pq
	for alex.bennee@linaro.org; Mon, 26 Nov 2018 06:33:56 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56739)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peng.hao2@zte.com.cn>) id 1gRF8c-0000DU-4G
	for qemu-arm@nongnu.org; Mon, 26 Nov 2018 06:33:14 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peng.hao2@zte.com.cn>) id 1gRF8Y-0001t0-Ec
	for qemu-arm@nongnu.org; Mon, 26 Nov 2018 06:33:13 -0500
Received: from out1.zte.com.cn ([202.103.147.172]:56492 helo=mxct.zte.com.cn)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <peng.hao2@zte.com.cn>)
	id 1gRF8X-0001r5-6M; Mon, 26 Nov 2018 06:33:10 -0500
Received: from mse01.zte.com.cn (unknown [10.30.3.20])
	by Forcepoint Email with ESMTPS id D0658966ECBEAC5DD497;
	Mon, 26 Nov 2018 19:33:06 +0800 (CST)
Received: from notes_smtp.zte.com.cn ([10.30.1.239])
	by mse01.zte.com.cn with ESMTP id wAQBWwhr031733;
	Mon, 26 Nov 2018 19:32:58 +0800 (GMT-8)
	(envelope-from peng.hao2@zte.com.cn)
Received: from localhost.localdomain.localdomain ([10.74.120.59])
	by szsmtp06.zte.com.cn (Lotus Domino Release 8.5.3FP6)
	with ESMTP id 2018112619330653-13057781 ;
	Mon, 26 Nov 2018 19:33:06 +0800 
From: Peng Hao <peng.hao2@zte.com.cn>
To: peter.maydell@linaro.org, drjones@redhat.com, philmd@redhat.com
Date: Tue, 27 Nov 2018 03:55:58 +0800
Message-Id: <1543262162-6351-6-git-send-email-peng.hao2@zte.com.cn>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1543262162-6351-1-git-send-email-peng.hao2@zte.com.cn>
References: <1543262162-6351-1-git-send-email-peng.hao2@zte.com.cn>
X-MIMETrack: Itemize by SMTP Server on SZSMTP06/server/zte_ltd(Release
	8.5.3FP6|November 21, 2013) at 2018-11-26 19:33:06,
	Serialize by Router on notes_smtp/zte_ltd(Release 9.0.1FP7|August  17,
	2016) at 2018-11-26 19:32:58,
	Serialize complete at 2018-11-26 19:32:58
X-MAIL: mse01.zte.com.cn wAQBWwhr031733
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 202.103.147.172
Subject: [Qemu-arm] [PATCH V9 5/9] hw/arm/virt: add pvpanic device in virt
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
X-TUID: 6nvJSl+PAiWL

Add pvpanic device in virt acpi table, so when kenrel command line
uses acpi=force, kernel can get info from acpi table.

Signed-off-by: Peng Hao <peng.hao2@zte.com.cn>
---
 hw/arm/virt-acpi-build.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index 5785fb6..2adba60 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -84,6 +84,20 @@ static void acpi_dsdt_add_uart(Aml *scope, const MemMapEntry *uart_memmap,
     aml_append(scope, dev);
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
 static void acpi_dsdt_add_fw_cfg(Aml *scope, const MemMapEntry *fw_cfg_memmap)
 {
     Aml *dev = aml_device("FWCF");
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

