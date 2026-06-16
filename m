Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA39ECD98DA
	for <qemu-arm@archiver.kernel.org>; Tue, 16 Jun 2026 13:30:56 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wZTsP-0005HT-W1; Tue, 16 Jun 2026 09:30:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wZTsO-0005Gv-Ar
 for qemu-arm@nongnu.org; Tue, 16 Jun 2026 09:30:48 -0400
Received: from mail-yx1-xb12e.google.com ([2607:f8b0:4864:20::b12e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wZTsK-0006xi-D0
 for qemu-arm@nongnu.org; Tue, 16 Jun 2026 09:30:48 -0400
Received: by mail-yx1-xb12e.google.com with SMTP id
 956f58d0204a3-66077f6c438so4530998d50.2
 for <qemu-arm@nongnu.org>; Tue, 16 Jun 2026 06:30:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781616642; cv=none;
 d=google.com; s=arc-20240605;
 b=gr9FwJG91j6CMuIqxDEpY+FuX+nUsKnYGolSLbAZeGacqFb9hMNh9p1jKpkI9EFGU4
 ESsLWVkgIqC2405q54IENyRaaFH+flRR7urSUNLcyngD5ZkN/lQS0sEhD/qkiGtcoof8
 dpCzMmUUI9LLw4F0uwPMm1Z6XPPYzDiF+EzF1mQyz6MpayNWQQheVVnirk54XPUQnFxj
 k0yz3P0ir2adr8//MhqemDHv0XkNwmqdkjDFxeMLL4MvvMDezKB56Ah+ihtzTw2ybPhd
 TUk/zVk+Y/L90xSADY099kqPkpLUwmvxZSPkemCq5JcQy4BTfUzXKsGn51SELcqu/4jI
 S8UA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=qz1ZuqyKE8PXmEpkiulGq3MVnyojO7yVlpbsYHHg/Xg=;
 fh=3w9eVA03fGTGyn/L46zDaQM9i5qFGZBVGIO0H4UVRQk=;
 b=YEHQgAmbfZDaCEThpnTYlidqLcQgSwNrAVa8BoRfjs0dynUCvrgBUBWFjpG3X3LMDl
 7tchczqN0H81XZM2BhfzM/hQqRG6Tvvt4i/MvD7PR86CtELRgwOvEwCz+fc+0/PoVTdm
 YPRAbL6YbFZYGwT7x8hPGZDXhfyKwUuoXgbehuY3NFqN2FyPgeg2gQuap6JU391M/3Ml
 mfieme6wJSOdYdniXBwHBzePn3u/p4DgsI01Rw80j1zCd5QSumqMW+VMsFqVmZw7aQ1r
 RxHte85jPgnoWeUt94wDKtn9lmb0HZlszZcQUZkBxP1uudRVlLJLkXM/awTbYjtEo8t1
 eq/g==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1781616642; x=1782221442; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=qz1ZuqyKE8PXmEpkiulGq3MVnyojO7yVlpbsYHHg/Xg=;
 b=jZ1zLEWfvduTlfku/VL5YjCzKzBt6ysVNKu10Ghdo9PvqZnL5KxWZygu5J+Dq0U8Y3
 URXz8g5z7DBlxUjVbaY7qHVe6KmQ6vlvPLn7cXLePmgf2qJEYr4HNuNwUMAHmFak0DKN
 PHB4BFgVcxwGeXxFNG9aBlP3IOH/OsKxlQT6grTMTFKWVQGjh+pKYDubkOztgQpFKh3W
 C09ILdcpXSl/BPwQGVAtwvF+KkIUGSq9ZWQk61cw2IcVQ852qVac32c7qAkwjR/M+xsM
 lUmzYgLH6kfg3JMbhn/CC3pwJWlpAKtd7LwsORFkb+d/SfF2FyOu0lalkxffsIGSrjAA
 eFYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781616642; x=1782221442;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qz1ZuqyKE8PXmEpkiulGq3MVnyojO7yVlpbsYHHg/Xg=;
 b=j5X8zXdKQyNzm1BelItgk4iEEz1ba/HaWqnPSmMb2oPMDN9tVHyQUUiMobOqlDh5Ys
 GiCTVvRE/wlEFweQaS9kMMk7Ve6qt+Oh+JHT9H+SlHc9iWRlu+jVFXIWdGrW7V6Y/lkl
 moKiKXSHhiVwb/nDrninaZcJoSzd9/IduSCWHU1ETGv03bKa5ES7NKRdGRUW0uQc4QZ8
 vltcvvGJyq22tT2/Ewbzxoip1gbC4L9WKvgMr0DZhTyi8z1wYKGE2JDDZ5ire86ds1OH
 N6ub0m3eVHlhuiKpPtT/QhJG9jeX4DO9MhxmLEBANStqmgVDKCgDuniN/XDpKYSdJKJp
 79lA==
X-Forwarded-Encrypted: i=1;
 AFNElJ8mQyin6yas7XXv0vyuKHRCmBU44SmsL5PWmgox53C8EWZm4Pub8Is34p5Q+6/OTSw04MtKIVFkfQ==@nongnu.org
X-Gm-Message-State: AOJu0YxHDf8RJw7o45qK8MQe8n3t1xC/XOzqQmAzW/QaVBwQ7GPXcbDC
 mMsgkCK5yAirdFbrIaS4eMWMjYkDjDqO7f/q06/xNc1BJ27JAvnEgfeaFIrVvbLgPRyf4GVn2Ny
 oLocjwFjWY9AJkjLf0una62DLbw5VuxdWkxDMPoqyrw==
X-Gm-Gg: AfdE7cn5XFiRk6vezKqO4P1PN+P6OebNcUPfKEjPigOV+98ORyOQzPAUAnrwIi8bH0p
 f0vUUUUX4ePWfkQj3Yg06xJ/swaFJ5BKdO5oroIYULCRjS2jb5gfBS2RuMUNcdS5pJ9zm1Q87uD
 1U1gA7LZ+ejuZx9vst9ZAdKIHpsvYm1OcDbsGpQhXrrbH6ffnVSGjtGAuqjKupYW3crREiSGe2o
 Bk9QfYR+EEq1LPpTM3SjHRjBTkJmI1xgoc7wnsUHba+zBez7hem5LMTTDX6qy1UpgsnxD/tO0qP
 UlpYDpOJVVLnIN3ddnAvl6eZHQj6s6rSUOgT9YNZIGR+BUW96otR+IS/svYJuflfc58=
X-Received: by 2002:a05:690e:480e:b0:65e:3bde:7c14 with SMTP id
 956f58d0204a3-662b61044fcmr2052623d50.32.1781616641771; Tue, 16 Jun 2026
 06:30:41 -0700 (PDT)
MIME-Version: 1.0
References: <20260604234852.573178-1-richard.henderson@linaro.org>
 <20260604234852.573178-20-richard.henderson@linaro.org>
In-Reply-To: <20260604234852.573178-20-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 16 Jun 2026 14:30:30 +0100
X-Gm-Features: AVVi8Cc9__pY-Qm1tkeszQLXhLY7zzPybpXaHOFXukWgQmW8U_XiQ8qdnFhjANI
Message-ID: <CAFEAcA9JWsJPLx=rH2OiuDMP4f46H5PSzzOBrQaVq=URonSfRQ@mail.gmail.com>
Subject: Re: [PATCH 19/25] target/arm: Implement EXPAND
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b12e;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb12e.google.com
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

On Fri, 5 Jun 2026 at 00:51, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/tcg/helper-sve-defs.h |  5 +++++
>  target/arm/tcg/sve_helper.c      | 28 ++++++++++++++++++++++++++++
>  target/arm/tcg/translate-sve.c   |  7 +++++++
>  target/arm/tcg/sve.decode        |  2 ++
>  4 files changed, 42 insertions(+)
>
> diff --git a/target/arm/tcg/helper-sve-defs.h b/target/arm/tcg/helper-sve-defs.h
> index de2254bb19..75c0fc919d 100644
> --- a/target/arm/tcg/helper-sve-defs.h
> +++ b/target/arm/tcg/helper-sve-defs.h
> @@ -3203,3 +3203,8 @@ DEF_HELPER_FLAGS_6(sve2_famin_s, TCG_CALL_NO_RWG,
>                     void, ptr, ptr, ptr, ptr, fpst, i32)
>  DEF_HELPER_FLAGS_6(sve2_famin_d, TCG_CALL_NO_RWG,
>                     void, ptr, ptr, ptr, ptr, fpst, i32)
> +
> +DEF_HELPER_FLAGS_4(sve2p2_expand_b, TCG_CALL_NO_WG, void, ptr, ptr, ptr, i32)
> +DEF_HELPER_FLAGS_4(sve2p2_expand_h, TCG_CALL_NO_WG, void, ptr, ptr, ptr, i32)
> +DEF_HELPER_FLAGS_4(sve2p2_expand_s, TCG_CALL_NO_WG, void, ptr, ptr, ptr, i32)
> +DEF_HELPER_FLAGS_4(sve2p2_expand_d, TCG_CALL_NO_WG, void, ptr, ptr, ptr, i32)
> diff --git a/target/arm/tcg/sve_helper.c b/target/arm/tcg/sve_helper.c
> index c2b3162084..a13ccf4b85 100644
> --- a/target/arm/tcg/sve_helper.c
> +++ b/target/arm/tcg/sve_helper.c
> @@ -8669,3 +8669,31 @@ void HELPER(pext)(void *vd, uint32_t png, uint32_t desc)
>          do_whilel(vd, mask, MIN(b_count, vl), vl);
>      }
>  }
> +
> +#define DO_EXPAND(NAME, TYPE, H)                                      \
> +void HELPER(NAME)(void *vd, void *vn, void *vg, uint32_t desc)        \
> +{                                                                     \
> +    intptr_t oprsz = simd_oprsz(desc);                                \
> +    ARMVectorReg tn = *(ARMVectorReg *)vn;                            \
> +    intptr_t i = 0, j = 0;                                            \
> +    do {                                                              \
> +        uint16_t pg = *(uint16_t *)(vg + H1_2(i >> 3));               \
> +        do {                                                          \
> +            TYPE nn = 0;                                              \
> +            if (pg & 1) {                                             \
> +                nn = *(TYPE *)((void *)&tn + H(j));                   \
> +                j += sizeof(TYPE);                                    \
> +            }                                                         \
> +            *(TYPE *)(vd + H(i)) = nn;                                \
> +            i += sizeof(TYPE);                                        \
> +            pg >>= sizeof(TYPE);                                      \
> +        } while (i & 15);                                             \
> +    } while (i < oprsz);                                              \

It looks like in the other macros where we iterate like this
(eg DO_ZPZZ, DO_ZPZ) we write the outer loop as
   for (i = 0; i < opr_sz; ) {
     ...
   }

rather than as a do while(). Is there a reason I'm missing why
we need the do-while here ?

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

