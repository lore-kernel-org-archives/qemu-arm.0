Received: by 2002:a05:7301:4085:b0:178:84eb:402c with SMTP id pt5csp893668dyb;
        Wed, 25 Jun 2025 07:31:58 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUULlpenvk+OUpJ9oIXVkntGnTe1QAUkW11VrkAaIg8yoy63QZDRUvPyl0wbdF1qso/g0psDyX6zJ3j2w==@linaro.org
X-Google-Smtp-Source: AGHT+IEiiWdz533djatChUF/HqSGcaIf7GnLc4ZwJlEOTN+lf7gRV0HYZM2MBHewiX2c75A/FKnN
X-Received: by 2002:a05:6830:258d:b0:72a:48e0:445e with SMTP id 46e09a7af769-73adc5c9e3emr2177421a34.11.1750861917822;
        Wed, 25 Jun 2025 07:31:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750861917; cv=none;
        d=google.com; s=arc-20240605;
        b=ileJLbpoGiMTNDU6qrJmjD7JcUQAaYuHylWePTDTLbj1MDjymg2SnvC5jaYyL0A6CC
         Em2JhaFSJDZxqokeQs9A9spcUdB5hjFxwnKWbj9Wt2F4hMxMNST1GJrpRqg/g2LPCDR7
         iBy4TO2xCiUWYixmdA+/g/mbmvxPTbK9i/CQKCWdOw1IUNKSDErCnQBuAe5VT9uko2Yj
         Zi+20hujcnraOyh8WfA7Aa4jrAAOnbIWgATdhYtwr6WFxLpc95ml4iupcuV6SeJy+O+T
         qJufVXWnqrltHXS2ComFD+JaWmK126b15ZNc0OmwlJI+Mupe+TyCQsHsRvUsffOiDWnN
         UUWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:reply-to:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=DGXrAcauABsJvsDu0MTIOzKL5T58+phM6dr0hePCHLw=;
        fh=YSxXR+afj5scmzKPse76CbDZjqSU+aT32LCYgsoo4us=;
        b=jF/6Vp57pk6dkMQaSzRoYE7COyhYAek9X0C/Bk8//qjNXYdt5NSEJ8cwYKpai5Y+wT
         JQXHx2/2f4Svj5kl3cvaOroYZEKZICMuAcOmdR3cSlj39nybarMLhV7+p9c/ayhYKOk8
         TOb6iXKHQS7S96BBzsE8YJSyrXp5LLQGpud1Su3EoKpZbN6xwhCkF2fWQk6pb7u0Ebne
         /M7J8YeTPPwW7ebJ1mIoaPl8tM66QZKwVuhMQH7EamjmCs0bFtUd0CxoifrstKklcQRr
         qYJ7KkqHHoO5Fb918HbFqf22CJzDFJkCB+SaD7xllSM+bvd4waO1TWg2PQMsHUJ0PIXt
         Egcg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=M47zAbi8;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id 46e09a7af769-73a90acd060si7216519a34.57.2025.06.25.07.31.55
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 07:31:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=M47zAbi8;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750861912;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DGXrAcauABsJvsDu0MTIOzKL5T58+phM6dr0hePCHLw=;
	b=M47zAbi8bhmSds89je14wNaJqzQ5VGMQU84ZomXaxCiW3VKha90qiGS7toVh61GisUOf1T
	vQg/ryol+HUEBHDr0UHTFkbz+6RXUSNYEW8u4KmnUMZkhxyh4j0T0cZlXL38TErOwf5JrI
	8YRUVZTQ2Y0SfW4xb6TpBc4s/sUjmSc=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-202-gDCK3NpxNF-fah-lU6gFLQ-1; Wed, 25 Jun 2025 10:31:42 -0400
X-MC-Unique: gDCK3NpxNF-fah-lU6gFLQ-1
X-Mimecast-MFC-AGG-ID: gDCK3NpxNF-fah-lU6gFLQ_1750861898
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-3a5780e8137so540381f8f.1
        for <alex.bennee@linaro.org>; Wed, 25 Jun 2025 07:31:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750861898; x=1751466698;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DGXrAcauABsJvsDu0MTIOzKL5T58+phM6dr0hePCHLw=;
        b=v7H/wBhX8n/yqOd8muC5HbYFcwreKO/UJf3K9tbFG3OejPtmk/IATOAz69JyI3s2mG
         W/ImMf4hPtVYsr71pwKdveK4NbO0NUAFDNQuL47HbjedmTmeMxT+LuIrK0vkp12gXI7D
         6XW0cvbVE0pQFLQ3a9Pevh8icIUdzdjE90v177WlcsxCACK0rO51bfL6DdjxRa8Yhthj
         gxBdwk+P6O1FfloVllsnCzDSvbmY0jiees9nb40cdnRW4n62Ku42oiCZhD0nSwvxJOap
         g09JY5LVGRh09dzFF71qdZkywxU2AYU2EKc3JkqTKPv1MRj2rhR6VsDvpp10xskFceC6
         fAhw==
X-Forwarded-Encrypted: i=1; AJvYcCUpJvxAM6zMTqrvJpjcvpSMn3UHElTfzaWXbvbWCvzDLTiCvdcBMuJYWfX9MdIejXyLkmurrxld4CmZ6A==@linaro.org
X-Gm-Message-State: AOJu0Ywi01S4HBGJtYg7XQsUUqTIF01fc/sRqnyyXckzrr5apd9lU06e
	l1OpXM+oQD0JdmpNuUX1EYrWKxNkX/hKGVkUDB1c4bzYY53kiBuN/KDHq/XTufxXRjGIBkONUpF
	EUb9xhcirKLBwsVIYf+Wo6Rhdsuqi6vNvlwL3mk59hhHa1OagH4xeHUuAfQ==
X-Gm-Gg: ASbGncs+EpCjl6U+ROchBIroh9iYlMpdQzZ27gotPuDSyrKXccoE2+ymFuAwFNLlnmo
	rDlmnDYJNw7+Dp96W1um/cQ2oCdJGKTwLw8CclLCX007w9XIAAH87EAXIzBX5OSdxjgv4k/1mmr
	6/X2JAr1z3Uw3Ogiirjcm+Ghsa72/c7Jm/sg9EfJi6cW5KH2ZekbOV3SamXUdpKQ85wMczVaPz1
	jUDbd2RnSp2B7rv5BQ4BXXsrurNmUONwzBaZKW/KQNyJpc9YQqcdUU5jtU93mFzRjS3fgRG4Kx7
	GyOXZdWwIc37TtEq4Ee721mvAYpbq2IZuZvaJ9iyRJLncY4XsPHXVPDKfki5gvIMMcvZUA==
X-Received: by 2002:a05:6000:2089:b0:3a4:e1f5:41f4 with SMTP id ffacd0b85a97d-3a6e71ff6ecmr6822164f8f.17.1750861898052;
        Wed, 25 Jun 2025 07:31:38 -0700 (PDT)
X-Received: by 2002:a05:6000:2089:b0:3a4:e1f5:41f4 with SMTP id ffacd0b85a97d-3a6e71ff6ecmr6822102f8f.17.1750861897535;
        Wed, 25 Jun 2025 07:31:37 -0700 (PDT)
Return-Path: <eric.auger@redhat.com>
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874? ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4538233bd14sm22302765e9.2.2025.06.25.07.31.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Jun 2025 07:31:36 -0700 (PDT)
Message-ID: <c93670f8-f204-448d-b795-b893237c05f5@redhat.com>
Date: Wed, 25 Jun 2025 16:31:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: eric.auger@redhat.com
Subject: Re: [PATCH v3 20/29] hw/acpi/ged: Prepare the device to react to PCI
 hotplug events
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 peter.maydell@linaro.org, imammedo@redhat.com, gustavo.romero@linaro.org,
 anisinha@redhat.com, mst@redhat.com, shannon.zhaosl@gmail.com,
 pbonzini@redhat.com, philmd@linaro.org, alex.bennee@linaro.org
References: <20250616094903.885753-1-eric.auger@redhat.com>
 <20250616094903.885753-21-eric.auger@redhat.com>
 <20250620104445.000033d5@huawei.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20250620104445.000033d5@huawei.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: J1uhZAgrg8kamBAAODSh6dppCvL9KgghAVB9djwj04Q_1750861898
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TUID: oBZlIsxok3Ey



On 6/20/25 11:44 AM, Jonathan Cameron wrote:
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
>>
>> At this point the GED still does not support PCI device hotplug in
>> its TYPE_HOTPLUG_HANDLER implementation. This will come in a
>> subsequent patch.
>>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> Been a little while since I looked at how all this fits together
> but this looks right from what I can remember.  Hopefully others
> can give a more definitive review!
>
> One stray change that belongs in an earlier patch though.
> With that fixed up.
>
> So with that in mind.
> Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
thanks!
>
>
>
>> diff --git a/hw/acpi/pcihp.c b/hw/acpi/pcihp.c
>> index e79a24b821..36492aa0d9 100644
>> --- a/hw/acpi/pcihp.c
>> +++ b/hw/acpi/pcihp.c
>> @@ -43,7 +43,6 @@
>>  #include "qobject/qnum.h"
>>  #include "trace.h"
>>  
>> -#define ACPI_PCIHP_SIZE 0x0018
> It goes away from here, but doesn't get added anywhere?
>
> Looks like this belongs in patch 17?
removed from 17!

Eric
>
>>  #define PCI_UP_BASE 0x0000
>>  #define PCI_DOWN_BASE 0x0004
>>  #define PCI_EJ_BASE 0x0008
