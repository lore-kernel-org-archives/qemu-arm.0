Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp116903wrq;
        Mon, 2 Jul 2018 10:30:00 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpcd0fAWC2+7xD2MwzRgJ4mw874KO6TlmpgC/1liLmuVT1vd2Wj0DMbj9psIs+zP4jDOb08R
X-Received: by 2002:a0c:b587:: with SMTP id g7-v6mr23118229qve.94.1530552600073;
        Mon, 02 Jul 2018 10:30:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1530552600; cv=none;
        d=google.com; s=arc-20160816;
        b=kjch2dvvCrVWxwhpn5B/Vx31iJiUsWjYTfnfJ0PvRJVwN0IdqZ6h5SF+ZBqtKvrOMP
         04wWClwgUYaUiQkZULZX0JRbLSrnFy1Tw+VxyBBx5IFf9759dELRAI+9o5cVMS3zWjOk
         sCz7zxnXElipdF8uOwfnyMyhJ8C8ow95htiFD/qA9rbx06LuMLNLspOViIY542OsulvD
         IdMA7Ag/i7NjPq2z2Fn4ZLX6dvQiO7D4p6vAsZzOwQ//FsOmn/qBH9KIa9D71om82/oe
         iPBBn2DSZQwHdL5o8PRSUPeTO7OnjW8ifENP+Hj65cXulBaTJ1U7J32TlJPwwZMBOKB4
         KN+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=hNPCmKemNnyKryPR6yhnUGleIbKUntmYrx+rJuiAtag=;
        b=nU/F0JweXMz032RIU5yAs8+EXXqyH/RLoJ9avGoNwCe8Te+IStqtoIXhSzg+f7L7Ob
         9GSUZ6/Msubm0k4mbYmDZdmJmcbpAti1Nq4xhZSC5Av3dhVcJgbnFXrPcux8QaR/AMTZ
         Wn36T53WYXM465vCag0KKQzg3nz1N9TJkGkY47pWxYWRKIYZzEuYaffzoQyK4wLZXD21
         wqaSCPS0LzmU3K3l69eK7KM7NaHRxKCNkKTKfDxqMPYgh66SzDQ2M+/89znL7a0tLcDf
         /O0NmeaE5l2a089Xm2RcdtsDa3lXlrWMy/XQukJeaZwuY7hXRBxvLmnGrW7KhdXa/nzv
         DdNw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n32-v6si6200824qtk.16.2018.07.02.10.29.59
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 02 Jul 2018 10:30:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:34528 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fa2eF-0004zM-Dc
	for alex.bennee@linaro.org; Mon, 02 Jul 2018 13:29:59 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46034)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fa2YE-0000UO-CP
	for qemu-devel@nongnu.org; Mon, 02 Jul 2018 13:23:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fa2YC-0006v7-Sn
	for qemu-devel@nongnu.org; Mon, 02 Jul 2018 13:23:46 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:49778 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1fa2Y9-0006rC-4M; Mon, 02 Jul 2018 13:23:41 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B09677DAC2;
	Mon,  2 Jul 2018 17:23:40 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-116-57.ams2.redhat.com
	[10.36.116.57])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9A72F111AF38;
	Mon,  2 Jul 2018 17:23:38 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org,
	shameerali.kolothum.thodi@huawei.com, kwangwoo.lee@sk.com,
	imammedo@redhat.com, david@redhat.com
Date: Mon,  2 Jul 2018 19:22:39 +0200
Message-Id: <1530552162-15533-13-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1530552162-15533-1-git-send-email-eric.auger@redhat.com>
References: <1530552162-15533-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.2]);
	Mon, 02 Jul 2018 17:23:40 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.2]);
	Mon, 02 Jul 2018 17:23:40 +0000 (UTC) for IP:'10.11.54.3'
	DOMAIN:'int-mx03.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-devel] [RFC v2 12/15] nvdimm: use configurable ACPI IO base
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
Cc: wei@redhat.com, drjones@redhat.com, david@gibson.dropbear.id.au,
	dgilbert@redhat.com, agraf@suse.de
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 0dYXVZMx8+hU

From: Kwangwoo Lee <kwangwoo.lee@sk.com>

This patch uses configurable IO base and size to create NPIO AML for
ACPI NFIT. Since a different architecture like AArch64 does not use
port-mapped IO, a configurable IO base is required to create correct
mapping of ACPI IO address and size.

Signed-off-by: Kwangwoo Lee <kwangwoo.lee@sk.com>
Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 hw/acpi/nvdimm.c        | 28 +++++++++++++++++++---------
 hw/i386/pc_piix.c       |  8 +++++++-
 hw/i386/pc_q35.c        |  8 +++++++-
 include/hw/mem/nvdimm.h | 12 ++++++++++++
 4 files changed, 45 insertions(+), 11 deletions(-)

diff --git a/hw/acpi/nvdimm.c b/hw/acpi/nvdimm.c
index 27eeb66..17d7146 100644
--- a/hw/acpi/nvdimm.c
+++ b/hw/acpi/nvdimm.c
@@ -929,8 +929,8 @@ void nvdimm_init_acpi_state(AcpiNVDIMMState *state, MemoryRegion *io,
                             FWCfgState *fw_cfg, Object *owner)
 {
     memory_region_init_io(&state->io_mr, owner, &nvdimm_dsm_ops, state,
-                          "nvdimm-acpi-io", NVDIMM_ACPI_IO_LEN);
-    memory_region_add_subregion(io, NVDIMM_ACPI_IO_BASE, &state->io_mr);
+                          "nvdimm-acpi-io", state->dsm_io.len);
+    memory_region_add_subregion(io, state->dsm_io.base, &state->io_mr);
 
     state->dsm_mem = g_array_new(false, true /* clear */, 1);
     acpi_data_push(state->dsm_mem, sizeof(NvdimmDsmIn));
@@ -959,12 +959,14 @@ void nvdimm_init_acpi_state(AcpiNVDIMMState *state, MemoryRegion *io,
 
 #define NVDIMM_QEMU_RSVD_UUID   "648B9CF2-CDA1-4312-8AD9-49C4AF32BD62"
 
-static void nvdimm_build_common_dsm(Aml *dev)
+static void nvdimm_build_common_dsm(Aml *dev,
+                                    AcpiNVDIMMState *acpi_nvdimm_state)
 {
     Aml *method, *ifctx, *function, *handle, *uuid, *dsm_mem, *elsectx2;
     Aml *elsectx, *unsupport, *unpatched, *expected_uuid, *uuid_invalid;
     Aml *pckg, *pckg_index, *pckg_buf, *field, *dsm_out_buf, *dsm_out_buf_size;
     uint8_t byte_list[1];
+    AmlRegionSpace rs;
 
     method = aml_method(NVDIMM_COMMON_DSM, 5, AML_SERIALIZED);
     uuid = aml_arg(0);
@@ -975,9 +977,16 @@ static void nvdimm_build_common_dsm(Aml *dev)
 
     aml_append(method, aml_store(aml_name(NVDIMM_ACPI_MEM_ADDR), dsm_mem));
 
+    if (acpi_nvdimm_state->dsm_io.type == NVDIMM_ACPI_IO_PORT) {
+        rs = AML_SYSTEM_IO;
+    } else {
+        rs = AML_SYSTEM_MEMORY;
+    }
+
     /* map DSM memory and IO into ACPI namespace. */
-    aml_append(method, aml_operation_region(NVDIMM_DSM_IOPORT, AML_SYSTEM_IO,
-               aml_int(NVDIMM_ACPI_IO_BASE), NVDIMM_ACPI_IO_LEN));
+    aml_append(method, aml_operation_region(NVDIMM_DSM_IOPORT, rs,
+               aml_int(acpi_nvdimm_state->dsm_io.base),
+               acpi_nvdimm_state->dsm_io.len));
     aml_append(method, aml_operation_region(NVDIMM_DSM_MEMORY,
                AML_SYSTEM_MEMORY, dsm_mem, sizeof(NvdimmDsmIn)));
 
@@ -1260,7 +1269,8 @@ static void nvdimm_build_nvdimm_devices(Aml *root_dev, uint32_t ram_slots)
 }
 
 static void nvdimm_build_ssdt(GArray *table_offsets, GArray *table_data,
-                              BIOSLinker *linker, GArray *dsm_dma_arrea,
+                              BIOSLinker *linker,
+                              AcpiNVDIMMState *acpi_nvdimm_state,
                               uint32_t ram_slots)
 {
     Aml *ssdt, *sb_scope, *dev;
@@ -1288,7 +1298,7 @@ static void nvdimm_build_ssdt(GArray *table_offsets, GArray *table_data,
      */
     aml_append(dev, aml_name_decl("_HID", aml_string("ACPI0012")));
 
-    nvdimm_build_common_dsm(dev);
+    nvdimm_build_common_dsm(dev, acpi_nvdimm_state);
 
     /* 0 is reserved for root device. */
     nvdimm_build_device_dsm(dev, 0);
@@ -1307,7 +1317,7 @@ static void nvdimm_build_ssdt(GArray *table_offsets, GArray *table_data,
                                                NVDIMM_ACPI_MEM_ADDR);
 
     bios_linker_loader_alloc(linker,
-                             NVDIMM_DSM_MEM_FILE, dsm_dma_arrea,
+                             NVDIMM_DSM_MEM_FILE, acpi_nvdimm_state->dsm_mem,
                              sizeof(NvdimmDsmIn), false /* high memory */);
     bios_linker_loader_add_pointer(linker,
         ACPI_BUILD_TABLE_FILE, mem_addr_offset, sizeof(uint32_t),
@@ -1329,7 +1339,7 @@ void nvdimm_build_acpi(GArray *table_offsets, GArray *table_data,
         return;
     }
 
-    nvdimm_build_ssdt(table_offsets, table_data, linker, state->dsm_mem,
+    nvdimm_build_ssdt(table_offsets, table_data, linker, state,
                       ram_slots);
 
     device_list = nvdimm_get_device_list();
diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index d357907..607517e 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -296,7 +296,13 @@ static void pc_init1(MachineState *machine,
     }
 
     if (pcms->acpi_nvdimm_state.is_enabled) {
-        nvdimm_init_acpi_state(&pcms->acpi_nvdimm_state, system_io,
+        AcpiNVDIMMState *acpi_nvdimm_state = &pcms->acpi_nvdimm_state;
+
+        acpi_nvdimm_state->dsm_io.type = NVDIMM_ACPI_IO_PORT;
+        acpi_nvdimm_state->dsm_io.base = NVDIMM_ACPI_IO_BASE;
+        acpi_nvdimm_state->dsm_io.size = NVDIMM_ACPI_IO_LEN;
+
+        nvdimm_init_acpi_state(acpi_nvdimm_state, system_io,
                                pcms->fw_cfg, OBJECT(pcms));
     }
 }
diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
index 1a73e18..3c17e91 100644
--- a/hw/i386/pc_q35.c
+++ b/hw/i386/pc_q35.c
@@ -276,7 +276,13 @@ static void pc_q35_init(MachineState *machine)
     pc_nic_init(pcmc, isa_bus, host_bus);
 
     if (pcms->acpi_nvdimm_state.is_enabled) {
-        nvdimm_init_acpi_state(&pcms->acpi_nvdimm_state, system_io,
+        AcpiNVDIMMState *acpi_nvdimm_state = &pcms->acpi_nvdimm_state;
+
+        acpi_nvdimm_state->dsm_io.type = NVDIMM_ACPI_IO_PORT;
+        acpi_nvdimm_state->dsm_io.base = NVDIMM_ACPI_IO_BASE;
+        acpi_nvdimm_state->dsm_io.size = NVDIMM_ACPI_IO_LEN;
+
+        nvdimm_init_acpi_state(acpi_nvdimm_state, system_io,
                                pcms->fw_cfg, OBJECT(pcms));
     }
 }
diff --git a/include/hw/mem/nvdimm.h b/include/hw/mem/nvdimm.h
index c5c9b3c..af8a5fd 100644
--- a/include/hw/mem/nvdimm.h
+++ b/include/hw/mem/nvdimm.h
@@ -123,6 +123,17 @@ struct NvdimmFitBuffer {
 };
 typedef struct NvdimmFitBuffer NvdimmFitBuffer;
 
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
 
-- 
2.5.5

