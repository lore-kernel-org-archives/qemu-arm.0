Received: by 2002:a17:906:3b11:0:0:0:0 with SMTP id g17csp667881ejf;
        Thu, 11 Aug 2022 10:53:32 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4mpYObhhwxQWKiZvptw/8fTjM2ZCq9N/nsojbaQiFR6P4CT8y6Xc03MaGpyugY0YM+mgNS
X-Received: by 2002:a05:622a:446:b0:342:fade:c82d with SMTP id o6-20020a05622a044600b00342fadec82dmr245760qtx.440.1660240412438;
        Thu, 11 Aug 2022 10:53:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1660240412; cv=none;
        d=google.com; s=arc-20160816;
        b=X6yx/xov5+1moyViiix0BAEhCuqKt5p9IBGAmoIohXTh562rjAVupUrD8NVIUFu7L0
         8XzG55XzJooJ/Cfp4Km0Cu2yXJv5A0KYF0tnbmRHKIiNKD1oKpXWa8zmMXGL85cNdw+d
         ir3Zupn9mFEg+ZmsJEaNF8xTa+IO7uA95oVseFp15edYDSblcE0cGmVry21I/9FdEur/
         z6aEbAAzjB3MnjRx4g3GCkhEeIUyHg+aSZOEe7VJ1kdLiyLLkTjNw+3xOwo57P0HZhWJ
         mngWZ1FKO2eO4Wc2pcTGhmbXjLIW10G0TT9PTTkTipaORQ106fzCAfGdKAFfFribtFWM
         /Myg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=jx9oCDTsc/iexZ3ExeGfIzkt4Hx5PiKEHtW8x14+PYU=;
        b=lD/D0HIc2BppTTNJclRPH3JaLFFK5avv63FrreqS9b/iJRtuUk9GTQ1vPQHNK8Vc11
         Ssc7j+HBmJQ8pv1fw4Sx/nMQ+GbsPaE4z2xngtogKDDm2QkDn94/OxLvHpfxDPi2tci4
         voXsO/glO9PO2ZHqkJRIE3diAw31OpiPi7We0w/Muejmua2t3+SXt+d6hbrvf/BpXwvE
         BVz/4dgSDGu+IhgOwgV/TPBBPY8UXsPIBDJkTjcA4NYbQyNOs1y0gBozxRPEi1DV6nBM
         FgIwY79/W4lLb0vxTzO3aE0AksVAEVmvV+yQl92cLDB8l9xIJU8F/kQoUAUkQMiT21jv
         2jDg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lBE8yMNR;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y10-20020a05622a164a00b0031ee340d1fesi77349qtj.233.2022.08.11.10.53.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 11 Aug 2022 10:53:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lBE8yMNR;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44584 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oMCN9-00017q-U0
	for alex.bennee@linaro.org; Thu, 11 Aug 2022 13:53:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48764)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oMCId-0005cO-8G
 for qemu-devel@nongnu.org; Thu, 11 Aug 2022 13:48:52 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:45636)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oMCIb-0005jt-JC
 for qemu-devel@nongnu.org; Thu, 11 Aug 2022 13:48:50 -0400
Received: by mail-pj1-x102b.google.com with SMTP id
 p14-20020a17090a74ce00b001f4d04492faso5778717pjl.4
 for <qemu-devel@nongnu.org>; Thu, 11 Aug 2022 10:48:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=jx9oCDTsc/iexZ3ExeGfIzkt4Hx5PiKEHtW8x14+PYU=;
 b=lBE8yMNRB3XppVKs1oOEWC453panyeuMrJ7EqOjzbycP4E5afUC4n7P/y9+IZVITJs
 AiAm+dW/He9w+lNpTMjxBVU7N+zLirwJnN/cFaiiTYqmnBp2P1kId1OP3XeWb8icj8DJ
 hU0TH95aEMuH3HViZYhw/WUg/oxPRJQA+r0sxI4QtJWjkEY5eKb2jDzC35QCBhyjsIGI
 1Mi84gqxw5U1sa+Anx55HyKttVNYHcm36v4P39dZs/Ne8Yo+3FP8cFB9ovb0i+pl5+10
 8+J96lnNN0JVL7ZVdyGc0tS6+AIOodZfKIirpZ+SNwcGscIoHbFj85j6HytI6Fa8dAIx
 1R3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=jx9oCDTsc/iexZ3ExeGfIzkt4Hx5PiKEHtW8x14+PYU=;
 b=qrUfeRWn55aRJhhCHFNXMXfgrFD+uGU3Es9+YHp3YIwraQE3Zo/51noMWDmLZCnxF7
 eLi7xMNhwZH8T4ZHg8uWzJMcC7v1y3UOxAwmot8BHJG9geQMlN1xBYXiTGtKUA26Bzvr
 55YKyC0gQw+rzMPZIqgZqACGQPWYgndJ6tLGGqJbaVNsgd9TaiMU2BmaFpkjJ4ZYjz6B
 jWrGHCYlgGEX7Z21NDKltR4iuKzJAI7BWz23o8bTIIRYTENzaSJ31muSUm92k36ZzX1L
 FvnCd23mRJbZBsBEA8WF4lg6TL5aCaxO9jIFXuGdO8dnEgg67lVvp5oDlxVyXkDurxyy
 Pitg==
X-Gm-Message-State: ACgBeo3kVhnllxt8foBbH93oM1VIc61plIrB6mttbVcnU/DMUPlayMoY
 0nPaamhaqTKGKFXArL8PFO1gMA==
X-Received: by 2002:a17:90b:4c4b:b0:1f7:11f:8e8e with SMTP id
 np11-20020a17090b4c4b00b001f7011f8e8emr9731794pjb.98.1660240127016; 
 Thu, 11 Aug 2022 10:48:47 -0700 (PDT)
Received: from ?IPV6:2602:ae:154e:e201:72e2:2d06:c2b1:b106?
 ([2602:ae:154e:e201:72e2:2d06:c2b1:b106])
 by smtp.gmail.com with ESMTPSA id
 x133-20020a62868b000000b0052ad49292f0sm4371176pfd.48.2022.08.11.10.48.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Aug 2022 10:48:46 -0700 (PDT)
Message-ID: <34861211-e1f0-31d0-9619-9b99953ff031@linaro.org>
Date: Thu, 11 Aug 2022 10:48:45 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 05/10] target/arm: Honour MDCR_EL2.HPMD in Secure EL2
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220811171619.1154755-1-peter.maydell@linaro.org>
 <20220811171619.1154755-6-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220811171619.1154755-6-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: EkQjE+ULa+qn

On 8/11/22 10:16, Peter Maydell wrote:
> The logic in pmu_counter_enabled() for handling the 'prohibit event
> counting' bits MDCR_EL2.HPMD and MDCR_EL3.SPME is written in a way
> that assumes that EL2 is never Secure.  This used to be true, but the
> architecture now permits Secure EL2, and QEMU can emulate this.
> 
> Refactor the prohibit logic so that we effectively OR together
> the various prohibit bits when they apply, rather than trying to
> construct an if-else ladder where any particular state of the CPU
> ends up in exactly one branch of the ladder.
> 
> This fixes the Secure EL2 case and also is a better structure for
> adding the PMUv8.5 bits MDCR_EL2.HCCD and MDCR_EL3.SCCD.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   target/arm/helper.c | 17 +++++++----------
>   1 file changed, 7 insertions(+), 10 deletions(-)
> 
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index 41def52cf7b..434885d024a 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -1094,7 +1094,7 @@ static bool pmu_counter_enabled(CPUARMState *env, uint8_t counter)
>   {
>       uint64_t filter;
>       bool e, p, u, nsk, nsu, nsh, m;
> -    bool enabled, prohibited, filtered;
> +    bool enabled, prohibited = false, filtered;
>       bool secure = arm_is_secure(env);
>       int el = arm_current_el(env);
>       uint64_t mdcr_el2 = arm_mdcr_el2_eff(env);
> @@ -1112,15 +1112,12 @@ static bool pmu_counter_enabled(CPUARMState *env, uint8_t counter)
>       }
>       enabled = e && (env->cp15.c9_pmcnten & (1 << counter));
>   
> -    if (!secure) {
> -        if (el == 2 && (counter < hpmn || counter == 31)) {
> -            prohibited = mdcr_el2 & MDCR_HPMD;
> -        } else {
> -            prohibited = false;
> -        }
> -    } else {
> -        prohibited = arm_feature(env, ARM_FEATURE_EL3) &&
> -           !(env->cp15.mdcr_el3 & MDCR_SPME);
> +    /* Is event counting prohibited? */
> +    if (el == 2 && (counter < hpmn || counter == 31)) {
> +        prohibited = mdcr_el2 & MDCR_HPMD;
> +    }
> +    if (secure) {
> +        prohibited = prohibited || !(env->cp15.mdcr_el3 & MDCR_SPME);

You can use |= for bool as well.  You don't need the short-circuting of || here.
For consistency, perhaps better to use |= with the first if as well, relying on the 
compiler to fold the initial value false.

But otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
