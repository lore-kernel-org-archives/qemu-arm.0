Received: by 2002:a17:906:b2c6:b0:930:eaf4:5c09 with SMTP id cf6csp5825037ejb;
        Wed, 22 Mar 2023 15:39:33 -0700 (PDT)
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nOv+CREb
X-Received: by 2002:a17:90b:3141:b0:23f:e165:3452 with SMTP id ip1-20020a17090b314100b0023fe1653452mr5618557pjb.0.1679524773314;
        Wed, 22 Mar 2023 15:39:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1679524773; cv=none;
        d=google.com; s=arc-20160816;
        b=LkslVmoQJaEQZJiBlrhJXSrG8TDd9XyUhGvLrYtIyG43WLNgw8GO3f7cbQ7EAm95KA
         Hugnoj7wA/8rDYgXNpwPWLIg+yPfIbDGEag2wDD9zVMxM0Mm42tsf3ngYr3F3Ddc5udG
         q18sF5wdqqLEIputrPR/b5TwpCAKser00s+KiffHP9UnLCnYTaraBbCuoQySBEpGfnVr
         6lwteFDfnXv11hc92aOiP0FKNvW5IwhaYRoo1+f6xEL8G/VcWEVPACCc0fAGRf0NWBg7
         p0kW28aL5dv1A4nTvwG1g0VaiyT5IXvoPcfDENOz/Fcbey4qENnBQm5EZiit3sEpPu1I
         Tqmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=JkdAZHib7lR8FysgoNWuV/psgaBBczZUKNI5U8fBuUU=;
        b=bFKT5rUMmHhGBWJsxy/vCHC2V8K8jTNM8dsGKHc5kmB9okqg3ek+tBJ/wYGIOHIerK
         /JtMsJ7pR1U1BrLFbJqlP7C1as5UaZ7bxwpLuwWQ3YJw/2FXjRz3zYsLM/xurxhX5Qfg
         2T1QJQK9a5iN7oToDCWR9f7AMcHausY5WbYNjnfigxlTcqu+2mlRBlnyEO0KPzIoVLzu
         QhWJao02jcfaFr563et2O4yP1K7C7lPn8e08A3QfsFf8xDxYxi1Eqbb3GmysRMSWNESu
         taXxYmbm+dEYQJLuDqylxWJeWfsE0brgBOaCvMEVgbD6wRARMznK77w0KjMt34OZXz0p
         z3NA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nOv+CREb;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id h11-20020a17090ac38b00b0023f529f40b1sor24007pjt.21.2023.03.22.15.39.33
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 22 Mar 2023 15:39:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nOv+CREb;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679524773;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JkdAZHib7lR8FysgoNWuV/psgaBBczZUKNI5U8fBuUU=;
        b=nOv+CREbCvKaW4xH7cTQl19e64E1d0MA81XhLqKanWCBHZkxqEQRJpvSXfayZpSHwZ
         5SWOI4k38Cftb8lOQOp4pUFDIZKPmfar37WsrpYAJMaNX8b6MoxzOEuzDAymJY/fLCmT
         aEdy2VlMKfe7N0NoWN3rdH/FcjDofm1qf7DTFBpp47r6OOkMZVqR2LIHduQh+n8PYPkq
         RihV90K9QiHTQEGeiC0LJL5u1wDt2komdiDx/X3cWRHRAkF5T0JGrt1cWiF4SaCv3LAO
         T46zTOXvYphjIcArt0CyXvjx+8h8bP4/hbzYQdHsR0chohfjPLMyqq/3OJ2FPEnJCVMT
         blFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679524773;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JkdAZHib7lR8FysgoNWuV/psgaBBczZUKNI5U8fBuUU=;
        b=3gb6YPKay7gglk1eQ+RxElsEC7pTwh7gSFSo1OkJu4GtxbbRPYhJwtfKyBomMF6Qzp
         BfEApO7cpcjH4F81bb6O0wVjeUQHWG6t92K9YXT31BJpwtGjnbhvMSDd7M5Bu8APv9S3
         sZY7AMh0N22QC5cDADCgjrKQgHvs8aQKQhbNeWhVUCeHdXXrtjSuSrRfpMuESW/4uRN8
         0Jmm3rD3J5PMfXpSr4KHJg6c33V9WFH1aXXFT7YM7bnDJ1wGeCQfL0gv3sFTCREdS/tx
         5UvbTWrlltjZVkVrWum3l52a58DgzGongi4pivEZOJrVbnb/bEtlj8VteEXNJw+yQOIR
         p1nw==
X-Gm-Message-State: AO0yUKVGavTX7Iz/mCBJb/o1cv+IGZ1TxPd7sDXigZPRwdlNOwLzbI4U
	ko336aquoNtFCS19Feq/29hsC9iuzHTawAPQLJKTLA==
X-Google-Smtp-Source: AK7set++Aq8+vn/mx9+Tn5xja0Qah2o1vUKjgZpN4mxLRLsNHyrBqRfO+k8a5mVyhIXUTmjlsCkgUg==
X-Received: by 2002:a17:90a:195b:b0:23f:8752:98c0 with SMTP id 27-20020a17090a195b00b0023f875298c0mr5513258pjh.19.1679524772738;
        Wed, 22 Mar 2023 15:39:32 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from ?IPV6:2602:ae:1544:6601:226e:47e1:b8cd:a957? ([2602:ae:1544:6601:226e:47e1:b8cd:a957])
        by smtp.gmail.com with ESMTPSA id x15-20020a17090a6b4f00b0023acdac248dsm32804pjl.15.2023.03.22.15.39.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Mar 2023 15:39:32 -0700 (PDT)
Message-ID: <976fc94f-ad21-3130-014a-4da848d1cfbf@linaro.org>
Date: Wed, 22 Mar 2023 15:39:30 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 6/7] target/arm: Implement v8.3 FPAC and FPACCOMBINE
To: Aaron Lindsay <aaron@os.amperecomputing.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Vincent Dehors <vincent.dehors@smile.fr>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20230222193544.3392713-1-aaron@os.amperecomputing.com>
 <20230222193544.3392713-7-aaron@os.amperecomputing.com>
 <989f380e-9d70-a377-9f56-6d42935459c2@linaro.org>
 <ZBtmAEYfI8T8Y/zT@strawberry.localdomain>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <ZBtmAEYfI8T8Y/zT@strawberry.localdomain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: qiheAKXVN7LT

On 3/22/23 13:33, Aaron Lindsay wrote:
> On Feb 22 11:37, Richard Henderson wrote:
>> On 2/22/23 09:35, Aaron Lindsay wrote:
>>> @@ -406,6 +421,16 @@ static uint64_t pauth_auth(CPUARMState *env, uint64_t ptr, uint64_t modifier,
>>>            uint64_t xor_mask = MAKE_64BIT_MASK(bot_bit, top_bit - bot_bit + 1) &
>>>                ~MAKE_64BIT_MASK(55, 1);
>>>            result = ((ptr ^ pac) & xor_mask) | (ptr & ~xor_mask);
>>> +        if (cpu_isar_feature(aa64_fpac_combine, env_archcpu(env)) ||
>>> +                (cpu_isar_feature(aa64_fpac, env_archcpu(env)) &&
>>> +                 !is_combined)) {
>>
>> Indentation is off.
> 
> I pulled `env_archcpu(env)` out of this if-statement in my latest
> patchset in addition to the indentation, but am not confident I have
> done what you intended. The QEMU Coding Style guide doesn't seem to
> address longer statements like this in its section on indentation, so I
> attempted to follow other examples in the code, but I'll take further
> direction here.


     if (function(a) ||
         (function(b) &&
          function(c))) {
         ...
1234567890


r~
