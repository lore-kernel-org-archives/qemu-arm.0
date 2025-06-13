Received: by 2002:a17:504:5d2c:b0:1be9:327d:8ee3 with SMTP id et12csp262709njc;
        Fri, 13 Jun 2025 06:40:24 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUKNKweCtbOUr/m9sjaY8Kbl3En9/kY0u7+omicCRUdXSgnDaQWM+kbm7mem2iFawHB17rT4Gv23CYe9w==@linaro.org
X-Received: by 2002:a05:622a:6089:b0:472:1aed:c8b4 with SMTP id d75a77b69052e-4a72ff39991mr49850631cf.34.1749822023593;
        Fri, 13 Jun 2025 06:40:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1749822023; cv=none;
        d=google.com; s=arc-20240605;
        b=fgQC8PRvdFltLNL3u0VvgsvPCE4FxQ7JYd0/zHHolyjlzq0R2AClpgRQ9iplwj+8tU
         0ruZF6w4GtYUder+VCEPypBYOMoTsjkNbjLxnmgPIUT9BtTty074wzV4T/GxvyXWLngk
         HH+Jk+red8YzF33kOifHm0XY3Blt8YSYoiXDYyszPYpVqrFZdp/nwhlfTXvqSPAUI22z
         kWuzcQD1kLhjMb5ya4lSJbw8n9OkJyfSdKQEVlF7jvaxl/5Ybw8lDiKwttjIJsTtESec
         8eUHaC2pm/X4+6wsxZntjBIqve30ycIhHMTQKZtR32EArSwTjIjhNBTmBPksnO3zM4ga
         j7jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=dVRRoQ44n74p5ZlH7JuELH9UsiybZjsQI8CQ+QD6qX0=;
        fh=SGoo0uB5Du0VHsytxQMEe1c1vlqe4cTReOfVbX/64hQ=;
        b=UUegJiENKjt/MtwfevDooLpLLLIN3BJZcVH/hAvyGxlyIcFdgB+58F8kLU7ZklMFIu
         RNGtR0MXX1nQrmFv8CVvP6dOrwamRZMzjRXxny1hijrDM3aLLue8a0WBEM9nX7ECWtwB
         qB6wBAQssxsFPaN/X5EDNjHLKtM0fgViCSQ8ZcMclIuI8qDanWTSrQFC6o+WTMtRnCTx
         ZCGXFe/+LASADHbI7gJs5axr0npDbDIkW2RnShTUlbkzbHuufettchz6+AYaSU2HOdM8
         vSeQSHfyiD12iItOSeVnhUXK6c9uubMwWwbfiG5AmylKLbaVApIy0HRFNXFmVAJnMVlh
         hSQg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TV1ksj5l;
       spf=pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=gustavo.romero@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <gustavo.romero@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d75a77b69052e-4a72473034dsor56331921cf.2.2025.06.13.06.40.23
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 13 Jun 2025 06:40:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TV1ksj5l;
       spf=pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=gustavo.romero@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749822023; x=1750426823; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dVRRoQ44n74p5ZlH7JuELH9UsiybZjsQI8CQ+QD6qX0=;
        b=TV1ksj5l5TEeH1c168aWzFkbcMbYFOac2C9t5dowk0Pt2cLplvsecyqs52fRHNwfBP
         Rzv+Q8NUag2yX2SxnR/k97dCy7SR7ctq5FtyuOsuBllY+HMHxfKBeaMu2R+e3O9aeG5R
         o+02CXkTT9sK3EipSuhRp0jNFE/bCwjFj8JLfy1PHDyQUs+sNChtm96c9AoqT32jIli3
         EGTin8nOH7VOBb6hxKkPjF06j75VzLn5hbx6P24MLEjD0qldJ3nWguUygdq/b0WOiStR
         PYhMRof2E4CS/A1ae3F+y1bnOG7tGKxcR+2mgNh2Beyyc+feLy/rMEe7VVUwOFyaB/FV
         9eWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749822023; x=1750426823;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dVRRoQ44n74p5ZlH7JuELH9UsiybZjsQI8CQ+QD6qX0=;
        b=etauv2O+kKETmg6Etu7VbHLbud5EaasbD3i9QUqJonxcNlLc+NpQNp6ai6UzPngyC0
         6++2GQVmXXrE8McOLxElM5ThFl9ENVOeg/acYO8ijnxO46eNrkhON+yJWrtwvGnkvKIe
         +87XYXpFYhWsY4eH20qPFbHQS2UH5Mn1ufEg7dIjQSB56Q8IM+gfzcI9TTk9uWZ+hGAC
         KUuWh4WCnGhnxjVT+critcyP8SJvFf7pFBTETHRgOa3lKDxUVux+oetPIEdinJHa9gkr
         RHfrJZK2ERMTb8S5rE/sLikB4/t3uw0VGFRjR8/Dkk9BTrtVkFc2qD351KkEfI4CiJ58
         +lEQ==
X-Forwarded-Encrypted: i=1; AJvYcCXgh09XKEiD/yF+O3byI3ifdlS6cBxaQZ6XWvVaZNs1SIWg7RjyHtZdWnWNb8epGqS3ORT7fV3rBIehOA==@linaro.org
X-Gm-Message-State: AOJu0YysgHVU6s1sThKPlCtro40b1k22+iClNhbu8kkUF0lC5VO4x9P8
	ws+2wI5aSDe8NJk3lpsu64OqdeVY5gbtQSRFUpMqjoglgWKKZZALnCVlYOFIFjML0xwyCc4vP4f
	ngBr/o2E=
X-Gm-Gg: ASbGncuqhYzZO35d2hNd4WAr4Nvqyx7oroQ3CKWANZtStyTFd+Y7NZX3k4L0Eb0ah25
	B4SlRwcbHwh4/5f/ovGDGMvr5nwMyqMh0jDs1Jmq2UxasXgtUSQ4KnxX/jeo0JZ4p3JdCQ3RyY0
	kqL7inAvmILye+A1/wc01hoXvCfxaXcCtBvBL6Rt2zJBOMUOroAxDs8mt0DBMVctK3QKhBWsFD7
	NXbGcFG2/LXe3iVDXF+lAYplQrjcYX/O469QjO8KJF7wdGIa34SXPD7UqgB6x5CWffcckO6E68G
	HZD6bb5Utm4Fk9Yfk0rhieiPabcJwb45QcpXRu/hJSIzDGPdH3+pG/OhCNeFzvPkkfBqmQrz36H
	06kUjU7a9AdJmuDJocTnWbcFcmjpNOmcQjslxy0dPDbXZow==
X-Google-Smtp-Source: AGHT+IH0GwVfuFSvwEz62aRleaVShtFNOqKfe4KWHAFBXIfBl25vMYRfmgMznWWACFP9rVkov/rz2g==
X-Received: by 2002:a17:90b:4d08:b0:313:2b30:e7bb with SMTP id 98e67ed59e1d1-313d9c4ececmr4944396a91.15.1749822011494;
        Fri, 13 Jun 2025 06:40:11 -0700 (PDT)
Return-Path: <gustavo.romero@linaro.org>
Received: from [192.168.0.102] (200-162-224-156.static-corp.ajato.com.br. [200.162.224.156])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-313a47495fdsm4333485a91.0.2025.06.13.06.40.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Jun 2025 06:40:10 -0700 (PDT)
Message-ID: <6ab0ae5e-5763-46a8-9f73-ee81a18bd8de@linaro.org>
Date: Fri, 13 Jun 2025 10:39:58 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/25] hw/arm/virt: Introduce machine state acpi pcihp
 flags and props
To: eric.auger@redhat.com, Igor Mammedov <imammedo@redhat.com>
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
 <46cb9903-7a00-4e43-9b0e-03707e4952d3@redhat.com>
Content-Language: en-US
From: Gustavo Romero <gustavo.romero@linaro.org>
In-Reply-To: <46cb9903-7a00-4e43-9b0e-03707e4952d3@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: 9sHe7ASYG1Az

Hi Eric,

On 6/13/25 02:05, Eric Auger wrote:
> Hi Gustavo,
> 
> On 6/13/25 5:01 AM, Gustavo Romero wrote:
>> Hi Eric,
>>
>> On 6/12/25 09:55, Igor Mammedov wrote:
>>> On Wed, 11 Jun 2025 10:50:04 +0200
>>> Eric Auger <eric.auger@redhat.com> wrote:
>>>
>>>> Hi Igor,
>>>> On 6/11/25 10:45 AM, Igor Mammedov wrote:
>>>>> On Wed, 11 Jun 2025 08:53:28 +0200
>>>>> Eric Auger <eric.auger@redhat.com> wrote:
>>>>>   
>>>>>> Hi Gustavo, Alex,
>>>>>>
>>>>>> On 5/28/25 12:33 PM, Igor Mammedov wrote:
>>>>>>> On Tue, 27 May 2025 15:54:15 +0200
>>>>>>> Eric Auger <eric.auger@redhat.com> wrote:
>>>>>>>     
>>>>>>>> Hi Igor,
>>>>>>>>
>>>>>>>> On 5/27/25 1:58 PM, Igor Mammedov wrote:
>>>>>>>>> On Tue, 27 May 2025 09:40:04 +0200
>>>>>>>>> Eric Auger <eric.auger@redhat.com> wrote:
>>>>>>>>>       
>>>>>>>>>> acpi_pcihp VirtMachineClass state flag will allow
>>>>>>>>>> to opt in for acpi pci hotplug. This is guarded by a
>>>>>>>>>> class no_acpi_pcihp flag to manage compats (<= 10.0
>>>>>>>>>> machine types will not support ACPI PCI hotplug).
>>>>>>>>> there is no reason to put an effort in force disabling it
>>>>>>>>> on old machines, as long as code works when explicitly
>>>>>>>>> enabled property on CLI.
>>>>>>>>>
>>>>>>>>> See comment below on how to deal with it
>>>>>>>>>       
>>>>>>>>>> Machine state acpi_pcihp flag must be set before the creation
>>>>>>>>>> of the GED device which will use it.
>>>>>>>>>>
>>>>>>>>>> Currently the ACPI PCI HP is turned off by default. This will
>>>>>>>>>> change later on for 10.1 machine type.
>>>>>>>>> one thing to note, is that turning it on by default might
>>>>>>>>> cause change of NIC naming in guest as this brings in
>>>>>>>>> new "_Sxx" slot naming. /so configs tied to nic  go down the
>>>>>>>>> drain/
>>>>>>>>>
>>>>>>>>> Naming, we have, also happens to be broken wrt spec
>>>>>>>>> (it should be unique system wide, there was a gitlab issue for
>>>>>>>>> that,
>>>>>>>>> there is no easy fix that though)
>>>>>>>>>
>>>>>>>>> So I'd leave it disabled by default and let users to turn
>>>>>>>>> it on explicitly when needed.
>>>>>>>> what is the status on q35, isn't it enabled by default? If so why
>>>>>>>> wouldn't we want the same setting on ARM? Is that because of the
>>>>>>>> known
>>>>>>>> issue you report above?
>>>>>>> Above issue is not a blocker (for thae lack of a good way to fix it)
>>>>>>>
>>>>>>> on q35 we have had a few complains and fixes, after pcihp was
>>>>>>> promoted
>>>>>>> to default (so hopefully that won't happen on with ARM). Also given
>>>>>>> that ARM VM is less popular like hood breaking someone setup is
>>>>>>> even less.
>>>>>>>
>>>>>>> That said I'd be cautions keep native hotplug as default,
>>>>>>> and only ones who need ACPI one, could turn it on explicitly.
>>>>>>>
>>>>>>> But well it's policies, so it's up to you ARM folks to decide what
>>>>>>> virt board should look like.
>>>>>> What is your preference? Do you prefer enabling ACPI PCI HP by
>>>>>> default
>>>>>> or the opposite.
>>>>> I'd prefer native PCIe hotplug being default,
>>>>> that way we have less chance of causing regressions not to mention
>>>>> less complexity (as acpi pcihp adds up quite a bit of it).
>>>>>
>>>>> And ones who want/need acpi-pcihp/acpi-index can enable it explicitly,
>>>>> to play with.
>>>>
>>>> OK I will follow your suggestion. You have definitively more expertise
>>>> than me here ! ;-)
>>>
>>> So far what I suggest looks like better option compared to multiple
>>> machine knobs
>>> fiddling. But I can easily change my mind once I see respin, if
>>> experiment
>>> with compat props is not coming well together.
>>
>> For now, I think it's okay to let ACPI PCI hotplug stabilize (while
>> not being the
>> default) for at least one release cycle. So I'm fine with keeping
>> acpi-pcihp=off as
>> the default.
>>
>> As I mentioned elsewhere, I don't consider native PCIe hotplug to be
>> legacy.
>>
>> We can make acpi-pcihp=on the default in a future release once it's
>> been more
>> widely exercised.
>>
>> I'll update the bios-tables-test.c test accordingly, then you can
>> either put them
>> in the v3 (if you happen to send v3 next week) or add them to a v4.
> 
> OK thank you for the confirmation. So following Igor's suggestion I
> indeed kept the current default value (legacy PCIe hotplug) and I don't

_native_ PCIe hotplug? :)


> use a machine option anymore. Instead I use the x86 trick, ie.
> 
> -global acpi-ged.acpi-pci-hotplug-with-bridge-support=on

hm but why you don't keep the machine option "acpi-pcihp" and just don't
set it as "on" by default? I find global options like that a tad difficult
to follow, feels indeed like a trick. Also, I don't like much not
mentioning GPEX in the option name (and only the event notification device, "ged).

Am I missing something why a global would work better than a machine option
when the default is the native PCIe hotplug?


> I can easily update your tests with that option, don't bother
> respinning. I should be able to send the v3 by beginning of next week.

Got it! Thanks.


Cheers,
Gustavo

> Thanks!
> 
> Eric
> 
>>
>>
>> Cheers,
>> Gustavo
>>
>>>> Thanks!
>>>>
>>>> Eric
>>>>>   
>>>>>> Anybody else?
>>>>>>
>>>>>> On my end I think I would prefer to have the same default setting
>>>>>> than
>>>>>> on x86 (ie. ACPI PCI hotplug set by default) but I have no strong
>>>>>> opinion either.
>>>>>>
>>>>>> Thanks
>>>>>>
>>>>>> Eric
>>>>>>>     
>>>>>>>> The no_foo compat stuff was especially introduced to avoid
>>>>>>>> breaking the
>>>>>>>> guest ABI for old machine types (like the NIC naming alternation
>>>>>>>> you evoke).
>>>>>>> no_foo is just another way to handle compat stuff,
>>>>>>> and when it's more than one knob per feature it gets ugly really
>>>>>>> fast.
>>>>>>> Hence, I'd prefer pcihp done in x86 way aka:
>>>>>>>      hw_compat_OLD(ged.use_acpi_hotplug_bridge, false|true)
>>>>>>> to manage presence of ACPI hotplug on desired machine version.
>>>>>>> Side benefit it's consistent with how pcihp works on x86
>>>>>>>     
>>>>>>>>>       
>>>>>>>>>> We also introduce properties to allow disabling it.
>>>>>>>>>>
>>>>>>>>>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>>>>>>>>>> Reviewed-by: Gustavo Romero <gustavo.romero@linaro.org>
>>>>>>>>>> ---
>>>>>>>>>>    include/hw/arm/virt.h |  2 ++
>>>>>>>>>>    hw/arm/virt.c         | 27 +++++++++++++++++++++++++++
>>>>>>>>>>    2 files changed, 29 insertions(+)
>>>>>>>>>>
>>>>>>>>>> diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
>>>>>>>>>> index 9a1b0f53d2..10ea581f06 100644
>>>>>>>>>> --- a/include/hw/arm/virt.h
>>>>>>>>>> +++ b/include/hw/arm/virt.h
>>>>>>>>>> @@ -129,6 +129,7 @@ struct VirtMachineClass {
>>>>>>>>>>        bool no_tcg_lpa2;
>>>>>>>>>>        bool no_ns_el2_virt_timer_irq;
>>>>>>>>>>        bool no_nested_smmu;
>>>>>>>>>> +    bool no_acpi_pcihp;
>>>>>>>>>>    };
>>>>>>>>>>      struct VirtMachineState {
>>>>>>>>>> @@ -150,6 +151,7 @@ struct VirtMachineState {
>>>>>>>>>>        bool mte;
>>>>>>>>>>        bool dtb_randomness;
>>>>>>>>>>        bool second_ns_uart_present;
>>>>>>>>>> +    bool acpi_pcihp;
>>>>>>>>>>        OnOffAuto acpi;
>>>>>>>>>>        VirtGICType gic_version;
>>>>>>>>>>        VirtIOMMUType iommu;
>>>>>>>>>> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
>>>>>>>>>> index 9a6cd085a3..a0deeaf2b3 100644
>>>>>>>>>> --- a/hw/arm/virt.c
>>>>>>>>>> +++ b/hw/arm/virt.c
>>>>>>>>>> @@ -2397,8 +2397,10 @@ static void machvirt_init(MachineState
>>>>>>>>>> *machine)
>>>>>>>>>>        create_pcie(vms);
>>>>>>>>>>          if (has_ged && aarch64 && firmware_loaded &&
>>>>>>>>>> virt_is_acpi_enabled(vms)) {
>>>>>>>>>> +        vms->acpi_pcihp &= !vmc->no_acpi_pcihp;
>>>>>>>>> I don't particularly like no_foo naming as it makes code harder
>>>>>>>>> to read
>>>>>>>>> and combined with 'duplicated' field in machine state it make
>>>>>>>>> even things worse.
>>>>>>>>> (if I recall right Philippe was cleaning mess similar flags usage
>>>>>>>>> have introduced with ITS)
>>>>>>>>>
>>>>>>>>> instead of adding machine property (both class and state),
>>>>>>>>> I'd suggest adding the only property to GPE device (akin to
>>>>>>>>> what we have in x86 world)
>>>>>>>>> And then one can meddle with defaults using hw_compat_xxx
>>>>>>>> no_foo still is a largely used pattern in arm virt: no_ged,
>>>>>>>> kvm_no_adjvtime, no_kvm_steal_time, no_tcg_lpa2, ../.. There are
>>>>>>>> plenty
>>>>>>>> of them and I am not under the impression this is going to be
>>>>>>>> changed.
>>>>>>>>
>>>>>>>> If you refer to 8d23b1df7212 ("hw/arm/virt: Remove
>>>>>>>> VirtMachineClass::no_its field") I think the no_its was removed
>>>>>>>> because
>>>>>>>> the machine it applied was removed.
>>>>>>>>
>>>>>>>> If I understand correctly you would like the prop to be attached
>>>>>>>> to the
>>>>>>>> GED device. However the GED device is internally created by the
>>>>>>>> virt
>>>>>>>> machine code and not passed through a "-device" CLI option. So
>>>>>>>> how would
>>>>>>>> you pass the option on the cmd line if you don't want it to be
>>>>>>>> set by
>>>>>>>> default per machine type?
>>>>>>>>
>>>>>>>> Thanks
>>>>>>>>
>>>>>>>> Eric
>>>>>>>>>       
>>>>>>>>>>            vms->acpi_dev = create_acpi_ged(vms);
>>>>>>>>>>        } else {
>>>>>>>>>> +        vms->acpi_pcihp = false;
>>>>>>>>>>            create_gpio_devices(vms, VIRT_GPIO, sysmem);
>>>>>>>>>>        }
>>>>>>>>>>    @@ -2593,6 +2595,20 @@ static void virt_set_its(Object *obj,
>>>>>>>>>> bool value, Error **errp)
>>>>>>>>>>        vms->its = value;
>>>>>>>>>>    }
>>>>>>>>>>    +static bool virt_get_acpi_pcihp(Object *obj, Error **errp)
>>>>>>>>>> +{
>>>>>>>>>> +    VirtMachineState *vms = VIRT_MACHINE(obj);
>>>>>>>>>> +
>>>>>>>>>> +    return vms->acpi_pcihp;
>>>>>>>>>> +}
>>>>>>>>>> +
>>>>>>>>>> +static void virt_set_acpi_pcihp(Object *obj, bool value,
>>>>>>>>>> Error **errp)
>>>>>>>>>> +{
>>>>>>>>>> +    VirtMachineState *vms = VIRT_MACHINE(obj);
>>>>>>>>>> +
>>>>>>>>>> +    vms->acpi_pcihp = value;
>>>>>>>>>> +}
>>>>>>>>>> +
>>>>>>>>>>    static bool virt_get_dtb_randomness(Object *obj, Error **errp)
>>>>>>>>>>    {
>>>>>>>>>>        VirtMachineState *vms = VIRT_MACHINE(obj);
>>>>>>>>>> @@ -3310,6 +3326,10 @@ static void
>>>>>>>>>> virt_machine_class_init(ObjectClass *oc, const void *data)
>>>>>>>>>>                                              "in ACPI table
>>>>>>>>>> header."
>>>>>>>>>>                                              "The string may be
>>>>>>>>>> up to 8 bytes in size");
>>>>>>>>>>    +    object_class_property_add_bool(oc, "acpi-pcihp",
>>>>>>>>>> +                                   virt_get_acpi_pcihp,
>>>>>>>>>> virt_set_acpi_pcihp);
>>>>>>>>>> +    object_class_property_set_description(oc, "acpi-pcihp",
>>>>>>>>>> +                                          "Force ACPI PCI
>>>>>>>>>> hotplug");
>>>>>>>>>>    }
>>>>>>>>>>      static void virt_instance_init(Object *obj)
>>>>>>>>>> @@ -3344,6 +3364,9 @@ static void virt_instance_init(Object *obj)
>>>>>>>>>>            vms->tcg_its = true;
>>>>>>>>>>        }
>>>>>>>>>>    +    /* default disallows ACPI PCI hotplug */
>>>>>>>>>> +    vms->acpi_pcihp = false;
>>>>>>>>>> +
>>>>>>>>>>        /* Default disallows iommu instantiation */
>>>>>>>>>>        vms->iommu = VIRT_IOMMU_NONE;
>>>>>>>>>>    @@ -3394,8 +3417,12 @@ DEFINE_VIRT_MACHINE_AS_LATEST(10, 1)
>>>>>>>>>>      static void virt_machine_10_0_options(MachineClass *mc)
>>>>>>>>>>    {
>>>>>>>>>> +    VirtMachineClass *vmc =
>>>>>>>>>> VIRT_MACHINE_CLASS(OBJECT_CLASS(mc));
>>>>>>>>>> +
>>>>>>>>>>        virt_machine_10_1_options(mc);
>>>>>>>>>>        compat_props_add(mc->compat_props, hw_compat_10_0,
>>>>>>>>>> hw_compat_10_0_len);
>>>>>>>>>> +    /* 10.0 and earlier do not support ACPI PCI hotplug */
>>>>>>>>>> +    vmc->no_acpi_pcihp = true;
>>>>>>>>>>    }
>>>>>>>>>>    DEFINE_VIRT_MACHINE(10, 0)
>>>>>>>>>>          
>>>>
>>>
>>
> 
