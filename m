Received: by 2002:a5d:6790:0:0:0:0:0 with SMTP id v16csp2656425wru;
        Fri, 28 Jun 2019 09:03:49 -0700 (PDT)
X-Received: by 2002:ac2:528e:: with SMTP id q14mr5055446lfm.17.1561737829301;
        Fri, 28 Jun 2019 09:03:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1561737829; cv=none;
        d=google.com; s=arc-20160816;
        b=MTKunUGqdpeEoTYHawwzY9dig7yT3QrrBmexJU1Tezqhyrwd6kDn+zwjHmIrutvb2F
         /tphzeBJIa80jyjKTez1tSJnpT/JQCnIYFgWpMLpq0C3PgXIrqFsV5CKkI6/gSycWndY
         bnaW2MkF1z35aylZiuqoGgSOlPgc0IDY2SiQ1Plp+So5yT2Y9DwW6FnbjPx2Rs+xA2EP
         5CMhoTxpaRquDD2qJYnYJD5cVtnjEG+21rptr33q4NPb+K2bG2mLHSIlU4J6nSgCpmwP
         SiGdEUZfVeCbvJVCx4Qj+AhIk8gMQOO6XcL6YYjGUqgjFVc5B13ATbcUlK2tJijvM+Id
         VkZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=q/A8imL/rQ6JkX+BcIdTTu9BYmRWq+4XuVdbkIj/Z7A=;
        b=I2Xujl5qhFy0FXamwhjsnkNThINDoQbls2XDGtc25CImsBC+QiRXJFBqAXBSZbddaW
         A2sMLMfTL0cnDtcSbFjC8G/Oi+C+it8Ignyr3/npe6j4uiuHyHcarhBSACSftvKpSrPp
         YEAeOJQFiNP0YJLRc3bFMjjS2HR6FmCUT08g42BH0DwYDP7RWMGvQuCjVQOGOeccAaR8
         cZ8SE13y5DjFqiRteZwW0op7gdEoNBmhAS0oYzV/OVrzS4sK8sA9oIb19P4vbv+vokf9
         qJD7XRuhC1ceo+UAIrrvxYxd467PM/zptElrpQXkJOC3s1XwHHsjpdSiC5Wf0wTQ16Nq
         igVw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=aeBd1VWM;
       spf=pass (google.com: domain of alistair23@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=alistair23@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <alistair23@gmail.com>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id l13sor709318lfh.64.2019.06.28.09.03.49
        (Google Transport Security);
        Fri, 28 Jun 2019 09:03:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of alistair23@gmail.com designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=aeBd1VWM;
       spf=pass (google.com: domain of alistair23@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=alistair23@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=q/A8imL/rQ6JkX+BcIdTTu9BYmRWq+4XuVdbkIj/Z7A=;
        b=aeBd1VWM9zJn0b9vj2WGlw7ZTB5V9tNc9hpnTKXkvm/qPTA+UlP41mXfUXUa4pT7Sl
         RGQg5Wz47XVj0z7mHcBTYC3js35n0LWcBQq/U1dDwgrlr4mh+tkxNVFbEqJKYN2xJIxp
         D/6oBR8MX+KJoP+kzBKPVjbu3QPOpcC0eww9SV/VHcCxjNuCinVqCvUUXRkBEDGDPBbM
         ogl2DkASYjBc2qP+LJGpIBjjBaon5vXYYZDroScdfN5w4Ewtm35QvdqdUUFEM0oji+6g
         ublnxaE6sa2HF06yIIKjgFOW+8xgTKLGK2uoHYk7wn67xDn1N1pUgjt3JmT0E3F8E6hI
         K9WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=q/A8imL/rQ6JkX+BcIdTTu9BYmRWq+4XuVdbkIj/Z7A=;
        b=acdjFRlm0pJUaUoQAY0tXxACPxLW18mDYa19ZTNGyWNn2MphvUCGwaIT6bm/uGAls/
         rtcdmIiHbSBubDiMOfpGcQz0U/gIeOA3B4cn3WyCy1AtF8xsZqfOoyR3At1pCFnf+PHL
         uJiMt8iS00Us2nOPDdK+pH8PIi9O/HqrivBn2c+cHkqPG4jyUPr87h3KzSI+tOhIrXa4
         hWr4U02VrVWeLyjyIKSQgEbosBHIcmoaiwZoGe/e6LJZ5qkfUHuN6ilV6ADwMjGXZ8eZ
         D6TOgxinwxO7pmbQko6Vrq+WzIl+LQOVvN493MJZSBasFQPrXkTmw8sSAbd97N+XmMxg
         K/QA==
X-Gm-Message-State: APjAAAW4ExsnNxZqvJCpGlfkr1tYyVw/0y32B4pM1oI6CQQon5Gs6cVe
	/a949DXA+hciVPmzbXajr9eB9olSJ6pInQG8jtg=
X-Google-Smtp-Source: APXvYqxT+pBVOrQOFOBkZPRiB0+6zS5qInYh7RIz4KFEPu7L21zEXrW4ns/q7eRdgC2z2zMKVPkzAhDbsDjNlqD/37M=
X-Received: by 2002:a19:710b:: with SMTP id m11mr5473352lfc.135.1561737828961;
 Fri, 28 Jun 2019 09:03:48 -0700 (PDT)
MIME-Version: 1.0
References: <20190627202719.17739-1-philmd@redhat.com> <20190627202719.17739-7-philmd@redhat.com>
In-Reply-To: <20190627202719.17739-7-philmd@redhat.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 28 Jun 2019 09:00:48 -0700
Message-ID: <CAKmqyKMbV-42gMy8kja+Y36c-CDESLgQy8OgC=W=_gYWoACjuA@mail.gmail.com>
Subject: Re: [Qemu-devel] [PATCH v5 06/28] hw/block/pflash_cfi02: Add helpers
 to manipulate the status bits
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Cc: Stephen Checkoway <stephen.checkoway@oberlin.edu>, 
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>, Kevin Wolf <kwolf@redhat.com>, 
	Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>, 
	Qemu-block <qemu-block@nongnu.org>, Peter Maydell <peter.maydell@linaro.org>, 
	John Snow <jsnow@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Alistair Francis <alistair@alistair23.me>, Magnus Damm <magnus.damm@gmail.com>, 
	Markus Armbruster <armbru@redhat.com>, Max Reitz <mreitz@redhat.com>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Michael Walle <michael@walle.cc>, qemu-arm <qemu-arm@nongnu.org>, 
	"open list:New World" <qemu-ppc@nongnu.org>, Antony Pavlov <antonynpavlov@gmail.com>, 
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>, Jan Kiszka <jan.kiszka@web.de>, 
	Aurelien Jarno <aurelien@aurel32.net>, David Gibson <david@gibson.dropbear.id.au>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: rKWCGwQ6opb+

On Thu, Jun 27, 2019 at 1:49 PM Philippe Mathieu-Daud=C3=A9
<philmd@redhat.com> wrote:
>
> Pull out all of the code to modify the status into simple helper
> functions. Status handling becomes more complex once multiple
> chips are interleaved to produce a single device.
>
> No change in functionality is intended with this commit.
>
> Signed-off-by: Stephen Checkoway <stephen.checkoway@oberlin.edu>
> Message-Id: <20190426162624.55977-3-stephen.checkoway@oberlin.edu>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> Tested-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> [PMD: Extracted from bigger patch]
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/block/pflash_cfi02.c | 40 ++++++++++++++++++++++++++++++++++------
>  1 file changed, 34 insertions(+), 6 deletions(-)
>
> diff --git a/hw/block/pflash_cfi02.c b/hw/block/pflash_cfi02.c
> index 303d225f23..e9eea0ec08 100644
> --- a/hw/block/pflash_cfi02.c
> +++ b/hw/block/pflash_cfi02.c
> @@ -101,6 +101,31 @@ struct PFlashCFI02 {
>      void *storage;
>  };
>
> +/*
> + * Toggle status bit DQ7.
> + */
> +static inline void toggle_dq7(PFlashCFI02 *pfl)
> +{
> +    pfl->status ^=3D 0x80;
> +}
> +
> +/*
> + * Set status bit DQ7 to bit 7 of value.
> + */
> +static inline void set_dq7(PFlashCFI02 *pfl, uint8_t value)
> +{
> +    pfl->status &=3D 0x7F;
> +    pfl->status |=3D value & 0x80;
> +}
> +
> +/*
> + * Toggle status bit DQ6.
> + */
> +static inline void toggle_dq6(PFlashCFI02 *pfl)
> +{
> +    pfl->status ^=3D 0x40;
> +}
> +
>  /*
>   * Set up replicated mappings of the same region.
>   */
> @@ -130,7 +155,7 @@ static void pflash_timer (void *opaque)
>
>      trace_pflash_timer_expired(pfl->cmd);
>      /* Reset flash */
> -    pfl->status ^=3D 0x80;
> +    toggle_dq7(pfl);
>      if (pfl->bypass) {
>          pfl->wcycle =3D 2;
>      } else {
> @@ -229,8 +254,7 @@ static uint32_t pflash_read(PFlashCFI02 *pfl, hwaddr =
offset,
>          /* Status register read */
>          ret =3D pfl->status;
>          DPRINTF("%s: status %" PRIx32 "\n", __func__, ret);
> -        /* Toggle bit 6 */
> -        pfl->status ^=3D 0x40;
> +        toggle_dq6(pfl);
>          break;
>      case 0x98:
>          /* CFI query mode */
> @@ -374,7 +398,11 @@ static void pflash_write(PFlashCFI02 *pfl, hwaddr of=
fset,
>                      break;
>                  }
>              }
> -            pfl->status =3D 0x00 | ~(value & 0x80);
> +            /*
> +             * While programming, status bit DQ7 should hold the opposit=
e
> +             * value from how it was programmed.
> +             */
> +            set_dq7(pfl, ~value);
>              /* Let's pretend write is immediate */
>              if (pfl->bypass)
>                  goto do_bypass;
> @@ -422,7 +450,7 @@ static void pflash_write(PFlashCFI02 *pfl, hwaddr off=
set,
>                  memset(pfl->storage, 0xFF, pfl->chip_len);
>                  pflash_update(pfl, 0, pfl->chip_len);
>              }
> -            pfl->status =3D 0x00;
> +            set_dq7(pfl, 0x00);
>              /* Let's wait 5 seconds before chip erase is done */
>              timer_mod(&pfl->timer, qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL)=
 +
>                        (NANOSECONDS_PER_SECOND * 5));
> @@ -437,7 +465,7 @@ static void pflash_write(PFlashCFI02 *pfl, hwaddr off=
set,
>                  memset(p + offset, 0xFF, pfl->sector_len);
>                  pflash_update(pfl, offset, pfl->sector_len);
>              }
> -            pfl->status =3D 0x00;
> +            set_dq7(pfl, 0x00);
>              /* Let's wait 1/2 second before sector erase is done */
>              timer_mod(&pfl->timer, qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL)=
 +
>                        (NANOSECONDS_PER_SECOND / 2));
> --
> 2.20.1
>
>
