Received: by 2002:a17:906:3683:b0:98d:b2f5:1316 with SMTP id a3csp773445ejc;
        Thu, 10 Aug 2023 08:58:27 -0700 (PDT)
X-Received: by 2002:a05:6512:110e:b0:4fe:df7:bcf1 with SMTP id l14-20020a056512110e00b004fe0df7bcf1mr2439462lfg.57.1691683107579;
        Thu, 10 Aug 2023 08:58:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1691683107; cv=none;
        d=google.com; s=arc-20160816;
        b=yI+NNeW6J6F7/PD7F5P6PJMnbOcBP2pUB12HJXSjxJpJbJ3RBw9tEPXlqpkf8EAgrA
         d2k7Mnu0LVJocyEOTJgfTKir6S0Ed9TBpanmK96ethSwdKsNgmuwPxAAwOxfrjGOImeH
         6a4hdsl/GJwQJZLTSUsFP02CqKyF3NA0I9xPax5IhNa1ecA0zQNcTjBPxgcnJdkhSowv
         MV7B9zWCaaWClbpzEPqmjJt++h/+9LxLmcgsEPvxD2Lae92i18Valc0GDRpYBfsmy7r3
         XPpBcDX4l1WmgfeMNBDIzvw/5LlqEs+x6PMUcc0PWXZd4TKh0x32Q8D5xNbzFqEjAQQl
         SqzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MVy0qRrVryPm5pUGMlP2xUZofAO7F8EQp9yGVBbD7gc=;
        fh=qpGNqicnXQk8cqGyh74ag/Yc2bonYT7zySThTyn6rDc=;
        b=DzkCvVzIlVw2mrLyjSOgrT+vs3lkOIsPjV6B1XjCVqtt8vsUh+Qy57qkcTqzp31nM/
         E4GH/MtYDO8mk7bLZeiuwPhDky/4N0rCvrZrQUNxrgabiRI0dT4z7msSKo0Rmr/TbHDU
         W1Pr4e+Oe9N+leymXauZKHbldT8zDsrpv3rA3Ug0JnmRP6ULqVoaASzHl2trJr/TcIC/
         HgKN0kZF+WfKBu6EYUhheHrT8+ziG5u3zqsc/JWKOSyezCRNya7ABnCbbQq8nPx5Eg7w
         VFbWIAsrECuW1l4/H+dsPWCZyNUVBTw6uxArXOw7ycQNf4p2AmJRfVVDEis1Qz/j/lhv
         Olyg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UeAPvk0H;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id z3-20020a196503000000b004fe239a497fsor742353lfb.13.2023.08.10.08.58.27
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 10 Aug 2023 08:58:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UeAPvk0H;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691683107; x=1692287907;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MVy0qRrVryPm5pUGMlP2xUZofAO7F8EQp9yGVBbD7gc=;
        b=UeAPvk0HnRVSqKOdQW2KEwaMRXvm9GCTfUjGeAafgtkceC3UK9q+5p/oUBe7jPOyA3
         g5b3JOnvCBVSqKjgO5UgBSejCgNinhh48wqxIb/5PaDKYwtCAWMyLI2PhVlnfIm62ANc
         s0Zu0mlDwQKWk85r8hUg9LhyIRebCRAb0PK+kDFCYHbrf90c7RA9nYCVgunA1tpp66oS
         dvgq++l3PVa9kXulQz/72Sva9wGwlxYB9tAm3Bu7yWjFo1fp6nv3Divf+W3cn1DFBCTj
         JsDGxCOmObvnZE39LyfAfzJfTpy2dRReIrGGKAv243a9PHrsXa0UQxozDMGM7LoCQqkA
         pUAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691683107; x=1692287907;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MVy0qRrVryPm5pUGMlP2xUZofAO7F8EQp9yGVBbD7gc=;
        b=HmEym8yc0+lkObqFaGBnqTX0rFQapiOxeHqH//lW6kaC7BeluwLxzoI13RMPG6cAaG
         Pfs9w0rY/aOhmNO7JctXIM7vPmIEM8DtjHC2TiSImkKzF7+5n9ea8iKcJD6lGqKGwseP
         AT222cMgrFouglV37zN2nL1Uj1RDXVsVw/ut8h4plq+OxpGbjfQmk3RjpjFrSov23POw
         m89NdmkvlZSkWP9Zr076IS/vRNpr/+deJ8cm/Tk+GuHt6LDxHeJ2O6yYFHuDfJj48QfQ
         Szido2M5Yf8TmDi7J4WaoPVZzF9xqmet5zxqSiGy1PdZWJFAQXhIOjUw/TgCXpxzl/yx
         dpNQ==
X-Gm-Message-State: AOJu0YxzkmSeXY76j8oU0dw2J75SS95S0aI6p4yeXo8zNceLoyqKiMP/
	7s9hPkTqvRh3MVjPHeDeEeeo65D+zTAGdbEjcTKjtTw5M0coc1IALu0=
X-Google-Smtp-Source: AGHT+IGYEGIUqx27S9WcJgHf6DRwRpIeCAN94mDinMoCMzb4w81urpg2OwO8lyW0MEGmEsoHuiYwtvkoB+N4BiW81tU=
X-Received: by 2002:a05:6512:313c:b0:4fe:7df0:41ab with SMTP id
 p28-20020a056512313c00b004fe7df041abmr1697661lfd.17.1691683107104; Thu, 10
 Aug 2023 08:58:27 -0700 (PDT)
MIME-Version: 1.0
References: <20230810153640.1879717-1-alex.bennee@linaro.org>
In-Reply-To: <20230810153640.1879717-1-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 10 Aug 2023 16:58:15 +0100
Message-ID: <CAFEAcA9bOS7tJDe_TRKOUGFcCDq_CjUfzAF7dYYRJbZA=5hvqw@mail.gmail.com>
Subject: Re: [PATCH 0/8] some testing and gdbstub fixes
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, Ilya Leoshkevich <iii@linux.ibm.com>, 
	Yonggang Luo <luoyonggang@gmail.com>, Beraldo Leal <bleal@redhat.com>, 
	Richard Henderson <richard.henderson@linaro.org>, 
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
	Thomas Huth <thuth@redhat.com>, David Hildenbrand <david@redhat.com>, qemu-arm@nongnu.org, 
	qemu-s390x@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: JuXcqb5TF/uD

On Thu, 10 Aug 2023 at 16:36, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
> This is mostly gdbstub focused but I cleaned up some bits while I was
> in the testing makefiles. This is mostly to make the "check-tcg"
> output as clean as possible without ugly line wraps. I tried to
> eliminate the gdbstub info() output but sadly this is harder than
> expected.
>
> I've tweaked the gdbstub handling for Ctrl-c packets as suggested by
> Matheus. While I was there I also noticed we were being a bit precious
> about gdb sending preemptive ACKS so I fixed that as well.
>
> I don't know if this is all late 8.1-rc material but its fairly simple
> testing updates and the ccache stuff from Daniel should help as well.

At this point in the cycle I would favour putting in
the minimum that actually fixes bugs / test failure issues.

thanks
-- PMM
