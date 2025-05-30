Received: by 2002:a17:504:1b46:b0:1be9:327d:8ee3 with SMTP id t6csp1026078njh;
        Fri, 30 May 2025 03:02:30 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWfts8YTSXB4YIipKzog5MlNuweuUayxZ++VsKogU01X8M4NOqWFfrRdQJAx4L7w2xFmaJNTAHdqsyJzw==@linaro.org
X-Google-Smtp-Source: AGHT+IEZY+NN0tsWqow4FE7nsV8yDK+Vn0d466Xzmdz9SgL9D6R/2glEvq50HTorbqGKMratbce2
X-Received: by 2002:a05:6000:2505:b0:3a4:f6cc:a8c8 with SMTP id ffacd0b85a97d-3a4f7ab570fmr2097351f8f.51.1748599350495;
        Fri, 30 May 2025 03:02:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1748599350; cv=none;
        d=google.com; s=arc-20240605;
        b=L91Of0TsebbWic9zKudisv74fh/RzGW2XruGS+MgbRrqtGJjXfpecY2QAKU97vNbUg
         TSRFEqkyA/F7hxByVhM3tnF1cWEWZSmmSOMq8Hv/5zAyHE9KZZgff0zGfu/MGbB8ZuRI
         AF0eLFlVZtCG2rYBfYy54s1s/gaEUgAIaDyFUcov8RxM2eA0SKZt1UwwajDoHN4n9DM5
         dyougdBI1KXPG0SSBL8tjpMMMn9eeca5P9eoGJIFd9PCyYstpEcZh4WyvHCj4F8JY2Sa
         SgptBLXEEdSeFWu+tKzLcodmgF3pSbqEZmeaAICxztLFsIjMuKopf4FMedbxGPc4UuTq
         PyuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date;
        bh=n8QesRz+d/eKQy81vK6tDd5neJexKboB3DlW8osH8Us=;
        fh=De5j/+RFiHp5oysg/kfBHcT9O0ASuV5hpNukEk4skqM=;
        b=c6xg4LLEYCm/VM6SqonnzvyHL52OHB8loj/feMr0zDfBFHJCDpxKykQoAPl6YKu6xR
         hHPzuInxvJnTDB0R7iLP/Sk/p+k55/R2Mj+ZUl1527hqSJEuokrQrpvGqHRrw/TV/2Bf
         nZfghNwslZ+D5qPQFC5OjVpbBEVHrYKr7VV7SRpzJQHn2gIGowRj9Fhpb4iE6MIChanb
         Kw07MP0WRf/EiLQ9HuaSzvGAPyBXJQzZ3AftJmC27PMO+biRThe6j5+VTO7VhizvL1fo
         iQ/DctG/8G62DXcoklwVcTWNLCB+SMk9aQFkFiQPsnPX1rripmrZwWUFGHY0/g2rlkGJ
         ILuA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=jonathan.cameron@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <jonathan.cameron@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id ffacd0b85a97d-3a4f00960d5si2540867f8f.763.2025.05.30.03.02.30
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 30 May 2025 03:02:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=jonathan.cameron@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.216])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4b7zLS25FRz6GDtT;
	Fri, 30 May 2025 18:02:24 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id AEB86140516;
	Fri, 30 May 2025 18:02:29 +0800 (CST)
Received: from localhost (10.203.177.66) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Fri, 30 May
 2025 12:02:29 +0200
Date: Fri, 30 May 2025 11:02:27 +0100
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: Eric Auger <eric.auger@redhat.com>
CC: <eric.auger.pro@gmail.com>, <qemu-devel@nongnu.org>,
	<qemu-arm@nongnu.org>, <peter.maydell@linaro.org>, <imammedo@redhat.com>,
	<gustavo.romero@linaro.org>, <anisinha@redhat.com>, <mst@redhat.com>,
	<shannon.zhaosl@gmail.com>, <pbonzini@redhat.com>, <philmd@linaro.org>,
	<alex.bennee@linaro.org>
Subject: Re: [PATCH v2 05/25] hw/pci-host/gpex-acpi: Split host bridge OSC
 and DSM generation
Message-ID: <20250530110227.00003341@huawei.com>
In-Reply-To: <20250527074224.1197793-6-eric.auger@redhat.com>
References: <20250527074224.1197793-1-eric.auger@redhat.com>
	<20250527074224.1197793-6-eric.auger@redhat.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.66]
X-ClientProxiedBy: lhrpeml100006.china.huawei.com (7.191.160.224) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-TUID: YLHJ4yyPs/xM

On Tue, 27 May 2025 09:40:07 +0200
Eric Auger <eric.auger@redhat.com> wrote:

> acpi_dsdt_add_pci_osc() name is confusing as it gives the impression
> it appends the _OSC method but in fact it also appends the _DSM method
> for the host bridge. Let's split the function into two separate ones
> and let them return the method Aml pointer instead. This matches the
> way it is done on x86 (build_q35_osc_method). In a subsequent patch
> we will replace the gpex method by the q35 implementation that will
> become shared between ARM and x86.
> 
> acpi_dsdt_add_host_bridge_methods is a new top helper that generates
> both the _OSC and _DSM methods.
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> Reviewed-by: Gustavo Romero <gustavo.romero@linaro.org>

Makes complete sense. I've had local equivalent of this on the CXL
tree for a while as without it we don't register the _DSM for the
CXL path (and we should).  However, can you modify it a little to
make that easier for me?  Basically make sure the _DSM is registered
for the CXL path as well.

One other comment inline.


> ---
>  hw/pci-host/gpex-acpi.c | 31 +++++++++++++++++++++----------
>  1 file changed, 21 insertions(+), 10 deletions(-)
> 
> diff --git a/hw/pci-host/gpex-acpi.c b/hw/pci-host/gpex-acpi.c
> index f34b7cf25e..1aa2d12026 100644
> --- a/hw/pci-host/gpex-acpi.c
> +++ b/hw/pci-host/gpex-acpi.c
> @@ -50,13 +50,10 @@ static void acpi_dsdt_add_pci_route_table(Aml *dev, uint32_t irq,
>      }
>  }
>  
> -static void acpi_dsdt_add_pci_osc(Aml *dev, bool enable_native_pcie_hotplug)
> +static Aml *build_host_bridge_osc(bool enable_native_pcie_hotplug)
>  {
> -    Aml *method, *UUID, *ifctx, *ifctx1, *elsectx, *buf;
> +    Aml *method, *UUID, *ifctx, *ifctx1, *elsectx;
>  
> -    /* Declare an _OSC (OS Control Handoff) method */
> -    aml_append(dev, aml_name_decl("SUPP", aml_int(0)));
> -    aml_append(dev, aml_name_decl("CTRL", aml_int(0)));
>      method = aml_method("_OSC", 4, AML_NOTSERIALIZED);
>      aml_append(method,
>          aml_create_dword_field(aml_arg(3), aml_int(0), "CDW1"));
> @@ -103,9 +100,13 @@ static void acpi_dsdt_add_pci_osc(Aml *dev, bool enable_native_pcie_hotplug)
>                                 aml_name("CDW1")));
>      aml_append(elsectx, aml_return(aml_arg(3)));
>      aml_append(method, elsectx);
> -    aml_append(dev, method);
> +    return method;
> +}
>  
> -    method = aml_method("_DSM", 4, AML_NOTSERIALIZED);
> +static Aml *build_host_bridge_dsm(void)
> +{
> +    Aml *method = aml_method("_DSM", 4, AML_NOTSERIALIZED);
> +    Aml *UUID, *ifctx, *ifctx1, *buf;
>  
>      /* PCI Firmware Specification 3.0
>       * 4.6.1. _DSM for PCI Express Slot Information
> @@ -124,7 +125,17 @@ static void acpi_dsdt_add_pci_osc(Aml *dev, bool enable_native_pcie_hotplug)
>      byte_list[0] = 0;
>      buf = aml_buffer(1, byte_list);
>      aml_append(method, aml_return(buf));
> -    aml_append(dev, method);
> +    return method;
> +}
> +
> +static void acpi_dsdt_add_host_bridge_methods(Aml *dev,
> +                                              bool enable_native_pcie_hotplug)
> +{
> +    aml_append(dev, aml_name_decl("SUPP", aml_int(0)));
> +    aml_append(dev, aml_name_decl("CTRL", aml_int(0)));

These two declarations seem to be very much part of the _OSC build though not
within the the method.  I 'think' you get left with them later with no users.
So move them into the osc build here and they will naturally go away when
you move to the generic code.

They end up unused in the DSDT at the end of the series.

I ran a quick GPEX + pxb-pcie test and we do get the odd mix that the OSC for
the GPEX say no native hotplug but the OSC for the PXB allows it.

> +    /* Declare an _OSC (OS Control Handoff) method */
> +    aml_append(dev, build_host_bridge_osc(enable_native_pcie_hotplug));
> +    aml_append(dev, build_host_bridge_dsm());
>  }
>  
>  void acpi_dsdt_add_gpex(Aml *scope, struct GPEXConfig *cfg)
> @@ -193,7 +204,7 @@ void acpi_dsdt_add_gpex(Aml *scope, struct GPEXConfig *cfg)
>              if (is_cxl) {
>                  build_cxl_osc_method(dev);
>              } else {
> -                acpi_dsdt_add_pci_osc(dev, true);
> +                acpi_dsdt_add_host_bridge_methods(dev, true);

Can you either drop the use of the wrapper for the DSM part here and call
it unconditionally (for cxl and PCIe cases) or add an extra call to
aml_append(dev, build_host_bridge_dsm()) for the is_cxl path?

>              }
>  
>              aml_append(scope, dev);
> @@ -268,7 +279,7 @@ void acpi_dsdt_add_gpex(Aml *scope, struct GPEXConfig *cfg)
>      }
>      aml_append(dev, aml_name_decl("_CRS", rbuf));
>  
> -    acpi_dsdt_add_pci_osc(dev, true);
> +    acpi_dsdt_add_host_bridge_methods(dev, true);
>  
>      Aml *dev_res0 = aml_device("%s", "RES0");
>      aml_append(dev_res0, aml_name_decl("_HID", aml_string("PNP0C02")));
