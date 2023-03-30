Received: by 2002:a17:906:b2c6:b0:930:eaf4:5c09 with SMTP id cf6csp1143107ejb;
        Thu, 30 Mar 2023 03:35:03 -0700 (PDT)
X-Received: by 2002:a17:907:9728:b0:93e:5baa:d443 with SMTP id jg40-20020a170907972800b0093e5baad443mr28834354ejc.63.1680172503257;
        Thu, 30 Mar 2023 03:35:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1680172503; cv=none;
        d=google.com; s=arc-20160816;
        b=UaoHpzQVgvzp5eyJdtUjQNRiNDzz2gYq3g0RpaoPYKvlTfjEUt8E+N5x7g5Bzu35lt
         JYRD3WUE58fZmsTzIdk80YaqtNvRF9nVgOJpMBKuqcn/xBzcZrmqfJCm2aO9+Hgsg5AM
         d7Mz9zFyQLSYJF5kvFqTI55P6z+J59yNCBVSc2YUjEyIN51plrfCGmu0182TyPT1zeFz
         LTJqTVpyuc3XdcjVlx0OP8LPQBZbKVIJzMZA1xHQhwcAiY4DemYZllCFaZCNPU84B1S5
         juwwrSyfyxv3F8fgyHe9YYRwdv1FZ1ssjX/nLByb7nkr1mEedeJUj4doU+Rv+Ndf2ELC
         qMwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=txGkNYhxQY1ZDH5K+oBgkwLGRZKIXUGcCTeHU3obFh4=;
        b=ETHxZi2dOqb6iRn3fMwBGMZIXb78WRPvq5/wBebDg8yY2ctd4KBYKIsCBAEDfXcpG6
         AW9+wHl0s+oASxtJ3I4TTDesmGR0kOmOOp81cKVCM7JN6yAqi8q/8cdgYjIwbCrqE5OU
         UC0nTlxBV6e2yZT1zw3J06bG02y9rJ2mcZrkoZ8GHaHM5ZZvEZXm/1Znx1pg98yXNfBH
         5h+zCy76X2ntMG5XcTYSJpFFJlfqnaUNlVKpit/0rZkHoHOcXLdL1ShAHflxpwMPk28R
         TSoK8i2atyQTrLaZS0Em07psKwKYQ5EJEKYowBkwWVrEyEzxvRwN1WuKs4c7TqIwGIjM
         XrRQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="yh/SG0Mn";
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id gv17-20020a170906f11100b0093defcca8c7sor10159235ejb.145.2023.03.30.03.35.03
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 30 Mar 2023 03:35:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="yh/SG0Mn";
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680172503;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=txGkNYhxQY1ZDH5K+oBgkwLGRZKIXUGcCTeHU3obFh4=;
        b=yh/SG0MnVD/W3djOgoXSm+86Gq5ve/GDy1piixrXv4vE4FZ+CxmVSU9sHGbbokEqi4
         lWx401yjTvz7wtIBuwIFd/in0v1y9KWZi6uv9L9vB6fc9c63fPmZga8b5Iktkpk6Rpvj
         Nt7qfU2stMhAEJSgSxmOTve5QKFXMbtTcjyvf8gciGAwUsxMievB++T/YqCwQBoD6mdq
         dl/lgUKbyC6riZFALLTwqLFcLeFl3+TIU4KuW3etkgtv/44YBypfMTZruEr5pVJeh4Sr
         FOhB9t9JyOOLpUapC3hrBSWnem41SQuM5KUYkds5a70Wimis5nk+K9iXbNb53iDZNV4H
         INuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680172503;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=txGkNYhxQY1ZDH5K+oBgkwLGRZKIXUGcCTeHU3obFh4=;
        b=Sk4aBJPSPQocr5DY7oz8vCFfSD5l2ohi0hvRfG0UKY1b9kDaxgQvZDkBzXwLHERrBW
         mmwCArV1YN1UzGB1qaxPZj2hTD5j3GesQJtKpV6DxMpOI578EidkIbbb2GznlJd+3Dvo
         pPQiLAi6/Kpk33W6dqhEDYBFvJ8blmXKdUDLm6yZJl8yGMf8cLu+eGS15COgaM7P+MVT
         O55BKc8qTVqKE+F5Vsh10pd/MWNq1PyCCgxD4TCg4M4nKfDOqXMkZYTcXnv5HhBGY/Ay
         /Xp9j2o+gtSJABzsFA1ASjELW3w6NmKPw8fFuXNRhNtgzOQDbH7zWNkkAR+GwXotHLKY
         u8FQ==
X-Gm-Message-State: AAQBX9dzyRnpsKTceDlx4d8NOAVD5IPFOiYwfBE7E41NNOWzt8flTmUL
	neg/b2xY4n0WqqjsasjlFTRAimpyqepA4EhWCYJNEvS7
X-Google-Smtp-Source: AKy350YcW+UscaXCnWkgPQjYjek9tuO/w5Oa4NN1PN2qAUu9U3HqpIpL/agBlmwWgLqYN63SC9MG8SyGhl2XX9Ws9XA=
X-Received: by 2002:a17:906:483:b0:92f:41e4:e48b with SMTP id
 f3-20020a170906048300b0092f41e4e48bmr11130910eja.6.1680172502973; Thu, 30 Mar
 2023 03:35:02 -0700 (PDT)
MIME-Version: 1.0
References: <20230328212516.29592-1-philmd@linaro.org> <CAFEAcA_yP9ibO2NOC0pL4SNbPmHtB+TfPm0A06YfC4Mwec5xAQ@mail.gmail.com>
In-Reply-To: <CAFEAcA_yP9ibO2NOC0pL4SNbPmHtB+TfPm0A06YfC4Mwec5xAQ@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 30 Mar 2023 11:34:52 +0100
Message-ID: <CAFEAcA9w0H+j2EbgFDXACno1OF-dCFcb1OuCNksci9vHqW=RPw@mail.gmail.com>
Subject: Re: [PATCH-for-8.0 v3] target/arm: Fix non-TCG build failure by
 inlining pauth_ptr_mask()
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>, 
	qemu-arm@nongnu.org, Claudio Fontana <cfontana@suse.de>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Fabiano Rosas <farosas@suse.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: 3ab+oNn8pEiC

On Thu, 30 Mar 2023 at 11:31, Peter Maydell <peter.maydell@linaro.org> wrot=
e:
>
> On Tue, 28 Mar 2023 at 22:25, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.=
org> wrote:
> >
> > aarch64_gdb_get_pauth_reg() -- although disabled since commit
> > 5787d17a42 ("target/arm: Don't advertise aarch64-pauth.xml to
> > gdb") is still compiled in. It calls pauth_ptr_mask() which is
> > located in target/arm/tcg/pauth_helper.c, a TCG specific helper.
> >
> > To avoid a linking error when TCG is not enabled:
> >
> >   Undefined symbols for architecture arm64:
> >     "_pauth_ptr_mask", referenced from:
> >         _aarch64_gdb_get_pauth_reg in target_arm_gdbstub64.c.o
> >   ld: symbol(s) not found for architecture arm64
> >   clang: error: linker command failed with exit code 1 (use -v to see i=
nvocation)
> >
> > - Inline pauth_ptr_mask() in aarch64_gdb_get_pauth_reg()
> >   (this is the single user),
> > - Rename pauth_ptr_mask_internal() as pauth_ptr_mask() and
> >   inline it in "internals.h",
> >
> > Fixes: e995d5cce4 ("target/arm: Implement gdbstub pauth extension")
> > Suggested-by: Richard Henderson <richard.henderson@linaro.org>
> > Reviewed-by: Fabiano Rosas <farosas@suse.de>
> > Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> > Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> > ---
> > Supersedes: <20230328133054.6553-1-philmd@linaro.org>
> >
> > Since v2:
> > - Rebased (patch #1 merged)
> > - Addressed rth's comments
> > - Added R-b tags
> > ---
> >  target/arm/internals.h        | 16 +++++++---------
> >  target/arm/gdbstub64.c        |  7 +++++--
> >  target/arm/tcg/pauth_helper.c | 18 +-----------------
> >  3 files changed, 13 insertions(+), 28 deletions(-)
> >
> > diff --git a/target/arm/internals.h b/target/arm/internals.h
> > index 673519a24a..71f4c6d8a2 100644
> > --- a/target/arm/internals.h
> > +++ b/target/arm/internals.h
> > @@ -1389,15 +1389,13 @@ int exception_target_el(CPUARMState *env);
> >  bool arm_singlestep_active(CPUARMState *env);
> >  bool arm_generate_debug_exceptions(CPUARMState *env);
> >
> > -/**
> > - * pauth_ptr_mask:
> > - * @env: cpu context
> > - * @ptr: selects between TTBR0 and TTBR1
> > - * @data: selects between TBI and TBID
> > - *
> > - * Return a mask of the bits of @ptr that contain the authentication c=
ode.
> > - */
> > -uint64_t pauth_ptr_mask(CPUARMState *env, uint64_t ptr, bool data);
> > +static inline uint64_t pauth_ptr_mask(ARMVAParameters param)
> > +{
> > +    int bot_pac_bit =3D 64 - param.tsz;
> > +    int top_pac_bit =3D 64 - 8 * param.tbi;
> > +
> > +    return MAKE_64BIT_MASK(bot_pac_bit, top_pac_bit - bot_pac_bit);
> > +}
>
> Any reason for deleting the doc comment ?

Applied to target-arm.next with a doc comment:

/**
 * pauth_ptr_mask:
 * @param: parameters defining the MMU setup
 *
 * Return a mask of the address bits that contain the authentication code,
 * given the MMU config defined by @param.
 */


-- PMM
