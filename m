Received: by 2002:a5d:6790:0:0:0:0:0 with SMTP id v16csp2649077wru;
        Fri, 28 Jun 2019 08:55:54 -0700 (PDT)
X-Received: by 2002:a2e:5d1:: with SMTP id 200mr6623562ljf.10.1561737354532;
        Fri, 28 Jun 2019 08:55:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1561737354; cv=none;
        d=google.com; s=arc-20160816;
        b=rracPmIHZJXvqGrk4kM1A+PUKLt06KCElCSYuqUsBgCVvyC162E6K2cCM3+tbgXmmu
         ejby0nsaY2VaCT06sFrOgWmg/S6cSKEDzzzUbf/E2BJFuBsJd/gYv9sWIGFtquWDmldZ
         2sKUL6T+lrSyjEjo5mzJVmzAIbw83JyLDCxLnWU31sLpikLOh/NHfJVdzEM5Euubx3+B
         3HEdk/NFAnyxrCtc67RkcgiVDcaCYvsjsPMVfS4K7QzzlI06XncQNnINHeNqOPz3Fkvu
         6pfFlqIIMVzMSXBe5xjmY0KEiW8BOr1x/dQBB+n18A+ewKK367a5p0lL+oTneWEpU/7c
         3jsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bgk0fvyLTEQHcq/I3vTtUQKrD/cy3HxJRA+JpMC9O8U=;
        b=ZYDsCjqIKu0Y04exu9SJix9Oej+NJ9VoGQ/GA5vqKIgCL1EsFPypEtblZxHuP1QzME
         VgTUZdYDajfp3mfIeP/MnAch9uTq6ut5k5h4knXUVp4qRu7rwDfPsABXt84ai6WRyrCi
         n3JfLl2xBqZuBl9bQcg0T5hC052FOkX9AjiFkMIYaM6dRq845ml2/KRL3zKzuAn7RGf1
         SZKZ63+T4+F8FY44ZZtYCgX5U0im6KTGlxTIxsvGWwkXN5Y8M7eMvzdR7Gc3Omo6zdXt
         ccjDfqztqolbG7b6ntBSqVncjEO25Q372HhgGyYiTSypFlUWytGUsV4tDtTOLFr4Egwv
         LgbQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=X2nDLgIg;
       spf=pass (google.com: domain of alistair23@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=alistair23@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <alistair23@gmail.com>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id x23sor722617lfc.28.2019.06.28.08.55.54
        (Google Transport Security);
        Fri, 28 Jun 2019 08:55:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of alistair23@gmail.com designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=X2nDLgIg;
       spf=pass (google.com: domain of alistair23@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=alistair23@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=bgk0fvyLTEQHcq/I3vTtUQKrD/cy3HxJRA+JpMC9O8U=;
        b=X2nDLgIgN8ohcI9VgAKoaRQgSB6JTHgQSKIzsKWuPHUPKvxsD/PrhM6VTbdgX+rtAB
         ID12yaHTxNsWS8k36R0qCDHDm0HnSXsf0GSyo+Ar1MOk6Xm7VmLu4LXYK9ayf2mcmTTu
         6ApedU/bVtHfP999OKH+fZiYovSrDl6JfYhliETAlbRexgtn92OuNGZoQKTrRow2pG67
         pS3lRZXa97QKQWplhrUcdU5VeYGAv/wDhMxtEhoJvdyzCUUoTh74vEgStsKXdJXThiAd
         y9XDIY/uP0nfGE3eBgZiNQCeTztkGZCZ01e8ENhE4RqozDFYwDy9F7jjLZgze2kRGoKl
         RU0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=bgk0fvyLTEQHcq/I3vTtUQKrD/cy3HxJRA+JpMC9O8U=;
        b=uoeW2493RD/nKdpc5LxGRGBySCK1u+hZ+hAtkB9+JlRPF2yPgshVxlNDWJqcKJeHbe
         WTCwT4s982zO2bYXerq7br3vANfjZzOT2lXtxHJ9OjrzU/JIBqRGZJMD2qWhIBUGEMc/
         5Dd4AB8K9JCj4M0/r/DfxZSWM6i6qi8Sl9nGpOauwKXJk4k1mFaWGSLT1gPYdiQ+r+3h
         arzh9oF5QLxb2g1cgepL5fSAEH0cu9cQTx7MCBotgfKUGAu6oBo68bz1S5HwydpRALqB
         pOreTiqtP99ozc6h/XI33AARlIVrmZwfAZ/aXS8dpJ6lI50396a4q4YvfKijInFkLg1n
         yG5Q==
X-Gm-Message-State: APjAAAWk8nWmAxFalLLINH3D8PcZ4ruTiFcwbJndxSHIqUyNSHN6bBUQ
	FZZ08z26XTViv/COsRFhL/I+WQQAmAp1NSfQA7w=
X-Google-Smtp-Source: APXvYqwORYg0P6FHZvInyutYrPaylKS/1sWpB26992IB2bRC9hdB73l4c5Vr+W+qTtyMVbv9c8y/qLqyLoBdbXs6OMU=
X-Received: by 2002:a19:4c05:: with SMTP id z5mr5295640lfa.5.1561737354154;
 Fri, 28 Jun 2019 08:55:54 -0700 (PDT)
MIME-Version: 1.0
References: <20190627202719.17739-1-philmd@redhat.com> <20190627202719.17739-3-philmd@redhat.com>
In-Reply-To: <20190627202719.17739-3-philmd@redhat.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 28 Jun 2019 08:52:52 -0700
Message-ID: <CAKmqyKPDKbHW+bH-sHefHJ3A_wpXNOyP2BoFRTtAMrr61yt6SA@mail.gmail.com>
Subject: Re: [Qemu-devel] [PATCH v5 02/28] hw/block/pflash: Simplify trace_pflash_io_read/write()
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
X-TUID: 4vw1jRur3GDb

On Thu, Jun 27, 2019 at 1:38 PM Philippe Mathieu-Daud=C3=A9
<philmd@redhat.com> wrote:
>
> Call the read() trace function after the value is set, so we can
> log the returned value.
> Rename the I/O trace functions with '_io_' in their name.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/block/pflash_cfi01.c | 5 +++--
>  hw/block/pflash_cfi02.c | 6 ++----
>  hw/block/trace-events   | 4 ++--
>  3 files changed, 7 insertions(+), 8 deletions(-)
>
> diff --git a/hw/block/pflash_cfi01.c b/hw/block/pflash_cfi01.c
> index 35080d915f..74fc1bc2da 100644
> --- a/hw/block/pflash_cfi01.c
> +++ b/hw/block/pflash_cfi01.c
> @@ -288,7 +288,6 @@ static uint32_t pflash_read(PFlashCFI01 *pfl, hwaddr =
offset,
>      uint32_t ret;
>
>      ret =3D -1;
> -    trace_pflash_read(offset, pfl->cmd, width, pfl->wcycle);
>      switch (pfl->cmd) {
>      default:
>          /* This should never happen : reset state & treat it as a read *=
/
> @@ -391,6 +390,8 @@ static uint32_t pflash_read(PFlashCFI01 *pfl, hwaddr =
offset,
>
>          break;
>      }
> +    trace_pflash_io_read(offset, width, width << 1, ret, pfl->cmd, pfl->=
wcycle);
> +
>      return ret;
>  }
>
> @@ -453,7 +454,7 @@ static void pflash_write(PFlashCFI01 *pfl, hwaddr off=
set,
>
>      cmd =3D value;
>
> -    trace_pflash_write(offset, value, width, pfl->wcycle);
> +    trace_pflash_io_write(offset, width, width << 1, value, pfl->wcycle)=
;
>      if (!pfl->wcycle) {
>          /* Set the device in I/O access mode */
>          memory_region_rom_device_set_romd(&pfl->mem, false);
> diff --git a/hw/block/pflash_cfi02.c b/hw/block/pflash_cfi02.c
> index eb106f4996..f05cd507b3 100644
> --- a/hw/block/pflash_cfi02.c
> +++ b/hw/block/pflash_cfi02.c
> @@ -145,7 +145,6 @@ static uint32_t pflash_read(PFlashCFI02 *pfl, hwaddr =
offset,
>      uint8_t *p;
>
>      ret =3D -1;
> -    trace_pflash_read(offset, pfl->cmd, width, pfl->wcycle);
>      /* Lazy reset to ROMD mode after a certain amount of read accesses *=
/
>      if (!pfl->rom_mode && pfl->wcycle =3D=3D 0 &&
>          ++pfl->read_counter > PFLASH_LAZY_ROMD_THRESHOLD) {
> @@ -241,6 +240,7 @@ static uint32_t pflash_read(PFlashCFI02 *pfl, hwaddr =
offset,
>          }
>          break;
>      }
> +    trace_pflash_io_read(offset, width, width << 1, ret, pfl->cmd, pfl->=
wcycle);
>
>      return ret;
>  }
> @@ -267,6 +267,7 @@ static void pflash_write(PFlashCFI02 *pfl, hwaddr off=
set,
>      uint8_t *p;
>      uint8_t cmd;
>
> +    trace_pflash_io_write(offset, width, width << 1, value, pfl->wcycle)=
;
>      cmd =3D value;
>      if (pfl->cmd !=3D 0xA0 && cmd =3D=3D 0xF0) {
>  #if 0
> @@ -275,11 +276,8 @@ static void pflash_write(PFlashCFI02 *pfl, hwaddr of=
fset,
>  #endif
>          goto reset_flash;
>      }
> -    trace_pflash_write(offset, value, width, pfl->wcycle);
>      offset &=3D pfl->chip_len - 1;
>
> -    DPRINTF("%s: offset " TARGET_FMT_plx " %08x %d\n", __func__,
> -            offset, value, width);
>      boff =3D offset & (pfl->sector_len - 1);
>      if (pfl->width =3D=3D 2)
>          boff =3D boff >> 1;
> diff --git a/hw/block/trace-events b/hw/block/trace-events
> index 97a17838ed..f637fe918e 100644
> --- a/hw/block/trace-events
> +++ b/hw/block/trace-events
> @@ -7,9 +7,9 @@ fdc_ioport_write(uint8_t reg, uint8_t value) "write reg 0=
x%02x val 0x%02x"
>  # pflash_cfi02.c
>  # pflash_cfi01.c
>  pflash_reset(void) "reset"
> -pflash_read(uint64_t offset, uint8_t cmd, int width, uint8_t wcycle) "of=
fset:0x%04"PRIx64" cmd:0x%02x width:%d wcycle:%u"
> -pflash_write(uint64_t offset, uint32_t value, int width, uint8_t wcycle)=
 "offset:0x%04"PRIx64" value:0x%03x width:%d wcycle:%u"
>  pflash_timer_expired(uint8_t cmd) "command 0x%02x done"
> +pflash_io_read(uint64_t offset, int width, int fmt_width, uint32_t value=
, uint8_t cmd, uint8_t wcycle) "offset:0x%04"PRIx64" width:%d value:0x%0*x =
cmd:0x%02x wcycle:%u"
> +pflash_io_write(uint64_t offset, int width, int fmt_width, uint32_t valu=
e, uint8_t wcycle) "offset:0x%04"PRIx64" width:%d value:0x%0*x wcycle:%u"
>  pflash_data_read8(uint64_t offset, uint32_t value) "data offset:0x%04"PR=
Ix64" value:0x%02x"
>  pflash_data_read16(uint64_t offset, uint32_t value) "data offset:0x%04"P=
RIx64" value:0x%04x"
>  pflash_data_read32(uint64_t offset, uint32_t value) "data offset:0x%04"P=
RIx64" value:0x%08x"
> --
> 2.20.1
>
>
