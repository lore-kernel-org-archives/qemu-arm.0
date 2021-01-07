Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp408772lfq;
        Thu, 7 Jan 2021 08:01:25 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxUUwUzfuFylYYeYmXrb9c+aAAjweK5Bw4tGLeE2Re0IgM7iKf8ww7YNLAkMN0aNvROjQq0
X-Received: by 2002:a25:40d1:: with SMTP id n200mr13601308yba.266.1610035285402;
        Thu, 07 Jan 2021 08:01:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1610035285; cv=none;
        d=google.com; s=arc-20160816;
        b=glvOPzQtRhRI1pzjVWAtI4eYgoJHItSJZNTwTEXOC0mg5I/bNgxsKP9ZoZfo7fI4jR
         GwtxX7nkqMN5bSzquNZvXXG0Dp6lczaNBaprAUyBQAvt/q/w7nNFpBh+NSbQLYXQJSRU
         QyWfZ3aT5Upx92SLT+TqXlMG4XGlL6Wto3ZXo08Zo8Pn2LmUSU0Td+eAWyGFoJpIZRFL
         ULgzGGNy39BjppeQWN0lHMtUbVajsHQ46sorVws9ef40rMp2LDfbjMxVKEcK9RrdKq/w
         GWnX15o5JicUe14wt9tfiTc6kTuS+xWxNHyVCUvvVSFbR2LVncbzNgFdoTjXgYgQceIe
         5WWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nm2Ima4bp1U3JjhBWCY7piiq4gwIFTGYdxuTBWUSwxA=;
        b=0r6lXB8hHGbcWAJ1QkmlQqUsg2XAor23MOymtVThXgmwH1awTUd55vpuyyo+0zXTHU
         BRh59vY48DUaBzyIL9W8/bbIgr/wXywP4Wl+Ftg8jpZ6Bo6+Y9TY4myBoyJJkpMDK6Ha
         JL8VJxxLlHvQx9x7lzE9D7IPPaEa2xsAZIaemcwBHtU3BoYChYA4ixe4d+zzLIOOmjU2
         jdfAS2JwYVgJ0ZGv+cNqH123V6fqFzm/B2EkIvAlVyZIqbDCZGWBIqZzveeFLTtTkuiz
         kGX9B4gAtFdjH87PCpKMG1kz5ZgGpuA5H96JMlTiG7gc9FaztEFURThYzetafx52wv88
         gytg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=n5PRIhTc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p187si7080890yba.163.2021.01.07.08.01.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 07 Jan 2021 08:01:25 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=n5PRIhTc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53324 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kxXj2-0007eQ-Bc
	for alex.bennee@linaro.org; Thu, 07 Jan 2021 11:01:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54322)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kxXiO-0007de-BY
 for qemu-arm@nongnu.org; Thu, 07 Jan 2021 11:00:45 -0500
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531]:37182)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kxXiM-0006SX-1e
 for qemu-arm@nongnu.org; Thu, 07 Jan 2021 11:00:44 -0500
Received: by mail-ed1-x531.google.com with SMTP id cm17so8249343edb.4
 for <qemu-arm@nongnu.org>; Thu, 07 Jan 2021 08:00:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nm2Ima4bp1U3JjhBWCY7piiq4gwIFTGYdxuTBWUSwxA=;
 b=n5PRIhTcIdazsXZIWOfUu5lS9yaMmgrFRwCnxoqdZIuwe9IvpHrFjhAhibqkzJFYeD
 4FOGoPo6ct+qSyvaBQMzAR68yVE7ker2rWREGjsU6dMqqeKGs60mwx6aRgjOYOJiQNzo
 jp+JEAuSfYrUw6rUbyZKOV937XweNjvcVZt54rbe101Qkaa+asEB+OD7P1oAUjLNfItQ
 Z+vI7lMiHoruwmio6r0WRnRn6SXKhtZBVxBXk9jpd2y18WpsV8JkDnXXnKcO1OkAyK43
 AOykowSSrEeCDPXdnyPpw2kGf/mj05sD7dlTauRxyrtZl7r0Ft06v5uY7rle7WGoWBwu
 IMvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nm2Ima4bp1U3JjhBWCY7piiq4gwIFTGYdxuTBWUSwxA=;
 b=Fpnxud+2cqLqtkG4fvrQ4BhYekk0pUPJIPrw0aLikIzdjtsxWKd1cSjTNSI2viCLVq
 XiTK8osh0iyJpyFE0acbDEVpXeVRjd2goPZUDp0V75PT/AlKLosEYJPZ2eofrfytB5+/
 GxVgV8X6zCW6r5rd/cgGILLuh77gkVB4Xtqt/I9yKkeT8mFJOk/+iUdBWxofuZH+Lwja
 25WtGOcvfZlF/O7vTtaPsXvB5cZJ+wQnAAGiUs5VEQ1Z+pTbj0KkbcPr3OeEq64SIm3x
 oB2pEW0+lV8PT2bB+8wHxg/Tg05TywLPRSUaP2W3XaWro4ODxcstGaOH+ltw6PpaiEbM
 Ntbg==
X-Gm-Message-State: AOAM531SoXN0w3Svtn+Zs5V5D7rXN9ZRbS0UpPluEpWWibqc1rXHirx9
 EsfmhOrOduhwQDX6hgccR4X2kwDG4ncQYki/1bVUcQ==
X-Received: by 2002:aa7:cdc3:: with SMTP id h3mr2139042edw.52.1610035239948;
 Thu, 07 Jan 2021 08:00:39 -0800 (PST)
MIME-Version: 1.0
References: <20201208180118.157911-1-richard.henderson@linaro.org>
 <20201208180118.157911-6-richard.henderson@linaro.org>
In-Reply-To: <20201208180118.157911-6-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 7 Jan 2021 16:00:28 +0000
Message-ID: <CAFEAcA9sT4JdPWkojp0r6yazJc5vbmzWHwnkMtChTQ1aZ2uugQ@mail.gmail.com>
Subject: Re: [PATCH v2 05/24] target/arm: Fix SCTLR_B test for TCGv_i64
 load/store
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x531.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: yz8QuFXA9dcf

On Tue, 8 Dec 2020 at 18:01, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Just because operating on a TCGv_i64 temporary does not
> mean that we're performing a 64-bit operation.  Restrict
> the frobbing to actual 64-bit operations.

If I understand correctly, this patch isn't actually a behaviour
change because at this point the only users of gen_aa32_ld_i64()
and gen_aa32_st_i64() are in fact performing 64-bit operations
so the (opc & MO_SIZE) == MO_64 test is always true. (Presumably
subsequent patches are going to add uses of these functions that
want to load smaller sizes?) If that's right, worth mentioning
explicitly in the commit message, I think.

> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/target/arm/translate.c b/target/arm/translate.c
> index f35d376341..ef9192cf6b 100644
> --- a/target/arm/translate.c
> +++ b/target/arm/translate.c
> @@ -949,7 +949,7 @@ static void gen_aa32_ld_i64(DisasContext *s, TCGv_i64 val, TCGv_i32 a32,
>      tcg_gen_qemu_ld_i64(val, addr, index, opc);
>
>      /* Not needed for user-mode BE32, where we use MO_BE instead.  */
> -    if (!IS_USER_ONLY && s->sctlr_b) {
> +    if (!IS_USER_ONLY && s->sctlr_b && (opc & MO_SIZE) == MO_64) {
>          tcg_gen_rotri_i64(val, val, 32);
>      }
>
> @@ -968,7 +968,7 @@ static void gen_aa32_st_i64(DisasContext *s, TCGv_i64 val, TCGv_i32 a32,
>      TCGv addr = gen_aa32_addr(s, a32, opc);
>
>      /* Not needed for user-mode BE32, where we use MO_BE instead.  */
> -    if (!IS_USER_ONLY && s->sctlr_b) {
> +    if (!IS_USER_ONLY && s->sctlr_b && (opc & MO_SIZE) == MO_64) {
>          TCGv_i64 tmp = tcg_temp_new_i64();
>          tcg_gen_rotri_i64(tmp, val, 32);
>          tcg_gen_qemu_st_i64(tmp, addr, index, opc);

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
