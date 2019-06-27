Received: by 2002:a5d:6790:0:0:0:0:0 with SMTP id v16csp1757250wru;
        Thu, 27 Jun 2019 14:50:02 -0700 (PDT)
X-Received: by 2002:a05:620a:15c9:: with SMTP id o9mr5278822qkm.195.1561672202659;
        Thu, 27 Jun 2019 14:50:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1561672202; cv=none;
        d=google.com; s=arc-20160816;
        b=vI5gJ5K4J+/uc5j215T7KbV9x8DpaF5t1MJ9/7neXWqYiacoMLkNaW014hBUz2ak5I
         DYU70SMK/Tob0CJ/D/pE8epxRjTVilHO78XR0GQDwTg86eVDaGhGe83duI2t3gwhMLgB
         uRsc5uwGAK1JYrUfiJnKyW6h9JkNJjAa7KjhIhqokLVzXA0EcDdMLxL6E7+BnFV8O9Sn
         zswckLWICLdJHu+FZYgzioo4pBGmrUcwz+2JC3sS6cgzTHqAu+yNVG/UcGB6GAowSatR
         cFoloq6fUkzyQAIa7j1XfwnWD3sUSBOEk+u8PBpeHCGVBC/4iVpeIsA6pWXMXFSpRyXy
         LFfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:dkim-signature;
        bh=QbnBPwpArp8APmHkjaYDxx4xjV+LBRD7FucskNM64kU=;
        b=CM4XF/eyJxv7wvO8yIHMz8VP7kjNXn22NeVRibvgboVUvcnSkV8kDUyYFCOfhU0wbz
         azQPhA8kv8DNIUEJwsNX+yNeEiadse7ngMNC095Sy15W0XaqEIXC5iCpVpZNcdpSTBGi
         IzLMDGmD1Xe3EYXbjbUlz6+jHkB/jfW4tW6cIrOnC0aEBzkQvtOvVpRWqh0w5SNiWMSk
         mRqrRvHYDTWZLMk2sHrZDQKwBzJL1arrsfuKUHTUObiO3Pd+Bux2r4RbmBCdruqtTmmh
         CeaQReTe6NdArx4MILOagtmsfWzwefpzb1aRw5YpNdTfpCZ5uJqL3AEvLO35G6hvBkWo
         F4KA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@oberlin.edu header.s=google header.b=Fi2uJbY0;
       spf=pass (google.com: domain of stephen.checkoway@oberlin.edu designates 209.85.220.65 as permitted sender) smtp.mailfrom=stephen.checkoway@oberlin.edu
Return-Path: <stephen.checkoway@oberlin.edu>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id p53sor532930qte.29.2019.06.27.14.50.02
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 27 Jun 2019 14:50:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of stephen.checkoway@oberlin.edu designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@oberlin.edu header.s=google header.b=Fi2uJbY0;
       spf=pass (google.com: domain of stephen.checkoway@oberlin.edu designates 209.85.220.65 as permitted sender) smtp.mailfrom=stephen.checkoway@oberlin.edu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oberlin.edu; s=google;
        h=mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=QbnBPwpArp8APmHkjaYDxx4xjV+LBRD7FucskNM64kU=;
        b=Fi2uJbY03hYKyOPrcwR82UCikqesbMv+jJJ3UifFghjxq0SDCKmNQafJMmzEtIoj47
         5jSxC7+lmFJU6KBdvvZQAeHnDeroh7lq5IlTV0m7v/9X5ddZJjUmaYE3/+/LuaFl+rpn
         Y6pF5RrTdJcRysd+2DMqVC+au3BnJ/5UY4rPsUC/Uts0WqZMjpDGKTYHh9/0z1lmfJky
         FuXnO2sop0RwIfTuzVmT+ZzoOndJ5NZP5xwN9hN/NGsFfxk71outwnDV+hg15ckz1+dr
         vlwGjuafDRbubxJrLWzCrOI6TD6ebGVnVuAbbsHru4LjdCXxAxcEaXjcniQ8O9o/X6gb
         dKfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=QbnBPwpArp8APmHkjaYDxx4xjV+LBRD7FucskNM64kU=;
        b=b+xJ8kkmdU4g1EBm6aakqIeCCpDHDr+j4k2OGBaWHrkczU16adta1cvYVPFetOwR+3
         3rPy1ZliFuNpff674dl9+fRBqeAjAO5QUDNqWETg6hDDCzR2wzgwFQ3xGjSsWYG8EIoF
         FwDz5vU0CgUlo1Uv32HiS9nLp2VDR+zeDnk8FZrOAXUR5W0aI6P1/BXqOcu1CHER4/5E
         u0aj9Tu8pOXnlZBDvnMtA/JW/yZPqifbUIWQ9TXZcvO/+gcLuP+xubB1w53Pc2unhpz8
         SAA6/RDd1kSTtZYWxvhPPAQRvNViYXKMzsuin7W0jZpkwTB2oBkbJ9A5vJu7lGplhlMx
         iUUQ==
X-Gm-Message-State: APjAAAWEgZFB+nzWw09nubWzTI9dc5H82E/2dmKhWPuGyo6q8L1FIjv7
	F9VCngQdFbUYse0Z/5JBrH0j+A==
X-Google-Smtp-Source: APXvYqyF0HrHO7l587Wqzi5qawdfv2YTHeAxa+pAKH4pUPpmcChWNSQitWPT4FWUCfw4yDp6ztiwrA==
X-Received: by 2002:ac8:2baa:: with SMTP id m39mr5294131qtm.242.1561672202323;
        Thu, 27 Jun 2019 14:50:02 -0700 (PDT)
Return-Path: <stephen.checkoway@oberlin.edu>
Received: from [192.168.1.7] (ip-210-181.oberlin.net. [208.66.210.181])
        by smtp.gmail.com with ESMTPSA id z63sm153712qkb.136.2019.06.27.14.49.59
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 27 Jun 2019 14:50:01 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 11.5 \(3445.9.1\))
Subject: Re: [PATCH v5 02/28] hw/block/pflash: Simplify
 trace_pflash_io_read/write()
From: Stephen Checkoway <stephen.checkoway@oberlin.edu>
In-Reply-To: <20190627202719.17739-3-philmd@redhat.com>
Date: Thu, 27 Jun 2019 17:49:57 -0400
Cc: qemu-devel@nongnu.org,
 Magnus Damm <magnus.damm@gmail.com>,
 qemu-block@nongnu.org,
 Kevin Wolf <kwolf@redhat.com>,
 Antony Pavlov <antonynpavlov@gmail.com>,
 Max Reitz <mreitz@redhat.com>,
 qemu-ppc@nongnu.org,
 Thomas Huth <thuth@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 qemu-arm@nongnu.org,
 Laurent Vivier <lvivier@redhat.com>,
 Jan Kiszka <jan.kiszka@web.de>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Michael Walle <michael@walle.cc>,
 Peter Maydell <peter.maydell@linaro.org>,
 John Snow <jsnow@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Alistair Francis <alistair@alistair23.me>,
 =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <BCB1CC45-F457-4F8B-8F9E-DC70CF9CE35A@oberlin.edu>
References: <20190627202719.17739-1-philmd@redhat.com>
 <20190627202719.17739-3-philmd@redhat.com>
To: =?utf-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@redhat.com>
X-Mailer: Apple Mail (2.3445.9.1)
X-TUID: miPn1PDM2sE5

Hi Phil,

Thanks for pushing this forward! I'll try to get to the rest of these =
early next week.

> On Jun 27, 2019, at 16:26, Philippe Mathieu-Daud=C3=A9 =
<philmd@redhat.com> wrote:
>=20
> Call the read() trace function after the value is set, so we can
> log the returned value.
> Rename the I/O trace functions with '_io_' in their name.
>=20
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
> hw/block/pflash_cfi01.c | 5 +++--
> hw/block/pflash_cfi02.c | 6 ++----
> hw/block/trace-events   | 4 ++--
> 3 files changed, 7 insertions(+), 8 deletions(-)
>=20
> diff --git a/hw/block/pflash_cfi01.c b/hw/block/pflash_cfi01.c
> index 35080d915f..74fc1bc2da 100644
> --- a/hw/block/pflash_cfi01.c
> +++ b/hw/block/pflash_cfi01.c
> @@ -288,7 +288,6 @@ static uint32_t pflash_read(PFlashCFI01 *pfl, =
hwaddr offset,
>     uint32_t ret;
>=20
>     ret =3D -1;
> -    trace_pflash_read(offset, pfl->cmd, width, pfl->wcycle);
>     switch (pfl->cmd) {
>     default:
>         /* This should never happen : reset state & treat it as a read =
*/
> @@ -391,6 +390,8 @@ static uint32_t pflash_read(PFlashCFI01 *pfl, =
hwaddr offset,
>=20
>         break;
>     }
> +    trace_pflash_io_read(offset, width, width << 1, ret, pfl->cmd, =
pfl->wcycle);

width * 2 might make it more clear what is going on.

> +
>     return ret;
> }
>=20
> @@ -453,7 +454,7 @@ static void pflash_write(PFlashCFI01 *pfl, hwaddr =
offset,
>=20
>     cmd =3D value;
>=20
> -    trace_pflash_write(offset, value, width, pfl->wcycle);
> +    trace_pflash_io_write(offset, width, width << 1, value, =
pfl->wcycle);

Same here.

>     if (!pfl->wcycle) {
>         /* Set the device in I/O access mode */
>         memory_region_rom_device_set_romd(&pfl->mem, false);
> diff --git a/hw/block/pflash_cfi02.c b/hw/block/pflash_cfi02.c
> index eb106f4996..f05cd507b3 100644
> --- a/hw/block/pflash_cfi02.c
> +++ b/hw/block/pflash_cfi02.c
> @@ -145,7 +145,6 @@ static uint32_t pflash_read(PFlashCFI02 *pfl, =
hwaddr offset,
>     uint8_t *p;
>=20
>     ret =3D -1;
> -    trace_pflash_read(offset, pfl->cmd, width, pfl->wcycle);
>     /* Lazy reset to ROMD mode after a certain amount of read accesses =
*/
>     if (!pfl->rom_mode && pfl->wcycle =3D=3D 0 &&
>         ++pfl->read_counter > PFLASH_LAZY_ROMD_THRESHOLD) {
> @@ -241,6 +240,7 @@ static uint32_t pflash_read(PFlashCFI02 *pfl, =
hwaddr offset,
>         }
>         break;
>     }
> +    trace_pflash_io_read(offset, width, width << 1, ret, pfl->cmd, =
pfl->wcycle);

And here.

>=20
>     return ret;
> }
> @@ -267,6 +267,7 @@ static void pflash_write(PFlashCFI02 *pfl, hwaddr =
offset,
>     uint8_t *p;
>     uint8_t cmd;
>=20
> +    trace_pflash_io_write(offset, width, width << 1, value, =
pfl->wcycle);

And here.

>     cmd =3D value;
>     if (pfl->cmd !=3D 0xA0 && cmd =3D=3D 0xF0) {
> #if 0
> @@ -275,11 +276,8 @@ static void pflash_write(PFlashCFI02 *pfl, hwaddr =
offset,
> #endif
>         goto reset_flash;
>     }
> -    trace_pflash_write(offset, value, width, pfl->wcycle);
>     offset &=3D pfl->chip_len - 1;
>=20
> -    DPRINTF("%s: offset " TARGET_FMT_plx " %08x %d\n", __func__,
> -            offset, value, width);
>     boff =3D offset & (pfl->sector_len - 1);
>     if (pfl->width =3D=3D 2)
>         boff =3D boff >> 1;
> diff --git a/hw/block/trace-events b/hw/block/trace-events
> index 97a17838ed..f637fe918e 100644
> --- a/hw/block/trace-events
> +++ b/hw/block/trace-events
> @@ -7,9 +7,9 @@ fdc_ioport_write(uint8_t reg, uint8_t value) "write =
reg 0x%02x val 0x%02x"
> # pflash_cfi02.c
> # pflash_cfi01.c
> pflash_reset(void) "reset"
> -pflash_read(uint64_t offset, uint8_t cmd, int width, uint8_t wcycle) =
"offset:0x%04"PRIx64" cmd:0x%02x width:%d wcycle:%u"
> -pflash_write(uint64_t offset, uint32_t value, int width, uint8_t =
wcycle) "offset:0x%04"PRIx64" value:0x%03x width:%d wcycle:%u"
> pflash_timer_expired(uint8_t cmd) "command 0x%02x done"
> +pflash_io_read(uint64_t offset, int width, int fmt_width, uint32_t =
value, uint8_t cmd, uint8_t wcycle) "offset:0x%04"PRIx64" width:%d =
value:0x%0*x cmd:0x%02x wcycle:%u"
> +pflash_io_write(uint64_t offset, int width, int fmt_width, uint32_t =
value, uint8_t wcycle) "offset:0x%04"PRIx64" width:%d value:0x%0*x =
wcycle:%u"
> pflash_data_read8(uint64_t offset, uint32_t value) "data =
offset:0x%04"PRIx64" value:0x%02x"
> pflash_data_read16(uint64_t offset, uint32_t value) "data =
offset:0x%04"PRIx64" value:0x%04x"
> pflash_data_read32(uint64_t offset, uint32_t value) "data =
offset:0x%04"PRIx64" value:0x%08x"
> --=20
> 2.20.1
>=20

Either way,

Signed-off-by: Stephen Checkoway <stephen.checkoway@oberlin.edu>

(And please let me know if I'm doing code review incorrectly or if that =
should be Reviewed-by or whatever.)

Cheers,

Steve=20

--=20
Stephen Checkoway




