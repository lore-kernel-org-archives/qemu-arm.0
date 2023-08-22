Received: by 2002:a17:906:80c9:b0:9a1:ac8c:26bb with SMTP id a9csp721408ejx;
        Tue, 22 Aug 2023 06:28:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF3P9OMf76psrDZMORuMLWcYojOHmTgunhmJPE1QB/uh2ohCwa2U7TA4P2ymTjyjYc+I+Cw
X-Received: by 2002:a1f:49c2:0:b0:48d:f41:ef7f with SMTP id w185-20020a1f49c2000000b0048d0f41ef7fmr5928607vka.6.1692710885421;
        Tue, 22 Aug 2023 06:28:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1692710885; cv=none;
        d=google.com; s=arc-20160816;
        b=zHBNN3LBIor/+VEjgc3DrzKRbLwAooWAnNpMP0yPrb6Lnm+ruNJz2L/Vaypq3j0ULR
         WSoCTA0nVfptbFIpmMrF7SytQzNUQl5M5Tp7apaX3mShdUtAB51bPbkJpqrpAvhB4hY7
         +eLiknAXFRRABUIGLfpcPUdfv9bxsBKkZeHYuiLb01EFzsKRmZ3UodKq9wrqfvGGjU/v
         3Hm1F+koWm8QdrLs3w4g67lKKy86KGQ3eVTB/rFdGmXvrvr1+j0lNczPj9uhw85GvlBS
         mySC4Cn1l7cuVUcdxB9EinTmqSTzuZlJna/uyehSviruJhFZKRV5goj+/POcvOC3D1OS
         zvoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=ozuFv8lCpy0mpEsPtSSvgbJVAb/9yHPf0N0cz/ES51c=;
        fh=6Ds7o63ZJ3VvX6zJi5DiCgvkv3HzKuY0m8SSoYnV1mM=;
        b=Z7YhV2GXbk08XRx7cbtVoKIc/0KM+JAuM+hUH0ZFQaGUs8tyziscibrZasCQjKy5d6
         pnoRwzjgdZ4txrASqtojw1JmqCAQyO4GpPuAr59H6oMqn4M7DSNRHv1AZPzAfz6QDcBu
         QPMJE/WmwDyT8ryAcm1QAD1fP51n5BzuWQmupwV80MyBXIJtRZ7+YlY43ag64Ir1C9Fi
         anXtNgNbdaDGCDmCY8BgUgFHu5/PsEZWDK5jbfR/BCHYxbXkLWPDUYY5rFu8PZnLRRkg
         vyn6gI4uF3o0sGnZm8jcgcqiWfx9yPTHiXJQ0t93+iYYUyPuvoC9RtHkUut+b0Ax66PH
         u7IA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="UUrC/xxC";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f12-20020ac87f0c000000b0040357498dfdsi6189112qtk.24.2023.08.22.06.28.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 22 Aug 2023 06:28:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="UUrC/xxC";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qYRQC-0006Od-JO; Tue, 22 Aug 2023 09:27:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qYRQA-0006Gu-JW
 for qemu-arm@nongnu.org; Tue, 22 Aug 2023 09:27:46 -0400
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qYRQ6-0003rc-Ls
 for qemu-arm@nongnu.org; Tue, 22 Aug 2023 09:27:46 -0400
Received: by mail-lj1-x22e.google.com with SMTP id
 38308e7fff4ca-2bcd7a207f7so1438761fa.3
 for <qemu-arm@nongnu.org>; Tue, 22 Aug 2023 06:27:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1692710860; x=1693315660;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ozuFv8lCpy0mpEsPtSSvgbJVAb/9yHPf0N0cz/ES51c=;
 b=UUrC/xxCCPm9U9Ld1yAZwZJRupcTvSxYfOazlG4SZzW+EARBzjqDVbg3y23JyhLE7/
 rIu9scH6CSPauHK6rfoK5Hg+M4T1wsmSP0tpCtbvWathe+Wr8M0twjUM/AyN/WXWnh2x
 0kNfP90O+ydOSVh1q41w4jimLzTL+mC58JOqmXjySnxz8RsX3VPrLcGMuvyw65xkhed1
 SC4OdZXYfQuy9KKWEPhA+j92ki8Ndve4RyT8qbiVWIDxnEFf3UWC4JFmmaTerBO9+IyD
 eMSdlvMgMb3q6q1QW6xWvrRMo4i370oBOJaMm8csYdKNam1pUGDx+Ks4ZfesF16ZLK1i
 1haw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692710860; x=1693315660;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ozuFv8lCpy0mpEsPtSSvgbJVAb/9yHPf0N0cz/ES51c=;
 b=khQHSkfUjl460ERqjqNXd44rKBUsEjwwMgyRDhQGb9jM9Og7wngkwdIUNvvlRwnpNY
 aFsQXudnAPFTjJoKs3d6U9xXLSs9mnBqOhzX9nEQB27Hy6G2oo2hIM2C4G3ISMYaW+vT
 wwQe9ciwdSainjvEnAjQlFliayix2yK69NKj4/iz3o7aaMlnh1PoamMnFZaS+/X7eiHJ
 0FMbj9CpwH4UIbk1cKehie/4cI25Zuek2FB+oYBwO0IDLs3WR8z5EQK9lbhuPXsRLC5E
 yRrb+tni6CDL+cnxnoRxGnOVPXCYXxeNy8JnPw5o9gG6DRcfWptWNh+flJEkNJNw1bPO
 YaiA==
X-Gm-Message-State: AOJu0YxWP4MjRBckoYfll5bm5B1pDy1YJVWuONGXusfpAaTGKUc8OnzJ
 vHhNiI6VHi1BD06X1EkEc5jJuw==
X-Received: by 2002:a2e:4952:0:b0:2b8:39e4:2e2c with SMTP id
 b18-20020a2e4952000000b002b839e42e2cmr6696000ljd.1.1692710860254; 
 Tue, 22 Aug 2023 06:27:40 -0700 (PDT)
Received: from [10.2.0.2] ([37.19.214.4]) by smtp.gmail.com with ESMTPSA id
 h13-20020a05600c260d00b003fefd46df47sm846555wma.29.2023.08.22.06.27.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Aug 2023 06:27:39 -0700 (PDT)
Message-ID: <072819ba-18d9-ef0a-ed23-0d08c2536299@linaro.org>
Date: Tue, 22 Aug 2023 15:27:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.14.0
Subject: Re: [PATCH 03/12] target/cris: Use generic hrev32_i32() in SWAPB
 opcode
Content-Language: en-US
To: qemu-devel@nongnu.org
Cc: Song Gao <gaosong@loongson.cn>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz
 <groug@kaod.org>, Aurelien Jarno <aurelien@aurel32.net>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-ppc@nongnu.org,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, =?UTF-8?Q?C=c3=a9dric_Le_Goater?=
 <clg@kaod.org>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Nicholas Piggin <npiggin@gmail.com>, Xiaojuan Yang
 <yangxiaojuan@loongson.cn>, qemu-arm@nongnu.org
References: <20230822124042.54739-1-philmd@linaro.org>
 <20230822124042.54739-4-philmd@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230822124042.54739-4-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::22e;
 envelope-from=philmd@linaro.org; helo=mail-lj1-x22e.google.com
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.767,
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
X-TUID: LL38kXTQ7ExG

On 22/8/23 14:40, Philippe Mathieu-Daudé wrote:
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   target/cris/translate.c         | 20 +-------------------
>   target/cris/translate_v10.c.inc |  2 +-
>   2 files changed, 2 insertions(+), 20 deletions(-)
> 
> diff --git a/target/cris/translate.c b/target/cris/translate.c
> index 925ed2c6f6..00bbe6c645 100644
> --- a/target/cris/translate.c
> +++ b/target/cris/translate.c
> @@ -381,24 +381,6 @@ static inline void t_gen_subx_carry(DisasContext *dc, TCGv d)
>       }
>   }
>   
> -/* Swap the two bytes within each half word of the s operand.
> -   T0 = ((T0 << 8) & 0xff00ff00) | ((T0 >> 8) & 0x00ff00ff)  */
> -static inline void t_gen_swapb(TCGv d, TCGv s)
> -{
> -    TCGv t, org_s;
> -
> -    t = tcg_temp_new();
> -    org_s = tcg_temp_new();
> -
> -    /* d and s may refer to the same object.  */
> -    tcg_gen_mov_tl(org_s, s);
> -    tcg_gen_shli_tl(t, org_s, 8);
> -    tcg_gen_andi_tl(d, t, 0xff00ff00);
> -    tcg_gen_shri_tl(t, org_s, 8);
> -    tcg_gen_andi_tl(t, t, 0x00ff00ff);
> -    tcg_gen_or_tl(d, d, t);
> -}
> -
>   /*
>    * Reverse the bits within each byte.
>    *
> @@ -1666,7 +1648,7 @@ static int dec_swap_r(CPUCRISState *env, DisasContext *dc)
>           tcg_gen_hswap_i32(t0, t0);
>       }
>       if (dc->op2 & 2) {
> -        t_gen_swapb(t0, t0);
> +        tcg_gen_hrev32_i32(t0, t0);

Here we should use tcg_gen_hrev32_tl (added later in this series).

>       }

