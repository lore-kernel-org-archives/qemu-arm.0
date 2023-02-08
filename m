Received: by 2002:a17:906:dac7:b0:886:babc:7eeb with SMTP id xi7csp46278ejb;
        Wed, 8 Feb 2023 14:00:46 -0800 (PST)
X-Google-Smtp-Source: AK7set/DFzt8yJYcg02aThh0zN+ErF8hf8ksRrm02fWEy2l31eH4B1kXYWlciLHbOzYGek+x8iep
X-Received: by 2002:a05:6102:33cb:b0:3fb:6276:101f with SMTP id w11-20020a05610233cb00b003fb6276101fmr5546105vsh.28.1675893646664;
        Wed, 08 Feb 2023 14:00:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1675893646; cv=none;
        d=google.com; s=arc-20160816;
        b=Ch73lP2muSuDc53pVKoi6PioAkgeyfO4jZL+3Cxo1jGP+IcNK1Ntl1doXTZAwF6DkC
         wmJzU4iMDwpYVDGBesoXhHgebo+L+HzGln1Gz744HT1Cl0qwwhAuD3xaw+sgbIngrLcD
         yIrsyJuge6Tml0MczNT+OKFq6h3fLZz09PZpRi+YMKa5x48l3TMFZ/FF3C4ZBwmZ17yQ
         dGAagsykpeEDzQCyq8FX91TP/LcxeIJf0wH1g7Q4Sj4YO3cMIi2SwCJDZjvb/6gJjeM4
         bQm7d37qwGjzscdag7d+dagHZkjL2TA7LG8VW58PvSRwzC5qdynEz2dDbppKT4NJ0Tew
         V/JA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=6yPMSTnJNL20QqXsozQBkHnu0ASyiJ4F0NUVVKcdJys=;
        b=BfNkkqEYjYuKeKymuS1tgm1Jo9c18KrPRdnKpJyjxK4VwLtQRrBS9uPqxqUZ//5c68
         2cvwe2C8hMCgZCyJNKNyPEouz5rlmCiDSr8VoxVzwIcvtkY8B2F6xjqXscAWvrAam1d2
         1ICKUTwpRmwgTxxuPstaE8n3XzEUsMRUAye7CSj1pKWYoFFS1luwz4rrcJl7wzV38bue
         Xz8uVYfsbcyTqCKfBMbIOmfkHn+okxxf8IgEvO0441hJH/lABJy/AekEJya/KHgUgfrR
         G2wrVHnb6xunEiWRR3+s91LvEap3e0D4QC0fGuTZssKs33D9qj2ZyHsm0RCScZmoTCg5
         6vLw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lZCyYGJE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s18-20020a05610201d200b00411a3b3d11esi2120756vsq.567.2023.02.08.14.00.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 08 Feb 2023 14:00:46 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lZCyYGJE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pPsUB-0000ZN-VA; Wed, 08 Feb 2023 17:00:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pPsUA-0000Yo-Ay
 for qemu-arm@nongnu.org; Wed, 08 Feb 2023 17:00:14 -0500
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pPsU8-0006zd-Fn
 for qemu-arm@nongnu.org; Wed, 08 Feb 2023 17:00:14 -0500
Received: by mail-pg1-x531.google.com with SMTP id s8so271034pgg.11
 for <qemu-arm@nongnu.org>; Wed, 08 Feb 2023 14:00:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=6yPMSTnJNL20QqXsozQBkHnu0ASyiJ4F0NUVVKcdJys=;
 b=lZCyYGJEXD95CpIbuW2W1RKEUEQCQtNzgzkr9ioNlC0r4mmawVIfxToSzTyFu8mviz
 D2NadTBQw87YdCbWhXCTMNLJ1CqbagUu2NumhT5iKcQdPdUsXAWYrdkAQSQXjQCBUoNW
 6aEmxwRkXClcx5Xv7b2MjX0sGHUzrpczjpwc3tb6VshWwmkmU2wnF+Wta6ez6j335tMa
 uvZT99hOZ+OEsGVgv1zbjFkguquIIlxas2/3rcqACD+9fS1cyfqR38ASJll4jkzL1CvU
 OEvNu3H1G5rWwTycQDfM5RJjjMP9Gy3kwbAsCfoRp98OSrg1MMUyC2SUvKWUfe+XDsry
 Jxtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6yPMSTnJNL20QqXsozQBkHnu0ASyiJ4F0NUVVKcdJys=;
 b=NO9UMDT49RcaPb2ElfkjpWH9XrzfYVfBSE36Xn+x+v8sXRrSv6RBGj3p1JsdOWhUrx
 SZPlO/Xs+PR6jUB0oKp9jU6iBmmCVmJDNSSN6UbZntz0PJEYnBscbJeI2MYzUndB+IyF
 mT8n6oMcqdeaLMiudknT1wYDh6EZaR9DDspaVHBKawi8tAjqcumN7H9J3vTmsq6Mph6X
 mCsoY4Ul6ytJTvJhMMXPCtADw2sbtCQOgQCPPxvZjTsQRzST9/q+J4C6PWzeIUMYPKTn
 oCrrhq2OERP25odqwGf491Az44FXwFTCBiU4Ss6EI/8Kp9YIYftB/mJ9YLYZPyj6FJi+
 dQtg==
X-Gm-Message-State: AO0yUKXL0N/9QzvIf+WzNBXcWPTmTTVaK6ydpiAcvuriEnNeT3XEHkvu
 hgBXrz4r979Au9KwdVkaEnQ58w==
X-Received: by 2002:a62:4e48:0:b0:5a7:a688:cd8a with SMTP id
 c69-20020a624e48000000b005a7a688cd8amr6401401pfb.33.1675893610009; 
 Wed, 08 Feb 2023 14:00:10 -0800 (PST)
Received: from [192.168.101.227] (rrcs-74-87-59-234.west.biz.rr.com.
 [74.87.59.234]) by smtp.gmail.com with ESMTPSA id
 p128-20020a625b86000000b005939fe1719fsm11757264pfb.39.2023.02.08.14.00.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Feb 2023 14:00:09 -0800 (PST)
Message-ID: <9e7fd3c5-e28a-6aa1-0def-146383a1b86e@linaro.org>
Date: Wed, 8 Feb 2023 12:00:05 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 07/22] target/arm: Introduce ARMSecuritySpace
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, yier.jin@huawei.com,
 jonathan.cameron@huawei.com, leonardo.garcia@linaro.org
References: <20230124000027.3565716-1-richard.henderson@linaro.org>
 <20230124000027.3565716-8-richard.henderson@linaro.org>
 <CAFEAcA8aRKL2Fh-CG3qYF+wH3rH1m79a-E9crUNSCWNQRF+KUg@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA8aRKL2Fh-CG3qYF+wH3rH1m79a-E9crUNSCWNQRF+KUg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x531.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.146,
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
X-TUID: KztbQzKGWYi/

On 2/7/23 05:00, Peter Maydell wrote:
>>   static inline bool arm_is_secure(CPUARMState *env)
>>   {
>> -    if (arm_is_el3_or_mon(env)) {
>> -        return true;
>> -    }
>> -    return arm_is_secure_below_el3(env);
>> +    ARMSecuritySpace ss = arm_security_space(env);
>> +    return ss == ARMSS_Secure || ss == ARMSS_Root;
> 
> maybe
>    return arm_space_is_secure(arm_security_space(env));

Quite right; arm_space_is_secure was something I added later, and failed to propagate 
completely.

>> +#ifndef CONFIG_USER_ONLY
>> +ARMSecuritySpace arm_security_space(CPUARMState *env)
>> +{
>> +    if (!arm_feature(env, ARM_FEATURE_EL3)) {
> 
> The old code had a comment
> -        /* If EL3 is not supported then the secure state is implementation
> -         * defined, in which case QEMU defaults to non-secure.
> which should probably go here I guess.

Ok.


r~
