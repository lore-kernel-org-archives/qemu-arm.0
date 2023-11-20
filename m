Received: by 2002:a17:907:1006:b0:9d0:bf65:29fa with SMTP id ox6csp2365673ejb;
        Mon, 20 Nov 2023 09:52:44 -0800 (PST)
X-Received: by 2002:a05:6830:1ce:b0:6bf:ef0:c69 with SMTP id r14-20020a05683001ce00b006bf0ef00c69mr7586530ota.34.1700502764163;
        Mon, 20 Nov 2023 09:52:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1700502764; cv=none;
        d=google.com; s=arc-20160816;
        b=M2GgX2rghL+c8LncA7wz6m9v1PdNVyBzP90TzoFps90hlIus2ocDJkcm8RIx8eRh1S
         53XyxIkpZTsRi/FPECb657IcIFdLbqEj0Jz09Lr3YmH820Anz6hBXA/yPTBjJYMg4cVD
         ZMRsEE2AoOv6f5U7JwjRSb4Fnp6UYLhkqmPoIojjxFqRxRqVVi1Qe3Uf+4nT4DZex/1/
         GvZJhvNNBUA+Vfojk0weeiCasYCcvytLokpYKAucA7L5azMmGTLe8m5QnxKAFDmW9vhA
         i/k8w0K9UkIvTkh0eNoxlplfwsrubc1pd1M2ielj8Jx6YFf/JinhuDx4PKWnqNDMgCDW
         H1fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=FP2bYN/PvArErqi9U4cNxsILr9lvwBy7eRAmkWDD8YY=;
        fh=/0WbsaWrcFcMFpKYGIHxisEeD9vdUwU+PI2s2OAVjN4=;
        b=IBbxRYEfFM4uxmkcpnddhgMF2V8IETGjDOol7EpVsgUcvTrVyPnDRbBD7y60C2YYJB
         U5lYDhPeE4H+MyJ56SBJB7YltijoT8W/XSnVO2RpGg29wzipvdpvpGq9pYTFBsuOgJuU
         yeL/NBNJeNfL+bHYM9ZJxcsaf7z8wo3eTtIENunRGEww6QAGNyKib8curhs3gL3RB/C/
         MBKTRSLZ+k86O31hfkSEIKcfxrkrcXWh2hyDwXm4fyNzmJZWovnw5oC2cIxL//Pjq0U2
         KczHvsxFXw77duFbq+dLrgwW0tiPQNy1oqal/dcDF1XduGIqIWUk/9IUs20NWlx+BBUt
         wH4w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Lw6SGHkP;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ca22-20020a056830611600b006d656fd855esor2921034otb.13.2023.11.20.09.52.43
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 20 Nov 2023 09:52:44 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Lw6SGHkP;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700502763; x=1701107563; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FP2bYN/PvArErqi9U4cNxsILr9lvwBy7eRAmkWDD8YY=;
        b=Lw6SGHkPdEBpce6e3Lie9OnQR/h/lT9xkOKsL3DS8Rbf9UyWg4JvquXSGXzyHQ6GcF
         3SIEnnB7AogJZ7JYAA0BzulAbdXcGx1XYY51EfveK/0wVHBOWnA0+lZJedm+71bSoL2S
         +2HbYqKvbRUqVoVjXLDOY+WNLUe3B2f+yvgT4R8PShjdLG8U0UvmURRgsro+TsUEjQ9u
         kVJteq8SAzM9mNtcGQPJkMKwWhk8vcy11M8ZfjtlYiHhBPwAKeThbG6qDvXbv6+u3rGw
         OVrgcbApWv6OdWlA5Pc4ywWPns8j852x+i+WcrajJ+OiPerl5aIvrqB7FB1QtLavMTII
         SPTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700502763; x=1701107563;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FP2bYN/PvArErqi9U4cNxsILr9lvwBy7eRAmkWDD8YY=;
        b=mmJKU8YOsNXYvzvaZbmueJrZtuHeqE5/7gKwlk4ojnCh8nYbF/ISEv3oiIiljdx1Sn
         s9/dQRKWOUI/oUdgODBzuRTDEhkAumxXYGxd0BZy40kXlmPNbNzarVyWg5BpVyJgipiR
         e/p1wfuspGz+odVon4925Q8VFXVV/C6sP7MrueGfc3ZsrUr8rrQ/AzpRHDnY/w2u1lOG
         4mY4tSrVgKYMX3hZQDJ30tVLdz1EDEMkZ5y8bRJ9A6Beo/U+19RKpvAfX0fwSh/mPrD2
         yNQFoMWTA1iWQK/vDEaJJt33u/z3gyQEDgiRl61Cbs8YxlfQvSB+pou9+avpCfc1lFoD
         gCRA==
X-Gm-Message-State: AOJu0YwygtIuQ1xmIETzY34HQupGmo69k0KkMgODe/7foG5OyZmxeRQ4
	yKz+pyJXx02KuLCWYNbg9c7hURV6
X-Google-Smtp-Source: AGHT+IGoXqtQ1X8vYev/JmKldsgkPxxTfh652YOafgCjVqZsnbfJEHNmjcKQnBQ+Q3UXSkspRCtkLQ==
X-Received: by 2002:a05:6830:25d0:b0:6d3:2920:a5bf with SMTP id d16-20020a05683025d000b006d32920a5bfmr10343135otu.17.1700502763605;
        Mon, 20 Nov 2023 09:52:43 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.174.227] ([187.217.227.247])
        by smtp.gmail.com with ESMTPSA id l17-20020a05683016d100b006b87f593877sm1222127otr.37.2023.11.20.09.52.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Nov 2023 09:52:43 -0800 (PST)
Message-ID: <bd03b433-da83-4ea2-bba8-57a1eaaa5d79@linaro.org>
Date: Mon, 20 Nov 2023 11:52:40 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-8.2] target/arm: Handle overflow in calculation of
 next timer tick
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Leonid Komarianskyi <leonid_komarianskyi@epam.com>
References: <20231120173506.3729884-1-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20231120173506.3729884-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: JyxqDbtOz0Kh

On 11/20/23 09:35, Peter Maydell wrote:
> In commit edac4d8a168 back in 2015 when we added support for
> the virtual timer offset CNTVOFF_EL2, we didn't correctly update
> the timer-recalculation code that figures out when the timer
> interrupt is next going to change state. We got it wrong in
> two ways:
>   * for the 0->1 transition, we didn't notice that gt->cval + offset
>     can overflow a uint64_t
>   * for the 1->0 transition, we didn't notice that the transition
>     might now happen before the count rolls over, if offset > count
> 
> In the former case, we end up trying to set the next interrupt
> for a time in the past, which results in QEMU hanging as the
> timer fires continuously.
> 
> In the latter case, we would fail to update the interrupt
> status when we are supposed to.
> 
> Fix the calculations in both cases.
> 
> The test case is Alex Bennée's from the bug report, and tests
> the 0->1 transition overflow case.
> 
> Fixes: edac4d8a168 ("target-arm: Add CNTVOFF_EL2")
> Cc: qemu-stable@nongnu.org
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/60
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> Thanks to Leonid for his recent patch which prodded me
> into looking at this again. I preferred to fix both halves
> of the if(), rather than just one, and I have thrown in
> Alex's test case since it was conveniently to hand.
> ---
>   target/arm/helper.c                       | 25 ++++++++++--
>   tests/tcg/aarch64/system/vtimer.c         | 48 +++++++++++++++++++++++
>   tests/tcg/aarch64/Makefile.softmmu-target |  7 +++-
>   3 files changed, 75 insertions(+), 5 deletions(-)
>   create mode 100644 tests/tcg/aarch64/system/vtimer.c
> 
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index ff1970981ee..0430ae55edf 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -2646,11 +2646,28 @@ static void gt_recalc_timer(ARMCPU *cpu, int timeridx)
>           gt->ctl = deposit32(gt->ctl, 2, 1, istatus);
>   
>           if (istatus) {
> -            /* Next transition is when count rolls back over to zero */
> -            nexttick = UINT64_MAX;
> +            /*
> +             * Next transition is when (count - offset) rolls back over to 0.
> +             * If offset > count then this is when count == offset;
> +             * if offset <= count then this is when count == offset + UINT64_MAX

Is it really UINT64_MAX or 2**64, i.e. UINT64_MAX + 1?

Beyond this comment nit, the action "set nexttick as far in the future as possible" is 
correct.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
