Received: by 2002:a17:906:3683:b0:98d:b2f5:1316 with SMTP id a3csp796754ejc;
        Thu, 10 Aug 2023 09:30:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFPvhgmxgCedCseEOBgY8/MnBrGwMc4UWhwEBh4ONgKwMashdnmReFHMOzLvad1gRPdjGzn
X-Received: by 2002:a05:620a:290b:b0:76c:ea00:e5d7 with SMTP id m11-20020a05620a290b00b0076cea00e5d7mr3657097qkp.12.1691685037477;
        Thu, 10 Aug 2023 09:30:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1691685037; cv=none;
        d=google.com; s=arc-20160816;
        b=VmZNCMLlHSe8feiRE2e+qCuXY8CZ7hrCx7kVwEDPVQTkn0IO4fMzwdM2aPC1Fal0q5
         Ao3G9BeS+JZL+2NYWnWHYkb7pshpFXRWJR0HWu06KZOTJXIjlTkYUsfs+4hpJRMBs1oM
         liMWkD5iKKDROpFwDORuwY1jJickEEE3Gcuat2UpqWFFRRt/MP0yRcAwCM2oWdlL33Wb
         um5ypWR8ToTEPaX0/zoZklu0eHhxS7w2tJ+OmOTlgbVkBsFsjDjiy4KBi7bICswcT14z
         GArAt8R3cIPsXtv3I9sGyFtSJyO4gCkas2t7Fp2RJa8dedmXHMv9NzoLLPa4HPA4A3Dq
         GYzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=gA4mnv26ntMrN4AAuQOG1RqRjz7KC9vkxL3VRP9zBNs=;
        fh=2HckukKM1aDIhwR4Gf5EB0R8biZDVGAD3ibhLJ8HTaA=;
        b=ivdsJfG9lWX5vF0Pmf3JY5jeIiDMIpxKkXgyd/I11D96wD8g/41Mfjh1+mnrrqUZo7
         8yJgJ5sngQDqnI1p2HHxUk5VEpHF3SzNai3DStanGAxjW4zLgcy89mBwU2KhiZIKcO75
         mv1syxlllZlO3q5Oo6OzdoAI613xdt0sSASM3Tqom2fRlVwAgHiiVtQC5+2qyZEdhWUP
         bhFsXVI7cNQPy4IBXASsQGAzQgwKC8fH4uSkEsbdqnkh65HnIqrccXO+lrDTGPpGl9Ac
         /L/Ox0WgvYg9G88VhT3oB1rEJ/SmdFUQxvMUj2+qJH3Yq8TpM5WoX84krNz61nkeIw1h
         T4QA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BpkuZhKG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ay15-20020a05620a178f00b0076cb6c9e0a6si1196222qkb.336.2023.08.10.09.30.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 10 Aug 2023 09:30:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BpkuZhKG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qU8Y6-0003Cu-RU; Thu, 10 Aug 2023 12:30:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qU8Y5-0003CK-Gc
 for qemu-arm@nongnu.org; Thu, 10 Aug 2023 12:30:09 -0400
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qU8Y3-0006CE-S9
 for qemu-arm@nongnu.org; Thu, 10 Aug 2023 12:30:09 -0400
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-4fe389d6f19so1679586e87.3
 for <qemu-arm@nongnu.org>; Thu, 10 Aug 2023 09:30:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1691685006; x=1692289806;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=gA4mnv26ntMrN4AAuQOG1RqRjz7KC9vkxL3VRP9zBNs=;
 b=BpkuZhKGU2D0Wl+SLS5EkvYyMoARq0QKbOSQxw1et7RKw8eeIfvLPJ6p60YkgRBGiZ
 hBSP20kUqwmro3UYyr9tqZJA6DiyWMSCKQufn4rSv6Ps+dmU+Oo73F2uOSwjXN05Zv9Q
 FP4PMjGFyEaZGTYrytkyvnOjrhXM92LBfu/MbYaeDpcqBIjYLgfgEm7RsUfdu1l6bIqD
 7TrxyNbC7sZiN3wDWxd6NNkI5NxPO1f7wGoZUxm5UthiJu41nvDXYAjgu3KRb06q2Q++
 rSo7LpSiy0qPpSkQo2ogDTZ5Ge7q5qE/sL3/QhMrFB4gDpIpnBFEPoP3JWTewQ0yKjzC
 8MAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691685006; x=1692289806;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=gA4mnv26ntMrN4AAuQOG1RqRjz7KC9vkxL3VRP9zBNs=;
 b=GOOahUuABhvixzDo5gsMuznagxdQ+CFqo9Y4YbFzSLtJx5P2E3engHR+kF858iyvTq
 ECstJOz/akXF6ArMGQdrnAEhaeE97jsncvyYOVGNWfGksA3VUCUE2nv6jzICNDwo6N7P
 Sv4w/2aNga5iiIaYCSQoZE4DeAIDP2zC+8jeuVApSjjIyefbqqHwikIBRjQZV5qYqcx+
 qc2V9qfXPh9yrbeXjsy8AG6B48+jaiTe7+fqYzjG77wH6YwBzV/QY++d2y+8mr32FQz4
 I0PXBGzlhN15l4jH+uqDo7YmvP2Uar6VkKXruN5mxmy2aL0BchR4pqOH+gjhnpReNqvH
 xduQ==
X-Gm-Message-State: AOJu0YwFfbrCWQaBmRER0QS4cw+P52WdxRAx1ASZCL1KKb3gzVOAOP4S
 0CI1cXM/6SXHyajJ/zCimmJ/v6n7hdlFRWHGoYNtVw==
X-Received: by 2002:a05:6512:4896:b0:4fc:dcff:773b with SMTP id
 eq22-20020a056512489600b004fcdcff773bmr2158763lfb.3.1691685005905; Thu, 10
 Aug 2023 09:30:05 -0700 (PDT)
MIME-Version: 1.0
References: <20230808031143.50925-1-richard.henderson@linaro.org>
 <20230808031143.50925-9-richard.henderson@linaro.org>
In-Reply-To: <20230808031143.50925-9-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 10 Aug 2023 17:29:54 +0100
Message-ID: <CAFEAcA_f9CRaFzEc8-aA3Wgy7hY2KmcHjsijXA5v+3jMRd+R1w@mail.gmail.com>
Subject: Re: [PATCH 08/24] target/sparc: Use tcg_gen_movcond_i64 in gen_edge
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org, 
 qemu-riscv@nongnu.org, qemu-s390x@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::133;
 envelope-from=peter.maydell@linaro.org; helo=mail-lf1-x133.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51 autolearn=no autolearn_force=no
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
X-TUID: dO9AVPGH45T5

On Tue, 8 Aug 2023 at 04:14, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> The setcond + neg + or sequence is a complex method of
> performing a conditional move.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/sparc/translate.c | 17 ++++-------------
>  1 file changed, 4 insertions(+), 13 deletions(-)
>
> diff --git a/target/sparc/translate.c b/target/sparc/translate.c
> index bd877a5e4a..fa80a91161 100644
> --- a/target/sparc/translate.c
> +++ b/target/sparc/translate.c
> @@ -2916,7 +2916,7 @@ static void gen_edge(DisasContext *dc, TCGv dst, TCGv s1, TCGv s2,
>
>      tcg_gen_shr_tl(lo1, tcg_constant_tl(tabl), lo1);
>      tcg_gen_shr_tl(lo2, tcg_constant_tl(tabr), lo2);
> -    tcg_gen_andi_tl(dst, lo1, omask);
> +    tcg_gen_andi_tl(lo1, lo1, omask);
>      tcg_gen_andi_tl(lo2, lo2, omask);
>
>      amask = -8;
> @@ -2926,18 +2926,9 @@ static void gen_edge(DisasContext *dc, TCGv dst, TCGv s1, TCGv s2,
>      tcg_gen_andi_tl(s1, s1, amask);
>      tcg_gen_andi_tl(s2, s2, amask);
>
> -    /* We want to compute
> -        dst = (s1 == s2 ? lo1 : lo1 & lo2).
> -       We've already done dst = lo1, so this reduces to
> -        dst &= (s1 == s2 ? -1 : lo2)
> -       Which we perform by
> -        lo2 |= -(s1 == s2)
> -        dst &= lo2
> -    */
> -    tcg_gen_setcond_tl(TCG_COND_EQ, lo1, s1, s2);
> -    tcg_gen_neg_tl(lo1, lo1);
> -    tcg_gen_or_tl(lo2, lo2, lo1);
> -    tcg_gen_and_tl(dst, dst, lo2);
> +    /* Compute dst = (s1 == s2 ? lo1 : lo1 & lo2). */
> +    tcg_gen_and_tl(lo2, lo2, lo1);
> +    tcg_gen_movcond_tl(TCG_COND_EQ, dst, s1, s2, lo1, lo2);
>  }

I'm glad I didn't have to figure out exactly what this
exciting instruction actually does to review this :-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
