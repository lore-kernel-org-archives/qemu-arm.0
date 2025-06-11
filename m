Received: by 2002:a17:505:ba85:b0:1be9:327d:8ee3 with SMTP id zs5csp1836891njc;
        Tue, 10 Jun 2025 23:53:33 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWD6xeh3/khdgPrByichpvVj7k4b+Nm0eHRuPThrMjaRMv9KPv8xUoHfervZqdhRf51v840ENMFVITAKw==@linaro.org
X-Google-Smtp-Source: AGHT+IEIElxfbBFogf8VJWlWLJ5PAFdd9omktwCneIE62lT6l1267+BVE9831qlADBUEU4wy20XD
X-Received: by 2002:a05:622a:2304:b0:4a4:313a:e0a3 with SMTP id d75a77b69052e-4a713c3b8fcmr40668981cf.29.1749624813549;
        Tue, 10 Jun 2025 23:53:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1749624813; cv=none;
        d=google.com; s=arc-20240605;
        b=YXrRKaSvaN9+aRKHILPcEq2O8SX5SXGGOlUCgQ2OYV03EAXEiFQcpsqhKt9DUy18Np
         9k4Zg1Z6ihxp8J0FleUQgaf2cEPzxyoTp3YEmboG3la6p2/z/wOuPmmCJOTo7MuKOIZ0
         YMJ1PH4Na/3BVzMnvhSWLosqwevwd8rEFHJEi3fFl6scKcQgdyl5DseQvlsf40FoA6BP
         5H7aT22ubkz2DYH/vhOZyzK8lXCf0YFPszvH6zFdmss/f3wpr88GDkoR6oHvZDaRJpbU
         TG2RqqIGI1fSmAp8KNhttttp87UV9DrmdJur4xCDa7lbKKw4IubcbFFWT5fsBgNi+wDq
         HRgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:reply-to:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=4vX7eexTs9BOaxBOSiTy4LK5wMzEspKJIOFsh3hL9fU=;
        fh=oKplpYM7FRBzQmWtzrvTqMJeRXSgZMhOgnsQH3X8oZg=;
        b=ZU536CfmFP64jwdkCDDJfjprkV7joJJUiiIwI3YPtSs9ASY4X0l922W2RmIZKtNUd9
         GWC7GdYpMr+M8HoMsASy4rcOjl7gZLtrsMZt1TQQH/KqAKQaLVNUNs18HrH6LCcrr3Qv
         g4oGlG+zxVEM9YYmFjIWlPC5EdALZoRexWvJjEp7cl9P6hOWIpe/y3Rqmmak1i84hHcs
         pJplX2WXLojBrocQETdlx/5WQjeF91TqAsak3VgQ+CXJX9/CT4Ylu9gbHTiy8mZlbOee
         SXoZT52+aMkys6IAvdVP8usZt3E5fZCScwfAAcE9EkEXPRoLGlkLnEFcvvIqCwvYeXni
         mvdA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=f2K21cYx;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id d75a77b69052e-4a705cd2f03si46328881cf.632.2025.06.10.23.53.33
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 23:53:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=f2K21cYx;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749624813;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4vX7eexTs9BOaxBOSiTy4LK5wMzEspKJIOFsh3hL9fU=;
	b=f2K21cYx2T+aJLKxVniPTmbgm0ISD54ht2SK2vrU0ZF0rGes0mWFhf48JN9ZNgyi/0wTM0
	+F1Cc3BoXxZTkt4yj8y+Pu+zCc6ATRSrhSf8Gqoeks4Y/+3+AtLpd1TyQ+K1jWgYZp5DhZ
	nRimywpKxr8JQ1q9bUnDTxqV3M6BXeA=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-175-LVHmYznMPTKR20FR8M6Fgw-1; Wed, 11 Jun 2025 02:53:32 -0400
X-MC-Unique: LVHmYznMPTKR20FR8M6Fgw-1
X-Mimecast-MFC-AGG-ID: LVHmYznMPTKR20FR8M6Fgw_1749624811
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-3a4edf5bb4dso3737662f8f.0
        for <alex.bennee@linaro.org>; Tue, 10 Jun 2025 23:53:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749624811; x=1750229611;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4vX7eexTs9BOaxBOSiTy4LK5wMzEspKJIOFsh3hL9fU=;
        b=Te/GtXQxEUAxBiOqzGCcWzm/xbkzm75HDVDEJd2a48DFX65iRLUoOhcBjd8Ox33ubd
         XKFmOJ89L+4l0TSHFNpnBXXHfnQSwCbbWAQDgU9ggYC3CnxTai5spbdk5pBvJu2Bnb4u
         Uck5K70Tuuy+635isEtjAeBcI0t/vvHrVEsZxMztqdGzI/BmELmeU5pVV7vkzJVcpEs6
         PgobUR7uP7eKCJTX/SWWcPyidcrvr7STErQ+T0+zZcZ68Qs1VjATaYPSuirZt4lm7eFO
         Gr3zJnbFNn/Z9uNmCljkYNSuPRTanRwdu/c/fE/iFHnR66xcsb3S7SiC6YiUGw7V9Q0y
         T0nQ==
X-Forwarded-Encrypted: i=1; AJvYcCUPBW/MWCTd5BtvKYpFJ1RDOlQMM2+q/EOQqdXnUngzUy6TsUP5woeiiFakUxcXcwfRdw6lxGytA8bm/w==@linaro.org
X-Gm-Message-State: AOJu0YwV6u8jVN5G/sqGx3oxznfD9YcEAGu7hRInfh9l8gsJMjz1lYDh
	jLrW2q2HIDqLjYk+80RPTcoEv70+bYSDqaWEvNQjR7YqFbJexqSWv0vcB6kv81XtDh//9mx3Esp
	lMb/NF+LyxaXzBFjfZymaYPpw1IHcfSRv3dwTl9lDNxgkETDceOp7m/RmaQ==
X-Gm-Gg: ASbGncto/QAUbdGpSoy3vo0hgHKA6avDAkCXvKehgpZm/n1awQKj9tBP7QY85+Oz/Zm
	Iuu+hTZmQlcAoaBBj/Sui1UD4SVluaTFhp2I1bgskEiQgtqZ26GskPuL0SHOPL15ukzMpI9oHlN
	1ZRtMil/y8aQdKePA68RwC0JbULNoAQ+0H5N1sC7qYWQooH0UwBSclm3eQRW+o2A6bCGa+gdsGf
	myczUVNJI3SEUs5ELRFNc1xU2IS0kHaVQm3Tw5GOYQtDvZJpSC6zQ86mowFUU2LsEuZOipIUVjD
	XgrBIDPXa9uNWSlopxi+sFzVG1GR+4XN0Qj0nfugJc3MwCILxiaveR3OEuLFP0FtSqW+rA==
X-Received: by 2002:a05:6000:420b:b0:3a5:52b3:103b with SMTP id ffacd0b85a97d-3a5586dce0bmr1166377f8f.4.1749624810729;
        Tue, 10 Jun 2025 23:53:30 -0700 (PDT)
X-Received: by 2002:a05:6000:420b:b0:3a5:52b3:103b with SMTP id ffacd0b85a97d-3a5586dce0bmr1166353f8f.4.1749624810244;
        Tue, 10 Jun 2025 23:53:30 -0700 (PDT)
Return-Path: <eric.auger@redhat.com>
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874? ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a53229dc33sm14135669f8f.20.2025.06.10.23.53.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Jun 2025 23:53:29 -0700 (PDT)
Message-ID: <13792b72-d336-41b8-8ac7-8790e10f833c@redhat.com>
Date: Wed, 11 Jun 2025 08:53:28 +0200
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
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20250528123325.750529a4@imammedo.users.ipa.redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: JfQr8fts8IwwIILXuyKZakN9WslvWV02CoMCd2tzYDo_1749624811
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TUID: bFkfxO9g/FYg

Hi Gustavo, Alex,

On 5/28/25 12:33 PM, Igor Mammedov wrote:
> On Tue, 27 May 2025 15:54:15 +0200
> Eric Auger <eric.auger@redhat.com> wrote:
>
>> Hi Igor,
>>
>> On 5/27/25 1:58 PM, Igor Mammedov wrote:
>>> On Tue, 27 May 2025 09:40:04 +0200
>>> Eric Auger <eric.auger@redhat.com> wrote:
>>>  
>>>> acpi_pcihp VirtMachineClass state flag will allow
>>>> to opt in for acpi pci hotplug. This is guarded by a
>>>> class no_acpi_pcihp flag to manage compats (<= 10.0
>>>> machine types will not support ACPI PCI hotplug).  
>>> there is no reason to put an effort in force disabling it
>>> on old machines, as long as code works when explicitly
>>> enabled property on CLI.
>>>
>>> See comment below on how to deal with it 
>>>  
>>>> Machine state acpi_pcihp flag must be set before the creation
>>>> of the GED device which will use it.
>>>>
>>>> Currently the ACPI PCI HP is turned off by default. This will
>>>> change later on for 10.1 machine type.  
>>> one thing to note, is that turning it on by default might
>>> cause change of NIC naming in guest as this brings in
>>> new "_Sxx" slot naming. /so configs tied to nic  go down the drain/
>>>
>>> Naming, we have, also happens to be broken wrt spec
>>> (it should be unique system wide, there was a gitlab issue for that,
>>> there is no easy fix that though)
>>>
>>> So I'd leave it disabled by default and let users to turn
>>> it on explicitly when needed.   
>> what is the status on q35, isn't it enabled by default? If so why
>> wouldn't we want the same setting on ARM? Is that because of the known
>> issue you report above?
> Above issue is not a blocker (for thae lack of a good way to fix it)
>
> on q35 we have had a few complains and fixes, after pcihp was promoted
> to default (so hopefully that won't happen on with ARM). Also given
> that ARM VM is less popular like hood breaking someone setup is even less.
>
> That said I'd be cautions keep native hotplug as default,
> and only ones who need ACPI one, could turn it on explicitly.
>
> But well it's policies, so it's up to you ARM folks to decide what
> virt board should look like.
What is your preference? Do you prefer enabling ACPI PCI HP by default
or the opposite.
Anybody else?

On my end I think I would prefer to have the same default setting than
on x86 (ie. ACPI PCI hotplug set by default) but I have no strong
opinion either.

Thanks

Eric
>
>
>> The no_foo compat stuff was especially introduced to avoid breaking the
>> guest ABI for old machine types (like the NIC naming alternation you evoke).
> no_foo is just another way to handle compat stuff,
> and when it's more than one knob per feature it gets ugly really fast.
> Hence, I'd prefer pcihp done in x86 way aka:
>    hw_compat_OLD(ged.use_acpi_hotplug_bridge, false|true)
> to manage presence of ACPI hotplug on desired machine version.
> Side benefit it's consistent with how pcihp works on x86
>
>>>  
>>>> We also introduce properties to allow disabling it.
>>>>
>>>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>>>> Reviewed-by: Gustavo Romero <gustavo.romero@linaro.org>
>>>> ---
>>>>  include/hw/arm/virt.h |  2 ++
>>>>  hw/arm/virt.c         | 27 +++++++++++++++++++++++++++
>>>>  2 files changed, 29 insertions(+)
>>>>
>>>> diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
>>>> index 9a1b0f53d2..10ea581f06 100644
>>>> --- a/include/hw/arm/virt.h
>>>> +++ b/include/hw/arm/virt.h
>>>> @@ -129,6 +129,7 @@ struct VirtMachineClass {
>>>>      bool no_tcg_lpa2;
>>>>      bool no_ns_el2_virt_timer_irq;
>>>>      bool no_nested_smmu;
>>>> +    bool no_acpi_pcihp;
>>>>  };
>>>>  
>>>>  struct VirtMachineState {
>>>> @@ -150,6 +151,7 @@ struct VirtMachineState {
>>>>      bool mte;
>>>>      bool dtb_randomness;
>>>>      bool second_ns_uart_present;
>>>> +    bool acpi_pcihp;
>>>>      OnOffAuto acpi;
>>>>      VirtGICType gic_version;
>>>>      VirtIOMMUType iommu;
>>>> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
>>>> index 9a6cd085a3..a0deeaf2b3 100644
>>>> --- a/hw/arm/virt.c
>>>> +++ b/hw/arm/virt.c
>>>> @@ -2397,8 +2397,10 @@ static void machvirt_init(MachineState *machine)
>>>>      create_pcie(vms);
>>>>  
>>>>      if (has_ged && aarch64 && firmware_loaded && virt_is_acpi_enabled(vms)) {
>>>> +        vms->acpi_pcihp &= !vmc->no_acpi_pcihp;  
>>> I don't particularly like no_foo naming as it makes code harder to read
>>> and combined with 'duplicated' field in machine state it make even things worse.
>>> (if I recall right Philippe was cleaning mess similar flags usage
>>> have introduced with ITS)
>>>
>>> instead of adding machine property (both class and state),
>>> I'd suggest adding the only property to GPE device (akin to what we have in x86 world)
>>> And then one can meddle with defaults using hw_compat_xxx  
>> no_foo still is a largely used pattern in arm virt: no_ged,
>> kvm_no_adjvtime, no_kvm_steal_time, no_tcg_lpa2, ../.. There are plenty
>> of them and I am not under the impression this is going to be changed.
>>
>> If you refer to 8d23b1df7212 ("hw/arm/virt: Remove
>> VirtMachineClass::no_its field") I think the no_its was removed because
>> the machine it applied was removed.
>>
>> If I understand correctly you would like the prop to be attached to the
>> GED device. However the GED device is internally created by the virt
>> machine code and not passed through a "-device" CLI option. So how would
>> you pass the option on the cmd line if you don't want it to be set by
>> default per machine type?
>>
>> Thanks
>>
>> Eric
>>>  
>>>>          vms->acpi_dev = create_acpi_ged(vms);
>>>>      } else {
>>>> +        vms->acpi_pcihp = false;
>>>>          create_gpio_devices(vms, VIRT_GPIO, sysmem);
>>>>      }
>>>>  
>>>> @@ -2593,6 +2595,20 @@ static void virt_set_its(Object *obj, bool value, Error **errp)
>>>>      vms->its = value;
>>>>  }
>>>>  
>>>> +static bool virt_get_acpi_pcihp(Object *obj, Error **errp)
>>>> +{
>>>> +    VirtMachineState *vms = VIRT_MACHINE(obj);
>>>> +
>>>> +    return vms->acpi_pcihp;
>>>> +}
>>>> +
>>>> +static void virt_set_acpi_pcihp(Object *obj, bool value, Error **errp)
>>>> +{
>>>> +    VirtMachineState *vms = VIRT_MACHINE(obj);
>>>> +
>>>> +    vms->acpi_pcihp = value;
>>>> +}
>>>> +
>>>>  static bool virt_get_dtb_randomness(Object *obj, Error **errp)
>>>>  {
>>>>      VirtMachineState *vms = VIRT_MACHINE(obj);
>>>> @@ -3310,6 +3326,10 @@ static void virt_machine_class_init(ObjectClass *oc, const void *data)
>>>>                                            "in ACPI table header."
>>>>                                            "The string may be up to 8 bytes in size");
>>>>  
>>>> +    object_class_property_add_bool(oc, "acpi-pcihp",
>>>> +                                   virt_get_acpi_pcihp, virt_set_acpi_pcihp);
>>>> +    object_class_property_set_description(oc, "acpi-pcihp",
>>>> +                                          "Force ACPI PCI hotplug");
>>>>  }
>>>>  
>>>>  static void virt_instance_init(Object *obj)
>>>> @@ -3344,6 +3364,9 @@ static void virt_instance_init(Object *obj)
>>>>          vms->tcg_its = true;
>>>>      }
>>>>  
>>>> +    /* default disallows ACPI PCI hotplug */
>>>> +    vms->acpi_pcihp = false;
>>>> +
>>>>      /* Default disallows iommu instantiation */
>>>>      vms->iommu = VIRT_IOMMU_NONE;
>>>>  
>>>> @@ -3394,8 +3417,12 @@ DEFINE_VIRT_MACHINE_AS_LATEST(10, 1)
>>>>  
>>>>  static void virt_machine_10_0_options(MachineClass *mc)
>>>>  {
>>>> +    VirtMachineClass *vmc = VIRT_MACHINE_CLASS(OBJECT_CLASS(mc));
>>>> +
>>>>      virt_machine_10_1_options(mc);
>>>>      compat_props_add(mc->compat_props, hw_compat_10_0, hw_compat_10_0_len);
>>>> +    /* 10.0 and earlier do not support ACPI PCI hotplug */
>>>> +    vmc->no_acpi_pcihp = true;
>>>>  }
>>>>  DEFINE_VIRT_MACHINE(10, 0)
>>>>    
