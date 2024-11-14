Received: by 2002:a17:505:a60a:b0:1be9:327d:8ee3 with SMTP id qv10csp405033njc;
        Thu, 14 Nov 2024 07:23:57 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUWfF8L6kdKjn7Vqjr3E17ncTqfnYs43pyUsSsF9HBQkvNIsUIwmbcdWwfeGAr5Kh0+BMYfwPqIPmfZAg==@linaro.org
X-Received: by 2002:a17:906:3613:b0:aa1:e050:89 with SMTP id a640c23a62f3a-aa1e05001a6mr780389466b.25.1731597837340;
        Thu, 14 Nov 2024 07:23:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1731597837; cv=none;
        d=google.com; s=arc-20240605;
        b=bF2Q+9OIsNXSktXWHoV4gE6/Bbcokt0j0GYOf7j1MIuU/esAve7rxzsWaSJ0huue/r
         HBRb9ryiq0PC0DhK0ln7V4Ck9+cQyxiJa2/uycNsjYhN8XCR6d3NR8WQAOWv1GvscW/J
         khMv+QuJFPHqZM64Lf5ku2Z7uWuhyzyTpBbPuyMv7mpKjn/OJ6sWva1rFz8JHJYFLope
         MXSwLD7wpp/0EHl9MEa6StnmTaQGp3vkpVdKLDGqZ6MahgubWGNiKN3tH7Ubm7mNUOR+
         pftMwf7xBxOZwEArUd2NXNhl4/JaT3wHau5YIakRVOpdArTUdPFWweBs2Vu8glbsNO2r
         HQZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=Psa2/rvf8Lbi+UL8r1q4T33qhcyAOZrvng/4IgPHqco=;
        fh=hcTiOf5QAFbrN828grBFaU/V/8MheMre8XlbxqLS2XA=;
        b=ZsvoNMCqtBKrOvLjmVkAe30ykP9oB6FbcquwdrHDBIB2De9v0Jfm8yMt8RSYZ1u6PX
         HFvcdtyknh9HKPXpyuOBCNMsTvGUjnbJv0nZFFPoX51OXuFqbIGz7YKQCWSNUO0jT4ut
         kW56k/eDW0LTLdumL3jaQvL43in+lxjoH81ydXiOEgksnMFxEDj2DyGYd8RQolXSCB4U
         IgaABotSZoFQ5RUxS7iGY5PgJwW9mhquh/RkIA6vzhZifgtNxsTdu0mIlxwZRcwoKtvi
         Ekqyl4xKFBfS9onJ8up4tYpcZDTaMSLZGO4r6Z0Xbe9Wslv2m84hAa/AQfwBYRAFeD5O
         kDlQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BN4n9J27;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id a640c23a62f3a-aa20e035df5sor77840266b.13.2024.11.14.07.23.57
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 14 Nov 2024 07:23:57 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BN4n9J27;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731597837; x=1732202637; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Psa2/rvf8Lbi+UL8r1q4T33qhcyAOZrvng/4IgPHqco=;
        b=BN4n9J27MgJayP/znVhmZwIF2dXLFiznrYgZtxzFmwp3L0rXmzyXvkKMTZ1vdDtiV1
         RYDqqVTsYDAIoEpKtRhJxnOT6hst5ElFQmnOrbqkEWlwS848tlaRKvClaPpEnITGdTXH
         iQxVoCNyrjfJwcvkwFhij6mOsSShcJ39SMOZS8lHOktL491EFcz953XOuL3GYHLRvWDa
         xRxru5AvPg+XhunBGjudOH+UWsi3HO+73WdE7eeZJ400ma4uBp+I4c/lVQadhi1J+XFK
         owkpDAeHe0TjbtnSQtIxb5bRSBoP7D2u4P0Dzt3n8wCsrB48Po4OVtPWIT4kAHVHfJmM
         11wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731597837; x=1732202637;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Psa2/rvf8Lbi+UL8r1q4T33qhcyAOZrvng/4IgPHqco=;
        b=Zf63D2Pj02JSkIETz0V7V5fzYji3mGt08Srl8NQUdWAKoBa8ThQ78CGpYobRZo5UDP
         FbZsAm0BsBvraj8rcgi7AMuALJEoLdAcmQvn2MhE1U6DvoSP5aVs8MzZ+FvuSgdUq0K3
         nF0bGhkmV8hbDG5sOByXFy0yRwDPuTQwNf9dB6gyGozL82+z35EI2mWi5gnxhStKkOId
         OSgfHrNW0ck2NpNaErpRVDQ/Xk92dYbuGOMDgAN1fbA6Lf4+kSvh3J6ek57rYuHIcw5I
         c3nAhsAAfJLWZt1dv0DBS/BxD67rtGP25+ldLQxB8MscQZj1e+RbgXRyIkDXYy/nXJWY
         hHNA==
X-Forwarded-Encrypted: i=1; AJvYcCVzQSKbJlXaCzd1j1nBcmm7WJyc0SPFslO6K82AZm768/0XICWRdYzxLBOv89yPiORTIbUMuVNV3D1+qA==@linaro.org
X-Gm-Message-State: AOJu0Yza8QQZa7oAhT6Vb7G9l8svwuDaJx5hL3H8bN5CvacSbDmZXB9j
	N7HUIXRFgZjzsG7n7k9fqPfTgEpQ/Lw82tYAdFFQ0FBD3SerPfw4zsGYARs5huthyg==
X-Google-Smtp-Source: AGHT+IFFKT+995jjict75ZuqspeB+Rm5nBD/Y9eqEryE1HRq0+Uwt5QGvTOl0uTxZY81UYqEzAsalg==
X-Received: by 2002:a05:6402:354f:b0:5cf:3d22:6dd9 with SMTP id 4fb4d7f45d1cf-5cf3d226e2emr13033518a12.0.1731597836713;
        Thu, 14 Nov 2024 07:23:56 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.126] ([176.187.209.228])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5cf79b89d67sm660333a12.11.2024.11.14.07.23.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Nov 2024 07:23:56 -0800 (PST)
Message-ID: <50fac36d-86af-48ce-890a-033887da05e1@linaro.org>
Date: Thu, 14 Nov 2024 16:23:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/24] exec/translation-block: Include missing
 'exec/vaddr.h' header
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Anton Johansson <anjo@rev.ng>, qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org,
 Peter Xu <peterx@redhat.com>, qemu-riscv@nongnu.org,
 David Hildenbrand <david@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-s390x@nongnu.org
References: <20241114011310.3615-1-philmd@linaro.org>
 <20241114011310.3615-4-philmd@linaro.org>
 <8406e329-5b09-4960-b5b7-baca62d3747c@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <8406e329-5b09-4960-b5b7-baca62d3747c@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: puk7Hh5Qx+5a

On 14/11/24 04:10, Pierrick Bouvier wrote:
> On 11/13/24 17:12, Philippe Mathieu-Daudé wrote:
>> 'vaddr' is declared in "exec/vaddr.h".
>> Include it in order to avoid when refactoring:
>>
>>    include/exec/translation-block.h:56:5: error: unknown type name 
>> 'vaddr'
>>       56 |     vaddr pc;
>>          |     ^
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> ---
>>   include/exec/translation-block.h | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/include/exec/translation-block.h 
>> b/include/exec/translation-block.h
>> index a6d1af6e9b..b99afb0077 100644
>> --- a/include/exec/translation-block.h
>> +++ b/include/exec/translation-block.h
>> @@ -9,6 +9,7 @@
>>   #include "qemu/thread.h"
>>   #include "exec/cpu-common.h"
>> +#include "exec/vaddr.h"
>>   #ifdef CONFIG_USER_ONLY
>>   #include "qemu/interval-tree.h"
>>   #endif
> 
> I'm a bit confused by commit message, but it seems that this series has 
> some commits that will not compile. Is that something acceptable?

Because commits must be bisect-able, that is not acceptable.

I took a lot of care to make this series builable on each step,
but might have missed something. Can you point me at the
configuration used and broken patch?

I'll reword the commit description as:

---
'vaddr' type is declared in "exec/vaddr.h".
"exec/translation-block.h" uses this type without including
the corresponding header. It works because this header is
indirectly included, but won't work when the other headers
are refactored:

   [error]

Explitly include "exec/vaddr.h" to avoid such problem in a
few commits.
---

Does it clarify?

> If it's ok,
> Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> 
