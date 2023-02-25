Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp2672671ejc;
        Sat, 25 Feb 2023 02:12:34 -0800 (PST)
X-Google-Smtp-Source: AK7set841YDF202its3aprPSH6tKE40dX/PJLUO0tjQ49Id/si/pksglbYx5T7ZY064B2YgFG3st
X-Received: by 2002:a05:622a:3c9:b0:3b6:2e9b:cf2b with SMTP id k9-20020a05622a03c900b003b62e9bcf2bmr18465781qtx.14.1677319954209;
        Sat, 25 Feb 2023 02:12:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677319954; cv=none;
        d=google.com; s=arc-20160816;
        b=g/m8UwHjJIXoI/K5/qdtnuS44y2WTugksxFzqbIgEUSpwLZyJF+0HKG3HE/qbakoYF
         E+LC+fvH11lrggzfN+RSGNeHuKuQzsRQkdfaYGhCPz8LTo3sBNAx5KsLgGvhtdkSHIdf
         zt4h+3JC8M9uOTWOrhYRmyMgLzAXSmOsBQn6wHIyQbOPBgDt9emHgjmW/GPPjKVm531D
         WGj74U/Bb4n9lRBawxhtFOxfpe0bvRpJvu6Xs/ZakxF82vAP7mWzvB5vMXpx3bNsT1Ur
         NS/l2cdeJKlPQRZ8uqyJEQ/Y+UWmXqABRv/a4EV4V0EYUX4TepEHhOe4SumoSXUyaR1C
         TYUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:references:cc:to:from:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=3MCfv4LzIXiF0tFCznb7EnVVaPdFKemSsILAkfg0NBk=;
        b=x8fqAfDLyAung8Ve2EYo+5bxY5kI1siteIQobDkvWE0Oe39EdYzVWl4+a4CxlyLOn0
         BKtLgwr3uNuz6hXKMguNEoOZjYhIXdJ+t0pPluH8mWu+mIzn1n8a77k62w/0OSAz9OC6
         NYYrbs1DcS3WdWDNudnCT5VzT5//Z1aIpTFxBEuyBhGY2hOr6RYWZHs2SqMBAUwONbqT
         P8gSsgLXPt/a1NEuIUZgb+d9WzO8LI35jH4IlKllTerCcmX3fFTl2UGMR8God3Qhwhj+
         iaBG+zQdymRr2dH45eTsrfqjqq6jSjDa7X9kefRGUwVAqTsnyYm90OUcaxEKjjlqDlCo
         rx0w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dpLolZHq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f21-20020ac859d5000000b003bcdd210492si1836398qtf.202.2023.02.25.02.12.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 25 Feb 2023 02:12:34 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dpLolZHq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pVrX4-0001uB-4Z; Sat, 25 Feb 2023 05:11:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pVrX2-0001tF-Nr
 for qemu-arm@nongnu.org; Sat, 25 Feb 2023 05:11:56 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pVrWz-0002Cl-Ud
 for qemu-arm@nongnu.org; Sat, 25 Feb 2023 05:11:56 -0500
Received: by mail-wr1-x431.google.com with SMTP id bv17so1601266wrb.5
 for <qemu-arm@nongnu.org>; Sat, 25 Feb 2023 02:11:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=3MCfv4LzIXiF0tFCznb7EnVVaPdFKemSsILAkfg0NBk=;
 b=dpLolZHqImlfvW0+JrL5gppFBYBGlmTK8jP5zrj4ZMx2PW4Lw9X2/VZhb4kVKyNubl
 0T+E4NBBry+WBfmiPeFy7qOarLAnzInVle24+cOXJrrmohs78rjFNsD6ikFxy2gcsEQa
 8AREGDNQ7dtRA/lgWtq8TbUXcYS9nf8pM5PljQ/on2a/FsgRAoJp9fyr5MC0WNrUqaf1
 JsI/kzHiXiSEswHfD81gtJgThpzjplE70tMLGBspZo1kNO8O7JHPcpWUd7LYWmF+slwC
 s7P0CnioGSf2PSlYneIXeFY4p6P90umfpOAkSkWMmedpZsnmpc68fTJZZOsHO/nmEBBJ
 OLoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3MCfv4LzIXiF0tFCznb7EnVVaPdFKemSsILAkfg0NBk=;
 b=QePra8AN7heJC9+VHiWL0v4gHXcHxHenoBk6VDpzvsPkPqQg81qvrIKTLVzoUXy0CV
 Txea84qt9VnH6Vo0dYhBU7lOovzwzurM8uWMPmj1JLG63UCkL+kRGrEZ7ybBWElEhAwZ
 X1sZN9zEnUGZZeEq82k9Q3ZXeMQL+DWmcdrDXt+OC2/V8+th5wIqFlQ3NSRKMyLNlA9M
 +0idJkrLs99BVyRvncKjwnY7f3V8/5n3q3Bz8nMdFXl0whipsZq/7xCwzVXn8w7T2ou6
 ZA7ck4q0HYqP4PgMzqwfRgv4V16qc/R6XUnDTpELj0oOJWLe27ZrvP1AETVwInV9jkpq
 p7lA==
X-Gm-Message-State: AO0yUKX2apgXVRMvmIfL24/bkLGby+cQRR1h6wSUeYrWJ3RLBbfUugCH
 yyK7ApIg4YgR7T7zW+vYaov5jg==
X-Received: by 2002:a5d:58d9:0:b0:2c5:5fb0:b215 with SMTP id
 o25-20020a5d58d9000000b002c55fb0b215mr15585116wrf.30.1677319912459; 
 Sat, 25 Feb 2023 02:11:52 -0800 (PST)
Received: from [192.168.136.175] (120.red-95-127-35.staticip.rima-tde.net.
 [95.127.35.120]) by smtp.gmail.com with ESMTPSA id
 t14-20020adfe44e000000b002c5503a8d21sm1356744wrm.70.2023.02.25.02.11.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 25 Feb 2023 02:11:52 -0800 (PST)
Message-ID: <ba88e1b1-063c-1c1a-4361-3ae0d6a15f0e@linaro.org>
Date: Sat, 25 Feb 2023 11:11:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH 00/76] tcg: Drop tcg_temp_free from translators
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com, edgar.iglesias@gmail.com
References: <20230225091427.1817156-1-richard.henderson@linaro.org>
 <6b17a5c3-143a-42ca-ec87-dd8108aac9e9@linaro.org>
In-Reply-To: <6b17a5c3-143a-42ca-ec87-dd8108aac9e9@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x431.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.094,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: YZUPIen4smQw

On 25/2/23 11:10, Philippe Mathieu-Daudé wrote:
> On 25/2/23 10:13, Richard Henderson wrote:
>> Based-on: 20230225085945.1798188-1-richard.henderson@linaro.org
>> ("[PATCH v3 00/30] tcg: Simplify temporary usage")
>>
>> In the above patch set, we changed the lifetime of the temps
>> allocated by the guest translators, and eliminated their reuse,
>> so that we have the best chance of reducing their strength.
>>
>> That we don't reuse them means that we gain nothing by freeing them.
>> Therefore, drop all mention of tcg_temp_free from target/.
>>
>> This may be the most negative diffstat I've ever produced.  :-)
> 
>>   94 files changed, 471 insertions(+), 7143 deletions(-)
> 
> 7143 + 2 = 7145 by removing tcg_const_ptr():
> 
> -- >8 --
> diff --git a/include/tcg/tcg.h b/include/tcg/tcg.h
> index 43ce4bfa7d..64b88268cd 100644
> --- a/include/tcg/tcg.h
> +++ b/include/tcg/tcg.h
> @@ -1020,6 +1020,4 @@ TCGv_vec tcg_constant_vec_matching(TCGv_vec match, 
> unsigned vece, int64_t val);
>   #if UINTPTR_MAX == UINT32_MAX
> -# define tcg_const_ptr(x)        ((TCGv_ptr)tcg_const_i32((intptr_t)(x)))
>   # define tcg_constant_ptr(x) ((TCGv_ptr)tcg_constant_i32((intptr_t)(x)))
>   #else
> -# define tcg_const_ptr(x)        ((TCGv_ptr)tcg_const_i64((intptr_t)(x)))
>   # define tcg_constant_ptr(x) ((TCGv_ptr)tcg_constant_i64((intptr_t)(x)))
> diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
> index 5bf80b22d7..ce40fac557 100644
> --- a/target/arm/translate-sve.c
> +++ b/target/arm/translate-sve.c
> @@ -4210,3 +4210,3 @@ void gen_sve_ldr(DisasContext *s, TCGv_ptr base, 
> int vofs,
>           TCGLabel *loop = gen_new_label();
> -        TCGv_ptr tp, i = tcg_const_ptr(0);
> +        TCGv_ptr tp, i = tcg_constant_ptr(NULL);

Scratch that, I missed i is modified:

         tcg_gen_addi_ptr(i, i, 8);
