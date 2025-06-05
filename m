Received: by 2002:a17:505:6015:b0:1be9:327d:8ee3 with SMTP id us21csp355687njc;
        Thu, 5 Jun 2025 09:03:35 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVJ1cCuPfkOWnnWB2OMVKncE42+zqj2HEhlFVpd2NcWT2SkmT9hfG5ChNWFnwFJv5CCFvs4iiUAwHngcA==@linaro.org
X-Google-Smtp-Source: AGHT+IFP0sRJ3FkqEGKaGZZGlGJ4Vgbq7GpC6HTanOKid63bVSvpqlKFuaZ6YsOYOSOMUxCwT/Im
X-Received: by 2002:a05:600c:6303:b0:43c:fe5e:f040 with SMTP id 5b1f17b1804b1-451f0f9ec69mr61440535e9.23.1749139415460;
        Thu, 05 Jun 2025 09:03:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1749139415; cv=none;
        d=google.com; s=arc-20240605;
        b=exeT2IpAs5UWPXXvFVXjGAPXsjTLC0aTOqCAfwrziD8caL2AqAf4xsleK6Yfl/KqQr
         ntmWysaAmOf46ral6TT+yHJ0JixVwxbtgnkW8BZ8M0bKOTMVYeYdBIWcqPrZIvM72Oo1
         Qrmgs5rJqoSQIztAWwo7BTlrCEUG740PVEcJznt8gRjRXoMY3aJJXj8+4iSjhB917cCR
         JtquMUcFbuuLqUGqSUufuADjsEvSvqFoDSn/yClqJ0PES6FjYWVZ8fLHvC+1EjsCxSCH
         eY3K1fiYa2NGrXBCsaRjKVThxuiEEB3Vns2z8BMxgCls1YK819u8qba0182SWtpaWybA
         bKyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:reply-to:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=vpxcJXJD2OVkYSw//Lct0oi72pWItr3EG5hpSDwem38=;
        fh=ThfiCI0OcvSwlcuB3J/dmLpYbHk134La9Wu8hPC6P6Q=;
        b=O7VxHciOO6akaQQN4pwQwjnnyo7CHv7zurNvgwbLCgThhxpMQiobqN6/jRj4pYPESd
         RYTLjxHDRfFXTYiBpw/Zx1u1lRAtb6/Uvpy1x08mnXa9+4tQbdwaX4DS/y9Ogt+ONBvX
         mci6555LJP9fBV+hR2snL8ppvJanUivjkfWwwhGKaXsE8PLc2K90iaI5MpG4b+yisNm+
         6CpByOBYjUCZuv/AwqKwMbp0YrkUVYbZWseUDk5ttd5nAiSRQJnOespRfj2k0E4i4Nm2
         OKCCb/JTlpfjX/VoJs3SXSxUeiHg0ng8ev/Lpu8jUcJVVmMAyXmoLVqzHNxdOnoPbDDh
         wW4g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=UoozY11h;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id ffacd0b85a97d-3a4f00952e4si12823813f8f.680.2025.06.05.09.03.34
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jun 2025 09:03:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=UoozY11h;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749139414;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vpxcJXJD2OVkYSw//Lct0oi72pWItr3EG5hpSDwem38=;
	b=UoozY11hVOxahBwF6N38tToYqBfarulaaBSbJL0ve/xoEQuW3wGxYoB16guR4X2uIIhwUd
	18VUB4MXvdtwA++8UN51C32VzfBYe3bGilfk969wWEKGZdEgAyX+1JDRMtbn8jc9YTYUxs
	CZ4O97oSLjuVQvx5mBKQ59qSsySePOI=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-440-adxdeZVPN1WIG2KWfwIUag-1; Thu, 05 Jun 2025 12:03:33 -0400
X-MC-Unique: adxdeZVPN1WIG2KWfwIUag-1
X-Mimecast-MFC-AGG-ID: adxdeZVPN1WIG2KWfwIUag_1749139412
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-3a4eee2398bso549973f8f.1
        for <alex.bennee@linaro.org>; Thu, 05 Jun 2025 09:03:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749139412; x=1749744212;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vpxcJXJD2OVkYSw//Lct0oi72pWItr3EG5hpSDwem38=;
        b=IpRogggyPwOGmrbKQG2WM3c+xfzjT2mWjrIsdxWoPHcr4mHVsuzi2mQTb1n4z7+FuY
         Ofjpbm/FnPfZJ127PljKRuoK+ofrZYw/3Xd5HjiK6+mblfu43gtGgN8JSneEM6kfry8t
         symyDc+EVtMDX/FLp6b/p/ot+6qLha78psXvTNfvEfszZBs7vrxE/mob+5r9/BzizWAZ
         HWXivuyvkXi23p6QmkwPnGzGjsIrY6cxbiExQ2ZdithqJjVpgyqRRFY7GwUMLAit69q+
         LelbnKfMpgPoMWjORwIjbHkeKeV9z4yD3dgTfngXDsHxOynfIEOHAcS6h3kI3N9d/WIK
         /p4g==
X-Forwarded-Encrypted: i=1; AJvYcCVAhlFHy0zW39EhXvb0myEGlQs/phVkBsJkYjR3EYpWCbsN2vlJMVVUX8A3vJDKKQFiOCWQVj4JL5KsTA==@linaro.org
X-Gm-Message-State: AOJu0YwrlibzSlavYlkcYGut9Od2JVbOVSnEXfeYuwf0ypTzzTAe9KnW
	ua2MpOM9cy0Gl2APomldefgvZHX9yp82JR+cAoH3h67o/B08mWVXEPBsS/LKq5KDCM1Zj+hL7Lm
	9HvmDQTtSeyp04JsNTSxeW/kzoqJOkdetY9zPM3Ig+xxCH87e/0Vpq0xQbQ==
X-Gm-Gg: ASbGncvB84X5ynRwaAYdamDbAFhz2CE7Y5p0ORN6h3XiGycM+AfimsEs9BuivVOn9Vp
	xRs2YQwb/AF2oaSu+F8M/gdZThWMAIFlLw0D1YiOmsa4Bg5iJ30kmtgcr+3edCTStmEl22MDJ0W
	ub1MnSjEhrhq+Jw+ANzNvgkUe30Y+vOTjUryv7yzPsLEiuvJBeLAGuAMoFBdvUqbdHnTFUcSeR9
	rFEhLuX+vXEyev1fh4SEyCSI0amjza55K2T5k0n9+Y59mUnfceDIoQLcxPtgGJfybwx9qyj3HhD
	TqIHIa7GCB8Ote7JBE7GHNQsnTrZriuj5LDHTmkAXKv3W9grVX3/1PXMYNU=
X-Received: by 2002:a05:6000:2283:b0:3a4:d0dc:184d with SMTP id ffacd0b85a97d-3a51dbe35c8mr6876592f8f.27.1749139411383;
        Thu, 05 Jun 2025 09:03:31 -0700 (PDT)
X-Received: by 2002:a05:6000:2283:b0:3a4:d0dc:184d with SMTP id ffacd0b85a97d-3a51dbe35c8mr6876505f8f.27.1749139410706;
        Thu, 05 Jun 2025 09:03:30 -0700 (PDT)
Return-Path: <eric.auger@redhat.com>
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874? ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4f00972c1sm25267821f8f.68.2025.06.05.09.03.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Jun 2025 09:03:29 -0700 (PDT)
Message-ID: <2f022797-1288-4ad0-a7b1-56c5fb674572@redhat.com>
Date: Thu, 5 Jun 2025 18:03:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: eric.auger@redhat.com
Subject: Re: [PATCH v2 14/25] hw/i386/acpi-build: Move
 build_append_pci_bus_devices/pcihp_slots to pcihp
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 peter.maydell@linaro.org, imammedo@redhat.com, gustavo.romero@linaro.org,
 anisinha@redhat.com, mst@redhat.com, shannon.zhaosl@gmail.com,
 pbonzini@redhat.com, philmd@linaro.org, alex.bennee@linaro.org
References: <20250527074224.1197793-1-eric.auger@redhat.com>
 <20250527074224.1197793-15-eric.auger@redhat.com>
 <20250530112422.0000376e@huawei.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20250530112422.0000376e@huawei.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: cywRyDtprdE68FqCc0AcSemnUJ8fxnk9umTRJw66oOY_1749139412
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TUID: NmnSntZWinKS

Hi Jonathan,
On 5/30/25 12:24 PM, Jonathan Cameron wrote:
> On Tue, 27 May 2025 09:40:16 +0200
> Eric Auger <eric.auger@redhat.com> wrote:
>
>> We intend to reuse build_append_pci_bus_devices and
>> build_append_pcihp_slots on ARM. So let's move them to
>> hw/acpi/pcihp.c as well as all static helpers they
>> use.
> Oddly short wrap.   I guess it kind of looks prettier than ...
>
> We intend to reuse build_append_pci_bus_devices and
> build_append_pcihp_slots on ARM. So let's move them to hw/acpi/pcihp.c as 
> well as all static helpers they use.
>
>
> ... so I'm not that fussed.

Effectively I can change this layout.
>
> I don't really mind, but maybe a short statement of why you
> put the functions in a different order in the destination
> would be a good thing to add to this description?

My bad, there is no need to change the order of functions when moving.
I guess I noticed incrementally which ones were needed and I did not pay
attention to their original order. Now fixed.

Thanks!

Eric
>
> Either way
> Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
>
>> No functional change intended.
>>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>> Reviewed-by: Gustavo Romero <gustavo.romero@linaro.org>
>> ---
>>  include/hw/acpi/pci.h   |   1 -
>>  include/hw/acpi/pcihp.h |   2 +
>>  hw/acpi/pcihp.c         | 173 ++++++++++++++++++++++++++++++++++++++++
>>  hw/i386/acpi-build.c    | 172 ---------------------------------------
>>  4 files changed, 175 insertions(+), 173 deletions(-)
>>
>> diff --git a/include/hw/acpi/pci.h b/include/hw/acpi/pci.h
>> index ab0187a894..4dca22c0e2 100644
>> --- a/include/hw/acpi/pci.h
>> +++ b/include/hw/acpi/pci.h
>> @@ -37,7 +37,6 @@ typedef struct AcpiMcfgInfo {
>>  void build_mcfg(GArray *table_data, BIOSLinker *linker, AcpiMcfgInfo *info,
>>                  const char *oem_id, const char *oem_table_id);
>>  
>> -void build_append_pci_bus_devices(Aml *parent_scope, PCIBus *bus);
>>  void build_pci_bridge_aml(AcpiDevAmlIf *adev, Aml *scope);
>>  
>>  void build_srat_generic_affinity_structures(GArray *table_data);
>> diff --git a/include/hw/acpi/pcihp.h b/include/hw/acpi/pcihp.h
>> index f4fd44cb32..5506a58862 100644
>> --- a/include/hw/acpi/pcihp.h
>> +++ b/include/hw/acpi/pcihp.h
>> @@ -80,6 +80,8 @@ void build_append_pcihp_resources(Aml *table,
>>                                    uint64_t io_addr, uint64_t io_len);
>>  bool build_append_notification_callback(Aml *parent_scope, const PCIBus *bus);
>>  
>> +void build_append_pci_bus_devices(Aml *parent_scope, PCIBus *bus);
>> +
>>  /* Called on reset */
>>  void acpi_pcihp_reset(AcpiPciHpState *s);
>>  
>> diff --git a/hw/acpi/pcihp.c b/hw/acpi/pcihp.c
>> index 907a08ac7f..942669ea89 100644
>> --- a/hw/acpi/pcihp.c
>> +++ b/hw/acpi/pcihp.c
>> @@ -27,6 +27,7 @@
>>  #include "qemu/osdep.h"
>>  #include "hw/acpi/pcihp.h"
>>  #include "hw/acpi/aml-build.h"
>> +#include "hw/acpi/acpi_aml_interface.h"
>>  #include "hw/pci-host/i440fx.h"
>>  #include "hw/pci/pci.h"
>>  #include "hw/pci/pci_bridge.h"
>> @@ -763,6 +764,178 @@ bool build_append_notification_callback(Aml *parent_scope, const PCIBus *bus)
>>      return !!nr_notifiers;
>>  }
>>  
>> +static void build_append_pcihp_notify_entry(Aml *method, int slot)
>> +{
>> +    Aml *if_ctx;
>> +    int32_t devfn = PCI_DEVFN(slot, 0);
>> +
>> +    if_ctx = aml_if(aml_and(aml_arg(0), aml_int(0x1U << slot), NULL));
>> +    aml_append(if_ctx, aml_notify(aml_name("S%.02X", devfn), aml_arg(1)));
>> +    aml_append(method, if_ctx);
>> +}
>> +
>> +static bool is_devfn_ignored_generic(const int devfn, const PCIBus *bus)
>> +{
>> +    const PCIDevice *pdev = bus->devices[devfn];
>> +
>> +    if (PCI_FUNC(devfn)) {
>> +        if (IS_PCI_BRIDGE(pdev)) {
>> +            /*
>> +             * Ignore only hotplugged PCI bridges on !0 functions, but
>> +             * allow describing cold plugged bridges on all functions
>> +             */
>> +            if (DEVICE(pdev)->hotplugged) {
>> +                return true;
>> +            }
>> +        }
>> +    }
>> +    return false;
>> +}
>> +
>> +static bool is_devfn_ignored_hotplug(const int devfn, const PCIBus *bus)
>> +{
>> +    PCIDevice *pdev = bus->devices[devfn];
>> +    if (pdev) {
>> +        return is_devfn_ignored_generic(devfn, bus) ||
>> +               !DEVICE_GET_CLASS(pdev)->hotpluggable ||
>> +               /* Cold plugged bridges aren't themselves hot-pluggable */
>> +               (IS_PCI_BRIDGE(pdev) && !DEVICE(pdev)->hotplugged);
>> +    } else { /* non populated slots */
>> +         /*
>> +          * hotplug is supported only for non-multifunction device
>> +          * so generate device description only for function 0
>> +          */
>> +        if (PCI_FUNC(devfn) ||
>> +            (pci_bus_is_express(bus) && PCI_SLOT(devfn) > 0)) {
>> +            return true;
>> +        }
>> +    }
>> +    return false;
>> +}
>> +
>> +static Aml *aml_pci_static_endpoint_dsm(PCIDevice *pdev)
>> +{
>> +    Aml *method;
>> +
>> +    g_assert(pdev->acpi_index != 0);
>> +    method = aml_method("_DSM", 4, AML_SERIALIZED);
>> +    {
>> +        Aml *params = aml_local(0);
>> +        Aml *pkg = aml_package(1);
>> +        aml_append(pkg, aml_int(pdev->acpi_index));
>> +        aml_append(method, aml_store(pkg, params));
>> +        aml_append(method,
>> +            aml_return(aml_call5("EDSM", aml_arg(0), aml_arg(1),
>> +                                 aml_arg(2), aml_arg(3), params))
>> +        );
>> +    }
>> +    return method;
>> +}
>> +
>> +static Aml *aml_pci_device_dsm(void)
>> +{
>> +    Aml *method;
>> +
>> +    method = aml_method("_DSM", 4, AML_SERIALIZED);
>> +    {
>> +        Aml *params = aml_local(0);
>> +        Aml *pkg = aml_package(2);
>> +        aml_append(pkg, aml_int(0));
>> +        aml_append(pkg, aml_int(0));
>> +        aml_append(method, aml_store(pkg, params));
>> +        aml_append(method,
>> +            aml_store(aml_name("BSEL"), aml_index(params, aml_int(0))));
>> +        aml_append(method,
>> +            aml_store(aml_name("ASUN"), aml_index(params, aml_int(1))));
>> +        aml_append(method,
>> +            aml_return(aml_call5("PDSM", aml_arg(0), aml_arg(1),
>> +                                 aml_arg(2), aml_arg(3), params))
>> +        );
>> +    }
>> +    return method;
>> +}
>> +
>> +void build_append_pcihp_slots(Aml *parent_scope, PCIBus *bus)
>> +{
>> +    int devfn;
>> +    Aml *dev, *notify_method = NULL, *method;
>> +    QObject *bsel = object_property_get_qobject(OBJECT(bus),
>> +                        ACPI_PCIHP_PROP_BSEL, NULL);
>> +    uint64_t bsel_val = qnum_get_uint(qobject_to(QNum, bsel));
>> +    qobject_unref(bsel);
>> +
>> +    aml_append(parent_scope, aml_name_decl("BSEL", aml_int(bsel_val)));
>> +    notify_method = aml_method("DVNT", 2, AML_NOTSERIALIZED);
>> +
>> +    for (devfn = 0; devfn < ARRAY_SIZE(bus->devices); devfn++) {
>> +        int slot = PCI_SLOT(devfn);
>> +        int adr = slot << 16 | PCI_FUNC(devfn);
>> +
>> +        if (is_devfn_ignored_hotplug(devfn, bus)) {
>> +            continue;
>> +        }
>> +
>> +        if (bus->devices[devfn]) {
>> +            dev = aml_scope("S%.02X", devfn);
>> +        } else {
>> +            dev = aml_device("S%.02X", devfn);
>> +            aml_append(dev, aml_name_decl("_ADR", aml_int(adr)));
>> +        }
>> +
>> +        /*
>> +         * Can't declare _SUN here for every device as it changes 'slot'
>> +         * enumeration order in linux kernel, so use another variable for it
>> +         */
>> +        aml_append(dev, aml_name_decl("ASUN", aml_int(slot)));
>> +        aml_append(dev, aml_pci_device_dsm());
>> +
>> +        aml_append(dev, aml_name_decl("_SUN", aml_int(slot)));
>> +        /* add _EJ0 to make slot hotpluggable  */
>> +        method = aml_method("_EJ0", 1, AML_NOTSERIALIZED);
>> +        aml_append(method,
>> +            aml_call2("PCEJ", aml_name("BSEL"), aml_name("_SUN"))
>> +        );
>> +        aml_append(dev, method);
>> +
>> +        build_append_pcihp_notify_entry(notify_method, slot);
>> +
>> +        /* device descriptor has been composed, add it into parent context */
>> +        aml_append(parent_scope, dev);
>> +    }
>> +    aml_append(parent_scope, notify_method);
>> +}
>> +
>> +void build_append_pci_bus_devices(Aml *parent_scope, PCIBus *bus)
>> +{
>> +    int devfn;
>> +    Aml *dev;
>> +
>> +    for (devfn = 0; devfn < ARRAY_SIZE(bus->devices); devfn++) {
>> +        /* ACPI spec: 1.0b: Table 6-2 _ADR Object Bus Types, PCI type */
>> +        int adr = PCI_SLOT(devfn) << 16 | PCI_FUNC(devfn);
>> +        PCIDevice *pdev = bus->devices[devfn];
>> +
>> +        if (!pdev || is_devfn_ignored_generic(devfn, bus)) {
>> +            continue;
>> +        }
>> +
>> +        /* start to compose PCI device descriptor */
>> +        dev = aml_device("S%.02X", devfn);
>> +        aml_append(dev, aml_name_decl("_ADR", aml_int(adr)));
>> +
>> +        call_dev_aml_func(DEVICE(bus->devices[devfn]), dev);
>> +        /* add _DSM if device has acpi-index set */
>> +        if (pdev->acpi_index &&
>> +            !object_property_get_bool(OBJECT(pdev), "hotpluggable",
>> +                                      &error_abort)) {
>> +            aml_append(dev, aml_pci_static_endpoint_dsm(pdev));
>> +        }
>> +
>> +        /* device descriptor has been composed, add it into parent context */
>> +        aml_append(parent_scope, dev);
>> +    }
>> +}
>> +
>>  const VMStateDescription vmstate_acpi_pcihp_pci_status = {
>>      .name = "acpi_pcihp_pci_status",
>>      .version_id = 1,
>> diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
>> index 3275675e60..fe8bc62c03 100644
>> --- a/hw/i386/acpi-build.c
>> +++ b/hw/i386/acpi-build.c
>> @@ -338,29 +338,6 @@ build_facs(GArray *table_data)
>>      g_array_append_vals(table_data, reserved, 40); /* Reserved */
>>  }
>>  
>> -static Aml *aml_pci_device_dsm(void)
>> -{
>> -    Aml *method;
>> -
>> -    method = aml_method("_DSM", 4, AML_SERIALIZED);
>> -    {
>> -        Aml *params = aml_local(0);
>> -        Aml *pkg = aml_package(2);
>> -        aml_append(pkg, aml_int(0));
>> -        aml_append(pkg, aml_int(0));
>> -        aml_append(method, aml_store(pkg, params));
>> -        aml_append(method,
>> -            aml_store(aml_name("BSEL"), aml_index(params, aml_int(0))));
>> -        aml_append(method,
>> -            aml_store(aml_name("ASUN"), aml_index(params, aml_int(1))));
>> -        aml_append(method,
>> -            aml_return(aml_call5("PDSM", aml_arg(0), aml_arg(1),
>> -                                 aml_arg(2), aml_arg(3), params))
>> -        );
>> -    }
>> -    return method;
>> -}
>> -
>>  static Aml *aml_pci_edsm(void)
>>  {
>>      Aml *method, *ifctx;
>> @@ -414,155 +391,6 @@ static Aml *aml_pci_edsm(void)
>>      return method;
>>  }
>>  
>> -static Aml *aml_pci_static_endpoint_dsm(PCIDevice *pdev)
>> -{
>> -    Aml *method;
>> -
>> -    g_assert(pdev->acpi_index != 0);
>> -    method = aml_method("_DSM", 4, AML_SERIALIZED);
>> -    {
>> -        Aml *params = aml_local(0);
>> -        Aml *pkg = aml_package(1);
>> -        aml_append(pkg, aml_int(pdev->acpi_index));
>> -        aml_append(method, aml_store(pkg, params));
>> -        aml_append(method,
>> -            aml_return(aml_call5("EDSM", aml_arg(0), aml_arg(1),
>> -                                 aml_arg(2), aml_arg(3), params))
>> -        );
>> -    }
>> -    return method;
>> -}
>> -
>> -static void build_append_pcihp_notify_entry(Aml *method, int slot)
>> -{
>> -    Aml *if_ctx;
>> -    int32_t devfn = PCI_DEVFN(slot, 0);
>> -
>> -    if_ctx = aml_if(aml_and(aml_arg(0), aml_int(0x1U << slot), NULL));
>> -    aml_append(if_ctx, aml_notify(aml_name("S%.02X", devfn), aml_arg(1)));
>> -    aml_append(method, if_ctx);
>> -}
>> -
>> -static bool is_devfn_ignored_generic(const int devfn, const PCIBus *bus)
>> -{
>> -    const PCIDevice *pdev = bus->devices[devfn];
>> -
>> -    if (PCI_FUNC(devfn)) {
>> -        if (IS_PCI_BRIDGE(pdev)) {
>> -            /*
>> -             * Ignore only hotplugged PCI bridges on !0 functions, but
>> -             * allow describing cold plugged bridges on all functions
>> -             */
>> -            if (DEVICE(pdev)->hotplugged) {
>> -                return true;
>> -            }
>> -        }
>> -    }
>> -    return false;
>> -}
>> -
>> -static bool is_devfn_ignored_hotplug(const int devfn, const PCIBus *bus)
>> -{
>> -    PCIDevice *pdev = bus->devices[devfn];
>> -    if (pdev) {
>> -        return is_devfn_ignored_generic(devfn, bus) ||
>> -               !DEVICE_GET_CLASS(pdev)->hotpluggable ||
>> -               /* Cold plugged bridges aren't themselves hot-pluggable */
>> -               (IS_PCI_BRIDGE(pdev) && !DEVICE(pdev)->hotplugged);
>> -    } else { /* non populated slots */
>> -         /*
>> -         * hotplug is supported only for non-multifunction device
>> -         * so generate device description only for function 0
>> -         */
>> -        if (PCI_FUNC(devfn) ||
>> -            (pci_bus_is_express(bus) && PCI_SLOT(devfn) > 0)) {
>> -            return true;
>> -        }
>> -    }
>> -    return false;
>> -}
>> -
>> -void build_append_pcihp_slots(Aml *parent_scope, PCIBus *bus)
>> -{
>> -    int devfn;
>> -    Aml *dev, *notify_method = NULL, *method;
>> -    QObject *bsel = object_property_get_qobject(OBJECT(bus),
>> -                        ACPI_PCIHP_PROP_BSEL, NULL);
>> -    uint64_t bsel_val = qnum_get_uint(qobject_to(QNum, bsel));
>> -    qobject_unref(bsel);
>> -
>> -    aml_append(parent_scope, aml_name_decl("BSEL", aml_int(bsel_val)));
>> -    notify_method = aml_method("DVNT", 2, AML_NOTSERIALIZED);
>> -
>> -    for (devfn = 0; devfn < ARRAY_SIZE(bus->devices); devfn++) {
>> -        int slot = PCI_SLOT(devfn);
>> -        int adr = slot << 16 | PCI_FUNC(devfn);
>> -
>> -        if (is_devfn_ignored_hotplug(devfn, bus)) {
>> -            continue;
>> -        }
>> -
>> -        if (bus->devices[devfn]) {
>> -            dev = aml_scope("S%.02X", devfn);
>> -        } else {
>> -            dev = aml_device("S%.02X", devfn);
>> -            aml_append(dev, aml_name_decl("_ADR", aml_int(adr)));
>> -        }
>> -
>> -        /*
>> -         * Can't declare _SUN here for every device as it changes 'slot'
>> -         * enumeration order in linux kernel, so use another variable for it
>> -         */
>> -        aml_append(dev, aml_name_decl("ASUN", aml_int(slot)));
>> -        aml_append(dev, aml_pci_device_dsm());
>> -
>> -        aml_append(dev, aml_name_decl("_SUN", aml_int(slot)));
>> -        /* add _EJ0 to make slot hotpluggable  */
>> -        method = aml_method("_EJ0", 1, AML_NOTSERIALIZED);
>> -        aml_append(method,
>> -            aml_call2("PCEJ", aml_name("BSEL"), aml_name("_SUN"))
>> -        );
>> -        aml_append(dev, method);
>> -
>> -        build_append_pcihp_notify_entry(notify_method, slot);
>> -
>> -        /* device descriptor has been composed, add it into parent context */
>> -        aml_append(parent_scope, dev);
>> -    }
>> -    aml_append(parent_scope, notify_method);
>> -}
>> -
>> -void build_append_pci_bus_devices(Aml *parent_scope, PCIBus *bus)
>> -{
>> -    int devfn;
>> -    Aml *dev;
>> -
>> -    for (devfn = 0; devfn < ARRAY_SIZE(bus->devices); devfn++) {
>> -        /* ACPI spec: 1.0b: Table 6-2 _ADR Object Bus Types, PCI type */
>> -        int adr = PCI_SLOT(devfn) << 16 | PCI_FUNC(devfn);
>> -        PCIDevice *pdev = bus->devices[devfn];
>> -
>> -        if (!pdev || is_devfn_ignored_generic(devfn, bus)) {
>> -            continue;
>> -        }
>> -
>> -        /* start to compose PCI device descriptor */
>> -        dev = aml_device("S%.02X", devfn);
>> -        aml_append(dev, aml_name_decl("_ADR", aml_int(adr)));
>> -
>> -        call_dev_aml_func(DEVICE(bus->devices[devfn]), dev);
>> -        /* add _DSM if device has acpi-index set */
>> -        if (pdev->acpi_index &&
>> -            !object_property_get_bool(OBJECT(pdev), "hotpluggable",
>> -                                      &error_abort)) {
>> -            aml_append(dev, aml_pci_static_endpoint_dsm(pdev));
>> -        }
>> -
>> -        /* device descriptor has been composed, add it into parent context */
>> -        aml_append(parent_scope, dev);
>> -    }
>> -}
>> -
>>  /*
>>   * build_prt - Define interrupt routing rules
>>   *
