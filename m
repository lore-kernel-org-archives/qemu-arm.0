Received: by 2002:a05:6512:40d:0:0:0:0 with SMTP id u13csp958500lfk;
        Wed, 9 Feb 2022 09:14:00 -0800 (PST)
X-Received: by 2002:a1c:f219:: with SMTP id s25mr3466096wmc.119.1644426840355;
        Wed, 09 Feb 2022 09:14:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1644426840; cv=none;
        d=google.com; s=arc-20160816;
        b=cwx2vds1rVMOwNab4otOawEKY88OE9dFxwcaJNKq5RKm3Vwkhc2dKZm6Gt8NoZ5MNj
         27J7XGWQyv3SPn+FjBAJvRrrVbJ7IOsgCZnLBKhSvkc0Q+L11W06rTFJuhf4qzCljgBH
         XQqy8puH2yG0MU4quB0s1Dvwm8XIVlSC+ejaBuV2SJOJYqR5izS0MICMR8ju62Ucq6y2
         VdZ5Pc0Df/I0j1bwdmNSjENR4bnQGIWlbw021r/SOsaSOoFaP0BI3hyI8tSkUpVXAhsN
         r6G8FHf6ZmBChPxvF50/mU5u+W7tIifC0H7Au0Jv6RKs97JkDTj6pAD6f/y4qKR6g8V5
         Dnpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ol5xIWb4le+TN0NwyXVvTG6IaJssEMYhOhJ3B8ofgvQ=;
        b=lybrz17foGTIwATZyTHEUxsgqlpnT3QpUn0HG4Cy7ujzI483Ade84tInA1F6u+rgxD
         kzBI8ZnGGP74I5ve6Z7dC6h3vb3cGzIGFMtEprpyiNgYNQ5o1iypSHeLuPJshGaSwBbq
         04NUJXN8mK12JesD7S0sjuMt+LHwlJ3djvCAZRlOwB/K10oVshNpGN2IDMc8KtwxJH+q
         +lGtSOKyepwJecDjdnHv/rugEl2oy73si3GfuBLpteU9UD3qCz6QeMTYyVIoADTapv9O
         5lfzZnx5mxjdVOOpwCBHGnz8R6alm0vo1/csLiLfCfH+fckzJJQkZnoyJz69vmcFoG2N
         cmJQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=De1V2cK9;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id l38sor3025344wms.28.2022.02.09.09.13.59
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 09 Feb 2022 09:14:00 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=De1V2cK9;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=ol5xIWb4le+TN0NwyXVvTG6IaJssEMYhOhJ3B8ofgvQ=;
        b=De1V2cK9htwM5KontK+F2M4FWEgnk4shzRaT71lAdG0e3L7s8nUO97aUVLxMy9lN/0
         UGGGMtNqgdvujZUKYNNbfzBeivtuNwt90uKuiktQMhKjDBvAHbvxATKVHIKr2zGEGvXB
         7c83QcU5wRQsNKmx7Z5+Q8p+rSHgtc7vRR9yJnRaxGTf4o6QV4dNjb8FoDRxQDytYl11
         Gaz+4HVEk8aVep5fIMZhhvGfVejVmyKUHtjaVp+XHLFgUy98PJl3oZulQPyfCY9nL3UA
         RpeZbN8RNszfhkLKeqP+xpxbysiwA4Qq8jboGmk+XhCXYxiqjAvb3ZcCdl9IgXV5SFw4
         RR3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=ol5xIWb4le+TN0NwyXVvTG6IaJssEMYhOhJ3B8ofgvQ=;
        b=AgWb6+R+hU+cqFP5DH0G/p3SurOyepGzp1mapkpaW5SOakeq7r7mdPOTy+RYrtmYn+
         t6lq+8LGl1yoTb5vmSYvWHZzMXO/eU1sxkmS+GK2latE8dXflkhMNjk8btGFR+7/xMXE
         Y5VIp3GPk4phcDNGaXv7ObpB9Ar5dVRYZoyVwaBaiF5oMZnZB+/MfwpKOd/gHlCXJqQL
         UtlAUOKWquqT7sMF8+ouUiiPmamgHOka6LxJmoYRTTJBf0CYuZLwvfefAI7cazu0eBcr
         Y3CFVN/b0+R+stqs+NYbwhNwOjOeVmYEq5gVU5p5vzAZJX/9QwHPgfnlu4jSvI/zWuqu
         xjeQ==
X-Gm-Message-State: AOAM530bIt7b91eXW66PcV1TLtkJbv11W1n+7dxPpqjwgu4oVhZqCw5T
	ANvWppSCURw5ElKuicGUIHqo1y0Ze00G4E3CcmrbazxoNdVbS9rt
X-Google-Smtp-Source: ABdhPJyc6/6xP6b0YuuJP/iFPHsGq9HaW0ld4TzmxrBFs1T6bzENe44P5a5vP6hrDLidcHz5FeEmtc6vLOz/Ww/nLxU=
X-Received: by 2002:a05:600c:4f0b:: with SMTP id l11mr3631819wmq.126.1644426839318;
 Wed, 09 Feb 2022 09:13:59 -0800 (PST)
MIME-Version: 1.0
References: <20210623134756.30930-1-alex.bennee@linaro.org>
 <20210623134756.30930-2-alex.bennee@linaro.org> <CAFEAcA8TCTEBnjibsUTyqRXL0tWXGUih-TATNLHuWW-5=VQHLA@mail.gmail.com>
 <87sfssdms7.fsf@linaro.org>
In-Reply-To: <87sfssdms7.fsf@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 9 Feb 2022 17:13:48 +0000
Message-ID: <CAFEAcA-bVhgyD88eD+LM0F+TLMgSRR0k0rz1TjG82k4KPkhz=g@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] semihosting/arm-compat: replace heuristic for
 softmmu SYS_HEAPINFO
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>, 
	Andrew Strauss <astrauss11@gmail.com>, Keith Packard <keithp@keithp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: Xy2Ez4ItRl0I

On Wed, 9 Feb 2022 at 16:31, Alex Benn=C3=A9e <alex.bennee@linaro.org> wrot=
e:
>
>
> Peter Maydell <peter.maydell@linaro.org> writes:
>
> > On Wed, 23 Jun 2021 at 14:47, Alex Benn=C3=A9e <alex.bennee@linaro.org>=
 wrote:
> >> +static gint sort_secs(gconstpointer a, gconstpointer b)
> >> +{
> >> +    RomSec *ra =3D (RomSec *) a;
> >> +    RomSec *rb =3D (RomSec *) b;
> >
> > /*
> >  * Sort into address order. We break ties between rom-startpoints
> >  * and rom-endpoints in favour of the startpoint, by sorting the 0->1
> >  * transition before the 1->0 transition. Either way round would
> >  * work, but this way saves a little work later by avoiding
> >  * dealing with "gaps" of 0 length.
> >  */
> >
> >> +
> >> +    if (ra->base =3D=3D rb->base) {
> >> +        return ra->se > rb->se ? -1 : 1;
> >> +    }
> >> +    return ra->base > rb->base ? 1 : -1;
> >
> > This has forgotten the "equality" case, which you will
> > see if two blobs start at the same address (at least in
> > theory; at the moment the rom blob loader will try to
> > reject overlaps, though it might not do so forever).
>
> I'm confused what you mean by equality case. If both RomSecs have the
> same base and the same se flag we need to pick one of them. Are you
> saying when ra->se =3D=3D ra->sb we should take ra?

I'm saying that a sort comparison should give a consistent answer.
At the moment if you pass it two items A and B which happen to
have the same base and se values, then if you call sort_secs(A, B)
it will claim "B is greater than A", but if you call sort_secs(B, A)
it will claim "A is greater than B". The GCompareFunc API provides
a way to say "these are the same" -- return 0.

-- PMM
