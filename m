Received: by 10.25.205.13 with SMTP id d13csp8539457lfg;
        Mon, 2 Jan 2017 12:11:14 -0800 (PST)
X-Received: by 10.200.46.123 with SMTP id s56mr51659398qta.8.1483387874441;
        Mon, 02 Jan 2017 12:11:14 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t10si33763687qkt.160.2017.01.02.12.11.13
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 02 Jan 2017 12:11:14 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:58798 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cO8wp-00011s-Is
	for alex.bennee@linaro.org; Mon, 02 Jan 2017 15:11:11 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33358)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1cO8oM-0001vj-Uf
	for qemu-arm@nongnu.org; Mon, 02 Jan 2017 15:02:30 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1cO8oL-0003xI-KU
	for qemu-arm@nongnu.org; Mon, 02 Jan 2017 15:02:26 -0500
Received: from mx1.redhat.com ([209.132.183.28]:58330)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <drjones@redhat.com>)
	id 1cO8oL-0003wy-CP; Mon, 02 Jan 2017 15:02:25 -0500
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 76DEA3138;
	Mon,  2 Jan 2017 20:02:25 +0000 (UTC)
Received: from kamzik.brq.redhat.com (kamzik.brq.redhat.com [10.34.1.143])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id v02K1tOp017390; Mon, 2 Jan 2017 15:02:23 -0500
From: Andrew Jones <drjones@redhat.com>
To: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Date: Mon,  2 Jan 2017 21:01:50 +0100
Message-Id: <20170102200153.28864-14-drjones@redhat.com>
In-Reply-To: <20170102200153.28864-1-drjones@redhat.com>
References: <20170102200153.28864-1-drjones@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Mon, 02 Jan 2017 20:02:25 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v2 13/16] hw/arm/virt: remove VirtGuestInfo
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
Cc: peter.maydell@linaro.org, ehabkost@redhat.com, mst@redhat.com,
	shannon.zhao@linaro.org, zhaoshenglong@huawei.com, imammedo@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: aqKe2y3wU5MK

by moving VirtGuestInfo.fw_cfg to VirtMachineState. This is the
mach-virt equivalent of "pc: Move PcGuestInfo.fw_cfg to
PCMachineState" and "pc: Eliminate PcGuestInfo struct" combined.

Signed-off-by: Andrew Jones <drjones@redhat.com>
Acked-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/arm/virt-acpi-build.c |  7 +++----
 hw/arm/virt.c            | 16 +++++++---------
 include/hw/arm/virt.h    |  6 +-----
 3 files changed, 11 insertions(+), 18 deletions(-)

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index 0b9c2c0d0a3b..aa800d2a9657 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -825,11 +825,10 @@ static const VMStateDescription vmstate_virt_acpi_build = {
 
 void virt_acpi_setup(VirtMachineState *vms)
 {
-    VirtGuestInfo *guest_info = &vms->acpi_guest_info;
     AcpiBuildTables tables;
     AcpiBuildState *build_state;
 
-    if (!guest_info->fw_cfg) {
+    if (!vms->fw_cfg) {
         trace_virt_acpi_setup();
         return;
     }
@@ -854,8 +853,8 @@ void virt_acpi_setup(VirtMachineState *vms)
         acpi_add_rom_blob(build_state, tables.linker->cmd_blob,
                           "etc/table-loader", 0);
 
-    fw_cfg_add_file(guest_info->fw_cfg, ACPI_BUILD_TPMLOG_FILE,
-                    tables.tcpalog->data, acpi_data_len(tables.tcpalog));
+    fw_cfg_add_file(vms->fw_cfg, ACPI_BUILD_TPMLOG_FILE, tables.tcpalog->data,
+                    acpi_data_len(tables.tcpalog));
 
     build_state->rsdp_mr = acpi_add_rom_blob(build_state, tables.rsdp,
                                               ACPI_BUILD_RSDP_FILE, 0);
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 909d87fbff57..709da403a6fc 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -913,7 +913,7 @@ static void create_flash(const VirtMachineState *vms,
     }
 }
 
-static void create_fw_cfg(const VirtMachineState *vms, AddressSpace *as)
+static FWCfgState *create_fw_cfg(const VirtMachineState *vms, AddressSpace *as)
 {
     hwaddr base = vms->memmap[VIRT_FW_CFG].base;
     hwaddr size = vms->memmap[VIRT_FW_CFG].size;
@@ -930,6 +930,7 @@ static void create_fw_cfg(const VirtMachineState *vms, AddressSpace *as)
     qemu_fdt_setprop_sized_cells(vms->fdt, nodename, "reg",
                                  2, base, 2, size);
     g_free(nodename);
+    return fw_cfg;
 }
 
 static void create_pcie_irq_map(const VirtMachineState *vms,
@@ -1157,12 +1158,11 @@ static void *machvirt_dtb(const struct arm_boot_info *binfo, int *fdt_size)
 
 static void virt_build_smbios(VirtMachineState *vms)
 {
-    FWCfgState *fw_cfg = vms->acpi_guest_info.fw_cfg;
     uint8_t *smbios_tables, *smbios_anchor;
     size_t smbios_tables_len, smbios_anchor_len;
     const char *product = "QEMU Virtual Machine";
 
-    if (!fw_cfg) {
+    if (!vms->fw_cfg) {
         return;
     }
 
@@ -1177,9 +1177,9 @@ static void virt_build_smbios(VirtMachineState *vms)
                       &smbios_anchor, &smbios_anchor_len);
 
     if (smbios_anchor) {
-        fw_cfg_add_file(fw_cfg, "etc/smbios/smbios-tables",
+        fw_cfg_add_file(vms->fw_cfg, "etc/smbios/smbios-tables",
                         smbios_tables, smbios_tables_len);
-        fw_cfg_add_file(fw_cfg, "etc/smbios/smbios-anchor",
+        fw_cfg_add_file(vms->fw_cfg, "etc/smbios/smbios-anchor",
                         smbios_anchor, smbios_anchor_len);
     }
 }
@@ -1204,7 +1204,6 @@ static void machvirt_init(MachineState *machine)
     int n, virt_max_cpus;
     MemoryRegion *ram = g_new(MemoryRegion, 1);
     const char *cpu_model = machine->cpu_model;
-    VirtGuestInfo *guest_info = &vms->acpi_guest_info;
     char **cpustr;
     ObjectClass *oc;
     const char *typename;
@@ -1412,10 +1411,9 @@ static void machvirt_init(MachineState *machine)
      */
     create_virtio_devices(vms, pic);
 
-    create_fw_cfg(vms, &address_space_memory);
-    rom_set_fw(fw_cfg_find());
+    vms->fw_cfg = create_fw_cfg(vms, &address_space_memory);
+    rom_set_fw(vms->fw_cfg);
 
-    guest_info->fw_cfg = fw_cfg_find();
     vms->machine_done.notify = virt_machine_done;
     qemu_add_machine_init_done_notifier(&vms->machine_done);
 
diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
index 23f11776a557..8f67794d4e65 100644
--- a/include/hw/arm/virt.h
+++ b/include/hw/arm/virt.h
@@ -79,10 +79,6 @@ typedef struct MemMapEntry {
     hwaddr size;
 } MemMapEntry;
 
-typedef struct VirtGuestInfo {
-    FWCfgState *fw_cfg;
-} VirtGuestInfo;
-
 typedef struct {
     MachineClass parent;
     bool disallow_affinity_adjustment;
@@ -93,8 +89,8 @@ typedef struct {
 
 typedef struct {
     MachineState parent;
-    VirtGuestInfo acpi_guest_info;
     Notifier machine_done;
+    FWCfgState *fw_cfg;
     bool secure;
     bool highmem;
     bool virt;
-- 
2.9.3

