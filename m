Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp2720781wrx;
        Mon, 18 Feb 2019 13:29:59 -0800 (PST)
X-Google-Smtp-Source: AHgI3IYUh3hQGFABEMwfDV7Mr8nwG9hKyNwKD4zCy8DhUi78k8icPZyTDq7+7jbzvySz/43okWi9
X-Received: by 2002:a0d:c702:: with SMTP id j2mr19496983ywd.324.1550525399588;
        Mon, 18 Feb 2019 13:29:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1550525399; cv=none;
        d=google.com; s=arc-20160816;
        b=t/mkWh6/PoC8x05kvaOeKwgjnY01z47jy31mthRQc8as8ubxz8aNy9jkk2VtQc3alW
         DzQQoewtMATi7I/HyeKxzGaWoXsCYUO798CdjO4eHCiwegqNdDHvU6aaDNQMcCNy85ka
         IlDkQLwtQ8r+HkiuENj+IGvmU6IrN2R+PJNxYdbaFPoDedYpj/egAGwTXkwp5IbtNoxi
         zdfdauHWC8/L3OjJogr2YRThsBgPuyaDlzAJhi3w/Y4IuNMZzOrSt7gTMZM84UWBQdji
         vYdGUQp5fPEv/3LWWiAyOZlC2cdueC8htMtTnzGBSQlV1b6RBzNb84JQ3mBuEzjedffb
         RskQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:references:to:from;
        bh=z2fjUUFFXMmr9crysbha2fJEPzTWvqKRWkvHqihQGn8=;
        b=w5861NOV//YQDse4E4ctbYpHgkw6wcDqh8b95TQdAObmXKyv/bs+gejo58xkCZdrLl
         zEBPvFexUUvgqnKi2UdUqm8XKx8dktSKvDivJS0wAvlk6Tx51M4NlE2HvE6gCUtbwlH+
         SY1OWIaUQeUmh3OJZWtDkfdFhRaMunxdSQsHD4Z/GV13uk3MXPMUybACanjWMh750mqS
         HoMDYCdsoznUa/hbSenf7KXKqhBF+xvNa2FZwfCDoOxs59X4ZoaDjC3at3ZgkYDPDIwo
         8zuaDSbaRAWOV1K8QAmdkpnht2Bm68cG53ZXUzxSeYvphxoJ3F1SxYDS5xf5WmtM7mRM
         O5DQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p185si8372858ywf.226.2019.02.18.13.29.59
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 18 Feb 2019 13:29:59 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:36893 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gvqUB-0004hw-3F
	for alex.bennee@linaro.org; Mon, 18 Feb 2019 16:29:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51335)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gvqU3-0004hY-GZ
	for qemu-arm@nongnu.org; Mon, 18 Feb 2019 16:29:52 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gvqU2-0000CM-5Z
	for qemu-arm@nongnu.org; Mon, 18 Feb 2019 16:29:51 -0500
Received: from mx1.redhat.com ([209.132.183.28]:34980)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1gvqU1-0000C0-S0; Mon, 18 Feb 2019 16:29:50 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D88D3AC617;
	Mon, 18 Feb 2019 21:29:48 +0000 (UTC)
Received: from [10.36.116.102] (ovpn-116-102.ams2.redhat.com [10.36.116.102])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3A3515D706;
	Mon, 18 Feb 2019 21:29:42 +0000 (UTC)
From: Auger Eric <eric.auger@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
References: <20190205173306.20483-1-eric.auger@redhat.com>
	<20190205173306.20483-10-eric.auger@redhat.com>
	<CAFEAcA-d1nMJkFpWmbVD7i=FF8C8irzNkLpOukkGx4=i=g_MTQ@mail.gmail.com>
Message-ID: <4b104c37-58f4-76c1-1141-8952523ae0d7@redhat.com>
Date: Mon, 18 Feb 2019 22:29:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-d1nMJkFpWmbVD7i=FF8C8irzNkLpOukkGx4=i=g_MTQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Mon, 18 Feb 2019 21:29:48 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH v6 09/18] hw/arm/virt: Implement kvm_type
 function for 4.0 machine
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
Cc: Andrew Jones <drjones@redhat.com>, David Hildenbrand <david@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	qemu-arm <qemu-arm@nongnu.org>, Igor Mammedov <imammedo@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Eric Auger <eric.auger.pro@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: DACnP2opQlI8

Hi Peter,

On 2/14/19 6:29 PM, Peter Maydell wrote:
> On Tue, 5 Feb 2019 at 17:33, Eric Auger <eric.auger@redhat.com> wrote:
>>
>> This patch implements the machine class kvm_type() callback.
>> It returns the max IPA shift needed to implement the whole GPA
>> range including the RAM and IO regions located beyond.
>> The returned value in passed though the KVM_CREATE_VM ioctl and
>> this allows KVM to set the stage2 tables dynamically.
>>
>> At this stage the RAM limit still is limited to 255GB.
>>
>> Setting all the existing highmem IO regions beyond the RAM
>> allows to have a single contiguous RAM region (initial RAM and
>> possible hotpluggable device memory). That way we do not need
>> to do invasive changes in the EDK2 FW to support a dynamic
>> RAM base.
>>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>>
>> ---
>>
>> v5 -> v6:
>> - add some comments
>> - high IO region cannot start before 256GiB
>> ---
>>  hw/arm/virt.c         | 52 +++++++++++++++++++++++++++++++++++++++++--
>>  include/hw/arm/virt.h |  2 ++
>>  2 files changed, 52 insertions(+), 2 deletions(-)
>>
>> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
>> index 2b15839d0b..b90ffc2e5d 100644
>> --- a/hw/arm/virt.c
>> +++ b/hw/arm/virt.c
>> @@ -1366,6 +1366,7 @@ static uint64_t virt_cpu_mp_affinity(VirtMachineState *vms, int idx)
>>
>>  static void virt_set_memmap(VirtMachineState *vms)
>>  {
>> +    MachineState *ms = MACHINE(vms);
>>      hwaddr base;
>>      int i;
>>
>> @@ -1375,7 +1376,17 @@ static void virt_set_memmap(VirtMachineState *vms)
>>          vms->memmap[i] = a15memmap[i];
>>      }
>>
>> -    vms->high_io_base = 256 * GiB; /* Top of the legacy initial RAM region */
>> +    /*
>> +     * We now compute the base of the high IO region depending on the
>> +     * amount of initial and device memory. The device memory start/size
>> +     * is aligned on 1GiB. We never put the high IO region below 256GiB
>> +     * so that if maxram_size is < 255GiB we keep the legacy memory map
>> +     */
>> +    vms->high_io_base = ROUND_UP(GiB + ms->ram_size, GiB) +
>> +                        ROUND_UP(ms->maxram_size - ms->ram_size, GiB);
> 
> I don't understand this expression...
My intent was to align the start of the device memory on a GiB boundary,
just after the initial RAM (ram_size). And then align the floating IO
region on a GiB boundary after the device memory (of size
ms->maxram_size - ms->ram_size). What do I miss?
> 
>> +    if (vms->high_io_base < 256 * GiB) {
>> +        vms->high_io_base = 256 * GiB;
>> +    }
>>      base = vms->high_io_base;
>>
>>      for (i = VIRT_LOWMEMMAP_LAST; i < ARRAY_SIZE(extended_memmap); i++) {
>> @@ -1386,6 +1397,7 @@ static void virt_set_memmap(VirtMachineState *vms)
>>          vms->memmap[i].size = size;
>>          base += size;
>>      }
>> +    vms->highest_gpa = base - 1;
>>  }
>>
>>  static void machvirt_init(MachineState *machine)
>> @@ -1402,7 +1414,9 @@ static void machvirt_init(MachineState *machine)
>>      bool firmware_loaded = bios_name || drive_get(IF_PFLASH, 0, 0);
>>      bool aarch64 = true;
>>
>> -    virt_set_memmap(vms);
>> +    if (!vms->extended_memmap) {
>> +        virt_set_memmap(vms);
>> +    }
>>
>>      /* We can probe only here because during property set
>>       * KVM is not available yet
>> @@ -1784,6 +1798,36 @@ static HotplugHandler *virt_machine_get_hotplug_handler(MachineState *machine,
>>      return NULL;
>>  }
>>
>> +/*
>> + * for arm64 kvm_type [7-0] encodes the IPA size shift
>> + */
>> +static int virt_kvm_type(MachineState *ms, const char *type_str)
>> +{
>> +    VirtMachineState *vms = VIRT_MACHINE(ms);
>> +    int max_vm_phys_shift = kvm_arm_get_max_vm_phys_shift(ms);
>> +    int max_pa_shift;
>> +
>> +    vms->extended_memmap = true;
>> +
>> +    virt_set_memmap(vms);
>> +
>> +    max_pa_shift = 64 - clz64(vms->highest_gpa);
>> +
>> +    if (max_pa_shift > max_vm_phys_shift) {
>> +        error_report("-m and ,maxmem option values "
>> +                     "require an IPA range (%d bits) larger than "
>> +                     "the one supported by the host (%d bits)",
>> +                     max_pa_shift, max_vm_phys_shift);
>> +       exit(1);
>> +    }
> 
> Presumably we should have some equivalent check for TCG, so
> that we don't let the user create a setup which wants more
> bits of physical address than the TCG CPU allows ?
kvm_type() sets the new memory map. For TCG we should stick to the 1TB
GPA address space which should be consistent with the existing
ID_AA64MMFR0_EL1 settings (arm/internals.h implements arm_pamax(ARMCPU
*cpu) which decodes hardcoded cpu->id_aa64mmfr0).
> 
>> +    /*
>> +     * By default we return 0 which corresponds to an implicit legacy
>> +     * 40b IPA setting. Otherwise we return the actual requested IPA
>> +     * logsize
>> +     */
>> +    return max_pa_shift > 40 ? max_pa_shift : 0;
>> +}
>> +
>>  static void virt_machine_class_init(ObjectClass *oc, void *data)
>>  {
>>      MachineClass *mc = MACHINE_CLASS(oc);
>> @@ -1808,6 +1852,7 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
>>      mc->cpu_index_to_instance_props = virt_cpu_index_to_props;
>>      mc->default_cpu_type = ARM_CPU_TYPE_NAME("cortex-a15");
>>      mc->get_default_cpu_node_id = virt_get_default_cpu_node_id;
>> +    mc->kvm_type = virt_kvm_type;
>>      assert(!mc->get_hotplug_handler);
>>      mc->get_hotplug_handler = virt_machine_get_hotplug_handler;
>>      hc->plug = virt_machine_device_plug_cb;
>> @@ -1911,6 +1956,9 @@ static void virt_machine_3_1_options(MachineClass *mc)
>>  {
>>      virt_machine_4_0_options(mc);
>>      compat_props_add(mc->compat_props, hw_compat_3_1, hw_compat_3_1_len);
>> +
>> +    /* extended memory map is enabled from 4.0 onwards */
>> +    mc->kvm_type = NULL;
> 
> When is there a difference between setting this to NULL,
> and setting it to virt_kvm_type but having the memory
> size be <= 256GiB ?
There shouldn't be any difference. When size <= 255GiB we stick to the
1TB PA address space.
> 
> If there isn't any difference, why can't we just let the
> pre-4.0 versions behave like the new ones? No existing
> VM setup will have > 256GB of memory, so as long as there's
> no behaviour change for the <=256GB case we don't need to
> take special effort to ensure that the >256GB case continues
> to give an error message, do we ?
But don't we want to forbid any pre-4.0 machvirt to run with more than
255GiB RAM?

Thanks

Eric
> 
>>  }
>>  DEFINE_VIRT_MACHINE(3, 1)
>>
>> diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
>> index 3dc7a6c5d5..c88f67a492 100644
>> --- a/include/hw/arm/virt.h
>> +++ b/include/hw/arm/virt.h
>> @@ -132,6 +132,8 @@ typedef struct {
>>      uint32_t iommu_phandle;
>>      int psci_conduit;
>>      hwaddr high_io_base;
>> +    hwaddr highest_gpa;
>> +    bool extended_memmap;
>>  } VirtMachineState;
>>
>>  #define VIRT_ECAM_ID(high) (high ? VIRT_HIGH_PCIE_ECAM : VIRT_PCIE_ECAM)
>> --
>> 2.20.1
> 
> thanks
> -- PMM
> 
