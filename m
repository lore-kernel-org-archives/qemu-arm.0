Received: by 2002:a17:906:fc07:b0:9bd:85f7:2662 with SMTP id ov7csp574882ejb;
        Sat, 21 Oct 2023 18:29:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHMyU1Ap3OeyXCKNPAsxQdLuDmadB3zawyyzOpJ0nCuFygifYdS2ysAjJRzIpGRoAS/ldE+
X-Received: by 2002:a05:6214:2527:b0:66d:2fda:c9e0 with SMTP id gg7-20020a056214252700b0066d2fdac9e0mr7723682qvb.61.1697938196563;
        Sat, 21 Oct 2023 18:29:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697938196; cv=none;
        d=google.com; s=arc-20160816;
        b=aIDQmF4g+ULxdXgVQsPHnsMQILJWJRqGilEKoJENnUh/3eiIHEieMa5QCqENaplpr6
         l37CSM+ShJMmxLQ0ArlIUsqB72c3idn+RCtx5Uo2iFQ74OqGPGz5EEdoL1ykKXFt3ajZ
         XpFy9iRoH8E/8Wvn7j+mSQl2B/Zi74kgvPRnTg6AtS4be3l8yN2vYyg3ACz68Z1IZLbd
         Yx+y5czw+cbelOmTXkMB0eCDJN0g+rWdyey7v3CwkYoend7VdSO7zaiEGI03sy1Iz3oq
         3GFB+ufEYsZ8csQTSAW4kN8RXv2OEuojB61Y25xnreysXF9GEFo0zA6xf6G+5Hq71AAc
         6JeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=gUdIwM9a9fzr4xrCKGrW+zLWuchdXV1ltRHAYLtkHYA=;
        fh=JnPHmJClkuK8perx8qIdU/bXbbmYwETDNcduzvfCXSM=;
        b=xQgaBgbOD7FJ5HaUGoDPNdkgGYt+pqhgO6L9ZsJyyACukCW5SYEq16N/2elzmjEeQ9
         25k8mru4WX9Y5OZtDQ47KjYCy1H+fMIiaeYHzYwLKalq695lucuzRNcSDT3ekaikoxa5
         Hj6yrKjJHWfeS2Rh4vk75BXNnCY/+DJ3jOOI6jaFUqnewxqniboeVhulW8Ar/7/Q1Ne4
         GDoAf2jsl9N/59EzWS6yvOWTWIFnehE8B73WcPEbiTzN9sDIT5YT4zp8WzdwrE1Q9mlt
         UbjdjpAdKbO3JJyOQevXrhFHcpXwhN3bM1NVAFrM1MsexZxlf//6poS+CiZP/HwDrzq6
         1+3g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=If5RALHK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id cu16-20020a05621417d000b0066d239d89bdsi3410561qvb.445.2023.10.21.18.29.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 21 Oct 2023 18:29:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=If5RALHK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1quNHa-0003ks-9q; Sat, 21 Oct 2023 21:29:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1quNHY-0003kU-FH
 for qemu-arm@nongnu.org; Sat, 21 Oct 2023 21:29:32 -0400
Received: from mail-oa1-x33.google.com ([2001:4860:4864:20::33])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1quNHW-0002mC-Qq
 for qemu-arm@nongnu.org; Sat, 21 Oct 2023 21:29:32 -0400
Received: by mail-oa1-x33.google.com with SMTP id
 586e51a60fabf-1c0fcbf7ae4so1685610fac.0
 for <qemu-arm@nongnu.org>; Sat, 21 Oct 2023 18:29:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697938169; x=1698542969; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=gUdIwM9a9fzr4xrCKGrW+zLWuchdXV1ltRHAYLtkHYA=;
 b=If5RALHKOlMm+Tr26hLniqLpqYEUUyM8FuFy9MlCnI8fG8rTitbaXaygwDmgadP92w
 oKRdT10waPs5PCSGxZDQf6R0ICzEeRcniqbqxcoimIAR6z3k22gG/EmCZYvrleAfQFV9
 ntwSE7l33PzELM+bc75P1kinToTAmzqZDsBalo/Lq8TnnAr33WF9fF6XjJYUzElg0/fD
 2PnSg1383K5aWfjls2mUtXx5f8Na+4YImIm6VLG2BV8t0pcD3pGPS1+e+NDXB+NJ3dmo
 1SvzirXPTxyO0GuIXSltsVf0TfvzhZN268vkURvDO9cHsYhWKn9YlrCK0B7ybDgOGSuB
 ysnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697938169; x=1698542969;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=gUdIwM9a9fzr4xrCKGrW+zLWuchdXV1ltRHAYLtkHYA=;
 b=XPDCbKmZK/hsTACcNvgiaW3QC9zFy0DpBva5kUy9T6RkOtMtw+ksyAvibkd+lzWpeQ
 99NeGyysUtQe7d5u7V4VJg4SEaff1SabEsqc3yMA7IwdnCOX2CPV4MbF1SKS/9LSf/j7
 nIFvzxV6PzRXmB+EPfR4+o2p+MFJUs4FHellcAXwkmbBRO4P0aCO+4iDRZERhHWs8yTO
 qXI1ykbAsnQEmI1inzZF/MOQuZK9FJvymEiXuAiuj9dsCmbI0QklYBs08hFGPL+z+t7u
 aSXhjHFVE7xXVvBxIh6Dwal09yLL8yj3q053rjeRbuoP2OnOgrLPYOoGSgGVGbDAsXl4
 gcvw==
X-Gm-Message-State: AOJu0YwmtgUi3JQMoNAOqzNKJd/2eYvnW7lpYjUr0ibQiFyomAtKKUHQ
 B5iKhrUOBs+rzDBHeaqsOF2g2g==
X-Received: by 2002:a05:6871:2312:b0:1e9:a434:58a5 with SMTP id
 sf18-20020a056871231200b001e9a43458a5mr6475934oab.46.1697938169265; 
 Sat, 21 Oct 2023 18:29:29 -0700 (PDT)
Received: from [192.168.0.4] ([71.212.149.95])
 by smtp.gmail.com with ESMTPSA id
 nk19-20020a17090b195300b00268b9862343sm5312836pjb.24.2023.10.21.18.29.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 21 Oct 2023 18:29:28 -0700 (PDT)
Message-ID: <4339bf9e-ad25-41b7-91cd-1da8c65d782d@linaro.org>
Date: Sat, 21 Oct 2023 18:29:26 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/7] target/i386: Use tcg_gen_ext_tl
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, laurent@vivier.eu, ysato@users.sourceforge.jp,
 kbastian@mail.uni-paderborn.de, jcmvbkbc@gmail.com
References: <20231019182921.1772928-1-richard.henderson@linaro.org>
 <20231019182921.1772928-4-richard.henderson@linaro.org>
 <5f54e3e1-1c90-0249-04f4-df522e292abe@linaro.org>
 <03ba02fd-fade-4409-be16-2f81a5690b4c@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <03ba02fd-fade-4409-be16-2f81a5690b4c@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::33;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x33.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: Nx/T2QiuzVB3

On 10/21/23 00:59, Paolo Bonzini wrote:
> On 10/19/23 23:57, Philippe Mathieu-Daudé wrote:
>> On 19/10/23 20:29, Richard Henderson wrote:
>>> -    default:
>>> +    if (memop_size(size) == TARGET_LONG_BITS) {
>>>           return src;
>>>       }
> 
> Any opinions about adding something like this on top?
> 
> ------------------------- 8< -------------------------------
> From: Paolo Bonzini <pbonzini@redhat.com>
> Subject: [PATCH] include, target/i386: define and use MO_TL

Yes, that looks fine.

>   static TCGv gen_ext_tl(TCGv dst, TCGv src, MemOp size, bool sign)
>   {
> -    if (memop_size(size) == TARGET_LONG_BITS) {
> +    if (size == MO_TL) {

Yep.

> I can add it in my x86 series if desirable ...

That's probably fine; you may well get your PR in before my next.

>>> +    tcg_gen_ext_tl(dst, src, size | (sign ? MO_SIGN : 0));
>>> +    return dst;
>>>   }
>>
>> While here, I'd rename 'size' -> 'mop'. Regardless,
> 
> Not sure about that, because "size" should be just the low bits of MemOp (the MO_SIGN bit 
> is passed separately).

Agreed.


r~

