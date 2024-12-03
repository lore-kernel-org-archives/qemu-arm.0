Received: by 2002:a17:504:6601:b0:1be9:327d:8ee3 with SMTP id h1csp3888179njk;
        Tue, 3 Dec 2024 09:46:53 -0800 (PST)
X-Received: by 2002:a05:6402:42c3:b0:5d1:1f1:a283 with SMTP id 4fb4d7f45d1cf-5d10cb4f0a1mr3278211a12.4.1733248013124;
        Tue, 03 Dec 2024 09:46:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733248013; cv=none;
        d=google.com; s=arc-20240605;
        b=ksTTZELuHhTPov5ECSZRWRTMXv2+DKT/iXEalZ5a7Zkt61U6JKewhxZCUnbO/bLBY1
         DkbsFsUbPrjORdVFJg27qrtp9iHiQSF87dj/r+Ij7J/DB1LEBIVazY2vlr698nNOeyoy
         nAGJIZH17tIwVRkXs9KB8deYX+t2ILmKJg75vs49eOF4IY4YOR6NqwAJrojyMJ7EEcJm
         J7SqaIAXbVsojjE2uEmU5CaTW2Ju2GDaIhBNfgMIj61ozvwpQ/o8DYqfkG0wrhcIJQuo
         oNHV0BjaA7dgrnug7bst1Qs3DwqHy91CT4NlLiJebHPKVO07rE6V7ubF8Cr7m1+fl6Qp
         /i5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9rIgzebc7Ut/Z/kOC4QNifJHH66qu4x+BvNy4EkN7pA=;
        fh=qc/cET6YHlVMoUePx5isClG4GWWNkIN/kIRaqxCeAes=;
        b=c7IMj7D3mwPMmEQnJS8ryYmwv1QFfwBwsGs8bRNhAcflMvskY0sufbFYeeflHsul3j
         bcaQH+pP2BW5tadugl4ncJTi1eAwzdv2tb43qDyEWaKLxobDDwUhDJi6NtWACqR8Lln5
         mB1LsOJiSjP03sLfvCG+fWXPOPXjo21NsipqoltjVue4WepLdOv/MTVHCJHekc+pPJ+v
         dvY8hi395hBs1QutQ82Eyjh8OBqKouZhmhFUmxi3vEZNqjfv/h0q40oiHE6oVhJ6CYCV
         QOnhj3eB0YpVwhuhSA4XwsQoTWVjmwfJc6Eim9oWaidLYyy1+7q6u1D0sIIj3NdOzuWh
         7YNg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="KdW/mk7M";
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 4fb4d7f45d1cf-5d0c905a8a9sor2392519a12.12.2024.12.03.09.46.52
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 03 Dec 2024 09:46:53 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="KdW/mk7M";
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733248012; x=1733852812; darn=linaro.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9rIgzebc7Ut/Z/kOC4QNifJHH66qu4x+BvNy4EkN7pA=;
        b=KdW/mk7MowjKGVgLc6OZknX6ARA55bl0MhxU2WcWSzgkasXUR3sMEl52z2772bcM5y
         oi8pVWjAb5NBk8Z8x5ogsxYv4NTxQ7beQfzLhMUWvbyv/r6n4w1n02fi7iiL+2DGZeYf
         SN6+qNGJXnlZzb56hlRF1w5UsGwZvRBpb3dHeO2QsPjO6aWIziVjRzBnVnI/Pb5HXT2i
         F8/T2JZuP2ZLPwoMmVrUHKwigCCiBfj7cJAKh+4cRTikD1fy3AU+C+dvAN+QUJuVCf6o
         o+l8TH3LPHl4wUEKdaRACC2nzQhNO1TM+wqMEKmHvnIr1nRz4KCYpEuViOC5fSHFm4eI
         J48Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733248012; x=1733852812;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9rIgzebc7Ut/Z/kOC4QNifJHH66qu4x+BvNy4EkN7pA=;
        b=bSG7dcOGx/zK5HBZWIxH702hvcn9ELckudA2zDzL3jFpNdGAsH8x58FNiOWg83Ta3J
         eKqc3vq9FNkEEnouslZFJrR7+ccEFPIjrKx+yyxfQn2R/oVewMXs4kN+qeSnUDK4hgLh
         afTq1U6CjOqJfnIkmvtZKrIHhi1vSNACojVvj2gPej5F4QeqmgBFOz3fD08rBtHL1Aot
         OHRH3ESi33b8EYnutrBnSsb+tsNMbyzY1GGTO3Ip20cRjl+NAFqEUQOQ8USvbgZRaYVo
         OC74mQD3qVVr8rsUpE7ZfRTqRrHyBC+rUGUEqRMlUuUfS6InNwPfxkD43OmhW/u12RP/
         nSSg==
X-Gm-Message-State: AOJu0YzN+NbVBhwF+7VF+U0rTW4mmWGcQiF2/bToP7ZaN165Uzc67yyD
	98XrHViF+gNHch74/V1PPrn8Q5hRtVS9SQHvlHqEN7+T+U++9CQ/g874wzBdeLnmxEfyaz0oIUW
	bhyn4cOgn+np2epwfPzC5l+tzDyiAlhNnoc9Vj9EZCqXVBB6I+5E=
X-Gm-Gg: ASbGncsb2VuoWQi/ymNqkabvdcilZfN0XcLIsgtUUg1LDyyepBX9/qcqlg+K8WIHy81
	mTNpoX5m5FFmWOq0NPsYgiaoziQOUjKSk
X-Google-Smtp-Source: AGHT+IEn6BDoT6C1oeYvB9vs7b3ZLGw5e/k6Wnc9bxvUP5fvHSXE01jTBFQtKS7wkaZc4D1BHtAMXXurj6JzzGoo4Ww=
X-Received: by 2002:a05:6402:3506:b0:5d0:d2ba:bf33 with SMTP id
 4fb4d7f45d1cf-5d10cb5cc9dmr3646909a12.19.1733248012345; Tue, 03 Dec 2024
 09:46:52 -0800 (PST)
MIME-Version: 1.0
References: <20241118172357.475281-1-pierrick.bouvier@linaro.org>
 <20241118172357.475281-6-pierrick.bouvier@linaro.org> <CAFEAcA-UkmPvyNW_6o22-WhaLxnnji55UsBp3UcPA-gYH7kvVg@mail.gmail.com>
 <87zflcbs0l.fsf@draig.linaro.org>
In-Reply-To: <87zflcbs0l.fsf@draig.linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 3 Dec 2024 17:46:41 +0000
Message-ID: <CAFEAcA_Mmf0fH8biPaZz9c1bw6UdmEvVWhdjUduzPTqH4njnhQ@mail.gmail.com>
Subject: Re: [PATCH 5/7] docs: add a codebase section
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org, 
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
	Richard Henderson <richard.henderson@linaro.org>, Andrew Melnychenko <andrew@daynix.com>, 
	=?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
	Jason Wang <jasowang@redhat.com>, Thomas Huth <thuth@redhat.com>, 
	Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>, Fabiano Rosas <farosas@suse.de>, 
	Kevin Wolf <kwolf@redhat.com>, Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>, 
	qemu-arm@nongnu.org, Yuri Benditovich <yuri.benditovich@daynix.com>, 
	manos.pitsidianakis@linaro.org, qemu-block@nongnu.org, 
	Michael Roth <michael.roth@amd.com>, Konstantin Kostiuk <kkostiuk@redhat.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Peter Xu <peterx@redhat.com>, gustavo.romero@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: WiQJuUAVdL5j

On Tue, 3 Dec 2024 at 17:22, Alex Benn=C3=A9e <alex.bennee@linaro.org> wrot=
e:
>
> Peter Maydell <peter.maydell@linaro.org> writes:
>
> > On Mon, 18 Nov 2024 at 17:24, Pierrick Bouvier
> > <pierrick.bouvier@linaro.org> wrote:
> >>
> >> Present the various parts of QEMU and organization of codebase.
> >>
> >> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> >
> > I like this; it's something I've thought for a while would
> > be good to have, but which I never got round to trying to
> > put together. Thanks for doing this!
> >
> > Mostly my comments below are spelling/typo nits and
> > other minor stuff.
> >
> >> ---
> >>  docs/about/emulation.rst               |   2 +
> >>  docs/codebase/index.rst                | 211 ++++++++++++++++++++++++=
+
> >>  docs/devel/decodetree.rst              |   2 +
> >>  docs/devel/ebpf_rss.rst                |   2 +
> >>  docs/devel/index-internals.rst         |   2 +
> >>  docs/devel/migration/main.rst          |   2 +
> >>  docs/devel/qapi-code-gen.rst           |   1 +
> >>  docs/devel/testing/main.rst            |   9 +-
> >>  docs/devel/testing/qtest.rst           |   2 +
> >>  docs/index.rst                         |   3 +
> >>  docs/interop/qemu-ga.rst               |   2 +
> >>  docs/system/qemu-block-drivers.rst.inc |   2 +
> >>  docs/tools/qemu-storage-daemon.rst     |   2 +
> >>  docs/user/main.rst                     |   6 +
> >>  14 files changed, 247 insertions(+), 1 deletion(-)
> >>  create mode 100644 docs/codebase/index.rst
> >>
> <snip>
> >> +  Block devices and `image formats<disk images>` implementation.
> >> +* `bsd-user <https://gitlab.com/qemu-project/qemu/-/tree/master/bsd-u=
ser>`_:
> >> +  `BSD User mode<bsd-user-mode>`.
> >> +* build: Where the code built goes!
> >
> > The built code doesn't have to be in 'build'. We could say:
> >
> >  * build: You can tell the QEMU build system to put the built code
> >    anywhere you like. By default it will go into a directory named
> >    ``build``. Sometimes documentation will assume this default
> >    for convenience when describing command lines; you can always
> >    replace it with the path to your build tree.
> >
> > ?
>
> I always recommend creating a builds directory and having multiple build
> trees under it:

Indeed, that's what I like to do too, but I don't think this
document is the right place to make that kind of recommendation.

-- PMM
