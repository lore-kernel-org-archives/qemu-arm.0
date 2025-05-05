Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp2650857njj;
        Mon, 5 May 2025 11:51:22 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUKvmkYo0oknWZl3OFC4B2Hy5DGwH4B0FEpqKWdP46KKHDZot2oPUGEjLsjbxJOTiwelT7fzjOs9EjQ3g==@linaro.org
X-Received: by 2002:a17:902:ecc3:b0:221:7b4a:475a with SMTP id d9443c01a7336-22e33146b53mr6097975ad.52.1746471082006;
        Mon, 05 May 2025 11:51:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746471081; cv=none;
        d=google.com; s=arc-20240605;
        b=RRuFOiBAOquOcXGjrnXkOb0gDKEhrIq/LSahKK8kTrQdeGJxMrEqfCR/VnzJF+8atB
         PVY+Nk6ik0zzBw+9uPydnB0nVIL8J7V9NYyl2+2H19Bb+yYHtI8akhnNeNJnXJsp4jZX
         0WGHsFdZXWKAT7Dk3hVHLcmPQcYAaM5S6pLiY3iiUS9aMwn056EPHax9ldCkJuTe/sq3
         w3TTFVNGAolGjVD+VRnaQ2/CGBd/6TXAm3uE9oL1pnyDdvNc7nErdDJcDOwW7DGqgmT2
         RyVxhz+2vnu02FU/VcVgm5bspt+PzBWybPme3Bq+Ng4QQuC12ZylVOSAmBOdVfxIrj8b
         gp4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=DAxYYa+f57aHAbvNw+rs3kNliEbilY3GCs1FN1ZlFHk=;
        fh=oUUJ+/6IrHMfoOtl6M7RtJGUbkDyX76d9cJEDKElMQU=;
        b=LLpQQsdJ2vBU6n3vKtVcu69vLCI6j/TYc2pznj2CdDbI7SYF2Thek0uoQcRHj9ikOY
         ps5sSiAQnsZ3oJynD8U+Z//Fkt47yVfBwryMf+10hsLdXcO2RRmuqVdmUDO7bas1jxKC
         QE+Ro/MgpjGtli2+R3NZtGVG8KYruO6lkbcu2aMA8nPi0BlSg9kdx17WHtERmPGoXhUQ
         dJr+bbfw1fsZnkgA4O0iWoDZc/wJOAIs6RFs4bMdXLco4Yedr2NGQpFkuiXQwcdBxE6K
         XurglLRxrUxuzM2BdjqthGdenXmYPWh6ziAkxJuL65OfOoRLHVCZ0G9486BMrBZmPnLm
         8gKw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yalWDWIM;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22e0bb1a3ecsor74797205ad.4.2025.05.05.11.51.21
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 05 May 2025 11:51:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yalWDWIM;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746471081; x=1747075881; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DAxYYa+f57aHAbvNw+rs3kNliEbilY3GCs1FN1ZlFHk=;
        b=yalWDWIMMJxPEPvzr0DPQcEu1e+jjV9Z5waH1RfI01adfoM4yRBUdu6sae/98ltXVG
         A8jSI+ZA7Vk2JWpT4Z0ZatSmU3tq4POsHAaGPxU4FlRyrh6KH4fGWBSmUNkkwzOvsr9F
         fDkWNWhl/y+VSPN4nzL48Y69U/RLDuVqt6sgnQ4A9eCIyyVLgDE6pVH6CJ/aEHf0bN8z
         zuDGja3EvtHQKoFCjomLe1Kbh9WpgrAZmQWUNbSsBsteNuAc6lzO84rP24sCr4Xf/29t
         v/+JTQ9TAUR1LE/5tSAuPwUiwlv+mn5HKwj3f4U0jfwyUGAcD/Zc89HOUCs3IKKKcr7E
         5c2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746471081; x=1747075881;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DAxYYa+f57aHAbvNw+rs3kNliEbilY3GCs1FN1ZlFHk=;
        b=PrxE5ZNqwgMEVdkqkrjoxl95pf7QHTiBb4emm4Dto/rH5GYOG3fL+XMYKWkG2evs0q
         teHZE15BT8LKb0sHJUkVJVOdFq/gCOdJ+ygonSzwEv4QJUXImvbpevayATRwVtO1weTU
         2Symo7Ax+e82c7eXhyIW/OnA7Jj91Oqdjg3B6BA02TQGEMyiyf87HodC02XYQO9tSHhs
         5Q5Zp8To4dqcxqXh8EWyuIUXRsSGMwtoPu9clRXGEipc6tuotOMdd5D193edXVvFnoJx
         pMcM695kK93SODFKZ/terE8T6gs15UxaQC+Ys3Yx7a9gJFGwz8WIXdootMSNlxuLgTam
         IzpQ==
X-Forwarded-Encrypted: i=1; AJvYcCU3xJbwKXNcrnrefUsnhs3UPSFu2PF1rNp3QTsFZWcNtMw0zUBZrTbpCDplD856Y6yTBXEm/s4bs69anQ==@linaro.org
X-Gm-Message-State: AOJu0Ywcvu6vMUZFDfUr6jNRnXRZq/b48rko+ULTRz3YAEHo+5Wwyt7q
	hyuUuu0qDzQELZlwoOLDL3bqeJ7F7aD3YG9PxyZcODffQgX54/bHsiTt80pxt6FG3w==
X-Gm-Gg: ASbGncvyD8H8p+zaBOkv/1Gd0c7V33HHWZhVqkaaTjhuBgmp7gdBkuNboGRLHC07c/A
	tjhkDz2AwepnS1U7edI9WBmAYDBEs1C9tiisAgb+RqD/dZd8DJ6WeLcAe3lpJkcvATPMMoMqfu7
	ZYBd70J2VlAxvmXotDFo840pHUQGnQH1zUUc1FedrRI++wPltODjyQqPg3EKGepdmIJBdPvzo1V
	6wpXNvRL8z1K99ovoAlACvaNoAr9wHROyhD8bgmQA94auTKKI3dHsbTi7r+lvmH5G4heU1z6sXh
	44gxS6ipZ8lqt5lnnfP7X8i3ambOaJls3p5URcXq7MeuI/SCLEJAAdJxf1gUh0VIDgrOj2G83oN
	bJmLuj+A=
X-Google-Smtp-Source: AGHT+IH+lsN7TStKXBftqejfHAZR2ZE9pmBQGgu41g9SizVP17mMAL4qD/r2wuGLYimKJYKg/Xf2bQ==
X-Received: by 2002:a17:903:2447:b0:223:f9a4:3fb6 with SMTP id d9443c01a7336-22e328a3394mr7213785ad.11.1746471081585;
        Mon, 05 May 2025 11:51:21 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.0.4] (71-212-47-143.tukw.qwest.net. [71.212.47.143])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e1522952csm58581155ad.185.2025.05.05.11.51.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 May 2025 11:51:21 -0700 (PDT)
Message-ID: <c67c4a79-7855-4d15-8064-b2f448ac9a42@linaro.org>
Date: Mon, 5 May 2025 11:51:19 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 41/48] target/arm/tcg/crypto_helper: compile file twice
 (system, user)
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 alex.bennee@linaro.org, kvm@vger.kernel.org,
 Peter Maydell <peter.maydell@linaro.org>, anjo@rev.ng,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
References: <20250505015223.3895275-1-pierrick.bouvier@linaro.org>
 <20250505015223.3895275-42-pierrick.bouvier@linaro.org>
 <79916f8d-2793-40a7-b769-ee109c52ef63@linaro.org>
 <f33fa744-1557-4c01-ba49-e64b4d3b6368@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <f33fa744-1557-4c01-ba49-e64b4d3b6368@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: 0vCqKv5l3fIn

On 5/5/25 11:47, Pierrick Bouvier wrote:
> On 5/5/25 11:38 AM, Richard Henderson wrote:
>> On 5/4/25 18:52, Pierrick Bouvier wrote:
>>> --- a/target/arm/tcg/meson.build
>>> +++ b/target/arm/tcg/meson.build
>>> @@ -30,7 +30,6 @@ arm_ss.add(files(
>>>      'translate-mve.c',
>>>      'translate-neon.c',
>>>      'translate-vfp.c',
>>> -  'crypto_helper.c',
>>>      'hflags.c',
>>>      'iwmmxt_helper.c',
>>>      'm_helper.c',
>>> @@ -63,3 +62,10 @@ arm_system_ss.add(files(
>>>    arm_system_ss.add(when: 'CONFIG_ARM_V7M', if_true: files('cpu-v7m.c'))
>>>    arm_user_ss.add(when: 'TARGET_AARCH64', if_false: files('cpu-v7m.c'))
>>> +
>>> +arm_common_system_ss.add(files(
>>> +  'crypto_helper.c',
>>> +))
>>> +arm_user_ss.add(files(
>>> +  'crypto_helper.c',
>>> +))
>>
>> Could this use arm_common_ss?  I don't see anything that needs to be built user/system in
>> this file...
>>
> 
> It needs vec_internal.h (clear_tail), which needs CPUARMState, which pulls cpu.h, which 
> uses CONFIG_USER_ONLY.

Ah, right.  I didn't see that coming.  :-)

> I'll take a look to break this dependency, so it can be built only once, and for other 
> files as well.

Thanks.  Building twice is still an improvement, so for this set,

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
