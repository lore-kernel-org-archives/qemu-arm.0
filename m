Received: by 2002:a17:505:a38d:b0:1be9:327d:8ee3 with SMTP id rs13csp4840690njc;
        Tue, 27 May 2025 07:07:21 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVoBztioksVStCV2dWuZoANYQIiuu/m9RlcjlaQX9mb+nSJ8aJTYgU/peRUgemMrw8ye49UPV51Qr0cLg==@linaro.org
X-Google-Smtp-Source: AGHT+IHWise59S+1rp1henPlJTtSYI7gUqWe9z0TWV9SfpI1UTTeFu0T7Gd3jXXZqBz0qgLWMA4u
X-Received: by 2002:a05:622a:2296:b0:494:9fce:28f7 with SMTP id d75a77b69052e-49f4675081amr209252721cf.17.1748354840856;
        Tue, 27 May 2025 07:07:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1748354840; cv=none;
        d=google.com; s=arc-20240605;
        b=HKxZoICRj9OFzhugGi0Sevk0dUtD4E87NBlQfiGcADJVrfZKB8tGm8X4ZfGjXw2jQP
         pn/5j3+G/DH+c+qZnkTA+4pnrMxMKKmDWHSiVhCIoGA4IZ5FPSNBKZtxwvtG/TOOC6hf
         82ZcLHG3as5MHSUt/mYInNmfD8AM8B8A5xF4ZNLvtbVA+O9qKjMzKbEFNFezghYeC9nP
         wOS6oEooZ96I4d/HgoqzOxP1h3A7edVAQE1z4XIUQDq3DaCfIdSGLthpnHUi75/mWS8M
         EMcbdUyNqS10qG+gwl2z4n0W3k8gtn33jtwYjfxKIX2R8BYJR8dADyEnJ7H0JRIUpmIP
         ChUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:dkim-signature;
        bh=n+5kxvmEYFekHGHzkSClLIJuIds5hcNymT+Rj8w+7+M=;
        fh=0wUMrxSWS5766h2xsgPAYMcOvrlNOgsfTBS8ENdL7S8=;
        b=D70/LPodIBD9RNZ9TZwr/2d+00ZXtAzpchAWqTFOAStlTHX6JX4xTY6T+tMu4OiI09
         nrfUzt8PiSiyhcQv1NJaHwxF8nMEXkJTpl6s0MPNYXy2CQEmYex1TOr8uYSVSprnj/4s
         LfGIkYlLa2xRVBCVlSGTh5kjkHVsFQwrnTzohTWhCBKm6dsgUjC/KHF89TgI9Ne4EiPB
         tgliruFHU8Vd6y8epA67u/1WTM8MGj3S2j5kIB4JuLmObG43CqCDEGxoNvQOFLjCCif2
         j++zfQfT8K09EJvDYlt2oMJRzqH42F7btXtGHiQAW94pQgsTg1iBFM50Q6WaT/OHfXNR
         mUAw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=bI+eOvzS;
       spf=pass (google.com: domain of imammedo@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=imammedo@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <imammedo@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id d75a77b69052e-494ae5907adsi258995461cf.506.2025.05.27.07.07.20
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 May 2025 07:07:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of imammedo@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=bI+eOvzS;
       spf=pass (google.com: domain of imammedo@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=imammedo@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748354840;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=n+5kxvmEYFekHGHzkSClLIJuIds5hcNymT+Rj8w+7+M=;
	b=bI+eOvzS92jaE4mtdW4Fwn2PyjTzCd/EOaLAcK/iBebNdSjnNji9+taomdOwRnoDm/R8oK
	aSYUtWG2WfTry3YHPQFCMkEZdcQ48eacdXKcdu64aRAV88b/ZymZKK8LJ2I+eAT+obcGOm
	0bvBz1fLWMMnc98GXt8NMXmPTeKH3pA=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-443-Q1PZ_A3SPoODAVR1Pz4bOg-1; Tue, 27 May 2025 10:07:19 -0400
X-MC-Unique: Q1PZ_A3SPoODAVR1Pz4bOg-1
X-Mimecast-MFC-AGG-ID: Q1PZ_A3SPoODAVR1Pz4bOg_1748354838
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-3a4d6d22b1aso1482238f8f.0
        for <alex.bennee@linaro.org>; Tue, 27 May 2025 07:07:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748354838; x=1748959638;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n+5kxvmEYFekHGHzkSClLIJuIds5hcNymT+Rj8w+7+M=;
        b=XEbPYLvWxDVI5H2AHMxfrNDDRMVXFDy1OIY3AexVwVZC6YLI1cFy4V6TZUCccJn71p
         hBvZH2rwPgM3ExT85T0WxurNHLYqpl1Q4x6k6tqRnDMbo+W6b3cOFLGSF7UgOGw7zxBd
         OrkRaJU64SsF4dQ5tvOsEPKGQrAZp1Egs2NOFTTUF21pzMyFU1eAr4auyvtLk/zEAi08
         kb5X327dJUOiJtP9gQUOasoBBu41BKkxSFzfQwaiEs7YSnMMywVvQv0N86bkC7o667oJ
         g+uxM7xHkqFVf3YftbwTzydRovVdULNC9QZgsUSSdN/7RdpqB6j9t+HQ4XFJJq2vT4kq
         DToQ==
X-Forwarded-Encrypted: i=1; AJvYcCVxdH3YIn9QY4soigXEcKaJjv6/5/cRzZ9piTuVGo2htxNIuYgSgL2LnfcL7HpkzmXPcLjXFTHxdxnFvA==@linaro.org
X-Gm-Message-State: AOJu0Yzs7u5iMltrh46njEM6vkdLafZgq2c3an26srmYuUDOuL5UmyaI
	d19SCL4hm659c3j6ysn+HYe+U3wi0kpRbfZXNjxKRXIPq+negNcIs8ZQ81VTdSOlsoj1v/WSDKh
	9lWsaUH2o/+EYK3yCVBLwgi9nVEKf9i0Qv23qs7/Hp/KJbEozO7tyx5UdYg==
X-Gm-Gg: ASbGncvvLdHfmW3RuyZBTaCrGFft9cew2JpQdaYbdMquxGH2NmwYwmNYi7Z9wPnG969
	RKpoMb8Hxlll9CuKUJG5JSZNIvpgu7aLwS5F0cxnjAXYbjYgMEaATjeOOwkj033+cZ9yAapEwx8
	ydhRTfGm83igLPWDtPukPh+n0WKIkxn4iDxxCTahg5O6plgoAhbpFX1qzf0p3bvuVJAP9i3sseR
	DQ78B0wWhSUOfo+cS7RSZzsr8o0Ye1Mq6I/V3oWBS4ZBgSdS8VzlNr+hrfRnrMczkJlIzCmeWu0
	lqCfwf2pTpkRLik81n9Tgo7VbAca0Eql
X-Received: by 2002:a05:6000:2890:b0:3a4:d7ba:940f with SMTP id ffacd0b85a97d-3a4d7ba9678mr6282681f8f.8.1748354837813;
        Tue, 27 May 2025 07:07:17 -0700 (PDT)
X-Received: by 2002:a05:6000:2890:b0:3a4:d7ba:940f with SMTP id ffacd0b85a97d-3a4d7ba9678mr6282629f8f.8.1748354837292;
        Tue, 27 May 2025 07:07:17 -0700 (PDT)
Return-Path: <imammedo@redhat.com>
Received: from imammedo.users.ipa.redhat.com ([85.93.96.130])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4cf211828sm10247188f8f.61.2025.05.27.07.07.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 May 2025 07:07:16 -0700 (PDT)
Date: Tue, 27 May 2025 16:07:14 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Cc: eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 peter.maydell@linaro.org, gustavo.romero@linaro.org, anisinha@redhat.com,
 mst@redhat.com, shannon.zhaosl@gmail.com, pbonzini@redhat.com,
 Jonathan.Cameron@huawei.com, philmd@linaro.org, alex.bennee@linaro.org
Subject: Re: [PATCH v2 16/25] hw/i386/acpi-build: Move aml_pci_edsm to a
 generic place
Message-ID: <20250527160714.4b82f776@imammedo.users.ipa.redhat.com>
In-Reply-To: <20250527160040.5641920d@imammedo.users.ipa.redhat.com>
References: <20250527074224.1197793-1-eric.auger@redhat.com>
	<20250527074224.1197793-17-eric.auger@redhat.com>
	<20250527160040.5641920d@imammedo.users.ipa.redhat.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ocYNUgvTRZ7zqP9zBIYhFOnkA1QhkJewFbacAkSTxas_1748354838
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-TUID: tF6abTEdj7E5

On Tue, 27 May 2025 16:00:40 +0200
Igor Mammedov <imammedo@redhat.com> wrote:

> On Tue, 27 May 2025 09:40:18 +0200
> Eric Auger <eric.auger@redhat.com> wrote:
> 
> > Move aml_pci_edsm to pcihp since we want to reuse that for
> > ARM and acpi-index support.
> > 
> > Signed-off-by: Eric Auger <eric.auger@redhat.com>
> > ---
> >  include/hw/acpi/pcihp.h |  2 ++
> >  hw/acpi/pcihp.c         | 53 +++++++++++++++++++++++++++++++++++++++++  
> 
> edsm is for un-pluggable ports,
> a more suitable place for it would be hw/acpi/pci.c

or maybe hw/acpi/pci-bridge.c as its owner/call is a bridge

> 
> 
> >  hw/i386/acpi-build.c    | 53 -----------------------------------------
> >  3 files changed, 55 insertions(+), 53 deletions(-)
> > 
> > diff --git a/include/hw/acpi/pcihp.h b/include/hw/acpi/pcihp.h
> > index 5506a58862..f2c3558654 100644
> > --- a/include/hw/acpi/pcihp.h
> > +++ b/include/hw/acpi/pcihp.h
> > @@ -82,6 +82,8 @@ bool build_append_notification_callback(Aml *parent_scope, const PCIBus *bus);
> >  
> >  void build_append_pci_bus_devices(Aml *parent_scope, PCIBus *bus);
> >  
> > +Aml *aml_pci_edsm(void);
> > +
> >  /* Called on reset */
> >  void acpi_pcihp_reset(AcpiPciHpState *s);
> >  
> > diff --git a/hw/acpi/pcihp.c b/hw/acpi/pcihp.c
> > index d800371ddc..57fe8938b1 100644
> > --- a/hw/acpi/pcihp.c
> > +++ b/hw/acpi/pcihp.c
> > @@ -937,6 +937,59 @@ void build_append_pci_bus_devices(Aml *parent_scope, PCIBus *bus)
> >      }
> >  }
> >  
> > +Aml *aml_pci_edsm(void)
> > +{
> > +    Aml *method, *ifctx;
> > +    Aml *zero = aml_int(0);
> > +    Aml *func = aml_arg(2);
> > +    Aml *ret = aml_local(0);
> > +    Aml *aidx = aml_local(1);
> > +    Aml *params = aml_arg(4);
> > +
> > +    method = aml_method("EDSM", 5, AML_SERIALIZED);
> > +
> > +    /* get supported functions */
> > +    ifctx = aml_if(aml_equal(func, zero));
> > +    {
> > +        /* 1: have supported functions */
> > +        /* 7: support for function 7 */
> > +        const uint8_t caps = 1 | BIT(7);
> > +        build_append_pci_dsm_func0_common(ifctx, ret);
> > +        aml_append(ifctx, aml_store(aml_int(caps), aml_index(ret, zero)));
> > +        aml_append(ifctx, aml_return(ret));
> > +    }
> > +    aml_append(method, ifctx);
> > +
> > +    /* handle specific functions requests */
> > +    /*
> > +     * PCI Firmware Specification 3.1
> > +     * 4.6.7. _DSM for Naming a PCI or PCI Express Device Under
> > +     *        Operating Systems
> > +     */
> > +    ifctx = aml_if(aml_equal(func, aml_int(7)));
> > +    {
> > +       Aml *pkg = aml_package(2);
> > +       aml_append(pkg, zero);
> > +       /* optional, if not impl. should return null string */
> > +       aml_append(pkg, aml_string("%s", ""));
> > +       aml_append(ifctx, aml_store(pkg, ret));
> > +
> > +       /*
> > +        * IASL is fine when initializing Package with computational data,
> > +        * however it makes guest unhappy /it fails to process such AML/.
> > +        * So use runtime assignment to set acpi-index after initializer
> > +        * to make OSPM happy.
> > +        */
> > +       aml_append(ifctx,
> > +           aml_store(aml_derefof(aml_index(params, aml_int(0))), aidx));
> > +       aml_append(ifctx, aml_store(aidx, aml_index(ret, zero)));
> > +       aml_append(ifctx, aml_return(ret));
> > +    }
> > +    aml_append(method, ifctx);
> > +
> > +    return method;
> > +}
> > +
> >  const VMStateDescription vmstate_acpi_pcihp_pci_status = {
> >      .name = "acpi_pcihp_pci_status",
> >      .version_id = 1,
> > diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> > index 6feb99e9eb..e8ed335fdd 100644
> > --- a/hw/i386/acpi-build.c
> > +++ b/hw/i386/acpi-build.c
> > @@ -322,59 +322,6 @@ build_facs(GArray *table_data)
> >      g_array_append_vals(table_data, reserved, 40); /* Reserved */
> >  }
> >  
> > -static Aml *aml_pci_edsm(void)
> > -{
> > -    Aml *method, *ifctx;
> > -    Aml *zero = aml_int(0);
> > -    Aml *func = aml_arg(2);
> > -    Aml *ret = aml_local(0);
> > -    Aml *aidx = aml_local(1);
> > -    Aml *params = aml_arg(4);
> > -
> > -    method = aml_method("EDSM", 5, AML_SERIALIZED);
> > -
> > -    /* get supported functions */
> > -    ifctx = aml_if(aml_equal(func, zero));
> > -    {
> > -        /* 1: have supported functions */
> > -        /* 7: support for function 7 */
> > -        const uint8_t caps = 1 | BIT(7);
> > -        build_append_pci_dsm_func0_common(ifctx, ret);
> > -        aml_append(ifctx, aml_store(aml_int(caps), aml_index(ret, zero)));
> > -        aml_append(ifctx, aml_return(ret));
> > -    }
> > -    aml_append(method, ifctx);
> > -
> > -    /* handle specific functions requests */
> > -    /*
> > -     * PCI Firmware Specification 3.1
> > -     * 4.6.7. _DSM for Naming a PCI or PCI Express Device Under
> > -     *        Operating Systems
> > -     */
> > -    ifctx = aml_if(aml_equal(func, aml_int(7)));
> > -    {
> > -       Aml *pkg = aml_package(2);
> > -       aml_append(pkg, zero);
> > -       /* optional, if not impl. should return null string */
> > -       aml_append(pkg, aml_string("%s", ""));
> > -       aml_append(ifctx, aml_store(pkg, ret));
> > -
> > -       /*
> > -        * IASL is fine when initializing Package with computational data,
> > -        * however it makes guest unhappy /it fails to process such AML/.
> > -        * So use runtime assignment to set acpi-index after initializer
> > -        * to make OSPM happy.
> > -        */
> > -       aml_append(ifctx,
> > -           aml_store(aml_derefof(aml_index(params, aml_int(0))), aidx));
> > -       aml_append(ifctx, aml_store(aidx, aml_index(ret, zero)));
> > -       aml_append(ifctx, aml_return(ret));
> > -    }
> > -    aml_append(method, ifctx);
> > -
> > -    return method;
> > -}
> > -
> >  /*
> >   * build_prt - Define interrupt routing rules
> >   *  
> 
