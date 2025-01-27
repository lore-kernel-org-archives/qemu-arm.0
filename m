Received: by 2002:a17:504:1e0a:b0:1be9:327d:8ee3 with SMTP id i10csp2322951njk;
        Mon, 27 Jan 2025 01:54:42 -0800 (PST)
X-Received: by 2002:a05:6902:210f:b0:e58:37c9:b66a with SMTP id 3f1490d57ef6-e5837c9b848mr10998963276.27.1737971681895;
        Mon, 27 Jan 2025 01:54:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737971681; cv=none;
        d=google.com; s=arc-20240605;
        b=MYKP21qjrt9DjInKFMdgLsNS3cldCMop15WDkOkgNX2tMmvCD5CY1/W0LdIl8PmY5E
         6CVIz5r3SwgUAf/Br7z/O7xicoq5UpkarWtRmnMCULSfe/iAIkhTfPMch2ONz910LgTx
         VHqI8BHwGR1HGYl3O+1hVhWxljLXEGCmcQmQj7gDR1u8XD5A5STm4zNO0VkWyAjSHEIw
         ZyQUr+u4njX2PWrbUT7Mscj1REKADrwm73BhWjA+rO1EXC5oj90oFEHSwKTR5dZNGGrp
         q8/XMsGqKo9WUUpb6vLCpDtJQdE07ZLjQ2BFr3u39/32Th3vdHg0JTGRC29SCrqbq+M9
         sTJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=SaFx5AsSluXaTySUd0lAk0jzO07EJ6XLZxNTSbwUjHY=;
        fh=lyYd5u/xP7MkSXnqR0B3Lug5GOOGoEqAPzvNtygcaUQ=;
        b=H80A8Mg1R6XRfwqpEy5zfCow4W/NxpHA55ZsgKAls4ONp//Q2x2/VfrynMWahqJhhT
         9rJqDyyP7Gam98aWrbGVeFqNjjVcTo/ORyw5LfLQKbL5wv/mSmKL0qH5QdcnFOR95x0F
         mDRxW5T9dnF4R6mfZ6+r+lV/QUNZAg7qvZ1Y8KOqQMWDWqUknAWEYKIngdQNGrCrVanw
         rkoObV8IMsctj5j5j4PP6+mv1l1Lzd7+C7Jpvu0InHkZbP6RX3xOEkCV7Rm2YL+qvBlN
         670XTECde4wc5YKZhhq/TqsGfWtdvfr6FAIbleH3E0/suM9+wLHWbm/e42WWDFbA1dt+
         JV2w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ycOiQMw3;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 3f1490d57ef6-e583b7697e3sor3619247276.6.2025.01.27.01.54.41
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 27 Jan 2025 01:54:41 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ycOiQMw3;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737971681; x=1738576481; darn=linaro.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SaFx5AsSluXaTySUd0lAk0jzO07EJ6XLZxNTSbwUjHY=;
        b=ycOiQMw3N1Y6PDJUGdnjEnLfhKvb8P1YuYki/ce6bKEn7fYbD1YfcabkGpIdQiS2mv
         UW1jgOCFD+py5Mfx3P84XD9C3sgaj9X/q7Eviv/IyisdPFs9oFM8FvHF5+x0aJmEAEu5
         SoJG+wf9B91Os3kQjS+GpzhnIT3WSY4JmZoBDndczTfoaDBNoh+Ky+FUYjJDju3prNIC
         s6bUMpEDKQDPXblRmqpv6em+9nV96F5SjU/D8C/tiDg7jl/FVqfw/8tNSguaQoBdV6aB
         NZRmikP9aq6hgO2H4N2nZsZQwvFP6Qe+KzTLAmyiqcY7HMy2I3ND7vHYU0UQxPlRQl21
         v/sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737971681; x=1738576481;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SaFx5AsSluXaTySUd0lAk0jzO07EJ6XLZxNTSbwUjHY=;
        b=PjG5xKqlUZVMF4Y+jVeF4nhXykRnWjehKVtb7r4q4/IxqWxhLwestGWsQkbdP0Yt5w
         VpOxodk0Mw7xJmw0JA8ghvE29mcCxb3LrbwBx8xYnwi+d61sT4Z4+I6sDDJ0IwU7EKl0
         g2OWsNNRZOI+161biSaPLLNwQtTVTwip2FrZ+/xzLFkYvGLDzVFc0/nAOGaigJgSlmgu
         X7rElPQYY955YCWegS3bqg2+iN1iTK4YRwbZzfjjGRbVY7kieK8T9Z70m8kPcfTddxGy
         qRf0I9WvD/+D4HDQiQnyvZXVQowlZIRddTXaftESyHuhCkHak2d8t6wHrf7j0mkO21G5
         AOAw==
X-Gm-Message-State: AOJu0YzojkDIsbQM2zL9AwtgjPcam12B8Gd39+NGNt7zsr215IoRXoJN
	GXOHrYx0fM0Q6V5LrYZCBlynvK52PBIbke/Hl2tQ1NZTNnenEU6e8/rkBOWQdGafWmaEH6ZBS9J
	/LJG3taHYh8NuTi6ij0CspOAq/igpeu9h7r3+VDo20RVYUZpl8GQ=
X-Gm-Gg: ASbGncvDdaRGLA21cCotC6qepmmQw80roO3tFGw4SvjSatLk8Zfz+0nK2ILdqpC7xeU
	Rd9txy2AvfhH5/2q47adRlrLJKqfG1Hjr97GLrSJEWNwBEIXcvKwxit8FWGhAMAo=
X-Google-Smtp-Source: AGHT+IFdfq8MVmjFTGY6IdNHjHFJGE/2PTlrrVXChNXrIH2RY6s0n6Uz2li8ZSo01vnWiwhkYGbo/9MPHO5uCTKuHWY=
X-Received: by 2002:a05:6902:10c8:b0:e58:30dc:615b with SMTP id
 3f1490d57ef6-e5830dc66edmr9480156276.22.1737971681470; Mon, 27 Jan 2025
 01:54:41 -0800 (PST)
MIME-Version: 1.0
References: <20250124162836.2332150-1-peter.maydell@linaro.org>
 <20250124162836.2332150-3-peter.maydell@linaro.org> <87r04si15d.fsf@draig.linaro.org>
In-Reply-To: <87r04si15d.fsf@draig.linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 27 Jan 2025 09:54:30 +0000
X-Gm-Features: AWEUYZnFn4dk-Uh-xNZQkU1dCUCT8VIaBX6KZlRlUoBeC841rKowp6mjgEaUTww
Message-ID: <CAFEAcA-LrHsiazeVa1Zx9QrjJsaDvOe0vGtk9RQYUOpiEyDqFA@mail.gmail.com>
Subject: Re: [PATCH 02/76] tests/tcg/x86_64/fma: Test some x86
 fused-multiply-add cases
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: f2r0g4Qm5fXK

On Fri, 24 Jan 2025 at 17:15, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
> Peter Maydell <peter.maydell@linaro.org> writes:
>
> > Add a test case which tests some corner case behaviour of
> > fused-multiply-add on x86:
> >  * 0 * Inf + SNaN should raise Invalid
> >  * 0 * Inf + QNaN shouldh not raise Invalid
> >  * tininess should be detected after rounding

> > +static testdata tests[] =3D {
> > +    { 0, 0x7ff0000000000000, 0x7ff000000000aaaa, false, /* 0 * Inf + S=
NaN */
> > +      0x7ff800000000aaaa, 1 }, /* Should be QNaN and does raise Invali=
d */
> > +    { 0, 0x7ff0000000000000, 0x7ff800000000aaaa, false, /* 0 * Inf + Q=
NaN */
> > +      0x7ff800000000aaaa, 0 }, /* Should be QNaN and does *not* raise =
Invalid */
> > +    /*
> > +     * These inputs give a result which is tiny before rounding but wh=
ich
> > +     * becomes non-tiny after rounding. x86 is a "detect tininess afte=
r
> > +     * rounding" architecture, so it should give a non-denormal result=
 and
> > +     * not set the Underflow flag (only the Precision flag for an inex=
act
> > +     * result).
> > +     */
> > +    { 0x3fdfffffffffffff, 0x001fffffffffffff, 0x801fffffffffffff, fals=
e,
> > +      0x8010000000000000, 0x20 },
> > +    /*
> > +     * Flushing of denormal outputs to zero should also happen after
> > +     * rounding, so setting FTZ should not affect the result or the fl=
ags.
> > +     * QEMU currently does not emulate this correctly because we do th=
e
> > +     * flush-to-zero check before rounding, so we incorrectly produce =
a
> > +     * zero result and set Underflow as well as Precision.
> > +     */
> > +#ifdef ENABLE_FAILING_TESTS
> > +    { 0x3fdfffffffffffff, 0x001fffffffffffff, 0x801fffffffffffff, true=
,
> > +      0x8010000000000000, 0x20 }, /* Enabling FTZ shouldn't change fla=
gs */
> > +#endif
>
> We could extend the multiarch/float_madds test to handle doubles as well
> (or create a new multiarch test).

This test case is specifically testing a corner case of x86
semantics -- on Arm, for instance, you would not get the same
result/flags, because Arm does tininess and flushing-of-denormal
before rounding, and Arm does raise Invalid for 0 * Inf + QNaN.
So I'm not sure that a multiarch test would be possible.

-- PMM
