Received: by 2002:adf:b64b:0:0:0:0:0 with SMTP id i11-v6csp5675363wre;
        Thu, 31 May 2018 01:50:35 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKIqJ2opGz7AmZAd/BazqbKVUunZhkgVm/jDBUOL38ck7cEMGkLZ5HY/oieFtqXrBQhZfSw2
X-Received: by 2002:ac8:73cc:: with SMTP id v12-v6mr5930849qtp.208.1527756635789;
        Thu, 31 May 2018 01:50:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1527756635; cv=none;
        d=google.com; s=arc-20160816;
        b=Alg174ddyn/cqRdmxzTOEUMns5JL7JAoXVYkkQd0zb61GbOMs/t0wl9WdK28Opmg3F
         o7AgvEVQIrTLF+74QijCMUwZmmwlP+wkvzXf8h4y4BfFEsVQn7r97RZmetYAaxQJ/6Xp
         N8F9OkKGNU5sz3K7f99SH7gxgc48hSN6kSKgriM6JK3L7wysbqnMuD9bZMwRXIws9TrY
         R4/5yEyB7vP/5b6Sr7pFcX0sQjiCgGAhOM1D5QvvONCjP2AmV5ATHbvLMvcZCYDrWV4S
         22yMUwF734rqCc632pZ+DtvKob53tlPt79eJKrYCc2w5Depfy/RyU3PQYM27B3XIMOMv
         1ohg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:arc-authentication-results;
        bh=/0Qc7NTq0G85MUSLaeIgAvV5I19koJp/1Q2w2cC5Ruc=;
        b=ZS8Ysm3FkSUMzyKxBGDJRZ9CIxb//HF7jN770YwYc8QzfSRjVL91FadhE8wZ5WbRHL
         J7exeXwNF93141mhicu2PQayyDS0MOX1O/Uagtq7mne7GwAsOnnZqcw2oEgBmJ/rVALB
         m8W82Ibqlcg093lhWxlPHXcqRVLnmpoiN2OglMe93gWGgl1NTE9owtbBxGBDaVSpGMTM
         XNDQAsQhLkbzS4F9RVWVzB6/ZB5sAGTkzgwa2jW0Ej0cCbfLxeEBRQJmoDJ26TNLcXcH
         eJZQRFnOcs/d50U1drZPEOZO0U5eV90JiwgkgOMrARjFqWwgDWpAVosXfufGeJjOgwtH
         DNrA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e3-v6si2817764qkm.59.2018.05.31.01.50.35
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 31 May 2018 01:50:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:42672 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fOJI3-0005cS-A4
	for alex.bennee@linaro.org; Thu, 31 May 2018 04:50:35 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45278)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fOJHw-0005cH-21
	for qemu-arm@nongnu.org; Thu, 31 May 2018 04:50:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fOJHs-0002qs-OW
	for qemu-arm@nongnu.org; Thu, 31 May 2018 04:50:28 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:54692 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1fOJHs-0002qS-7m; Thu, 31 May 2018 04:50:24 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2DA62124B84;
	Thu, 31 May 2018 08:50:23 +0000 (UTC)
Received: from localhost.localdomain (ovpn-116-69.ams2.redhat.com
	[10.36.116.69])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6C4CB111AF0E;
	Thu, 31 May 2018 08:50:19 +0000 (UTC)
To: Laszlo Ersek <lersek@redhat.com>, eric.auger.pro@gmail.com,
	qemu-devel@nongnu.org, qemu-arm@nongnu.org, peter.maydell@linaro.org
References: <1527690380-9782-1-git-send-email-eric.auger@redhat.com>
	<1527690380-9782-2-git-send-email-eric.auger@redhat.com>
	<f80946ef-0bf6-7e8b-e421-86dc3555fa80@redhat.com>
	<348a8bfc-66ea-025f-46e7-03d75c2e71d7@redhat.com>
	<69081af5-372d-c8b2-0f01-f6d7ecc26700@redhat.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <f9c1e0e0-1574-7299-b7aa-0cb702df90f5@redhat.com>
Date: Thu, 31 May 2018 10:50:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <69081af5-372d-c8b2-0f01-f6d7ecc26700@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.1]);
	Thu, 31 May 2018 08:50:23 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.1]);
	Thu, 31 May 2018 08:50:23 +0000 (UTC) for IP:'10.11.54.3'
	DOMAIN:'int-mx03.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 1/2] hw/arm/virt: Add a new
 256MB ECAM region
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
Cc: drjones@redhat.com, ard.biesheuvel@linaro.org, zhaoshenglong@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 5Z+8guLa96Zq

Hi Laszlo,

On 05/31/2018 10:41 AM, Laszlo Ersek wrote:
> On 05/31/18 08:55, Auger Eric wrote:
>> Hi Laszlo,
>>
>> On 05/30/2018 06:11 PM, Laszlo Ersek wrote:
>>> On 05/30/18 16:26, Eric Auger wrote:
>>>> This patch defines a new ECAM region located after the 256GB limit.
>>>>
>>>> The virt machine state is augmented with a new highmem_ecam field
>>>> which guards the usage of this new ECAM region instead of the legacy
>>>> 16MB one. With the highmem ECAM region, up to 256 PCIe buses can be
>>>> used.
>>>>
>>>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>>>>
>>>> ---
>>>>
>>>> RFC -> PATCH:
>>>> - remove the newline at the end of acpi_dsdt_add_pci
>>>> - use vms->highmem_ecam to select the memmap id
>>>> ---
>>>>  hw/arm/virt-acpi-build.c | 21 +++++++++++++--------
>>>>  hw/arm/virt.c            | 12 ++++++++----
>>>>  include/hw/arm/virt.h    |  2 ++
>>>>  3 files changed, 23 insertions(+), 12 deletions(-)
>>>>
>>>> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
>>>> index 92ceee9..c0370b2 100644
>>>> --- a/hw/arm/virt-acpi-build.c
>>>> +++ b/hw/arm/virt-acpi-build.c
>>>> @@ -150,16 +150,17 @@ static void acpi_dsdt_add_virtio(Aml *scope,
>>>>  }
>>>>
>>>>  static void acpi_dsdt_add_pci(Aml *scope, const MemMapEntry *memmap,
>>>> -                              uint32_t irq, bool use_highmem)
>>>> +                              uint32_t irq, bool use_highmem, bool highmem_ecam)
>>>>  {
>>>> +    int ecam_id = highmem_ecam ? VIRT_PCIE_ECAM_HIGH : VIRT_PCIE_ECAM;
>>>>      Aml *method, *crs, *ifctx, *UUID, *ifctx1, *elsectx, *buf;
>>>>      int i, bus_no;
>>>>      hwaddr base_mmio = memmap[VIRT_PCIE_MMIO].base;
>>>>      hwaddr size_mmio = memmap[VIRT_PCIE_MMIO].size;
>>>>      hwaddr base_pio = memmap[VIRT_PCIE_PIO].base;
>>>>      hwaddr size_pio = memmap[VIRT_PCIE_PIO].size;
>>>> -    hwaddr base_ecam = memmap[VIRT_PCIE_ECAM].base;
>>>> -    hwaddr size_ecam = memmap[VIRT_PCIE_ECAM].size;
>>>> +    hwaddr base_ecam = memmap[ecam_id].base;
>>>> +    hwaddr size_ecam = memmap[ecam_id].size;
>>>>      int nr_pcie_buses = size_ecam / PCIE_MMCFG_SIZE_MIN;
>>>>
>>>>      Aml *dev = aml_device("%s", "PCI0");
>>>> @@ -173,7 +174,7 @@ static void acpi_dsdt_add_pci(Aml *scope, const MemMapEntry *memmap,
>>>>      aml_append(dev, aml_name_decl("_CCA", aml_int(1)));
>>>>
>>>>      /* Declare the PCI Routing Table. */
>>>> -    Aml *rt_pkg = aml_package(nr_pcie_buses * PCI_NUM_PINS);
>>>> +    Aml *rt_pkg = aml_varpackage(nr_pcie_buses * PCI_NUM_PINS);
>>>>      for (bus_no = 0; bus_no < nr_pcie_buses; bus_no++) {
>>>>          for (i = 0; i < PCI_NUM_PINS; i++) {
>>>>              int gsi = (i + bus_no) % PCI_NUM_PINS;
>>>> @@ -316,7 +317,10 @@ static void acpi_dsdt_add_pci(Aml *scope, const MemMapEntry *memmap,
>>>>      Aml *dev_res0 = aml_device("%s", "RES0");
>>>>      aml_append(dev_res0, aml_name_decl("_HID", aml_string("PNP0C02")));
>>>>      crs = aml_resource_template();
>>>> -    aml_append(crs, aml_memory32_fixed(base_ecam, size_ecam, AML_READ_WRITE));
>>>> +    aml_append(crs,
>>>> +        aml_qword_memory(AML_POS_DECODE, AML_MIN_FIXED, AML_MAX_FIXED,
>>>> +                         AML_NON_CACHEABLE, AML_READ_WRITE, 0x0000, base_ecam,
>>>> +                         base_ecam + size_ecam - 1, 0x0000, size_ecam));
>>>>      aml_append(dev_res0, aml_name_decl("_CRS", crs));
>>>>      aml_append(dev, dev_res0);
>>>>      aml_append(scope, dev);
>>>> @@ -563,16 +567,17 @@ build_mcfg(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>>>>  {
>>>>      AcpiTableMcfg *mcfg;
>>>>      const MemMapEntry *memmap = vms->memmap;
>>>> +    int ecam_id = vms->highmem_ecam ? VIRT_PCIE_ECAM_HIGH : VIRT_PCIE_ECAM;
>>>>      int len = sizeof(*mcfg) + sizeof(mcfg->allocation[0]);
>>>>      int mcfg_start = table_data->len;
>>>>
>>>>      mcfg = acpi_data_push(table_data, len);
>>>> -    mcfg->allocation[0].address = cpu_to_le64(memmap[VIRT_PCIE_ECAM].base);
>>>> +    mcfg->allocation[0].address = cpu_to_le64(memmap[ecam_id].base);
>>>>
>>>>      /* Only a single allocation so no need to play with segments */
>>>>      mcfg->allocation[0].pci_segment = cpu_to_le16(0);
>>>>      mcfg->allocation[0].start_bus_number = 0;
>>>> -    mcfg->allocation[0].end_bus_number = (memmap[VIRT_PCIE_ECAM].size
>>>> +    mcfg->allocation[0].end_bus_number = (memmap[ecam_id].size
>>>>                                            / PCIE_MMCFG_SIZE_MIN) - 1;
>>>>
>>>>      build_header(linker, table_data, (void *)(table_data->data + mcfg_start),
>>>> @@ -747,7 +752,7 @@ build_dsdt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>>>>      acpi_dsdt_add_virtio(scope, &memmap[VIRT_MMIO],
>>>>                      (irqmap[VIRT_MMIO] + ARM_SPI_BASE), NUM_VIRTIO_TRANSPORTS);
>>>>      acpi_dsdt_add_pci(scope, memmap, (irqmap[VIRT_PCIE] + ARM_SPI_BASE),
>>>> -                      vms->highmem);
>>>> +                      vms->highmem, vms->highmem_ecam);
>>>>      acpi_dsdt_add_gpio(scope, &memmap[VIRT_GPIO],
>>>>                         (irqmap[VIRT_GPIO] + ARM_SPI_BASE));
>>>>      acpi_dsdt_add_power_button(scope);
>>>> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
>>>> index a3a28e2..d4247d0 100644
>>>> --- a/hw/arm/virt.c
>>>> +++ b/hw/arm/virt.c
>>>> @@ -149,6 +149,7 @@ static const MemMapEntry a15memmap[] = {
>>>>      [VIRT_PCIE_PIO] =           { 0x3eff0000, 0x00010000 },
>>>>      [VIRT_PCIE_ECAM] =          { 0x3f000000, 0x01000000 },
>>>>      [VIRT_MEM] =                { 0x40000000, RAMLIMIT_BYTES },
>>>> +    [VIRT_PCIE_ECAM_HIGH] =     { 0x4010000000ULL, 0x10000000 },
>>>>      /* Second PCIe window, 512GB wide at the 512GB boundary */
>>>>      [VIRT_PCIE_MMIO_HIGH] =   { 0x8000000000ULL, 0x8000000000ULL },
>>>>  };
>>>> @@ -1001,10 +1002,9 @@ static void create_pcie(VirtMachineState *vms, qemu_irq *pic)
>>>>      hwaddr size_mmio_high = vms->memmap[VIRT_PCIE_MMIO_HIGH].size;
>>>>      hwaddr base_pio = vms->memmap[VIRT_PCIE_PIO].base;
>>>>      hwaddr size_pio = vms->memmap[VIRT_PCIE_PIO].size;
>>>> -    hwaddr base_ecam = vms->memmap[VIRT_PCIE_ECAM].base;
>>>> -    hwaddr size_ecam = vms->memmap[VIRT_PCIE_ECAM].size;
>>>> +    hwaddr base_ecam, size_ecam;
>>>>      hwaddr base = base_mmio;
>>>> -    int nr_pcie_buses = size_ecam / PCIE_MMCFG_SIZE_MIN;
>>>> +    int nr_pcie_buses;
>>>>      int irq = vms->irqmap[VIRT_PCIE];
>>>>      MemoryRegion *mmio_alias;
>>>>      MemoryRegion *mmio_reg;
>>>> @@ -1012,12 +1012,16 @@ static void create_pcie(VirtMachineState *vms, qemu_irq *pic)
>>>>      MemoryRegion *ecam_reg;
>>>>      DeviceState *dev;
>>>>      char *nodename;
>>>> -    int i;
>>>> +    int i, ecam_memmap_id;
>>>>      PCIHostState *pci;
>>>>
>>>>      dev = qdev_create(NULL, TYPE_GPEX_HOST);
>>>>      qdev_init_nofail(dev);
>>>>
>>>> +    ecam_memmap_id = vms->highmem_ecam ? VIRT_PCIE_ECAM_HIGH : VIRT_PCIE_ECAM;
>>>> +    base_ecam = vms->memmap[ecam_memmap_id].base;
>>>> +    size_ecam = vms->memmap[ecam_memmap_id].size;
>>>> +    nr_pcie_buses = size_ecam / PCIE_MMCFG_SIZE_MIN;
>>>>      /* Map only the first size_ecam bytes of ECAM space */
>>>>      ecam_alias = g_new0(MemoryRegion, 1);
>>>>      ecam_reg = sysbus_mmio_get_region(SYS_BUS_DEVICE(dev), 0);
>>>> diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
>>>> index 4ac7ef6..e9423a7 100644
>>>> --- a/include/hw/arm/virt.h
>>>> +++ b/include/hw/arm/virt.h
>>>> @@ -69,6 +69,7 @@ enum {
>>>>      VIRT_PCIE_MMIO,
>>>>      VIRT_PCIE_PIO,
>>>>      VIRT_PCIE_ECAM,
>>>> +    VIRT_PCIE_ECAM_HIGH,
>>>>      VIRT_PLATFORM_BUS,
>>>>      VIRT_PCIE_MMIO_HIGH,
>>>>      VIRT_GPIO,
>>>> @@ -103,6 +104,7 @@ typedef struct {
>>>>      FWCfgState *fw_cfg;
>>>>      bool secure;
>>>>      bool highmem;
>>>> +    bool highmem_ecam;
>>>>      bool its;
>>>>      bool virt;
>>>>      int32_t gic_version;
>>>>
>>>
>>> At this point, the order (and values) of the VIRT_* enum constants
>>> look mostly random :) , but I'm unaware of anything why that should
>>> be a problem.
>>>
>>> I compared this against the RFC version; from my side:
>>>
>>> Reviewed-by: Laszlo Ersek <lersek@redhat.com>
>>>
>>> Can you please do the following additionally:
>>>
>>> - The aarch64 firmware packaged in Gerd's repo is built with the
>>>   verbose log enabled, as far as I can see. Can you please capture
>>>   two boot logs (from the serial console) until the guest kernel is
>>>   reached, and send them to me (off-list if you prefer)? The first
>>>   log should have the new feature disabled, the second one enabled;
>>>   I'd like to compare them.
>>>
>>> - (I think the same test is useful with the guest kernel dmesg as
>>>   well, passing ignore_loglevel, but I don't think my assistance in
>>>   reviewing that difference is necessary or helpful :) )
>>
>> OK I will prepare those logs
> 
> Thanks. The important stuff is fine:
> 
>> -ProcessPciHost: Config[0x3F000000+0x1000000) Bus[0x0..0xF] Io[0x0+0x10000)@0x3EFF0000 Mem32[0x10000000+0x2EFF0000)@0x0 Mem64[0x8000000000+0x8000000000)@0x0
>> +ProcessPciHost: Config[0x4010000000+0x10000000) Bus[0x0..0xFF] Io[0x0+0x10000)@0x3EFF0000 Mem32[0x10000000+0x2EFF0000)@0x0 Mem64[0x8000000000+0x8000000000)@0x0
>>  RootBridge: PciRoot(0x0)
>>    Support/Attr: 70001 / 70001
>>      DmaAbove4G: Yes
>>  NoExtConfSpace: No
>>       AllocAttr: 3 (CombineMemPMem Mem64Decode)
>> -           Bus: 0 - F Translation=0
>> +           Bus: 0 - FF Translation=0
>>              Io: 0 - FFFF Translation=0
>>             Mem: 10000000 - 3EFEFFFF Translation=0
>>      MemAbove4G: 8000000000 - FFFFFFFFFF Translation=0
>>            PMem: FFFFFFFFFFFFFFFF - 0 Translation=0
>>     PMemAbove4G: FFFFFFFFFFFFFFFF - 0 Translation=0
>>  PciHostBridgeDxe: IntersectIoDescriptor: add [0, 10000): Success
>>  PciHostBridgeDxe: IntersectMemoryDescriptor: add [10000000, 3EFF0000): Success
>>  PciHostBridgeDxe: IntersectMemoryDescriptor: add [8000000000, 10000000000): Success
> 
> However, another change surprises me. It might be totally independent of
> your patch, but because your patch also touches ACPI generation, I'd
> like to highlight it: the size of the DSDT grows from 0x11BD bytes to
> 0x4848 bytes. This is confirmed by both the firmware log and the guest
> dmesg; quoting the latter:
> 
>> -[    0.000000] ACPI: DSDT 0x000000013BED0000 0011BD (v02 BOCHS  BXPCDSDT 00000001 BXPC 00000001)
>> +[    0.000000] ACPI: DSDT 0x000000013BED0000 004848 (v02 BOCHS  BXPCDSDT 00000001 BXPC 00000001)
> 
> Given that your series just introduces the virt-3.0 machine type, I
> don't think it enables some other ACPI feature -- intentionally anyway!
> -- that explains this size growth. Can you dump the ACPI tables in the
> guest and decompile them with iasl?
> 
> ... Ah wait, I'm being silly. "nr_pcie_buses" in acpi_dsdt_add_pci()
> affects the size of the PRT; you even changed the PRT from an AML
> "package" to an AML "varpackage", because the loop that adds the
> interrupt mapping packages to the PRT runs much higher now.
> 
> I vaguely recall that Linux used to dump the PRT at boot; from those
> messages I would have realized earlier. Anyway, everything looks fine to
> me.

Cool!

Thanks

Eric
> 
> Thanks!
> Laszlo
> 
