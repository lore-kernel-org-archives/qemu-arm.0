Received: by 2002:a5d:6790:0:0:0:0:0 with SMTP id v16csp2683183wru;
        Fri, 28 Jun 2019 09:31:25 -0700 (PDT)
X-Received: by 2002:a2e:87d0:: with SMTP id v16mr6763618ljj.24.1561739485332;
        Fri, 28 Jun 2019 09:31:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1561739485; cv=none;
        d=google.com; s=arc-20160816;
        b=Df0ZB9LGlepF2zmip0E0wbwVsm3XRE8WV6rru4vldd5Jbwb2dLrkfEaMXteEMrVT+a
         t7tuJsiEyVsXVHeX/yrurR6se9dL6KBwLuWIaJQRWVNDkAC8HvXUfz/sbifARxmT3IC4
         1SEFeyI9t/S+/tHQm+ehvZNKvJDsK5/TFJkjmfNAZz0VbDusBxVrFeq1m248vCmlq60r
         2Svv1TgDPDDFL6A1/m4apxdMJYHhNGEr9Q3+pvxSbyEtWHxHKQ6vEQtQvKEEeIc5hPFX
         dv5nzCGj0S7iNsOc5i3tWC+KZqy5GCYCbMPy27m9Y9qTloNQWmghifAQPKQadG58SzDc
         gBPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=l5HEV/3S6TEkQbDw4Fi8zP8mYJAb1w7/BkVTDnxKLHE=;
        b=Lt5QvaoKKN/G6wmvH7FXenLn7HxtrOhmQ6GBvEQEEi5EIuaHJQZI5/bEwEvuSCIhmW
         WDCDL2xlEwh1RT5sYmBe43zajKGJQ5sQL/B4tPAqCfY2LzxNKwJ2WE7Yu8jSROK5xbSU
         Jxmnc17WesUIfQFxPgIZuQoJyynrPwFHs6xX15Xnw97VOqNVHGKlhiu6HRC3MAIGVulx
         AVkDGHcEXF2zslwo38eL2LL/+SeX2cSY/Y825mvnhKzrzhvs1t81a4NE05S5d/u9wO6V
         Uv9QC9i0D7FD6pCq24rTjq9EWbQGgkckQ0ph5qrZu8zd+2qm4yZbylX5hcUOWsKwavbc
         AG2w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=sz19bV+3;
       spf=pass (google.com: domain of alistair23@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=alistair23@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <alistair23@gmail.com>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id r66sor1414158ljr.27.2019.06.28.09.31.25
        (Google Transport Security);
        Fri, 28 Jun 2019 09:31:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of alistair23@gmail.com designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=sz19bV+3;
       spf=pass (google.com: domain of alistair23@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=alistair23@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=l5HEV/3S6TEkQbDw4Fi8zP8mYJAb1w7/BkVTDnxKLHE=;
        b=sz19bV+3v7ZPT4+0mbRybUbbXes2rEfmD2GfFVSetN8RbwLW8oar3Egy4uAAikLBtw
         bMLt3wmLP1bs5S1W/+sOpIHsB+MUO4kZAHBkZ8CgoOUSZNAGkBvE6GcAyJ+QzYweZMcf
         rSW72mDn8rzfb6Ys8U7/f+mFr8CHKsxNtegQcEd76hq7UJ9b9+LY8Pzyh8hjdmM5KUkK
         wmoT/6xnn0UJrRaHoon8zhUSF3JUrpWdoUD6rib6vPmHbD3QnLkzOAXNkCdwIAq24xnp
         ACLhjXwMtB+6b0y2M21LczFdEzCGQygOuzzjDeQOD/9Ra7slSgeA7CqcQVe/KeGgEyjc
         bX/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=l5HEV/3S6TEkQbDw4Fi8zP8mYJAb1w7/BkVTDnxKLHE=;
        b=eNoEolw9Z+W22uK41kS43qPSKo98iIfS/4m+0s2r9qJ6tdzbcP0vptg8mpii6qTC+w
         uRRnvctX36Gz87k9WFNC41TgavSmEOMo5Wb+2RZF+b06YOPR6UisIDSpe2Dm7p8RQo0U
         0cBelnCEuFBSkt14Et0ketP1PwJqymoR8gDHW0ajOU3YnMwklymrks+/SAt9i9jjTLK/
         h8WKTOYcQUhnc/gLDjlWTTKnNpTz4ldcRVjI1E9kfpoDXfGhwwA8rN2+zxZN8uQDRAp0
         oRhbP0/Oa5LGLPN0csJddkJsBIcihRWMQrVylIEK8/2Sac3nBOqG48+Wi2rQ38o2vak6
         DNgA==
X-Gm-Message-State: APjAAAVDxNNnFRoK70mccczoA1Pd83OFovJKmR+PV1aKVn8WZXon8jhw
	TDNQAFoy1DErOVCUIZ1vUPOLbLI02hX3TzKAqvI=
X-Google-Smtp-Source: APXvYqwxgmOcWKo0EcQhm1m5lXxWlMwqzfHpCI98g2Wjy2Srr1EfwFnV0eUcVg2Ie3jNgDjaCspGp+83xt9liTZZyGE=
X-Received: by 2002:a2e:9758:: with SMTP id f24mr6785310ljj.58.1561739484954;
 Fri, 28 Jun 2019 09:31:24 -0700 (PDT)
MIME-Version: 1.0
References: <20190627202719.17739-1-philmd@redhat.com> <20190627202719.17739-13-philmd@redhat.com>
In-Reply-To: <20190627202719.17739-13-philmd@redhat.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 28 Jun 2019 09:28:24 -0700
Message-ID: <CAKmqyKOvSV_MJg1x3EGWVNeMUvvT5gG3mH_LQDVSwVgcWA+YFQ@mail.gmail.com>
Subject: Re: [Qemu-devel] [PATCH v5 12/28] hw/block/pflash_cfi02: Fix command
 address comparison
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
X-TUID: fRW6kyW4pc1O

On Thu, Jun 27, 2019 at 1:42 PM Philippe Mathieu-Daud=C3=A9
<philmd@redhat.com> wrote:
>
> From: Stephen Checkoway <stephen.checkoway@oberlin.edu>
>
> Most AMD commands only examine 11 bits of the address. This masks the
> addresses used in the comparison to 11 bits. The exceptions are word or
> sector addresses which use offset directly rather than the shifted
> offset, boff.
>
> Signed-off-by: Stephen Checkoway <stephen.checkoway@oberlin.edu>
> Acked-by: Thomas Huth <thuth@redhat.com>
> Message-Id: <20190426162624.55977-4-stephen.checkoway@oberlin.edu>
> [PMD: Prepend 'hw/' in patch subject]
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Acked-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/block/pflash_cfi02.c   |  8 +++++++-
>  tests/pflash-cfi02-test.c | 12 ++++++++++--
>  2 files changed, 17 insertions(+), 3 deletions(-)
>
> diff --git a/hw/block/pflash_cfi02.c b/hw/block/pflash_cfi02.c
> index e64dc69c6c..4be3837be5 100644
> --- a/hw/block/pflash_cfi02.c
> +++ b/hw/block/pflash_cfi02.c
> @@ -281,11 +281,13 @@ static void pflash_write(void *opaque, hwaddr offse=
t, uint64_t value,
>      }
>      offset &=3D pfl->chip_len - 1;
>
> -    boff =3D offset & (pfl->sector_len - 1);
> +    boff =3D offset;
>      if (pfl->width =3D=3D 2)
>          boff =3D boff >> 1;
>      else if (pfl->width =3D=3D 4)
>          boff =3D boff >> 2;
> +    /* Only the least-significant 11 bits are used in most cases. */
> +    boff &=3D 0x7FF;
>      switch (pfl->wcycle) {
>      case 0:
>          /* Set the device in I/O access mode if required */
> @@ -538,6 +540,10 @@ static void pflash_cfi02_realize(DeviceState *dev, E=
rror **errp)
>          }
>      }
>
> +    /* Only 11 bits are used in the comparison. */
> +    pfl->unlock_addr0 &=3D 0x7FF;
> +    pfl->unlock_addr1 &=3D 0x7FF;
> +
>      pflash_setup_mappings(pfl);
>      pfl->rom_mode =3D 1;
>      sysbus_init_mmio(SYS_BUS_DEVICE(dev), &pfl->mem);
> diff --git a/tests/pflash-cfi02-test.c b/tests/pflash-cfi02-test.c
> index e7e16a8dd8..e090b2e3a0 100644
> --- a/tests/pflash-cfi02-test.c
> +++ b/tests/pflash-cfi02-test.c
> @@ -21,8 +21,8 @@
>
>  #define FLASH_WIDTH 2
>  #define CFI_ADDR (FLASH_WIDTH * 0x55)
> -#define UNLOCK0_ADDR (FLASH_WIDTH * 0x5555)
> -#define UNLOCK1_ADDR (FLASH_WIDTH * 0x2AAA)
> +#define UNLOCK0_ADDR (FLASH_WIDTH * 0x555)
> +#define UNLOCK1_ADDR (FLASH_WIDTH * 0x2AA)
>
>  #define CFI_CMD 0x98
>  #define UNLOCK0_CMD 0xAA
> @@ -190,6 +190,14 @@ static void test_flash(void)
>      g_assert_cmphex(flash_read(6), =3D=3D, 0xCDEF);
>      g_assert_cmphex(flash_read(8), =3D=3D, 0xFFFF);
>
> +    /* Test ignored high order bits of address. */
> +    flash_write(FLASH_WIDTH * 0x5555, UNLOCK0_CMD);
> +    flash_write(FLASH_WIDTH * 0x2AAA, UNLOCK1_CMD);
> +    flash_write(FLASH_WIDTH * 0x5555, AUTOSELECT_CMD);
> +    g_assert_cmpint(flash_read(FLASH_WIDTH * 0x0000), =3D=3D, 0x00BF);
> +    g_assert_cmpint(flash_read(FLASH_WIDTH * 0x0001), =3D=3D, 0x236D);
> +    reset();
> +
>      qtest_quit(global_qtest);
>  }
>
> --
> 2.20.1
>
>
