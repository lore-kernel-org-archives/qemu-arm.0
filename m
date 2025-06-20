Received: by 2002:a17:505:8ed0:b0:1be9:327d:8ee3 with SMTP id kh16csp840863njc;
        Fri, 20 Jun 2025 05:07:32 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU2PiGeQLKZ5CKUkbIcQPwy9943n54h4NhBb+pc2giYBY+vObUr7Oel6biB+ko72s/5YQEZ6CGTfhg6Lw==@linaro.org
X-Google-Smtp-Source: AGHT+IFOAiNfMvBLwXgvzUL4msvOl0vT7c0DANBLcYSTVVFhbX7qyx0TyiNIi8BQaUSCLcEKZ+eh
X-Received: by 2002:a05:620a:17a7:b0:7d3:8df8:5885 with SMTP id af79cd13be357-7d3f98dfcf5mr337048985a.14.1750421252432;
        Fri, 20 Jun 2025 05:07:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750421252; cv=none;
        d=google.com; s=arc-20240605;
        b=Kexa5fUr9Z6r+61+cwX8kvV1sqkyTDXHVLXWMgvUHydt5StjdvQE4BcdxBin0OK/Jz
         FsJ4+OFacEiIjMws/wGLlagzUMDYaPZ4gXFDgyodmTYd8yd+Th+LSc1bEvGgLGFmIS+0
         VmJQcxCNTOqxLIQ1ot4rREXb5/DqaMWpMqjw6BVw+/g/mKmZ8X0RduljduAkm5kr6Bl6
         bvuNQ+v7bnTLzbCupjXzc2O44OzsuyZXPhbAFwKrRmfETqs/obvEFcr1mTGORKVii1WC
         rlgGpCAp0Ap1elj/wxWXJNDw5KR082GNCJzyvh5Ea97NsaJTAojI77g1WXOt3jlTLa5A
         BRSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:dkim-signature;
        bh=g4O3UyyHl1VzMWPShkyqpFI04qzaqwWIDrRgkdHpFKk=;
        fh=fVaySlVoIHeZokzqHcQbRubS+ZjPRacNBvIadQFLzqw=;
        b=dKPKfDOPNbErJruEW4P0gJzNU5gnUVSi6B/+BQQjbzzNKZfoHweGvCUQ7jxwSMyuAh
         80s6lBybVkrEhCGlS51zlFsM6rFpMvCRWMDH5P/7ug60c22JdAw0lP1GycGCmc1Li4Uy
         228qFFXx82eqLtZaf31sFb/jj2cynxcFjMO/kx37ZfUeV306kiQcUy7d55wQmKUkVFGQ
         Qbr2A5xwBkpP6R8WpUUFxaNMyCqO42BTZDk3Iwqv9cDNakJS8+ZzpaILxckuVMk3DpXl
         VD569cff4oP6C0j4pv/sKvXbd0tWJcVcKNOcnbSgDWl8XSWdysdLztyaZ31kqTqOuyKy
         Fpcw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=QMujZOuJ;
       spf=pass (google.com: domain of imammedo@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=imammedo@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <imammedo@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id af79cd13be357-7d3f999e5f9si147900985a.1.2025.06.20.05.07.32
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jun 2025 05:07:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of imammedo@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=QMujZOuJ;
       spf=pass (google.com: domain of imammedo@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=imammedo@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750421252;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=g4O3UyyHl1VzMWPShkyqpFI04qzaqwWIDrRgkdHpFKk=;
	b=QMujZOuJwn2InY8LI4RKETJfzuflkl5jxDKAwGz+yaU8R1bW+r8M4Fp4GP1S9uCT/Asj4p
	UikUPUCY8noE5j3cP1QJTx8jpWSioVTKXCm0ggbxVCdA8dFcE5ywzdhscoI2n3+kWVKOnE
	HtJ5alifBSOGsfmO8SoWlBSTW44miZc=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-176-C9v5RG_4Poqq0hd3wo5qPA-1; Fri, 20 Jun 2025 08:07:31 -0400
X-MC-Unique: C9v5RG_4Poqq0hd3wo5qPA-1
X-Mimecast-MFC-AGG-ID: C9v5RG_4Poqq0hd3wo5qPA_1750421250
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-43e9b0fd00cso10100785e9.0
        for <alex.bennee@linaro.org>; Fri, 20 Jun 2025 05:07:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750421250; x=1751026050;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g4O3UyyHl1VzMWPShkyqpFI04qzaqwWIDrRgkdHpFKk=;
        b=oUN5zMLpHkOe7vRzfBqqjqClXQmGdIM/GsvuG7E4919/quTx3lo8X7FJ2L9STMvM1M
         rHZ4r6AVgoAzni8fQmL7fdOsxmcnXtNL1tUXlbuBucjIgOAjUZY85AI/9Zzpq7T6wx31
         cxl3XCFpPUV524E1r35IQ55iTsNmZZF16+RNuVXWLkhWmx0UHUFje/X8mBFemrTf9+MI
         t5o/WcY3+bgxC0Ce0ueldtYVfPD7jziacZc4qclBL1OA6QqiRv+kFLGU1N+QPooOGp34
         tVg/kp5zMf0YM9MDI+8gfDDDf3OmvF8vL2bM9vSqpjZwRTkWe1sVISNgrFNJCFW3erdR
         5Sig==
X-Forwarded-Encrypted: i=1; AJvYcCW3VAhhcBAt6ijflUNh/rHb5D/wz2+9q5wT/tvJR8hnEk8l2txEUxk86x/pN5zRQCBtzsrLGejzD591OA==@linaro.org
X-Gm-Message-State: AOJu0YwGVQd09yMh6au0D/br9Bn++QXuYCn3reqCM8lk8tmVu+2TfYQ9
	h/KntGI+Knm2oCW8B/VHPDo8B8z13IeJ+QCi7G/PUF12N5GQ0OViRKNg/cSLGz051qFtEGHr3xS
	32WYiVntBi8gx7hiuVy0yCpeO78GWFu0fTrfSAPWUsYgHwOk8YyfSNqFVhw==
X-Gm-Gg: ASbGnct35CH+xHjgLo7VwafFp/ld2kYEXclcC7of3HkHu0v4jhFk25WQHyI07FbM11Q
	tu7XwVzJSvTGDg1wJ+HiXDvJgLAnXgn+ORcHCtV/UajtG64SPAo4duBlJDJrprvRMiAD4zqcxJF
	eYjez0tVGee2uWsWnTYWR4Smp4n/rbuVdDDZ3dYvfj5/M7auJ4GDszekl+QkiHNy2PjJhX1yjZo
	cN1fluDAGXiTJSDkNFGkmMGdNcReFI8qK/1wHW1JvGLN5Tl2B8iCSUKTNOA8moUJLQV7GqIgeZP
	dCGlqp+7NPrS
X-Received: by 2002:a05:600c:458d:b0:43b:4829:8067 with SMTP id 5b1f17b1804b1-45365e4f9e2mr20997995e9.6.1750421249761;
        Fri, 20 Jun 2025 05:07:29 -0700 (PDT)
X-Received: by 2002:a05:600c:458d:b0:43b:4829:8067 with SMTP id 5b1f17b1804b1-45365e4f9e2mr20997385e9.6.1750421249262;
        Fri, 20 Jun 2025 05:07:29 -0700 (PDT)
Return-Path: <imammedo@redhat.com>
Received: from fedora ([85.93.96.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4535ebcecdcsm56254935e9.36.2025.06.20.05.07.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jun 2025 05:07:28 -0700 (PDT)
Date: Fri, 20 Jun 2025 14:07:26 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Cc: eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 peter.maydell@linaro.org, gustavo.romero@linaro.org, anisinha@redhat.com,
 mst@redhat.com, shannon.zhaosl@gmail.com, pbonzini@redhat.com,
 Jonathan.Cameron@huawei.com, philmd@linaro.org, alex.bennee@linaro.org
Subject: Re: [PATCH v3 07/29] hw/pci-host/gpex-acpi: retrieve and use GED
 acpi_pcihp setting
Message-ID: <20250620140726.296971a3@fedora>
In-Reply-To: <20250616094903.885753-8-eric.auger@redhat.com>
References: <20250616094903.885753-1-eric.auger@redhat.com>
	<20250616094903.885753-8-eric.auger@redhat.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: iZElcjvM8oHcUMiR5FRF70zidFzBEsrukQ_u0RW6hHQ_1750421250
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-TUID: +MDKnc9GcH1R

On Mon, 16 Jun 2025 11:46:36 +0200
Eric Auger <eric.auger@redhat.com> wrote:

> retrieve the acpi_pcihp option value from the ged. In
> case acpi_pcihp is unset we configure pci native hotplug on
> pci0. For expander bridges we keep legacy pci native hotplug,

I guess it's remnants of from previous version
s/legacy//


> as done on x86 q35.
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
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

1)

> +
>      struct GPEXConfig cfg = {
>          .mmio32 = memmap[VIRT_PCIE_MMIO],
>          .pio    = memmap[VIRT_PCIE_PIO],
>          .ecam   = memmap[ecam_id],
>          .irq    = irq,
>          .bus    = vms->bus,
> +        .pci_native_hotplug = !pcihp_state->use_acpi_hotplug_bridge,

I'd use property accessor here instead of poking into device internals.
and get rind of [1]

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
