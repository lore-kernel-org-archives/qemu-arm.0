Received: by 2002:a05:7301:4085:b0:178:84eb:402c with SMTP id pt5csp856959dyb;
        Wed, 25 Jun 2025 06:36:30 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWgKbIisytLRw0POXsagOY6tWAQmuAnqJPOF0p4Iu1L5jIxQFLRIgt+WwpX1POTuLxWoC5cAS5c71SHEQ==@linaro.org
X-Google-Smtp-Source: AGHT+IG1UPEfxDMXTyR7Jcf88psZy0lK0WgExk7yE7h0ZPGwFLk0+GNOGp7zPJ/oxlnnFKBMVDwj
X-Received: by 2002:a05:6102:3ece:b0:4e1:5132:67c9 with SMTP id ada2fe7eead31-4eb52963e7amr4652162137.0.1750858589831;
        Wed, 25 Jun 2025 06:36:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750858589; cv=none;
        d=google.com; s=arc-20240605;
        b=ZRJHTN+sZiqZs9xiTzEhNfyc//zJm+2cpVm7eyUEqjPhRKNQY0jDWrrUaHpyfNaFK3
         tY6p9MLYB1feaQHCE0uymCj0m3zBOYry4RiazJlFAdpuQrcxolAYUWxPF5RE5g9jjZp0
         4mFHrYX6E80vnQrv7jIdi5YxiqKaBOOepUS6Ju0xxL8pvabeBfvBtCP49NWGmEmoAT9Z
         ++dGLe8Ki/mg5E8X9mMZ3Lie3cuGCXWYUVHOutaynzzksfH6Jn1MHTFUCTuKO6ewT6HM
         vjFj6A6sdppcU95LQtXqv5fVZ9yd0flpr+HxDEJtRPuk9C9JowHwtsEAiBhIoR2Bdc1R
         YRjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:reply-to:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=PMZJJFewBzjS4sZACakgZFb5UPa9fqCPQkRci89iPsg=;
        fh=v2y7n93SvN/TQ+P2GUPo1uee9k15Z6fO5pe8JVvgesI=;
        b=VOTnywQLR4cJ6MOA+lKPvKVSLjzOCEK8N3dzw6hWSQLwhxcEtC3VgjwPzM9kFhXPqF
         1Rz89Mun6SenZ1RKdymSpBe3ovc2A1rgQCvoWM3zbRStNGHsZTKykgA+uvz0sjJNSumD
         miYMr+kJQY1vRhPJrN/MVoRTPe9ZttOKARMdmO4y7dyTHhA5KO2hycoZwCPT6IGTmKzQ
         CCqU3K0spxaodc9kVSRtOFb59VGT1M76peNcx6AKtWSS9DwKNIjZXVpt2C+lPEBHLVAl
         SECxCU+e3nWbjdTCgf83cJtRZhW8u/TLiI0Bg4i9oDpGbql1raaNzz38TETjOObMX1fM
         fEaw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=cvEQZMsN;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id a1e0cc1a2514c-8811ae4f49fsi2033342241.78.2025.06.25.06.36.29
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 06:36:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=cvEQZMsN;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750858589;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PMZJJFewBzjS4sZACakgZFb5UPa9fqCPQkRci89iPsg=;
	b=cvEQZMsNPE0cdCb1TaoBO7mu/gA6ZwJWB6F9ERfiiOT7vdKdD7kcZrj06Odb+9SLAk8550
	SGBVrjGNJR7PSZtfr0edNjUObZraQHYkPAqtzbsn45tFA5mTYgxHIClVwBRmLkAgxawxoX
	CZJmZBghTIIODDSohJT6r1DMQzk6WEE=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-602-ooKUpOMhN2GJF-NauBs1uQ-1; Wed, 25 Jun 2025 09:36:28 -0400
X-MC-Unique: ooKUpOMhN2GJF-NauBs1uQ-1
X-Mimecast-MFC-AGG-ID: ooKUpOMhN2GJF-NauBs1uQ_1750858587
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-3a6d1394b07so870127f8f.3
        for <alex.bennee@linaro.org>; Wed, 25 Jun 2025 06:36:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750858587; x=1751463387;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PMZJJFewBzjS4sZACakgZFb5UPa9fqCPQkRci89iPsg=;
        b=HtN01fz/57oRYbZonNixb/ptLuY1n7SGmPbINbX4NX5nU1NizfbW0859yCnGp6kZ3t
         Sd9oFf1XV4U0JDBGY6EazMYkGBUmNEdoav4xnlgMjuuYWP2TduDQ8Z+PldznP+Pg1iHg
         SGIJuw2dWzCP5KShxZZ3+WXFw2TfD3hHmjkT4JtBJHdLGj6QkRw62s8VODzz0zh0ahxP
         pgqz4YbtYuAUJY++WgPSe5eKfuc6xSUCJizeZ6YKsXpmcqjN7k9m+Rm26yHzOZynPykT
         5XFcZ7bxTm4rwVMPjQXNbepZ03f4CSR6vAxrA6075wDBbPnF5U8PmGFDmJZbtfDShpse
         G6Yg==
X-Forwarded-Encrypted: i=1; AJvYcCV/deVMj6NGPgipeGVvRJCDigNrsaJTnF4HrAjk6fsMfJTyWr0RvCBGyIKRBtx8a+D/4Sqb4vsM7AE40g==@linaro.org
X-Gm-Message-State: AOJu0YzZNVkf1NAxG2fwHJSPtU+5s60sR9JL3+ok2frhdc9ebf8aLQ1T
	NC68NZji7IZaaQVUaADW+qneqF5aAascSSTuJBiSQT4c5sWkuva+IdNSx5/5qBBf0G1c7MAuY2P
	jhVkSh1wbCvOe9wyPN1xSPmo2NScf0iC/t9MKEhwpPHbCHWF0rYT1Qgjs/w==
X-Gm-Gg: ASbGnctE3vNS32QuFWcMT26LN9sFJuYJN18Fkeyn/nUSIJNkK3RAoX+Cy1oJJUfJKph
	BxkGu8ahkrwwXlgOWP3OtMZWSfeVEHOGmOsg5jhWqux3//7p2AP7IaR9kA5348m4kuI1WkzZSxt
	PQNEWnqAzmBf7QDkTJnPxRdJuZyahuslA0OgQgxAoioPFeA07cZSxdbsXW+RDl9KsZcNeS8jPIT
	RtmGuQTUTNYiIWbI+iQ2dDz8jbHXhWWdbinfJvNuqMHUZctUZ4yT+bj/gVowYN9/aLaAeYvwF0D
	SC0syIOuBZAjsq7rhSuPBG1OjvKGMqMPZpkVDzeU3NhouY46eTmY/stInosDiVtYteR3ww==
X-Received: by 2002:a05:600c:8b2a:b0:43c:ed61:2c26 with SMTP id 5b1f17b1804b1-45381b0f38fmr34328305e9.17.1750858586859;
        Wed, 25 Jun 2025 06:36:26 -0700 (PDT)
X-Received: by 2002:a05:600c:8b2a:b0:43c:ed61:2c26 with SMTP id 5b1f17b1804b1-45381b0f38fmr34327885e9.17.1750858586334;
        Wed, 25 Jun 2025 06:36:26 -0700 (PDT)
Return-Path: <eric.auger@redhat.com>
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874? ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453823b6c21sm20479955e9.29.2025.06.25.06.36.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Jun 2025 06:36:25 -0700 (PDT)
Message-ID: <8112ac0c-7fc6-4135-9024-830e83a1e1db@redhat.com>
Date: Wed, 25 Jun 2025 15:36:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: eric.auger@redhat.com
Subject: Re: [PATCH v3 25/29] hw/arm/virt: Let virt support pci hotplug/unplug
 GED event
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 peter.maydell@linaro.org, imammedo@redhat.com, gustavo.romero@linaro.org,
 anisinha@redhat.com, mst@redhat.com, shannon.zhaosl@gmail.com,
 pbonzini@redhat.com, philmd@linaro.org, alex.bennee@linaro.org
References: <20250616094903.885753-1-eric.auger@redhat.com>
 <20250616094903.885753-26-eric.auger@redhat.com>
 <20250620111745.00004018@huawei.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20250620111745.00004018@huawei.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: W1bRcokI68mOZEUm0hcaTwb_MtF_bkRr9sBNiL03agM_1750858587
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TUID: 0ufJ/4LJJ2x0

Hi Jonathan,

On 6/20/25 12:17 PM, Jonathan Cameron wrote:
> On Mon, 16 Jun 2025 11:46:54 +0200
> Eric Auger <eric.auger@redhat.com> wrote:
>
>> Set up the IO registers used to communicate between QEMU
>> and ACPI.
>>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>>
>> ---
>> v2 -> v3:
>> - remove acpi_ged_state->pcihp_state.use_acpi_hotplug_bridge = true;
>> - use sysbus_mmio_map_name for all regs (Igor)
> I'm very much in favor of this change but maybe break them out to
> a separate patch - perhaps even one that can run ahead of the rest
> of this series?

I split it in a separate patch.

Thanks!

Eric
>
> Mind you if this is going to land shortly perhaps not worth the bother.
>
> Either way
>
> Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
>
>
>> - create_pcie left at its original place
>>
>> v1 -> v2:
>> - use ACPI_PCIHP_REGION_NAME
>> ---
>>  include/hw/acpi/generic_event_device.h |  1 +
>>  hw/arm/virt.c                          | 19 +++++++++++++++++--
>>  2 files changed, 18 insertions(+), 2 deletions(-)
>>
>> diff --git a/include/hw/acpi/generic_event_device.h b/include/hw/acpi/generic_event_device.h
>> index ec8e1abe0a..8f5d903146 100644
>> --- a/include/hw/acpi/generic_event_device.h
>> +++ b/include/hw/acpi/generic_event_device.h
>> @@ -111,6 +111,7 @@ typedef struct GEDState {
>>  } GEDState;
>>  
>>  #define ACPI_PCIHP_REGION_NAME "pcihp container"
>> +#define ACPI_MEMHP_REGION_NAME "memhp container"
>>  
>>  struct AcpiGedState {
>>      SysBusDevice parent_obj;
>> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
>> index 41be8f6dbb..8c882e0794 100644
>> --- a/hw/arm/virt.c
>> +++ b/hw/arm/virt.c
>> @@ -684,6 +684,8 @@ static inline DeviceState *create_acpi_ged(VirtMachineState *vms)
>>      DeviceState *dev;
>>      MachineState *ms = MACHINE(vms);
>>      SysBusDevice *sbdev;
>> +    AcpiGedState *acpi_ged_state;
>> +    AcpiPciHpState *pcihp_state;
>>      int irq = vms->irqmap[VIRT_ACPI_GED];
>>      uint32_t event = ACPI_GED_PWR_DOWN_EVT;
>>  
>> @@ -696,13 +698,26 @@ static inline DeviceState *create_acpi_ged(VirtMachineState *vms)
>>      }
>>  
>>      dev = qdev_new(TYPE_ACPI_GED);
>> +    acpi_ged_state = ACPI_GED(dev);
>> +    pcihp_state = &acpi_ged_state->pcihp_state;
>> +    if (pcihp_state->use_acpi_hotplug_bridge) {
>> +        event |= ACPI_GED_PCI_HOTPLUG_EVT;
>> +    }
>>      qdev_prop_set_uint32(dev, "ged-event", event);
>>      object_property_set_link(OBJECT(dev), "bus", OBJECT(vms->bus), &error_abort);
>>      sbdev = SYS_BUS_DEVICE(dev);
>>      sysbus_realize_and_unref(sbdev, &error_fatal);
>>  
>> -    sysbus_mmio_map(sbdev, 0, vms->memmap[VIRT_ACPI_GED].base);
>> -    sysbus_mmio_map(sbdev, 1, vms->memmap[VIRT_PCDIMM_ACPI].base);
>> +    sysbus_mmio_map_name(sbdev, TYPE_ACPI_GED, vms->memmap[VIRT_ACPI_GED].base);
>> +    sysbus_mmio_map_name(sbdev, ACPI_MEMHP_REGION_NAME,
>> +                         vms->memmap[VIRT_PCDIMM_ACPI].base);
>> +    if (pcihp_state->use_acpi_hotplug_bridge) {
>> +        int pcihp_region_index;
>> +
>> +        pcihp_region_index = sysbus_mmio_map_name(sbdev, ACPI_PCIHP_REGION_NAME,
>> +                                                  vms->memmap[VIRT_ACPI_PCIHP].base);
>> +        assert(pcihp_region_index >= 0);
>> +    }
>>      sysbus_connect_irq(sbdev, 0, qdev_get_gpio_in(vms->gic, irq));
>>  
>>      return dev;
