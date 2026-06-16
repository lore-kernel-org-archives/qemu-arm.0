Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2BACCD98E3
	for <qemu-arm@archiver.kernel.org>; Tue, 16 Jun 2026 15:27:52 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wZVhL-0006Ys-4q; Tue, 16 Jun 2026 11:27:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wZVhJ-0006YL-Pp
 for qemu-arm@nongnu.org; Tue, 16 Jun 2026 11:27:29 -0400
Received: from mail-yx1-xb131.google.com ([2607:f8b0:4864:20::b131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wZVhI-0002dJ-AJ
 for qemu-arm@nongnu.org; Tue, 16 Jun 2026 11:27:29 -0400
Received: by mail-yx1-xb131.google.com with SMTP id
 956f58d0204a3-662bb8b1f93so787918d50.1
 for <qemu-arm@nongnu.org>; Tue, 16 Jun 2026 08:27:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781623647; cv=none;
 d=google.com; s=arc-20240605;
 b=Mr6LqGVndcT1XjN1kVVBenRIkzN5GWf0HEOhcyNPgAwX0gUmlz7rRqtql1bWzPBDLC
 naDctrYMK1DutuoamDlN4fDFo/MiFvbWAyO4IzUDd3v+uWEwnsak1qwD0ktfdAgQxcuV
 /Mb4135uKF4EUjPRMvP2pvN//K+Xixc4LKUpCn7VI81vKwTBRVKIgHijHcLnptQCUyAu
 NaTvfQU5XM+BRWlIuKq5D+6Ibin5qwFGreWGplKLru/JazhMbA4JIGhUfeQN4LpgIodQ
 kG0vEgxr/0T1TMjKgHeTF2o8B5cxQp1h7hOtzBhi3u4P3V04+8IXJy/220H+6q9bLkep
 giuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=LRcWexWvCq49tDGQm28QFblr5Loyse8ziE19iwFcn3Q=;
 fh=r5mSiJ9e7wU1WoSTtvxcg6qFd+5DnBAob8Qx5XoR/wE=;
 b=L268v25Tdi0pRK/evVR7nZBkTLYPwcg1JHVQmdmtWN/73g9V0DlcixD3l7v0dZwHmb
 oJzFxWNoA4e+R48rAUvbJuq1kuRvsAXMNwqtSd21nX5jqzA3VoCCyvFvEWOI+Ipkk34K
 SwY+ZCqakL6cmxrUcs7u2rxr2SpnBKkDCYsQCnEOkOtDaCGDJKHbue00D2qTSGssy7j/
 L9B85HqyIE1s8XEWVDKTe63D6i6lG7gZzXhyg0z4dw3Ts+bjJfz5mX9gTmwdhv8K9ZyT
 xYCq03p2/lcRHyE+YrXwJ/6VaDwcutUfWfaivk4cJquf7RMq6LS6NJLzx0J0IwMn8Qrp
 G65w==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1781623647; x=1782228447; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=LRcWexWvCq49tDGQm28QFblr5Loyse8ziE19iwFcn3Q=;
 b=cyAdvvc/fWaAWTcNjtSJatdGJT5fwfiVw4cuj6H0ECSCYCMkFmfgIbCn5Cvfva2Ar/
 jfY03S1EQ677tQg0c/OD5LPa3H2a+VUU8QsxkAZQlo4f/sscN+pCA9SuhfWO7m+mJfR8
 UXxDoOfkhuZTKO9KB7O4ku6I793gSgvpXh4+jKeTWgiOkIP0b27Ckbo8SckO5KJO17Z0
 Z8hxWUajWhi+LuUnev+XqT/lPms2ZAhqx64IjANPW1Kn63xGdXPDgYRreVr/Noo7pkBY
 b8sCquH0VG1pWqi4AeIUzGDr8EbugaO3Ru1pK7Jk+acSZUX2k/9/HlObcKmOUAflOvxS
 00pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781623647; x=1782228447;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LRcWexWvCq49tDGQm28QFblr5Loyse8ziE19iwFcn3Q=;
 b=kNEIjN7iUS2HxJkvIAKPMsCcNHf1CR/Obh4TyLdReeODgKM+3Xsg5X/XLjqkSGvlZA
 JtCiLryx+jYhwwrtrz7wGE9bTVpsemuV4ZLgFJPmsln/kSepWUrDQ7GvImbGcEm+nrjy
 +odqUmllyKzbFDhxRxzFE5kKcjoNbkMi8Tpzj7+m7pLN5ivtNUkPugA7cNWE919NxH8S
 fpZ01h49KqUUT1GmVYt4cBVKQhWsYdiPJWCIny8snjwf3y3gR6dhSMSLi0No95fMK9yW
 gjSWGTX7m4lPqbS6ETuv6Bz3L6DzS0NZqk82uCnVRqbK9gLDi6Vq1LwTk4yKn01yMjFt
 FvhA==
X-Forwarded-Encrypted: i=1;
 AFNElJ8GU8c5sbLSaAsexUMhCKP605bJ3nEgGbnUI/NZ43LWqCpn+nr1UjsqRwpt2ip/88TXcum97NsVXg==@nongnu.org
X-Gm-Message-State: AOJu0Yyv4MaFS37IQL0VmzfIyapI+4+ddYP1RTngvvZZUfn999jP/W6W
 EziedUQjanxbN1MM2Ybf7lTnI1lqDBIz9ECwY6TNAmOfTOt6jNwEE4r1t3l7rQtSO4SI/WNdboq
 /Qdm+IBLjGMpTfpTkJTl3z1p5VAHFTI41w/2ped50hg==
X-Gm-Gg: Acq92OHrdFyWOTXEbiJsxPJHJVZ9SgPt29rBtobN9vNXfEBn1ZdNzfqm6XtdwkJoI1z
 dCf54JE+eCu5BvqhAc6xUM3FfWuu7e637fLlZGguIDD6scgm3s63vOXyzk0odY6uv8LZQNmYokK
 Dq3d45Al4Pyd52oum8ZgSYmUEg+ha7GVzfMc3La/J1fCwFxNfhSnyIpYUsolPxS0d2IGLZ4+ocv
 rUm+xeBtQ2fpIWpJ3yjSPY5f91qok6rA3W4wWpTjtvenvqEEU8lYXBkNDHCdIvVmSWuqG1HSYay
 tzcHXQLhW91ouTQS7vL6Flt51Zm8LXn+44hZEITvTtsmBDAayDnsCFM64sVROK9JfXU=
X-Received: by 2002:a05:690e:4810:b0:653:f51:90b1 with SMTP id
 956f58d0204a3-66277f7dc8emr11755109d50.24.1781623646655; Tue, 16 Jun 2026
 08:27:26 -0700 (PDT)
MIME-Version: 1.0
References: <20260604234852.573178-1-richard.henderson@linaro.org>
 <20260604234852.573178-23-richard.henderson@linaro.org>
In-Reply-To: <20260604234852.573178-23-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 16 Jun 2026 16:27:14 +0100
X-Gm-Features: AVVi8CeOfLUvCvJL1ESWV0Fh97fxx7QZ9ayojxTG215XY2Cpra3EsHyIRv5zh9g
Message-ID: <CAFEAcA-HfpZcg6Lqsu+GO=h8i8wOYRB-0A37jdkfSgmbiXCfng@mail.gmail.com>
Subject: Re: [PATCH 22/25] target/arm: Implement FIRSTP, LASTP
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b131;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb131.google.com
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

On Fri, 5 Jun 2026 at 00:51, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/tcg/helper-sve-defs.h |  3 ++
>  target/arm/tcg/sve_helper.c      | 30 +++++++++++++++++
>  target/arm/tcg/translate-sve.c   | 56 ++++++++++++++++++++++++++++++++
>  target/arm/tcg/sve.decode        |  3 ++
>  4 files changed, 92 insertions(+)
>
> diff --git a/target/arm/tcg/helper-sve-defs.h b/target/arm/tcg/helper-sve-defs.h
> index 11342e1e59..440a868cea 100644
> --- a/target/arm/tcg/helper-sve-defs.h
> +++ b/target/arm/tcg/helper-sve-defs.h
> @@ -961,6 +961,9 @@ DEF_HELPER_FLAGS_4(sve_brkns, TCG_CALL_NO_RWG, i32, ptr, ptr, ptr, i32)
>  DEF_HELPER_FLAGS_3(sve_cntp, TCG_CALL_NO_RWG, i64, ptr, ptr, i32)
>  DEF_HELPER_FLAGS_2(sve2p1_cntp_c, TCG_CALL_NO_RWG_SE, i64, i32, i32)
>
> +DEF_HELPER_FLAGS_3(sve2p2_firstp, TCG_CALL_NO_RWG_SE, i64, ptr, ptr, i32)
> +DEF_HELPER_FLAGS_3(sve2p2_lastp, TCG_CALL_NO_RWG_SE, i64, ptr, ptr, i32)
> +
>  DEF_HELPER_FLAGS_3(sve_whilel, TCG_CALL_NO_RWG, i32, ptr, i32, i32)
>  DEF_HELPER_FLAGS_3(sve_whileg, TCG_CALL_NO_RWG, i32, ptr, i32, i32)
>
> diff --git a/target/arm/tcg/sve_helper.c b/target/arm/tcg/sve_helper.c
> index 3f99a362c3..57c7823feb 100644
> --- a/target/arm/tcg/sve_helper.c
> +++ b/target/arm/tcg/sve_helper.c
> @@ -4302,6 +4302,36 @@ uint64_t HELPER(sve2p1_cntp_c)(uint32_t png, uint32_t desc)
>      return count >> p.lg2_stride;
>  }
>
> +uint64_t HELPER(sve2p2_firstp)(void *vn, void *vg, uint32_t pred_desc)
> +{
> +    intptr_t words = DIV_ROUND_UP(FIELD_EX32(pred_desc, PREDDESC, OPRSZ), 8);
> +    intptr_t esz = FIELD_EX32(pred_desc, PREDDESC, ESZ);
> +    uint64_t *n = vn, *g = vg, mask = pred_esz_masks[esz];
> +
> +    for (intptr_t i = 0; i < words; ++i) {
> +        uint64_t t = n[i] & g[i] & mask;
> +        if (t) {
> +            return (ctz64(t) + i * 64) >> esz;
> +        }
> +    }
> +    return -1;
> +}
> +
> +uint64_t HELPER(sve2p2_lastp)(void *vn, void *vg, uint32_t pred_desc)
> +{
> +    intptr_t words = DIV_ROUND_UP(FIELD_EX32(pred_desc, PREDDESC, OPRSZ), 8);
> +    intptr_t esz = FIELD_EX32(pred_desc, PREDDESC, ESZ);
> +    uint64_t *n = vn, *g = vg, mask = pred_esz_masks[esz];
> +
> +    for (intptr_t i = words - 1; i >= 0; --i) {
> +        uint64_t t = n[i] & g[i] & mask;
> +        if (t) {
> +            return ((clz64(t) ^ 63) + i * 64) >> esz;

Why XOR? Shouldn't this be the same kind of expression as
we use in last_active_element():

            return i * 64 + (63 - clz64(this_g));

> +        }
> +    }
> +    return -1;
> +}

> +            if (firstp) {
> +                tcg_gen_ctzi_i64(v, v, -1);
> +            } else {
> +                tcg_gen_clzi_i64(v, v, 64);
> +                tcg_gen_subfi_i64(v, 63, v);

...and we use 63 - clz64(...) here.

thanks
-- PMM

