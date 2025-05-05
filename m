Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp2651739njj;
        Mon, 5 May 2025 11:53:21 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW9ZyI2H4Ath4slk0E8+S8IkYnJhBuQAOL04Z9zQQSRarkMtrUV6VCxXipDk9Nm3nLzwXOIL5QwcS/cEg==@linaro.org
X-Received: by 2002:a17:902:dacd:b0:223:f9a4:3fa8 with SMTP id d9443c01a7336-22e1ea71944mr130388545ad.19.1746471201049;
        Mon, 05 May 2025 11:53:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746471201; cv=none;
        d=google.com; s=arc-20240605;
        b=Y/v3LOIZ62AQpfsYmlxk5rD7Kdz/IYZrpNeXKUzubOvDTkTTbhBi3Lh/g4WEnNDZZs
         FZojQ6VNtnSaYDnrJixt2+RNAPNRjUDQu3FX6zSgkYFAsHMcGNzJMz/4h5qbdFSJT3+5
         42NhO+cnIwQrDE/TzGQDWV7UKiYbVgQ+hXO2RjreCUv1jWOESQ17VcfnfMiZxbHPbN32
         nHShsqnjFBRBmiV3jl6a1j850N43yqfTA82Uh47JUsxwUdeUXfBzbGdLDW9LfO4Vxo0b
         izX3FY1vXM/F0fY/OznAZQ5y00rq+Q4rSQxIIS5/UD/YZqq44KdH+WcakO1QkPIhCMes
         ysZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=WW2PugbCueDfTe7SCxeY/0K3L52JtpHstHxnpx2N9c8=;
        fh=Em7ZbqNrzEXbkmwn7db7xHNoioU8JbXVjAiuc9qCAaA=;
        b=i595uUjY/aOq34utMCxIHlahYrPLq5TvVJV0KEfurhdanUP9TYeZmiEgK5x2xMvVe8
         K8yZQ5H9u3Mk/+Lj91r6N1VHrJdR1ieWPm6UNGyp+rDmpD4b/lsAphES0ocWSCyVN8OP
         OisOpxPuqMe2C8xcVXPBfxrN4BAFBvkqMFbT8APec2B05fWVR3hEKaceAUZHHYMNiob6
         SHp5g0Rdgw7n1vM5QUwKnbonhnJ3Y72NS+6U6xfanRc4mMN7MPeU1m0wGCYf/yr34cll
         Jvd8rUT7PqzJlTTPqpIlH8J0HARDiF7T5BBJIMTCAKm5p1d9vycShJ3j8T1K9YlxGqus
         EwQA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="N/seUa8b";
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-7404fa0dcc5sor4204706b3a.10.2025.05.05.11.53.20
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 05 May 2025 11:53:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="N/seUa8b";
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746471200; x=1747076000; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WW2PugbCueDfTe7SCxeY/0K3L52JtpHstHxnpx2N9c8=;
        b=N/seUa8b8b62X8wyjSpwmJzm73jAPIbxVZ1h+vldNoa2cV6qeO2ApHS9I136e0vpo9
         DR/Y06jmS9XtkXzYUde8T67c5NYEhSLCC/wKLo4x90ZeV2N88EFtvcpIsUNsUjWtYkfk
         O4DTagUKN9QNBpf0qooVfFFO61YJ5TKfcsRUhdtBGPE7fP6bIaKg1qQUPWleZ1pcrif9
         HVcL+qsTCYalIv3ZiNrGnhPH+qLeo2eQTHZho7uFFQ/rPmbWWK7pDs68nUut7UG75MAX
         Un0WInrvSVYWJNzRqLV+r9EE3hUzu7QzDOf8Ud6mmVO1B2EmVXj/hvWd8E5YkuOoEkUf
         ZNBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746471200; x=1747076000;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WW2PugbCueDfTe7SCxeY/0K3L52JtpHstHxnpx2N9c8=;
        b=kPszPYbQ/LPabs6iyN3KSdvk1zCtjbdgMg42/ujX6+di6vRiuwANtSyMmwgT5Z0obL
         UDjvCjkzwBeJUOoYSzVttCMj9c1DCABQmUXjrqBQXwe+0Jfhr+PWuaTdhr9Bj2hyTjcF
         EH1pUx8Yrm+LIrc5d/DQfgBV5dcHzN0uHqo3TSoplNGR9L/eXF5RsspC8Pn8tJ18iHKf
         Rc2Vz9AosxjruMI5gdXuYlpY++g0DymoVnLL8KAgm6hbY1BX4Y7u89yvwmmTiv+3/1dB
         BEVbTSq2h/ZzBbKnvXrfeKAzvOIdblw1eN0jWzIUUJMxy7YiacUtvfeU1Idq4A/Yptgj
         XxGQ==
X-Forwarded-Encrypted: i=1; AJvYcCX9EeNZ7wGSn2DMS9MIZokpw7njSClUoEMeh0IeEYtV4urp0UXFeinWz03MY6XXBxMo/CpbdDCZm+ttRw==@linaro.org
X-Gm-Message-State: AOJu0Ywkg5wThlf+XiLouiXziN3RVjc29Ielz8u1mTPm1oj/ZwifVelA
	BT/QD3xIGwR5GstlqRA9x2SXVdVj+dcZv5SogDubAomXrmg681A4dGrO2DafreDojg==
X-Gm-Gg: ASbGnctfYiCtmwc1r/3Kyvo/WDOkDzlH2YO0I8+qRWLq6S0CEo2N+9tAjw1QEbafRuD
	y+jf0/hyyXJCjdMXPAApNmSbQbpEa2dvv2ptCS1fFAVqJfPjxkWhISGETFoHX0SnQFCN7VgFguR
	1UZcD5XkaL5HBmqzF4Fsb/Eh8CejVplvcL7QmdE1bZcneaKB+qlLmXKm5VGedOmY1I6EOz/Bx5F
	g22d8h62iGrK3PUni1mnNzacXg1ju8qEXIxUlv7myXTaaUGo4/889ny+NZdXTy8W8UpzpmJm3ak
	us2XOVMw+E6pCz73z6rh8DzZvpsk4ApV5hQVPrHtme6sp9tkojxuZQ==
X-Google-Smtp-Source: AGHT+IHZVx9eBvMSyhsQT2CjKQPJmL9kB/iVWh/hm8ZsQ4A2jqzgMClBG9aBXB4nd+yyoHKnutlong==
X-Received: by 2002:a17:90a:e184:b0:309:ebe3:1ef9 with SMTP id 98e67ed59e1d1-30a6198d1e8mr14256650a91.12.1746471200600;
        Mon, 05 May 2025 11:53:20 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from [192.168.1.87] ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30a3484bc23sm12038442a91.43.2025.05.05.11.53.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 May 2025 11:53:20 -0700 (PDT)
Message-ID: <83038814-8527-44ec-b1c1-2d17362d08da@linaro.org>
Date: Mon, 5 May 2025 11:53:19 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 41/48] target/arm/tcg/crypto_helper: compile file twice
 (system, user)
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 alex.bennee@linaro.org, kvm@vger.kernel.org,
 Peter Maydell <peter.maydell@linaro.org>, anjo@rev.ng,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
References: <20250505015223.3895275-1-pierrick.bouvier@linaro.org>
 <20250505015223.3895275-42-pierrick.bouvier@linaro.org>
 <79916f8d-2793-40a7-b769-ee109c52ef63@linaro.org>
 <f33fa744-1557-4c01-ba49-e64b4d3b6368@linaro.org>
 <c67c4a79-7855-4d15-8064-b2f448ac9a42@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <c67c4a79-7855-4d15-8064-b2f448ac9a42@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: R2f1w9H5G2Uo

On 5/5/25 11:51 AM, Richard Henderson wrote:
> On 5/5/25 11:47, Pierrick Bouvier wrote:
>> On 5/5/25 11:38 AM, Richard Henderson wrote:
>>> On 5/4/25 18:52, Pierrick Bouvier wrote:
>>>> --- a/target/arm/tcg/meson.build
>>>> +++ b/target/arm/tcg/meson.build
>>>> @@ -30,7 +30,6 @@ arm_ss.add(files(
>>>>       'translate-mve.c',
>>>>       'translate-neon.c',
>>>>       'translate-vfp.c',
>>>> -  'crypto_helper.c',
>>>>       'hflags.c',
>>>>       'iwmmxt_helper.c',
>>>>       'm_helper.c',
>>>> @@ -63,3 +62,10 @@ arm_system_ss.add(files(
>>>>     arm_system_ss.add(when: 'CONFIG_ARM_V7M', if_true: files('cpu-v7m.c'))
>>>>     arm_user_ss.add(when: 'TARGET_AARCH64', if_false: files('cpu-v7m.c'))
>>>> +
>>>> +arm_common_system_ss.add(files(
>>>> +  'crypto_helper.c',
>>>> +))
>>>> +arm_user_ss.add(files(
>>>> +  'crypto_helper.c',
>>>> +))
>>>
>>> Could this use arm_common_ss?  I don't see anything that needs to be built user/system in
>>> this file...
>>>
>>
>> It needs vec_internal.h (clear_tail), which needs CPUARMState, which pulls cpu.h, which
>> uses CONFIG_USER_ONLY.
> 
> Ah, right.  I didn't see that coming.  :-)
>

I like the idea to have it built once though, since so far 
{arch}_common_ss was not used, and I was not even sure such a 
compilation unit exists.

>> I'll take a look to break this dependency, so it can be built only once, and for other
>> files as well.
> 
> Thanks.  Building twice is still an improvement, so for this set,
> 
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> 
> r~
