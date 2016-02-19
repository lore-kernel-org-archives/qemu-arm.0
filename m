Received: by 10.25.208.211 with SMTP id h202csp1295907lfg;
        Fri, 19 Feb 2016 10:20:45 -0800 (PST)
X-Received: by 10.140.234.16 with SMTP id f16mr18011894qhc.41.1455906043413;
        Fri, 19 Feb 2016 10:20:43 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g35si4477485qgf.101.2016.02.19.10.20.43
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 19 Feb 2016 10:20:43 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:54453 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aWpfW-0004hE-8R
	for alex.bennee@linaro.org; Fri, 19 Feb 2016 13:20:42 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54820)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <somlo@cmu.edu>) id 1aWpfQ-0004Z4-Bp
	for qemu-arm@nongnu.org; Fri, 19 Feb 2016 13:20:37 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <somlo@cmu.edu>) id 1aWpfO-0006Wy-NB
	for qemu-arm@nongnu.org; Fri, 19 Feb 2016 13:20:36 -0500
Received: from relay-06.andrew.cmu.edu ([128.2.157.21]:47175
	helo=relay.andrew.cmu.edu) by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <somlo@cmu.edu>)
	id 1aWpfO-0006Wg-Ii; Fri, 19 Feb 2016 13:20:34 -0500
Received: from HEDWIG.ini.cmu.edu (HEDWIG.INI.CMU.EDU [128.2.16.51])
	by relay.andrew.cmu.edu (8.14.8/8.14.8) with ESMTP id u1JIKTk6008851;
	Fri, 19 Feb 2016 13:20:29 -0500
From: "Gabriel L. Somlo" <somlo@cmu.edu>
To: qemu-devel@nongnu.org
Date: Fri, 19 Feb 2016 13:20:27 -0500
Message-Id: <1455906029-25565-4-git-send-email-somlo@cmu.edu>
X-Mailer: git-send-email 2.4.3
In-Reply-To: <1455906029-25565-1-git-send-email-somlo@cmu.edu>
References: <1455906029-25565-1-git-send-email-somlo@cmu.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.74 on 128.2.157.21
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by relay.andrew.cmu.edu id
	u1JIKTk6008851
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x
X-Received-From: 128.2.157.21
Cc: peter.maydell@linaro.org, ehabkost@redhat.com, mst@redhat.com,
	matt@codeblueprint.co.uk, stefanha@gmail.com,
	ard.biesheuvel@linaro.org, leif.lindholm@linaro.org,
	luto@amacapital.net, qemu-arm@nongnu.org, kraxel@redhat.com,
	pbonzini@redhat.com, imammedo@redhat.com, lersek@redhat.com,
	rth@twiddle.net
Subject: [Qemu-arm] [PATCH v9 3/5] acpi: pc: add fw_cfg device node to dsdt
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
X-TUID: y9Us2krGADwv

Add a fw_cfg device node to the ACPI DSDT. While the guest-side
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
index 4554eb8..915fddd 100644
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
+        scope =3D aml_scope("\\_SB.PCI0");
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

