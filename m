Received: by 10.25.159.19 with SMTP id i19csp488771lfe;
        Fri, 15 Jan 2016 06:12:28 -0800 (PST)
X-Received: by 10.140.92.215 with SMTP id b81mr13912445qge.44.1452867148135;
        Fri, 15 Jan 2016 06:12:28 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b7si13494164qgb.59.2016.01.15.06.12.27
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 15 Jan 2016 06:12:28 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro.org
Received: from localhost ([::1]:47087 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aK575-0001ZH-Eb
	for alex.bennee@linaro.org; Fri, 15 Jan 2016 09:12:27 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58715)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <shannon.zhao@linaro.org>) id 1aK56o-0001CR-T5
	for qemu-arm@nongnu.org; Fri, 15 Jan 2016 09:12:11 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <shannon.zhao@linaro.org>) id 1aK56j-00067j-TA
	for qemu-arm@nongnu.org; Fri, 15 Jan 2016 09:12:10 -0500
Received: from mail-pa0-x230.google.com ([2607:f8b0:400e:c03::230]:34264)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <shannon.zhao@linaro.org>) id 1aK56j-00067b-N2
	for qemu-arm@nongnu.org; Fri, 15 Jan 2016 09:12:05 -0500
Received: by mail-pa0-x230.google.com with SMTP id uo6so380185112pac.1
	for <qemu-arm@nongnu.org>; Fri, 15 Jan 2016 06:12:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=HzYSyNbIHIM0LKwPS9UC0ZmtPGSDoxuinA4AemCmvPQ=;
	b=h8WTCozuTWY68wQZEugIfEclJU9pKe64R+L1OY46I/DyeUX3WsT80uymQ94jNNsTxU
	NKYXXECxY13+jnvigGVvjsZnongvh30ias31orLE6G/mdrc6jFQoe5yEalLEpZAKmNPN
	Oqw/P3LKEs6MhyQWJhRYbJxFSdWwcS1GOMTaY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=HzYSyNbIHIM0LKwPS9UC0ZmtPGSDoxuinA4AemCmvPQ=;
	b=QZLEd4z+POAwtDt8nCPcCSKUeH/twPMXgeMUfCgRrfCgGstd+vqG/iFJ/jEjif2UUu
	1O/7lOZ6vTvkoRn9urMY7+HM6farEVII2FhcvDUXM1ANBQL/PoNi2/o8Lpkeu4Za2g0Q
	gjVyCtiijDiR9RxyBXuG83sZqufBmSaMcyd8nIDzpHa7bxT/y85D7fE5+SR8ayxU6F1v
	/LucqhD6R6G4kRUC4QAmyAKadB/Rrrk1ou6AmDuSdFr2D0fn3IDlzWE5DKuIhB11V6mL
	R2igaiBqWboCMnQmNO9P3wwSSDFDkQMHo9d97D+Eodxa2jNKDqjeRbTLP+LWahkGN7qV
	NK+g==
X-Gm-Message-State: ALoCoQnBa4R06YBgMEf3Okh8a5Jbucea8lqXm7E1omlcxeFTL/74Wqn7pz+fW6onlY3TWlHhKs3/08rOGlD+3uvwyqSUiHIvKw==
X-Received: by 10.66.237.66 with SMTP id va2mr15282882pac.87.1452867124698;
	Fri, 15 Jan 2016 06:12:04 -0800 (PST)
Received: from localhost.localdomain ([39.183.91.190])
	by smtp.gmail.com with ESMTPSA id
	v26sm15908392pfi.56.2016.01.15.06.12.00
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 15 Jan 2016 06:12:03 -0800 (PST)
From: Shannon Zhao <shannon.zhao@linaro.org>
To: qemu-arm@nongnu.org
Date: Fri, 15 Jan 2016 22:11:31 +0800
Message-Id: <1452867091-4023-1-git-send-email-shannon.zhao@linaro.org>
X-Mailer: git-send-email 2.1.0
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400e:c03::230
Cc: peter.maydell@linaro.org, ard.biesheuvel@linaro.org, edk2-devel@ml01.01.org,
	qemu-devel@nongnu.org, zhaoshenglong@huawei.com, lersek@redhat.com
Subject: [Qemu-arm] [PATCH v3] ARM: Virt: Don't generate RTC ACPI device
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
X-TUID: 11QbKx3cp0QD

When booting the VM with UEFI, UEFI takes ownership of the RTC hardware.
While UEFI can use libfdt to disable the RTC device node in the DTB that
it passes to the OS, it cannot modify AML. Therefore, we won't generate
the RTC ACPI device at all when using UEFI.

Signed-off-by: Shannon Zhao <shannon.zhao@linaro.org>
Acked-by: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Reviewed-by: Laszlo Ersek <lersek@redhat.com>
---
V3: add comments to explain why it doesn't generate RTC ACPI device
---
 hw/arm/virt-acpi-build.c | 24 +++++-------------------
 1 file changed, 5 insertions(+), 19 deletions(-)

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index 0caf5ce..0d5c635 100644
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
@@ -571,12 +554,15 @@ build_dsdt(GArray *table_data, GArray *linker, VirtGuestInfo *guest_info)
     /* Reserve space for header */
     acpi_data_push(dsdt->buf, sizeof(AcpiTableHeader));
 
+    /* When booting the VM with UEFI, UEFI takes ownership of the RTC hardware.
+     * While UEFI can use libfdt to disable the RTC device node in the DTB that
+     * it passes to the OS, it cannot modify AML. Therefore, we won't generate
+     * the RTC ACPI device at all when using UEFI.
+     */
     scope = aml_scope("\\_SB");
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

