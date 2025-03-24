Received: by 2002:a17:504:5f65:b0:1be9:327d:8ee3 with SMTP id gl5csp2233823njc;
        Mon, 24 Mar 2025 14:21:04 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVBTn3cJL5EMMsSsSPdZj1Q2OcID+pU8pcrqd2WF2FWrAoBI+ITKrrmPe76LP5r6OBE8ni5PhS4bky6JQ==@linaro.org
X-Received: by 2002:a17:902:da8f:b0:224:1219:934b with SMTP id d9443c01a7336-22780e23677mr206408215ad.50.1742851264155;
        Mon, 24 Mar 2025 14:21:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742851264; cv=none;
        d=google.com; s=arc-20240605;
        b=RCXReVMqE4B1J1uDvng3AJTwWfKPrqmcJka6xFSfCriWlmD+FV77XlqFxDDs81Z2tB
         Mw0TO6pj5UH/yBD7j7/bwsNnV/GRt3p+iTxBOdUvqhL5B19RdEw+MmmZAz25ybmun/xV
         T3N01BN4EyMjnTepwV7Sg3nCFG1aY2UX6Zq/DDtrmIxtgX9+hMr9t3rZp42s1Mp7pnbV
         PLqvlkNKaIkV9+f4gIgQrUBS1DkeW2k+lCMJOMVbBN0DfDAZ8C68u4xZ7V6+wqJe1SYv
         SQzou+LLXH+3mykXFgQjonb6JLDbkJdH17zWAMmPR2ifP+uKbjUGbff9vuDE/jgGM/SW
         A7Pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=8KoheoYm5HA8VcAgE260OGydvMzV1ButV3Mzz5BT064=;
        fh=HYHQZGt6MXyoOQz3PC/cXtE6kKDAoCZLl6T2FCTbpS0=;
        b=Rse3W2hP8cZCs4MllKEgM80h9gzQ5YqZzBt++wqXL2yT4FYH6G0sH3YzARbMCDF69y
         egbtRlwGMGcGIoJnFSXKw1SedObM5fKThrL0xsE7ahfgQYrgyCjqIovv1wvt2K4YECwT
         W2lV9CUxPlXVUz5pAqc2t/7jK0eQcAmKbzgOrw6zT6Z2o05JyHxpupw9NKqiRNhx9KqZ
         ndVyE/YBOcLk0nprZX89+Y8y2tswEpjs8DdEScEVA5vD16k1fbn+4U85WdAVN8kRRbP+
         bk1vJQ+bB+27to6uXIzWy9dBo5HEH9f2tMhwlyXjwU0JaXgxqV39KofhaJBITkTKP1q5
         QPig==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Oyv8fh8E;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22780f2fba3sor70628365ad.6.2025.03.24.14.21.04
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 24 Mar 2025 14:21:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Oyv8fh8E;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742851264; x=1743456064; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8KoheoYm5HA8VcAgE260OGydvMzV1ButV3Mzz5BT064=;
        b=Oyv8fh8Ey9Lr563D1XxFtZ6NiS7KXBaQpRPe/LTrTHWj66ObrRot1JKnt+x1bZzDyE
         XDOMb9Lbp3NBQxQeTjIrhnK4okTgWAUkkIRALf20UjrOUeuzB6hnNUxaB9ZASz8FjLvZ
         DFRt+kuYVjCRNFJSRkDjFpJJ3xDUJzH8gM5oi7zavlZDEtG4nv8IRrJm8Kup6O8ScREd
         X/YrgY9aBLj5XlMsgKTHPyLSj0lxyu4b1ADFtypT9K2ljiWKau2nqPnSooke5K5dyYAI
         yOU+aJkawNi+lCi1GFIdYP1scXguUOz1RuACHEXbOOrWBSFKmqhlgxWiijT0ywF3Nbst
         CARA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742851264; x=1743456064;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8KoheoYm5HA8VcAgE260OGydvMzV1ButV3Mzz5BT064=;
        b=GjBOI5fhyapZxGqJTmG/41LJhIVvwNQqPrX+FZiZS2t1RjnYLXVCQznlb+yGYp/Vlc
         /bRS0ZAl9Iq1ZkTLOP51d8/K2VERnzpz7c3ZVRxLzE90KZFGWy7IJaj8rIsB6glXO4M6
         /lztMeJwQTQe/kt1gcYB7fWPJfQgOWG53QsLMrlyVuuWLPWWmg0CluKhyy0ZSZHkHFI8
         FbUiTRqw3NIhoFnBG/aXIT0saTKD/M/2PDJP/aUzfO+uKrg383DGc9d8h2QY5arTXrcW
         jAcjNFDUNgiEyDoBP5zjoH65NcUw5n7irIOtAbb/zCBvtl/9BLbPm3ZY7qqaKLidNWot
         gbyQ==
X-Forwarded-Encrypted: i=1; AJvYcCVgSTZgWMNfqNEe+bPky2rQxtu9vkMBbUUCGbLbl5WTKnUWHy5QM1WyWO/flAC8SfvTfBqzqqFIh8hJLA==@linaro.org
X-Gm-Message-State: AOJu0YwG7FWC0aFGRV8oQgDW8bQrfz8REdPi/lH9lYQP6RM4lEKxq7XU
	yCHk3ev6fd3MjcOalmOoU9zvCRcSinYlYJsFl+8gPC4Bu+l4k05iG94jDN8jDbmkWg==
X-Gm-Gg: ASbGnctu4D71f5qyutmprck3KTdxYUdHcwLvVaEdNrTS+pcT9CW+rqWOarHx5bC/BBy
	lMRSIqPBDsn27kxiGaFYkz/BUZ3TBUvW1EKDZKvQTzOpzffCCaGxrQsFh/IPjfhQ41HTELDoFXA
	+TTCCN+5f++mM/rjJoIg47iF/8jS7nLiIQJYitfjpLG067bsEfzOWzACmU/nU4HvIEe0J8J2Sf4
	rqTfE0+mzcFb6KIxNTyJwWBCpETGtkI6/zG/qxP1cPz8HH+nvg+a21LTqKxmUAgUBd9KJvvMq8Z
	a+h5ssb3wnS1WsuAmjBPWr/IYgZ9P13rvmoSD5DGRNE61zxY+LZLIPksTw==
X-Google-Smtp-Source: AGHT+IEf4rgByTR4aUAXXQim/ntEXH4+OOahy31CtY4lDoOHPzpvMBWbyGzjrmwJx01AD+FrvarBrQ==
X-Received: by 2002:a17:902:f648:b0:224:fa0:36da with SMTP id d9443c01a7336-22780c7c06fmr193333595ad.18.1742851263523;
        Mon, 24 Mar 2025 14:21:03 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from [192.168.1.67] ([38.39.164.180])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7390611d3c0sm8504961b3a.89.2025.03.24.14.21.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Mar 2025 14:21:03 -0700 (PDT)
Message-ID: <231d6e5a-f8c8-4b16-a455-44e9bb8dd011@linaro.org>
Date: Mon, 24 Mar 2025 14:21:02 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 24/30] meson: add common hw files
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: kvm@vger.kernel.org, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, Paolo Bonzini
 <pbonzini@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
References: <20250320223002.2915728-1-pierrick.bouvier@linaro.org>
 <20250320223002.2915728-25-pierrick.bouvier@linaro.org>
 <2650a767-a829-4544-99f9-42e23b131da3@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <2650a767-a829-4544-99f9-42e23b131da3@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: Jf/99I1F0KDU

On 3/23/25 12:58, Richard Henderson wrote:
> On 3/20/25 15:29, Pierrick Bouvier wrote:
>> Those files will be compiled once per base architecture ("arm" in this
>> case), instead of being compiled for every variant/bitness of
>> architecture.
>>
>> We make sure to not include target cpu definitions (exec/cpu-defs.h) by
>> defining header guard directly. This way, a given compilation unit can
>> access a specific cpu definition, but not access to compile time defines
>> associated.
>>
>> Previous commits took care to clean up some headers to not rely on
>> cpu-defs.h content.
>>
>> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
>> ---
>>    meson.build | 37 ++++++++++++++++++++++++++++++++++++-
>>    1 file changed, 36 insertions(+), 1 deletion(-)
>>
>> diff --git a/meson.build b/meson.build
>> index c21974020dd..994d3e5d536 100644
>> --- a/meson.build
>> +++ b/meson.build
>> @@ -3691,6 +3691,7 @@ hw_arch = {}
>>    target_arch = {}
>>    target_system_arch = {}
>>    target_user_arch = {}
>> +hw_common_arch = {}
>>    
>>    # NOTE: the trace/ subdirectory needs the qapi_trace_events variable
>>    # that is filled in by qapi/.
>> @@ -4089,6 +4090,34 @@ common_all = static_library('common',
>>                                implicit_include_directories: false,
>>                                dependencies: common_ss.all_dependencies())
>>    
>> +# construct common libraries per base architecture
>> +hw_common_arch_libs = {}
>> +foreach target : target_dirs
>> +  config_target = config_target_mak[target]
>> +  target_base_arch = config_target['TARGET_BASE_ARCH']
>> +
>> +  # check if already generated
>> +  if target_base_arch in hw_common_arch_libs
>> +    continue
>> +  endif
>> +
>> +  if target_base_arch in hw_common_arch
>> +    target_inc = [include_directories('target' / target_base_arch)]
>> +    src = hw_common_arch[target_base_arch]
>> +    lib = static_library(
>> +      'hw_' + target_base_arch,
>> +      build_by_default: false,
>> +      sources: src.all_sources() + genh,
>> +      include_directories: common_user_inc + target_inc,
>> +      implicit_include_directories: false,
>> +      # prevent common code to access cpu compile time
>> +      # definition, but still allow access to cpu.h
>> +      c_args: ['-DCPU_DEFS_H', '-DCOMPILING_SYSTEM_VS_USER', '-DCONFIG_SOFTMMU'],
> 
> Oof.  This really seems like a hack, but it does work,
> and I'm not sure what else to suggest.
> 

Yes, it's the best (least-worst in reality) solution I found.

Initially I simply tried to add them to libsystem.
However, it has some problems:
- Impossible to link arch files only for concerned targets (or you need 
to add when: [TARGET_X] everywhere, which is not convenient).
- They need specific flags (most notably header guard -DCPU_DEFS_H, to 
ensure we don't rely on cpu compile time defines), which is only 
achievable through static lib hack already used in our build system. So 
another library needs to be declared.

> All the rest of the meson-foo looks ok, but a second eye couldn't hurt.
> 

If someone else has a better idea achieving the same result (maybe 
Paolo?), I would be happy to implement it.

> Acked-by: Richard Henderson <richard.henderson@linaro.org>
> 
> 
> r~
