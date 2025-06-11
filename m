Received: by 2002:a17:505:ba85:b0:1be9:327d:8ee3 with SMTP id zs5csp1876761njc;
        Wed, 11 Jun 2025 01:45:19 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWkV3xRDRhdd0WFhvhKTQ5C1Q1VL0Gkj8UqBhVZY+2RTgUXA14DDUOk/W14j/MJgg4WYAbTB9ZC/0MyGg==@linaro.org
X-Google-Smtp-Source: AGHT+IGxmTKUX91Mo2EnbdkRFYFEPhEinihMQca9k6xaD6HFfF9l0O5HMyJaoffrznPxU4tAAhBo
X-Received: by 2002:ad4:5f0c:0:b0:6e8:9e9c:d20f with SMTP id 6a1803df08f44-6fb2c365ed1mr37162336d6.21.1749631519629;
        Wed, 11 Jun 2025 01:45:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1749631519; cv=none;
        d=google.com; s=arc-20240605;
        b=Jn0PSoItjh5ySM3+/38PriUfv4mS+VDnvQAK2kwygh8EmaLSU/UAhak/PvIvWKlXZa
         M34eQArMvK0S4ZoN34GXfp8B2C5+FY1MKECSIisRoFCO8bqJ7jQuCQ8v7zew1UlFh9dc
         f37xpHG26cDdY07Gu6m9GUM87jJqjJnOtdNdIZQc31kyuPf0VeCi2mqFf35zZ76uGKDY
         a01PUQc7jyq88EECB0Rh23HiT9eht8jKlkoQR7O7P6cXLgl30DbaKcuFlhzWSfr/EOPW
         BmpiSlHOtyv9XFe0dPwepAoVYvfOrUyJvzTMfgfbVQacuKdDj//1+SLvHeT7vxUdrnqF
         QXFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:dkim-signature;
        bh=qHcCQnxFNGGxqdNhHq4fI4mDhbRpqL3ndh+sb3zoq/c=;
        fh=QacPIl/5sFMnYe96qcK20ZytCX0EpVpY/Wm25oXvq8E=;
        b=jXbk6wZmtbPbrJintx7uuNMaIEuObcCCkTpEeuXq/j8lhuwZsqm9t3P7A1I5p0IrKr
         wY97DIzcSrAoLcZtVxrW3KEGc9nZY48P4CBdkH74FS6A1WeJo3B4EGNAS3KMLxdBUIxI
         PlQGFjQNDYINPIpoD9WD16q0pncsJjjv16aYxYv9Npz+neVxpA962SZhgf+w0Vc79uTJ
         3hzkNRscSbDTb31FhaLmW3w6BmPHOEvHdbeiE01up5m5Kye9m3OB4PCGsILm84IZ+84I
         qMOjuPn7zbSsUCAWh8Oj+kqlwR6jVg+xrVlhE9AjJ6EtockS2GImoJRRscphMkB8tTYO
         vV7g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=LhOdA0df;
       spf=pass (google.com: domain of imammedo@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=imammedo@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <imammedo@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id 6a1803df08f44-6fb09b25f0bsi128052816d6.244.2025.06.11.01.45.19
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 01:45:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of imammedo@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=LhOdA0df;
       spf=pass (google.com: domain of imammedo@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=imammedo@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749631519;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qHcCQnxFNGGxqdNhHq4fI4mDhbRpqL3ndh+sb3zoq/c=;
	b=LhOdA0dfzDW7gLF+6GZkWHvu+s0dFcsICONBaphf42YdhGAw/ewVwxKlbj5wrbtP4u/Pnb
	zD9qUVv8vg0m8TULiFVgJTv4w4r6Ab8TSVQB9TB04vbbO5kNFFZqwJ5+yeHPxApj/ejpCS
	CIlUWvSy0LVXh5VY6cjqoImZFzwg52g=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-113-GWDLAS_vMW6WdDJQyoXlFg-1; Wed, 11 Jun 2025 04:45:16 -0400
X-MC-Unique: GWDLAS_vMW6WdDJQyoXlFg-1
X-Mimecast-MFC-AGG-ID: GWDLAS_vMW6WdDJQyoXlFg_1749631515
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-450de98b28eso2877025e9.0
        for <alex.bennee@linaro.org>; Wed, 11 Jun 2025 01:45:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749631515; x=1750236315;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qHcCQnxFNGGxqdNhHq4fI4mDhbRpqL3ndh+sb3zoq/c=;
        b=UD7wCgai9sETxNulwwmkG8IS1FEwg1tup4agckuZNMaDJvgVaHOqUmD4NRcY9YpRpf
         p8QbXds1cDQs4VVdBd3OA99iL4FrFz7yiNWpJAEXdyy9imh49lcHoW7L+VQMfZ74Y7aZ
         vnJj/BsuIxOFtA6JpOwz6PZxxcfXM6ROG/tUZ+AyzVD3eemCvNhmiFBsoKZBOn7jxgqV
         VyfWpJ4y+FP5cCYu/TBfWaGhWEqisIERUDwB28ND4obp2H/p08OC2Tc3x6eoNuOl5T0G
         6BuLHF2IlWOUwgurXyjyjgJnwmYOpTgvV5IkZ7UiH5ycR/YWV/gc9OWclFjbL3rs9PiX
         Y1cg==
X-Forwarded-Encrypted: i=1; AJvYcCWI9zVvAjjTxELayUvWRiEpeXbaesrSvHmqTKi8q+WXG3BF11GtBWs/iVyDQr4kDuHkom3RuD5KtPJIYw==@linaro.org
X-Gm-Message-State: AOJu0YybndqrpUA3n7/DxmNN2oL6I1knEH1BCEz7KQWlkHrteItrRXR0
	7GYJ/bKyVMTqtKxICac+Sv+zaHmO95le3lzri9VXxtZgO2bm9anxZfS0JTkLbVPU7H4eB5ANSkC
	jEEtQIA4x4LRK69RiBIsQZEKP+Ap+reLdfem3buicaHEDW/1qxQJFJbsWOg==
X-Gm-Gg: ASbGncthnmz9oCYwKo5txUb7s+pSiD6BXoRItqSKhQKoimTqku6OOKZ1RykDs50I8/h
	9jEfYM2UQyXPLAMBnApP0xRJcT1ARA3MzuvLmbGTU77D72/qbOBpqB9+ubG3FZRkxXFtFWJ09To
	4fD6XIRA6vi0vkIgjVrSmS+7MnEyvF03aZHKkzdw+D+f67vQBBG6tSt0CpcwYBveHIhUF5iIl0+
	gAJwy7YIxitjzvBawQcfKDuCr/H/f9vjuGM937QqgOquUIWUJSRB1Mx7vetCh2yceRzWgQZtA6f
	gQ3LUhJxLfUlrtU9WiTfE2MJ5GrHHmyNnHNGeXFWgUQ=
X-Received: by 2002:a05:600d:d:b0:451:df07:d8e0 with SMTP id 5b1f17b1804b1-453241e3b27mr21780325e9.11.1749631514503;
        Wed, 11 Jun 2025 01:45:14 -0700 (PDT)
X-Received: by 2002:a05:600d:d:b0:451:df07:d8e0 with SMTP id 5b1f17b1804b1-453241e3b27mr21779945e9.11.1749631513947;
        Wed, 11 Jun 2025 01:45:13 -0700 (PDT)
Return-Path: <imammedo@redhat.com>
Received: from imammedo.users.ipa.redhat.com ([85.93.96.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45325205048sm14213375e9.21.2025.06.11.01.45.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 01:45:12 -0700 (PDT)
Date: Wed, 11 Jun 2025 10:45:11 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Cc: eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 peter.maydell@linaro.org, gustavo.romero@linaro.org, anisinha@redhat.com,
 mst@redhat.com, shannon.zhaosl@gmail.com, pbonzini@redhat.com,
 Jonathan.Cameron@huawei.com, philmd@linaro.org, alex.bennee@linaro.org
Subject: Re: [PATCH v2 02/25] hw/arm/virt: Introduce machine state acpi
 pcihp flags and props
Message-ID: <20250611104511.55152616@imammedo.users.ipa.redhat.com>
In-Reply-To: <13792b72-d336-41b8-8ac7-8790e10f833c@redhat.com>
References: <20250527074224.1197793-1-eric.auger@redhat.com>
	<20250527074224.1197793-3-eric.auger@redhat.com>
	<20250527135813.2d6cde91@imammedo.users.ipa.redhat.com>
	<d6bd4794-bcee-4701-8e63-4adee91120d9@redhat.com>
	<20250528123325.750529a4@imammedo.users.ipa.redhat.com>
	<13792b72-d336-41b8-8ac7-8790e10f833c@redhat.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: -b1DngEB_orRQ3NHBs01rws685aC6BtDNJqOrWd8Wl0_1749631515
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-TUID: XA00RhuSRI6D

On Wed, 11 Jun 2025 08:53:28 +0200
Eric Auger <eric.auger@redhat.com> wrote:

> Hi Gustavo, Alex,
> 
> On 5/28/25 12:33 PM, Igor Mammedov wrote:
> > On Tue, 27 May 2025 15:54:15 +0200
> > Eric Auger <eric.auger@redhat.com> wrote:
> >  
> >> Hi Igor,
> >>
> >> On 5/27/25 1:58 PM, Igor Mammedov wrote:  
> >>> On Tue, 27 May 2025 09:40:04 +0200
> >>> Eric Auger <eric.auger@redhat.com> wrote:
> >>>    
> >>>> acpi_pcihp VirtMachineClass state flag will allow
> >>>> to opt in for acpi pci hotplug. This is guarded by a
> >>>> class no_acpi_pcihp flag to manage compats (<= 10.0
> >>>> machine types will not support ACPI PCI hotplug).    
> >>> there is no reason to put an effort in force disabling it
> >>> on old machines, as long as code works when explicitly
> >>> enabled property on CLI.
> >>>
> >>> See comment below on how to deal with it 
> >>>    
> >>>> Machine state acpi_pcihp flag must be set before the creation
> >>>> of the GED device which will use it.
> >>>>
> >>>> Currently the ACPI PCI HP is turned off by default. This will
> >>>> change later on for 10.1 machine type.    
> >>> one thing to note, is that turning it on by default might
> >>> cause change of NIC naming in guest as this brings in
> >>> new "_Sxx" slot naming. /so configs tied to nic  go down the drain/
> >>>
> >>> Naming, we have, also happens to be broken wrt spec
> >>> (it should be unique system wide, there was a gitlab issue for that,
> >>> there is no easy fix that though)
> >>>
> >>> So I'd leave it disabled by default and let users to turn
> >>> it on explicitly when needed.     
> >> what is the status on q35, isn't it enabled by default? If so why
> >> wouldn't we want the same setting on ARM? Is that because of the known
> >> issue you report above?  
> > Above issue is not a blocker (for thae lack of a good way to fix it)
> >
> > on q35 we have had a few complains and fixes, after pcihp was promoted
> > to default (so hopefully that won't happen on with ARM). Also given
> > that ARM VM is less popular like hood breaking someone setup is even less.
> >
> > That said I'd be cautions keep native hotplug as default,
> > and only ones who need ACPI one, could turn it on explicitly.
> >
> > But well it's policies, so it's up to you ARM folks to decide what
> > virt board should look like.  
> What is your preference? Do you prefer enabling ACPI PCI HP by default
> or the opposite.

I'd prefer native PCIe hotplug being default,
that way we have less chance of causing regressions not to mention
less complexity (as acpi pcihp adds up quite a bit of it).

And ones who want/need acpi-pcihp/acpi-index can enable it explicitly,
to play with.

> Anybody else?
> 
> On my end I think I would prefer to have the same default setting than
> on x86 (ie. ACPI PCI hotplug set by default) but I have no strong
> opinion either.
> 
> Thanks
> 
> Eric
> >
> >  
> >> The no_foo compat stuff was especially introduced to avoid breaking the
> >> guest ABI for old machine types (like the NIC naming alternation you evoke).  
> > no_foo is just another way to handle compat stuff,
> > and when it's more than one knob per feature it gets ugly really fast.
> > Hence, I'd prefer pcihp done in x86 way aka:
> >    hw_compat_OLD(ged.use_acpi_hotplug_bridge, false|true)
> > to manage presence of ACPI hotplug on desired machine version.
> > Side benefit it's consistent with how pcihp works on x86
> >  
> >>>    
> >>>> We also introduce properties to allow disabling it.
> >>>>
> >>>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> >>>> Reviewed-by: Gustavo Romero <gustavo.romero@linaro.org>
> >>>> ---
> >>>>  include/hw/arm/virt.h |  2 ++
> >>>>  hw/arm/virt.c         | 27 +++++++++++++++++++++++++++
> >>>>  2 files changed, 29 insertions(+)
> >>>>
> >>>> diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
> >>>> index 9a1b0f53d2..10ea581f06 100644
> >>>> --- a/include/hw/arm/virt.h
> >>>> +++ b/include/hw/arm/virt.h
> >>>> @@ -129,6 +129,7 @@ struct VirtMachineClass {
> >>>>      bool no_tcg_lpa2;
> >>>>      bool no_ns_el2_virt_timer_irq;
> >>>>      bool no_nested_smmu;
> >>>> +    bool no_acpi_pcihp;
> >>>>  };
> >>>>  
> >>>>  struct VirtMachineState {
> >>>> @@ -150,6 +151,7 @@ struct VirtMachineState {
> >>>>      bool mte;
> >>>>      bool dtb_randomness;
> >>>>      bool second_ns_uart_present;
> >>>> +    bool acpi_pcihp;
> >>>>      OnOffAuto acpi;
> >>>>      VirtGICType gic_version;
> >>>>      VirtIOMMUType iommu;
> >>>> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> >>>> index 9a6cd085a3..a0deeaf2b3 100644
> >>>> --- a/hw/arm/virt.c
> >>>> +++ b/hw/arm/virt.c
> >>>> @@ -2397,8 +2397,10 @@ static void machvirt_init(MachineState *machine)
> >>>>      create_pcie(vms);
> >>>>  
> >>>>      if (has_ged && aarch64 && firmware_loaded && virt_is_acpi_enabled(vms)) {
> >>>> +        vms->acpi_pcihp &= !vmc->no_acpi_pcihp;    
> >>> I don't particularly like no_foo naming as it makes code harder to read
> >>> and combined with 'duplicated' field in machine state it make even things worse.
> >>> (if I recall right Philippe was cleaning mess similar flags usage
> >>> have introduced with ITS)
> >>>
> >>> instead of adding machine property (both class and state),
> >>> I'd suggest adding the only property to GPE device (akin to what we have in x86 world)
> >>> And then one can meddle with defaults using hw_compat_xxx    
> >> no_foo still is a largely used pattern in arm virt: no_ged,
> >> kvm_no_adjvtime, no_kvm_steal_time, no_tcg_lpa2, ../.. There are plenty
> >> of them and I am not under the impression this is going to be changed.
> >>
> >> If you refer to 8d23b1df7212 ("hw/arm/virt: Remove
> >> VirtMachineClass::no_its field") I think the no_its was removed because
> >> the machine it applied was removed.
> >>
> >> If I understand correctly you would like the prop to be attached to the
> >> GED device. However the GED device is internally created by the virt
> >> machine code and not passed through a "-device" CLI option. So how would
> >> you pass the option on the cmd line if you don't want it to be set by
> >> default per machine type?
> >>
> >> Thanks
> >>
> >> Eric  
> >>>    
> >>>>          vms->acpi_dev = create_acpi_ged(vms);
> >>>>      } else {
> >>>> +        vms->acpi_pcihp = false;
> >>>>          create_gpio_devices(vms, VIRT_GPIO, sysmem);
> >>>>      }
> >>>>  
> >>>> @@ -2593,6 +2595,20 @@ static void virt_set_its(Object *obj, bool value, Error **errp)
> >>>>      vms->its = value;
> >>>>  }
> >>>>  
> >>>> +static bool virt_get_acpi_pcihp(Object *obj, Error **errp)
> >>>> +{
> >>>> +    VirtMachineState *vms = VIRT_MACHINE(obj);
> >>>> +
> >>>> +    return vms->acpi_pcihp;
> >>>> +}
> >>>> +
> >>>> +static void virt_set_acpi_pcihp(Object *obj, bool value, Error **errp)
> >>>> +{
> >>>> +    VirtMachineState *vms = VIRT_MACHINE(obj);
> >>>> +
> >>>> +    vms->acpi_pcihp = value;
> >>>> +}
> >>>> +
> >>>>  static bool virt_get_dtb_randomness(Object *obj, Error **errp)
> >>>>  {
> >>>>      VirtMachineState *vms = VIRT_MACHINE(obj);
> >>>> @@ -3310,6 +3326,10 @@ static void virt_machine_class_init(ObjectClass *oc, const void *data)
> >>>>                                            "in ACPI table header."
> >>>>                                            "The string may be up to 8 bytes in size");
> >>>>  
> >>>> +    object_class_property_add_bool(oc, "acpi-pcihp",
> >>>> +                                   virt_get_acpi_pcihp, virt_set_acpi_pcihp);
> >>>> +    object_class_property_set_description(oc, "acpi-pcihp",
> >>>> +                                          "Force ACPI PCI hotplug");
> >>>>  }
> >>>>  
> >>>>  static void virt_instance_init(Object *obj)
> >>>> @@ -3344,6 +3364,9 @@ static void virt_instance_init(Object *obj)
> >>>>          vms->tcg_its = true;
> >>>>      }
> >>>>  
> >>>> +    /* default disallows ACPI PCI hotplug */
> >>>> +    vms->acpi_pcihp = false;
> >>>> +
> >>>>      /* Default disallows iommu instantiation */
> >>>>      vms->iommu = VIRT_IOMMU_NONE;
> >>>>  
> >>>> @@ -3394,8 +3417,12 @@ DEFINE_VIRT_MACHINE_AS_LATEST(10, 1)
> >>>>  
> >>>>  static void virt_machine_10_0_options(MachineClass *mc)
> >>>>  {
> >>>> +    VirtMachineClass *vmc = VIRT_MACHINE_CLASS(OBJECT_CLASS(mc));
> >>>> +
> >>>>      virt_machine_10_1_options(mc);
> >>>>      compat_props_add(mc->compat_props, hw_compat_10_0, hw_compat_10_0_len);
> >>>> +    /* 10.0 and earlier do not support ACPI PCI hotplug */
> >>>> +    vmc->no_acpi_pcihp = true;
> >>>>  }
> >>>>  DEFINE_VIRT_MACHINE(10, 0)
> >>>>      
> 
