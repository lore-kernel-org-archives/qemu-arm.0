Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp548573wrt;
        Tue, 27 Nov 2018 19:50:46 -0800 (PST)
X-Google-Smtp-Source: AJdET5cGzyS2W0giE40ZjO/5cpXHNu0TUqg6+c11xo6lPLC2O7p/DwRhfDk6XjqtuGUDPCRwV+6d
X-Received: by 2002:a81:a80a:: with SMTP id f10mr37512921ywh.389.1543377046088;
        Tue, 27 Nov 2018 19:50:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1543377046; cv=none;
        d=google.com; s=arc-20160816;
        b=xV5PEpE6wKuDAgjPdFsrHsaQbt1v43tVRVsjx/w3hIanBhLbUE1zez7grxmLTkYMzN
         xR0iK5NeaYJy5Z4l2+d582eYvz7uVSOFTSWX2+l9yC8QoVB9oD+Yeo+OAuhNgEkkXacR
         sW5awTe3i93e3W0RNO1m6ASft+/PuXQJNZ3J7RANUTt4Rz5i/ZYm+5KLRbJ58x2MigkJ
         Tj3flgzqQC1bP1Z5/OFDcEVl6Zf74Dn05kHbY9PDc1zyb1qjm0xoi72YUF9+YqyeBcC5
         yTdnnmK2Edd5KMAxZSHbwzFGm15bZ7iGnOn62wOmE6cdHG10Eo5EsRcq4gRDKCv/ebjM
         WrTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from;
        bh=LGsExfBcmU1wB+4pz/Vit1KlnBarCZjzASUT+u1eGDc=;
        b=fL+Y3k6RtFMN/C0lCeG9exCfPMv+iP1zx7/kNY01kKYQQ4PLaDW2Jq3F6u+GXD/vEr
         T9ZiPLf9oPL30iGD3tsvRhybg+y5Uo38phYskmYyIQIN0hN7ATpG50ISPZ+ten+beWh2
         g3DYf2Wwx8l0RdbBJfKlZGSj4usdj5LHcQdvlfQPk/Jd9l1UFXrGUfiB/j61UjPHNUy8
         3wQz+t5tp8ld8XTSLjOMjOyff7a86JK+D+nfvi42i8psxdvqAkosgrRb7Z+9Zd+cECxA
         VAMSNcQVgrA6NxTBQ+qC1q3MCgaLwe/UzSjdcGwDVALrss33CJ+IDCvC08IcQ8uNZoJA
         KR1g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y132si4009666ywg.318.2018.11.27.19.50.45
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 27 Nov 2018 19:50:46 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:45738 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gRqs9-0002tl-CW
	for alex.bennee@linaro.org; Tue, 27 Nov 2018 22:50:45 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51398)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peng.hao2@zte.com.cn>) id 1gRqrY-0002YE-1c
	for qemu-arm@nongnu.org; Tue, 27 Nov 2018 22:50:09 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peng.hao2@zte.com.cn>) id 1gRqrT-0003VK-SH
	for qemu-arm@nongnu.org; Tue, 27 Nov 2018 22:50:07 -0500
Received: from out1.zte.com.cn ([202.103.147.172]:33952 helo=mxct.zte.com.cn)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <peng.hao2@zte.com.cn>)
	id 1gRqrT-0003UR-IB; Tue, 27 Nov 2018 22:50:03 -0500
Received: from mse01.zte.com.cn (unknown [10.30.3.20])
	by Forcepoint Email with ESMTPS id 8C6D5B001F70E9B45585;
	Wed, 28 Nov 2018 11:50:01 +0800 (CST)
Received: from notes_smtp.zte.com.cn ([10.30.1.239])
	by mse01.zte.com.cn with ESMTP id wAS3nsBe058665;
	Wed, 28 Nov 2018 11:49:54 +0800 (GMT-8)
	(envelope-from peng.hao2@zte.com.cn)
Received: from localhost.localdomain.localdomain ([10.74.120.59])
	by szsmtp06.zte.com.cn (Lotus Domino Release 8.5.3FP6)
	with ESMTP id 2018112811501422-13417725 ;
	Wed, 28 Nov 2018 11:50:14 +0800 
From: Peng Hao <peng.hao2@zte.com.cn>
To: peter.maydell@linaro.org, drjones@redhat.com, philmd@redhat.com
Date: Wed, 28 Nov 2018 20:12:48 +0800
Message-Id: <1543407172-16175-6-git-send-email-peng.hao2@zte.com.cn>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1543407172-16175-1-git-send-email-peng.hao2@zte.com.cn>
References: <1543407172-16175-1-git-send-email-peng.hao2@zte.com.cn>
X-MIMETrack: Itemize by SMTP Server on SZSMTP06/server/zte_ltd(Release
	8.5.3FP6|November 21, 2013) at 2018-11-28 11:50:14,
	Serialize by Router on notes_smtp/zte_ltd(Release 9.0.1FP7|August  17,
	2016) at 2018-11-28 11:49:45,
	Serialize complete at 2018-11-28 11:49:45
X-MAIL: mse01.zte.com.cn wAS3nsBe058665
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 202.103.147.172
Subject: [Qemu-arm] [PATCH V10 5/9] hw/arm/virt: add pvpanic device in virt
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
X-TUID: BvpZfLJyn6Ls

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

