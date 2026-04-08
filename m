Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5799B10F9969
	for <qemu-arm@archiver.kernel.org>; Wed,  8 Apr 2026 19:20:19 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wAYPF-0000YP-1I; Wed, 08 Apr 2026 15:17:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wAYMR-00064E-Er
 for qemu-arm@nongnu.org; Wed, 08 Apr 2026 15:14:47 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wAOLR-0000wB-Ft
 for qemu-arm@nongnu.org; Wed, 08 Apr 2026 04:33:06 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-488971db0fdso48087715e9.0
 for <qemu-arm@nongnu.org>; Wed, 08 Apr 2026 01:33:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1775637184; x=1776241984; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=z4v1Hw4XP17q49TcvxomiCeZR5f5JQYZxdu4nKgx7Jw=;
 b=NOQgs5csZq8yCpamEe7nnCNoGjM7cFW1bD5yWMKdk5PPqLtl1Wz/qLhlNe1U1e5uu8
 CH2+rzKg70q8nMyQKGN9kn1i/m8Gbg8ZVYCLiOC2gVATbA3UyqrvpYB4b0QOAKBmquMd
 bNj5cwL44e46QQuBo9FNm1PWhWqWTiq9BpCt7kGeO03M8BHM74pZmvJzGQ8UbhPn7i4h
 KLjCLTyGkXEJx0bKaVj/zIPNHx+ylN7zqzBzELuJNuoUhQYOhKIdjg8z0tZZkU+Y87w2
 I9sIER3lP1mw87fslvwE/zkQO/vln5+KA4WuHFaYfPIPripKOdDAMIfSWwy6Ho01Cxtr
 nK6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775637184; x=1776241984;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=z4v1Hw4XP17q49TcvxomiCeZR5f5JQYZxdu4nKgx7Jw=;
 b=EkLNep6bHoQtvxmfkuS6cCsLox6zlODF6pkdfPsOwvlxlBiq2HmXlgCUkmXXAaj5tN
 HYn6zx8NloeYvIAdDm6m1VhfvBDUauCHWqEqd+t4wdOaVPI1EFaP3a1z+JHkZnt5rfhw
 W8ySUF/jFZPKGs3sQObNXeT8Dv/oTLP6g1MxRhuGvUdpJFPI0rkoYeiUMIknLK6Fv6R+
 90ax3mYplBo9SN8T3duk860pqoFIMiK45OQWoGFs+UO4pnc0jiFfLCLU1kVEWFffMjB8
 1vPonM6aquVNfT4PIypobFP6wXBC1k8fuIgvmEMoFpF/A54e+AtY4/0HFGfGHxAdKbCO
 YSkw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVSsfmrvhKj1GixxiHxhFt2i0suLZNgPmzRKeV6VEaaQt1bCq4t5/GOu2YFVw1LbY6eG70upFBuiw==@nongnu.org
X-Gm-Message-State: AOJu0YwE3wTJuH3dTYKIB1Q3bh2R9G+Wup3tSNfYi8isrhKq82NeV6fP
 xDzHGOk+olEQHUgy5n7+5tf71p3dv1kOISfUDoANTMohBLqITpDbgKCJ81BUBFO2g9I=
X-Gm-Gg: AeBDievvclbQXwhHJY2PfGIEHgTC6L7vd7c8YUswjFwu24T9wHCG0AR1hvEWOyWDYyZ
 B6XjPRVZlH1KJfjt9LJnkj12JEkGwshnG6mDmoCAb3+dmKDm5k8JkEHsUc/d4NtBS68v8j9kPXV
 3OG90UhnU7KnB80UcuvNMa5DLIjoWBE5sPZ4x/yxdUwF01/n1aGVop+x5KRMeuIEtT3FX9NhQ15
 zm0h6nhAfK8Dl/8sGm1jBgO3iEozIJLFGcTyg/DKOxzZCKn6KhtA/JFNwXveez5RTY8qLPRgezx
 adsQW1xqKSaodztAl4R0CUPJ5nqGwFdBlHZUgnRodOZparXbQuac/sktvLPkNhaY2XdVtsHIV5Z
 RQ/cbrTYJFyW/PzsBmh1RJWPU6JKvuIZH5FAyMRHgQkuj0wCCWD/KiPtzwokHw6t5PoNBpdCHXr
 0u/ETRl2xMam8EOzuFsgpOBbHLKJ0SkVIkr8mHcVojILz9Js4KCbL38pESoDgKw8jwrg==
X-Received: by 2002:a05:600c:6098:b0:488:9fb7:376d with SMTP id
 5b1f17b1804b1-4889fb73b1amr252250055e9.28.1775637183690; 
 Wed, 08 Apr 2026 01:33:03 -0700 (PDT)
Received: from [192.168.69.228] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4887e80a616sm1150596935e9.2.2026.04.08.01.33.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Apr 2026 01:33:03 -0700 (PDT)
Message-ID: <41713965-dc77-483d-a026-41bb234b6289@linaro.org>
Date: Wed, 8 Apr 2026 10:33:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 14/21] tcg/translator: add parameter to
 translator_loop for current addr type
Content-Language: en-US
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: jim.macarthur@linaro.org, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>
References: <20260407222208.271838-1-pierrick.bouvier@linaro.org>
 <20260407222208.271838-15-pierrick.bouvier@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20260407222208.271838-15-pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32d.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On 8/4/26 00:22, Pierrick Bouvier wrote:
> With TCG_ADDRESS_BITS mechanism, it's now possible to specify which
> variant every source file is written for. Compared to before, it means
> that addr_type will now vary per tb translation, where it was constant
> for a given target previously.
> 
> Thus, we add new a parameter to translator_loop().
> This will allow us to convert targets one by one.
> 
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> ---
>   include/exec/translator.h        | 4 +++-
>   accel/tcg/translate-all.c        | 1 -
>   accel/tcg/translator.c           | 4 +++-
>   target/alpha/translate.c         | 3 ++-
>   target/arm/tcg/translate-a64.c   | 3 ++-
>   target/arm/tcg/translate.c       | 2 +-
>   target/avr/translate.c           | 3 ++-
>   target/hexagon/translate.c       | 3 ++-
>   target/hppa/translate.c          | 3 ++-
>   target/i386/tcg/translate.c      | 3 ++-
>   target/loongarch/tcg/translate.c | 3 ++-
>   target/m68k/translate.c          | 3 ++-
>   target/microblaze/translate.c    | 3 ++-
>   target/mips/tcg/translate.c      | 3 ++-
>   target/or1k/translate.c          | 3 ++-
>   target/ppc/translate.c           | 3 ++-
>   target/riscv/translate.c         | 3 ++-
>   target/rx/translate.c            | 3 ++-
>   target/s390x/tcg/translate.c     | 3 ++-
>   target/sh4/translate.c           | 3 ++-
>   target/sparc/translate.c         | 3 ++-
>   target/tricore/translate.c       | 3 ++-
>   target/xtensa/translate.c        | 3 ++-
>   23 files changed, 45 insertions(+), 23 deletions(-)

As per v10:
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

