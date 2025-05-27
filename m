Received: by 2002:a17:505:a38d:b0:1be9:327d:8ee3 with SMTP id rs13csp4830764njc;
        Tue, 27 May 2025 06:54:22 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWVOdSDn6ZibIi8KOtjUJtjz5O8icpbw63cZmpdB7G+sCVEwzNkOTnbpAzK6D2/KPHbfj10a/K2U82zhA==@linaro.org
X-Google-Smtp-Source: AGHT+IFH9fJEorkj+Vb1jWiTjbeTYxNJqEazIPGcHWlne89UExpLfDNSEPgrxFkk2tE+hvAY1xSh
X-Received: by 2002:a05:622a:1ccd:b0:494:b1f9:d683 with SMTP id d75a77b69052e-49f480ca00emr194236441cf.49.1748354062521;
        Tue, 27 May 2025 06:54:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1748354062; cv=none;
        d=google.com; s=arc-20240605;
        b=U7TvH+AzkwhAD6qrNb+xsFwPzNcs7sxZnRvuFmg3hWvdorwiknGplBgl14PBRt2I5t
         vUwNuakCXO7OrtZm3o0cJnmfVou9pfPVN7GKQapFNekc2UjyweYubNkve3XjPwaV8N0I
         Oh6xbYHHazxu+3VsUEEKLwCXS2GRj6khGgwvLyQ26fVTB3m2XhstjJmWkiDM42tgSS/6
         cXX+eRTdSxt7hn3FczkFlRRC91o7/F1rmu0eyA5goGQ1g4Gm01rV5p7sCiw05k7BK4Bb
         I3dZD4FIvQyuvF5hh/3wct/jGWWKnQZa8E2f22TR+tDM4zYbF9MWiAqg1ISxgpnTrgvX
         HdZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:reply-to:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=nUlrC4W6uOTNQ8bZE8ImtEYqZRoBhHReT9sR4QUSUWA=;
        fh=BfPT2HdDRrtNQ7kw+tloXfNG/1+7Oztdd9N/kE+fLs0=;
        b=NCR3Ib8RjRh8VQ//sFUrP+HkSHh3fmH6H2su6zcZEpJ33Knglsr+3h5SxF5auXS1sH
         DhmSG7sUaCHrmvmJqz1NpaS4ynRPbiUd4OF+VBvdXc2lNLV4/M7SDXKBmbcD0uXioj5D
         m1St32Xf/AxvIWQP6/v2jHD6JFQ3lBGGaa/+WMph9nPSp2GAQjZo0vJP9hGycscL7Qed
         S3ixYUATvKr3I3t/17hstOZUEHjtfjNfTQ9I4SdNHdvz94Ur8dychEiGzEKY6nyltC4v
         aV18Pbl+mGVWIead30T9ZOpvNRGN3mFFXrflPkps1fEz3Cg47+wp9ugwzCUX7dzsH1XJ
         4Kqg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=catxjhAS;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id d75a77b69052e-494ae55fd0esi289023061cf.321.2025.05.27.06.54.22
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 May 2025 06:54:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=catxjhAS;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748354062;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nUlrC4W6uOTNQ8bZE8ImtEYqZRoBhHReT9sR4QUSUWA=;
	b=catxjhAS00cipwyP2/5pfJbImzirWUTMa/u+7Muj90T1EHPskv/Z+M1t/G/4FgOUcOxGnz
	ljNMDRk03Zn5YuCchrDEo6YkyoG7v9W4UdZFXtCzBi8GiRZrSWEpHRtkBFmhmuhyLf0Mm3
	q+T/hBSHs0tGbB4KpIQkQXFVW/r2qCQ=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-421-Sx1UfoCbMCuv3npb4wi3ng-1; Tue, 27 May 2025 09:54:20 -0400
X-MC-Unique: Sx1UfoCbMCuv3npb4wi3ng-1
X-Mimecast-MFC-AGG-ID: Sx1UfoCbMCuv3npb4wi3ng_1748354059
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-442f90418b0so17896895e9.2
        for <alex.bennee@linaro.org>; Tue, 27 May 2025 06:54:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748354059; x=1748958859;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nUlrC4W6uOTNQ8bZE8ImtEYqZRoBhHReT9sR4QUSUWA=;
        b=ZFRuyKSFbqq9IkmMwrEk0GBi4tRpkvAHH273FOP6p7tSMRKICidzSi7oyI03pkWYkR
         gW4gIlWSRutb3vCa/y5yNytxWA1GeBVbOK71k3lbCmvV2CpaBk5NK6oiTTzD/bnM4TwB
         5i7ARzxxpfKZ1/jDY4k1oZpKX8drlvLOXvloM1cwvtOLlRu6LujwGJaZz5jLydwlOo3w
         SYNwPDji3MrdBPPeEiCktMCN4SHlxI7oJWTtHjFH4sJomvch7O7LlL/o8nHecKgXrP+s
         QpWX6T1e6Ln6HrgwSp52yk5yRIyiN/QkuSzS9IWgCgBbax+gV5qphktESb6sThUeOlaS
         sE+g==
X-Forwarded-Encrypted: i=1; AJvYcCVhXpQj3grZHtGmMtwzxUbT1HVFrGhuz/ECz51fyf9JihfcdDicrWG06QYPqFqXKbC0li3AfCo+piYbNA==@linaro.org
X-Gm-Message-State: AOJu0Yy9q82MphqlM0WPfFSYrNzvKG0lNY+CoD2gLdJUk50As4bDg1W/
	WxEuXpEWm7F6EFC0iD1KK4BGU+iNU/l9V86zo9RJvLm+3HyslE+16XB8JBqgYGZXzdQlqBYsXIB
	f2M62kPR5+Y8Afa5L8jlpx13skshFkNe5JMyfUVgm6Cc0Xy6EVqIybZj1dg==
X-Gm-Gg: ASbGnctBcETn7u3E4whBQfhYw6/x712o7noYkxFRSfVQQbsLq7AvZLOE3at+8P+EPjE
	q4Jp3qAkGhoNrv7Q/8lSLuPrSTIXhovqoQUNyJtPB6m7WEd/tmqCEtJt+OvQ3Y4U7b0paARqw0d
	Qx9D+LTRr5H+3U6rIeer2VQMlNzU82UMMglgnrdUl7Xj2H9Uox6bUmKovu1JR/9VJU1JhYJy09i
	tGYQr2jE/CH38daO934+T0YU70WdQZZT7JGmIROVhxTtWGDc0qj16gbxcxKStN/AxrkbUMaA3p4
	kfZgzhFNtaFLvO85hqbhXWRpcUUg3xrNtQQOygXg+aS6h7eOWIWYN4qnn2k=
X-Received: by 2002:a05:600c:512a:b0:44b:2f53:351c with SMTP id 5b1f17b1804b1-44c91dcb6e7mr123795675e9.18.1748354059173;
        Tue, 27 May 2025 06:54:19 -0700 (PDT)
X-Received: by 2002:a05:600c:512a:b0:44b:2f53:351c with SMTP id 5b1f17b1804b1-44c91dcb6e7mr123795355e9.18.1748354058754;
        Tue, 27 May 2025 06:54:18 -0700 (PDT)
Return-Path: <eric.auger@redhat.com>
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874? ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-447f74cce5bsm264808385e9.24.2025.05.27.06.54.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 May 2025 06:54:17 -0700 (PDT)
Message-ID: <d6bd4794-bcee-4701-8e63-4adee91120d9@redhat.com>
Date: Tue, 27 May 2025 15:54:15 +0200
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
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20250527135813.2d6cde91@imammedo.users.ipa.redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Djp-Y-D8YklfV3OF2mdumJb8ZbLBxDBLGTARyaMmEbE_1748354059
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TUID: gHj9q+larBiB

Hi Igor,

On 5/27/25 1:58 PM, Igor Mammedov wrote:
> On Tue, 27 May 2025 09:40:04 +0200
> Eric Auger <eric.auger@redhat.com> wrote:
>
>> acpi_pcihp VirtMachineClass state flag will allow
>> to opt in for acpi pci hotplug. This is guarded by a
>> class no_acpi_pcihp flag to manage compats (<= 10.0
>> machine types will not support ACPI PCI hotplug).
> there is no reason to put an effort in force disabling it
> on old machines, as long as code works when explicitly
> enabled property on CLI.
>
> See comment below on how to deal with it 
>
>> Machine state acpi_pcihp flag must be set before the creation
>> of the GED device which will use it.
>>
>> Currently the ACPI PCI HP is turned off by default. This will
>> change later on for 10.1 machine type.
> one thing to note, is that turning it on by default might
> cause change of NIC naming in guest as this brings in
> new "_Sxx" slot naming. /so configs tied to nic  go down the drain/
>
> Naming, we have, also happens to be broken wrt spec
> (it should be unique system wide, there was a gitlab issue for that,
> there is no easy fix that though)
>
> So I'd leave it disabled by default and let users to turn
> it on explicitly when needed. 

what is the status on q35, isn't it enabled by default? If so why
wouldn't we want the same setting on ARM? Is that because of the known
issue you report above?

The no_foo compat stuff was especially introduced to avoid breaking the
guest ABI for old machine types (like the NIC naming alternation you evoke).
>
>> We also introduce properties to allow disabling it.
>>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>> Reviewed-by: Gustavo Romero <gustavo.romero@linaro.org>
>> ---
>>  include/hw/arm/virt.h |  2 ++
>>  hw/arm/virt.c         | 27 +++++++++++++++++++++++++++
>>  2 files changed, 29 insertions(+)
>>
>> diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
>> index 9a1b0f53d2..10ea581f06 100644
>> --- a/include/hw/arm/virt.h
>> +++ b/include/hw/arm/virt.h
>> @@ -129,6 +129,7 @@ struct VirtMachineClass {
>>      bool no_tcg_lpa2;
>>      bool no_ns_el2_virt_timer_irq;
>>      bool no_nested_smmu;
>> +    bool no_acpi_pcihp;
>>  };
>>  
>>  struct VirtMachineState {
>> @@ -150,6 +151,7 @@ struct VirtMachineState {
>>      bool mte;
>>      bool dtb_randomness;
>>      bool second_ns_uart_present;
>> +    bool acpi_pcihp;
>>      OnOffAuto acpi;
>>      VirtGICType gic_version;
>>      VirtIOMMUType iommu;
>> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
>> index 9a6cd085a3..a0deeaf2b3 100644
>> --- a/hw/arm/virt.c
>> +++ b/hw/arm/virt.c
>> @@ -2397,8 +2397,10 @@ static void machvirt_init(MachineState *machine)
>>      create_pcie(vms);
>>  
>>      if (has_ged && aarch64 && firmware_loaded && virt_is_acpi_enabled(vms)) {
>> +        vms->acpi_pcihp &= !vmc->no_acpi_pcihp;
> I don't particularly like no_foo naming as it makes code harder to read
> and combined with 'duplicated' field in machine state it make even things worse.
> (if I recall right Philippe was cleaning mess similar flags usage
> have introduced with ITS)
>
> instead of adding machine property (both class and state),
> I'd suggest adding the only property to GPE device (akin to what we have in x86 world)
> And then one can meddle with defaults using hw_compat_xxx
no_foo still is a largely used pattern in arm virt: no_ged,
kvm_no_adjvtime, no_kvm_steal_time, no_tcg_lpa2, ../.. There are plenty
of them and I am not under the impression this is going to be changed.

If you refer to 8d23b1df7212 ("hw/arm/virt: Remove
VirtMachineClass::no_its field") I think the no_its was removed because
the machine it applied was removed.

If I understand correctly you would like the prop to be attached to the
GED device. However the GED device is internally created by the virt
machine code and not passed through a "-device" CLI option. So how would
you pass the option on the cmd line if you don't want it to be set by
default per machine type?

Thanks

Eric
>
>
>>          vms->acpi_dev = create_acpi_ged(vms);
>>      } else {
>> +        vms->acpi_pcihp = false;
>>          create_gpio_devices(vms, VIRT_GPIO, sysmem);
>>      }
>>  
>> @@ -2593,6 +2595,20 @@ static void virt_set_its(Object *obj, bool value, Error **errp)
>>      vms->its = value;
>>  }
>>  
>> +static bool virt_get_acpi_pcihp(Object *obj, Error **errp)
>> +{
>> +    VirtMachineState *vms = VIRT_MACHINE(obj);
>> +
>> +    return vms->acpi_pcihp;
>> +}
>> +
>> +static void virt_set_acpi_pcihp(Object *obj, bool value, Error **errp)
>> +{
>> +    VirtMachineState *vms = VIRT_MACHINE(obj);
>> +
>> +    vms->acpi_pcihp = value;
>> +}
>> +
>>  static bool virt_get_dtb_randomness(Object *obj, Error **errp)
>>  {
>>      VirtMachineState *vms = VIRT_MACHINE(obj);
>> @@ -3310,6 +3326,10 @@ static void virt_machine_class_init(ObjectClass *oc, const void *data)
>>                                            "in ACPI table header."
>>                                            "The string may be up to 8 bytes in size");
>>  
>> +    object_class_property_add_bool(oc, "acpi-pcihp",
>> +                                   virt_get_acpi_pcihp, virt_set_acpi_pcihp);
>> +    object_class_property_set_description(oc, "acpi-pcihp",
>> +                                          "Force ACPI PCI hotplug");
>>  }
>>  
>>  static void virt_instance_init(Object *obj)
>> @@ -3344,6 +3364,9 @@ static void virt_instance_init(Object *obj)
>>          vms->tcg_its = true;
>>      }
>>  
>> +    /* default disallows ACPI PCI hotplug */
>> +    vms->acpi_pcihp = false;
>> +
>>      /* Default disallows iommu instantiation */
>>      vms->iommu = VIRT_IOMMU_NONE;
>>  
>> @@ -3394,8 +3417,12 @@ DEFINE_VIRT_MACHINE_AS_LATEST(10, 1)
>>  
>>  static void virt_machine_10_0_options(MachineClass *mc)
>>  {
>> +    VirtMachineClass *vmc = VIRT_MACHINE_CLASS(OBJECT_CLASS(mc));
>> +
>>      virt_machine_10_1_options(mc);
>>      compat_props_add(mc->compat_props, hw_compat_10_0, hw_compat_10_0_len);
>> +    /* 10.0 and earlier do not support ACPI PCI hotplug */
>> +    vmc->no_acpi_pcihp = true;
>>  }
>>  DEFINE_VIRT_MACHINE(10, 0)
>>  
