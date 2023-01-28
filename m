Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp1544360ejc;
        Fri, 27 Jan 2023 17:04:46 -0800 (PST)
X-Google-Smtp-Source: AK7set83SLNDShh9nlxwO+IgxlnqqhYRQ2pu9nrhk/c7xPJBtivkDSn1hJ/DeDYxqO61d4RV0nIA
X-Received: by 2002:ac8:5e4b:0:b0:3b6:92db:48d1 with SMTP id i11-20020ac85e4b000000b003b692db48d1mr1384176qtx.11.1674867886782;
        Fri, 27 Jan 2023 17:04:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674867886; cv=none;
        d=google.com; s=arc-20160816;
        b=svTobiXyUGcSyTofswIfnhBsgIfXCx7qNRKAQ3wl1n9JMLWFOZ0dFJaYoE/flHfvca
         vIE+oRa8VNpmSRvU395p2M4TeTBtFU5MwD6QJ9WIo7xynz1z436VCwVXsrAb0aRTFBSS
         zf5QCMWXjWmnqUW6vnRuqs3SCzCfbi69X2CvSBeWWmU75hL23s7HfREjuE1UybylR2F1
         Wp8IMCJnd00x2oFhB03xWt5TViJg+NL8nNqcqKm4Glqnh4T436AW5nTI+nK5w17b1e+R
         UyLxfaJtTAiXPjoq5lnIMpdW//zDquX89T1lkYnao268ER/TsqYrb69EPXShHm90cMxg
         u6Ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=il32LOCYe7+PPEzl31VO0RfH1p8EkDb88IWiFXUnxso=;
        b=Xb2vC3suwDUG5gNDMR7CTNUTXPUuHn1KAKVdjSl3TJEFQ8pjFv7gkh6o/fPIQ8p5wv
         ezNch9GYSfZu6fb6Iz8pFv2lDeQceQh0FpNpOjdCoRXZFXnxxGYLVoLEuTYBACmNfH9k
         /0iuHAXmn7RSppytm4N1thHZUuCm7pe93PWAlLhjIfsACJ9TffhVTylTuKxJVxID0aH/
         WE9u4a76U1ZUmPRVMdf0KrncQ0+8yIKQtLH07X/zFEiuGsdfw6R3Ivpmv6/B25lW+mTu
         8D6PkfxkreA0QUppch0sYwrXfg9edXaU9di4knk2adbVSJwKc9IY2zhuipuTAwTW4raF
         MIRQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DjPzx74T;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u15-20020a05622a010f00b003b838709b17si370156qtw.370.2023.01.27.17.04.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 27 Jan 2023 17:04:46 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DjPzx74T;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pLZe0-0002QB-LV; Fri, 27 Jan 2023 20:04:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pLZdy-0002OE-Ga
 for qemu-arm@nongnu.org; Fri, 27 Jan 2023 20:04:35 -0500
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pLZdw-0006CE-RI
 for qemu-arm@nongnu.org; Fri, 27 Jan 2023 20:04:34 -0500
Received: by mail-pj1-x102d.google.com with SMTP id
 nn18-20020a17090b38d200b0022bfb584987so6302378pjb.2
 for <qemu-arm@nongnu.org>; Fri, 27 Jan 2023 17:04:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=il32LOCYe7+PPEzl31VO0RfH1p8EkDb88IWiFXUnxso=;
 b=DjPzx74T3qkYgKl1dPpR0vFrIl+JehzjUeUdU9rMFzS/QkGQcDC/MT1+Ki48/YwVvO
 qzTINgmhjzK20GpVdFLv9+EO/GffSvLZsBQO8xouyhj6LfipoK4I4ATae9AYTe3Sz5F/
 3uSg8U2252OwnH8ZtgEuVYaurBOJo3X3GpRS8t4dxOHGlksrdoLkhn8y9BBbmtSpWblv
 HV4Z9njZOsCaSS+wb+gjR48t6G+Qgi3yvmpQGTVrO/fuTmj8esER95KjRUNru6NskbR5
 dJCxSVVdRnf11/oC2ysyGHXL36jPIGZU5Gh0WE05rJ+QhBF0D30hrPfhPIIfmMVGktoo
 ZHuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=il32LOCYe7+PPEzl31VO0RfH1p8EkDb88IWiFXUnxso=;
 b=gaEWDQPsrP1LhqbMoBYP5p39ZorV9on3Ti7ZRMCLYj7O9AiCiekqiAyqn+ekLLPcE7
 R1X9oxL9GXWepJaESmM9+0hZmhayR0FmzJRWTmZSxYZGbDbH0CSh7LAE8gSg/V/BBG8t
 oTkZK6ZqRQSqfp7LIsqwIbVEVAsr5F68a983Wxcz6j1S0Z7gI4Zw8vpMl8YZZpMqv8I/
 ChySi2tMjdzY0lrzWijlHfkRqHTk3H079tPAfxcU9KUJ+WHBktC8399UD1aR/Fy4cLXw
 5ehoylJ9dck2k1G4K78zB5yqNiJkwOpaao6gDojGc3IoyTwa2iPkaVu1wE/xOcm1eoVg
 P3cw==
X-Gm-Message-State: AO0yUKUxYiEDGI6BBjH4cGI/4nrHGUj3W/KHyWq2jyLRFZGlDWqEvNPE
 1gI2p/lB93T1qcu4o+DIYxRbOw==
X-Received: by 2002:a17:903:124e:b0:192:b2d3:4fc8 with SMTP id
 u14-20020a170903124e00b00192b2d34fc8mr361697plh.1.1674867871344; 
 Fri, 27 Jan 2023 17:04:31 -0800 (PST)
Received: from [192.168.50.174] (rrcs-173-197-98-118.west.biz.rr.com.
 [173.197.98.118]) by smtp.gmail.com with ESMTPSA id
 t12-20020a170902a5cc00b0019667318941sm59640plq.176.2023.01.27.17.04.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Jan 2023 17:04:30 -0800 (PST)
Message-ID: <08069c2c-5e15-37b6-4465-cf93e1ce1ddf@linaro.org>
Date: Fri, 27 Jan 2023 15:04:27 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 02/23] target/arm: Correct syndrome for ATS12NSO* at
 Secure EL1
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20230127175507.2895013-1-peter.maydell@linaro.org>
 <20230127175507.2895013-3-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230127175507.2895013-3-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
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
X-TUID: ug1+oNKSsvGh

On 1/27/23 07:54, Peter Maydell wrote:
> The AArch32 ATS12NSO* address translation operations are supposed to
> trap to either EL2 or EL3 if they're executed at Secure EL1 (which
> can only happen if EL3 is AArch64).  We implement this, but we got
> the syndrome value wrong: like other traps to EL2 or EL3 on an
> AArch32 cpreg access, they should report the 0x3 syndrome, not the
> 0x0 'uncategorized' syndrome.  This is clear in the access pseudocode
> for these instructions.
> 
> Fix the syndrome value for these operations by correcting the
> returned value from the ats_access() function.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   target/arm/helper.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

> 
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index ccb7d1e1712..6f6772d8e04 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -3284,9 +3284,9 @@ static CPAccessResult ats_access(CPUARMState *env, const ARMCPRegInfo *ri,
>           if (arm_current_el(env) == 1) {
>               if (arm_is_secure_below_el3(env)) {
>                   if (env->cp15.scr_el3 & SCR_EEL2) {
> -                    return CP_ACCESS_TRAP_UNCATEGORIZED_EL2;
> +                    return CP_ACCESS_TRAP_EL2;
>                   }
> -                return CP_ACCESS_TRAP_UNCATEGORIZED_EL3;
> +                return CP_ACCESS_TRAP_EL3;
>               }
>               return CP_ACCESS_TRAP_UNCATEGORIZED;
>           }

