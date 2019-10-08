Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp5049832wrm;
        Tue, 8 Oct 2019 04:38:20 -0700 (PDT)
X-Google-Smtp-Source: APXvYqycAQFga0z+dtjoCY1p+vZ6PSfIjdoOXraIkcJaH1uqdkpW2wFhaDE+YiqO5z+6Ah0cq8NG
X-Received: by 2002:a02:7405:: with SMTP id o5mr31518684jac.44.1570534700438;
        Tue, 08 Oct 2019 04:38:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1570534700; cv=none;
        d=google.com; s=arc-20160816;
        b=bF52taxRSj79rnbhRSYtO9J2Qche4xDUujIKEELbCjnxu2COy5Vd3ik7uAn9gBtB0q
         AWY0QtsY/fS6xP3TtT/RChzrO+OLMsm0YxUXND0G1IaO298lIBI0SsAyrAQBr0srtx+P
         H9UbQXzkRyKGxslVVQY1Va9Xqgch7JI4P5LUeUmIg4m5f6j62ER3ohTyrGoO/Ov8Nl9+
         EaTn/jBKXqMhZoDUAXf+BT+YMr2YVkW1zEEwZf0Ph7eS8+HhaWYvWbqPGq64Pnnalp0l
         QBijd8qx3Ke5Y+RcVMufALfuMPyEJVcsOxP5IlG6tsbUPyYC8u23kgQSrW7RYIg/Y2vH
         qu3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=+IpbVCrzLcmTZlMF6+ThTArGfMe9+73zUiYPDmX1XSU=;
        b=WCIyLHsQKpKETNFc1JyAue7euPVos6Z+Cj6bHHeubgi/9KVc+g0maMMM3NqpHVcNiG
         gH7SQ/RC07sTAwWNWOlKa4ufwJR+wi5axn4Jsmi5ikSA/1Ff3Lp9M8xG0sYdL2RGRPvH
         TKsjqEYwZsb9lVhsi+VeD39cO/2Cux2YfTnp6V932djMUdfB39/I2k1JAHngLcUjX8JY
         LGdZ7S/aEWYvbcikp7/X6VcaCf+fIojGkmvr7oxwwCRcbnRjq9ZWuR0nAOPU1JBICZQL
         FOLfO7RzQWB5TH3yZT9SZBAeIJuDqJWwHDRWkQpP3Fst14tmgoNrdWTAQ4G6viEvcNzK
         TGZw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of philmd@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id i64si22405133ila.130.2019.10.08.04.38.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 08 Oct 2019 04:38:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of philmd@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com [209.85.128.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 657437FDE5
	for <alex.bennee@linaro.org>; Tue,  8 Oct 2019 11:38:19 +0000 (UTC)
Received: by mail-wm1-f70.google.com with SMTP id g67so868833wmg.4
        for <alex.bennee@linaro.org>; Tue, 08 Oct 2019 04:38:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=+IpbVCrzLcmTZlMF6+ThTArGfMe9+73zUiYPDmX1XSU=;
        b=KI4+UOjYZ+wkUdhLeK//x1GGP+kZGZm8J+iJGwWwCHj9lrbBWWEhDbfRLpRYCkMlem
         kRebtZSwGc31RktdWzvwQTt+nCM+Yo+WLk1y/ma9iaHE5eBnK58jIFxrryNhDqe9tpxJ
         0a1UUSD85Y1598UDvmHC6ZwnCNIPxjdJEHekadJbuquCGFbX/jJMmhelTULHBf3n13C3
         GLuP5L9FotoPO+J/ldErxWCJ8XMLB9fRYbJIRXpP/CmCNUEVJwSIMSd8yxednoEHqwpg
         DqwJ2WfUwgFtvTI3caCEqAQ2Vpf388pn24fK9EUT40a5d8pU+IduoJgkknREaDObnYLe
         Jt/w==
X-Gm-Message-State: APjAAAXdo0PhllJWT6Sq6Th4T57HxLiATsQcFbbZV+4bYFzcsVQ/e35G
	5PVZ55dvhdRlHRd+wipwvwd+zV7m54DUbAdfVahpIVKFonynfq1+H+/QD1rf0IPtmdQ2cUsSixl
	aULoGb1otO1npR6ip
X-Received: by 2002:a1c:6609:: with SMTP id a9mr3654413wmc.127.1570534698133;
        Tue, 08 Oct 2019 04:38:18 -0700 (PDT)
X-Received: by 2002:a1c:6609:: with SMTP id a9mr3654393wmc.127.1570534697909;
        Tue, 08 Oct 2019 04:38:17 -0700 (PDT)
Received: from [192.168.1.35] (46.red-83-42-66.dynamicip.rima-tde.net. [83.42.66.46])
        by smtp.gmail.com with ESMTPSA id e9sm3782463wme.3.2019.10.08.04.38.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Oct 2019 04:38:17 -0700 (PDT)
Subject: Re: [PATCH 07/19] hw/misc/bcm2835_mbox: Add trace events
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Zolt=c3=a1n_Baldaszti?= <bztemail@gmail.com>,
 Laurent Bonnans <laurent.bonnans@here.com>,
 Esteban Bosse <estebanbosse@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 qemu-arm@nongnu.org, Clement Deschamps <clement.deschamps@antfield.fr>,
 Cleber Rosa <crosa@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Cheng Xiang <ext-cheng.xiang@here.com>, Pekka Enberg <penberg@iki.fi>,
 Guenter Roeck <linux@roeck-us.net>, Eduardo Habkost <ehabkost@redhat.com>
References: <20190926173428.10713-1-f4bug@amsat.org>
 <20190926173428.10713-8-f4bug@amsat.org> <87wodfiibn.fsf@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <bff44a43-6fae-e5bc-c965-94a2a3b02c3a@redhat.com>
Date: Tue, 8 Oct 2019 13:38:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.0
MIME-Version: 1.0
In-Reply-To: <87wodfiibn.fsf@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: JKo3Ykg8fbqT

On 10/8/19 1:32 PM, Alex Bennée wrote:
> 
> Philippe Mathieu-Daudé <f4bug@amsat.org> writes:
> 
>> Add trace events for read/write accesses and IRQ.
>>
>> Properties are structures used for the ARM particular MBOX.
>> Since one call in bcm2835_property.c concerns the mbox block,
>> name this trace event in the same bcm2835_mbox* namespace.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> ---
>>   hw/misc/bcm2835_mbox.c     | 5 +++++
>>   hw/misc/bcm2835_property.c | 2 ++
>>   hw/misc/trace-events       | 6 ++++++
>>   3 files changed, 13 insertions(+)
>>
>> diff --git a/hw/misc/bcm2835_mbox.c b/hw/misc/bcm2835_mbox.c
>> index 77285624c9..77d2d80706 100644
>> --- a/hw/misc/bcm2835_mbox.c
>> +++ b/hw/misc/bcm2835_mbox.c
>> @@ -15,6 +15,7 @@
>>   #include "migration/vmstate.h"
>>   #include "qemu/log.h"
>>   #include "qemu/module.h"
>> +#include "trace.h"
>>
>>   #define MAIL0_PEEK   0x90
>>   #define MAIL0_SENDER 0x94
>> @@ -123,6 +124,7 @@ static void bcm2835_mbox_update(BCM2835MboxState *s)
>>               set = true;
>>           }
>>       }
>> +    trace_bcm2835_mbox_irq(set);
>>       qemu_set_irq(s->arm_irq, set);
> 
> I'm kind surprised we don't have a common trace point for all IRQs.

Trace event names are used for filtering. You usually don't want to 
display all the IRQs, but rather a filtered set of devices you are 
working on/analyzing.

>>   }
>>
>> @@ -178,8 +180,10 @@ static uint64_t bcm2835_mbox_read(void *opaque, hwaddr offset, unsigned size)
>>       default:
>>           qemu_log_mask(LOG_UNIMP, "%s: Unsupported offset 0x%"HWADDR_PRIx"\n",
>>                         __func__, offset);
>> +        trace_bcm2835_mbox_read(size, offset, res);
>>           return 0;
>>       }
>> +    trace_bcm2835_mbox_read(size, offset, res);
>>
>>       bcm2835_mbox_update(s);
>>
>> @@ -195,6 +199,7 @@ static void bcm2835_mbox_write(void *opaque, hwaddr offset,
>>
>>       offset &= 0xff;
>>
>> +    trace_bcm2835_mbox_write(size, offset, value);
>>       switch (offset) {
>>       case MAIL0_SENDER:
>>           break;
>> diff --git a/hw/misc/bcm2835_property.c b/hw/misc/bcm2835_property.c
>> index 43a5465c5d..0eea2e20f7 100644
>> --- a/hw/misc/bcm2835_property.c
>> +++ b/hw/misc/bcm2835_property.c
>> @@ -13,6 +13,7 @@
>>   #include "sysemu/dma.h"
>>   #include "qemu/log.h"
>>   #include "qemu/module.h"
>> +#include "trace.h"
>>
>>   /* https://github.com/raspberrypi/firmware/wiki/Mailbox-property-interface */
>>
>> @@ -283,6 +284,7 @@ static void bcm2835_property_mbox_push(BCM2835PropertyState *s, uint32_t value)
>>               break;
>>           }
>>
>> +        trace_bcm2835_mbox_property(tag, bufsize, resplen);
>>           if (tag == 0) {
>>               break;
>>           }
>> diff --git a/hw/misc/trace-events b/hw/misc/trace-events
>> index 74276225f8..1deb1d08c1 100644
>> --- a/hw/misc/trace-events
>> +++ b/hw/misc/trace-events
>> @@ -143,3 +143,9 @@ armsse_mhu_write(uint64_t offset, uint64_t data, unsigned size) "SSE-200 MHU wri
>>
>>   # aspeed_xdma.c
>>   aspeed_xdma_write(uint64_t offset, uint64_t data) "XDMA write: offset 0x%" PRIx64 " data 0x%" PRIx64
>> +
>> +# bcm2835_mbox.c
>> +bcm2835_mbox_write(unsigned int size, uint64_t addr, uint64_t value) "mbox write sz:%u addr:0x%"PRIx64" data:0x%"PRIx64
>> +bcm2835_mbox_read(unsigned int size, uint64_t addr, uint64_t value) "mbox read sz:%u addr:0x%"PRIx64" data:0x%"PRIx64
>> +bcm2835_mbox_irq(unsigned level) "mbox irq:ARM level:%u"
>> +bcm2835_mbox_property(uint32_t tag, uint32_t bufsize, size_t resplen) "mbox property tag:0x%08x in_sz:%u out_sz:%zu"
> 
> Anyway:
> 
> Reviewed-by: Alex Bennée <alex.bennee@linaro.org>

Thanks!
