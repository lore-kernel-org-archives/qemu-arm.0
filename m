Received: by 2002:a17:505:8ed0:b0:1be9:327d:8ee3 with SMTP id kh16csp818037njc;
        Fri, 20 Jun 2025 04:27:26 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWQbVi0impJCRfmOM8RGYMSy8CeIwLdMrX+VIwF2ma2TgumZ9abSfbGi8T9WDJcAPtdphj7w/AQx85fIw==@linaro.org
X-Google-Smtp-Source: AGHT+IGws12rjjsLhNHVm/aRZXkjNTpMJX6AEooO6Bo80LILEbHVrzqA6kEwnhV864QagVwPD+3R
X-Received: by 2002:a05:620a:708a:b0:7d2:25df:8127 with SMTP id af79cd13be357-7d3f98c7814mr328799985a.3.1750418846439;
        Fri, 20 Jun 2025 04:27:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750418846; cv=none;
        d=google.com; s=arc-20240605;
        b=dQoUXZeoa6978/V7w3sFUN/FdN8326RrZ85thdgJHD+lQ2kEB7TR54HaSVbxN0Puwv
         HvWi1jHPGaabOUBGJbDRLyd8mrW+01G+aTdvzuvBBDuzyOyQG2R4xT0g3jOsbm3ErA0q
         AVneGfuPpHvOcM12n1nahyu7h9FdDAMvZ5JFVLVua5IV0ZCWGEHMq2v9KZVKRBA4tkEx
         wg9GcCnX9E/sCDXfdzLfWfOaXaT1E2wP0DUFkpuU3faPAsraDulJwpf3LBCrvhkf8VfC
         ea1h1mbRMLlAKvGeeBXv0X73pMcCLgje9DUyNMIOciE+uxDebJ5bsjjcPuBZy8sDKLHJ
         11dQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:reply-to:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=GKUErb7mGYcwpPGy7qjvEewo6keTbXuBg4VySCaSGGU=;
        fh=HsgtSb+9ERaiGgZnB3LQPbeXTGLT2rLlVwJgoDEou1Y=;
        b=SNbnf1zXjxWMivorrl4QAQHgvWevrLZ4EwY4Es0rh0vR0pRkjNCrqU0mDE9JS2RdPT
         HVP4P77Vsvso5/oGs09BL0fPUOegEAbxC8o0eRKoPZXM46jJGgzY5zK6pbuMy8uxw1nm
         g1DRAqihv/Jhn5CbVMNSErcOkcNKqHxgPRWyilXxYUllXQ6B969B7LxzXaubo5oD9JR9
         euKxQFHqXMAbADy+t1ZKNUo84NH9mxKJPKa8b1QQeGFQigeHn9NU+mIEHFtJqC/UCaGQ
         QxQUFChGgmXIH6LTSA8Fr4Uw/hfXDSRGXq91JOBmzaVw6u3/bGmq0gsHohk9MuWovtpI
         2PBQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=iS2O8OhI;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id af79cd13be357-7d3f9a0c0e2si144256185a.442.2025.06.20.04.27.26
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jun 2025 04:27:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=iS2O8OhI;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750418846;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GKUErb7mGYcwpPGy7qjvEewo6keTbXuBg4VySCaSGGU=;
	b=iS2O8OhI6L5WRjjkhRLNNgxJCqnDjB15GLMZrQ19T5+a6Lk6Le4GzKs3H072JYYpMsc1kC
	tIx/cwG8wHmzoRq7UczAWqgEz8xLKgfFxz8LXpWYXvBX/cJYICpzn1M8xUFCwoI0+W0nWx
	1xGzJpItz+Pyuf3YmBIjiLvP84ROEk4=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-674-Xf5UL7-oPKmiFVG68F9Biw-1; Fri, 20 Jun 2025 07:27:25 -0400
X-MC-Unique: Xf5UL7-oPKmiFVG68F9Biw-1
X-Mimecast-MFC-AGG-ID: Xf5UL7-oPKmiFVG68F9Biw_1750418844
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3a6d1394b07so408184f8f.3
        for <alex.bennee@linaro.org>; Fri, 20 Jun 2025 04:27:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750418844; x=1751023644;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GKUErb7mGYcwpPGy7qjvEewo6keTbXuBg4VySCaSGGU=;
        b=HMsl6xNhWFh4bPHymuWzLE4c0UebHQG/wcxllmg74cOi+Yrs6jfaOXX8TcYXdSa+rk
         mycTrRksDNPGt33vjXNqtPShLjfSegK8sbsDEPSd5Q6Y9/ZugkL3p1v+q3zLR9Pumc7R
         r25KhxuLCsO8BjgeEUTQCVW0hsZ0zcQty4AWJP070a5N6ZEGSQN70sgjVz6aKfrY6JDO
         pW9eM/NQBHnWinYcAQ6G/+SJVy+TrA9fjBeek8ixYYLLVN1MkyidlER5KAV+BPF1ODQs
         M7ZacgbzYELVAmYxDWsJahOv5X1ekmTxh4jkyAWLreLv3RkxmJ4MbkjECY0TVSBaNTlZ
         D4dw==
X-Forwarded-Encrypted: i=1; AJvYcCWiT5t8Sesco3tNpli3NFKKy4clH/mMNJdpZkD/w64+cEBpTmbWEeYMkbux4VH6m+sCE6r9NlOzhUeVnw==@linaro.org
X-Gm-Message-State: AOJu0YxxgP861OSOlvDw3g+ySH4j8t+L6VUEjhHexPu/XKymLlLvrPoP
	st/JSnd2/Uz4blymAkSR0+ZixviP/rbj1vEAmt27ziyx1NR4K3UWkq6Tc4Sp54MsG74WWhcqqTp
	tl2z52kTwR4APqRpF9mRPkXPeXNDQit/IXcXB9gRPp1R+AHBb6QWne7ctoA==
X-Gm-Gg: ASbGncvk40LIlGl+2u1kW+kuVtinmqQPYidG8HdYMAp0u/dhfd+hE76+O/wpqa5CDth
	TKB2rIlDZPU5bzMU3e8ncxsjOYVV60Xq6SHpuAOsAGH5pwHDKOav7yeB/Z4mxHHOe6ha9v5ZnJs
	HOzMpN4D2HzX1QdpKK90k62MH8RZ+Ne/fr6NffwDFO9Eu7Ry9LPhWL95VkkZg+qd3wJhBdXBkm5
	DXhcSp/uTvmolf4IxeXdVfzlKAyWXQaO0dZarXfhwK8XVKjsEv6J2vFFTfqpScNZWBzjQ+/j8jE
	I1v5vYBhgFG7QGOV1kp2wcq7xlrwWkXzEZ/dC9M2lAKETMKuSQvFdnHjuAJRDs96y6YrYw==
X-Received: by 2002:a05:6000:2dc7:b0:39f:175b:a68d with SMTP id ffacd0b85a97d-3a6d12bb555mr2046714f8f.11.1750418843707;
        Fri, 20 Jun 2025 04:27:23 -0700 (PDT)
X-Received: by 2002:a05:6000:2dc7:b0:39f:175b:a68d with SMTP id ffacd0b85a97d-3a6d12bb555mr2046695f8f.11.1750418843275;
        Fri, 20 Jun 2025 04:27:23 -0700 (PDT)
Return-Path: <eric.auger@redhat.com>
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874? ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4535ead2a5fsm56255485e9.34.2025.06.20.04.27.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Jun 2025 04:27:22 -0700 (PDT)
Message-ID: <15cea52b-3cd7-4f59-9073-5a0d0cfd19d9@redhat.com>
Date: Fri, 20 Jun 2025 13:27:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: eric.auger@redhat.com
Subject: Re: [PATCH v3 02/29] hw/acpi/ged: Add a
 acpi-pci-hotplug-with-bridge-support property
To: Igor Mammedov <imammedo@redhat.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 peter.maydell@linaro.org, gustavo.romero@linaro.org, anisinha@redhat.com,
 mst@redhat.com, shannon.zhaosl@gmail.com, pbonzini@redhat.com,
 philmd@linaro.org, alex.bennee@linaro.org
References: <20250616094903.885753-1-eric.auger@redhat.com>
 <20250616094903.885753-3-eric.auger@redhat.com>
 <20250620095308.00000d16@huawei.com> <20250620130941.6c0e6ff8@fedora>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20250620130941.6c0e6ff8@fedora>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: j_fFLrEVlEVT921O2qr4K0RWxyLANxZc2CqAwrIsRvE_1750418844
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TUID: 1VVh7b7CTfl8

Hi Jonathan, Igor,

On 6/20/25 1:09 PM, Igor Mammedov wrote:
> On Fri, 20 Jun 2025 09:53:08 +0100
> Jonathan Cameron <Jonathan.Cameron@huawei.com> wrote:
>
>> On Mon, 16 Jun 2025 11:46:31 +0200
>> Eric Auger <eric.auger@redhat.com> wrote:
>>
>>> A new boolean property is introduced. This will be used to turn
>>> ACPI PCI hotplug support. By default it is unset.
>>>
>>> Signed-off-by: Eric Auger <eric.auger@redhat.com>  
>> I wonder a bit if it makes sense to do this so early rather than just
>> before it is first used in the series?  Doesn't really matter though.
>> Just meant I read on a bit before giving an RB on this.
> Just before would be better, but it doesn't really matter.
> I guess Eric can rearrange that if there would be need to respin.
Yes I can definitively rearrange the order.

Thank you for the review

Eric
>
> Reviewed-by: Igor Mammedov <imammedo@redhat.com>
>
>> Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
>>
>>> ---
>>>  include/hw/acpi/generic_event_device.h | 2 ++
>>>  hw/acpi/generic_event_device.c         | 2 ++
>>>  2 files changed, 4 insertions(+)
>>>
>>> diff --git a/include/hw/acpi/generic_event_device.h b/include/hw/acpi/generic_event_device.h
>>> index d2dac87b4a..f5ffa67a39 100644
>>> --- a/include/hw/acpi/generic_event_device.h
>>> +++ b/include/hw/acpi/generic_event_device.h
>>> @@ -63,6 +63,7 @@
>>>  #include "hw/acpi/memory_hotplug.h"
>>>  #include "hw/acpi/ghes.h"
>>>  #include "hw/acpi/cpu.h"
>>> +#include "hw/acpi/pcihp.h"
>>>  #include "qom/object.h"
>>>  
>>>  #define ACPI_POWER_BUTTON_DEVICE "PWRB"
>>> @@ -114,6 +115,7 @@ struct AcpiGedState {
>>>      MemoryRegion container_memhp;
>>>      CPUHotplugState cpuhp_state;
>>>      MemoryRegion container_cpuhp;
>>> +    AcpiPciHpState pcihp_state;
>>>      GEDState ged_state;
>>>      uint32_t ged_event_bitmap;
>>>      qemu_irq irq;
>>> diff --git a/hw/acpi/generic_event_device.c b/hw/acpi/generic_event_device.c
>>> index 7a62f8d5bc..7831db412b 100644
>>> --- a/hw/acpi/generic_event_device.c
>>> +++ b/hw/acpi/generic_event_device.c
>>> @@ -318,6 +318,8 @@ static void acpi_ged_send_event(AcpiDeviceIf *adev, AcpiEventStatusBits ev)
>>>  
>>>  static const Property acpi_ged_properties[] = {
>>>      DEFINE_PROP_UINT32("ged-event", AcpiGedState, ged_event_bitmap, 0),
>>> +    DEFINE_PROP_BOOL(ACPI_PM_PROP_ACPI_PCIHP_BRIDGE, AcpiGedState,
>>> +                     pcihp_state.use_acpi_hotplug_bridge, 0),
>>>  };
>>>  
>>>  static const VMStateDescription vmstate_memhp_state = {  
