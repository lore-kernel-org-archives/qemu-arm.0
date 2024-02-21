Received: by 2002:a17:906:c8d8:b0:a3e:79c1:d636 with SMTP id gc24csp2115129ejb;
        Wed, 21 Feb 2024 11:10:01 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVl+juMCDQGGaJYICzPDitkI/s4Z+Om3Gi6yuqshLaBaP8rmHnY4FsfidAeDxq/DUnd4PR7xcjfdBUyMPESq5/0NoZVIImo
X-Google-Smtp-Source: AGHT+IFptZeNib7ly9qk8geOB356VHdSevaehEjydSDFtlgy9fh+4XPYmlVqEvviyaXSrE1VNLs1
X-Received: by 2002:a05:622a:1350:b0:42e:2c63:249 with SMTP id w16-20020a05622a135000b0042e2c630249mr5613129qtk.0.1708542600840;
        Wed, 21 Feb 2024 11:10:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708542600; cv=none;
        d=google.com; s=arc-20160816;
        b=vnYZ+WrF6pWXAC5nylPgh041Jg4yb2MYAP2wTNaH17mSfAaADKLMfeX7C+HG9PyKW6
         A4sieI9yvX1FX0zsq567lXLc7X3+5BfaiPiK2AKvoPe/oY9vkAPC7xRzhR1Ys9+861lQ
         WrkMojxt2UonQ3Jeufxen7O4aghfoPqFNZAv5uNChvUgJdAgfjR+rhtdEgoYxyRDEwLT
         pONHz2yjfmInsWg+pU9Zmr+ytUgS+Snf3OlmvXwbb9kOTTt4OEx51zusB0ajMhXLHDKv
         erguvw7QYmyDxC3dSs03iTkRAYE6JOLF1bZeA3CZxGlQK70SdWTHWWnvaaroGoGnpdj9
         URbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=djwKvPbpFsXhgBG1hqt3/swL3Y/0xWo+lVf0faNr4uo=;
        fh=rI9PLlfA/A1ezDqf1rWmxTEgKy1voemYinWagosvhJ4=;
        b=FqO/8mF1ee5iSadnB2+ARjeXVPmhRqXmD9Bfp/BpiSDQ/LL+bnx1dW9MWieL28X+o8
         I9Kf9R3uj+Q/2VwxpwlGxyWdNyFGVLaMdRgXmcYgTOg8qBEI11/lRA+NTKonNl8WG5U+
         PvtTIeQZQSbrjEu+yFVELleuWRNuCNsj4BvJX65uMSKrB6hhY7ZmUEMUhlKmz/nlaQUC
         p2IsrygyftNIBQHNH2wqgZsj5feFrPAfMINl8mKoqomJnI0FS61vLMzqLX2nZAWddzJz
         /ZItFb8tLgA3wU8bL0hYpGV5Frg5csCJ9BQyt14sLv7n57lMcmi4rmKJRqb6EHSJqWhK
         l4Ig==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hJOZ7Cp+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 9-20020ac85709000000b0042e39a4582csi1684156qtw.501.2024.02.21.11.10.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 21 Feb 2024 11:10:00 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hJOZ7Cp+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rcrxu-0002Re-En; Wed, 21 Feb 2024 14:09:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rcrxt-0002Nx-BX
 for qemu-arm@nongnu.org; Wed, 21 Feb 2024 14:09:09 -0500
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rcrxr-0003KV-5B
 for qemu-arm@nongnu.org; Wed, 21 Feb 2024 14:09:09 -0500
Received: by mail-pf1-x42d.google.com with SMTP id
 d2e1a72fcca58-6da4a923b1bso5942074b3a.2
 for <qemu-arm@nongnu.org>; Wed, 21 Feb 2024 11:09:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708542545; x=1709147345; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=djwKvPbpFsXhgBG1hqt3/swL3Y/0xWo+lVf0faNr4uo=;
 b=hJOZ7Cp+XFN8oyavGIwMqYniufdOb2XEwltVGWAnCWBzUn4sCv08DbX25Zm56G3p1R
 1zoafx6KtGqpnH0HlVFWuvV6/N5RBg3aUfYp/q2R7J6l7dzXjmHtDG/YWAmwtB9LANF3
 tqJ2sicWPIRNwUlPNHnproeYytZESUNOHIKwH/t2MFQHxeHS83YEMu4IodPjJ3cmvtGU
 GxzlOhBhs4qUfLgzT7d3NEp5rttxYzF4Zo7eMBfAZDGPRrs2OciniZVOB2VbE3agvTY2
 C5iN1Go7OBoIcEvd0T2Z1cyzm8SD1hiWTIx+kIziRZK1foIrtdf3VB5N5PwuddErbC/k
 GrSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708542545; x=1709147345;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=djwKvPbpFsXhgBG1hqt3/swL3Y/0xWo+lVf0faNr4uo=;
 b=xTUlC9TfebYr/iP87/kNpYC53QhpxOmB6Jzh3Qhd415YmvWiJk6WaNr/k2lP+cf35d
 d0xkzdSQhbg9fo+2vkLIltCHujR+jcVG4USmR3sORc8EGvsOYRq5dT9Wk49HTzuSW2VL
 aVK8Ti5HSCzDWhFb1yEFhiBY2+AyzTnWmwCq02oygzkBuFbCiywqDlMqvA13N41wEoSJ
 eeIp7xsCKOgYJevl268qYcTf50nnuG564a7bVBHO/tcBxm0zSR1GsY6uKLCtQZL9uxMs
 YLIVwMd1gYQwGdWgfmyaMBgpGn+Rn2YKiVF4I08Iecom8/W+2M8GWzORFaSv4ACE6T7p
 WDfA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWh8NljONuSBX7GMx+ez2risWQbkTnAta2D1SjNbe2YfRbyxcw8s2L+DmNvv6EWIby5+QSId68bogwlOlzyyHCQ98Ri
X-Gm-Message-State: AOJu0YzxYEpk0E/A6wFhmHr/J7QNzf9BfW3k3030yyYRVI4mw3ee+bml
 app8e3ALBC5nxIbC1tKIlha4HW1CW2q3Zd9YalsvqEiaKzodv9pBFxeBynbcBys=
X-Received: by 2002:aa7:8583:0:b0:6e4:6a74:ee5b with SMTP id
 w3-20020aa78583000000b006e46a74ee5bmr7948878pfn.14.1708542544926; 
 Wed, 21 Feb 2024 11:09:04 -0800 (PST)
Received: from [172.20.1.19] (173-197-098-125.biz.spectrum.com.
 [173.197.98.125]) by smtp.gmail.com with ESMTPSA id
 f12-20020a056a0022cc00b006e478f9504csm4157801pfj.104.2024.02.21.11.09.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Feb 2024 11:09:04 -0800 (PST)
Message-ID: <9fb9c74e-e4d3-4a8b-b736-c8603414245c@linaro.org>
Date: Wed, 21 Feb 2024 09:09:01 -1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 04/22] target/arm: Implement ALLINT MSR (immediate)
Content-Language: en-US
To: Jinjie Ruan <ruanjinjie@huawei.com>, peter.maydell@linaro.org,
 eduardo@habkost.net, marcel.apfelbaum@gmail.com, philmd@linaro.org,
 wangyanan55@huawei.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20240221130823.677762-1-ruanjinjie@huawei.com>
 <20240221130823.677762-5-ruanjinjie@huawei.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20240221130823.677762-5-ruanjinjie@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-TUID: hDEG0rlDxlZ3

On 2/21/24 03:08, Jinjie Ruan via wrote:
> Add ALLINT MSR (immediate) to decodetree. And the EL0 check is necessary
> to ALLINT. Avoid the unconditional write to pc and use raise_exception_ra
> to unwind.
> 
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> ---
>   target/arm/tcg/a64.decode      |  1 +
>   target/arm/tcg/helper-a64.c    | 24 ++++++++++++++++++++++++
>   target/arm/tcg/helper-a64.h    |  1 +
>   target/arm/tcg/translate-a64.c | 10 ++++++++++
>   4 files changed, 36 insertions(+)
> 
> diff --git a/target/arm/tcg/a64.decode b/target/arm/tcg/a64.decode
> index 8a20dce3c8..3588080024 100644
> --- a/target/arm/tcg/a64.decode
> +++ b/target/arm/tcg/a64.decode
> @@ -207,6 +207,7 @@ MSR_i_DIT       1101 0101 0000 0 011 0100 .... 010 11111 @msr_i
>   MSR_i_TCO       1101 0101 0000 0 011 0100 .... 100 11111 @msr_i
>   MSR_i_DAIFSET   1101 0101 0000 0 011 0100 .... 110 11111 @msr_i
>   MSR_i_DAIFCLEAR 1101 0101 0000 0 011 0100 .... 111 11111 @msr_i
> +MSR_i_ALLINT    1101 0101 0000 0 001 0100 .... 000 11111 @msr_i
>   MSR_i_SVCR      1101 0101 0000 0 011 0100 0 mask:2 imm:1 011 11111
>   
>   # MRS, MSR (register), SYS, SYSL. These are all essentially the
> diff --git a/target/arm/tcg/helper-a64.c b/target/arm/tcg/helper-a64.c
> index ebaa7f00df..3686926ada 100644
> --- a/target/arm/tcg/helper-a64.c
> +++ b/target/arm/tcg/helper-a64.c
> @@ -66,6 +66,30 @@ void HELPER(msr_i_spsel)(CPUARMState *env, uint32_t imm)
>       update_spsel(env, imm);
>   }
>   
> +static void allint_check(CPUARMState *env, uint32_t op,
> +                       uint32_t imm, uintptr_t ra)
> +{
> +    /* ALLINT update to PSTATE. */
> +    if (arm_current_el(env) == 0) {
> +        raise_exception_ra(env, EXCP_UDEF,
> +                           syn_aa64_sysregtrap(0, extract32(op, 0, 3),
> +                                               extract32(op, 3, 3), 4,
> +                                               imm, 0x1f, 0),
> +                           exception_target_el(env), ra);
> +    }
> +}

A runtime check for EL0 is not necessary; you've already handled that in 
trans_MSR_i_ALLINT().  However, what *is* missing here is the test against TALLINT for EL1.

> +
> +void HELPER(msr_i_allint)(CPUARMState *env, uint32_t imm)
> +{
> +    allint_check(env, 0x8, imm, GETPC());
> +    if (imm == 1) {
> +        env->allint |= PSTATE_ALLINT;
> +    } else {
> +        env->allint &= ~PSTATE_ALLINT;
> +    }

I think you should not write an immediate-specific helper, but one which can also handle 
the variable "MSR allint, <xt>".  This is no more difficult than

void HELPER(msr_allint)(CPUARMState *env, target_ulong val)
{
     ... check ...
     env->pstate = (env->pstate & ~PSTATE_ALLINT) | (val & PSTATE_ALLINT);
}

> +    arm_rebuild_hflags(env);
> +}

allint does not affect hflags; no rebuild required.

> +static bool trans_MSR_i_ALLINT(DisasContext *s, arg_i *a)
> +{
> +    if (!dc_isar_feature(aa64_nmi, s) || s->current_el == 0) {
> +        return false;
> +    }
> +    gen_helper_msr_i_allint(tcg_env, tcg_constant_i32(a->imm));

You're passing all of #imm4, not #imm1, which meant the test in your msr_i_allint helper 
was wrong.

To work with the generalized helper above, this would be

     tcg_constant_tl((a->imm & 1) * PSTATE_ALLINT);


r~
