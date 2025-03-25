Received: by 2002:a17:504:5f65:b0:1be9:327d:8ee3 with SMTP id gl5csp2489134njc;
        Tue, 25 Mar 2025 02:22:09 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXHZxr7N7gGVVyfdXiNcv48brAwxt2iA5GNaVMZhQpKma6PMLTGgaecg25I61MmLiT0FsDUAe0cb5gHfA==@linaro.org
X-Received: by 2002:a5d:64ce:0:b0:398:fd9b:b935 with SMTP id ffacd0b85a97d-3997f9407b6mr15184220f8f.53.1742894529165;
        Tue, 25 Mar 2025 02:22:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742894529; cv=none;
        d=google.com; s=arc-20240605;
        b=aMDIzjKvl2TBTNovRYHk3aCWoD3TTXiv1K3IyMgtee5QiSLhZQGWeSZRr2ugDLxYGk
         OAwgvMmjEwXvyuWYJpvJ1bs7PHGZltX9ZGtQPHWputG8k3jf1878W20IVvoWXmZxtrjP
         Am3apixzhqOUJgYSS3+29SMCYw4rEhIP0vKXa+CxPFz6WrxM0yR7bvfoQT+khF4HOcH/
         z88KwE62PlVkB1OMvFRmaoYLGw8jEHb0hyuixofGJq41tc5BS3u/uMKyfV7akhmDl+sC
         B9YMBCgha6cfN9QlFEltGtSi+f+YBmalqApSc5ex8hPD1w2lht/+22omMLPUISDBG+Xq
         1/tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=71RvBOAOQfE9OhpYm5SKcAiC6VgyqIl/XhKPHqIjpjM=;
        fh=1gKwZrMOY3r57XDA94poaNRkAwkRa036aG1j/ciZlgw=;
        b=AZ6bSJKCa7wWLUNPTXeAfVvOlZV3BS+yBqVeu9oH3oi6OVru5uwFvEOMWn+NDG6YH+
         ckg6hopfMIlaACJubmMS9wPYw3T86070zUtO0jIQeQ3PLg41reFEWmUBWtPUvzoD4p0H
         uaz3EZ5vVgxbz3P99c3bsu7L/d4aWajU9ttDScLsbBEqKNkvSpC1fQS9dddPyOquQ+30
         vnUzE3v0TtJSs3b9TSMVZCqUSJ/rux1ADkXSzlbntsr76WRs8+frV/vjJF2DXG5jK3Xg
         KCL/4vGhNwZqtitKWyQ3z+XOpBu9Ssy8r1OrtpZbVC+UbyVcqqIUfFx5ktG5/GBTYVxO
         gA8A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=C9JVhBMC;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-43d4fefe616sor42930415e9.10.2025.03.25.02.22.08
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 25 Mar 2025 02:22:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=C9JVhBMC;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742894528; x=1743499328; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=71RvBOAOQfE9OhpYm5SKcAiC6VgyqIl/XhKPHqIjpjM=;
        b=C9JVhBMCOBS6oBOgjKV0YUSkPy2AEiPXA88uZHLJsib8omN+GELQN/UZqv9z7F6qyz
         WSdHSpVfDcuhDazWi1r7VpnJwBjWXyTNc6BL2T4GXLhLcNQDVwVrcCZ0NV+UnrrEhx8j
         WoRZ264t6S3GyIgJvOJiovrqtq1DYQQ5XKsD5vc6mOyAD3iY1FH417ram5nm2mA55moh
         BNd4Z/+xUPqXhwuCdHAbaBSy/9VOBUeCkH6BA3kYfGeLLvqkhr49EUs+sg/zQ+bZc1pe
         r4y+G57Si3TZDfTQuSPmJSEX+HwUPAQx6fCTF7lGs+m3ow7HePTKxcYor1CHzZG3Xqpq
         RnbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742894528; x=1743499328;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=71RvBOAOQfE9OhpYm5SKcAiC6VgyqIl/XhKPHqIjpjM=;
        b=pHG33as8AWWHJb8diVYNKv/ayjiFipbISS8O9dtztFRcloNhk2qMlesrrklmDx98sI
         lOZx2K30yJoprm3WHNckyJ4KEsRwGxKlcpHlp91WV8ABzkBQepfYBg6k15TWtWq/sAhW
         YNdZL1ZmsIdsyzYTtYDL74rsqsRHuwHZznp38RFah1WHkxDnoAJVvEs/P/d7GBMZX7uD
         8X+w/7m2LmHp38dVSDa2dEbS6BXF2fo9FHroZBtbTu4aH0lpoM1qtIEEKbnToZxnFA0S
         taiKi4krYuzksRgOpTPoOddlEouekWS1k0fCRh75PbBe0zHNT6B+B1MadRTJJNpxYXoE
         l/qQ==
X-Forwarded-Encrypted: i=1; AJvYcCWMtuztonHqCqh8pngw83QdUkTWpwcds4mvFI2+DHhXQGd19BEZ9kG+OeZEZmiR+dMu2llaNhK/i8UbhQ==@linaro.org
X-Gm-Message-State: AOJu0Yxc4VTgUpWb75reYCtaIA2g94QcllIMsCM047UsMFMWObxQ/ooT
	0Kd+WW3Puf3mV+VhwGUt9DkI+xTxdwLmTSjediKvzADkAgXYxwFJ3FwjrNZ2+HBeJA==
X-Gm-Gg: ASbGncsz5ShSMBIY0goH5UdFP3VpkN1ROWdIzMpvb5xYSZ0IQyUYjc0ZjQ7bsovGVAS
	6JjDo2rwUVwW6J7fJiKrd0pDSTv+LIizEuwHZ0wvHtgvV96RAFq65Q1kXiJ6Nq5C8pec9m06S0b
	C01P0nTa5DRral/y2R95hQMnLa83c0QFZE+uY/YaKufzcGLvu064ZLhMsw4WkKqcVFbHB+W2gju
	e3z80V3KnVfsaUACZd8xQoVjLqHpiY4tubZtWw6X0jTHrzPFj1RFz9MXHMBMlvyxHmolIFXDokn
	RCYVXtDQWN1am52GldnUoal27QqwzDMFE50u/qSRFDYJv5EN05Mrs2NwFtRmXgfMR4oviYD8oKr
	zm17uZQspAyA2
X-Google-Smtp-Source: AGHT+IFO3zTzJIztdYqhK2y/r4LlVYawe+R2NThRj0xrIgZq3OIzebqoKnh9hrcx8WNvgyuyYo8YwQ==
X-Received: by 2002:a5d:6c64:0:b0:390:f9f9:3e9c with SMTP id ffacd0b85a97d-3997f910184mr14486976f8f.25.1742894528576;
        Tue, 25 Mar 2025 02:22:08 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.235] (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3997f9a345fsm13042133f8f.24.2025.03.25.02.22.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Mar 2025 02:22:07 -0700 (PDT)
Message-ID: <6fd61c99-c753-40bc-b6a0-8b40e0c3956b@linaro.org>
Date: Tue, 25 Mar 2025 10:22:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 09/11] target/ppc: convert gdbstub to new helpers
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Nicholas Piggin <npiggin@gmail.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Markus Armbruster <armbru@redhat.com>,
 Akihiko Odaki <akihiko.odaki@daynix.com>, qemu-ppc@nongnu.org,
 Thomas Huth <thuth@redhat.com>, David Gibson <david@gibson.dropbear.id.au>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>, =?UTF-8?Q?C=C3=A9dric_Le_Goater?=
 <clg@kaod.org>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-s390x@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 David Hildenbrand <david@redhat.com>
References: <20250324102142.67022-1-alex.bennee@linaro.org>
 <20250324102142.67022-10-alex.bennee@linaro.org>
 <c99b4b18-2222-4868-9e2d-78305e530663@linaro.org>
 <7a60e516-e224-4766-830d-20e14bba3c8e@linaro.org>
 <f2fc4de2-7235-4c86-8574-2b8d630e5cd6@linaro.org>
 <4ff5ca15-6784-4660-b6f5-9c219d215378@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <4ff5ca15-6784-4660-b6f5-9c219d215378@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: id0dTtbs54Yy

On 24/3/25 21:49, Pierrick Bouvier wrote:
> On 3/24/25 13:04, Richard Henderson wrote:
>> On 3/24/25 12:29, Pierrick Bouvier wrote:
>>> On 3/24/25 10:39, Richard Henderson wrote:
>>>> On 3/24/25 03:21, Alex Bennée wrote:
>>>>> +    #ifdef TARGET_BIG_ENDIAN
>>>>> +    MemOp end = MO_BE;
>>>>> +    #else
>>>>> +    MemOp end = MO_LE;
>>>>> +    #endif
>>>>> +#endif
>>>>
>>>> That's what MO_TE is for.
>>>>
>>>>> +/*
>>>>> + * Helpers copied from helpers.h just for handling target_ulong 
>>>>> values
>>>>> + * from gdbstub's GByteArray based on what the build config is. This
>>>>> + * will need fixing for single-binary.
>>>>> + */
>>>>> +
>>>>> +#if TARGET_LONG_BITS == 64
>>>>> +#define ldtul_p(addr) ldq_p(addr)
>>>>> +#define gdb_get_regl_value(m, b, v) gdb_get_reg64_value(m, b, v)
>>>>> +#else
>>>>> +#define ldtul_p(addr) ldl_p(addr)
>>>>> +#define gdb_get_regl_value(m, b, v) gdb_get_reg32_value(m, b, v)
>>>>> +#endif
>>>>
>>>> Surely you're not intending to replicate this in any target that can 
>>>> have multiple sizes?
>>>> This is not an improvement.
>>>>
>>>
>>> If I'm correct (and from v1), ppc is the only architecture having 
>>> registers defined with
>>> target_long types.
>>
>> With a quick check, mips, riscv, sparc do as well.
>>
> 
> Right, I should have run the simple grep :)
> So it's better to keep those macros defined in a separate header (out of 
> helpers.h, like helpers-target.h), so we can already start to cleanup 
> some targets, and do the rest of the work for the ones using 
> target_ulong type for later.

See also
https://lore.kernel.org/qemu-devel/f9131f6e-e843-48be-b85f-c341ec198154@linaro.org/
considering s/TARGET_LONG_SIZE/target_info_long_size()/
