Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp7767129wrw;
        Thu, 15 Nov 2018 18:29:08 -0800 (PST)
X-Google-Smtp-Source: AJdET5fnPYA/6uk3KgvJx1jtDq7l8lXDItSjNpx3nNZ22Y+VmichJ7EymW2p6dX+zCPNdg2kb0o2
X-Received: by 2002:ac8:528b:: with SMTP id s11mr8082766qtn.199.1542335348890;
        Thu, 15 Nov 2018 18:29:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542335348; cv=none;
        d=google.com; s=arc-20160816;
        b=TbxsfuixkHVE16+jUQraAjw+unzb76hECqsHdP8uQkHRFzYIpVyyJ9VKHxN9VKrqvj
         4MnGk3N0VtEBsHq36sNAAj5XTgc6xHpBIxFH+PaRURswY+VfaV2x5urYVBpaCGcEjABf
         jHBsLj6XVPU8dihRq3itvS4h9KmlAzlGDpdcD1N+FUikNDkDwsnvhoHyVvQGOriyIBTo
         V8RaaTk60ILl9B5yIUu2U0N+l+H7xzxGBnKLIz90EKptvmyEWUXju8lUr9XjL9LHSrSc
         rHhmcz7FkPaU5nsMExjxy0eSVGgfosN19UnOsFPHkDZ5UPw3dYe4AxKowNT/Bj1neQLP
         IeSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from;
        bh=ophLrsglzP9kGx0nnV9HxdEkTOSQqwVpDY2HoWdREEg=;
        b=uD6r4qmLdXj6gWhSkRmPYFHGddisw7S8B4KWV2vCv3RRfCLca/KJoAeX5q+2Jzq6xn
         au7+K8dW0Ak48ad4I4yPipeiLKUUtrPA0o3l0qWN8EEkArTAjrVSr+AmNSnoP4LmAH1K
         /ulzX+qKp4CWpnwgDzoeyTN/Yyqs1Ku2ynsLFYKwA3rIbq4a9MgEYY6PteoeRUjckLc1
         KZZyNG/Rfdg4agrqM53rhg4D4hfGCKVKtgszLMAi7nQMgVDRhGB4vQfxdP3M/+XmdyqO
         dAMDI8NQRuuTA6pukbq5q3ehgXyBnxuZfDvhUziJUpSir195Bm1SszFi9PgchrszhVlB
         65/A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b10si5926863qvt.55.2018.11.15.18.29.08
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 15 Nov 2018 18:29:08 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:41804 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gNTsa-0003jd-9i
	for alex.bennee@linaro.org; Thu, 15 Nov 2018 21:29:08 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42896)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peng.hao2@zte.com.cn>) id 1gNTsI-0003fB-4f
	for qemu-arm@nongnu.org; Thu, 15 Nov 2018 21:28:51 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peng.hao2@zte.com.cn>) id 1gNTsD-0001K3-9g
	for qemu-arm@nongnu.org; Thu, 15 Nov 2018 21:28:49 -0500
Received: from out1.zte.com.cn ([202.103.147.172]:35564 helo=mxct.zte.com.cn)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <peng.hao2@zte.com.cn>)
	id 1gNTsB-0000i3-Ld; Thu, 15 Nov 2018 21:28:44 -0500
Received: from mse01.zte.com.cn (unknown [10.30.3.20])
	by Forcepoint Email with ESMTPS id 38BEA11F91C32BF7671E;
	Fri, 16 Nov 2018 10:27:59 +0800 (CST)
Received: from notes_smtp.zte.com.cn ([10.30.1.239])
	by mse01.zte.com.cn with ESMTP id wAG2RnbJ028749;
	Fri, 16 Nov 2018 10:27:49 +0800 (GMT-8)
	(envelope-from peng.hao2@zte.com.cn)
Received: from localhost.localdomain.localdomain ([10.74.120.59])
	by szsmtp06.zte.com.cn (Lotus Domino Release 8.5.3FP6)
	with ESMTP id 2018111610282516-11036271 ;
	Fri, 16 Nov 2018 10:28:25 +0800 
From: Peng Hao <peng.hao2@zte.com.cn>
To: peter.maydell@linaro.org, drjones@redhat.com, philmd@redhat.com
Date: Fri, 16 Nov 2018 18:50:05 +0800
Message-Id: <1542365406-81310-6-git-send-email-peng.hao2@zte.com.cn>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1542365406-81310-1-git-send-email-peng.hao2@zte.com.cn>
References: <1542365406-81310-1-git-send-email-peng.hao2@zte.com.cn>
X-MIMETrack: Itemize by SMTP Server on SZSMTP06/server/zte_ltd(Release
	8.5.3FP6|November 21, 2013) at 2018-11-16 10:28:25,
	Serialize by Router on notes_smtp/zte_ltd(Release 9.0.1FP7|August  17,
	2016) at 2018-11-16 10:27:34,
	Serialize complete at 2018-11-16 10:27:34
X-MAIL: mse01.zte.com.cn wAG2RnbJ028749
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 202.103.147.172
Subject: [Qemu-arm] [PATCH V7 5/6] hw/arm/virt: add pvpanic device in virt
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
X-TUID: XjaTX+qPqXFX

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
+    Aml *dev = aml_device("PEVT");
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

