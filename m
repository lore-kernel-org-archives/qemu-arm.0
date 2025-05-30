Received: by 2002:a17:504:1b46:b0:1be9:327d:8ee3 with SMTP id t6csp1011993njh;
        Fri, 30 May 2025 02:27:15 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWRhHX2XdeOyoIth5D0xHw3zb1jJFG+hVS7LLeePfwfA0fgEnqWmfYIbGpxs7hiio+ukAzlst17DVB5/A==@linaro.org
X-Google-Smtp-Source: AGHT+IFbGNhJUfL0HULNE+oUvYHAOoOBNY0Vcj2Xe2L+YjQ+3jnBngzupsTgLYrajD5iDaihTRmc
X-Received: by 2002:a5d:584a:0:b0:3a3:7ba5:9a68 with SMTP id ffacd0b85a97d-3a4f79da7efmr1810516f8f.18.1748597234735;
        Fri, 30 May 2025 02:27:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1748597234; cv=none;
        d=google.com; s=arc-20240605;
        b=I2LoQyE0FahiVi+G5Q2jrUJFtPB8M/jm1St/HBj/ZSrIvG0zgutPeuzzUJsU++U/Em
         R6J8pi1mbhTQaE3mU2dORrVuQtmiOdjsQp8+cZVaZF4dM10dVM1vYCtb5QuJsWL1J4Sy
         jWc+Sr9RSYLwn96LvG30AZxfJUMCix0eBKgNWsvWaJNBNDM7+ftcUx/OMhhku2AQUcuF
         FJBFIKdcAc9dyTfqpUfMA1plegJOOeYWPPmjB8O0VbmZPNgqujto1gmwpi4GKTti5D36
         H53vqlXxB7bh+/PzEIMNhAMy8jtN8jyMwhvRdx06gN8c4JRMn3QmJz9RBPDWVnK3l9Qu
         VeMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date;
        bh=rpbGQx9SRHUMMGp637RH8KeEiX7kyT9vPNwyouKBTJs=;
        fh=De5j/+RFiHp5oysg/kfBHcT9O0ASuV5hpNukEk4skqM=;
        b=cJEcBh8hwk4XSsl5E+2ULPlEXQQGz59Mbnd7akUnFcX74hDJMpdvbiHPnFaOuoZluA
         9VB8QzEkVEgkzrqDBPErQwqx5uYjX3t82ob1Wcq3sqoawcbReIqvPzg7ueEZPMu+I8/U
         f0HE5KExcIQdG4IipbDhM2yLQATeH1gY130SwMOUkPVltrwc9aZgNSpqr9ThGo2OR+E0
         MHj6bwqPqzoEc/FL4KnHQSHh0Dai6dZEo/ZTasZVqt93l3TDmBal1xGXsJYtrTClDsdu
         40Ra5B7B0awzY8KGro4hV7Gn/aXmY+i7lnolOTPm8jTqSu+RwTGTczaTJyYsR2EEuFGZ
         KwwA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=jonathan.cameron@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <jonathan.cameron@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id ffacd0b85a97d-3a4efe58160si2576094f8f.2.2025.05.30.02.27.14
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 30 May 2025 02:27:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=jonathan.cameron@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.31])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4b7yXM35Kjz6L566;
	Fri, 30 May 2025 17:25:55 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id 8F1A11402FC;
	Fri, 30 May 2025 17:27:13 +0800 (CST)
Received: from localhost (10.203.177.66) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Fri, 30 May
 2025 11:27:12 +0200
Date: Fri, 30 May 2025 10:27:11 +0100
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: Eric Auger <eric.auger@redhat.com>
CC: <eric.auger.pro@gmail.com>, <qemu-devel@nongnu.org>,
	<qemu-arm@nongnu.org>, <peter.maydell@linaro.org>, <imammedo@redhat.com>,
	<gustavo.romero@linaro.org>, <anisinha@redhat.com>, <mst@redhat.com>,
	<shannon.zhaosl@gmail.com>, <pbonzini@redhat.com>, <philmd@linaro.org>,
	<alex.bennee@linaro.org>
Subject: Re: [PATCH v2 04/25] hw/pci-host/gpex-acpi: Add native_pci_hotplug
 arg to acpi_dsdt_add_pci_osc
Message-ID: <20250530102711.000034eb@huawei.com>
In-Reply-To: <20250527074224.1197793-5-eric.auger@redhat.com>
References: <20250527074224.1197793-1-eric.auger@redhat.com>
	<20250527074224.1197793-5-eric.auger@redhat.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.66]
X-ClientProxiedBy: lhrpeml100005.china.huawei.com (7.191.160.25) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-TUID: NWpxSe4CVZea

On Tue, 27 May 2025 09:40:06 +0200
Eric Auger <eric.auger@redhat.com> wrote:

> Add a new argument to acpi_dsdt_add_pci_osc to be able to disable
> native pci hotplug.
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> Reviewed-by: Gustavo Romero <gustavo.romero@linaro.org>

Hi Eric,

Makes me wonder what we should do for CXL - I was expecting
a very similar change.  Currently seems like those always
allow native hotplug (__build_cxl_osc_method()) on x86 and
arm64 (patches on list).

Maybe that has only been working because the kernel is reading
the PCI _OSC first. Or it's always been doing native hotplug
an no one noticed.  A quick look at logs shows the kernel
first gets told no, then yes as it queries the two different
_OSC types. 

Looks like I should fix that _OSC then it should be carried
over to this as well (or if you don't mind adding a trivial
patch to replicate this  patch for the CXL _OSC, even better!)

Other than that, this patch looks fine to me though I do wonder
if we could unify this with build_q35_osc_method()?
I'm not the best at reading AML generation code but whilst
they are written quite differently they seem to be functionally
very similar, more so after this patch.

> 
> ---
> 
> rfc -> v1:
> - updated the "Allow OS control for all 5 features" comment
> ---
>  hw/pci-host/gpex-acpi.c | 15 ++++++++-------
>  1 file changed, 8 insertions(+), 7 deletions(-)
> 
> diff --git a/hw/pci-host/gpex-acpi.c b/hw/pci-host/gpex-acpi.c
> index 0aba47c71c..f34b7cf25e 100644
> --- a/hw/pci-host/gpex-acpi.c
> +++ b/hw/pci-host/gpex-acpi.c
> @@ -50,7 +50,7 @@ static void acpi_dsdt_add_pci_route_table(Aml *dev, uint32_t irq,
>      }
>  }
>  
> -static void acpi_dsdt_add_pci_osc(Aml *dev)
> +static void acpi_dsdt_add_pci_osc(Aml *dev, bool enable_native_pcie_hotplug)
>  {
>      Aml *method, *UUID, *ifctx, *ifctx1, *elsectx, *buf;
>  
> @@ -77,11 +77,12 @@ static void acpi_dsdt_add_pci_osc(Aml *dev)
>      aml_append(ifctx, aml_store(aml_name("CDW3"), aml_name("CTRL")));
>  
>      /*
> -     * Allow OS control for all 5 features:
> -     * PCIeHotplug SHPCHotplug PME AER PCIeCapability.
> +     * Allow OS control for SHPCHotplug, PME, AER, PCIeCapability,
> +     * and PCIeHotplug depending on enable_native_pcie_hotplug
>       */
> -    aml_append(ifctx, aml_and(aml_name("CTRL"), aml_int(0x1F),
> -                              aml_name("CTRL")));
> +    aml_append(ifctx, aml_and(aml_name("CTRL"),
> +               aml_int(0x1E | (enable_native_pcie_hotplug ? 0x1 : 0x0)),
> +               aml_name("CTRL")));
>  
>      ifctx1 = aml_if(aml_lnot(aml_equal(aml_arg(1), aml_int(0x1))));
>      aml_append(ifctx1, aml_or(aml_name("CDW1"), aml_int(0x08),
> @@ -192,7 +193,7 @@ void acpi_dsdt_add_gpex(Aml *scope, struct GPEXConfig *cfg)
>              if (is_cxl) {
>                  build_cxl_osc_method(dev);

This was the path I was expecting to change as well.

>              } else {
> -                acpi_dsdt_add_pci_osc(dev);
> +                acpi_dsdt_add_pci_osc(dev, true);
>              }
>  
>              aml_append(scope, dev);
> @@ -267,7 +268,7 @@ void acpi_dsdt_add_gpex(Aml *scope, struct GPEXConfig *cfg)
>      }
>      aml_append(dev, aml_name_decl("_CRS", rbuf));
>  
> -    acpi_dsdt_add_pci_osc(dev);
> +    acpi_dsdt_add_pci_osc(dev, true);
>  
>      Aml *dev_res0 = aml_device("%s", "RES0");
>      aml_append(dev_res0, aml_name_decl("_HID", aml_string("PNP0C02")));
