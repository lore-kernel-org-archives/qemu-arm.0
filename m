Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp2064515wrq;
        Thu, 14 Jun 2018 06:54:19 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKI/iUCUUN6hlGPDRhCFqfFpjcXYY4JKHLvxmYPl8szRQM4gIDHO4WCzlrziO4gnBpbyZW1M
X-Received: by 2002:ac8:3426:: with SMTP id u35-v6mr2412586qtb.288.1528984459126;
        Thu, 14 Jun 2018 06:54:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1528984459; cv=none;
        d=google.com; s=arc-20160816;
        b=wR9LF6n1T9Mh7IN7+hG5fUYvSws/ZDJ0/s5/UAQVf8YqHOGDqst7oLlwYs1FtdX7Kw
         oFFvuEqebx27eZhsQCY7CaE5q4ldW5rNR/UtsvGhZ2VSnB0JW7nkoj2NaKXuBsABbooG
         uavY3fljSWctCAuPaFQnXshGljbNtlZ8vBlqJAggUlwHg8fcn+c52zqc0uijWngCjVK5
         WPX3TnJ51IHT1clhOxvKtCUIScoTaQelIA97wAsmaeIS7d8ZyW9gq2ZKwOGgICySI9V4
         c5M+S4kGWGB4VUdGNOw6mEdtJdET1/YRSxufFB56q6mMcK3WbKUXBO4D+v2kMaXbyPxn
         ABQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :arc-authentication-results;
        bh=pIlDK/PlxzU0aAYssNSlJcjL+YV5h4saOANuJNPL6xE=;
        b=xjzQupqvsKle3aY0z3DRKHB+pq3HHPYRaP7gLb4hLo3sGImTntKX4vbdHO3evXAyjw
         Sh2ogXbAludjdNtV9hrbi+UhqmJIbTDAZHR/f4n6stnT6QxHSMILRxhnYWRCeaYEmKeW
         hb9WkmGaLmBdy/F8Feu9Gq6rRQBtZSat7R6ERU3KxrEh3VPLddDKqPW/swsTp8FugyU0
         SVefyMVl5fjPa5ObL8q15MAP0m86wY98g/LkQY8e8DBGjMBNZWqOZawQvx3K10Uu+7ww
         qXD0/Cir1+iSAamKp7Ugy/OC9TieRWFXdibO9ZAfK5TWywPHqvZ3gwkoIb46awb9J37z
         E6rQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y9-v6si5187525qtk.239.2018.06.14.06.54.18
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 14 Jun 2018 06:54:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:40810 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fTShe-0004Mw-J6
	for alex.bennee@linaro.org; Thu, 14 Jun 2018 09:54:18 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52824)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1fTShA-0004LZ-G1
	for qemu-devel@nongnu.org; Thu, 14 Jun 2018 09:53:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1fTSh9-0006Wa-62
	for qemu-devel@nongnu.org; Thu, 14 Jun 2018 09:53:48 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:40812 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <drjones@redhat.com>)
	id 1fTSh4-0006VW-AK; Thu, 14 Jun 2018 09:53:42 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A26D681663E4;
	Thu, 14 Jun 2018 13:53:41 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.43.2.160])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5331A1117624;
	Thu, 14 Jun 2018 13:53:35 +0000 (UTC)
Date: Thu, 14 Jun 2018 15:53:33 +0200
From: Andrew Jones <drjones@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Message-ID: <20180614135333.vukhyuzuei37uihg@kamzik.brq.redhat.com>
References: <1528879723-24675-1-git-send-email-eric.auger@redhat.com>
	<1528879723-24675-9-git-send-email-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1528879723-24675-9-git-send-email-eric.auger@redhat.com>
User-Agent: NeoMutt/20180512
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.8]);
	Thu, 14 Jun 2018 13:53:41 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.8]);
	Thu, 14 Jun 2018 13:53:41 +0000 (UTC) for IP:'10.11.54.3'
	DOMAIN:'int-mx03.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'drjones@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-devel] [PATCH 8/9] hw/arm/virt: Add a new 256MB ECAM
 region
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
Cc: wei@redhat.com, peter.maydell@linaro.org, ard.biesheuvel@linaro.org,
	marc.zyngier@arm.com, qemu-devel@nongnu.org,
	christoffer.dall@arm.com, qemu-arm@nongnu.org,
	zhaoshenglong@huawei.com, lersek@redhat.com, eric.auger.pro@gmail.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: m9yFXQI+GzOk

On Wed, Jun 13, 2018 at 10:48:42AM +0200, Eric Auger wrote:
> This patch defines a new ECAM region located after the 256GB limit.
> 
> The virt machine state is augmented with a new highmem_ecam field
> which guards the usage of this new ECAM region instead of the legacy
> 16MB one. With the highmem ECAM region, up to 256 PCIe buses can be
> used.
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> Reviewed-by: Laszlo Ersek <lersek@redhat.com>
> 
> ---
> 
> RFC -> PATCH:
> - remove the newline at the end of acpi_dsdt_add_pci
> - use vms->highmem_ecam to select the memmap id
> ---
>  hw/arm/virt-acpi-build.c | 21 +++++++++++++--------
>  hw/arm/virt.c            | 12 ++++++++----
>  include/hw/arm/virt.h    |  2 ++
>  3 files changed, 23 insertions(+), 12 deletions(-)
> 
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index eefd1d4..4409a51 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -150,16 +150,17 @@ static void acpi_dsdt_add_virtio(Aml *scope,
>  }
>  
>  static void acpi_dsdt_add_pci(Aml *scope, const MemMapEntry *memmap,
> -                              uint32_t irq, bool use_highmem)
> +                              uint32_t irq, bool use_highmem, bool highmem_ecam)
>  {
> +    int ecam_id = highmem_ecam ? VIRT_PCIE_ECAM_HIGH : VIRT_PCIE_ECAM;

This id selection gets used a lot. It might be nice to introduce a helper.

>      Aml *method, *crs, *ifctx, *UUID, *ifctx1, *elsectx, *buf;
>      int i, bus_no;
>      hwaddr base_mmio = memmap[VIRT_PCIE_MMIO].base;
>      hwaddr size_mmio = memmap[VIRT_PCIE_MMIO].size;
>      hwaddr base_pio = memmap[VIRT_PCIE_PIO].base;
>      hwaddr size_pio = memmap[VIRT_PCIE_PIO].size;
> -    hwaddr base_ecam = memmap[VIRT_PCIE_ECAM].base;
> -    hwaddr size_ecam = memmap[VIRT_PCIE_ECAM].size;
> +    hwaddr base_ecam = memmap[ecam_id].base;
> +    hwaddr size_ecam = memmap[ecam_id].size;
>      int nr_pcie_buses = size_ecam / PCIE_MMCFG_SIZE_MIN;
>  
>      Aml *dev = aml_device("%s", "PCI0");
> @@ -173,7 +174,7 @@ static void acpi_dsdt_add_pci(Aml *scope, const MemMapEntry *memmap,
>      aml_append(dev, aml_name_decl("_CCA", aml_int(1)));
>  
>      /* Declare the PCI Routing Table. */
> -    Aml *rt_pkg = aml_package(nr_pcie_buses * PCI_NUM_PINS);
> +    Aml *rt_pkg = aml_varpackage(nr_pcie_buses * PCI_NUM_PINS);

I guess this change is because we want to support 256 buses and
aml_package() only supports up to 255. That may be worth a comment.

>      for (bus_no = 0; bus_no < nr_pcie_buses; bus_no++) {
>          for (i = 0; i < PCI_NUM_PINS; i++) {
>              int gsi = (i + bus_no) % PCI_NUM_PINS;
> @@ -316,7 +317,10 @@ static void acpi_dsdt_add_pci(Aml *scope, const MemMapEntry *memmap,
>      Aml *dev_res0 = aml_device("%s", "RES0");
>      aml_append(dev_res0, aml_name_decl("_HID", aml_string("PNP0C02")));
>      crs = aml_resource_template();
> -    aml_append(crs, aml_memory32_fixed(base_ecam, size_ecam, AML_READ_WRITE));
> +    aml_append(crs,
> +        aml_qword_memory(AML_POS_DECODE, AML_MIN_FIXED, AML_MAX_FIXED,
> +                         AML_NON_CACHEABLE, AML_READ_WRITE, 0x0000, base_ecam,
> +                         base_ecam + size_ecam - 1, 0x0000, size_ecam));
>      aml_append(dev_res0, aml_name_decl("_CRS", crs));
>      aml_append(dev, dev_res0);
>      aml_append(scope, dev);
> @@ -573,16 +577,17 @@ build_mcfg(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>  {
>      AcpiTableMcfg *mcfg;
>      const MemMapEntry *memmap = vms->memmap;
> +    int ecam_id = vms->highmem_ecam ? VIRT_PCIE_ECAM_HIGH : VIRT_PCIE_ECAM;
>      int len = sizeof(*mcfg) + sizeof(mcfg->allocation[0]);
>      int mcfg_start = table_data->len;
>  
>      mcfg = acpi_data_push(table_data, len);
> -    mcfg->allocation[0].address = cpu_to_le64(memmap[VIRT_PCIE_ECAM].base);
> +    mcfg->allocation[0].address = cpu_to_le64(memmap[ecam_id].base);
>  
>      /* Only a single allocation so no need to play with segments */
>      mcfg->allocation[0].pci_segment = cpu_to_le16(0);
>      mcfg->allocation[0].start_bus_number = 0;
> -    mcfg->allocation[0].end_bus_number = (memmap[VIRT_PCIE_ECAM].size
> +    mcfg->allocation[0].end_bus_number = (memmap[ecam_id].size
>                                            / PCIE_MMCFG_SIZE_MIN) - 1;
>  
>      build_header(linker, table_data, (void *)(table_data->data + mcfg_start),
> @@ -766,7 +771,7 @@ build_dsdt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>      acpi_dsdt_add_virtio(scope, &memmap[VIRT_MMIO],
>                      (irqmap[VIRT_MMIO] + ARM_SPI_BASE), NUM_VIRTIO_TRANSPORTS);
>      acpi_dsdt_add_pci(scope, memmap, (irqmap[VIRT_PCIE] + ARM_SPI_BASE),
> -                      vms->highmem);
> +                      vms->highmem, vms->highmem_ecam);
>      acpi_dsdt_add_gpio(scope, &memmap[VIRT_GPIO],
>                         (irqmap[VIRT_GPIO] + ARM_SPI_BASE));
>      acpi_dsdt_add_power_button(scope);
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 2a1c0fb..22b9bd1 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -150,6 +150,7 @@ static const MemMapEntry a15memmap[] = {
>      [VIRT_MEM] =                { 0x40000000, RAMLIMIT_BYTES },
>      /* Additional 64 MB redist region (can contain up to 512 redistributors) */
>      [VIRT_GIC_REDIST2] =        { 0x4000000000ULL, 0x4000000ULL },
> +    [VIRT_PCIE_ECAM_HIGH] =     { 0x4010000000ULL, 0x10000000 },
>      /* Second PCIe window, 512GB wide at the 512GB boundary */
>      [VIRT_PCIE_MMIO_HIGH] =   { 0x8000000000ULL, 0x8000000000ULL },
>  };
> @@ -1043,10 +1044,9 @@ static void create_pcie(VirtMachineState *vms, qemu_irq *pic)
>      hwaddr size_mmio_high = vms->memmap[VIRT_PCIE_MMIO_HIGH].size;
>      hwaddr base_pio = vms->memmap[VIRT_PCIE_PIO].base;
>      hwaddr size_pio = vms->memmap[VIRT_PCIE_PIO].size;
> -    hwaddr base_ecam = vms->memmap[VIRT_PCIE_ECAM].base;
> -    hwaddr size_ecam = vms->memmap[VIRT_PCIE_ECAM].size;
> +    hwaddr base_ecam, size_ecam;
>      hwaddr base = base_mmio;
> -    int nr_pcie_buses = size_ecam / PCIE_MMCFG_SIZE_MIN;
> +    int nr_pcie_buses;
>      int irq = vms->irqmap[VIRT_PCIE];
>      MemoryRegion *mmio_alias;
>      MemoryRegion *mmio_reg;
> @@ -1054,12 +1054,16 @@ static void create_pcie(VirtMachineState *vms, qemu_irq *pic)
>      MemoryRegion *ecam_reg;
>      DeviceState *dev;
>      char *nodename;
> -    int i;
> +    int i, ecam_memmap_id;
>      PCIHostState *pci;
>  
>      dev = qdev_create(NULL, TYPE_GPEX_HOST);
>      qdev_init_nofail(dev);
>  
> +    ecam_memmap_id = vms->highmem_ecam ? VIRT_PCIE_ECAM_HIGH : VIRT_PCIE_ECAM;
> +    base_ecam = vms->memmap[ecam_memmap_id].base;
> +    size_ecam = vms->memmap[ecam_memmap_id].size;
> +    nr_pcie_buses = size_ecam / PCIE_MMCFG_SIZE_MIN;
>      /* Map only the first size_ecam bytes of ECAM space */
>      ecam_alias = g_new0(MemoryRegion, 1);
>      ecam_reg = sysbus_mmio_get_region(SYS_BUS_DEVICE(dev), 0);
> diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
> index 308156f..2c18a59 100644
> --- a/include/hw/arm/virt.h
> +++ b/include/hw/arm/virt.h
> @@ -72,6 +72,7 @@ enum {
>      VIRT_PCIE_MMIO,
>      VIRT_PCIE_PIO,
>      VIRT_PCIE_ECAM,
> +    VIRT_PCIE_ECAM_HIGH,
>      VIRT_PLATFORM_BUS,
>      VIRT_PCIE_MMIO_HIGH,
>      VIRT_GPIO,
> @@ -106,6 +107,7 @@ typedef struct {
>      FWCfgState *fw_cfg;
>      bool secure;
>      bool highmem;
> +    bool highmem_ecam;
>      bool its;
>      bool virt;
>      int32_t gic_version;
> -- 
> 2.5.5
> 
>

Reviewed-by: Andrew Jones <drjones@redhat.com>
