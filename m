Received: by 2002:a17:505:a38d:b0:1be9:327d:8ee3 with SMTP id rs13csp4844964njc;
        Tue, 27 May 2025 07:12:40 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXSifOs48OGJxFR7bMqXf/LalzTKuk4txP41s5atfUmNrXS6to2nw2ZG/vJK3TOjEsz2dA2zM69zWY1Ag==@linaro.org
X-Google-Smtp-Source: AGHT+IFxwKUILABurhb4/yA2yBYmj5/gLTtQ75w2V+A+XgLBNxjZlJWgKeZ+w1xVZtJdqCC2TPsK
X-Received: by 2002:a05:6102:604a:b0:4e4:f503:666b with SMTP id ada2fe7eead31-4e4f512b789mr3925255137.3.1748355160644;
        Tue, 27 May 2025 07:12:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1748355160; cv=none;
        d=google.com; s=arc-20240605;
        b=byPGF0ou87gvHum1TH7Z3qx61ebtYUoprQJqEjxv8mPRGIYBaGqPzz4HSsuXHhRMRx
         4FGEC6ggDzIiBI3ui823rTkhY52+JWYNUghQMQrbqztH/r0bWzfUUK1G+31VhN4w+LlK
         H+3rkezF3VvjW/w/sKjs5RZFqOw0VQ0jfenwgFUYFrybkdRdn3ducLeX8CFmiTCw/WdT
         TiDhJT4Dt3mWikQsAqFahwfMgG74iwgxk3wlX/iR8VMgzhd3s4P1CuCAmA2Sa1sEt6Eq
         HdLsn2egK3idMkMdXujVTMQ21XkzFyHTZeUbcM/aH9gyMshUD83sSxYkb7Utd+7VcAGQ
         my5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:dkim-signature;
        bh=xAlxIcXP/BPxHINkqh6XmD3LEC+ii4sHOM9gVyEVcs0=;
        fh=FruvtV3eJRKEPwZmPUtZTAwNEfQCogDaBii3NcwQa9o=;
        b=BG0cnBv5uL1NpY9cDu1YN7rbCr8p0CEh6ER0suLRtNleBaGMJaEbp3JoONddQM7lWz
         6+3wG2Ea+TvDoZyj/Sb9wm44fuFz+ifwpCgnz3/4VCy+GYB04uLfZRgwbuX8XQDViG3L
         hzm17XJfi6VPRcYUuk0wmpAymf0HDMwOFw7O7FozKN4cOI9I2yMMEaIV8afJt/h4KrNp
         cdlBzY4VnI6csllbe4pvDZL6bVqr/V8hEeuTj7BB8kOFzMoxVzAj47YeA1mnqKw77Imb
         8qivGOzoKB6floYZHj6aQ/iovtun4CDScIYUkJ2ntMwISePhDKxmX+lBUBoBcJxz4m97
         V5SQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ZJuVDK9E;
       spf=pass (google.com: domain of imammedo@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=imammedo@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <imammedo@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id ada2fe7eead31-4e594f84d55si205078137.229.2025.05.27.07.12.40
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 May 2025 07:12:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of imammedo@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ZJuVDK9E;
       spf=pass (google.com: domain of imammedo@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=imammedo@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748355160;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xAlxIcXP/BPxHINkqh6XmD3LEC+ii4sHOM9gVyEVcs0=;
	b=ZJuVDK9EmrAkI4Dm8JwS4QsXeEdO2QsrZ7CavljRkxU0NmZJobw3izjyLB68s4yOtz0trL
	mQIP74zHH36SiSWeawCDG4AUoh/I/AGXyuDnejt3GqPiRsz+uNSHCZCZ1QSyGHFkViBV2s
	1NbFTeZxJj1SFNaVQAQcPCkt0R0eGIY=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-410-7btD600TPFCynsh10CXgPg-1; Tue, 27 May 2025 10:12:38 -0400
X-MC-Unique: 7btD600TPFCynsh10CXgPg-1
X-Mimecast-MFC-AGG-ID: 7btD600TPFCynsh10CXgPg_1748355158
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3a4e1c6c68bso620810f8f.0
        for <alex.bennee@linaro.org>; Tue, 27 May 2025 07:12:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748355157; x=1748959957;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xAlxIcXP/BPxHINkqh6XmD3LEC+ii4sHOM9gVyEVcs0=;
        b=hhKrEnVz0CmgAsR4s+MiI4XfH0oCQWtnrYqQwuB8UdvnDz4nFdHAzXH1LRfL3+fUOZ
         KAvaiOVNlDBotfu2i/hVucCGkLwTHXOkr1xWw3cxJpHSuSD1MF/CaEe+yd5tBiMSmp0b
         hBqjrUt8I+pLWApFT/D14WQL36XOzp0comcmLJFDeUMfhBvmlkLQO205RUo1MyLe4mz0
         K/a/J35Zn9s0932rldryUQlwmP2dNLkAcX8cxLagjnUPQZsP2VyX+MR/OqfDHYOlJX89
         8z6seMkqTOTAJLv6nO5mySeSIczpJDAGEe+p7Gclxo7P1YymRMM/nBOdSt3xgBDgmicb
         gCuA==
X-Forwarded-Encrypted: i=1; AJvYcCUea0W1CwsGA2bbSWXPNHQzmrh+YFntFUcJDJamXcYNuWOuEId7fTx79MB2hdJtjjZ/jrOo6QL3ubB1Dg==@linaro.org
X-Gm-Message-State: AOJu0Yx92zfeZaG5bz9G1n6bK9CI3hSMhN2WV3yaB5jvEidOSPoflFCh
	RsNlyLoo3cgIKN16AA2TUKTHKByz5urn56rIlTTM0Y00HebkGfZ9d0DW6KSi1RnbP67LFhwsIkO
	22xw7tkvUsP7PSn9sQ0grVCOxPLTdGxlldlb5Tldv8VrfkgncrOUUERSbow==
X-Gm-Gg: ASbGnctU9on40drwVCQOXlYTKTBiDvwL16xmiJPsJl8wx6I69TlZSCZsM5olEgSCmab
	50D47eeOmJsyjSZ2+GjX+hOxAimGIS2RzEEaPQ0ZAE3oCh9zV26SEwxLuNyNW27ZQgtzvGsTF4E
	SQnlwSI2Vlk1TEeeUTf0+xf3ADlAJiQwDEHocQWHuRhHjEKWFDfnuQnmqZDcTDatW1MDNqKjlP1
	KAHya9+cFyAf5n6U/ZrnJu0/BtCruhh8h7eJbriiNNhh92dkcLUa0cvXwjVXz96zEcHGn+6DXTT
	HC5hZ3ww8a7YPIUSvk7tOyLjLSoDoCx8
X-Received: by 2002:a05:6000:2911:b0:3a4:e65d:5d8c with SMTP id ffacd0b85a97d-3a4e65d5d9emr483373f8f.40.1748355157550;
        Tue, 27 May 2025 07:12:37 -0700 (PDT)
X-Received: by 2002:a05:6000:2911:b0:3a4:e65d:5d8c with SMTP id ffacd0b85a97d-3a4e65d5d9emr483333f8f.40.1748355157167;
        Tue, 27 May 2025 07:12:37 -0700 (PDT)
Return-Path: <imammedo@redhat.com>
Received: from imammedo.users.ipa.redhat.com ([85.93.96.130])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4e425f25csm1200290f8f.70.2025.05.27.07.12.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 May 2025 07:12:36 -0700 (PDT)
Date: Tue, 27 May 2025 16:12:35 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Cc: eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 peter.maydell@linaro.org, gustavo.romero@linaro.org, anisinha@redhat.com,
 mst@redhat.com, shannon.zhaosl@gmail.com, pbonzini@redhat.com,
 Jonathan.Cameron@huawei.com, philmd@linaro.org, alex.bennee@linaro.org
Subject: Re: [PATCH v2 17/25] hw/arm/virt-acpi-build: Modify the DSDT ACPI
 table to enable ACPI PCI hotplug
Message-ID: <20250527161235.068bf64b@imammedo.users.ipa.redhat.com>
In-Reply-To: <20250527074224.1197793-18-eric.auger@redhat.com>
References: <20250527074224.1197793-1-eric.auger@redhat.com>
	<20250527074224.1197793-18-eric.auger@redhat.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: qt0W8j9ecq6HZgAqnGuux9cbhgqZ8K7nRIiDur_RcUg_1748355158
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-TUID: Ui3sMpmuxO1B

On Tue, 27 May 2025 09:40:19 +0200
Eric Auger <eric.auger@redhat.com> wrote:

> Modify the DSDT ACPI table to enable ACPI PCI hotplug.
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> ---
>  include/hw/arm/virt.h    |  1 +
>  hw/arm/virt-acpi-build.c | 21 +++++++++++++++++++++
>  hw/arm/virt.c            |  1 +
>  hw/arm/Kconfig           |  2 ++
>  4 files changed, 25 insertions(+)
> 
> diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
> index 10ea581f06..1b2e2e1284 100644
> --- a/include/hw/arm/virt.h
> +++ b/include/hw/arm/virt.h
> @@ -79,6 +79,7 @@ enum {
>      VIRT_ACPI_GED,
>      VIRT_NVDIMM_ACPI,
>      VIRT_PVTIME,
> +    VIRT_ACPI_PCIHP,
>      VIRT_LOWMEMMAP_LAST,
>  };
>  
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index be5e00a56e..9d88ffc318 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -34,6 +34,7 @@
>  #include "hw/core/cpu.h"
>  #include "hw/acpi/acpi-defs.h"
>  #include "hw/acpi/acpi.h"
> +#include "hw/acpi/pcihp.h"
>  #include "hw/nvram/fw_cfg_acpi.h"
>  #include "hw/acpi/bios-linker-loader.h"
>  #include "hw/acpi/aml-build.h"
> @@ -836,6 +837,7 @@ build_dsdt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>                           (irqmap[VIRT_MMIO] + ARM_SPI_BASE),
>                           0, NUM_VIRTIO_TRANSPORTS);
>      acpi_dsdt_add_pci(scope, memmap, irqmap[VIRT_PCIE] + ARM_SPI_BASE, vms);
> +
>      if (vms->acpi_dev) {
>          build_ged_aml(scope, "\\_SB."GED_DEVICE,
>                        HOTPLUG_HANDLER(vms->acpi_dev),
> @@ -864,6 +866,25 @@ build_dsdt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>  
>      aml_append(dsdt, scope);
>  
> +    if (vms->acpi_pcihp) {
> +        Aml *pci0_scope = aml_scope("\\_SB.PCI0");
> +
> +        aml_append(pci0_scope, aml_pci_edsm());
> +        build_acpi_pci_hotplug(dsdt, AML_SYSTEM_MEMORY,
> +                               memmap[VIRT_ACPI_PCIHP].base);
> +        build_append_pcihp_resources(pci0_scope,
> +                                     memmap[VIRT_ACPI_PCIHP].base,
> +                                     memmap[VIRT_ACPI_PCIHP].size);
> +
> +        /* Scan all PCI buses. Generate tables to support hotplug. */
> +        build_append_pci_bus_devices(pci0_scope, vms->bus);
> +        if (object_property_find(OBJECT(vms->bus), ACPI_PCIHP_PROP_BSEL)) {
> +            build_append_pcihp_slots(pci0_scope, vms->bus);
> +        }
> +        build_append_notification_callback(pci0_scope, vms->bus);
> +        aml_append(dsdt, pci0_scope);
> +    }
> +
>      /* copy AML table into ACPI tables blob */
>      g_array_append_vals(table_data, dsdt->buf->data, dsdt->buf->len);
>  
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index a0deeaf2b3..4aa40c8e8b 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -183,6 +183,7 @@ static const MemMapEntry base_memmap[] = {
>      [VIRT_NVDIMM_ACPI] =        { 0x09090000, NVDIMM_ACPI_IO_LEN},
>      [VIRT_PVTIME] =             { 0x090a0000, 0x00010000 },
>      [VIRT_SECURE_GPIO] =        { 0x090b0000, 0x00001000 },
> +    [VIRT_ACPI_PCIHP] =         { 0x090c0000, 0x00001000 },
                                                  ^^^^^
why not use actual len define here?
                                             
>      [VIRT_MMIO] =               { 0x0a000000, 0x00000200 },
>      /* ...repeating for a total of NUM_VIRTIO_TRANSPORTS, each of that size */
>      [VIRT_PLATFORM_BUS] =       { 0x0c000000, 0x02000000 },
> diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
> index a55b44d7bd..572b4dabd5 100644
> --- a/hw/arm/Kconfig
> +++ b/hw/arm/Kconfig
> @@ -34,6 +34,8 @@ config ARM_VIRT
>      select ACPI_HW_REDUCED
>      select ACPI_APEI
>      select ACPI_VIOT
> +    select ACPI_PCIHP
> +    select ACPI_PCI_BRIDGE
>      select VIRTIO_MEM_SUPPORTED
>      select ACPI_CXL
>      select ACPI_HMAT
