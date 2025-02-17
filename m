Received: by 2002:a17:504:f96:b0:1be9:327d:8ee3 with SMTP id oa22csp84419njb;
        Mon, 17 Feb 2025 06:52:28 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUVhqfJhFLDR4vD4WmWhK50OnnUdVvx2vXaZ3HHGo0Luri1+PacGF/4GgdzmXk8Pd5mnGbCzsZsUoIZLQ==@linaro.org
X-Received: by 2002:a05:690c:6c01:b0:6f9:87ce:71e3 with SMTP id 00721157ae682-6fb58294c7fmr83202377b3.15.1739803948220;
        Mon, 17 Feb 2025 06:52:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1739803948; cv=none;
        d=google.com; s=arc-20240605;
        b=EQesQm+ihMHl/0poZtbwMu6ZwOIftZWhBDWhBhjlyIyNY8on482iMsqteRh0pZW6zi
         J8kCGN72KbCm6RLEqInpBLKzBUe3uDYiIgj81B2zJuGBFdfj8pT6Eu/7/YixToT9Wqoh
         1RufJWCAO2fDRSY9bvQKkZjhudd/0FdqH4/QzCy0lqT+f1ETkaeKWY0Hth3acaNPaDkn
         6hF4b+/1w1TGfgH46u7IhT9BpODG91xGkblS4YJgWvJXpw/B627YrVj4e0SM2QUR8eDm
         uctL9Z3Uhhe8QQEGfSgH5h/K/O4UznpEm1jn2MgOu9fLPq9ZQxbU/KkACH4iQJc8DtCi
         OFsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CqtaUJztx7c6sd2bjll+P+Uj2HyIK5rXC/EFxbrXhlg=;
        fh=l23ROlJZ2coxCgkPx8vkmIcq7zhKFu17GjU/SXxOliE=;
        b=J4uZI31O65EZetQbQsVZLZ6wSYQNgLGfcV2bpCUkj7rft0jenU9Bvla+2dVxQhEP7Y
         s9CXBpz/dwX3VrcLz3YqaMfqL2sOWA5+mdsXyApEnBGrckVcqkT6pvxGedsd59Ee4M5Z
         +GcPuqqPOFI8HbpdFsZr2F4tZQRCeEhpqOcGjaMKRVVA1sYeLYqEJsVRsyp5gW94gDzl
         BHRTKN9ly/nBqIiFs2++6XpkBWHUizJOlomnGAl84iRVKynVcDlDNsE4C1ZX6MbIUazm
         J1ITjZ5qKwLQI6iEL9AN+VHQOXtJEMmTPiIF4tg74vbJivLrm05LB71qBiUBkqYN99TC
         Xlzg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=I9cVWMbF;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 00721157ae682-6fb640f7adesor25742587b3.15.2025.02.17.06.52.28
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 17 Feb 2025 06:52:28 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=I9cVWMbF;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739803948; x=1740408748; darn=linaro.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CqtaUJztx7c6sd2bjll+P+Uj2HyIK5rXC/EFxbrXhlg=;
        b=I9cVWMbFkW40y939ZQIjKFKxMnYmB3irT1BNYfvfdmlOCR6accZNeA/Hygk/3dRIzK
         u6isiw8mXA815aPgJjkgZ1xbLpboF5p1aDYGf36KfCdeToq5NdY9DoOn7JgcDll7KzrC
         1G+I6yI7i0BN0nY7ZDhj8j+OkY90smVXV+7Ek6h3wS8HH1L1dcHo3g3KyyFd/kzMR36S
         NMc+ii4YGGAPa/Yxq0ZvgIFhwK9Zugi9vr/cADGvk/cS+a0cnjgi1u4iAFcFzOWSORHR
         fX9BDld3UEIGosHTQH3S3Jt9gp/3VvmM5tPknr/zXFueE8rMBetY7sC0V/BovfomcETz
         uhIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739803948; x=1740408748;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CqtaUJztx7c6sd2bjll+P+Uj2HyIK5rXC/EFxbrXhlg=;
        b=hyETI9Gw7J9P5IZhMLD33QtwnMzlUOTE8VysfdFEQ+jwiBhQ+AWoh2Zm2Ij5hI2bSK
         6BChtTDG3U0DNrBkoPhk7zs/tV1NsRc31q67A/fwygI52ak3mvggvYtWxqRz9EJqy/UU
         kzfyMHR5y+M0obSfDzpcVErBdFDjpDliG8km3LoFUXK5aEGptB7JPdj7YhWQbe8emYLN
         LFR6rXvFSXnATp4WdpLfx//7kVkZFg2kKjzDJ0mPW7+zrg3/sJ8tYGaPj5uZJpx3EcY9
         S8QTv25ZPxlpCM3n/YSd9oFXAK9e0ihSrI1SLwEtj6uvlN0XNLO+o9rAAZ/Fzd2d/3Ss
         KFWw==
X-Forwarded-Encrypted: i=1; AJvYcCX0QaTJSXPju9vCBxsJNiLsdzSXwX6W3H9cfpWYgMRAnQEsk8Bn+T0nytYVSACqhsH3XZrgnCtr8nhU+g==@linaro.org
X-Gm-Message-State: AOJu0YwcidmrpXIeD29vsJHKzatuVRO3ACZVC4tIVOGt+jL0Wihlsqq4
	bjIeVWZA9mdJevVBvuOQeJuCjN037W7mr+FpHPPpXI+QNbo7YU3kguHcyNEa6kbIQtHpEmM54IQ
	dlO8CKnxiy8Kg+2JOsQZGfPFQk5x20QSLgFRxKFAG
X-Gm-Gg: ASbGnctiZ4OnsKji9aHd+JCvUBWOFZzfC4p+KjUFadi2ks3Dg247UsyN8mtwOEFUSlr
	BCHOmZwvYDyN9jY0MiiHRyYBjT/Z+OqbI3+c5JvU0XE3HR1nJf6HaxANirUKIwXxFWTWMdceFFA
	==
X-Google-Smtp-Source: AGHT+IHOi5+JQv9/btkuGxeRHSPIcijQJFNR0SJ47z8FkjPdYCzCS1iTg67k7YlWyGCQbaxfFCNJwKg5zOlyee9c+X0=
X-Received: by 2002:a05:6902:2b8f:b0:e5d:bef4:30bb with SMTP id
 3f1490d57ef6-e5dc931d3fcmr6798607276.47.1739803947800; Mon, 17 Feb 2025
 06:52:27 -0800 (PST)
MIME-Version: 1.0
References: <20250208163911.54522-1-philmd@linaro.org> <20250208163911.54522-6-philmd@linaro.org>
 <CAFEAcA8ZSSD=TxCier0Ji8+DVDspgqKQeKJyVDZ+LEBy=j9=Lw@mail.gmail.com>
In-Reply-To: <CAFEAcA8ZSSD=TxCier0Ji8+DVDspgqKQeKJyVDZ+LEBy=j9=Lw@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 17 Feb 2025 14:52:16 +0000
X-Gm-Features: AWEUYZkhhfhvNltNh-iUagXLGbpu8Pe8XubVGT6L4jlk_wWHH0BBDa9JD-Eh-Dc
Message-ID: <CAFEAcA_MLUCqBPLfdwp1u-TEFLz-u5MsmAFeGEYfpOgC0cX8zQ@mail.gmail.com>
Subject: Re: [PATCH v6 5/7] hw/char/pl011: Consider TX FIFO overrun error
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org, 
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	=?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: w9zNQeg9a4Sq

On Mon, 17 Feb 2025 at 14:29, Peter Maydell <peter.maydell@linaro.org> wrot=
e:
>
> On Sat, 8 Feb 2025 at 16:39, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.o=
rg> wrote:
> >
> > When transmission is disabled, characters are still queued
> > to the FIFO which eventually overruns. Report that error
> > condition in the status register.
> >
> > Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> > ---
> >  hw/char/pl011.c      | 20 ++++++++++++++++++++
> >  hw/char/trace-events |  2 ++
> >  2 files changed, 22 insertions(+)
> >
> > diff --git a/hw/char/pl011.c b/hw/char/pl011.c
> > index 447f185e2d5..ef39ab666a2 100644
> > --- a/hw/char/pl011.c
> > +++ b/hw/char/pl011.c
> > @@ -61,6 +61,9 @@ DeviceState *pl011_create(hwaddr addr, qemu_irq irq, =
Chardev *chr)
> >  /* Data Register, UARTDR */
> >  #define DR_BE   (1 << 10)
> >
> > +/* Receive Status Register/Error Clear Register, UARTRSR/UARTECR */
> > +#define RSR_OE  (1 << 3)
> > +
> >  /* Interrupt status bits in UARTRIS, UARTMIS, UARTIMSC */
> >  #define INT_OE (1 << 10)
> >  #define INT_BE (1 << 9)
> > @@ -158,6 +161,16 @@ static inline unsigned pl011_get_fifo_depth(PL011S=
tate *s)
> >      return pl011_is_fifo_enabled(s) ? PL011_FIFO_DEPTH : 1;
> >  }
> >
> > +static bool pl011_is_tx_fifo_full(PL011State *s)
> > +{
> > +    if (pl011_is_fifo_enabled(s)) {
> > +        trace_pl011_fifo_tx_is_full("FIFO", fifo8_is_full(&s->xmit_fif=
o));
> > +        return fifo8_is_full(&s->xmit_fifo);
> > +    }
> > +    trace_pl011_fifo_tx_is_full("CHAR", !fifo8_is_empty(&s->xmit_fifo)=
);
> > +    return !fifo8_is_empty(&s->xmit_fifo);
>
> More repetition of expressions, but anyway
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

Here I propose to squash in this tweak:

--- a/hw/char/pl011.c
+++ b/hw/char/pl011.c
@@ -165,12 +165,13 @@ static inline unsigned pl011_get_fifo_depth(PL011Stat=
e *s)

 static bool pl011_is_tx_fifo_full(PL011State *s)
 {
-    if (pl011_is_fifo_enabled(s)) {
-        trace_pl011_fifo_tx_is_full("FIFO", fifo8_is_full(&s->xmit_fifo));
-        return fifo8_is_full(&s->xmit_fifo);
-    }
-    trace_pl011_fifo_tx_is_full("CHAR", !fifo8_is_empty(&s->xmit_fifo));
-    return !fifo8_is_empty(&s->xmit_fifo);
+    bool fifo_enabled =3D pl011_is_fifo_enabled(s);
+    bool tx_fifo_full =3D fifo_enabled ?
+        fifo8_is_full(&s->xmit_fifo) : !fifo8_is_empty(&s->xmit_fifo);
+
+    trace_pl011_fifo_tx_is_full(fifo_enabled ? "FIFO" : "CHAR",
+                                tx_fifo_full);
+    return tx_fifo_full;
 }

thanks
-- PMM
