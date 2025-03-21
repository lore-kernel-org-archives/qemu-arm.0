Received: by 2002:a17:504:5f65:b0:1be9:327d:8ee3 with SMTP id gl5csp620351njc;
        Fri, 21 Mar 2025 15:19:23 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXwt4qSIr9vD2yUstY+tTkTP9I1WR09o3aLVGTjVHPc/vI75+sMY8/ZG1FGgHqBfv8eotvlnzlpvDi2NA==@linaro.org
X-Received: by 2002:a17:90b:388a:b0:2fe:8c22:48b0 with SMTP id 98e67ed59e1d1-3030feb1391mr7300959a91.15.1742595563011;
        Fri, 21 Mar 2025 15:19:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742595563; cv=none;
        d=google.com; s=arc-20240605;
        b=eydJM4yKKOuXjqWEPbYLlQc/KHiPE1XROd4obOhue1maW00cyIOnottOgRYRtCqht6
         /PdJuVkGuC7nWfsiexBSK+14m93NI6daWYsnV8eCWugfcjadVZJOJVOmT+Wa5OAHe+Ef
         ygSnh+TWpIfzoBt0cAhEt2CgKfHF0ExbsQ+1uFxCYK+GoAH2SMO/R6fmzaP0wkbPH04A
         5Z5j4FKyF5Zi4GD6g13QYf9F94XewhGmTaaq0ed68fNyNB0OoADvJ5pc24Lv15bUjSLV
         ZHgln4P+N2n5t/Nv153cp+p6gq8xBiup7iep2QGcI1frSFpiKMGTZg212/ZPBO97bWFN
         6giw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=2m5L+7pt7GeWrU7Kt4b77ijay6+lliI8NzQ5LxIHZMQ=;
        fh=YcTtkKY1ET6S3iUd4ucEr7CDOEofa1aeCHnG4cCw0HI=;
        b=bsphnCgVTDqOZ3s2u32+kZwg5FphW54KHDJ6ph+ohAlqiLdEIJI/UzLoPfGVB3pEWG
         yk5rvSWs/LMlvZEKqPbO9y6urC40bhpEygOX0uU7wkAxvIcBGAQeFMObJwuA8eJo50C6
         rH4M+WFnfs5C4hAuzlNEUhiRclolXPvCJSBEVZSRzUjThT8D7oRhMErolBbXn1DlCIun
         Hn5XK3MpWuJbPfiW9rqagpIkgckIL2W5WfCdbWrlIa/+vnwdPcHYofXWXQNboj5YhT8R
         /b/8Ig1HlcjYprcp6+AQM/wgOGzyRe+HQS5huGjDfGUJq1a2OFJOhrRM5Mg/PWxRgUxZ
         KwjQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=B+cDpH8A;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 41be03b00d2f7-af8a2aa4c3bsor2199764a12.6.2025.03.21.15.19.22
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 21 Mar 2025 15:19:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=B+cDpH8A;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742595562; x=1743200362; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2m5L+7pt7GeWrU7Kt4b77ijay6+lliI8NzQ5LxIHZMQ=;
        b=B+cDpH8Aq5UfAgPDQbUAn64dxIjoas2ox/1HZs8V1cwB1QQpAgeJFNkw8A+lhpEKNI
         HUNzkAEOxCVa0SdcE2jgRAv/Kwdrc4PhwnkjMNsVJdt0Sm45wRxd3IttboYtNp28j5BH
         UCFZCahIq6uYKzq38/TATcjc8BCb2nhO+/F86QgzyP/e+RxRxovL7jk0iUrV4nUjtUv7
         NWzrDOIgn1RYTJ+BxMhkI86J9nQHsOUBuWxuhAIviQ91kuerhwK9oPzXppJol5BZuglh
         eoze0+Yr4xjwhQKYYTAFVW+9k7IypmC0nfBjYXIlKQ4NuMJI9skTKN/7uBo7OUoyXyIh
         Oxhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742595562; x=1743200362;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2m5L+7pt7GeWrU7Kt4b77ijay6+lliI8NzQ5LxIHZMQ=;
        b=mWgiYZ9+q4j4a4ZBBWUxWKE0VSFjJYSf7A4AJ39IsHowKxcmareTMsaeBGYACaEbMd
         Vs+hFzGUCMsvsY9I6HjcCZ5tGTBSiRHX7k1ZTG41Qjodc/DFmtupWwz02lg+VSL68N5H
         d+wXVBMkB8T1mNCbGqeGyVEBHsGkcbQfUuBvEm83BwrzzA6cL1awKIITsTmad2u7x188
         s444LH2XJaxgTWW6oky/E+IZevmESOYtd/RpZ7Mpu0PFrPCBdOuSxGxdpw/FFo2bEojF
         QGLpc5TvnWEzKvgbXWsi/ZDnN/lg03fbqXBMkRezByBTOUO6rnPCfjiCchS4etwKPshU
         wgjA==
X-Forwarded-Encrypted: i=1; AJvYcCUJfTuoUj0pxhYULMpkMP/5/FkdZuriQSb+Pup7ii+mlg9TK4YWsxMqU55+PGSZChLIqD3mI0+LP/6lbQ==@linaro.org
X-Gm-Message-State: AOJu0Yz7apaMKuJJLd2iEzHKuXMZEmY4OkfmcFwBEco3Cfom/FNBECSC
	+s1lO0lUV4i1LfLWKcQcLITxv+S4lZQMkiyEtPGPU9k7z3zrsYhf3iAnq17Dyelj+A==
X-Gm-Gg: ASbGnct5fPHRvKNV4367PnbrmA3r/bG9R8dlK1ViG5armWFFXKA1EqSV3W2IgQcwIW7
	zb1sK8kq0Fb3602w85A2XVSw1hQddQZ/jZ+A46MGaQBwDM4PxjEeFgV3ZTWJwjFdYbz72xDOPxy
	BDOa3V3wMfw46XCcKlamJ7pE7XcuDt0TQO05WYCAqwLVbFgSMpn1or5NpaPfbLdbgujvPI8l3UU
	3qhKVPEByyKJPvWSXegzfSCn7cfH/dUFtIha0PgHFjcbn1x2IVTTH01nbNhgIVlLW1s7G7mNgrr
	O635bI54ODMQKTLJ14ZEjTGf1EPc7do/JrK/ZBa1lzgt/No/qQldctECYKDrsrg93gGwCDLcfOx
	xUyEYmnrDnX7DMiZRQgs=
X-Google-Smtp-Source: AGHT+IEW6cQdABbMHDm5Jw4zpDdOGnA50ctGXbvRzVQOXJyT4XTYONXfp+PmiJ5E+lNB/pujFV4exg==
X-Received: by 2002:a05:6a20:2d23:b0:1f5:6f5d:3366 with SMTP id adf61e73a8af0-1fe434371c4mr9545558637.37.1742595562592;
        Fri, 21 Mar 2025 15:19:22 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.0.4] (174-21-74-48.tukw.qwest.net. [174.21.74.48])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af8a28058f9sm2346075a12.24.2025.03.21.15.19.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Mar 2025 15:19:22 -0700 (PDT)
Message-ID: <c0e338f5-6592-4d83-9f17-120b9c4f039e@linaro.org>
Date: Fri, 21 Mar 2025 15:19:20 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 17/30] exec/target_page: runtime defintion for
 TARGET_PAGE_BITS_MIN
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: kvm@vger.kernel.org, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, Paolo Bonzini
 <pbonzini@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
References: <20250320223002.2915728-1-pierrick.bouvier@linaro.org>
 <20250320223002.2915728-18-pierrick.bouvier@linaro.org>
 <2e667bb0-7357-4caf-ab60-4e57aabdceeb@linaro.org>
 <e738b8b8-e06f-48d0-845e-f263adb3dee5@linaro.org>
 <a67d17bb-e0dc-4767-8a43-8f057db70c71@linaro.org>
 <216a39c6-384d-4f9e-b615-05af18c6ef59@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <216a39c6-384d-4f9e-b615-05af18c6ef59@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: gN6QBIUCQN/X

On 3/21/25 13:11, Pierrick Bouvier wrote:
> On 3/21/25 12:27, Richard Henderson wrote:
>> On 3/21/25 11:09, Pierrick Bouvier wrote:
>>>> Mmm, ok I guess.  Yesterday I would have suggested merging this with page-vary.h, but
>>>> today I'm actively working on making TARGET_PAGE_BITS_MIN a global constant.
>>>>
>>>
>>> When you mention this, do you mean "constant accross all architectures", or a global
>>> (const) variable vs having a function call?
>> The first -- constant across all architectures.
>>
> 
> That's great.
> Does choosing the min(set_of(TARGET_PAGE_BITS_MIN)) is what we want there, or is the 
> answer more subtle than that?

It will be, yes.

This isn't as hard as it seems, because there are exactly two targets with
TARGET_PAGE_BITS < 12: arm and avr.

Because we still support armv4, TARGET_PAGE_BITS_MIN must be <= 10.

AVR currently has TARGET_PAGE_BITS == 8, which is a bit of a problem.
My first task is to allow avr to choose TARGET_PAGE_BITS_MIN >= 10.

Which will leave us with TARGET_PAGE_BITS_MIN == 10.


r~
