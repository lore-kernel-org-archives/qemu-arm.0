Received: by 2002:a17:504:3a8f:b0:1be9:327d:8ee3 with SMTP id g15csp1051465njf;
        Mon, 2 Sep 2024 03:35:51 -0700 (PDT)
X-Received: by 2002:a2e:93c3:0:b0:2f4:fbcb:8efe with SMTP id 38308e7fff4ca-2f610946fe9mr79621071fa.42.1725273347448;
        Mon, 02 Sep 2024 03:35:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1725273347; cv=none;
        d=google.com; s=arc-20160816;
        b=d6kHzMCUKMGEJSS8sM6Sw9c2U3yaLf+j/Nz8/zeDlMXKtai7Wu85r/vHGfb3+YIel+
         ufhfN/XlO6cfxCDo0vh/EKdYnQBYEkxNk7YwM5ZZmUP/P2JOsTfO2UY+I/XrANrtT3Pw
         xdEULhsHE+lutVIMbwmQvnolL+s+wa0+A9QfSJL7bzMVgKxlDiWZoeRGei2lrMmeRskE
         Nu9Rpd10D6CDZR+3539PsYl5+A1OuR3Zq1uPnBKWtD4ejz6QqI8MFhJsMUzKFXzOCvNp
         cU3juY3GVMe+ZCkaNzjJN34wqd6eHq7MRwGpihFwPJ/uDnXMKFU0bSAQjeGf35Uy7boC
         n5RA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DrO0NN7TpZLbpe+HBSCuoRGUUnzv9V5wyRAMMNfsEZU=;
        fh=pwVHLwDaRhnsZMPKZVffNr+OzEPvNHnof6lMuY5AQQI=;
        b=eK8ePs9hQYDUx9sOttJfGUeYltZZLyt3OgOVORg9sBQnmhWnY0v+oeyeaFpPdyGk1J
         nCubE+Oh94NtdrD8jWNDfd4ZE/4MRyf1zE86YZItMqxhH8sVOpVWt5GGTvc808/Hi2KL
         F12W2w5Lc8l+qUvrc0HdvwCJNaWZsxvNiNKWkxdXlZQDkM+Ob+6Km3++C108tzIb2utf
         ZH38/CwmWBZL35foUpJWtM5oBjGgeEXlQdMJG3bSOcHt3ndONPiBuLVWhzcIDgTrfGPM
         94xGRKeEmHGG1BrpHBAm5/O8yAwbiK3AYLF80Mcofh+pMyxt1XGJqLPbA3Xs50soIsRS
         DJBg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YjzBZXPH;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 4fb4d7f45d1cf-5c25db96543sor311725a12.12.2024.09.02.03.35.47
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 02 Sep 2024 03:35:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YjzBZXPH;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725273347; x=1725878147; darn=linaro.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DrO0NN7TpZLbpe+HBSCuoRGUUnzv9V5wyRAMMNfsEZU=;
        b=YjzBZXPHmToJ6A6b2hySEUSC8ioBsSFiD9DCTx57tFYQgFtAfkYMyprs2Y51Ox/rdq
         EQScPgb5rAwMCs5wpXKL3G74Tn+tvoE4xIhjrlxL4Dc3TUEDssE32spm0V1LiulhCpxP
         t0z1ZPoDbmNmAm6R5VbUEDDiH3E19db79/8F22HtaAQ+z2rJdew1WFoK9VBukQdLrchp
         SW42Urq0/mwtgQdqcD0FcsiJ0fSbV4gn5z31E4oRnc8B3Y52EvmdBEpzhQX/mUMmA6JK
         04ygRCE4U1wY//01cahLSx3jTeC8XvPqt0BLzkwX8W7n60OdczHeHUVRhR2h2f6JM2mD
         jdkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725273347; x=1725878147;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DrO0NN7TpZLbpe+HBSCuoRGUUnzv9V5wyRAMMNfsEZU=;
        b=AwWxf8Y/Zx9Uw4VN6CsUhD5o/PoOKrSjQEJJyu0Yx0xnPpvQtelnE5ESVtY4sUVGif
         5iQgv+T1HogdCa2CdODLbpHSYCn/YccFQtBxfZ/ru3vA2DaVC/AX5v0vJZMS6Sz9QNhk
         +DedApiQwsfNdnpk1Quy0BvM0aLqtPtMT7RT0Ix6lSagMyTaEDB4UneLpU5Xg+dlZLXL
         vzmXE/lVWMzXaunoiDx8neVPaEJ7YnESZEAZYYkiQX4aEXdSaE45qYu42HucavIG9jcU
         3dMXj0ZNBnSBm1zqXN2shz7fuQq8/g555gZTdnWqyBoav4jmMG/KoK+ghtUpjwHrjpAo
         GmNA==
X-Gm-Message-State: AOJu0Yw9VuI6q6oKYDdZ1m47IeTzf6MhM6HZZKjdTNzY3v/qN54WNJtK
	aC4f0yKKLzDBLz66EnfxNl4i/J30CLd0pDhdea4xoTrmfINOWn5tIw9EEX13wqzJxMamlwaRTdJ
	vttVIeF9sLlDkfNHwsuiAroKY4vi5RAVXtpSkPBbtplpoNhplNY4=
X-Google-Smtp-Source: AGHT+IEbxZxFAA4AAeN0VR5sa2RzmvdaswtRdfS6t+GR2BmntHwO/d9tsKFbmP69W1JivmXdZ6Rvun7SRURy5WSXTxI=
X-Received: by 2002:a05:6402:1d56:b0:5c0:ad76:f70e with SMTP id
 4fb4d7f45d1cf-5c25f22d8a6mr1440048a12.6.1725273346716; Mon, 02 Sep 2024
 03:35:46 -0700 (PDT)
MIME-Version: 1.0
References: <20240830184713.224-1-alireza.sanaee@huawei.com> <87r0a2cpsq.fsf@draig.linaro.org>
In-Reply-To: <87r0a2cpsq.fsf@draig.linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 2 Sep 2024 11:35:35 +0100
Message-ID: <CAFEAcA_4E5j-M+iKnivdWJRkYUvXD7R_hq-=J=_=w701xOdh7w@mail.gmail.com>
Subject: Re: [PATCH v2] target/arm/tcg: refine cache descriptions with a wrapper
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: Alireza Sanaee via <qemu-arm@nongnu.org>, qemu-devel@nongnu.org, 
	Alireza Sanaee <alireza.sanaee@huawei.com>, linuxarm@huawei.com, 
	richard.henderson@linaro.org, shameerali.kolothum.thodi@huawei.com, 
	Jonathan.Cameron@huawei.com, jiangkunkun@huawei.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: ZXhJhL7tQL2b

On Mon, 2 Sept 2024 at 11:28, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
> Alireza Sanaee via <qemu-arm@nongnu.org> writes:
>
> > This patch allows for easier manipulation of the cache description
> > register, CCSIDR. Which is helpful for testing as well. Currently
> > numbers get hard-coded and might be prone to errors.
> >
> > Therefore, this patch adds wrappers for different types of CPUs
> > available in tcg to decribe caches. Two functions `make_ccsidr32` and
> > `make_ccsidr64` describing descriptions. The 32 bit version receives
> > extra parameters that became unknown later in 64 bit.
> >
> > For CCSIDR register, 32 bit version follows specification [1].
> > Conversely, 64 bit version follows specification [2].
> >
> > [1] B4.1.19, ARM Architecture Reference Manual ARMv7-A and ARMv7-R
> > edition, https://developer.arm.com/documentation/ddi0406
> > [2] D23.2.29, ARM Architecture Reference Manual for A-profile Architect=
ure,
> > https://developer.arm.com/documentation/ddi0487/latest/
> >
> > Signed-off-by: Alireza Sanaee <alireza.sanaee@huawei.com>
> > ---
> >  target/arm/cpu-features.h | 53 ++++++++++++++++++++++++
> >  target/arm/cpu64.c        | 19 ++++++---
> >  target/arm/tcg/cpu64.c    | 86 ++++++++++++++++++---------------------
> >  3 files changed, 105 insertions(+), 53 deletions(-)
> >
> > diff --git a/target/arm/cpu-features.h b/target/arm/cpu-features.h
> > index c59ca104fe..00a0f0d963 100644
> > --- a/target/arm/cpu-features.h
> > +++ b/target/arm/cpu-features.h
> > @@ -1022,6 +1022,59 @@ static inline bool isar_feature_any_evt(const AR=
MISARegisters *id)
> >      return isar_feature_aa64_evt(id) || isar_feature_aa32_evt(id);
> >  }
> >
> > +static inline uint64_t make_ccsidr32(unsigned assoc, unsigned linesize=
,
> > +                                     unsigned cachesize, uint8_t flags=
)
> > +{
>
> isn't this returning a 32 bit value?
>
> > +    unsigned lg_linesize =3D ctz32(linesize);
> > +    unsigned sets;
> > +
> > +    /*
> > +     * The 32-bit CCSIDR_EL1 format is:
> > +     *   [27:13] number of sets - 1
> > +     *   [12:3]  associativity - 1
> > +     *   [2:0]   log2(linesize) - 4
> > +     *           so 0 =3D=3D 16 bytes, 1 =3D=3D 32 bytes, 2 =3D=3D 64 =
bytes, etc
> > +     */
> > +    assert(assoc !=3D 0);
> > +    assert(is_power_of_2(linesize));
> > +    assert(lg_linesize >=3D 4 && lg_linesize <=3D 7 + 4);
> > +
> > +    /* sets * associativity * linesize =3D=3D cachesize. */
> > +    sets =3D cachesize / (assoc * linesize);
> > +    assert(cachesize % (assoc * linesize) =3D=3D 0);
> > +
> > +    return ((uint64_t)(flags) << 28)
> > +        | ((sets - 1) << 13)
> > +        | ((assoc - 1) << 3)
> > +        | (lg_linesize - 4);
>
> This is a nice improvement but using deposit() will ensure you don't
> accidentally overflow fields with the shift/or combos. So something
> like:
>
>   uint32_t ccsidr32 =3D 0;
>   ..
>   ccsidr32 =3D deposit32(ccsidr32, 28,  4, flags);
>   ccsidr32 =3D deposit32(ccsidr32, 13, 14, sets - 1);
>   ccsidr32 =3D deposit32(ccsidr32,  3, 10, assoc - 1);
>   ccsidr32 =3D deposit32(ccsidr32,  0,  3, lg_linesize - 1);
>
> And leave the compiler to simplify everything (not that it matters that
> much for an init function).
>
> Actually I note CCSIDR already has some field definitions so it would
> be:
>
>   ccsidr32 =3D FIELD_DP32(ccsidr32, CCSIDR_EL1, LINESIZE, lg_linesize -1)=
;
>
> etc. Although I notice it two sets of defines to account for FEAT_CCIDX

Mmm. Though I feel like we (me absolutely included) are rather
getting into bikeshedding a fairly simple refactoring patch...

thanks
-- PMM
