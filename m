Received: by 10.25.159.19 with SMTP id i19csp1168749lfe;
        Wed, 13 Jan 2016 06:54:51 -0800 (PST)
X-Received: by 10.140.39.179 with SMTP id v48mr177340097qgv.98.1452696891529;
        Wed, 13 Jan 2016 06:54:51 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 139si1682746qhe.1.2016.01.13.06.54.51
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 13 Jan 2016 06:54:51 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro.org
Received: from localhost ([::1]:37476 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aJMp1-0008NS-7l
	for alex.bennee@linaro.org; Wed, 13 Jan 2016 09:54:51 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51209)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <shannon.zhao@linaro.org>) id 1aJMoy-0008Ld-3v
	for qemu-arm@nongnu.org; Wed, 13 Jan 2016 09:54:49 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <shannon.zhao@linaro.org>) id 1aJMot-0004Ct-0C
	for qemu-arm@nongnu.org; Wed, 13 Jan 2016 09:54:48 -0500
Received: from mail-pf0-x22a.google.com ([2607:f8b0:400e:c00::22a]:33192)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <shannon.zhao@linaro.org>) id 1aJMos-0004Ch-Gg
	for qemu-arm@nongnu.org; Wed, 13 Jan 2016 09:54:42 -0500
Received: by mail-pf0-x22a.google.com with SMTP id e65so82711823pfe.0
	for <qemu-arm@nongnu.org>; Wed, 13 Jan 2016 06:54:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=hrCqp76yLfyL/XsKC9JFQ2tcnIfgX9psLIXlR43p4M0=;
	b=S9pnYxs1iJBymmS0lATdfJWopMrKWTqy1XYPQZBPl7h0mHTrEkMqDKeubujnHqdJ7n
	WNaMHyUiglAnHriqOay4hwF+PI7B5wQwZ4S1UMvemJlNascNo2Dt+bAbGmbvWSquImyQ
	pAB8EEA3ZFQpWd9qi+yae7564t41sVeAQRYmA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=hrCqp76yLfyL/XsKC9JFQ2tcnIfgX9psLIXlR43p4M0=;
	b=Ty7oINux/s5mQzhIN3o6eemFTMHS5DiHbWKoC7bU2VVsa+UEeFGfBBAXNa3RpSZDgO
	LY3IbysCV2PjrBye27FmfesTf5cvr587NlAU2rOshp0ZKqLTaSBzqP1duSwxvBrrneA3
	GoOPC9PtqmW/F3d7B2bRTWZAPtHNK85dBk8+FHxVVhkgqAMLD4G9JuICdWTwWe+kY4MO
	4lTeHuuzeWyHyIJoQT145pmk3Yd4Dd+0x5q5qFLisfocgZ++vJeS0REfjpAzdImhEUB2
	c2GHsjck/OoB2OiT3XjU7gsPmQyYEuzsnHSTxJfj/wUbHgxfLuP0438rJ5mRvSecIv1S
	EDhA==
X-Gm-Message-State: ALoCoQmV0H6bPdPG21d2+wlu0FlLHZe8ELKD/6AecGUcmE/H7uf9SUfwHBD9Jfyk9l+WBg0FKY5a9l/HnUHQcdsLlKIRtHVkQA==
X-Received: by 10.98.67.139 with SMTP id l11mr43230075pfi.66.1452696881828;
	Wed, 13 Jan 2016 06:54:41 -0800 (PST)
Received: from localhost.localdomain ([39.182.11.117])
	by smtp.gmail.com with ESMTPSA id
	w82sm3175816pfi.95.2016.01.13.06.54.37
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 13 Jan 2016 06:54:40 -0800 (PST)
From: Shannon Zhao <shannon.zhao@linaro.org>
To: qemu-arm@nongnu.org
Date: Wed, 13 Jan 2016 22:54:17 +0800
Message-Id: <1452696857-4091-1-git-send-email-shannon.zhao@linaro.org>
X-Mailer: git-send-email 2.1.0
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400e:c00::22a
Cc: peter.maydell@linaro.org, ard.biesheuvel@linaro.org, edk2-devel@ml01.01.org,
	qemu-devel@nongnu.org, zhaoshenglong@huawei.com, lersek@redhat.com
Subject: [Qemu-arm] [PATCH v2] ARM: Virt: Don't generate RTC ACPI device
	when using UEFI
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: UCwteU5begDt

When booting the VM with UEFI, UEFI takes ownership of the RTC hardware.
While UEFI can use libfdt to disable the RTC device node in the DTB that
it passes to the OS, it cannot modify AML. Therefore, we won't generate
the RTC ACPI device at all when using UEFI.

Signed-off-by: Shannon Zhao <shannon.zhao@linaro.org>
---
v2: just totally don't generate the RTC ACPI device when using UEFI
---
 hw/arm/virt-acpi-build.c | 19 -------------------
 1 file changed, 19 deletions(-)

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index 0caf5ce..ac568a3 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -94,23 +94,6 @@ static void acpi_dsdt_add_uart(Aml *scope, const MemMapEntry *uart_memmap,
     aml_append(scope, dev);
 }
 
-static void acpi_dsdt_add_rtc(Aml *scope, const MemMapEntry *rtc_memmap,
-                                          uint32_t rtc_irq)
-{
-    Aml *dev = aml_device("RTC0");
-    aml_append(dev, aml_name_decl("_HID", aml_string("LNRO0013")));
-    aml_append(dev, aml_name_decl("_UID", aml_int(0)));
-
-    Aml *crs = aml_resource_template();
-    aml_append(crs, aml_memory32_fixed(rtc_memmap->base,
-                                       rtc_memmap->size, AML_READ_WRITE));
-    aml_append(crs,
-               aml_interrupt(AML_CONSUMER, AML_LEVEL, AML_ACTIVE_HIGH,
-                             AML_EXCLUSIVE, &rtc_irq, 1));
-    aml_append(dev, aml_name_decl("_CRS", crs));
-    aml_append(scope, dev);
-}
-
 static void acpi_dsdt_add_flash(Aml *scope, const MemMapEntry *flash_memmap)
 {
     Aml *dev, *crs;
@@ -575,8 +558,6 @@ build_dsdt(GArray *table_data, GArray *linker, VirtGuestInfo *guest_info)
     acpi_dsdt_add_cpus(scope, guest_info->smp_cpus);
     acpi_dsdt_add_uart(scope, &memmap[VIRT_UART],
                        (irqmap[VIRT_UART] + ARM_SPI_BASE));
-    acpi_dsdt_add_rtc(scope, &memmap[VIRT_RTC],
-                      (irqmap[VIRT_RTC] + ARM_SPI_BASE));
     acpi_dsdt_add_flash(scope, &memmap[VIRT_FLASH]);
     acpi_dsdt_add_virtio(scope, &memmap[VIRT_MMIO],
                     (irqmap[VIRT_MMIO] + ARM_SPI_BASE), NUM_VIRTIO_TRANSPORTS);
-- 
2.1.0

