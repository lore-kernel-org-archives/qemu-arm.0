Received: by 2002:a5d:6790:0:0:0:0:0 with SMTP id v16csp3974290wru;
        Tue, 2 Jul 2019 09:20:16 -0700 (PDT)
X-Received: by 2002:a2e:85d7:: with SMTP id h23mr18133877ljj.53.1562084416598;
        Tue, 02 Jul 2019 09:20:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562084416; cv=none;
        d=google.com; s=arc-20160816;
        b=WAJvw8hn9IJ4FqhEh5llvMyIQCmVKPcj93jSE4lbys8KpGZR9Nz1Obl+dNFnETbVzb
         CrU1E170J62Poprd8Zj+Kfwvsme76SBqsI76F3yVXpFvOTFrhLODaMeSZwPQ+K/Qx1zd
         NzSAfJsBe6DeSbaA08T86oA+ApipM8geDRA9VA4tVe0OWk8odET4/8CGQSjqhJxX0jEU
         R6BZ1WaFp7ogeCdaBAI8+VjKb7Q0O1c9UKW7Uz3s0D4fi2pX389QSCFpS6tt3YOisNk0
         XckbQLPGFganCXzA/7tLZvfV+e2bQFMNWpA9HnvlLcSJown514MLNvsLFqMEhF7UusNj
         47hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Q4ef92tiRiSMYTng3BuuzrGksSLOIr5Nj23io44N++Q=;
        b=YFdDD57JPIG8TyhihMa3Wwqjia8bDt7HR8vEs+RCQeR6aWhZcFWyHE9z6YGOdw2RPJ
         OXhYckEHmJ+HXxK9zuU/8sWwaIk8e+hPdbOeiKwf0VwvCLAAb5vMa9WADepL8tdinqkH
         1Qt3HsnBvKwn5qH3cQHP7mEmgE/vXaMSXFGz/c7cXpmWlU7YaOb20OUL0Jk+W3hiYkLC
         OrEUJ5toGsfEKwic0456CkAfkEDTbcVRBAghmiTwy9bLe1Lkl7sEBT0MTwtDSeJwK5RK
         HxHFCZal8gzHkUSqQT30HqY6iHgHWHetjRDB7xx9wAgAE4RKHZD/BhnpjannnpO1GMwC
         gJ2w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=Ain3huJI;
       spf=pass (google.com: domain of alistair23@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=alistair23@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <alistair23@gmail.com>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id k63sor3416861lfk.16.2019.07.02.09.20.16
        (Google Transport Security);
        Tue, 02 Jul 2019 09:20:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of alistair23@gmail.com designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=Ain3huJI;
       spf=pass (google.com: domain of alistair23@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=alistair23@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Q4ef92tiRiSMYTng3BuuzrGksSLOIr5Nj23io44N++Q=;
        b=Ain3huJIOq1YLO+yEM2eSrxp2dL/ufBrdSTdEo+pPAnJuXIlO0j4JtbL12HGa24w1S
         dmSoHWraS0YFtgOtepC0i9b5QjfO6I5oXXOArwf2lvyQq6v9JLKCWCthzLDhUTSu7xk/
         aBBbFagK9pyNquYQSdw578aaWRSoS2gdZ7hHvMfrgrN3a5wewK7//VQCZ8RJ6T137TjU
         WO9sjzcEgisr9gGkpIOYChzLoJQgFZe+T8OZzNWtp6l2XMjLxfRZQAJcTj6Nrjc4333J
         HrpGIHpSxfxQr/Kl6PL/DNDyXqEyl+IKdCdASpAYAC2tWNjcE3tpUTXkxmJbxRADtmb9
         Wh8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Q4ef92tiRiSMYTng3BuuzrGksSLOIr5Nj23io44N++Q=;
        b=llXgWauwPSPzl/qmNK+/Gv+5orN1QSYAm9SkJ8E45V+HZQNAMo7mqQ+S+M1bzaRhSM
         hWqJUjN6T36DVp0HPA5f28sPlJYV1ZlOUis0L7JyK1G58emulg4ASkQYzi7w0TuaLIrc
         1Xpkp7NBJH12uvzejdkegknYKAslmoJ8APE57FtHYbaRmY0E8M19vyPVim+1des/iRHN
         rTkwqXgiVl7/xxxCZYZ9ZW25l2s7T7DxRSD1EHjW1Ny69UGjVj6Jy7ydyfOx6qTzThYl
         KuJwqXyZA+QBvhalEPsw7hfl9ZCw5dvspCD9rzS0dXUwjzZzQfWtjgCjIKLfUaPsNlEP
         a3hQ==
X-Gm-Message-State: APjAAAXsbyJ06GLiRbrG9Y8RqczNtGftIUtmvvK0ffK1D+qNetvFiFqm
	2YNSdp35Wq7VD4OgsLt0bNP5PDdMxsUU4qlF50o=
X-Google-Smtp-Source: APXvYqy73ouNbN/LjJtX6BMysXGKdI+0hXtek/vjy8AN6R9s8jFk97Lu4515Znjsbdd7HXnMRMwvvbsVQ2UVZGA9P9o=
X-Received: by 2002:a19:c6d4:: with SMTP id w203mr2214883lff.135.1562084416249;
 Tue, 02 Jul 2019 09:20:16 -0700 (PDT)
MIME-Version: 1.0
References: <20190702001301.4768-1-philmd@redhat.com> <20190702001301.4768-10-philmd@redhat.com>
In-Reply-To: <20190702001301.4768-10-philmd@redhat.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 2 Jul 2019 09:17:12 -0700
Message-ID: <CAKmqyKM0uQa-dRLoZNhU9gD9-X2wpA6k1GfqAJh0ZH3UzBH7Fw@mail.gmail.com>
Subject: Re: [PATCH v2 9/9] hw/block/pflash_cfi01: Hold the PRI table offset
 in a variable
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>, 
	Laszlo Ersek <lersek@redhat.com>, David Gibson <david@gibson.dropbear.id.au>, 
	"open list:New World" <qemu-ppc@nongnu.org>, Peter Maydell <peter.maydell@linaro.org>, 
	Max Filippov <jcmvbkbc@gmail.com>, John Snow <jsnow@redhat.com>, 
	Aleksandar Markovic <amarkovic@wavecomp.com>, Wei Yang <richardw.yang@linux.intel.com>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Aurelien Jarno <aurelien@aurel32.net>, BALATON Zoltan <balaton@eik.bme.hu>, 
	Markus Armbruster <armbru@redhat.com>, Andrzej Zaborowski <balrogg@gmail.com>, 
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>, Michael Walle <michael@walle.cc>, 
	Paolo Bonzini <pbonzini@redhat.com>, Max Reitz <mreitz@redhat.com>, Kevin Wolf <kwolf@redhat.com>, 
	Richard Henderson <rth@twiddle.net>, qemu-arm <qemu-arm@nongnu.org>, 
	"Michael S. Tsirkin" <mst@redhat.com>, Qemu-block <qemu-block@nongnu.org>, 
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Eduardo Habkost <ehabkost@redhat.com>, 
	Aleksandar Rikalo <arikalo@wavecomp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: u3RygtPKwIIU

On Mon, Jul 1, 2019 at 5:16 PM Philippe Mathieu-Daud=C3=A9 <philmd@redhat.c=
om> wrote:
>
> Manufacturers are allowed to move the PRI table, this is why the
> offset is queryable via fixed offsets 0x15/0x16.
> Add a variable to hold the offset, so it will be easier to later
> move the PRI table.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/block/pflash_cfi01.c | 41 ++++++++++++++++++++++++++---------------
>  1 file changed, 26 insertions(+), 15 deletions(-)
>
> diff --git a/hw/block/pflash_cfi01.c b/hw/block/pflash_cfi01.c
> index e891112b67..f65840eb2b 100644
> --- a/hw/block/pflash_cfi01.c
> +++ b/hw/block/pflash_cfi01.c
> @@ -762,6 +762,7 @@ static void pflash_cfi01_realize(DeviceState *dev, Er=
ror **errp)
>      }
>
>      /* Hardcoded CFI table */
> +    const uint16_t pri_ofs =3D 0x31;
>      /* Standard "QRY" string */
>      pfl->cfi_table[0x10] =3D 'Q';
>      pfl->cfi_table[0x11] =3D 'R';
> @@ -770,14 +771,17 @@ static void pflash_cfi01_realize(DeviceState *dev, =
Error **errp)
>      pfl->cfi_table[0x13] =3D 0x01;
>      pfl->cfi_table[0x14] =3D 0x00;
>      /* Primary extended table address (none) */
> -    pfl->cfi_table[0x15] =3D 0x31;
> -    pfl->cfi_table[0x16] =3D 0x00;
> +    pfl->cfi_table[0x15] =3D pri_ofs;
> +    pfl->cfi_table[0x16] =3D pri_ofs >> 8;
>      /* Alternate command set (none) */
>      pfl->cfi_table[0x17] =3D 0x00;
>      pfl->cfi_table[0x18] =3D 0x00;
>      /* Alternate extended table (none) */
>      pfl->cfi_table[0x19] =3D 0x00;
>      pfl->cfi_table[0x1A] =3D 0x00;
> +
> +    /* CFI: System Interface Information */
> +
>      /* Vcc min */
>      pfl->cfi_table[0x1B] =3D 0x45;
>      /* Vcc max */
> @@ -802,6 +806,9 @@ static void pflash_cfi01_realize(DeviceState *dev, Er=
ror **errp)
>      pfl->cfi_table[0x25] =3D 0x04;
>      /* Max timeout for chip erase */
>      pfl->cfi_table[0x26] =3D 0x00;
> +
> +    /* CFI: Device Geometry Definition */
> +
>      /* Device size */
>      pfl->cfi_table[0x27] =3D ctz32(device_len); /* + 1; */
>      /* Flash device interface (8 & 16 bits) */
> @@ -826,26 +833,30 @@ static void pflash_cfi01_realize(DeviceState *dev, =
Error **errp)
>      pfl->cfi_table[0x2E] =3D (blocks_per_device - 1) >> 8;
>      pfl->cfi_table[0x2F] =3D sector_len_per_device >> 8;
>      pfl->cfi_table[0x30] =3D sector_len_per_device >> 16;
> +    assert(0x30 < pri_ofs);
> +
> +    /* CFI: Primary-Vendor Specific */
>
>      /* Extended */
> -    pfl->cfi_table[0x31] =3D 'P';
> -    pfl->cfi_table[0x32] =3D 'R';
> -    pfl->cfi_table[0x33] =3D 'I';
> +    pfl->cfi_table[0x00 + pri_ofs] =3D 'P';
> +    pfl->cfi_table[0x01 + pri_ofs] =3D 'R';
> +    pfl->cfi_table[0x02 + pri_ofs] =3D 'I';
>
> -    pfl->cfi_table[0x34] =3D '1';
> -    pfl->cfi_table[0x35] =3D '0';
> +    pfl->cfi_table[0x03 + pri_ofs] =3D '1';
> +    pfl->cfi_table[0x04 + pri_ofs] =3D '0';
>
> -    pfl->cfi_table[0x36] =3D 0x00;
> -    pfl->cfi_table[0x37] =3D 0x00;
> -    pfl->cfi_table[0x38] =3D 0x00;
> -    pfl->cfi_table[0x39] =3D 0x00;
> +    pfl->cfi_table[0x05 + pri_ofs] =3D 0x00; /* Optional features */
> +    pfl->cfi_table[0x06 + pri_ofs] =3D 0x00;
> +    pfl->cfi_table[0x07 + pri_ofs] =3D 0x00;
> +    pfl->cfi_table[0x08 + pri_ofs] =3D 0x00;
>
> -    pfl->cfi_table[0x3a] =3D 0x00;
> +    pfl->cfi_table[0x09 + pri_ofs] =3D 0x00; /* Func. supported after su=
spend */
>
> -    pfl->cfi_table[0x3b] =3D 0x00;
> -    pfl->cfi_table[0x3c] =3D 0x00;
> +    pfl->cfi_table[0x0a + pri_ofs] =3D 0x00; /* Block status register ma=
sk */
> +    pfl->cfi_table[0x0b + pri_ofs] =3D 0x00;
>
> -    pfl->cfi_table[0x3f] =3D 0x01; /* Number of protection fields */
> +    pfl->cfi_table[0x0e + pri_ofs] =3D 0x01; /* Number of protection fie=
lds */
> +    assert(0x0e + pri_ofs < ARRAY_SIZE(pfl->cfi_table));
>  }
>
>  static void pflash_cfi01_system_reset(DeviceState *dev)
> --
> 2.20.1
>
