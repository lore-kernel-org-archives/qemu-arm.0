Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D1A9CD4851
	for <qemu-arm@archiver.kernel.org>; Thu, 14 May 2026 16:21:47 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wNYoM-0007o7-Np; Thu, 14 May 2026 12:21:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wNYoL-0007no-E2
 for qemu-arm@nongnu.org; Thu, 14 May 2026 12:21:21 -0400
Received: from mail-yx1-xb12d.google.com ([2607:f8b0:4864:20::b12d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wNYoJ-000839-J0
 for qemu-arm@nongnu.org; Thu, 14 May 2026 12:21:21 -0400
Received: by mail-yx1-xb12d.google.com with SMTP id
 956f58d0204a3-65c1ba7eeb6so9339400d50.1
 for <qemu-arm@nongnu.org>; Thu, 14 May 2026 09:21:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778775678; cv=none;
 d=google.com; s=arc-20240605;
 b=E7NAPfDteU+Bwz1zjldKOmL8gjSk/6PI1gC13IYpeXPHSY8BusOqfAEVKFu7SBKQuk
 5HvYqRJvWMy7874eSdX8J5lvg0O23+Oiem+sxADeuXrMZ69k4vHwIU4ycW+Y7zDD41nM
 MREQjfTkNN1c/tOE1ipaTXrmPZiYlZpbNZ173+voq6yQYPhWz9YpfUrEr0fUfOCwHbM+
 21yg7QKYxj3tf3eJHjYSHhz4346087NbnHOjuimqFJqv0IUAusDNp8x+cyYo5Zwh4lH4
 JZQZ9kTYM/f8x1agPfQzRR7OprhxCGK4zPAjSDP3SjBhV03LVKHLb4VVhWrtkcHm+N2G
 +bzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=OAwWMAatT+tvxc0cMeqjmBcnAUfd8sZjNY1T2yBJRDM=;
 fh=QiXTUaRMcdWBWGaOAODP/DuucZgLaz8A0injDB6LokE=;
 b=jVLp0CrikXmM6KRVKCXur8qUv8GBcupElZzS6KsEk60u9hgitrGlZuW9zKOmg/uFv8
 Nmx/7vkNzrceyG/fjqg8GCU+3AtgOArsmEKcxM6V5mdisXR2yMF7bO1Krq51oqbVP9yl
 g0AHJ+15UbllPqRy8x9VtjXMBQxZpv3vAd3YGm/P1niEA5VKxdXbt8Q3CMiC4E3rPTxj
 Vq7qYLg9/YsLrj7RXxOIOVCgnHG/TfPVcCbKPBo75wu277g+f6HmT44ND0a0QBA+POTr
 ZewaIieWBfPNEcsCVlPBbUTm1l/CG/Axrw3HpfDL+XJIDhb1usPNNUM+pgSGSID4NLxi
 tSNg==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1778775678; x=1779380478; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OAwWMAatT+tvxc0cMeqjmBcnAUfd8sZjNY1T2yBJRDM=;
 b=jG3F98psf+AU17qjxXLhacfmkLTn+SPSSlKeopp7gbrRengUesF7SF5cGnLauL7QUj
 ZZts4ofmIrvcBrJSZgnlKzkmOyUY9IhTd3tF6jsySPzGmoqDFexTtrp+vkFeaC0NVldH
 1ycs7mLiNwj49F/IWfDZ9oEb+2PrtNO+yyWlbgLXq6ROP4mge4lx2KWSQhTOSop7pVvS
 UKvv9nzVanMX3NvzUzH2H/x7qeVAsah4zVxtaeYPHLDb5uZZFsyxQoRi0uVWlB1CwfJg
 04de0mCNBgTkqG782uueYablOzymNkrI7HPc1jK/FzlMmjhBRDB/Xji71tydePllLtGP
 8cgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778775678; x=1779380478;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=OAwWMAatT+tvxc0cMeqjmBcnAUfd8sZjNY1T2yBJRDM=;
 b=mbuMqnqtWeRNuyKdA2UbammeqDc2R/H0+AXcwCCVH7YqHtilUJD4CURvZ9kxAv5CiN
 cmO32LRjNmbEx3pdMmEF3q9jtZoki9OmfRgVci5rzhdgmQuXzJmn1YW3nSNtjjO+WMQH
 b8uMDqtjKIcfgaYIcDJinmWa9+nfS4D7wDnqumjSR38iVja4a0qNGrDLGtUixA0dLy3h
 tb5/pDXjSugsrX9lpOcw+V1zxOENbZrQF60v4tPa9Lz6SRX0oyXOvT/QLR1tZ/g+SGeZ
 lXpgPskbXEBe+KpMKF/shmO1qQBmMyTMOCnCVGrj6kG9p4tTlwlktEKpQ/ux5sP2YZ3M
 ITOw==
X-Forwarded-Encrypted: i=1;
 AFNElJ86n0QqDoxI8D8Cl1uxL3c3dIYJ5qfvpkARNuo9s+ZR4OGz5jpzeS0TGyliQPkSPjIJupNdMRDjAw==@nongnu.org
X-Gm-Message-State: AOJu0YwpLmSOqobLJbiNPFPTITiXG1mOxIWaXrN/jx4Vp5V5XKlZ228F
 QJWEENLzWuZonNA/8qwJfZuemRY5rri2dSSqQ+OmVEeqUGbYjpuQiFgrCeS4oSGi8khEni9oeHc
 DNsMgYLpkfN0EwoiWScKOVJrJQ4ZAKpb2NYk2rjLe9g==
X-Gm-Gg: Acq92OG6GrFp8LCmRhreTp2FeqGQ249dzsZJcQe7fV5rBA71oayk6KLoBUnQBE/sPto
 4NFcR8ALLS/R+aLStutjoOJJ7zlDHgUQDIQY3f+MhCDQxxDNWVaN2H4ZpoKWMqMRz1pcohNniFb
 eeBER2/eTF47scZNNX4VfoSBB7Qw87RXYjBFIZnLq6xChCB1tf6Lih44vOfuxwfchv7pWcYi03/
 IsNc3QWb+hcW12onneV3zH18jeP1mG2Phk0wdp/ZEPez1OwU9/CxkZDqnSqo6mIKTVpOZPnOcN5
 Js8YAMi+XZc3wN2YfrWXXKv+geOgBYqVNaPIdmZdHo2HmtGYFG1ChnRGfv/Djn3i/+Cx9SQqss3
 S8w==
X-Received: by 2002:a05:690e:4147:b0:654:45be:85ad with SMTP id
 956f58d0204a3-65df82c480cmr7610096d50.52.1778775678200; Thu, 14 May 2026
 09:21:18 -0700 (PDT)
MIME-Version: 1.0
References: <20260507234413.643512-1-richard.henderson@linaro.org>
 <20260507234413.643512-30-richard.henderson@linaro.org>
In-Reply-To: <20260507234413.643512-30-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 14 May 2026 17:21:06 +0100
X-Gm-Features: AVHnY4JQRBodPCFLe-w_gdlmlxYKT0gNtzTUko1bN8x6SzRVG2JYTvBVvAJXI8w
Message-ID: <CAFEAcA-KCRHpxzPz9n8NCqVrJTWFNw9t2xCK8Eb1v4mwt0oVMA@mail.gmail.com>
Subject: Re: [PATCH v4 29/60] target/arm: Implement BFCVTN for SVE
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b12d;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb12d.google.com
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

On Fri, 8 May 2026 at 00:46, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/tcg/helper-fp8-defs.h |  2 +
>  target/arm/tcg/fp8_helper.c      | 85 ++++++++++++++++++++++++++++++++
>  target/arm/tcg/translate-sve.c   |  3 ++
>  target/arm/tcg/sve.decode        |  2 +
>  4 files changed, 92 insertions(+)
>
> diff --git a/target/arm/tcg/helper-fp8-defs.h b/target/arm/tcg/helper-fp8=
-defs.h
> index b5dc2b7064..bbc8d69e28 100644
> --- a/target/arm/tcg/helper-fp8-defs.h
> +++ b/target/arm/tcg/helper-fp8-defs.h
> @@ -12,3 +12,5 @@ DEF_HELPER_FLAGS_4(advsimd_fcvtl_hb, TCG_CALL_NO_RWG, v=
oid, ptr, ptr, env, i32)
>  DEF_HELPER_FLAGS_4(sve2_fcvt_hb, TCG_CALL_NO_RWG, void, ptr, ptr, env, i=
32)
>  DEF_HELPER_FLAGS_4(sme2_fcvt_hb, TCG_CALL_NO_RWG, void, ptr, ptr, env, i=
32)
>  DEF_HELPER_FLAGS_4(sme2_fcvtl_hb, TCG_CALL_NO_RWG, void, ptr, ptr, env, =
i32)
> +
> +DEF_HELPER_FLAGS_4(sve2_bfcvtn_bh, TCG_CALL_NO_RWG, void, ptr, ptr, env,=
 i32)
> diff --git a/target/arm/tcg/fp8_helper.c b/target/arm/tcg/fp8_helper.c
> index fce02f68fa..400deee612 100644
> --- a/target/arm/tcg/fp8_helper.c
> +++ b/target/arm/tcg/fp8_helper.c
> @@ -78,6 +78,14 @@ static FP8Context fp8_src_start(CPUARMState *env, uint=
32_t desc, int scale_mask)
>      return fp8_start(env, desc, f8fmt, scale);
>  }
>
> +static FP8Context fp8_dst_start(CPUARMState *env, uint32_t desc)
> +{
> +    uint64_t fpmr =3D env->vfp.fpmr;
> +    FPMRType f8fmt =3D FIELD_EX64(fpmr, FPMR, F8D);
> +    int scale =3D FIELD_SEX64(fpmr, FPMR, NSCALE);
> +
> +    return fp8_start(env, desc, f8fmt, scale);
> +}

We need to vary the number of bits in FPMR.NSCALE that we look
at depending on whether we're doing halfprec to fp8 or single to
fp8 conversions. The pseudocode FPConvertFP8() function has
  let scale : integer =3D if N =3D=3D 16 then SInt(fpmr.NSCALE[4:0]) else
SInt(fpmr.NSCALE)=CD=BE

I think this function needs an extra "bool is_halfprec" or
some equivalent of the fp8_src_start() scale_mask argument
(not quite as simple as just copying that because this one
is signed...)

thanks
-- PMM

