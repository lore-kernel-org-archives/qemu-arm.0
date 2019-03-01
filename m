Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp665226wrx;
        Fri, 1 Mar 2019 06:08:25 -0800 (PST)
X-Google-Smtp-Source: APXvYqydn4h6JZ2Spg0vOmf4wXp6M8TmVL4kkKtKCE1JAVCUvbc1guAT6oXCYzuNmFNHrV6dX7PL
X-Received: by 2002:a81:9346:: with SMTP id k67mr3821776ywg.4.1551449305726;
        Fri, 01 Mar 2019 06:08:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1551449305; cv=none;
        d=google.com; s=arc-20160816;
        b=ujOExvpG+2Xihzh4/lJIVP6e+M8fQY6b7Lawo6XgH7gfzWOmwbTGMRZx/Fg+v91Gn2
         cAoOcBA9cj/vEtfFgyFfrjqSTWW+nOTC6Q50FuSX715vWiEvXM1NAVcg1X2TPZoaroVb
         jWgXfWe4MI4rlr2QEYCIySbXwuBeIpjkLKKT/A9G1v66ZVLGp/W9hbzr7+B0WS283LvD
         H0hclZMSHAK5kUse5mfLJmnqyUyOik9y+XX7/w8uYfjdZItubgeUVWB5Zjb2Tzsjf0cp
         r/aGGeovvfftJXhfKM9iKw5D+8go3HlzD0UQ9e0/jPv1i+zBb/yX4yZxjz4yA3PUJeQW
         zZNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from;
        bh=ac/+qMdyOz5U1eyABulbzu0e6e7Z37ZTlvJcVBpuQmU=;
        b=kePWuaUv0SZ3kznlZEE0bl2Q3nsExxSj1vTr8nlHbhzpr/k6HbQHQpAepYBG4TdCz2
         enggGRR7Fq1vRcz0le8r7Axs3cgk1uUavK0sxkWIAgXNX1SulgU+Un6tY+cIhccD1WRu
         xOveadO3X2ZlK2UhiMUd3cPuRflUzVplU1eehfadIKiPt8bYe3NvHQjB/31tToOSowkV
         X2nfpiPAVN0Z3GpNo9PmNknzrJgYn90F+o86xPZDMYqejkdx/EXpkN/UDyi7jKQZx2Qo
         jKlM7XpCsxVBxSMbsizf7h0cU5Tzx1ECo+mixPE3jYf9NgooZjQi1V4i/yrcoAxbpK7D
         IQNg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u16si13180325ywe.425.2019.03.01.06.08.25
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 01 Mar 2019 06:08:25 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:38493 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gzipt-0001td-4X
	for alex.bennee@linaro.org; Fri, 01 Mar 2019 09:08:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35514)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gzioN-0001Cu-NM
	for qemu-devel@nongnu.org; Fri, 01 Mar 2019 09:06:53 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gzioM-00053k-44
	for qemu-devel@nongnu.org; Fri, 01 Mar 2019 09:06:51 -0500
Received: from mx1.redhat.com ([209.132.183.28]:43806)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1gzioI-0004uv-5U; Fri, 01 Mar 2019 09:06:46 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A5B0630D78DE;
	Fri,  1 Mar 2019 14:06:36 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-102.ams2.redhat.com [10.36.116.102])
	by smtp.corp.redhat.com (Postfix) with ESMTP id AB9E05C1B5;
	Fri,  1 Mar 2019 14:06:33 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org,
	shameerali.kolothum.thodi@huawei.com, imammedo@redhat.com,
	david@redhat.com, pbonzini@redhat.com, ehabkost@redhat.com,
	richard.henderson@linaro.org, sbhat@linux.ibm.com
Date: Fri,  1 Mar 2019 15:06:23 +0100
Message-Id: <20190301140623.5390-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.47]);
	Fri, 01 Mar 2019 14:06:36 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH] machine: Move acpi_nvdimm_state into struct
 MachineState
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
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: CdQfZS8tQhFo

As NVDIMM support is looming for ARM and SPAPR, let's
move the acpi_nvdimm_state to the generic machine struct
instead of duplicating the same code in several machines.

nvdimm and nvdimm-persistence become generic machine options.
We also add a description for those options.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Suggested-by: Igor Mammedov <imammedo@redhat.com>
---
 hw/core/machine.c        | 57 ++++++++++++++++++++++++++++++++++++++++
 hw/i386/acpi-build.c     |  6 ++---
 hw/i386/pc.c             | 56 +++------------------------------------
 hw/i386/pc_piix.c        |  4 +--
 hw/i386/pc_q35.c         |  4 +--
 include/hw/boards.h      |  2 ++
 include/hw/i386/pc.h     |  4 ---
 include/hw/mem/pc-dimm.h |  1 -
 8 files changed, 70 insertions(+), 64 deletions(-)

diff --git a/hw/core/machine.c b/hw/core/machine.c
index 766ca5899d..19a5ee7cd8 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -481,6 +481,47 @@ static void machine_set_memory_encryption(Object *ob=
j, const char *value,
     ms->memory_encryption =3D g_strdup(value);
 }
=20
+static bool machine_get_nvdimm(Object *obj, Error **errp)
+{
+    MachineState *ms =3D MACHINE(obj);
+
+    return ms->acpi_nvdimm_state.is_enabled;
+}
+
+static void machine_set_nvdimm(Object *obj, bool value, Error **errp)
+{
+    MachineState *ms =3D MACHINE(obj);
+
+    ms->acpi_nvdimm_state.is_enabled =3D value;
+}
+
+static char *machine_get_nvdimm_persistence(Object *obj, Error **errp)
+{
+    MachineState *ms =3D MACHINE(obj);
+
+    return g_strdup(ms->acpi_nvdimm_state.persistence_string);
+}
+
+static void machine_set_nvdimm_persistence(Object *obj, const char *valu=
e,
+                                               Error **errp)
+{
+    MachineState *ms =3D MACHINE(obj);
+    AcpiNVDIMMState *nvdimm_state =3D &ms->acpi_nvdimm_state;
+
+    if (strcmp(value, "cpu") =3D=3D 0)
+        nvdimm_state->persistence =3D 3;
+    else if (strcmp(value, "mem-ctrl") =3D=3D 0)
+        nvdimm_state->persistence =3D 2;
+    else {
+        error_setg(errp, "-machine nvdimm-persistence=3D%s: unsupported =
option",
+                   value);
+        return;
+    }
+
+    g_free(nvdimm_state->persistence_string);
+    nvdimm_state->persistence_string =3D g_strdup(value);
+}
+
 void machine_class_allow_dynamic_sysbus_dev(MachineClass *mc, const char=
 *type)
 {
     strList *item =3D g_new0(strList, 1);
@@ -765,6 +806,20 @@ static void machine_class_init(ObjectClass *oc, void=
 *data)
         &error_abort);
     object_class_property_set_description(oc, "memory-encryption",
         "Set memory encryption object to use", &error_abort);
+
+    object_class_property_add_bool(oc, "nvdimm",
+        machine_get_nvdimm, machine_set_nvdimm, &error_abort);
+    object_class_property_set_description(oc, "nvdimm",
+                                         "Set on/off to enable/disable N=
VDIMM "
+                                         "instantiation", NULL);
+
+    object_class_property_add_str(oc, "nvdimm-persistence",
+                                  machine_get_nvdimm_persistence,
+                                  machine_set_nvdimm_persistence, &error=
_abort);
+    object_class_property_set_description(oc, "nvdimm-persistence",
+                                          "Set NVDIMM persistence"
+                                          "Valid values are cpu and mem-=
ctrl",
+                                          NULL);
 }
=20
 static void machine_class_base_init(ObjectClass *oc, void *data)
@@ -790,6 +845,8 @@ static void machine_initfn(Object *obj)
     ms->dump_guest_core =3D true;
     ms->mem_merge =3D true;
     ms->enable_graphics =3D true;
+    /* nvdimm is disabled on default. */
+    ms->acpi_nvdimm_state.is_enabled =3D false;
=20
     /* Register notifier when init is done for sysbus sanity checks */
     ms->sysbus_notifier.notify =3D machine_init_notify;
diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index 9ecc96dcc7..622ccb9408 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -1867,7 +1867,7 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
             aml_append(scope, method);
         }
=20
-        if (pcms->acpi_nvdimm_state.is_enabled) {
+        if (machine->acpi_nvdimm_state.is_enabled) {
             method =3D aml_method("_E04", 0, AML_NOTSERIALIZED);
             aml_append(method, aml_notify(aml_name("\\_SB.NVDR"),
                                           aml_int(0x80)));
@@ -2704,9 +2704,9 @@ void acpi_build(AcpiBuildTables *tables, MachineSta=
te *machine)
             build_dmar_q35(tables_blob, tables->linker);
         }
     }
-    if (pcms->acpi_nvdimm_state.is_enabled) {
+    if (machine->acpi_nvdimm_state.is_enabled) {
         nvdimm_build_acpi(table_offsets, tables_blob, tables->linker,
-                          &pcms->acpi_nvdimm_state, machine->ram_slots);
+                          &machine->acpi_nvdimm_state, machine->ram_slot=
s);
     }
=20
     /* Add tables supplied by user (if any) */
diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 3889eccdc3..356213e0b8 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -2096,6 +2096,7 @@ static void pc_memory_pre_plug(HotplugHandler *hotp=
lug_dev, DeviceState *dev,
 {
     const PCMachineState *pcms =3D PC_MACHINE(hotplug_dev);
     const PCMachineClass *pcmc =3D PC_MACHINE_GET_CLASS(pcms);
+    const MachineState *ms =3D MACHINE(hotplug_dev);
     const bool is_nvdimm =3D object_dynamic_cast(OBJECT(dev), TYPE_NVDIM=
M);
     const uint64_t legacy_align =3D TARGET_PAGE_SIZE;
=20
@@ -2110,7 +2111,7 @@ static void pc_memory_pre_plug(HotplugHandler *hotp=
lug_dev, DeviceState *dev,
         return;
     }
=20
-    if (is_nvdimm && !pcms->acpi_nvdimm_state.is_enabled) {
+    if (is_nvdimm && !ms->acpi_nvdimm_state.is_enabled) {
         error_setg(errp, "nvdimm is not enabled: missing 'nvdimm' in '-M=
'");
         return;
     }
@@ -2124,6 +2125,7 @@ static void pc_memory_plug(HotplugHandler *hotplug_=
dev,
 {
     Error *local_err =3D NULL;
     PCMachineState *pcms =3D PC_MACHINE(hotplug_dev);
+    MachineState *ms =3D MACHINE(hotplug_dev);
     bool is_nvdimm =3D object_dynamic_cast(OBJECT(dev), TYPE_NVDIMM);
=20
     pc_dimm_plug(PC_DIMM(dev), MACHINE(pcms), &local_err);
@@ -2132,7 +2134,7 @@ static void pc_memory_plug(HotplugHandler *hotplug_=
dev,
     }
=20
     if (is_nvdimm) {
-        nvdimm_plug(&pcms->acpi_nvdimm_state);
+        nvdimm_plug(&ms->acpi_nvdimm_state);
     }
=20
     hotplug_handler_plug(HOTPLUG_HANDLER(pcms->acpi_dev), dev, &error_ab=
ort);
@@ -2574,47 +2576,6 @@ static void pc_machine_set_smm(Object *obj, Visito=
r *v, const char *name,
     visit_type_OnOffAuto(v, name, &pcms->smm, errp);
 }
=20
-static bool pc_machine_get_nvdimm(Object *obj, Error **errp)
-{
-    PCMachineState *pcms =3D PC_MACHINE(obj);
-
-    return pcms->acpi_nvdimm_state.is_enabled;
-}
-
-static void pc_machine_set_nvdimm(Object *obj, bool value, Error **errp)
-{
-    PCMachineState *pcms =3D PC_MACHINE(obj);
-
-    pcms->acpi_nvdimm_state.is_enabled =3D value;
-}
-
-static char *pc_machine_get_nvdimm_persistence(Object *obj, Error **errp=
)
-{
-    PCMachineState *pcms =3D PC_MACHINE(obj);
-
-    return g_strdup(pcms->acpi_nvdimm_state.persistence_string);
-}
-
-static void pc_machine_set_nvdimm_persistence(Object *obj, const char *v=
alue,
-                                               Error **errp)
-{
-    PCMachineState *pcms =3D PC_MACHINE(obj);
-    AcpiNVDIMMState *nvdimm_state =3D &pcms->acpi_nvdimm_state;
-
-    if (strcmp(value, "cpu") =3D=3D 0)
-        nvdimm_state->persistence =3D 3;
-    else if (strcmp(value, "mem-ctrl") =3D=3D 0)
-        nvdimm_state->persistence =3D 2;
-    else {
-        error_setg(errp, "-machine nvdimm-persistence=3D%s: unsupported =
option",
-                   value);
-        return;
-    }
-
-    g_free(nvdimm_state->persistence_string);
-    nvdimm_state->persistence_string =3D g_strdup(value);
-}
-
 static bool pc_machine_get_smbus(Object *obj, Error **errp)
 {
     PCMachineState *pcms =3D PC_MACHINE(obj);
@@ -2664,8 +2625,6 @@ static void pc_machine_initfn(Object *obj)
     pcms->max_ram_below_4g =3D 0; /* use default */
     pcms->smm =3D ON_OFF_AUTO_AUTO;
     pcms->vmport =3D ON_OFF_AUTO_AUTO;
-    /* nvdimm is disabled on default. */
-    pcms->acpi_nvdimm_state.is_enabled =3D false;
     /* acpi build is enabled by default if machine supports it */
     pcms->acpi_build_enabled =3D PC_MACHINE_GET_CLASS(pcms)->has_acpi_bu=
ild;
     pcms->smbus_enabled =3D true;
@@ -2826,13 +2785,6 @@ static void pc_machine_class_init(ObjectClass *oc,=
 void *data)
     object_class_property_set_description(oc, PC_MACHINE_VMPORT,
         "Enable vmport (pc & q35)", &error_abort);
=20
-    object_class_property_add_bool(oc, PC_MACHINE_NVDIMM,
-        pc_machine_get_nvdimm, pc_machine_set_nvdimm, &error_abort);
-
-    object_class_property_add_str(oc, PC_MACHINE_NVDIMM_PERSIST,
-        pc_machine_get_nvdimm_persistence,
-        pc_machine_set_nvdimm_persistence, &error_abort);
-
     object_class_property_add_bool(oc, PC_MACHINE_SMBUS,
         pc_machine_get_smbus, pc_machine_set_smbus, &error_abort);
=20
diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index fd0f2c268f..8b94b70f14 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -297,8 +297,8 @@ static void pc_init1(MachineState *machine,
                                  PC_MACHINE_ACPI_DEVICE_PROP, &error_abo=
rt);
     }
=20
-    if (pcms->acpi_nvdimm_state.is_enabled) {
-        nvdimm_init_acpi_state(&pcms->acpi_nvdimm_state, system_io,
+    if (machine->acpi_nvdimm_state.is_enabled) {
+        nvdimm_init_acpi_state(&machine->acpi_nvdimm_state, system_io,
                                pcms->fw_cfg, OBJECT(pcms));
     }
 }
diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
index 4a175ea50e..26727c964d 100644
--- a/hw/i386/pc_q35.c
+++ b/hw/i386/pc_q35.c
@@ -329,8 +329,8 @@ static void pc_q35_init(MachineState *machine)
     pc_vga_init(isa_bus, host_bus);
     pc_nic_init(pcmc, isa_bus, host_bus);
=20
-    if (pcms->acpi_nvdimm_state.is_enabled) {
-        nvdimm_init_acpi_state(&pcms->acpi_nvdimm_state, system_io,
+    if (machine->acpi_nvdimm_state.is_enabled) {
+        nvdimm_init_acpi_state(&machine->acpi_nvdimm_state, system_io,
                                pcms->fw_cfg, OBJECT(pcms));
     }
 }
diff --git a/include/hw/boards.h b/include/hw/boards.h
index 05f9f45c3d..b55c9cc087 100644
--- a/include/hw/boards.h
+++ b/include/hw/boards.h
@@ -8,6 +8,7 @@
 #include "hw/qdev.h"
 #include "qom/object.h"
 #include "qom/cpu.h"
+#include "hw/mem/nvdimm.h"
=20
 /**
  * memory_region_allocate_system_memory - Allocate a board's main memory
@@ -268,6 +269,7 @@ struct MachineState {
     const char *cpu_type;
     AccelState *accelerator;
     CPUArchIdList *possible_cpus;
+    AcpiNVDIMMState acpi_nvdimm_state;
 };
=20
 #define DEFINE_MACHINE(namestr, machine_initfn) \
diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
index 3ff127ebd0..f7c59743e0 100644
--- a/include/hw/i386/pc.h
+++ b/include/hw/i386/pc.h
@@ -45,8 +45,6 @@ struct PCMachineState {
     OnOffAuto vmport;
     OnOffAuto smm;
=20
-    AcpiNVDIMMState acpi_nvdimm_state;
-
     bool acpi_build_enabled;
     bool smbus_enabled;
     bool sata_enabled;
@@ -74,8 +72,6 @@ struct PCMachineState {
 #define PC_MACHINE_MAX_RAM_BELOW_4G "max-ram-below-4g"
 #define PC_MACHINE_VMPORT           "vmport"
 #define PC_MACHINE_SMM              "smm"
-#define PC_MACHINE_NVDIMM           "nvdimm"
-#define PC_MACHINE_NVDIMM_PERSIST   "nvdimm-persistence"
 #define PC_MACHINE_SMBUS            "smbus"
 #define PC_MACHINE_SATA             "sata"
 #define PC_MACHINE_PIT              "pit"
diff --git a/include/hw/mem/pc-dimm.h b/include/hw/mem/pc-dimm.h
index 01436b9f50..3e5489d3a1 100644
--- a/include/hw/mem/pc-dimm.h
+++ b/include/hw/mem/pc-dimm.h
@@ -19,7 +19,6 @@
 #include "exec/memory.h"
 #include "sysemu/hostmem.h"
 #include "hw/qdev.h"
-#include "hw/boards.h"
=20
 #define TYPE_PC_DIMM "pc-dimm"
 #define PC_DIMM(obj) \
--=20
2.20.1

