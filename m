Received: by 2002:a17:907:76f8:b0:9a1:fa4e:495e with SMTP id kg24csp3715886ejc;
        Tue, 29 Aug 2023 07:47:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHqj57YTUoijeA+qi79lULYqKEVVybrH4ez2Zme9C+wZf205YXMtO1SOZ9GUd6rdmoWC9AH
X-Received: by 2002:a05:622a:1a8c:b0:405:4816:6eef with SMTP id s12-20020a05622a1a8c00b0040548166eefmr3377344qtc.24.1693320452359;
        Tue, 29 Aug 2023 07:47:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1693320452; cv=none;
        d=google.com; s=arc-20160816;
        b=Vuhp/SFSojv02+6vZ1MXCGYuOpuK1BF2DEHGycLliCFWhXHzLe/kRgAcRpchkmha3C
         +aGOAMxfDzCRzsNy5qGfVx5B9/JssEm8oHWubAAhpRsfV6GHmQRU+EHD31DC0cJWnhwK
         v0hxyU4WFooewXUJHxtGJZmThxQh2zxZe4X8il7gvv2PsvF8jR6+xcCooQX547uPPo32
         nSkJ43RXHWO5bQHgORaP0f0vWULKW00zMJrMeEgXhxBZelGAicPeriv0cbHcGjnsCCrZ
         xY6sajRQSwrHIbruAd5p/xdx/Ftx5jqxIIRGT//Rj2dPI0xH56weG7lywt7TqffUpazg
         zp7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=aZUifF96SYNJfQU6ue3OBEDjkcdrguBJLAdhtiSxLOw=;
        fh=/ftcwOPYeEIhzseC7WF42kR+xVR/IJiWpLC1+A7SOWQ=;
        b=Lv5t1hfC5Tj0JasmmOGcOJ2E9LyRGm0UUSAfwJ/jPv2o8HUC4odDbtp/u5cM39SUrk
         uhNcE0DrZkl84vxo0AsSfFluqQX5p9bWtqCMAOIGFW2Gr6ctZj8eCAFlkZvn6AO91sRO
         v1u+0ZpeyBDvOjOcWNkgpp4ziQTp5P6sDGSnPFHJRRep2zgG/Ts988K1xxI2HLXInsL6
         ObcMMDIAxNTdpCpoRyXdafAJtR3qVcr9uNAo0NJCiAoR/omt0VKXntGD8npmMyN2hAcY
         9ZGRdFZ2i0xtVB4P/gG5kq0nkGl2CZUsFXeIakV9ylYxBBoQdLaqB1WyEGHdBzCJ9RyN
         mPRg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EWLFGPAE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y18-20020ac85f52000000b00410497bfe2bsi5921450qta.153.2023.08.29.07.47.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 29 Aug 2023 07:47:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EWLFGPAE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qazzp-0003MZ-EH; Tue, 29 Aug 2023 10:47:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qazzk-0003AE-Nm
 for qemu-arm@nongnu.org; Tue, 29 Aug 2023 10:47:04 -0400
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qazzZ-0004yO-34
 for qemu-arm@nongnu.org; Tue, 29 Aug 2023 10:47:00 -0400
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-52a4818db4aso5776759a12.2
 for <qemu-arm@nongnu.org>; Tue, 29 Aug 2023 07:46:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693320402; x=1693925202;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=aZUifF96SYNJfQU6ue3OBEDjkcdrguBJLAdhtiSxLOw=;
 b=EWLFGPAEumDCW0i6h4uDTMmRq8uH65F3PniAIeHmMkhH509tbLfFTapX5U9fGGiZT/
 bpEjlqhwdOpXjLaYqMQchladlBaQAbxAPrmvQWQaKY8Bc1EfetedzFtdNxUE8EE4PEyP
 1sNB3p9FsyEC0S6VzP/dySiW/6c5zrmeWkqSash/1yLlxmIBlKnZP5FIo3JeAZHR3pRI
 wlrTlcHdVwiZ5bq/sKgSRh1+ZsIx1NxFTaqFrFkgsfg6+vNyCKcVqVZbzTxxZTtR9UxR
 K2Ui9azR6VhQEreUO1W9wZtAdh61F/yN4TX67CKAWPYAU3+gCEPe8MdeOlNUzUG3U3/q
 zVmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693320402; x=1693925202;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=aZUifF96SYNJfQU6ue3OBEDjkcdrguBJLAdhtiSxLOw=;
 b=AgnV9meMrVK5nmvp38uT2/W+m/pLEBeZPTP4ZwHXOsMDNIEF/eGELEnFZ5NDM8B8n6
 1bpZVdiu7ZyAGoOR8svnrtceUanpYTZ+dCRxR7je51/BBiXWS4MBR2zmxr7gzcdgQtzj
 xMreCx+XqxZFtu78qo7OO4D0XZhbWAY7vfZAOT9XpsLt6FSp6FlV+m/PvJLuKEg8LPaB
 tlZts3UWff2WgAJAlGIoOZshdAC2EklegEOzy8oymztOzq7CwwkEk85EcsaRD/sqFQek
 Ij7KYgDX/UMS3gk/y/Z/zh8xT2uqqnAUWmLczBQu7z/RzPzTRiHx2DXzyvkgjx2m7twn
 4rjQ==
X-Gm-Message-State: AOJu0YwAt/pfiwFgcxlV/oZgyqRxwoLC03XL6gdKxxOTxtLJmRUtzzVJ
 +4Eti0JPK113GNhmCUtBoLCJB+f2O8+KPAGZrOf6md9Svi5hBPL9
X-Received: by 2002:aa7:df89:0:b0:523:1ce9:1f41 with SMTP id
 b9-20020aa7df89000000b005231ce91f41mr22084707edy.18.1693320402407; Tue, 29
 Aug 2023 07:46:42 -0700 (PDT)
MIME-Version: 1.0
References: <20230822170209.1130173-1-richard.henderson@linaro.org>
 <20230822170209.1130173-4-richard.henderson@linaro.org>
In-Reply-To: <20230822170209.1130173-4-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 29 Aug 2023 15:46:31 +0100
Message-ID: <CAFEAcA_5C8D+B1ad9RftcckknzS-WMC0o=t-zQKpzC7_9gfJ9g@mail.gmail.com>
Subject: Re: [PATCH 3/3] linux-user/aarch64: Add ESR signal frame for PACFAIL
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-TUID: AUE91ouOuaEv

On Tue, 22 Aug 2023 at 18:02, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> The PACFAIL fault uses ILL_ILLOPN and includes ESR.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  linux-user/aarch64/cpu_loop.c |  7 ++++++-
>  linux-user/aarch64/signal.c   |  6 ++++++
>  tests/tcg/aarch64/pauth-2.c   | 25 ++++++++++++++++++++++++-
>  3 files changed, 36 insertions(+), 2 deletions(-)
>
> diff --git a/linux-user/aarch64/cpu_loop.c b/linux-user/aarch64/cpu_loop.c
> index 22c9789326..5af17e8724 100644
> --- a/linux-user/aarch64/cpu_loop.c
> +++ b/linux-user/aarch64/cpu_loop.c
> @@ -110,7 +110,12 @@ void cpu_loop(CPUARMState *env)
>              /* just indicate that signals should be handled asap */
>              break;
>          case EXCP_UDEF:
> -            force_sig_fault(TARGET_SIGILL, TARGET_ILL_ILLOPC, env->pc);
> +            /* See kernel's do_el0_fpac, and our need_save_esr(). */
> +            if (syn_get_ec(env->exception.syndrome) == EC_PACFAIL) {
> +                force_sig_fault(TARGET_SIGILL, TARGET_ILL_ILLOPN, env->pc);
> +            } else {
> +                force_sig_fault(TARGET_SIGILL, TARGET_ILL_ILLOPC, env->pc);
> +            }
>              break;
>          case EXCP_PREFETCH_ABORT:
>          case EXCP_DATA_ABORT:
> diff --git a/linux-user/aarch64/signal.c b/linux-user/aarch64/signal.c
> index b2280fa9e3..bcdd796cc2 100644
> --- a/linux-user/aarch64/signal.c
> +++ b/linux-user/aarch64/signal.c
> @@ -582,6 +582,7 @@ static bool need_save_esr(target_siginfo_t *info, CPUARMState *env)
>  {
>      int sig = info->si_signo;
>      int type = info->si_code >> 16;
> +    int code = info->si_code & 0xffff;
>
>      if (type != QEMU_SI_FAULT) {
>          return false;
> @@ -592,6 +593,11 @@ static bool need_save_esr(target_siginfo_t *info, CPUARMState *env)
>          return true;
>      }
>
> +    /* See arch/arm64/kernel/traps.c, do_el0_fpac, and our cpu_loop(). */
> +    if (sig == TARGET_SIGILL && code == TARGET_ILL_ILLOPN) {
> +        return true;
> +    }

This works, but we'll need to do something else if the kernel adds
some other fault later that is reported as ILLOPN but without
an ESR record...

> +
>      return false;
>  }

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
