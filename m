Received: by 2002:a17:505:ba85:b0:1be9:327d:8ee3 with SMTP id zs5csp1880536njc;
        Wed, 11 Jun 2025 01:57:09 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW2ErDv9UIH2UxE3UfM2CPbmLdBsZNMAQiXVRsI3rWlDb4dnknwGhdv2PiTJHkWjRIJU+f6Jsk9NfNNIQ==@linaro.org
X-Google-Smtp-Source: AGHT+IHV7HC0y3t2M6d90yCtiWgB9XNqBTx5HRcJXrwFiUCM4Rj4kmBkI4Naifpb8AUBlyWdL5GU
X-Received: by 2002:a05:622a:1e10:b0:4a4:30a0:39c0 with SMTP id d75a77b69052e-4a713c30b29mr40253201cf.28.1749632201678;
        Wed, 11 Jun 2025 01:56:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1749632201; cv=none;
        d=google.com; s=arc-20240605;
        b=fgayIpK8OmTZyrMeopvuTEHdUwYYZzpeO7wE2k9+V7mly4ND9NjuDzvqlgvMKcYfs8
         n3n2QSE8SmEVzXLTXnZC7R52P88V5kqcpC4kbwZ67u5WJTKlL5niEcqxihlmt2GzuDrr
         mzv2DpHRtv2XDsXDlRYfbplsxITdrX0ZrkoRaBdXGsZLty4jzy5nL+n6r8uGhRvx9/hG
         rkDPgBKnDVYZMofypXjCe7+1uJnfB2A67iM2ZLdHKAHAIgHW8bIRc1d6QMUOPuy0Q5mh
         VWyr2UzYYCK0inpR4iOhIfK4G/C37c7RhQyAEXl0VkH4N2JiTbfswinuSKKe0YLWTlHr
         GY+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:reply-to:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=g6RosQ96jaiGatF59JsjhutK5mf8be1NJ6xnaw51q6w=;
        fh=IPPDYiYj/Lzxx/1+VDuAQlOHvUkmjak4ZX+UKaJRrjY=;
        b=LyZJ+Hkfm91cQEgzjpsXYxwuiCvowefmKqUnLbApTqQHheVMbtG7Ufc8tHKj9y3Kzn
         crPIr/u5J/+AqWbLXmxDzfzjjhF7k/fO+N2wF7HujnrM+Gjuv5W8zK1S9xAgPtm3IbBb
         Zo4VibWOXBHKQrpRadcpHwQVzvE6uhttl6bjSp2HLksZlKDeJJu8iWh5KuB6lXbcKxY2
         RmTA99s9CRD8u6eq00WBT1ex7spAdMZpUOJKYSZFoLiCIC2UfEyhz+LyVR6KU7ajkrXM
         XGaN8/DEYCu3IcBFuU6O0bk+tGPSUFdrJwnKsGWeFKFiHZIzeTvOLKRoYX2oWwiY7eIv
         J6yg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=EkrdGMOE;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id d75a77b69052e-4a7074789f8si43957271cf.418.2025.06.11.01.56.41
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 01:56:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=EkrdGMOE;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749632201;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=g6RosQ96jaiGatF59JsjhutK5mf8be1NJ6xnaw51q6w=;
	b=EkrdGMOEG0DdPwEhVdNk5uG8xDO8xIAkvXAmjMVrtfnRbBA359G8m43FYOvRMciP4ZegaO
	aRtNgoAtkbedVcg74TDRdPYfCgDgQoQPemhI3uoy0oW1eHsAdMtE8JjtakJ1eVttCdGCOM
	o5VaLA7Hutu6jZtA9DWDRxCQGkd23tM=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-659-0tFMgLUJM8S1a7QBFVMNiQ-1; Wed, 11 Jun 2025 04:56:40 -0400
X-MC-Unique: 0tFMgLUJM8S1a7QBFVMNiQ-1
X-Mimecast-MFC-AGG-ID: 0tFMgLUJM8S1a7QBFVMNiQ_1749632199
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-451ecc3be97so23141075e9.0
        for <alex.bennee@linaro.org>; Wed, 11 Jun 2025 01:56:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749632199; x=1750236999;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g6RosQ96jaiGatF59JsjhutK5mf8be1NJ6xnaw51q6w=;
        b=qaYR42rLnjUp5l+jwwNsOtt7ed3iAn1N+OPwWB46PK+CptA1AprKtTZRzfYl0j8sTl
         YKNccihPC9FO4Y/PUM1IpJ4+t7OAJDE/ErwpI+IYHiR43mQdnRllRfCE2YJ0ApqhTVr4
         F/3Wu/uGAq524+005rNeBjQlPK019YvnFAVkq9ehmByKfQ1MgUZRsJrC4ZFzPwOm/05Y
         KRt7FVfOqoJ2361rbNkwjgkfD/pA75j4UF0B43bo9n59CGjFkL3hlxbQej4qKJ54ucY4
         Yn/sMg3jFWKKj6Aew1W685WK1Qc0/LCu3wvPK/qkogcFtHkdLeREdmuKJpV0+xONJ3Rr
         BmgA==
X-Forwarded-Encrypted: i=1; AJvYcCUfpSCBfnZEt6IoMybTPrr3Abf1Mo8JQFmEyBSMU8ti5K0gHOS5J3G573BXge0L+BojRHnhW4LM7pX1jQ==@linaro.org
X-Gm-Message-State: AOJu0YzYpvWLAH9HVZ/B4YTtLX6oDvQNfn4RaqDlYHCRfihCZnoeG/YI
	Q8FuPNL5hN4mLU8rdPo3B0/MKynD7zjsHSRPdLFn/EUE5XLjcnV5w5OJTiO+6abjYlQThpaBlZB
	0rv52J8/P9bADRKm4qGAxG04EDa6JfWIfGZDlxCJGiq+7LrS3BdlzvGbU9g==
X-Gm-Gg: ASbGnctTcQ9oMdHWA7rARTrUad2XVzdAmbhFcBNUeKaJIamXYaV/WYUfPR2UvsvBgEu
	E6K+sAf5tKplw1IbUKNxvLz9zvAFmw6xhRAGdbNMf98kRRXv1BokwWPgcgA9XOCMlZ7lM36tmSF
	rI2a7CF9ZPgtnbhH96x+L2PXhtLFOqwV+O/EblISG29Lyv0QJUra0kVxRhuZwSGUA+1aDQXFVAC
	z7/+ZdV0fHENkfBi/IKUaGA0N9y0pUQ+Zhv8F36nymI0aYtaQgUqUeaB+tVfHD4SNOsFf34rPBV
	4dcnH8PKALfAVCKQtdz7s3JfPxT72Yduq7tAIlp+/Yh5CsE+x3lkAshWM8JevvezT5n8MQ==
X-Received: by 2002:a05:6000:4203:b0:3a5:1410:71c0 with SMTP id ffacd0b85a97d-3a5586dcff7mr1793061f8f.38.1749632198814;
        Wed, 11 Jun 2025 01:56:38 -0700 (PDT)
X-Received: by 2002:a05:6000:4203:b0:3a5:1410:71c0 with SMTP id ffacd0b85a97d-3a5586dcff7mr1793040f8f.38.1749632198390;
        Wed, 11 Jun 2025 01:56:38 -0700 (PDT)
Return-Path: <eric.auger@redhat.com>
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874? ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a5324360fasm14787285f8f.56.2025.06.11.01.56.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Jun 2025 01:56:37 -0700 (PDT)
Message-ID: <b0be20a1-6b7f-4a0a-a228-b2f0eaca88e1@redhat.com>
Date: Wed, 11 Jun 2025 10:56:36 +0200
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
 <6374e8f1-8eee-49cb-9c7f-75aaed1a0f08@redhat.com>
 <20250611104915.5a5a2bea@imammedo.users.ipa.redhat.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20250611104915.5a5a2bea@imammedo.users.ipa.redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: GZoZPTyEcUtd4hXhH04p17zSUfOLt419Gb3bU3y5O9g_1749632199
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: n4Vodb0Y8/70



On 6/11/25 10:49 AM, Igor Mammedov wrote:
> On Wed, 11 Jun 2025 08:47:36 +0200
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
>> What I fail to understand is whether you want me to attach this property
>> to the GPEX host bridge device or to the GED device. Comment on patch
> I'd say GED.
>
>> 6/25 seems to indicate you expect it to be attached to the GPEX. I ask
>> here because also the GED device will need to be configured depending on
>> the hp setting. Maybe we can retrieve the info from the gpex at that
>> time. on x86 it is attached to piix4 or ich9 I/O controller hub which do
>> not have direct equivalent on ARM.
> for ARM, equivalent would be GED device which hosts our paravirt acpi registers.

OK thank you for the clarification. I will add a property to the GED device.

As the GED device is directly instantiated by the virt machine code (not
exposed to the end user CLI) I guess we still want a virt machine option
that would allow to set the property explicitly from CLI?

Thanks

Eric  
>
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
