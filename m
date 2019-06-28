Received: by 2002:a5d:6790:0:0:0:0:0 with SMTP id v16csp2688676wru;
        Fri, 28 Jun 2019 09:37:15 -0700 (PDT)
X-Received: by 2002:a19:bec1:: with SMTP id o184mr5164893lff.86.1561739835291;
        Fri, 28 Jun 2019 09:37:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1561739835; cv=none;
        d=google.com; s=arc-20160816;
        b=DWavpEeg3BNlwkRvtQXl1lpbr7JoNfusO2K4bUjfkycQLe0BGrbj5osObiOwxP2sbJ
         vOJSYZpNDcvUYfak3ZjO2qpTYkjPtBxTg7L8uAvMZn2RpB8irWRxCOHgYmdLxb4b+VZ7
         +nrds0JRXnwIOPxlEO3Fv8yuw/XGTnvE+HOrPMUkFmKwc3vlyetW8rxgir30DX3BIbf+
         sM52fG+wiPiFbds1hX6AQbYujQPH3FaGOtK/xxmszsIcr16/3FnSCTQY02qTU5Rs6DN6
         cEacXaUs73k8liEs59z/OkacaTf3un3eHI1O95KzPtF+BMYlSH6Rmi93E8LLvxUIzejO
         YCEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=wLiGMD4EvsM7xTV7VFIvRXEr1Z8kXRHm79nNC4ag830=;
        b=C1Dr7zjXrsoWMmyNGXa7Hg5Opmx3i9vffcGQpIxpXDauGE2gwPp3HRhOwRuXf6Dhud
         l2bXI02hxYZfA6wl+GR/m1Pv5n8mxCedTTKcNU3iAnYyG7xy7vYt4gZjxcBT9K4KDRgp
         5RbTjv7mpVE453WEoXeWS/rsKiw7uIx/n81En5DGT+SddK+3tZb/URDdD3JpyqTeysNl
         YMnnUxehwn6Psd2jjeqLoli+kQpB2dwz5BaWdCfPc3r7+6UqrKo012b9QLvYLHZsZhtO
         o0eCP70Pi03RaYuUE67ZYdbH+8g+DPHOXnWgMZUCBHz/kRF6sJvZzOlW0D/lTRly0OwT
         RWcQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=jiuYmiVq;
       spf=pass (google.com: domain of alistair23@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=alistair23@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <alistair23@gmail.com>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id x7sor1844256ljj.32.2019.06.28.09.37.15
        (Google Transport Security);
        Fri, 28 Jun 2019 09:37:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of alistair23@gmail.com designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=jiuYmiVq;
       spf=pass (google.com: domain of alistair23@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=alistair23@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=wLiGMD4EvsM7xTV7VFIvRXEr1Z8kXRHm79nNC4ag830=;
        b=jiuYmiVqa1MYe0Ism3xsecn/epcx6eBVWK0/TYKM/A5zhRv2/yG+l8jyb+/2q70oIw
         26XRw6CYuWCvRqsdQYVXVGKJ6O/7xsPK2tbjyXDH3wPwtVbdX8KVcKu/LRDwape/Y/6i
         WsFGkPeZqST80AqKKMNYWoa26CmhgtxRZFXh8tzYbyj8CJ42m1KncNtz43QB8GLbWEUa
         LM0ETtoE+ZGqpkaVKQMwi7tqGrYF1dJoqrrma68imortFetu5qWyObBLFnvIQar2gE7f
         bp2pSk2X04Npy883BrET2pDh2MgC8cu/X97pAUsmdxqD/7KwJi3nX6yYrQ73Zxeaxan6
         N9tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=wLiGMD4EvsM7xTV7VFIvRXEr1Z8kXRHm79nNC4ag830=;
        b=lESHaO+XMzy4ic7xv2SE2gD8Xlx595YSvEjcF7rrf6cAwGVlqeTagk46HI4DbMXDDL
         bPCYxSA2t7UNCQ4OqJ5pLyngesPeg1Qkqtb0D7ElzUNJsP/j9tY8bR6A6s4rxZK49w+F
         q4oJp7OOBI6NyLxG+on7DFM6oHzyB9c0/CRRdNwfaZV0xuoCwQLU1AJ2rrJY4EHITLyG
         O9Az/CB6fzvX8bjlUzBkD/8c2m1eDjNpixdtLAAIqsVj7ZI8D0LN9b9XXaaWxmveKm3V
         OpOPnPA+HbjzpTJNCAnyneIWbEgMHw5ySLsIXgYQ1uTJhyYhSaXk0RmaEb/DzjFFET3k
         ViWQ==
X-Gm-Message-State: APjAAAXGgiqp59YbfK+hRrlK3MA+jzon/ZR702QM+XvF5r7wHa+gpNxx
	iMq71RMqodwOjZ3MQ3bdix2pT3dMMOjKjxH20JY=
X-Google-Smtp-Source: APXvYqwq00xKIxLjdwSGTIDwXGOypuBfcO7jBsEdoxWOgnrTLpZ5gvHy27Jah1+cvOihjIQc919k8oN/83NwUq1kOac=
X-Received: by 2002:a2e:9158:: with SMTP id q24mr6861189ljg.119.1561739834973;
 Fri, 28 Jun 2019 09:37:14 -0700 (PDT)
MIME-Version: 1.0
References: <20190627202719.17739-1-philmd@redhat.com> <20190627202719.17739-17-philmd@redhat.com>
In-Reply-To: <20190627202719.17739-17-philmd@redhat.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 28 Jun 2019 09:34:13 -0700
Message-ID: <CAKmqyKNW5e-X-qj3jKuXBO7Em8NasOwxFgS6vvjNObJLt3jyZw@mail.gmail.com>
Subject: Re: [Qemu-devel] [PATCH v5 16/28] hw/block/pflash_cfi02: Hold the PRI
 table offset in a variable
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
X-TUID: il5ZhGCbQn5S

On Thu, Jun 27, 2019 at 1:34 PM Philippe Mathieu-Daud=C3=A9
<philmd@redhat.com> wrote:
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
>  hw/block/pflash_cfi02.c | 31 +++++++++++++++++--------------
>  1 file changed, 17 insertions(+), 14 deletions(-)
>
> diff --git a/hw/block/pflash_cfi02.c b/hw/block/pflash_cfi02.c
> index f1bac480f5..23d05a6308 100644
> --- a/hw/block/pflash_cfi02.c
> +++ b/hw/block/pflash_cfi02.c
> @@ -552,6 +552,7 @@ static void pflash_cfi02_realize(DeviceState *dev, Er=
ror **errp)
>      pfl->status =3D 0;
>
>      /* Hardcoded CFI table (mostly from SG29 Spansion flash) */
> +    const uint16_t pri_ofs =3D 0x31;
>      /* Standard "QRY" string */
>      pfl->cfi_table[0x10] =3D 'Q';
>      pfl->cfi_table[0x11] =3D 'R';
> @@ -560,8 +561,8 @@ static void pflash_cfi02_realize(DeviceState *dev, Er=
ror **errp)
>      pfl->cfi_table[0x13] =3D 0x02;
>      pfl->cfi_table[0x14] =3D 0x00;
>      /* Primary extended table address */
> -    pfl->cfi_table[0x15] =3D 0x31;
> -    pfl->cfi_table[0x16] =3D 0x00;
> +    pfl->cfi_table[0x15] =3D pri_ofs;
> +    pfl->cfi_table[0x16] =3D pri_ofs >> 8;
>      /* Alternate command set (none) */
>      pfl->cfi_table[0x17] =3D 0x00;
>      pfl->cfi_table[0x18] =3D 0x00;
> @@ -609,32 +610,34 @@ static void pflash_cfi02_realize(DeviceState *dev, =
Error **errp)
>      pfl->cfi_table[0x2E] =3D (pfl->nb_blocs - 1) >> 8;
>      pfl->cfi_table[0x2F] =3D pfl->sector_len >> 8;
>      pfl->cfi_table[0x30] =3D pfl->sector_len >> 16;
> +    assert(0x30 < pri_ofs);
>
>      /* Extended */
> -    pfl->cfi_table[0x31] =3D 'P';
> -    pfl->cfi_table[0x32] =3D 'R';
> -    pfl->cfi_table[0x33] =3D 'I';
> +    pfl->cfi_table[0x00 + pri_ofs] =3D 'P';
> +    pfl->cfi_table[0x01 + pri_ofs] =3D 'R';
> +    pfl->cfi_table[0x02 + pri_ofs] =3D 'I';
>
>      /* Extended version 1.0 */
> -    pfl->cfi_table[0x34] =3D '1';
> -    pfl->cfi_table[0x35] =3D '0';
> +    pfl->cfi_table[0x03 + pri_ofs] =3D '1';
> +    pfl->cfi_table[0x04 + pri_ofs] =3D '0';
>
>      /* Address sensitive unlock required. */
> -    pfl->cfi_table[0x36] =3D 0x00;
> +    pfl->cfi_table[0x05 + pri_ofs] =3D 0x00;
>      /* Erase suspend not supported. */
> -    pfl->cfi_table[0x37] =3D 0x00;
> +    pfl->cfi_table[0x06 + pri_ofs] =3D 0x00;
>      /* Sector protect not supported. */
> -    pfl->cfi_table[0x38] =3D 0x00;
> +    pfl->cfi_table[0x07 + pri_ofs] =3D 0x00;
>      /* Temporary sector unprotect not supported. */
> -    pfl->cfi_table[0x39] =3D 0x00;
> +    pfl->cfi_table[0x08 + pri_ofs] =3D 0x00;
>
>      /* Sector protect/unprotect scheme. */
> -    pfl->cfi_table[0x3a] =3D 0x00;
> +    pfl->cfi_table[0x09 + pri_ofs] =3D 0x00;
>
>      /* Simultaneous operation not supported. */
> -    pfl->cfi_table[0x3b] =3D 0x00;
> +    pfl->cfi_table[0x0a + pri_ofs] =3D 0x00;
>      /* Burst mode not supported. */
> -    pfl->cfi_table[0x3c] =3D 0x00;
> +    pfl->cfi_table[0x0b + pri_ofs] =3D 0x00;
> +    assert(0x0b + pri_ofs < ARRAY_SIZE(pfl->cfi_table));
>  }
>
>  static Property pflash_cfi02_properties[] =3D {
> --
> 2.20.1
>
>
