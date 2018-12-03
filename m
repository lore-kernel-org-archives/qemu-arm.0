Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp6646711wrt;
        Mon, 3 Dec 2018 03:04:44 -0800 (PST)
X-Google-Smtp-Source: AFSGD/V+wpiqLipdDMszjrjnQ4mcqD6U1zKMPqWi373kQhOaXmnTleq8t++C5IIVTgulakmREnLT
X-Received: by 2002:a25:7bc3:: with SMTP id w186-v6mr14157885ybc.18.1543835084757;
        Mon, 03 Dec 2018 03:04:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1543835084; cv=none;
        d=google.com; s=arc-20160816;
        b=xhhHSRlvnH62Ess9EkLnDUCSEN3g6wUCxHUicP5hwUtwWOtw8DjLkG/6axrKan+/6u
         4NAMJQQYgwQoYdVChACTkj8F4umaEJGs4EtZZACeMLNs0pEyxQ+dWHuok1fEj6hf6yzl
         qDDDzcbvGZRDpoVQHj3x2P7XwJUc1blaU1UaxQJGoqZHDYHev649MhTJV1tItBAiXLtk
         wNramyoKvhA3V1lJUgqUndjYirtWiEoBiBT0tg41wh1POwDg/baMBQMCmRd+GvoPBD/Y
         nKIIJZvF3aWWCnDQ038KsCcY7PaxzRzMS3zWMPR2cEMkhz5FEk7gLIWobPsjTUA6z2nE
         vuVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from;
        bh=Hc8hBnKn6+aVBcfkLQoGRDShAtcE0ObIdHdJMoKbn+w=;
        b=CFCE4HahMd3N6tBIEi0DsBlA2aqPbtaYLzNABiPXlT0Boaxtz0kt6jGfM2/ac1NCwl
         n6lVmrQkcP+O+NuQ1We0uGBKCwJiKyZie6L0UBbHJ3U3UCUun3QhW4J9pWjECijXtfOQ
         CW3g242l5gBjWWK9/qgd1vW/BBEm63CCXhwbTcio7rENAK/rIJM1ZmD4h0/O8gaoPcYe
         Wa1gQNrM88Wq3hws4ZepyUcQ3MEnH2g84t4gKWxYTIz0MlDuSXjuQX83fMQrZFrcw3Q3
         qYtKotOKIcCYXTuIsuahScVFWmoEjX4h+VSitHV47ovKeLg3UPoWkZgvDaK3iNSl0NrF
         TSxA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f4-v6si7730018ybi.300.2018.12.03.03.04.44
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 03 Dec 2018 03:04:44 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:47935 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gTm1s-00045q-6L
	for alex.bennee@linaro.org; Mon, 03 Dec 2018 06:04:44 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51772)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peng.hao2@zte.com.cn>) id 1gTm1f-00045T-A3
	for qemu-arm@nongnu.org; Mon, 03 Dec 2018 06:04:32 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peng.hao2@zte.com.cn>) id 1gTm1d-0002bA-7y
	for qemu-arm@nongnu.org; Mon, 03 Dec 2018 06:04:31 -0500
Received: from mxhk.zte.com.cn ([63.217.80.70]:21058)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <peng.hao2@zte.com.cn>)
	id 1gTm1c-0002Vb-Rr; Mon, 03 Dec 2018 06:04:29 -0500
Received: from mse01.zte.com.cn (unknown [10.30.3.20])
	by Forcepoint Email with ESMTPS id CD550FBD82A3FDE94569;
	Mon,  3 Dec 2018 19:04:22 +0800 (CST)
Received: from notes_smtp.zte.com.cn ([10.30.1.239])
	by mse01.zte.com.cn with ESMTP id wB3B4B5O097910;
	Mon, 3 Dec 2018 19:04:11 +0800 (GMT-8)
	(envelope-from peng.hao2@zte.com.cn)
Received: from localhost.localdomain.localdomain ([10.74.120.59])
	by szsmtp06.zte.com.cn (Lotus Domino Release 8.5.3FP6)
	with ESMTP id 2018120319041931-14451319 ;
	Mon, 3 Dec 2018 19:04:19 +0800 
From: Peng Hao <peng.hao2@zte.com.cn>
To: peter.maydell@linaro.org, drjones@redhat.com, philmd@redhat.com
Date: Tue, 4 Dec 2018 03:26:46 +0800
Message-Id: <1543865209-50994-6-git-send-email-peng.hao2@zte.com.cn>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1543865209-50994-1-git-send-email-peng.hao2@zte.com.cn>
References: <1543865209-50994-1-git-send-email-peng.hao2@zte.com.cn>
X-MIMETrack: Itemize by SMTP Server on SZSMTP06/server/zte_ltd(Release
	8.5.3FP6|November 21, 2013) at 2018-12-03 19:04:19,
	Serialize by Router on notes_smtp/zte_ltd(Release 9.0.1FP7|August  17,
	2016) at 2018-12-03 19:04:11,
	Serialize complete at 2018-12-03 19:04:11
X-MAIL: mse01.zte.com.cn wB3B4B5O097910
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 63.217.80.70
Subject: [Qemu-arm] [PATCH V11 5/8] hw/arm/virt: add pvpanic device in virt
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
X-TUID: ePmLPYSkbtNy

Add pvpanic device in virt acpi table, so when kernel command line
uses acpi=force, kernel can get info from acpi table.

Reviewed-by: Andrew Jones <drjones@redhat.com>
Signed-off-by: Peng Hao <peng.hao2@zte.com.cn>
---
 hw/arm/virt-acpi-build.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index 5785fb6..4215ca6 100644
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
+               pvpanic_memmap->size, AML_READ_WRITE));
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

