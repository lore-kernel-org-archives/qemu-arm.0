Received: by 2002:a17:505:ba85:b0:1be9:327d:8ee3 with SMTP id zs5csp1878233njc;
        Wed, 11 Jun 2025 01:49:20 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXN4IpAEK6ICbK40ZT0knOwf2ot5WANNCMVVxsayGpnZWkYOSBMCBp3itZ8qn5Su1e3p6oQfiNRrB+2xA==@linaro.org
X-Google-Smtp-Source: AGHT+IE3+G1KS7XT2ApXxkC7Exdsa3g2LhgAn81wLkAEO0zETOPgNTpTto8+bRX/Qzg8hgqi+FiQ
X-Received: by 2002:a05:6214:252b:b0:6fb:51c:395 with SMTP id 6a1803df08f44-6fb2d1f16damr25901336d6.41.1749631760694;
        Wed, 11 Jun 2025 01:49:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1749631760; cv=none;
        d=google.com; s=arc-20240605;
        b=TOKwnhh7JupRKe4E3lV0i8FdHthA/M67Ki9B2lO5L0F7jaN4XSGhVpQKIKI6YnjlUo
         Qn2gfEc/xYauP+5lpn6u6pAFSvcmzBBEubwVl/JxHvBWTsIYv59NS7l10WTdyd//q3i4
         MeNHuxEyRLqYcemLzvuB1O6TIgB/ZhIC3K3l9dLJvZupmvXSakrcwBTo3HiFCWZcN2ko
         O24pLE2GsngW+WeWuao2j1efXp49O2OChONhSw8vATiyE7gafUwqlD4AdlQqII2A9E73
         mOeVVOwdO1M/WD2owQkK8swCi4bCvv06U/UFDrSdC733B6qaSSBF4t/KupYTrK4d/WpJ
         5Mrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:dkim-signature;
        bh=kXcFn0ZtApWQfoXTCpm0D9O5l7K3NG1NHyLY/dvsC9w=;
        fh=GXGuKf22robo2Ds/ERuNP0csMbQvTCx6zJ44eD/wJAE=;
        b=i9RVFvD33L+seL6sw+aZMo9Gl0keR8CU0uAmkY5diPswX3Xkhw2Y8OkGQTNKUzsefV
         Q4u/yjHqVOHU3Byky92b2gXJowUfFAQqSHqAA+UcsuVBWa6Q83k7BN3hz9CeZL3/EyJ7
         wzivZlNADUWlvvhrbE7Ztv3aVio7WiXDIn5I6BeCjaMRZllwaXJh/jCTmmtZZVbOL7su
         iwkTdcTYfpF1WJ6b6qRa1QEfQMS4WyoaERcNHocktDOWXSVyHIMw+fXJy7IrV7OwiEXv
         lWcbktm/xMR+c86iDfWEl001hBN3Ix1ev4+Qo580s6ky+ywW0V1ci6Wu4qEFOYy9+uAH
         Zlxw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=TeZeqnu9;
       spf=pass (google.com: domain of imammedo@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=imammedo@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <imammedo@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id 6a1803df08f44-6fb09b2fe55si115821516d6.436.2025.06.11.01.49.20
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 01:49:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of imammedo@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=TeZeqnu9;
       spf=pass (google.com: domain of imammedo@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=imammedo@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749631760;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kXcFn0ZtApWQfoXTCpm0D9O5l7K3NG1NHyLY/dvsC9w=;
	b=TeZeqnu9j24zNdySoXUWs+HmWqGK0w5AVXCWvqZabVfUHLVkZZtwFfOodjQZ6IKeYncaBC
	cRzq+CqLIcn8VKpNTHZaKEQRmhalEeKtzLm4dHt3wHXJEhkq/c8H3dkPWyIOEPs61RAhSW
	x80MFcbTuk/tDUNdYNKuT54GXaJhybk=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-554-JCyPv1jCOzGLL6U6_s3gOw-1; Wed, 11 Jun 2025 04:49:19 -0400
X-MC-Unique: JCyPv1jCOzGLL6U6_s3gOw-1
X-Mimecast-MFC-AGG-ID: JCyPv1jCOzGLL6U6_s3gOw_1749631758
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3a50049f8eeso2859131f8f.3
        for <alex.bennee@linaro.org>; Wed, 11 Jun 2025 01:49:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749631758; x=1750236558;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kXcFn0ZtApWQfoXTCpm0D9O5l7K3NG1NHyLY/dvsC9w=;
        b=fLXdwGPyYOH6f9gmUfwDyzg4kzlICuMUR6Tc9DCYvEDJQFrkJEy8B2+9RF6y3j9XQq
         ++pmRDZqb/3kLvjh5geV8teyv6LWHwZ7iKH4tCZgubE/2L+qEzAPra6KORRoL5Loclat
         7bBYVnHLORRTi38yL/5kbnwcnBpiP6u+3NalCHdzXROqaER1kmLDLCRbZDXsR5wTqouJ
         y72ZFr5JBGuaWi5BLWs9IXrvO+8vsxrRckIAzhWeBjIXYojQG9B/uAQqUtqB6l1uNnDZ
         AEBKy3LjS+B/F38EUavhkZCmFYNsK/EfYVcOy4m3vUFSH6RZNLo7/c3beA88rCUP+Jt8
         gx/A==
X-Forwarded-Encrypted: i=1; AJvYcCVyR14y3ePpmNptb6Y0Xxh28qgMGskVndLhGaW9T8dw9Vh0mFzZ8yLZfcg+Vr2khafB4dXQTTKY8hgmMw==@linaro.org
X-Gm-Message-State: AOJu0YwbvYMk4BdSdfG0lWUQkNwB1HMP0ASPXj3iJsHrG4gi25tQC22d
	swjFEff4G5ssJdO+gSPrEBUO856RhXOn3Jt61JEFQzdCWXuGa0JoTL/kWAbhUFJIDmMa87YzjkT
	3L7nXqOD1l634rLMJbdr+6vmGebAgjZ6z666t0WkTewHpMSAqVeFYu8L8dA==
X-Gm-Gg: ASbGncuhdj36Km6E5Eosb8j2wOCOKIQqakuGAWfO6ISwRjJbbm/gnC5tzuqRjgtzGqE
	+Om5QB+3SUEOgaU0UX5lonCK8GsGp+aDtkjow/TqZTDyoPYg0c6RAcDb37Y78cMGXXzU+X8UFcB
	Qqj1zNV/AcfuIx3tW0p95+Yzpp49qGwTyMvDYDdkZI9kWi5duspvTY9rHCVMxNa0IQAr3s2CsfD
	lGzFIaBHdQi+GI/G3HfSHNnyloQmMbAG8/UUZMRIuPO8CUWrLcnpitWCNO4axYeONo/+IuXce20
	7TA5r8TXX+qAXXO6oGtdLgDkcJA/w3NBzeUljT+wfpM=
X-Received: by 2002:a5d:5271:0:b0:3a4:f90c:31e3 with SMTP id ffacd0b85a97d-3a558acbd57mr1199084f8f.31.1749631757688;
        Wed, 11 Jun 2025 01:49:17 -0700 (PDT)
X-Received: by 2002:a5d:5271:0:b0:3a4:f90c:31e3 with SMTP id ffacd0b85a97d-3a558acbd57mr1199059f8f.31.1749631757224;
        Wed, 11 Jun 2025 01:49:17 -0700 (PDT)
Return-Path: <imammedo@redhat.com>
Received: from imammedo.users.ipa.redhat.com ([85.93.96.130])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a53229d9e9sm14806339f8f.13.2025.06.11.01.49.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 01:49:16 -0700 (PDT)
Date: Wed, 11 Jun 2025 10:49:15 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Cc: eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 peter.maydell@linaro.org, gustavo.romero@linaro.org, anisinha@redhat.com,
 mst@redhat.com, shannon.zhaosl@gmail.com, pbonzini@redhat.com,
 Jonathan.Cameron@huawei.com, philmd@linaro.org, alex.bennee@linaro.org
Subject: Re: [PATCH v2 02/25] hw/arm/virt: Introduce machine state acpi
 pcihp flags and props
Message-ID: <20250611104915.5a5a2bea@imammedo.users.ipa.redhat.com>
In-Reply-To: <6374e8f1-8eee-49cb-9c7f-75aaed1a0f08@redhat.com>
References: <20250527074224.1197793-1-eric.auger@redhat.com>
	<20250527074224.1197793-3-eric.auger@redhat.com>
	<20250527135813.2d6cde91@imammedo.users.ipa.redhat.com>
	<6374e8f1-8eee-49cb-9c7f-75aaed1a0f08@redhat.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: OOI2YIxfj6PoqwN6IMEdQq4nnGL1WoS7aAekcy5OC8w_1749631758
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-TUID: kRe26/BGfHHl

On Wed, 11 Jun 2025 08:47:36 +0200
Eric Auger <eric.auger@redhat.com> wrote:

> Hi Igor,
> 
> On 5/27/25 1:58 PM, Igor Mammedov wrote:
> > On Tue, 27 May 2025 09:40:04 +0200
> > Eric Auger <eric.auger@redhat.com> wrote:
> >  
> >> acpi_pcihp VirtMachineClass state flag will allow
> >> to opt in for acpi pci hotplug. This is guarded by a
> >> class no_acpi_pcihp flag to manage compats (<= 10.0
> >> machine types will not support ACPI PCI hotplug).  
> > there is no reason to put an effort in force disabling it
> > on old machines, as long as code works when explicitly
> > enabled property on CLI.
> >
> > See comment below on how to deal with it 
> >  
> >> Machine state acpi_pcihp flag must be set before the creation
> >> of the GED device which will use it.
> >>
> >> Currently the ACPI PCI HP is turned off by default. This will
> >> change later on for 10.1 machine type.  
> > one thing to note, is that turning it on by default might
> > cause change of NIC naming in guest as this brings in
> > new "_Sxx" slot naming. /so configs tied to nic  go down the drain/
> >
> > Naming, we have, also happens to be broken wrt spec
> > (it should be unique system wide, there was a gitlab issue for that,
> > there is no easy fix that though)
> >
> > So I'd leave it disabled by default and let users to turn
> > it on explicitly when needed. 
> >  
> >> We also introduce properties to allow disabling it.
> >>
> >> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> >> Reviewed-by: Gustavo Romero <gustavo.romero@linaro.org>
> >> ---
> >>  include/hw/arm/virt.h |  2 ++
> >>  hw/arm/virt.c         | 27 +++++++++++++++++++++++++++
> >>  2 files changed, 29 insertions(+)
> >>
> >> diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
> >> index 9a1b0f53d2..10ea581f06 100644
> >> --- a/include/hw/arm/virt.h
> >> +++ b/include/hw/arm/virt.h
> >> @@ -129,6 +129,7 @@ struct VirtMachineClass {
> >>      bool no_tcg_lpa2;
> >>      bool no_ns_el2_virt_timer_irq;
> >>      bool no_nested_smmu;
> >> +    bool no_acpi_pcihp;
> >>  };
> >>  
> >>  struct VirtMachineState {
> >> @@ -150,6 +151,7 @@ struct VirtMachineState {
> >>      bool mte;
> >>      bool dtb_randomness;
> >>      bool second_ns_uart_present;
> >> +    bool acpi_pcihp;
> >>      OnOffAuto acpi;
> >>      VirtGICType gic_version;
> >>      VirtIOMMUType iommu;
> >> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> >> index 9a6cd085a3..a0deeaf2b3 100644
> >> --- a/hw/arm/virt.c
> >> +++ b/hw/arm/virt.c
> >> @@ -2397,8 +2397,10 @@ static void machvirt_init(MachineState *machine)
> >>      create_pcie(vms);
> >>  
> >>      if (has_ged && aarch64 && firmware_loaded && virt_is_acpi_enabled(vms)) {
> >> +        vms->acpi_pcihp &= !vmc->no_acpi_pcihp;  
> > I don't particularly like no_foo naming as it makes code harder to read
> > and combined with 'duplicated' field in machine state it make even things worse.
> > (if I recall right Philippe was cleaning mess similar flags usage
> > have introduced with ITS)
> >
> > instead of adding machine property (both class and state),
> > I'd suggest adding the only property to GPE device (akin to what we have in x86 world)
> > And then one can meddle with defaults using hw_compat_xxx  
> What I fail to understand is whether you want me to attach this property
> to the GPEX host bridge device or to the GED device. Comment on patch

I'd say GED.

> 6/25 seems to indicate you expect it to be attached to the GPEX. I ask
> here because also the GED device will need to be configured depending on
> the hp setting. Maybe we can retrieve the info from the gpex at that
> time. on x86 it is attached to piix4 or ich9 I/O controller hub which do
> not have direct equivalent on ARM.

for ARM, equivalent would be GED device which hosts our paravirt acpi registers.

> 
> Thanks
> 
> Eric
> >
> >  
> >>          vms->acpi_dev = create_acpi_ged(vms);
> >>      } else {
> >> +        vms->acpi_pcihp = false;
> >>          create_gpio_devices(vms, VIRT_GPIO, sysmem);
> >>      }
> >>  
> >> @@ -2593,6 +2595,20 @@ static void virt_set_its(Object *obj, bool value, Error **errp)
> >>      vms->its = value;
> >>  }
> >>  
> >> +static bool virt_get_acpi_pcihp(Object *obj, Error **errp)
> >> +{
> >> +    VirtMachineState *vms = VIRT_MACHINE(obj);
> >> +
> >> +    return vms->acpi_pcihp;
> >> +}
> >> +
> >> +static void virt_set_acpi_pcihp(Object *obj, bool value, Error **errp)
> >> +{
> >> +    VirtMachineState *vms = VIRT_MACHINE(obj);
> >> +
> >> +    vms->acpi_pcihp = value;
> >> +}
> >> +
> >>  static bool virt_get_dtb_randomness(Object *obj, Error **errp)
> >>  {
> >>      VirtMachineState *vms = VIRT_MACHINE(obj);
> >> @@ -3310,6 +3326,10 @@ static void virt_machine_class_init(ObjectClass *oc, const void *data)
> >>                                            "in ACPI table header."
> >>                                            "The string may be up to 8 bytes in size");
> >>  
> >> +    object_class_property_add_bool(oc, "acpi-pcihp",
> >> +                                   virt_get_acpi_pcihp, virt_set_acpi_pcihp);
> >> +    object_class_property_set_description(oc, "acpi-pcihp",
> >> +                                          "Force ACPI PCI hotplug");
> >>  }
> >>  
> >>  static void virt_instance_init(Object *obj)
> >> @@ -3344,6 +3364,9 @@ static void virt_instance_init(Object *obj)
> >>          vms->tcg_its = true;
> >>      }
> >>  
> >> +    /* default disallows ACPI PCI hotplug */
> >> +    vms->acpi_pcihp = false;
> >> +
> >>      /* Default disallows iommu instantiation */
> >>      vms->iommu = VIRT_IOMMU_NONE;
> >>  
> >> @@ -3394,8 +3417,12 @@ DEFINE_VIRT_MACHINE_AS_LATEST(10, 1)
> >>  
> >>  static void virt_machine_10_0_options(MachineClass *mc)
> >>  {
> >> +    VirtMachineClass *vmc = VIRT_MACHINE_CLASS(OBJECT_CLASS(mc));
> >> +
> >>      virt_machine_10_1_options(mc);
> >>      compat_props_add(mc->compat_props, hw_compat_10_0, hw_compat_10_0_len);
> >> +    /* 10.0 and earlier do not support ACPI PCI hotplug */
> >> +    vmc->no_acpi_pcihp = true;
> >>  }
> >>  DEFINE_VIRT_MACHINE(10, 0)
> >>    
> 
