Received: by 2002:a17:505:ba85:b0:1be9:327d:8ee3 with SMTP id zs5csp1835306njc;
        Tue, 10 Jun 2025 23:47:42 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUhVZDSAGIJIICwPri7G5CfQWXlbMunHpRTLs0/EFtAznnOFVasBPBiKbk4d+CnrN3DfMS/ykel/MQ6oA==@linaro.org
X-Google-Smtp-Source: AGHT+IGUs0PxV3yFeEhkBH25ZK2JQeRH2fK7jCWeL//U1KJwLGmwiLva9uUV+xtrdeYDepxRtN5f
X-Received: by 2002:a05:620a:4592:b0:7d3:9e75:6953 with SMTP id af79cd13be357-7d3a894e5f2mr334907485a.52.1749624461886;
        Tue, 10 Jun 2025 23:47:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1749624461; cv=none;
        d=google.com; s=arc-20240605;
        b=NnMeYt4fDRoojSFWyUCYz8GV4YgJ3ddt9ma8Ech5kxcYsXKKci+ABU00cbtKqEYLLD
         RlXfiFKc557lneA24eYre/IZHNhUof4ZOnbysFpYwnq1aSyeDjOQorrz860uo1ZNkK9v
         g6UEVUcaTwHik6qpyk3QQy2aUvvEjuiyCV7DC5OPObF8SqqRCM7H0uWCdiKrhG5CyOjz
         DT6+GPWW/9X5R9Y00xrnXmIHymGLA6xkMMaPla+Tamjdgh0c8S84FfLAK8ou5qHKVLES
         dLwoML/yrNC5P8C8fHP6ptn2snWRmFg5M7mxVOzNrHEeq8D9ksV+uSbEBIPA+rxzlRh4
         +jIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:reply-to:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=ILNx9+PqmhXA3oiuOjj4pN/iEZ3xIG9tPyeo4uqtlxA=;
        fh=TBuWJ3d05KUPJXuBsG/+UBVyujoxWtmhpCsJK4jw7Ak=;
        b=CzDQoOBRXW7K56sPeIUqsUg1Qcj+jXdncK9FWNu0DG0GfOdmb9PTi96IW/NoQFUnRC
         71+MpeOjJPgjKj6toF3kn6Q0GTnVW37Slw1hQfnsKMrLSE1sXMs4QUlCDZs8DAGzMtf6
         vtIcN8Dj72XlrwHzJnKzw5i1wkeAyeW2gVoBEqB+uVD9I+rjR3g35xJDkmJunjaRDMuj
         8cUpn/jzeZj9adoqhRHqyjlAxwzbNWDOVfz7qru/irrwgGiEGUTWAO2LdNuvMKDxmRAC
         d//2Z8Mx2Fb/6nhUyLEYbXMJ9FUnU42QSwATO0eL4vXCCOVa3V/2zE8L91B9odrbrBNZ
         M/Tw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=HWqYXxs3;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id af79cd13be357-7d25a5f91bcsi1182758585a.188.2025.06.10.23.47.41
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 23:47:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=HWqYXxs3;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749624461;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ILNx9+PqmhXA3oiuOjj4pN/iEZ3xIG9tPyeo4uqtlxA=;
	b=HWqYXxs3JHTKzEspRScfMEjUS+ZdCsqhXy35PMpQN8ayBNIG60V88AmIPke4rhM6Pe8rXH
	wnlTgEx0FnC78odho2K+i0gVc/mxf7XQv6QD4/TKldTLLmr/VjnLqoQyExZuP5ApVU6Cu4
	nODR1w6tcTM7czoagRuk3jnuELYFshs=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-615-MBiZypMfOiyn-P9Iy7qR1A-1; Wed, 11 Jun 2025 02:47:40 -0400
X-MC-Unique: MBiZypMfOiyn-P9Iy7qR1A-1
X-Mimecast-MFC-AGG-ID: MBiZypMfOiyn-P9Iy7qR1A_1749624459
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-3a5058f9ef4so2912474f8f.2
        for <alex.bennee@linaro.org>; Tue, 10 Jun 2025 23:47:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749624459; x=1750229259;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ILNx9+PqmhXA3oiuOjj4pN/iEZ3xIG9tPyeo4uqtlxA=;
        b=k+udM3lzfmhdtwd0W+48mS8Fm9vug9gYCU8g5pkhC5g9q2XhywaEqI4CmU/7D8jfOr
         jdy1wjEJPoCpjsyo9znYUx1JvW275zbaw/uhVTjx8u1m4i7lrMcKjKW2jsy/whoZGxa0
         nrSLPLs3gSgpftqc7f9QBzboRyT7GUzeDir0Pgm3WS6lCxrYwKI4TXablGejArzwFmPj
         FYsEPcFaDFh7OdK/OCqfTUrk0m/1IEj3WFTgv6N7l8RciKb/PCEBJdsZem9Vzyvac2om
         IO8MzXYm3TKCIHE8kONGBYGFrRkL6AgCEgbFljdtiHjxg9Y6B3Kc+8eFT9O4nzqdWSvg
         HlVQ==
X-Forwarded-Encrypted: i=1; AJvYcCV1IOvAohM0u3hNTyw4goh+Kn2sW9SuprEJEwHuHjKyme9FwNDTBC9RRjHPzoSQtIt5ck9fpogbxUWqCg==@linaro.org
X-Gm-Message-State: AOJu0YxR9csTZpP41TCWmVG2fSR/QJAF4nY6GAXu4KmBgmwE5XIqg4ve
	4oC9m0kxRdd4f5u6q/PsoFwQAck/isj1JGnFhoWfmHMmWSWLyBD2q78tvK62L6FC8dl608JkQb7
	8U4EfHfoEYIBTLt/7lUdo6BE+yOQU6LT2Oxu/YLgP9tEmuuZGuE25GF4ZUA==
X-Gm-Gg: ASbGncsTZSGQKvftykX6zyqTinqb5cewdhvV6I4sz0Y8CmPFZ77oOaXRT4WhftnkZ2x
	Hl210fg4VYGs+bOPslo0MLVpn1+YqKvBCfGZf3ipV+OAgJ+G+YENGEsmX1i2NcRTgzKaDq0OZwD
	2w9PT7rQEmD41sH0++L1CvczDpnjaIUTs7Tj87EDvL2wXrT25hDLw0kQ+gALK4W2r3BvHq6zAat
	tVBlHjaHR/+O1ciVUQfgriVZRMyQ+SDE3l2TZE+8/MhCD+icgUrYwNFCUThJy2BJW4ESv4emWje
	tb5wV/0CGPCrnZyReaa8VL0ELhaxmxJtQA1HHolKANMM1FSxSQs+t+vWH9HUGEkuQ2qUGQ==
X-Received: by 2002:a5d:64e4:0:b0:3a5:39a0:2309 with SMTP id ffacd0b85a97d-3a5587ffd85mr1344706f8f.55.1749624459078;
        Tue, 10 Jun 2025 23:47:39 -0700 (PDT)
X-Received: by 2002:a5d:64e4:0:b0:3a5:39a0:2309 with SMTP id ffacd0b85a97d-3a5587ffd85mr1344680f8f.55.1749624458625;
        Tue, 10 Jun 2025 23:47:38 -0700 (PDT)
Return-Path: <eric.auger@redhat.com>
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874? ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a53244df34sm14501852f8f.71.2025.06.10.23.47.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Jun 2025 23:47:37 -0700 (PDT)
Message-ID: <6374e8f1-8eee-49cb-9c7f-75aaed1a0f08@redhat.com>
Date: Wed, 11 Jun 2025 08:47:36 +0200
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
X-Mimecast-MFC-PROC-ID: mUCGuugsSZsKs6STo5OJm4sUm3D-u8bpu42GBqkZSAc_1749624459
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TUID: P0ek1JXkkkmd

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
What I fail to understand is whether you want me to attach this property
to the GPEX host bridge device or to the GED device. Comment on patch
6/25 seems to indicate you expect it to be attached to the GPEX. I ask
here because also the GED device will need to be configured depending on
the hp setting. Maybe we can retrieve the info from the gpex at that
time. on x86 it is attached to piix4 or ich9 I/O controller hub which do
not have direct equivalent on ARM.

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
