Received: by 2002:a5d:6790:0:0:0:0:0 with SMTP id v16csp149401wru;
        Fri, 28 Jun 2019 16:16:58 -0700 (PDT)
X-Received: by 2002:a2e:3a13:: with SMTP id h19mr7496372lja.220.1561763818263;
        Fri, 28 Jun 2019 16:16:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1561763818; cv=none;
        d=google.com; s=arc-20160816;
        b=SqgyqGiE7CXOD62tKMJl3rTrDMfcJoKe4ALr4bNGf7VGPPO7JwJ9dvz4/qV+In9RvU
         6Tqp6jYZ1GCPKL4sgKzKmDb4XeRthifWdRrH19K6XvnF/AC96zSHTcUBIeuDammvy8f+
         QdzcX77IOmln6tvUBZSBXrdhMbYnNap63M+Rw3W7ozjM2XIfWnUyhFhlAa2esSNLmOoR
         mVr/OVvzyIEJGEmfo3a/PqhkaDy5n4aesM2LJZlf77XdMmiCPinHM+gty7PgcriZHKE6
         yhG8sfpz91yEXmpAFSYxcurW93KjWpX1qlnG9HFuldoAdmm15WjiL3XsqDi8gpVc26gk
         E2rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=JpK8Lwt8b8p9UFL6KUVXrJWkSJM2HNjtFLirM0QdfV4=;
        b=zCWRmL3Sqwt22Kordf342MmvjUaa3E5KJjvb4gNtKHuIb9WXHVtkldsi8JQ35Meqh9
         CdNaeOxh0/BizNuHtisUKN3a7TRfIiueaKINGft8XtFJg1QV240n7nn6UtE7Lwm7jls2
         IZVj+B6AQYbfkRYtlAazr2HogsqWxYBgk1rvjuUijdCLbBJtgE0cCU5gGBLjvxPGk/pb
         gcA1qXw/NnbzV4l+c/CUK0QrYAFKVLNiadHu0/YCAevUWPrlospVCQfW/txYqrCUc8aS
         /kuIWD7hPDc/Q99Hwp7LqwBRLDqB0dXz31zLG3QSx+jf01S+ommPxtpv6siWiVCbv15d
         QHAw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=IE1R1h4o;
       spf=pass (google.com: domain of alistair23@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=alistair23@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <alistair23@gmail.com>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id 186sor1001905lfb.10.2019.06.28.16.16.58
        (Google Transport Security);
        Fri, 28 Jun 2019 16:16:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of alistair23@gmail.com designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=IE1R1h4o;
       spf=pass (google.com: domain of alistair23@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=alistair23@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=JpK8Lwt8b8p9UFL6KUVXrJWkSJM2HNjtFLirM0QdfV4=;
        b=IE1R1h4ol6xl3o0MBXm4vhc1RwrqHqQCVpSGM1RiJwDhAkNd5ZrHyA98qkHG3ylo6y
         3GHF5F+/QBVDOUNFmEdVebZtz+xoTxugo9gsInGuzbRzFplq406AtTuRXzAltE8M4VYu
         nngVq0AEjUZnFTnn8ZAgbZMfgnwsHFExc57/5oYhhmFf0DtUZUVWZQeOuyu1Mp521gpe
         8v2l3H8svNJ15yF9LOQ1aszx4CHjeUCzp9EjgDcAuNiZSN54swENoXZ6FhPJRSKj+3TH
         5DUeghvLYRoTqFNXSmSRaAZoTTBHbiqg/7pfQwHOT/YwSZr8ReZvderK7QOha/TuH+nK
         4++A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=JpK8Lwt8b8p9UFL6KUVXrJWkSJM2HNjtFLirM0QdfV4=;
        b=YQKsCPmly3zW24Hvdx2d9ZBDDJqWnrZCBhXRRq+hzca1CknWykncZuPOCyw34l3el0
         uJjzRuJX5nL5eG0jy+OfCHfNFEgbVqWtWnFxvvePhWKUEABCWGLw44yUrzvnqQNJhSGA
         qUcSu+xM/blMfpe74cZkKy3B98BKp2ITTIm3sL2T4DNr1JxnwRkbJxMWrHw5U5Qtb4a8
         bZQ3RzxTFWhvR04uHhAPzC/OOR9fdMYBjPsVNp0MkHn8WA+jJHpdrx9KgQ+SmpFQjuji
         bW11FXqVRpbZcrPeZuucRj22ew9r/AOqfFbytXC8C/SRxDxlHf8HKL+N4LbMTfH9dRTS
         nHiw==
X-Gm-Message-State: APjAAAXBFM/EwvnghMS+TXQlSOa3tUS/QVNKlrAXR3Z4iblyW3v1+UiI
	gtX5p3KN1lCShtqAr9M0wG8XEiSEQ7NEMPYmup4=
X-Google-Smtp-Source: APXvYqxAhIKzzT8/TuPuBmOTKuIQj93pneUu/kxL6iTqlogSyIH2AY5iITRYzSltnjfz6RaOtj3fnfZt5WujXw8fZys=
X-Received: by 2002:a19:710b:: with SMTP id m11mr6288717lfc.135.1561763817934;
 Fri, 28 Jun 2019 16:16:57 -0700 (PDT)
MIME-Version: 1.0
References: <20190627202719.17739-1-philmd@redhat.com> <20190627202719.17739-29-philmd@redhat.com>
In-Reply-To: <20190627202719.17739-29-philmd@redhat.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 28 Jun 2019 16:13:57 -0700
Message-ID: <CAKmqyKNTq3Sj_Fr3rvOccU2DeuZryvJL1=HhjmVWJMGWKz7OHg@mail.gmail.com>
Subject: Re: [Qemu-devel] [PATCH v5 28/28] hw/block/pflash_cfi02: Reduce I/O
 accesses to 16-bit
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
X-TUID: to99sVkPtUNs

On Thu, Jun 27, 2019 at 1:55 PM Philippe Mathieu-Daud=C3=A9
<philmd@redhat.com> wrote:
>
> Parallel NOR flashes are limited to 16-bit bus accesses.
> Remove the 32-bit dead code.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/block/pflash_cfi02.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
>
> diff --git a/hw/block/pflash_cfi02.c b/hw/block/pflash_cfi02.c
> index db9dc7d8fb..d1f28b02b9 100644
> --- a/hw/block/pflash_cfi02.c
> +++ b/hw/block/pflash_cfi02.c
> @@ -317,8 +317,6 @@ static uint64_t pflash_read(void *opaque, hwaddr offs=
et, unsigned int width)
>      boff =3D offset & 0xFF;
>      if (pfl->width =3D=3D 2) {
>          boff =3D boff >> 1;
> -    } else if (pfl->width =3D=3D 4) {
> -        boff =3D boff >> 2;
>      }
>      switch (pfl->cmd) {
>      default:
> @@ -449,8 +447,6 @@ static void pflash_write(void *opaque, hwaddr offset,=
 uint64_t value,
>      boff =3D offset;
>      if (pfl->width =3D=3D 2) {
>          boff =3D boff >> 1;
> -    } else if (pfl->width =3D=3D 4) {
> -        boff =3D boff >> 2;
>      }
>      /* Only the least-significant 11 bits are used in most cases. */
>      boff &=3D 0x7FF;
> @@ -710,6 +706,7 @@ static void pflash_write(void *opaque, hwaddr offset,=
 uint64_t value,
>  static const MemoryRegionOps pflash_cfi02_ops =3D {
>      .read =3D pflash_read,
>      .write =3D pflash_write,
> +    .impl.max_access_size =3D 2,
>      .valid.min_access_size =3D 1,
>      .valid.max_access_size =3D 4,
>      .endianness =3D DEVICE_NATIVE_ENDIAN,
> --
> 2.20.1
>
>
