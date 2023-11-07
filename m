Received: by 2002:a17:906:4a55:b0:9d0:bf65:29fa with SMTP id a21csp295878ejv;
        Tue, 7 Nov 2023 05:05:29 -0800 (PST)
X-Received: by 2002:a17:907:1c0c:b0:9c7:59d1:b2c6 with SMTP id nc12-20020a1709071c0c00b009c759d1b2c6mr19134831ejc.11.1699362329717;
        Tue, 07 Nov 2023 05:05:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1699362329; cv=none;
        d=google.com; s=arc-20160816;
        b=uFwTe0Ub927InFLp5MWKUMPoZlAs3WU13ZFJBXoGV/2uuRusbTQ70H7oF3NhUrQ0M/
         AXrVquPMlC4Dgi5HZQ4eKnl8VcgoIhYkMp5YNyoiklziCXLvSZoUP7gQlmrhHZTvpLE1
         7axX9T34fQkQeb+hswmwn58LdRaBRcDFwwOWdMJW6FDb1J5b4tMeAPeNZVEMOfdXOVId
         k+CD60wTosVZNa0qosqgWT0d654/pX/m+xKau+JRPdRC+EXEeFcumWHQYUjGL/RaL/Li
         puPCOx4X1IZizMdGg74u77ZSgOoqXgRBQVJVzl2+jhC9EPHCbHp2mzNqmUFjpKViKQiF
         DXjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kwNbYDewSgt9gS5KTYiSLd/LSIJRPEA6Og9j6BY5gWA=;
        fh=iLOVwwy7ecSOo7rgREMj0RFqCQPAoXWEjiiUWA5hOPA=;
        b=kgoSPAs29RXXgNnw9hEmedrwDt0A87twIbWep0l74xtVE1YYXOmr7EVrC1zSNQpuWa
         XeRUkWF8GGeZoQv8q18QfoOoVcM+4IvJ+3h5TOeexHxLw6ml551ioSRr5t02D9grA1Pm
         tWhSKvVSm8ozHcP5yaQKHKUnaebzc18cTfMKE071c6kThA5Td5dxqllcjiHkhNUsZnyK
         IzZ59Y/pvgvlcdxnuVBNOa1C3wYoL1psXjQv/Bi9ip+KmCMGpPeWGMh7nGxzpdJNo8fW
         ExWBzaxchpa0hzOXz3whSBL3QuNycbZbMV3qPPkpfHCLoQocW1k9u4QbGelkQYJ3HTww
         YvMw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HGnpSflV;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id c19-20020a17090620d300b009ae387f043csor840282ejc.9.2023.11.07.05.05.29
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 07 Nov 2023 05:05:29 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HGnpSflV;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699362329; x=1699967129; darn=linaro.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kwNbYDewSgt9gS5KTYiSLd/LSIJRPEA6Og9j6BY5gWA=;
        b=HGnpSflVBTWMZcBxwJBUCmoEkYFN/9y5cw8UNp6Qshz0PxRh8fO6Cg60PqcU56o3U7
         XlBt0/NoYFv0OAYwC/0Z9rGSyEO9fcSqJZG2Yx0A8sXdshhkuMiP32Ct/5MoatxHr+EV
         +iUZKOHBPSgUKj6jlPKsaM4mqBbOcb5MhSZr9oQvyjmS6N395A4GxaJ8uYNwsHBzXe44
         A9HL4Va8JVQg/vRJFBIjA9ayG0d4WklZ7gZYKLiGYsolj2hQiG+UtlRO/+ig15DAnmlz
         k5nWv8zQZqbkIyS0FR6ME5vMx+KHW1wGd/nyMKSsuZyV8IxdOCcG3iYGD+hklbgMgXgg
         QhrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699362329; x=1699967129;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kwNbYDewSgt9gS5KTYiSLd/LSIJRPEA6Og9j6BY5gWA=;
        b=f9DOlpLr8H9laGbRDXe3DSMCLcEaWltbTOW9w3TxFYvlZbDWYMVEYh1CN1elyQJFLF
         sfUtUpMnaai+kyZuzV3C3oySnCoetLHlVYckvWHijtxkbY8YUNH1D+M9u8ePJOx5wkkl
         gzrqaOWYdcptkhTit38lY68eTGJqlTivugmPQfFFWSUBRVwnTr8C8Zwj2rReYuyI0vPW
         ju4CSvO5RgWumxjn7KSy057fQfyKV3kHe2jK/Dc5CpEAHAo6l/iSHk2JeUv5nGUGkz8z
         vzFoKS/wfxBtJMkibhRtb+iherXofjqsRBlzY8N3kAdAiCo1UdO3JlkgHaMhzF07HvFX
         doiA==
X-Gm-Message-State: AOJu0YyQqkWaoFfR1x/uo4TIQdh8lyWl9U602nElw5VF2AcxVTEPKFlm
	O38fuLuZB5AeHsTcliHY5f8qFrMh/wPsOuUx3Ky5pE0wSizvEvk1bkc=
X-Google-Smtp-Source: AGHT+IHhTMkfjqIjVeI5bhXPCrB1RBo9x/TuTG87rXo/TepM0Z1MfaNrMo8BeDceBEPoYrApgCXJSAP9dVkuN/cAQGo=
X-Received: by 2002:a17:907:72ca:b0:9de:5e14:d934 with SMTP id
 du10-20020a17090772ca00b009de5e14d934mr8870547ejc.51.1699362329263; Tue, 07
 Nov 2023 05:05:29 -0800 (PST)
MIME-Version: 1.0
References: <20231107105145.2916124-1-alex.bennee@linaro.org>
In-Reply-To: <20231107105145.2916124-1-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 7 Nov 2023 13:05:17 +0000
Message-ID: <CAFEAcA8wfW7kZuyjJTyXEdAvN5E-YEvu=97+xxaiwtEQGAj5GQ@mail.gmail.com>
Subject: Re: [PATCH] target/arm: mark the 32bit alias of PAR when LPAE enabled
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, richard.henderson@linaro.org, 
	"open list:ARM TCG CPUs" <qemu-arm@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: tMlkv9FI7JdL

On Tue, 7 Nov 2023 at 10:51, Alex Benn=C3=A9e <alex.bennee@linaro.org> wrot=
e:
>
> We also mark it ARM_CP_NO_GDB so we avoid duplicate PAR's in the
> system register XML we send to gdb.
>
> Suggested-by: <richard.henderson@linaro.org>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>
> ---
> v2
>   - only set ARM_CP_NO_GDB when no LPAE enabled
>   - also mark as AP_CP_ALIAS
> ---
>  target/arm/helper.c | 32 ++++++++++++++++++--------------
>  1 file changed, 18 insertions(+), 14 deletions(-)
>
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index 5dc0d20a84..80a35b29bb 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -3722,20 +3722,6 @@ static void ats_write64(CPUARMState *env, const AR=
MCPRegInfo *ri,
>  }
>  #endif
>
> -static const ARMCPRegInfo vapa_cp_reginfo[] =3D {
> -    { .name =3D "PAR", .cp =3D 15, .crn =3D 7, .crm =3D 4, .opc1 =3D 0, =
.opc2 =3D 0,
> -      .access =3D PL1_RW, .resetvalue =3D 0,
> -      .bank_fieldoffsets =3D { offsetoflow32(CPUARMState, cp15.par_s),
> -                             offsetoflow32(CPUARMState, cp15.par_ns) },
> -      .writefn =3D par_write },
> -#ifndef CONFIG_USER_ONLY
> -    /* This underdecoding is safe because the reginfo is NO_RAW. */
> -    { .name =3D "ATS", .cp =3D 15, .crn =3D 7, .crm =3D 8, .opc1 =3D 0, =
.opc2 =3D CP_ANY,
> -      .access =3D PL1_W, .accessfn =3D ats_access,
> -      .writefn =3D ats_write, .type =3D ARM_CP_NO_RAW | ARM_CP_RAISES_EX=
C },
> -#endif
> -};
> -
>  /* Return basic MPU access permission bits.  */
>  static uint32_t simple_mpu_ap_bits(uint32_t val)
>  {
> @@ -8904,6 +8890,24 @@ void register_cp_regs_for_features(ARMCPU *cpu)
>          define_arm_cp_regs(cpu, generic_timer_cp_reginfo);
>      }
>      if (arm_feature(env, ARM_FEATURE_VAPA)) {
> +        ARMCPRegInfo vapa_cp_reginfo[] =3D {
> +            { .name =3D "PAR", .cp =3D 15, .crn =3D 7, .crm =3D 4, .opc1=
 =3D 0, .opc2 =3D 0,
> +              .access =3D PL1_RW, .resetvalue =3D 0,
> +              .bank_fieldoffsets =3D { offsetoflow32(CPUARMState, cp15.p=
ar_s),
> +                                     offsetoflow32(CPUARMState, cp15.par=
_ns) },
> +              .writefn =3D par_write},
> +#ifndef CONFIG_USER_ONLY
> +            /* This underdecoding is safe because the reginfo is NO_RAW.=
 */
> +            { .name =3D "ATS", .cp =3D 15, .crn =3D 7, .crm =3D 8, .opc1=
 =3D 0, .opc2 =3D CP_ANY,
> +              .access =3D PL1_W, .accessfn =3D ats_access,
> +              .writefn =3D ats_write, .type =3D ARM_CP_NO_RAW | ARM_CP_R=
AISES_EXC },
> +#endif
> +        };
> +
> +        /* When LPAE exists the PAR register is an alias */

We could be a little more explicit:
 /*
  * When LPAE exists this 32-bit PAR register is an alias of the
  * 64-bit AArch32 PAR register defined in lpae_cp_reginfo[]
  */

> +        if (arm_feature(env, ARM_FEATURE_LPAE)) {
> +            vapa_cp_reginfo[0].type =3D ARM_CP_ALIAS | ARM_CP_NO_GDB;
> +        }
>          define_arm_cp_regs(cpu, vapa_cp_reginfo);
>      }
>      if (arm_feature(env, ARM_FEATURE_CACHE_TEST_CLEAN)) {

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
