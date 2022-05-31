Received: by 2002:ac2:4318:0:0:0:0:0 with SMTP id l24csp3431247lfh;
        Tue, 31 May 2022 05:52:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzCj82yPYcvc1sT2TLq6yd0WNLpzD3tyjwwGlchRZlT1u0VGN2T0bQ/bpVsOhFHsK5Zwkyj
X-Received: by 2002:a05:622a:190e:b0:2f8:f760:6cb5 with SMTP id w14-20020a05622a190e00b002f8f7606cb5mr47100716qtc.520.1654001572981;
        Tue, 31 May 2022 05:52:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654001572; cv=none;
        d=google.com; s=arc-20160816;
        b=Pjz6v4w0Sbv+7/1V/raW5ZMwle08G3kX3hNSKCz99pSfHbUa2p4Tn/DixnXkqU9P+Q
         Skx0h9YT6G28fUEcZKgSlYM/v4U5mE8BxT/TGHvTvdhgdmzYJdeP+V37PHXXeM7Zqw1H
         pxlZ7ulTKUzhvOutIyow0AlvsPKyVI0JC5sh51/FvuVNYwtHvaBhwH822hz0ZZuKRdZn
         25MwphAQMX7lyQpwjdnNmJ6rd+8HzexHpZ1n0dZ5+CiX95xYfzMyTa8rOi0N3H459GiZ
         SWcXm0BADRIVFfU3ACH/Ad0rRyC7fjaQy/22/YUfeWeaqh/fsKor9XgoyZKnsbafUVV1
         SxgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=KOZPr6pnJOadb2f21OyYgxBGVyrLDjhAlrrSN+4kWCs=;
        b=Vm0kAOCydsMCglsejCqJBPorVP+Qa/bAs5DcnnMfN9UI6L1QjSAzzGYEhYlDShmSQG
         MkqJkYuw4l2Py0n6te1oLkHr1y5Xq9wO+PVjMzvk2ymZ8yFMKA7G6Kx2Dv3xINEc75m0
         HXTr0jF2XwP+CW3cB/TyOCpAK4XrQjXaBg0BaXjfF3fmPTZyRIytNMNxpziQuyXqU9SM
         JRQMC9+svTCizi6ELnyyWZai7/eggVe+zdSvUsdmDRGBRT/onvrcm8z5vtjRzCg4A6l+
         sFBTTDHQKuuy2ZskfZ30r43JkixfvDzIAVJpdgqAYDZkp7OCD5bnKpqtf9VYxbkRwYq/
         c8hg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=y2c05ZOL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k9-20020a05620a414900b0069c1fae5c76si11316148qko.38.2022.05.31.05.52.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 31 May 2022 05:52:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=y2c05ZOL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:49486 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nw1Mi-0006P2-DE
	for alex.bennee@linaro.org; Tue, 31 May 2022 08:52:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43422)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nw11F-00022l-Or
 for qemu-arm@nongnu.org; Tue, 31 May 2022 08:30:47 -0400
Received: from mail-yb1-xb36.google.com ([2607:f8b0:4864:20::b36]:46931)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nw117-0006kt-Tf
 for qemu-arm@nongnu.org; Tue, 31 May 2022 08:30:39 -0400
Received: by mail-yb1-xb36.google.com with SMTP id r82so13686283ybc.13
 for <qemu-arm@nongnu.org>; Tue, 31 May 2022 05:30:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KOZPr6pnJOadb2f21OyYgxBGVyrLDjhAlrrSN+4kWCs=;
 b=y2c05ZOL+C7VFF06jMd9osB1nC2AjYo3FvCQ3tThdiEk32rM8s3sByJSS8hsdmnOeC
 0uTkkNH/nYv4oHlVT0uUW14MrwloaeSulEFTHYM/DSWl+yezLgDpselY1LTQT7Ok330P
 1/dMFUMh1Mz3TakSC3S8F63YcIdNWu9Pw8WGb+KXqp61utHWyxqZrJY6aXQHIHX018Hj
 H3/X+KusyP2if2q0ECkylPKcU1braBV7C8Xjm94j9OGktGfue3aVBYVvZpyf80tga16V
 Ck1dS8SrwC6Yb1rcInNaeZ+mWjy/XXbMBRxHsRmQpsk4GlFEXdrv5knyZdcFCCSfLEv+
 TMAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KOZPr6pnJOadb2f21OyYgxBGVyrLDjhAlrrSN+4kWCs=;
 b=qvScb6PJZ7nqLR2x1RPTPEQJdtNNMJislz/UgUJUblJBfl11B08jb80aPg1MlmHSg2
 yqZiM/QuDnMLZyGU8oryH4yJBvSVLuQWWHGOJ3wlz96Q6fbQZQ39OBp2tjyS9YeUA/7f
 W94xXiLVFpKA/Qefkoh1CQqKeK7dMuDxXTOeCyhO8LuUy1IrQnVd5MEHgnnHhpET/Rqe
 Uwb3MkOR62c4qh5cEXdfdKGBXEV9Bvw9q6f56Hl13SP0HGLhmRLECBpnCIUung4Fxkiv
 W2LWz/utTSQNKw4e3A3qNxWnL7jOZwKPHJ3GFGIb4KczzkzqgMkKa+xWLgGj2igdGzdj
 wXHw==
X-Gm-Message-State: AOAM532DvAyx8zUeMiM55LfrKXz3AKSWVXPgJCLMy2thQ+4xDgsTEY7n
 uD/HpfI+iKUJCkCA7OjmDhiwhV+G3X0oE3AvMa9FAo20Oyk=
X-Received: by 2002:a25:ab2a:0:b0:65c:bdcf:44be with SMTP id
 u39-20020a25ab2a000000b0065cbdcf44bemr12079455ybi.85.1654000232759; Tue, 31
 May 2022 05:30:32 -0700 (PDT)
MIME-Version: 1.0
References: <20220527180623.185261-1-richard.henderson@linaro.org>
 <20220527180623.185261-13-richard.henderson@linaro.org>
In-Reply-To: <20220527180623.185261-13-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 31 May 2022 13:30:21 +0100
Message-ID: <CAFEAcA_8-a_15iAOgxJckdmtmRnteTbS2-ZjnikNgP+7=Pd80g@mail.gmail.com>
Subject: Re: [PATCH v3 12/15] target/arm: Move expand_pred_b to vec_internal.h
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b36;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb36.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-TUID: w2qQ/HgXBsg2

On Fri, 27 May 2022 at 19:11, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Put the inline function near the array declaration.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/vec_internal.h | 8 +++++++-
>  target/arm/sve_helper.c   | 9 ---------
>  2 files changed, 7 insertions(+), 10 deletions(-)
>
> diff --git a/target/arm/vec_internal.h b/target/arm/vec_internal.h
> index 1d63402042..d1a1ea4a66 100644
> --- a/target/arm/vec_internal.h
> +++ b/target/arm/vec_internal.h
> @@ -50,8 +50,14 @@
>  #define H8(x)   (x)
>  #define H1_8(x) (x)
>
> -/* Data for expanding active predicate bits to bytes, for byte elements. */
> +/*
> + * Expand active predicate bits to bytes, for byte elements.
> + */
>  extern const uint64_t expand_pred_b_data[256];
> +static inline uint64_t expand_pred_b(uint8_t byte)
> +{
> +    return expand_pred_b_data[byte];
> +}

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
