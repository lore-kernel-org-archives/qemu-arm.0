Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp404232wrq;
        Wed, 13 Jun 2018 01:50:00 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKKgnarNRKCAQUwSq6aNghRlPZR9a2BMtEPQnQhMW0pemje0xQFunPfTR7qQJWcwxN1vNvck
X-Received: by 2002:a0c:879b:: with SMTP id 27-v6mr3609088qvj.171.1528879800810;
        Wed, 13 Jun 2018 01:50:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1528879800; cv=none;
        d=google.com; s=arc-20160816;
        b=LV09YwgJUpQEfVv9R9Yo1dmZjDcB/Ud719qxSdlLeKhd56v0/qnRd5/k08ss+zL2Be
         1zIC+CkDwN9FHVJ2IDrAJ0y23ijoBJJRDyOg7hrr2UTOWWRYCOmNm9DwTdoIUdCWW6QZ
         1UkXOhClSfi1We2mJKNfTOmigsqiTjayN0G+a3hyqL+GIsbK0CFax4IgYFAs29fX1ltU
         U15cTMdJzhAjdb2+bUSqu6kwqZ35YTYnANSBYDYyN0CCgmH+1N1YuPWyxHlKOfEzXEKS
         9QK5S17Xf7xRxxuEa/BitFIPtnkDF4LLLMkIfQjSTYQ9Q5CX1R8mMJA4XSv9v4/234et
         qhhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=+CfyEKRaSMsrM1IpQusKxGC9F1+N2Oa6ZmgarGi2HKQ=;
        b=g7pTr+aIsfxML4YfrRmKj9OllaVjnBr0Rz7y2hbFzDlRrnnWwlj13A2pQ9QUunJ826
         uH9WxGHt21FB82YWw9HTwHX8UkXfRlJ0xM2VLJjtnVcOp1LEXDadht4DgUMlzcu39h56
         u5XMWn1TEyO+RiaeYPtD87bYyUA6un0UL4pW8Px1azgZgZ6U2FCe3vPFbAguVcOkm6m0
         waOq2Cnjtl0e0hALmr/U60H2/5Ox9i0/AHgQjiMfI4VUpFtmBuXHSFuuzLvnQ/ABss2w
         gx4SNJAmktQkp/tDgejDKKq3IfYAo/JWLM9r0fYDjeCMU7tTm6t94HXz6hkrZ+eyfH9l
         o+ag==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n30-v6si1831812qvg.289.2018.06.13.01.50.00
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 13 Jun 2018 01:50:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:60765 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fT1Tc-0002Xc-7F
	for alex.bennee@linaro.org; Wed, 13 Jun 2018 04:50:00 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56600)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fT1Sy-0002R3-7X
	for qemu-devel@nongnu.org; Wed, 13 Jun 2018 04:49:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fT1Sw-0003xh-Nn
	for qemu-devel@nongnu.org; Wed, 13 Jun 2018 04:49:20 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:35492 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1fT1St-0003wc-KK; Wed, 13 Jun 2018 04:49:15 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1E0EE87A82;
	Wed, 13 Jun 2018 08:49:15 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-116-69.ams2.redhat.com
	[10.36.116.69])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 474321116703;
	Wed, 13 Jun 2018 08:49:13 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org
Date: Wed, 13 Jun 2018 10:48:42 +0200
Message-Id: <1528879723-24675-9-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1528879723-24675-1-git-send-email-eric.auger@redhat.com>
References: <1528879723-24675-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.1]);
	Wed, 13 Jun 2018 08:49:15 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.1]);
	Wed, 13 Jun 2018 08:49:15 +0000 (UTC) for IP:'10.11.54.3'
	DOMAIN:'int-mx03.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-devel] [PATCH 8/9] hw/arm/virt: Add a new 256MB ECAM region
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
Cc: wei@redhat.com, drjones@redhat.com, ard.biesheuvel@linaro.org,
	marc.zyngier@arm.com, christoffer.dall@arm.com,
	zhaoshenglong@huawei.com, lersek@redhat.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: jvuSC/gibgpp

This patch defines a new ECAM region located after the 256GB limit.

The virt machine state is augmented with a new highmem_ecam field
which guards the usage of this new ECAM region instead of the legacy
16MB one. With the highmem ECAM region, up to 256 PCIe buses can be
used.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Laszlo Ersek <lersek@redhat.com>

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
index eefd1d4..4409a51 100644
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
@@ -573,16 +577,17 @@ build_mcfg(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
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
@@ -766,7 +771,7 @@ build_dsdt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
     acpi_dsdt_add_virtio(scope, &memmap[VIRT_MMIO],
                     (irqmap[VIRT_MMIO] + ARM_SPI_BASE), NUM_VIRTIO_TRANSPORTS);
     acpi_dsdt_add_pci(scope, memmap, (irqmap[VIRT_PCIE] + ARM_SPI_BASE),
-                      vms->highmem);
+                      vms->highmem, vms->highmem_ecam);
     acpi_dsdt_add_gpio(scope, &memmap[VIRT_GPIO],
                        (irqmap[VIRT_GPIO] + ARM_SPI_BASE));
     acpi_dsdt_add_power_button(scope);
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 2a1c0fb..22b9bd1 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -150,6 +150,7 @@ static const MemMapEntry a15memmap[] = {
     [VIRT_MEM] =                { 0x40000000, RAMLIMIT_BYTES },
     /* Additional 64 MB redist region (can contain up to 512 redistributors) */
     [VIRT_GIC_REDIST2] =        { 0x4000000000ULL, 0x4000000ULL },
+    [VIRT_PCIE_ECAM_HIGH] =     { 0x4010000000ULL, 0x10000000 },
     /* Second PCIe window, 512GB wide at the 512GB boundary */
     [VIRT_PCIE_MMIO_HIGH] =   { 0x8000000000ULL, 0x8000000000ULL },
 };
@@ -1043,10 +1044,9 @@ static void create_pcie(VirtMachineState *vms, qemu_irq *pic)
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
@@ -1054,12 +1054,16 @@ static void create_pcie(VirtMachineState *vms, qemu_irq *pic)
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
index 308156f..2c18a59 100644
--- a/include/hw/arm/virt.h
+++ b/include/hw/arm/virt.h
@@ -72,6 +72,7 @@ enum {
     VIRT_PCIE_MMIO,
     VIRT_PCIE_PIO,
     VIRT_PCIE_ECAM,
+    VIRT_PCIE_ECAM_HIGH,
     VIRT_PLATFORM_BUS,
     VIRT_PCIE_MMIO_HIGH,
     VIRT_GPIO,
@@ -106,6 +107,7 @@ typedef struct {
     FWCfgState *fw_cfg;
     bool secure;
     bool highmem;
+    bool highmem_ecam;
     bool its;
     bool virt;
     int32_t gic_version;
-- 
2.5.5

