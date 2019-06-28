Received: by 2002:a5d:6790:0:0:0:0:0 with SMTP id v16csp2680793wru;
        Fri, 28 Jun 2019 09:28:54 -0700 (PDT)
X-Received: by 2002:a2e:6348:: with SMTP id x69mr6854607ljb.186.1561739334780;
        Fri, 28 Jun 2019 09:28:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1561739334; cv=none;
        d=google.com; s=arc-20160816;
        b=rYm8HuYX8gRs98FOREwt7TVZUa9oelYIMgADCv4I+p/Afz5UspJT2jyGfY4cPm27le
         ayaKB5sMFN8dPpHTp18TMZaGCRjUQXtVEdHtLHqDtJWcYjw5R0WQVMyiCxYS+nwmK+rS
         QhneyMB55h9OajcolMoEQ6JAoKZwrs2mrGutUdkIXYzGulG9jw1tOxHBlOmfFXSnEu5U
         hl24Avodp/HSX9+fsrmsEkyv6Og/7bkZOGognojX6FsRYZ3XeNV1cpCHVvrRiXYtTkDt
         O83PO571TE66GS2DB8Ygq5y/KGToysJwLfjQY742SY1zsSyVOPjNaEFXjeXaR5c924Zi
         Ybig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QVB/NSSXD1O9PJfpJgBnUtdqj1nZvjQkzhHzB0cTIT8=;
        b=XofVr4aFO83lU7/lGAUHm7oefQfePBVxBQlUEuIuePSLprJKvEmoHUfWUAESL/1JDC
         RF3kX2s6ZHRFrETLP5qLhMw8hZEL4DZq8sf5HY03FSfC2DT3B9zAXkLvOUSPA0KwK3Va
         Lj8MaXwHKuR2NvaSDSOk5nqu3iVC1inZH22h+a+S09EMgNyXT9aWEDoYHBpxbkHs9CJu
         6G2B5iYVom6zV+N9dlPc326riO7Ys2Ewbjg7JKA71aQgy5m6vOFwWr+CI/NjGonxrLfC
         c7LOwFEmDHMMDpFUAD1tKS9Hl6do1R1tg023k0guzH3CnactU7b93a+HHjFllQmUwU+R
         A55Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=R0w0My9k;
       spf=pass (google.com: domain of alistair23@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=alistair23@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <alistair23@gmail.com>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id r23sor1841416lja.30.2019.06.28.09.28.54
        (Google Transport Security);
        Fri, 28 Jun 2019 09:28:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of alistair23@gmail.com designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=R0w0My9k;
       spf=pass (google.com: domain of alistair23@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=alistair23@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=QVB/NSSXD1O9PJfpJgBnUtdqj1nZvjQkzhHzB0cTIT8=;
        b=R0w0My9k0LGfPuSHVeEM2AEV4KH6AdXauh6PGZwDRpAZ5Q+B0xjXl1/q6NMInSx0oD
         6S8nxA2bO2qomK6YJPFkztAXNTkCIlXqWgM2Mh8GxhpjAHXAj1IguoU9gYAmXNtbKuC1
         v+pHO2DKOrsLkyR+zh9n2WCPnH/qlvmuA+qJlJ7pAtEreVJgkKZ3Y4QVhp5l9WSr50nY
         TSIIRFGbYkpHjKuV+xtSNFSiLu48cGTfYSC3Igh9MAIBsxLCuJ4kwGkTAVAUhqNorWUi
         pUXfLitL8vykxdNP+0B872t9bdDIxlCGJ1rQ25Wz/Sq4t0zrwHmAT99XG2gmsmlHnVUE
         WcxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=QVB/NSSXD1O9PJfpJgBnUtdqj1nZvjQkzhHzB0cTIT8=;
        b=qaDeHsz/LVCmX84tcaIPgkaLRHwB+URzA7LNuEPZUdeFUhALhJjFvcpcYNp49l6hD4
         inwMwcPlWCuu+lwu7RuGCqkRGUOa3GAPVRh0c9sRYG2zGrw87FNyMf9XF7GdZc3B4WDO
         O7JlXz0iQb/jvrXcY3jwmQfsUwxXZ7VOMV4OqzmqEBo2qaDXG/CmBUro+WB3wjjylWGH
         QU0bcvJFAvdmzrUwRi/5oHGTZE9ryoPmZ0d/1rDUEfc+mLPj3JBlEXW0PO9VWt8ugqM6
         /wIklm/DIaWm5LWMXKxTtyWq/cnc0eqqC4MrDCEcW1ExREAZJ0hHATTW/Al4Ba5YhT+Q
         CoVA==
X-Gm-Message-State: APjAAAV909Td1N57NawTcMhCVmdsSCdvJ/UXaxBvbJisX4dC2OmnB/3y
	Ew2MuD7riMVNZjdIvjHbrvToZizmeCnDV4KFSwYjiFntiGU=
X-Google-Smtp-Source: APXvYqwE3SoT3F/fw8wD3kt0QK6lMJxqLDLH1gpPphVe5fp4qHC9vp5YiLw+eQVjlHzRTEo75pqQ956J4zaUQ8Te03A=
X-Received: by 2002:a2e:3604:: with SMTP id d4mr6765360lja.85.1561739334453;
 Fri, 28 Jun 2019 09:28:54 -0700 (PDT)
MIME-Version: 1.0
References: <20190627202719.17739-1-philmd@redhat.com> <20190627202719.17739-12-philmd@redhat.com>
In-Reply-To: <20190627202719.17739-12-philmd@redhat.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 28 Jun 2019 09:25:42 -0700
Message-ID: <CAKmqyKMi4HJgrKZekt6KDouFu7mvtKGuyAP6Tk6wRXGP1zXMdQ@mail.gmail.com>
Subject: Re: [Qemu-devel] [PATCH v5 11/28] hw/block/pflash_cfi02: Unify the MemoryRegionOps
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
X-TUID: 36uDj6XleH04

On Thu, Jun 27, 2019 at 1:37 PM Philippe Mathieu-Daud=C3=A9
<philmd@redhat.com> wrote:
>
> The pflash_read()/pflash_write() can check the device endianess
> via the pfl->be variable, so remove the 'int be' argument.
>
> Since the big/little MemoryRegionOps are now identical, it is
> pointless to declare them both. Unify them.
>
> Signed-off-by: Stephen Checkoway <stephen.checkoway@oberlin.edu>
> Message-Id: <20190426162624.55977-3-stephen.checkoway@oberlin.edu>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> Tested-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> [PMD: Extracted from bigger patch to ease review]
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Nice cleanup!

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/block/pflash_cfi02.c | 60 +++++++++++------------------------------
>  1 file changed, 15 insertions(+), 45 deletions(-)
>
> diff --git a/hw/block/pflash_cfi02.c b/hw/block/pflash_cfi02.c
> index c079a63880..e64dc69c6c 100644
> --- a/hw/block/pflash_cfi02.c
> +++ b/hw/block/pflash_cfi02.c
> @@ -177,11 +177,11 @@ static uint64_t pflash_data_read(PFlashCFI02 *pfl, =
hwaddr offset,
>      return ret;
>  }
>
> -static uint32_t pflash_read(PFlashCFI02 *pfl, hwaddr offset,
> -                            int width, int be)
> +static uint64_t pflash_read(void *opaque, hwaddr offset, unsigned int wi=
dth)
>  {
> +    PFlashCFI02 *pfl =3D opaque;
>      hwaddr boff;
> -    uint32_t ret;
> +    uint64_t ret;
>
>      ret =3D -1;
>      /* Lazy reset to ROMD mode after a certain amount of read accesses *=
/
> @@ -228,14 +228,14 @@ static uint32_t pflash_read(PFlashCFI02 *pfl, hwadd=
r offset,
>          default:
>              ret =3D pflash_data_read(pfl, offset, width);
>          }
> -        DPRINTF("%s: ID " TARGET_FMT_plx " %" PRIx32 "\n", __func__, bof=
f, ret);
> +        DPRINTF("%s: ID " TARGET_FMT_plx " %" PRIx64 "\n", __func__, bof=
f, ret);
>          break;
>      case 0xA0:
>      case 0x10:
>      case 0x30:
>          /* Status register read */
>          ret =3D pfl->status;
> -        DPRINTF("%s: status %" PRIx32 "\n", __func__, ret);
> +        DPRINTF("%s: status %" PRIx64 "\n", __func__, ret);
>          toggle_dq6(pfl);
>          break;
>      case 0x98:
> @@ -253,8 +253,7 @@ static uint32_t pflash_read(PFlashCFI02 *pfl, hwaddr =
offset,
>  }
>
>  /* update flash content on disk */
> -static void pflash_update(PFlashCFI02 *pfl, int offset,
> -                          int size)
> +static void pflash_update(PFlashCFI02 *pfl, int offset, int size)
>  {
>      int offset_end;
>      if (pfl->blk) {
> @@ -267,9 +266,10 @@ static void pflash_update(PFlashCFI02 *pfl, int offs=
et,
>      }
>  }
>
> -static void pflash_write(PFlashCFI02 *pfl, hwaddr offset,
> -                         uint32_t value, int width, int be)
> +static void pflash_write(void *opaque, hwaddr offset, uint64_t value,
> +                         unsigned int width)
>  {
> +    PFlashCFI02 *pfl =3D opaque;
>      hwaddr boff;
>      uint8_t *p;
>      uint8_t cmd;
> @@ -477,39 +477,9 @@ static void pflash_write(PFlashCFI02 *pfl, hwaddr of=
fset,
>      pfl->cmd =3D 0;
>  }
>
> -static uint64_t pflash_be_readfn(void *opaque, hwaddr addr, unsigned siz=
e)
> -{
> -    return pflash_read(opaque, addr, size, 1);
> -}
> -
> -static void pflash_be_writefn(void *opaque, hwaddr addr,
> -                              uint64_t value, unsigned size)
> -{
> -    pflash_write(opaque, addr, value, size, 1);
> -}
> -
> -static uint64_t pflash_le_readfn(void *opaque, hwaddr addr, unsigned siz=
e)
> -{
> -    return pflash_read(opaque, addr, size, 0);
> -}
> -
> -static void pflash_le_writefn(void *opaque, hwaddr addr,
> -                              uint64_t value, unsigned size)
> -{
> -    pflash_write(opaque, addr, value, size, 0);
> -}
> -
> -static const MemoryRegionOps pflash_cfi02_ops_be =3D {
> -    .read =3D pflash_be_readfn,
> -    .write =3D pflash_be_writefn,
> -    .valid.min_access_size =3D 1,
> -    .valid.max_access_size =3D 4,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> -};
> -
> -static const MemoryRegionOps pflash_cfi02_ops_le =3D {
> -    .read =3D pflash_le_readfn,
> -    .write =3D pflash_le_writefn,
> +static const MemoryRegionOps pflash_cfi02_ops =3D {
> +    .read =3D pflash_read,
> +    .write =3D pflash_write,
>      .valid.min_access_size =3D 1,
>      .valid.max_access_size =3D 4,
>      .endianness =3D DEVICE_NATIVE_ENDIAN,
> @@ -537,9 +507,9 @@ static void pflash_cfi02_realize(DeviceState *dev, Er=
ror **errp)
>
>      chip_len =3D pfl->sector_len * pfl->nb_blocs;
>
> -    memory_region_init_rom_device(&pfl->orig_mem, OBJECT(pfl), pfl->be ?
> -                                  &pflash_cfi02_ops_be : &pflash_cfi02_o=
ps_le,
> -                                  pfl, pfl->name, chip_len, &local_err);
> +    memory_region_init_rom_device(&pfl->orig_mem, OBJECT(pfl),
> +                                  &pflash_cfi02_ops, pfl, pfl->name,
> +                                  chip_len, &local_err);
>      if (local_err) {
>          error_propagate(errp, local_err);
>          return;
> --
> 2.20.1
>
>
