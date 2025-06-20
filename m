Received: by 2002:a17:505:8ed0:b0:1be9:327d:8ee3 with SMTP id kh16csp876697njc;
        Fri, 20 Jun 2025 06:06:54 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUNaIBtC6gpdVaGBq5uNqrBuv5WN9+u+PqObMRblTRnWAY1LxlUZjyzduupCoV+Utf3rM0jdk/4lTVxEQ==@linaro.org
X-Google-Smtp-Source: AGHT+IFCI/MvW21I21Vi3+ba3iwFQWKK4G9aQ7YPe+Zh4mEQG5EGQw9piU2VltpS4KU8Lhjm72Fz
X-Received: by 2002:a05:620a:24d5:b0:7d3:8dd1:e13c with SMTP id af79cd13be357-7d3f9947bc0mr370006885a.38.1750424813869;
        Fri, 20 Jun 2025 06:06:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750424813; cv=none;
        d=google.com; s=arc-20240605;
        b=MvI0/PZwnf1TWUA1Aui8t+ywg6yVMLLHHyJy+6itgEvTCUWu4YUXBGEipHPaemEa8h
         qDjBwK1uhHOCHVXPcaKBAbzIKxHB3EXHDDM5kgYAfBbHd3i/5D+DSLo4/o16oCmK1KQu
         I8SYDkz9+F0Zn87K9UbeiOFBu0vbBV2UJol5d4KAzwbbtrmUDLe9tGytF2kghoh09xKR
         ORqioc137ujakYs/KYuLeHWvID5DJlYOkFtxXTJ4OLVGsgTiacytu7H4fsNDYIjG5b4l
         EuufGQHeTbUsdjLILPqv+Gj0NJZQ9Hr3Pd6g3hgMFY8iUhbgyz8umjMeUVs55JD/RAqs
         8ySQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:dkim-signature;
        bh=VCPugQeYEJztwx9I+h2+DYZRCQdWluxXl/h618kyee0=;
        fh=9mdsB38f7HoKqHgqeDEuAisbZXTOyQctwXczqe+7t4w=;
        b=btJC4A1wasOanVaW0X/dNrri48UX1xJwWUsmqaGEscXYbjAYXYaTdHejXuxnL7g9H1
         nui4n0IXBQ7wnDg/kF84A+Ktd/2WZS08aMkFjw6AQ/uMwTRFdxLJ2Fttm9KaBvf7qvbE
         cnbJ3yyPBxTaoR0ko+3ugmscpbQDI/wYS+GwF6RUs2P4KSWWLju6epExHN5msDuodyDJ
         a9MVoky+i66VqJFA9hgr7wGc3Zi/B60kO60DftZcqBYiaAHXRJW5qB8KKg9gL6pbmz2S
         QbiFdMU5eWmtLxG1CgauvATZ0NfJ6ORQ233xTEa2ctuUK1iEuVsiiW3xi4EDG1b0CgP+
         OUng==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=XNgNZ+et;
       spf=pass (google.com: domain of imammedo@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=imammedo@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <imammedo@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id af79cd13be357-7d3f9a0a0d5si152193985a.433.2025.06.20.06.06.53
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jun 2025 06:06:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of imammedo@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=XNgNZ+et;
       spf=pass (google.com: domain of imammedo@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=imammedo@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750424813;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VCPugQeYEJztwx9I+h2+DYZRCQdWluxXl/h618kyee0=;
	b=XNgNZ+etq/p3Jb+ve6SFZ9w8e5hO1SixE5TBE+SmMPrVdAcchgxuHAKJa1mwZ0IyCDViid
	pd2MjYrE6ByO1swYnY4zb0wXLLKFPENBZNjQNT69Y/vRa70FZbAzKio7phFICbtxUfIJSF
	xM7YM7hmlIYayMjYubV6DGJx9zKMGgc=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-577-iJY8PVboP6Wm2OxgkIhJrQ-1; Fri, 20 Jun 2025 09:06:52 -0400
X-MC-Unique: iJY8PVboP6Wm2OxgkIhJrQ-1
X-Mimecast-MFC-AGG-ID: iJY8PVboP6Wm2OxgkIhJrQ_1750424811
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-3a4eec544c6so971984f8f.0
        for <alex.bennee@linaro.org>; Fri, 20 Jun 2025 06:06:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750424811; x=1751029611;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VCPugQeYEJztwx9I+h2+DYZRCQdWluxXl/h618kyee0=;
        b=qlxoU1J3fYPx3RQpoBv0Mw/9Q/+uTjfqY5CiMr0Q0tJNes6yyqnubdezyHnGM85IOg
         DDJ8uphxqDqab6+kucLRInzQ1h1nDc9++6FfPcB+SYnhWmVX+S7sdk7A/iQZc798KkEo
         EieWUuxDSP6hGdAjn2t2peNG8yFCwPfH1yS92yOaARR/mFsE6I+Z91Yu7cYkEcEzuSia
         rdYkxAZqhi+QsH2iAGiKsP6A0lFu3x0U5fOsdlbUVgcAiqVY9rwfQRt67E/07nhrfzrV
         GrLdWyWMtoaV/X2LCNdjHougo+nVcbVgtAZuV8Ohqy1jz/0QnCxQR2eaFOGAxeTWfKJ2
         JT/g==
X-Forwarded-Encrypted: i=1; AJvYcCWgwc6XLejbxTYUC5oFr4lPri1vlpiDZ/HG+qiRPVoBkY+C5wYiZUYoUPOHglhc8lqNmrsLT2YSXX0nrA==@linaro.org
X-Gm-Message-State: AOJu0YwpyNG3Kr19Hr4kS3Pn+6S2fivxU0Bhhb6Sg003/4GUZPJGWibU
	L8XVXt52dViLzX1stq+Yo+NtcLjSvzps+EHwwgsZBRoLsP1zBx6WDziQRUyisekujJ9ZMFdECF8
	jYprx1ZPSKx9wGv5BK5gzpsLIBnKa0XiuK/VPUnndFRFNZZIVAraXJskABQ==
X-Gm-Gg: ASbGncuwkcZrbJjR8gScQyFhpW0ryZP6vtGah4WK0CconoUsQC/vB0aiAgmR27nJRDd
	B9UN5uZ+3zr+v7ZV3AtO/yOJI4ZW4WrmVCW4gVJcOMZblKCHr/f0YBPNkxDjqjEeJCcDsxMiijX
	6H517gTLvVX74TdEn1LUlyIL8gn5RdziN3+aeUFnWxBisXM92dKQ7VfCvKIsc/9n6eEaSR1PyyC
	yLWmtvGqnIfYCOdj4AzpyuIJnOSTuWDmwFFJEHawGUrFKQ0WWeFGbeNSV2dlVPOOBx3SNS91zOC
	j3/n4B7Pm6LG
X-Received: by 2002:a05:6000:3103:b0:3a5:58a5:6a83 with SMTP id ffacd0b85a97d-3a6d13013eemr2635365f8f.13.1750424810826;
        Fri, 20 Jun 2025 06:06:50 -0700 (PDT)
X-Received: by 2002:a05:6000:3103:b0:3a5:58a5:6a83 with SMTP id ffacd0b85a97d-3a6d13013eemr2635314f8f.13.1750424810401;
        Fri, 20 Jun 2025 06:06:50 -0700 (PDT)
Return-Path: <imammedo@redhat.com>
Received: from fedora ([85.93.96.130])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6d1190b00sm1977849f8f.87.2025.06.20.06.06.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jun 2025 06:06:49 -0700 (PDT)
Date: Fri, 20 Jun 2025 15:06:48 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Cc: eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 peter.maydell@linaro.org, gustavo.romero@linaro.org, anisinha@redhat.com,
 mst@redhat.com, shannon.zhaosl@gmail.com, pbonzini@redhat.com,
 Jonathan.Cameron@huawei.com, philmd@linaro.org, alex.bennee@linaro.org
Subject: Re: [PATCH v3 25/29] hw/arm/virt: Let virt support pci
 hotplug/unplug GED event
Message-ID: <20250620150648.09dab163@fedora>
In-Reply-To: <20250616094903.885753-26-eric.auger@redhat.com>
References: <20250616094903.885753-1-eric.auger@redhat.com>
	<20250616094903.885753-26-eric.auger@redhat.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: CuocBi0a87_2RTZI_T1pzR3IMIydH5VW05La_UpC9eE_1750424811
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-TUID: EPKDF79ayMYl

On Mon, 16 Jun 2025 11:46:54 +0200
Eric Auger <eric.auger@redhat.com> wrote:

> Set up the IO registers used to communicate between QEMU
> and ACPI.
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> 
> ---
> v2 -> v3:
> - remove acpi_ged_state->pcihp_state.use_acpi_hotplug_bridge = true;
> - use sysbus_mmio_map_name for all regs (Igor)
> - create_pcie left at its original place
> 
> v1 -> v2:
> - use ACPI_PCIHP_REGION_NAME
> ---
>  include/hw/acpi/generic_event_device.h |  1 +
>  hw/arm/virt.c                          | 19 +++++++++++++++++--
>  2 files changed, 18 insertions(+), 2 deletions(-)
> 
> diff --git a/include/hw/acpi/generic_event_device.h b/include/hw/acpi/generic_event_device.h
> index ec8e1abe0a..8f5d903146 100644
> --- a/include/hw/acpi/generic_event_device.h
> +++ b/include/hw/acpi/generic_event_device.h
> @@ -111,6 +111,7 @@ typedef struct GEDState {
>  } GEDState;
>  
>  #define ACPI_PCIHP_REGION_NAME "pcihp container"
> +#define ACPI_MEMHP_REGION_NAME "memhp container"
>  
>  struct AcpiGedState {
>      SysBusDevice parent_obj;
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 41be8f6dbb..8c882e0794 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -684,6 +684,8 @@ static inline DeviceState *create_acpi_ged(VirtMachineState *vms)
>      DeviceState *dev;
>      MachineState *ms = MACHINE(vms);
>      SysBusDevice *sbdev;
> +    AcpiGedState *acpi_ged_state;
> +    AcpiPciHpState *pcihp_state;
>      int irq = vms->irqmap[VIRT_ACPI_GED];
>      uint32_t event = ACPI_GED_PWR_DOWN_EVT;
>  
> @@ -696,13 +698,26 @@ static inline DeviceState *create_acpi_ged(VirtMachineState *vms)
>      }
>  
>      dev = qdev_new(TYPE_ACPI_GED);

> +    acpi_ged_state = ACPI_GED(dev);
> +    pcihp_state = &acpi_ged_state->pcihp_state;
> +    if (pcihp_state->use_acpi_hotplug_bridge) {
> +        event |= ACPI_GED_PCI_HOTPLUG_EVT;
> +    }

Doesn't it belong to ged_realize()?

>      qdev_prop_set_uint32(dev, "ged-event", event);
>      object_property_set_link(OBJECT(dev), "bus", OBJECT(vms->bus), &error_abort);
>      sbdev = SYS_BUS_DEVICE(dev);
>      sysbus_realize_and_unref(sbdev, &error_fatal);
>  
> -    sysbus_mmio_map(sbdev, 0, vms->memmap[VIRT_ACPI_GED].base);
> -    sysbus_mmio_map(sbdev, 1, vms->memmap[VIRT_PCDIMM_ACPI].base);
> +    sysbus_mmio_map_name(sbdev, TYPE_ACPI_GED, vms->memmap[VIRT_ACPI_GED].base);
> +    sysbus_mmio_map_name(sbdev, ACPI_MEMHP_REGION_NAME,
> +                         vms->memmap[VIRT_PCDIMM_ACPI].base);
> +    if (pcihp_state->use_acpi_hotplug_bridge) {

like elsewhere, use property accessor

> +        int pcihp_region_index;
> +
> +        pcihp_region_index = sysbus_mmio_map_name(sbdev, ACPI_PCIHP_REGION_NAME,
> +                                                  vms->memmap[VIRT_ACPI_PCIHP].base);
> +        assert(pcihp_region_index >= 0);
> +    }
>      sysbus_connect_irq(sbdev, 0, qdev_get_gpio_in(vms->gic, irq));
>  
>      return dev;
