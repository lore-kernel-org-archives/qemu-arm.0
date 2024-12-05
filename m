Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp287037njb;
        Thu, 5 Dec 2024 09:14:47 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUpbiUSPJ4Y4znDszmsXYrZIM2uw+8x37bhbyckfH3HnA1UZmRnVAbRPsNNt+Amgw9POrmNBkhfFEk0iA==@linaro.org
X-Google-Smtp-Source: AGHT+IGU+99ap+e/qPJauA0AO9gJjm+bArIiossRwf4Sdl2KfSNNj1Blx1A/BJ8EE5tbIZT5bppd
X-Received: by 2002:a05:620a:4445:b0:7b6:704e:3529 with SMTP id af79cd13be357-7b6a61c4e42mr1416896685a.46.1733418887700;
        Thu, 05 Dec 2024 09:14:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733418887; cv=none;
        d=google.com; s=arc-20240605;
        b=RNVHUbRm8JWNrywpFtRKQ/RhKl3RYwxXgin8G4S+ISh7GbBczUIw3YhNrhnNM3nsK+
         82u8cePSp+uVgzk0oTGdvPG1SBCTb47up3z5r6q+hNUMsuNlkS3Iy+Q/Y2MyFFW8qXzq
         2VrqmFjY75K5l7k04c0slhZhx7TbOLN4TXYEU+L1VkbWkOO9/y1+vs/3QA96U9Kk76mY
         ykrl1VUe1iQj1WUl5ZkxIZs+JOJYlMgabh6o/hC6CjkHCe6m0EGq99oTuBB6V/GSNTle
         oCJ9Lh28VvQCITrPPu/7ND3scTuGLPvss/x4ng+nutppPPeyOGCyWK1YohcqMX4WsbxR
         2dBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=LHyw/+HCoHi272pvctLC/N+j10m7JzXddfL1kSJFX5w=;
        fh=rH/7c+FkvvtAAOpeRUNlfYt8JPaMeqWhGArDGo1wCz8=;
        b=fuERLCfutuWYEakxaGo8WjxQzHBFOdbR1HVKXi4ipKe4WAzPlSWbDBDmaGmkbLW4W7
         jlzAQLhbzSr+uMnDvGc7TkbFzsPi4LJP78nkTaVuhvVZJWpsTj0QbIT44APjRIBDkZI+
         OmsnSmpSmTBy7ZsdBl6zzpSXpbnRXALzWKAVITxDo01Cb++VQPPEmUzzcfdS6jBXQGaW
         jJV58/Od24WcwC8TygZuKIwR6/REUc3jKSTGtzfRgYkOT5s8IKuFUkVSKuIGk5pIsj8E
         HGITzBCp4YH9DdUKs0yrg03qMH55tNJSy4g/OHVMXrjCKT/ObpSzINJRuM4BdKIQYBVo
         2h/Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=r8BbEMTV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7b6b5a9f9dasi206118485a.376.2024.12.05.09.14.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 05 Dec 2024 09:14:47 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=r8BbEMTV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tJFQl-0007Tn-GN; Thu, 05 Dec 2024 12:14:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tJFQh-0007T6-Ia
 for qemu-arm@nongnu.org; Thu, 05 Dec 2024 12:14:19 -0500
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tJFQf-0001qR-98
 for qemu-arm@nongnu.org; Thu, 05 Dec 2024 12:14:19 -0500
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-5d0ac27b412so1403745a12.1
 for <qemu-arm@nongnu.org>; Thu, 05 Dec 2024 09:14:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733418854; x=1734023654; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=LHyw/+HCoHi272pvctLC/N+j10m7JzXddfL1kSJFX5w=;
 b=r8BbEMTV63ammVENXSDnKG3kKiTvnHb0y+lF1uSSH/JnO4tjpqOp+nlwF0vjsaIHE9
 x6TGpcU5gPpotKllm0Qfx4q3KfYoeJbm3UoKas63wDKZz+pJNGRi70IpU3TFyh1sCNXi
 lt/hm+2SXLq4uA6cWEdy8y/15RGbvUpCuhUF96l3EkXf8CtfciTK61Dzat0idxt4MYbi
 xj4xzaY2vcOafPAlpE/cxPhS/BM4sP7As8oDvSbU7qJMec9G5mwid6GJ6u73N7Zt//PS
 4OLZGfCTvY6qHGgyXErUCE4YwNwNMnDOdXTrcJ5Y9GAM9EzPGZxK+Xh7gP0wur0P7LpA
 Tv/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733418854; x=1734023654;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LHyw/+HCoHi272pvctLC/N+j10m7JzXddfL1kSJFX5w=;
 b=MQyJVyLB1fby1kD4HSk1hmVx318xsyvaVwWzfIYkNcfIVUxzgvo9TPDOmJ2GqZXKK/
 xn7WQafBS39OM5OKZ8RS25RmdC3Daoafva5J6LKr1JEgA3YTAjnkQIIEE4E1cTE5RqLg
 0yNkSkVdHOrJnUgtY6x9bc1Y/fx03Kx0AKGwsRO8nFMg9qCJOMEKnWtAaQsy1fZFH3z6
 RC4j8XHXH6mTSVuoJbp8uYe4XqZsjlMeJG5PZOlBQhA22OS+EhjcQp8ksMfj5fwA5Y3h
 xmhkgn5CLoG6m6vToI1GEtK6I46Ix/YWZBryO7jn8w6eOiQIpNywdB4X8N+wBnpvdZa2
 NViQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWAm5Ke5zmcYgAD3JoGXvZ0j7FQZ9VUNs4kRQUebDjrP1MUQCwmgA0ryxx4PdwQRS5lyIInZWP/Sw==@nongnu.org
X-Gm-Message-State: AOJu0YwSThhWqcpbxvC7SckXS2ADLrMiHybLYVdCK7WZ32SXw/AsMCQy
 DZWdisB6XtGcA32vNC7RFs6HLLHQxym/H7f6Xnx1r3Er2SbaX4YYnXHJ7bdIOt1FzLtB7Jg4unM
 CKI+PtTqLd2YWLBGyoPmGiMtw8gtkuVhbv94H8A==
X-Gm-Gg: ASbGncttxijWmrfd5Cwm8WrAeIUOGkqNCTvXPuGiwzCMZa7kTEW790vspSGYOPSyFi3
 0nCkHob/Zq7VS3fSqRfSUBt2GYUOS4LqNqpv+
X-Received: by 2002:a05:6402:1513:b0:5d1:22d2:8965 with SMTP id
 4fb4d7f45d1cf-5d122d28b58mr4416435a12.30.1733418854483; Thu, 05 Dec 2024
 09:14:14 -0800 (PST)
MIME-Version: 1.0
References: <20241118114806.1119-1-andrew.yuan@jaguarmicro.com>
In-Reply-To: <20241118114806.1119-1-andrew.yuan@jaguarmicro.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 5 Dec 2024 17:14:03 +0000
Message-ID: <CAFEAcA_ZvRJNkv=Xop7fyzJxNAQ_3uLcLxa4w3khQdAoaSH2YA@mail.gmail.com>
Subject: Re: [PATCH] hw/net: cadence_gem: feat: add logic for the DISABLE_MASK
 bit in type2_compare_x_word_1
To: "Andrew.Yuan" <andrew.yuan@jaguarmicro.com>
Cc: edgar.iglesias@gmail.com, alistair@alistair23.me, jasowang@redhat.com, 
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-TUID: cXi7dSRsx9/T

On Mon, 18 Nov 2024 at 11:48, Andrew.Yuan <andrew.yuan@jaguarmicro.com> wrote:
>
> From: Andrew Yuan <andrew.yuan@jaguarmicro.com>
>
> As in the Cadence IP for Gigabit Ethernet MAC Part Number: IP7014 IP Rev: R1p12 - Doc Rev: 1.3 User Guide,
> if the DISABLE_MASK bit in type2_compare_x_word_1 is set,
> mask_value in type2_compare_x_word_0 is used as an additional 2 byte Compare Value

I didn't find a copy of the datasheet to review this patch against.

Edgar, Alistair -- could you have a look, please?

thanks
-- PMM

>
> Signed-off-by: Andrew Yuan <andrew.yuan@jaguarmicro.com>
> ---
>  hw/net/cadence_gem.c | 25 ++++++++++++++++++++-----
>  1 file changed, 20 insertions(+), 5 deletions(-)
>
> diff --git a/hw/net/cadence_gem.c b/hw/net/cadence_gem.c
> index 526739887c..7ec5dbaa9c 100644
> --- a/hw/net/cadence_gem.c
> +++ b/hw/net/cadence_gem.c
> @@ -909,8 +909,8 @@ static int get_queue_from_screen(CadenceGEMState *s, uint8_t *rxbuf_ptr,
>
>          /* Compare A, B, C */
>          for (j = 0; j < 3; j++) {
> -            uint32_t cr0, cr1, mask, compare;
> -            uint16_t rx_cmp;
> +            uint32_t cr0, cr1, mask, compare, disable_mask;
> +            uint32_t rx_cmp;
>              int offset;
>              int cr_idx = extract32(reg, R_SCREENING_TYPE2_REG0_COMPARE_A_SHIFT + j * 6,
>                                     R_SCREENING_TYPE2_REG0_COMPARE_A_LENGTH);
> @@ -946,9 +946,24 @@ static int get_queue_from_screen(CadenceGEMState *s, uint8_t *rxbuf_ptr,
>                  break;
>              }
>
> -            rx_cmp = rxbuf_ptr[offset] << 8 | rxbuf_ptr[offset];
> -            mask = FIELD_EX32(cr0, TYPE2_COMPARE_0_WORD_0, MASK_VALUE);
> -            compare = FIELD_EX32(cr0, TYPE2_COMPARE_0_WORD_0, COMPARE_VALUE);
> +            disable_mask =
> +                FIELD_EX32(cr1, TYPE2_COMPARE_0_WORD_1, DISABLE_MASK);
> +            if (disable_mask) {
> +                /*
> +                 * If disable_mask is set,
> +                 * mask_value is used as an additional 2 byte Compare Value.
> +                 * To simple, set mask = 0xFFFFFFFF, if disable_maks is set.
> +                 */
> +                rx_cmp = rxbuf_ptr[offset + 3] << 8 | rxbuf_ptr[offset + 2] |\
> +                         rxbuf_ptr[offset + 1] << 8 | rxbuf_ptr[offset];
> +                mask = 0xFFFFFFFF;
> +                compare = cr0;
> +            } else {
> +                rx_cmp = rxbuf_ptr[offset + 1] << 8 | rxbuf_ptr[offset];
> +                mask = FIELD_EX32(cr0, TYPE2_COMPARE_0_WORD_0, MASK_VALUE);
> +                compare =
> +                    FIELD_EX32(cr0, TYPE2_COMPARE_0_WORD_0, COMPARE_VALUE);
> +            }
>
>              if ((rx_cmp & mask) == (compare & mask)) {
>                  matched = true;
> --
> 2.25.1
