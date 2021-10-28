Received: by 2002:ac2:5bdb:0:0:0:0:0 with SMTP id u27csp935789lfn;
        Wed, 27 Oct 2021 18:18:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwavMKXtJnAylAHJscaRHP7n8+cXmcdLfVyki9xxUsDRJePn4d8Fgy4n56m0tu/OBUYvQ9/
X-Received: by 2002:a4a:c015:: with SMTP id v21mr851423oop.17.1635383918861;
        Wed, 27 Oct 2021 18:18:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1635383918; cv=none;
        d=google.com; s=arc-20160816;
        b=omz1vvRXxpUoEJpYqkJSzbt/MUrsErB5Qdpk5e2f1Ze/3X9rxgqxEIYTU1q9YpHx8L
         9qO7ZXr1DThxY3yltXQakZ2IXyqyTLIRVTTzPoGynzTV4OyeenETb1wlK0bD4A6UtcuN
         WE2IW039q7kZlpsUlmN0Fc+3Swmgqm7aCeHrJbAp8VNWBY8RsgJNwJvAmrThW8KFqaEN
         Ul1ZjjfRxzEn3s10//3uzy03QjU/wWxUiMvTIzXmF+3GuUjn/FLcrpdhNJ9drhnm8NZk
         DhE8+DsAXUJpaGasIgwK6hjoHQVoNoYQRpUg+wi2r9niEHai6ADusFw52mq29ccoHp6v
         vZHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=erN9jX02oR/oPE/aO3CyXsOg2hUB6blYy9Nukrz1qw0=;
        b=W2w8Inw6f/kKyCqKiXWPHVM3ZuoggxDDVg/n5v1L7DOVrIpxL2JjIAL67iapL3lEaN
         l5yekkRCx/miqxMRGPWP7a3cAOGLjwNFzDuMpnWwWbufvsrJg9hs9UsEli8ndRbFemjC
         N0XIXZEVtmOpitBB9LTuligOokLeXWkJK2j6zOkoQr2uxJ3ltjdmPDPKnZYRnEy41z6w
         nvwm4T6wuBtTAZJPTkAi+mzRnEiEF6w3cudZukf7q7CgJHzSMzAQQEVGNFs3tyewep58
         bG0KwNMK2IEWDyGqIWr7UHuYMqtw41jbza1zjGPerwnQtW0kZ8fzdDY1Uao6aZ8fu5L3
         ybNw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=IZdryRib;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s22si1898266oij.34.2021.10.27.18.18.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 27 Oct 2021 18:18:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=IZdryRib;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48444 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mfu3y-0001Q6-5v
	for alex.bennee@linaro.org; Wed, 27 Oct 2021 21:18:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45796)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mfu3A-0001Pf-Lp
 for qemu-arm@nongnu.org; Wed, 27 Oct 2021 21:17:48 -0400
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435]:39432)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mfu39-0006S0-2A
 for qemu-arm@nongnu.org; Wed, 27 Oct 2021 21:17:48 -0400
Received: by mail-pf1-x435.google.com with SMTP id b1so883483pfm.6
 for <qemu-arm@nongnu.org>; Wed, 27 Oct 2021 18:17:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=erN9jX02oR/oPE/aO3CyXsOg2hUB6blYy9Nukrz1qw0=;
 b=IZdryRibBktWR0UOio/j43OwHtXFrcydqD0v9rAefJFrMvpD6nEbmaCaKZfTotHgHA
 j0Ua5GuhnY74cDIihuAyVTFv0kkL48OAUwYI6emkZaVOBBJY9PvseCYaXVGB/v9EXqwn
 s7DaB75aUslqw6IasWXVcuG5l3mXg7yYtssl2Aw3VSjClKEOKDD1g46hzZdMoQzOUr8K
 Vwv8ZJcTjwlNul8lEWZcDvHaAtlNdLHAbQFZYaaAawuIPqvBkalvxguJ4nOH67tkyU2r
 M6IqbiremkUvzdNpkqubhE53t49G0jIyTOo95q4nQwa45TOBfnhw6sXDfzHmTTcmrSpJ
 Q3Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=erN9jX02oR/oPE/aO3CyXsOg2hUB6blYy9Nukrz1qw0=;
 b=15lPfDJQ8BLtITgDpVOIUvU1lWtVA8SJE/a7oOI7WCbvffahDSGH3a8Rbt8KL5JaBK
 Oa/ioAR0Ac+2SgzJZasy2fQcbj2nmSmoM8GJl1uDNFW7Ynu1F3geIeoh6oVDI3Ij+1wE
 9r2Jx/6/ERMqqjy3RK0rl64a48focNQPz+jVnsCJ2RN1fjtgWzBauo76SNp3+H+ICvWS
 hCUj3giqOIqKwZW+co9BLpqZHY50N7yTVS/0QZCusX5bKVHBqAzLGYCGqOGjGG6WgPCi
 r/mov9U96JXAj6rlipdXyNzuFHtmP8c6O+8fK1HV9hAcI/4YRCbiGYBejC60/JpkLrwd
 Z1kQ==
X-Gm-Message-State: AOAM530/05o+oWEmRutDJZizeuKcAirNOBBA5klfAPP7eE1yAuzX+C1P
 m6IUL08kzU2PMiAq3MEQiwoUQA==
X-Received: by 2002:a05:6a00:16c6:b029:32d:e190:9dd0 with SMTP id
 l6-20020a056a0016c6b029032de1909dd0mr1193133pfc.70.1635383865388; 
 Wed, 27 Oct 2021 18:17:45 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id h3sm1163157pfi.207.2021.10.27.18.17.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Oct 2021 18:17:44 -0700 (PDT)
Subject: Re: [PATCH v2 2/4] target/arm: Introduce store_cpu_field_constant()
 helper
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20211027045607.1261526-1-f4bug@amsat.org>
 <20211027045607.1261526-3-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <267b4bdc-8311-cc18-afeb-5e98aea5a3ea@linaro.org>
Date: Wed, 27 Oct 2021 18:17:43 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211027045607.1261526-3-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x435.google.com
X-Spam_score_int: -48
X-Spam_score: -4.9
X-Spam_bar: ----
X-Spam_report: (-4.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.847,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: rh/jOtjAAibf

On 10/26/21 9:56 PM, Philippe Mathieu-Daudé wrote:
> -static inline void store_cpu_offset(TCGv_i32 var, int offset)
> +static inline void store_cpu_offset(TCGv_i32 var, int offset, bool is_temp)
>   {
>       tcg_gen_st_i32(var, cpu_env, offset);
> -    tcg_temp_free_i32(var);
> +    if (is_temp) {
> +        tcg_temp_free_i32(var);
> +    }
>   }

You don't need to change the function interface; tcg_constant_* is ignored by free.

> +#define store_cpu_field_constant(val, name) \
> +    store_cpu_offset(tcg_constant_i32(val), offsetof(CPUARMState, name), false)

But this could become simply

     tcg_gen_st_i32(tcg_constant_i32(val), cpu_env,
                    offsetof(CPUARMState, name))

without the wrapper inline.


r~
