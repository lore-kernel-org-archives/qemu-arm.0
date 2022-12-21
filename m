Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp5495242ejb;
        Wed, 21 Dec 2022 14:15:40 -0800 (PST)
X-Received: by 2002:a05:6a21:99a4:b0:a4:cb41:2910 with SMTP id ve36-20020a056a2199a400b000a4cb412910mr28439971pzb.36.1671660940402;
        Wed, 21 Dec 2022 14:15:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1671660940; cv=none;
        d=google.com; s=arc-20160816;
        b=cu/3gckZUeevtkwhdSYbvLPC5438dvR9xSmUoYdMnUobcLiCVVDfEAoOm+X/Gy3q5f
         AYcrrKvYQk8na9PpigvdGiccYhWzN5K7Kks3oyBJzlrgDWrdJE3vkbhBLXy6GsPQsG6W
         4jtig/TMcRjGM+dsyaX7hIr4UcFeJ1BIXqYI3fAih6I9xvfwWKFa2Tvpdyu8utGOQjwd
         hkcxlKeMr3GSAtMD7PkYKxLUeJlJPYO5l/Q5pWQrgudyZWd/0kKTUuN4bY0ftpjtOtfS
         ayTTg13CZrDd0SQsNW7BLipVbqsc3tFlLPbl7kqTBa7BpVu62QMTXYGzm3ClLp4B7It0
         /KAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=y8KyXpN2Tcof4jRsBvQILYb+rqKrJ697w4WJ0wu6Rm4=;
        b=d7O+I1n7gwK99Lapp9ZNWY191Mzz69yYjT8q7kggAfOufBdWVcSDLbw5NrVUEtRpSq
         DRAIH9hRLfb6EFj5CDpB4ERqB+BF1RWtkUWIbaB5TkU6mJuvtLR68rASQLqa1ZbrZ93t
         HKPYKyRRN/0RBErrgkZbMpDMdOUEydrczSNaUJwKpKdZk/I4Ure339EOQEu1dPTTRaaE
         jVYJDvkDjzOvdhcwdX6HZQeISXtOB6cB/1sOxEIyRKzoVSDGzxR/GSQqbXiqLfI+VcVX
         c2Brtbcquf1JzcAtqlk6eCwQpmJbFsAnD2CvXMD0ORFewvUraQYsFuaTNwH3coVvir/N
         3W1Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=x8gtQ8x3;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id q128-20020a632a86000000b004772edb91cesor7152799pgq.74.2022.12.21.14.15.40
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 21 Dec 2022 14:15:40 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=x8gtQ8x3;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y8KyXpN2Tcof4jRsBvQILYb+rqKrJ697w4WJ0wu6Rm4=;
        b=x8gtQ8x3a1IiJ+yy/4EvDfVewmabiFa+nJIDzKg1ynesd1+3aPP8tk0hHqzvc+Mz/u
         T0RE7a0Woaj6OTHCoj+rxEeg79LPQuObDhvp47fM96SVfw6P+1rTNZJAhLknoxIip6eA
         FRwb9ELTrGS5oE57bEILm9rE0K8HEKe4ly87PlGLq/FMYJ2WJtsOkSiVQH6QJhvBK76X
         vn8T2qpVgpbLR+mwN9OlWxuv788OjGOpWCC/xswuJW4UB523A/jaxk56EeVFbyYmySsu
         4YM5gYEyemRWWv2uNjW0fgzNrhx7SpskpC7EobnejmRJPonPZYPbYNpPF/64aRU6zF8d
         r9ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y8KyXpN2Tcof4jRsBvQILYb+rqKrJ697w4WJ0wu6Rm4=;
        b=x9vYQ0E9RMdq1Yve1biEYAeH+fUTxvmrkD4E50OuFVOr1Rq/1e4EjpK2YxceT58W4i
         mleNyWMxHQC6jt7YX9FRPplXNr0Z9vQNBlTYXhlnllHqqvv35MUCthColsuvyiVxjI1t
         fDEEJEmxNGxyJB2pPUbARuJjPRZA2XgBEkp8rZTSU38pIBHYui404ULrIlbwkdUYcMu5
         nemnu2I5+r/f32xvuo5TV434diZvYbwD+PESxpDsIL3wAm45btDuctcUSCk+mfXnl/zv
         W9zrqwMDOJkhJCibfc7cXYdZRaBPUONZgfUS1qik2DeA+TTBsV3q7czo4wrcr8XzfK2U
         UN6g==
X-Gm-Message-State: AFqh2kof+QsvjKU6TuOiwPzC4IbYI8utlOgf9j6vdWk9Hgh0MWEgHCLe
	Q/ocQUtxj5YNtQdEaIQX+sDTkGa58vsKARSgLM6Yecmt
X-Google-Smtp-Source: AMrXdXu2xkYmsTnTuq2VjmVee6HdNeYgYRy/TPo5uuTVbrcJ2ZMLZxMTPFZchVBNwmtpYC7763LytEX23jVwvU/xa5s=
X-Received: by 2002:a63:e20b:0:b0:479:18a:8359 with SMTP id
 q11-20020a63e20b000000b00479018a8359mr203134pgh.105.1671660939380; Wed, 21
 Dec 2022 14:15:39 -0800 (PST)
MIME-Version: 1.0
References: <20221213125218.39868-1-philmd@linaro.org> <20221213125218.39868-3-philmd@linaro.org>
 <CAFEAcA96ncqvN9iXybCd2SrVKJ9CKsu5t3_GtdNt1ZEDAkFt0w@mail.gmail.com>
 <e8c3fdcb-81f1-7067-217c-c49e8748b84a@gmail.com> <CAFEAcA_jH3Zn1cFfnvsd_GhiBj1bNKscs7S7cwFa+FnTC9QC=g@mail.gmail.com>
 <Y6AFLpDEkpS+muSJ@yekko> <CAFEAcA9CUtdLXKPOqC0uRCyA0xQFZ_SrJ62SSDvPKESaxL3X2A@mail.gmail.com>
 <Y6JeXJn1qCkeIzuz@yekko> <CAFEAcA96faOvyo9cqpTZm+U1iMpRphnxvXfUuqStonzGGcMTLQ@mail.gmail.com>
 <7ababaf9-9c00-37e8-a2d0-565b8de57010@kaod.org>
In-Reply-To: <7ababaf9-9c00-37e8-a2d0-565b8de57010@kaod.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 21 Dec 2022 22:15:28 +0000
Message-ID: <CAFEAcA_yh95V-szcDaX1p490FvWi_VwRz9FJVokGwiw3zqqi8w@mail.gmail.com>
Subject: Re: [RFC PATCH-for-8.0 2/3] hw/ppc/spapr: Replace tswap64(HPTE) by cpu_to_be64(HPTE)
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Cc: David Gibson <david@gibson.dropbear.id.au>, 
	Daniel Henrique Barboza <danielhb413@gmail.com>, =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
	qemu-devel@nongnu.org, BALATON Zoltan <balaton@eik.bme.hu>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Alistair Francis <alistair@alistair23.me>, Jason Wang <jasowang@redhat.com>, Greg Kurz <groug@kaod.org>, 
	qemu-arm@nongnu.org, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-ppc@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: yv3CvIziaZpJ

On Wed, 21 Dec 2022 at 16:03, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> On 12/21/22 13:33, Peter Maydell wrote:
> > On Wed, 21 Dec 2022 at 01:35, David Gibson <david@gibson.dropbear.id.au=
> wrote:
> >> On Mon, Dec 19, 2022 at 10:39:40AM +0000, Peter Maydell wrote:
> >>> OK. I still think we should consistently change all the places that a=
re
> >>> accessing this data structure, though, not just half of them.
> >>
> >> Yes, that makes sense.  Although what exactly constitutes "this data
> >> structure" is a bit complex here.  If we mean just the spapr specific
> >> "external HPT", then there are only a few more references to it.  If
> >> we mean all instances of a powerpc hashed page table, then there are a
> >> bunch more in the cpu target code.
> >
> > I had in mind "places where we write this specific array of bytes
> > spapr->htab".
>
>
> spapr_store_hpte() seems to be the most annoying part. It is used
> by hcalls h_enter, h_remove, h_protect. Reworking the interface
> to present pte0/pte1 as BE variables means reworking the whole
> hw/ppc/spapr_softmmu.c file. That's feasible but not a small task
> since the changes will root down in the target hash mmu code which
> is shared by all platforms ... :/

Don't you just need to change spapr_store_hpte() to use stq_be_p()
instead of stq_p() ?

> spapr_hpte_set_c() are spapr_hpte_set_r() are of a different kind.

That code seems to suggest we already implicitly assume that
spapr->htab fields have a given endianness...

thanks
-- PMM
