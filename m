Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp485536lfq;
        Thu, 7 Jan 2021 09:44:17 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwFjcLCcC+jKBFSQoCqgQzMHgeMjmzqcDnbqBLjZ3WcBFKrhLHK+N+0AiL7FolFhZYQeFof
X-Received: by 2002:a5b:78d:: with SMTP id b13mr14669492ybq.123.1610041457812;
        Thu, 07 Jan 2021 09:44:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1610041457; cv=none;
        d=google.com; s=arc-20160816;
        b=CAwmWvHGdHkEMHQzV9TX+ydJ4FzJUuX71b6Vg7aJgVHI9u8fMG0DEj+CmBQ4AM5X94
         u0lUq2MV1ta1FQhRundU7m6GOf4F6ols/kvf23/Chpcg7OD2BTpLARbNLCZDsou2iT/Y
         lXSz2Zp++cW9BBmSdqUzcjG1T/1N22bMTx3Fos5xZPETdI1faHzyaJZtqP9cFN8hKLzl
         3kUOPaAxXQ7P4yrDRtBSyyxQ5Zd3B2HTTyPVDgE4qCqjrHKwuP/oNfmVI/aQKLphDez/
         tqlf0Ul7sH6OgHLnmR4CTCdZrbph7xMOARnehhCqn5onUA+VOCpyEBMUBxSYR0kyhsdT
         1dBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=srY4sloYL3cPGVkeYpWQV/O1Ofps9sp0I6HDWtlGXcc=;
        b=ErGYxsldx5s53ZbC48ElQMzEa8/8S/77oCC+f1L9/C3CbM6LC1Mg6fN2swM8uT4EPB
         yUzzhzgC1I65BxVUNtrJwM1XPy86tNdd/FsmDpderWOaw3tbUpRyGUtub43SijFIFyzB
         QFNpSAUVR17Sl4u+3HhIJVn4pa+GncSMghWqYRKicpeTQ+Iej5d0+tvXYzntk4nMKCjM
         OcPYRGQ9WWI0BYADLKxNF5MdcKjKheUw3J/YTCZguVjvk4doo/4UOOvO5/6a2zDRDxUf
         YaVxxHtgUbYNeKsob1+Y0tmmS6IJdTFoblT5SegQb111q3puPoAlBZMHnH1SZN1oTibD
         nZKg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=LICvEyFq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x16si6101266ybj.21.2021.01.07.09.44.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 07 Jan 2021 09:44:17 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=LICvEyFq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42698 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kxZKb-0001G1-6v
	for alex.bennee@linaro.org; Thu, 07 Jan 2021 12:44:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58702)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kxZG7-0004mt-Bu
 for qemu-arm@nongnu.org; Thu, 07 Jan 2021 12:39:40 -0500
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634]:33989)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kxZG5-0003GO-0z
 for qemu-arm@nongnu.org; Thu, 07 Jan 2021 12:39:39 -0500
Received: by mail-ej1-x634.google.com with SMTP id g20so10918143ejb.1
 for <qemu-arm@nongnu.org>; Thu, 07 Jan 2021 09:39:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=srY4sloYL3cPGVkeYpWQV/O1Ofps9sp0I6HDWtlGXcc=;
 b=LICvEyFqiaZwHQ9R2roughkIhHn7GpvWoeDji5H252g2VhtbIPOCe4YJnF3HXQdl75
 NOJIReNZL49epSb3xDephCZ2yIMi2qhUgkx5NkpjwS6sc6JT0JEl5grjZy7hLEeegyo8
 5CZgUiBZ5ByhTYYPYS269Bxaa2MYAcsKO3oukH7LLSt216hREYkOl58BwE3B7H103yzo
 zz8MZbhXpZf+VrfLO+NEeZhd0VyN9Z757AV5TvgDl60PAeOeqp3YiHbczMX0YafiPQUj
 k1Az6OA8ab+UWUZKKWTlB1rxCo63ZTp/X/z5GTEewAkPPXEz3s3vPZiQ9FY4Q2Y8ek/S
 Uvww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=srY4sloYL3cPGVkeYpWQV/O1Ofps9sp0I6HDWtlGXcc=;
 b=sM/PXpYbtgfHiKjuxdi/pe8HYM1wGyNWm7tYK5gXJgvFnt/m39GEo1YNHiew7Q6kq9
 fCRSdi7Dp1QYFbhcmfuB1rvnk772czFqtqVUnzdsbotxrBh1QKhIGRXcC7UPu1Ls4Ry+
 G4+lQbWQyRzCusq+fZSreaUaPnbhSS1z13ObxYDGm+uq+HKMxd45NuQsyS5mmfrLfc6Q
 0Xg2KlKIu5El+ndWv/gKIwjaUv1vAUEjv9eTkEPiX1Yydiym4Jzesw7+lsFwwxWtzSXC
 /ZKLD2glhgYgsn2RpTJwqEB2AnsKzB/BhihYZKmRK2MsrC0eOZ5axdwjWUeHj6jqu5fC
 YL5w==
X-Gm-Message-State: AOAM531zLgsGVuKawW4tohTki4afgVj7uDsufzRN/xfKx8dwg4njNPh2
 GJZCbFg6lmRQ5ieWH5ZuZrXYMAZJqr11tPOuhC0MMg==
X-Received: by 2002:a17:906:195a:: with SMTP id
 b26mr6972262eje.4.1610041175734; 
 Thu, 07 Jan 2021 09:39:35 -0800 (PST)
MIME-Version: 1.0
References: <20201208180118.157911-1-richard.henderson@linaro.org>
 <20201208180118.157911-25-richard.henderson@linaro.org>
In-Reply-To: <20201208180118.157911-25-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 7 Jan 2021 17:39:24 +0000
Message-ID: <CAFEAcA97CfTvAJkSHEYtEKrg9jZjCLTbra-KFxfYZVuCH7MMkA@mail.gmail.com>
Subject: Re: [PATCH v2 24/24] target/arm: Enforce alignment for sve
 unpredicated LDR/STR
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x634.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: UYWrmlk72k/m

On Tue, 8 Dec 2020 at 18:02, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate-sve.c | 58 +++++++++++++++++++++++++++++---------
>  1 file changed, 45 insertions(+), 13 deletions(-)
>
> diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
> index 6125e734af..b481e97428 100644
> --- a/target/arm/translate-sve.c
> +++ b/target/arm/translate-sve.c
> @@ -4263,7 +4263,8 @@ static bool trans_UCVTF_dd(DisasContext *s, arg_rpr_esz *a)
>   * The load should begin at the address Rn + IMM.
>   */
>
> -static void do_ldr(DisasContext *s, uint32_t vofs, int len, int rn, int imm)
> +static void do_ldr(DisasContext *s, uint32_t vofs, int len,
> +                   MemOp align, int rn, int imm)
>  {
>      int len_align = QEMU_ALIGN_DOWN(len, 8);
>      int len_remain = len % 8;
> @@ -4276,6 +4277,10 @@ static void do_ldr(DisasContext *s, uint32_t vofs, int len, int rn, int imm)
>      clean_addr = gen_mte_checkN(s, dirty_addr, false, rn != 31, len, MO_8);
>      tcg_temp_free_i64(dirty_addr);
>
> +    if (!s->align_mem) {
> +        align = 0;
> +    }
> +
>      /*
>       * Note that unpredicated load/store of vector/predicate registers
>       * are defined as a stream of bytes, which equates to little-endian
> @@ -4288,7 +4293,8 @@ static void do_ldr(DisasContext *s, uint32_t vofs, int len, int rn, int imm)
>
>          t0 = tcg_temp_new_i64();
>          for (i = 0; i < len_align; i += 8) {
> -            tcg_gen_qemu_ld_i64(t0, clean_addr, midx, MO_LEQ);
> +            tcg_gen_qemu_ld_i64(t0, clean_addr, midx, MO_LEQ | align);
> +            align = 0;
>              tcg_gen_st_i64(t0, cpu_env, vofs + i);
>              tcg_gen_addi_i64(clean_addr, clean_addr, 8);
>          }
> @@ -4302,6 +4308,16 @@ static void do_ldr(DisasContext *s, uint32_t vofs, int len, int rn, int imm)
>          clean_addr = new_tmp_a64_local(s);
>          tcg_gen_mov_i64(clean_addr, t0);
>
> +        if (align > MO_ALIGN_8) {
> +            t0 = tcg_temp_new_i64();
> +            tcg_gen_qemu_ld_i64(t0, clean_addr, midx, MO_LEQ | align);
> +            tcg_gen_addi_i64(clean_addr, clean_addr, 8);
> +            tcg_gen_addi_ptr(i, i, 8);
> +            tcg_gen_st_i64(t0, cpu_env, vofs);
> +            tcg_temp_free_i64(t0);
> +            align = 0;
> +        }
> +

Why do we need to do this (and the similar thing in do_str()) ?
Most of the rest of the patch is fairly clear in that it is just
passing the alignment requirement through to the load/store fns,
but this is a bit more opaque to me...

thanks
-- PMM
