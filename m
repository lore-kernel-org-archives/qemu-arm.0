Received: by 2002:a17:505:8ed0:b0:1be9:327d:8ee3 with SMTP id kh16csp856029njc;
        Fri, 20 Jun 2025 05:33:15 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUSBTpaPgDjR8Zlq0UZKcAaiZCb7xAYzBMxElfUNsWrrCQ99qIw6dsIeVxZNjQMHuKpAWS4HHMFIJaDsw==@linaro.org
X-Google-Smtp-Source: AGHT+IGXiMtYNsoNMhKKR0eqEX7v2OZk56+2x87eARcZ+HwisowOcgfvTsA9E7/1V9w7JxemPlKP
X-Received: by 2002:a05:6214:6213:b0:6fd:ace:4cf7 with SMTP id 6a1803df08f44-6fd0ace5039mr24328466d6.24.1750422794929;
        Fri, 20 Jun 2025 05:33:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750422794; cv=none;
        d=google.com; s=arc-20240605;
        b=C4kjyn1V+G9XF60UDnenT7vVjjW1P6a3cL9SqsBOVBfnwYcyt/OgQve+0+iwLpXVsh
         tddjIdmHqepj3OqpG5CGXAkG47uVgcgNe+trpc0y3VqLRv3FneiuEqctOrgzQW8oiMI/
         v03PhEx6ARiJOOJC0K2ccECr3RXqJkNhdOxAP8NYWKroBI+T8oL5FfF2cFGlTJ43/aK+
         Q3D++FWRwineGIU3wwnkHaYX0phUUPDCe8cK5nVBDGU6wOGrx4Kq+AS155TLZpBSr26X
         M1CAd0kCcwnktW2JypC2EmHhHurRBYlLL47snw6btMzKDVJkGem0wvjAOd6RztD18Bhn
         jaYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:dkim-signature;
        bh=gNBsc44q89xHtPVhAxDbL3igZk3nFKrUg4BtPXbAfRM=;
        fh=E/eUQL4rFEWxo1RH8aSaIdnJs6Rfpw9rplnGCdQSBXk=;
        b=jf0NCiVeX291hcrWDnCqJdaqtK8gDEghHtVubIQSBdnaO9QRw/xVu9cZT9VuX3KCCF
         9bRA6UXx8p7f0MU+0IyG/rusjrdglmkBmV9EC/G1hPRDlviooY15gzoxLiFXp1fBecJD
         GAhCj9c306RhDZPipyD8vzsHXUA+5sUyXIC9WMW10rB8g2kr+4lvJNZgUtNXId+DJqVU
         jMi6b2m6nCgqFGF7/g4Ffehj68eDSoufuC8ePC+wKAp4qrIFQPUDwC5KilVW82UukFRD
         uyRZuHhkzruMWYK8bUrjpD3gaXpqhkVygZNPzzokPsn6H+H3hykAsoFE/vnztMmEH2fA
         fwSQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=g3qHWOe1;
       spf=pass (google.com: domain of imammedo@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=imammedo@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <imammedo@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id 6a1803df08f44-6fd095933c6si20052846d6.357.2025.06.20.05.33.14
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jun 2025 05:33:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of imammedo@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=g3qHWOe1;
       spf=pass (google.com: domain of imammedo@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=imammedo@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750422794;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gNBsc44q89xHtPVhAxDbL3igZk3nFKrUg4BtPXbAfRM=;
	b=g3qHWOe1D+ORySZUYQ82+9RC2k1QQhKGbEX3XKISMWdRi57yAnhXicZMKr5QmgiLz6KUPS
	jwIEBPnyCbRm4xYSGE559/7Ftst/ml0+7WoxdGsyAVwSVrEjube9skSFBqq3sh/FT2ra5/
	VuDF75M4zlNbfpwsK1WI8aeQFSl5YFs=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-670-Doir6YlqNKC3tqfQ_7LGjQ-1; Fri, 20 Jun 2025 08:33:13 -0400
X-MC-Unique: Doir6YlqNKC3tqfQ_7LGjQ-1
X-Mimecast-MFC-AGG-ID: Doir6YlqNKC3tqfQ_7LGjQ_1750422792
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-453018b4ddeso11146185e9.3
        for <alex.bennee@linaro.org>; Fri, 20 Jun 2025 05:33:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750422792; x=1751027592;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gNBsc44q89xHtPVhAxDbL3igZk3nFKrUg4BtPXbAfRM=;
        b=Y9OtHaz5vZXICR2ys0u6y+ppDAhC1dUZyPl5OfAMtOBdwTJa5uIGw65SjsOHl7vFOC
         VF5GGReyo0vueLXpE+hE3k+P7xrjG132z7Calpx/TzjVPnxBAjJqWq0PzH08EaEDOsDx
         XnbBU9Tm/21nGCsQ4zD6+5KTxPblnFysyTEHBYgKM1i045dLb3yezpO5ujTzV4sqbRc0
         5+tEVMwlb+5K/oEAXOXWhFRTjPf+PgxodLBEMNBpRi4C1/slRdBEGDX/pcnb1ASwHrgZ
         ncdTCK7bfcB1UxtXnbp5rXZe+Oapj5nzzRMEke5cBofpFgB4EnO3BsFEAa+MdL1Ycihx
         KRmw==
X-Forwarded-Encrypted: i=1; AJvYcCUW1kGGgsAozBS6AHncoZABDjhYaXDkTZ5wko9h5w4gubsoJImjkXAgXnSZlfV5RDZAzTqvf84OQWXdkQ==@linaro.org
X-Gm-Message-State: AOJu0YxLiirSIw1pR/gMdYIaRfiz6m4SXPwuCc3SraI3O+LiDML0MjGZ
	+g/79vmaY19SwJTxdHV6zvemBfJRmGD2fdS+v90pPbtwiq7K2/KhuuZM06mOhtBoGIIHLUxrou3
	s2SXxV0KxsRQIZlwI/Zj/nq5G4DyiWDHK0uebgZa6vU388yMldYvSyMX/5w==
X-Gm-Gg: ASbGnct/85ibTSoj7E7F4NqYPiPsxHy6ksxA2xzQKRWQ+CmFCFX4NG4J3Xo8/OR8eHH
	b2JLBD5SV+8sZDn2gOjjwx+rq0bwQLhRnEmxkRnizWMWbwB9W8iDTbB3KSV6qyzX97HFrwIm7to
	OwBEDH6Bt3q0HKDykOrRyHu7rcTweLyJvRtTga1UH5mEwmHtfAVaT7AKlmt0PM91VXw9UezSuO8
	bmg6/V8B2ICw7WzM28l6LEQZvnpYi8tbQvJXGdH+emIzNlg2vuETBu8ab+0e23nK3FTsXYo9Osu
	k5BomPUdP/qu
X-Received: by 2002:a05:600c:c3db:b0:450:d3b9:a5fc with SMTP id 5b1f17b1804b1-453655c2b88mr13201375e9.27.1750422792090;
        Fri, 20 Jun 2025 05:33:12 -0700 (PDT)
X-Received: by 2002:a05:600c:c3db:b0:450:d3b9:a5fc with SMTP id 5b1f17b1804b1-453655c2b88mr13201145e9.27.1750422791652;
        Fri, 20 Jun 2025 05:33:11 -0700 (PDT)
Return-Path: <imammedo@redhat.com>
Received: from fedora ([85.93.96.130])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6d2236452sm1703913f8f.59.2025.06.20.05.33.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jun 2025 05:33:11 -0700 (PDT)
Date: Fri, 20 Jun 2025 14:33:10 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Cc: eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 peter.maydell@linaro.org, gustavo.romero@linaro.org, anisinha@redhat.com,
 mst@redhat.com, shannon.zhaosl@gmail.com, pbonzini@redhat.com,
 Jonathan.Cameron@huawei.com, philmd@linaro.org, alex.bennee@linaro.org
Subject: Re: [PATCH v3 17/29] hw/arm/virt-acpi-build: Modify the DSDT ACPI
 table to enable ACPI PCI hotplug
Message-ID: <20250620143310.0eeb124c@fedora>
In-Reply-To: <20250616094903.885753-18-eric.auger@redhat.com>
References: <20250616094903.885753-1-eric.auger@redhat.com>
	<20250616094903.885753-18-eric.auger@redhat.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: BJGiAh-V-M17rqFB7Klx9ns1aUv4GbECN99cnkbFbyM_1750422792
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-TUID: 55CBBJlUVuXi

On Mon, 16 Jun 2025 11:46:46 +0200
Eric Auger <eric.auger@redhat.com> wrote:

> Modify the DSDT ACPI table to enable ACPI PCI hotplug.
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> 
> ---
> v2 -> v3:
> - use ACPI_PCIHP_SIZE instead of 0x1000 (Igor)
> - use cihp_state->use_acpi_hotplug_bridge
> ---
>  include/hw/acpi/pcihp.h  |  2 ++
>  include/hw/arm/virt.h    |  1 +
>  hw/arm/virt-acpi-build.c | 22 ++++++++++++++++++++++
>  hw/arm/virt.c            |  2 ++
>  hw/arm/Kconfig           |  2 ++
>  5 files changed, 29 insertions(+)
> 
> diff --git a/include/hw/acpi/pcihp.h b/include/hw/acpi/pcihp.h
> index 5506a58862..9ff548650b 100644
> --- a/include/hw/acpi/pcihp.h
> +++ b/include/hw/acpi/pcihp.h
> @@ -38,6 +38,8 @@
>  #define ACPI_PCIHP_SEJ_BASE 0x8
>  #define ACPI_PCIHP_BNMR_BASE 0x10
>  
> +#define ACPI_PCIHP_SIZE 0x0018
> +
>  typedef struct AcpiPciHpPciStatus {
>      uint32_t up;
>      uint32_t down;
> diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
> index 9a1b0f53d2..0ed2e6b732 100644
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
> index d7547c8d3b..a2e58288f8 100644
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
> @@ -809,6 +810,8 @@ static void
>  build_dsdt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>  {
>      VirtMachineClass *vmc = VIRT_MACHINE_GET_CLASS(vms);
> +    AcpiGedState *acpi_ged_state = ACPI_GED(vms->acpi_dev);
> +    AcpiPciHpState *pcihp_state = &acpi_ged_state->pcihp_state;
>      Aml *scope, *dsdt;
>      MachineState *ms = MACHINE(vms);
>      const MemMapEntry *memmap = vms->memmap;
> @@ -868,6 +871,25 @@ build_dsdt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>  
>      aml_append(dsdt, scope);
>  
> +    if (pcihp_state->use_acpi_hotplug_bridge) {

ditto, use property accessor


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
> index 9a6cd085a3..08bd808499 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -75,6 +75,7 @@
>  #include "standard-headers/linux/input.h"
>  #include "hw/arm/smmuv3.h"
>  #include "hw/acpi/acpi.h"
> +#include "hw/acpi/pcihp.h"
>  #include "target/arm/cpu-qom.h"
>  #include "target/arm/internals.h"
>  #include "target/arm/multiprocessing.h"
> @@ -183,6 +184,7 @@ static const MemMapEntry base_memmap[] = {
>      [VIRT_NVDIMM_ACPI] =        { 0x09090000, NVDIMM_ACPI_IO_LEN},
>      [VIRT_PVTIME] =             { 0x090a0000, 0x00010000 },
>      [VIRT_SECURE_GPIO] =        { 0x090b0000, 0x00001000 },
> +    [VIRT_ACPI_PCIHP] =         { 0x090c0000, ACPI_PCIHP_SIZE },
>      [VIRT_MMIO] =               { 0x0a000000, 0x00000200 },
>      /* ...repeating for a total of NUM_VIRTIO_TRANSPORTS, each of that size */
>      [VIRT_PLATFORM_BUS] =       { 0x0c000000, 0x02000000 },
> diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
> index f543d944c3..dee4d6dd25 100644
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
