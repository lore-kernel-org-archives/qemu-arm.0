Received: by 2002:a05:7301:4085:b0:178:84eb:402c with SMTP id pt5csp887386dyb;
        Wed, 25 Jun 2025 07:21:29 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUNPkofTAneakTQOOuVQ2AIK/kfSHlH2PkypnQ9voD+oixGgjCZ3iHOCShbtiAsFFSK57kkfi1wxF+d1A==@linaro.org
X-Google-Smtp-Source: AGHT+IH7LYhS+B4O5mn7TPmr7xU2dIBe40AFMza5JI8OCPfWj660b+zW4V+cPJaBkspGt3qEW74w
X-Received: by 2002:ac8:598d:0:b0:4a5:912a:7c64 with SMTP id d75a77b69052e-4a7c07d4fc2mr49498751cf.30.1750861289434;
        Wed, 25 Jun 2025 07:21:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750861289; cv=none;
        d=google.com; s=arc-20240605;
        b=KX2679WPuQO6N8+5uyT3pwIu5vn+6oXSjxo7/Hife5fgEZKZReZ/GM6HqX1689wCbS
         txSii1U2MafYwINOtUncmxmmRXdMRs4PpNz+opfRv67BLr1r6U3IIXyTbcXslF/b3KUb
         iH5G6WvY9fgQNeuG17TfJS0Vfa//I0b01Zpw9afW2fExYnCUMcwxoVoeGeKeZdwxcRml
         FVcT6HpQ5Kwmze0pC1Uyr/R6u+8Y3+ZnoLNAPsU0PfBQgr8x4KsomCfgbEHgUnhofbmr
         Y9gx+/Ahi4Uiak9gMQkMuhjoqk8P5hGS6IKDV6ShftrI2T6tLtU4YHSegsi024nbxhYW
         2Mjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:reply-to:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=uLeoRO3qY2bDTFoaD7t9coh7zMYmVZ6hL7duH5Mrtmc=;
        fh=8htBJSiT/V/H5tEoae7f5gfYGQnHUknHvm2kGzcFJhQ=;
        b=HB8HuShK2XQO/5ihyUEvtKmU500u+GOgwhxREA6zFfSbeBVd809+qiZ7G5nY9WNtbJ
         wulhIqF6gsJGBkm0RuRBns4tCb905MFVjaqDDqhVI4jEFquwcb2bXNuj+I2qXrVJf9Q0
         VCB9R4/RIubb7tk1K4hydBws1GKqdvdZV3LKlOELV7mL4oFX8h4o6uTvmKHzdlFymyvt
         MIVtWA/ZkwSgvNgcT77GemwT7lHhUjXrW4u9iEsHYLBXAKjRghR1DdPbcMFy3/sB5Ykl
         GHkcuanIWlZbFDxZh+7nsfKWzTCQgrWCPLok0FFo6pkP2PtRde2y7Mg5nWWu8WzFjAY8
         rH/g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=P8bIh+TT;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id af79cd13be357-7d3f9a2a286si1221777885a.636.2025.06.25.07.21.29
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 07:21:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=P8bIh+TT;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750861289;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uLeoRO3qY2bDTFoaD7t9coh7zMYmVZ6hL7duH5Mrtmc=;
	b=P8bIh+TTbANvcHult5uJH+6d+/0xJTuOIUnTf6ivrnDZEka98NCJoQVqEvlpxh9YxvmCiI
	v7CD3p/SpKqVWCn0FSHoWs1RccYcy+mb2DY7oRGKnFHn2cgnWrC6A3Ug1tIwmHIFKS4jHW
	QseteB4T4Sxe7p58BmCztgvhcZc4DXo=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-318-j5HWYUaDP3ysEzALoWqpbA-1; Wed, 25 Jun 2025 10:21:27 -0400
X-MC-Unique: j5HWYUaDP3ysEzALoWqpbA-1
X-Mimecast-MFC-AGG-ID: j5HWYUaDP3ysEzALoWqpbA_1750861286
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-450d64026baso9916655e9.1
        for <alex.bennee@linaro.org>; Wed, 25 Jun 2025 07:21:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750861286; x=1751466086;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uLeoRO3qY2bDTFoaD7t9coh7zMYmVZ6hL7duH5Mrtmc=;
        b=jesskroLZZgk+rjqPBBxudJafEvsyQA8TNk6O+K8H4Az/wE/a4RdEimUPYZcKAbN7P
         k9XIOdcSqBsxcG3VVuqAYBtujiur0I7/kb/qjsjjUJnvy8I6pmtT3EoxThyXkzyyrJJZ
         /YRtzuSDbZkPXswZvhezIgeSZWC/7me8zVMhV0rdn//NqbRdHYMVfRIYnYr40V+u5L+O
         mC+lDsFA33r6PwbAPbudHnSYE+dI9DC7eM5CMa0QDTF7+EZ+slZhQnPDxKShJgGCZwW4
         rdI7SUaZqtDsI43VIF3pr43DEi7AzeSQFEhRZx2Btih8AAPd00AU5UkrVAWvWZLTf/dK
         Kf8g==
X-Forwarded-Encrypted: i=1; AJvYcCUxVzIzdRDJiJiiWoXMN8sWlDUUKcoSIbMoJs9TDgM4rcPqA+bnOl0s2YgQtPrQqGAqSPoPy8c6PO6/hQ==@linaro.org
X-Gm-Message-State: AOJu0Yy+QWYRrEfEOCOdb/t25wEF5lkNO4xfAApxg05vyM3uWsSSEPkc
	GXKnBzcKiUFwgu4xTekIKsRs3yKh0AayXzhnSlZ6UHg1HECHgO4hzwaVamRqaa4X6AB7vLaUpsO
	ftS/gFEpDA3hyMffiHYFmd6H5vNabCio8oNW1Hec65uhTvNjnKarVWohbxg==
X-Gm-Gg: ASbGncsFW1SylZhjFS5VT7/oRBICvd9yZc5DH4oJMN9R3eIX77Vf1S5KY0AbCMN39AJ
	qeXzVoiLfauu/8D/ojkkuOfYUQXXquAHMqhWS+cXpMzaVVen++PFArNylu5l6/M64mVPhuMUcyr
	Ew2RyERDP4t/5LmwRNuMvm94WXO460Oz1LLue19PdvEdbsKWYz0rG9MS1Fj/7CrfWe0sFbSNT8t
	XNR9DH6Id/bSd/w+xub+zHyLlzHR8OoijbKZ/ETlNO2rB2Ykc0DI+i0VFX3OukPCN75k1rIh8h4
	w6CpjyNzu6c9S9D2OBICN68Jy/PS60WFrt3I3sgU5BJDnETSqnsWt52AKySHXTjJ4TUFkA==
X-Received: by 2002:a05:600d:15a:10b0:442:e9eb:cb9e with SMTP id 5b1f17b1804b1-4538331236cmr14520815e9.26.1750861286123;
        Wed, 25 Jun 2025 07:21:26 -0700 (PDT)
X-Received: by 2002:a05:600d:15a:10b0:442:e9eb:cb9e with SMTP id 5b1f17b1804b1-4538331236cmr14520665e9.26.1750861285654;
        Wed, 25 Jun 2025 07:21:25 -0700 (PDT)
Return-Path: <eric.auger@redhat.com>
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874? ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4538235600csm21581305e9.20.2025.06.25.07.21.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Jun 2025 07:21:24 -0700 (PDT)
Message-ID: <8e82a2d3-514b-4d3f-9c62-26062d243135@redhat.com>
Date: Wed, 25 Jun 2025 16:21:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: eric.auger@redhat.com
Subject: Re: [PATCH v3 20/29] hw/acpi/ged: Prepare the device to react to PCI
 hotplug events
To: Igor Mammedov <imammedo@redhat.com>
Cc: eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 peter.maydell@linaro.org, gustavo.romero@linaro.org, anisinha@redhat.com,
 mst@redhat.com, shannon.zhaosl@gmail.com, pbonzini@redhat.com,
 Jonathan.Cameron@huawei.com, philmd@linaro.org, alex.bennee@linaro.org
References: <20250616094903.885753-1-eric.auger@redhat.com>
 <20250616094903.885753-21-eric.auger@redhat.com>
 <20250620145714.0923f6c0@fedora>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20250620145714.0923f6c0@fedora>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: gFDvc0asfp1fGgMwOeatqseXPHctwzzgyQb8wioTKi8_1750861286
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TUID: 95FW80rAiEF+



On 6/20/25 2:57 PM, Igor Mammedov wrote:
> On Mon, 16 Jun 2025 11:46:49 +0200
> Eric Auger <eric.auger@redhat.com> wrote:
>
>> QEMU will notify the OS about PCI hotplug/hotunplug events through
>> GED interrupts. Let the GED device handle a new PCI hotplug event.
>> On its occurrence it calls the \\_SB.PCI0.PCNT method with the BLCK
>> mutex held.
>>
>> The GED device uses a dedicated MMIO region that will be mapped
>> by the machine code.
>
>> At this point the GED still does not support PCI device hotplug in
>> its TYPE_HOTPLUG_HANDLER implementation. This will come in a
>> subsequent patch.
> looks out of order, perhaps it should be before this patch
done, swapped both patches.

Eric
>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>>
>> ---
>> v2 -> v3:
>> - pcihp_init and reset are put in ged code instead of machine code
>>   (Igor)
>>
>> v1 -> v2:
>> - Introduce ACPI_PCIHP_REGION_NAME
>> ---
>>  include/hw/acpi/generic_event_device.h |  4 ++++
>>  hw/acpi/generic_event_device.c         | 26 ++++++++++++++++++++++++++
>>  hw/acpi/pcihp.c                        |  1 -
>>  3 files changed, 30 insertions(+), 1 deletion(-)
>>
>> diff --git a/include/hw/acpi/generic_event_device.h b/include/hw/acpi/generic_event_device.h
>> index f5ffa67a39..ec8e1abe0a 100644
>> --- a/include/hw/acpi/generic_event_device.h
>> +++ b/include/hw/acpi/generic_event_device.h
>> @@ -102,6 +102,7 @@ OBJECT_DECLARE_SIMPLE_TYPE(AcpiGedState, ACPI_GED)
>>  #define ACPI_GED_PWR_DOWN_EVT      0x2
>>  #define ACPI_GED_NVDIMM_HOTPLUG_EVT 0x4
>>  #define ACPI_GED_CPU_HOTPLUG_EVT    0x8
>> +#define ACPI_GED_PCI_HOTPLUG_EVT    0x10
>>  
>>  typedef struct GEDState {
>>      MemoryRegion evt;
>> @@ -109,6 +110,8 @@ typedef struct GEDState {
>>      uint32_t     sel;
>>  } GEDState;
>>  
>> +#define ACPI_PCIHP_REGION_NAME "pcihp container"
>> +
>>  struct AcpiGedState {
>>      SysBusDevice parent_obj;
>>      MemHotplugState memhp_state;
>> @@ -116,6 +119,7 @@ struct AcpiGedState {
>>      CPUHotplugState cpuhp_state;
>>      MemoryRegion container_cpuhp;
>>      AcpiPciHpState pcihp_state;
>> +    MemoryRegion container_pcihp;
>>      GEDState ged_state;
>>      uint32_t ged_event_bitmap;
>>      qemu_irq irq;
>> diff --git a/hw/acpi/generic_event_device.c b/hw/acpi/generic_event_device.c
>> index ef1c1ec51f..b4eefb0106 100644
>> --- a/hw/acpi/generic_event_device.c
>> +++ b/hw/acpi/generic_event_device.c
>> @@ -12,6 +12,7 @@
>>  #include "qemu/osdep.h"
>>  #include "qapi/error.h"
>>  #include "hw/acpi/acpi.h"
>> +#include "hw/acpi/pcihp.h"
>>  #include "hw/acpi/generic_event_device.h"
>>  #include "hw/pci/pci.h"
>>  #include "hw/irq.h"
>> @@ -27,6 +28,7 @@ static const uint32_t ged_supported_events[] = {
>>      ACPI_GED_PWR_DOWN_EVT,
>>      ACPI_GED_NVDIMM_HOTPLUG_EVT,
>>      ACPI_GED_CPU_HOTPLUG_EVT,
>> +    ACPI_GED_PCI_HOTPLUG_EVT,
>>  };
>>  
>>  /*
>> @@ -122,6 +124,12 @@ void build_ged_aml(Aml *table, const char *name, HotplugHandler *hotplug_dev,
>>                             aml_notify(aml_name("\\_SB.NVDR"),
>>                                        aml_int(0x80)));
>>                  break;
>> +            case ACPI_GED_PCI_HOTPLUG_EVT:
>> +                aml_append(if_ctx,
>> +                           aml_acquire(aml_name("\\_SB.PCI0.BLCK"), 0xFFFF));
>> +                aml_append(if_ctx, aml_call0("\\_SB.PCI0.PCNT"));
>> +                aml_append(if_ctx, aml_release(aml_name("\\_SB.PCI0.BLCK")));
>> +                break;
>>              default:
>>                  /*
>>                   * Please make sure all the events in ged_supported_events[]
>> @@ -300,6 +308,8 @@ static void acpi_ged_send_event(AcpiDeviceIf *adev, AcpiEventStatusBits ev)
>>          sel = ACPI_GED_NVDIMM_HOTPLUG_EVT;
>>      } else if (ev & ACPI_CPU_HOTPLUG_STATUS) {
>>          sel = ACPI_GED_CPU_HOTPLUG_EVT;
>> +    } else if (ev & ACPI_PCI_HOTPLUG_STATUS) {
>> +        sel = ACPI_GED_PCI_HOTPLUG_EVT;
>>      } else {
>>          /* Unknown event. Return without generating interrupt. */
>>          warn_report("GED: Unsupported event %d. No irq injected", ev);
>> @@ -433,6 +443,12 @@ static void acpi_ged_realize(DeviceState *dev, Error **errp)
>>              cpu_hotplug_hw_init(&s->container_cpuhp, OBJECT(dev),
>>                                  &s->cpuhp_state, 0);
>>              break;
>> +        case ACPI_GED_PCI_HOTPLUG_EVT:
>> +            memory_region_init(&s->container_pcihp, OBJECT(dev),
>> +                               ACPI_PCIHP_REGION_NAME, ACPI_PCIHP_SIZE);
>> +            sysbus_init_mmio(sbd, &s->container_pcihp);
>> +            acpi_pcihp_init(OBJECT(s), &s->pcihp_state,
>> +                            s->pcihp_state.root, &s->container_pcihp, 0);
>>          }
>>          ged_events--;
>>      }
>> @@ -474,6 +490,15 @@ static void acpi_ged_initfn(Object *obj)
>>      sysbus_init_mmio(sbd, &ged_st->regs);
>>  }
>>  
>> +static void ged_reset(DeviceState *dev)
>> +{
>> +    AcpiGedState *s = ACPI_GED(dev);
>> +
>> +    if (s->pcihp_state.use_acpi_hotplug_bridge) {
>> +        acpi_pcihp_reset(&s->pcihp_state);
>> +    }
>> +}
>> +
>>  static void acpi_ged_class_init(ObjectClass *class, const void *data)
>>  {
>>      DeviceClass *dc = DEVICE_CLASS(class);
>> @@ -488,6 +513,7 @@ static void acpi_ged_class_init(ObjectClass *class, const void *data)
>>      hc->plug = acpi_ged_device_plug_cb;
>>      hc->unplug_request = acpi_ged_unplug_request_cb;
>>      hc->unplug = acpi_ged_unplug_cb;
>> +    device_class_set_legacy_reset(dc, ged_reset);
>>  
>>      adevc->ospm_status = acpi_ged_ospm_status;
>>      adevc->send_event = acpi_ged_send_event;
>> diff --git a/hw/acpi/pcihp.c b/hw/acpi/pcihp.c
>> index e79a24b821..36492aa0d9 100644
>> --- a/hw/acpi/pcihp.c
>> +++ b/hw/acpi/pcihp.c
>> @@ -43,7 +43,6 @@
>>  #include "qobject/qnum.h"
>>  #include "trace.h"
>>  
>> -#define ACPI_PCIHP_SIZE 0x0018
>>  #define PCI_UP_BASE 0x0000
>>  #define PCI_DOWN_BASE 0x0004
>>  #define PCI_EJ_BASE 0x0008
