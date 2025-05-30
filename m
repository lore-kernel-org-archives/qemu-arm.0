Received: by 2002:a17:504:1b46:b0:1be9:327d:8ee3 with SMTP id t6csp1032342njh;
        Fri, 30 May 2025 03:14:16 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXFd8OPjR+Hetdg2kOvhVEDzfpq9lkioqt0MCxgaHCyg2G+ZmWcVnENYn/uqVvR5xwt6BonfE61dLeedQ==@linaro.org
X-Google-Smtp-Source: AGHT+IEKdiXi/Fpeycl8cTYylhfPY9I8GK898jSKwRgQd0b8/EbiH7UuZdXfgeSAQMmbU0FR1kVj
X-Received: by 2002:a05:600c:3b87:b0:43d:97ea:2f4 with SMTP id 5b1f17b1804b1-450d65344f5mr28529015e9.12.1748600056179;
        Fri, 30 May 2025 03:14:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1748600056; cv=none;
        d=google.com; s=arc-20240605;
        b=bOVcHlk5RS9hNHgNkJP+t+rzqoQy5fgsL5Z4aA4kigS6t+6ih+e3SMc5jurNfn4LcU
         80cxsLUirL+fH+QUlw9Jh7jgUEisT+VqKtMOiBUINUPEbIfgUyZEF76jHCUJ4mvkb4SA
         ZjaKtxyvKq/1F4C3n0hzT0vXQ+CmUZ1H5tiE/Ky/TlCzifIjUIIdXZSwUs/MJSGrXVT7
         rpgAIajG2iQh9ZktPsgfN/r/onG1HFfmMbhSqat8wjLLng3ZJqOOnDUl+OWL3k56wsVj
         HpulcyRAPvyCIxPiH9ek7EvGNq2pE5gzGmLGd3t6C2ei6SFXxqvpp/i89tA+f1010gwI
         9Pow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date;
        bh=HahpCdDZKZACT31AIiO70Dll4sMV4klVq/lpoT/zWis=;
        fh=De5j/+RFiHp5oysg/kfBHcT9O0ASuV5hpNukEk4skqM=;
        b=Qjhif8q0DLsQXe0j5J2//WIbJq4jH4LhvkAyesnzUrbsUD50V+65tdxRn89A2Nc1AC
         CdhdmTuRquAPU6QYYwIDB1bshDd8szvE/t6i6C5za/UF9sSZ14WK7iBYvPiV5NVBW6OK
         A5Bfa7QtWCX4Y00jzZoR6T+x3BJcgLv+ZoRtzA6v3YwD+cjkkoS4Iw8wOPDd+6ibXf3T
         F6tCj3TOhOdouFO4Jg84C3mp6Nfx7YObvHp2nHDAFDXGswuYGo2PJe4XsIfBG5zwjmEG
         BF7etlZLdEOMJGztimchBZ1e3TrMr54KJxRmigLq5VjbnLEZ6YcEwBetXxXwMUzTdmf3
         P+Zg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=jonathan.cameron@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <jonathan.cameron@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id 5b1f17b1804b1-450cfe1934dsi24999055e9.134.2025.05.30.03.14.15
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 30 May 2025 03:14:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=jonathan.cameron@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.31])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4b7zZd2qhxz6L550;
	Fri, 30 May 2025 18:12:57 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id 7489814049C;
	Fri, 30 May 2025 18:14:15 +0800 (CST)
Received: from localhost (10.203.177.66) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Fri, 30 May
 2025 12:14:14 +0200
Date: Fri, 30 May 2025 11:14:13 +0100
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: Eric Auger <eric.auger@redhat.com>
CC: <eric.auger.pro@gmail.com>, <qemu-devel@nongnu.org>,
	<qemu-arm@nongnu.org>, <peter.maydell@linaro.org>, <imammedo@redhat.com>,
	<gustavo.romero@linaro.org>, <anisinha@redhat.com>, <mst@redhat.com>,
	<shannon.zhaosl@gmail.com>, <pbonzini@redhat.com>, <philmd@linaro.org>,
	<alex.bennee@linaro.org>
Subject: Re: [PATCH v2 06/25] hw/pci-host/gpex-acpi: Propagate hotplug type
 info from virt machine downto gpex
Message-ID: <20250530111413.00003c66@huawei.com>
In-Reply-To: <20250527074224.1197793-7-eric.auger@redhat.com>
References: <20250527074224.1197793-1-eric.auger@redhat.com>
	<20250527074224.1197793-7-eric.auger@redhat.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.66]
X-ClientProxiedBy: lhrpeml100006.china.huawei.com (7.191.160.224) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-TUID: EDqnq0Hi0DuW

On Tue, 27 May 2025 09:40:08 +0200
Eric Auger <eric.auger@redhat.com> wrote:

> Propagate the type of pci hotplug mode downto the gpex
> acpi code. In case machine acpi_pcihp is unset we configure
> pci native hotplug on pci0. For expander bridges we keep
> legacy pci native hotplug, as done on x86 q35.
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> Reviewed-by: Gustavo Romero <gustavo.romero@linaro.org>
> ---
>  include/hw/pci-host/gpex.h | 1 +
>  hw/arm/virt-acpi-build.c   | 1 +
>  hw/pci-host/gpex-acpi.c    | 3 ++-
>  3 files changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/include/hw/pci-host/gpex.h b/include/hw/pci-host/gpex.h
> index 84471533af..feaf827474 100644
> --- a/include/hw/pci-host/gpex.h
> +++ b/include/hw/pci-host/gpex.h
> @@ -45,6 +45,7 @@ struct GPEXConfig {
>      MemMapEntry pio;
>      int         irq;
>      PCIBus      *bus;
> +    bool        pci_native_hotplug;
>  };
>  
>  typedef struct GPEXIrq GPEXIrq;
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index 7e8e0f0298..be5e00a56e 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -129,6 +129,7 @@ static void acpi_dsdt_add_pci(Aml *scope, const MemMapEntry *memmap,
>          .ecam   = memmap[ecam_id],
>          .irq    = irq,
>          .bus    = vms->bus,
> +        .pci_native_hotplug = !vms->acpi_pcihp,
>      };
>  
>      if (vms->highmem_mmio) {
> diff --git a/hw/pci-host/gpex-acpi.c b/hw/pci-host/gpex-acpi.c
> index 1aa2d12026..f1ab30f3d5 100644
> --- a/hw/pci-host/gpex-acpi.c
> +++ b/hw/pci-host/gpex-acpi.c
> @@ -204,6 +204,7 @@ void acpi_dsdt_add_gpex(Aml *scope, struct GPEXConfig *cfg)
>              if (is_cxl) {
>                  build_cxl_osc_method(dev);
>              } else {
> +                /* pxb bridges do not have ACPI PCI Hot-plug enabled */
>                  acpi_dsdt_add_host_bridge_methods(dev, true);

This is awkward but explains why my CXL cases weren't causing trouble.
A mixed config is counter to the recommendation in the PCI firmware spec

"It is recommended that a machine with multiple host bridge devices should
report the same capabilities for all host bridges of the same type and also
negotiate control of the features described in the Control Field in the
same way for all host bridges of the same type"

I guess if any OS isn't coping with the mix then they can request native
hotplug.



>              }
>  
> @@ -279,7 +280,7 @@ void acpi_dsdt_add_gpex(Aml *scope, struct GPEXConfig *cfg)
>      }
>      aml_append(dev, aml_name_decl("_CRS", rbuf));
>  
> -    acpi_dsdt_add_host_bridge_methods(dev, true);
> +    acpi_dsdt_add_host_bridge_methods(dev, cfg->pci_native_hotplug);
>  
>      Aml *dev_res0 = aml_device("%s", "RES0");
>      aml_append(dev_res0, aml_name_decl("_HID", aml_string("PNP0C02")));
