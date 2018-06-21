Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp1792907wrq;
        Thu, 21 Jun 2018 03:05:50 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKIMA0nxukXr891aHd7cSD6nPi21ajKKrmaMbBTezBXY+36R63Lvp7tQ9XIcgb0cMGglXm/r
X-Received: by 2002:a37:248a:: with SMTP id k10-v6mr5082450qkk.101.1529575550442;
        Thu, 21 Jun 2018 03:05:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1529575550; cv=none;
        d=google.com; s=arc-20160816;
        b=ZtSciHa51LuYsf0a60E/Moaw8xJCqPo8K5VtwgQDHVWDJEjHo9cQ4dffI1WoZsaDjP
         Qn3qF0GF9wMRxn0C5po3J7zWZDgPqW3a5eIZCZTM1p5+sCzwrYsv9tF7xwDHvKN0wR++
         PpKu75OFpYBGkU7R034aAA8k8DpCU1mbUExzK91uHbWHpdSe7MktdT2QnwO7c34v31Ye
         9nbNanUN/C6P8lI24Wk7OZob/47ujdG7SB8RrGAgjtw+Cq/gq/5sSjGepHF+WfHW9Bdp
         NU92cavz979n2BWJ5JOcK8UPypqv2ylKvsBmijSR1rCKUbHqyqnQOt8Od6r68RpwgNyF
         xRDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:arc-authentication-results;
        bh=6eQHKiHDpd0Vr2PEHKNlHza08e1nyp345PH0eDnKTUU=;
        b=UnqFN5NUkgMN6nG2MJgrWyaozj2jGolBTBiqCR4DsCXn1DxXh0V54jRCEfC2E2CIbR
         Y1DuTj59F+AkSzwUVEzVtsTfQcp4uzqvZ2xeOCt2jMXS69Cs2XaMRAfzkXLwDpBxrrr2
         0UwhloL/QxfKLev4PeHLkeSyjOf825qmzRTPV2RVv5TDtpi8Q5c/xCTGN5z3q9B+TSNA
         V3PEayWh/0ojtNE8VGwUaFxX0oEyiqInS1d3TAi8wWk41sX5xwYxhBePkNmQVpVSzvLr
         1x5MWachaFS+bNaF5soiaVM/+7zQOl48FfMDmcgaK+9GyDGM9q2YxFs4yxUcZvBJFLxr
         F4QQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q52-v6si4510444qtf.245.2018.06.21.03.05.50
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 21 Jun 2018 03:05:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:54234 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fVwTO-0006Qd-0g
	for alex.bennee@linaro.org; Thu, 21 Jun 2018 06:05:50 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49046)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fVwTG-0006QI-Mt
	for qemu-arm@nongnu.org; Thu, 21 Jun 2018 06:05:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fVwTA-0001ez-Ef
	for qemu-arm@nongnu.org; Thu, 21 Jun 2018 06:05:42 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:53546 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1fVwTA-0001er-8o; Thu, 21 Jun 2018 06:05:36 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C115B87AAC;
	Thu, 21 Jun 2018 10:05:35 +0000 (UTC)
Received: from localhost.localdomain (ovpn-117-106.ams2.redhat.com
	[10.36.117.106])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EF00E2156880;
	Thu, 21 Jun 2018 10:05:33 +0000 (UTC)
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
References: <1529500053-21704-1-git-send-email-eric.auger@redhat.com>
	<1529500053-21704-6-git-send-email-eric.auger@redhat.com>
	<20180620171504.GR2549@work-vm>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <f0fbc258-c27f-a1c2-722b-34f75644fb36@redhat.com>
Date: Thu, 21 Jun 2018 12:05:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <20180620171504.GR2549@work-vm>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.1]);
	Thu, 21 Jun 2018 10:05:35 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.1]);
	Thu, 21 Jun 2018 10:05:35 +0000 (UTC) for IP:'10.11.54.6'
	DOMAIN:'int-mx06.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-arm] [Qemu-devel] [RFC 5/6] hw/arm/virt: support kvm_type
 property
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
Cc: peter.maydell@linaro.org, drjones@redhat.com, suzuki.poulose@arm.com,
	qemu-devel@nongnu.org, agraf@suse.de, qemu-arm@nongnu.org,
	david@gibson.dropbear.id.au, eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 9biIk/2YHFAi

Hi David,

On 06/20/2018 07:15 PM, Dr. David Alan Gilbert wrote:
> * Eric Auger (eric.auger@redhat.com) wrote:
>> The kvm-type property currently is used to pass
>> a user parameter to KVM_CREATE_VM. This matches
>> the way KVM/ARM expects to pass the max_vm_phys_shift
>> parameter.
>>
>> This patch adds the support or the kvm-type property in
>> machvirt and also implements the machine class kvm_type()
>> callback so that it either returns the kvm-type value
>> provided by the user or returns the max_vm_phys_shift
>> exposed by KVM.
>>
>> for instance, the usespace can use the following option to
>> instantiate a 42b IPA guest: -machine kvm-type=42
> 
> Without saying if this is better or worse, it is different from x86,
> where we have the number of physical address bits as a -cpu parameter
> rather than a machine parameter, e.g.
> 
>    qemu-system-x86_64 -M pc,accel=kvm -cpu SandyBridge,phys-bits=36
> or
>    qemu-system-x86_64 -M pc,accel=kvm -cpu SandyBridge,host-phys-bits=true
> 
> our machine types can override the default value though.

My understanding is this phys-bits is used to refine the model of the
CPU. For a given CPU, it is implementation defined how much physical and
virtual bits are supported. So it can vary. The guest then can query the
properties of the CPU using CPUID and when setting eax=0x80000008, it
then retrieves the max physical and virtual address space supported by
this CPU.

On ARM there is such capability register, named
ID_AA64MMFR0_EL1 where PARange field indicates the implemented physical
address size. No equivalent for the virtual range.

arm/internals.h implements arm_pamax(ARMCPU *cpu)
It decodes cpu->id_aa64mmfr0. This later is hardcoded for A57, A53, ...
So as far as I understand, we don't have a way to refine this reg
through cmd line, as we have on x86. But if we were to support this
feature, then phys_bits would be cpu->id_aa64mmfr0.parange.

However what we are trying to achieve in this series is different. We
don't want to refine the vCPU itself. We want to query and force KVM to
support a given intermediate physical address (IPA) range. This means
configure KVM to support a given stage 2 MMU configuration. As a
correlate this means supporting the corresponding GPA range. KVM's
capability to support a given IPA range depends on
- physical CPU ID_AA64MMFR0_EL1.PARange
- host kernel config
- host kernel page table limitations

So the kernel API proposed in [1] allows to query the max IPA KVM
support (through a /dev/kvm iotcl) and this series then does a
KVM_CREATE_VM with a type argument that matches the returned value. So
to me this rather looks as a VM attribute, which from a qemu perspective
would turn out to be a machine option. Then whether we should directly
use the kvm_type option is arguable. on spapr kvm_type typically encodes
the HV or PR. I understand this selects different kvm modules. Here we
want to use a kvm supporting up to 48b IPA for instance.

> 
> One other complication (that I don't know if it applies to ARM) is that
> TCG only supports phys-bits=40, so we refuse a TCG run with an
> explicitly set phys-bits!=40.

The new capability to support selectable GPA range only applies to
accelerated mode. I did not check if kvm-type option can be used in TCG
mode ;-)

Thanks

Eric
> 
> Dave
> 
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>> ---
>>  hw/arm/virt.c         | 44 ++++++++++++++++++++++++++++++++++++++++++++
>>  include/hw/arm/virt.h |  1 +
>>  2 files changed, 45 insertions(+)
>>
>> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
>> index dd92ab9..1700556 100644
>> --- a/hw/arm/virt.c
>> +++ b/hw/arm/virt.c
>> @@ -1585,6 +1585,21 @@ static void virt_set_iommu(Object *obj, const char *value, Error **errp)
>>      }
>>  }
>>  
>> +static char *virt_get_kvm_type(Object *obj, Error **errp)
>> +{
>> +    VirtMachineState *vms = VIRT_MACHINE(obj);
>> +
>> +    return g_strdup(vms->kvm_type);
>> +}
>> +
>> +static void virt_set_kvm_type(Object *obj, const char *value, Error **errp)
>> +{
>> +    VirtMachineState *vms = VIRT_MACHINE(obj);
>> +
>> +    g_free(vms->kvm_type);
>> +    vms->kvm_type = g_strdup(value);
>> +}
>> +
>>  static CpuInstanceProperties
>>  virt_cpu_index_to_props(MachineState *ms, unsigned cpu_index)
>>  {
>> @@ -1646,6 +1661,31 @@ static HotplugHandler *virt_machine_get_hotplug_handler(MachineState *machine,
>>      return NULL;
>>  }
>>  
>> +static int virt_kvm_type(MachineState *ms, const char *type_str)
>> +{
>> +    int max_vm_phys_shift, ret = 0;
>> +    uint64_t type;
>> +
>> +    if (!type_str) {
>> +        max_vm_phys_shift = kvm_get_max_vm_phys_shift(ms);
>> +        if (max_vm_phys_shift < 0) {
>> +            goto out;
>> +        }
>> +    } else {
>> +        type = g_ascii_strtoll(type_str, NULL, 0);
>> +        type &= 0xFF;
>> +        max_vm_phys_shift = (int)type;
>> +        if (max_vm_phys_shift < 40 || max_vm_phys_shift > 52) {
>> +            warn_report("valid kvm-type type values are within [40, 52]:"
>> +                        " option is ignored and VM is created with 40b IPA");
>> +            goto out;
>> +        }
>> +    }
>> +    ret = max_vm_phys_shift;
>> +out:
>> +    return ret;
>> +}
>> +
>>  static void virt_machine_class_init(ObjectClass *oc, void *data)
>>  {
>>      MachineClass *mc = MACHINE_CLASS(oc);
>> @@ -1668,6 +1708,7 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
>>      mc->cpu_index_to_instance_props = virt_cpu_index_to_props;
>>      mc->default_cpu_type = ARM_CPU_TYPE_NAME("cortex-a15");
>>      mc->get_default_cpu_node_id = virt_get_default_cpu_node_id;
>> +    mc->kvm_type = virt_kvm_type;
>>      assert(!mc->get_hotplug_handler);
>>      mc->get_hotplug_handler = virt_machine_get_hotplug_handler;
>>      hc->plug = virt_machine_device_plug_cb;
>> @@ -1756,6 +1797,9 @@ static void virt_3_0_instance_init(Object *obj)
>>                                      "Valid values are none and smmuv3",
>>                                      NULL);
>>  
>> +    object_property_add_str(obj, "kvm-type",
>> +                            virt_get_kvm_type, virt_set_kvm_type, NULL);
>> +
>>      vms->memmap = a15memmap;
>>      vms->irqmap = a15irqmap;
>>  }
>> diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
>> index 4ac7ef6..2674ce7 100644
>> --- a/include/hw/arm/virt.h
>> +++ b/include/hw/arm/virt.h
>> @@ -118,6 +118,7 @@ typedef struct {
>>      uint32_t msi_phandle;
>>      uint32_t iommu_phandle;
>>      int psci_conduit;
>> +    char *kvm_type;
>>  } VirtMachineState;
>>  
>>  #define TYPE_VIRT_MACHINE   MACHINE_TYPE_NAME("virt")
>> -- 
>> 2.5.5
>>
> --
> Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK
> 
