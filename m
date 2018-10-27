Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp1768634wro;
        Sat, 27 Oct 2018 02:57:37 -0700 (PDT)
X-Google-Smtp-Source: AJdET5cO1gL2kp2bYdhs/5dQIyHP60Ypo7zy8D+3wC0qGpczW8NoiiknGNi0mVnr26QyP+hl9PP0
X-Received: by 2002:ac8:1aa8:: with SMTP id x37-v6mr6205675qtj.44.1540634257041;
        Sat, 27 Oct 2018 02:57:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1540634257; cv=none;
        d=google.com; s=arc-20160816;
        b=iqAZDHLUrDN4djN+4cAcUyalCSBX7kQzsR/x6GOg2+Y9lgywEfHsW6C6G13UTEgNQC
         HDmc0NTxORN9dgmeZZY+r6HlQP/FqhUMJtHlktkhl6VrZIZf4mv5CZKCaeRBfbvyC2cu
         630XRDW+titgt3jbVu2ctmEb4u0BkRZitJT/yDWxIg2g8Z8akjdyuPvGkiOhuSATq3R4
         O4fzIPyWHh5ZU5JHH0vXI+9RzvDR3wKGsMspF3pzKj5ojL05jiOJgtU9mJCTRfw+Ds1u
         jj+Ng4q/mfa6KiGcE07RVPNvENzxtruM28LfGVej/HgDYOyMfmN/aAFSuS6PlVwaOGHg
         LOxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from;
        bh=msNGHUjP5Tfsg+r3T2wgHMZZJoZCugup/gj2zLjhXyQ=;
        b=yoDOxIslJ+JCyUhQ2Ubgr24sDRWOr/En6jHhMjTWoCJDfNu6akqr5RZlSu2yvJZTL3
         CXAqUXYJvXgGgYFEnyvC2HBzQqdu+DuT11MfhDMd8eS7Qzn9bjhvFLruKjZF5KrK+OFb
         3fVRkdeaT+b3s580GyBvxKEpVtTmmwCC19MpCsG/QPvyp0d9ApvwV4vTdoCaKEbbDJo6
         i1atLW3r3QTxpK1zJu7juOG3bWc0edbFFN5BmaX7G5L67e5h4zBTJ31L2wrsPub9PW8T
         2wkfp6cZp5E1Dbl7fL8nn9Rw32ohhoK1+axu9ky3LLj9832/Xonr/+idKgDBheG4Bg0E
         ursw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a9-v6si6151638qtk.44.2018.10.27.02.57.36
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 27 Oct 2018 02:57:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:35828 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gGLLc-0006My-Er
	for alex.bennee@linaro.org; Sat, 27 Oct 2018 05:57:36 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50929)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peng.hao2@zte.com.cn>) id 1gGLL4-00067j-55
	for qemu-arm@nongnu.org; Sat, 27 Oct 2018 05:57:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peng.hao2@zte.com.cn>) id 1gGLL3-0003UJ-Bu
	for qemu-arm@nongnu.org; Sat, 27 Oct 2018 05:57:02 -0400
Received: from out1.zte.com.cn ([202.103.147.172]:48166 helo=mxct.zte.com.cn)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <peng.hao2@zte.com.cn>)
	id 1gGLL2-0003Nt-UV; Sat, 27 Oct 2018 05:57:01 -0400
Received: from mse01.zte.com.cn (unknown [10.30.3.20])
	by Forcepoint Email with ESMTPS id 53D3E9913E022132F7FB;
	Sat, 27 Oct 2018 17:56:54 +0800 (CST)
Received: from notes_smtp.zte.com.cn ([10.30.1.239])
	by mse01.zte.com.cn with ESMTP id w9R9umqA070717;
	Sat, 27 Oct 2018 17:56:48 +0800 (GMT-8)
	(envelope-from peng.hao2@zte.com.cn)
Received: from localhost.localdomain.localdomain ([10.74.120.59])
	by szsmtp06.zte.com.cn (Lotus Domino Release 8.5.3FP6)
	with ESMTP id 2018102717573554-7044946 ;
	Sat, 27 Oct 2018 17:57:35 +0800 
From: Peng Hao <peng.hao2@zte.com.cn>
To: peter.maydell@linaro.org, philmd@redhat.com
Date: Sun, 28 Oct 2018 02:07:30 +0800
Message-Id: <1540663650-106694-6-git-send-email-peng.hao2@zte.com.cn>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1540663650-106694-1-git-send-email-peng.hao2@zte.com.cn>
References: <1540663650-106694-1-git-send-email-peng.hao2@zte.com.cn>
X-MIMETrack: Itemize by SMTP Server on SZSMTP06/server/zte_ltd(Release
	8.5.3FP6|November 21, 2013) at 2018-10-27 17:57:35,
	Serialize by Router on notes_smtp/zte_ltd(Release 9.0.1FP7|August  17,
	2016) at 2018-10-27 17:56:28,
	Serialize complete at 2018-10-27 17:56:28
X-MAIL: mse01.zte.com.cn w9R9umqA070717
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 202.103.147.172
Subject: [Qemu-arm] [PATCH V5 5/5] hw/arm/virt: add pvpanic device in virt
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
X-TUID: 8Qi5e8+B/CJ9

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

