Received: by 2002:a17:504:1b46:b0:1be9:327d:8ee3 with SMTP id t6csp1091363njh;
        Fri, 30 May 2025 05:11:50 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVwgLoIweaUUH02DbkDAUmz/a5sIBrF+vAFaXDpSk/tvytfeUKBMINldSguGxhB8EU3touvYYpmQ+qeow==@linaro.org
X-Google-Smtp-Source: AGHT+IE69J7HKvUcu9JTEIiTJVMZDLWxS+RZDGWg66auXqSQYourV2W0mTQ9ltZ3LRADx2eMeNhZ
X-Received: by 2002:a05:622a:229f:b0:4a4:3414:3f72 with SMTP id d75a77b69052e-4a443c71ac4mr34123271cf.13.1748607109937;
        Fri, 30 May 2025 05:11:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1748607109; cv=none;
        d=google.com; s=arc-20240605;
        b=QP17gGBuR/PIjHtnvdvAusnhUPuTBq45uAVPPidR0TW/2boWc4SggtGnNWWOrdU6Vb
         dmoAkYvlPXfUwxY26HzXuit0uD88jOvTBbbsryo035XcMRgmVCn2wZ8uLqMuxrM8aYJ9
         35K+uzdZcrvTCV1E52FsD3cwoEfOGzrsJCqYeOYdeGfk1PoMhjdBCgkg6Su1H+1U8kRK
         COQ5RFP6r3HAtNHcTntahgj7dEZLEozzG+Puvz0PtBL2TU3CbEVcNBB/OzQtzMJ2ouCK
         JrO9K6BF1HyiY6tm1Z9bOXKDm6fCZUS50D3QFPlWUi7Et0hUzgxY+O7OpWWdEy5AVpW1
         Q45g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:dkim-signature;
        bh=TOXFNxEr+Ox+OIhSNnPCM7SMU40zVSyxunLTDAFk2og=;
        fh=MgB3k1yyP43Mnsc/NAdk7pY9hIF8DZLBSnPj+D1yBQs=;
        b=jh3JhW9SUUYK72fK/3yypm4CJfYQGDCNTtQnhTgBlrPalOh1rwJX7uMbO23NzkFgS4
         VQ7KdRdb56nrG6msE7S6+Urbbrgi/mFGmoeuD+i6ndeSdgjkBp7XXIvhQCruGrnWPMCm
         GJld0ueApY8cRKN36AW728D6SUDeE9d2RCBnoOYcykr6yEpmTpqJWrqZZ1v7oUZmTboa
         N9I4oUwjvcHc7vmxBWw3EAdBqeVA9mBvtMk5OWNVSQJ7MjEB1dCvxmAsZJUu0JcFdMCN
         z37Xkclsp2C6zhKILqdcSUdcdC/4OxgwDf1yV/En1so7qg28U7KS9xl88xgBMjRsHAdE
         p/JQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ZlcauAgF;
       spf=pass (google.com: domain of imammedo@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=imammedo@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <imammedo@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id d75a77b69052e-4a435880bbbsi35850191cf.126.2025.05.30.05.11.49
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 May 2025 05:11:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of imammedo@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ZlcauAgF;
       spf=pass (google.com: domain of imammedo@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=imammedo@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748607109;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TOXFNxEr+Ox+OIhSNnPCM7SMU40zVSyxunLTDAFk2og=;
	b=ZlcauAgFgpfVynb7FryfpVnxKgfJa5iUs4O/t7G/RG23eD6jl+QWRhfz6xea3Qkc3WbkrA
	CPombOxaSuXIyeccNISs9gaNTEIMJRGG2IfqlPqHNd8EFM2sq7zgekTmx16eVQRWUrq0gu
	GJA6tOv/jx2x+SvzusTnp6w7OrJGjp4=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-13-nA4lQe_ZP0uPKABfwM2okw-1; Fri, 30 May 2025 08:11:46 -0400
X-MC-Unique: nA4lQe_ZP0uPKABfwM2okw-1
X-Mimecast-MFC-AGG-ID: nA4lQe_ZP0uPKABfwM2okw_1748607105
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-3a1f6c5f4f2so807088f8f.2
        for <alex.bennee@linaro.org>; Fri, 30 May 2025 05:11:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748607105; x=1749211905;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TOXFNxEr+Ox+OIhSNnPCM7SMU40zVSyxunLTDAFk2og=;
        b=UlHOPjQBQckYilCHRTvU60CjwVLVHjlXIeOWjrEtLzxdKZY1ZgHtlckOeVErZzKYB/
         rZWz8Ez1bWQ4k+jLweX4YbksLKNGARTRo9vDmgS1K7vMOdyqC8Z6s3MeaFT1Jom+/Snf
         5Y3WpCwnjwJR5v7Z+yHMLlqf2brDtJX8jZvM7QhMMCrTa29wEdDqePnt22svAsSLvSl4
         GUIe6d+cIgawUDoy4nPw9SL3p9kyjItxpLwOTPvG6M6N9odjNwCjy1vDTFPUXurJPScw
         7ryzYSznLCYEZgoPOeBc+f/c2k0YjJrRLmNjTXa+t3ovxqIaRDG4zxwRhlIfShFB1AKT
         Jp9g==
X-Forwarded-Encrypted: i=1; AJvYcCWsrWyUcHDacBxeByBbozit5T2Lr/SoMMBxo2GM40RAH632kBygCU7s31+RLEbB6O1cAjjIJcGkuVhVVg==@linaro.org
X-Gm-Message-State: AOJu0YzaDclBVTpUgA/uy5CP53RGmBYjw+GvoN2gWXWs2usyXCVjcumY
	ZQDnDK/g/aR82NVEMFPWGvDMSH3LH/VsKkwCz76kCj7WRadTVShIbzZAdi07VcJT2QqlXH4QIlH
	CIPcTJg0ylsK+MzShhsdBmnNnE9nkzqjClMo596KemfWavgw8hol5mnkGNg==
X-Gm-Gg: ASbGncv59zxjMkdPFEbF9koawETb5jXX+7I3984RvgVRiHTyEN6k2vbRoBUoxrbbPG1
	bIU9e3aYGKSpKE8e/frgedlZ10nyqwnjVHRaE+ey7dNPuL1daSp6AnD10oOLLeC34fcrUHZf5V3
	zHgNZ4FzDvkWJz/7gctK6Q1qOZ1DLxyAv8XNEoxZJT6fhwjNz4kp5O+FlGTu7IyG8me99n1t8i3
	pZ4SCUbI7Zem/jo6UpOb89M+4uZWHCdCqtJEDMkULC0DzfGUO1zm1hkklQNK8zfiq4uTNanlFaO
	NoRU2+9CxsV5ba7ceu71twfcB/IyKJSH
X-Received: by 2002:a05:600c:3b0f:b0:440:6a37:be0d with SMTP id 5b1f17b1804b1-450d884c411mr19886605e9.15.1748607105303;
        Fri, 30 May 2025 05:11:45 -0700 (PDT)
X-Received: by 2002:a05:600c:3b0f:b0:440:6a37:be0d with SMTP id 5b1f17b1804b1-450d884c411mr19886335e9.15.1748607104885;
        Fri, 30 May 2025 05:11:44 -0700 (PDT)
Return-Path: <imammedo@redhat.com>
Received: from imammedo.users.ipa.redhat.com ([85.93.96.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-450d8000e3esm16552325e9.22.2025.05.30.05.11.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 May 2025 05:11:44 -0700 (PDT)
Date: Fri, 30 May 2025 14:11:43 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: Eric Auger <eric.auger@redhat.com>, <eric.auger.pro@gmail.com>,
 <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, <peter.maydell@linaro.org>,
 <gustavo.romero@linaro.org>, <anisinha@redhat.com>, <mst@redhat.com>,
 <shannon.zhaosl@gmail.com>, <pbonzini@redhat.com>, <philmd@linaro.org>,
 <alex.bennee@linaro.org>
Subject: Re: [PATCH v2 06/25] hw/pci-host/gpex-acpi: Propagate hotplug type
 info from virt machine downto gpex
Message-ID: <20250530141143.6b13376b@imammedo.users.ipa.redhat.com>
In-Reply-To: <20250530111413.00003c66@huawei.com>
References: <20250527074224.1197793-1-eric.auger@redhat.com>
	<20250527074224.1197793-7-eric.auger@redhat.com>
	<20250530111413.00003c66@huawei.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: yX65W5NS1CaEJ3X_DpHLlim5A-Seo89VRZ5tKYPNaSc_1748607105
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-TUID: 5tDG3KDSVZ2z

On Fri, 30 May 2025 11:14:13 +0100
Jonathan Cameron <Jonathan.Cameron@huawei.com> wrote:

> On Tue, 27 May 2025 09:40:08 +0200
> Eric Auger <eric.auger@redhat.com> wrote:
> 
> > Propagate the type of pci hotplug mode downto the gpex
> > acpi code. In case machine acpi_pcihp is unset we configure
> > pci native hotplug on pci0. For expander bridges we keep
> > legacy pci native hotplug, as done on x86 q35.
> > 
> > Signed-off-by: Eric Auger <eric.auger@redhat.com>
> > Reviewed-by: Gustavo Romero <gustavo.romero@linaro.org>
> > ---
> >  include/hw/pci-host/gpex.h | 1 +
> >  hw/arm/virt-acpi-build.c   | 1 +
> >  hw/pci-host/gpex-acpi.c    | 3 ++-
> >  3 files changed, 4 insertions(+), 1 deletion(-)
> > 
> > diff --git a/include/hw/pci-host/gpex.h b/include/hw/pci-host/gpex.h
> > index 84471533af..feaf827474 100644
> > --- a/include/hw/pci-host/gpex.h
> > +++ b/include/hw/pci-host/gpex.h
> > @@ -45,6 +45,7 @@ struct GPEXConfig {
> >      MemMapEntry pio;
> >      int         irq;
> >      PCIBus      *bus;
> > +    bool        pci_native_hotplug;
> >  };
> >  
> >  typedef struct GPEXIrq GPEXIrq;
> > diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> > index 7e8e0f0298..be5e00a56e 100644
> > --- a/hw/arm/virt-acpi-build.c
> > +++ b/hw/arm/virt-acpi-build.c
> > @@ -129,6 +129,7 @@ static void acpi_dsdt_add_pci(Aml *scope, const MemMapEntry *memmap,
> >          .ecam   = memmap[ecam_id],
> >          .irq    = irq,
> >          .bus    = vms->bus,
> > +        .pci_native_hotplug = !vms->acpi_pcihp,
> >      };
> >  
> >      if (vms->highmem_mmio) {
> > diff --git a/hw/pci-host/gpex-acpi.c b/hw/pci-host/gpex-acpi.c
> > index 1aa2d12026..f1ab30f3d5 100644
> > --- a/hw/pci-host/gpex-acpi.c
> > +++ b/hw/pci-host/gpex-acpi.c
> > @@ -204,6 +204,7 @@ void acpi_dsdt_add_gpex(Aml *scope, struct GPEXConfig *cfg)
> >              if (is_cxl) {
> >                  build_cxl_osc_method(dev);
> >              } else {
> > +                /* pxb bridges do not have ACPI PCI Hot-plug enabled */
> >                  acpi_dsdt_add_host_bridge_methods(dev, true);  
> 
> This is awkward but explains why my CXL cases weren't causing trouble.
> A mixed config is counter to the recommendation in the PCI firmware spec
> 
> "It is recommended that a machine with multiple host bridge devices should
> report the same capabilities for all host bridges of the same type and also
> negotiate control of the features described in the Control Field in the
> same way for all host bridges of the same type"
> 
> I guess if any OS isn't coping with the mix then they can request native
> hotplug.

guest should be able to cope with mixed configs,
ACPI pcihp is a crutch and works only for coldplugged bridges,
while hotplugged bridges are handled by native hotplug.

> 
> 
> 
> >              }
> >  
> > @@ -279,7 +280,7 @@ void acpi_dsdt_add_gpex(Aml *scope, struct GPEXConfig *cfg)
> >      }
> >      aml_append(dev, aml_name_decl("_CRS", rbuf));
> >  
> > -    acpi_dsdt_add_host_bridge_methods(dev, true);
> > +    acpi_dsdt_add_host_bridge_methods(dev, cfg->pci_native_hotplug);
> >  
> >      Aml *dev_res0 = aml_device("%s", "RES0");
> >      aml_append(dev_res0, aml_name_decl("_HID", aml_string("PNP0C02")));  
> 
