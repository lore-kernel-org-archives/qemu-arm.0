Received: by 2002:a17:906:28cf:b0:a52:4db9:938b with SMTP id p15csp1840220ejd;
        Thu, 18 Apr 2024 09:12:10 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUOmsbaorI/HAZgy5Sf5yTgwqmW2ZoBHqbxK7Afhxgfd6lqwCZDthdXCnbjgfLSnhJGXXpNa44OAwqIVxCjvO/nXvEcsN9S
X-Google-Smtp-Source: AGHT+IHBJs3JtE0SoBgysolLWHp0zWVtOmWbxrGfmbJgSeeuYRJKqC8mgj6YgVhcD+7UHYgixnui
X-Received: by 2002:a05:6358:ed0a:b0:183:86c4:7603 with SMTP id hy10-20020a056358ed0a00b0018386c47603mr3917158rwb.15.1713456730041;
        Thu, 18 Apr 2024 09:12:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1713456730; cv=none;
        d=google.com; s=arc-20160816;
        b=y7AfB33A35MAZntvyH6+5JW0J/gc5Db3jjaIos6H1EEpRmh4jvpFgJKaqdyip9i9nl
         x90S9dshipEIqyblum8vOX6K+n3Qs9EFoL9P9YH6xOymYWxECrCSRMWDb1md6/M1M7g/
         Yu2yOv7WttvzawM6f+4Ef1KboT5nRxQPPWtfrHkwWYSMB88u2NSV0aIbyqGiVnExMv+8
         pZkVZ07QqrpGrvXAXh1mktAwFT7LyIKey6Pl8TAG0EFtm2Vpv4GuaaR8CIQxpftOKFhj
         FqwbYipy9hCFt8NbfRUQJX2q5I3ZRtfVU3q5cBTVub/wHNxwi6xZai0u+I5inqksmrWH
         Ub3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:to:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=8f+xeoQElMOeylku4hmSMhrCLGOsmIXRJdHOyzLsLyg=;
        fh=Oq2La5H29UZCJBom12YbMsBFnzRSjkQ6u5LLU3YpyUE=;
        b=PWL/6y09fdfmNwAORR3yh0BZat0Hf3mZzrzpcI3oejtn/i6aMecvbQjk/wphWDFajT
         gQJ8FI0C8EHi8HdAUodPKMIVL0wZT5GC7Y+Jno8xAZDeUlZ2zFoD8Ds7Wik3JjjJPABE
         NCz7uU6qPNK6aC3OfLLFCnepVa9h3ded4h9wF3PCs33K14EIJ9EtQ1hRJpCnzlDT3tw5
         Q3jCQjXi0WxT1m5GBLGzxtjmVX7SZXKLErUas1pgGhhjoLd3v10c69tNbICla7gFTzMV
         9eQ25gS0cuMFgLzBdxJPYaYIddAJ+hWzsBjCbkdFMITe8one4kP76ORZ0D57zFqHmdcJ
         M5UA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QiTBg63z;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ez28-20020a0561302f1c00b007ec3480a2cbsi331163uab.217.2024.04.18.09.12.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 18 Apr 2024 09:12:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QiTBg63z;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rxUMa-0003Ks-0n; Thu, 18 Apr 2024 12:11:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rxUMZ-0003JO-5a
 for qemu-devel@nongnu.org; Thu, 18 Apr 2024 12:11:51 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rxUMW-0006y5-Re
 for qemu-devel@nongnu.org; Thu, 18 Apr 2024 12:11:50 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-418e4cd1fecso6064845e9.1
 for <qemu-devel@nongnu.org>; Thu, 18 Apr 2024 09:11:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1713456706; x=1714061506; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=8f+xeoQElMOeylku4hmSMhrCLGOsmIXRJdHOyzLsLyg=;
 b=QiTBg63zPek1pbca7lr7yriroiDhcH+cPq4kU4gsAMjRVjZwQQkv2ouPVeZJaqJBiP
 bJ3EULIpqbsP0SM/QuZqmKDCvG5YPgKWOlLYZ36T2SwiKw21j2Fa5sbwuNRkTn5ms4yU
 L2K2XU3oxmCSb6tyfJ49HjHQ/YYZgw2U1MdyK12IJMfCmbY7aCzT/5in1kxB6cXjh2RX
 BPWWMw/WYaBCq9vj6A3xnWrwf0V2HO0B6rkE/+niK1BRmu3DpCNMjgN1y81fwrnYXORU
 t3s8qGmmfoDrc8OXUJHZIhhF011inQPELI/ihElFKtqdByw+oVIxkRJNwcYeyinUmnlx
 qjlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713456706; x=1714061506;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8f+xeoQElMOeylku4hmSMhrCLGOsmIXRJdHOyzLsLyg=;
 b=NstsQIK9Ywv7tKWm+RRhlhb0iYpBD/H+jQzWfDcPyFsk6HRqX0QqjYsZ8l3galbhMR
 lTnU+R0pwms8EtBPFeFtHddGBB6fTqRmxBeGX8hnWZHNk+Cu05tixZbM4J2oVDy680kc
 LKpTRhRjOqPgeadVkyvFT6CJgpOSrOb0ZL882PUKs3YLYoMYMtFFLWwxyZceZJ0w9yQU
 gCEXKKDSUBA6DQdHChPnn9rPS2LEd5rnBjQt8VBwVoyuAiOWgBNQXMF3RFYZgF4seSNs
 A6ExTTCK9AE7+8KNnvNj71Q5UrkpEg0HPC6JQjg4ba1X3xH5+Andv3iu8ADLx1X6WQln
 dNTQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVlxTm0uggwg/005HAqfZ6ffUMvwaNSknYh0bbl5L/xUoQCOParS0qDQ7jWuPvLZTZdFHFlaluinBGqedJLTnY1OEXlZC8=
X-Gm-Message-State: AOJu0Yz5KWGNGWkU04eBZryuLrMygpPmjynuAbQ9mZ0YXsmn2kCqGlMk
 H0xi2ioHAqSjmb7hnRN+tMOnK4B9CMAl32E7yMCYnBVPxDQLTYJjbTPUtk6pjKNyMFtnqSHJxp2
 K
X-Received: by 2002:a05:600c:4f10:b0:417:d4f5:6501 with SMTP id
 l16-20020a05600c4f1000b00417d4f56501mr2343077wmq.27.1713456706562; 
 Thu, 18 Apr 2024 09:11:46 -0700 (PDT)
Received: from [192.168.69.100] ([176.176.151.213])
 by smtp.gmail.com with ESMTPSA id
 n18-20020a05600c4f9200b004169836bf9asm6994541wmq.23.2024.04.18.09.11.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Apr 2024 09:11:46 -0700 (PDT)
Message-ID: <0609dc37-a7d4-45f5-96d8-4122e40ac0d4@linaro.org>
Date: Thu, 18 Apr 2024 18:11:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] target/arm: Enable FEAT_CSV2_3 for -cpu max
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20240418152004.2106516-1-peter.maydell@linaro.org>
 <20240418152004.2106516-3-peter.maydell@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240418152004.2106516-3-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: vt64jq3thSH+

On 18/4/24 17:20, Peter Maydell wrote:
> FEAT_CSV2_3 adds a mechanism to identify if hardware cannot disclose
> information about whether branch targets and branch history trained
> in one hardware described context can control speculative execution
> in a different hardware context.
> 
> There is no branch prediction in TCG, so we don't need to do anything
> to be compliant with this.  Upadte the '-cpu max' ID registers to
> advertise the feature.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   docs/system/arm/emulation.rst | 1 +
>   target/arm/tcg/cpu64.c        | 4 ++--
>   2 files changed, 3 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

