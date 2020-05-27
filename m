Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp1138608lfc;
        Wed, 27 May 2020 07:47:26 -0700 (PDT)
X-Received: by 2002:a1c:22d7:: with SMTP id i206mr4550431wmi.186.1590590846218;
        Wed, 27 May 2020 07:47:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1590590846; cv=none;
        d=google.com; s=arc-20160816;
        b=jYqe9BpqzSQUa3vJAr5CN/hYIyYxsRjBr1oU8Hk+LozKcvekeL66HVSIAfb4XzKJ1h
         fHPl6gY3tcM5rQlTHmrF0M6qGL77Dycyd/WczRv9VSsOFJiDflizUukkbmSXUDmEYDT0
         7NLCZaglEAAXWkpV3Cfe2A5tcP+IM5ZM7cfFfP1pmxCEWCQYHPIrF26kobkuqF/bbER3
         nUE1DwZP+uUWieQdX2+Evz/nMYRMd8al722JTBFIwEXJPHuRIroH1avex+aAz4A6m4d0
         u68a3cKfeFDINeFKxbN0ZX/eDjf0YluFwzJx3oazCA88gll7NfDLy+Ol81YVUVACZllp
         ckWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GrOGXpO7huguJbiqlss87D9k1iAkerndtQgIwlErOGU=;
        b=k6OUhVU8rMikAVgr0bqS907Dp3N8rnh9L+P6dEew/PMsW0+AHqXjE5W6vVCNKa5BiH
         8LhgkptlaIpQKwHGW7pzOCveRQY/BLog4bXmIcNASN/Y2vnQsOli557+31fzAa8WXF2m
         gOf/ZC5L2qht0MYLEj7Wg0aA99HVckEI7JxGgOaZNAXNW6eUT6R584eOniA2XKp/kD64
         RYJjB8kiJV6a9tTHKrO3gDsOewzi2a/NLsbGXz4Bfp/fePPxR73ABE6cSTfw3GGRaTUF
         da+uN5Af87Eit3V3JOFqr1S8FI+pCxhaVgRfEtnY7TfBH7Xvh3s2sEG+hSprX2TW4THb
         h86w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=SgDD3K0G;
       spf=pass (google.com: domain of aleksandar.qemu.devel@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=aleksandar.qemu.devel@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <aleksandar.qemu.devel@gmail.com>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id t11sor1683771wrx.44.2020.05.27.07.47.26
        (Google Transport Security);
        Wed, 27 May 2020 07:47:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of aleksandar.qemu.devel@gmail.com designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=SgDD3K0G;
       spf=pass (google.com: domain of aleksandar.qemu.devel@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=aleksandar.qemu.devel@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=GrOGXpO7huguJbiqlss87D9k1iAkerndtQgIwlErOGU=;
        b=SgDD3K0GNnxPXkB645sD03pHKUf5og4Hwslcp9YtSocdYz0bjCpns2EBTYnZROqFA4
         rBEKTX6+Xx1d04onodKDoa1ZVYbzrRhoUyXKEOH8j7KWY4XWWBDVTTgFlLEciX4kghbB
         JDGmZpZfQEWkgUqDF5OOoEa4K2+fpp9mhYl8W0IYXH3RRdSMQNR1Z7YPwZRc+Zm8Jbjw
         QPiDzirM8tvPN2F5CJgJ6OWdtlqxMoYBrH/o6KV++Asq5rhcOOyop/leCtHM37+JRwLN
         90wHe5YG5pYWV0VISU/HrIwwRN/3f1yXVxm1Sa8i1zBTP4x9iALgBBtD0asu2RueUpIv
         HcoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=GrOGXpO7huguJbiqlss87D9k1iAkerndtQgIwlErOGU=;
        b=fMv90tH3PpoVOmT87ThRE9bkxrlz5WtLYI2itkNw4mMoKknWoG3CLqTIbyKSPSmuy+
         7uivLprKO5MwPx9jUHzGeymwLA9WKRGj1kIWP/ckDdHgXGeFG6WviAF156MKHYS52fez
         +Jn0Zm4m7jtAYlTyxMUUWlsUI9Xk0k0Wdg4CenBA3gbAunb/MTJ7ffzVfvh0/dEiY7eT
         10rlz8zIgKbOwEDMlSiYRWXMO2gQUj5R2odKSeQa6L4249fdQkZiVN7lKJzBkSSdBI7g
         jy9lpQc9bWy7B3Hom5F5R/E9wD/dk4E1e5adSLCyxueO0+kdFyX4Kpk7R7H/VK+Ekewn
         K1Eg==
X-Gm-Message-State: AOAM5323C3a5hrQNEr1y2arBRs1bqZ8hnA+xZKlnv/RfuF20jZbdyivX
	PDfVw//Fo+qrC8nxqKmlgsoAac5dH5N3XVaOw743QGB3
X-Google-Smtp-Source: ABdhPJwaqJ9shuwQr9EJYNIOc3MgZCB9FCr7MAjKJ6MKoyoX+KaPDw9zXulTTqKOns75hxzcxIiPjtNKubUzDXFxueM=
X-Received: by 2002:adf:e64b:: with SMTP id b11mr24234086wrn.402.1590590845626;
 Wed, 27 May 2020 07:47:25 -0700 (PDT)
MIME-Version: 1.0
References: <20200527100546.29297-1-alex.bennee@linaro.org>
 <20200527100546.29297-3-alex.bennee@linaro.org> <CAHiYmc7EJVxKXZ4G96cL-Bm3tT8UR_dgr7y3oisUMnuJ0u3zaw@mail.gmail.com>
In-Reply-To: <CAHiYmc7EJVxKXZ4G96cL-Bm3tT8UR_dgr7y3oisUMnuJ0u3zaw@mail.gmail.com>
From: Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>
Date: Wed, 27 May 2020 16:47:13 +0200
Message-ID: <CAHiYmc7TYHMcitiG9ELxfz-EC8DSG1b7FeFsxXxTbu-7FSih=Q@mail.gmail.com>
Subject: Re: [PATCH v1 2/3] linux-user: deal with address wrap for
 ARM_COMMPAGE on 32 bit
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, Peter Maydell <peter.maydell@linaro.org>, 
	Bug 1880225 <1880225@bugs.launchpad.net>, Riku Voipio <riku.voipio@iki.fi>, 
	Richard Henderson <richard.henderson@linaro.org>, Laurent Vivier <laurent@vivier.eu>, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: joiQ9FdZY0q2

=D1=81=D1=80=D0=B5, 27. =D0=BC=D0=B0=D1=98 2020. =D1=83 14:05 Aleksandar Ma=
rkovic
<aleksandar.qemu.devel@gmail.com> =D1=98=D0=B5 =D0=BD=D0=B0=D0=BF=D0=B8=D1=
=81=D0=B0=D0=BE/=D0=BB=D0=B0:
>
> =D1=81=D1=80=D0=B5, 27. =D0=BC=D0=B0=D1=98 2020. =D1=83 12:07 Alex Benn=
=C3=A9e <alex.bennee@linaro.org> =D1=98=D0=B5 =D0=BD=D0=B0=D0=BF=D0=B8=D1=
=81=D0=B0=D0=BE/=D0=BB=D0=B0:
> >
> > We rely on the pointer to wrap when accessing the high address of the
> > COMMPAGE so it lands somewhere reasonable. However on 32 bit hosts we
> > cannot afford just to map the entire 4gb address range. The old mmap
> > trial and error code handled this by just checking we could map both
> > the guest_base and the computed COMMPAGE address.
> >
> > We can't just manipulate loadaddr to get what we want so we introduce
> > an offset which pgb_find_hole can apply when looking for a gap for
> > guest_base that ensures there is space left to map the COMMPAGE
> > afterwards.
> >
> > This is arguably a little inefficient for the one 32 bit
> > value (kuser_helper_version) we need to keep there given all the
> > actual code entries are picked up during the translation phase.
> >
> > Fixes: ee94743034b
> > Bug: https://bugs.launchpad.net/qemu/+bug/1880225
>
> For the scenario in this bug report, for today's master, before and after
> applying this patch:
>

I am not sure how significant is this info, but I executed the test
without applying patch 1/3, so only 2/3 was applied in the case
"AFTER".

Aleksandar

> BEFORE:
>
> $ ~/Build/qemu-master/build-gcc/arm-linux-user/qemu-arm ./toupper_string-=
arm
> qemu-arm: /home/rtrk/Build/qemu-master/linux-user/elfload.c:2294:
> probe_guest_base: Assertion `have_guest_base' failed.
> Aborted
>
> AFTER:
>
> $ ~/Build/qemu-master/build-gcc/arm-linux-user/qemu-arm ./toupper_string-=
arm
> CONTROL RESULT: (toupper_string)
>  nwlrbbmqbhcdarz owkkyhiddqscdxr jmowfrxsjybldbe fsarcbynecdyggx xpklorel=
lnmpapq
>  NWLRBBMQBHCDARZ OWKKYHIDDQSCDXR JMOWFRXSJYBLDBE FSARCBYNECDYGGX XPKLOREL=
LNMPAPQ
>
> So, it works in my test bed.
>
> Tested-by: Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>
>
> > Cc: Bug 1880225 <1880225@bugs.launchpad.net>
> > Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> > Cc: Richard Henderson <richard.henderson@linaro.org>
> > Cc: Peter Maydell <peter.maydell@linaro.org>
> > ---
> >  linux-user/elfload.c | 18 ++++++++++--------
> >  1 file changed, 10 insertions(+), 8 deletions(-)
> >
> > diff --git a/linux-user/elfload.c b/linux-user/elfload.c
> > index d6027867a1a..31defce95b5 100644
> > --- a/linux-user/elfload.c
> > +++ b/linux-user/elfload.c
> > @@ -2145,7 +2145,7 @@ static uintptr_t pgd_find_hole_fallback(uintptr_t=
 guest_size, uintptr_t brk, lon
> >
> >  /* Return value for guest_base, or -1 if no hole found. */
> >  static uintptr_t pgb_find_hole(uintptr_t guest_loaddr, uintptr_t guest=
_size,
> > -                               long align)
> > +                               long align, uintptr_t offset)
> >  {
> >      GSList *maps, *iter;
> >      uintptr_t this_start, this_end, next_start, brk;
> > @@ -2171,7 +2171,7 @@ static uintptr_t pgb_find_hole(uintptr_t guest_lo=
addr, uintptr_t guest_size,
> >
> >          this_end =3D ((MapInfo *)iter->data)->start;
> >          next_start =3D ((MapInfo *)iter->data)->end;
> > -        align_start =3D ROUND_UP(this_start, align);
> > +        align_start =3D ROUND_UP(this_start + offset, align);
> >
> >          /* Skip holes that are too small. */
> >          if (align_start >=3D this_end) {
> > @@ -2221,6 +2221,7 @@ static void pgb_static(const char *image_name, ab=
i_ulong orig_loaddr,
> >  {
> >      uintptr_t loaddr =3D orig_loaddr;
> >      uintptr_t hiaddr =3D orig_hiaddr;
> > +    uintptr_t offset =3D 0;
> >      uintptr_t addr;
> >
> >      if (hiaddr !=3D orig_hiaddr) {
> > @@ -2234,18 +2235,19 @@ static void pgb_static(const char *image_name, =
abi_ulong orig_loaddr,
> >      if (ARM_COMMPAGE) {
> >          /*
> >           * Extend the allocation to include the commpage.
> > -         * For a 64-bit host, this is just 4GiB; for a 32-bit host,
> > -         * the address arithmetic will wrap around, but the difference
> > -         * will produce the correct allocation size.
> > +         * For a 64-bit host, this is just 4GiB; for a 32-bit host we
> > +         * need to ensure there is space bellow the guest_base so we
> > +         * can map the commpage in the place needed when the address
> > +         * arithmetic wraps around.
> >           */
> >          if (sizeof(uintptr_t) =3D=3D 8 || loaddr >=3D 0x80000000u) {
> >              hiaddr =3D (uintptr_t)4 << 30;
> >          } else {
> > -            loaddr =3D ARM_COMMPAGE & -align;
> > +            offset =3D (128 * KiB);
> >          }
> >      }
> >
> > -    addr =3D pgb_find_hole(loaddr, hiaddr - loaddr, align);
> > +    addr =3D pgb_find_hole(loaddr, hiaddr - loaddr, align, offset);
> >      if (addr =3D=3D -1) {
> >          /*
> >           * If ARM_COMMPAGE, there *might* be a non-consecutive allocat=
ion
> > @@ -2280,7 +2282,7 @@ static void pgb_dynamic(const char *image_name, l=
ong align)
> >           * just above that, and maximises the positive guest addresses=
.
> >           */
> >          commpage =3D ARM_COMMPAGE & -align;
> > -        addr =3D pgb_find_hole(commpage, -commpage, align);
> > +        addr =3D pgb_find_hole(commpage, -commpage, align, 0);
> >          assert(addr !=3D -1);
> >          guest_base =3D addr;
> >      }
> > --
> > 2.20.1
> >
> >
