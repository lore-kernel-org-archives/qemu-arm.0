Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp1608712ejc;
        Fri, 24 Feb 2023 01:59:26 -0800 (PST)
X-Received: by 2002:a17:903:1392:b0:19c:b781:fa8b with SMTP id jx18-20020a170903139200b0019cb781fa8bmr5300977plb.51.1677232765849;
        Fri, 24 Feb 2023 01:59:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677232765; cv=none;
        d=google.com; s=arc-20160816;
        b=nzB6aHGP4jjjhdxGJ0w+jniDU0cs0XBiVGHC/U4EYTDKMj7lVPKOfM0r2rSKVKIHnE
         0MNUiLhISYK6qY/lIZmF4+RAoVGbxPhTtXNj93a+9bbXkUaki08limf2fOskRkA1QilK
         91bRtkYwcBZ/GA7kIlbhwa5z+q9SWRgV1RyRFLi39K0LA/9x/8OQUJ1kMTsJzEBQNwWx
         Pao4sBATz8mjnTtzZ/iLX5eweulsk1ag8DBnxpo6jdESqa+BHXppACCWcLaTIBxKxBhU
         vzlTLTlatxGFokmWQNJycHEgJ139LRgYDAYxbo+12k7lmnhEvm9wnohGpyi9fKS7FnWD
         XZlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gbkSpVjcr4HHY/n2Jtehww2wQSJP+bzIlZmOCB9lhBo=;
        b=kdmxIqfkYSMxMMDoBrdaUEWR5q1GK2NOnJu5rLVLK8HeughX1XR2ph67Nd9WgMN8LP
         kT/zGFwKeDT5j9obdRfk2VhJd+5dSpv8DKZ1nkvmjrGzWa4QCD1w0kj6SQDf+hgKzRxP
         c8DXXo9jwutalTYqM8310j4hxkoxvORrXJ8p7LuVoAnvNYlX3MKIoUNwUtQbv0TgerfC
         fxBzMneiJDa+9Z/abUCW+mdftvS4NBOhoY6hOiVUdXpH+KSVemYa0mZbPJy12tXv0yG6
         cZLimuSnxqzaZCpKcwDJZsSJw9U6E005DyiMMNNWQY0ZkeDM56tyeOK3PT43pApwKrRt
         La4w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rUS3Laml;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id jk15-20020a170903330f00b0019a70a41e3dsor3203550plb.131.2023.02.24.01.59.25
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 24 Feb 2023 01:59:25 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rUS3Laml;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gbkSpVjcr4HHY/n2Jtehww2wQSJP+bzIlZmOCB9lhBo=;
        b=rUS3LamlYaBuxvQKYEY3NkakgnKsUWtEoH6CZYDk88B8d+SIY51P33Rn2kaY71+4MB
         zekRMmm0m/kJqXiaJHbD347zFF4WJZY1j33sSFmToHgM9NOGWCxy5aX5OtzwgNqBsrqx
         moc6QXpK+ZGUC5KMFywiAI7NSOPvevbRVmu0Cbhc07N18vgP8AfN0EEswVAvPzAWPZrO
         9JFc6jjPZbdRITFXjLjj5QbS1tG3gxrZdmfis42I4BXOwrR9cHtj6ZvbxLPNnGUpZtOX
         0w7+mJ/3Jmu/kXBpfVHLAbrZGypc+BhnlDEwjNq36xSLfLJbgnTdcN0Gofjcha+E18AS
         VEFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gbkSpVjcr4HHY/n2Jtehww2wQSJP+bzIlZmOCB9lhBo=;
        b=lT8qFYabeHp9e8tsSu8GsGEFJp/uB18dQn0p/RH89MgNfyHuDlIJv+TVFBW9bLXXNE
         OJRLObbziRGPAszL+liHzQqD+A+lBsLcpAAB5mQWIPC+H93qHYHikP5spxB8o60m5rR+
         nrCKoiDnn002ilnqucotb1gIXfOlFuIDIfYEWmVAM0CrcV5EYAZt5FkcKn7VEPkWJ6F7
         s8GmwY4uOpFUpiMISoCgTw1a0yLlncWhaVLJQkEBIXvNJwMoUm7JI5xY8wFcsUSMzUos
         jKdaRR8ULt9D1HfqkDkIAWWWT+Jj7XxIurY7SbfN9id0ur2kx34n8sgdZQoteS7i1GoT
         o1Ww==
X-Gm-Message-State: AO0yUKUuuoVWDUrQJ6y05jO/0SJHaaNL3r4AHY9J8C16rTykkHyOqXKA
	TegZ4z6JJXRxeCpgZQHEtLVR6LiVKPaVL2Qj3wSPf2D4KBmJpNNT
X-Google-Smtp-Source: AK7set+onb5RXYdCd/30wQAQZqev7dX6FGbgM0uV6WI3UWrBqqdka7T65eQ5ej338wPnqT9sR16OCplbyNa6YFQjcl0=
X-Received: by 2002:a17:903:1313:b0:19a:b151:eb83 with SMTP id
 iy19-20020a170903131300b0019ab151eb83mr2708730plb.13.1677232765202; Fri, 24
 Feb 2023 01:59:25 -0800 (PST)
MIME-Version: 1.0
References: <20230222110104.3996971-1-alex.bennee@linaro.org> <dddae7d3-4c18-04d3-198b-803b4c128de1@linaro.org>
In-Reply-To: <dddae7d3-4c18-04d3-198b-803b4c128de1@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 24 Feb 2023 09:59:13 +0000
Message-ID: <CAFEAcA8sxm7-TN89onqEaD5kpH5yoe5mTR-RPebqn64Frgj+-A@mail.gmail.com>
Subject: Re: [RFC PATCH] target/arm: properly document FEAT_CRC32
To: Richard Henderson <richard.henderson@linaro.org>
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: 1u/+kzSJqnco

On Thu, 23 Feb 2023 at 23:01, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 2/22/23 01:01, Alex Benn=C3=A9e wrote:
> > This is a mandatory feature for Armv8.1 architectures but we don't
> > state the feature clearly in our emulation list. While checking verify
> > our cortex-a76 model matches up with the current TRM by breaking out
> > the long form isar into a more modern readable FIELD_DP code.
> >
> > Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> > ---
> >   docs/system/arm/emulation.rst |  1 +
> >   target/arm/cpu64.c            | 29 ++++++++++++++++++++++++++---
> >   target/arm/cpu_tcg.c          |  2 +-
> >   3 files changed, 28 insertions(+), 4 deletions(-)
> >
> > diff --git a/docs/system/arm/emulation.rst b/docs/system/arm/emulation.=
rst
> > index 2062d71261..2c4fde5eef 100644
> > --- a/docs/system/arm/emulation.rst
> > +++ b/docs/system/arm/emulation.rst
> > @@ -14,6 +14,7 @@ the following architecture extensions:
> >   - FEAT_BBM at level 2 (Translation table break-before-make levels)
> >   - FEAT_BF16 (AArch64 BFloat16 instructions)
> >   - FEAT_BTI (Branch Target Identification)
> > +- FEAT_CRC32 (CRC32 instruction)
> >   - FEAT_CSV2 (Cache speculation variant 2)
> >   - FEAT_CSV2_1p1 (Cache speculation variant 2, version 1.1)
> >   - FEAT_CSV2_1p2 (Cache speculation variant 2, version 1.2)
> > diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
> > index 4066950da1..12e1a532ab 100644
> > --- a/target/arm/cpu64.c
> > +++ b/target/arm/cpu64.c
> > @@ -912,6 +912,8 @@ static void aarch64_a72_initfn(Object *obj)
> >   static void aarch64_a76_initfn(Object *obj)
> >   {
> >       ARMCPU *cpu =3D ARM_CPU(obj);
> > +    uint64_t t;
> > +    uint32_t u;
> >
> >       cpu->dtb_compatible =3D "arm,cortex-a76";
> >       set_feature(&cpu->env, ARM_FEATURE_V8);
> > @@ -928,7 +930,18 @@ static void aarch64_a76_initfn(Object *obj)
> >       cpu->ctr =3D 0x8444C004;
> >       cpu->dcz_blocksize =3D 4;
> >       cpu->isar.id_aa64dfr0  =3D 0x0000000010305408ull;
> > -    cpu->isar.id_aa64isar0 =3D 0x0000100010211120ull;
> > +
> > +    /* per r4p1 of the Cryptographic Extension TRM */
> > +    t =3D cpu->isar.id_aa64isar0;
> > +    t =3D FIELD_DP64(t, ID_AA64ISAR0, AES, 2);      /* FEAT_PMULL */
> > +    t =3D FIELD_DP64(t, ID_AA64ISAR0, SHA1, 1);     /* FEAT_SHA1 */
> > +    t =3D FIELD_DP64(t, ID_AA64ISAR0, SHA2, 1);     /* FEAT_SHA512 */
> > +    t =3D FIELD_DP64(t, ID_AA64ISAR0, CRC32, 1);    /* FEAT_CRC32 */
> > +    t =3D FIELD_DP64(t, ID_AA64ISAR0, ATOMIC, 2);   /* FEAT_LSE */
> > +    t =3D FIELD_DP64(t, ID_AA64ISAR0, RDM, 1);      /* FEAT_RDM */
> > +    t =3D FIELD_DP64(t, ID_AA64ISAR0, DP, 1);       /* FEAT_DotProd */
> > +    cpu->isar.id_aa64isar0 =3D t;
>
> Ok, so, this might be helpful for grepping, but it's not helpful for read=
ing the
> documentation, which on page B2-137 uses hex.

Agreed -- we write these functions and review them by looking
at the TRMs, and the TRMs specify the values of the ID registers
as straight hex values.

thanks
-- PMM
