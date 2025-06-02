Received: by 2002:a17:504:1b46:b0:1be9:327d:8ee3 with SMTP id t6csp2645509njh;
        Mon, 2 Jun 2025 03:18:18 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU1ngWy/CBjH3/qIcjFlTnMPL7HZK8h3/Y4GoLsyfwH2wnFfzQWefwadX7ZqWWLmOcrv1hNXHU8IJkWcA==@linaro.org
X-Google-Smtp-Source: AGHT+IGN8iKJ3bK6yi5uUwFfdIjSmRN2ph3B+NN/UILqlbd1eZ02nhbEB2DzHgOthsi5rkCUy4kH
X-Received: by 2002:a05:6214:f0b:b0:6fa:cce8:3bdd with SMTP id 6a1803df08f44-6fad1967231mr229672446d6.36.1748859498008;
        Mon, 02 Jun 2025 03:18:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1748859497; cv=none;
        d=google.com; s=arc-20240605;
        b=dO88+tdy5cR3JBVXIGi1qS3EIeq8loKNVmVV0ZrYY22SBT12tuDdAMcIoD3EZeEzfi
         zmSQw/GwVJX4Iv/96EnhJJKzjwkUbPu0DPGeo0enF9CXn9o0vOGExViSCNbY4MZLs/ig
         4koqE9KjiqAF2pSCEoZYg7r0Hj62vdYmSzpiDRblYLYXIOI4Depwhtk49jbyA51ryT/8
         Ss4fDSNAyJzqsvcxQuq536sWAfgweoMArE/NT4bZxtqbITM+bxzz7maPLgBNavsxjYoB
         qnHwXuR6O74I1RF58IBIlNi7IcuC+dkG+ThAp37wnMMCBPmluGNN9IaYW/ksI64gFNXZ
         NGYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:dkim-signature;
        bh=MelZ/UKf7Sf6tZkePSBf9ugkdI2MHE2OHWmwLvm1iwI=;
        fh=MW3p3mNE2XqixaZhlpnIkGWnu5xBh9ITDGnyPgOFpOE=;
        b=DYAFR5pBDnwGSL712N1Zv2TYUEs5QyfGuOon5iShtLtA8hMjfHMVLMMHSW6a+uBPPz
         5F0GpuC9DLHsI4BQYG6+bRki6ywyCGuyAa+0k6bG6R33LssWRj90AnTKHVI7SAX0BV5O
         XAQhxyGf8tU5CgvlaTgx4M1SLfBIBJyxEgci8naOgEgqjUaBEt860rffY+ExX6mk4gDC
         8gpdKQJYYaDpKDSSWqXy7MsMdKM7u845u8nU9V0bvRcoKzbxvugBA7paXrhbGydP48oO
         kxhloGWGCy5yy+etmSoOfGQ5c2nfsCTuPJ4DnyUSEMBObCaDdmqQcm6b0lq6Fc//oI18
         Is6Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=AO1vG6fC;
       spf=pass (google.com: domain of imammedo@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=imammedo@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <imammedo@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id 6a1803df08f44-6fac6e59979si100354576d6.180.2025.06.02.03.18.17
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Jun 2025 03:18:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of imammedo@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=AO1vG6fC;
       spf=pass (google.com: domain of imammedo@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=imammedo@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748859497;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MelZ/UKf7Sf6tZkePSBf9ugkdI2MHE2OHWmwLvm1iwI=;
	b=AO1vG6fC+aMWhdCnDjWgLC5QoEj+L4FdkQT7ixgJ04K1pRYLHDH3CbrTSuumARNOUNgIvK
	IQbcbhlvJcxfsP6elDK8xi9l1EmhTizoF04iYkcK7xslkM3KneuhDa8UrGBtF//sVjiSJj
	PgeZua7du++raSD6w7WiF/9uURyEGY0=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-583-CmNvB6ryMluF0SLHyt4lTg-1; Mon, 02 Jun 2025 06:18:16 -0400
X-MC-Unique: CmNvB6ryMluF0SLHyt4lTg-1
X-Mimecast-MFC-AGG-ID: CmNvB6ryMluF0SLHyt4lTg_1748859495
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3a4f55ea44dso1849755f8f.1
        for <alex.bennee@linaro.org>; Mon, 02 Jun 2025 03:18:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748859495; x=1749464295;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MelZ/UKf7Sf6tZkePSBf9ugkdI2MHE2OHWmwLvm1iwI=;
        b=OgXBkZIkjX1RHYQHH4NOab3y1u9XTDSG0SMpz3Hm0/XK2aPuR3FJ/KqfXiHcUMMXFw
         /HGh9aIuQBrp5vijBM4BL1k2mwrMSOTQRkzzMzbiTidjyNXlpZTBH2b6Rx6j2jTjZiWc
         8J1mrTZctFM/yAfcNoqMO/7oToyVj8QR9fluj0DAUtKfdSIJYmTb/MZOJyGMeZqYc6rn
         qUZeNInV1RAaLLCocJwVcWVoUuVenId9700BRLpQ/xv+oK8cKGT5KJGgrhYkZRBAqIN4
         +QQ3pVab3nqph6NYj485OOQZ6p55o2HmlWgwmYz4WahViM21lXfN2HbwLVo6L4fA4jNC
         iTWQ==
X-Forwarded-Encrypted: i=1; AJvYcCU4v6mCHQXrne4mPoe9SypETvzT0eM7DXpX+GWCk2E7Z9TLYp0rjBo9NN7g8FWsvybsXeV2e415EOLssA==@linaro.org
X-Gm-Message-State: AOJu0Yz9X+crWhXtMK9n2/NGYuPHkWEXjV2EF0Mx9xuethpuv02torlA
	8+qqHClAVG96pjFLoS980qpfQKR1lN8gv+QfSYeUhYQh4fzMLOFUS56huKnovvUuzLXs8KKy/2y
	k8jYJMknCDG2MYwLvPjxHFz75s4UuTd4lcX4Ar/kY7xQMdxdUFk+uVRSw9g==
X-Gm-Gg: ASbGncuNAl0Msx1aEOa6TNrxOCCvYNbOg0gNPd9MvnZg7/hxNLLuFhD/ady3BSIrnJf
	qUZsBahLkIlpNk/DdH+QG8FuAvWUopM4VOq8UW6ghSIRqo9KuuDp3idhPjxqfhbItlw5I++G6pR
	9NtChX2Yi27LLYiOcAgivRzkcy24QJwMB5/aFyXD0sGS6zEAfMMOCRaMoFe6rnej+LqmGhcuQ/9
	oF930kUBCcNfaGakuOa4WuA3lMKootK2rDdnMJmbX0lHl6d7MrhrFf186Enls3wlaUcrT1oN1on
	QqXkXtNNldMf/54pOHpaInfj31JP/5lb
X-Received: by 2002:a05:6000:250e:b0:3a3:7cbd:39b1 with SMTP id ffacd0b85a97d-3a4fe17c35emr6329272f8f.24.1748859495321;
        Mon, 02 Jun 2025 03:18:15 -0700 (PDT)
X-Received: by 2002:a05:6000:250e:b0:3a3:7cbd:39b1 with SMTP id ffacd0b85a97d-3a4fe17c35emr6329239f8f.24.1748859494824;
        Mon, 02 Jun 2025 03:18:14 -0700 (PDT)
Return-Path: <imammedo@redhat.com>
Received: from imammedo.users.ipa.redhat.com ([85.93.96.130])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4f009ff11sm14127324f8f.86.2025.06.02.03.18.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Jun 2025 03:18:14 -0700 (PDT)
Date: Mon, 2 Jun 2025 12:18:10 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: Eric Auger <eric.auger@redhat.com>, <eric.auger.pro@gmail.com>,
 <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, <peter.maydell@linaro.org>,
 <gustavo.romero@linaro.org>, <anisinha@redhat.com>, <mst@redhat.com>,
 <shannon.zhaosl@gmail.com>, <pbonzini@redhat.com>, <philmd@linaro.org>,
 <alex.bennee@linaro.org>
Subject: Re: [PATCH v2 05/25] hw/pci-host/gpex-acpi: Split host bridge OSC
 and DSM generation
Message-ID: <20250602121810.649d82ce@imammedo.users.ipa.redhat.com>
In-Reply-To: <20250530160019.000061d1@huawei.com>
References: <20250527074224.1197793-1-eric.auger@redhat.com>
	<20250527074224.1197793-6-eric.auger@redhat.com>
	<20250530110227.00003341@huawei.com>
	<20250530140516.35db4d52@imammedo.users.ipa.redhat.com>
	<20250530160019.000061d1@huawei.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 4vsPh_4MxqyK7IeOv0klWTWAgSZTMOEuW1kDVVFxuck_1748859495
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-TUID: N0YuZjFt/COS

On Fri, 30 May 2025 16:00:19 +0100
Jonathan Cameron <Jonathan.Cameron@huawei.com> wrote:

> On Fri, 30 May 2025 14:05:16 +0200
> Igor Mammedov <imammedo@redhat.com> wrote:
> 
> > On Fri, 30 May 2025 11:02:27 +0100
> > Jonathan Cameron <Jonathan.Cameron@huawei.com> wrote:
> >   
> > > On Tue, 27 May 2025 09:40:07 +0200
> > > Eric Auger <eric.auger@redhat.com> wrote:
> > >     
> > > > acpi_dsdt_add_pci_osc() name is confusing as it gives the impression
> > > > it appends the _OSC method but in fact it also appends the _DSM method
> > > > for the host bridge. Let's split the function into two separate ones
> > > > and let them return the method Aml pointer instead. This matches the
> > > > way it is done on x86 (build_q35_osc_method). In a subsequent patch
> > > > we will replace the gpex method by the q35 implementation that will
> > > > become shared between ARM and x86.
> > > > 
> > > > acpi_dsdt_add_host_bridge_methods is a new top helper that generates
> > > > both the _OSC and _DSM methods.
> > > > 
> > > > Signed-off-by: Eric Auger <eric.auger@redhat.com>
> > > > Reviewed-by: Gustavo Romero <gustavo.romero@linaro.org>      
> > > 
> > > Makes complete sense. I've had local equivalent of this on the CXL
> > > tree for a while as without it we don't register the _DSM for the
> > > CXL path (and we should).  However, can you modify it a little to
> > > make that easier for me?  Basically make sure the _DSM is registered
> > > for the CXL path as well.
> > >     
> > [...]
> > unless CXL is root host bridge, current _DSM shouldn't be added to it.
> > read on comment below.  
> 
> I'm not clear how this is different from pxb-pcie where we do have
> the _DSM. Both are pretending to be real host bridges.

there is some space for _OSC consolidation, but it's not realy related to pcihp,
so I'd rather do it as a separate series on top. 

current PCI _DSM and _CXL one (build_cxl_dsm_method) are implementing
different namespaces, there is not much to consolidate there.

If later on CXL would need E5C937D0-3553-4D7A-9117-EA4D19C3434D,
then, I'd say do it at that time and use that moment as an opportunity
to consolidate.

> >   
> > > > @@ -124,7 +125,17 @@ static void acpi_dsdt_add_pci_osc(Aml *dev, bool enable_native_pcie_hotplug)
> > > >      byte_list[0] = 0;
> > > >      buf = aml_buffer(1, byte_list);
> > > >      aml_append(method, aml_return(buf));
> > > > -    aml_append(dev, method);
> > > > +    return method;
> > > > +}
> > > > +
> > > > +static void acpi_dsdt_add_host_bridge_methods(Aml *dev,
> > > > +                                              bool enable_native_pcie_hotplug)
> > > > +{
> > > > +    aml_append(dev, aml_name_decl("SUPP", aml_int(0)));
> > > > +    aml_append(dev, aml_name_decl("CTRL", aml_int(0)));      
> > > 
> > > These two declarations seem to be very much part of the _OSC build though not
> > > within the the method.  I 'think' you get left with them later with no users.
> > > So move them into the osc build here and they will naturally go away when
> > > you move to the generic code.
> > > 
> > > They end up unused in the DSDT at the end of the series.
> > > 
> > > I ran a quick GPEX + pxb-pcie test and we do get the odd mix that the OSC for
> > > the GPEX say no native hotplug but the OSC for the PXB allows it.    
> > 
> > It's fine for each PXB to have it's own _OSC.
> > Also current incarnation of ACPI pcihp doesn't support PXBs at all,
> > it would be wrong to enable the on PXBs.
> > 
> > Thus I'd avoid touching CXL related code paths from this series.
> > 
> > I'm working on extending ACPI pcihp to PXBs
> > (for the same reason as Eric does for arm/virt, i.e. enable acpi-index support there).
> > I can add CXL bits then if there is a need/demand for that in CXL land.  
> 
> Ok.  My original motivation for _DSM on CXL was function 5 to stop Linux messing up
> the reenumeration which I know has been rejected upstream for a bunch of
> compatibility reasons.  Anyhow, that's a future problem.

yep, let's worry about merging _DSMs when that future comes.

> 
> Thanks,
> 
> Jonathan
> 
> > 
> > [...]
> > 
> >   
> 
