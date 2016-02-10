Received: by 10.25.159.19 with SMTP id i19csp2703331lfe;
        Wed, 10 Feb 2016 12:42:39 -0800 (PST)
X-Received: by 10.140.131.17 with SMTP id 17mr54585422qhd.12.1455136959330;
        Wed, 10 Feb 2016 12:42:39 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 16si5427806qhn.71.2016.02.10.12.42.39
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 10 Feb 2016 12:42:39 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:42940 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aTbaw-0008Fw-TX
	for alex.bennee@linaro.org; Wed, 10 Feb 2016 15:42:38 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58299)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <somlo@cmu.edu>) id 1aTbaA-0007AL-O5
	for qemu-devel@nongnu.org; Wed, 10 Feb 2016 15:41:51 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <somlo@cmu.edu>) id 1aTba9-0008Nq-KK
	for qemu-devel@nongnu.org; Wed, 10 Feb 2016 15:41:50 -0500
Received: from relay-05.andrew.cmu.edu ([128.2.157.12]:39547
	helo=relay.andrew.cmu.edu) by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <somlo@cmu.edu>)
	id 1aTba5-0008Js-Bt; Wed, 10 Feb 2016 15:41:45 -0500
Received: from HEDWIG.ini.cmu.edu (HEDWIG.INI.CMU.EDU [128.2.16.51])
	by relay.andrew.cmu.edu (8.14.7/8.14.7) with ESMTP id u1AKfeYC004670;
	Wed, 10 Feb 2016 15:41:40 -0500
From: "Gabriel L. Somlo" <somlo@cmu.edu>
To: qemu-devel@nongnu.org
Date: Wed, 10 Feb 2016 15:41:37 -0500
Message-Id: <1455136900-22334-3-git-send-email-somlo@cmu.edu>
X-Mailer: git-send-email 2.4.3
In-Reply-To: <1455136900-22334-1-git-send-email-somlo@cmu.edu>
References: <1455136900-22334-1-git-send-email-somlo@cmu.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.74 on 128.2.157.12
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by relay.andrew.cmu.edu id
	u1AKfeYC004670
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x
X-Received-From: 128.2.157.12
Cc: peter.maydell@linaro.org, ehabkost@redhat.com, mst@redhat.com,
	matt@codeblueprint.co.uk, stefanha@gmail.com,
	ard.biesheuvel@linaro.org, leif.lindholm@linaro.org,
	luto@amacapital.net, qemu-arm@nongnu.org, kraxel@redhat.com,
	pbonzini@redhat.com, imammedo@redhat.com, lersek@redhat.com,
	rth@twiddle.net
Subject: [Qemu-devel] [PATCH v7 2/5] pc: fw_cfg: move ioport base constant
	to pc.h
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
X-TUID: d2zEFsYxFluD

Move BIOS_CFG_IOPORT define from pc.c to pc.h, and rename
it to FW_CFG_IO_BASE.

Cc: Marc Mar=C3=AD <markmb@redhat.com>
Signed-off-by: Gabriel Somlo <somlo@cmu.edu>
Reviewed-by: Laszlo Ersek <lersek@redhat.com>
Reviewed-by: Marc Mar=C3=AD <markmb@redhat.com>
---
 hw/i386/pc.c         | 5 ++---
 include/hw/i386/pc.h | 2 ++
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 0aeefd2..56ec6cd 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -78,7 +78,6 @@
 #define DPRINTF(fmt, ...)
 #endif
=20
-#define BIOS_CFG_IOPORT 0x510
 #define FW_CFG_ACPI_TABLES (FW_CFG_ARCH_LOCAL + 0)
 #define FW_CFG_SMBIOS_ENTRIES (FW_CFG_ARCH_LOCAL + 1)
 #define FW_CFG_IRQ0_OVERRIDE (FW_CFG_ARCH_LOCAL + 2)
@@ -756,7 +755,7 @@ static FWCfgState *bochs_bios_init(AddressSpace *as)
     int i, j;
     unsigned int apic_id_limit =3D pc_apic_id_limit(max_cpus);
=20
-    fw_cfg =3D fw_cfg_init_io_dma(BIOS_CFG_IOPORT, BIOS_CFG_IOPORT + 4, =
as);
+    fw_cfg =3D fw_cfg_init_io_dma(FW_CFG_IO_BASE, FW_CFG_IO_BASE + 4, as=
);
=20
     /* FW_CFG_MAX_CPUS is a bit confusing/problematic on x86:
      *
@@ -1258,7 +1257,7 @@ void xen_load_linux(PCMachineState *pcms)
=20
     assert(MACHINE(pcms)->kernel_filename !=3D NULL);
=20
-    fw_cfg =3D fw_cfg_init_io(BIOS_CFG_IOPORT);
+    fw_cfg =3D fw_cfg_init_io(FW_CFG_IO_BASE);
     rom_set_fw(fw_cfg);
=20
     load_linux(pcms, fw_cfg);
diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
index 8b3546e..79ffe5b 100644
--- a/include/hw/i386/pc.h
+++ b/include/hw/i386/pc.h
@@ -266,6 +266,8 @@ void ioapic_init_gsi(GSIState *gsi_state, const char =
*parent_name);
=20
 ISADevice *pc_find_fdc0(void);
=20
+#define FW_CFG_IO_BASE     0x510
+
 /* acpi_piix.c */
=20
 I2CBus *piix4_pm_init(PCIBus *bus, int devfn, uint32_t smb_io_base,
--=20
2.4.3

