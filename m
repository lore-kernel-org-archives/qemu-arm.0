Received: by 2002:adf:b64b:0:0:0:0:0 with SMTP id i11-v6csp4808064wre;
        Wed, 30 May 2018 07:26:48 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKICNTOEKzX5kIbtpCITi4aPZQcM4oQhuL6G4DyvXmiOjKZRwzHUgNdBVs+z+vHa/2QvYE1d
X-Received: by 2002:a0c:89dd:: with SMTP id 29-v6mr2539102qvs.233.1527690408582;
        Wed, 30 May 2018 07:26:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1527690408; cv=none;
        d=google.com; s=arc-20160816;
        b=M1DUtN65isH0v57xultitdKUraQaR9jvqmmlBnkY0hxFOSNVXmTv0yDTutZAOC3ang
         HmbQvRFPke9WaP/CY6NfZeHBbasnKp4yAHuLMsicghoIsHoVAjNtb+h52yzovjtRFhms
         7sin0v/o6Zmjd9jrcpZnAb+wfwCpAL3thqxDSSVm5aTrnxX+N1V++0Dlmp1FuDNO2wPJ
         lVJM138edlL9mCCjKyyQNb5oAJ2XAxGzH14KuIEoYUA+VHWavNLIr6oc/QKc+UeCHv+m
         LKbd1urafWTf/uACMw+SGzG15bmIMw4ubua6xkQZJKjr0v6gmI6F/O64YUobDboHIdhX
         REZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=PwopmDjw4146P61usjvu1PEpi8qAxaL2/81V+Lh1L/4=;
        b=xfHuGd72mrPB/Vc3ViD/JF8WNMpn2mSDEYORwFgHJfSsUuhQPVJcWlH1wjzUJvwY/Q
         dVMIRQWs7bas7BOZbVyFv9PgjgMHNu/IAY39DFDnmQcA0bS6urbDap61ZzWmWWh7rFNa
         sctcpXxDbZzdXR5UtLBajqLVIn9Y1vACa6cRel22i3MyB/2TAZs71kuT0vBwH78DhRly
         jqTSYrEszFHWXfN6yxUdrc9Oc02gVLiiU1e4gFRxN3hj8ZL1+Mu6/3sGoHr0QYcp+j6B
         Uk7ucrG1mNwACTu3HaEzI+1vVZKItBkH/Vrbox5H6NjXe5DL8Ub1nG22Bk/xJmRtsVvC
         KIMg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 56-v6si8823240qtz.257.2018.05.30.07.26.48
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 30 May 2018 07:26:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:38972 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fO23s-0003x1-2y
	for alex.bennee@linaro.org; Wed, 30 May 2018 10:26:48 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33773)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fO23d-0003tZ-04
	for qemu-arm@nongnu.org; Wed, 30 May 2018 10:26:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fO23Z-0000Hn-Jr
	for qemu-arm@nongnu.org; Wed, 30 May 2018 10:26:33 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:48880 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1fO23Z-0000HV-FG; Wed, 30 May 2018 10:26:29 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id F408F40BC06E;
	Wed, 30 May 2018 14:26:28 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-116-69.ams2.redhat.com
	[10.36.116.69])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6E4BE63F3E;
	Wed, 30 May 2018 14:26:27 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org
Date: Wed, 30 May 2018 16:26:19 +0200
Message-Id: <1527690380-9782-2-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1527690380-9782-1-git-send-email-eric.auger@redhat.com>
References: <1527690380-9782-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.7]);
	Wed, 30 May 2018 14:26:29 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.7]);
	Wed, 30 May 2018 14:26:29 +0000 (UTC) for IP:'10.11.54.5'
	DOMAIN:'int-mx05.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-arm] [PATCH 1/2] hw/arm/virt: Add a new 256MB ECAM region
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
Cc: drjones@redhat.com, ard.biesheuvel@linaro.org, lersek@redhat.com,
	zhaoshenglong@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: tk9UsWZCc0I4

This patch defines a new ECAM region located after the 256GB limit.

The virt machine state is augmented with a new highmem_ecam field
which guards the usage of this new ECAM region instead of the legacy
16MB one. With the highmem ECAM region, up to 256 PCIe buses can be
used.

Signed-off-by: Eric Auger <eric.auger@redhat.com>

---

RFC -> PATCH:
- remove the newline at the end of acpi_dsdt_add_pci
- use vms->highmem_ecam to select the memmap id
---
 hw/arm/virt-acpi-build.c | 21 +++++++++++++--------
 hw/arm/virt.c            | 12 ++++++++----
 include/hw/arm/virt.h    |  2 ++
 3 files changed, 23 insertions(+), 12 deletions(-)

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index 92ceee9..c0370b2 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -150,16 +150,17 @@ static void acpi_dsdt_add_virtio(Aml *scope,
 }
 
 static void acpi_dsdt_add_pci(Aml *scope, const MemMapEntry *memmap,
-                              uint32_t irq, bool use_highmem)
+                              uint32_t irq, bool use_highmem, bool highmem_ecam)
 {
+    int ecam_id = highmem_ecam ? VIRT_PCIE_ECAM_HIGH : VIRT_PCIE_ECAM;
     Aml *method, *crs, *ifctx, *UUID, *ifctx1, *elsectx, *buf;
     int i, bus_no;
     hwaddr base_mmio = memmap[VIRT_PCIE_MMIO].base;
     hwaddr size_mmio = memmap[VIRT_PCIE_MMIO].size;
     hwaddr base_pio = memmap[VIRT_PCIE_PIO].base;
     hwaddr size_pio = memmap[VIRT_PCIE_PIO].size;
-    hwaddr base_ecam = memmap[VIRT_PCIE_ECAM].base;
-    hwaddr size_ecam = memmap[VIRT_PCIE_ECAM].size;
+    hwaddr base_ecam = memmap[ecam_id].base;
+    hwaddr size_ecam = memmap[ecam_id].size;
     int nr_pcie_buses = size_ecam / PCIE_MMCFG_SIZE_MIN;
 
     Aml *dev = aml_device("%s", "PCI0");
@@ -173,7 +174,7 @@ static void acpi_dsdt_add_pci(Aml *scope, const MemMapEntry *memmap,
     aml_append(dev, aml_name_decl("_CCA", aml_int(1)));
 
     /* Declare the PCI Routing Table. */
-    Aml *rt_pkg = aml_package(nr_pcie_buses * PCI_NUM_PINS);
+    Aml *rt_pkg = aml_varpackage(nr_pcie_buses * PCI_NUM_PINS);
     for (bus_no = 0; bus_no < nr_pcie_buses; bus_no++) {
         for (i = 0; i < PCI_NUM_PINS; i++) {
             int gsi = (i + bus_no) % PCI_NUM_PINS;
@@ -316,7 +317,10 @@ static void acpi_dsdt_add_pci(Aml *scope, const MemMapEntry *memmap,
     Aml *dev_res0 = aml_device("%s", "RES0");
     aml_append(dev_res0, aml_name_decl("_HID", aml_string("PNP0C02")));
     crs = aml_resource_template();
-    aml_append(crs, aml_memory32_fixed(base_ecam, size_ecam, AML_READ_WRITE));
+    aml_append(crs,
+        aml_qword_memory(AML_POS_DECODE, AML_MIN_FIXED, AML_MAX_FIXED,
+                         AML_NON_CACHEABLE, AML_READ_WRITE, 0x0000, base_ecam,
+                         base_ecam + size_ecam - 1, 0x0000, size_ecam));
     aml_append(dev_res0, aml_name_decl("_CRS", crs));
     aml_append(dev, dev_res0);
     aml_append(scope, dev);
@@ -563,16 +567,17 @@ build_mcfg(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
 {
     AcpiTableMcfg *mcfg;
     const MemMapEntry *memmap = vms->memmap;
+    int ecam_id = vms->highmem_ecam ? VIRT_PCIE_ECAM_HIGH : VIRT_PCIE_ECAM;
     int len = sizeof(*mcfg) + sizeof(mcfg->allocation[0]);
     int mcfg_start = table_data->len;
 
     mcfg = acpi_data_push(table_data, len);
-    mcfg->allocation[0].address = cpu_to_le64(memmap[VIRT_PCIE_ECAM].base);
+    mcfg->allocation[0].address = cpu_to_le64(memmap[ecam_id].base);
 
     /* Only a single allocation so no need to play with segments */
     mcfg->allocation[0].pci_segment = cpu_to_le16(0);
     mcfg->allocation[0].start_bus_number = 0;
-    mcfg->allocation[0].end_bus_number = (memmap[VIRT_PCIE_ECAM].size
+    mcfg->allocation[0].end_bus_number = (memmap[ecam_id].size
                                           / PCIE_MMCFG_SIZE_MIN) - 1;
 
     build_header(linker, table_data, (void *)(table_data->data + mcfg_start),
@@ -747,7 +752,7 @@ build_dsdt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
     acpi_dsdt_add_virtio(scope, &memmap[VIRT_MMIO],
                     (irqmap[VIRT_MMIO] + ARM_SPI_BASE), NUM_VIRTIO_TRANSPORTS);
     acpi_dsdt_add_pci(scope, memmap, (irqmap[VIRT_PCIE] + ARM_SPI_BASE),
-                      vms->highmem);
+                      vms->highmem, vms->highmem_ecam);
     acpi_dsdt_add_gpio(scope, &memmap[VIRT_GPIO],
                        (irqmap[VIRT_GPIO] + ARM_SPI_BASE));
     acpi_dsdt_add_power_button(scope);
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index a3a28e2..d4247d0 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -149,6 +149,7 @@ static const MemMapEntry a15memmap[] = {
     [VIRT_PCIE_PIO] =           { 0x3eff0000, 0x00010000 },
     [VIRT_PCIE_ECAM] =          { 0x3f000000, 0x01000000 },
     [VIRT_MEM] =                { 0x40000000, RAMLIMIT_BYTES },
+    [VIRT_PCIE_ECAM_HIGH] =     { 0x4010000000ULL, 0x10000000 },
     /* Second PCIe window, 512GB wide at the 512GB boundary */
     [VIRT_PCIE_MMIO_HIGH] =   { 0x8000000000ULL, 0x8000000000ULL },
 };
@@ -1001,10 +1002,9 @@ static void create_pcie(VirtMachineState *vms, qemu_irq *pic)
     hwaddr size_mmio_high = vms->memmap[VIRT_PCIE_MMIO_HIGH].size;
     hwaddr base_pio = vms->memmap[VIRT_PCIE_PIO].base;
     hwaddr size_pio = vms->memmap[VIRT_PCIE_PIO].size;
-    hwaddr base_ecam = vms->memmap[VIRT_PCIE_ECAM].base;
-    hwaddr size_ecam = vms->memmap[VIRT_PCIE_ECAM].size;
+    hwaddr base_ecam, size_ecam;
     hwaddr base = base_mmio;
-    int nr_pcie_buses = size_ecam / PCIE_MMCFG_SIZE_MIN;
+    int nr_pcie_buses;
     int irq = vms->irqmap[VIRT_PCIE];
     MemoryRegion *mmio_alias;
     MemoryRegion *mmio_reg;
@@ -1012,12 +1012,16 @@ static void create_pcie(VirtMachineState *vms, qemu_irq *pic)
     MemoryRegion *ecam_reg;
     DeviceState *dev;
     char *nodename;
-    int i;
+    int i, ecam_memmap_id;
     PCIHostState *pci;
 
     dev = qdev_create(NULL, TYPE_GPEX_HOST);
     qdev_init_nofail(dev);
 
+    ecam_memmap_id = vms->highmem_ecam ? VIRT_PCIE_ECAM_HIGH : VIRT_PCIE_ECAM;
+    base_ecam = vms->memmap[ecam_memmap_id].base;
+    size_ecam = vms->memmap[ecam_memmap_id].size;
+    nr_pcie_buses = size_ecam / PCIE_MMCFG_SIZE_MIN;
     /* Map only the first size_ecam bytes of ECAM space */
     ecam_alias = g_new0(MemoryRegion, 1);
     ecam_reg = sysbus_mmio_get_region(SYS_BUS_DEVICE(dev), 0);
diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
index 4ac7ef6..e9423a7 100644
--- a/include/hw/arm/virt.h
+++ b/include/hw/arm/virt.h
@@ -69,6 +69,7 @@ enum {
     VIRT_PCIE_MMIO,
     VIRT_PCIE_PIO,
     VIRT_PCIE_ECAM,
+    VIRT_PCIE_ECAM_HIGH,
     VIRT_PLATFORM_BUS,
     VIRT_PCIE_MMIO_HIGH,
     VIRT_GPIO,
@@ -103,6 +104,7 @@ typedef struct {
     FWCfgState *fw_cfg;
     bool secure;
     bool highmem;
+    bool highmem_ecam;
     bool its;
     bool virt;
     int32_t gic_version;
-- 
2.5.5

