Received: by 2002:a17:505:a38d:b0:1be9:327d:8ee3 with SMTP id rs13csp4780060njc;
        Tue, 27 May 2025 05:33:07 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVU2WbuvxqkcSBpy6C6Ye/ujtL4as4r2gCVZwj6ENzGzT6+OnwcI6TwdBPlJqOdPzxqHsUnseQK0msYVQ==@linaro.org
X-Google-Smtp-Source: AGHT+IEdP0zqs93z5AnstswcWCLGmhBpQL2mT4HRKFJnsg6CT/hEuqjnha0AMunjh07ftweqvE+N
X-Received: by 2002:a05:6a00:2287:b0:73f:f623:55f8 with SMTP id d2e1a72fcca58-745fde779e7mr17355725b3a.5.1748349187417;
        Tue, 27 May 2025 05:33:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1748349187; cv=none;
        d=google.com; s=arc-20240605;
        b=JrLNyi3arLVmj1X+onV/7PUEWci3Ng3M4eVTlGkJB443FT9uBhlJGMdgCg8zbZh5Wp
         ufZhufG/JLER0CBMmFRZPcsOQ1Q8iBrhMS2tRXVgmwfXNPysBX5j7l2mbyaAiYBRBRnT
         a0IWDzm1io2TK/2NkCItEDHn2JyFzkLyS85bbxp9mMd7nmZyaXYkFfoeBLipw3Y0ttvR
         OyGnj0jgtG44f0g/nHYjQGdxj+cWrdcitUuVm2brtA0Afh3C6eO5pQBhY749o2e4hXTG
         zwg83CL3zOkux3jilGtOtmmWxnRH6o27DheruTbWkPQy8XVlV/o+5Bq6jt5jMBhNUcfr
         y7sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:dkim-signature;
        bh=JSyA17JcwDw+hVT8HzCGm3EhKp0MKE0IgjhRLkchdwk=;
        fh=tMMRipF0rkwklIGA5FNcgow4eDf8f6ouXaHJbhvjy2c=;
        b=Rt00WmmESEWAUtIQ+EOF2pZp23YWiYpJVYCKGxO2Y28/SJ2Guva/kTt3/9LKjZeufo
         BoTli5tVeAAemqgKAaKuNweYInxF+ey+GGzXp7io1SM3LHcvuk4mz/c/ROjgHvcMfOlL
         u9dDoD/n9y6wcq7vHEp1cnN88Q34ZakLCjYMEk4x+kwxpGKm4qk6OKLBdbNH/EobWpfM
         Y9xoMiE790DyZ47wvZz9hKe2iX9+s38lMSuSFiL0D/lobm5WBHPS3ma3Y3Dxt1fpp4sd
         d8h+rO386KN0SiVA4fkOdbKgTRkdMb89i/wD9lE+QtXZMC6n+XFNOQP6xrUmqBPPv1kK
         /BMQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=G59XgEby;
       spf=pass (google.com: domain of imammedo@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=imammedo@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <imammedo@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id d2e1a72fcca58-74625217ac1si2402409b3a.125.2025.05.27.05.33.07
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 May 2025 05:33:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of imammedo@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=G59XgEby;
       spf=pass (google.com: domain of imammedo@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=imammedo@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748349186;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JSyA17JcwDw+hVT8HzCGm3EhKp0MKE0IgjhRLkchdwk=;
	b=G59XgEby6qrGU/zP54zD6zO8Iy8pA2yoRDTR9IxV8oGmUmOd4vE+76PCRULfvCdIOxGsZL
	nvhG5nnxwYdQPuPHNaDgn4n+UHYuIYS2WZv+p6vu59YZ6wD4iw0mzm2T3B/10BCaDX/NZv
	nd6bqpYyEHA5AWb4WacNDg4nlrODa9E=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-22-Kym7SOFePQCpBu_y3hzFoQ-1; Tue, 27 May 2025 08:33:05 -0400
X-MC-Unique: Kym7SOFePQCpBu_y3hzFoQ-1
X-Mimecast-MFC-AGG-ID: Kym7SOFePQCpBu_y3hzFoQ_1748349184
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-442ffaa7dbeso24806555e9.3
        for <alex.bennee@linaro.org>; Tue, 27 May 2025 05:33:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748349184; x=1748953984;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JSyA17JcwDw+hVT8HzCGm3EhKp0MKE0IgjhRLkchdwk=;
        b=UROYfv1hRUUB6LWe1KEl6TXlwvM+kjTArtO+/STSsYFaSCyK7adkJGqlI4EtKdnpqf
         uoPP6RZi3CTqilOqYhjexRGNyQHSoHijx3hW1VDpOqBsocBI7lFH9N+2boSE8Iqmr1DZ
         xqGo49Naqp7ddafrZtMnKRaC/ZuhBQ/1jIZc5dvtE9fnGPq5Hk8M+ytL7JlCO39AjM1Q
         OWQXxg8GmUPBIMK562KAddJHiU0tvbaG0wkWe9lDEVynW2HFh1KUx1c1RKCTY6nQS0kK
         kTu0GVjEqA/ZVYkpEQlb2bWbYlr/pjrlzBv9lScFO1apXEBSKdA5wGI8GtWlg/dC6DhC
         A2UQ==
X-Forwarded-Encrypted: i=1; AJvYcCUX11yXFHp0uPK5hemG0SoW3qUKKmZZFvvxkhNsSsbMa4MFDk/5NyfBn6+8huh54rQHQxqGoJsCGMOigQ==@linaro.org
X-Gm-Message-State: AOJu0YwvjurI0gX563pmXf5Z8NdVl5Xr5b9rn9MKW0i1qR8EpVKjPV3z
	YnhRiW/MfcWI5BW+dYgSPPQiHGoIJbhmAeStFY01z6j4Wiufl3NLEjg6214Sir80KwehX/CrNmt
	BmJuJfIWI5Mzz+fXTy5LbBDeqv8S7tRH0ZxGo3RFLiT4eSC0AF0pVQOCZrA==
X-Gm-Gg: ASbGncvwfYG4I7xk4EQre2ICAb7JY3tymaQxkgVVCi2oMSmBROEGymn9KIzAnKWK9fh
	DKG3m3fXI9KaWXpATrMFuna0igkB6tw5XmUqZiXaVUV4kRPe5OlouK3I0KZqmIiL3Ru0pBzYO/6
	5uLBbdn8nNV0fp1BCNetB5pmt+UL0tgct0tiWDVVozxPxyiZ2qNbcFNDWPuyQtVQ7BUdfsFuGro
	XW3V1/79DVgEyf/BtF7UgV6AiFN2XWq/vXJLoJ8hj8cgDWPvqvgOgyTiLi7VqmheU3Vs5k1FPfY
	M8T7xG6qKqOErcARGsTgh+edZeznBwDx
X-Received: by 2002:a05:600c:a13:b0:43d:160:cd9e with SMTP id 5b1f17b1804b1-44c91fbb448mr122826955e9.17.1748349183863;
        Tue, 27 May 2025 05:33:03 -0700 (PDT)
X-Received: by 2002:a05:600c:a13:b0:43d:160:cd9e with SMTP id 5b1f17b1804b1-44c91fbb448mr122826535e9.17.1748349183416;
        Tue, 27 May 2025 05:33:03 -0700 (PDT)
Return-Path: <imammedo@redhat.com>
Received: from imammedo.users.ipa.redhat.com ([85.93.96.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-447f6b29619sm280797635e9.7.2025.05.27.05.33.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 May 2025 05:33:03 -0700 (PDT)
Date: Tue, 27 May 2025 14:33:01 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Cc: eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 peter.maydell@linaro.org, gustavo.romero@linaro.org, anisinha@redhat.com,
 mst@redhat.com, shannon.zhaosl@gmail.com, pbonzini@redhat.com,
 Jonathan.Cameron@huawei.com, philmd@linaro.org, alex.bennee@linaro.org
Subject: Re: [PATCH v2 06/25] hw/pci-host/gpex-acpi: Propagate hotplug type
 info from virt machine downto gpex
Message-ID: <20250527143301.77f5bfd1@imammedo.users.ipa.redhat.com>
In-Reply-To: <20250527074224.1197793-7-eric.auger@redhat.com>
References: <20250527074224.1197793-1-eric.auger@redhat.com>
	<20250527074224.1197793-7-eric.auger@redhat.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: bKLxKJSTwh57fEZ7hCuiASHrhRqkuBOLVMMRBN88yG0_1748349184
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-TUID: lvQ+r1N4GH3A

On Tue, 27 May 2025 09:40:08 +0200
Eric Auger <eric.auger@redhat.com> wrote:

> Propagate the type of pci hotplug mode downto the gpex
> acpi code. In case machine acpi_pcihp is unset we configure
> pci native hotplug on pci0. For expander bridges we keep
> legacy pci native hotplug, as done on x86 q35.

this is not needed if done as suggested in 2/25

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
