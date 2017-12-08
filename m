Received: by 10.223.159.74 with SMTP id f10csp709941wrg;
        Fri, 8 Dec 2017 07:02:41 -0800 (PST)
X-Google-Smtp-Source: AGs4zMbmR59M4s6qHhzyHBG8vyHWM+j1b/0fwhqXVEfBJi2NjiIWU6NNVTIWq08FpECxJn8wy4Sr
X-Received: by 10.37.139.15 with SMTP id i15mr21477763ybl.362.1512745361089;
        Fri, 08 Dec 2017 07:02:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1512745361; cv=none;
        d=google.com; s=arc-20160816;
        b=J7XqdwsXYmnk+LECccTPF+JAihkOjwypKbqPTnbUvvpclD2h/qdN+DsGXaISrHWJyG
         8TSt6HXlOMD0eQG9PiGhwa72vYg09o3gzJfkyQGgE0dIqR93IzNppyFUfbLNB9ZzeegX
         4S2Ylcb05RQRmCXTxfcTzUdbzq+/9v/cgoI78n/HbxluNmjp7qzP1bgM2XDtrVVub+YT
         DL2FG83OW/12NDvL2B03QRFfTLSeNItAvwff+W1x4vnfgDVHE6wDHd1yVQV9rwv31/jD
         2fX+UoCqXCyVuIlTMV98Wi8/cQPQEgimoeaXNKWnj17rkZJhjBFqAYoYbkthLhKs7U9H
         fWkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=6VAeUTzDZQehRD+xqkw8Xtl+DXvyTFxn0tpvyZdzXTg=;
        b=vEmr2OyfZi6twIJd7sRFvnS/y46NY5dKDEd1UuL/uqvhDByHnJE+jdd/SSpWrh7cE5
         7lFdICLICjBeoBrIvDatqYxk24G/5SHMVeZZHyyP+KvzPMlOjj7JtKBVPI1X8bVi5Ajf
         /I8/2xIBMf3LvlCZ93CeUvuZx55OHf5EDug7gEWzvsuRznHnyT+wIp5a5WOSXipzg1de
         PfO0Hkx6EqqvVHwuqskR0PhUQ1C4t4vZ2gXFDTx7pCz2jZqjjil779MPvMEVrkWkd9zF
         cQ+RaCr60rf9THyOFXjBh/3Y6woKiEFk/ZViDYKzBmRYdyU5YL/QkThGCAdUaSJE0Vgw
         80wA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d71si1581212ybf.763.2017.12.08.07.02.40
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 08 Dec 2017 07:02:41 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37635 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eNKAi-0000g9-IY
	for alex.bennee@linaro.org; Fri, 08 Dec 2017 10:02:40 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51933)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1eNKAI-0000be-Gf
	for qemu-arm@nongnu.org; Fri, 08 Dec 2017 10:02:20 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1eNKAH-0007L2-Ma
	for qemu-arm@nongnu.org; Fri, 08 Dec 2017 10:02:14 -0500
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:38946)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1eNKAH-0007Jn-GE; Fri, 08 Dec 2017 10:02:13 -0500
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1eNKAF-0000uJ-HF; Fri, 08 Dec 2017 15:02:11 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Fri,  8 Dec 2017 15:02:08 +0000
Message-Id: <1512745328-5109-4-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1512745328-5109-1-git-send-email-peter.maydell@linaro.org>
References: <1512745328-5109-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 3/3] hw/arm/virt-acpi-build: Add second UART to
 ACPI tables
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
Cc: "Jason A . Donenfeld" <Jason@zx2c4.com>,
	Shannon Zhao <shannon.zhao@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: n92fH2Tx1qR+

Add the second UART to the ACPI tables.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
Pure guesswork, as I don't have a UEFI setup to hand and
am not familiar with ACPI table formats either...
---
 hw/arm/virt-acpi-build.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index 3d78ff6..a38287b 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -689,6 +689,7 @@ static void build_fadt(GArray *table_data, BIOSLinker *linker,
 static void
 build_dsdt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
 {
+    VirtMachineClass *vmc = VIRT_MACHINE_GET_CLASS(vms);
     Aml *scope, *dsdt;
     const MemMapEntry *memmap = vms->memmap;
     const int *irqmap = vms->irqmap;
@@ -706,6 +707,10 @@ build_dsdt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
     acpi_dsdt_add_cpus(scope, vms->smp_cpus);
     acpi_dsdt_add_uart(scope, &memmap[VIRT_UART],
                        (irqmap[VIRT_UART] + ARM_SPI_BASE));
+    if (!vmc->no_second_uart) {
+        acpi_dsdt_add_uart(scope, &memmap[VIRT_UART_2],
+                           (irqmap[VIRT_UART_2] + ARM_SPI_BASE));
+    }
     acpi_dsdt_add_flash(scope, &memmap[VIRT_FLASH]);
     acpi_dsdt_add_fw_cfg(scope, &memmap[VIRT_FW_CFG]);
     acpi_dsdt_add_virtio(scope, &memmap[VIRT_MMIO],
-- 
2.7.4

