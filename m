Received: by 2002:a17:906:9c0a:0:0:0:0 with SMTP id ff10csp84695ejc;
        Sat, 20 Aug 2022 11:54:45 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4DVuRJdgSztjNVGJJdq45UKi73V+hNgqO7HIEjIeIHpaQM9A9Avl9MQEyGZbAQj8n1IicI
X-Received: by 2002:a05:620a:142a:b0:6bb:effc:8738 with SMTP id k10-20020a05620a142a00b006bbeffc8738mr2785275qkj.606.1661021684831;
        Sat, 20 Aug 2022 11:54:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1661021684; cv=none;
        d=google.com; s=arc-20160816;
        b=KNzbFKa8jmaHHituimyRVHkSIpTPx12Q21GgzdJtlvpBIemy9SUG+enCJBSGqDSE2a
         3PFwksHEHwxE7n005w/tHP3XCzc/GiiK8SuIiKO+uh/QRHJq2tYHMyFGBvUZImHUYyXs
         /VTGiQygl3JUPcFNKiYMbUUUep2feDVIEqrKVhGdb08FeY+hhZzq8tbWBKU0UUtAzUPE
         dsncmH9NMUekmUDy3E7E92Zm+anMyfe8kK0AZBdixBMIsfauXOporRhxCMh82BvoXH9R
         US0+PP17sb6SBfNVe0P2MPunuMlM8HOEZI1Kv/ZIUgGp7+x0hkp7jlx+SIyZ7HiwDYyi
         yrUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=G6dAGS7Qc5evuaih74E2xjnS7x2zu7CMlqmYXADJbQ4=;
        b=Fg5+iZu8kn4dNHuuMUjrhkcaV9Kt6yvzDYxxI+ClG27+yR9gynsDVMtFqQJxPifvMd
         5oZRP+iXwwF2HUDTWiidF8FMNYCh7bgHrbt/XSvp2R6f3eBAkBFgrn5lHBIYVwOorNQd
         hmFe1c7KfrdIIMRhs0LQKIlwG2gb77EMZQPbqfGzfXUxvnzrZQxVIP9m4fseHKwrXNZ4
         P96F+P9+xE0IWVFdVvg4ICsiWPj96PCLTRCjvm6wpfOfkkrEvEqjREBHy0ZLnygdSyq8
         2x7hWfVP8Sx3fRkCGV6QwQT5s5jLSsaNFb8EiEYjZK6WdzTq0e8BIG+zcA3NqyE/SlM9
         QD3w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KxCCodz3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ay10-20020a05620a178a00b006bbbcd5bedesi3309742qkb.707.2022.08.20.11.54.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 20 Aug 2022 11:54:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KxCCodz3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42698 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oPTcK-0004aN-Cr
	for alex.bennee@linaro.org; Sat, 20 Aug 2022 14:54:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33388)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oPTc8-0004a7-9q
 for qemu-arm@nongnu.org; Sat, 20 Aug 2022 14:54:32 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:35357)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oPTc6-0005aE-J1
 for qemu-arm@nongnu.org; Sat, 20 Aug 2022 14:54:31 -0400
Received: by mail-pj1-x102a.google.com with SMTP id
 m10-20020a17090a730a00b001fa986fd8eeso10395779pjk.0
 for <qemu-arm@nongnu.org>; Sat, 20 Aug 2022 11:54:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=G6dAGS7Qc5evuaih74E2xjnS7x2zu7CMlqmYXADJbQ4=;
 b=KxCCodz3MfRSwmvpHgAvMkdU8OFW1Pr22pyk+RBlyVFtJQAtzqLWoWc791UepjBxeh
 ol5W/pTAkLvrs2oir9nkDZBuKH1jYdsoy6o2IpJxT3YwC2bTQrPDZQOe4OBKbFPtSzr+
 M5n/u77KpzaTeEWEG4xodz6P2NtKQWMfA5WwE/ZZrJCTqWKwBiSAGo4rE5rB+7JiK2S5
 G1vo82dvhtIB4lT0TzwcjCy1ur4n0oTXytqX8PmupcldBPJjNlgUOe7Lyl/OQ/hOcFPm
 fzGOyXuWg6za29YRty3cU9EcTIAv0gjgw+BZPPJ7WuhWC2+b1RV9vlGIWuEYE02os/ha
 cR1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=G6dAGS7Qc5evuaih74E2xjnS7x2zu7CMlqmYXADJbQ4=;
 b=bnron3Dfrfs7SUUxO/Yo9qm+5Qvq5GrxGXEtBWjrlA2sxYGq1N6A/IR3OhLxs6rRwG
 PtE8zc1rRVzV5HjxXLkqWLCTxFoURrZg6zZGJbxiqmwwVyp03d/vUv/8eKZ/xS0knXyC
 kR4oxYDdRzV9rEQwmUFUfKBlPJN7pZedDzI3qUTp4eGcOSy+ugWvswHQPVB+vMi1jnxc
 zZzROe2Mqctll89vPM/7p6IrvwNqEDwWtLpT0FfYq9ZGfEYTuMc6syBtH+D5RvQlkGrl
 3/UjyRXKXadQLM4twZ4CPyRW4XtzqoG6uEpGZ5HnR1+r8UcMnIGp/z61GdbkAx6OP+o8
 sFuw==
X-Gm-Message-State: ACgBeo1BhZFXkfAUOIeY36qoc7x9+Ft6XBl8+g+3iDtSsalnZnfJ4VrD
 5pOlySxhdn+kEvB10okmigUQJg==
X-Received: by 2002:a17:903:244c:b0:171:59be:6762 with SMTP id
 l12-20020a170903244c00b0017159be6762mr12829373pls.20.1661021668709; 
 Sat, 20 Aug 2022 11:54:28 -0700 (PDT)
Received: from ?IPV6:2602:47:d49d:ec01:142b:b2fd:5c12:7cf3?
 ([2602:47:d49d:ec01:142b:b2fd:5c12:7cf3])
 by smtp.gmail.com with ESMTPSA id
 x11-20020aa7956b000000b00535da15a252sm5273918pfq.165.2022.08.20.11.54.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 20 Aug 2022 11:54:27 -0700 (PDT)
Message-ID: <2d2e3bf8-76cc-2364-7f72-956dd0ebe510@linaro.org>
Date: Sat, 20 Aug 2022 11:54:25 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 09/10] target/arm: Support 64-bit event counters for
 FEAT_PMUv3p5
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220811171619.1154755-1-peter.maydell@linaro.org>
 <20220811171619.1154755-10-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220811171619.1154755-10-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: AuAvkAZnJ2i2

On 8/11/22 10:16, Peter Maydell wrote:
> +static bool pmevcntr_is_64_bit(CPUARMState *env, int counter)
> +{
> +    /* Return true if the specified event counter is configured to be 64 bit */
> +
> +    /* This isn't intended to be used with the cycle counter */
> +    assert(counter < 31);
> +
> +    if (!cpu_isar_feature(any_pmuv3p5, env_archcpu(env))) {
> +        return false;
> +    }
> +
> +    if (arm_feature(env, ARM_FEATURE_EL2)) {
> +        /*
> +         * MDCR_EL2.HLP still applies even when EL2 is disabled in the
> +         * current security state, so we don't use arm_mdcr_el2_eff() here.
> +         */
> +        bool hlp = env->cp15.mdcr_el2 & MDCR_HLP;
> +        int hpmn = env->cp15.mdcr_el2 & MDCR_HPMN;

The specs could be improved here, as the top of MDCR_EL2 says it doesn't apply if EL2 
isn't enabled in the security state, HLP has the exception noted above, but HPMN does not. 
  I conclude that HPMN is missing the exception, because nothing else makes sense.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
