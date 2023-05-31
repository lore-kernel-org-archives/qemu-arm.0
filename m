Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp83554ejb;
        Wed, 31 May 2023 09:33:06 -0700 (PDT)
X-Received: by 2002:a05:6a20:840c:b0:10b:bad9:1d31 with SMTP id c12-20020a056a20840c00b0010bbad91d31mr6178895pzd.26.1685550785962;
        Wed, 31 May 2023 09:33:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1685550785; cv=none;
        d=google.com; s=arc-20160816;
        b=JKLSsE4w067/oJ4bHAuIRWFJmucB3wCAM8sU7sXCPd+2k7KWvLjuoiFf/B+mn60cso
         iqiG2Qi7eR7i+LESjHq4b84JauyJTfugEkBz3YNEU+2pAa6ipBGSt0arpvolwxmmp1v1
         TokmVUfFAapQzt7PbY0PLAccapVa0vv4Dc8qr4287z2zmaxPRtCZvBK42JdOjC+DIfkk
         7s5eYg31BXWnFTa7qOBZI6qD/WziAbBP3VaKRmmMTmU1oHUVhw9EAkdP6ljxsXGeYFqu
         xTBRl9fnpNkxzHRm3SQ2vkAyYHd2RSBDVveu4+TzbEc2g7BK3ch8tlYgKM5DNgW7OKnV
         00KQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=E9XdHN4DR4rz/qIpPKcoMHbODMY2jSHgCvZ+yzeKQIg=;
        b=fNKe7f4EVWWbQBwIUID56lbnPSlLv5O7jAs305mWru6hYvx3clQCKE/4BsZcd6w0Xb
         ggWmZvAWZaw7JKGxvgWI4CD/CC0zdwSqOcr2MbwoE79xBA8vENfY6xxExeVbDD0AqOpk
         Cw/1fpyYnMJrOHvBiejnDArdyc3/3h+g56YtolQmvc67/oZuskAFd8Q1dKEnLUjR6sQi
         AmPo2yvDdNRj2t3SemVY0qbj9L3akBv9Gk0k5wdkFmUMVlplVimmj5ieHzc4JrKvuSge
         JMFOk9MfbT5B0opRtv7rFzFkCDRWEDWG8E6QqHI5jS4IXvRsaLlhETQuEC8K+iyeUSir
         6GtQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=H5PRwFML;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id c22-20020a637256000000b0053f24deef06sor525851pgn.6.2023.05.31.09.33.05
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 31 May 2023 09:33:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=H5PRwFML;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685550785; x=1688142785;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=E9XdHN4DR4rz/qIpPKcoMHbODMY2jSHgCvZ+yzeKQIg=;
        b=H5PRwFMLmxOq2+z0A1V3HP9uVsS/wm1F5igR+3xg1e//smln5Bdw8FMYxPAwYgjRDj
         SUYYxQueob14ehRT8M6eMlTPqbbLtYwQOoW1Kjsucc2Ecraj43YbfuKyngFrNxRhS0vP
         VDxv0PDu9HkSmPlq+f9JYDWqhuDYlYLhN5XXcU9bp/2GdJXNpkiC4guEcRpJtGxfniLM
         Y99cILqlo9jgmhX2gpY7F0ByWT8EPtRApCkrO5kILr+9CrkET1yPFbUN+iOP+9fpaRsp
         2gQR1S/EOr7u7pXVAgtxzulw0/pb6pRFA/MZI7xt3QAWVAbV1Lj1/Vtkimx9C0oW7KnE
         JOEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685550785; x=1688142785;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=E9XdHN4DR4rz/qIpPKcoMHbODMY2jSHgCvZ+yzeKQIg=;
        b=OL+sQgnIx/jC2hYfGOaKoaRn78soYZWsGeH2luVvtkVkP6dzCHfV74QM4cyOw6JdZ6
         NH/jmPLx+rhro3MN3/yaSHpyUPEIVH9SwBcLq7QWZbT4OEhDWvjWd1/uTdbn6c+qBRgY
         9+97pTOJYqVI7rd/te+B8CSMV1mIjzO7ULNhHsQW3mXic3E0UhQqZxE/e3UwSqFn47m2
         ULDj+qYKI1FRSqOIfX60hZVzOZugXWO7Rorqk9UA5ubupTauVN6N6NkJK8smlduUc8nJ
         l9Aqym5uKa/0u5DGtyVuZuHNdpsqy1vqp/jjtbLz/cwZTcmL1hQGP3OEAfcRs6CjgLnu
         ae4g==
X-Gm-Message-State: AC+VfDzkH+VN028QbgZKoFSEpJ/wb7JizOJ/P/YXp3RfruGw2WZ/Pm+T
	DhK+mSVCoLxzxbPab47aXa9T/7Bw
X-Google-Smtp-Source: ACHHUZ4HRGKYn93Fv0m5ktmypcweIU0KhfCXWhKiuQ3X1OL5VgTUi9Z6/4Ukjolt4c2kZFIYqXAB2A==
X-Received: by 2002:a17:90a:a00d:b0:256:2c8e:3008 with SMTP id q13-20020a17090aa00d00b002562c8e3008mr4422940pjp.48.1685550785334;
        Wed, 31 May 2023 09:33:05 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from ?IPV6:2602:ae:1598:4c01:3019:d9fa:8bb1:50d7? ([2602:ae:1598:4c01:3019:d9fa:8bb1:50d7])
        by smtp.gmail.com with ESMTPSA id gp18-20020a17090adf1200b00250ad795d72sm1439921pjb.44.2023.05.31.09.33.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 May 2023 09:33:04 -0700 (PDT)
Message-ID: <722d7683-80b4-bb23-3ca2-77f8de23b801@linaro.org>
Date: Wed, 31 May 2023 09:33:03 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 0/2] Implement AES on ARM using x86 instructions and vv
Content-Language: en-US
To: Ard Biesheuvel <ardb@kernel.org>, qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
References: <20230531112239.3164777-1-ardb@kernel.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230531112239.3164777-1-ardb@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: wejcuNIi/bRr

On 5/31/23 04:22, Ard Biesheuvel wrote:
> Use the host native instructions to implement the AES instructions
> exposed by the emulated target. The mapping is not 1:1, so it requires a
> bit of fiddling to get the right result.
> 
> This is still RFC material - the current approach feels too ad-hoc, but
> given the non-1:1 correspondence, doing a proper abstraction is rather
> difficult.
> 
> Changes since v1/RFC:
> - add second patch to implement x86 AES instructions on ARM hosts - this
>    helps illustrate what an abstraction should cover.
> - use cpuinfo framework to detect host support for AES instructions.
> - implement ARM aesimc using x86 aesimc directly
> 
> Patch #1 produces a 1.5-2x speedup in tests using the Linux kernel's
> tcrypt benchmark (mode=500)
> 
> Patch #2 produces a 2-3x speedup. The discrepancy is most likely due to
> the fact that ARM uses two instructions to implement a single AES round,
> whereas x86 only uses one.

Thanks.  I spent some time yesterday looking at this, with an encrypted disk test case and 
could only measure 0.6% and 0.5% for total overhead of decrypt and encrypt respectively.

> As for the design of an abstraction: I imagine we could introduce a
> host/aes.h API that implements some building blocks that the TCG helper
> implementation could use.

Indeed.  I was considering interfaces like

/* Perform SubBytes + ShiftRows on state. */
Int128 aesenc_SB_SR(Int128 state);

/* Perform MixColumns on state. */
Int128 aesenc_MC(Int128 state);

/* Perform SubBytes + ShiftRows + MixColumns on state. */
Int128 aesenc_SB_SR_MC(Int128 state);

/* Perform SubBytes + ShiftRows + MixColumns + AddRoundKey. */
Int128 aesenc_SB_SR_MC_AK(Int128 state, Int128 roundkey);

and so forth for aesdec as well.  All but aesenc_MC should be implementable on x86 and 
Power7, and all of them on aarch64.

> I suppose it really depends on whether there is a third host
> architecture that could make use of this, and how its AES instructions
> map onto the primitive AES ops above.

There is Power6 (v{,n}cipher{,last}) and RISC-V Zkn (aes64{es,esm,ds,dsm,im})

I got hung up yesterday was understanding the different endian requirements of x86 vs Power.

ppc64:

     asm("lxvd2x 32,0,%1;"
         "lxvd2x 33,0,%2;"
         "vcipher 0,0,1;"
         "stxvd2x 32,0,%0"
         : : "r"(o), "r"(i), "r"(k), : "memory", "v0", "v1", "v2");

ppc64le:

     unsigned char le[16] = {8,9,10,11,12,13,14,15,0,1,2,3,4,5,6,7};
     asm("lxvd2x 32,0,%1;"
         "lxvd2x 33,0,%2;"
         "lxvd2x 34,0,%3;"
         "vperm 0,0,0,2;"
         "vperm 1,1,1,2;"
         "vcipher 0,0,1;"
         "vperm 0,0,0,2;"
         "stxvd2x 32,0,%0"
         : : "r"(o), "r"(i), "r"(k), "r"(le) : "memory", "v0", "v1", "v2");

There are also differences in their AES_Te* based C routines as well, which made me wonder 
if we are handling host endianness differences correctly in emulation right now.  I think 
I should most definitely add some generic-ish tests for this...


r~
