Received: by 2002:a17:906:535b:b0:a20:43fc:1f40 with SMTP id j27csp858844ejo;
        Tue, 12 Dec 2023 04:24:31 -0800 (PST)
X-Received: by 2002:a17:906:dff2:b0:a19:656c:8ebe with SMTP id lc18-20020a170906dff200b00a19656c8ebemr3449024ejc.39.1702383871659;
        Tue, 12 Dec 2023 04:24:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702383871; cv=none;
        d=google.com; s=arc-20160816;
        b=j48FJVYkoOMsAaITWs8Z7u4w3bknXp0dSLEJv+qdLe8jxxHWS5ATRljFf5mAOFbpGS
         JQNVN+3Hi19aMXNFP+V3AYC4EYIGERLZc3+Oc7r3zoU8eMSm/LjBXuL95d0hDTmxZqul
         BLjyPBL1cR/IP+rZ7Ui9BxDs0NPC/R8FAeq3WbpbRLPxfCeCwaPzIZl5+Zm2KkQR5n7Y
         SqCjN02QGYDBk9/20a4c3ehtL2t6/YnPZ1cOJWtexv0EOH+LWY9nG0scZCh4eNqfXJkf
         MvZQdRPffZHnGs1kfbhceljCNxEFj6Irsl/KbvEKc6XOsucliYAWvwZrCapqu86FXvo3
         BpIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=lc0kMqhhyTL0/ED+GsijVzAfaP8VzTIUwqo3zggCI8k=;
        fh=KI+4/+ia1bE4Zq5H7ezmhgosSFBCz/Zq4TIFQpLQMXs=;
        b=KDKl8ZnvYwskLNhxERz89XS8Y4NAxznXXtOk9qC3AYY6HeGl5c5MHNOq3a2sXNEZb9
         XgZpmnD9LbiFOE33CZxhwA0SXzNFOAxwzLzCytjmbxgN5tCbVAbBA1UeWpsCu1eYNucy
         utOJPOBtgOYwkPYx4WUcFlEJqoH31zRg1jOMkrqw0rOS8qd9+L7phRIBY3GPzDhQv+w1
         K1mQ81vCJ0rZyW2CpTpnzjG3puocJtuiJkTSBJaE4KMMeTHcOi9GCnRdnN8N5Fpj06al
         uhvNyu6fxMhz5zB26L7HBSVHZ85vxPyIB2CknHZkQACJzQtAiNWqqxhHr5BIPSqE3EiY
         iKPw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=T206phGw;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id gs38-20020a1709072d2600b00a0e0b72f9d6sor2273495ejc.19.2023.12.12.04.24.31
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 12 Dec 2023 04:24:31 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=T206phGw;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702383871; x=1702988671; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lc0kMqhhyTL0/ED+GsijVzAfaP8VzTIUwqo3zggCI8k=;
        b=T206phGwNlkk60/lhouU8rtp8Xo0XugCV7ABSrnanTtPUx+HvlshSRwPYxRjwF0pUH
         na5hLJgM9XbV7MWQdq7bd4o3o7T7nts4DuFHOgh/bMEPTEL5yee/7f6UKLAe9yX7SNq6
         ZYdtwLbqV+7Vz5EVoe/3y61e8j1coDRnscejeyy0fnMN3KOhkjxPXI6AX4ELboLt7MEn
         HF9q0wmUx7pDvc3wSgJR202Sz8a+IYndWUOhvo+Bn9SFlaNdBlur0pBgqmocBtzml3kE
         Ap9KvzLl4f7YdbQLmWncNScRld8VV6NYeV35DA9r+5DGqGLkBVmB/sle0aNiVoYN/rs9
         TiUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702383871; x=1702988671;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lc0kMqhhyTL0/ED+GsijVzAfaP8VzTIUwqo3zggCI8k=;
        b=hVzpGbqqDvMQUrHul7Y8LvNs4imnM3DBimcZrttjQ3YRBd357Pj1eTZFK8Vg7yoBU8
         mvofWMX22dsb6Pazv7RbbqXB6N/rs8Vvaq8CZz1h6vZrF8zCZcGqZ0glR+AYCWZkXkdC
         cNTHcN6Q7qCPG6UNAeWEFvdXiSvlmvjBPJGsTQIgUWUEKEo9Yt+NzttsiANtAWQa3Lwg
         bGuxqML6UsPW6bvVCTrn8+izbqu/t2JTUigUqaTo3ljpPF8Ql3GA4VoaAJu6oBXsbmOM
         vGO3RBiFpGxk1VbDPPfK3FZX1RFDFMrUnjtWcCCZz5Y2od/m/Vctr4iOf7zo8T8BzWUS
         d9dw==
X-Gm-Message-State: AOJu0Yx5uAC40WeKm5ybI/+7B/jfEQ2rbpCe/scWLVPF0ffLptW4TFx9
	fJcmPkHBLoKkqeTlOvDdT++zvJFZ
X-Google-Smtp-Source: AGHT+IGOoeb7O8ekBg4UDFmGttrgQBh/uwJUUJ8aZVHDuCegDl1qawbyQj0ZFGDfX6+1yvx0B1N+dA==
X-Received: by 2002:a17:906:c14e:b0:a19:a19b:5603 with SMTP id dp14-20020a170906c14e00b00a19a19b5603mr3779457ejc.147.1702383871197;
        Tue, 12 Dec 2023 04:24:31 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.100] ([176.176.175.193])
        by smtp.gmail.com with ESMTPSA id sa16-20020a1709076d1000b00a1da72b8752sm6171897ejc.212.2023.12.12.04.24.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Dec 2023 04:24:30 -0800 (PST)
Message-ID: <3e62416d-c014-403f-ad51-8fd109821dac@linaro.org>
Date: Tue, 12 Dec 2023 13:24:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 15/24] exec/cpu-all: Remove unused headers
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: Ilya Leoshkevich <iii@linux.ibm.com>, Peter Xu <peterx@redhat.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Eduardo Habkost <eduardo@habkost.net>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-ppc@nongnu.org,
 qemu-s390x@nongnu.org, =?UTF-8?Q?Alex_Benn=C3=A9e?=
 <alex.bennee@linaro.org>, =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?=
 <berrange@redhat.com>, qemu-riscv@nongnu.org,
 David Hildenbrand <david@redhat.com>, Warner Losh <imp@bsdimp.com>,
 Claudio Fontana <cfontana@suse.de>, Brian Cain <bcain@quicinc.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Thomas Huth <thuth@redhat.com>
References: <20231211212003.21686-1-philmd@linaro.org>
 <20231211212003.21686-16-philmd@linaro.org>
 <488571cb-7770-4183-a760-ae4bd6549531@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <488571cb-7770-4183-a760-ae4bd6549531@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: IK6PJnxXRMV6

On 12/12/23 00:16, Richard Henderson wrote:
> On 12/11/23 13:19, Philippe Mathieu-Daudé wrote:
>> Nothing is required from the "qemu/thread.h" and
>> "hw/core/cpu.h" headers.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> ---
>>   include/exec/cpu-all.h | 2 --
>>   1 file changed, 2 deletions(-)
>>
>> diff --git a/include/exec/cpu-all.h b/include/exec/cpu-all.h
>> index 9a7b5737d3..b1e293a08f 100644
>> --- a/include/exec/cpu-all.h
>> +++ b/include/exec/cpu-all.h
>> @@ -22,8 +22,6 @@
>>   #include "exec/cpu-common.h"
>>   #include "exec/memory.h"
>>   #include "exec/tswap.h"
>> -#include "qemu/thread.h"
>> -#include "hw/core/cpu.h"
> 
> While thread.h is fine, I'm not sure removing hw/core/cpu.h from 
> cpu-all.h is a good idea, and would explain the rather surprising 
> changes to add core/cpu.h to other files.

"hw/core/cpu.h" defines the CPUState structure. Any code that
deref CPUState needs to include its definition from "hw/core/cpu.h".

Similarly, files that don't deref CPUState/CPUClass/cpu_foo methods
shouldn't be polluted by its declarations.

This series focuses on useremu, next comes sysemu and "exec/cpu-all.h"
is split. I'll see if I can postpone this change.
