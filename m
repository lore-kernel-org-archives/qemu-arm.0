Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp914127njb;
        Fri, 6 Dec 2024 07:09:49 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWoL9b+intyO0XKqTAaFm6vPMhywHoicVjxxlWtDVdLFEBCs1K3GPKWcuDJzswyC+0HzIwZnfxiQ2mpyQ==@linaro.org
X-Google-Smtp-Source: AGHT+IGxntH8bvn2x+Q2YV1Y6Y5YzBm4RGl55u0m1da9jWw7nSWH8/MJ9n3EaNlfGnWMXBe1GV7I
X-Received: by 2002:ad4:5c6f:0:b0:6d1:9f29:2e3b with SMTP id 6a1803df08f44-6d8e7158202mr43081506d6.13.1733497788975;
        Fri, 06 Dec 2024 07:09:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733497788; cv=none;
        d=google.com; s=arc-20240605;
        b=e/y9NrKz8ieOKh52h9uRltJWcFbXVqtHkXQOTpQ32q/SB64hyvFr47uj1atr7YslYR
         k1oTWQJB8R8+p6lOzZh5pKKnfkbo3MulYgidO1d2JNpRkSYn44fH0Xyh0tuIdv0wyiQU
         xvgpyErxEdi6fLQa7xWJAFuk9wqXGaqaGtx3YKcn5zJa6gYO5MzPsZXJK6f+eJNZGQJz
         nr1ld4rDnRI0uvArrZjinHoTA7hUt6IxA7z5cwGpeX4SaV6bMz1nMyLiZ0puYn4N9POf
         DKrUEIthD5ClnzkBjm+vC8zWAZbKwrRHjOE/vlup9IeNBykMtVO6rk/WwT4nvA1pp3SZ
         8xKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=eWBNnwwJIZ9zXOw86qobcAK4LqqYdzRS/2lMDjVOplA=;
        fh=5InpClpgvDduQIQUusLOsUJjjsujzDU+uc5wfpN9F6k=;
        b=kcC6BXwDV7VIInsCaL0StogCmIviZrMZg/HMCyH/4cXZPI3u/7pxoCZb7pQWIH0Iu8
         Wrq4tqTYL28bbvf9nHymst7rsVZfYmG1FHwJMo2911CDm7j5TexPFbD6TMSHQXOT6aQN
         iurp5QKQxB4Qcpf3WyIf4tx8KJIDKeMor/YnzU+jiXijT49UqLuMj8BsDdnRjKXel2g7
         fg6iM0CpJOSkK7kPMH/FdgCNHbCPcWqUBBSQk3rI9bz4r6jKpDctk+l0fG+P6rEHPWVc
         xrdq5bcK4QmF6WDL9nIy4jneC2CdPRCCkJZkepYOmezp6d5AqAG7K8NsCY8poIsAz1qI
         OMcg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vbr1KQwP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6d8dbab1f95si42766366d6.449.2024.12.06.07.09.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 06 Dec 2024 07:09:48 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vbr1KQwP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tJZxW-0004sM-7c; Fri, 06 Dec 2024 10:09:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tJZxU-0004s3-NL
 for qemu-arm@nongnu.org; Fri, 06 Dec 2024 10:09:32 -0500
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tJZxT-0002cS-43
 for qemu-arm@nongnu.org; Fri, 06 Dec 2024 10:09:32 -0500
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-2f7657f9f62so21322271fa.3
 for <qemu-arm@nongnu.org>; Fri, 06 Dec 2024 07:09:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733497769; x=1734102569; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=eWBNnwwJIZ9zXOw86qobcAK4LqqYdzRS/2lMDjVOplA=;
 b=vbr1KQwPas4iH6GN2Jl0m6uAqh5wXTzThqCHawjAUZxWhucdaMciPh1GRz7YOO42BW
 a0Ax1lkB+OCenk9ZpLdMKOZqJ28vuyuTszv53ROP0bB7JtswrXiXx+hUUFmEnI7Hqrsf
 KSfWB5r/+v3mggKmL2I5BgGL/TRxziO8MYoNGFJEaS9H1xno45COCiCVjd49m5FZJ92c
 pO6dhZSk5NmTTwtdeRTbTc2q8+FeQ2P2FV++Z8YvOmp1LsWPsgyiGYeDOeXxhEplLlco
 1hSq7rBnYQFkf64fLQ4r/I0FHxsBFMDXdy8EhNQfywFhYcpHLiy0+fxfTcb7yRJe+34Q
 2bhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733497769; x=1734102569;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=eWBNnwwJIZ9zXOw86qobcAK4LqqYdzRS/2lMDjVOplA=;
 b=rrhEBcBM81i+i+2ZR/rHvR8Z4UZwUHtwuQvBT+Ew0V5gDvrr5iJrGWVqSdDIwsInRa
 AukUFYylz6ucSesb3ltaC43RwWOm0CMwivjlBiW1EzxcK9TTFWBpIyHTrBLFg3JWttuk
 xuDxnTYvqBP+HU1h7h5iDnu5UnbDcOOKzz0VU1dgPJyBZQO2d6rqbzeA/2zVVSb1vxd4
 wjpQMoNSZ/fRUZB7MnvVRULfGXDsyQpRnLH0iCA9y91zY4RYBi4xXj4o2nvjoTN4sTU9
 g5X3onO70chpH+vox/ZMBiFP3e8wsjQMn7291zeDkWLjuZ0r71alW/SoM8d7kQE5Y9HN
 8/Nw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWWqxi35unW0TYgCeAmuyi9iuwgF+ut89SWozzo9xnm70VPUjqjRIahXJrtUEjT4A4mnLBUaOow4g==@nongnu.org
X-Gm-Message-State: AOJu0YzrQV10qykf6HmbImjKQ6RoKwPQyZ2xtisli8iToRyaP6f/qYap
 ByufXJw0faClJk+DvpDI1IyD9LCg2FGsxkfAHsObaOHwNucre4LFUlDlP/vo5gLhaSaEkcDfX0B
 OIYP0JT3SAMzu6PIJH1uopUJoHtGG7X9uLH4Z8Kkvu6HLJg7X
X-Gm-Gg: ASbGncs0Bv229IVownE/VqP9Am0cq/FLuQat5/mffqvu095zTjmSks8JznK/c01XUl1
 RZYEPkSOYMi4MROwVeyKad+ykS2cM3Ivh
X-Received: by 2002:a2e:a990:0:b0:2fb:8777:7359 with SMTP id
 38308e7fff4ca-3002fcf2245mr20007461fa.39.1733497769250; Fri, 06 Dec 2024
 07:09:29 -0800 (PST)
MIME-Version: 1.0
References: <20241201150607.12812-1-richard.henderson@linaro.org>
 <20241201150607.12812-42-richard.henderson@linaro.org>
In-Reply-To: <20241201150607.12812-42-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 6 Dec 2024 15:09:18 +0000
Message-ID: <CAFEAcA9oiKzQyc-bBUeSYPAZ2Fh9dUaG+=cFJ56m=oqJ1dwzyg@mail.gmail.com>
Subject: Re: [PATCH 41/67] target/arm: Introduce gen_gvec_rev{16,32,64}
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::232;
 envelope-from=peter.maydell@linaro.org; helo=mail-lj1-x232.google.com
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
X-TUID: 1V5yfJJO8AH0

On Sun, 1 Dec 2024 at 15:20, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/tcg/translate.h      |  6 +++
>  target/arm/tcg/gengvec.c        | 58 ++++++++++++++++++++++
>  target/arm/tcg/translate-neon.c | 88 +++++++--------------------------
>  3 files changed, 81 insertions(+), 71 deletions(-)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
