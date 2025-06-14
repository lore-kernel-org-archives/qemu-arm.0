Received: by 2002:a17:504:5d2c:b0:1be9:327d:8ee3 with SMTP id et12csp726219njc;
        Sat, 14 Jun 2025 01:04:40 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXGTRIogmGfMzeGMexro7yio568Mzn7W1bxg/vOM7dGMtWyOnAt2ylp8V++92U5cPiSjVnZShOHYd8z3g==@linaro.org
X-Google-Smtp-Source: AGHT+IEOw8KKtxsx/GVcKC3K+EvJd48Rp8T3pSW6y1X3p++xLwmN5X7fpEKoSmhw7HJpYwW2dONg
X-Received: by 2002:ac8:5e51:0:b0:4a4:2d7a:994b with SMTP id d75a77b69052e-4a73c4e3fb5mr35461341cf.19.1749888280007;
        Sat, 14 Jun 2025 01:04:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1749888279; cv=none;
        d=google.com; s=arc-20240605;
        b=XTCXPSFoh7+zB4vvwmGh/fWIPmslCUJuYWfoitfWltIJalPMXocJWVT01k6hI0AP1n
         cxCNML6HrtVQGK88Aw3Z2BCzl4BcQDCPdic62t+LdG0QLr+t5qLOJgiWQT1TeqAUKlTj
         dsY6hcHffuk+E5lRCAfyqAP2zfyYdX8ZeSZEfRE0OoNlJuFMM7tTlAo5qo2kvtUWa92J
         GRXog+mJTa+ODfLKXcAypKJSqsydNzu9QOqYU9MU2RyGUY9nWYI5l95GdQGVphcvabW2
         Hgbgg6C3gTvntH3qVqFIFo04ul3hLw03wg4N/U6lC1FpqEsTBXsS6IlWfgiA/XgcAVkb
         hopg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:reply-to:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=quBHQzsQem/XF62Zr/4dmc1YVeS0Mg9dFNrFk05N+ds=;
        fh=qPokA39GK0wsHb265FVO3u/WvmDbAkZnLJszwbl/45k=;
        b=E5ROVR/sMQqrAB0ovNPKxziXHVrcopibDxCPVDn8W4MwnukGBNk1oZKQNqL7e1ECjr
         WI6hrBBk4ZqIT2R5xJbgURVB+Drqe2KEaQeynU89R9e0zd+OE6i9ckmgJRcOflGAv2S5
         0XVX6EbRyTXKDEjWt+/9EYDSph6wFUBpZztky6i3l2OEytzuj/5NVox4t1AEJQKApr0s
         4AeqN/2vTeXAwdHQNBOcUbwckjKjdbZGUZFYhLBzXyH+iE6Tjcw/EAn4K2yc7hXOnjwr
         euLNBHUyYDnH8hVQaAUgZranRgC2rUTldjyasO5M6pdzud+CYhBAOU1Wi+3ch9UcMSeC
         3mfg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=AadXL+Oj;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id d75a77b69052e-4a72a2b8b80si53186431cf.10.2025.06.14.01.04.39
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Jun 2025 01:04:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=AadXL+Oj;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749888279;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=quBHQzsQem/XF62Zr/4dmc1YVeS0Mg9dFNrFk05N+ds=;
	b=AadXL+OjFqsZlQAA/Jb9kmDo0a70najVNiewOJGIWju+ALPOnQi1xl/pNawL+tDltMYQlp
	0/Ws/jNNC/2Cv77G7m6H4pW67Dl6Z8FqGG9hpVTBRfJoCRLNaaHUAc2g7U74Hxf7CpLoKE
	O28HhlK0+BItYq0zSBQhq/2wnAt7HBA=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-131-kqZbREY0Pfu8mGl3H9ykZg-1; Sat, 14 Jun 2025 04:04:38 -0400
X-MC-Unique: kqZbREY0Pfu8mGl3H9ykZg-1
X-Mimecast-MFC-AGG-ID: kqZbREY0Pfu8mGl3H9ykZg_1749888277
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3a4eeed54c2so1833972f8f.3
        for <alex.bennee@linaro.org>; Sat, 14 Jun 2025 01:04:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749888277; x=1750493077;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=quBHQzsQem/XF62Zr/4dmc1YVeS0Mg9dFNrFk05N+ds=;
        b=Fz/0Bgo2ihM4mtn0avk14yjHjse/hnht5qkQlzc74OS7yIcygLKq4UlFW6HcgGEhZk
         nYlZ9zwbq527gt8oV+U7610/bPArRbrKym2/acdZXQL9LPvAJ4Jfy3TpmtPfswDvNINr
         0JqXXW4sOPaz4bLsukv8QL3/86n2oITgwFuhrNF+7otZdvfHuXWfRdE/09QBQyHnINRK
         pSbL3i97gCegw+DhPeMiWQ6toA/jWVRDiLfgVUt4sXXY8TYqFaGoOxIFWxoT9nvTGoR7
         gDXj+e4rDSnaN37xgFIeITcdB4TAkn5jKhg+WXuUcZuMs/RmOAvagJZPhDUXApcgzKOG
         pusA==
X-Forwarded-Encrypted: i=1; AJvYcCViy9u8kpYbA6Y1418Dom2T57tUk/gMKB47Nf4XHjmK0R+Ps9jYIMPn9e7/JmdZdRBSSgg1ljl2et1LVA==@linaro.org
X-Gm-Message-State: AOJu0YwcCIxGHNiVX7nUHf6wyifMMVOOpMq++LHu+2DXI3xDmzMae/0j
	chKfAlXatorUsBV29s3j1Ei97FPuCTarQIEajMg5Z6um9mNtItK99fVE+Z6RdDjPYKZpI07AiVk
	qMpLmb2M+1uBVdISeNreMBY7mdODqKJQIRsYpAmaehLVeZQg3G8mqPEz0wQ==
X-Gm-Gg: ASbGnct7Q8WiC5JObYEnp8nFG5NkKtdEkKZbgvnE9F2W1UNaVsZ9x/W3QchIOYiziYV
	+ja7RBMlDwGApo2PBR8ZK19cWA8K8Rjl2ZOfGFWi84UW5jRXvLgEIWW98uLC880KHUDMr2Taj8X
	9WACan8dCsblcyVlK/VApIBU2YC8meWf1MGuW/aE/Ti8dtT3p3qVQPH2Yj9cPQUDVxcsFzKp1m7
	3dadnQK0gh1oKsZzop/Z7FC6q/4AMp29r/Q3XYp9Kt8tygY1ZUzopH5KoaeBN4FQB55d8r416c+
	LfmnMgzbq1K2I6wWqhY9aKltXczq4XDZitTOs+BmTVN248TFWLr+7yaNcp+nuDzuSWzWKA==
X-Received: by 2002:a05:6000:250c:b0:399:6dd9:9f40 with SMTP id ffacd0b85a97d-3a5723678b8mr2795410f8f.9.1749888276605;
        Sat, 14 Jun 2025 01:04:36 -0700 (PDT)
X-Received: by 2002:a05:6000:250c:b0:399:6dd9:9f40 with SMTP id ffacd0b85a97d-3a5723678b8mr2795383f8f.9.1749888275859;
        Sat, 14 Jun 2025 01:04:35 -0700 (PDT)
Return-Path: <eric.auger@redhat.com>
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874? ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532e14f283sm76210245e9.27.2025.06.14.01.04.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 14 Jun 2025 01:04:34 -0700 (PDT)
Message-ID: <3b01fa8d-7070-4aa6-9295-7ef2b6c1119c@redhat.com>
Date: Sat, 14 Jun 2025 10:04:32 +0200
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
 <46cb9903-7a00-4e43-9b0e-03707e4952d3@redhat.com>
 <6ab0ae5e-5763-46a8-9f73-ee81a18bd8de@linaro.org>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <6ab0ae5e-5763-46a8-9f73-ee81a18bd8de@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: BZHTYruEnprw5w3E9pD2rOkPVEXcILFll2_--gqVtOc_1749888277
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: zNDR4ebTEFNn

Hi Gustavo,

On 6/13/25 3:39 PM, Gustavo Romero wrote:
> Hi Eric,
>
> On 6/13/25 02:05, Eric Auger wrote:
>> Hi Gustavo,
>>
>> On 6/13/25 5:01 AM, Gustavo Romero wrote:
>>> Hi Eric,
>>>
>>> On 6/12/25 09:55, Igor Mammedov wrote:
>>>> On Wed, 11 Jun 2025 10:50:04 +0200
>>>> Eric Auger <eric.auger@redhat.com> wrote:
>>>>
>>>>> Hi Igor,
>>>>> On 6/11/25 10:45 AM, Igor Mammedov wrote:
>>>>>> On Wed, 11 Jun 2025 08:53:28 +0200
>>>>>> Eric Auger <eric.auger@redhat.com> wrote:
>>>>>>  
>>>>>>> Hi Gustavo, Alex,
>>>>>>>
>>>>>>> On 5/28/25 12:33 PM, Igor Mammedov wrote:
>>>>>>>> On Tue, 27 May 2025 15:54:15 +0200
>>>>>>>> Eric Auger <eric.auger@redhat.com> wrote:
>>>>>>>>    
>>>>>>>>> Hi Igor,
>>>>>>>>>
>>>>>>>>> On 5/27/25 1:58 PM, Igor Mammedov wrote:
>>>>>>>>>> On Tue, 27 May 2025 09:40:04 +0200
>>>>>>>>>> Eric Auger <eric.auger@redhat.com> wrote:
>>>>>>>>>>      
>>>>>>>>>>> acpi_pcihp VirtMachineClass state flag will allow
>>>>>>>>>>> to opt in for acpi pci hotplug. This is guarded by a
>>>>>>>>>>> class no_acpi_pcihp flag to manage compats (<= 10.0
>>>>>>>>>>> machine types will not support ACPI PCI hotplug).
>>>>>>>>>> there is no reason to put an effort in force disabling it
>>>>>>>>>> on old machines, as long as code works when explicitly
>>>>>>>>>> enabled property on CLI.
>>>>>>>>>>
>>>>>>>>>> See comment below on how to deal with it
>>>>>>>>>>      
>>>>>>>>>>> Machine state acpi_pcihp flag must be set before the creation
>>>>>>>>>>> of the GED device which will use it.
>>>>>>>>>>>
>>>>>>>>>>> Currently the ACPI PCI HP is turned off by default. This will
>>>>>>>>>>> change later on for 10.1 machine type.
>>>>>>>>>> one thing to note, is that turning it on by default might
>>>>>>>>>> cause change of NIC naming in guest as this brings in
>>>>>>>>>> new "_Sxx" slot naming. /so configs tied to nic  go down the
>>>>>>>>>> drain/
>>>>>>>>>>
>>>>>>>>>> Naming, we have, also happens to be broken wrt spec
>>>>>>>>>> (it should be unique system wide, there was a gitlab issue for
>>>>>>>>>> that,
>>>>>>>>>> there is no easy fix that though)
>>>>>>>>>>
>>>>>>>>>> So I'd leave it disabled by default and let users to turn
>>>>>>>>>> it on explicitly when needed.
>>>>>>>>> what is the status on q35, isn't it enabled by default? If so why
>>>>>>>>> wouldn't we want the same setting on ARM? Is that because of the
>>>>>>>>> known
>>>>>>>>> issue you report above?
>>>>>>>> Above issue is not a blocker (for thae lack of a good way to
>>>>>>>> fix it)
>>>>>>>>
>>>>>>>> on q35 we have had a few complains and fixes, after pcihp was
>>>>>>>> promoted
>>>>>>>> to default (so hopefully that won't happen on with ARM). Also
>>>>>>>> given
>>>>>>>> that ARM VM is less popular like hood breaking someone setup is
>>>>>>>> even less.
>>>>>>>>
>>>>>>>> That said I'd be cautions keep native hotplug as default,
>>>>>>>> and only ones who need ACPI one, could turn it on explicitly.
>>>>>>>>
>>>>>>>> But well it's policies, so it's up to you ARM folks to decide what
>>>>>>>> virt board should look like.
>>>>>>> What is your preference? Do you prefer enabling ACPI PCI HP by
>>>>>>> default
>>>>>>> or the opposite.
>>>>>> I'd prefer native PCIe hotplug being default,
>>>>>> that way we have less chance of causing regressions not to mention
>>>>>> less complexity (as acpi pcihp adds up quite a bit of it).
>>>>>>
>>>>>> And ones who want/need acpi-pcihp/acpi-index can enable it
>>>>>> explicitly,
>>>>>> to play with.
>>>>>
>>>>> OK I will follow your suggestion. You have definitively more
>>>>> expertise
>>>>> than me here ! ;-)
>>>>
>>>> So far what I suggest looks like better option compared to multiple
>>>> machine knobs
>>>> fiddling. But I can easily change my mind once I see respin, if
>>>> experiment
>>>> with compat props is not coming well together.
>>>
>>> For now, I think it's okay to let ACPI PCI hotplug stabilize (while
>>> not being the
>>> default) for at least one release cycle. So I'm fine with keeping
>>> acpi-pcihp=off as
>>> the default.
>>>
>>> As I mentioned elsewhere, I don't consider native PCIe hotplug to be
>>> legacy.
>>>
>>> We can make acpi-pcihp=on the default in a future release once it's
>>> been more
>>> widely exercised.
>>>
>>> I'll update the bios-tables-test.c test accordingly, then you can
>>> either put them
>>> in the v3 (if you happen to send v3 next week) or add them to a v4.
>>
>> OK thank you for the confirmation. So following Igor's suggestion I
>> indeed kept the current default value (legacy PCIe hotplug) and I don't
>
> _native_ PCIe hotplug? :)
yes!
>
>
>> use a machine option anymore. Instead I use the x86 trick, ie.
>>
>> -global acpi-ged.acpi-pci-hotplug-with-bridge-support=on
>
> hm but why you don't keep the machine option "acpi-pcihp" and just don't
> set it as "on" by default? I find global options like that a tad
> difficult
> to follow, feels indeed like a trick. Also, I don't like much not
> mentioning GPEX in the option name (and only the event notification
> device, "ged).
>
> Am I missing something why a global would work better than a machine
> option
> when the default is the native PCIe hotplug?
I am just following Igor's suggestion at the moment. According to Igor
the benefit is that it looks exactly the same as x86 integration (which
would ease libvirt integration) and it is also reusable with microvm.

Anyway if reviewers are not happy with the end result I will revert ;-)

Thanks

Eric
>
>
>> I can easily update your tests with that option, don't bother
>> respinning. I should be able to send the v3 by beginning of next week.
>
> Got it! Thanks.
>
>
> Cheers,
> Gustavo
>
>> Thanks!
>>
>> Eric
>>
>>>
>>>
>>> Cheers,
>>> Gustavo
>>>
>>>>> Thanks!
>>>>>
>>>>> Eric
>>>>>>  
>>>>>>> Anybody else?
>>>>>>>
>>>>>>> On my end I think I would prefer to have the same default setting
>>>>>>> than
>>>>>>> on x86 (ie. ACPI PCI hotplug set by default) but I have no strong
>>>>>>> opinion either.
>>>>>>>
>>>>>>> Thanks
>>>>>>>
>>>>>>> Eric
>>>>>>>>    
>>>>>>>>> The no_foo compat stuff was especially introduced to avoid
>>>>>>>>> breaking the
>>>>>>>>> guest ABI for old machine types (like the NIC naming alternation
>>>>>>>>> you evoke).
>>>>>>>> no_foo is just another way to handle compat stuff,
>>>>>>>> and when it's more than one knob per feature it gets ugly really
>>>>>>>> fast.
>>>>>>>> Hence, I'd prefer pcihp done in x86 way aka:
>>>>>>>>      hw_compat_OLD(ged.use_acpi_hotplug_bridge, false|true)
>>>>>>>> to manage presence of ACPI hotplug on desired machine version.
>>>>>>>> Side benefit it's consistent with how pcihp works on x86
>>>>>>>>    
>>>>>>>>>>      
>>>>>>>>>>> We also introduce properties to allow disabling it.
>>>>>>>>>>>
>>>>>>>>>>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>>>>>>>>>>> Reviewed-by: Gustavo Romero <gustavo.romero@linaro.org>
>>>>>>>>>>> ---
>>>>>>>>>>>    include/hw/arm/virt.h |  2 ++
>>>>>>>>>>>    hw/arm/virt.c         | 27 +++++++++++++++++++++++++++
>>>>>>>>>>>    2 files changed, 29 insertions(+)
>>>>>>>>>>>
>>>>>>>>>>> diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
>>>>>>>>>>> index 9a1b0f53d2..10ea581f06 100644
>>>>>>>>>>> --- a/include/hw/arm/virt.h
>>>>>>>>>>> +++ b/include/hw/arm/virt.h
>>>>>>>>>>> @@ -129,6 +129,7 @@ struct VirtMachineClass {
>>>>>>>>>>>        bool no_tcg_lpa2;
>>>>>>>>>>>        bool no_ns_el2_virt_timer_irq;
>>>>>>>>>>>        bool no_nested_smmu;
>>>>>>>>>>> +    bool no_acpi_pcihp;
>>>>>>>>>>>    };
>>>>>>>>>>>      struct VirtMachineState {
>>>>>>>>>>> @@ -150,6 +151,7 @@ struct VirtMachineState {
>>>>>>>>>>>        bool mte;
>>>>>>>>>>>        bool dtb_randomness;
>>>>>>>>>>>        bool second_ns_uart_present;
>>>>>>>>>>> +    bool acpi_pcihp;
>>>>>>>>>>>        OnOffAuto acpi;
>>>>>>>>>>>        VirtGICType gic_version;
>>>>>>>>>>>        VirtIOMMUType iommu;
>>>>>>>>>>> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
>>>>>>>>>>> index 9a6cd085a3..a0deeaf2b3 100644
>>>>>>>>>>> --- a/hw/arm/virt.c
>>>>>>>>>>> +++ b/hw/arm/virt.c
>>>>>>>>>>> @@ -2397,8 +2397,10 @@ static void machvirt_init(MachineState
>>>>>>>>>>> *machine)
>>>>>>>>>>>        create_pcie(vms);
>>>>>>>>>>>          if (has_ged && aarch64 && firmware_loaded &&
>>>>>>>>>>> virt_is_acpi_enabled(vms)) {
>>>>>>>>>>> +        vms->acpi_pcihp &= !vmc->no_acpi_pcihp;
>>>>>>>>>> I don't particularly like no_foo naming as it makes code harder
>>>>>>>>>> to read
>>>>>>>>>> and combined with 'duplicated' field in machine state it make
>>>>>>>>>> even things worse.
>>>>>>>>>> (if I recall right Philippe was cleaning mess similar flags
>>>>>>>>>> usage
>>>>>>>>>> have introduced with ITS)
>>>>>>>>>>
>>>>>>>>>> instead of adding machine property (both class and state),
>>>>>>>>>> I'd suggest adding the only property to GPE device (akin to
>>>>>>>>>> what we have in x86 world)
>>>>>>>>>> And then one can meddle with defaults using hw_compat_xxx
>>>>>>>>> no_foo still is a largely used pattern in arm virt: no_ged,
>>>>>>>>> kvm_no_adjvtime, no_kvm_steal_time, no_tcg_lpa2, ../.. There are
>>>>>>>>> plenty
>>>>>>>>> of them and I am not under the impression this is going to be
>>>>>>>>> changed.
>>>>>>>>>
>>>>>>>>> If you refer to 8d23b1df7212 ("hw/arm/virt: Remove
>>>>>>>>> VirtMachineClass::no_its field") I think the no_its was removed
>>>>>>>>> because
>>>>>>>>> the machine it applied was removed.
>>>>>>>>>
>>>>>>>>> If I understand correctly you would like the prop to be attached
>>>>>>>>> to the
>>>>>>>>> GED device. However the GED device is internally created by the
>>>>>>>>> virt
>>>>>>>>> machine code and not passed through a "-device" CLI option. So
>>>>>>>>> how would
>>>>>>>>> you pass the option on the cmd line if you don't want it to be
>>>>>>>>> set by
>>>>>>>>> default per machine type?
>>>>>>>>>
>>>>>>>>> Thanks
>>>>>>>>>
>>>>>>>>> Eric
>>>>>>>>>>      
>>>>>>>>>>>            vms->acpi_dev = create_acpi_ged(vms);
>>>>>>>>>>>        } else {
>>>>>>>>>>> +        vms->acpi_pcihp = false;
>>>>>>>>>>>            create_gpio_devices(vms, VIRT_GPIO, sysmem);
>>>>>>>>>>>        }
>>>>>>>>>>>    @@ -2593,6 +2595,20 @@ static void virt_set_its(Object *obj,
>>>>>>>>>>> bool value, Error **errp)
>>>>>>>>>>>        vms->its = value;
>>>>>>>>>>>    }
>>>>>>>>>>>    +static bool virt_get_acpi_pcihp(Object *obj, Error **errp)
>>>>>>>>>>> +{
>>>>>>>>>>> +    VirtMachineState *vms = VIRT_MACHINE(obj);
>>>>>>>>>>> +
>>>>>>>>>>> +    return vms->acpi_pcihp;
>>>>>>>>>>> +}
>>>>>>>>>>> +
>>>>>>>>>>> +static void virt_set_acpi_pcihp(Object *obj, bool value,
>>>>>>>>>>> Error **errp)
>>>>>>>>>>> +{
>>>>>>>>>>> +    VirtMachineState *vms = VIRT_MACHINE(obj);
>>>>>>>>>>> +
>>>>>>>>>>> +    vms->acpi_pcihp = value;
>>>>>>>>>>> +}
>>>>>>>>>>> +
>>>>>>>>>>>    static bool virt_get_dtb_randomness(Object *obj, Error
>>>>>>>>>>> **errp)
>>>>>>>>>>>    {
>>>>>>>>>>>        VirtMachineState *vms = VIRT_MACHINE(obj);
>>>>>>>>>>> @@ -3310,6 +3326,10 @@ static void
>>>>>>>>>>> virt_machine_class_init(ObjectClass *oc, const void *data)
>>>>>>>>>>>                                              "in ACPI table
>>>>>>>>>>> header."
>>>>>>>>>>>                                              "The string may be
>>>>>>>>>>> up to 8 bytes in size");
>>>>>>>>>>>    +    object_class_property_add_bool(oc, "acpi-pcihp",
>>>>>>>>>>> +                                   virt_get_acpi_pcihp,
>>>>>>>>>>> virt_set_acpi_pcihp);
>>>>>>>>>>> +    object_class_property_set_description(oc, "acpi-pcihp",
>>>>>>>>>>> +                                          "Force ACPI PCI
>>>>>>>>>>> hotplug");
>>>>>>>>>>>    }
>>>>>>>>>>>      static void virt_instance_init(Object *obj)
>>>>>>>>>>> @@ -3344,6 +3364,9 @@ static void virt_instance_init(Object
>>>>>>>>>>> *obj)
>>>>>>>>>>>            vms->tcg_its = true;
>>>>>>>>>>>        }
>>>>>>>>>>>    +    /* default disallows ACPI PCI hotplug */
>>>>>>>>>>> +    vms->acpi_pcihp = false;
>>>>>>>>>>> +
>>>>>>>>>>>        /* Default disallows iommu instantiation */
>>>>>>>>>>>        vms->iommu = VIRT_IOMMU_NONE;
>>>>>>>>>>>    @@ -3394,8 +3417,12 @@ DEFINE_VIRT_MACHINE_AS_LATEST(10, 1)
>>>>>>>>>>>      static void virt_machine_10_0_options(MachineClass *mc)
>>>>>>>>>>>    {
>>>>>>>>>>> +    VirtMachineClass *vmc =
>>>>>>>>>>> VIRT_MACHINE_CLASS(OBJECT_CLASS(mc));
>>>>>>>>>>> +
>>>>>>>>>>>        virt_machine_10_1_options(mc);
>>>>>>>>>>>        compat_props_add(mc->compat_props, hw_compat_10_0,
>>>>>>>>>>> hw_compat_10_0_len);
>>>>>>>>>>> +    /* 10.0 and earlier do not support ACPI PCI hotplug */
>>>>>>>>>>> +    vmc->no_acpi_pcihp = true;
>>>>>>>>>>>    }
>>>>>>>>>>>    DEFINE_VIRT_MACHINE(10, 0)
>>>>>>>>>>>          
>>>>>
>>>>
>>>
>>
>
