Received: by 2002:a17:505:8ed0:b0:1be9:327d:8ee3 with SMTP id kh16csp760820njc;
        Fri, 20 Jun 2025 02:28:31 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWpj3IirpgATz0/S+dWfIOOPXZvK0/BnWiolGOcs+Yu4xjopNqedag+Hhsos6QRiBlNTbCG8RL7rmQMjg==@linaro.org
X-Google-Smtp-Source: AGHT+IFmc2Hy0eJVSxtb+RCsPLNVt6r9/IwIYAtYSxO71caPT5JuP8XWxuosUtNENIsduDYYLbro
X-Received: by 2002:a05:600c:871b:b0:43c:f6c6:578c with SMTP id 5b1f17b1804b1-453659d0a9bmr20426785e9.15.1750411711151;
        Fri, 20 Jun 2025 02:28:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750411711; cv=none;
        d=google.com; s=arc-20240605;
        b=VYomPUgMeDBDOcVNe7oRrWjZX6SHz9GGl3BQYX81I+Vz1flJZMU0zbVlLvNhtOJaS1
         igqKcfO1CBrU+33/BeBlLoE7FJ9Ar4G/UFkTyye+y9tfWFBIbu39FmVOGKpvrGXLyccT
         ERW/iDDQ5ej0r2k0PhOlJpiE+TfI5nIe2QS/6RVcg6VF7oAJvsoEXoy0ElrCRuK7kNiA
         Oi7ThQGbiA9pfUvN6Q6cINhqbJqr64njhnWpIF4w1Oty6SzNOnvhJjdscbjL17AN+swh
         SMvszSww+yXEXPHtQzTbMVEtaOMKEAdgE9HAPQVMSC7DH/fS6fxXbgqHyDFYzMHPoQqd
         fD4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date;
        bh=5P1lemlN5XgSaY/ZKWnMCRfQuhPVUziA0d7JcB7xfPM=;
        fh=De5j/+RFiHp5oysg/kfBHcT9O0ASuV5hpNukEk4skqM=;
        b=HwgB6AfosZMBCzOd6wl3NISVOCBPHYdMCXUwrUDxJesau7UpqFDu+hBW6V/WnT4PWv
         ZAEV+Tw2ZLLIO58ODr9ZNAxyfqNF8hpmv7J0D7V6XWqS/gJ8V+vnhRCvWSAExD7244in
         MOBan7c2yihBmYWAmAqhY3936lLETyUuFrz/7gq0Sz+Al5H6F0VDbXCaZZaTd3Yopawp
         dXK5oyCGEY4pc6NZRMg4SZjFDPmGZFt2JcQ5kc+MMDSJ5aEY4hnip99znPZ6GTgJM9pB
         yENQ8mXtbtnKCZkahM1ppNvJGqMjJpShqBvAD4gvNL//R8L2ppJtS5naFMkqhq15VCJG
         82JQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=jonathan.cameron@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <jonathan.cameron@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id 5b1f17b1804b1-453646d8eb1si11912145e9.63.2025.06.20.02.28.30
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 20 Jun 2025 02:28:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=jonathan.cameron@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.216])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4bNsZw2Qf3z6M56G;
	Fri, 20 Jun 2025 17:27:52 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id 3F43A140446;
	Fri, 20 Jun 2025 17:28:30 +0800 (CST)
Received: from localhost (10.203.177.66) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Fri, 20 Jun
 2025 11:28:29 +0200
Date: Fri, 20 Jun 2025 10:28:28 +0100
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: Eric Auger <eric.auger@redhat.com>
CC: <eric.auger.pro@gmail.com>, <qemu-devel@nongnu.org>,
	<qemu-arm@nongnu.org>, <peter.maydell@linaro.org>, <imammedo@redhat.com>,
	<gustavo.romero@linaro.org>, <anisinha@redhat.com>, <mst@redhat.com>,
	<shannon.zhaosl@gmail.com>, <pbonzini@redhat.com>, <philmd@linaro.org>,
	<alex.bennee@linaro.org>
Subject: Re: [PATCH v3 16/29] hw/i386/acpi-build: Move aml_pci_edsm to a
 generic place
Message-ID: <20250620102828.00005ea9@huawei.com>
In-Reply-To: <20250620101936.00005f96@huawei.com>
References: <20250616094903.885753-1-eric.auger@redhat.com>
	<20250616094903.885753-17-eric.auger@redhat.com>
	<20250620101936.00005f96@huawei.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.66]
X-ClientProxiedBy: lhrpeml100009.china.huawei.com (7.191.174.83) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-TUID: jCkDwhfif7Wh

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
> 
> 
> More interesting is I don't think this will ever be called as
> the kernel has no idea how to call it and unlike on x86 the
> blobs don't show wrapping the call in a _DSM() (see aml_pci_static_endpoint_dsm())
> 
> Did EDSM usage get dropped as this set evolved leaving this behind?
Doh. You moved and use build_append_pci_bus_devices().

So this is fine.  Ignore me.

I'd still like a comment though - particularly as it turns up in the blobs
with no callers because the examples don't use it yet.

Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>

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
