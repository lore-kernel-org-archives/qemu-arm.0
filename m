Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp3557260wrx;
        Tue, 19 Feb 2019 07:57:03 -0800 (PST)
X-Google-Smtp-Source: AHgI3IbqdaNWIlf+0Q+0glvukzQ1pK48d/qK/zk1jQLRzYKg8T72v2TEnrDaEKVceHbV+13BbGZc
X-Received: by 2002:a5b:704:: with SMTP id g4mr6677906ybq.119.1550591823383;
        Tue, 19 Feb 2019 07:57:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1550591823; cv=none;
        d=google.com; s=arc-20160816;
        b=BCYYwEwmu6t7yypiONvgtN6qXTz/hlNKeWZvuUR6iQXUmepapFckTAy8forQtpcf+z
         mTEfeiPHEw5+ZbNjZF516r7ILcfqdy3E4sSCuay+Fo4qG9B7asuZ+MIRBRrWBpC2fss5
         NsrIdj/CV8rJGozuvd5JXnxAJLvEQxPzfHYGC7aLo8L7xW74CohRMd+hfCeFydIkcd34
         ElsbPbmRtTLtdRq3sNE90QafDqaQDwqh4hW0toJfamq8y7jH3SJ6tU3brKh1Ybqq79+v
         nnNS/Rl1SGijsOQJAzADGDDSFsGxqO+F2GBliFd+YNzSsfigwQYdpDac5BIgmMcmPk/x
         8x8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=u655L7C1ftNeH29gUNBMT0M9m2c/QchwBarsorLR4VA=;
        b=ZKD+UEjUD4nVg5zputXblJkRbAlBNFBe4zZCHsbP/hJPJwcCBFUqwz1D1490fWBVUi
         kkGB/YCG3rGJS7DIMwZ/UV+bDXNDu4l+19HqP2LKWGdieMxdvxT9b3VJAOPwqtBddOkl
         PddUlmTd3K1+sJCQVeatLoKpdQIny6NabISUzlTlJWZx1QEe1ccaOEZ9knZnnNCwv7Zo
         MDUO95qBOh+A4OFacu8s8Iz94FJOtSiysfHnnoBY2h2/x7qIrY15NgQprdt9Ksk+bg7h
         vOahjxmRlzXocDouJIGIsDZp6Z+DNrzDMXDRaTMVHo83o9U0aIYT59Rzb/6KwXryH5Y6
         s99Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x14si2621620ybf.261.2019.02.19.07.57.03
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 19 Feb 2019 07:57:03 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:50887 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gw7lW-0003C7-Mp
	for alex.bennee@linaro.org; Tue, 19 Feb 2019 10:57:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39844)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gw7lC-00034t-KZ
	for qemu-arm@nongnu.org; Tue, 19 Feb 2019 10:56:43 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gw7lA-0002CO-Gv
	for qemu-arm@nongnu.org; Tue, 19 Feb 2019 10:56:42 -0500
Received: from mx1.redhat.com ([209.132.183.28]:38480)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1gw7lA-000265-2E; Tue, 19 Feb 2019 10:56:40 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D45F18762E;
	Tue, 19 Feb 2019 15:56:36 +0000 (UTC)
Received: from [10.36.116.102] (ovpn-116-102.ams2.redhat.com [10.36.116.102])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 997FD2A33E;
	Tue, 19 Feb 2019 15:56:10 +0000 (UTC)
To: Igor Mammedov <imammedo@redhat.com>
References: <20190205173306.20483-1-eric.auger@redhat.com>
	<20190205173306.20483-10-eric.auger@redhat.com>
	<20190218110701.7349c698@Igors-MacBook-Pro.local>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <d5e51dee-8f28-f8a8-1da8-ef9f4c48576c@redhat.com>
Date: Tue, 19 Feb 2019 16:56:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190218110701.7349c698@Igors-MacBook-Pro.local>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Tue, 19 Feb 2019 15:56:37 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v6 09/18] hw/arm/virt: Implement
 kvm_type function for 4.0 machine
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
X-TUID: dsNlzOiVg6n6

Hi Igor,
On 2/18/19 11:07 AM, Igor Mammedov wrote:
> On Tue,  5 Feb 2019 18:32:57 +0100
> Eric Auger <eric.auger@redhat.com> wrote:
> 
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
> it's quite confusing, you have vms->extended_memmap and mc->kvm_type and
> the later for some reason enables device memory.
> 
> to me it seems that both are not related, device memory should work just fine
> without kvm nor dynamic IPA (within TCG supported limits).
> 
> I'd make extended_memmap virt machine class member the will enable pc-dimm support
> and then it add checks for supported IPA range on top
I agree I did not take into account the TCG use case and this series
does not enable device memory with TCG which is a pitty. I will
decorrelate things.

Thanks!

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
> 
