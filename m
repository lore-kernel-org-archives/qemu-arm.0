Received: by 2002:a17:906:ae84:b0:982:368b:d395 with SMTP id md4csp950165ejb;
        Tue, 13 Jun 2023 20:40:38 -0700 (PDT)
X-Received: by 2002:adf:f082:0:b0:30a:eac6:9d29 with SMTP id n2-20020adff082000000b0030aeac69d29mr7974522wro.49.1686714038594;
        Tue, 13 Jun 2023 20:40:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1686714038; cv=none;
        d=google.com; s=arc-20160816;
        b=cFHx/XBdBXnnvftdasD7IOURQJcZyVugVk9+BuIZ3QG/AuRgVLqqJFufI2yBb7pbmV
         FEFhUSEnNKJp5Ih4mHX+I/CpUytmIX6jUfgxBsFpw3B2ENJwbJnjvSotcU3V9Iyycl9H
         ucZm4GZgwPwFzDLd4E7BcFg8QAVMKFZgsbqPh0lPF+Fn3dBC8lvwIdfYTEJAMge8xAfa
         dYLQyYo8qIdYgamuyj8eP+XhVefRQpXDS3elyIScaUDGf0q7ogeAbPzduHfOMXmr2qf1
         5xXO6EklwmGU8nDnz79R+mOJq1X6AX7+uanNLDEiXQ6LvN2+A7RoM9bVHPtR3KA46NZ7
         rxFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=L6K/NmwQs8K/GbD67mVMV6a2RgYlMcLBnHP5k6Y04s4=;
        b=O6rNj9RPbfR4gdnLmqZCMsGVSUiif4IZUMV1ZIR4sw8UQQlMKh8BqBwtU0py/tTs4G
         4oT7XVCXr4XRt/pff6b8sthEierYwstILn4YrdvKOHQrOShCSA+yhJp+tAqaVgMglMp7
         4YdW9I/kH/9DKQXeUt98zmORblArgwlvkln5gMahdvQ25SW2KPUJFbyp+stsptDzsVzO
         tMegEH/uiYoSP7N91gOhc1bEH73U5WyX8NjOvY6U4mW1du4BuR+IdTSN7r9UHD2i/tVl
         rRTUqkEpVzNiMQ9dYVpwbIQULyquxbZEDuV5wUJK68Tta1L2dehCF3/Rs+MmO5vjcAUO
         1YMA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=iorcpyY9;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id l21-20020a7bc455000000b003f7e65f7aecsor491805wmi.6.2023.06.13.20.40.38
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 13 Jun 2023 20:40:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=iorcpyY9;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686714038; x=1689306038;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=L6K/NmwQs8K/GbD67mVMV6a2RgYlMcLBnHP5k6Y04s4=;
        b=iorcpyY999QWehIb+CAgrA/F1N36in6cm7c1xcz3U7MfL2vyFgHedlBylx1ziCuvVS
         6hDNVpZ6lP7/9eAFG96KxzKNl2HhnwnKPK5QObniPPw2KacRaR45KHN5BNwQ/fBN1TXQ
         U5RpYQn/tF0sz0HWy9+ubLlJ7YnSBixn33/5t6Eq0CtS6cKkyc6K6OYYMQ/eFjAqYHCb
         hXETirYPQAPIQA8VlSLXLSEaDNiuMIatOAOvJhC+kyTgDnkFMtRqcljuLWr2TCuqESGi
         ocDTciV7b4uNGmeum+J6Upimotn2JRrMfMVdsGmEYxK3plrzy86NRJ5xIlO+VqD33li6
         D79Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686714038; x=1689306038;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=L6K/NmwQs8K/GbD67mVMV6a2RgYlMcLBnHP5k6Y04s4=;
        b=PTHLrgIb2g+fO2eurEt7rX6Kk9544DqvoUY7O4dZMnNawbN4+/linJSfLuUszeW8x9
         HpjRwWqkth7nV995735s+cP8KSc436s7VDGeVX9CtQFk/SY3S0hToDVxYAjKvH8FnR3k
         G4FRTQp/F6o9enFWKDkprqrzrWHELC9VjGbZ8oclL/gCmJ+d0YnQtAfKkAemg+IPXMRc
         /R7yBYA+u8O7U2gywaDz3bWeoQSRKYvOY89Yejhuk/QEuxetRATs/yRA4iRG2sWOJBMk
         eQvVO7FkLOJ3husWZMlhnLQ2fmAoSFSgh5djYK5UaJQjalu+lZsdxcEigJd861mgvJGu
         /1Dw==
X-Gm-Message-State: AC+VfDytkqRFkWnhtPW5SYnnUpXKQvvj0R1QL3iqhLfbuH0jqY6HtOci
	WJggGcWvCKHJFlKXJWnrImR7ffAuMMew/YUdww58ykqhV4E=
X-Google-Smtp-Source: ACHHUZ4aWTG5W05cUIT4zylXDSRz78kF6JI8I9XWAoMiPFUy6icBSFAV4yrrX70Rn2DB1VQxr5htrw==
X-Received: by 2002:adf:fa85:0:b0:30f:ba73:dff8 with SMTP id h5-20020adffa85000000b0030fba73dff8mr6002074wrr.28.1686714038089;
        Tue, 13 Jun 2023 20:40:38 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.4.112] (90-182-62-66.rcp.o2.cz. [90.182.62.66])
        by smtp.gmail.com with ESMTPSA id q25-20020a7bce99000000b003f17848673fsm16017895wmj.27.2023.06.13.20.40.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Jun 2023 20:40:37 -0700 (PDT)
Message-ID: <cd379806-ef2b-d13e-472c-a15d21532bb3@linaro.org>
Date: Wed, 14 Jun 2023 05:40:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 03/38] tests/multiarch: Add test-aes
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: ardb@kernel.org, berrange@redhat.com, qemu-ppc@nongnu.org,
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org, pbonzini@redhat.com,
 qemu-devel@nongnu.org
References: <20230609022401.684157-1-richard.henderson@linaro.org>
 <20230609022401.684157-4-richard.henderson@linaro.org>
 <87zg5468ed.fsf@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <87zg5468ed.fsf@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: IIsw/htarVqi

On 6/12/23 16:46, Alex Bennée wrote:
> 
> Richard Henderson <richard.henderson@linaro.org> writes:
> 
>> Use a shared driver and backends for i386, aarch64, ppc64, riscv64.
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>   tests/tcg/aarch64/test-aes.c            |  58 ++++++++
>>   tests/tcg/i386/test-aes.c               |  68 +++++++++
>>   tests/tcg/ppc64/test-aes.c              | 116 +++++++++++++++
>>   tests/tcg/riscv64/test-aes.c            |  76 ++++++++++
>>   tests/tcg/multiarch/test-aes-main.c.inc | 183
>> ++++++++++++++++++++++++
> 
> I find it odd the file with the main function is the c.inc and the per
> guest impl's are the plain .c files. Is it possible to have it the other
> way around?

Not with the way tests/tcg is structured, no.

> If we have a fallback library function for aes then we could
> enable the test for all targets (a true multiarch test) with some having CPU specific
> accelerations where available.

We don't have that either.


r~
