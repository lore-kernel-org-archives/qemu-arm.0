Received: by 2002:a5d:6790:0:0:0:0:0 with SMTP id v16csp2650581wru;
        Fri, 28 Jun 2019 08:57:58 -0700 (PDT)
X-Received: by 2002:a2e:9b81:: with SMTP id z1mr6657313lji.101.1561737478455;
        Fri, 28 Jun 2019 08:57:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1561737478; cv=none;
        d=google.com; s=arc-20160816;
        b=gHE5y0YQUZRnkFX2/NOnyhFozU2wFe5XK0WEbcYPLTcTsCbjKf+Kb9WOyNRwzD35PL
         eDoYySwsGfrJkrlWVKE6o30LdV3q+slPZZ9bBkECTAcGJoT8YlUkGu5UpufQ0IkE256o
         pPgcm8pH9mYLjXc0IdIAkcRgBAz1/NLPR+2qZ4OGz4+k5ciJT8n4IfM1FoXrO1CfNl9+
         rbUFTsDuFzqzEo6hXM9AUEA4OS1gOVgSOJ1r97/SMM52Be4C67ADfL6UwWkUQQC2/r2X
         PyWhR7VfF8nGYBDXoULn5TLvusf0XcGL4d9B+n0ICH41XXfwxht3MTyrfR3pFW0WeO8R
         kKAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6P2AsnQVf0FQrkcwCPwcdNXTqIcjVBDpEya1qSDIhME=;
        b=RHxa3AlwXUFA14vJPiOc6Y8UYcIv7spn/qI20CpIIllKN4v08TJkQ3PVuHoGqS6Rsz
         nZbl1I9XkZp7MgS/zqdodzLi/nRXIHajIEKfQlNlcqxjWS+tyupLxkD/aHZVoUz4mnIP
         PD8AEkey/UxVS1zFJs9PdRFGILh4HB9bm0SmCKkRgM2B7zAbF9wQvg7pCNMZ0KDgdRJA
         wz/clCmBa//opirpdjmldjuKpIvLr5oG6MN5GWjmfaZpAeYcXz+61nwXpzRT8DqyNVpA
         D4Yo93k5OiQf63IKFNtvtM+F5COtqMenJkx6nUt0X/OtqQv6rh4iEXehBTTQAPfpp0Pn
         syHg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=hqYK6DSL;
       spf=pass (google.com: domain of alistair23@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=alistair23@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <alistair23@gmail.com>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id k19sor1813358ljj.5.2019.06.28.08.57.58
        (Google Transport Security);
        Fri, 28 Jun 2019 08:57:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of alistair23@gmail.com designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=hqYK6DSL;
       spf=pass (google.com: domain of alistair23@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=alistair23@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=6P2AsnQVf0FQrkcwCPwcdNXTqIcjVBDpEya1qSDIhME=;
        b=hqYK6DSLbuR64O2JlOY5sCrC29/pficIv92hR/FXfa1OHCwAII5SdgI4U2XEMidVn7
         cr9VE6Vs7f4tj3jXUKmtEwRNWLHcJhhXGVf+86Y+XsgEYIceOsepKZUz6KtDGKlRWlse
         X0kwTVTryufGgbpsbtH3sNhrx5fG4+K+cZYI/XgWVUfVzUFu1tf/GzEIgwn+jGatJZkm
         kFezjEPu4DC+0Ny8gzQRfZS2ZEUbtUpKvHPTdku6K92wPmw/fG9rqbsUBpyxB/z+NhrL
         le61Yh2zBL2B0JOooETvBQG8yVpydqwZHgfBQxV+Ee5BnQM3ECFIryoUPGkg4T3zNw2j
         piXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=6P2AsnQVf0FQrkcwCPwcdNXTqIcjVBDpEya1qSDIhME=;
        b=sC/2ISi8PVZIou7+RB2kEZ64KPcIcfNz27VniFT6iaH027UAW+fPyPMejEgkIDgcAx
         V53yfYEGKeUAgSSR/37qNy/FCVVO9CV6/GmSUFXxgiHYz8P0jH/PpY+pkzAQ6a1oVRYH
         RRdw1PYwHrj8Z6a7NyInWitqW8b15nYTuu7xxDNfLEfPAnjj0Lr4/7gFlG9Y0EUBhakK
         CFL8ZI4jtkH533Ge/6pwLxI9XxM3OMeeHLboNURbPoH1KBinZp+lj/u6CUpzp4UIJ3Ef
         kM+/3cQw7/D2Xw+E5iDH6C5i6r43B3eYz2YiIsOMZ1NTQK5t4MVqty7bU3IFWMwu4qBd
         hQHg==
X-Gm-Message-State: APjAAAVKAKnxhJZfPwgTEJ55ZbxgZLI5yBSlu44wPoVEXL+q28tFsqbb
	MOMivVsKJHtU26GfvQnNEAjpha3hsmT5F53hQP/MkTyIF00=
X-Google-Smtp-Source: APXvYqxpNef68QMH7CiWEYfWfTzzEtLyB0MkaOvf56shyakrmsPL7Jd9RxlUGmxnISZjOKT00/jyAndxv5VjSegmWjE=
X-Received: by 2002:a2e:9188:: with SMTP id f8mr1092767ljg.33.1561737477909;
 Fri, 28 Jun 2019 08:57:57 -0700 (PDT)
MIME-Version: 1.0
References: <20190627202719.17739-1-philmd@redhat.com> <20190627202719.17739-4-philmd@redhat.com>
In-Reply-To: <20190627202719.17739-4-philmd@redhat.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 28 Jun 2019 08:54:57 -0700
Message-ID: <CAKmqyKPQEV=p1PDM75S0QOB6z-f-P2jBLv5EzZpj+6S5dyKzEg@mail.gmail.com>
Subject: Re: [Qemu-devel] [PATCH v5 03/28] hw/block/pflash: Simplify trace_pflash_data_read/write()
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
X-TUID: ZItEPb0s9wWd

On Thu, Jun 27, 2019 at 1:30 PM Philippe Mathieu-Daud=C3=A9
<philmd@redhat.com> wrote:
>
> Use a field width format to have a single function to log
> the different width accesses.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/block/pflash_cfi01.c | 6 ++----
>  hw/block/pflash_cfi02.c | 6 ++----
>  hw/block/trace-events   | 6 ++----
>  3 files changed, 6 insertions(+), 12 deletions(-)
>
> diff --git a/hw/block/pflash_cfi01.c b/hw/block/pflash_cfi01.c
> index 74fc1bc2da..db4a246b22 100644
> --- a/hw/block/pflash_cfi01.c
> +++ b/hw/block/pflash_cfi01.c
> @@ -248,7 +248,6 @@ static uint32_t pflash_data_read(PFlashCFI01 *pfl, hw=
addr offset,
>      switch (width) {
>      case 1:
>          ret =3D p[offset];
> -        trace_pflash_data_read8(offset, ret);
>          break;
>      case 2:
>          if (be) {
> @@ -258,7 +257,6 @@ static uint32_t pflash_data_read(PFlashCFI01 *pfl, hw=
addr offset,
>              ret =3D p[offset];
>              ret |=3D p[offset + 1] << 8;
>          }
> -        trace_pflash_data_read16(offset, ret);
>          break;
>      case 4:
>          if (be) {
> @@ -272,12 +270,12 @@ static uint32_t pflash_data_read(PFlashCFI01 *pfl, =
hwaddr offset,
>              ret |=3D p[offset + 2] << 16;
>              ret |=3D p[offset + 3] << 24;
>          }
> -        trace_pflash_data_read32(offset, ret);
>          break;
>      default:
>          DPRINTF("BUG in %s\n", __func__);
>          abort();
>      }
> +    trace_pflash_data_read(offset, width << 1, ret);
>      return ret;
>  }
>
> @@ -415,7 +413,7 @@ static inline void pflash_data_write(PFlashCFI01 *pfl=
, hwaddr offset,
>  {
>      uint8_t *p =3D pfl->storage;
>
> -    trace_pflash_data_write(offset, value, width, pfl->counter);
> +    trace_pflash_data_write(offset, width << 1, value, pfl->counter);
>      switch (width) {
>      case 1:
>          p[offset] =3D value;
> diff --git a/hw/block/pflash_cfi02.c b/hw/block/pflash_cfi02.c
> index f05cd507b3..6cdfc85264 100644
> --- a/hw/block/pflash_cfi02.c
> +++ b/hw/block/pflash_cfi02.c
> @@ -172,7 +172,6 @@ static uint32_t pflash_read(PFlashCFI02 *pfl, hwaddr =
offset,
>          switch (width) {
>          case 1:
>              ret =3D p[offset];
> -            trace_pflash_data_read8(offset, ret);
>              break;
>          case 2:
>              if (be) {
> @@ -182,7 +181,6 @@ static uint32_t pflash_read(PFlashCFI02 *pfl, hwaddr =
offset,
>                  ret =3D p[offset];
>                  ret |=3D p[offset + 1] << 8;
>              }
> -            trace_pflash_data_read16(offset, ret);
>              break;
>          case 4:
>              if (be) {
> @@ -196,9 +194,9 @@ static uint32_t pflash_read(PFlashCFI02 *pfl, hwaddr =
offset,
>                  ret |=3D p[offset + 2] << 16;
>                  ret |=3D p[offset + 3] << 24;
>              }
> -            trace_pflash_data_read32(offset, ret);
>              break;
>          }
> +        trace_pflash_data_read(offset, width << 1, ret);
>          break;
>      case 0x90:
>          /* flash ID read */
> @@ -343,7 +341,7 @@ static void pflash_write(PFlashCFI02 *pfl, hwaddr off=
set,
>              /* We need another unlock sequence */
>              goto check_unlock0;
>          case 0xA0:
> -            trace_pflash_data_write(offset, value, width, 0);
> +            trace_pflash_data_write(offset, width << 1, value, 0);
>              p =3D pfl->storage;
>              if (!pfl->ro) {
>                  switch (width) {
> diff --git a/hw/block/trace-events b/hw/block/trace-events
> index f637fe918e..13d1b21dd4 100644
> --- a/hw/block/trace-events
> +++ b/hw/block/trace-events
> @@ -10,10 +10,8 @@ pflash_reset(void) "reset"
>  pflash_timer_expired(uint8_t cmd) "command 0x%02x done"
>  pflash_io_read(uint64_t offset, int width, int fmt_width, uint32_t value=
, uint8_t cmd, uint8_t wcycle) "offset:0x%04"PRIx64" width:%d value:0x%0*x =
cmd:0x%02x wcycle:%u"
>  pflash_io_write(uint64_t offset, int width, int fmt_width, uint32_t valu=
e, uint8_t wcycle) "offset:0x%04"PRIx64" width:%d value:0x%0*x wcycle:%u"
> -pflash_data_read8(uint64_t offset, uint32_t value) "data offset:0x%04"PR=
Ix64" value:0x%02x"
> -pflash_data_read16(uint64_t offset, uint32_t value) "data offset:0x%04"P=
RIx64" value:0x%04x"
> -pflash_data_read32(uint64_t offset, uint32_t value) "data offset:0x%04"P=
RIx64" value:0x%08x"
> -pflash_data_write(uint64_t offset, uint32_t value, int width, uint64_t c=
ounter) "data offset:0x%04"PRIx64" value:0x%08x width:%d counter:0x%016"PRI=
x64
> +pflash_data_read(uint64_t offset, int width, uint32_t value) "data offse=
t:0x%04"PRIx64" value:0x%0*x"
> +pflash_data_write(uint64_t offset, int width, uint32_t value, uint64_t c=
ounter) "data offset:0x%04"PRIx64" value:0x%0*x counter:0x%016"PRIx64
>  pflash_manufacturer_id(uint16_t id) "Read Manufacturer ID: 0x%04x"
>  pflash_device_id(uint16_t id) "Read Device ID: 0x%04x"
>  pflash_device_info(uint64_t offset) "Read Device Information offset:0x%0=
4"PRIx64
> --
> 2.20.1
>
>
