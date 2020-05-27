Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp1010964lfc;
        Wed, 27 May 2020 05:05:59 -0700 (PDT)
X-Received: by 2002:adf:aa81:: with SMTP id h1mr13979514wrc.21.1590581159294;
        Wed, 27 May 2020 05:05:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1590581159; cv=none;
        d=google.com; s=arc-20160816;
        b=XFeGsnBrlhCRyrYo8XKirfchT2BdIpSMdk4mi2q+OM5xhkpzkvxeihL+Ehw/HOObZ3
         zFbuqJJqGScVwrUYbyNOHf1HNY6nS2xENSkYn1BM0UkB68OTj7eDPh0rLO+0B5zQBoIE
         +1j9TNpICQ7y/yN2bK8f8dPLIh/VbgqWVf+f/fEEn0BU6SE5O8vGoC64fx03dlqtFc9z
         nuBxUcCZItFOXpjuaYjnwO23ZcFP2SoqabA1sXiRPDydw/CUdPdziJmb/frIqzSWJ9wG
         oLlSbB40iHkM3lwwYf6j/OUvNy0PqHJ8RDb5ibnBv82QUp2cJ8hlEAb3gMtglQWkVf/Z
         nSGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=okXHX6ENcIfDa/2JAcLHym2+LmzF+mNzbsWji9EmUfA=;
        b=TzmL1CxfT2PE58ev3JyzHB4FKgTq4O9nVY1fgSM00DU+BzzC1mIfJLLpGeb7dfAN8d
         6O7dEwY7UadcGKWRyr2dsAVwguAsPFdtolE4UD+EsxyMBqKQpRCawt6nbYGk/gGmJWHP
         oK7hIYNjj/gC7S78PGtPq9HlEDjeSy6v5N8amy5+VoOq43wPmHFlgYvJpp3QZ/kBhpJf
         AJxbrNTuHlmrSB1W5PS3q4FEdy9M+xbgkQ6U6FOLKWoEWszeFQyx+9W2nYmvYXQ5Eg8o
         ZU89SpzDQH+yvFcfQalsonzKjivnpPb+QbehXgAaTRfT+njSxj++bRSU7xSCk9U630/t
         Mprw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=rGAaKGrA;
       spf=pass (google.com: domain of aleksandar.qemu.devel@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=aleksandar.qemu.devel@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <aleksandar.qemu.devel@gmail.com>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id o21sor1506973wmh.6.2020.05.27.05.05.59
        (Google Transport Security);
        Wed, 27 May 2020 05:05:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of aleksandar.qemu.devel@gmail.com designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=rGAaKGrA;
       spf=pass (google.com: domain of aleksandar.qemu.devel@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=aleksandar.qemu.devel@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=okXHX6ENcIfDa/2JAcLHym2+LmzF+mNzbsWji9EmUfA=;
        b=rGAaKGrAUMiqpKNbj2uQ8yErDP1LgwsMtqmBatsxaZN6kDg78qqN8FszWzC2uqqTG7
         vvGky2AV83TCl/L7xsQNBI8RX0r1OAnUoj7UAhkgM1lpyCk3XMwdeY3+ehb/868roPZT
         BdJx6ndjrn/Xn8LLuNjPtHRCEGvbuxsnvSgdPK+mi51yXB7+7mq2eDk1PqIJ13kTU2T9
         Irj6tUjakkSwPgKbP6UHVvf5/mMwQhblofC016DFklawoZODtMK9I2qNgY8+I9nXv6ER
         Ra1QKjHfr+mI8VmKki2UWxCl59gbctyrt3duW6I/m9LkmhuYYp24SI9pjsYq/N7oLRQH
         C8qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=okXHX6ENcIfDa/2JAcLHym2+LmzF+mNzbsWji9EmUfA=;
        b=r+1Mdh04cFxwjA1zkUIEfkk3QvCTaBudz24kUo+kftkXvHdOh0oS33PWMmH9RIpyt2
         kel9zgnLGWPsdiQGwsBI2oBmkYgLoyX78vu4muQSS9oS8LB/7+miHb2DarfmFPw1zA2f
         jhQvGdFU4yeOOcyCAeZgsr5lxmehBpXCFGmh46cFs8SoragEkL6G72JJLbmF4DzVzUIQ
         /kI0ZcnZMJgGw79/8vqT8p3Q6XbBqNxp7IFwJSLv1Y0iLIV36y8PjrymzFPTuxROQ5Sf
         MQnGXIOXg/z+saKiXwIyF4we+NhbFCfxtVl+qwAY46q4k8mgrvzcwJz3rP3t3TLn2Hx6
         R63A==
X-Gm-Message-State: AOAM532/A2lJBfMf48hkHEDuLQvSOXo4W+hgosTF6gJG/I1WTxeMxwaB
	RtZYphRSCJ3gocVjtyRlNPKIeBF+JsUcnBnv72XHNx2ALwo=
X-Google-Smtp-Source: ABdhPJwMhwcbPcNgjY4sEkmFkSyN4n3h085z6p0C5Q0IxQ3e505Q6xod9fI5fxBulM/5Y7X6jjSEYPYqjRzpAU2NWJU=
X-Received: by 2002:a1c:2e16:: with SMTP id u22mr4295840wmu.168.1590581158700;
 Wed, 27 May 2020 05:05:58 -0700 (PDT)
MIME-Version: 1.0
References: <20200527100546.29297-1-alex.bennee@linaro.org> <20200527100546.29297-3-alex.bennee@linaro.org>
In-Reply-To: <20200527100546.29297-3-alex.bennee@linaro.org>
From: Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>
Date: Wed, 27 May 2020 14:05:38 +0200
Message-ID: <CAHiYmc7EJVxKXZ4G96cL-Bm3tT8UR_dgr7y3oisUMnuJ0u3zaw@mail.gmail.com>
Subject: Re: [PATCH v1 2/3] linux-user: deal with address wrap for
 ARM_COMMPAGE on 32 bit
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, Peter Maydell <peter.maydell@linaro.org>, 
	Bug 1880225 <1880225@bugs.launchpad.net>, Riku Voipio <riku.voipio@iki.fi>, 
	Richard Henderson <richard.henderson@linaro.org>, Laurent Vivier <laurent@vivier.eu>, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: 2XtfMwEns2wv

=D1=81=D1=80=D0=B5, 27. =D0=BC=D0=B0=D1=98 2020. =D1=83 12:07 Alex Benn=C3=
=A9e <alex.bennee@linaro.org> =D1=98=D0=B5 =D0=BD=D0=B0=D0=BF=D0=B8=D1=81=
=D0=B0=D0=BE/=D0=BB=D0=B0:
>
> We rely on the pointer to wrap when accessing the high address of the
> COMMPAGE so it lands somewhere reasonable. However on 32 bit hosts we
> cannot afford just to map the entire 4gb address range. The old mmap
> trial and error code handled this by just checking we could map both
> the guest_base and the computed COMMPAGE address.
>
> We can't just manipulate loadaddr to get what we want so we introduce
> an offset which pgb_find_hole can apply when looking for a gap for
> guest_base that ensures there is space left to map the COMMPAGE
> afterwards.
>
> This is arguably a little inefficient for the one 32 bit
> value (kuser_helper_version) we need to keep there given all the
> actual code entries are picked up during the translation phase.
>
> Fixes: ee94743034b
> Bug: https://bugs.launchpad.net/qemu/+bug/1880225

For the scenario in this bug report, for today's master, before and after
applying this patch:

BEFORE:

$ ~/Build/qemu-master/build-gcc/arm-linux-user/qemu-arm ./toupper_string-ar=
m
qemu-arm: /home/rtrk/Build/qemu-master/linux-user/elfload.c:2294:
probe_guest_base: Assertion `have_guest_base' failed.
Aborted

AFTER:

$ ~/Build/qemu-master/build-gcc/arm-linux-user/qemu-arm ./toupper_string-ar=
m
CONTROL RESULT: (toupper_string)
 nwlrbbmqbhcdarz owkkyhiddqscdxr jmowfrxsjybldbe fsarcbynecdyggx xpklorelln=
mpapq
 NWLRBBMQBHCDARZ OWKKYHIDDQSCDXR JMOWFRXSJYBLDBE FSARCBYNECDYGGX XPKLORELLN=
MPAPQ

So, it works in my test bed.

Tested-by: Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>

> Cc: Bug 1880225 <1880225@bugs.launchpad.net>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Cc: Richard Henderson <richard.henderson@linaro.org>
> Cc: Peter Maydell <peter.maydell@linaro.org>
> ---
>  linux-user/elfload.c | 18 ++++++++++--------
>  1 file changed, 10 insertions(+), 8 deletions(-)
>
> diff --git a/linux-user/elfload.c b/linux-user/elfload.c
> index d6027867a1a..31defce95b5 100644
> --- a/linux-user/elfload.c
> +++ b/linux-user/elfload.c
> @@ -2145,7 +2145,7 @@ static uintptr_t pgd_find_hole_fallback(uintptr_t g=
uest_size, uintptr_t brk, lon
>
>  /* Return value for guest_base, or -1 if no hole found. */
>  static uintptr_t pgb_find_hole(uintptr_t guest_loaddr, uintptr_t guest_s=
ize,
> -                               long align)
> +                               long align, uintptr_t offset)
>  {
>      GSList *maps, *iter;
>      uintptr_t this_start, this_end, next_start, brk;
> @@ -2171,7 +2171,7 @@ static uintptr_t pgb_find_hole(uintptr_t guest_load=
dr, uintptr_t guest_size,
>
>          this_end =3D ((MapInfo *)iter->data)->start;
>          next_start =3D ((MapInfo *)iter->data)->end;
> -        align_start =3D ROUND_UP(this_start, align);
> +        align_start =3D ROUND_UP(this_start + offset, align);
>
>          /* Skip holes that are too small. */
>          if (align_start >=3D this_end) {
> @@ -2221,6 +2221,7 @@ static void pgb_static(const char *image_name, abi_=
ulong orig_loaddr,
>  {
>      uintptr_t loaddr =3D orig_loaddr;
>      uintptr_t hiaddr =3D orig_hiaddr;
> +    uintptr_t offset =3D 0;
>      uintptr_t addr;
>
>      if (hiaddr !=3D orig_hiaddr) {
> @@ -2234,18 +2235,19 @@ static void pgb_static(const char *image_name, ab=
i_ulong orig_loaddr,
>      if (ARM_COMMPAGE) {
>          /*
>           * Extend the allocation to include the commpage.
> -         * For a 64-bit host, this is just 4GiB; for a 32-bit host,
> -         * the address arithmetic will wrap around, but the difference
> -         * will produce the correct allocation size.
> +         * For a 64-bit host, this is just 4GiB; for a 32-bit host we
> +         * need to ensure there is space bellow the guest_base so we
> +         * can map the commpage in the place needed when the address
> +         * arithmetic wraps around.
>           */
>          if (sizeof(uintptr_t) =3D=3D 8 || loaddr >=3D 0x80000000u) {
>              hiaddr =3D (uintptr_t)4 << 30;
>          } else {
> -            loaddr =3D ARM_COMMPAGE & -align;
> +            offset =3D (128 * KiB);
>          }
>      }
>
> -    addr =3D pgb_find_hole(loaddr, hiaddr - loaddr, align);
> +    addr =3D pgb_find_hole(loaddr, hiaddr - loaddr, align, offset);
>      if (addr =3D=3D -1) {
>          /*
>           * If ARM_COMMPAGE, there *might* be a non-consecutive allocatio=
n
> @@ -2280,7 +2282,7 @@ static void pgb_dynamic(const char *image_name, lon=
g align)
>           * just above that, and maximises the positive guest addresses.
>           */
>          commpage =3D ARM_COMMPAGE & -align;
> -        addr =3D pgb_find_hole(commpage, -commpage, align);
> +        addr =3D pgb_find_hole(commpage, -commpage, align, 0);
>          assert(addr !=3D -1);
>          guest_base =3D addr;
>      }
> --
> 2.20.1
>
>
