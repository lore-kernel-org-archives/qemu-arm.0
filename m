Received: by 2002:a17:505:a38d:b0:1be9:327d:8ee3 with SMTP id rs13csp4912810njc;
        Tue, 27 May 2025 08:56:55 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUsGJ4k6ml/1ljBmj2geBP0e+yf77vMEmk77LFV/JdpGauFqIjvl4Rhm65yCMJGKX2s0hrHhSPTqAMxJw==@linaro.org
X-Google-Smtp-Source: AGHT+IFKaATix086RH+ZNjxu18sCvjX7Wvv4qW0Pj2lh1irF09RZzBnMjbWXoGoSsf1mK5D6AwCs
X-Received: by 2002:a05:6a21:2986:b0:203:becd:f9ce with SMTP id adf61e73a8af0-2188c3b3022mr20952826637.39.1748361415537;
        Tue, 27 May 2025 08:56:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1748361415; cv=none;
        d=google.com; s=arc-20240605;
        b=L+nFWarV/GlX9I45w+hpyVtHC2Nvwccl8h6ZMmgbQ99ebw42vmFObN9Sb39j/4I9ad
         9jaKfzRJAzsgmwtTrlZZ8Xtgip5kWlBp5J+tjlPCXmst5w+kByF0BpMZC2l4BIGPLoQH
         S+cFZ/8/fUESILtFU4OE7X4sQ1Uh+GpqSDzY8xj4Xt/JUWSQPGPQvuYpEo2mkd7YRbFn
         s6MVEQ1tzCUbgtP3853oD4iJYRSRXY2tSYZ7xSYsBts0zeS5KnNcUAiyss8UZw9g2Nat
         qDRVLvYg0obgSctkSXvfiazOsLEMoJxzFfK/zi0NdjylCzB2gTFj3YOt0MTu3S+lBLSL
         EI2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:dkim-signature;
        bh=jZp4OkMS0wneelPodZb02GukKgjqxfQUF5cHCQf+gw8=;
        fh=aX033iNZVby8JfSFgCNLT5KDru+BT7o5Pg+8o5g4Zmc=;
        b=J3rPSWfIKGiqGCFRT7XTt5ohxRrJj3olH34RBwnR8aJdlHQ7KpdQcCAx7ZBlUIy2iJ
         cGWdp4Ixu79pIinNFU89Ngk+zeS2BP523IMB1sL8glmvaR6C/kgmg5/f9DL+4GSi6GI8
         CONUEcFDD9/+1ocfTTIc12LYdLFLll5b0+W25dOe/CKHiERQJZVzlfCLVSsQd8N1hAli
         k7Iusz0el9fnipTCDWHhCCu/cFyv91LhXpdZv/jSGRX/PSLY4CgPwvdxFweKZo0RCJQz
         P62Er7mP4/OBx/LdkJNW1AmOuMz3aTnZUaDTRtFHsgOGGB20cTMAxUjVU1/xUnXyfU8p
         0iGw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Y2cU1tus;
       spf=pass (google.com: domain of imammedo@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=imammedo@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <imammedo@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id 41be03b00d2f7-b26eb0bed41si7572877a12.531.2025.05.27.08.56.55
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 May 2025 08:56:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of imammedo@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Y2cU1tus;
       spf=pass (google.com: domain of imammedo@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=imammedo@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748361414;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jZp4OkMS0wneelPodZb02GukKgjqxfQUF5cHCQf+gw8=;
	b=Y2cU1tusxPd6FSgrXk4v8hk4n3bTtr/sCXJYK9QSxKZaKktvVPOBc5zrLgvhj8tMJp2u73
	gNhS7Q08/FX1oZNzEUHql1hUrpC8xAeGwviw6gNRdracihQ/iK1v4Pmrcc1bspBjFis4bu
	1hzA1xwrg2rFyUZFS83m4bmNgBC0ZO8=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-636-JEXlemE1PGarO44emVxRtA-1; Tue, 27 May 2025 11:56:53 -0400
X-MC-Unique: JEXlemE1PGarO44emVxRtA-1
X-Mimecast-MFC-AGG-ID: JEXlemE1PGarO44emVxRtA_1748361412
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-43cf172ffe1so23982385e9.3
        for <alex.bennee@linaro.org>; Tue, 27 May 2025 08:56:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748361412; x=1748966212;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jZp4OkMS0wneelPodZb02GukKgjqxfQUF5cHCQf+gw8=;
        b=kLPx/D21D88xUoZe3R+ed9SyT+RwXNzfsNJCYxb9oz93kh6sPMKfBzHWtP446Awy0f
         zYBQ1aOxPZ0vcJcpYY+ONydPvIvNft5dfQ8Kt8rmPkDX98Ges/nJ1Nna+f0QzFQZa5e2
         4qtwPVniEonGNBBWf/BTq7u8CjxMitpiRbpIbpt2SNPDh4E97gSI0HDDJ7/a2BHfrxKH
         w1/gRqDlPFUxokIHc5+pZAXKbZo87AIz5LBMa+552S3tvHkTISPp81zhxhDSDiv9dNv2
         liQ6ddajYwEMDLsJEY2H2ICNGizuEMMgs1k4sxYFsg8uu9M1Pwdyp9GGsWVGP4fpMaIU
         Rtew==
X-Forwarded-Encrypted: i=1; AJvYcCWkIoTbAuXOP+vj1U3eSAB3qNwQqko1at2+5IfSP1L5XG9GSXs4hovpPOj4T2WklQrMufEHwYiuHzpZ9A==@linaro.org
X-Gm-Message-State: AOJu0YxfF2yh1iTmpkqm4O9Jqmg6G9LdVg5bOVGUyFR+5K4cQ7tYii6A
	X0N4gLFQUljm1hpIXqrhg37em1So6q+AkvV56jXtKoKfqQke59v5t+J1eiryY+pQN6rBma+H/i+
	o8ol/o+8GVu8VEmjnnbyJyQhFrPsy258BblUjRBbt0vkehJ1LgSHePnzoKQ==
X-Gm-Gg: ASbGncsPA3iQOIomtM8rdE3s3+UmjhvBkelCSsSHYkRS23ffQ84DvAm6h6+a5R4yw1L
	xXj7OGT8wintHV3BrAI8U2dK40E2xz2eUkx7PuAP8tcO2josDYGqVZBEtELoSrCQb6sLx/05jZK
	uE5ivvYQPpX9svI89KBbX1bavZfuTxIFolJygLfE05boJT1kfspjcBfj04WMiugFSyecIgaumKF
	i5trF4PdPjDHQhOEV8t8p4yCQlEuQg5x0368JPV4TFhDRmJy8c9cthM4LAq215XcqqkHQkTE7Lo
	kHeamBM4cfVwqMiyDKCs/fWPN1McMBCA
X-Received: by 2002:a05:600c:3505:b0:43d:fa59:be39 with SMTP id 5b1f17b1804b1-44c95aad969mr110281845e9.33.1748361411874;
        Tue, 27 May 2025 08:56:51 -0700 (PDT)
X-Received: by 2002:a05:600c:3505:b0:43d:fa59:be39 with SMTP id 5b1f17b1804b1-44c95aad969mr110281595e9.33.1748361411363;
        Tue, 27 May 2025 08:56:51 -0700 (PDT)
Return-Path: <imammedo@redhat.com>
Received: from imammedo.users.ipa.redhat.com ([85.93.96.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-447f3ce483bsm270077905e9.33.2025.05.27.08.56.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 May 2025 08:56:50 -0700 (PDT)
Date: Tue, 27 May 2025 17:56:49 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Cc: eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 peter.maydell@linaro.org, gustavo.romero@linaro.org, anisinha@redhat.com,
 mst@redhat.com, shannon.zhaosl@gmail.com, pbonzini@redhat.com,
 Jonathan.Cameron@huawei.com, philmd@linaro.org, alex.bennee@linaro.org
Subject: Re: [PATCH v2 22/25] hw/arm/virt: Let virt support pci
 hotplug/unplug GED event
Message-ID: <20250527175649.5d276bc8@imammedo.users.ipa.redhat.com>
In-Reply-To: <20250527074224.1197793-23-eric.auger@redhat.com>
References: <20250527074224.1197793-1-eric.auger@redhat.com>
	<20250527074224.1197793-23-eric.auger@redhat.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ms80PZYUqoqHPGesxxXckvX7d-BVd8KHZB_xvUnJ7AM_1748361412
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-TUID: X+hSO6NUbwaU

On Tue, 27 May 2025 09:40:24 +0200
Eric Auger <eric.auger@redhat.com> wrote:

> Set up the IO registers used to communicate between QEMU
> and ACPI.



> Move the create_pcie() call after the creation of the acpi
> ged device since hotplug callbacks will soon be called on gpex
> realize and will require the acpi pcihp state to be initialized.
> 
> The hacky thing is the root bus has not yet been created on
> acpi_pcihp_init() call so it is set later after the gpex realize.

can you elaborate on this, preferably with call expected call flows?

> How to fix this chicken & egg issue?
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> 
> ---
> 
> v1 -> v2:
> - use ACPI_PCIHP_REGION_NAME
> ---
>  include/hw/arm/virt.h    |  1 +
>  hw/arm/virt-acpi-build.c |  1 +
>  hw/arm/virt.c            | 42 +++++++++++++++++++++++++++++++++++-----
>  3 files changed, 39 insertions(+), 5 deletions(-)
> 
> diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
> index 1b2e2e1284..a4c4e3a67a 100644
> --- a/include/hw/arm/virt.h
> +++ b/include/hw/arm/virt.h
> @@ -35,6 +35,7 @@
>  #include "hw/boards.h"
>  #include "hw/arm/boot.h"
>  #include "hw/arm/bsa.h"
> +#include "hw/acpi/pcihp.h"
>  #include "hw/block/flash.h"
>  #include "system/kvm.h"
>  #include "hw/intc/arm_gicv3_common.h"
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index 9d88ffc318..cd49f67d60 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -44,6 +44,7 @@
>  #include "hw/acpi/generic_event_device.h"
>  #include "hw/acpi/tpm.h"
>  #include "hw/acpi/hmat.h"
> +#include "hw/acpi/pcihp.h"
>  #include "hw/pci/pcie_host.h"
>  #include "hw/pci/pci.h"
>  #include "hw/pci/pci_bus.h"
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 4aa40c8e8b..cdcff0a984 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -682,6 +682,8 @@ static inline DeviceState *create_acpi_ged(VirtMachineState *vms)
>  {
>      DeviceState *dev;
>      MachineState *ms = MACHINE(vms);
> +    SysBusDevice *sbdev;
> +
>      int irq = vms->irqmap[VIRT_ACPI_GED];
>      uint32_t event = ACPI_GED_PWR_DOWN_EVT;
>  
> @@ -693,12 +695,28 @@ static inline DeviceState *create_acpi_ged(VirtMachineState *vms)
>          event |= ACPI_GED_NVDIMM_HOTPLUG_EVT;
>      }
>  
> +    if (vms->acpi_pcihp) {
> +        event |= ACPI_GED_PCI_HOTPLUG_EVT;
> +    }
> +
>      dev = qdev_new(TYPE_ACPI_GED);
>      qdev_prop_set_uint32(dev, "ged-event", event);
> -    sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
> +    sbdev = SYS_BUS_DEVICE(dev);
> +    sysbus_realize_and_unref(sbdev, &error_fatal);
>  
> -    sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, vms->memmap[VIRT_ACPI_GED].base);
> -    sysbus_mmio_map(SYS_BUS_DEVICE(dev), 1, vms->memmap[VIRT_PCDIMM_ACPI].base);
> +    sysbus_mmio_map(sbdev, 0, vms->memmap[VIRT_ACPI_GED].base);
> +    sysbus_mmio_map(sbdev, 1, vms->memmap[VIRT_PCDIMM_ACPI].base);


Perhaps move out sbdev renaming into a separate patch, as it's not really related.

> +    if (vms->acpi_pcihp) {
> +        AcpiGedState *acpi_ged_state = ACPI_GED(dev);
> +        int i;
> +
> +        i = sysbus_mmio_map_name(sbdev, ACPI_PCIHP_REGION_NAME,
> +                                 vms->memmap[VIRT_ACPI_PCIHP].base);

I don't like mix of old way (index based) above and new name based mapping,
can we use the same, please?

> +        assert(i >= 0);
g_assert(sysbus_mmio_map_name...) to get more meaning-full crash
that is not compiled out.

> +        acpi_pcihp_init(OBJECT(dev), &acpi_ged_state->pcihp_state,
> +                        vms->bus, sysbus_mmio_get_region(sbdev, i), 0);

hmm, looks broken..
 region mapping must happen after acpi_pcihp_init().

if we after making sysbus_mmio_map() sane and easier to use
(which is a bit on tangent to this series).
We could feed sysbus owner device a memory map (ex: name based),
and then use [pre_]plug handlers on sysbus to map children
automatically.
That will alleviate need to do all mapping manually in every board.
(frankly speaking it deserves its own series, with tree wide cleanup).

As it is I'd use old index based approach like the rest.
(unless you feel adventurous about sysbus refactoring)


> +        acpi_ged_state->pcihp_state.use_acpi_hotplug_bridge = true;
> +    }
>      sysbus_connect_irq(SYS_BUS_DEVICE(dev), 0, qdev_get_gpio_in(vms->gic, irq));
>  
>      return dev;
> @@ -1758,6 +1776,13 @@ void virt_machine_done(Notifier *notifier, void *data)
>      pci_bus_add_fw_cfg_extra_pci_roots(vms->fw_cfg, vms->bus,
>                                         &error_abort);


> +
> +    if (vms->acpi_pcihp) {
> +        AcpiGedState *acpi_ged_state = ACPI_GED(vms->acpi_dev);
> +
> +        acpi_pcihp_reset(&acpi_ged_state->pcihp_state);
> +    }
> +
>      virt_acpi_setup(vms);
>      virt_build_smbios(vms);
>  }
> @@ -2395,8 +2420,6 @@ static void machvirt_init(MachineState *machine)
>  
>      create_rtc(vms);
>  
> -    create_pcie(vms);
> -
>      if (has_ged && aarch64 && firmware_loaded && virt_is_acpi_enabled(vms)) {
>          vms->acpi_pcihp &= !vmc->no_acpi_pcihp;
>          vms->acpi_dev = create_acpi_ged(vms);
> @@ -2405,6 +2428,15 @@ static void machvirt_init(MachineState *machine)
>          create_gpio_devices(vms, VIRT_GPIO, sysmem);
>      }
>  
> +    create_pcie(vms);
> +
> +    if (vms->acpi_dev) {
> +        AcpiGedState *acpi_ged_state = ACPI_GED(vms->acpi_dev);
> +
> +        acpi_ged_state = ACPI_GED(vms->acpi_dev);
> +        acpi_ged_state->pcihp_state.root = vms->bus;
> +    }
> +
>      if (vms->secure && !vmc->no_secure_gpio) {
>          create_gpio_devices(vms, VIRT_SECURE_GPIO, secure_sysmem);
>      }

I don't like pulling acpi_pcihp_init()/reset (and issues it causes) into board code,
on x86 it's a part of host bridge device model.
The same should apply to GED device.

The only thing board has to do is map regions into IO space like we do
everywhere else.

with current code, may be add link<pci_bus> property to GED,
and set it before GED realize in create_acpi_ged(),
then just follow existing sysbus_mmio_map() pattern.
