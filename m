Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 397CDCD6E44
	for <qemu-arm@archiver.kernel.org>; Thu, 28 May 2026 14:03:15 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wSbKE-0005a5-EO; Thu, 28 May 2026 10:03:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wSbKB-0005Zc-UO
 for qemu-arm@nongnu.org; Thu, 28 May 2026 10:03:03 -0400
Received: from mail-yw1-x1129.google.com ([2607:f8b0:4864:20::1129])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wSbK5-0000nW-6Z
 for qemu-arm@nongnu.org; Thu, 28 May 2026 10:02:58 -0400
Received: by mail-yw1-x1129.google.com with SMTP id
 00721157ae682-7dcbfcd9f24so5057747b3.1
 for <qemu-arm@nongnu.org>; Thu, 28 May 2026 07:02:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779976976; cv=none;
 d=google.com; s=arc-20240605;
 b=Su/5kYTYCKetPHZ/f92d+/iogulMbpcZ6meqrCwq7rqeHTKBXOL/qb/uxC1E/2heSk
 gH5fNqeRAAOjlO7KRwzIT6t5vVE2vHZcjJCjuC7Lvzi9jdXBFIVQ0ne9zaHk5PMtoRTE
 db+uu9GLg4r8hmG6M96iqjiA+PHayWAcEhN1IGtyacFJz0bSkFb1AH4PT7sYmI2ZNdl9
 zpGI4G0JcM7W7HpSC7FqiyvdnnLOet4R02Y1qu57ZHyTov5NHz9tpMCL+bHm6APP2pFx
 GFGIZkx40B4uzMMRGNCg/NoIwBjJEzc7DosT94h7WVHoHFtWNLSaBlfqlhN/FtGs4NsI
 aeLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=u2UlvLkU8QmOGAzcIPF1CoBUsarDoTA5l7nW5ux5rGk=;
 fh=fKPuhjOclA+gZv++TZe2TVff4S9/tpllawuOul5LOzU=;
 b=hFQ350aY6bsHlGCPIzYu7sXrsERiRB9/AerifPmTkG1AoiZRPwqODO3f+o4m8upuRb
 BLGJGcQDRP0fQBiday+jkR+H0ZoKgUztmr19Wm0AekqrEBlNtNWNcWJywIuYxaNpL+UU
 vVHnoUCkcVk11CvEXhLpthDDOD5C6lS21WacHmYr7AwQ0ysIDZvYbsjBYKAdpWLeGMHp
 oNV/+GoqruV0Vv7kxpbInsxHzFTz9p+gHJu5efy8otE5f+CJ/HK3oRb0m7PGpDTXi0km
 EaRGkMJyInGRTpvyXKL+sAhhZ+PoqfmmilI4qThuHrxmKyMF3sPKxG0ocloMgMSqx6Ji
 fBug==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1779976976; x=1780581776; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=u2UlvLkU8QmOGAzcIPF1CoBUsarDoTA5l7nW5ux5rGk=;
 b=AzayyP6mUU6RNCc9HZAOpQRIYCPlO5CL66stocKv4nphNdpjw3Grx1VkaQQrdgGkaL
 uqebLHr+cEHA1rvwHZzOnGSZu/fWyod33DhZ0LxZ6w2upkl/0ByPxqO2ijSjLEXkl7c8
 99ADYFNur9DdfuB87rdUj6gYK3YBo59c6RkoD2G6toqSjfd6oVAKKA3Ap7Rg0Vhosw7w
 RoEXBZnnLWgKFjjz200475Kc7tklOrsKF55e3IesmF6X/4EVmQKviAm65AIhBNL8JjKD
 DjCvqB4UpqSsoSY+GrYP0LKNUQlV1RCi/Bs73PZrtR57J78vg70uRjqnJj7xSDRROKg8
 jQGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779976976; x=1780581776;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=u2UlvLkU8QmOGAzcIPF1CoBUsarDoTA5l7nW5ux5rGk=;
 b=EWb7mDmW3dlL3CigFOdKtKwZfYZVQSiiZzVNK2XNRPoySrU3kzYWpb9bn6LDD8feiU
 rcLkKo+lOyUsx6bySShNHQBYyU9af0TsvDtqMeo98UzwGS2q+g4vHl0ddxKC4acL637X
 JNa3ggGTZnUdhsQaolneGvtL9Nwb4PVMb2zupJKP7lFWtpZPbeRMi2zx5IgCUQBBZ0IH
 9jkZJb0BaxxVwgLb+W0aG9oI4vSvyAaaTQgNpow10CnbK0+odlKWX/0rANmVSQCNrsDf
 tBxPij2NC9lAuWBnu7RR9xfTkvIsdwm42q3txqZta1JcAS5GtQfilduI2f0KCYA9GJzt
 RviQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ/HkNaCyrzcZLQxNach2yZF4v03TPJ/K5e1l8v0WBZE/MuhxuhDh+4TsugAeO7nF9rt2v7K+YlsAA==@nongnu.org
X-Gm-Message-State: AOJu0YzZK2ZO8c8miF023rkyTdqhQ47X/6n6k1aBh+QYCyjKIY4jMjWK
 chrM8HXCPSr6BK/NimxXFqSOysHZ4o8aNNToShxc4c8U62Qwqp5FE/C6Rhxt3tXehI0MRcosyJu
 axDr/EI30MSefVph9Z9Xkm/kQDNBN15dZdUr5m08x9Q==
X-Gm-Gg: Acq92OGiXjdLT471s6tDx0MU6eLV5Vr04jJSMBj5d2UoxVsPiz3GLepBIAi7omgLlZD
 wtfFVA46Rjucq35bwgFs4lZY4KNzYc2siPx8Sb44TNUrLimj08KMOFUGtzHf9YaSQYmTgXk2LXD
 12XLZ+fJwMMZszh37SK7N8Khq0U8pvbC2Lb4dfKUcHD1KCtfPKwLthdvEHoFqlhYZyM7BYG3u5L
 EdTMcq3XbNVF6xH80MEO3hcWgSzEp4rPBtET+jO7YU+TOArX0NW37W2cun5LxLz5vg5uknq2Al7
 d533u5eirZSb0kknk7nCbas3YVvPg6FSOHYzch7RwfuM0HO6NsfllvC9UzqRy8F7ycOputYkZtB
 aQw==
X-Received: by 2002:a05:690c:f15:b0:7dc:a5a8:89d with SMTP id
 00721157ae682-7dca5a81a7cmr23147497b3.10.1779976975374; Thu, 28 May 2026
 07:02:55 -0700 (PDT)
MIME-Version: 1.0
References: <20260518174750.660258-1-richard.henderson@linaro.org>
 <20260518174750.660258-4-richard.henderson@linaro.org>
In-Reply-To: <20260518174750.660258-4-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 28 May 2026 15:02:43 +0100
X-Gm-Features: AVHnY4LVwZ33ITOAl2fYr-DypodGFLApEvA6PfRNGjtEWFiXCkhQokdKX5TBodU
Message-ID: <CAFEAcA9PEAKVBEdH_ZEzSc_nsVrho9KZ9YwP6stK5fEJ4qSk=Q@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] target/arm: Implement CB (immediate)
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1129;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1129.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Mon, 18 May 2026 at 18:49, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/tcg/translate-a64.c | 41 ++++++++++++++++++++++++++++++++++
>  target/arm/tcg/a64.decode      |  2 ++
>  2 files changed, 43 insertions(+)
>
> diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
> index 293aa43cc9..c4a016f36c 100644
> --- a/target/arm/tcg/translate-a64.c
> +++ b/target/arm/tcg/translate-a64.c
> @@ -1816,6 +1816,47 @@ static bool trans_CB_cond(DisasContext *s, arg_CB_cond *a)
>      return true;
>  }
>
> +static bool trans_CB_cond_imm(DisasContext *s, arg_CB_cond_imm *a)
> +{
> +    static const TCGCond cb_cond[8] = {
> +        [0] = TCG_COND_GT,
> +        [1] = TCG_COND_LT,
> +        [2] = TCG_COND_GTU,
> +        [3] = TCG_COND_LTU,
> +        [4] = TCG_COND_NEVER,  /* reserved */
> +        [5] = TCG_COND_NEVER,  /* reserved */
> +        [6] = TCG_COND_EQ,
> +        [7] = TCG_COND_NE,
> +    };

Maybe worth a brief comment
 /* Note that CB imm and CB encode the condition differently */

?

> +    TCGCond cond = cb_cond[a->cc];
> +    TCGv_i64 t;
> +
> +    if (!dc_isar_feature(aa64_cmpbr, s) || cond == TCG_COND_NEVER) {
> +        return false;
> +    }
> +
> +    t = cpu_reg(s, a->rt);
> +    if (!a->sf) {
> +        TCGv_i64 tt = tcg_temp_new_i64();
> +
> +        if (is_signed_cond(cond)) {
> +            tcg_gen_ext32s_i64(tt, t);
> +        } else {
> +            tcg_gen_ext32u_i64(tt, t);
> +        }
> +        t = tt;
> +    }
> +
> +    reset_btype(s);
> +    DisasLabel match = gen_disas_label(s);

Var decl at top of function.

> +
> +    tcg_gen_brcondi_i64(cond, t, a->imm6, match.label);
> +    gen_goto_tb(s, 0, 4);
> +    set_disas_label(s, match);
> +    gen_goto_tb(s, 1, a->imm9);
> +    return true;
> +}

Otherwise

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

