Received: by 2002:a17:504:8616:b0:1be9:327d:8ee3 with SMTP id o22csp542453njm;
        Tue, 29 Apr 2025 14:09:09 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUTSwSLhgjMrOuB/TvMvytba83B57kFKnV5ilGiPAEwlZdcpCsZScpJewN7DIFnFYQdXFXFiu4FI4hjcQ==@linaro.org
X-Received: by 2002:a17:903:3202:b0:224:162:a3e0 with SMTP id d9443c01a7336-22df3585f26mr12494355ad.49.1745960949262;
        Tue, 29 Apr 2025 14:09:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1745960949; cv=none;
        d=google.com; s=arc-20240605;
        b=hz58x7VlyOaVi1RQtqcNmMp81judX4eJjJnPXDaVOcWzp+PiXJ+c5JHtTEtOKv4cLw
         h2VKrC/qzuIEvkFdtsGmeAqZxBUyNyhbcAksShUgogJ/mvREQibQPbzx8aZoI/LQzBLh
         Cm7pL6cTLBQiTqgQRaJelo5H4OmGAR0IWKAqFeoLBxB8wIBZ1bnClO5y62bm6a6AEtsc
         5U5xw5jc7SlC5FV+27z9qSX8gOFFKr3B5ya5WuTWt98d9d+B6wQ5UT3kbbwxuVov4Tl0
         bIolPi4GbU0tMegvLFnuiBdmPOaY78byeJHaUWaBB17RKB5biHmXNapoFgq2fPmP9AFh
         1mag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=MLeuxHcfNivb7tyBBoY+e0IZqSm/iDGYB29+J+i/d7Q=;
        fh=K8ugYStfTUOL9CXbw7RYybAt0Ko9FHRc8DySCOoaHbQ=;
        b=agwnCMcUd1KzhjMc1dqyuTNcXiv8CxDu6K8oazUoPpgt0MwCh5jrtIdWRSj0H4aaYt
         ASqCilUdh9jcU5s6AY0bxQQY4UuiPtanLvb267nHF2OH14ByuwmC8ZFBAoUzOpAin+Cr
         m52JcMcH7IqzdNcFwlMaZ+BdjFl5ykZweiUk6mnEkukU4T59ePZcczjMSsWhWVEZRqlY
         6ufZeWSgddtSD7UmEWE3Ju+dc+ZAUxGMOuJ+HBbYipcbNZpwMBK6rstYrsP/SyNfL6nv
         UeGLcknj2e/9I7aC0UXI4+K27Qj9eSQkCcu+2fO8Cp0KokfVRdEQ/3a9UgW9q0Hh/zEb
         nLWA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dxCPZJVw;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22db4d8d8cbsor89347835ad.1.2025.04.29.14.09.09
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 29 Apr 2025 14:09:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dxCPZJVw;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745960949; x=1746565749; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MLeuxHcfNivb7tyBBoY+e0IZqSm/iDGYB29+J+i/d7Q=;
        b=dxCPZJVwgTTsOdzRsF699sb0U8Pd9f8GrWjaveUTI6NxSnLSHXDH88kc9o9Y3IB8Ay
         hjaGGKXqNVqu2FeMY70T8s4JjGPUSSoX1Al5Rwen/s6lkE/oZVyA71qra1xKntpIPqhe
         cBQpKLGzRHufKPxEi3Ib10jQd+m0OdRli2tQmtK5n1rLHeNqeOi3CDzG8HJVpfrUHpJn
         Za3mFAkL02cSbJ6QzU8gqyXPXQtukUk38GSj9kMB15XE13IWOQ6M4bfr/Hbg3NZkOZNm
         LEBQYCDdMVE07lNXHOdeu9K8iNeoyWVtBPh3raqk4Sp86DHN+v7Z4+KyzmT4gmQb+iA2
         UTqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745960949; x=1746565749;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MLeuxHcfNivb7tyBBoY+e0IZqSm/iDGYB29+J+i/d7Q=;
        b=H50CGu+jUd14JuDKll67dEJQAwIJHaeLmWSqSltTxXIMF3xnyNTiupfCAwJFW7PAE9
         AbAX6e1NQg9VrTFY4kUUkvSw/qDrnvGqxQfA+OmJvT0gVb+51YBoO22cYz4e8C+TJwHq
         Az4zE4UGu9UWDHXGRN/fBsQ2ehYv+xK3m0g9TNJBTnpQ/PucMr/TyNT5BHliaVgrcI5t
         P9wTykh6jpRq7i+urzyrKtfBlXgUcmvBqNaCcX0f2rwkjmbB6Vh7g8yb/JWS+ZULZpXU
         ZLpLW/Uvh6ksiNJl5l7k394U4mszP/cZrZXL/xk0wG+RsATOMF1++h1TjSU7kPh8A1kh
         ZvOQ==
X-Forwarded-Encrypted: i=1; AJvYcCUIRXaPzwz+dBnB6SyNwwR/ew+iqppsUvktCenPWNKyfMcSyj2EkF4qzG/3VBPZPCQI+Y5iSPrYmPppng==@linaro.org
X-Gm-Message-State: AOJu0YyX/v8gtfeIpTGO/6D9fMXaZPsYXGYanKEWDQQNIt2fvK23P+d1
	OydjP9VbrQzHAH0IRnKK1Qs8wdehfBhvSyxXm32doc2A8MyM+UYsQ9/J7jtPSZErcA==
X-Gm-Gg: ASbGncsjetx4lovSjAEs+pnMNdXtKKU4iH/8nG3eui1PijQsdmMJmiICUPpSmRQTB9l
	6lQJMx0nQTn2JQTNVKxlJfZe0PC5WrAYHvVDkIP8L2pyVOtCexQtqgiNDhfhyGTaJOGfw6ddFW4
	jdYJnh6IXSyUmYRWwTMPHjzZrrQ3m4HCDrxx1AJVBjYRjwYqtk4IPvVXZo4g3cTWULARMmsCnqK
	rjazToAFlyt1aiqlgA2HMcgWbvZcEoZ8Gl03Gv1KRDHb4K0AbFh47c5Y3JiJq49zcQnormj6azc
	gFA15t5Gc0Lx10g4OjQcHeci2hyBtY9Jo6MzoMjKy0++StTpzuA1ro4RDNnCOtEW
X-Google-Smtp-Source: AGHT+IFRj+IPjAu+ZLe7pYPx3EsLGYybdG1EozzrwQ8TYu9qesZOiZaauU4yxthkSrf6JESEIKXUQw==
X-Received: by 2002:a17:903:3c48:b0:220:d257:cdbd with SMTP id d9443c01a7336-22df358762bmr13027345ad.48.1745960948821;
        Tue, 29 Apr 2025 14:09:08 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from [192.168.1.87] ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db4d770d6sm107801645ad.17.2025.04.29.14.09.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Apr 2025 14:09:08 -0700 (PDT)
Message-ID: <75cc3e9c-05bc-46e0-9bd0-d0c889133434@linaro.org>
Date: Tue, 29 Apr 2025 14:09:07 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/13] include/system/hvf: missing vaddr include
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, kvm@vger.kernel.org,
 alex.bennee@linaro.org, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-arm@nongnu.org, anjo@rev.ng, richard.henderson@linaro.org
References: <20250429050010.971128-1-pierrick.bouvier@linaro.org>
 <20250429050010.971128-3-pierrick.bouvier@linaro.org>
 <e178a430-7916-4294-b0c3-60343ce6f023@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <e178a430-7916-4294-b0c3-60343ce6f023@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: jVpKmQIx79KS

On 4/29/25 12:13 AM, Philippe Mathieu-Daudé wrote:
> Hi Pierrick,
> 
> On 29/4/25 06:59, Pierrick Bouvier wrote:
>> On MacOS x86_64:
>> In file included from ../target/i386/hvf/x86_task.c:13:
>> /Users/runner/work/qemu/qemu/include/system/hvf.h:42:5: error: unknown type name 'vaddr'
>>       vaddr pc;
>>       ^
>> /Users/runner/work/qemu/qemu/include/system/hvf.h:43:5: error: unknown type name 'vaddr'
>>       vaddr saved_insn;
>>       ^
>> /Users/runner/work/qemu/qemu/include/system/hvf.h:45:5: error: type name requires a specifier or qualifier
>>       QTAILQ_ENTRY(hvf_sw_breakpoint) entry;
>>       ^
>> /Users/runner/work/qemu/qemu/include/system/hvf.h:45:18: error: a parameter list without types is only allowed in a function definition
>>       QTAILQ_ENTRY(hvf_sw_breakpoint) entry;
>>                    ^
>> /Users/runner/work/qemu/qemu/include/system/hvf.h:45:36: error: expected ';' at end of declaration list
>>       QTAILQ_ENTRY(hvf_sw_breakpoint) entry;
>>
>> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
>> ---
>>    include/system/hvf.h | 1 +
>>    1 file changed, 1 insertion(+)
>>
>> diff --git a/include/system/hvf.h b/include/system/hvf.h
>> index 730f927f034..356fced63e3 100644
>> --- a/include/system/hvf.h
>> +++ b/include/system/hvf.h
>> @@ -15,6 +15,7 @@
>>    
>>    #include "qemu/accel.h"
>>    #include "qom/object.h"
>> +#include "exec/vaddr.h"
>>    
>>    #ifdef COMPILING_PER_TARGET
>>    #include "cpu.h"
> 
> What do you think of these changes instead?
> 
> https://lore.kernel.org/qemu-devel/20250403235821.9909-27-philmd@linaro.org/

Sounds good to me, it's the right include set.
I tried to remove cpu.h, and noticed the error, so readded it, without 
investigating too much.

Feel free to merge the current patch on your side (or the version you 
wrote, it's ok for me).
