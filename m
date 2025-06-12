Received: by 2002:a17:505:ba85:b0:1be9:327d:8ee3 with SMTP id zs5csp2369447njc;
        Thu, 12 Jun 2025 05:55:42 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXqHjczzMi8riXqp3zVe2RrrK7WB1/Bv7LADNi9lLAck3ITgQwW0VQuEVtT35/7eJS9pIl5oqDqWxFemg==@linaro.org
X-Google-Smtp-Source: AGHT+IGDrBSHhh9t/j1FvEBOgqxzXXhB27CPNtzJb7daM5INhvwIZSb0RQnHHcxBDnCo4CuJZUrS
X-Received: by 2002:a0c:e8c2:0:b0:6f8:af2b:8ba4 with SMTP id 6a1803df08f44-6fb2c3661b6mr91543986d6.21.1749732942558;
        Thu, 12 Jun 2025 05:55:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1749732942; cv=none;
        d=google.com; s=arc-20240605;
        b=BBA8y1fnMP41RCTyUTdWG+pjH9aIVLYFdQ2cloPUFaVCjp4XFvTbvgrq330o7UvjUi
         y+TWWubIUKUtUSqA7jOLdb2QxZLyuS8IMWvhn1p8lWvygzhKjku5kjoweOugZ0YNb//w
         qd103J9I3ywWS/dkfO18ihurcoHNVJOmqOZWe7OGXJ3ADWat6khYRNhJ2W/+Ze+Pus+O
         YXJLyca4Mi8Ups7bMhHQ+752F7z8tMiijepFYHDm6y2B5ea9e1cPv4Y4FOqrxDNdOBxo
         gCZkANLT6f+zWVaIp7KpzkgT435Gc3hs78RTgeP79025NxbZUdu81FnMoVmd6KE2HjnR
         erSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:dkim-signature;
        bh=bKuxI3g3S4mxPFm1tdz4EAQU9fdobeVgH2EL/uTfTR8=;
        fh=CRxtNv/o/KhIZzBzzQEqR1POhXKtyhL0/Qei/gVs4+o=;
        b=biuNFqRlvgxn+DOzAV1TNyZZZiPYEcJgksaUCvLLagooykSR/ijaiaAGBCPXa7e6Tk
         aAdD4+y+6TLhKyn7kiUc39z56MVGMzxzLc6D2Pnq8MClmxyUlmcHce5eSePmZgzN/IvW
         rZJ3GlEYmzAnhF+pWZS3EGWeokp6bw+lHpY8c2LMdHyvaQr+Iyb41bRW6uYXfRIIrQY8
         AZ35QOL3qOpe6flhReOEcLFAAR7wQDIdpjimU1ZnxHIzA7c6TswHX4HTI3GodUtvjs8L
         t628Qq2mr4k+lkgzClg2mmzHcGQlXjl+DL4jduxZsFiwyMs0AxJIEE5qyirY50rxkHqw
         quQg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=JOPgRb5Z;
       spf=pass (google.com: domain of imammedo@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=imammedo@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <imammedo@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id 6a1803df08f44-6fb35c316fdsi15925856d6.439.2025.06.12.05.55.42
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 05:55:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of imammedo@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=JOPgRb5Z;
       spf=pass (google.com: domain of imammedo@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=imammedo@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749732941;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bKuxI3g3S4mxPFm1tdz4EAQU9fdobeVgH2EL/uTfTR8=;
	b=JOPgRb5Z6mG/qPUngwPcgojakSgXV6fpYyrsDMuHvDpSa3JRKtyKSIG2fDVTYgEob1cQPH
	1xgwLxxNe615f2zLJTWNCB28ZzjbICDNVn2rmjno+4nEORDih8CIQbciNX2k3j65FTWTmW
	6/mRXFw1cGj2LKhclGE6vWLpBAMT390=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-425-IX79kiyAM_29eLxRCSF-Uw-1; Thu, 12 Jun 2025 08:55:40 -0400
X-MC-Unique: IX79kiyAM_29eLxRCSF-Uw-1
X-Mimecast-MFC-AGG-ID: IX79kiyAM_29eLxRCSF-Uw_1749732939
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-3a4f8192e2cso499803f8f.3
        for <alex.bennee@linaro.org>; Thu, 12 Jun 2025 05:55:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749732939; x=1750337739;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bKuxI3g3S4mxPFm1tdz4EAQU9fdobeVgH2EL/uTfTR8=;
        b=bHp/6Ewu/caBIX8kZeAVPHGj3Xg6YpC1t95Vz7Yq5I1OXTPsUMRuaJq/Hlci2XMarL
         QeDtbYgThq8TIRsxGz5I/R/fE++TsKY7kwJQ4/kicFC7EPUqGd5BLUKSHDSJ8KlOcyR8
         vChjdINeXRUy8cuKrW8E31grSaAEo9gHfwhLAy2AYvP/Arh+u615+7ZXOUczbbmauq9X
         NGAi9W/wUgTyFNbF9ExfX27w2GmIY6p8Le2wONz9uS6EXD5zjGt4hC0sL753ydz5mNGv
         g9V3O06KfXsiPv7+NBJY9iTDq96IopsRLecqPXmYnUqfyqj9gz8Lp6PopVwStytmOs0j
         ps9Q==
X-Forwarded-Encrypted: i=1; AJvYcCVoM8z40V47YS4BEbjAhG9adTUNWm+IN+K4nANh8AJ1yiF5SLaySF5tmttjyozTDUsRxKSFvbpII9JAMQ==@linaro.org
X-Gm-Message-State: AOJu0YwYFuhAkgD0KtMjSpuD+ZVNZI8LGVCDVXGsTbKtinT3PS21lFAo
	wx4lFSxfvLeM6JtPHI3bRrXIstNSnHCGI/g2Cq1Mi94vBJRwher2JOG08brhIyDX7N/i/lPArcs
	6Q/PMbIl1JT33q4DlF9ZOpKPsRMhrvt9q1yLeRzUpG/3JuJ6hDE2PfATFOQ==
X-Gm-Gg: ASbGncuHmo09Qkp/4OwS7uzPmzeKlZo7JycdKEx/ScGvYOXjy+HCB4B+lUop3qNv1Tp
	psOvk7EdnK2YMCm0SVi1cReb6kwvusB4uGAn1/YUXcei7jTCYKiZJS0gQC8sjOtP3Ml7Hf1dh9Z
	0PvQSmWTQXW0LXuH2Kh5xmAx5v87MV8/lsRGmbdIY+zon7qaqnIutNdfa/lAgjAmGwudwwg2jp3
	omgzy6LFcOLccmCmrJq/xznMet8Tu5cmnKApZzFC5WVv/BDf+5Ik8AspQGWyRv1EYTn1FwY3iJI
	H6Qtsrle489Wsw05QtaWbSZYijKeaCkQ4POnWPqcgtA=
X-Received: by 2002:a05:6000:1787:b0:3a4:e706:52f5 with SMTP id ffacd0b85a97d-3a56133d9d0mr2602240f8f.13.1749732939329;
        Thu, 12 Jun 2025 05:55:39 -0700 (PDT)
X-Received: by 2002:a05:6000:1787:b0:3a4:e706:52f5 with SMTP id ffacd0b85a97d-3a56133d9d0mr2602217f8f.13.1749732938836;
        Thu, 12 Jun 2025 05:55:38 -0700 (PDT)
Return-Path: <imammedo@redhat.com>
Received: from imammedo.users.ipa.redhat.com ([85.93.96.130])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a561b4baa8sm1926963f8f.72.2025.06.12.05.55.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 05:55:38 -0700 (PDT)
Date: Thu, 12 Jun 2025 14:55:37 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Cc: eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 peter.maydell@linaro.org, gustavo.romero@linaro.org, anisinha@redhat.com,
 mst@redhat.com, shannon.zhaosl@gmail.com, pbonzini@redhat.com,
 Jonathan.Cameron@huawei.com, philmd@linaro.org, alex.bennee@linaro.org
Subject: Re: [PATCH v2 02/25] hw/arm/virt: Introduce machine state acpi
 pcihp flags and props
Message-ID: <20250612145537.7dff93a8@imammedo.users.ipa.redhat.com>
In-Reply-To: <05680827-85d9-4ebd-91a7-93e262da52f5@redhat.com>
References: <20250527074224.1197793-1-eric.auger@redhat.com>
	<20250527074224.1197793-3-eric.auger@redhat.com>
	<20250527135813.2d6cde91@imammedo.users.ipa.redhat.com>
	<d6bd4794-bcee-4701-8e63-4adee91120d9@redhat.com>
	<20250528123325.750529a4@imammedo.users.ipa.redhat.com>
	<13792b72-d336-41b8-8ac7-8790e10f833c@redhat.com>
	<20250611104511.55152616@imammedo.users.ipa.redhat.com>
	<05680827-85d9-4ebd-91a7-93e262da52f5@redhat.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: U846mjP30UTsBHaNwFOgMJEpFvb2UAz7nYdpXs33Ct0_1749732939
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-TUID: PwgNwD8qLcrt

On Wed, 11 Jun 2025 10:50:04 +0200
Eric Auger <eric.auger@redhat.com> wrote:

> Hi Igor,
> On 6/11/25 10:45 AM, Igor Mammedov wrote:
> > On Wed, 11 Jun 2025 08:53:28 +0200
> > Eric Auger <eric.auger@redhat.com> wrote:
> >  
> >> Hi Gustavo, Alex,
> >>
> >> On 5/28/25 12:33 PM, Igor Mammedov wrote:  
> >>> On Tue, 27 May 2025 15:54:15 +0200
> >>> Eric Auger <eric.auger@redhat.com> wrote:
> >>>    
> >>>> Hi Igor,
> >>>>
> >>>> On 5/27/25 1:58 PM, Igor Mammedov wrote:    
> >>>>> On Tue, 27 May 2025 09:40:04 +0200
> >>>>> Eric Auger <eric.auger@redhat.com> wrote:
> >>>>>      
> >>>>>> acpi_pcihp VirtMachineClass state flag will allow
> >>>>>> to opt in for acpi pci hotplug. This is guarded by a
> >>>>>> class no_acpi_pcihp flag to manage compats (<= 10.0
> >>>>>> machine types will not support ACPI PCI hotplug).      
> >>>>> there is no reason to put an effort in force disabling it
> >>>>> on old machines, as long as code works when explicitly
> >>>>> enabled property on CLI.
> >>>>>
> >>>>> See comment below on how to deal with it 
> >>>>>      
> >>>>>> Machine state acpi_pcihp flag must be set before the creation
> >>>>>> of the GED device which will use it.
> >>>>>>
> >>>>>> Currently the ACPI PCI HP is turned off by default. This will
> >>>>>> change later on for 10.1 machine type.      
> >>>>> one thing to note, is that turning it on by default might
> >>>>> cause change of NIC naming in guest as this brings in
> >>>>> new "_Sxx" slot naming. /so configs tied to nic  go down the drain/
> >>>>>
> >>>>> Naming, we have, also happens to be broken wrt spec
> >>>>> (it should be unique system wide, there was a gitlab issue for that,
> >>>>> there is no easy fix that though)
> >>>>>
> >>>>> So I'd leave it disabled by default and let users to turn
> >>>>> it on explicitly when needed.       
> >>>> what is the status on q35, isn't it enabled by default? If so why
> >>>> wouldn't we want the same setting on ARM? Is that because of the known
> >>>> issue you report above?    
> >>> Above issue is not a blocker (for thae lack of a good way to fix it)
> >>>
> >>> on q35 we have had a few complains and fixes, after pcihp was promoted
> >>> to default (so hopefully that won't happen on with ARM). Also given
> >>> that ARM VM is less popular like hood breaking someone setup is even less.
> >>>
> >>> That said I'd be cautions keep native hotplug as default,
> >>> and only ones who need ACPI one, could turn it on explicitly.
> >>>
> >>> But well it's policies, so it's up to you ARM folks to decide what
> >>> virt board should look like.    
> >> What is your preference? Do you prefer enabling ACPI PCI HP by default
> >> or the opposite.  
> > I'd prefer native PCIe hotplug being default,
> > that way we have less chance of causing regressions not to mention
> > less complexity (as acpi pcihp adds up quite a bit of it).
> >
> > And ones who want/need acpi-pcihp/acpi-index can enable it explicitly,
> > to play with.  
> 
> OK I will follow your suggestion. You have definitively more expertise
> than me here ! ;-)

So far what I suggest looks like better option compared to multiple machine knobs
fiddling. But I can easily change my mind once I see respin, if experiment
with compat props is not coming well together.

> 
> Thanks!
> 
> Eric
> >  
> >> Anybody else?
> >>
> >> On my end I think I would prefer to have the same default setting than
> >> on x86 (ie. ACPI PCI hotplug set by default) but I have no strong
> >> opinion either.
> >>
> >> Thanks
> >>
> >> Eric  
> >>>    
> >>>> The no_foo compat stuff was especially introduced to avoid breaking the
> >>>> guest ABI for old machine types (like the NIC naming alternation you evoke).    
> >>> no_foo is just another way to handle compat stuff,
> >>> and when it's more than one knob per feature it gets ugly really fast.
> >>> Hence, I'd prefer pcihp done in x86 way aka:
> >>>    hw_compat_OLD(ged.use_acpi_hotplug_bridge, false|true)
> >>> to manage presence of ACPI hotplug on desired machine version.
> >>> Side benefit it's consistent with how pcihp works on x86
> >>>    
> >>>>>      
> >>>>>> We also introduce properties to allow disabling it.
> >>>>>>
> >>>>>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> >>>>>> Reviewed-by: Gustavo Romero <gustavo.romero@linaro.org>
> >>>>>> ---
> >>>>>>  include/hw/arm/virt.h |  2 ++
> >>>>>>  hw/arm/virt.c         | 27 +++++++++++++++++++++++++++
> >>>>>>  2 files changed, 29 insertions(+)
> >>>>>>
> >>>>>> diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
> >>>>>> index 9a1b0f53d2..10ea581f06 100644
> >>>>>> --- a/include/hw/arm/virt.h
> >>>>>> +++ b/include/hw/arm/virt.h
> >>>>>> @@ -129,6 +129,7 @@ struct VirtMachineClass {
> >>>>>>      bool no_tcg_lpa2;
> >>>>>>      bool no_ns_el2_virt_timer_irq;
> >>>>>>      bool no_nested_smmu;
> >>>>>> +    bool no_acpi_pcihp;
> >>>>>>  };
> >>>>>>  
> >>>>>>  struct VirtMachineState {
> >>>>>> @@ -150,6 +151,7 @@ struct VirtMachineState {
> >>>>>>      bool mte;
> >>>>>>      bool dtb_randomness;
> >>>>>>      bool second_ns_uart_present;
> >>>>>> +    bool acpi_pcihp;
> >>>>>>      OnOffAuto acpi;
> >>>>>>      VirtGICType gic_version;
> >>>>>>      VirtIOMMUType iommu;
> >>>>>> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> >>>>>> index 9a6cd085a3..a0deeaf2b3 100644
> >>>>>> --- a/hw/arm/virt.c
> >>>>>> +++ b/hw/arm/virt.c
> >>>>>> @@ -2397,8 +2397,10 @@ static void machvirt_init(MachineState *machine)
> >>>>>>      create_pcie(vms);
> >>>>>>  
> >>>>>>      if (has_ged && aarch64 && firmware_loaded && virt_is_acpi_enabled(vms)) {
> >>>>>> +        vms->acpi_pcihp &= !vmc->no_acpi_pcihp;      
> >>>>> I don't particularly like no_foo naming as it makes code harder to read
> >>>>> and combined with 'duplicated' field in machine state it make even things worse.
> >>>>> (if I recall right Philippe was cleaning mess similar flags usage
> >>>>> have introduced with ITS)
> >>>>>
> >>>>> instead of adding machine property (both class and state),
> >>>>> I'd suggest adding the only property to GPE device (akin to what we have in x86 world)
> >>>>> And then one can meddle with defaults using hw_compat_xxx      
> >>>> no_foo still is a largely used pattern in arm virt: no_ged,
> >>>> kvm_no_adjvtime, no_kvm_steal_time, no_tcg_lpa2, ../.. There are plenty
> >>>> of them and I am not under the impression this is going to be changed.
> >>>>
> >>>> If you refer to 8d23b1df7212 ("hw/arm/virt: Remove
> >>>> VirtMachineClass::no_its field") I think the no_its was removed because
> >>>> the machine it applied was removed.
> >>>>
> >>>> If I understand correctly you would like the prop to be attached to the
> >>>> GED device. However the GED device is internally created by the virt
> >>>> machine code and not passed through a "-device" CLI option. So how would
> >>>> you pass the option on the cmd line if you don't want it to be set by
> >>>> default per machine type?
> >>>>
> >>>> Thanks
> >>>>
> >>>> Eric    
> >>>>>      
> >>>>>>          vms->acpi_dev = create_acpi_ged(vms);
> >>>>>>      } else {
> >>>>>> +        vms->acpi_pcihp = false;
> >>>>>>          create_gpio_devices(vms, VIRT_GPIO, sysmem);
> >>>>>>      }
> >>>>>>  
> >>>>>> @@ -2593,6 +2595,20 @@ static void virt_set_its(Object *obj, bool value, Error **errp)
> >>>>>>      vms->its = value;
> >>>>>>  }
> >>>>>>  
> >>>>>> +static bool virt_get_acpi_pcihp(Object *obj, Error **errp)
> >>>>>> +{
> >>>>>> +    VirtMachineState *vms = VIRT_MACHINE(obj);
> >>>>>> +
> >>>>>> +    return vms->acpi_pcihp;
> >>>>>> +}
> >>>>>> +
> >>>>>> +static void virt_set_acpi_pcihp(Object *obj, bool value, Error **errp)
> >>>>>> +{
> >>>>>> +    VirtMachineState *vms = VIRT_MACHINE(obj);
> >>>>>> +
> >>>>>> +    vms->acpi_pcihp = value;
> >>>>>> +}
> >>>>>> +
> >>>>>>  static bool virt_get_dtb_randomness(Object *obj, Error **errp)
> >>>>>>  {
> >>>>>>      VirtMachineState *vms = VIRT_MACHINE(obj);
> >>>>>> @@ -3310,6 +3326,10 @@ static void virt_machine_class_init(ObjectClass *oc, const void *data)
> >>>>>>                                            "in ACPI table header."
> >>>>>>                                            "The string may be up to 8 bytes in size");
> >>>>>>  
> >>>>>> +    object_class_property_add_bool(oc, "acpi-pcihp",
> >>>>>> +                                   virt_get_acpi_pcihp, virt_set_acpi_pcihp);
> >>>>>> +    object_class_property_set_description(oc, "acpi-pcihp",
> >>>>>> +                                          "Force ACPI PCI hotplug");
> >>>>>>  }
> >>>>>>  
> >>>>>>  static void virt_instance_init(Object *obj)
> >>>>>> @@ -3344,6 +3364,9 @@ static void virt_instance_init(Object *obj)
> >>>>>>          vms->tcg_its = true;
> >>>>>>      }
> >>>>>>  
> >>>>>> +    /* default disallows ACPI PCI hotplug */
> >>>>>> +    vms->acpi_pcihp = false;
> >>>>>> +
> >>>>>>      /* Default disallows iommu instantiation */
> >>>>>>      vms->iommu = VIRT_IOMMU_NONE;
> >>>>>>  
> >>>>>> @@ -3394,8 +3417,12 @@ DEFINE_VIRT_MACHINE_AS_LATEST(10, 1)
> >>>>>>  
> >>>>>>  static void virt_machine_10_0_options(MachineClass *mc)
> >>>>>>  {
> >>>>>> +    VirtMachineClass *vmc = VIRT_MACHINE_CLASS(OBJECT_CLASS(mc));
> >>>>>> +
> >>>>>>      virt_machine_10_1_options(mc);
> >>>>>>      compat_props_add(mc->compat_props, hw_compat_10_0, hw_compat_10_0_len);
> >>>>>> +    /* 10.0 and earlier do not support ACPI PCI hotplug */
> >>>>>> +    vmc->no_acpi_pcihp = true;
> >>>>>>  }
> >>>>>>  DEFINE_VIRT_MACHINE(10, 0)
> >>>>>>        
> 
