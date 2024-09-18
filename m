Received: by 2002:a17:505:42a7:b0:1be9:327d:8ee3 with SMTP id rt7csp87944njb;
        Thu, 19 Sep 2024 03:04:55 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWgcvLF8YFYjz/yLPn7pLuNrJHuChrXGxmRp697g427W0MtjsAagSZ/XTzAmSK+yh8DnkiZjhmy97nfeA==@linaro.org
X-Google-Smtp-Source: AGHT+IGg8ah7GtytVPFptfuzuOw/8WMiXnLJBVR9jbv8uzIpNEPmIX+e25g+jL7w5Z31ZqS1ACRu
X-Received: by 2002:a05:620a:4045:b0:7a9:b308:644 with SMTP id af79cd13be357-7ab30dce6d2mr3871016885a.58.1726740295101;
        Thu, 19 Sep 2024 03:04:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1726740295; cv=none;
        d=google.com; s=arc-20240605;
        b=IKSlBWb4Z5tUYv80HWer500C9r0yZQ6hjknCvYedfTkyEUZ23ODe4qodZjR19Cby3y
         lfftWPV6+prcWPt3Bz82cUdp42AZittCtdcrpBaUEtgn+c+Duzdg4VMGLdziT9AdyUkE
         i97EduGRitAhYj9TwhMsR6fHbDBbJcgaZS798ayucOcLboTt8novhwj8uENXYt3F1fcH
         xcJTsR+kRfIwMNIxHkY434KU215AwG/jychQDs0yBdLMtkhbI54qzsSrTvnGWWeVrloo
         dX+b6M/GaOke8XwwvVry/mu6pd1CD6Eb/jc3wrsSabJ0SFRrnit0yJRHkTFlTNgr5dDm
         1rDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=7fgkteckHfqEieyx6yTUMKAb4iTKgJ61+BnzJtGAfN8=;
        fh=TMhghm+M4aKltBdNclUMMRJa4pE8VlHgEXRByGNC3EA=;
        b=c/AwFm/CqUhbgn0IRrBR5Rw4l/4Agp6nmz0HzFwPcRcEwQoNu6Dsl2xGe4y+d/n23I
         LI4WQG9Wat712KpXSKd+guy/skrZ6tAZM18gNJJDoQ8OAaqyCaFXjqYCHAxmIAMj/POX
         2e4CyiBYitbs1CduPCRnenB3+PPKC26sx6GuBCT72+vDFOneyH9W0arzAAsHt+e4v57h
         EMBJc7dA7QAqsttPf7IjLtYatlkzEzhVfvy5bBAKEv6Lmh63gHkKZwCDeaDZZUlXtK5C
         Wr4D2TaetrIxmgfnpFUabq/3VJh7yM3vw7FN0fmcRZE9cGVYMZO2mWe24U3j7tlJsZqv
         JhIw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ncbJDJ87;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7acb08c4908si150745385a.349.2024.09.19.03.04.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Sep 2024 03:04:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ncbJDJ87;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1srE1e-0004sz-M1; Thu, 19 Sep 2024 06:04:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1srE1a-0004i4-Cs
 for qemu-arm@nongnu.org; Thu, 19 Sep 2024 06:04:34 -0400
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1srE1Y-0002G7-3l
 for qemu-arm@nongnu.org; Thu, 19 Sep 2024 06:04:33 -0400
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-5356aa9a0afso1027385e87.2
 for <qemu-arm@nongnu.org>; Thu, 19 Sep 2024 03:04:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1726740269; x=1727345069; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=7fgkteckHfqEieyx6yTUMKAb4iTKgJ61+BnzJtGAfN8=;
 b=ncbJDJ87G2z8WAG1XcNkT647SBidy374rw4Utoo/7cooVdCxq4+neWYcH8KQp8YTgN
 HsAbbvOeAkjzTRVI3muhgc3N71mcJx01zv6yTB1dUzh3GE0Hr26GNAHSL+Dy0WXRXZTg
 xUj7mouXovuP/paEGxcfvqwFBqcHlfnOOcz/1tbiyQM3QJ64Ea4eWPcc6RC8PEA1losY
 c8NU+pN3f7yZwCJkNA1gVPg8OobYvss2EUbQhYvbwtNFTICgxODzCXtvfyZHmXuhsdrp
 F/sFBn5rw1xzz3w3jNE9B/7+8FRyu7R/+hytHwI0QylxGcoqQ2z8eK6+2kpYlsnLsGF0
 173A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726740269; x=1727345069;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7fgkteckHfqEieyx6yTUMKAb4iTKgJ61+BnzJtGAfN8=;
 b=hykWRjMN/rAvtCa189dz8hbXm5/MjDG+XOI5T0pKK+OjfjrMIP9SrK5pLNBf5Ypav3
 Xi7eMj5nBJgUlFiGkvjF91SdTVWer7wjFkhy3jJf6oyP93citIf7ydwAiRsEX8NpJre6
 Lo2JXRV8Gut3m5dchCQXyaj1dsf7aLAtHoge+UtJMFrh9f7LnCsGv//viN6cbjQneERz
 XaAyJA4k4DgYcGVKOri8pf1DnciIzVns6xz9XG1gCfbIJC0gDneEFO1C2ZJmagQH3T7C
 fF71f5OtCsKkPQXYMZ3Je5vANF9PKvURLnG55NstI2AOqa+rruCwMP0A/uBUjpjkAWpW
 9Kyw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUaQHFesUAO7aPSxXJXtX6oScyxEkB1SEKrTHhp0CeNfik3ziFvPP/GglXnSBk9RrhYzq2II6xYKQ==@nongnu.org
X-Gm-Message-State: AOJu0Ywji15+XwpovSg1Y64WYGyXaBJmRVAmyQN+Fxzy1PgvmO0rQDoP
 fErg2xIKQlDgJP2yckLL2F+EqDhbQr0vtqys4jqvJirtFde+dU1govQQeVvxJ9p5RtXthi9L1wa
 o7T8=
X-Received: by 2002:a05:6512:2216:b0:52c:e10b:cb33 with SMTP id
 2adb3069b0e04-5367ff32872mr15710557e87.50.1726740268883; 
 Thu, 19 Sep 2024 03:04:28 -0700 (PDT)
Received: from [10.133.7.245] ([83.68.141.146])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a90610f3aaesm701574766b.53.2024.09.19.03.04.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Sep 2024 03:04:28 -0700 (PDT)
Message-ID: <cfffe21e-258e-4592-802e-0797a045b97f@linaro.org>
Date: Wed, 18 Sep 2024 16:22:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] target/arm: Correct ID_AA64ISAR1_EL1 value for neoverse-v1
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
References: <20240917161337.3012188-1-peter.maydell@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20240917161337.3012188-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::12d;
 envelope-from=richard.henderson@linaro.org; helo=mail-lf1-x12d.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_12_24=1.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-TUID: jPs8cl2f0U4A

On 9/17/24 18:13, Peter Maydell wrote:
> The Neoverse-V1 TRM is a bit confused about the layout of the
> ID_AA64ISAR1_EL1 register, and so its table 3-6 has the wrong value
> for this ID register.  Trust instead section 3.2.74's list of which
> fields are set.
> 
> This means that we stop incorrectly reporting FEAT_XS as present, and
> now report the presence of FEAT_BF16.
> 
> Cc:qemu-stable@nongnu.org
> Reported-by: Marcin Juszkiewicz<marcin.juszkiewicz@linaro.org>
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/tcg/cpu64.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
