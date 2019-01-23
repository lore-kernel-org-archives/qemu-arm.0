Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp526079wrt;
        Wed, 23 Jan 2019 02:26:26 -0800 (PST)
X-Google-Smtp-Source: ALg8bN641vnspl/GfSlZASaMpTllS4ZAf1rIy6bjs+YxkkD3Io35589e7yGa+ad4WkEVC9HSJj2c
X-Received: by 2002:a5d:4a0c:: with SMTP id m12mr2025169wrq.38.1548239186152;
        Wed, 23 Jan 2019 02:26:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1548239186; cv=none;
        d=google.com; s=arc-20160816;
        b=saoBOXo9VmHbtQiK0Pl1PxOMyRpud10iqqxUqxqpdeP8L3xdBhlHhdrmlMlJ13Gfdg
         PqdfHoCGcD9Rez/T1HNbOHWj0y9JbCXtib87jQnW3HtnaJqwEJ5spK0fNvjju/al1eVo
         Ujtfdi76EqsW+YoEul2KIfkeFMhvQbYDHFr+6yer8Z9Tr36kxuM3DekmjLM30Zz15GPu
         i3n19+Ydxc1/EyHWLO/YXNKaA8QiqIw4ug2Y8Awhv+KlDYdB9K1d/OaWGcJk41a6Nbqh
         qCt/xrDvEopRT0ONeRL/X7hEHN/h5LLNIC3cGmLeOZU3YocTNFU3p7/qNT17+bl+h9eA
         s/Fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=YLOw6WbfbiQIRsiuMrQqiv6ceEECGagaX67rp/CrCQ0=;
        b=je/eMCk9GjIux4oUzOKipLSiBel48XiwJUEX0tYv+RVmMotqkeLIKtGyia1LtsbRO/
         KG1GVSwHi8FF97I0ov0Z1k5QKs+kLgkyMpmPwa7gK156gb+okhFozAsO/VWuFdCyehWS
         Nc56hcI2mltOZe8huWjH58pnQYWSxBvClsdj4agaEoXFNMrSePsFS8DaSgt7XtP8+A/J
         MKU6FPopJ6MhiQw6p6jDTTreAmDX75LB4W39a3ZVYnJP2aizlpGzodUhOzBT1mGaB877
         AqUeYS9oJ0zDtil6t/dkuQNy9+Mvnrzyyof82coFgYdtMqBuNGtM5/cx2Swe23wW/p5d
         B/vA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j22si34959355wmh.61.2019.01.23.02.26.25
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 23 Jan 2019 02:26:26 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:59842 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gmFjl-00022L-3b
	for alex.bennee@linaro.org; Wed, 23 Jan 2019 05:26:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34972)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gmFaO-0002EN-Qe
	for qemu-arm@nongnu.org; Wed, 23 Jan 2019 05:16:47 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gmFaN-0007lD-D9
	for qemu-arm@nongnu.org; Wed, 23 Jan 2019 05:16:44 -0500
Received: from mx1.redhat.com ([209.132.183.28]:55591)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1gmFaK-0007dx-7P; Wed, 23 Jan 2019 05:16:42 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0F6F2C05D3E4;
	Wed, 23 Jan 2019 10:16:22 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-117-91.ams2.redhat.com [10.36.117.91])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A3130600C6;
	Wed, 23 Jan 2019 10:16:17 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org,
	shameerali.kolothum.thodi@huawei.com, imammedo@redhat.com, david@redhat.com
Date: Wed, 23 Jan 2019 11:14:55 +0100
Message-Id: <20190123101458.12478-16-eric.auger@redhat.com>
In-Reply-To: <20190123101458.12478-1-eric.auger@redhat.com>
References: <20190123101458.12478-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Wed, 23 Jan 2019 10:16:22 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v5 15/18] nvdimm: use configurable ACPI IO base
 and size
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
Cc: drjones@redhat.com, dgilbert@redhat.com, david@gibson.dropbear.id.au
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: owVOmWVJ7Rjs

From: Kwangwoo Lee <kwangwoo.lee@sk.com>

This patch uses configurable IO base and size to create NPIO AML for
ACPI NFIT. Since a different architecture like AArch64 does not use
port-mapped IO, a configurable IO base is required to create correct
mapping of ACPI IO address and size.

Signed-off-by: Kwangwoo Lee <kwangwoo.lee@sk.com>
Signed-off-by: Eric Auger <eric.auger@redhat.com>

---

v2 -> v3:
- s/size/len in pc_piix.c and pc_q35.c
---
 hw/acpi/nvdimm.c        | 28 +++++++++++++++++++---------
 hw/i386/pc_piix.c       |  8 +++++++-
 hw/i386/pc_q35.c        |  8 +++++++-
 include/hw/mem/nvdimm.h | 12 ++++++++++++
 4 files changed, 45 insertions(+), 11 deletions(-)

diff --git a/hw/acpi/nvdimm.c b/hw/acpi/nvdimm.c
index e53b2cb681..da68de5535 100644
--- a/hw/acpi/nvdimm.c
+++ b/hw/acpi/nvdimm.c
@@ -929,8 +929,8 @@ void nvdimm_init_acpi_state(AcpiNVDIMMState *state, M=
emoryRegion *io,
                             FWCfgState *fw_cfg, Object *owner)
 {
     memory_region_init_io(&state->io_mr, owner, &nvdimm_dsm_ops, state,
-                          "nvdimm-acpi-io", NVDIMM_ACPI_IO_LEN);
-    memory_region_add_subregion(io, NVDIMM_ACPI_IO_BASE, &state->io_mr);
+                          "nvdimm-acpi-io", state->dsm_io.len);
+    memory_region_add_subregion(io, state->dsm_io.base, &state->io_mr);
=20
     state->dsm_mem =3D g_array_new(false, true /* clear */, 1);
     acpi_data_push(state->dsm_mem, sizeof(NvdimmDsmIn));
@@ -959,12 +959,14 @@ void nvdimm_init_acpi_state(AcpiNVDIMMState *state,=
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
@@ -975,9 +977,16 @@ static void nvdimm_build_common_dsm(Aml *dev)
=20
     aml_append(method, aml_store(aml_name(NVDIMM_ACPI_MEM_ADDR), dsm_mem=
));
=20
+    if (acpi_nvdimm_state->dsm_io.type =3D=3D NVDIMM_ACPI_IO_PORT) {
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
+               aml_int(acpi_nvdimm_state->dsm_io.base),
+               acpi_nvdimm_state->dsm_io.len));
     aml_append(method, aml_operation_region(NVDIMM_DSM_MEMORY,
                AML_SYSTEM_MEMORY, dsm_mem, sizeof(NvdimmDsmIn)));
=20
@@ -1260,7 +1269,8 @@ static void nvdimm_build_nvdimm_devices(Aml *root_d=
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
@@ -1288,7 +1298,7 @@ static void nvdimm_build_ssdt(GArray *table_offsets=
, GArray *table_data,
      */
     aml_append(dev, aml_name_decl("_HID", aml_string("ACPI0012")));
=20
-    nvdimm_build_common_dsm(dev);
+    nvdimm_build_common_dsm(dev, acpi_nvdimm_state);
=20
     /* 0 is reserved for root device. */
     nvdimm_build_device_dsm(dev, 0);
@@ -1307,7 +1317,7 @@ static void nvdimm_build_ssdt(GArray *table_offsets=
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
@@ -1329,7 +1339,7 @@ void nvdimm_build_acpi(GArray *table_offsets, GArra=
y *table_data,
         return;
     }
=20
-    nvdimm_build_ssdt(table_offsets, table_data, linker, state->dsm_mem,
+    nvdimm_build_ssdt(table_offsets, table_data, linker, state,
                       ram_slots);
=20
     device_list =3D nvdimm_get_device_list();
diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index 63c84e3827..d9c81c9aa6 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -298,7 +298,13 @@ static void pc_init1(MachineState *machine,
     }
=20
     if (pcms->acpi_nvdimm_state.is_enabled) {
-        nvdimm_init_acpi_state(&pcms->acpi_nvdimm_state, system_io,
+        AcpiNVDIMMState *acpi_nvdimm_state =3D &pcms->acpi_nvdimm_state;
+
+        acpi_nvdimm_state->dsm_io.type =3D NVDIMM_ACPI_IO_PORT;
+        acpi_nvdimm_state->dsm_io.base =3D NVDIMM_ACPI_IO_BASE;
+        acpi_nvdimm_state->dsm_io.len =3D NVDIMM_ACPI_IO_LEN;
+
+        nvdimm_init_acpi_state(acpi_nvdimm_state, system_io,
                                pcms->fw_cfg, OBJECT(pcms));
     }
 }
diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
index b7b7959934..1110a26e34 100644
--- a/hw/i386/pc_q35.c
+++ b/hw/i386/pc_q35.c
@@ -330,7 +330,13 @@ static void pc_q35_init(MachineState *machine)
     pc_nic_init(pcmc, isa_bus, host_bus);
=20
     if (pcms->acpi_nvdimm_state.is_enabled) {
-        nvdimm_init_acpi_state(&pcms->acpi_nvdimm_state, system_io,
+        AcpiNVDIMMState *acpi_nvdimm_state =3D &pcms->acpi_nvdimm_state;
+
+        acpi_nvdimm_state->dsm_io.type =3D NVDIMM_ACPI_IO_PORT;
+        acpi_nvdimm_state->dsm_io.base =3D NVDIMM_ACPI_IO_BASE;
+        acpi_nvdimm_state->dsm_io.len =3D NVDIMM_ACPI_IO_LEN;
+
+        nvdimm_init_acpi_state(acpi_nvdimm_state, system_io,
                                pcms->fw_cfg, OBJECT(pcms));
     }
 }
diff --git a/include/hw/mem/nvdimm.h b/include/hw/mem/nvdimm.h
index c5c9b3c7f8..af8a5fd034 100644
--- a/include/hw/mem/nvdimm.h
+++ b/include/hw/mem/nvdimm.h
@@ -123,6 +123,17 @@ struct NvdimmFitBuffer {
 };
 typedef struct NvdimmFitBuffer NvdimmFitBuffer;
=20
+typedef enum {
+    NVDIMM_ACPI_IO_PORT,
+    NVDIMM_ACPI_IO_MEMORY,
+} AcpiNVDIMMIOType;
+
+typedef struct AcpiNVDIMMIOEntry {
+    AcpiNVDIMMIOType type;
+    hwaddr base;
+    hwaddr len;
+} AcpiNVDIMMIOEntry;
+
 struct AcpiNVDIMMState {
     /* detect if NVDIMM support is enabled. */
     bool is_enabled;
@@ -140,6 +151,7 @@ struct AcpiNVDIMMState {
      */
     int32_t persistence;
     char    *persistence_string;
+    AcpiNVDIMMIOEntry dsm_io;
 };
 typedef struct AcpiNVDIMMState AcpiNVDIMMState;
=20
--=20
2.20.1

