Received: by 2002:a17:504:5d2c:b0:1be9:327d:8ee3 with SMTP id et12csp30111njc;
        Thu, 12 Jun 2025 22:05:20 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWU+jxRiz/aTSinMnFLVCB+f4UbMydMzlyHlyD0eFwd8Vj/fYL5RUHnN4gSKarP5plQg85n5hVw/3J3Zg==@linaro.org
X-Google-Smtp-Source: AGHT+IFHpSVwuNveD5Lsvb70DICo0AxefZJc0fgM2gKSZlJkyKXxnlMzZK7qqeXHwhgpsiM8S/7B
X-Received: by 2002:a05:620a:f03:b0:7ca:cd16:8f52 with SMTP id af79cd13be357-7d3bc3ce9ddmr302612785a.12.1749791120188;
        Thu, 12 Jun 2025 22:05:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1749791120; cv=none;
        d=google.com; s=arc-20240605;
        b=ABaKIXyf92N6lKo3CgAfODLMQECRIQSir3wqv05hVMoiS66sJvvqQz9gcI8A5LAqhC
         Ro8P77SJW1pky3k5FfXy05X8CtKQ9rB7eP6hKn/YfQrKUQ0cBan/zKwCDYsfwI3bgBXF
         8YPTof3YbqILChVIqr+oMx1Ixu1fGS6YSqG4dKsV8eO4PFsSIMejNsKTLotKTm9BrqFN
         uxrpD0y55eHsq6BMMW2PvLofqjyiia2VIsEyl8fsh3ySgHMC7OaVQXyQDPCj3pztg2gz
         5DFOo94lg5VQm78M+c+lcjraavSnabgN0W8Ydj6uUkQ2UQez0QnI+KlC9wywRTrP1oOn
         RtpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:reply-to:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=mMxIr67GsAt1Z4qW9pogz4vadnhRgUPhQ68fi5VaJBs=;
        fh=Bnwtw17TNy093EcZ0zu9COYRTk+4YFYauOcNLatEif4=;
        b=HZTBrikoklrqOSTBL4cS+AWB2kHOCXJxHnFkwU8Ji9vw3grhi5qquODbJFkt4QnMxj
         O0pTIj23j7IzVRCWC1ScA98fziC9TtSes4Nr6/c0NkRHqg9gjbLjut9LwnnBlFmaE3em
         Do4J/7TJGGBDwuCX/t/0jcQwzF1mMNCX3EE9NiEQ/IzlFasGmTthQyraakYmV5juPTie
         XODByjF10aNPzxaxLOUb8wGwoVZWttR1SRWJUYtVjeZws9sM1JbVHFI4yKbJuH+IU7G0
         xQmPbAokMGagjSl66geV6q8BChYigqj184gzcH21IpqOcbQC7I9XIyaBrVrzNY/5s2ZP
         sCxQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=fnWuEtfm;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id af79cd13be357-7d3b8f36387si226228685a.534.2025.06.12.22.05.20
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 22:05:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=fnWuEtfm;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749791119;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mMxIr67GsAt1Z4qW9pogz4vadnhRgUPhQ68fi5VaJBs=;
	b=fnWuEtfm8X0AQN+ez668iOZo5EmNKVMLgrfcbcVRAo3edcJBgh6KvFsKuxI38qlBVVfycx
	PYPh+xzD3IMiSikg1bjI5V1lyubn/jPV0k72OtNbvx25zyg1sAMtMxhx7QLB/ujah6lXGE
	0p8Jt80af3d/PGgRO6f6qntnZnE5ldw=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-570-B8nccu0fNM-h9IhpAy3tLg-1; Fri, 13 Jun 2025 01:05:17 -0400
X-MC-Unique: B8nccu0fNM-h9IhpAy3tLg-1
X-Mimecast-MFC-AGG-ID: B8nccu0fNM-h9IhpAy3tLg_1749791117
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3a4f3796779so1373782f8f.1
        for <alex.bennee@linaro.org>; Thu, 12 Jun 2025 22:05:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749791116; x=1750395916;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mMxIr67GsAt1Z4qW9pogz4vadnhRgUPhQ68fi5VaJBs=;
        b=Wy2ASA3zBZo1x9yliYrPcneaIWSYT7jH/mOKAeYyFUUZbKxYXgBLnO1qPTVKvi1jo6
         PiWZ+OYiT9aO1vURbawUlMLZVyRBU9XYPUk3I35Na2enQsn8D4ai0YAnQMqj4ul61B76
         zGwkm7mBvWjOZNtXSPTHTBmXkGmBMg1gTYmI3VZ+1aSqAePInz7KNqNNQ0j5OGUAlfcB
         wdXu5UlREVrwcynmExKkGF33LFlONUeVA2z/MXOxgPh5WG+j2UGsNXuQX7Ko4dzPYZmZ
         3CpfLDGEyTrn+oqjHtdpIhijDcnt04sZyksNVo4WfMlPeEHiMJLiPVbLbh6yVFvxa1zv
         dk3A==
X-Forwarded-Encrypted: i=1; AJvYcCUf2fRe+NLwtFqLcYOYqD0x9YYbi7YcUOnPL69zilAlhBXEGxIxGsB6tyGlyR6IoH3PbcuUwqPlrBbHdA==@linaro.org
X-Gm-Message-State: AOJu0YycFiCco+QeM2xGRLnqpsbkukcs6SG6xofd8DizcdkTgDrKDHvD
	CzilvctBpwLbkzP6wGNSOa6n/TFU9Rpk/jH/v5EQO7oZ94NzsI4XAHixGjHr1oADGb2cLTTl5Qp
	IxWXqdjIhKEWCsa98c/rPxmL4oZi6Z/5gVBBUXX4KdovbFagWqOd/SOn1mQ==
X-Gm-Gg: ASbGncvdVJUu76U14uiUiB0YGtk4HonvkB35Mv0P0Gksyt8yFjZZK8chc6/f4gVpM5Z
	nluyzel+COCzyz2izct7BaWAUGp+SGRfuCktMuAk1RaAoAI35lTM9hc3OFAHWxxAWatHsbOgVvo
	ZhIFcv6AN70lqqWIZB8Mchgh4MRUxOBlk0yx/Nta0yQ7pow0la3N+9tK6FbgsmOrnqD0axFdykT
	taFxUhx9o/2hmqp99uw/t99JU1FaZLFV129VkxqH6tp4QDXsFYBKznDNZbwg8nacXD1hgNk0w88
	yDEMipTCkamC5a0bToc2BXB6NRsdq0sU3GZq69WwzQJY6d4vnGx2hhl/3ziuhin6rqlKdw==
X-Received: by 2002:a05:6000:310e:b0:3a5:52d4:5b39 with SMTP id ffacd0b85a97d-3a5686831camr1278059f8f.8.1749791116441;
        Thu, 12 Jun 2025 22:05:16 -0700 (PDT)
X-Received: by 2002:a05:6000:310e:b0:3a5:52d4:5b39 with SMTP id ffacd0b85a97d-3a5686831camr1278022f8f.8.1749791115841;
        Thu, 12 Jun 2025 22:05:15 -0700 (PDT)
Return-Path: <eric.auger@redhat.com>
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874? ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568b087b4sm1194957f8f.51.2025.06.12.22.05.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Jun 2025 22:05:14 -0700 (PDT)
Message-ID: <46cb9903-7a00-4e43-9b0e-03707e4952d3@redhat.com>
Date: Fri, 13 Jun 2025 07:05:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: eric.auger@redhat.com
Subject: Re: [PATCH v2 02/25] hw/arm/virt: Introduce machine state acpi pcihp
 flags and props
To: Gustavo Romero <gustavo.romero@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>
Cc: eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 peter.maydell@linaro.org, anisinha@redhat.com, mst@redhat.com,
 shannon.zhaosl@gmail.com, pbonzini@redhat.com, Jonathan.Cameron@huawei.com,
 philmd@linaro.org, alex.bennee@linaro.org
References: <20250527074224.1197793-1-eric.auger@redhat.com>
 <20250527074224.1197793-3-eric.auger@redhat.com>
 <20250527135813.2d6cde91@imammedo.users.ipa.redhat.com>
 <d6bd4794-bcee-4701-8e63-4adee91120d9@redhat.com>
 <20250528123325.750529a4@imammedo.users.ipa.redhat.com>
 <13792b72-d336-41b8-8ac7-8790e10f833c@redhat.com>
 <20250611104511.55152616@imammedo.users.ipa.redhat.com>
 <05680827-85d9-4ebd-91a7-93e262da52f5@redhat.com>
 <20250612145537.7dff93a8@imammedo.users.ipa.redhat.com>
 <61599d8b-d83d-44ff-8c4d-86bf90ebbb4c@linaro.org>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <61599d8b-d83d-44ff-8c4d-86bf90ebbb4c@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: oQhUe0JsvIaomOnbgsASGQ0eIoEm1bg3cAV9oXjY-5g_1749791117
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: nOzEfqPHW8j5

Hi Gustavo,

On 6/13/25 5:01 AM, Gustavo Romero wrote:
> Hi Eric,
>
> On 6/12/25 09:55, Igor Mammedov wrote:
>> On Wed, 11 Jun 2025 10:50:04 +0200
>> Eric Auger <eric.auger@redhat.com> wrote:
>>
>>> Hi Igor,
>>> On 6/11/25 10:45 AM, Igor Mammedov wrote:
>>>> On Wed, 11 Jun 2025 08:53:28 +0200
>>>> Eric Auger <eric.auger@redhat.com> wrote:
>>>>  
>>>>> Hi Gustavo, Alex,
>>>>>
>>>>> On 5/28/25 12:33 PM, Igor Mammedov wrote:
>>>>>> On Tue, 27 May 2025 15:54:15 +0200
>>>>>> Eric Auger <eric.auger@redhat.com> wrote:
>>>>>>    
>>>>>>> Hi Igor,
>>>>>>>
>>>>>>> On 5/27/25 1:58 PM, Igor Mammedov wrote:
>>>>>>>> On Tue, 27 May 2025 09:40:04 +0200
>>>>>>>> Eric Auger <eric.auger@redhat.com> wrote:
>>>>>>>>      
>>>>>>>>> acpi_pcihp VirtMachineClass state flag will allow
>>>>>>>>> to opt in for acpi pci hotplug. This is guarded by a
>>>>>>>>> class no_acpi_pcihp flag to manage compats (<= 10.0
>>>>>>>>> machine types will not support ACPI PCI hotplug).
>>>>>>>> there is no reason to put an effort in force disabling it
>>>>>>>> on old machines, as long as code works when explicitly
>>>>>>>> enabled property on CLI.
>>>>>>>>
>>>>>>>> See comment below on how to deal with it
>>>>>>>>      
>>>>>>>>> Machine state acpi_pcihp flag must be set before the creation
>>>>>>>>> of the GED device which will use it.
>>>>>>>>>
>>>>>>>>> Currently the ACPI PCI HP is turned off by default. This will
>>>>>>>>> change later on for 10.1 machine type.
>>>>>>>> one thing to note, is that turning it on by default might
>>>>>>>> cause change of NIC naming in guest as this brings in
>>>>>>>> new "_Sxx" slot naming. /so configs tied to nic  go down the
>>>>>>>> drain/
>>>>>>>>
>>>>>>>> Naming, we have, also happens to be broken wrt spec
>>>>>>>> (it should be unique system wide, there was a gitlab issue for
>>>>>>>> that,
>>>>>>>> there is no easy fix that though)
>>>>>>>>
>>>>>>>> So I'd leave it disabled by default and let users to turn
>>>>>>>> it on explicitly when needed.
>>>>>>> what is the status on q35, isn't it enabled by default? If so why
>>>>>>> wouldn't we want the same setting on ARM? Is that because of the
>>>>>>> known
>>>>>>> issue you report above?
>>>>>> Above issue is not a blocker (for thae lack of a good way to fix it)
>>>>>>
>>>>>> on q35 we have had a few complains and fixes, after pcihp was
>>>>>> promoted
>>>>>> to default (so hopefully that won't happen on with ARM). Also given
>>>>>> that ARM VM is less popular like hood breaking someone setup is
>>>>>> even less.
>>>>>>
>>>>>> That said I'd be cautions keep native hotplug as default,
>>>>>> and only ones who need ACPI one, could turn it on explicitly.
>>>>>>
>>>>>> But well it's policies, so it's up to you ARM folks to decide what
>>>>>> virt board should look like.
>>>>> What is your preference? Do you prefer enabling ACPI PCI HP by
>>>>> default
>>>>> or the opposite.
>>>> I'd prefer native PCIe hotplug being default,
>>>> that way we have less chance of causing regressions not to mention
>>>> less complexity (as acpi pcihp adds up quite a bit of it).
>>>>
>>>> And ones who want/need acpi-pcihp/acpi-index can enable it explicitly,
>>>> to play with.
>>>
>>> OK I will follow your suggestion. You have definitively more expertise
>>> than me here ! ;-)
>>
>> So far what I suggest looks like better option compared to multiple
>> machine knobs
>> fiddling. But I can easily change my mind once I see respin, if
>> experiment
>> with compat props is not coming well together.
>
> For now, I think it's okay to let ACPI PCI hotplug stabilize (while
> not being the
> default) for at least one release cycle. So I'm fine with keeping
> acpi-pcihp=off as
> the default.
>
> As I mentioned elsewhere, I don't consider native PCIe hotplug to be
> legacy.
>
> We can make acpi-pcihp=on the default in a future release once it's
> been more
> widely exercised.
>
> I'll update the bios-tables-test.c test accordingly, then you can
> either put them
> in the v3 (if you happen to send v3 next week) or add them to a v4.

OK thank you for the confirmation. So following Igor's suggestion I
indeed kept the current default value (legacy PCIe hotplug) and I don't
use a machine option anymore. Instead I use the x86 trick, ie.

-global acpi-ged.acpi-pci-hotplug-with-bridge-support=on

I can easily update your tests with that option, don't bother
respinning. I should be able to send the v3 by beginning of next week.

Thanks!

Eric

>
>
> Cheers,
> Gustavo
>
>>> Thanks!
>>>
>>> Eric
>>>>  
>>>>> Anybody else?
>>>>>
>>>>> On my end I think I would prefer to have the same default setting
>>>>> than
>>>>> on x86 (ie. ACPI PCI hotplug set by default) but I have no strong
>>>>> opinion either.
>>>>>
>>>>> Thanks
>>>>>
>>>>> Eric
>>>>>>    
>>>>>>> The no_foo compat stuff was especially introduced to avoid
>>>>>>> breaking the
>>>>>>> guest ABI for old machine types (like the NIC naming alternation
>>>>>>> you evoke).
>>>>>> no_foo is just another way to handle compat stuff,
>>>>>> and when it's more than one knob per feature it gets ugly really
>>>>>> fast.
>>>>>> Hence, I'd prefer pcihp done in x86 way aka:
>>>>>>     hw_compat_OLD(ged.use_acpi_hotplug_bridge, false|true)
>>>>>> to manage presence of ACPI hotplug on desired machine version.
>>>>>> Side benefit it's consistent with how pcihp works on x86
>>>>>>    
>>>>>>>>      
>>>>>>>>> We also introduce properties to allow disabling it.
>>>>>>>>>
>>>>>>>>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>>>>>>>>> Reviewed-by: Gustavo Romero <gustavo.romero@linaro.org>
>>>>>>>>> ---
>>>>>>>>>   include/hw/arm/virt.h |  2 ++
>>>>>>>>>   hw/arm/virt.c         | 27 +++++++++++++++++++++++++++
>>>>>>>>>   2 files changed, 29 insertions(+)
>>>>>>>>>
>>>>>>>>> diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
>>>>>>>>> index 9a1b0f53d2..10ea581f06 100644
>>>>>>>>> --- a/include/hw/arm/virt.h
>>>>>>>>> +++ b/include/hw/arm/virt.h
>>>>>>>>> @@ -129,6 +129,7 @@ struct VirtMachineClass {
>>>>>>>>>       bool no_tcg_lpa2;
>>>>>>>>>       bool no_ns_el2_virt_timer_irq;
>>>>>>>>>       bool no_nested_smmu;
>>>>>>>>> +    bool no_acpi_pcihp;
>>>>>>>>>   };
>>>>>>>>>     struct VirtMachineState {
>>>>>>>>> @@ -150,6 +151,7 @@ struct VirtMachineState {
>>>>>>>>>       bool mte;
>>>>>>>>>       bool dtb_randomness;
>>>>>>>>>       bool second_ns_uart_present;
>>>>>>>>> +    bool acpi_pcihp;
>>>>>>>>>       OnOffAuto acpi;
>>>>>>>>>       VirtGICType gic_version;
>>>>>>>>>       VirtIOMMUType iommu;
>>>>>>>>> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
>>>>>>>>> index 9a6cd085a3..a0deeaf2b3 100644
>>>>>>>>> --- a/hw/arm/virt.c
>>>>>>>>> +++ b/hw/arm/virt.c
>>>>>>>>> @@ -2397,8 +2397,10 @@ static void machvirt_init(MachineState
>>>>>>>>> *machine)
>>>>>>>>>       create_pcie(vms);
>>>>>>>>>         if (has_ged && aarch64 && firmware_loaded &&
>>>>>>>>> virt_is_acpi_enabled(vms)) {
>>>>>>>>> +        vms->acpi_pcihp &= !vmc->no_acpi_pcihp;
>>>>>>>> I don't particularly like no_foo naming as it makes code harder
>>>>>>>> to read
>>>>>>>> and combined with 'duplicated' field in machine state it make
>>>>>>>> even things worse.
>>>>>>>> (if I recall right Philippe was cleaning mess similar flags usage
>>>>>>>> have introduced with ITS)
>>>>>>>>
>>>>>>>> instead of adding machine property (both class and state),
>>>>>>>> I'd suggest adding the only property to GPE device (akin to
>>>>>>>> what we have in x86 world)
>>>>>>>> And then one can meddle with defaults using hw_compat_xxx
>>>>>>> no_foo still is a largely used pattern in arm virt: no_ged,
>>>>>>> kvm_no_adjvtime, no_kvm_steal_time, no_tcg_lpa2, ../.. There are
>>>>>>> plenty
>>>>>>> of them and I am not under the impression this is going to be
>>>>>>> changed.
>>>>>>>
>>>>>>> If you refer to 8d23b1df7212 ("hw/arm/virt: Remove
>>>>>>> VirtMachineClass::no_its field") I think the no_its was removed
>>>>>>> because
>>>>>>> the machine it applied was removed.
>>>>>>>
>>>>>>> If I understand correctly you would like the prop to be attached
>>>>>>> to the
>>>>>>> GED device. However the GED device is internally created by the
>>>>>>> virt
>>>>>>> machine code and not passed through a "-device" CLI option. So
>>>>>>> how would
>>>>>>> you pass the option on the cmd line if you don't want it to be
>>>>>>> set by
>>>>>>> default per machine type?
>>>>>>>
>>>>>>> Thanks
>>>>>>>
>>>>>>> Eric
>>>>>>>>      
>>>>>>>>>           vms->acpi_dev = create_acpi_ged(vms);
>>>>>>>>>       } else {
>>>>>>>>> +        vms->acpi_pcihp = false;
>>>>>>>>>           create_gpio_devices(vms, VIRT_GPIO, sysmem);
>>>>>>>>>       }
>>>>>>>>>   @@ -2593,6 +2595,20 @@ static void virt_set_its(Object *obj,
>>>>>>>>> bool value, Error **errp)
>>>>>>>>>       vms->its = value;
>>>>>>>>>   }
>>>>>>>>>   +static bool virt_get_acpi_pcihp(Object *obj, Error **errp)
>>>>>>>>> +{
>>>>>>>>> +    VirtMachineState *vms = VIRT_MACHINE(obj);
>>>>>>>>> +
>>>>>>>>> +    return vms->acpi_pcihp;
>>>>>>>>> +}
>>>>>>>>> +
>>>>>>>>> +static void virt_set_acpi_pcihp(Object *obj, bool value,
>>>>>>>>> Error **errp)
>>>>>>>>> +{
>>>>>>>>> +    VirtMachineState *vms = VIRT_MACHINE(obj);
>>>>>>>>> +
>>>>>>>>> +    vms->acpi_pcihp = value;
>>>>>>>>> +}
>>>>>>>>> +
>>>>>>>>>   static bool virt_get_dtb_randomness(Object *obj, Error **errp)
>>>>>>>>>   {
>>>>>>>>>       VirtMachineState *vms = VIRT_MACHINE(obj);
>>>>>>>>> @@ -3310,6 +3326,10 @@ static void
>>>>>>>>> virt_machine_class_init(ObjectClass *oc, const void *data)
>>>>>>>>>                                             "in ACPI table
>>>>>>>>> header."
>>>>>>>>>                                             "The string may be
>>>>>>>>> up to 8 bytes in size");
>>>>>>>>>   +    object_class_property_add_bool(oc, "acpi-pcihp",
>>>>>>>>> +                                   virt_get_acpi_pcihp,
>>>>>>>>> virt_set_acpi_pcihp);
>>>>>>>>> +    object_class_property_set_description(oc, "acpi-pcihp",
>>>>>>>>> +                                          "Force ACPI PCI
>>>>>>>>> hotplug");
>>>>>>>>>   }
>>>>>>>>>     static void virt_instance_init(Object *obj)
>>>>>>>>> @@ -3344,6 +3364,9 @@ static void virt_instance_init(Object *obj)
>>>>>>>>>           vms->tcg_its = true;
>>>>>>>>>       }
>>>>>>>>>   +    /* default disallows ACPI PCI hotplug */
>>>>>>>>> +    vms->acpi_pcihp = false;
>>>>>>>>> +
>>>>>>>>>       /* Default disallows iommu instantiation */
>>>>>>>>>       vms->iommu = VIRT_IOMMU_NONE;
>>>>>>>>>   @@ -3394,8 +3417,12 @@ DEFINE_VIRT_MACHINE_AS_LATEST(10, 1)
>>>>>>>>>     static void virt_machine_10_0_options(MachineClass *mc)
>>>>>>>>>   {
>>>>>>>>> +    VirtMachineClass *vmc =
>>>>>>>>> VIRT_MACHINE_CLASS(OBJECT_CLASS(mc));
>>>>>>>>> +
>>>>>>>>>       virt_machine_10_1_options(mc);
>>>>>>>>>       compat_props_add(mc->compat_props, hw_compat_10_0,
>>>>>>>>> hw_compat_10_0_len);
>>>>>>>>> +    /* 10.0 and earlier do not support ACPI PCI hotplug */
>>>>>>>>> +    vmc->no_acpi_pcihp = true;
>>>>>>>>>   }
>>>>>>>>>   DEFINE_VIRT_MACHINE(10, 0)
>>>>>>>>>         
>>>
>>
>
