Received: by 2002:a17:505:bc8:b0:1be9:327d:8ee3 with SMTP id pe8csp978139njb;
        Tue, 13 May 2025 23:12:45 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCV5QnXzGHW6WTJL6r54BPQFkhEsAA1r65ZWHjf6b+enZ2av7ZLaRzwF2tyXe8gaYNw2TAM00ajhW+ep4A==@linaro.org
X-Received: by 2002:a05:6000:c08:b0:3a3:4ba4:e8ac with SMTP id ffacd0b85a97d-3a34ba4e906mr358451f8f.8.1747203165079;
        Tue, 13 May 2025 23:12:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747203165; cv=none;
        d=google.com; s=arc-20240605;
        b=ijCt73SGZmwBaxIkVXXyjVe+yPhXnpUqZDoMBh2Hp4v6GEh+/tmQYqSTR2ucT6Qo9G
         aJ96sHuGASlPnBwcHYlV7F3Fyxoofsk/3IIzi2JT3JsQNRBquWI9ntkXKn6F1VsgI4Xg
         +8i4EBz7IjsVRga00IfdziORTHEWzbxifSMJQN/afJIzD0t15H3yXR9mWv8+1tMfx65y
         jBSo8OncROA/HDSvZ6gLP0GEZCeXZyxMHghHOTIb5wCnMdp/LWmV7YYWeVccu0rzSr5o
         XM8BVxcvuUq1IejK51fm8PBPK9uGpB5Puq57Q1UbXRxRFbjkGvUNzu2x6XrpeEyLdYjD
         3rBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=pJP3i5Ja4tsH+USF3De857L3YIRU0Q0edmiA4knXpsM=;
        fh=6mkoJhwfIRgZK4jh+tdKSh6xLuaBVkJ13HRhIxJzSwA=;
        b=ZqAK/lQNyQAWqAzxdsGhjX0FiQl+aFtPw3ZhwsQgo9Jx7ut1+I5B1O0xo8yLtJ0PB0
         BUcI2THhNnZqXAzLvaXlRtWPZEDqnzCOAP79uJJ12WtCHWqy90WytGDVxQUTw0RTavy/
         eWLGFmpwJq1CNvI6+nrjQLIwIO1Tvg5dbRP6YqVRsQYs7EyeHijZKlZ1oOzf5SKrX70y
         yuWYSAp7gM9LhilOeiN+unXxPkwDD2v9IEg1pMqsfm7YCN/PH8vkGIPGXWaeELuD9WmV
         7fF6nVZ5thpQ0kgR33go9IdNNEVfMXsI03pVWrp8EmgjgefZKUD+SBAFXXrejYWT0NGZ
         y2/A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VANlRRAY;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ffacd0b85a97d-3a1f5c02ecesor4792229f8f.6.2025.05.13.23.12.44
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 13 May 2025 23:12:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VANlRRAY;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747203164; x=1747807964; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pJP3i5Ja4tsH+USF3De857L3YIRU0Q0edmiA4knXpsM=;
        b=VANlRRAYbufUZdzDhYEt5rAtxnwrXzUna63Xmu/oacNlcpPNIrMDDPy+YlgqLIrQwc
         NWlpxSluJTFNKXcmcZ7zfD7v1YjLAUVrj+2iEyJIaiebAlC315SUYmsu8wGbLLRtVvq3
         JLcYV7M9vrI3VRKBVO4xV0MQx8osGCCTKLE8cJABboEWVq13/OFyiZ+wfwEc8HPlvanM
         PsYxB2k8ehepoXJRUvy/S1jUk9D95eAXj7+lqR9sktStGvrxRZ638itXqyWfw37oj5gI
         4Ha/V/PaKtFYjw1NKhmEOgoAisLCVX/71Z37lbcX6+AamA9LZWse6MpKjMcMGHVVij/i
         M1+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747203164; x=1747807964;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pJP3i5Ja4tsH+USF3De857L3YIRU0Q0edmiA4knXpsM=;
        b=jhLn2HMP/Mr+/AwtNaXTnX0SPyrzXY7RDy2P3FtcRt9FgL+39B89gL0kaS9ILk4rCl
         1n6xnQ6p7BxF0Y17fjCrf+y18dKhyaqOe6kuQ4suorMvooYbW2QYlHkfTXtG4hfs4p2y
         cyqie2f40LtLkfdmisj3TuzKb+CsJHz4ilu+hJojn38LscTCBLGPcKzVGGcj4r5jGxbW
         Bodtklj0/8bKMt/QfHkL/uJXM91QeggtQ+u7t4frBWDENvbJLf4tDz3dYwEkIIJNF27v
         vfLirTHRbwSoD8bVXh+DYMPWFhxyTYeZege1EK7zfor+7n3KvITioSK27taL5IPlGyw6
         bmPg==
X-Forwarded-Encrypted: i=1; AJvYcCW+A8V5v+4F0/Y6k38cP5EvuLOFhZw6TSrm3oRzz1IDi9eY8nlDLE042EWBJA8GoupzgwOK7VjAktTefA==@linaro.org
X-Gm-Message-State: AOJu0Yzqxt2NutrshbnodeqjF3JS6kF0eRRm8cWlkMqyAyJv5a2M22SK
	nDZ1JdjbMKg8/+EjppYODwMUCzzYnCqsh4po10ITVWcq3mhcbwd5nNt8A3CHON60/w==
X-Gm-Gg: ASbGncu6ob2MSHm0wIm8utgPogRZG5ydsbkTXz5V5oJ2fIRZK/3w+camWksyzJH2hGR
	/HLsDhiL8o/6lIto6KwwY3YOA8ijeXNQ8oeeulUArTMntkIJKtKPqHSWKb0Czw8qqPTkBRBys4O
	DryHq6GFlA7qK5mXeXRM1VztWFkc4an9DOvM1arO78SD5mKq5hAXdWSTStiK+rDXiRaxODjD3DD
	OVrZIzaXYBTvFgMzZUCFz5yiume3gnoOErgwo0jIMRdzrHvk5QLk2r+mi5UfJdYCNrNsCEbKewz
	AGnQsEC87LzjyKcYrf8dylHjuB940lAqHlkLVrObgvhR/ctJiafjIjcaT2wlLJqFC7/qTk1CFwc
	Nr+/eN4WGjk8Ww8MKEjJcrXnI2O4=
X-Google-Smtp-Source: AGHT+IFzSspgMHWhdre95XZ6yQu1fgkJ9p1RBBf5WV6Mv83GrLrzzzr2HXymO3TbBPUm9gEG14WDGw==
X-Received: by 2002:a05:6000:3103:b0:3a1:f537:9064 with SMTP id ffacd0b85a97d-3a3496c0063mr1511833f8f.25.1747203164593;
        Tue, 13 May 2025 23:12:44 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [10.61.1.204] (110.8.30.213.rev.vodafone.pt. [213.30.8.110])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f57dde0esm18762430f8f.18.2025.05.13.23.12.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 May 2025 23:12:44 -0700 (PDT)
Message-ID: <2be48d40-809b-4c3a-b528-e712bb6ed1fd@linaro.org>
Date: Wed, 14 May 2025 07:12:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 30/48] target/arm/ptw: replace TARGET_AARCH64 by
 CONFIG_ATOMIC64 from arm_casq_ptw
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: kvm@vger.kernel.org, alex.bennee@linaro.org, anjo@rev.ng,
 qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20250512180502.2395029-1-pierrick.bouvier@linaro.org>
 <20250512180502.2395029-31-pierrick.bouvier@linaro.org>
 <91cd9b9a-8c67-47d3-8b19-ebaf0b4fab5d@linaro.org>
 <39c6f5ab-6e45-491d-a0e8-07408e29e2f8@linaro.org>
 <cb2798a2-e673-427c-a83f-2afbac59751b@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <cb2798a2-e673-427c-a83f-2afbac59751b@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: px2QoGQVaIGE

On 5/13/25 18:12, Philippe Mathieu-Daudé wrote:
> On 13/5/25 19:03, Richard Henderson wrote:
>> On 5/13/25 03:41, Philippe Mathieu-Daudé wrote:
>>> +    /* AArch32 does not have FEAT_HADFS */
>>> +    assert(cpu_isar_feature(aa64_hafs, env_archcpu(env)));
>>
>> Why?  This is checked in the setting of param.{ha,hd}.
>> See aa{32,64}_va_parameters.
> 
> I suppose the "AArch32 does not have FEAT_HADFS" is misleading then.

It isn't -- aa32_va_parameters does not set param.{ha,hd}.


r~
