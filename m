Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 148C2CD4F54
	for <qemu-arm@archiver.kernel.org>; Thu, 28 May 2026 13:57:47 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wSbEq-0003ae-Pb; Thu, 28 May 2026 09:57:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wSbEn-0003aI-UL
 for qemu-arm@nongnu.org; Thu, 28 May 2026 09:57:30 -0400
Received: from mail-yw1-x112b.google.com ([2607:f8b0:4864:20::112b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wSbEl-0006Mg-9s
 for qemu-arm@nongnu.org; Thu, 28 May 2026 09:57:29 -0400
Received: by mail-yw1-x112b.google.com with SMTP id
 00721157ae682-7c307937816so120123487b3.0
 for <qemu-arm@nongnu.org>; Thu, 28 May 2026 06:57:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779976646; cv=none;
 d=google.com; s=arc-20240605;
 b=i65bnWUwLAbeePBSifAjpTA0ECZxmmuG+4WokICcqjMmI1bEVcyVppXVPsK6J6gPKk
 B90x+fnRwoG7DGnpUKTvUpPWVkoxHJ/uhBLZD9m8g0JFMF2c+asxCmDmfHPuwvslg3Pi
 n8O+nZ0R2xjYUnJY17/MMDUbxbWox25li432gM/U7KRPEHXU/JKLbukHQxISwRNQuo/a
 cZ295r0kY87vKJo4ylQkmj+WkrTznH2TV04R4+j//fAuOLgMCY2TmWKbJTe7MRvlwaxQ
 EOEDNfFEKWPNo7riz+mkuEf47VqrqX0maYgae0zPKthNuYj9esGoUSJ+EG+f9Mc8spx8
 pXuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=Liy7Gq0IPri9HWKoliqrhfLW/Zbh8XpFgMCBbrNLYSM=;
 fh=sOPohjw8upFlrk3WgkDnnha2Ik5fCck7mXsahcHScBI=;
 b=Jf7hZz351spzwXKWPxjWdOqbtx16QJPhy/RVHm+FUvT1PbacR4rkgZ3zWK6yi0howt
 AfrWKgO7Plp7HQn5CmEuy/hxS6nJ8CZmz738vW5FS7IYFwVw3f30DJqnOGGhVa4K3hBQ
 Q+dO0G7R+botLc25Om+hi7AhB78wBAdos9tdxX7Z1zBtC/yR3Pd67tueo8P+ZlBOCq1T
 munoOVU3bXMmNZV9lAgukTjYn7oUVXss8NhBciQxfPcEVoNTq1T4lbJVUuRMciclq5yc
 E23ovwOWiKitl5QCukHKbI6Gs33x6qPxCLrVhWOmV+lpHXWevA4Zug0pmj9Pf33xSrFF
 0HIw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1779976646; x=1780581446; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Liy7Gq0IPri9HWKoliqrhfLW/Zbh8XpFgMCBbrNLYSM=;
 b=NgHgdWpTSgMvBo0v+AmkC5mlk19YCxt0BU/JArCHjZ7Ic1agcYTufcZg+RZV21YTHZ
 LA2MO8QN74PyxZ0nOQxGvuDmWf8vy4nSuXr99U7Dysx4DOEh6f928t9/5Yrb+rzaBNhZ
 taDPj7BC/Ptv24TXBLcnxsard2/LUwu/+10KanWtwIvJcX7N/HiPbe7LAjR23YpGg7Tl
 CmYZ3QVLa0Hfq31YWhQLS/TiRh0SaIVMJwnDrfrdPDTV2+l5fOij6MLLn6BRSWzAEvTi
 1C6Rn81pNSaYXQuHcyjsci8dzp4hK8EFYoRCDprgt9YKwy007DJZeN0WIyehrRTqlyqr
 az2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779976646; x=1780581446;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Liy7Gq0IPri9HWKoliqrhfLW/Zbh8XpFgMCBbrNLYSM=;
 b=TWKMTbNM/AdJqPpUB6xP2tS3HmS3K4RBxa3dlovNCkhewVvh0R6aO/eKewT3/O824U
 gQ2fC35awDsQFxdBG7I4l7Ypqh9o+Wq+/YNQPoQmyXqhZlDryVNlT8qS8AjBXvavOgYH
 y2TKWV1y1yWCmXO+aSfLog4XDTEjyiNfoHErd+BYzgGhx8R5s5Q2o4PykkjI2fAZfCDq
 fOAq7ujpKftoytq5UHxVkdDrtxTNPxWD2Um6R2i5MxtQ7HnguTpuQW++BZgmTQS66rnL
 TRoqGCCPbD/KazaHWYtLgCN4064tkNgJXBfSgXMSF45RXOb3r8jRrP7gzUkmnO3xnHU6
 m+3Q==
X-Forwarded-Encrypted: i=1;
 AFNElJ/UgHMcbDFN//5dZ5Upt3cHCuBaKMpmrxMWs3uu6h5EvIXy/f3eDtWQJIEkvF08VpLpDKAaXl7QLg==@nongnu.org
X-Gm-Message-State: AOJu0YxW4i8yRbHZbFx/LORTct2gXwdUW9cO/CSfR6hnPQ1SWVwFfZeH
 21buV26rTEMmlBo3NWEW0Wvk1YYIK8pHpKqM62yFhZyHpprC85R3qyFZOekh6RGI2JXorg5oeBd
 vWEU3hTS2Ic9uTy+qeAC116q18Jn7+Qk0CbTB/yC+Jw==
X-Gm-Gg: Acq92OHHUnM3GSA/ynLvS8rBPpZysJ5MbBtP7K6pd+9Rw5tmC1ghXfdtpYlkpoctmv9
 dnJbqnwu70Mf2L7gwQiOd9WI/woOJ+1WoYIM5TlXBGHmoiUwBHKzMwxhIWOYP3nh9723+Ib1EQ2
 mldwzjvEY/xyoRR2nRV/3WbiZNRoz5SfZOcIWKMR3FtRAtk+tVE6/EDLsDEbki1ifxUGel/hxuG
 jKJuhVCkfsLrc9b/r+8HmvKn17XCKgqZn76k/hrekJ+xQ0jhDwkYLLrlzGYXdnFfEjc+JKprJli
 bpTQ5YR2E2ALklpL3D/bmbx7Um2uOatUBCveQntnHuomsu0nYoLt7JDdgfB/MtJknpalf0mzsDq
 SIlvKr9rPL7L/
X-Received: by 2002:a05:690c:6a87:b0:7dd:489:b56a with SMTP id
 00721157ae682-7dd0489ba22mr13991667b3.25.1779976646016; Thu, 28 May 2026
 06:57:26 -0700 (PDT)
MIME-Version: 1.0
References: <20260518174750.660258-1-richard.henderson@linaro.org>
 <20260518174750.660258-3-richard.henderson@linaro.org>
In-Reply-To: <20260518174750.660258-3-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 28 May 2026 14:57:13 +0100
X-Gm-Features: AVHnY4IpfWu5Jtxb5GuKOgmGWTtwSeS9Lb1wRdfOEZk7IxnUchMbq_ul5pdAK_o
Message-ID: <CAFEAcA8DvDt7mt75bF=wTzQETopuvDaY0m3u8RYZy7S=_CrxQQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] target/arm: Implement CB, CBB, CBH
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112b;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112b.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Mon, 18 May 2026 at 18:49, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Compare and branch instructions, with various operand widths.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/tcg/translate-a64.c | 42 ++++++++++++++++++++++++++++++++++
>  target/arm/tcg/a64.decode      |  9 ++++++++
>  2 files changed, 51 insertions(+)
>
> diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
> index 9a27c4c6ec..293aa43cc9 100644
> --- a/target/arm/tcg/translate-a64.c
> +++ b/target/arm/tcg/translate-a64.c
> @@ -1774,6 +1774,48 @@ static bool trans_B_cond(DisasContext *s, arg_B_cond *a)
>      return true;
>  }
>
> +static bool trans_CB_cond(DisasContext *s, arg_CB_cond *a)
> +{
> +    static const TCGCond cb_cond[8] = {
> +        [0] = TCG_COND_GT,
> +        [1] = TCG_COND_GE,
> +        [2] = TCG_COND_GTU,
> +        [3] = TCG_COND_GEU,
> +        [4] = TCG_COND_NEVER,  /* reserved */
> +        [5] = TCG_COND_NEVER,  /* reserved */
> +        [6] = TCG_COND_EQ,
> +        [7] = TCG_COND_NE,
> +    };
> +    TCGCond cond = cb_cond[a->cc];
> +    TCGv_i64 t, m;
> +
> +    if (!dc_isar_feature(aa64_cmpbr, s) || cond == TCG_COND_NEVER) {
> +        return false;
> +    }
> +
> +    t = cpu_reg(s, a->rt);
> +    m = cpu_reg(s, a->rm);
> +    if (a->esz != MO_64) {
> +        MemOp mop = a->esz | (is_signed_cond(cond) ? MO_SIGN : 0);
> +        TCGv_i64 tt = tcg_temp_new_i64();
> +        TCGv_i64 tm = tcg_temp_new_i64();
> +
> +        tcg_gen_ext_i64(tt, t, mop);
> +        tcg_gen_ext_i64(tm, m, mop);
> +        t = tt;
> +        m = tm;
> +    }
> +
> +    reset_btype(s);
> +    DisasLabel match = gen_disas_label(s);

Variable declaration needs to go at top of function.

Otherwise

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

