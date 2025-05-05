Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp2665611njj;
        Mon, 5 May 2025 12:17:14 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUWrfB4pKXdj3TviVpXWlzFukQufk5dHROcGp/LTYENKoe0FPiRMTkDuvPAILxvXDx5P0Qle/10tOSghA==@linaro.org
X-Received: by 2002:a17:902:e78b:b0:21f:2e:4e4e with SMTP id d9443c01a7336-22e31f7e2c2mr9910215ad.5.1746472634041;
        Mon, 05 May 2025 12:17:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746472634; cv=none;
        d=google.com; s=arc-20240605;
        b=KvLcPo/xwwATOmQRj4ZODDA2zZyx8RhvdV3ZxkPXUM2WdKjHlftNmCx7FEphdPgN2c
         eZXHfMW7lw7S7jHe2Z31NavDwVo1QS8b69WW8MjZXT7NyEXKX3m1M9kkyfS0bWlQjLgB
         bhMr8OSf/T0RRHBNBP6XmBa9xhFJIpuj6SkOIfedUrWULH9P/y2bGZ4mqPsN8XEfjzoS
         V9+ubh73gIsmoObnHrwgj2Pl979RPEU6LenHiauyNIhQeJjFTbwORLh1FwUb4J7UhNky
         j7k9EGSZnEgt4J+OVRpdQomfWQXLtSSSLuLG4pesgyW0JkY9iiMk6BkoYIB0oiCGyzl8
         gJGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=GW6KVIAEijcEBLlWWBZL706R8iQgdB2ZER5S3nvinZo=;
        fh=yhITzK6dtu9hRZW4LUOk+1+bLtF79GghIGt7d1mRBPU=;
        b=bmCOawbdT2fhKp+z7GHQFKAkHHXJhdC1bdk4oJ3epmjqoTeRK40fPTCqsy6UzA2hju
         SXZs/XEVsFGvvmspOM020931X8ksmIp3uzaMiniCeD9lc5CCxaBB3O1qXw17IIn40iM2
         IuEXjCXp/QaBkGrmhB2JQpFz2k9TXbUg+8o44uKJNBgmWpofa0tT3vEFleabH2HAZRIb
         HMzXl2MGVsKxP9ZNaR8/UUttOpBjXax7iTJO8Cy3KrQWp7yBMO48+dq1N6QCMCKDlqtp
         EdhaoiOlBQGOTNiMBHRiUY04QE6Gjnwd9XuVoJMZKBRCynLK6VlqGC/NTZgAJsxdDoAy
         aqqg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BHdy0tvV;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22e0bb05e6dsor42365945ad.1.2025.05.05.12.17.13
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 05 May 2025 12:17:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BHdy0tvV;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746472633; x=1747077433; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GW6KVIAEijcEBLlWWBZL706R8iQgdB2ZER5S3nvinZo=;
        b=BHdy0tvVBx4F6lM5oE7lIKNx2OZXZpch9NpcYDobV0EMmVsLmLmpVDEBbOsK1f95st
         tcEIdVPvwSw5en0eAaiBJfH4hE6fm1F4QzWS8kUrfq5c3KcI6sr/3cq2TBQLFs7rGvZf
         5wVT5JGVHFIuqK1QSRZu7WVvXkfg9LR143Fi9EyrYZn63G966Skp9UW3tzRoyU+W+LcI
         JXi16QZRfVHCnoksVdWsOiaa42T7Lnh1rYgemHHG0lpbfChaZtpLuzh6n3GbZIqj4J1f
         1WvmDX94vlA6Pi1EngHFZC3YjLgIe52Yol90UYjaQ+mRv5/MQxaOmL8RoWkrjwrAt4ka
         rEVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746472633; x=1747077433;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GW6KVIAEijcEBLlWWBZL706R8iQgdB2ZER5S3nvinZo=;
        b=T2+SyNiM3aDMfwLZpNBIqu6yjLSYvCyRWMTE19j5LTeggDRtAMif0tf212wqSzOoCJ
         Je2q3e2GZk7v0w0wUhIYrHpXotdX9m0G3ibB/6ASt9WvDcMfoCm9PF42Pz4tzlktuHzc
         dNwqewUQ8tv79OG8EMyJ8TuuHHcwxA+yphq2h1ojdlO4DhQDIlUgwYW/uxLjAY9warh5
         J2UJsTCeje1Ynir8USY3Wsl9bFHGdkwwgx4U284SSCVyQJgnPC0pQd+g1dpvYVACBv7E
         Ts4MbBHP5lB1m35Uu6ZfjpUfmZ7eokv0p3Oz7CAEt5j4TSkRr07Q3rD2ViMPJ5P9bEOL
         U8Zw==
X-Forwarded-Encrypted: i=1; AJvYcCXa79+rNJ0UMgFbzFi4NWKzyZBNXPFgWschV+GvWzJXQWYXigqGqYyg6qEp4RezK+R+kPW530ACuapZIg==@linaro.org
X-Gm-Message-State: AOJu0Yz8tJmce+hxAJ0ipVJ9D7p6iPt2I3SiIsQQCXOXlzVFQFcxO6rf
	VI53AnTCzPUwW9m6Hx59v0ZbS5Nq2xkDHtOip21LserL0LWJLDmmTOLY//GoFSmsCw==
X-Gm-Gg: ASbGncv4He8t8ApN4tBQTNaH2BlZAzEhJEf0w5QA9FODTsgkfWw/ycrA0EFOi4xH6GS
	bdUn4K0nlxwOMJDzaCkfxGYEKoh9W7cj9vtcfnuBKvzqetQfIbpjx0SCRfIx5V45y1pLsSjA/4s
	9nnZ4+SdELUY1yviNgsqXP5ziWERjgRAek4b1QMto1/VziISc1ulkhC31ymUbUsRGzl+OqH7OkQ
	wggQDYRp9SjweiOn/LutUMcLVzpHY5rL6ppQnG7Ul2fI3Oa+MXLf6PHpzPWam6taHI5oeRW3Hx+
	mBPrnDT3hRZTY0nGjYJI/fdR8GbspjTqNr/30jm/9vu2aX8gDrG35DaqENkO6rOF
X-Google-Smtp-Source: AGHT+IGnPIGHq8VjO3UXrxZyCh63NER++S0TiK8mYQqalmCCQirVcYO0Wpw015CxlvaOu9I3VCFpcQ==
X-Received: by 2002:a17:902:d591:b0:215:a2f4:d4ab with SMTP id d9443c01a7336-22e327567a0mr9562555ad.7.1746472633594;
        Mon, 05 May 2025 12:17:13 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from [192.168.1.87] ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e1522936csm58574325ad.204.2025.05.05.12.17.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 May 2025 12:17:13 -0700 (PDT)
Message-ID: <14dc3ba2-576a-4ce6-b07d-6b78280e235f@linaro.org>
Date: Mon, 5 May 2025 12:17:12 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 41/48] target/arm/tcg/crypto_helper: compile file twice
 (system, user)
Content-Language: en-US
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
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
 <83038814-8527-44ec-b1c1-2d17362d08da@linaro.org>
In-Reply-To: <83038814-8527-44ec-b1c1-2d17362d08da@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: o0N4o3PogxTh

On 5/5/25 11:53 AM, Pierrick Bouvier wrote:
> On 5/5/25 11:51 AM, Richard Henderson wrote:
>> On 5/5/25 11:47, Pierrick Bouvier wrote:
>>> On 5/5/25 11:38 AM, Richard Henderson wrote:
>>>> On 5/4/25 18:52, Pierrick Bouvier wrote:
>>>>> --- a/target/arm/tcg/meson.build
>>>>> +++ b/target/arm/tcg/meson.build
>>>>> @@ -30,7 +30,6 @@ arm_ss.add(files(
>>>>>        'translate-mve.c',
>>>>>        'translate-neon.c',
>>>>>        'translate-vfp.c',
>>>>> -  'crypto_helper.c',
>>>>>        'hflags.c',
>>>>>        'iwmmxt_helper.c',
>>>>>        'm_helper.c',
>>>>> @@ -63,3 +62,10 @@ arm_system_ss.add(files(
>>>>>      arm_system_ss.add(when: 'CONFIG_ARM_V7M', if_true: files('cpu-v7m.c'))
>>>>>      arm_user_ss.add(when: 'TARGET_AARCH64', if_false: files('cpu-v7m.c'))
>>>>> +
>>>>> +arm_common_system_ss.add(files(
>>>>> +  'crypto_helper.c',
>>>>> +))
>>>>> +arm_user_ss.add(files(
>>>>> +  'crypto_helper.c',
>>>>> +))
>>>>
>>>> Could this use arm_common_ss?  I don't see anything that needs to be built user/system in
>>>> this file...
>>>>
>>>
>>> It needs vec_internal.h (clear_tail), which needs CPUARMState, which pulls cpu.h, which
>>> uses CONFIG_USER_ONLY.
>>
>> Ah, right.  I didn't see that coming.  :-)
>>
> 
> I like the idea to have it built once though, since so far
> {arch}_common_ss was not used, and I was not even sure such a
> compilation unit exists.
>

Done.

>>> I'll take a look to break this dependency, so it can be built only once, and for other
>>> files as well.
>>
>> Thanks.  Building twice is still an improvement, so for this set,
>>
>> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>>
>> r~
> 
