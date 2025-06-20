Received: by 2002:a17:505:8ed0:b0:1be9:327d:8ee3 with SMTP id kh16csp757324njc;
        Fri, 20 Jun 2025 02:19:40 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUR448y4dZl+mrxi4f2RgbxIh7uYKixSojGqLk/Us69nWsP6CNz0ZBHt6VgCdhlTPFq6aSJbFHStXeZSg==@linaro.org
X-Google-Smtp-Source: AGHT+IHI0bt/ccP5YKhpUrQ1YoiZOGOqAPerUY5Ey29R/YlZauuwnmlfNRt2Ner2ZTo0ZvEwL0d/
X-Received: by 2002:a05:620a:6187:b0:7d3:a606:7c96 with SMTP id af79cd13be357-7d3f98bfd9fmr340724885a.1.1750411180505;
        Fri, 20 Jun 2025 02:19:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750411180; cv=none;
        d=google.com; s=arc-20240605;
        b=ZO3xBexidHO4jAgjY7I9aIANpCtdXHSNzWAIQyQU70TXjHCyMchXsMEu+LEsftq2l3
         gHv0rHXkiUxhRm3MFR0ho8F8PZNu/yf8FA2FPPJjUd7aaJWL+C70zEg/HqGxfq/piIMm
         +6pYmibM3p7vD9jNzqdCCxjf82qz449wqMfCKl31kojXWTORrGf9uzMv5UrYg0WcTD9d
         TO42Ufw8aaBi8AJVeKcow428aShCpvQ2FQBOgj7SxMkYKOX/36WiS09Pvx9LDbvRe1lp
         +f5q1HIAJLnpAIKyQPouiZSJB31I7oTZMvpffs/cqHV2oxWhi8auOvZtDqMlj5n2YOKS
         8bWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date;
        bh=Z6NwrMn4/nd2UuXtBW2knhkhGEeQyDQIpo6kIWwjIFs=;
        fh=De5j/+RFiHp5oysg/kfBHcT9O0ASuV5hpNukEk4skqM=;
        b=MCwxabwMODcZv5HHoxvRBSPlyoxCUM0u+cTM/nKIX9o6TWql0QQ+Ao7oX+7k16MiW9
         7M/weMJXYF8X3Y81B4Q8Yi7MyVTdrkrmx64AkyLHxkpiRgOW0HoUeHlp4HJ/AxdPmN3R
         Jt1Yptlq3OW/o1l7ALRmxP83xA4gymWA/Slb54zPTBR/K68sz3fyvHJtMnOOVzYU2quP
         FK+qit76Jbj5ScaGmvK20DaklxY8NMiJw1SvnoUOds3/cMeER3NmFIHVGHksaCQcoqII
         9Q/x4Z8IDiNDXHQ4i5tkM2gOrhVy6HYcwNWWjCE810QVH1re2xsQX/7x22Zg5sFkcXAg
         emqg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=jonathan.cameron@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <jonathan.cameron@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id af79cd13be357-7d3f9a172afsi131825185a.489.2025.06.20.02.19.40
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 20 Jun 2025 02:19:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=jonathan.cameron@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.231])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4bNsHw1dMjz6K5mL;
	Fri, 20 Jun 2025 17:14:52 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id 42246140446;
	Fri, 20 Jun 2025 17:19:38 +0800 (CST)
Received: from localhost (10.203.177.66) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Fri, 20 Jun
 2025 11:19:37 +0200
Date: Fri, 20 Jun 2025 10:19:36 +0100
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: Eric Auger <eric.auger@redhat.com>
CC: <eric.auger.pro@gmail.com>, <qemu-devel@nongnu.org>,
	<qemu-arm@nongnu.org>, <peter.maydell@linaro.org>, <imammedo@redhat.com>,
	<gustavo.romero@linaro.org>, <anisinha@redhat.com>, <mst@redhat.com>,
	<shannon.zhaosl@gmail.com>, <pbonzini@redhat.com>, <philmd@linaro.org>,
	<alex.bennee@linaro.org>
Subject: Re: [PATCH v3 16/29] hw/i386/acpi-build: Move aml_pci_edsm to a
 generic place
Message-ID: <20250620101936.00005f96@huawei.com>
In-Reply-To: <20250616094903.885753-17-eric.auger@redhat.com>
References: <20250616094903.885753-1-eric.auger@redhat.com>
	<20250616094903.885753-17-eric.auger@redhat.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.66]
X-ClientProxiedBy: lhrpeml100009.china.huawei.com (7.191.174.83) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-TUID: QQOXVFY4hByC

On Mon, 16 Jun 2025 11:46:45 +0200
Eric Auger <eric.auger@redhat.com> wrote:

> Move aml_pci_edsm to pci-bridge.c since we want to reuse that for
> ARM and acpi-index support.
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>

A request for a bit of documentation inline.  aml_pci_edsm() sounds
like we should be able to grep the spec for edsm and find it but
that's just internal method naming in qemu.


More interesting is I don't think this will ever be called as
the kernel has no idea how to call it and unlike on x86 the
blobs don't show wrapping the call in a _DSM() (see aml_pci_static_endpoint_dsm())

Did EDSM usage get dropped as this set evolved leaving this behind?



>
> ---
> 
> v2 -> v3:
> - move to pci-bridge.c instead of pcihp.c (Igor)
> ---
>  include/hw/acpi/pci.h |  1 +
>  hw/acpi/pci-bridge.c  | 54 +++++++++++++++++++++++++++++++++++++++++++
>  hw/i386/acpi-build.c  | 53 ------------------------------------------
>  3 files changed, 55 insertions(+), 53 deletions(-)
> 
> diff --git a/include/hw/acpi/pci.h b/include/hw/acpi/pci.h
> index 69bae95eac..05e72815c8 100644
> --- a/include/hw/acpi/pci.h
> +++ b/include/hw/acpi/pci.h
> @@ -42,5 +42,6 @@ void build_pci_bridge_aml(AcpiDevAmlIf *adev, Aml *scope);
>  void build_srat_generic_affinity_structures(GArray *table_data);
>  
>  Aml *build_pci_host_bridge_osc_method(bool enable_native_pcie_hotplug);
> +Aml *aml_pci_edsm(void);
>  
>  #endif
> diff --git a/hw/acpi/pci-bridge.c b/hw/acpi/pci-bridge.c
> index 7baa7034a1..be68a98c34 100644
> --- a/hw/acpi/pci-bridge.c
> +++ b/hw/acpi/pci-bridge.c
> @@ -35,3 +35,57 @@ void build_pci_bridge_aml(AcpiDevAmlIf *adev, Aml *scope)
>          }
>      }
>  }
> +
> +Aml *aml_pci_edsm(void)

Can we have some comments, or a more descriptive name than
the resulting method name?  There is stuff in the function obviously
that associates it with the naming DSM but given this is moving to
generic code maybe it needs a brief intro comment?


> +{
> +    Aml *method, *ifctx;
> +    Aml *zero = aml_int(0);
> +    Aml *func = aml_arg(2);
> +    Aml *ret = aml_local(0);
> +    Aml *aidx = aml_local(1);
> +    Aml *params = aml_arg(4);
> +
> +    method = aml_method("EDSM", 5, AML_SERIALIZED);
> +
> +    /* get supported functions */
> +    ifctx = aml_if(aml_equal(func, zero));
> +    {
> +        /* 1: have supported functions */
> +        /* 7: support for function 7 */
> +        const uint8_t caps = 1 | BIT(7);
> +        build_append_pci_dsm_func0_common(ifctx, ret);
> +        aml_append(ifctx, aml_store(aml_int(caps), aml_index(ret, zero)));
> +        aml_append(ifctx, aml_return(ret));
> +    }
> +    aml_append(method, ifctx);
> +
> +    /* handle specific functions requests */
> +    /*
> +     * PCI Firmware Specification 3.1
> +     * 4.6.7. _DSM for Naming a PCI or PCI Express Device Under
> +     *        Operating Systems
> +     */
> +    ifctx = aml_if(aml_equal(func, aml_int(7)));
> +    {
> +       Aml *pkg = aml_package(2);
> +       aml_append(pkg, zero);
> +       /* optional, if not impl. should return null string */
> +       aml_append(pkg, aml_string("%s", ""));
> +       aml_append(ifctx, aml_store(pkg, ret));
> +
> +       /*
> +        * IASL is fine when initializing Package with computational data,
> +        * however it makes guest unhappy /it fails to process such AML/.
> +        * So use runtime assignment to set acpi-index after initializer
> +        * to make OSPM happy.
> +        */
> +       aml_append(ifctx,
> +           aml_store(aml_derefof(aml_index(params, aml_int(0))), aidx));
> +       aml_append(ifctx, aml_store(aidx, aml_index(ret, zero)));
> +       aml_append(ifctx, aml_return(ret));
> +    }
> +    aml_append(method, ifctx);
> +
> +    return method;
> +}
> +
> diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> index fe8bc62c03..6cf623392e 100644
> --- a/hw/i386/acpi-build.c
> +++ b/hw/i386/acpi-build.c
> @@ -338,59 +338,6 @@ build_facs(GArray *table_data)
>      g_array_append_vals(table_data, reserved, 40); /* Reserved */
>  }
>  
> -static Aml *aml_pci_edsm(void)
> -{
> -    Aml *method, *ifctx;
> -    Aml *zero = aml_int(0);
> -    Aml *func = aml_arg(2);
> -    Aml *ret = aml_local(0);
> -    Aml *aidx = aml_local(1);
> -    Aml *params = aml_arg(4);
> -
> -    method = aml_method("EDSM", 5, AML_SERIALIZED);
> -
> -    /* get supported functions */
> -    ifctx = aml_if(aml_equal(func, zero));
> -    {
> -        /* 1: have supported functions */
> -        /* 7: support for function 7 */
> -        const uint8_t caps = 1 | BIT(7);
> -        build_append_pci_dsm_func0_common(ifctx, ret);
> -        aml_append(ifctx, aml_store(aml_int(caps), aml_index(ret, zero)));
> -        aml_append(ifctx, aml_return(ret));
> -    }
> -    aml_append(method, ifctx);
> -
> -    /* handle specific functions requests */
> -    /*
> -     * PCI Firmware Specification 3.1
> -     * 4.6.7. _DSM for Naming a PCI or PCI Express Device Under
> -     *        Operating Systems
> -     */
> -    ifctx = aml_if(aml_equal(func, aml_int(7)));
> -    {
> -       Aml *pkg = aml_package(2);
> -       aml_append(pkg, zero);
> -       /* optional, if not impl. should return null string */
> -       aml_append(pkg, aml_string("%s", ""));
> -       aml_append(ifctx, aml_store(pkg, ret));
> -
> -       /*
> -        * IASL is fine when initializing Package with computational data,
> -        * however it makes guest unhappy /it fails to process such AML/.
> -        * So use runtime assignment to set acpi-index after initializer
> -        * to make OSPM happy.
> -        */
> -       aml_append(ifctx,
> -           aml_store(aml_derefof(aml_index(params, aml_int(0))), aidx));
> -       aml_append(ifctx, aml_store(aidx, aml_index(ret, zero)));
> -       aml_append(ifctx, aml_return(ret));
> -    }
> -    aml_append(method, ifctx);
> -
> -    return method;
> -}
> -
>  /*
>   * build_prt - Define interrupt routing rules
>   *
