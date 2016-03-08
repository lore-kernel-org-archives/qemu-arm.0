Received: by 10.25.208.211 with SMTP id h202csp1868937lfg;
        Tue, 8 Mar 2016 03:19:18 -0800 (PST)
X-Received: by 10.140.217.202 with SMTP id n193mr5525625qhb.101.1457435958630;
        Tue, 08 Mar 2016 03:19:18 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e203si2481218qhd.107.2016.03.08.03.19.18
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 08 Mar 2016 03:19:18 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:33797 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1adFfZ-0000HU-Vi
	for alex.bennee@linaro.org; Tue, 08 Mar 2016 06:19:18 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51393)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1adFfS-00005f-Gi
	for qemu-arm@nongnu.org; Tue, 08 Mar 2016 06:19:15 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1adFfP-0001B8-QA
	for qemu-arm@nongnu.org; Tue, 08 Mar 2016 06:19:10 -0500
Received: from mx1.redhat.com ([209.132.183.28]:60812)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>)
	id 1adFfP-0001B1-L8; Tue, 08 Mar 2016 06:19:07 -0500
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	by mx1.redhat.com (Postfix) with ESMTPS id 528E38E010;
	Tue,  8 Mar 2016 11:19:07 +0000 (UTC)
Received: from nilsson.home.kraxel.org (ovpn-116-59.ams2.redhat.com
	[10.36.116.59])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u28BJ585021045; Tue, 8 Mar 2016 06:19:06 -0500
Received: by nilsson.home.kraxel.org (Postfix, from userid 500)
	id B417082758; Tue,  8 Mar 2016 12:19:04 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue,  8 Mar 2016 12:18:59 +0100
Message-Id: <1457435941-17578-5-git-send-email-kraxel@redhat.com>
In-Reply-To: <1457435941-17578-1-git-send-email-kraxel@redhat.com>
References: <1457435941-17578-1-git-send-email-kraxel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: Peter Maydell <peter.maydell@linaro.org>,
	"Michael S. Tsirkin" <mst@redhat.com>, "Gabriel L. Somlo" <somlo@cmu.edu>,
	"open list:ARM ACPI Subsystem" <qemu-arm@nongnu.org>,
	Gerd Hoffmann <kraxel@redhat.com>, Shannon Zhao <zhaoshenglong@huawei.com>,
	Igor Mammedov <imammedo@redhat.com>
Subject: [Qemu-arm] [PULL 4/6] acpi: arm: add fw_cfg device node to dsdt
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
X-TUID: GEvhNJNWayzC

From: "Gabriel L. Somlo" <somlo@cmu.edu>

Add a fw_cfg device node to the ACPI DSDT. This is mostly
informational, as the authoritative fw_cfg MMIO region(s)
are listed in the Device Tree. However, since we are building
ACPI tables, we might as well be thorough while at it...

Signed-off-by: Gabriel Somlo <somlo@cmu.edu>
Reviewed-by: Laszlo Ersek <lersek@redhat.com>
Tested-by: Laszlo Ersek <lersek@redhat.com>
Reviewed-by: Marc Mar=C3=AD <markmb@redhat.com>
Reviewed-by: Shannon Zhao <shannon.zhao@linaro.org>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Message-id: 1455906029-25565-5-git-send-email-somlo@cmu.edu
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 hw/arm/virt-acpi-build.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index b8b3ece..6a86b2c 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -81,6 +81,20 @@ static void acpi_dsdt_add_uart(Aml *scope, const MemMa=
pEntry *uart_memmap,
     aml_append(scope, dev);
 }
=20
+static void acpi_dsdt_add_fw_cfg(Aml *scope, const MemMapEntry *fw_cfg_m=
emmap)
+{
+    Aml *dev =3D aml_device("FWCF");
+    aml_append(dev, aml_name_decl("_HID", aml_string("QEMU0002")));
+    /* device present, functioning, decoding, not shown in UI */
+    aml_append(dev, aml_name_decl("_STA", aml_int(0xB)));
+
+    Aml *crs =3D aml_resource_template();
+    aml_append(crs, aml_memory32_fixed(fw_cfg_memmap->base,
+                                       fw_cfg_memmap->size, AML_READ_WRI=
TE));
+    aml_append(dev, aml_name_decl("_CRS", crs));
+    aml_append(scope, dev);
+}
+
 static void acpi_dsdt_add_flash(Aml *scope, const MemMapEntry *flash_mem=
map)
 {
     Aml *dev, *crs;
@@ -549,6 +563,7 @@ build_dsdt(GArray *table_data, GArray *linker, VirtGu=
estInfo *guest_info)
     acpi_dsdt_add_uart(scope, &memmap[VIRT_UART],
                        (irqmap[VIRT_UART] + ARM_SPI_BASE));
     acpi_dsdt_add_flash(scope, &memmap[VIRT_FLASH]);
+    acpi_dsdt_add_fw_cfg(scope, &memmap[VIRT_FW_CFG]);
     acpi_dsdt_add_virtio(scope, &memmap[VIRT_MMIO],
                     (irqmap[VIRT_MMIO] + ARM_SPI_BASE), NUM_VIRTIO_TRANS=
PORTS);
     acpi_dsdt_add_pci(scope, memmap, (irqmap[VIRT_PCIE] + ARM_SPI_BASE),
--=20
1.8.3.1

