Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp7063425wrx;
        Fri, 22 Feb 2019 07:15:25 -0800 (PST)
X-Google-Smtp-Source: AHgI3IasLb09gAyqQ3fADncM6L9eQL/OESYA3DybYYAvB7J8+Gx1hWeXlr1urpQLIPa6TqKYjsQu
X-Received: by 2002:a81:3ca:: with SMTP id 193mr3580038ywd.86.1550848524939;
        Fri, 22 Feb 2019 07:15:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1550848524; cv=none;
        d=google.com; s=arc-20160816;
        b=pp44+ok4jg90CihS71/+4slmolKvqroH75ddFOZ729PxHzEpjtS8wywNPV1VAgmoPA
         +dew1TTcXAkb1FIF2RI8QnQ4HUATCBObHMJEOLaRORAtQqKW5z2qBax9F0EUOAPqCdUv
         oOPepYXLy91vnl2vLf2HmvWngagkay49IHvfXK2PU5lKBe0d1R8QosJthkZACy7mwOgS
         aVJ+KO+E/iuv/k/j/5wfvVVugHgQrtyRIqNMxDlm46qVSRP6jc+/VYO1o2gH7qmgDlFJ
         i5duDYZrIQZdZg6O3pBIxFFDQoTOQ9KAP9B7Xeaf6QQPna8keFVbDq3LJ6dDkJ32ZnCJ
         usWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:to:from:date;
        bh=zxiDWNM2wIqyfekn9uWfHZh1mV2c0Hkz6JuMu2WNAUs=;
        b=aGO+zuTout+BeXXJyhldFKuiCCi7hcfTAEdgj36lmiLxOdVoSS1ntWIKOMRAmg5qdH
         j2rCaUfsjNtCUxzEsXyHucS60CZsTod+rUo9mgl+3D/AunrSbrxOdRinoueg8GrCN8sT
         CVGJeujKL4wx1ebDfqpE4wqM/0EAYAeW0QEDWyoxGwtnbajr2hezpVJrv6thFTc+51Rr
         0Ej2RspO72Wq2U+35NM4GFVzBtc+6c4XVRmp1cVnfVROJY7dPK6fESab6G6eHM0W0vLJ
         FymdnApTHTXLOKUXtNUhl81qlZxcrx5dwGzks43Z/st/aioWvP1sE+x6qOE0oCMFdT0U
         IYyQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i137si943043ywa.393.2019.02.22.07.15.24
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 22 Feb 2019 07:15:24 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:52464 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gxCXs-0006Qz-AQ
	for alex.bennee@linaro.org; Fri, 22 Feb 2019 10:15:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46659)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1gxBjj-0006Y1-Nc
	for qemu-arm@nongnu.org; Fri, 22 Feb 2019 09:23:37 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1gxBji-0003Yj-5i
	for qemu-arm@nongnu.org; Fri, 22 Feb 2019 09:23:35 -0500
Received: from mx1.redhat.com ([209.132.183.28]:59590)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1gxBjh-0003Xf-S2; Fri, 22 Feb 2019 09:23:34 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 880C4307D985;
	Fri, 22 Feb 2019 14:23:31 +0000 (UTC)
Received: from localhost (unknown [10.43.2.182])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9932066080;
	Fri, 22 Feb 2019 14:23:22 +0000 (UTC)
Date: Fri, 22 Feb 2019 15:23:21 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Auger Eric <eric.auger@redhat.com>
Message-ID: <20190222152321.08196534@redhat.com>
In-Reply-To: <447b96fa-16ab-ab18-1772-5e8f85000e53@redhat.com>
References: <20190220224003.4420-1-eric.auger@redhat.com>
	<20190220224003.4420-8-eric.auger@redhat.com>
	<20190222135721.25ddcaf7@redhat.com>
	<447b96fa-16ab-ab18-1772-5e8f85000e53@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.48]);
	Fri, 22 Feb 2019 14:23:31 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH v7 07/17] hw/arm/virt: Dynamic memory map
 depending on RAM requirements
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
Cc: peter.maydell@linaro.org, drjones@redhat.com, david@redhat.com,
	qemu-devel@nongnu.org, shameerali.kolothum.thodi@huawei.com,
	dgilbert@redhat.com, qemu-arm@nongnu.org,
	david@gibson.dropbear.id.au, eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: z7qatjVbiPhA

On Fri, 22 Feb 2019 15:06:14 +0100
Auger Eric <eric.auger@redhat.com> wrote:

> Hi Igor,
> 
> On 2/22/19 1:57 PM, Igor Mammedov wrote:
> > On Wed, 20 Feb 2019 23:39:53 +0100
> > Eric Auger <eric.auger@redhat.com> wrote:
> >   
> >> Up to now the memory map has been static and the high IO region
> >> base has always been 256GiB.
> >>
> >> This patch modifies the virt_set_memmap() function, which freezes
> >> the memory map, so that the high IO range base becomes floating,
> >> located after the initial RAM and the device memory.
> >>
> >> The function computes
> >> - the base of the device memory,
> >> - the size of the device memory and
> >> - the highest GPA used in the memory map.
> >>
> >> The two former will be used when defining the device memory region
> >> while the latter will be used at VM creation to choose the requested
> >> IPA size.
> >>
> >> Setting all the existing highmem IO regions beyond the RAM
> >> allows to have a single contiguous RAM region (initial RAM and
> >> possible hotpluggable device memory). That way we do not need
> >> to do invasive changes in the EDK2 FW to support a dynamic
> >> RAM base.
> >>
> >> Still the user cannot request an initial RAM size greater than 255GB.
> >> Also we handle the case where maxmem or slots options are passed,
> >> although no device memory is usable at the moment. In this case, we
> >> just ignore those settings.
> >>
> >> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> >> ---
> >>  hw/arm/virt.c         | 47 ++++++++++++++++++++++++++++++++++---------
> >>  include/hw/arm/virt.h |  3 +++
> >>  2 files changed, 41 insertions(+), 9 deletions(-)
> >>
> >> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> >> index 12039a0367..9db602457b 100644
> >> --- a/hw/arm/virt.c
> >> +++ b/hw/arm/virt.c
> >> @@ -107,8 +107,9 @@
> >>   * of a terabyte of RAM will be doing it on a host with more than a
> >>   * terabyte of physical address space.)
> >>   */
> >> -#define RAMLIMIT_GB 255
> >> -#define RAMLIMIT_BYTES (RAMLIMIT_GB * 1024ULL * 1024 * 1024)
> >> +#define RAMBASE GiB
> >> +#define LEGACY_RAMLIMIT_GB 255
> >> +#define LEGACY_RAMLIMIT_BYTES (LEGACY_RAMLIMIT_GB * GiB)
> >>  
> >>  /* Addresses and sizes of our components.
> >>   * 0..128MB is space for a flash device so we can run bootrom code such as UEFI.
> >> @@ -149,7 +150,7 @@ static const MemMapEntry base_memmap[] = {
> >>      [VIRT_PCIE_MMIO] =          { 0x10000000, 0x2eff0000 },
> >>      [VIRT_PCIE_PIO] =           { 0x3eff0000, 0x00010000 },
> >>      [VIRT_PCIE_ECAM] =          { 0x3f000000, 0x01000000 },
> >> -    [VIRT_MEM] =                { 0x40000000, RAMLIMIT_BYTES },
> >> +    [VIRT_MEM] =                { RAMBASE, LEGACY_RAMLIMIT_BYTES },
> >>  };
> >>  
> >>  /*
> >> @@ -1367,16 +1368,48 @@ static uint64_t virt_cpu_mp_affinity(VirtMachineState *vms, int idx)
> >>  
> >>  static void virt_set_memmap(VirtMachineState *vms)
> >>  {
> >> +    MachineState *ms = MACHINE(vms);
> >>      hwaddr base;
> >>      int i;
> >>  
> >> +    if (ms->maxram_size > ms->ram_size || ms->ram_slots > 0) {
> >> +        error_report("mach-virt: does not support device memory: "
> >> +                     "ignore maxmem and slots options");
> >> +        ms->maxram_size = ms->ram_size;
> >> +        ms->ram_slots = 0;
> >> +    }
> >> +    if (ms->ram_size > (ram_addr_t)LEGACY_RAMLIMIT_BYTES) {
> >> +        error_report("mach-virt: cannot model more than %dGB RAM",
> >> +                     LEGACY_RAMLIMIT_GB);
> >> +        exit(1);
> >> +    }  
> > I'd drop these checks and amend below code so that it would init device_memory
> > logic when ram_slots > 0. It should simplify follow up patches by dropping
> > all machine version specific parts.  
> I don't have sufficient knowledge of virtio-mem/virtio-pmem. Do they
> also use slots?
if they don't then they will have to take care of it for every machine
anyway so I'd dismiss that from consideration.

> 
> 
> > It shouldn't break old machines as layout stays the same but would allow to
> > start old machine with pc-dimms which is fine from migration pov as target
> > also should be able to start QEMU with the same options for migration to start.
> > 
> >   
> >> +
> >>      vms->memmap = extended_memmap;
> >>  
> >>      for (i = 0; i < ARRAY_SIZE(base_memmap); i++) {
> >>          vms->memmap[i] = base_memmap[i];
> >>      }
> >>  
> >> -    vms->high_io_base = 256 * GiB; /* Top of the legacy initial RAM region */
> >> +    /*
> >> +     * We compute the base of the high IO region depending on the
> >> +     * amount of initial and device memory. The device memory start/size
> >> +     * is aligned on 1GiB. We never put the high IO region below 256GiB
> >> +     * so that if maxram_size is < 255GiB we keep the legacy memory map.
> >> +     * The device region size assumes 1GiB page max alignment per slot.
> >> +     */
> >> +    vms->device_memory_base = ROUND_UP(RAMBASE + ms->ram_size, GiB);
> >> +    vms->device_memory_size = ms->maxram_size - ms->ram_size +
> >> +                              ms->ram_slots * GiB;  
> So does everyone agree on this device memory size computation? I would
> like to make sure this is future proof. Do I need to add a machine
> option like on x86 to enforce slot alignment or is it OK?
computation looks fine to me,
Though, I'd try not duplicate data in vms->device_memory_base and vms->device_memory_size
as vms->device_memory is sufficient, see comment in 13/17

> 
> Thanks
> 
> Eric
> >> +
> >> +    vms->high_io_base = vms->device_memory_base +
> >> +                        ROUND_UP(vms->device_memory_size, GiB);
> >> +    if (vms->high_io_base < vms->device_memory_base) {
> >> +        error_report("maxmem/slots too huge");
> >> +        exit(EXIT_FAILURE);
> >> +    }
> >> +    if (vms->high_io_base < 256 * GiB) {
> >> +        vms->high_io_base = 256 * GiB;
> >> +    }
> >>      base = vms->high_io_base;
> >>  
> >>      for (i = VIRT_LOWMEMMAP_LAST; i < ARRAY_SIZE(extended_memmap); i++) {
> >> @@ -1387,6 +1420,7 @@ static void virt_set_memmap(VirtMachineState *vms)
> >>          vms->memmap[i].size = size;
> >>          base += size;
> >>      }
> >> +    vms->highest_gpa = base - 1;
> >>  }
> >>  
> >>  static void machvirt_init(MachineState *machine)
> >> @@ -1470,11 +1504,6 @@ static void machvirt_init(MachineState *machine)
> >>  
> >>      vms->smp_cpus = smp_cpus;
> >>  
> >> -    if (machine->ram_size > vms->memmap[VIRT_MEM].size) {
> >> -        error_report("mach-virt: cannot model more than %dGB RAM", RAMLIMIT_GB);
> >> -        exit(1);
> >> -    }
> >> -
> >>      if (vms->virt && kvm_enabled()) {
> >>          error_report("mach-virt: KVM does not support providing "
> >>                       "Virtualization extensions to the guest CPU");
> >> diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
> >> index 3dc7a6c5d5..acad0400d8 100644
> >> --- a/include/hw/arm/virt.h
> >> +++ b/include/hw/arm/virt.h
> >> @@ -132,6 +132,9 @@ typedef struct {
> >>      uint32_t iommu_phandle;
> >>      int psci_conduit;
> >>      hwaddr high_io_base;
> >> +    hwaddr highest_gpa;
> >> +    hwaddr device_memory_base;
> >> +    hwaddr device_memory_size;
> >>  } VirtMachineState;
> >>  
> >>  #define VIRT_ECAM_ID(high) (high ? VIRT_HIGH_PCIE_ECAM : VIRT_PCIE_ECAM)  
> >   

