Received: by 2002:a17:505:a38d:b0:1be9:327d:8ee3 with SMTP id rs13csp4776689njc;
        Tue, 27 May 2025 05:27:28 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWyU/EsieOUADm9+F6MOxCMBAdwNMTm5B2gKNQJS1tcAH0fxlCzGxtRC0MbRFU1Id0/SmquBLhmFmeC5w==@linaro.org
X-Google-Smtp-Source: AGHT+IECCyJPaUpljOoztds50FJI82hn/1WMQaBo0CsjI8hnRsLv/l+YJB69I/tujQpb0B0BacwY
X-Received: by 2002:a05:622a:1f8e:b0:476:8eb5:1669 with SMTP id d75a77b69052e-49f4781ed76mr212886781cf.32.1748348847914;
        Tue, 27 May 2025 05:27:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1748348847; cv=none;
        d=google.com; s=arc-20240605;
        b=hCFwScrT36g1CidGt9LlbdoqENiofu9cDmq79+WZ/ms0MGD64sH5AKNCI5wwLOO9j8
         W824t0mPMWNulvs2hL/GjD9NWbvSlVZeGxt5UdqiaJal79993Hs7uSaBWoWGBPlur8B+
         /caD+Pmcc2NZpoL7r9usZ1j7f0+PRDal5e5hpbzA9+qi71vu7V0FyUNHxrUvyRbzsjw0
         H5a7yStCEUKS4lBwiX95bZUc2/xHIrKwqiJYFI6cU8dHnKN9gqigX2+fd4JEkN0V5Ivt
         ocmad8c+dWKNFpJyoKLMK6fEN7Sm+UOpRVwXXR5DG/oUsI6MHlc8ahT9VTKTjuVB6klF
         G00g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:dkim-signature;
        bh=E0i6h4e894s0nKCm3mA+2R5S8qNrj+2OrK1R+9fSF0s=;
        fh=KrfeRiiXjq1Qi3wU77nbGfKEdfmEtsNMzD859In/HJQ=;
        b=bgO53zDUAX3euAEioihPMp6kU2Au9BUL46VL9aPwggQufHnZoydBpDDaVTkReFqk0g
         UKtyMMDwkjGAk/ZWtRIkFjSMikITPM4J7CCNN7jmy8uYhKHwjbEjmlZTo+J9TYaoNn+d
         V5yfEQDGo/gEK4B2AshNLlCAFmDg9w8YX/qW7lsPt88pG+WNkixFbPjdFxSHvmGfkLMa
         8n6kSw8q6U30KtOsfI9FJQ+V7+8cDkke2pndwvKZ+rkHBvT1RhAlRwrDHOULGPPkrqpa
         c4ulKUE2WTs83zwWor6nsooPdmLaIJzW1fe0ICB5LwgJO+j9qj0bS7CZ9v8xXNdru3pG
         91bg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=FdHbFmeA;
       spf=pass (google.com: domain of imammedo@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=imammedo@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <imammedo@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id d75a77b69052e-494ae55fbe1si265577461cf.236.2025.05.27.05.27.27
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 May 2025 05:27:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of imammedo@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=FdHbFmeA;
       spf=pass (google.com: domain of imammedo@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=imammedo@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748348847;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=E0i6h4e894s0nKCm3mA+2R5S8qNrj+2OrK1R+9fSF0s=;
	b=FdHbFmeAfkkCNygCGwbT97rSqHvfyZ+mN4CV9dKxUzAk1YxYs/q1TlqZq1ql6Ynt5FmvQ3
	7T7LJGsrDrXPOqH5CXjRV40kupLeI+JdUEwyXjjwOZyahbn59tuBFpwHo/zhG733cpxYvh
	lusd9AkI9LJSclMDXZ+B5GgKDQQjTkw=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-399-cwmg7JSOMTWFP1xhnmEvVw-1; Tue, 27 May 2025 08:27:26 -0400
X-MC-Unique: cwmg7JSOMTWFP1xhnmEvVw-1
X-Mimecast-MFC-AGG-ID: cwmg7JSOMTWFP1xhnmEvVw_1748348845
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-442fa43e018so19394135e9.0
        for <alex.bennee@linaro.org>; Tue, 27 May 2025 05:27:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748348845; x=1748953645;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E0i6h4e894s0nKCm3mA+2R5S8qNrj+2OrK1R+9fSF0s=;
        b=uQwvGAIAV6mjWXfJudj6QRsPOI/UCCFX4cRSpoMY4yV745LkKR4+yO0qr4NIOcHXEU
         xbfV0uxTV9/GxgWHeVqTebyiTafupE6JyZoW8+cHkuZWADXjClwQad04RVNIzCi+Y4ra
         VIOzVOYFFuKtLAk16EtKjpVsQoOm1v47BOMJkMP+2D44z4rx2L1UuP1N6DL8qqpffQiH
         qNp7e3H5Gh0WJgS8xHmwZqGrVyVNK22pZxwQ88nIRLt7zxC01bkE3CLQdmhPpiEWi1v1
         6sZ5xSUvYITkils5yKZSyINq77N4P/SeNlZw5IAfJgSAxBCDNJ033Dff5EcPbR/KjVWD
         nkFg==
X-Forwarded-Encrypted: i=1; AJvYcCVSCmSs55BW0Y8dwUmc/GeiFbOJunS4ZE4xEDeTwphOneDTJurlJylBor8uy8OTie61KLGKKn51bnOaZQ==@linaro.org
X-Gm-Message-State: AOJu0YzY8wn181l7aF1PuE516ssE1hXdn8hPAMej4YYkKN4u2gprT2iO
	3optY7CGMx8id6mciNOLdzmiiAkO8sS+Pi/xQmd32+FxZYxftDvMhf/lwNDxo2qxSm4V8ty++Z5
	FFIidJF4xCRGmaRk9mi34yZTJJtYr0ByWBy0G16wrL1PO6xeqHPHTZPMRzQ==
X-Gm-Gg: ASbGncvwE9hCX3hQlYH0X13MBnQ8F06sqRikSpHwUAZZxEf6qxIZBoTPGAH/zVnXJg6
	kYQzg0Ri6mk83XJTFT0mwn0pnjnrikvRm/gLiukzkWG+FbdlmYAIzBViv2SYKBMTl+8lINcHtcm
	50LF1mpRkHLGbywIjaEQfu9gJlVffCne69kAd7qmmvZHuPtDkgPV1yupsb1vTuDuvLReYrPP+Ti
	xtB5f0MjN2wJIFiIHysiDJlZIbVKmd1pkE9G/6ZXQ1SIPR/CU5sHu+NksH+LvcknL+r0XVpbcQ+
	0OsW+hbAHW17KSQUhGiQFTIqibWLn2YR
X-Received: by 2002:a05:600c:4e15:b0:43b:c857:e9d7 with SMTP id 5b1f17b1804b1-44fd1a229bcmr4459595e9.5.1748348845220;
        Tue, 27 May 2025 05:27:25 -0700 (PDT)
X-Received: by 2002:a05:600c:4e15:b0:43b:c857:e9d7 with SMTP id 5b1f17b1804b1-44fd1a229bcmr4459315e9.5.1748348844879;
        Tue, 27 May 2025 05:27:24 -0700 (PDT)
Return-Path: <imammedo@redhat.com>
Received: from imammedo.users.ipa.redhat.com ([85.93.96.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-447f381465fsm268435155e9.29.2025.05.27.05.27.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 May 2025 05:27:24 -0700 (PDT)
Date: Tue, 27 May 2025 14:27:21 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Cc: eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 peter.maydell@linaro.org, gustavo.romero@linaro.org, anisinha@redhat.com,
 mst@redhat.com, shannon.zhaosl@gmail.com, pbonzini@redhat.com,
 Jonathan.Cameron@huawei.com, philmd@linaro.org, alex.bennee@linaro.org
Subject: Re: [PATCH v2 04/25] hw/pci-host/gpex-acpi: Add native_pci_hotplug
 arg to acpi_dsdt_add_pci_osc
Message-ID: <20250527142721.4abd02a2@imammedo.users.ipa.redhat.com>
In-Reply-To: <20250527074224.1197793-5-eric.auger@redhat.com>
References: <20250527074224.1197793-1-eric.auger@redhat.com>
	<20250527074224.1197793-5-eric.auger@redhat.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: DDSUWF-8FtLji1flaGHw78uvoJlGp-pXnx0qhHFKqrk_1748348845
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-TUID: OuXzDsZkgEOl

On Tue, 27 May 2025 09:40:06 +0200
Eric Auger <eric.auger@redhat.com> wrote:

> Add a new argument to acpi_dsdt_add_pci_osc to be able to disable
> native pci hotplug.
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> Reviewed-by: Gustavo Romero <gustavo.romero@linaro.org>

Reviewed-by: Igor Mammedov <imammedo@redhat.com>

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
