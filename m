Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp4517818ejc;
        Mon, 27 Feb 2023 03:22:56 -0800 (PST)
X-Received: by 2002:a05:600c:1708:b0:3eb:376e:2b9c with SMTP id c8-20020a05600c170800b003eb376e2b9cmr5096947wmn.36.1677496976505;
        Mon, 27 Feb 2023 03:22:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677496976; cv=none;
        d=google.com; s=arc-20160816;
        b=aS3jtPbUFzL9ATOPT+rS522RLNQvMUWA/fAoKWT2O3DYoy38lvnl/TPqoKEjG+rQq4
         NzTmtqH0Ym9rEyo1bEUhebrYOAAp2rScn6dKvkpefz+6g+NPcaCBH+IvR5YjPJDPxyYY
         sMkBJMshD5t/mcB6OTLQ6hsiGg+MvPRisrTLyUiv2UizwfOq61ecvURpeLb5XYdy8OKC
         IxiV74bKbxSY/sqdB7Eh1ImvYGOUZ0FbODq1ooUBGnTcfPVycEFuDBQzPA2JpthE6LUO
         dNFRvhF+1DiZcNkHM8UGc/SoC6DGiUIzvLH/PmCXYxmldYc7kQVXgq5JzGodULulKlwm
         SOKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=PSrdR1dRUwL9w62ffoZCzUDOa9PXzM50Oj5+LxZXHRQ=;
        b=Wko0t2ZxNM4g7RTR5W+ZjCoLFtbCGfogSKYMAkIzcBPYjcv9hzWiWS0G8a5pEEVXvf
         byqBCfrJ0adYXG8uJ0dFuyBYeZLvpxQZUPfeMVrb/6cVEuXo81fOPiAxEif5MrRmtGnY
         s8JitvfxPabdR02JBSzSKARv5Yygwg2qSIhePK6EXPoRMHA5C0R+ViWs/+VrZF2xoq3y
         7OnySflLu0M/YEXQp/edwqLZho8oW4ubk+qjmB+nNbHho3BagUOdJfPsOA1U7p0uJm28
         6ExFf0ZEvk5KBDFLjODHHSWRvst+pMeAANDNTFDJoWax92cecxKcv5Gz/WT7+qmIW8MC
         3odA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=emWdmmAQ;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id bg35-20020a05600c3ca300b003d99a390c37sor1559428wmb.45.2023.02.27.03.22.56
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 27 Feb 2023 03:22:56 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=emWdmmAQ;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PSrdR1dRUwL9w62ffoZCzUDOa9PXzM50Oj5+LxZXHRQ=;
        b=emWdmmAQW4b447QxjPinR24FL7PEazIWW1yECQX6WaH89iBRcRwRBwi0YSIo3KDxnz
         pbIGDj219c/7b68nUKuo2F7QKCQ+fthKzhFIunSm99Q7KSHosWgLHdeSWdFjUYRzLa+0
         UQ1mcfFqxA7nvoZg6DPj8O/i2lysc3QEkjM7dOOfngT5qH3B2ep+LI0OJexWpYI029Ds
         bq4BRadvOn1sunYn7twPJiyf5WFauwFJMki7zkRTQ5nv2L8fMLfeAnaiYrqyBgsfax5p
         EyVHfraIt+7buUcMmFMJRz9xSIxqXVkGfZa9t6OicczHiI1DrzD6W76pZ3JxdxUrRrv3
         JrAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PSrdR1dRUwL9w62ffoZCzUDOa9PXzM50Oj5+LxZXHRQ=;
        b=CvbDmE/HDc+eVlBfmn1IyGVYVmROKNqtq+n9prJXxxOpr/Cs6PE7VC1Svqxi5wuO6O
         WT4MhYzkMAweIVVyjlEdIg5gnSIeL2iSusCDTm+JoH5sy3pGyuWgWZlUQKc0KUcKCxhj
         QVtI88WoZawZD5hkyAtCGtOvY4sLfgd4IlIxh0AtMaibmYMkMcbZh6MTtyE5YlOg6quL
         +ozIsgGKP9RIF74zZ0lTR9PYzvd+NwwVZjh4NsnyBmCCgSZ/W6RzzeDg2PA1vKvup+Or
         6hugabYVvtWOAPP8OC64OZrGcJx+OG/XsCePYqvj1Nlz625Zaqr9iqmvTloAPsrtO3Sj
         8E4Q==
X-Gm-Message-State: AO0yUKVUWhy/PWM0eR3eSmQkTXykI75kdRL+WO2Fr5CmephryVDfgUsY
	s5IU7692+rKbauXZwN/gqd8lP5ym3LC/8hRE+Jg=
X-Google-Smtp-Source: AK7set8zyZYOYZNEe+kb4X0YLJkNFR1SPeTSnK0fxULc7SiMwY610VLrqiBh/MtTOj5L5gIJUlM9Xw==
X-Received: by 2002:a05:600c:1895:b0:3e2:f80:3df1 with SMTP id x21-20020a05600c189500b003e20f803df1mr18502577wmp.19.1677496975997;
        Mon, 27 Feb 2023 03:22:55 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from [192.168.30.216] ([81.0.6.76])
        by smtp.gmail.com with ESMTPSA id l8-20020a05600c1d0800b003de2fc8214esm9289831wms.20.2023.02.27.03.22.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Feb 2023 03:22:55 -0800 (PST)
Message-ID: <2b446ce6-0d1b-0745-8e83-75d4cae36057@linaro.org>
Date: Mon, 27 Feb 2023 12:22:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v2 17/24] hw/ide: Declare
 ide_get_[geometry/bios_chs_trans] in 'hw/ide/internal.h'
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: qemu-ppc@nongnu.org, John Snow <jsnow@redhat.com>, qemu-block@nongnu.org,
 qemu-arm@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, qemu-devel@nongnu.org
References: <20230220091358.17038-1-philmd@linaro.org>
 <20230220091358.17038-18-philmd@linaro.org> <87edqbicfb.fsf@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <87edqbicfb.fsf@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: B4dW+84gZ+MT

On 27/2/23 12:17, Alex Bennée wrote:
> 
> Philippe Mathieu-Daudé <philmd@linaro.org> writes:
> 
>> ide_get_geometry() and ide_get_bios_chs_trans() are only
>> used by the TYPE_PC_MACHINE.
>> "hw/ide.h" is a mixed bag of lost IDE declarations. In order
>> to remove this (almost) pointless header soon, move these
>> declarations to "hw/ide/internal.h".
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> ---
>>   hw/i386/pc.c              | 3 ++-
>>   include/hw/ide.h          | 4 ----
>>   include/hw/ide/internal.h | 4 ++++
>>   3 files changed, 6 insertions(+), 5 deletions(-)
>>
>> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
>> index 6e592bd969..79297a6ecd 100644
>> --- a/hw/i386/pc.c
>> +++ b/hw/i386/pc.c
>> @@ -34,7 +34,8 @@
>>   #include "hw/i386/vmport.h"
>>   #include "sysemu/cpus.h"
>>   #include "hw/block/fdc.h"
>> -#include "hw/ide.h"
>> +#include "hw/ide/internal.h"
>> +#include "hw/ide/isa.h"
> 
> I do kind of wonder why hw/ide/internal.h isn't in the appropriate
> subdir (e.g. hw/ide and included as #include "internal.h") rather than
> the "public" include directory.

It should be internal but is included by PCI and MacIO:

include/hw/ide/pci.h:4:#include "hw/ide/internal.h"
include/hw/misc/macio/macio.h:31:#include "hw/ide/internal.h"

Long term I'd like to split it in internal vs public API.

> However QEMU isn't super consistent with
> that:
> 
>    ➜  find . -iname "internal.h"
>    ./accel/tcg/internal.h
>    ./target/ppc/internal.h
>    ./target/mips/internal.h
>    ./target/hexagon/internal.h
>    ./include/hw/ide/internal.h
>    🕙11:15:58 alex@zen:qemu.git  on  review/qom-housekeeping-v2 [$?] took 7s
>    ➜  find . -iname "internals.h"
>    ./tests/fp/berkeley-softfloat-3/source/include/internals.h
>    ./target/arm/internals.h
>    ./target/riscv/internals.h
>    ./target/loongarch/internals.h
>    ./gdbstub/internals.h
> 
> Anyway:
> 
> Reviewed-by: Alex Bennée <alex.bennee@linaro.org>

Thanks!
