Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp556406wro;
        Thu, 25 Oct 2018 04:14:13 -0700 (PDT)
X-Google-Smtp-Source: AJdET5favXaVBuldfSD7ApPE+pC8yg2DdCLTz775Zr+bh/ElEqYqouX+zsg9JYSvjxgPmWF2SO/P
X-Received: by 2002:a37:314c:: with SMTP id x73-v6mr898637qkx.263.1540466053664;
        Thu, 25 Oct 2018 04:14:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1540466053; cv=none;
        d=google.com; s=arc-20160816;
        b=o20hUajT3fAlCGDIZnsiPZEXcShDp/PN6f/xsW2n+LP2h2zKJkI0hDFJsP74h+sadu
         W29ATxeNweg8G+8rv61KYeGvitsH5HZjTfWcBoElFx2AUC4w6AqoIwZW+y0mL0J90hIQ
         +cdVPJcf3UU6huBEqz7/H4AG3N9Br+K2sqlAo9LFFsHWiS5xV3HH97b5w8nQfhiDMIlr
         5y1M3xmySjnrcoLYDX8Su1Gn3wk6wOR5kgsyhkmxlOzsIHFso412luJpbMRdBNZ+yaoa
         Uqw1WhzugrnzsR8+z2B5QIljhejKyHFfbmmtf/MSQ9gsaqdU/0aGPLXPWcj60/O5/ekR
         Eqeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from;
        bh=SSu7skrzaOgBHWMYh2IjTUPTg7zH6hbLtC6g2AlBkUE=;
        b=DsjJNwv0ejR8lj2ppemXtMsz3UoZOcz/44YGnM4A0bhM6SqHXZ35n8NeAxbkmf9MY5
         SbUp7izVOZ9uAEL3MNdXadbonp4HBQSXXUxxgrmY/r2eVwVtSP1S5DLfGGSivDRbtGT3
         Q2jWsX5oeYPKN/LDLetPk14fDJd2g6l6z1yFSzvpyH4UMJ3eosY/Xnb0tQMKKh9bwXyA
         /F8eqaz7563AXG424ZlQXj/A/orUDseJequSCks4a3KpNo6d4llawQQTmvOfxycKZfyo
         SFnQ7V1eJ4bFzPmHC4E7GqD5INE9MM2kwvWZq5EjZFQwcXWZygj72gpNlUSvN0UAkO04
         BIqw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j3si339837qvg.29.2018.10.25.04.14.13
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 25 Oct 2018 04:14:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:53778 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gFdaf-00074w-5i
	for alex.bennee@linaro.org; Thu, 25 Oct 2018 07:14:13 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48668)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peng.hao2@zte.com.cn>) id 1gFdZX-0006EG-No
	for qemu-arm@nongnu.org; Thu, 25 Oct 2018 07:13:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peng.hao2@zte.com.cn>) id 1gFdZP-0000cZ-W6
	for qemu-arm@nongnu.org; Thu, 25 Oct 2018 07:13:01 -0400
Received: from mxhk.zte.com.cn ([63.217.80.70]:7846)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <peng.hao2@zte.com.cn>)
	id 1gFdZM-0000S4-0O; Thu, 25 Oct 2018 07:12:54 -0400
Received: from mse01.zte.com.cn (unknown [10.30.3.20])
	by Forcepoint Email with ESMTPS id 891FE5198C9A411C5FEC;
	Thu, 25 Oct 2018 19:12:32 +0800 (CST)
Received: from notes_smtp.zte.com.cn ([10.30.1.239])
	by mse01.zte.com.cn with ESMTP id w9PBCNHv015445;
	Thu, 25 Oct 2018 19:12:23 +0800 (GMT-8)
	(envelope-from peng.hao2@zte.com.cn)
Received: from localhost.localdomain.localdomain ([10.74.120.59])
	by szsmtp06.zte.com.cn (Lotus Domino Release 8.5.3FP6)
	with ESMTP id 2018102519125526-6703172 ;
	Thu, 25 Oct 2018 19:12:55 +0800 
From: Peng Hao <peng.hao2@zte.com.cn>
To: peter.maydell@linaro.org, philmd@redhat.com
Date: Fri, 26 Oct 2018 03:23:17 +0800
Message-Id: <1540495397-88089-6-git-send-email-peng.hao2@zte.com.cn>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1540495397-88089-1-git-send-email-peng.hao2@zte.com.cn>
References: <1540495397-88089-1-git-send-email-peng.hao2@zte.com.cn>
X-MIMETrack: Itemize by SMTP Server on SZSMTP06/server/zte_ltd(Release
	8.5.3FP6|November 21, 2013) at 2018-10-25 19:12:55,
	Serialize by Router on notes_smtp/zte_ltd(Release 9.0.1FP7|August  17,
	2016) at 2018-10-25 19:12:11,
	Serialize complete at 2018-10-25 19:12:11
X-MAIL: mse01.zte.com.cn w9PBCNHv015445
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 63.217.80.70
Subject: [Qemu-arm] [PATCH V4 5/5] hw/arm/virt: add pvpanic device in virt
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
X-TUID: /9wltGDVRZ61

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
+    acpi_dsdt_add_pvpanic(scope, &memmap[VIRT_PVPANIC_MMIO]);
     acpi_dsdt_add_flash(scope, &memmap[VIRT_FLASH]);
     acpi_dsdt_add_fw_cfg(scope, &memmap[VIRT_FW_CFG]);
     acpi_dsdt_add_virtio(scope, &memmap[VIRT_MMIO],
-- 
1.8.3.1

