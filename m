Received: by 2002:a17:906:6951:b0:a28:f940:7a27 with SMTP id c17csp972572ejs;
        Wed, 10 Jan 2024 03:37:24 -0800 (PST)
X-Received: by 2002:a05:6512:3b21:b0:50e:b3b0:d5be with SMTP id f33-20020a0565123b2100b0050eb3b0d5bemr259427lfv.8.1704886644590;
        Wed, 10 Jan 2024 03:37:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704886644; cv=none;
        d=google.com; s=arc-20160816;
        b=cARyBpVTbjioSvp9ldob37Zr2yk2SQLvbCX9aPiHUbYjDg7WQAaRmiZWi0HAXAHuFm
         xCels9F6/Tsk32SqnzTF24c7N3TkVe1/w8J2lx7fXISzd5LwL+y4TrLwMnD7vGyTJAEE
         jHou+immPNYdLTIep2wh+QudzCu+Dk/DZeqXhheZDJTPDJMfJeKMly0ApMnyjRv4lptp
         Ssel1klRbEVITqBjR1Z5H/R5WnFofDODvcy7NQvamTa81uO7X6NAQydC+B8ItFcFukon
         HurWAB0oSvDZGa4vQZzvEzwbHFkslyWgYQ0tgBA1fhKiKCbQfNBz4BvAbDTyMMh+P8UL
         ZYlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kUB7mjlvBIbJbHnL3fj2sF87HU4S4WQhheWul9j1M7w=;
        fh=7i/fFyYncmXxiA3/EhHvVuknJdAqa2mpary7cCwat0I=;
        b=EisfpN5CGfyMZdEtR+sNc6suHaTJolBWt6zvY/8WtN5b0mjHUFhdhq8Is+PoUsyFKs
         d2979BO0JRoYQuF6t2tGMXXxL7BUjjD1u3vJajqDUyQs7DjKBAB/bv4ETj0Bva9pn9uH
         lFlqW4wOFb2/yRXQxjM4b6GX6k3FvKrTvB/YCbGxGwI+ZfjQ47R8RIDlN1pBfoagfUYl
         8t0Uwf1dEJWqAVgjJpCMW978Zmr/IhOZYhzUtl7Dg6wAxfKMSg4/RTHeSj/sqJdbIY3X
         +Zti1FlmPQjn5DtLbRkU+jvZbXF+vmPiHFOXgvGfqv7tLsC0sahvmSRtPkO7QZqDojNG
         PQww==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yidw+YO7;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id f15-20020a19380f000000b0050e7b5b2078sor1098137lfa.31.2024.01.10.03.37.24
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 10 Jan 2024 03:37:24 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yidw+YO7;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704886644; x=1705491444; darn=linaro.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kUB7mjlvBIbJbHnL3fj2sF87HU4S4WQhheWul9j1M7w=;
        b=yidw+YO7be+EdvlLAa669f5C1f2kmrFXEM+jxle8TaKWhqMkx7p0CDU4kfAiM7VcXs
         ofMny5d18r2igPf+Lqn027eoeKCYhLDPCXb5AZC/DOlduD8mD88875ANbOvrKwbogmGB
         2LBdu/2zDrUlsMH08CEIt/Igx9WVDMB1fa6sztHmiOYEbrBQ4yz/7jBhggHqoqSr+EHP
         yCMiNklVAXlwj7zlbiEKfqV1wS1QEtqkYm17I5od+DO7LAiZV6TuA3JQZdam/IkY9mYD
         45tyR8cdRv/Yk5ZlJJKVFFfM75rkuS/Q1lW2Lb8sjAmEPaA6rBt9jshwUa37JFSdDDu3
         Lypg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704886644; x=1705491444;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kUB7mjlvBIbJbHnL3fj2sF87HU4S4WQhheWul9j1M7w=;
        b=Pij8kcLbvKlk1aIDJMl/yv3jCaTD2MjCJTSKDEharnneS+3ms48f6iLXclAd/9/siL
         fkZ22rOd2xp0lXQcz/z+j1bSc4W1eKTjjINUw2mh5QC1w/lusq863GNWdK4LObVpbnOg
         flPylJldRpZHQgkQ3tHBeu/9A92/48g/uEtqp6d5jK+SzJVLrF363sWIeviu7IZ9WTQJ
         rib5gcdhoTGk67H5T323FFpr0zR39dzlyJXopl7GNlNJo6LCaEwiNh2lLGMkp6Fk/PMN
         gvW39fIHhL/cos+WJk4JiXhzTKnRfHW6GZt5RRsq7JRPEJOb32dMJyiDmQ/Fv3bZ0JKz
         UQ5g==
X-Gm-Message-State: AOJu0YxxIkoFyAoFVTcODm310vxuCPgY5Pn+cHTftTatLUPR2X4q2UpG
	YMO9x/xQw12IVnmWTWD1NZyvCskP0Dztt3vvODNT4KrypcYCT6ek
X-Google-Smtp-Source: AGHT+IEjHmxpiN3NPnIhYbRa6TqW9QCUyJE0OSvQJlOsnFvDu0u37Aoy+MPiVjc7TjSm27maBCRI6iqMbUc6kkdhBAQ=
X-Received: by 2002:a2e:b0d8:0:b0:2cc:e386:3773 with SMTP id
 g24-20020a2eb0d8000000b002cce3863773mr245325ljl.58.1704886644105; Wed, 10 Jan
 2024 03:37:24 -0800 (PST)
MIME-Version: 1.0
References: <20240109180930.90793-1-philmd@linaro.org> <20240109180930.90793-2-philmd@linaro.org>
 <6c877f5e-e0f2-4ef1-920a-df850484c358@linaro.org>
In-Reply-To: <6c877f5e-e0f2-4ef1-920a-df850484c358@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 10 Jan 2024 11:36:50 +0000
Message-ID: <CAFEAcA-Gmv3MFngNp+B5PxVBx+kZ941xGgF1AvXrXq+Xn8DWLg@mail.gmail.com>
Subject: Re: [PATCH v2 01/14] target/arm/cpu: Simplify checking A64_MTE bit in
 FEATURE_ID register
To: Richard Henderson <richard.henderson@linaro.org>
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
	qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Leif Lindholm <quic_llindhol@quicinc.com>, Radoslaw Biernacki <rad@semihalf.com>, 
	Kevin Wolf <kwolf@redhat.com>, Markus Armbruster <armbru@redhat.com>, 
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>, Igor Mitsyanko <i.mitsyanko@gmail.com>, 
	Rob Herring <robh@kernel.org>, Alistair Francis <alistair@alistair23.me>, 
	Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: 1A7BKNqH/uoe

On Wed, 10 Jan 2024 at 06:01, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 1/10/24 05:09, Philippe Mathieu-Daud=C3=A9 wrote:
> > cpu_isar_feature(aa64_mte, cpu) is testing a AArch64-only ID
> > register. The ARM_FEATURE_AARCH64 check is redundant.
> >
> > Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> > ---
> >   target/arm/cpu.c | 3 +--
> >   1 file changed, 1 insertion(+), 2 deletions(-)
> >
> > diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> > index 1c8b787482..c828b333c9 100644
> > --- a/target/arm/cpu.c
> > +++ b/target/arm/cpu.c
> > @@ -1690,8 +1690,7 @@ void arm_cpu_post_init(Object *obj)
> >       }
> >
> >   #ifndef CONFIG_USER_ONLY
> > -    if (arm_feature(&cpu->env, ARM_FEATURE_AARCH64) &&
> > -        cpu_isar_feature(aa64_mte, cpu)) {
> > +    if (cpu_isar_feature(aa64_mte, cpu)) {
> >           object_property_add_link(obj, "tag-memory",
> >                                    TYPE_MEMORY_REGION,
> >                                    (Object **)&cpu->tag_memory,
>
> It is not redundant.
>
> If !AARCH64, then the isar registers tested by aa64_mte are invalid.

Ah, I think I steered Philippe wrongly on IRC on this one
because I forgot how our feature checking handled this,
but yes, you're right.

-- PMM
