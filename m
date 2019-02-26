Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp11099118wrx;
        Tue, 26 Feb 2019 05:59:56 -0800 (PST)
X-Google-Smtp-Source: AHgI3IZv6zF/xufnDqxoyUHpRh7ZD+f/1w66SU4uwHW7uAAMxoYS9vgt3yQyti9p2JR4PFaI+Sdf
X-Received: by 2002:a25:8887:: with SMTP id d7mr18129263ybl.308.1551189596638;
        Tue, 26 Feb 2019 05:59:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1551189596; cv=none;
        d=google.com; s=arc-20160816;
        b=KYGQ/CHlnX5bP9gHxSDborPN+w/rskE9il08S71Onv8zV5J8jJR9Kl30brncO8OCnR
         2+3r2a8E3RtPbH+p5zCs2BB18iFV+wQf48CdlhSKgD3V9tL+gkDLh0NayMVTbAHF0mQt
         F+aUWMzoFCVY+5COm1GjUVqN2h1wewc2waieGsYTlYyZzYiRkbec3tFTlcSMuS9hETH8
         GgVo0VQ8MOM4DtYR/4DXJ2eX3SukEn8IR0RVJm8vChZITaWxMmSpenIXaz77AxArXhLz
         WvFVjKH9XYe9Ig5xUr87v7YB9UkalNXONfWgTNn/LOV0z85K+7WxuH2oEXaQ32uYva+f
         NUMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=9RENePpdUEYztI/F4NpCFRGsQ0I1B3ISqKdI0ZaxolQ=;
        b=tRnHU/JXFFJTxMXS6Q2Zo3ARu91arX8vvT74iXW4Y5GF3tS6eUoXy+BXz4hHuqB2ck
         Kj6rrBxGngujtHDcZRnDOZXGm+BbhIdEjod2pr712jKAGySpruvXpoYe1bun7IWnefwd
         gDAPancW90zobUbLlLgBd3xbuRggHxRJM+aSNbLjlJyYtWXXDUdlELDIYK4vDluQy4Ru
         1omMLlk7Xf70oPotL9dT36oiACR4YB05kCp2XXkCNfPlWyIIFUp+Ao+1TDO3Nm4zHUJC
         sajFRnohO74Qe9YZpD/T09nmevLWaYonHd1MXNauAd5YnN10007ovNB4GHNCkbfsOqmo
         ca7Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 187si4667933ywb.105.2019.02.26.05.59.56
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 26 Feb 2019 05:59:56 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:55724 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gydH2-00079n-23
	for alex.bennee@linaro.org; Tue, 26 Feb 2019 08:59:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47769)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gyd9A-0000lV-J5
	for qemu-devel@nongnu.org; Tue, 26 Feb 2019 08:51:49 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gyd94-0007aM-Ie
	for qemu-devel@nongnu.org; Tue, 26 Feb 2019 08:51:45 -0500
Received: from mx1.redhat.com ([209.132.183.28]:39700)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1gyd91-0007XQ-Dy; Tue, 26 Feb 2019 08:51:39 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id AC4C7883B8;
	Tue, 26 Feb 2019 13:51:38 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-102.ams2.redhat.com [10.36.116.102])
	by smtp.corp.redhat.com (Postfix) with ESMTP id ED1455F9A0;
	Tue, 26 Feb 2019 13:51:35 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org,
	shameerali.kolothum.thodi@huawei.com, imammedo@redhat.com, david@redhat.com
Date: Tue, 26 Feb 2019 14:50:10 +0100
Message-Id: <20190226135014.31854-15-eric.auger@redhat.com>
In-Reply-To: <20190226135014.31854-1-eric.auger@redhat.com>
References: <20190226135014.31854-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Tue, 26 Feb 2019 13:51:38 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v8 14/18] nvdimm: Use configurable ACPI IO base
 and size
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
Cc: pbonzini@redhat.com, drjones@redhat.com, dgilbert@redhat.com,
	david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: GPyhdTOjqkri

From: Kwangwoo Lee <kwangwoo.lee@sk.com>

This patch makes IO base and size configurable to create NPIO AML for
ACPI NFIT. Since a different architecture like AArch64 does not use
port-mapped IO, a configurable IO base is required to create correct
mapping of ACPI IO address and size.

Signed-off-by: Kwangwoo Lee <kwangwoo.lee@sk.com>
Signed-off-by: Eric Auger <eric.auger@redhat.com>

---
v7 -> v8:
- s/NvdimmDsmIO/x86_nvdimm_acpi_dsmio
- nvdimm_init_acpi_state() now takes a AcpiGenericAddress arg

v6 -> v7:
- Use NvdimmDsmIO constant
- use AcpiGenericAddress instead of AcpiNVDIMMIOEntry

v2 -> v3:
- s/size/len in pc_piix.c and pc_q35.c
---
 hw/acpi/nvdimm.c        | 30 +++++++++++++++++++++---------
 hw/i386/acpi-build.c    |  6 ++++++
 hw/i386/acpi-build.h    |  3 +++
 hw/i386/pc_piix.c       |  2 ++
 hw/i386/pc_q35.c        |  2 ++
 include/hw/mem/nvdimm.h |  3 +++
 6 files changed, 37 insertions(+), 9 deletions(-)

diff --git a/hw/acpi/nvdimm.c b/hw/acpi/nvdimm.c
index e53b2cb681..a5250d9c88 100644
--- a/hw/acpi/nvdimm.c
+++ b/hw/acpi/nvdimm.c
@@ -926,11 +926,13 @@ void nvdimm_acpi_plug_cb(HotplugHandler *hotplug_de=
v, DeviceState *dev)
 }
=20
 void nvdimm_init_acpi_state(AcpiNVDIMMState *state, MemoryRegion *io,
+                            struct AcpiGenericAddress dsm_io,
                             FWCfgState *fw_cfg, Object *owner)
 {
+    state->dsm_io =3D dsm_io;
     memory_region_init_io(&state->io_mr, owner, &nvdimm_dsm_ops, state,
-                          "nvdimm-acpi-io", NVDIMM_ACPI_IO_LEN);
-    memory_region_add_subregion(io, NVDIMM_ACPI_IO_BASE, &state->io_mr);
+                          "nvdimm-acpi-io", dsm_io.bit_width >> 3);
+    memory_region_add_subregion(io, dsm_io.address, &state->io_mr);
=20
     state->dsm_mem =3D g_array_new(false, true /* clear */, 1);
     acpi_data_push(state->dsm_mem, sizeof(NvdimmDsmIn));
@@ -959,12 +961,14 @@ void nvdimm_init_acpi_state(AcpiNVDIMMState *state,=
 MemoryRegion *io,
=20
 #define NVDIMM_QEMU_RSVD_UUID   "648B9CF2-CDA1-4312-8AD9-49C4AF32BD62"
=20
-static void nvdimm_build_common_dsm(Aml *dev)
+static void nvdimm_build_common_dsm(Aml *dev,
+                                    AcpiNVDIMMState *acpi_nvdimm_state)
 {
     Aml *method, *ifctx, *function, *handle, *uuid, *dsm_mem, *elsectx2;
     Aml *elsectx, *unsupport, *unpatched, *expected_uuid, *uuid_invalid;
     Aml *pckg, *pckg_index, *pckg_buf, *field, *dsm_out_buf, *dsm_out_bu=
f_size;
     uint8_t byte_list[1];
+    AmlRegionSpace rs;
=20
     method =3D aml_method(NVDIMM_COMMON_DSM, 5, AML_SERIALIZED);
     uuid =3D aml_arg(0);
@@ -975,9 +979,16 @@ static void nvdimm_build_common_dsm(Aml *dev)
=20
     aml_append(method, aml_store(aml_name(NVDIMM_ACPI_MEM_ADDR), dsm_mem=
));
=20
+    if (acpi_nvdimm_state->dsm_io.space_id =3D=3D AML_AS_SYSTEM_IO) {
+        rs =3D AML_SYSTEM_IO;
+    } else {
+        rs =3D AML_SYSTEM_MEMORY;
+    }
+
     /* map DSM memory and IO into ACPI namespace. */
-    aml_append(method, aml_operation_region(NVDIMM_DSM_IOPORT, AML_SYSTE=
M_IO,
-               aml_int(NVDIMM_ACPI_IO_BASE), NVDIMM_ACPI_IO_LEN));
+    aml_append(method, aml_operation_region(NVDIMM_DSM_IOPORT, rs,
+               aml_int(acpi_nvdimm_state->dsm_io.address),
+               acpi_nvdimm_state->dsm_io.bit_width >> 3));
     aml_append(method, aml_operation_region(NVDIMM_DSM_MEMORY,
                AML_SYSTEM_MEMORY, dsm_mem, sizeof(NvdimmDsmIn)));
=20
@@ -1260,7 +1271,8 @@ static void nvdimm_build_nvdimm_devices(Aml *root_d=
ev, uint32_t ram_slots)
 }
=20
 static void nvdimm_build_ssdt(GArray *table_offsets, GArray *table_data,
-                              BIOSLinker *linker, GArray *dsm_dma_arrea,
+                              BIOSLinker *linker,
+                              AcpiNVDIMMState *acpi_nvdimm_state,
                               uint32_t ram_slots)
 {
     Aml *ssdt, *sb_scope, *dev;
@@ -1288,7 +1300,7 @@ static void nvdimm_build_ssdt(GArray *table_offsets=
, GArray *table_data,
      */
     aml_append(dev, aml_name_decl("_HID", aml_string("ACPI0012")));
=20
-    nvdimm_build_common_dsm(dev);
+    nvdimm_build_common_dsm(dev, acpi_nvdimm_state);
=20
     /* 0 is reserved for root device. */
     nvdimm_build_device_dsm(dev, 0);
@@ -1307,7 +1319,7 @@ static void nvdimm_build_ssdt(GArray *table_offsets=
, GArray *table_data,
                                                NVDIMM_ACPI_MEM_ADDR);
=20
     bios_linker_loader_alloc(linker,
-                             NVDIMM_DSM_MEM_FILE, dsm_dma_arrea,
+                             NVDIMM_DSM_MEM_FILE, acpi_nvdimm_state->dsm=
_mem,
                              sizeof(NvdimmDsmIn), false /* high memory *=
/);
     bios_linker_loader_add_pointer(linker,
         ACPI_BUILD_TABLE_FILE, mem_addr_offset, sizeof(uint32_t),
@@ -1329,7 +1341,7 @@ void nvdimm_build_acpi(GArray *table_offsets, GArra=
y *table_data,
         return;
     }
=20
-    nvdimm_build_ssdt(table_offsets, table_data, linker, state->dsm_mem,
+    nvdimm_build_ssdt(table_offsets, table_data, linker, state,
                       ram_slots);
=20
     device_list =3D nvdimm_get_device_list();
diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index 9ecc96dcc7..4809abf23d 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -125,6 +125,12 @@ typedef struct FwCfgTPMConfig {
     uint8_t tpmppi_version;
 } QEMU_PACKED FwCfgTPMConfig;
=20
+const struct AcpiGenericAddress x86_nvdimm_acpi_dsmio =3D {
+    .space_id =3D AML_AS_SYSTEM_IO,
+    .address =3D NVDIMM_ACPI_IO_BASE,
+    .bit_width =3D NVDIMM_ACPI_IO_LEN << 3
+};
+
 static void init_common_fadt_data(Object *o, AcpiFadtData *data)
 {
     uint32_t io =3D object_property_get_uint(o, ACPI_PM_PROP_PM_IO_BASE,=
 NULL);
diff --git a/hw/i386/acpi-build.h b/hw/i386/acpi-build.h
index 007332e51c..74df5fc612 100644
--- a/hw/i386/acpi-build.h
+++ b/hw/i386/acpi-build.h
@@ -1,6 +1,9 @@
=20
 #ifndef HW_I386_ACPI_BUILD_H
 #define HW_I386_ACPI_BUILD_H
+#include "hw/acpi/acpi-defs.h"
+
+extern const struct AcpiGenericAddress x86_nvdimm_acpi_dsmio;
=20
 void acpi_setup(void);
=20
diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index fd0f2c268f..e8988f6669 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -58,6 +58,7 @@
 #include "migration/misc.h"
 #include "kvm_i386.h"
 #include "sysemu/numa.h"
+#include "hw/i386/acpi-build.h"
=20
 #define MAX_IDE_BUS 2
=20
@@ -299,6 +300,7 @@ static void pc_init1(MachineState *machine,
=20
     if (pcms->acpi_nvdimm_state.is_enabled) {
         nvdimm_init_acpi_state(&pcms->acpi_nvdimm_state, system_io,
+                               x86_nvdimm_acpi_dsmio,
                                pcms->fw_cfg, OBJECT(pcms));
     }
 }
diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
index 4a175ea50e..3dddf6e1b2 100644
--- a/hw/i386/pc_q35.c
+++ b/hw/i386/pc_q35.c
@@ -54,6 +54,7 @@
 #include "qapi/error.h"
 #include "qemu/error-report.h"
 #include "sysemu/numa.h"
+#include "hw/i386/acpi-build.h"
=20
 /* ICH9 AHCI has 6 ports */
 #define MAX_SATA_PORTS     6
@@ -331,6 +332,7 @@ static void pc_q35_init(MachineState *machine)
=20
     if (pcms->acpi_nvdimm_state.is_enabled) {
         nvdimm_init_acpi_state(&pcms->acpi_nvdimm_state, system_io,
+                               x86_nvdimm_acpi_dsmio,
                                pcms->fw_cfg, OBJECT(pcms));
     }
 }
diff --git a/include/hw/mem/nvdimm.h b/include/hw/mem/nvdimm.h
index c5c9b3c7f8..bbb72f27ac 100644
--- a/include/hw/mem/nvdimm.h
+++ b/include/hw/mem/nvdimm.h
@@ -25,6 +25,7 @@
=20
 #include "hw/mem/pc-dimm.h"
 #include "hw/acpi/bios-linker-loader.h"
+#include "hw/acpi/aml-build.h"
=20
 #define NVDIMM_DEBUG 0
 #define nvdimm_debug(fmt, ...)                                \
@@ -140,10 +141,12 @@ struct AcpiNVDIMMState {
      */
     int32_t persistence;
     char    *persistence_string;
+    struct AcpiGenericAddress dsm_io;
 };
 typedef struct AcpiNVDIMMState AcpiNVDIMMState;
=20
 void nvdimm_init_acpi_state(AcpiNVDIMMState *state, MemoryRegion *io,
+                            struct AcpiGenericAddress dsm_io,
                             FWCfgState *fw_cfg, Object *owner);
 void nvdimm_build_acpi(GArray *table_offsets, GArray *table_data,
                        BIOSLinker *linker, AcpiNVDIMMState *state,
--=20
2.20.1

