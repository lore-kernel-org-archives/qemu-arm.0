Received: by 2002:a17:906:b78f:b0:98d:b2f5:1316 with SMTP id dt15csp1355269ejb;
        Sun, 23 Jul 2023 08:25:43 -0700 (PDT)
X-Google-Smtp-Source: APBJJlH7asOBn524+3biF1rjJ9wspWGYWY6XSHCS1STquLY4x/oSlqG7TUd/w0fgDQ5jHQSkozRx
X-Received: by 2002:a05:622a:1003:b0:403:b2fc:1e69 with SMTP id d3-20020a05622a100300b00403b2fc1e69mr6483885qte.12.1690125942899;
        Sun, 23 Jul 2023 08:25:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1690125942; cv=none;
        d=google.com; s=arc-20160816;
        b=KcN9RqYMf2NTTQaIJpNzdwyd3GD8zhJJyRviyU3NOtdrDHTV5JvMh/lbnCksIYiuDb
         DTaWCgZ2PyRSRwYVLhjIiYUWRtccxMa9mrtxUi1Bn6lZlI88iTgiVn3E473gNPe9+xc1
         WXijRJy4/egSJv5K/mWaL3XSKGNeI5DlXjDBcxZcQjJBHAgiY0OshXeBfKC2mGOUAd9Z
         pdGPaFShkLDC2305/08dB2qcIn01ex6RWPbvQaOqJnQUKJiY/k1YAh2s2FtxMN10qcJ3
         x4ekHmoVYkYHwqroE6tzslajKNzibEPQKCygFRoWHdaS/SU96kVVA19oxsLV51/+uwyI
         7Ymg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=k+WZx93ROD0Vq+2YBnGkjgBZcWyjAkdqdaYO8lRSlLw=;
        fh=7ELSr/5sFo7qZWUWozFMp+B9CMHRnMDW7I5B4MPhJxE=;
        b=wpsgbq+Xc2K3KoJ/plz8kZjG2dMGfAKMKaL1yPhi0Qd24qcHjqyPN3Oo/FJOGOYS/+
         7vtPtnvEaooGtxTZ9yfvY+7toQSBv4rLcjvXRENxytKAdkLkr9D4p/cB2qLva9XeUM32
         ciOjx6SJU7rdHz8X1QM1pvR1BC+4X2yJJXDQHiT9oLmFcZL6sfujPb+YS2VVVl5P+e4u
         F//ATwPFOdTOF7/XekzRGedvSnNVmoQL7Le+iGhRPQTwVhxEYHsc/3LnnzgjH+DJWZH+
         5Of0rLEpI+taq/4v03BVja9IQVQ/fV8c9gHIF89QXcQxeoA1k9ZyhMwnxKQgtQHraLRz
         Ik9w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SKaa5nNa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d7-20020a05622a05c700b0040363b53bcdsi4051784qtb.802.2023.07.23.08.25.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 23 Jul 2023 08:25:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SKaa5nNa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qNaxE-0002NE-KX; Sun, 23 Jul 2023 11:25:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qNaxD-0002Mr-Ni
 for qemu-arm@nongnu.org; Sun, 23 Jul 2023 11:25:03 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qNaxB-0000wb-3W
 for qemu-arm@nongnu.org; Sun, 23 Jul 2023 11:25:03 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-3fbd33a57ddso27228045e9.1
 for <qemu-arm@nongnu.org>; Sun, 23 Jul 2023 08:25:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1690125899; x=1690730699;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=k+WZx93ROD0Vq+2YBnGkjgBZcWyjAkdqdaYO8lRSlLw=;
 b=SKaa5nNa3nLzJs+p9en1blLcldoh0tVJAbZAFJ4j7GyvND4c4JU6m9TzImf9RAqSq7
 kXpizbv0he/tKeWrXfPUZ7IV9HLsSeVfAwAWc0j71AImjT8ne0XL0uqSl07zN+Li2nui
 dXYEK3KuKhGmOa5VytSts9mbiiaX0U+OMd6oiC6pp2IhDX4lFUvi6uFqA+LaQlpzEZnx
 dyJsvxflfpX13Es8Rl8RLx3YM4zIj8mTgL/NsQH7DQavy5eIDEcQPdVh4P6BWXoNSuhh
 TDAqgpgbEMB/gwjp+TpN6cJGWjEVyJlgUzCEZstGtA3WC6xPaVoC3zkP8j9DMXN6jxxH
 f8ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690125899; x=1690730699;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=k+WZx93ROD0Vq+2YBnGkjgBZcWyjAkdqdaYO8lRSlLw=;
 b=OJUfSj7b2R4YEYxPXpp5P+9eg+qHOyuSgzuJyOMdfCpTXn8584R4ZfWz6Q4fSmNLin
 U74IAQjT9ptI+0+vQ1oPRzPQvO8fWtJz0DehJfjSdnj0tULVkZ5B9kIG4rOKcxxjrggG
 uwoqUnElkWGfiS+FvY2RZpyH0u7MalwrfmWAQnjdnsJkrSdbDceeE3f7Z1Hw5Z570r7x
 L4UPypiDw9zF18XoeqOAQLVfczRLgaN9YO/7IuatqqDCwUJovKDQB3MAIVttXaImiAi/
 ElRZrKkcvdJGdkqg4GvjPwItFC3RH3QRexJ6EA4+3XICGiM9xBozwzrS/IGN0weuMHRq
 AFhA==
X-Gm-Message-State: ABy/qLYwUR19iaa72gH+zpP7OsVbTTHf2LbrQGAMvFmwizMW0+73UXu1
 UrAJQBejcy93GcDszfoDqhDDLA==
X-Received: by 2002:a05:600c:114c:b0:3fa:97ad:2ba5 with SMTP id
 z12-20020a05600c114c00b003fa97ad2ba5mr5428462wmz.31.1690125898991; 
 Sun, 23 Jul 2023 08:24:58 -0700 (PDT)
Received: from [172.20.15.116]
 (179.181-106-213.static.virginmediabusiness.co.uk. [213.106.181.179])
 by smtp.gmail.com with ESMTPSA id
 z4-20020a1c4c04000000b003fba94c9e18sm7951265wmf.4.2023.07.23.08.24.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 23 Jul 2023 08:24:58 -0700 (PDT)
Message-ID: <230dd650-846f-7105-7add-43fa2d03dad7@linaro.org>
Date: Sun, 23 Jul 2023 16:24:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 06/14] target/arm/ptw: Pass an ARMSecuritySpace to
 arm_hcr_el2_eff_secstate()
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20230714154648.327466-1-peter.maydell@linaro.org>
 <20230714154648.327466-7-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230714154648.327466-7-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.093,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: 6mkHNPkQ94GU

On 7/14/23 16:46, Peter Maydell wrote:
> arm_hcr_el2_eff_secstate() takes a bool secure, which it uses to
> determine whether EL2 is enabled in the current security state.
> With the advent of FEAT_RME this is no longer sufficient, because
> EL2 can be enabled for Secure state but not for Root, and both
> of those will pass 'secure == true' in the callsites in ptw.c.
> 
> As it happens in all of our callsites in ptw.c we either avoid making
> the call or else avoid using the returned value if we're doing a
> translation for Root, so this is not a behaviour change even if the
> experimental FEAT_RME is enabled.  But it is less confusing in the
> ptw.c code if we avoid the use of a bool secure that duplicates some
> of the information in the ArmSecuritySpace argument.
> 
> Make arm_hcr_el2_eff_secstate() take an ARMSecuritySpace argument
> instead.
> 
> Note that since arm_hcr_el2_eff() uses the return value from
> arm_security_space_below_el3() for the 'space' argument, its
> behaviour does not change even when at EL3 (Root security state) and
> it continues to tell you what EL2 would be if you were in it.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/cpu.h    |  2 +-
>   target/arm/helper.c |  7 ++++---
>   target/arm/ptw.c    | 13 +++++--------
>   3 files changed, 10 insertions(+), 12 deletions(-)
> 
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index 4d6c0f95d59..3743a9e2f8a 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -2555,7 +2555,7 @@ static inline bool arm_is_el2_enabled(CPUARMState *env)
>    * "for all purposes other than a direct read or write access of HCR_EL2."
>    * Not included here is HCR_RW.
>    */
> -uint64_t arm_hcr_el2_eff_secstate(CPUARMState *env, bool secure);
> +uint64_t arm_hcr_el2_eff_secstate(CPUARMState *env, ARMSecuritySpace space);
>   uint64_t arm_hcr_el2_eff(CPUARMState *env);
>   uint64_t arm_hcrx_el2_eff(CPUARMState *env);
>   
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index d08c058e424..1e45fdb47c9 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -5731,11 +5731,12 @@ static void hcr_writelow(CPUARMState *env, const ARMCPRegInfo *ri,
>    * Bits that are not included here:
>    * RW       (read from SCR_EL3.RW as needed)
>    */
> -uint64_t arm_hcr_el2_eff_secstate(CPUARMState *env, bool secure)
> +uint64_t arm_hcr_el2_eff_secstate(CPUARMState *env, ARMSecuritySpace space)
>   {
>       uint64_t ret = env->cp15.hcr_el2;
>   
> -    if (!arm_is_el2_enabled_secstate(env, secure)) {
> +    if (space == ARMSS_Root ||
> +        !arm_is_el2_enabled_secstate(env, arm_space_is_secure(space))) {
>           /*

This is confusing, as without any larger context it certainly looks wrong.

> @@ -230,7 +230,7 @@ static bool regime_translation_disabled(CPUARMState *env, ARMMMUIdx mmu_idx,
>          }
>      }
>  
> -    hcr_el2 = arm_hcr_el2_eff_secstate(env, is_secure);
> +    hcr_el2 = arm_hcr_el2_eff_secstate(env, space);

Here, it's not clear, and could produce an "incorrect" result, though of course the value 
is not actually used unless mmu_idx requires it.

It might be better to sink the computation down into the two cases that require it.  With 
that, a local definition like

static inline uint64_t arm_hcr_el2_ptwspace(...)
{
     assert(space != ARMSS_Root);
     return arm_hcr_el2_eff_secstate(env, arm_space_is_secure(space));
}

could be the thing.


r~

