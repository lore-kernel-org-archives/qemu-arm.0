Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp718727wrp;
        Fri, 13 Sep 2019 06:04:17 -0700 (PDT)
X-Received: by 2002:a05:6830:91:: with SMTP id a17mr5710987oto.322.1568379856955;
        Fri, 13 Sep 2019 06:04:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1568379856; cv=none;
        d=google.com; s=arc-20160816;
        b=ZUmhVJMDCCMpBHp/SK4PeHQaRF75IAO8WDXzJLsdyINphF8rdjpCHPddNidZ61ogJK
         tQlwTb78ys7oGMzTL4DfzqDt+VE0DAdAUrlY2bUv0wd8Bhwm0irRhzaRKLBXbe7VZRvO
         u9x0fHX8b15kHTZSkx4IXAEseAI8mwoFAc4WdA1en8bjCtd2wBlRPwRiRpCFoV5v8Wda
         rVph5uh/9kyV6/sRTwAt3JDjJbGj158doFfP0W5j3AHUuACv2V6UFNEpz7PDsdXFGdKZ
         Z0vwve6Gvk+JoHCqXEcg+AeLGg24goCcwVLzfIa64pDVMhzkhqoLvONHcSqgGTf8ZXFl
         ELlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lJM2ojp36nj5j9CBSnwk8ZLfnJIsWvjr8zkFPoizZg4=;
        b=giKPoTyykkh4aouSRSsNWC7VRw44RqDFo9e8E7wW23NdXKvXcEQJ6rsPUTKufpVBq7
         L2Nae8nXwtPgdTigictbSGoKbkQ1ELWv2a+aHc7oeAAdLwWAuhhCAyNmm00qW2eRNUWD
         12mP1QFoiRc/1yfqq9a0xOPzfRBJkqOzPH5hE92XzvrVbhRozvf19cqPbEd/MjVcqAGp
         i0e3c3XexULovht6NgOlxySoPXTsFvGdvnTpfHOrdmrPRley5Y4/OLVoBRsL0rFNCUr0
         g/K0CpWEqckZAFuChrxdnLXDvdtEuK7lyKBkiUf9ByLrMLUSsS2b5oPEOz69+55Ii0Td
         w+Hg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=R2eRi6RJ;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id y64sor1227060oig.106.2019.09.13.06.04.16
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 13 Sep 2019 06:04:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=R2eRi6RJ;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=lJM2ojp36nj5j9CBSnwk8ZLfnJIsWvjr8zkFPoizZg4=;
        b=R2eRi6RJg1WrxbNKgsFY0gme2AEFJ9xjhNZIN/MK9HTVaemUuzlSiMVdPrtq4DhWMg
         9ZDb34f708xyMe9ESFaN70gbNmsvQ0vcE0qtaB0xu6F5cDBz3G5i4dzHxhyy2Z0msHXe
         6JRNrC6bbbeKkDEwaBzeFxiZwx3pKtVWwWg14F0MtUgyS+bH+x3c8pajGpStwGIB95PO
         uFbC0Q4ltfI3PdOsmqqgTwRVzO3/7eNxkHcWcrs0xBtrxt1iFk543oVKb/epe+unS0tN
         CF2JzM7MBXeDag6duMycaHnjxCToU9ZOgun4FLLOUM6hCrSdj35zIJh1kohQeQJ2D+b0
         exew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=lJM2ojp36nj5j9CBSnwk8ZLfnJIsWvjr8zkFPoizZg4=;
        b=byLA1FrC5ZWJqxKXy3xNmo4rin0Q/YFrbo8fGN0W+1Cs3mKBz63l4J31P11gbo2jTT
         ZnozFMMnEi+3sQE8kNpcF2acOdJBBIrYCWLZSAmY7rrrnBeomkLwI9rupY2/B9r9vjM7
         c/aljWBFnWg0214b6FhvNyk0Ykq2AIHueixm8VZWOYyqnhCo83zlm83O9Pm5tFp4RYPl
         +H1Ge3h35tsv7V57LrlfxKofFL0Xmro3jc29GH6GIC5Yt4ue+Q8gOOCJtkQPRGEGsZhh
         IQTjqUBexYzBTxEBCT0aMUk4iRdz+uCaq3Z/TOpnTYjBpFPETyTKX2buvXICpdkS11JW
         Gblw==
X-Gm-Message-State: APjAAAW0XukaiixdWaEeke+Rl087P8XUQgU8GM80l+zNKoW9zqpGKkm3
	wtuQB0lzYL7coJC+HAHn63/luoLVJ0LhE6MP+Hp6R88Lu+1mQw==
X-Google-Smtp-Source: APXvYqxr6IgNQtrgroWI8Ck5MOxTceBNBvHmI+AKIC3uOI4BOiT5n4f4Wh1IzT8umt/HCMhjCk+8Zm5uFRnmk3/xQ5k=
X-Received: by 2002:aca:50d8:: with SMTP id e207mr2904994oib.48.1568379856290;
 Fri, 13 Sep 2019 06:04:16 -0700 (PDT)
MIME-Version: 1.0
References: <20190911164959.11003-1-alex.bennee@linaro.org> <20190911164959.11003-4-alex.bennee@linaro.org>
In-Reply-To: <20190911164959.11003-4-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 13 Sep 2019 14:04:05 +0100
Message-ID: <CAFEAcA_NCz_qFFFOShV8ktV4vHeYezQ=5S7QQPTMQywGfY1FGw@mail.gmail.com>
Subject: Re: [PATCH v5 3/5] target/arm: handle A-profile semihosting at
 translate time
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: YtCzg5JWGAba

On Wed, 11 Sep 2019 at 17:50, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
> As for the other semihosting calls we can resolve this at translate
> time.
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>
> ---
> v2
>   - update for change to gen_exception_internal_insn API
> v3
>   - update for decode tree, merge T32 & A32 commits
>   - dropped r-b due to changes
> v4
>   - !IS_USER and !arm_dc_feature(s, ARM_FEATURE_M)
> v5
>   - only if !IS_USER for softmmu, linux-user is still allowed
> ---
>  target/arm/translate.c | 19 +++++++++++++++----
>  1 file changed, 15 insertions(+), 4 deletions(-)
>
> diff --git a/target/arm/translate.c b/target/arm/translate.c
> index 6689acc911e..fac791c4b06 100644
> --- a/target/arm/translate.c
> +++ b/target/arm/translate.c
> @@ -10219,14 +10219,25 @@ static bool trans_CBZ(DisasContext *s, arg_CBZ =
*a)
>  }
>
>  /*
> - * Supervisor call
> + * Supervisor call - both T32 & A32 come here so we need to check
> + * which mode we are in when checking for semihosting.
>   */
>
>  static bool trans_SVC(DisasContext *s, arg_SVC *a)
>  {
> -    gen_set_pc_im(s, s->base.pc_next);
> -    s->svc_imm =3D a->imm;
> -    s->base.is_jmp =3D DISAS_SWI;
> +    const uint32_t semihost_imm =3D s->thumb ? 0xab : 0x123456;
> +
> +    if (!arm_dc_feature(s, ARM_FEATURE_M) && semihosting_enabled() &&
> +#ifndef CONFIG_USER_ONLY
> +        !IS_USER(s) &&
> +#endif
> +        (a->imm =3D=3D semihost_imm)) {
> +        gen_exception_internal_insn(s, s->base.pc_next, EXCP_SEMIHOST);
> +    } else {
> +        gen_set_pc_im(s, s->base.pc_next);
> +        s->svc_imm =3D a->imm;
> +        s->base.is_jmp =3D DISAS_SWI;
> +    }
>      return true;
>  }

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
