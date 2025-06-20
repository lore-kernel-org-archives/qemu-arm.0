Received: by 2002:a17:505:8ed0:b0:1be9:327d:8ee3 with SMTP id kh16csp744947njc;
        Fri, 20 Jun 2025 01:52:03 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXDuvj4CYa77p/leuMnFro9HS4txsVDtLWEszf+Zt1kyDNMKdQ67iUCRVoVkvNJMxNeVNr4TgyNnDwOnQ==@linaro.org
X-Google-Smtp-Source: AGHT+IFisycWYmYiZ6wgfFFq1NacLo5FT3jYQD8jurTfrVKhJCZTqOAbKIBEtwrWVjKzBfEtrBEz
X-Received: by 2002:a05:6000:481e:b0:3a4:fb33:85ce with SMTP id ffacd0b85a97d-3a6d130cb6cmr1594522f8f.46.1750409523010;
        Fri, 20 Jun 2025 01:52:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750409522; cv=none;
        d=google.com; s=arc-20240605;
        b=hCVh+Lj9fRwK9AspJwLGj19IPjqKcwA/MycF+mY1kJ407eWTn3w/EEu3JoqT+KA3S4
         mWjzbvouzUvxiHSkbgV+w2/3fpQStro0GtTVZTIFxIf6oJuQzfBsUeCdygdAxqbGnggP
         YIlWVUQ2iemWUgpINwaiKt2YpDwjVk/ItYVsKcDUQM9WSw5H5DJT2CxVgW9YL3JADOxk
         Wlaj1CJGGwPyldfQSov5uGU+XYZ2vGRP/HbZsRyW2pqQu1Xg7ToRRT6Pzo+0ksMHqB2d
         Er0i/Ja7xB1ZKB21dTc7PBEGxogVK3bU3HiAsU4ibso/3IhIhcp3vfbZcgHN7Toravwn
         2a9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date;
        bh=u6TASbyHEcGlxa/DjY5m2pzx1/USkpHbP/5XCTLAkVA=;
        fh=De5j/+RFiHp5oysg/kfBHcT9O0ASuV5hpNukEk4skqM=;
        b=CV37JCz3c3cSF/OuGSUlvVO/VjfAcNc2VV0YM4FYuHNnxbIvQXYUl++Ld81eqjIRwn
         IhCgNlvM85BHjgHoHl+IvlzSI6UQSSsVDrCkOb90l6fbI8Lnrnr5rADaJgrxNWVi7+B1
         V3crKKMhKn8V8A5ixkbU4wQ7c7qWQsV1vcinvK0hDzzhu1Szb5y+1SlA0o5iDpzDbX/L
         q+a42fWt8Df7+KUHrKUavvfT+OQKcm4lLkf3ZSlXjuN9y93VUnM90gm+EDmc7GZxCtV4
         fJbdl7N7fnDfPVFf+mJjiqmwZqhIhB1hcfXzoaoX3c8WfCs+ONkE+Nxg8gwjPu6Zgeh3
         XtjA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=jonathan.cameron@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <jonathan.cameron@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id 5b1f17b1804b1-4535eaba2ffsi33715535e9.149.2025.06.20.01.52.02
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 20 Jun 2025 01:52:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=jonathan.cameron@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.231])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4bNrh41ctrz6L66H;
	Fri, 20 Jun 2025 16:47:16 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id 3344E140446;
	Fri, 20 Jun 2025 16:52:02 +0800 (CST)
Received: from localhost (10.203.177.66) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Fri, 20 Jun
 2025 10:52:01 +0200
Date: Fri, 20 Jun 2025 09:52:00 +0100
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: Eric Auger <eric.auger@redhat.com>
CC: <eric.auger.pro@gmail.com>, <qemu-devel@nongnu.org>,
	<qemu-arm@nongnu.org>, <peter.maydell@linaro.org>, <imammedo@redhat.com>,
	<gustavo.romero@linaro.org>, <anisinha@redhat.com>, <mst@redhat.com>,
	<shannon.zhaosl@gmail.com>, <pbonzini@redhat.com>, <philmd@linaro.org>,
	<alex.bennee@linaro.org>
Subject: Re: [PATCH v3 07/29] hw/pci-host/gpex-acpi: retrieve and use GED
 acpi_pcihp setting
Message-ID: <20250620095200.00002e72@huawei.com>
In-Reply-To: <20250616094903.885753-8-eric.auger@redhat.com>
References: <20250616094903.885753-1-eric.auger@redhat.com>
	<20250616094903.885753-8-eric.auger@redhat.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.66]
X-ClientProxiedBy: lhrpeml100001.china.huawei.com (7.191.160.183) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-TUID: +k9r3i7soZ4B

On Mon, 16 Jun 2025 11:46:36 +0200
Eric Auger <eric.auger@redhat.com> wrote:

> retrieve the acpi_pcihp option value from the ged. In
> case acpi_pcihp is unset we configure pci native hotplug on
> pci0. For expander bridges we keep legacy pci native hotplug,
> as done on x86 q35.
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
One minor thing inline

Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>

> 
> ---
> 
> v2 -> v3:
> - don'use the virt arm machine option anymore.
> ---
>  include/hw/pci-host/gpex.h | 1 +
>  hw/arm/virt-acpi-build.c   | 5 +++++
>  hw/pci-host/gpex-acpi.c    | 3 ++-
>  3 files changed, 8 insertions(+), 1 deletion(-)
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
> index 7e8e0f0298..d7547c8d3b 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -123,12 +123,17 @@ static void acpi_dsdt_add_pci(Aml *scope, const MemMapEntry *memmap,
>                                uint32_t irq, VirtMachineState *vms)
>  {
>      int ecam_id = VIRT_ECAM_ID(vms->highmem_ecam);
> +    AcpiGedState *acpi_ged_state = ACPI_GED(vms->acpi_dev);
> +    AcpiPciHpState *pcihp_state = &acpi_ged_state->pcihp_state;
> +

Trivial, but why 2 blank lines? One seems enough here.

> +
>      struct GPEXConfig cfg = {
>          .mmio32 = memmap[VIRT_PCIE_MMIO],
>          .pio    = memmap[VIRT_PCIE_PIO],
>          .ecam   = memmap[ecam_id],
>          .irq    = irq,
>          .bus    = vms->bus,
> +        .pci_native_hotplug = !pcihp_state->use_acpi_hotplug_bridge,
>      };
>  
>      if (vms->highmem_mmio) {
> diff --git a/hw/pci-host/gpex-acpi.c b/hw/pci-host/gpex-acpi.c
> index 80fc2bf032..44737a8d81 100644
> --- a/hw/pci-host/gpex-acpi.c
> +++ b/hw/pci-host/gpex-acpi.c
> @@ -203,6 +203,7 @@ void acpi_dsdt_add_gpex(Aml *scope, struct GPEXConfig *cfg)
>              if (is_cxl) {
>                  build_cxl_osc_method(dev);
>              } else {
> +                /* pxb bridges do not have ACPI PCI Hot-plug enabled */
>                  acpi_dsdt_add_host_bridge_methods(dev, true);
>              }
>  
> @@ -278,7 +279,7 @@ void acpi_dsdt_add_gpex(Aml *scope, struct GPEXConfig *cfg)
>      }
>      aml_append(dev, aml_name_decl("_CRS", rbuf));
>  
> -    acpi_dsdt_add_host_bridge_methods(dev, true);
> +    acpi_dsdt_add_host_bridge_methods(dev, cfg->pci_native_hotplug);
>  
>      Aml *dev_res0 = aml_device("%s", "RES0");
>      aml_append(dev_res0, aml_name_decl("_HID", aml_string("PNP0C02")));
