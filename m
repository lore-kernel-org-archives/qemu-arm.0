Received: by 2002:a05:7022:f8d:b0:8a:132c:44a7 with SMTP id eg13csp85997dlb;
        Wed, 18 Sep 2024 22:56:42 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUb4Tkej94YqR+Pm+vuDVhmdlfR00wlS2Ithsa6tyNtF4/lS3GMLAi5SMui2A6Y8v76+QJwtHq2xzxQxg==@linaro.org
X-Google-Smtp-Source: AGHT+IEw8BaKfKoGV3WXROJngtxPimjq5X4FQJZqsdZufIblpM4Tp+Fd8yz3WgObdd38LjCVTgH4
X-Received: by 2002:a05:6214:448c:b0:6c3:6455:85df with SMTP id 6a1803df08f44-6c57358cab3mr378574816d6.44.1726725402588;
        Wed, 18 Sep 2024 22:56:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1726725402; cv=none;
        d=google.com; s=arc-20240605;
        b=ORgBhQtyO1ieGvWb9V/w3IYyYxB4VxpOk6XWId5XI68uoANPPDgz1NxU7FYecu60EG
         wxuB4ynpS17IT2Rnp8gHv+LqLeXce7g8WnJEnuu1yBeZAsB2/8CmsLyMw023tCQ2ooda
         27bEVpsR3TBYVlAiROIBMg+3+GNR4SSynj1hWihWHkwPtnrcC7OpH9spVoqQ/avfAD6o
         PHiPSVrLx0CBLDZCJA2n5D1BTDcS2JrV//uWt4R3g4HP6BZ+Kw6ejlDlKA0xI77KLvW1
         VEoCKEXIe+A002NluhE7hUpJgDvY9nDKXHXN7HBRc5YVmBdOCHsWBo5r9GSQ0Yr5bre4
         1BHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=T5Fm5KUEGQvFUbUVrximgKlvG8DdNyE4KmdcX/MoBYY=;
        fh=33vV7fdwuF57f9/cQTMVCjJLx99l6PrD70Pt7L6JrPg=;
        b=Kvgpdm8dn9umbrEBtMHMw+WGKx9U6KDhqHWQQ4r2QYJxterJ5WWynqJbMnDR3N+8h2
         ZMqK9GTGjldbLRsKgI8HPI77wkhokTl1JILoTjB2FGUsDM9huAKuuo6eWFrZn7xHoOUy
         LHaYzdOrs5lKln/29hUZQ+VGBEVww19q5KxjdMJnSY3ldW2spEaAGFaul5MHYsPd0uz9
         xs/BXpfTbxw8ad+LApaWzR2holfNdb/xL8YWFbN7IlCZuBcAmOGry5y7AgeEm7tcchCO
         HDJGxcUBWfWD3w//8I1NEVWqiwl3XCkZYs9+53Z5ni82KktFFvBMLQWvMgCq9dsNmFda
         nTow==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=We6e8tAk;
       spf=pass (google.com: domain of zhao1.liu@intel.com designates 192.198.163.15 as permitted sender) smtp.mailfrom=zhao1.liu@intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <zhao1.liu@intel.com>
Received: from mgamail.intel.com (mgamail.intel.com. [192.198.163.15])
        by mx.google.com with ESMTPS id d75a77b69052e-45b17878befsi11303901cf.163.2024.09.18.22.56.41
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 18 Sep 2024 22:56:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of zhao1.liu@intel.com designates 192.198.163.15 as permitted sender) client-ip=192.198.163.15;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=We6e8tAk;
       spf=pass (google.com: domain of zhao1.liu@intel.com designates 192.198.163.15 as permitted sender) smtp.mailfrom=zhao1.liu@intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726725403; x=1758261403;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=85v++8FV1/OeoJfcfM2dF4Z0fvvP/1Y4odYjQpC249A=;
  b=We6e8tAkjnhIG9u/GK6oTcvN35Th3auW7KKIpaBLcVhlbROhPTkbDD/y
   sFZ4+BE0t4itnptYTF6T2vUJ+dPLzhwgJ1xz8cpBt15+HRkGMCg53UAV7
   Iz9/yEyzo1O6qcdS0f7Dt4QmdR17VwSou9wJ/q9n1bD4ivnw9VzXmB4p/
   AZ6D3AvARhnWW4PoKzW34A2dri/VGd5YrtrlHZWZvP28qb2yCkKNL68UP
   oP1DuID4VPk90B8P1dO+W+v/yGyMmajMsyoricVzHHDAzjYMHD9VtJZCl
   T3tWJJ/dGH42E3SZzJlJeYuU9XlQVlewnG06swEgXYT1AX92LGarCqSUl
   w==;
X-CSE-ConnectionGUID: UxO5uEvOQeKTnyIlbqy7ig==
X-CSE-MsgGUID: 40v40zIVTr6X/Vi227w4gg==
X-IronPort-AV: E=McAfee;i="6700,10204,11199"; a="25813758"
X-IronPort-AV: E=Sophos;i="6.10,240,1719903600"; 
   d="scan'208";a="25813758"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2024 22:56:41 -0700
X-CSE-ConnectionGUID: UYayTWY+RcSOXbGe/lxomA==
X-CSE-MsgGUID: oSBDaJfESCymhB7De9E+LA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,240,1719903600"; 
   d="scan'208";a="69418828"
Received: from liuzhao-optiplex-7080.sh.intel.com ([10.239.160.36])
  by fmviesa006.fm.intel.com with ESMTP; 18 Sep 2024 22:56:32 -0700
From: Zhao Liu <zhao1.liu@intel.com>
To: =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Igor Mammedov <imammedo@redhat.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Yanan Wang <wangyanan55@huawei.com>,
	"Michael S . Tsirkin" <mst@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Sergio Lopez <slp@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony PERARD <anthony@xenproject.org>,
	Paul Durrant <paul@xen.org>,
	"Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
	Eric Blake <eblake@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org,
	kvm@vger.kernel.org,
	qemu-arm@nongnu.org,
	Zhenyu Wang <zhenyu.z.wang@intel.com>,
	Dapeng Mi <dapeng1.mi@linux.intel.com>,
	Yongwei Ma <yongwei.ma@intel.com>,
	Zhao Liu <zhao1.liu@intel.com>
Subject: [RFC v2 11/12] i386/machine: Split machine initialization after CPU creation into post_init()
Date: Thu, 19 Sep 2024 14:11:27 +0800
Message-Id: <20240919061128.769139-12-zhao1.liu@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240919061128.769139-1-zhao1.liu@intel.com>
References: <20240919061128.769139-1-zhao1.liu@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: ApDYj3J2sRJF

Custom topology will allow machine to skip the default CPU creation and
accept user's CPU creation from CLI.

Therefore, for microvm, pc-i440fx and pc-q35, split machine
initialization from x86_cpus_init(), and place the remaining part into
post_init(), which can continue to run after CPU creation from CLI.

This addresses the CPU dependency for the remaining initialization steps
after x86_cpus_init().

Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
---
 hw/i386/microvm.c    |  7 +++++++
 hw/i386/pc_piix.c    | 40 +++++++++++++++++++++++++---------------
 hw/i386/pc_q35.c     | 36 ++++++++++++++++++++++--------------
 include/hw/i386/pc.h |  3 +++
 4 files changed, 57 insertions(+), 29 deletions(-)

diff --git a/hw/i386/microvm.c b/hw/i386/microvm.c
index 49a897db50fc..dc9b21a34230 100644
--- a/hw/i386/microvm.c
+++ b/hw/i386/microvm.c
@@ -463,6 +463,11 @@ static void microvm_machine_state_init(MachineState *machine)
     microvm_memory_init(mms);
 
     x86_cpus_init(x86ms, CPU_VERSION_LATEST);
+}
+
+static void microvm_machine_state_post_init(MachineState *machine)
+{
+    MicrovmMachineState *mms = MICROVM_MACHINE(machine);
 
     microvm_devices_init(mms);
 }
@@ -665,6 +670,8 @@ static void microvm_class_init(ObjectClass *oc, void *data)
     /* Machine class handlers */
     mc->reset = microvm_machine_reset;
 
+    mc->post_init = microvm_machine_state_post_init;
+
     /* hotplug (for cpu coldplug) */
     mc->get_hotplug_handler = microvm_get_hotplug_handler;
     hc->pre_plug = microvm_device_pre_plug_cb;
diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index 2bf6865d405e..c1db2f3129cf 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -105,19 +105,9 @@ static void pc_init1(MachineState *machine, const char *pci_type)
     PCMachineState *pcms = PC_MACHINE(machine);
     PCMachineClass *pcmc = PC_MACHINE_GET_CLASS(pcms);
     X86MachineState *x86ms = X86_MACHINE(machine);
-    MemoryRegion *system_memory = get_system_memory();
-    MemoryRegion *system_io = get_system_io();
-    Object *phb = NULL;
-    ISABus *isa_bus;
-    Object *piix4_pm = NULL;
-    qemu_irq smi_irq;
-    GSIState *gsi_state;
-    MemoryRegion *ram_memory;
-    MemoryRegion *pci_memory = NULL;
-    MemoryRegion *rom_memory = system_memory;
     ram_addr_t lowmem;
-    uint64_t hole64_size = 0;
 
+    pcms->pci_type = pci_type;
     /*
      * Calculate ram split, for memory below and above 4G.  It's a bit
      * complicated for backward compatibility reasons ...
@@ -150,9 +140,9 @@ static void pc_init1(MachineState *machine, const char *pci_type)
      *    qemu -M pc,max-ram-below-4g=4G -m 3968M  -> 3968M low (=4G-128M)
      */
     if (xen_enabled()) {
-        xen_hvm_init_pc(pcms, &ram_memory);
+        xen_hvm_init_pc(pcms, &pcms->pre_config_ram);
     } else {
-        ram_memory = machine->ram;
+        pcms->pre_config_ram = machine->ram;
         if (!pcms->max_ram_below_4g) {
             pcms->max_ram_below_4g = 0xe0000000; /* default: 3.5G */
         }
@@ -182,6 +172,23 @@ static void pc_init1(MachineState *machine, const char *pci_type)
 
     pc_machine_init_sgx_epc(pcms);
     x86_cpus_init(x86ms, pcmc->default_cpu_version);
+}
+
+static void pc_post_init1(MachineState *machine)
+{
+    PCMachineState *pcms = PC_MACHINE(machine);
+    PCMachineClass *pcmc = PC_MACHINE_GET_CLASS(pcms);
+    X86MachineState *x86ms = X86_MACHINE(machine);
+    MemoryRegion *system_memory = get_system_memory();
+    MemoryRegion *system_io = get_system_io();
+    Object *phb = NULL;
+    ISABus *isa_bus;
+    Object *piix4_pm = NULL;
+    qemu_irq smi_irq;
+    GSIState *gsi_state;
+    MemoryRegion *pci_memory = NULL;
+    MemoryRegion *rom_memory = system_memory;
+    uint64_t hole64_size = 0;
 
     if (kvm_enabled()) {
         kvmclock_create(pcmc->kvmclock_create_always);
@@ -195,7 +202,7 @@ static void pc_init1(MachineState *machine, const char *pci_type)
         phb = OBJECT(qdev_new(TYPE_I440FX_PCI_HOST_BRIDGE));
         object_property_add_child(OBJECT(machine), "i440fx", phb);
         object_property_set_link(phb, PCI_HOST_PROP_RAM_MEM,
-                                 OBJECT(ram_memory), &error_fatal);
+                                 OBJECT(pcms->pre_config_ram), &error_fatal);
         object_property_set_link(phb, PCI_HOST_PROP_PCI_MEM,
                                  OBJECT(pci_memory), &error_fatal);
         object_property_set_link(phb, PCI_HOST_PROP_SYSTEM_MEM,
@@ -206,7 +213,7 @@ static void pc_init1(MachineState *machine, const char *pci_type)
                                  x86ms->below_4g_mem_size, &error_fatal);
         object_property_set_uint(phb, PCI_HOST_ABOVE_4G_MEM_SIZE,
                                  x86ms->above_4g_mem_size, &error_fatal);
-        object_property_set_str(phb, I440FX_HOST_PROP_PCI_TYPE, pci_type,
+        object_property_set_str(phb, I440FX_HOST_PROP_PCI_TYPE, pcms->pci_type,
                                 &error_fatal);
         sysbus_realize_and_unref(SYS_BUS_DEVICE(phb), &error_fatal);
 
@@ -413,6 +420,7 @@ static void pc_set_south_bridge(Object *obj, int value, Error **errp)
 static void pc_init_isa(MachineState *machine)
 {
     pc_init1(machine, NULL);
+    pc_post_init1(machine);
 }
 #endif
 
@@ -423,6 +431,7 @@ static void pc_xen_hvm_init_pci(MachineState *machine)
                 TYPE_IGD_PASSTHROUGH_I440FX_PCI_DEVICE : TYPE_I440FX_PCI_DEVICE;
 
     pc_init1(machine, pci_type);
+    pc_post_init1(machine);
 }
 
 static void pc_xen_hvm_init(MachineState *machine)
@@ -463,6 +472,7 @@ static void pc_i440fx_machine_options(MachineClass *m)
     m->default_nic = "e1000";
     m->no_floppy = !module_object_class_by_name(TYPE_ISA_FDC);
     m->no_parallel = !module_object_class_by_name(TYPE_ISA_PARALLEL);
+    m->post_init = pc_post_init1;
     machine_class_allow_dynamic_sysbus_dev(m, TYPE_RAMFB_DEVICE);
     machine_class_allow_dynamic_sysbus_dev(m, TYPE_VMBUS_BRIDGE);
 
diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
index 8319b6d45ee3..9ce3e65d7182 100644
--- a/hw/i386/pc_q35.c
+++ b/hw/i386/pc_q35.c
@@ -129,21 +129,7 @@ static void pc_q35_init(MachineState *machine)
     PCMachineState *pcms = PC_MACHINE(machine);
     PCMachineClass *pcmc = PC_MACHINE_GET_CLASS(pcms);
     X86MachineState *x86ms = X86_MACHINE(machine);
-    Object *phb;
-    PCIDevice *lpc;
-    DeviceState *lpc_dev;
-    MemoryRegion *system_memory = get_system_memory();
-    MemoryRegion *system_io = get_system_io();
-    MemoryRegion *pci_memory = g_new(MemoryRegion, 1);
-    GSIState *gsi_state;
-    ISABus *isa_bus;
-    int i;
     ram_addr_t lowmem;
-    DriveInfo *hd[MAX_SATA_PORTS];
-    MachineClass *mc = MACHINE_GET_CLASS(machine);
-    bool acpi_pcihp;
-    bool keep_pci_slot_hpc;
-    uint64_t pci_hole64_size = 0;
 
     assert(pcmc->pci_enabled);
 
@@ -188,6 +174,27 @@ static void pc_q35_init(MachineState *machine)
 
     pc_machine_init_sgx_epc(pcms);
     x86_cpus_init(x86ms, pcmc->default_cpu_version);
+}
+
+static void pc_q35_post_init(MachineState *machine)
+{
+    PCMachineState *pcms = PC_MACHINE(machine);
+    PCMachineClass *pcmc = PC_MACHINE_GET_CLASS(pcms);
+    X86MachineState *x86ms = X86_MACHINE(machine);
+    Object *phb;
+    PCIDevice *lpc;
+    DeviceState *lpc_dev;
+    MemoryRegion *system_memory = get_system_memory();
+    MemoryRegion *system_io = get_system_io();
+    MemoryRegion *pci_memory = g_new(MemoryRegion, 1);
+    GSIState *gsi_state;
+    ISABus *isa_bus;
+    int i;
+    DriveInfo *hd[MAX_SATA_PORTS];
+    MachineClass *mc = MACHINE_GET_CLASS(machine);
+    bool acpi_pcihp;
+    bool keep_pci_slot_hpc;
+    uint64_t pci_hole64_size = 0;
 
     if (kvm_enabled()) {
         kvmclock_create(pcmc->kvmclock_create_always);
@@ -348,6 +355,7 @@ static void pc_q35_machine_options(MachineClass *m)
     m->no_floppy = 1;
     m->max_cpus = 4096;
     m->no_parallel = !module_object_class_by_name(TYPE_ISA_PARALLEL);
+    m->post_init = pc_q35_post_init;
     machine_class_allow_dynamic_sysbus_dev(m, TYPE_AMD_IOMMU_DEVICE);
     machine_class_allow_dynamic_sysbus_dev(m, TYPE_INTEL_IOMMU_DEVICE);
     machine_class_allow_dynamic_sysbus_dev(m, TYPE_RAMFB_DEVICE);
diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
index 14ee06287da3..14534781e8fb 100644
--- a/include/hw/i386/pc.h
+++ b/include/hw/i386/pc.h
@@ -58,6 +58,9 @@ typedef struct PCMachineState {
 
     SGXEPCState sgx_epc;
     CXLState cxl_devices_state;
+
+    MemoryRegion *pre_config_ram;
+    const char *pci_type;
 } PCMachineState;
 
 #define PC_MACHINE_ACPI_DEVICE_PROP "acpi-device"
-- 
2.34.1
