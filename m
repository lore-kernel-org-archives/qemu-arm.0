Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp605845ejb;
        Fri, 9 Jun 2023 12:44:11 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4Xkw/OAVkKWiB++i2lLYy/V2nQ6rB5M3XJ9BCXKoCiPNmGK6UarxzWzWD1QVBsTCM23EyC
X-Received: by 2002:ac8:57c8:0:b0:3ef:658c:6b33 with SMTP id w8-20020ac857c8000000b003ef658c6b33mr2872248qta.43.1686339851319;
        Fri, 09 Jun 2023 12:44:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1686339851; cv=none;
        d=google.com; s=arc-20160816;
        b=gNRIGyll07rwqyWTzAIHBLsrVFKSR4jnwHbVJzZkFEOyCD7nMqdbS3Jx5IFe+CkQ9r
         XJCPuNpg9/oFWezegdtLa0/JqXzLOJJl/RqwGNByRG4FPB4fpKF5W1HNo+Nf2qW6eYvq
         LprQ4HjqiL/luBX4ruv9YrNhaaPDo6huLwZSAbpWRC3S4llkjb5Z+St5u5Ej2Mnv5Gt2
         wmUbfOY/Py8XK7kvj4XdHBnF84fP6LAOazmS5Yw75468bfsust6RZ9wmgZs0/EuNvxYr
         9hSF/tXUot2jK/y3yTbbqPgC01JVsYve/OWTLINs/4mtyFEnUu3x+H40KJ77d/ncXOZo
         hF9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=EoI9BhDicHhnuKCaqYyalWf8y14CjENevoYSLpAcyTk=;
        b=ohMWucBH3FaK/9AVUOPwzIwnwce3ucehCFhUnUbs+zUpVrpwSzXZMhMB/diX6/aX5G
         aURorjb/30F/JMUqnLMRMNZ7PvrrEKhI0fY/ryRNpesyzmylfFgJuxFOcPPnAj+yPUWH
         7ba9eotvK2QVf+MuBX3y47Keu32IQhdKu9olO6fGe2ODGXZuqEdl6tmw8T0dXCzvfCrX
         4GWM0O85BNCGpqh+RLWhmh2MpwMJARtB9jAa4+U69+4KcOjMZ++jqYZ309cKV4dDfGhB
         4PGrthA61YuJO+Xjzla40Q9mH5qVtclVT35hy5PfuN+NRyyId9NFmHlz3XVeOpVU1oeH
         1pNQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BuS7WUf1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o16-20020a05622a009000b003f610bf695esi2586367qtw.67.2023.06.09.12.44.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 09 Jun 2023 12:44:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BuS7WUf1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q7i1o-0003Lp-R1; Fri, 09 Jun 2023 15:44:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q7i1o-0003LK-9V
 for qemu-arm@nongnu.org; Fri, 09 Jun 2023 15:44:08 -0400
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q7i1m-0008CT-OL
 for qemu-arm@nongnu.org; Fri, 09 Jun 2023 15:44:08 -0400
Received: by mail-pf1-x431.google.com with SMTP id
 d2e1a72fcca58-652699e72f7so1857968b3a.3
 for <qemu-arm@nongnu.org>; Fri, 09 Jun 2023 12:44:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686339845; x=1688931845;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=EoI9BhDicHhnuKCaqYyalWf8y14CjENevoYSLpAcyTk=;
 b=BuS7WUf1r6sUtom/AybGycqLyX/Uxbmgo3u2FSHsVh7BvFwx2yAAVR3J+D2agiBvi2
 Pxun6mRjTvsBBCLe/DingR/xJxfvXqhL1DzVa5Cq+tE33HTg+6xmENbn7mfOphbOH7Tf
 0JPAoz7uRZmLlE0DO6seneNwxOKUVOmBo0ziyQDOXQTAawT9CJQAbg3K+ABX3wB0hLY9
 /40pyz2yEV8yjoVd1KIjnaW+h7SN8sI8yiAaCwvA+rjfoCibbCFxD0PmhEIugMdsedd2
 pWy+QfKddW8H8JQ2+1yocj8KOK3s7gHeL4Y0xDuUuLCVw1Quq8AIfKsn3SeA1mreW+xU
 /X+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686339845; x=1688931845;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=EoI9BhDicHhnuKCaqYyalWf8y14CjENevoYSLpAcyTk=;
 b=JhJE72ttmmpbbpBcuSGXDtSD7Vp/MCSZoREiVZvG7ik5FQ6tn2ZjQz6jgmBGAwslNt
 ylGqkMs+Zx8F+sleq6S6sCZKGHEoiV/O2SPxOmXPMzfCPNjqjF7Zd/NSXgg+GO8m7wm1
 BEVkyU+tIcSNVVso4VzOn6bXaGz4NSdWRwuTyHmEbqo+oyFEjUucSOmHEhZN2CC67Uab
 jaORdFp+6+Xg0vzv9UzFf7Kq3FBk149afdtMd9LNcSslrVUlkB7RbT9JCzgnY/FJ2yOP
 Qbm5fqrtGKngo+u4UI0m8Z/L43fDkpFHU4m1ABpnvD3RXA91a4eZHWzkiuDmP3fCnWnQ
 OX0g==
X-Gm-Message-State: AC+VfDzWAIli8/zzlZcK4ap1kezpC7pK6wk/5F6bPvuuGrXf+QFemAqE
 Hpi/2kcecbvU/wBEUG+lGQojKR5xHdV85hYTnyg=
X-Received: by 2002:a05:6a00:9a4:b0:640:defd:a6d5 with SMTP id
 u36-20020a056a0009a400b00640defda6d5mr2093227pfg.12.1686339845203; 
 Fri, 09 Jun 2023 12:44:05 -0700 (PDT)
Received: from ?IPV6:2602:ae:1598:4c01:20be:c4cb:f609:8cca?
 ([2602:ae:1598:4c01:20be:c4cb:f609:8cca])
 by smtp.gmail.com with ESMTPSA id
 k7-20020aa792c7000000b0064d57ecaa1dsm3017284pfa.28.2023.06.09.12.44.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Jun 2023 12:44:04 -0700 (PDT)
Message-ID: <a923dd0b-e380-e3b3-22c2-bc9c871dce1f@linaro.org>
Date: Fri, 9 Jun 2023 12:44:03 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 14/22] target/arm/tcg: Reduce 'helper-neon.h.inc' inclusion
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
References: <20230609104717.95555-1-philmd@linaro.org>
 <20230609104717.95555-15-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230609104717.95555-15-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x431.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: oxeaPChcuNVg

On 6/9/23 03:47, Philippe Mathieu-Daudé wrote:
> Instead of including helper-neon.h.inc via helper.h which
> is included by all TCG files, restrict it to the few files
> that require it.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   target/arm/helper.h             | 1 -
>   target/arm/tcg/neon_helper.c    | 6 +++++-
>   target/arm/tcg/translate-a64.c  | 5 +++++
>   target/arm/tcg/translate-neon.c | 6 ++++++
>   target/arm/tcg/translate-sme.c  | 5 +++++
>   target/arm/tcg/translate.c      | 5 +++++
>   target/arm/tcg/vec_helper.c     | 5 +++++
>   7 files changed, 31 insertions(+), 2 deletions(-)
> 
> diff --git a/target/arm/helper.h b/target/arm/helper.h
> index 2cf25f0605..82c34df538 100644
> --- a/target/arm/helper.h
> +++ b/target/arm/helper.h
> @@ -608,5 +608,4 @@ DEF_HELPER_FLAGS_5(gvec_uclamp_d, TCG_CALL_NO_RWG,
>   #include "tcg/helper-sme.h.inc"
>   #endif
>   
> -#include "tcg/helper-neon.h.inc"
>   #include "tcg/helper-mve.h.inc"
> diff --git a/target/arm/tcg/neon_helper.c b/target/arm/tcg/neon_helper.c
> index 0a4ab3e42c..3346a897ad 100644
> --- a/target/arm/tcg/neon_helper.c
> +++ b/target/arm/tcg/neon_helper.c
> @@ -9,10 +9,14 @@
>   #include "qemu/osdep.h"
>   
>   #include "cpu.h"
> -#include "exec/helper-proto.h"
>   #include "fpu/softfloat.h"
>   #include "vec_internal.h"
>   
> +#define HELPER_H "tcg/helper-neon.h.inc"
> +#include "exec/helper-proto.h.inc"
> +#include "exec/helper-gen.h.inc"
> +#undef  HELPER_H
> +

Again, none of the *_helper.c need helper-gen.h.inc, only prototypes.


r~
