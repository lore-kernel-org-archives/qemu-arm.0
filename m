Received: by 2002:a17:505:a38d:b0:1be9:327d:8ee3 with SMTP id rs13csp5382053njc;
        Wed, 28 May 2025 03:33:30 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW9KGMu/+1lrts5H7Lms6VVPpcHopJk4GouumRg/E4srYRJNGIjr/1fF+EdALCl/eHL7nujPFbsq5HW6A==@linaro.org
X-Google-Smtp-Source: AGHT+IGQp+xAmM3sPOTrx6u72wr5iIsAkXxnLKRa1SFUYFf2IULHfnIgt41JIxrOfCjRMA6mA3FG
X-Received: by 2002:a05:6214:20e5:b0:6f4:cfb3:9df9 with SMTP id 6a1803df08f44-6fa9d288f55mr292579616d6.33.1748428410243;
        Wed, 28 May 2025 03:33:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1748428410; cv=none;
        d=google.com; s=arc-20240605;
        b=CP6RBVJc22jsx5eO4F4zS7ptrSydlNYbpWc5OHzT16rbAkZORdTSHVEu+9CfcWgZbB
         bMPbY8EiGwZmHnyjGEtABb5qY2kJdAZV7sGPXB1/eiv+SZ7DTKSp8mnsnutD3Om2iVqy
         +f209WTuk2dbggRNbKr3vOJEMuga0r/doMIyJTsIW2P1OWAXmey6Vclhlo/MKJKue27T
         eq5wRRWJHiiOzSlREtiD7JqCdXaXq7zyANcDGsAVPywDUyFYPyeY3v9gFZ4XGvve1jy1
         O0+/8yOISLyVbQlot17QQ237rK7qSXBbrD6ldJctgZ/pYheA3ITIhDgZstNA3vKtKBdC
         bRvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:dkim-signature;
        bh=7kii8XOReOsRw/9HZORdEtJ/tetU0FF4794lmxvZghI=;
        fh=coplYT6VbICU4TMcH6RqPnsiGiV3UA2kbL7ZdVM9GY8=;
        b=fc5bOwfyUcbIUL06ZuemqtkU5JO/9j8Y+nthyWrMWkoexnAVKdxVMUsGC3Rgdweu9W
         kj+chLEWE99DDr/0vXyPLUeON8G1h/rtfy31ssmxlSu9/nzuYCTgDm0qirEIgcCTq2bu
         u30OyMqW2CcKt/he8Ouz5spp4vuTZtiTc5lZxSx5T8D7yFWKguQuFFQnRjCgJKTBPeci
         QckXMObaC8p8HOGkr3HR/uMNwQNWtZYD9ZClRrZbOGb4oW/DXy9SXKeYTveIxGicrrRL
         VvLX2YwWIjtIbWOr1dbyBiKZF9xAoPyRuGXWxs28S9aKjYSbLTTrkZ5D8++UWKc+udrC
         gWjg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=OjvX1cmp;
       spf=pass (google.com: domain of imammedo@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=imammedo@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <imammedo@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id 6a1803df08f44-6fac0b29b77si10229916d6.144.2025.05.28.03.33.30
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 03:33:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of imammedo@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=OjvX1cmp;
       spf=pass (google.com: domain of imammedo@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=imammedo@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748428409;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7kii8XOReOsRw/9HZORdEtJ/tetU0FF4794lmxvZghI=;
	b=OjvX1cmpVMoFXsX3M2b5sVf54d0KH8TtV7tC6juyNZXvE3k6CVJpmB7IPCQLFdvmKvHLfJ
	jwgkHg3BTFuvY/iudxhajndhIlPzogcQwm9l0LI1mQpv5XwNb59UV1Xj9zBe7DkRxJYJuI
	vkknvei5D1UpWL1ncVfANKAs6+ehBdE=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-92-T1CO0LAfOb2kcoBkeNrETQ-1; Wed, 28 May 2025 06:33:28 -0400
X-MC-Unique: T1CO0LAfOb2kcoBkeNrETQ-1
X-Mimecast-MFC-AGG-ID: T1CO0LAfOb2kcoBkeNrETQ_1748428408
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-43efa869b19so28134535e9.2
        for <alex.bennee@linaro.org>; Wed, 28 May 2025 03:33:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748428407; x=1749033207;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7kii8XOReOsRw/9HZORdEtJ/tetU0FF4794lmxvZghI=;
        b=ZSiB/7KdcuoPPHAEFQ24P3PgqlkWxyy3DzL1WRFTNk2GixujVhAsRrgf4uyLs+T9Gk
         MajCVNnHw9nwJyfMFg1aYi5Eg5wUTDBBUy+FLFdBos0cRe7so7Vjnomde5PkEMD8VXw/
         +eCCEYvfhl+WwgfkMNC2KCy+Tca1CrklPXyE8dzwgb7A0mCeoGkaTCC3c+FY2/dxw1D6
         rUheRe8fdvdDeQyQ5OZ5y+Lp2GiC5KX2CJpyI0QLB7BfaIFQ0RLdYd36k7/bh4OvPw98
         wX2aXNtp9rysH4A/oFIQl0S6ZBvqZ+E6k6TwJNDotR/F9EYLpTDjkOHoFwXzY1iNnnUp
         lyUg==
X-Forwarded-Encrypted: i=1; AJvYcCW691DYB1qjf2CfCDAx4/AbJvBWqnbCZsB2ue567UuNY3GWayy1us0tIqmJZWk1kpD6Q5QW00QcjRvZrA==@linaro.org
X-Gm-Message-State: AOJu0Ywz0jbOg9t6AZ4VhW+5oWTstQnBFzi/gpeo3owu5uHXixtGqaI5
	2l18qZ8KZbXMSMvoAm+tbKqJfVrYigI9qSOFK8S/c+tAZ0u7Tu3RFfU+wwRfYXS9Vbwa22Pyij2
	z3eytBs+yqIoou4235Hgf8FG5/wYXMI6joLH+j3c/GQSZ7uD+QxfmjvASrA==
X-Gm-Gg: ASbGncuDgYH8I/vHteVBImU0G18wLPKgFxSaa2kvEkhfvp9K2nj2Sa7k/h6MTt+ujI7
	GbobP/FJ0+CT12yEI+S3yxWCH8U/UOT9st4h2mkcLJ9ITuZ2uT9vBWMM0QjfKA4vgrKP64Ibvn9
	6vtr3sofC49kaIwod4YMP5E1c6gfqqOj255f9b78H1exBoVIFOxElPkDR9dv4zbRa7MOAj6+9vB
	K4NqFp+ZV/TdHPV4wjxhDDOg5QoNB+owKdWx4uyoB5tNnD/HefCSRTgwii2FE6CEyDNzUR2T7tZ
	y+8HXZDdoOKtuF/BbGTBeXp02SY4bwWj
X-Received: by 2002:a05:600c:2204:b0:44d:a244:4983 with SMTP id 5b1f17b1804b1-44da24449a0mr110722755e9.3.1748428407499;
        Wed, 28 May 2025 03:33:27 -0700 (PDT)
X-Received: by 2002:a05:600c:2204:b0:44d:a244:4983 with SMTP id 5b1f17b1804b1-44da24449a0mr110722325e9.3.1748428406989;
        Wed, 28 May 2025 03:33:26 -0700 (PDT)
Return-Path: <imammedo@redhat.com>
Received: from imammedo.users.ipa.redhat.com ([85.93.96.130])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4eace2feesm1075252f8f.87.2025.05.28.03.33.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 03:33:26 -0700 (PDT)
Date: Wed, 28 May 2025 12:33:25 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Cc: eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 peter.maydell@linaro.org, gustavo.romero@linaro.org, anisinha@redhat.com,
 mst@redhat.com, shannon.zhaosl@gmail.com, pbonzini@redhat.com,
 Jonathan.Cameron@huawei.com, philmd@linaro.org, alex.bennee@linaro.org
Subject: Re: [PATCH v2 02/25] hw/arm/virt: Introduce machine state acpi
 pcihp flags and props
Message-ID: <20250528123325.750529a4@imammedo.users.ipa.redhat.com>
In-Reply-To: <d6bd4794-bcee-4701-8e63-4adee91120d9@redhat.com>
References: <20250527074224.1197793-1-eric.auger@redhat.com>
	<20250527074224.1197793-3-eric.auger@redhat.com>
	<20250527135813.2d6cde91@imammedo.users.ipa.redhat.com>
	<d6bd4794-bcee-4701-8e63-4adee91120d9@redhat.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: JJDD9u6bonbPJRbIxVJQT6VfRlthNapHms2-kbSFo1c_1748428408
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-TUID: xA3CojHombAE

On Tue, 27 May 2025 15:54:15 +0200
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
> 
> what is the status on q35, isn't it enabled by default? If so why
> wouldn't we want the same setting on ARM? Is that because of the known
> issue you report above?

Above issue is not a blocker (for thae lack of a good way to fix it)

on q35 we have had a few complains and fixes, after pcihp was promoted
to default (so hopefully that won't happen on with ARM). Also given
that ARM VM is less popular like hood breaking someone setup is even less.

That said I'd be cautions keep native hotplug as default,
and only ones who need ACPI one, could turn it on explicitly.

But well it's policies, so it's up to you ARM folks to decide what
virt board should look like.


> The no_foo compat stuff was especially introduced to avoid breaking the
> guest ABI for old machine types (like the NIC naming alternation you evoke).
no_foo is just another way to handle compat stuff,
and when it's more than one knob per feature it gets ugly really fast.
Hence, I'd prefer pcihp done in x86 way aka:
   hw_compat_OLD(ged.use_acpi_hotplug_bridge, false|true)
to manage presence of ACPI hotplug on desired machine version.
Side benefit it's consistent with how pcihp works on x86

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
> no_foo still is a largely used pattern in arm virt: no_ged,
> kvm_no_adjvtime, no_kvm_steal_time, no_tcg_lpa2, ../.. There are plenty
> of them and I am not under the impression this is going to be changed.
> 
> If you refer to 8d23b1df7212 ("hw/arm/virt: Remove
> VirtMachineClass::no_its field") I think the no_its was removed because
> the machine it applied was removed.
> 
> If I understand correctly you would like the prop to be attached to the
> GED device. However the GED device is internally created by the virt
> machine code and not passed through a "-device" CLI option. So how would
> you pass the option on the cmd line if you don't want it to be set by
> default per machine type?
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
