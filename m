Received: by 10.25.208.211 with SMTP id h202csp1295883lfg;
        Fri, 19 Feb 2016 10:20:43 -0800 (PST)
X-Received: by 10.140.108.8 with SMTP id i8mr17850270qgf.83.1455906040078;
        Fri, 19 Feb 2016 10:20:40 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q62si15410528qhq.26.2016.02.19.10.20.39
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 19 Feb 2016 10:20:40 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:54450 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aWpfS-0004cO-Tx
	for alex.bennee@linaro.org; Fri, 19 Feb 2016 13:20:38 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54811)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <somlo@cmu.edu>) id 1aWpfQ-0004Yp-6X
	for qemu-arm@nongnu.org; Fri, 19 Feb 2016 13:20:37 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <somlo@cmu.edu>) id 1aWpfO-0006WL-9n
	for qemu-arm@nongnu.org; Fri, 19 Feb 2016 13:20:36 -0500
Received: from relay-06.andrew.cmu.edu ([128.2.157.21]:47163
	helo=relay.andrew.cmu.edu) by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <somlo@cmu.edu>)
	id 1aWpfO-0006Uo-4y; Fri, 19 Feb 2016 13:20:34 -0500
Received: from HEDWIG.ini.cmu.edu (HEDWIG.INI.CMU.EDU [128.2.16.51])
	by relay.andrew.cmu.edu (8.14.8/8.14.8) with ESMTP id u1JIKTk5008851;
	Fri, 19 Feb 2016 13:20:29 -0500
From: "Gabriel L. Somlo" <somlo@cmu.edu>
To: qemu-devel@nongnu.org
Date: Fri, 19 Feb 2016 13:20:26 -0500
Message-Id: <1455906029-25565-3-git-send-email-somlo@cmu.edu>
X-Mailer: git-send-email 2.4.3
In-Reply-To: <1455906029-25565-1-git-send-email-somlo@cmu.edu>
References: <1455906029-25565-1-git-send-email-somlo@cmu.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.74 on 128.2.157.21
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by relay.andrew.cmu.edu id
	u1JIKTk5008851
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x
X-Received-From: 128.2.157.21
Cc: peter.maydell@linaro.org, ehabkost@redhat.com, mst@redhat.com,
	matt@codeblueprint.co.uk, stefanha@gmail.com,
	ard.biesheuvel@linaro.org, leif.lindholm@linaro.org,
	luto@amacapital.net, qemu-arm@nongnu.org, kraxel@redhat.com,
	pbonzini@redhat.com, imammedo@redhat.com, lersek@redhat.com,
	rth@twiddle.net
Subject: [Qemu-arm] [PATCH v9 2/5] pc: fw_cfg: move ioport base constant to
	pc.h
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
X-TUID: ePEtTBPFiXhh

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

