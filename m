Received: by 2002:a17:505:a38d:b0:1be9:327d:8ee3 with SMTP id rs13csp4758377njc;
        Tue, 27 May 2025 04:58:30 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUcWg+fAE+gGo0qo8s3TuUC2b71nparAm7Y1VJmpqkhdn0P7Y07xNt7NCNN7vifI46g4nbIFBW0Suippw==@linaro.org
X-Google-Smtp-Source: AGHT+IGgC47hg8UX5vWDDBbElNrKDQo3Ac8ieZghCudjcaGQrl7CJdvNjcNsBJAeDolkWTFNQ+Zv
X-Received: by 2002:a05:6214:246a:b0:6f8:a7c6:22ca with SMTP id 6a1803df08f44-6fa9d02b558mr178171366d6.16.1748347099238;
        Tue, 27 May 2025 04:58:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1748347099; cv=none;
        d=google.com; s=arc-20240605;
        b=Ajvd1BFGLeupZ64lSOfeTYQwSnE+XeUXNq05w1DjvEEGcaDR/U8LfRAz5iQ51PEKQz
         DsAo83W14qU+KdlVmuCZJDo4qtyl4E0FxXgSn3RmNM/pyEsbXhijetTDez404kxqpWVk
         cCPn1oDSwsgdlPg33/xACeC2I0HzKyoMN1mcnUl6nEJj8KTJZFCNEv4S8msrYXa+34dV
         m2Jr1CMw/TW5Zgeb93J/frrImNsVTWtumrIV7kFxx9NB+BnqSoFurIyCgNkjPzaaOQre
         XIzb5f0Zx2CP/SO40O1316pjuZXSq74JT0hqn8SVWOoYG8EFTThLcTkkNLvZtFPeJ8S/
         6vuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:dkim-signature;
        bh=dHqXEgaQTrxB4IKRGQZjKBkcdlkshcKYt4h4/GTe1W4=;
        fh=DALqqOCQ47UeCbJp2ZwcYwoFiCzdsY1x6SHOz270VVM=;
        b=c4DTWdP+K9bbqHPfe6lFCO72D6CpvEnum4IxWxpk5wTp/gTP02HW6aZjdlCOaeRqzP
         is8zz6nN9j7QOUg5ziZtTQ1s1rvur/9w49IOcR6gEbs4wQJb3r5Bw8B9q0XCs89kG40x
         Od1C4fgyUxZ3USNAmEg5NCO7VklxSJ25Up7Pb7wVsIjfmYW9C3IVvwNls7lRh2cXDYvL
         Jmc2oTblrw6di4tyTIFhoS5yDdIczKqqFa5VhXUd8YhS2LRuDboFNVeVQJczcCCEYS+8
         9x/HLEYG2s8tif6h406BSPHEkb3XHuST3fVxSpfnRhwmWLz+eoLEeM1mKdaXhCndEJpg
         3oyw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=I4BjtTBh;
       spf=pass (google.com: domain of imammedo@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=imammedo@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <imammedo@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id 6a1803df08f44-6f8b09acaf4si259903776d6.275.2025.05.27.04.58.19
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 May 2025 04:58:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of imammedo@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=I4BjtTBh;
       spf=pass (google.com: domain of imammedo@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=imammedo@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748347098;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dHqXEgaQTrxB4IKRGQZjKBkcdlkshcKYt4h4/GTe1W4=;
	b=I4BjtTBhgjZkjJxj60It07LyKY/geY67Pm4BWk6DlT6EIvJ3PI8fJpJ6soIZDUrSMrR3wo
	lYQIsO7bprgRQv1dM0b5pBU9BDLDJzijcarK+QSlJrU0lJiYXssM1SdI54FLCqLjXMUcf2
	Ih9LeisD/W+pUViEJTMecV46DvUXzn0=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-314-ddb_BS5oPlyTXhYc1SvGcg-1; Tue, 27 May 2025 07:58:17 -0400
X-MC-Unique: ddb_BS5oPlyTXhYc1SvGcg-1
X-Mimecast-MFC-AGG-ID: ddb_BS5oPlyTXhYc1SvGcg_1748347096
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-3a375938404so2190131f8f.0
        for <alex.bennee@linaro.org>; Tue, 27 May 2025 04:58:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748347096; x=1748951896;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dHqXEgaQTrxB4IKRGQZjKBkcdlkshcKYt4h4/GTe1W4=;
        b=ljo7s9ipyGuJBNzsS7V3vYCjzEAvLU+nTXstGTyNDirHxIgT+9YOoYOf+1Hb1I9MqL
         4RRYkFlaMWHvBeWcQLcQAdDU28qn1DofD6MgHi20cdx+ww+nlL7017qSWeuWVSmvzxMl
         4IFVy+fSIr7z1AZYNGQAKseGCdBm2hUQVQfuS+4q9zT+ht3czNDBy0Xq6bBZe1xpPXYq
         dqgg5AfzyEpwibNXFdjA86GtG8xexiWVoqvm2nLszL8ekHEFdTibcgGszuv6J/uQ3ozX
         rQCEwj886otcaGVIYNgLcnVphBCW39etyP8lRBVhrdxoyg6CS8pwWNf7kGkZyO3Ot5Qg
         ojKg==
X-Forwarded-Encrypted: i=1; AJvYcCXzk+47hLZgcMBuK1Mr03h2/hxoe21zYUtb/MQKkFCAlU5cfvtyl1kLihnHJ+mEPAH+dmoImgN+Mfcgvg==@linaro.org
X-Gm-Message-State: AOJu0Yxycmav5sc69GS+jQZdTr98hDMn39UG9yYMTHbwUcW9LxonMT9H
	Qcje1IWO1wAcuLa1Q1tMISMQmIMk+P0Oz4ftE186DOUp+SA4uIkGiRkgAICASJMESDAXjZcMnQL
	YjwW1F5iR/2ovKq+XXVs20rBiv1gHnVXSOCmE/gxjZQHcPbOISjSTHIxDZw==
X-Gm-Gg: ASbGnctcEXFGBmQinry/ZqTojwZ7FhvnfryuUhfBSsL32z8r2WLo6lVX5vhqZgVqbIv
	Xngv/ohtlu3mWtVhLED/RbReKW8oXT2Ie4vXU5pP9vxjaHaGJc9f/eZsUqNIPtItBRk38USsOKj
	yc25geHpxEPtB2hWVPZga4D5w7mRwn5KjuUp+j/yfblA/q3qILCFIa53qGjmm4kNyJrZ6qH34iU
	npqSDatggESypCUk5yUSjpgVET5De8B8HauyCRiNNxKIi4DFDRVBeRws7ti9BC+p/iczuGLCKjk
	Ntf7YNmcNngU26svdSqeI2Wow79ejEz8
X-Received: by 2002:a05:6000:26c9:b0:3a4:de02:208 with SMTP id ffacd0b85a97d-3a4de0204a6mr3238321f8f.25.1748347096454;
        Tue, 27 May 2025 04:58:16 -0700 (PDT)
X-Received: by 2002:a05:6000:26c9:b0:3a4:de02:208 with SMTP id ffacd0b85a97d-3a4de0204a6mr3238291f8f.25.1748347096010;
        Tue, 27 May 2025 04:58:16 -0700 (PDT)
Return-Path: <imammedo@redhat.com>
Received: from imammedo.users.ipa.redhat.com ([85.93.96.130])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4d6c9faffsm6715489f8f.74.2025.05.27.04.58.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 May 2025 04:58:15 -0700 (PDT)
Date: Tue, 27 May 2025 13:58:13 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Cc: eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 peter.maydell@linaro.org, gustavo.romero@linaro.org, anisinha@redhat.com,
 mst@redhat.com, shannon.zhaosl@gmail.com, pbonzini@redhat.com,
 Jonathan.Cameron@huawei.com, philmd@linaro.org, alex.bennee@linaro.org
Subject: Re: [PATCH v2 02/25] hw/arm/virt: Introduce machine state acpi
 pcihp flags and props
Message-ID: <20250527135813.2d6cde91@imammedo.users.ipa.redhat.com>
In-Reply-To: <20250527074224.1197793-3-eric.auger@redhat.com>
References: <20250527074224.1197793-1-eric.auger@redhat.com>
	<20250527074224.1197793-3-eric.auger@redhat.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 0HdV3DkA4Pxd8U-HSMCHMz3uyLub1L_BoFtCK0vTzNg_1748347096
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-TUID: GSAFyV6NyJkL

On Tue, 27 May 2025 09:40:04 +0200
Eric Auger <eric.auger@redhat.com> wrote:

> acpi_pcihp VirtMachineClass state flag will allow
> to opt in for acpi pci hotplug. This is guarded by a

> class no_acpi_pcihp flag to manage compats (<= 10.0
> machine types will not support ACPI PCI hotplug).

there is no reason to put an effort in force disabling it
on old machines, as long as code works when explicitly
enabled property on CLI.

See comment below on how to deal with it 

> 
> Machine state acpi_pcihp flag must be set before the creation
> of the GED device which will use it.
> 
> Currently the ACPI PCI HP is turned off by default. This will
> change later on for 10.1 machine type.

one thing to note, is that turning it on by default might
cause change of NIC naming in guest as this brings in
new "_Sxx" slot naming. /so configs tied to nic  go down the drain/

Naming, we have, also happens to be broken wrt spec
(it should be unique system wide, there was a gitlab issue for that,
there is no easy fix that though)

So I'd leave it disabled by default and let users to turn
it on explicitly when needed. 

> 
> We also introduce properties to allow disabling it.
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> Reviewed-by: Gustavo Romero <gustavo.romero@linaro.org>
> ---
>  include/hw/arm/virt.h |  2 ++
>  hw/arm/virt.c         | 27 +++++++++++++++++++++++++++
>  2 files changed, 29 insertions(+)
> 
> diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
> index 9a1b0f53d2..10ea581f06 100644
> --- a/include/hw/arm/virt.h
> +++ b/include/hw/arm/virt.h
> @@ -129,6 +129,7 @@ struct VirtMachineClass {
>      bool no_tcg_lpa2;
>      bool no_ns_el2_virt_timer_irq;
>      bool no_nested_smmu;
> +    bool no_acpi_pcihp;
>  };
>  
>  struct VirtMachineState {
> @@ -150,6 +151,7 @@ struct VirtMachineState {
>      bool mte;
>      bool dtb_randomness;
>      bool second_ns_uart_present;
> +    bool acpi_pcihp;
>      OnOffAuto acpi;
>      VirtGICType gic_version;
>      VirtIOMMUType iommu;
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 9a6cd085a3..a0deeaf2b3 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -2397,8 +2397,10 @@ static void machvirt_init(MachineState *machine)
>      create_pcie(vms);
>  
>      if (has_ged && aarch64 && firmware_loaded && virt_is_acpi_enabled(vms)) {
> +        vms->acpi_pcihp &= !vmc->no_acpi_pcihp;

I don't particularly like no_foo naming as it makes code harder to read
and combined with 'duplicated' field in machine state it make even things worse.
(if I recall right Philippe was cleaning mess similar flags usage
have introduced with ITS)

instead of adding machine property (both class and state),
I'd suggest adding the only property to GPE device (akin to what we have in x86 world)
And then one can meddle with defaults using hw_compat_xxx


>          vms->acpi_dev = create_acpi_ged(vms);
>      } else {
> +        vms->acpi_pcihp = false;
>          create_gpio_devices(vms, VIRT_GPIO, sysmem);
>      }
>  
> @@ -2593,6 +2595,20 @@ static void virt_set_its(Object *obj, bool value, Error **errp)
>      vms->its = value;
>  }
>  
> +static bool virt_get_acpi_pcihp(Object *obj, Error **errp)
> +{
> +    VirtMachineState *vms = VIRT_MACHINE(obj);
> +
> +    return vms->acpi_pcihp;
> +}
> +
> +static void virt_set_acpi_pcihp(Object *obj, bool value, Error **errp)
> +{
> +    VirtMachineState *vms = VIRT_MACHINE(obj);
> +
> +    vms->acpi_pcihp = value;
> +}
> +
>  static bool virt_get_dtb_randomness(Object *obj, Error **errp)
>  {
>      VirtMachineState *vms = VIRT_MACHINE(obj);
> @@ -3310,6 +3326,10 @@ static void virt_machine_class_init(ObjectClass *oc, const void *data)
>                                            "in ACPI table header."
>                                            "The string may be up to 8 bytes in size");
>  
> +    object_class_property_add_bool(oc, "acpi-pcihp",
> +                                   virt_get_acpi_pcihp, virt_set_acpi_pcihp);
> +    object_class_property_set_description(oc, "acpi-pcihp",
> +                                          "Force ACPI PCI hotplug");
>  }
>  
>  static void virt_instance_init(Object *obj)
> @@ -3344,6 +3364,9 @@ static void virt_instance_init(Object *obj)
>          vms->tcg_its = true;
>      }
>  
> +    /* default disallows ACPI PCI hotplug */
> +    vms->acpi_pcihp = false;
> +
>      /* Default disallows iommu instantiation */
>      vms->iommu = VIRT_IOMMU_NONE;
>  
> @@ -3394,8 +3417,12 @@ DEFINE_VIRT_MACHINE_AS_LATEST(10, 1)
>  
>  static void virt_machine_10_0_options(MachineClass *mc)
>  {
> +    VirtMachineClass *vmc = VIRT_MACHINE_CLASS(OBJECT_CLASS(mc));
> +
>      virt_machine_10_1_options(mc);
>      compat_props_add(mc->compat_props, hw_compat_10_0, hw_compat_10_0_len);
> +    /* 10.0 and earlier do not support ACPI PCI hotplug */
> +    vmc->no_acpi_pcihp = true;
>  }
>  DEFINE_VIRT_MACHINE(10, 0)
>  
