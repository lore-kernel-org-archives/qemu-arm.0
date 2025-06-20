Received: by 2002:a17:505:8ed0:b0:1be9:327d:8ee3 with SMTP id kh16csp742526njc;
        Fri, 20 Jun 2025 01:45:20 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVKFIeU9RYY9EJKqDqNhaUdR6/kq9oFO19cSMYpkgpATcOKDO4pAdqoMGq82j42DUmKIGJPBPu984VL9Q==@linaro.org
X-Google-Smtp-Source: AGHT+IHWiGi/70WA4fhoqzCJ+rATGIXm+T1br3rxWrL0sbydUqcahJOSL9o0+GmhFO1iE8f4pcP/
X-Received: by 2002:a5d:588d:0:b0:3a4:f936:7882 with SMTP id ffacd0b85a97d-3a6d12e8531mr1453609f8f.55.1750409120135;
        Fri, 20 Jun 2025 01:45:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750409120; cv=none;
        d=google.com; s=arc-20240605;
        b=WHIKZeepsEsjg2fYXsrAJt4FCTO5hDVb/sL1SmRT5deCuGNgcJG+GbxE34ofBdPrUT
         yxEphAMbQfJo5+xVKkCGjy0huIHfCZYsU3oxh97PAxzY2OXAnLMPP2hFAfm65wXuiHvu
         UQqsCgOMZ7Sh2jwo7xLxV6oemGkP3zoOI8vgQEhOMOSJxI6CrcKPl3389hqzKg68hFxE
         WbRC2iuIQlO5lZLXACpqhAqlJ2p8NoFnXSBuexcHu3Tv7B9wDPsg9o8W0bxuu0Ufrizu
         g0/gSKf+mo2FTwAA50GwEoJiCLOeW/9o9TVg9kIacUFrPEik1dTrX8lU9gbVH2jBzZnn
         05nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date;
        bh=tjofRoQPNZ6DG7m5o4IhowfnXNS2YFcrRjiSa1PV6A0=;
        fh=De5j/+RFiHp5oysg/kfBHcT9O0ASuV5hpNukEk4skqM=;
        b=BvnH0+y9VkV8kTOq0B4TsCUmQBwymAcTAZZ3H+aG8n69bKjp6z9HyTxhz0ZJKhQyL5
         FF2gjXwSgImxovh+mdt04wXjRrmrL7BtZASR6U6AyExsb+cuVo/hxrwbRlQas7JqLmgd
         5vSAIDC3yeuyvKw/HZe84v3pJrKRwTGy0BFe4M0bjaG0r9o0baCB128ksj2HRwZ/M87h
         05pZMEpKDmMFVQk1V7l0xLPS0SLDA9W49OOgJkDiPKvtGcy9n4DKX8l3oePqS7/vCCj7
         v1FM5fKr4YvmVw6NlVujkZsGwYFDaVZ62VIsmyIZfKuqwXIqKUO9MhmOq9ULPZtgRCQy
         VQGg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=jonathan.cameron@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <jonathan.cameron@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id ffacd0b85a97d-3a6d0f1d30bsi982076f8f.114.2025.06.20.01.45.19
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 20 Jun 2025 01:45:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=jonathan.cameron@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.31])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4bNrb90crdz6L6Fc;
	Fri, 20 Jun 2025 16:43:01 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id 3823E140417;
	Fri, 20 Jun 2025 16:45:19 +0800 (CST)
Received: from localhost (10.203.177.66) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Fri, 20 Jun
 2025 10:45:18 +0200
Date: Fri, 20 Jun 2025 09:45:17 +0100
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: Eric Auger <eric.auger@redhat.com>
CC: <eric.auger.pro@gmail.com>, <qemu-devel@nongnu.org>,
	<qemu-arm@nongnu.org>, <peter.maydell@linaro.org>, <imammedo@redhat.com>,
	<gustavo.romero@linaro.org>, <anisinha@redhat.com>, <mst@redhat.com>,
	<shannon.zhaosl@gmail.com>, <pbonzini@redhat.com>, <philmd@linaro.org>,
	<alex.bennee@linaro.org>
Subject: Re: [PATCH v3 04/29] hw/pci-host/gpex-acpi: Add native_pci_hotplug
 arg to acpi_dsdt_add_pci_osc
Message-ID: <20250620094517.00007eed@huawei.com>
In-Reply-To: <20250616094903.885753-5-eric.auger@redhat.com>
References: <20250616094903.885753-1-eric.auger@redhat.com>
	<20250616094903.885753-5-eric.auger@redhat.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.66]
X-ClientProxiedBy: lhrpeml100001.china.huawei.com (7.191.160.183) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-TUID: es4aYdiW1u+G

On Mon, 16 Jun 2025 11:46:33 +0200
Eric Auger <eric.auger@redhat.com> wrote:

> Add a new argument to acpi_dsdt_add_pci_osc to be able to disable
> native pci hotplug.
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> Reviewed-by: Gustavo Romero <gustavo.romero@linaro.org>
> Reviewed-by: Igor Mammedov <imammedo@redhat.com>
After discussion on earlier version I'm now fine with this.

Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>

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
