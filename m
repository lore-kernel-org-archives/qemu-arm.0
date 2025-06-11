Received: by 2002:a17:505:ba85:b0:1be9:327d:8ee3 with SMTP id zs5csp1878548njc;
        Wed, 11 Jun 2025 01:50:10 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVjQ0UtWAwXz+tZptsvCksHaNc1HbsqOn1xBZUlweeKNZzrHIKLY+tdZvgL3SbLyb86RCSm22j5OxYqHw==@linaro.org
X-Google-Smtp-Source: AGHT+IF9dbWkbB5sDsLSFJJiGYJhyNhsYO3jBEBry5Aw5km2nQkJRwTd8rHMBMmwxQEqRwpRpyRW
X-Received: by 2002:a05:620a:2956:b0:7cd:c6:40f3 with SMTP id af79cd13be357-7d3a88043camr335408885a.2.1749631810623;
        Wed, 11 Jun 2025 01:50:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1749631810; cv=none;
        d=google.com; s=arc-20240605;
        b=JeRcfaU5iImRkD4BRGOFgBUTtoxqJYXl/o4XOlzx4VA9VZgKbamIxYJKoPmwL9BsbW
         3UeZuGJGRaxVU/uN6wY27yFc4CAKVvckYSiRlA/7BtWimraOuHraF080saMH3UhE787C
         HxqBjRTmL2e4omDin4FNJHkXmobFn8HF3H0RKKNHgWiA5rk6tQtQi7Lg5icfFVDOT6wO
         WGnomY4Da2slzvvuQFIDQoGMr4WFGa0tzIDd5cIQSL5YSril7LGSUsv8sFFLDiNKD7oi
         +E3NmvUd6J6c9PZ0u1vxLIRBmjAZrIberSwBKoO1Lr1bcpkboKkjdpC2qqNw2LztIDm0
         3fBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:reply-to:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=hDAgyDQ1FPwQT/JvUxa0iGEzb5X5Iy/HtN0qD0xoRG4=;
        fh=zzrnRAC0il20XuF0TzwlmigQcDvkYbnSTk26c7sKaRc=;
        b=Col11OalBrEnluS9wmdwL4GlMFZJ43NH3+1opPLZScfm3fDok23zeDqMaEXnFecdbP
         WrYYMZi5aPYFPEeiY+GADOK3+qdg/IzAnyjBqKmWng69wXFR0a9Z3j9YucwU5om33+fT
         vhesZI3etZH1uEs1n9sJlWRCohFGLNrVPHPUCsoeXq9fSA9oyPgxz0OI40few0eqOYRd
         8j/m75i34m6kNv1/cGsb06B70JkZLlNVp1FWUm0+8SkWxqBsA2DvzraX1flT/hyLeCsm
         cHGATvtMIbx8P5jZJFamvxHMHAV/z5cvJWA1cSSXJL0V2yc8nVJdADfMmYfHT3CPS2dH
         CIaw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=IwrhkLIk;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id af79cd13be357-7d25a5f0614si1197043285a.197.2025.06.11.01.50.10
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 01:50:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=IwrhkLIk;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749631810;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hDAgyDQ1FPwQT/JvUxa0iGEzb5X5Iy/HtN0qD0xoRG4=;
	b=IwrhkLIkh3KT5CecI9HU7XduAaYLqzDTY/hw8bw6VMsCP8xoPw5zr3u0nslfNtSvnDo0+z
	w2v0XPLfuHSfDOPvFKyMGwLaySyviXlC9FjyuCL9MjyQTttM4t+FLxQ8bPmgm8UJjzcmrs
	9Y3cvgUioRojBKMXUzeQRVcKFZ/BEEc=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-251-zBWJpjJ7NFOAZnVUBG4LWQ-1; Wed, 11 Jun 2025 04:50:08 -0400
X-MC-Unique: zBWJpjJ7NFOAZnVUBG4LWQ-1
X-Mimecast-MFC-AGG-ID: zBWJpjJ7NFOAZnVUBG4LWQ_1749631808
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-3a3696a0d3aso2666860f8f.2
        for <alex.bennee@linaro.org>; Wed, 11 Jun 2025 01:50:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749631808; x=1750236608;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hDAgyDQ1FPwQT/JvUxa0iGEzb5X5Iy/HtN0qD0xoRG4=;
        b=CJB1xeHFSyM963JqWidClqf7p3A1NbIlFgI+s9zwDoGKfL1LIwMCa4Dr95iDX3SrHx
         ZANe04cHmGHTFdPq6SSJmv3Xv79woGmcS5BHrvt7MLqAC/ENGDP0ftOz7LvQBznxuHPr
         /BM3ecYyGho0JTt0s7M6nA0+6KXp7z5lVwN0fE5mYaeQ5Ztb95cIMUA0jlebFGdhhfV4
         AZX9O73L0ejxpLt2su/tFOr09PHtuzCrzKWr4cWizZltsm0RHR/VngoZhaPXIEFdnkNZ
         llL64Aj1+3bxz3VrAgXH1+l9qH7K2nCDVYK+iO+7ht9ArF5JU+DCSUuGYDGhAionOMiN
         gTtA==
X-Forwarded-Encrypted: i=1; AJvYcCWuyV6F1AVtLb6jBHXle9R+4L19O3hXoNAur0hR/HEhs3P6sNwbKooGxuHycrgqfMvRxuxxg2k0+86YTQ==@linaro.org
X-Gm-Message-State: AOJu0YwZvCE9rXGX4IhsIcWi1IRUwC+uGTOBGmQKwKG6c2zlkujtSMQL
	xotn0LtwoX7JXnySP9YlmNvy7tJBfeQJgfSE7brHRv3Jgw2Ntq4/Iq2jukqxKpxOQh/pbh4ACUo
	HlgvVz95Ax3kKPkuDEkLWaI27UjfaBX2QstYKt6vBAwIktyhbHbFRe9BmRw==
X-Gm-Gg: ASbGncvzKZ+4LP97vhYnXac8J5O5CZERNFGJ2YAK5vx0WG3Mzf7yZZyXuq7kCcYzyfR
	jg1kkVdW/TVdjYzKzdAuvYUaHiwWUdbQGLSqhaxhGu7q8O42powwxMg///Ai6hjsGxwlMyOWRwb
	yBDTc9m/GXpx7OoxbMAPkXGHyh2GeIn3avSqITn3ZRAvKP8gXySrmweOHgfuoEPpaI1JNNJTDi6
	KEtw/DthQa1NhdBQD796PiMyOn50UtyRdxH5vjeWZkvh0H538StyWdzAg1ZYy+ohKmHpzi8k/fk
	nAk8iyayi3FVVQpNTvipXTsE7jQSBlSye0U6XDZ+SxAzwsuAFWzE7w6SzSOkGxxog/GLmQ==
X-Received: by 2002:a05:6000:290f:b0:3a4:e193:e707 with SMTP id ffacd0b85a97d-3a558afde53mr1409427f8f.41.1749631807567;
        Wed, 11 Jun 2025 01:50:07 -0700 (PDT)
X-Received: by 2002:a05:6000:290f:b0:3a4:e193:e707 with SMTP id ffacd0b85a97d-3a558afde53mr1409396f8f.41.1749631807067;
        Wed, 11 Jun 2025 01:50:07 -0700 (PDT)
Return-Path: <eric.auger@redhat.com>
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874? ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a5324638e9sm14406721f8f.89.2025.06.11.01.50.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Jun 2025 01:50:06 -0700 (PDT)
Message-ID: <05680827-85d9-4ebd-91a7-93e262da52f5@redhat.com>
Date: Wed, 11 Jun 2025 10:50:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: eric.auger@redhat.com
Subject: Re: [PATCH v2 02/25] hw/arm/virt: Introduce machine state acpi pcihp
 flags and props
To: Igor Mammedov <imammedo@redhat.com>
Cc: eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 peter.maydell@linaro.org, gustavo.romero@linaro.org, anisinha@redhat.com,
 mst@redhat.com, shannon.zhaosl@gmail.com, pbonzini@redhat.com,
 Jonathan.Cameron@huawei.com, philmd@linaro.org, alex.bennee@linaro.org
References: <20250527074224.1197793-1-eric.auger@redhat.com>
 <20250527074224.1197793-3-eric.auger@redhat.com>
 <20250527135813.2d6cde91@imammedo.users.ipa.redhat.com>
 <d6bd4794-bcee-4701-8e63-4adee91120d9@redhat.com>
 <20250528123325.750529a4@imammedo.users.ipa.redhat.com>
 <13792b72-d336-41b8-8ac7-8790e10f833c@redhat.com>
 <20250611104511.55152616@imammedo.users.ipa.redhat.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20250611104511.55152616@imammedo.users.ipa.redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: kRokZ68P-LpRuRGmD7qUlOfTiIWLPtkv8p2m5qJuihk_1749631808
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TUID: royb2n55qeBw

Hi Igor,
On 6/11/25 10:45 AM, Igor Mammedov wrote:
> On Wed, 11 Jun 2025 08:53:28 +0200
> Eric Auger <eric.auger@redhat.com> wrote:
>
>> Hi Gustavo, Alex,
>>
>> On 5/28/25 12:33 PM, Igor Mammedov wrote:
>>> On Tue, 27 May 2025 15:54:15 +0200
>>> Eric Auger <eric.auger@redhat.com> wrote:
>>>  
>>>> Hi Igor,
>>>>
>>>> On 5/27/25 1:58 PM, Igor Mammedov wrote:  
>>>>> On Tue, 27 May 2025 09:40:04 +0200
>>>>> Eric Auger <eric.auger@redhat.com> wrote:
>>>>>    
>>>>>> acpi_pcihp VirtMachineClass state flag will allow
>>>>>> to opt in for acpi pci hotplug. This is guarded by a
>>>>>> class no_acpi_pcihp flag to manage compats (<= 10.0
>>>>>> machine types will not support ACPI PCI hotplug).    
>>>>> there is no reason to put an effort in force disabling it
>>>>> on old machines, as long as code works when explicitly
>>>>> enabled property on CLI.
>>>>>
>>>>> See comment below on how to deal with it 
>>>>>    
>>>>>> Machine state acpi_pcihp flag must be set before the creation
>>>>>> of the GED device which will use it.
>>>>>>
>>>>>> Currently the ACPI PCI HP is turned off by default. This will
>>>>>> change later on for 10.1 machine type.    
>>>>> one thing to note, is that turning it on by default might
>>>>> cause change of NIC naming in guest as this brings in
>>>>> new "_Sxx" slot naming. /so configs tied to nic  go down the drain/
>>>>>
>>>>> Naming, we have, also happens to be broken wrt spec
>>>>> (it should be unique system wide, there was a gitlab issue for that,
>>>>> there is no easy fix that though)
>>>>>
>>>>> So I'd leave it disabled by default and let users to turn
>>>>> it on explicitly when needed.     
>>>> what is the status on q35, isn't it enabled by default? If so why
>>>> wouldn't we want the same setting on ARM? Is that because of the known
>>>> issue you report above?  
>>> Above issue is not a blocker (for thae lack of a good way to fix it)
>>>
>>> on q35 we have had a few complains and fixes, after pcihp was promoted
>>> to default (so hopefully that won't happen on with ARM). Also given
>>> that ARM VM is less popular like hood breaking someone setup is even less.
>>>
>>> That said I'd be cautions keep native hotplug as default,
>>> and only ones who need ACPI one, could turn it on explicitly.
>>>
>>> But well it's policies, so it's up to you ARM folks to decide what
>>> virt board should look like.  
>> What is your preference? Do you prefer enabling ACPI PCI HP by default
>> or the opposite.
> I'd prefer native PCIe hotplug being default,
> that way we have less chance of causing regressions not to mention
> less complexity (as acpi pcihp adds up quite a bit of it).
>
> And ones who want/need acpi-pcihp/acpi-index can enable it explicitly,
> to play with.

OK I will follow your suggestion. You have definitively more expertise
than me here ! ;-)

Thanks!

Eric
>
>> Anybody else?
>>
>> On my end I think I would prefer to have the same default setting than
>> on x86 (ie. ACPI PCI hotplug set by default) but I have no strong
>> opinion either.
>>
>> Thanks
>>
>> Eric
>>>  
>>>> The no_foo compat stuff was especially introduced to avoid breaking the
>>>> guest ABI for old machine types (like the NIC naming alternation you evoke).  
>>> no_foo is just another way to handle compat stuff,
>>> and when it's more than one knob per feature it gets ugly really fast.
>>> Hence, I'd prefer pcihp done in x86 way aka:
>>>    hw_compat_OLD(ged.use_acpi_hotplug_bridge, false|true)
>>> to manage presence of ACPI hotplug on desired machine version.
>>> Side benefit it's consistent with how pcihp works on x86
>>>  
>>>>>    
>>>>>> We also introduce properties to allow disabling it.
>>>>>>
>>>>>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>>>>>> Reviewed-by: Gustavo Romero <gustavo.romero@linaro.org>
>>>>>> ---
>>>>>>  include/hw/arm/virt.h |  2 ++
>>>>>>  hw/arm/virt.c         | 27 +++++++++++++++++++++++++++
>>>>>>  2 files changed, 29 insertions(+)
>>>>>>
>>>>>> diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
>>>>>> index 9a1b0f53d2..10ea581f06 100644
>>>>>> --- a/include/hw/arm/virt.h
>>>>>> +++ b/include/hw/arm/virt.h
>>>>>> @@ -129,6 +129,7 @@ struct VirtMachineClass {
>>>>>>      bool no_tcg_lpa2;
>>>>>>      bool no_ns_el2_virt_timer_irq;
>>>>>>      bool no_nested_smmu;
>>>>>> +    bool no_acpi_pcihp;
>>>>>>  };
>>>>>>  
>>>>>>  struct VirtMachineState {
>>>>>> @@ -150,6 +151,7 @@ struct VirtMachineState {
>>>>>>      bool mte;
>>>>>>      bool dtb_randomness;
>>>>>>      bool second_ns_uart_present;
>>>>>> +    bool acpi_pcihp;
>>>>>>      OnOffAuto acpi;
>>>>>>      VirtGICType gic_version;
>>>>>>      VirtIOMMUType iommu;
>>>>>> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
>>>>>> index 9a6cd085a3..a0deeaf2b3 100644
>>>>>> --- a/hw/arm/virt.c
>>>>>> +++ b/hw/arm/virt.c
>>>>>> @@ -2397,8 +2397,10 @@ static void machvirt_init(MachineState *machine)
>>>>>>      create_pcie(vms);
>>>>>>  
>>>>>>      if (has_ged && aarch64 && firmware_loaded && virt_is_acpi_enabled(vms)) {
>>>>>> +        vms->acpi_pcihp &= !vmc->no_acpi_pcihp;    
>>>>> I don't particularly like no_foo naming as it makes code harder to read
>>>>> and combined with 'duplicated' field in machine state it make even things worse.
>>>>> (if I recall right Philippe was cleaning mess similar flags usage
>>>>> have introduced with ITS)
>>>>>
>>>>> instead of adding machine property (both class and state),
>>>>> I'd suggest adding the only property to GPE device (akin to what we have in x86 world)
>>>>> And then one can meddle with defaults using hw_compat_xxx    
>>>> no_foo still is a largely used pattern in arm virt: no_ged,
>>>> kvm_no_adjvtime, no_kvm_steal_time, no_tcg_lpa2, ../.. There are plenty
>>>> of them and I am not under the impression this is going to be changed.
>>>>
>>>> If you refer to 8d23b1df7212 ("hw/arm/virt: Remove
>>>> VirtMachineClass::no_its field") I think the no_its was removed because
>>>> the machine it applied was removed.
>>>>
>>>> If I understand correctly you would like the prop to be attached to the
>>>> GED device. However the GED device is internally created by the virt
>>>> machine code and not passed through a "-device" CLI option. So how would
>>>> you pass the option on the cmd line if you don't want it to be set by
>>>> default per machine type?
>>>>
>>>> Thanks
>>>>
>>>> Eric  
>>>>>    
>>>>>>          vms->acpi_dev = create_acpi_ged(vms);
>>>>>>      } else {
>>>>>> +        vms->acpi_pcihp = false;
>>>>>>          create_gpio_devices(vms, VIRT_GPIO, sysmem);
>>>>>>      }
>>>>>>  
>>>>>> @@ -2593,6 +2595,20 @@ static void virt_set_its(Object *obj, bool value, Error **errp)
>>>>>>      vms->its = value;
>>>>>>  }
>>>>>>  
>>>>>> +static bool virt_get_acpi_pcihp(Object *obj, Error **errp)
>>>>>> +{
>>>>>> +    VirtMachineState *vms = VIRT_MACHINE(obj);
>>>>>> +
>>>>>> +    return vms->acpi_pcihp;
>>>>>> +}
>>>>>> +
>>>>>> +static void virt_set_acpi_pcihp(Object *obj, bool value, Error **errp)
>>>>>> +{
>>>>>> +    VirtMachineState *vms = VIRT_MACHINE(obj);
>>>>>> +
>>>>>> +    vms->acpi_pcihp = value;
>>>>>> +}
>>>>>> +
>>>>>>  static bool virt_get_dtb_randomness(Object *obj, Error **errp)
>>>>>>  {
>>>>>>      VirtMachineState *vms = VIRT_MACHINE(obj);
>>>>>> @@ -3310,6 +3326,10 @@ static void virt_machine_class_init(ObjectClass *oc, const void *data)
>>>>>>                                            "in ACPI table header."
>>>>>>                                            "The string may be up to 8 bytes in size");
>>>>>>  
>>>>>> +    object_class_property_add_bool(oc, "acpi-pcihp",
>>>>>> +                                   virt_get_acpi_pcihp, virt_set_acpi_pcihp);
>>>>>> +    object_class_property_set_description(oc, "acpi-pcihp",
>>>>>> +                                          "Force ACPI PCI hotplug");
>>>>>>  }
>>>>>>  
>>>>>>  static void virt_instance_init(Object *obj)
>>>>>> @@ -3344,6 +3364,9 @@ static void virt_instance_init(Object *obj)
>>>>>>          vms->tcg_its = true;
>>>>>>      }
>>>>>>  
>>>>>> +    /* default disallows ACPI PCI hotplug */
>>>>>> +    vms->acpi_pcihp = false;
>>>>>> +
>>>>>>      /* Default disallows iommu instantiation */
>>>>>>      vms->iommu = VIRT_IOMMU_NONE;
>>>>>>  
>>>>>> @@ -3394,8 +3417,12 @@ DEFINE_VIRT_MACHINE_AS_LATEST(10, 1)
>>>>>>  
>>>>>>  static void virt_machine_10_0_options(MachineClass *mc)
>>>>>>  {
>>>>>> +    VirtMachineClass *vmc = VIRT_MACHINE_CLASS(OBJECT_CLASS(mc));
>>>>>> +
>>>>>>      virt_machine_10_1_options(mc);
>>>>>>      compat_props_add(mc->compat_props, hw_compat_10_0, hw_compat_10_0_len);
>>>>>> +    /* 10.0 and earlier do not support ACPI PCI hotplug */
>>>>>> +    vmc->no_acpi_pcihp = true;
>>>>>>  }
>>>>>>  DEFINE_VIRT_MACHINE(10, 0)
>>>>>>      
