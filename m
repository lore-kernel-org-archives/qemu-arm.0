Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp5052296wrt;
        Tue, 5 Feb 2019 10:06:30 -0800 (PST)
X-Google-Smtp-Source: AHgI3IYgdgwziCW2SwyuyWT4HJOtFxvn7k91WQx8PRfVfp5y/znUm7Q22pXCkP3IYwWMWzgiUPu9
X-Received: by 2002:a25:15c9:: with SMTP id 192mr5160886ybv.173.1549389990904;
        Tue, 05 Feb 2019 10:06:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1549389990; cv=none;
        d=google.com; s=arc-20160816;
        b=rkI2HkkuZeuYv579A1FDpLmkCuLBztT+N07SS31c3qJss/Rv01Giza6UcA1FuFaxYI
         D7wcw0d4bYjE/s5g8nA2REGuGre0GzT3I8F+eX29XrJEcFY9SrfbEeVr5vBJ4x+QVnmb
         TwPfOAobnZKeW/VNjPXtYvRX0HZ+RBSGQcB40piTYE3FK30NqtoRhqIfRc3dVPN1f5Vf
         BqBAGN1Xp8bgGfZ8zH5AaD/Z4nSEOqMJ/sJtuGy/nMu95DZNHb/JTMCREKMRUcMvnx01
         uWtrtqYLVdOU3toJYIIwrPEFvsQvWCx7Arz/8zJhZJ8ji3ZhPoF8FeEAtRiGHyEhgdO0
         ChwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=SjYbNmE/B0E/xGf4+8ZKvhXQOGhOwPUrjt7KnQ2969M=;
        b=EJB3+IFVkLp8KJ2vCN2FMCoKLwhHvwAplCSOQqbIArS0dG/KkmYB2jnDf33wywz6Vv
         XHSpzxQ9W5f8JIvzlMBNTzUAE25V55noQnF3x/7NY9GbvxoD9oN8AiLwL71YUIVMbIjV
         E0CbM6Jnz1lQ+Zf0/0KwK4TZ2QnGOfkMeLRp6iBfSNXoUfSBtO+flHqoUJjeYuPrGUBu
         G1q2EsNzaeKXl0TjhwHNoPA6HUZRweYv8f5Y8h7xWGQTVN0vTcrkGkjrVjAyd4rvPaYj
         9/KadRyEeuvsEBJ4x3PtjlaWAEyrNjYzK/PbGMjeO/+DEym3/9df3kchnFDg4k8cRI3U
         xKdQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h8si535549ybc.412.2019.02.05.10.06.30
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 05 Feb 2019 10:06:30 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:36206 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gr578-0001WA-9s
	for alex.bennee@linaro.org; Tue, 05 Feb 2019 13:06:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47279)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gr4ce-000169-JW
	for qemu-devel@nongnu.org; Tue, 05 Feb 2019 12:35:03 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gr4cc-0004pC-2U
	for qemu-devel@nongnu.org; Tue, 05 Feb 2019 12:35:00 -0500
Received: from mx1.redhat.com ([209.132.183.28]:34716)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1gr4cX-0004Za-7N; Tue, 05 Feb 2019 12:34:53 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 3875A80F88;
	Tue,  5 Feb 2019 17:34:29 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-102.ams2.redhat.com [10.36.116.102])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9DE0460A9D;
	Tue,  5 Feb 2019 17:34:26 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org,
	shameerali.kolothum.thodi@huawei.com, imammedo@redhat.com, david@redhat.com
Date: Tue,  5 Feb 2019 18:33:04 +0100
Message-Id: <20190205173306.20483-17-eric.auger@redhat.com>
In-Reply-To: <20190205173306.20483-1-eric.auger@redhat.com>
References: <20190205173306.20483-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Tue, 05 Feb 2019 17:34:29 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v6 16/18] hw/arm/virt: Add nvdimm hot-plug
 infrastructure
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: drjones@redhat.com, dgilbert@redhat.com, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: dAalTZ73SquS

From: Kwangwoo Lee <kwangwoo.lee@sk.com>

Pre-plug and plug handlers are prepared for NVDIMM support.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Signed-off-by: Kwangwoo Lee <kwangwoo.lee@sk.com>
---
 default-configs/arm-softmmu.mak |  2 ++
 hw/arm/virt-acpi-build.c        |  6 ++++++
 hw/arm/virt.c                   | 22 ++++++++++++++++++++++
 include/hw/arm/virt.h           |  3 +++
 4 files changed, 33 insertions(+)

diff --git a/default-configs/arm-softmmu.mak b/default-configs/arm-softmm=
u.mak
index dc4624794f..ddbe87ed15 100644
--- a/default-configs/arm-softmmu.mak
+++ b/default-configs/arm-softmmu.mak
@@ -162,3 +162,5 @@ CONFIG_HIGHBANK=3Dy
 CONFIG_MUSICPAL=3Dy
 CONFIG_MEM_DEVICE=3Dy
 CONFIG_DIMM=3Dy
+CONFIG_NVDIMM=3Dy
+CONFIG_ACPI_NVDIMM=3Dy
diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index 781eafaf5e..f086adfa82 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -784,6 +784,7 @@ static
 void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
 {
     VirtMachineClass *vmc =3D VIRT_MACHINE_GET_CLASS(vms);
+    MachineState *ms =3D MACHINE(vms);
     GArray *table_offsets;
     unsigned dsdt, xsdt;
     GArray *tables_blob =3D tables->table_data;
@@ -824,6 +825,11 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuil=
dTables *tables)
         }
     }
=20
+    if (vms->acpi_nvdimm_state.is_enabled) {
+        nvdimm_build_acpi(table_offsets, tables_blob, tables->linker,
+                          &vms->acpi_nvdimm_state, ms->ram_slots);
+    }
+
     if (its_class_name() && !vmc->no_its) {
         acpi_add_table(table_offsets, tables_blob);
         build_iort(tables_blob, tables->linker, vms);
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index b683902991..0c8c2cc191 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -132,6 +132,7 @@ static const MemMapEntry a15memmap[] =3D {
     [VIRT_GPIO] =3D               { 0x09030000, 0x00001000 },
     [VIRT_SECURE_UART] =3D        { 0x09040000, 0x00001000 },
     [VIRT_SMMU] =3D               { 0x09050000, 0x00020000 },
+    [VIRT_ACPI_IO] =3D            { 0x09070000, 0x00010000 },
     [VIRT_MMIO] =3D               { 0x0a000000, 0x00000200 },
     /* ...repeating for a total of NUM_VIRTIO_TRANSPORTS, each of that s=
ize */
     [VIRT_PLATFORM_BUS] =3D       { 0x0c000000, 0x02000000 },
@@ -1637,6 +1638,18 @@ static void machvirt_init(MachineState *machine)
=20
     create_platform_bus(vms, pic);
=20
+    if (vms->acpi_nvdimm_state.is_enabled) {
+        AcpiNVDIMMState *acpi_nvdimm_state =3D &vms->acpi_nvdimm_state;
+
+        acpi_nvdimm_state->dsm_io.type =3D NVDIMM_ACPI_IO_MEMORY;
+        acpi_nvdimm_state->dsm_io.base =3D
+                vms->memmap[VIRT_ACPI_IO].base + NVDIMM_ACPI_IO_BASE;
+        acpi_nvdimm_state->dsm_io.len =3D NVDIMM_ACPI_IO_LEN;
+
+        nvdimm_init_acpi_state(acpi_nvdimm_state, sysmem,
+                               vms->fw_cfg, OBJECT(vms));
+    }
+
     vms->bootinfo.ram_size =3D machine->ram_size;
     vms->bootinfo.kernel_filename =3D machine->kernel_filename;
     vms->bootinfo.kernel_cmdline =3D machine->kernel_cmdline;
@@ -1822,10 +1835,19 @@ static void virt_memory_plug(HotplugHandler *hotp=
lug_dev,
                              DeviceState *dev, Error **errp)
 {
     VirtMachineState *vms =3D VIRT_MACHINE(hotplug_dev);
+    bool is_nvdimm =3D object_dynamic_cast(OBJECT(dev), TYPE_NVDIMM);
     Error *local_err =3D NULL;
=20
     pc_dimm_plug(PC_DIMM(dev), MACHINE(vms), &local_err);
+    if (local_err) {
+        goto out;
+    }
=20
+    if (is_nvdimm) {
+        nvdimm_plug(&vms->acpi_nvdimm_state);
+    }
+
+out:
     error_propagate(errp, local_err);
 }
=20
diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
index c88f67a492..56d73b0e86 100644
--- a/include/hw/arm/virt.h
+++ b/include/hw/arm/virt.h
@@ -37,6 +37,7 @@
 #include "hw/arm/arm.h"
 #include "sysemu/kvm.h"
 #include "hw/intc/arm_gicv3_common.h"
+#include "hw/mem/nvdimm.h"
=20
 #define NUM_GICV2M_SPIS       64
 #define NUM_VIRTIO_TRANSPORTS 32
@@ -77,6 +78,7 @@ enum {
     VIRT_GPIO,
     VIRT_SECURE_UART,
     VIRT_SECURE_MEM,
+    VIRT_ACPI_IO,
     VIRT_LOWMEMMAP_LAST,
 };
=20
@@ -134,6 +136,7 @@ typedef struct {
     hwaddr high_io_base;
     hwaddr highest_gpa;
     bool extended_memmap;
+    AcpiNVDIMMState acpi_nvdimm_state;
 } VirtMachineState;
=20
 #define VIRT_ECAM_ID(high) (high ? VIRT_HIGH_PCIE_ECAM : VIRT_PCIE_ECAM)
--=20
2.20.1

