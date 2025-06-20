Received: by 2002:a17:505:8ed0:b0:1be9:327d:8ee3 with SMTP id kh16csp868631njc;
        Fri, 20 Jun 2025 05:57:21 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVAYtyagFP29/I/f+w/QF2EPoKdWyIozLThErtkR893L6S2oILLFLnkg23QXS0fvK1IFncGTR9LusMgdQ==@linaro.org
X-Google-Smtp-Source: AGHT+IEAqu8P/kGCGQBN9qcFtoI08YpuaaAo1NmtigwM7ph2D+XrjwsJ8HZoMF1qK89TDQW/uhkf
X-Received: by 2002:a05:620a:c4a:b0:7d0:a096:cf80 with SMTP id af79cd13be357-7d3f9932d64mr420037185a.31.1750424241212;
        Fri, 20 Jun 2025 05:57:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750424241; cv=none;
        d=google.com; s=arc-20240605;
        b=eyoWBxzYqiMbW9vLwv1mjjQN3qVYwguHtHIaMNTRTe/1lKEP1OENtf/qMeTixGekyX
         ZXpSZywjDxJYyM6l2cnM11QGWxk9bBGniWw/dPTw4fko0w+8j/kIz4eMjUxDctQIUVw4
         u85n30jC8FskIMdb/vgXs7uNbrbMAzCddv+E26Jg7BQktJMYnkIK3XXrv8Aq5b40Dqjd
         QTEXgiQqoTDIk36PptCiiqF8JILRZuaazkPYig4jPwaVJxNkFuo+3nK/pfqOc+Dj4GWE
         W9OsGy13r1GNWG1S4TrhssXbfVVcN8hi6xPV/pZqHYgGr5mOknUJ5wxVZqTcavdAlyfZ
         cGOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:dkim-signature;
        bh=6ocXhnFoNE0SRads8qRr8AJf7z1hiUGAC5pHdUf3mp8=;
        fh=vNUyGDiQFYYBt1FgiN8ZSfPmY4m/m1sqTkaH68riiP8=;
        b=GjDhbEdt+nxGt1C7+iX5SHq9yDeAIkwlHxPRRAeuD4FWdMFhJDRIE8PHDM84/pmWui
         YUqlrZXqcql29VIaYi9LjP4e6pV5JWgH7neg77FfZsDgF45GTWvHYHrxPDY7OTyhxPQ1
         M1D9nDiwdH9/UvJjt/84s9j9ueKFVXoV71u62UxdF0ZbXz4b1ymX990wP9aTbID7jAMr
         LNpeZScF5EThgRDbdBTIuaBNQH/r3ZxGqOGQYPDE8wWnHDv1Sm528L5HPGGKgTrsGe6u
         9LK+6ewlwOO2OXqtZjDVYl3XjXxUs6azpmePVIW3MlMvqN0Gzmd8Jc1fywNupHrmoXnP
         J2tA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=FfFHnVJi;
       spf=pass (google.com: domain of imammedo@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=imammedo@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <imammedo@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id af79cd13be357-7d3f99e56c7si163121785a.237.2025.06.20.05.57.20
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jun 2025 05:57:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of imammedo@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=FfFHnVJi;
       spf=pass (google.com: domain of imammedo@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=imammedo@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750424240;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6ocXhnFoNE0SRads8qRr8AJf7z1hiUGAC5pHdUf3mp8=;
	b=FfFHnVJiIAl8sx4DUqwswVBjM7Kmd9N1wOTctHlZIe2Iw7S+iLtk/p/v00aPNGko/nx1FN
	TKM1sp0Qiv6b8pRweBtQwc/UEe+yPwZ+8nEnHwYWMASiGmsS71Tnbn/IXDWuvQy756BZ3T
	faYDN/n+skIDNvkdOM1jFKlVOHTP7U0=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-621-BhG9BrH4MxilRlmypoYusA-1; Fri, 20 Jun 2025 08:57:17 -0400
X-MC-Unique: BhG9BrH4MxilRlmypoYusA-1
X-Mimecast-MFC-AGG-ID: BhG9BrH4MxilRlmypoYusA_1750424236
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4535ad64d30so14648745e9.3
        for <alex.bennee@linaro.org>; Fri, 20 Jun 2025 05:57:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750424236; x=1751029036;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6ocXhnFoNE0SRads8qRr8AJf7z1hiUGAC5pHdUf3mp8=;
        b=bt/TCxmDHHzIQaq187nKiNFORmyiiGA+k3N3Pkia58KG0yNbdNjhLeP4+4h4BNqRIi
         JRINbjyWklId7TU7+xFR1+FF/jeOPWiVjx/i7M6adUu6BzXhI0n0aNIweUmARu7dT+Wq
         esu57VjYrsRr6vngiSv75xlIxoK5xjI1vkCJTSwVLFozEc9pxsHD/JNtTiT59dhDAxLZ
         aFzaGbpU1ynqDwk7RFb9pyLByB5uJOfP4J7xqipHZ7BmodUwiH3lUcJU11WkQT8eZpU6
         YYxa1QbjYr9pyZ1AbXi39r8FaUK2KNlzRnVSGVsB1w2is7rXxwnM1zVmD35reHILz6O5
         bWzQ==
X-Forwarded-Encrypted: i=1; AJvYcCWfGO2DqkJKnMhf5+9sgZeUrGfnZ3yrw8tNF3MzdTdYOuSxwqInZKaKLB0yw/DsGLiUVUjycZ8c/VbJ9A==@linaro.org
X-Gm-Message-State: AOJu0YyZ1ZVOE8/j+2cRwfHg7cfpqwOdERif6T3MaeIsRg6hpIuHqFr+
	mRVNnY7NudOAeavfeDRLh6xQVQK35hGRLLU5e5sxk7o+QzrDq3aDsxCWgeSHhxD5QftwoPxMOz9
	dZtogbfXu9TgYUjiQaUHmic8mi4KzOsew4ZZSxv4nnXtedHiLc3ur6hxcNQ==
X-Gm-Gg: ASbGncvJ2vDg/hvUQjTkYuGmAdI+zSR+xKR/EC7/jmGHAfWXzNEMg/jmnJL299oU6Me
	vFX1P4YnVsm6zkKUn2o0XjRUSPj5qsylsCiOnnL/FeiB60YMr0Es/C4GscOuy5TkoElZchPZyp2
	vLVmZ82W7F262T3Pl6LDhTt7/Xay+Zc7J8MvJABocgHqA64AmQWB1tzIEH2Xc6XUKEUyedj+qT3
	iy/d/GX5GC/OdcmtKGwKHgz35Ic59D5s2tghoCstfXhHn9BUsr682MflNSGdLUMB3AGadpXqC3S
	HP7JW/Ks9Wj7
X-Received: by 2002:a05:6000:18ae:b0:3a4:e7b7:3851 with SMTP id ffacd0b85a97d-3a6d12fc225mr2304222f8f.58.1750424236344;
        Fri, 20 Jun 2025 05:57:16 -0700 (PDT)
X-Received: by 2002:a05:6000:18ae:b0:3a4:e7b7:3851 with SMTP id ffacd0b85a97d-3a6d12fc225mr2304203f8f.58.1750424235903;
        Fri, 20 Jun 2025 05:57:15 -0700 (PDT)
Return-Path: <imammedo@redhat.com>
Received: from fedora ([85.93.96.130])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6d1187ef4sm2031806f8f.68.2025.06.20.05.57.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jun 2025 05:57:15 -0700 (PDT)
Date: Fri, 20 Jun 2025 14:57:14 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Cc: eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 peter.maydell@linaro.org, gustavo.romero@linaro.org, anisinha@redhat.com,
 mst@redhat.com, shannon.zhaosl@gmail.com, pbonzini@redhat.com,
 Jonathan.Cameron@huawei.com, philmd@linaro.org, alex.bennee@linaro.org
Subject: Re: [PATCH v3 20/29] hw/acpi/ged: Prepare the device to react to
 PCI hotplug events
Message-ID: <20250620145714.0923f6c0@fedora>
In-Reply-To: <20250616094903.885753-21-eric.auger@redhat.com>
References: <20250616094903.885753-1-eric.auger@redhat.com>
	<20250616094903.885753-21-eric.auger@redhat.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: tJCxDoOnHhfLl2dleUSewC6hTrcokdyzYj9yY1xgqeA_1750424236
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-TUID: fTpA8ttyb8m0

On Mon, 16 Jun 2025 11:46:49 +0200
Eric Auger <eric.auger@redhat.com> wrote:

> QEMU will notify the OS about PCI hotplug/hotunplug events through
> GED interrupts. Let the GED device handle a new PCI hotplug event.
> On its occurrence it calls the \\_SB.PCI0.PCNT method with the BLCK
> mutex held.
> 
> The GED device uses a dedicated MMIO region that will be mapped
> by the machine code.


> At this point the GED still does not support PCI device hotplug in
> its TYPE_HOTPLUG_HANDLER implementation. This will come in a
> subsequent patch.

looks out of order, perhaps it should be before this patch

> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> 
> ---
> v2 -> v3:
> - pcihp_init and reset are put in ged code instead of machine code
>   (Igor)
> 
> v1 -> v2:
> - Introduce ACPI_PCIHP_REGION_NAME
> ---
>  include/hw/acpi/generic_event_device.h |  4 ++++
>  hw/acpi/generic_event_device.c         | 26 ++++++++++++++++++++++++++
>  hw/acpi/pcihp.c                        |  1 -
>  3 files changed, 30 insertions(+), 1 deletion(-)
> 
> diff --git a/include/hw/acpi/generic_event_device.h b/include/hw/acpi/generic_event_device.h
> index f5ffa67a39..ec8e1abe0a 100644
> --- a/include/hw/acpi/generic_event_device.h
> +++ b/include/hw/acpi/generic_event_device.h
> @@ -102,6 +102,7 @@ OBJECT_DECLARE_SIMPLE_TYPE(AcpiGedState, ACPI_GED)
>  #define ACPI_GED_PWR_DOWN_EVT      0x2
>  #define ACPI_GED_NVDIMM_HOTPLUG_EVT 0x4
>  #define ACPI_GED_CPU_HOTPLUG_EVT    0x8
> +#define ACPI_GED_PCI_HOTPLUG_EVT    0x10
>  
>  typedef struct GEDState {
>      MemoryRegion evt;
> @@ -109,6 +110,8 @@ typedef struct GEDState {
>      uint32_t     sel;
>  } GEDState;
>  
> +#define ACPI_PCIHP_REGION_NAME "pcihp container"
> +
>  struct AcpiGedState {
>      SysBusDevice parent_obj;
>      MemHotplugState memhp_state;
> @@ -116,6 +119,7 @@ struct AcpiGedState {
>      CPUHotplugState cpuhp_state;
>      MemoryRegion container_cpuhp;
>      AcpiPciHpState pcihp_state;
> +    MemoryRegion container_pcihp;
>      GEDState ged_state;
>      uint32_t ged_event_bitmap;
>      qemu_irq irq;
> diff --git a/hw/acpi/generic_event_device.c b/hw/acpi/generic_event_device.c
> index ef1c1ec51f..b4eefb0106 100644
> --- a/hw/acpi/generic_event_device.c
> +++ b/hw/acpi/generic_event_device.c
> @@ -12,6 +12,7 @@
>  #include "qemu/osdep.h"
>  #include "qapi/error.h"
>  #include "hw/acpi/acpi.h"
> +#include "hw/acpi/pcihp.h"
>  #include "hw/acpi/generic_event_device.h"
>  #include "hw/pci/pci.h"
>  #include "hw/irq.h"
> @@ -27,6 +28,7 @@ static const uint32_t ged_supported_events[] = {
>      ACPI_GED_PWR_DOWN_EVT,
>      ACPI_GED_NVDIMM_HOTPLUG_EVT,
>      ACPI_GED_CPU_HOTPLUG_EVT,
> +    ACPI_GED_PCI_HOTPLUG_EVT,
>  };
>  
>  /*
> @@ -122,6 +124,12 @@ void build_ged_aml(Aml *table, const char *name, HotplugHandler *hotplug_dev,
>                             aml_notify(aml_name("\\_SB.NVDR"),
>                                        aml_int(0x80)));
>                  break;
> +            case ACPI_GED_PCI_HOTPLUG_EVT:
> +                aml_append(if_ctx,
> +                           aml_acquire(aml_name("\\_SB.PCI0.BLCK"), 0xFFFF));
> +                aml_append(if_ctx, aml_call0("\\_SB.PCI0.PCNT"));
> +                aml_append(if_ctx, aml_release(aml_name("\\_SB.PCI0.BLCK")));
> +                break;
>              default:
>                  /*
>                   * Please make sure all the events in ged_supported_events[]
> @@ -300,6 +308,8 @@ static void acpi_ged_send_event(AcpiDeviceIf *adev, AcpiEventStatusBits ev)
>          sel = ACPI_GED_NVDIMM_HOTPLUG_EVT;
>      } else if (ev & ACPI_CPU_HOTPLUG_STATUS) {
>          sel = ACPI_GED_CPU_HOTPLUG_EVT;
> +    } else if (ev & ACPI_PCI_HOTPLUG_STATUS) {
> +        sel = ACPI_GED_PCI_HOTPLUG_EVT;
>      } else {
>          /* Unknown event. Return without generating interrupt. */
>          warn_report("GED: Unsupported event %d. No irq injected", ev);
> @@ -433,6 +443,12 @@ static void acpi_ged_realize(DeviceState *dev, Error **errp)
>              cpu_hotplug_hw_init(&s->container_cpuhp, OBJECT(dev),
>                                  &s->cpuhp_state, 0);
>              break;
> +        case ACPI_GED_PCI_HOTPLUG_EVT:
> +            memory_region_init(&s->container_pcihp, OBJECT(dev),
> +                               ACPI_PCIHP_REGION_NAME, ACPI_PCIHP_SIZE);
> +            sysbus_init_mmio(sbd, &s->container_pcihp);
> +            acpi_pcihp_init(OBJECT(s), &s->pcihp_state,
> +                            s->pcihp_state.root, &s->container_pcihp, 0);
>          }
>          ged_events--;
>      }
> @@ -474,6 +490,15 @@ static void acpi_ged_initfn(Object *obj)
>      sysbus_init_mmio(sbd, &ged_st->regs);
>  }
>  
> +static void ged_reset(DeviceState *dev)
> +{
> +    AcpiGedState *s = ACPI_GED(dev);
> +
> +    if (s->pcihp_state.use_acpi_hotplug_bridge) {
> +        acpi_pcihp_reset(&s->pcihp_state);
> +    }
> +}
> +
>  static void acpi_ged_class_init(ObjectClass *class, const void *data)
>  {
>      DeviceClass *dc = DEVICE_CLASS(class);
> @@ -488,6 +513,7 @@ static void acpi_ged_class_init(ObjectClass *class, const void *data)
>      hc->plug = acpi_ged_device_plug_cb;
>      hc->unplug_request = acpi_ged_unplug_request_cb;
>      hc->unplug = acpi_ged_unplug_cb;
> +    device_class_set_legacy_reset(dc, ged_reset);
>  
>      adevc->ospm_status = acpi_ged_ospm_status;
>      adevc->send_event = acpi_ged_send_event;
> diff --git a/hw/acpi/pcihp.c b/hw/acpi/pcihp.c
> index e79a24b821..36492aa0d9 100644
> --- a/hw/acpi/pcihp.c
> +++ b/hw/acpi/pcihp.c
> @@ -43,7 +43,6 @@
>  #include "qobject/qnum.h"
>  #include "trace.h"
>  
> -#define ACPI_PCIHP_SIZE 0x0018
>  #define PCI_UP_BASE 0x0000
>  #define PCI_DOWN_BASE 0x0004
>  #define PCI_EJ_BASE 0x0008
