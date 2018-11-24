Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp3050583wrt;
        Sat, 24 Nov 2018 00:23:43 -0800 (PST)
X-Google-Smtp-Source: AFSGD/U3FaDZlTbcKsD2mToG3CHcwK6ulo4peQTgOQpnjK+zU0HxXG9u5bCS2im6n74AfSIztl37
X-Received: by 2002:a25:e80c:: with SMTP id k12-v6mr19832735ybd.218.1543047822933;
        Sat, 24 Nov 2018 00:23:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1543047822; cv=none;
        d=google.com; s=arc-20160816;
        b=SXIj+4wA8r5UyBDtdDcm0wOmnIKLj5VJCzZ78dEhPKHrL4jkolZRoCHYNLVwhWButN
         i+Ex49zUto378m1a2gXK/wmKDHPNBG6Gfxdb64Wf/OF5FYfxs/Kx0vcASgdIhG6dd0za
         +DmBD6Mi9BjnZuVjIE5AIe562wrSWhWbT8p60ZtZqEAFUamJN1k6CnA5ERSNTGgqG34s
         6oknNZS1mRp6VffhLan+o3d3o8PF8v0zJK6EupUnFQpbSc2pu+CHPhhpqMRN5wzgLcUk
         e3Um2XpICyyESPXMlY9YLy53YbUbTpQP9wt4SLC88UDMsvjIhqV183DWhq0Hn/ORA/JC
         TgBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from;
        bh=yHxRYF45j0kvjrO29sM1Vdsx4MNETuIPOQs0MdXwMFI=;
        b=vcOqBgVUPlyyIyJ+LaXsHFqckmq+K8hTXqPjhw24MGFWV9JUpWLwerwdwXiEAYD3H3
         Vdv2mUotSP3nu7SDAjizpyuIvhwO2weHzs0equaKQUMic2fH+CdxpOhf6d66PkSC5+UA
         z6BSTK4UA6S2Fo35Dg8hWN7XIoQppegP8H5y+2wVsFdEzwUs5QL6nFnRx+9A9d3t1jii
         Qp/M2kRd2VZ6+u8bKDlTemVUFo6WVBkcxuH8qn0VbXWZfUseIvT5PJ3auIXJ7BmpgLaF
         7K+VGgizBLWmPPTQGSCmU2JVAQim2taQ4MuUA0QwE/EqwIxCk+/U8vD+75uFz8Hk7W1H
         Hgsg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z2si13538533ywe.70.2018.11.24.00.23.42
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 24 Nov 2018 00:23:42 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:55649 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gQTE6-0002Vq-Dq
	for alex.bennee@linaro.org; Sat, 24 Nov 2018 03:23:42 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48086)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peng.hao2@zte.com.cn>) id 1gQTAs-00007J-U1
	for qemu-arm@nongnu.org; Sat, 24 Nov 2018 03:20:23 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peng.hao2@zte.com.cn>) id 1gQT44-0005j9-JM
	for qemu-arm@nongnu.org; Sat, 24 Nov 2018 03:13:23 -0500
Received: from out1.zte.com.cn ([202.103.147.172]:40450 helo=mxct.zte.com.cn)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <peng.hao2@zte.com.cn>)
	id 1gQT44-0005fa-5u; Sat, 24 Nov 2018 03:13:20 -0500
Received: from mse01.zte.com.cn (unknown [10.30.3.20])
	by Forcepoint Email with ESMTPS id 161AF58F3F72CE0E074B;
	Sat, 24 Nov 2018 16:13:03 +0800 (CST)
Received: from notes_smtp.zte.com.cn ([10.30.1.239])
	by mse01.zte.com.cn with ESMTP id wAO8Cufb023416;
	Sat, 24 Nov 2018 16:12:56 +0800 (GMT-8)
	(envelope-from peng.hao2@zte.com.cn)
Received: from localhost.localdomain.localdomain ([10.74.120.59])
	by szsmtp06.zte.com.cn (Lotus Domino Release 8.5.3FP6)
	with ESMTP id 2018112416134149-12697207 ;
	Sat, 24 Nov 2018 16:13:41 +0800 
From: Peng Hao <peng.hao2@zte.com.cn>
To: peter.maydell@linaro.org, drjones@redhat.com, philmd@redhat.com
Date: Sun, 25 Nov 2018 00:34:29 +0800
Message-Id: <1543077273-16201-6-git-send-email-peng.hao2@zte.com.cn>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1543077273-16201-1-git-send-email-peng.hao2@zte.com.cn>
References: <1543077273-16201-1-git-send-email-peng.hao2@zte.com.cn>
X-MIMETrack: Itemize by SMTP Server on SZSMTP06/server/zte_ltd(Release
	8.5.3FP6|November 21, 2013) at 2018-11-24 16:13:41,
	Serialize by Router on notes_smtp/zte_ltd(Release 9.0.1FP7|August  17,
	2016) at 2018-11-24 16:12:36,
	Serialize complete at 2018-11-24 16:12:36
X-MAIL: mse01.zte.com.cn wAO8Cufb023416
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 202.103.147.172
Subject: [Qemu-arm] [PATCH 06/10] hw/arm/virt: add pvpanic device in virt
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
X-TUID: E3U1hFKyL8w8

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

