Received: by 2002:a17:906:755:b0:a37:6271:4f3c with SMTP id z21csp1826938ejb;
        Tue, 6 Feb 2024 06:24:27 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEQwgYhDlTwoar+rWLoO0awp2+dTQAUtmlk9oilF69X3mQqHGTpG7tUetM3zN81DFxWbHzu
X-Received: by 2002:a05:620a:22c6:b0:783:e30b:3759 with SMTP id o6-20020a05620a22c600b00783e30b3759mr2542580qki.35.1707229466703;
        Tue, 06 Feb 2024 06:24:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1707229466; cv=none;
        d=google.com; s=arc-20160816;
        b=OCPvsYcrXoGKNhQwrZu3+c6f9SQyHs6I9RY3RuLedQbKyBWxeqEXUVH0LyQK9rz3L5
         6qO/jXNUCsFCbj+xEOBsdr8k1H4uO7D+u5ab7L/MZUoeyHT+IZ6oYY97ZuDG/yoWgpaX
         yKrCE1JWYQaiwqoaPzA0n+JB8duz3AFdLLq0FjIBirTNv02nn0ubQJMObPEE+cI+1Qyc
         Un7rY+/rNiktSP87OK0trS7UDmKww7s2HdlJAR70Ghu78nRoQ4Eu1rqYVU4zs8tgSmZS
         X49TYjRuxrs1ycXdsIuhJe3RrhtI/Qwc0AQr3JBdM91krwoa/XVYz+PxSdBu2OQsQW2C
         BELg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=AaGh++Flv9XjhHYcCC4C81TVgWFX3v3qbDscWWrt+no=;
        fh=N6P6B1pEzq6HKCWSTEVnavRRe5J+GR+K4Sxbhm9RFkE=;
        b=unRUCLHhcul111+lS5QR0y4hicr4keJFSVvyHkLmhZyHw2YOw61GGZGBmGEfYiY+ry
         9kYVpm0ic3RmU5txlQ9UKNE4nnmumvlRngyIWOTdEgb+4b2d46cifrCwVqrsUTFiU6NP
         2Dze7pbchlO67DLOKj9GOPFeLYUbolr30WaCe209ZbDlTb/ZlYky2MHcBTWtV+3bOqwR
         pj+7Qeq6LKHNBlSbHF8rs2j7fv+fcz4i/IbemsFxkN5p5GHH4hSzqZYzHAs6ohxHeO5G
         8g1Q7Hy1wNr9Wj5VNLjQ8iXfNBkt+cQQyjXtLnJs/gnx4bsljEZr4TfpmD2jBCYVE8oK
         WGDg==;
        darn=linaro.org
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wO5JwAeb;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
X-Forwarded-Encrypted: i=0; AJvYcCVBZZlGnkp3hxOR2Myf1m73tsDIh6MzOvhydiVHcpblpapQPO3lVtXsYgpIBTIwp5R0OrFYLM6UJrQlIgOwV8rXMq/4seHD
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b18-20020a05620a119200b00785158d90f4si2332887qkk.622.2024.02.06.06.24.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 06 Feb 2024 06:24:26 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wO5JwAeb;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rXMMr-0004mb-L8; Tue, 06 Feb 2024 09:24:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rXMMq-0004mH-Ea
 for qemu-devel@nongnu.org; Tue, 06 Feb 2024 09:24:08 -0500
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rXMMg-0003bb-SF
 for qemu-devel@nongnu.org; Tue, 06 Feb 2024 09:24:08 -0500
Received: by mail-lj1-x22f.google.com with SMTP id
 38308e7fff4ca-2cf206e4d56so77786981fa.3
 for <qemu-devel@nongnu.org>; Tue, 06 Feb 2024 06:23:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1707229435; x=1707834235; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=AaGh++Flv9XjhHYcCC4C81TVgWFX3v3qbDscWWrt+no=;
 b=wO5JwAebxKCP+6f+p4Y4b4Jua7crUQjBtYzSpvAnSbr4xZo/DyJa2q8AaZEjaHUI3C
 1U3y+bu+aYd1Kna6oE/Qd/uVB3AjORqHu3JhNf0cf/hiXbW9siPgLPZU8wZaohQ2V+2y
 b5+L/iZjCaM3m/Nsj4+hmxngMK/SNFureRMb2AIzTt5Y/xMxfNFGfBbIFOgNGbeFg+zr
 +m6ZHyo53CZH1KipJSl5DW13TwtOzwnsQAzWbgYpLz8xjT3TY+2w6Rown02fe5/2F9J2
 MElLYEwqeNYPXpwWC0Kq8z1qD9df2gP9dw9Utla2+WjXEkHjYq8a19Gl4mn6DF3ranQA
 DE3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707229435; x=1707834235;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=AaGh++Flv9XjhHYcCC4C81TVgWFX3v3qbDscWWrt+no=;
 b=f9nYT2qX/B/CfqMoU4G2TjxO/FY2z7L2kWv7pOv6om/Ud7mAznOk4bZZTEb/0q20oq
 gjv80i7jmOxq0qTg2RviFI8ZW498qRokTZ7wxDy7ZyD6W4vMQF9LJYK8I9TEx9L7sMef
 5RSiXuUS2Jduow31NoWTRu/Dc89WuHutzFHvXwVJ5z5+fXeF+S3hU7GtobdYIm2aC+rz
 VVhQfIXKjZiSu77Gs47DAmbcV9cyrIwR8h7BH4tr43A/e4K+y0Sey0VDgurDGFskChN0
 Pujk3YEdZMTS2ZuMzHgEjC36vrX+b0WiqP1MmIrhSE7QPi23wkUffH84whlJbSfvxYX9
 esPw==
X-Gm-Message-State: AOJu0YzkNdJiyEhwfSVaLIwvelF+9QFy0XMVDIzVsyuWKrkunc+W/FTY
 33dzk+d4Yqui4yJgbynRnY8CE9jUKqmGI6KsizdZJDsbGw2ZhwPYgR1SBQrsVj/0yBjD5jCArks
 n9rjOB7sAM0h4ZqwphQniv9vgKZKsnDmGuGvF7Q==
X-Received: by 2002:a2e:8748:0:b0:2cd:c206:9141 with SMTP id
 q8-20020a2e8748000000b002cdc2069141mr1965962ljj.14.1707229435574; Tue, 06 Feb
 2024 06:23:55 -0800 (PST)
MIME-Version: 1.0
References: <20240206030527.169147-1-richard.henderson@linaro.org>
 <20240206030527.169147-2-richard.henderson@linaro.org>
In-Reply-To: <20240206030527.169147-2-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 6 Feb 2024 14:23:43 +0000
Message-ID: <CAFEAcA8AuQZNbT=7WFXVPDzDywPPp1YZ=Bkow7Dgq2pC9=9X-g@mail.gmail.com>
Subject: Re: [PATCH v2 1/6] linux-user/aarch64: Extend PR_SET_TAGGED_ADDR_CTRL
 for FEAT_MTE3
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, gustavo.romero@linaro.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::22f;
 envelope-from=peter.maydell@linaro.org; helo=mail-lj1-x22f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: lMfwqrMX+soN

On Tue, 6 Feb 2024 at 03:06, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> When MTE3 is supported, the kernel maps
>   PR_MTE_TCF_ASYNC | PR_MTE_TCF_SYNC
> to
>   MTE_CTRL_TCF_ASYMM
> and from there to
>   SCTLR_EL1.TCF0 = 3

This depends on the setting of
/sys/devices/system/cpu/cpu<N>/mte_tcf_preferred :
I think you only get asymm here if the sysadmin has set
mte_tcf_preferred to 'asymm'; the default is 'async'.

https://www.kernel.org/doc/Documentation/arch/arm64/memory-tagging-extension.rst
documents the intended semantics of the prctl, though it does have
one error (the default-order is asymm; async; sync, not async; asymm; sync).

> There is no error reported for setting ASYNC | SYNC when MTE3 is not
> supported; the kernel simply selects the ASYNC behavior of TCF0=2.

For QEMU's implementation, are there any particular
performance differences between sync, async and asymm ?
That might determine what we effectively consider to be the
mte_tcf_preferred setting for our user-mode CPUs.

> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  linux-user/aarch64/target_prctl.h | 25 +++++++++++++------------
>  1 file changed, 13 insertions(+), 12 deletions(-)
>
> diff --git a/linux-user/aarch64/target_prctl.h b/linux-user/aarch64/target_prctl.h
> index 5067e7d731..49bd16aa95 100644
> --- a/linux-user/aarch64/target_prctl.h
> +++ b/linux-user/aarch64/target_prctl.h
> @@ -173,21 +173,22 @@ static abi_long do_prctl_set_tagged_addr_ctrl(CPUArchState *env, abi_long arg2)
>      env->tagged_addr_enable = arg2 & PR_TAGGED_ADDR_ENABLE;
>
>      if (cpu_isar_feature(aa64_mte, cpu)) {
> -        switch (arg2 & PR_MTE_TCF_MASK) {
> -        case PR_MTE_TCF_NONE:
> -        case PR_MTE_TCF_SYNC:
> -        case PR_MTE_TCF_ASYNC:
> -            break;
> -        default:
> -            return -EINVAL;
> -        }

We should probably check here and reject unknown bits being
set in arg2, as set_tagged_addr_ctrl() does; but the old
code didn't get that right either.

> -
>          /*
>           * Write PR_MTE_TCF to SCTLR_EL1[TCF0].
> -         * Note that the syscall values are consistent with hw.
> +         * Note that SYNC | ASYNC -> ASYMM with FEAT_MTE3,
> +         * otherwise mte_update_sctlr_user chooses ASYNC.
>           */
> -        env->cp15.sctlr_el[1] =
> -            deposit64(env->cp15.sctlr_el[1], 38, 2, arg2 >> PR_MTE_TCF_SHIFT);
> +        unsigned tcf = 0;
> +        if (arg2 & PR_MTE_TCF_ASYNC) {
> +            if ((arg2 & PR_MTE_TCF_SYNC) && cpu_isar_feature(aa64_mte3, cpu)) {
> +                tcf = 3;
> +            } else {
> +                tcf = 2;
> +            }
> +        } else if (arg2 & PR_MTE_TCF_SYNC) {
> +            tcf = 1;
> +        }
> +        env->cp15.sctlr_el[1] = deposit64(env->cp15.sctlr_el[1], 38, 2, tcf);
>
>          /*
>           * Write PR_MTE_TAG to GCR_EL1[Exclude].
> --
> 2.34.1

thanks
-- PMM
