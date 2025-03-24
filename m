Received: by 2002:a17:504:5f65:b0:1be9:327d:8ee3 with SMTP id gl5csp2196629njc;
        Mon, 24 Mar 2025 13:04:07 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCX30S2QbXUvSX5mMw7hSc1hlafyaO2eTjnbsl/TCz9pYgbBEdIMU8KVqYG6N6wkZxrwpmO8v84UOd0NSQ==@linaro.org
X-Received: by 2002:a05:6a00:22cf:b0:736:a638:7f9e with SMTP id d2e1a72fcca58-739059667f0mr26433281b3a.8.1742846647126;
        Mon, 24 Mar 2025 13:04:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742846647; cv=none;
        d=google.com; s=arc-20240605;
        b=IiWHESzikEb+KAx+7r/HFcsdLIZNxDm686idSS+3L/EQosPdLs6sJaPLEfyeJRGOZO
         NydtPpj97pBDRjyUP+a86DqcpeBdEaiA0D7XDhiF4FOtS3BlcTtaZ+1N+b/KnRgBlXq1
         0XgcsrCCBfA6moU8KEb39hcXiD2l0i0pWj3DX8OPtk/nOF8A5Sk3ifHxE5UL6SOhYuIY
         EWs0LYTqkrois4tIApUviGPnE1aZSShxlAcTXk2Qz2MYKf79Cgi0H98/ncVYy+T1aCD5
         7635Bk0hdiU2qunSC2oqeKu+SVD7xo/Ebkt7YSUwxddilwUGWrQMnIXZyIjZj8q02yBQ
         Blzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=K22cW4qBn4awU7ILJ7ADy3cpZ5OQ/hdG+dxwswpBSjA=;
        fh=RBxchWGO1TGiXxaftlYP2m/1zYPvFP48vZgXbSUDw0w=;
        b=JvTerH0BlqkCi8v2XEHuynnfDH4B+ZnpeAAt0Gu1ta7bTOUzCMelmURdZrHtaagg8Q
         gCuZ6DsiKNIkkvX1m/03XTJkjVusJhyDmH25piJP8o2o+w/7TrRYSAIlS5ckPRjK6GA1
         JPCPMFl1tkOzIIViNnYf/AZVfALBCBb9OaJclz9FrzsAgGHPyp8IeX+Vkk4nW4UUZxsi
         kd2CYXP2EfpWAHf47O1qRWKYFpsuIOlzDo9cwy4nJNX5IyS3JJaXyjsHMyf+2AO3mv9B
         gon12+nGxnpzChvI4nbtxQXvODJGEBAV/YoktKaB1Kj6TEKhG/V1z5U/07fKfQBqfRO9
         h5Bw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fI8A6Fmo;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-73905f9fea2sor7606393b3a.3.2025.03.24.13.04.06
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 24 Mar 2025 13:04:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fI8A6Fmo;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742846646; x=1743451446; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=K22cW4qBn4awU7ILJ7ADy3cpZ5OQ/hdG+dxwswpBSjA=;
        b=fI8A6FmopfWg4xHDI3AgbUDrOseCBYzX6hhVBU1Ee71gHJxSnxYh83b8WZWREyILkb
         IHN28HNiRdIdcE5MYMQxqmyrlpLfPthVmIdcfDYag/l1ghZ3NTZGyNRUgrIrVdfmXPbw
         NStNtKvkEFBXYUqv3hMaSfw2F5NbmbsoUgHrUV/Vx1bBBbBT6kZRuhNn+7GPA6N/WKnC
         xJjPEJZobKHtOerqqJe6NKjtYYaitr2CtGMEQe1VoXP+OSwaey9TaEgcJEeD1WF0z4LQ
         RP3j+35hyyR/5SW39W/mZuZe47PCrOIFL4XnIjR3NVXL/09/9vN7BsLLcj/3gydWOGG9
         BPdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742846646; x=1743451446;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=K22cW4qBn4awU7ILJ7ADy3cpZ5OQ/hdG+dxwswpBSjA=;
        b=HEACIyo8uUmvLVyYnMcvogzLlqlM1eE7Vm1qoIXSsKVjOif8WPl5HncuAJpOzoSpwC
         P3p4LFCqsBBih6x5jWf21kMcUZsUEqKM0hBhYd986mMhJjuLCpx87i7roa8mrutiDmMu
         1qi9HCkWxNvjk5MPIbx47jIOD73AHkLfC8i3FsBiuwdx+cX80wWzo6DLrNqNOaHL1NV7
         TKB6A/dpX++FzarSOcXGe469cAQg4hxL4ioxphr6cEMCsCgXFtrBX39VkAGF746SF+h6
         8wST3IW78o5b934AvFIcc3zzkb/e8N6e/z0W3rVQj7o/KNKNdqM9qJRmQQptOM9Zasy2
         JrtQ==
X-Forwarded-Encrypted: i=1; AJvYcCV96YHSip8Ao04hUaOJ7Q+2lonVJc+Y8Fg74VuTeMQRjYx4guigtz11vXGyjSxROXN9d1i/aLtFnKt7YQ==@linaro.org
X-Gm-Message-State: AOJu0YzY3q/q5Bu9wK9A+2caK/Et21mGaNjNT+PN88e3U4FhPueAupcL
	XuB7NGlrVoT/Hx46lu9SDz4t6Qag/LUkGTiLnO/VzrdhF21L8UsXD456VE2lKbrBjA==
X-Gm-Gg: ASbGnctaxdV442BZb2IV8bdrQOSgRaahXfzriNNLsoITQ0xnUT/eVObz5NOYcf6Jz47
	U+B9ow4lDByyBlmissGCXeC3GpfcaqEqQKMSsKPkn9/YKkzcpWmJh930BNdpQet7CVAZ7+YtfEl
	9Hs/eUyBrRUKfsYR01084wJVkukjcav7qhjLyUXCdBXIAw6oWf6Vsb5LOGccuEua9Cc9pkwY9Td
	CCzTA3u2qOITnsQIpWtvHodwXUlUHzOgVDz+EHmA7ysmo5OMj7HMUQjR2BrZEx0M90kurqrYP5x
	vj1zxWTC6iQUyp3KlgIDIq8nawK7RlmQJdypOd09Gc8/yEutJ/khp3RyiMcnw4yga2bzhLTLahS
	f/AIvyeWw
X-Google-Smtp-Source: AGHT+IEi4DaDhIyAxt2r52Nvm/SXYDg7U38Tkz/CjmH8BAYuaiOLsGKzgMN+R2tMoABfqDm4Fe5apQ==
X-Received: by 2002:a05:6a00:ab0d:b0:736:a77d:5412 with SMTP id d2e1a72fcca58-73905999e48mr21388813b3a.12.1742846646388;
        Mon, 24 Mar 2025 13:04:06 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.0.4] (174-21-74-48.tukw.qwest.net. [174.21.74.48])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7390600badfsm8433350b3a.83.2025.03.24.13.04.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Mar 2025 13:04:05 -0700 (PDT)
Message-ID: <f2fc4de2-7235-4c86-8574-2b8d630e5cd6@linaro.org>
Date: Mon, 24 Mar 2025 13:04:04 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 09/11] target/ppc: convert gdbstub to new helpers
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Nicholas Piggin <npiggin@gmail.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Markus Armbruster <armbru@redhat.com>,
 Akihiko Odaki <akihiko.odaki@daynix.com>, qemu-ppc@nongnu.org,
 Thomas Huth <thuth@redhat.com>, David Gibson <david@gibson.dropbear.id.au>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-s390x@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 David Hildenbrand <david@redhat.com>
References: <20250324102142.67022-1-alex.bennee@linaro.org>
 <20250324102142.67022-10-alex.bennee@linaro.org>
 <c99b4b18-2222-4868-9e2d-78305e530663@linaro.org>
 <7a60e516-e224-4766-830d-20e14bba3c8e@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <7a60e516-e224-4766-830d-20e14bba3c8e@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: Jr718pwN0YlD

On 3/24/25 12:29, Pierrick Bouvier wrote:
> On 3/24/25 10:39, Richard Henderson wrote:
>> On 3/24/25 03:21, Alex Bennée wrote:
>>> +    #ifdef TARGET_BIG_ENDIAN
>>> +    MemOp end = MO_BE;
>>> +    #else
>>> +    MemOp end = MO_LE;
>>> +    #endif
>>> +#endif
>>
>> That's what MO_TE is for.
>>
>>> +/*
>>> + * Helpers copied from helpers.h just for handling target_ulong values
>>> + * from gdbstub's GByteArray based on what the build config is. This
>>> + * will need fixing for single-binary.
>>> + */
>>> +
>>> +#if TARGET_LONG_BITS == 64
>>> +#define ldtul_p(addr) ldq_p(addr)
>>> +#define gdb_get_regl_value(m, b, v) gdb_get_reg64_value(m, b, v)
>>> +#else
>>> +#define ldtul_p(addr) ldl_p(addr)
>>> +#define gdb_get_regl_value(m, b, v) gdb_get_reg32_value(m, b, v)
>>> +#endif
>>
>> Surely you're not intending to replicate this in any target that can have multiple sizes?
>> This is not an improvement.
>>
> 
> If I'm correct (and from v1), ppc is the only architecture having registers defined with 
> target_long types.

With a quick check, mips, riscv, sparc do as well.


r~
