Received: by 2002:a17:505:8ed0:b0:1be9:327d:8ee3 with SMTP id kh16csp852489njc;
        Fri, 20 Jun 2025 05:27:20 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU0cG9h/6eubVaU17F3FAAblZbsUjnSr892Up/5+Em8jhn9lS0PQtycIWbjAmM4NW/o59jbwkCvgPEm2g==@linaro.org
X-Google-Smtp-Source: AGHT+IGQ0VGsUh5UvKRVi8P8YzvBhmkEqClPixMM5saVdbIZYUQeqt2cRXSO2ByDIOAF0mEM3CZp
X-Received: by 2002:a05:622a:1904:b0:4a4:313a:e0a3 with SMTP id d75a77b69052e-4a77a25d223mr31568841cf.29.1750422440161;
        Fri, 20 Jun 2025 05:27:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750422440; cv=none;
        d=google.com; s=arc-20240605;
        b=k8KFEMp7g1JXgQqWLZS0hg3EpSkJ7/ChzvMUry2B5K0jgcsRNj+lVjyN9RcMyzyco2
         CR4gjsTzyDmoIEDhVVn0LQMSHVuSA7gNQ/PX1gwrihgS+L77PoxD46eOlHBVvLbLII/M
         0PObu1dnqgRZb0hNJtSaOoggOOfAU+bNrj8xyqBd9fzzh8vYGI9TdJq63ybOjVVplQXs
         IV0vuWA3Wgt0L08WJj6QJqOrUUugVCcmfVzqSYMgOWJb2JjP+3+JdFIswl4XPKX84z4m
         SmMQ6fsQKgd75ivLoJVEDqpyDUhhVygirX326AYc6qaR1VnzgA163jpp5drEtWJM3raR
         gQMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:dkim-signature;
        bh=HsVVfo4kZ4kiu9BrFrTNt7r/DIf0qYw+e+sl2xJBqzw=;
        fh=ENCvsKkvysxLTqWSekQoXJ/xsNTBdv0hCNebP56R+jo=;
        b=QxkHc+OUAtvKnc5dqz+a7vjDb3YxLmY2t9yV2Q8LrPXV9RufejvtoiUDICqDWz9XKh
         w6SeZVaRXOEHJlpzRAk+5PxRhxuO8NwBjbK3941l1286oakAx3Px4gzoda34/pWWAA1d
         cVlEvM37HKVme8/Kv3v8mq/TG5Z/DMIosyvL1fXp146z8wnOoemzHyHhq9TtbvXdI12Z
         VAC6+g8US4bwPb78pXYB1bqy5PHpjFeoINLAGwD2XAH2Yk1BYnM/eC2Rh1IF7Z+GxRgb
         AIguHUUdUehe25ZTG5qgOD2efaz4HRyHyglJKvq6ZBa3LnbLwKgJDHlT4yx2CFlW1MKV
         yT0A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=CLvc6pkY;
       spf=pass (google.com: domain of imammedo@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=imammedo@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <imammedo@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id d75a77b69052e-4a77a0b62a2si15681791cf.383.2025.06.20.05.27.20
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jun 2025 05:27:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of imammedo@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=CLvc6pkY;
       spf=pass (google.com: domain of imammedo@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=imammedo@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750422439;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HsVVfo4kZ4kiu9BrFrTNt7r/DIf0qYw+e+sl2xJBqzw=;
	b=CLvc6pkYFPdXwTlieqfjzWyyeO43LgjpXg63xS0YOivd3NsM2C/LyawWM8ZFFtHaAdcxyj
	oJP94CSdmLc/1QafbEFWm0SRRcJ6qQhiN7pHvbkJHP+b3JVjYkj6gD/h3dTrZr9iqMOqiT
	XlfGMxkbB8sBkQJrF0zC5V6S48zr6Zg=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-646-5H-f0bQaMFujJAYf9AYsVw-1; Fri, 20 Jun 2025 08:27:18 -0400
X-MC-Unique: 5H-f0bQaMFujJAYf9AYsVw-1
X-Mimecast-MFC-AGG-ID: 5H-f0bQaMFujJAYf9AYsVw_1750422437
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4535ad64d30so14425435e9.3
        for <alex.bennee@linaro.org>; Fri, 20 Jun 2025 05:27:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750422437; x=1751027237;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HsVVfo4kZ4kiu9BrFrTNt7r/DIf0qYw+e+sl2xJBqzw=;
        b=GvEvTZF+VUWibGr4YHDH8mMDXqrSkS7Cg0C2E4F9GgffComnUMTIOrMEGjLhQO1eCV
         1wFbNA3vTgWBWRJlg2/M77Bacb5wJOSP37t+pHLnY2BBMTBS5rcZsNVHeJbQhHcFUFIZ
         NC41ieeGPJjZD/TIDrK83yBvhwAdj8Z1QaRC5BebwTjD5Z0mvOhjFQeXhVPHpALQh3zy
         fStIvh/GlOKUvC39ni0OZXYJqRt33tni0zBZCD+NoraxguVM0vpNakw5Q+xrv0fWv2tc
         lfIZ934pEXfsq+RM2jQlTV1C8MVMX/CWWjLabjLu26s/DxcjleAAbkq8lZ/+PKJwHUHn
         nkDQ==
X-Forwarded-Encrypted: i=1; AJvYcCVNZdkTtripuUBd8X162Z9BHp23d/1NTxuzJaViqwJc0aUEQncaBbvAtPLsHiAX/jkAN8X2/tfRD4NUFA==@linaro.org
X-Gm-Message-State: AOJu0YzmMbY9TmA4H5FZgnTSmyfxFupqK8p4nmEtRJ0WxdmJPLd3/VHi
	m/Taikg2MerePaeJdhIkDdc6GSywkJtbX2tTgjmo4FOlchp2x/2/zxNEllqA2FuKuIptw8OTl/n
	puapTMB27VOCMmmJ5CnfhMy4sLvEMA5AVTaNvaCizzgbjbdt2b1A3ncr2Qw==
X-Gm-Gg: ASbGncu2fs4uKX3e7C7NYzq51Py1HUsgPqW2nX4TAW/B4bAIX+h6dzHSy1j33M+uPuB
	AqCERVLBdNi5w7yaz8XgVTlMEKIr2rRTspXwx/tI5dGzspaNdpWqdqmir5AurNwhXYT70Hr8Te9
	2SGgwCJvoh9L7YI/k1dYiusOxS+Gr6cwrG6JAFIOQECUZvJ2+bgReWe+c+pwHeluLovDxBKCqPt
	4bzZQkSOMOInTDRuj1lWN89hPfxdM8+01uyw8s/cQCo+tZ4VTrucKYtagXOOHWV8IrD0Gflqt45
	yotRsRzMvfTW
X-Received: by 2002:a05:6000:1448:b0:3a4:dd8e:e16d with SMTP id ffacd0b85a97d-3a6d12a3bc0mr2195371f8f.15.1750422437375;
        Fri, 20 Jun 2025 05:27:17 -0700 (PDT)
X-Received: by 2002:a05:6000:1448:b0:3a4:dd8e:e16d with SMTP id ffacd0b85a97d-3a6d12a3bc0mr2195342f8f.15.1750422436779;
        Fri, 20 Jun 2025 05:27:16 -0700 (PDT)
Return-Path: <imammedo@redhat.com>
Received: from fedora ([85.93.96.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4535e741b43sm59446925e9.0.2025.06.20.05.27.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jun 2025 05:27:16 -0700 (PDT)
Date: Fri, 20 Jun 2025 14:27:14 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: Eric Auger <eric.auger@redhat.com>, <eric.auger.pro@gmail.com>,
 <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, <peter.maydell@linaro.org>,
 <gustavo.romero@linaro.org>, <anisinha@redhat.com>, <mst@redhat.com>,
 <shannon.zhaosl@gmail.com>, <pbonzini@redhat.com>, <philmd@linaro.org>,
 <alex.bennee@linaro.org>
Subject: Re: [PATCH v3 16/29] hw/i386/acpi-build: Move aml_pci_edsm to a
 generic place
Message-ID: <20250620142714.4c4b1d8a@fedora>
In-Reply-To: <20250620101936.00005f96@huawei.com>
References: <20250616094903.885753-1-eric.auger@redhat.com>
	<20250616094903.885753-17-eric.auger@redhat.com>
	<20250620101936.00005f96@huawei.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: tdFGuRvAm3Lh0M3SCOP4_IM8rZjVpvqbbIFHQ_WMu00_1750422437
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-TUID: rBDfGqM7UNQG

On Fri, 20 Jun 2025 10:19:36 +0100
Jonathan Cameron <Jonathan.Cameron@huawei.com> wrote:

> On Mon, 16 Jun 2025 11:46:45 +0200
> Eric Auger <eric.auger@redhat.com> wrote:
> 
> > Move aml_pci_edsm to pci-bridge.c since we want to reuse that for
> > ARM and acpi-index support.
> > 
> > Signed-off-by: Eric Auger <eric.auger@redhat.com>  
> 
> A request for a bit of documentation inline.  aml_pci_edsm() sounds
> like we should be able to grep the spec for edsm and find it but
> that's just internal method naming in qemu.

agree, aml_ prefix is typically reserved for ACPI spec items. 

perhaps rename it to follow build_ prefix scheme?

> 
> 
> More interesting is I don't think this will ever be called as
> the kernel has no idea how to call it and unlike on x86 the
> blobs don't show wrapping the call in a _DSM() (see aml_pci_static_endpoint_dsm())
> 
> Did EDSM usage get dropped as this set evolved leaving this behind?
> 
> 
> 
> >
> > ---
> > 
> > v2 -> v3:
> > - move to pci-bridge.c instead of pcihp.c (Igor)
> > ---
> >  include/hw/acpi/pci.h |  1 +
> >  hw/acpi/pci-bridge.c  | 54 +++++++++++++++++++++++++++++++++++++++++++
> >  hw/i386/acpi-build.c  | 53 ------------------------------------------
> >  3 files changed, 55 insertions(+), 53 deletions(-)
> > 
> > diff --git a/include/hw/acpi/pci.h b/include/hw/acpi/pci.h
> > index 69bae95eac..05e72815c8 100644
> > --- a/include/hw/acpi/pci.h
> > +++ b/include/hw/acpi/pci.h
> > @@ -42,5 +42,6 @@ void build_pci_bridge_aml(AcpiDevAmlIf *adev, Aml *scope);
> >  void build_srat_generic_affinity_structures(GArray *table_data);
> >  
> >  Aml *build_pci_host_bridge_osc_method(bool enable_native_pcie_hotplug);
> > +Aml *aml_pci_edsm(void);
> >  
> >  #endif
> > diff --git a/hw/acpi/pci-bridge.c b/hw/acpi/pci-bridge.c
> > index 7baa7034a1..be68a98c34 100644
> > --- a/hw/acpi/pci-bridge.c
> > +++ b/hw/acpi/pci-bridge.c
> > @@ -35,3 +35,57 @@ void build_pci_bridge_aml(AcpiDevAmlIf *adev, Aml *scope)
> >          }
> >      }
> >  }
> > +
> > +Aml *aml_pci_edsm(void)  
> 
> Can we have some comments, or a more descriptive name than
> the resulting method name?  There is stuff in the function obviously
> that associates it with the naming DSM but given this is moving to
> generic code maybe it needs a brief intro comment?
> 
> 
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
> > diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> > index fe8bc62c03..6cf623392e 100644
> > --- a/hw/i386/acpi-build.c
> > +++ b/hw/i386/acpi-build.c
> > @@ -338,59 +338,6 @@ build_facs(GArray *table_data)
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
