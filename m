Received: by 10.25.159.19 with SMTP id i19csp2703357lfe;
        Wed, 10 Feb 2016 12:42:43 -0800 (PST)
X-Received: by 10.140.222.146 with SMTP id s140mr54180411qhb.24.1455136960747;
        Wed, 10 Feb 2016 12:42:40 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q7si5416981qhb.86.2016.02.10.12.42.40
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 10 Feb 2016 12:42:40 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:42942 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aTbay-0008JN-88
	for alex.bennee@linaro.org; Wed, 10 Feb 2016 15:42:40 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58309)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <somlo@cmu.edu>) id 1aTbaB-0007AU-3F
	for qemu-devel@nongnu.org; Wed, 10 Feb 2016 15:41:51 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <somlo@cmu.edu>) id 1aTba9-0008O6-Ut
	for qemu-devel@nongnu.org; Wed, 10 Feb 2016 15:41:50 -0500
Received: from relay-05.andrew.cmu.edu ([128.2.157.12]:39548
	helo=relay.andrew.cmu.edu) by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <somlo@cmu.edu>)
	id 1aTba4-0008K1-9A; Wed, 10 Feb 2016 15:41:44 -0500
Received: from HEDWIG.ini.cmu.edu (HEDWIG.INI.CMU.EDU [128.2.16.51])
	by relay.andrew.cmu.edu (8.14.7/8.14.7) with ESMTP id u1AKfeYD004670;
	Wed, 10 Feb 2016 15:41:40 -0500
From: "Gabriel L. Somlo" <somlo@cmu.edu>
To: qemu-devel@nongnu.org
Date: Wed, 10 Feb 2016 15:41:38 -0500
Message-Id: <1455136900-22334-4-git-send-email-somlo@cmu.edu>
X-Mailer: git-send-email 2.4.3
In-Reply-To: <1455136900-22334-1-git-send-email-somlo@cmu.edu>
References: <1455136900-22334-1-git-send-email-somlo@cmu.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.74 on 128.2.157.12
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by relay.andrew.cmu.edu id
	u1AKfeYD004670
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x
X-Received-From: 128.2.157.12
Cc: peter.maydell@linaro.org, ehabkost@redhat.com, mst@redhat.com,
	matt@codeblueprint.co.uk, stefanha@gmail.com,
	ard.biesheuvel@linaro.org, leif.lindholm@linaro.org,
	luto@amacapital.net, qemu-arm@nongnu.org, kraxel@redhat.com,
	pbonzini@redhat.com, imammedo@redhat.com, lersek@redhat.com,
	rth@twiddle.net
Subject: [Qemu-devel] [PATCH v7 3/5] acpi: pc: add fw_cfg device node to ssdt
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: DN/mmAezroKj

Add a fw_cfg device node to the ACPI SSDT. While the guest-side
firmware can't utilize this information (since it has to access
the hard-coded fw_cfg device to extract ACPI tables to begin with),
having fw_cfg listed in ACPI will help the guest kernel keep a more
accurate inventory of in-use IO port regions.

Signed-off-by: Gabriel Somlo <somlo@cmu.edu>
Reviewed-by: Laszlo Ersek <lersek@redhat.com>
Reviewed-by: Marc Mar=C3=AD <markmb@redhat.com>
---
 hw/i386/acpi-build.c | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index 4554eb8..4762fd2 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -2190,6 +2190,35 @@ build_dsdt(GArray *table_data, GArray *linker,
     aml_append(scope, aml_name_decl("_S5", pkg));
     aml_append(dsdt, scope);
=20
+    /* create fw_cfg node, unconditionally */
+    {
+        /* when using port i/o, the 8-bit data register *always* overlap=
s
+         * with half of the 16-bit control register. Hence, the total si=
ze
+         * of the i/o region used is FW_CFG_CTL_SIZE; when using DMA, th=
e
+         * DMA control register is located at FW_CFG_DMA_IO_BASE + 4 */
+        uint8_t io_size =3D object_property_get_bool(OBJECT(pcms->fw_cfg=
),
+                                                   "dma_enabled", NULL) =
?
+                          ROUND_UP(FW_CFG_CTL_SIZE, 4) + sizeof(dma_addr=
_t) :
+                          FW_CFG_CTL_SIZE;
+
+        scope =3D aml_scope("\\_SB");
+        dev =3D aml_device("FWCF");
+
+        aml_append(dev, aml_name_decl("_HID", aml_string("QEMU0002")));
+
+        /* device present, functioning, decoding, not shown in UI */
+        aml_append(dev, aml_name_decl("_STA", aml_int(0xB)));
+
+        crs =3D aml_resource_template();
+        aml_append(crs,
+            aml_io(AML_DECODE16, FW_CFG_IO_BASE, FW_CFG_IO_BASE, 0x01, i=
o_size)
+        );
+        aml_append(dev, aml_name_decl("_CRS", crs));
+
+        aml_append(scope, dev);
+        aml_append(dsdt, scope);
+    }
+
     if (misc->applesmc_io_base) {
         scope =3D aml_scope("\\_SB.PCI0.ISA");
         dev =3D aml_device("SMC");
--=20
2.4.3

