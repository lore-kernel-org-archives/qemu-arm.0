Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp7067458wrx;
        Fri, 22 Feb 2019 07:18:58 -0800 (PST)
X-Google-Smtp-Source: AHgI3IZf5Q/krkPN/yQvN/ogKysS98OO2JC0drdMO5J95jkKquRYtJHFAOXDSaoiGmaHinRF/lwu
X-Received: by 2002:a81:9bd3:: with SMTP id s202mr3750232ywg.76.1550848738643;
        Fri, 22 Feb 2019 07:18:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1550848738; cv=none;
        d=google.com; s=arc-20160816;
        b=xZgVf/1RQBuyEshofIR0DfFNl7/Z0a6MwyJGpJt9Ii7G2QEZQrKdR5H9mSZLqo2zxY
         J8BhqppnSYxHZ/1KvEWovvG1z0xRi687MKgMFsYwkaSMBzqjEOYZGDD+WXkpWigR1GEr
         XJ1QenokOaNeXzGiML4+8QBkYWwHaiZArCmy+m2AYgDz9tLUBtPDTGvFkQIBatSf7kB0
         J/JR6R6eGT80C3A8dC58/Cz2Z2Mwttg1DhuI/HlE/yMM4gltRSNXOEqondvJq5jby2+J
         OvIeEsnolFx2UrJ++812JpHkaisR873YZo3qmZc37787T3ovZzyUBMFvwdEeujEUSz9K
         lWsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=570cDEmZ0kMRc5WIfrp8sYnjjX0jcuwKhzj5e5VIhoE=;
        b=dOCnrc/nD4PLsvxNBMcsRFIqxltqDIAPKpSHTzhKNBVVY1QMCflMrPN6I9iqef5mn2
         N2moVK81fhpmjiFgmZHlB6UBtJxfvNruxoeXYouBTlGaFwD75/9wUvkCid3wZadKMcyQ
         aOK/egUevI46kMNsEw8Gk5uEwe23ExCbNZcDxZfHcCwOF3N/Ypf/UceGZ+cwAjegFnDq
         TBQCTdx6rCd3NsbJiJfETDxFRol0/odniIT/i+FEKQvii0pzx0wyQjBqKxmLWkrXke8v
         sn0Gv50v0NlpKVVu7DLPn8cFM8bX5rBOiHfC/85bD9l7HrZyKINl+QyGuOQ2vSJOIHT6
         oyuQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z29si964073ybi.323.2019.02.22.07.18.58
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 22 Feb 2019 07:18:58 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:52522 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gxCbK-0000cL-19
	for alex.bennee@linaro.org; Fri, 22 Feb 2019 10:18:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35326)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gxCHQ-0000mq-Q6
	for qemu-devel@nongnu.org; Fri, 22 Feb 2019 09:58:27 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gxCCr-0003gb-6L
	for qemu-devel@nongnu.org; Fri, 22 Feb 2019 09:53:42 -0500
Received: from mx1.redhat.com ([209.132.183.28]:53602)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1gxCCn-0003Qh-Oy; Fri, 22 Feb 2019 09:53:37 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0A24A883C2;
	Fri, 22 Feb 2019 14:53:30 +0000 (UTC)
Received: from [10.36.116.102] (ovpn-116-102.ams2.redhat.com [10.36.116.102])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 84D085D9CA;
	Fri, 22 Feb 2019 14:53:26 +0000 (UTC)
To: Igor Mammedov <imammedo@redhat.com>
References: <20190220224003.4420-1-eric.auger@redhat.com>
	<20190220224003.4420-9-eric.auger@redhat.com>
	<20190222134516.575288c2@redhat.com>
	<d6b2654c-d345-152b-4eec-7f2b885e6047@redhat.com>
	<20190222153344.332cff15@redhat.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <715e1c1b-892a-10bd-5b4b-2c24ff560150@redhat.com>
Date: Fri, 22 Feb 2019 15:53:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190222153344.332cff15@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Fri, 22 Feb 2019 14:53:30 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v7 08/17] hw/arm/virt: Implement kvm_type
 function for 4.0 machine
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
Cc: peter.maydell@linaro.org, drjones@redhat.com, david@redhat.com,
	dgilbert@redhat.com, shameerali.kolothum.thodi@huawei.com,
	qemu-devel@nongnu.org, qemu-arm@nongnu.org,
	eric.auger.pro@gmail.com, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ZReFonvc3Piw

Hi Igor,

On 2/22/19 3:39 PM, Igor Mammedov wrote:
> On Fri, 22 Feb 2019 15:01:25 +0100
> Auger Eric <eric.auger@redhat.com> wrote:
> 
>> Hi Igor,
>>
>> On 2/22/19 1:45 PM, Igor Mammedov wrote:
>>> On Wed, 20 Feb 2019 23:39:54 +0100
>>> Eric Auger <eric.auger@redhat.com> wrote:
>>>   
>>>> This patch implements the machine class kvm_type() callback.
>>>> It returns the number of bits requested to implement the whole GPA
>>>> range including the RAM and IO regions located beyond.
>>>> The returned value in passed though the KVM_CREATE_VM ioctl and
>>>> this allows KVM to set the stage2 tables dynamically.
>>>>
>>>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>>>>
>>>> ---
>>>>
>>>> v6 -> v7:
>>>> - Introduce RAMBASE and rename add LEGACY_ prefix in that patch
>>>> - use local variables with explicit names in virt_set_memmap:
>>>>   device_memory_base, device_memory_size
>>>> - add an extended_memmap field in the class
>>>>
>>>> v5 -> v6:
>>>> - add some comments
>>>> - high IO region cannot start before 256GiB
>>>> ---
>>>>  hw/arm/virt.c         | 50 ++++++++++++++++++++++++++++++++++++++++++-
>>>>  include/hw/arm/virt.h |  2 ++
>>>>  2 files changed, 51 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
>>>> index 9db602457b..ad3a0ad73d 100644
>>>> --- a/hw/arm/virt.c
>>>> +++ b/hw/arm/virt.c
>>>> @@ -1437,7 +1437,14 @@ static void machvirt_init(MachineState *machine)
>>>>      bool firmware_loaded = bios_name || drive_get(IF_PFLASH, 0, 0);
>>>>      bool aarch64 = true;
>>>>  
>>>> -    virt_set_memmap(vms);
>>>> +    /*
>>>> +     * In accelerated mode, the memory map is computed in kvm_type(),
>>>> +     * if set, to create a VM with the right number of IPA bits.
>>>> +     */
>>>> +
>>>> +    if (!mc->kvm_type || !kvm_enabled()) {
>>>> +        virt_set_memmap(vms);
>>>> +    }
>>>>  
>>>>      /* We can probe only here because during property set
>>>>       * KVM is not available yet
>>>> @@ -1814,6 +1821,36 @@ static HotplugHandler *virt_machine_get_hotplug_handler(MachineState *machine,
>>>>      return NULL;
>>>>  }
>>>>  
>>>> +/*
>>>> + * for arm64 kvm_type [7-0] encodes the requested number of bits
>>>> + * in the IPA address space
>>>> + */
>>>> +static int virt_kvm_type(MachineState *ms, const char *type_str)
>>>> +{
>>>> +    VirtMachineState *vms = VIRT_MACHINE(ms);
>>>> +    int max_vm_pa_size = kvm_arm_get_max_vm_ipa_size(ms);
>>>> +    int requested_pa_size;
>>>> +
>>>> +    /* we freeze the memory map to compute the highest gpa */
>>>> +    virt_set_memmap(vms);
>>>> +
>>>> +    requested_pa_size = 64 - clz64(vms->highest_gpa);
>>>> +
>>>> +    if (requested_pa_size > max_vm_pa_size) {
>>>> +        error_report("-m and ,maxmem option values "
>>>> +                     "require an IPA range (%d bits) larger than "
>>>> +                     "the one supported by the host (%d bits)",
>>>> +                     requested_pa_size, max_vm_pa_size);
>>>> +       exit(1);
>>>> +    }
>>>> +    /*
>>>> +     * By default we return 0 which corresponds to an implicit legacy
>>>> +     * 40b IPA setting. Otherwise we return the actual requested PA
>>>> +     * logsize
>>>> +     */
>>>> +    return requested_pa_size > 40 ? requested_pa_size : 0;
>>>> +}
>>>> +
>>>>  static void virt_machine_class_init(ObjectClass *oc, void *data)
>>>>  {
>>>>      MachineClass *mc = MACHINE_CLASS(oc);
>>>> @@ -1838,6 +1875,7 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
>>>>      mc->cpu_index_to_instance_props = virt_cpu_index_to_props;
>>>>      mc->default_cpu_type = ARM_CPU_TYPE_NAME("cortex-a15");
>>>>      mc->get_default_cpu_node_id = virt_get_default_cpu_node_id;
>>>> +    mc->kvm_type = virt_kvm_type;
>>>>      assert(!mc->get_hotplug_handler);
>>>>      mc->get_hotplug_handler = virt_machine_get_hotplug_handler;
>>>>      hc->plug = virt_machine_device_plug_cb;
>>>> @@ -1909,6 +1947,12 @@ static void virt_instance_init(Object *obj)
>>>>                                      "Valid values are none and smmuv3",
>>>>                                      NULL);
>>>>  
>>>> +    if (vmc->no_extended_memmap) {
>>>> +        vms->extended_memmap = false;
>>>> +    } else {
>>>> +        vms->extended_memmap = true;
>>>> +    }
>>>> +
>>>>      vms->irqmap = a15irqmap;
>>>>  }
>>>>  
>>>> @@ -1939,8 +1983,12 @@ DEFINE_VIRT_MACHINE_AS_LATEST(4, 0)
>>>>  
>>>>  static void virt_machine_3_1_options(MachineClass *mc)
>>>>  {
>>>> +    VirtMachineClass *vmc = VIRT_MACHINE_CLASS(OBJECT_CLASS(mc));
>>>>      virt_machine_4_0_options(mc);
>>>>      compat_props_add(mc->compat_props, hw_compat_3_1, hw_compat_3_1_len);
>>>> +
>>>> +    /* extended memory map is enabled from 4.0 onwards */
>>>> +    vmc->no_extended_memmap = true;  
>>> That's probably was asked in v6,
>>> do we really need this knob?  
>> Yes the point was raised by Peter and I replied by another question ;-) "
>> But don't we want to forbid any pre-4.0 machvirt to run with more than
>> 255GiB RAM?
>> "
>> without this knob:
>> - pre-4.0 machines will gain the capability to support more than 255GB
>> initial RAM if the kernel supports dynamic IPA setting
> should be fine, you shouldn't be able to start old QEMU with more than 255Gb
> 
>> - pre-4.0 machines will gain PCDIMM/NVDIMM support
> ditto
> 
>> - another concern, maxmem and slots were not checked previously. If for
>> some reason - without instantiating the actual slots -, the user
>> specified it this was previously ignored. Now this is not anymore as
>> both parameters allow to compute the requested IPA range. So this may
>> fail now.
> well that's in category of a broken setup even if QEMU didn't complain about
> it before. User should fix it instead of QEMU supporting madness.
> (I think that such invariant doesn't even deserve deprecation process)

OK. So I will remove the knob in the next release.

thanks

Eric
> 
>> So I thought this was clearer to disable all the above for pre-4.0
>> machines. However if both of you agree, I will remove it.
>>
>> thanks
>>
>> Eric
>>>   
>>>>  }
>>>>  DEFINE_VIRT_MACHINE(3, 1)
>>>>  
>>>> diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
>>>> index acad0400d8..7798462cb0 100644
>>>> --- a/include/hw/arm/virt.h
>>>> +++ b/include/hw/arm/virt.h
>>>> @@ -106,6 +106,7 @@ typedef struct {
>>>>      bool claim_edge_triggered_timers;
>>>>      bool smbios_old_sys_ver;
>>>>      bool no_highmem_ecam;
>>>> +    bool no_extended_memmap;
>>>>  } VirtMachineClass;
>>>>  
>>>>  typedef struct {
>>>> @@ -135,6 +136,7 @@ typedef struct {
>>>>      hwaddr highest_gpa;
>>>>      hwaddr device_memory_base;
>>>>      hwaddr device_memory_size;
>>>> +    bool extended_memmap;
>>>>  } VirtMachineState;
>>>>  
>>>>  #define VIRT_ECAM_ID(high) (high ? VIRT_HIGH_PCIE_ECAM : VIRT_PCIE_ECAM)  
>>>   
>>
> 
