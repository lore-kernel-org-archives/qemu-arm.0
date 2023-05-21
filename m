Received: by 2002:a17:906:d7a2:b0:96f:a786:ac5c with SMTP id pk2csp619998ejb;
        Sun, 21 May 2023 04:15:48 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6xdfX3hApXNADOCZrogQy1iYc0O1Qy4l2hqou0SIb3luuAw4S9+h7cKYIunMjB13pmLt0W
X-Received: by 2002:a05:622a:1209:b0:3f6:aee8:3cf7 with SMTP id y9-20020a05622a120900b003f6aee83cf7mr555248qtx.25.1684667747840;
        Sun, 21 May 2023 04:15:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684667747; cv=none;
        d=google.com; s=arc-20160816;
        b=ApLIz+q3Cs4OK5kVGMUOxDyhk7WuuCXaX8QTeoPuS0bDhl8caeEC087oXAZS4RZKoG
         cDbxm1d/4WqZ5wCxqAo0Amgk5IYEcvcRA+bjnhRo4jxSUwouishJ5KAN7t5iLOKOzrwr
         2IvM0ficoppT5d4a6qer4XKDw3RH8UZstu7MGpxfNyWCiQrhTDUHyfemNc4DC5XZ4ThD
         e7ZmnqTgguXvexAigEpkcm4FqIf7ZCxJrSKy74OjLpPwsPclAXBy7k5d3RIWO0RYmWJ0
         K2x7RaBxnotw6BlWoLAT0HuSSC2PImRcBBEgWlCIsSDkOCkVJjiMqj/7M7ouK0FcsX5/
         hpzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=S7lCt1F+L+Sdvv92ThgE7G1ptCNi2zM217m0D08ErHo=;
        b=AcWIPxPWZDd+EYeWuKuHocMR1lPSedkTXbkUSQPEhcCJBLMoKONRRYgHcjRjFkaJhJ
         IeEtdWRuf8ICDvbcCkJ045xYzztWB4Z+p6VML//AsnoYOW/xmJSGFqBrvExy3UKpkO3l
         gWql9YvmfY0K7nijg1OqZRlyMg0JrlPKISXGyT1Jo076gzvW6zVYzu0QJ+peA3/y8vVR
         u7S23I931pnxivKe8FYQuzzJaOkPZlDuNQ5I+povE7d4MOTPrOoxfh6n00cHiM9Kzj99
         NNjideLOE1AcKaGR5HCUt0Ue0XtdD4j4AvS3Qj+y5CHTUkihGVQD0gN5W4XHegE5AtoI
         bbLQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IQpNCPav;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f20-20020a05622a105400b003f508b97240si2270525qte.319.2023.05.21.04.15.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 21 May 2023 04:15:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IQpNCPav;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q0h1w-0000Hm-Rh; Sun, 21 May 2023 07:15:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q0h1v-0000Gr-9X
 for qemu-arm@nongnu.org; Sun, 21 May 2023 07:15:15 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q0h1t-0004gR-Gq
 for qemu-arm@nongnu.org; Sun, 21 May 2023 07:15:14 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-3f6042d605dso360015e9.2
 for <qemu-arm@nongnu.org>; Sun, 21 May 2023 04:15:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684667712; x=1687259712;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=S7lCt1F+L+Sdvv92ThgE7G1ptCNi2zM217m0D08ErHo=;
 b=IQpNCPav85qGHNro+7zBckqzY6IkPGWwui3Zo6nP80X6yd8jQVuvaB8QO6anbsfEtI
 3CmsVM5U4MGyOdbwOijmXJo4WFr2/P6gCLESRZDj49vEFpMSqge1dhRHEhdf0oTfu4sO
 v8dTljS6sdMvrmoQyrn7Ek8TuFdhn2elv40duKCJwJgw5sT9o7Q+a+3ybrS7iEcdb3/W
 jjD2RMUyI3NhBjHTQAbuBcnJDQz6Oq7VPF6fawi1N85HhGpW6V96bxQLWdwQpmgAuTsT
 T9tUBIGq67Im95BPvUkJqP/Ti17CuSmKglpY4btlq1aJaWe4pUzlRBQIj0miEubPF7qw
 OKkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684667712; x=1687259712;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=S7lCt1F+L+Sdvv92ThgE7G1ptCNi2zM217m0D08ErHo=;
 b=MjOol1vN5iD4s6H5Dp6HI0fqBtrDshokPyIvRH/a/2puc05Ci+JTerlkpQQHI5h3dl
 MmUFDp3zTFn6CNgdn2ruzi3h05r3SSIfnO/smB1ABCb1n6oGjNR3Cc0zM8HKMN3oTpO2
 or0iCuWwC+NEobmJgDDRcbIHYx/zH6MMw3TExLsqxqxmorFU4z6S2iZ9Fc/9I6Fbq54y
 nOsiM1EAOSnGy/dZWejk+0WnGapQ7kI5BX98fjNdm2lUZAE7J+qkujegEmrWZzTYc3NJ
 HM0BPsBfRf+m9TRyfecglaa5+Q+QVNsTevUEh+22EYLfOAEiuVSla/DEWH39f9PLZXvi
 SL3w==
X-Gm-Message-State: AC+VfDwj+diyUBF5xERv7tZOV9cp5IAHLP0CnliYteLOFAYoJKhnckHy
 FqTqWIKpttiNZtIDzIpjwqDr4A==
X-Received: by 2002:a1c:7c08:0:b0:3f5:4d4:4edb with SMTP id
 x8-20020a1c7c08000000b003f504d44edbmr5189436wmc.21.1684667711840; 
 Sun, 21 May 2023 04:15:11 -0700 (PDT)
Received: from [192.168.69.115] ([176.176.152.177])
 by smtp.gmail.com with ESMTPSA id
 l10-20020a05600c27ca00b003f4290720d0sm8029684wmb.47.2023.05.21.04.15.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 21 May 2023 04:15:11 -0700 (PDT)
Message-ID: <8d6e67d7-52c0-aa60-76cb-bf70d586cf7a@linaro.org>
Date: Sun, 21 May 2023 13:15:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.11.0
Subject: Re: [PATCH 16/27] accel/tcg: Unify cpu_{ld,st}*_{be,le}_mmu
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>
References: <20230520162634.3991009-1-richard.henderson@linaro.org>
 <20230520162634.3991009-17-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230520162634.3991009-17-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.098,
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
X-TUID: fW98PTuelW8G

Hi Richard,

On 20/5/23 18:26, Richard Henderson wrote:
> With the current structure of cputlb.c, there is no difference
> between the little-endian and big-endian entry points, aside
> from the assert.  Unify the pairs of functions.
> 
> The only use of the functions with explicit endianness was in
> target/sparc64, and that was only to satisfy the assert.

I'm having hard time to follow all the handling of the various
ASI definitions from target/sparc/asi.h. ...

> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   include/exec/cpu_ldst.h     |  58 ++-----
>   accel/tcg/cputlb.c          | 122 +++-----------
>   accel/tcg/user-exec.c       | 322 ++++++++++--------------------------
>   target/arm/tcg/m_helper.c   |   4 +-
>   target/sparc/ldst_helper.c  |  18 +-
>   accel/tcg/ldst_common.c.inc |  24 +--
>   6 files changed, 137 insertions(+), 411 deletions(-)


> diff --git a/target/sparc/ldst_helper.c b/target/sparc/ldst_helper.c
> index 7972d56a72..981a47d8bb 100644
> --- a/target/sparc/ldst_helper.c
> +++ b/target/sparc/ldst_helper.c
> @@ -1334,25 +1334,13 @@ uint64_t helper_ld_asi(CPUSPARCState *env, target_ulong addr,


Shouldn't we propagate the ASI endianness?

                 ...
   +             memop |= (asi & 8) ? MO_LE : MO_BE;
                 oi = make_memop_idx(memop, idx);
                 switch (size) {
                 case 1:

>                   ret = cpu_ldb_mmu(env, addr, oi, GETPC());
>                   break;
>               case 2:
> -                if (asi & 8) {
> -                    ret = cpu_ldw_le_mmu(env, addr, oi, GETPC());
> -                } else {
> -                    ret = cpu_ldw_be_mmu(env, addr, oi, GETPC());
> -                }
> +                ret = cpu_ldw_mmu(env, addr, oi, GETPC());
>                   break;
>               case 4:
> -                if (asi & 8) {
> -                    ret = cpu_ldl_le_mmu(env, addr, oi, GETPC());
> -                } else {
> -                    ret = cpu_ldl_be_mmu(env, addr, oi, GETPC());
> -                }
> +                ret = cpu_ldl_mmu(env, addr, oi, GETPC());
>                   break;
>               case 8:
> -                if (asi & 8) {
> -                    ret = cpu_ldq_le_mmu(env, addr, oi, GETPC());
> -                } else {
> -                    ret = cpu_ldq_be_mmu(env, addr, oi, GETPC());
> -                }
> +                ret = cpu_ldq_mmu(env, addr, oi, GETPC());
>                   break;
>               default:
>                   g_assert_not_reached();
Otherwise great simplification!
