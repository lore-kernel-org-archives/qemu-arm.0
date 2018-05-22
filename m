Received: by 2002:a1c:4d4:0:0:0:0:0 with SMTP id 203-v6csp1345433wme;
        Tue, 22 May 2018 04:05:07 -0700 (PDT)
X-Received: by 2002:a9d:270f:: with SMTP id r15-v6mr16748108ota.46.1526987107612;
        Tue, 22 May 2018 04:05:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1526987107; cv=none;
        d=google.com; s=arc-20160816;
        b=DOZY6ufU9wB2MhtvW8Voa2kNuQ1/3XqOfw4Bvq+4oFAahfG+j+YVeaCvezlf5TGsVk
         lyVAr2G5EQimPVRx9f33cHM8fzT4Is5jAIPFV81KeNEDtP67ME0DaFKauy2/7GHyHjh2
         Cb7dYMOqoN0RDjfqUWGz5oAGU2OgElPitczSpZW0Yr8qe8kWGQrISGL2TVrkbCSqF1nu
         n4og5vyiP+4tMvo+d8NPx6QYsevXA88QnngVaxq3rg3RZmt/n3Yldt2GEEhFml+cogsK
         D62mGK0IqYosai5xrHmClXYfyETKiPfkNkq2vvCZThLv8kfqF4CmVP+yp3zMkiMAGTTH
         joTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=9/IJnPy+p/P2ddmGdLXlrhmKi8MS0h2vrKVRqK9Vrw8=;
        b=bUAmnzLVXUoTOcj7fezyIYA4X1IDnzsbCip9EQUakkupOzMTQPlD7ysbiAliOHggQb
         pzr5Qmdpa6R2JTa01LK68XiZPVBxT3CLcz4g/ITSNi30Sm8JNFHu1ETOG7wswafkWPVE
         Ex/v6CFlAXBzz26waNG+Te+q84y6xG6uvOLWFltNO6JjFtQfcKsUZfxCjX60fS3uKF2t
         ORjOQncibnW8Cv7QnGRsnBW6pNV1fZMPXlRyoHidMaIKkmBVwU9kWln5e3firwBQ6qhk
         oo8k+0Jxo1jVu567XaSXvMVmQq3qMof1eKGTuqCzmocavokaKSv1zmMH2XCtu18Nd5qC
         FhLQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DX0q94yv;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id j72-v6sor7265556oiy.74.2018.05.22.04.05.07
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 22 May 2018 04:05:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DX0q94yv;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=9/IJnPy+p/P2ddmGdLXlrhmKi8MS0h2vrKVRqK9Vrw8=;
        b=DX0q94yvm1FDl+gxb6tr0c2BYfe8jU0ULSODFB4ZfDqalMoL5mfQenhIFLN4Tu8ghl
         RTT4JGxY9ARBiNpnXF6v9YJjKVrt4B/ojNiEakSRLT2IUBg/8BkBNrfa/ZL0xqm2lKD0
         wHJhq5NkLvANBAZxGyEEXs/M2eldoW4kBUGsA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=9/IJnPy+p/P2ddmGdLXlrhmKi8MS0h2vrKVRqK9Vrw8=;
        b=SpMhXZyE0Xlii8slvdF2u+sa2yXiK3CU+rcXP0DjLfh0gdrL9gtkg/2d9/QNeoEere
         MfPVGvTcQL6pl/c+0uaS+zpBjDOAtsmHNya2Jj7BIlPrg7BhnA8UaratEy901QBYGUjj
         Irea8O9TiiJ0X2sF8l62u2rGNac94THasT42vaJXOrbjuEKh9CD5LHAepLdX7cwpitJh
         8mqDkk/1ooZZ35lI4fxcl3W1XOA8npwqlqQzHhq6EKeX6cVrcBjD+AihToajwxDttDyY
         IGDqCfdbmvZhJHJD9T/LIGwMS2sb+1pL3zDXIpGkIHnu/762VY+ZWiDzRYXR8PwRFA7C
         MsyQ==
X-Gm-Message-State: ALKqPwe3Zqmk/bKZGGJwnJy3NBP6VPyHHlk9KQz628CnWAnhqRYgQm0F
	Sx5tZyEay+RYm2kK2XhXhXKQYevcKB8+huRAbiZgVZAkG48=
X-Google-Smtp-Source: AB8JxZotbUKNGBeLg8BiLC0ahhPTHbL75a5QOX/8eT7EqPto8QTSJ1WvAWBfhe+ScwrhB9QEY9opkOwPPrHt/d87dVM=
X-Received: by 2002:aca:b855:: with SMTP id i82-v6mr13974712oif.12.1526987107098;
 Tue, 22 May 2018 04:05:07 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:40fb:0:0:0:0:0 with HTTP; Tue, 22 May 2018 04:04:46
 -0700 (PDT)
In-Reply-To: <20180518114424.18054-2-alex.bennee@linaro.org>
References: <20180518114424.18054-1-alex.bennee@linaro.org> <20180518114424.18054-2-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 22 May 2018 12:04:46 +0100
Message-ID: <CAFEAcA9=gD31xOyvEQ-0-3f5p_Z8PQpOySpxB3fzcpWNZyeiiw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] target/arm: support reading of CNT[VCT|FRQ]_EL0
 from user-space
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: EeJr2ohvAzaq

On 18 May 2018 at 12:44, Alex Benn=C3=A9e <alex.bennee@linaro.org> wrote:
> Since kernel commit a86bd139f2 (arm64: arch_timer: Enable CNTVCT_EL0
> trap..) user-space has been able to read these system registers. As we
> can't use QEMUTimer's in linux-user mode we just directly call
> cpu_get_clock().
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>
> ---
> v2
>   - include CNTFRQ_EL0 for PL0_R only
> ---
>  target/arm/helper.c | 27 ++++++++++++++++++++++++---
>  1 file changed, 24 insertions(+), 3 deletions(-)
>
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index db8bbe52a6..39098a15bf 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -2135,11 +2135,32 @@ static const ARMCPRegInfo generic_timer_cp_reginf=
o[] =3D {
>  };
>
>  #else
> -/* In user-mode none of the generic timer registers are accessible,
> - * and their implementation depends on QEMU_CLOCK_VIRTUAL and qdev gpio =
outputs,
> - * so instead just don't register any of them.
> +
> +/* In user-mode most of the generic timer registers are inaccessible
> + * however modern kernels (4.12+) allow access to cntvct_el0
>   */
> +
> +static uint64_t gt_virt_cnt_read(CPUARMState *env, const ARMCPRegInfo *r=
i)
> +{
> +    /* Currently we have no support for QEMUTimer in linux-user so we
> +     * can't call gt_get_countervalue(env), instead we directly
> +     * call the lower level functions.
> +     */
> +    return cpu_get_clock() / GTIMER_SCALE;
> +}
> +
>  static const ARMCPRegInfo generic_timer_cp_reginfo[] =3D {
> +    { .name =3D "CNTFRQ_EL0", .state =3D ARM_CP_STATE_AA64,
> +      .opc0 =3D 3, .opc1 =3D 3, .crn =3D 14, .crm =3D 0, .opc2 =3D 0,
> +      .access =3D PL0_R /* no PL1_RW in linux-user */,
> +      .fieldoffset =3D offsetof(CPUARMState, cp15.c14_cntfrq),
> +      .resetvalue =3D (1000 * 1000 * 1000) / GTIMER_SCALE,

You might as well just make this be .type =3D ARM_CP_CONST,
since the CPU state field can never change.

Also, perhaps NANOSECONDS_PER_SECOND / GTIMER_SCALE.)

> +    },
> +    { .name =3D "CNTVCT_EL0", .state =3D ARM_CP_STATE_AA64,
> +      .opc0 =3D 3, .opc1 =3D 3, .crn =3D 14, .crm =3D 0, .opc2 =3D 2,
> +      .access =3D PL0_R, .type =3D ARM_CP_NO_RAW | ARM_CP_IO,
> +      .readfn =3D gt_virt_cnt_read,
> +    },
>      REGINFO_SENTINEL
>  };

Do we need to make the 32-bit registers accessible to linux-user
processes too?

(Incidentally, another thing along these lines we should probably
look at is that I think that newer kernels emulate ID register
accesses from EL0, so we should do something to make those
registers work too.)

thanks
-- PMM
