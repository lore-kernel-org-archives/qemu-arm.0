Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp745017lfy;
        Tue, 28 Jul 2020 09:23:47 -0700 (PDT)
X-Received: by 2002:a05:6830:1e26:: with SMTP id t6mr7461573otr.342.1595953427444;
        Tue, 28 Jul 2020 09:23:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1595953427; cv=none;
        d=google.com; s=arc-20160816;
        b=l9I+7Q+qbZsq6lovdAGITntciD7NNRyvnCXAmBcmJO501kUhIaA2DU+ZymPBmfRd7n
         kAG/DDTQC+uSt6KHaL1AdRETeRnsf4Oyfmn3XmuLvvQ6LfxSfoLR+MRGFpNImtjJSG43
         ws30tJK6sS+lSZSkAt/L2Bqo35LraIsqncF77UXnckxzAMUtzA1kMx8EXsSsgLQV0Bgg
         255fdDdweyoH4LP2WNpRTF+c4QsxEKaN2KFb53Pax4RdJjQ9ol6wVz7iA/pRYlMQhwYN
         rRBXc5u6JG7PHn/LVGN+Ws1BGjHEIslDb+zpHNpGP0FAHiRyOCy3xTC6grDn/2GubDcE
         w5yA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7cv4AUL/fnzDoJOpUl1vW/Sj05yw/1Tgv9JYL89+o8Y=;
        b=0obvzJvwNAH3DV6Db4sPi1rhUtB3mBnBN0kneGK74kPsKUyGgFeaWVqU+WXHvvTSqw
         zMBOQ9kppJqunhlw8uPmV1TMc1VfKlr+ZZDFHy28E/W4ynE7kfa5fvMB+2rVc4vHdeiR
         v86nbU114AfcoYdMnNZ5ZKxg+0QUC74MD0/ZoTjUZMkeKqdqYzbHu+IpzYwEgU2P572Q
         gwv9WXq6iJXxJCUhdzSb02MNZfQd/l2mxqOb5eIjR1Z3QGCsZ0uGT/H/mnwgizhjjG2t
         KkGOhZ1e+kwXfkm5WddQQJ+w1YAcEdvk8Jr9YBRIsMiwTUlyyuAbbYNGW7Z1oEAj3o6f
         ds+Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=q5wcqq0H;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id t15sor11386182otl.63.2020.07.28.09.23.47
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 28 Jul 2020 09:23:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=q5wcqq0H;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=7cv4AUL/fnzDoJOpUl1vW/Sj05yw/1Tgv9JYL89+o8Y=;
        b=q5wcqq0Hj9J+x2ijuuNXnGwfwVpss6RK+HferqcAkUbfmMf8g2yIqke/D7K9JxYRX+
         /Po90OAYqlQd3R5AnR6EwwDbCiNPPJ3SW5X3rnUuO20MLudHwdbyFlADWigrDcG70Oeg
         w7fpPuJFSRuD4eCOKhLnh57csRucMlBqWm30W4d7NOYEppDU1E2QYRffxW3pe4de4N24
         3WY1wptzlgYRt2SiDLz50jUlhTgwJAtXLvhyMS27qJ3u/0wjYv2IffrjI17SZsZfl466
         bkSdryRYgadMidk8zFaHObtD43Gdh+Vq9BaiKSTofrP0kfA5BvbkYzDv3mxgdSx+LpzI
         c2Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=7cv4AUL/fnzDoJOpUl1vW/Sj05yw/1Tgv9JYL89+o8Y=;
        b=Om3XoQdJzxqqdLk63uT6/96k11A03IqwQuoXMBFA/4eGxISbPztXojZwZPJMjhqpHI
         fj2ucWDb9oyPH2HOmvMU/JxIZu/TxjFG0fYvY0EwKft+P0x9UjzKFMyfaqvmvmabbR2R
         dnp+azIvlYlTGWa7cVwzE17hvWk9IZDkob+U6yAT+rgAzylJIClyLEfEbLNk7s5xqBQZ
         6cylgLRitnGNkzMLjTqfuffr8GU1GmC51sVaDeGnUU+qaNYHCklOVowoVoL8Rp0fgdHL
         O7nauDa2KdVTIBETCE0GmDCPq1LMg9HLl6wFkiqFqi5cI8XHDYCGDp9VcYd05KHKvOKa
         bu7A==
X-Gm-Message-State: AOAM532qM8eQoVFC6VFKF0mC/lcDkwdVrDD70JfhFSo+cNAmJuGCvc5a
	CcOm0KESnN1pDqj4FlAuTsYQgYenyPegzfiVPBI0AXlKpKk=
X-Google-Smtp-Source: ABdhPJxpG7KR7SpnqBcjIwEsY5ZmHPyaAmFvZAiORyl19n+yV1+/2J6/lYctcZzsP4RE2kzxI1nGyUg/ie1oGw6/r48=
X-Received: by 2002:a05:6830:10ce:: with SMTP id z14mr25778481oto.135.1595953426552;
 Tue, 28 Jul 2020 09:23:46 -0700 (PDT)
MIME-Version: 1.0
References: <20200728141005.28664-1-alex.bennee@linaro.org>
 <20200728141005.28664-3-alex.bennee@linaro.org> <CAFEAcA_MT8U6uUYhNVDc1-AkxPPL22pBevNDSbB2ZwQQ94OPmw@mail.gmail.com>
 <87lfj339i5.fsf@linaro.org>
In-Reply-To: <87lfj339i5.fsf@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 28 Jul 2020 17:23:35 +0100
Message-ID: <CAFEAcA-DzMVz=4MnMtOOyzi-_i1J=-8z1JBg3M6n1Tov68eV8A@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] target/arm: only set the nexttick timer if !ISTATUS
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, Victor CLEMENT <victor.clement@openwide.fr>, 
	Paolo Bonzini <pbonzini@redhat.com>, Igor R <boost.lists@gmail.com>, 
	Pavel Dovgaluk <pavel.dovgaluk@ispras.ru>, "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: 0cvAerOC/swm

On Tue, 28 Jul 2020 at 17:11, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
>
> Peter Maydell <peter.maydell@linaro.org> writes:
>
> > On Tue, 28 Jul 2020 at 15:10, Alex Benn=C3=A9e <alex.bennee@linaro.org>=
 wrote:
> >>
> >> Otherwise we have an unfortunate interaction with -count sleep=3Doff
> >> which means we fast forward time when we don't need to. The easiest
> >> way to trigger it was to attach to the gdbstub and place a break point
> >> at the timers IRQ routine. Once the timer fired setting the next event
> >> at INT_MAX then qemu_start_warp_timer would skip to the end.
> >>
> >> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> >> ---

> >>          if (istatus) {
> >> -            /* Next transition is when count rolls back over to zero =
*/
> >> -            nexttick =3D UINT64_MAX;
> >> +            /*
> >> +             * The IRQ status of the timer will persist until:
> >> +             *   - CVAL is changed or
> >> +             *   - ENABLE is changed
> >> +             *
> >> +             * There is no point re-arming the timer for some far
> >> +             * flung future - currently it just is.
> >> +             */
> >> +            timer_del(cpu->gt_timer[timeridx]);
> >
> > Why do we delete the timer for this case of "next time we need to
> > know is massively in the future"...
>
> It's not really - it's happening now and it will continue to happen
> until the IRQ is serviced or we change the CVAL at which point we can
> calculate the next time we need it.

It is far-future: the counter can roll all the way round and back over
to zero, as the old comment states. (Other reasons for things to change
get handled via other code paths: it's only the "at some defined time
in the future a change happens" cases that we need to set a timer for).
It's the same situation as below, I think (though I don't know why we
used UINT64_MAX for one and INT64_MAX for the other).

-- PMM
