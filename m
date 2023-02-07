Received: by 2002:a17:906:dac7:b0:886:babc:7eeb with SMTP id xi7csp5879871ejb;
        Tue, 7 Feb 2023 15:09:58 -0800 (PST)
X-Google-Smtp-Source: AK7set9PvLSTvSQ70Tq7BFHzwCm9QwXFtZ7als94OoPZiWJC7AvoaUKU7XVa4WjL2Tp+dlUyIoUc
X-Received: by 2002:a05:6214:29ca:b0:53b:aa54:4eea with SMTP id gh10-20020a05621429ca00b0053baa544eeamr8772127qvb.20.1675811398153;
        Tue, 07 Feb 2023 15:09:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1675811398; cv=none;
        d=google.com; s=arc-20160816;
        b=oFLHH/XrbtvDD4ZW/oPYrMzPC6vbipQMwnepVwi5SZxzrZRS731b2hqPLMpX8JQt5s
         xYcm7Kk3lmehYftuOd0c2H98weTMfszFKsQBfsABaSVhnEL73jLRJA7IwjMsbfpj4mjJ
         Bv2GroQltF60mTM8q3bC5IHXgQjSptsWMCSpfbQ56RP1604bIYALOP+rEe9qhcmyELB7
         HraNg+Wv4YdRPJCwke8jtOZZKZMZ6TpCuipIYf3hXH69LmDILAOzF5otx4enaD+Ew8rA
         S/EDgqsgw/aVDmYEU7/HF0/NDSsTjc7CrqCyL7IxkNJRkM/j2LuTcL3n4hfkYGD2QESY
         QhQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=AelK7qIf/aAJ//2rxhJg/Cs46G73Ry4bhJF44sgxCSE=;
        b=ziAdtjnJksWX91spNOWpEHc290AXJIEOCcasOKBj/ZKcVgslF6rSrvfUUb25uqHHs6
         KpW6CTgXn4NR0d+HtOlZE6/W8ZMLFPZ0dTj82KMAwEOX2e7RzEYjthEC08cIbeZ+oB03
         kxKmIuk2rLBA+7IkOh8ej1HpFzoJoqoNRkNkDd5dFc64WYZXHwwg9SJcBvXoAT9SspnR
         pYhm0zoqAaXWE72aw87abhE/aXqfPITi8K3X6YxRxfzHBHpmRUbrF0YpSJYgMos5SCx9
         iVubhmnJxbBSoJgmQU6VrO2bnI6jzxOiATqNgaWM5LJBRsP+O5TcumJh2IONSnI8AMDM
         8Ulg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WOa7r2ll;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k7-20020a0cabc7000000b0056bf92d09edsi5769830qvb.473.2023.02.07.15.09.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 07 Feb 2023 15:09:58 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WOa7r2ll;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pPX5s-0002Jv-6I; Tue, 07 Feb 2023 18:09:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pPX5p-0002JC-LE
 for qemu-arm@nongnu.org; Tue, 07 Feb 2023 18:09:41 -0500
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pPX5n-0006EQ-Eh
 for qemu-arm@nongnu.org; Tue, 07 Feb 2023 18:09:41 -0500
Received: by mail-pf1-x434.google.com with SMTP id b1so1284516pft.1
 for <qemu-arm@nongnu.org>; Tue, 07 Feb 2023 15:09:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=AelK7qIf/aAJ//2rxhJg/Cs46G73Ry4bhJF44sgxCSE=;
 b=WOa7r2llOkkiSzoAgNppFzOX82bqU1jRXQxnMn/lqA/4wYH4vbAdbJPji/5ITJdrjt
 +fpb0KLHkbR4CXBHC+zdmHFwcqu7r/xOEl5J4vQFAXdC8KqXn5RhjAK/x8OZfv6Oj7mn
 a2ltAtCBe725Y8QWkvsjnUBU5uXYmBL/qWEAQHkvyNfp+gB7RYQLXsylO9sa2AcZPVlY
 Qq9J0oqzy5L43ANBbG57QSSO0HbS9foAO0ppHEs0xeRJWqgBUkCpu1M2pf2Ckx+248uv
 CwikEfKKNDWA3dpdoanNdpJ7uE+onDxU8ubX+Q2va/sWHdgKz4Wx92F1D6iwlZTJSbtB
 RdZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=AelK7qIf/aAJ//2rxhJg/Cs46G73Ry4bhJF44sgxCSE=;
 b=G2ZiZmVc3GqdENkw5eMeCxwGM6ouLPlJrdT4XKdgQKQM1+jVg2i3Zc00xBGw2Vxfu5
 MvZ8/6ot1g67AcVAz/ONSVfnADfJn8WXCK+u2gCyQHPdwDoogSU/6YPAcr9JosvLSoat
 ssmi3jAHOuLY4ZG36qqZkuk05ijJGkemCxCjqWqKIFSbq8BltzwUPeszHm7yGTYKtICF
 lfHHWhXXeogkUTqYdJclMMzfU7wcsrZCTfSRkxt9LDb00nH0esZpwL6z9yyXabF/v0tw
 OEyk6Dv+fYr6/AR9MTPIZHaIZWeZeIHKTERyCIr9CRPNY8lcJyVowDfBY1HFSl/6aqA0
 e6hQ==
X-Gm-Message-State: AO0yUKXAV/cOoQdPvyT5vs5FQJBwLTqtrCnv/twq9ytjOGuNsF1mpDz0
 eNeEuJx1YEuQT2RfnbUQExO5AA==
X-Received: by 2002:a62:33c4:0:b0:58d:abd5:504a with SMTP id
 z187-20020a6233c4000000b0058dabd5504amr3929004pfz.31.1675811377933; 
 Tue, 07 Feb 2023 15:09:37 -0800 (PST)
Received: from [192.168.101.227] (rrcs-74-87-59-234.west.biz.rr.com.
 [74.87.59.234]) by smtp.gmail.com with ESMTPSA id
 h1-20020a056a00170100b00593c1c5bd0esm9805210pfc.164.2023.02.07.15.09.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Feb 2023 15:09:37 -0800 (PST)
Message-ID: <775ff0ab-fe3e-d864-c205-a0f0da5b7118@linaro.org>
Date: Tue, 7 Feb 2023 13:09:33 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2 05/11] target/arm: Convert CPUARMState::eabi to boolean
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Laurent Vivier <laurent@vivier.eu>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20230206223502.25122-1-philmd@linaro.org>
 <20230206223502.25122-6-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230206223502.25122-6-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x434.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148,
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
X-TUID: qb9Xd1KTZ+Tl

On 2/6/23 12:34, Philippe Mathieu-Daudé wrote:
> Suggested-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   linux-user/arm/cpu_loop.c   | 4 ++--
>   linux-user/user-internals.h | 2 +-
>   target/arm/cpu.h            | 2 +-
>   3 files changed, 4 insertions(+), 4 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
