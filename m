Received: by 2002:a05:7300:232a:b0:178:84eb:402c with SMTP id r42csp3024625dye;
        Tue, 1 Jul 2025 02:28:47 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVVKSZcdLHUt+cIFOji3c2PYy/cI/hggL2ueHKdiEvc2OjViMyUXHsSnsGoEa16LDUXwuGhne4EseOeLQ==@linaro.org
X-Google-Smtp-Source: AGHT+IEXJq4egVsnFLJgE6RGz0GjDpHp2QzlYxFCU9t2HdASxz0gvnxL9RJ7p/5a01P9QqvNyqyj
X-Received: by 2002:a05:620a:2984:b0:7d3:d8d6:1c89 with SMTP id af79cd13be357-7d4439a669bmr2552410085a.43.1751362127639;
        Tue, 01 Jul 2025 02:28:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751362127; cv=none;
        d=google.com; s=arc-20240605;
        b=g4pMIX7+hi9sgTNEHuus4aWoVzPJV+oP9vOQweIfiTGzj3LWQ5s7riQgXInPrYbOUQ
         mFoYKBO8sxHRjVomFngpEaKfEdH5qMCh9Fa7w8NoL00G7GGLBRtSqWIwCFViJ4qF5+BX
         t/g4wkLHAy1+tssh13cij9drHpUeLEsTwoI7wRHKCK+SgILQVXGUqJKc5Ee2dO2tVtfW
         rZE1T+VnYFeLQe2EVz7ahs8V8e+rGFq2jqm1oGgvqwZSVRpzGV3lFvkCPNix/zR9on0e
         0qJkyCNDSUu0C0CKHjKE+ALdFV67MlL7bnsQDwF7uVKOsxb+oS9WclA68BeOYjzSxqvE
         ti8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:reply-to:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=FGqTT2w+KS6jckIHM+NDWJhU0IE5n4M12BMJuWiciJY=;
        fh=q3N9XFf4bhpinlKtVnbRFg6yqOXp6JlUg4QbSQ/M6kw=;
        b=E+lL+zmAfyd2Xb2W3xrFObHeO/7c1ve+RQGfJnTckrhd5lgt4s4NwrGKB1yNBMKlLm
         vtHBMl0dFh7mdPwIedUZ9/7CKd40P/3E7EYMNM9XdDtvd3ZvVyWDIvE2BroD4T0z7dzK
         mfarv+qR1BDDRw32eh3ouWGtybr6B1k9P+FAxCqEhHxIRDEhzYH7spbIw0NPgrMdi3AD
         QIhi2F/fLJb5d1dJ+t/P5cpY/aP3ZS91EV9AmxkQXlzBkVIQPT5zEQ6UPOPJmy8kzzzq
         LkVkFqnOgrkGcWJuXk1ZO3+m8srDqDyrRnKOMetf18B2YFoTaNaqxrod1sCqUjMiWq/J
         s/AQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=CJD2zloG;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id af79cd13be357-7d443299655si1001234385a.576.2025.07.01.02.28.47
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 02:28:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=CJD2zloG;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751362127;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FGqTT2w+KS6jckIHM+NDWJhU0IE5n4M12BMJuWiciJY=;
	b=CJD2zloGQrr3euI+yKgAO+/ed+SZ4O5RpoWt1cmFZU+Z+G2HqJXQY9iZUfWMjzmFv03hyC
	fS8scZ/36W0diMRFvc/hBuFKgz+B7iLqUH/kjaQT9LAjLplxZ8e0gXqjAdJ3vrWZSCCM2o
	hdT84A2f2x9Ost+PcZXrj7I7bjz+BSg=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-564-3vf0oUkyMmqkjVDXeHZg5w-1; Tue, 01 Jul 2025 05:28:46 -0400
X-MC-Unique: 3vf0oUkyMmqkjVDXeHZg5w-1
X-Mimecast-MFC-AGG-ID: 3vf0oUkyMmqkjVDXeHZg5w_1751362125
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-3a4f7f1b932so1847937f8f.2
        for <alex.bennee@linaro.org>; Tue, 01 Jul 2025 02:28:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751362125; x=1751966925;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FGqTT2w+KS6jckIHM+NDWJhU0IE5n4M12BMJuWiciJY=;
        b=AubzwvoWif05PRlLCPScVL0lRVoXG/f92S72BhOx4pTPfNSHXLHhag3YTJaB314CXU
         mowGOU+4q0Gr0nhpC9XFJpwY+2C0CGIdLo0N4OZ9Mo5ERjV6rsdaR9/B4SFBtWiU334a
         +naHgYtHPNF5y+7I+/xoigcpf+nYZSNkrQroOHJseg3TJjkgw6CAXSD+RlUPZ8EeEKmN
         Hzsf36OCQ804kigvLpHIaoKQqbFGqaddtzR6274vxeNybY9//v8G7fDTh5tFKNDGrY2Q
         kdnJzx+12ihOhKeDOZEh03f9T7jfIOJfqgvilC3YpU8OjT+1leTh/gJa09PpE8vRfYhB
         Hbyw==
X-Forwarded-Encrypted: i=1; AJvYcCX1IcSyFi6R0PkEwhe48TV08N7CmoFYNUZ0jqdxXHoQaa/qfe8gtySYqU4MWSCcXj0vlp0fDllFHpSF/Q==@linaro.org
X-Gm-Message-State: AOJu0YwkFMq057Z5ngLbYc13Wts2yTpbKT1UJXR4rMN2oeruQoiXar/b
	Xa3GxHHtrATAoHMkbWEi4NKEGiodMD/BxCbxi1rlpC5nZz0JnB/OqWVhEj8u/+6dvlQXAwaqZZW
	VasFa2au3BXGgC1ViS/ATneo6tsxTSoM/eIRH4cD7tx900HtW8RMxJPoLgg==
X-Gm-Gg: ASbGncv0/9OKXcEWJ1lLKfNrax6rWFBhi3G3/9sl5VG1emXlp1oyzSYN6FQYyOgetbK
	P+FkILVy5J14Z6q6EkvQye+I/ynLv1/BLkcqBB0DSHuuyvpNYHwb5nUeD0Gd4u7lOieD/8vKkwP
	pUSqAqJAqD3vCWxWG3xPc3bzISXari+S0DUD2FTycWNbwo9D8j30RAZ3y29FoIbnNZrLpHK8vj/
	b5lz94X4Oy050X74eycjQN8csIBHLGZLFiqmYahsuDjMPMtrSCs2A2KD2OeWUMe9CfOB9EEnFAM
	LGCRkuxh7i0a1U6Et+OiYi3j1z5rnQe97bWryzaHjIOAxXYdiuxrGRr9rZ3UC9nW12rpVQ==
X-Received: by 2002:a05:6000:440f:b0:3a3:6595:9209 with SMTP id ffacd0b85a97d-3a8fdeffb3emr9012480f8f.36.1751362124903;
        Tue, 01 Jul 2025 02:28:44 -0700 (PDT)
X-Received: by 2002:a05:6000:440f:b0:3a3:6595:9209 with SMTP id ffacd0b85a97d-3a8fdeffb3emr9012462f8f.36.1751362124439;
        Tue, 01 Jul 2025 02:28:44 -0700 (PDT)
Return-Path: <eric.auger@redhat.com>
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874? ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453823ad0fesm194636705e9.25.2025.07.01.02.28.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Jul 2025 02:28:43 -0700 (PDT)
Message-ID: <6c138685-82cb-4dad-b562-2d898c8414e2@redhat.com>
Date: Tue, 1 Jul 2025 11:28:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: eric.auger@redhat.com
Subject: Re: [PATCH v4 29/32] hw/arm/virt: Let virt support pci hotplug/unplug
 GED event
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 peter.maydell@linaro.org, imammedo@redhat.com, gustavo.romero@linaro.org,
 anisinha@redhat.com, mst@redhat.com, shannon.zhaosl@gmail.com,
 pbonzini@redhat.com, philmd@linaro.org, alex.bennee@linaro.org
References: <20250627095620.3300028-1-eric.auger@redhat.com>
 <20250627095620.3300028-30-eric.auger@redhat.com>
 <20250630135315.000041b2@huawei.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20250630135315.000041b2@huawei.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: gS-OGI1mb1wjpy_JGs7zLzu7H990t5MyD-fdyb37_Zg_1751362125
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TUID: UN1op5cM4tPl

Hi Jonathan

On 6/30/25 2:53 PM, Jonathan Cameron wrote:
> On Fri, 27 Jun 2025 11:55:18 +0200
> Eric Auger <eric.auger@redhat.com> wrote:
>
>> Set up the IO registers used to communicate between QEMU
>> and ACPI.
>>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> Follow on comment inline.  Otherwise LGTM
>
> Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
thanks!
>
>> ---
>> v2 -> v3:
>> - remove acpi_ged_state->pcihp_state.use_acpi_hotplug_bridge = true;
>> - use sysbus_mmio_map_name for all regs (Igor)
>> - create_pcie left at its original place
>>
>> v1 -> v2:
>> - use ACPI_PCIHP_REGION_NAME
>> ---
>>  hw/arm/virt.c | 13 +++++++++++++
>>  1 file changed, 13 insertions(+)
>>
>> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
>> index 878c567354..d8706ef9c8 100644
>> --- a/hw/arm/virt.c
>> +++ b/hw/arm/virt.c
>> @@ -686,6 +686,7 @@ static inline DeviceState *create_acpi_ged(VirtMachineState *vms)
>>      SysBusDevice *sbdev;
>>      int irq = vms->irqmap[VIRT_ACPI_GED];
>>      uint32_t event = ACPI_GED_PWR_DOWN_EVT;
>> +    bool acpi_pcihp;
>>  
>>      if (ms->ram_slots) {
>>          event |= ACPI_GED_MEM_HOTPLUG_EVT;
>> @@ -704,6 +705,18 @@ static inline DeviceState *create_acpi_ged(VirtMachineState *vms)
>>      sysbus_mmio_map_name(sbdev, TYPE_ACPI_GED, vms->memmap[VIRT_ACPI_GED].base);
>>      sysbus_mmio_map_name(sbdev, ACPI_MEMHP_REGION_NAME,
>>                           vms->memmap[VIRT_PCDIMM_ACPI].base);
>> +
>> +    acpi_pcihp = object_property_get_bool(OBJECT(dev),
>> +                                          ACPI_PM_PROP_ACPI_PCIHP_BRIDGE, NULL);
>> +
>> +    if (acpi_pcihp) {
> As mentioned in earlier patch review, with this code you now have means to set the event
> bitmap as done in other cases.  Maybe just do that here as well?
see my previous reply

Hope this clarifies

Eric
>
>> +        int pcihp_region_index;
>> +
>> +        pcihp_region_index = sysbus_mmio_map_name(sbdev, ACPI_PCIHP_REGION_NAME,
>> +                                                  vms->memmap[VIRT_ACPI_PCIHP].base);
>> +        assert(pcihp_region_index >= 0);
>> +    }
>> +
>>      sysbus_connect_irq(sbdev, 0, qdev_get_gpio_in(vms->gic, irq));
>>  
>>      return dev;
