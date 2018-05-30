Received: by 2002:adf:b64b:0:0:0:0:0 with SMTP id i11-v6csp4931954wre;
        Wed, 30 May 2018 09:26:48 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKJwknHfkEbJkUxJeRzKbkZIIQAW3YxQ1wrfjDWCws6+zdVu5TbiQLFFS69SSR3px+MCQEzU
X-Received: by 2002:ac8:2447:: with SMTP id d7-v6mr3326587qtd.50.1527697607963;
        Wed, 30 May 2018 09:26:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1527697607; cv=none;
        d=google.com; s=arc-20160816;
        b=EZ7UUfNum1VnJDM7oKEOom7cJ+BqgsaySQPde7HUPKzeMKWeFObdkjt/g6M0HLHS1+
         js7DopbAdTxdtYxQdWk8fp9sHAid4HPJ+32mxTGpQ+bI6iB+32H3DRsumlEtsFlcEOL/
         yEXJXMn12lJLPoPcyAKd2AnseDqJh3B/PYx9SIJytiDWFhTSyBZ6r1v9Zu25YDQFQq62
         Lsr7vCYyhqGAdEUHfbp0uZCUb8v2us42oZB80QCq97De2m9JIbuDtb4wk5IxW/CcbuwC
         0XYAAuF4b3TTMRpj/7CWBTgVptwSlR4P+YodK165PLKe7JQjD/ea/cKP2fpIa1akZwc0
         DE3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to
         :arc-authentication-results;
        bh=bDWJlkrevX0IzR6LtrULj1YWdQdPH9f421qaQxO0bkc=;
        b=BfuaEuxyWjWJRZgIWnUU5kNkKr2N5HBJea+ZgV/tkVRBeZr+Zv+zBxEgo3t3kbOJIv
         RlOVetlsNM/Jt2wqM2CMC82iclYrafrHbx+OjtZ6vPkgvheNsw+Aw0V0t61UbVRh7pix
         L/ODmQ/Kyykg/dIMZIPQPxLXYxC3zS0Lx70ePcjhTPDy6ybVmJ24+jCpgbEnPhLWXEme
         40BxTvjkcRiW7/j+jYmChXlBbR/JDnsF3IrxlpkkddfLIKtCCT6y4By9s33mLAEZFK19
         rnhFx0vDF76k9PY4MjiBv0yHTfw6ol+g2WPpyIzNtV8bzqnG0o0lFO6rw5D36LMqrCgJ
         rWXA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t6-v6si1345417qtc.298.2018.05.30.09.26.47
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 30 May 2018 09:26:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:39599 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fO3vz-0004Gs-Dj
	for alex.bennee@linaro.org; Wed, 30 May 2018 12:26:47 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59416)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lersek@redhat.com>) id 1fO3gu-0001xr-Cs
	for qemu-devel@nongnu.org; Wed, 30 May 2018 12:11:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lersek@redhat.com>) id 1fO3gs-0004d6-UG
	for qemu-devel@nongnu.org; Wed, 30 May 2018 12:11:12 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:49900 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <lersek@redhat.com>)
	id 1fO3gn-0004ZE-GV; Wed, 30 May 2018 12:11:05 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4F35D40137F6;
	Wed, 30 May 2018 16:11:04 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-120-212.rdu2.redhat.com
	[10.10.120.212])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5D432208C167;
	Wed, 30 May 2018 16:11:02 +0000 (UTC)
To: Eric Auger <eric.auger@redhat.com>, eric.auger.pro@gmail.com,
	qemu-devel@nongnu.org, qemu-arm@nongnu.org, peter.maydell@linaro.org
References: <1527690380-9782-1-git-send-email-eric.auger@redhat.com>
	<1527690380-9782-2-git-send-email-eric.auger@redhat.com>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <f80946ef-0bf6-7e8b-e421-86dc3555fa80@redhat.com>
Date: Wed, 30 May 2018 18:11:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <1527690380-9782-2-git-send-email-eric.auger@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.6]);
	Wed, 30 May 2018 16:11:04 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.6]);
	Wed, 30 May 2018 16:11:04 +0000 (UTC) for IP:'10.11.54.4'
	DOMAIN:'int-mx04.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'lersek@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-devel] [PATCH 1/2] hw/arm/virt: Add a new 256MB ECAM
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
Cc: wei@redhat.com, drjones@redhat.com, ard.biesheuvel@linaro.org,
	zhaoshenglong@huawei.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: DGar9/mh/2Jf

On 05/30/18 16:26, Eric Auger wrote:
> This patch defines a new ECAM region located after the 256GB limit.
> 
> The virt machine state is augmented with a new highmem_ecam field
> which guards the usage of this new ECAM region instead of the legacy
> 16MB one. With the highmem ECAM region, up to 256 PCIe buses can be
> used.
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
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
> index 92ceee9..c0370b2 100644
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
> @@ -563,16 +567,17 @@ build_mcfg(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
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
> @@ -747,7 +752,7 @@ build_dsdt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>      acpi_dsdt_add_virtio(scope, &memmap[VIRT_MMIO],
>                      (irqmap[VIRT_MMIO] + ARM_SPI_BASE), NUM_VIRTIO_TRANSPORTS);
>      acpi_dsdt_add_pci(scope, memmap, (irqmap[VIRT_PCIE] + ARM_SPI_BASE),
> -                      vms->highmem);
> +                      vms->highmem, vms->highmem_ecam);
>      acpi_dsdt_add_gpio(scope, &memmap[VIRT_GPIO],
>                         (irqmap[VIRT_GPIO] + ARM_SPI_BASE));
>      acpi_dsdt_add_power_button(scope);
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index a3a28e2..d4247d0 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -149,6 +149,7 @@ static const MemMapEntry a15memmap[] = {
>      [VIRT_PCIE_PIO] =           { 0x3eff0000, 0x00010000 },
>      [VIRT_PCIE_ECAM] =          { 0x3f000000, 0x01000000 },
>      [VIRT_MEM] =                { 0x40000000, RAMLIMIT_BYTES },
> +    [VIRT_PCIE_ECAM_HIGH] =     { 0x4010000000ULL, 0x10000000 },
>      /* Second PCIe window, 512GB wide at the 512GB boundary */
>      [VIRT_PCIE_MMIO_HIGH] =   { 0x8000000000ULL, 0x8000000000ULL },
>  };
> @@ -1001,10 +1002,9 @@ static void create_pcie(VirtMachineState *vms, qemu_irq *pic)
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
> @@ -1012,12 +1012,16 @@ static void create_pcie(VirtMachineState *vms, qemu_irq *pic)
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
> index 4ac7ef6..e9423a7 100644
> --- a/include/hw/arm/virt.h
> +++ b/include/hw/arm/virt.h
> @@ -69,6 +69,7 @@ enum {
>      VIRT_PCIE_MMIO,
>      VIRT_PCIE_PIO,
>      VIRT_PCIE_ECAM,
> +    VIRT_PCIE_ECAM_HIGH,
>      VIRT_PLATFORM_BUS,
>      VIRT_PCIE_MMIO_HIGH,
>      VIRT_GPIO,
> @@ -103,6 +104,7 @@ typedef struct {
>      FWCfgState *fw_cfg;
>      bool secure;
>      bool highmem;
> +    bool highmem_ecam;
>      bool its;
>      bool virt;
>      int32_t gic_version;
> 

At this point, the order (and values) of the VIRT_* enum constants look
mostly random :) , but I'm unaware of anything why that should be a problem.

I compared this against the RFC version; from my side:

Reviewed-by: Laszlo Ersek <lersek@redhat.com>

Can you please do the following additionally:

- The aarch64 firmware packaged in Gerd's repo is built with the verbose
  log enabled, as far as I can see. Can you please capture two boot logs
  (from the serial console) until the guest kernel is reached, and send
  them to me (off-list if you prefer)? The first log should have the new
  feature disabled, the second one enabled; I'd like to compare them.

- (I think the same test is useful with the guest kernel dmesg as well,
  passing ignore_loglevel, but I don't think my assistance in reviewing
  that difference is necessary or helpful :) )

Thanks!
Laszlo
