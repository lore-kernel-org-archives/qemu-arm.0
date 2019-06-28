Received: by 2002:a5d:6790:0:0:0:0:0 with SMTP id v16csp2687120wru;
        Fri, 28 Jun 2019 09:35:33 -0700 (PDT)
X-Received: by 2002:a05:6512:51c:: with SMTP id o28mr5656347lfb.67.1561739733481;
        Fri, 28 Jun 2019 09:35:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1561739733; cv=none;
        d=google.com; s=arc-20160816;
        b=F52W3bHpNSVatRVVfgjgtDGyeQuXO5O2shQN6Ook2IJ2aSv33L+tU1w+mZL75rkPt6
         WO6+1cD0htDtGD10P4SzSUgnn6jlqacB99hwLIyNRHqoWRMYYC2LYm73GpQAavlxnfhG
         x/Jwk5fSJ8zeMe7rVRPxiNRQAuwLGmfZxvDjlkLWCoe9dwSJ0cyksM+5mMFRoaKLJtPR
         Gzhv3TZ7yUb8TC+GwVrq3H3vorrVdRn9wpg5K0bulUqsOHk66Ga5/4zJexjYxqzOEyYj
         X0+s9ABH52I/xBkhQZIJwcYicGAdSD8gVOlBzTl385vDxI9/pMAZi/kB3hS9kxFASh5d
         nzew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=D+wXCB66jnKZG2cMBBezUE1NCkDNQf8ea/KR76ELM5I=;
        b=DoKj2blHBoe+gUgoWzzsRVKvMiXVco4nG5wZ6bnTQIQWhDN/9UU5lKpybskWS7DMKg
         R4AUloNswKgMs6D5tMt/0L21MYk6FrhIbd6PFy6FfnPm3fJ74O3BoZjSOreHnYet7cZu
         cItLABtKGq2/NiEb9jRvsvW5N/k8Bh2TyJmUm2tAIhBYOKrg7OcnXj0LRx8f5nVuxYYs
         7fiUEIr4SCW7tLAat6sAxCnT7TNb5V9q/B0LGRfNh24M1ejFLz/AVld79ScxVmsuMMHH
         K2bNMGB2/LVZDGDNxgcz4OKU1mR6G7ekTkD9dlNdpnPzbBEvEA3G/kqk3gSm6Yy0QG5X
         t4Dg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=QpYIqkf5;
       spf=pass (google.com: domain of alistair23@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=alistair23@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <alistair23@gmail.com>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id b6sor741950lfp.56.2019.06.28.09.35.33
        (Google Transport Security);
        Fri, 28 Jun 2019 09:35:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of alistair23@gmail.com designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=QpYIqkf5;
       spf=pass (google.com: domain of alistair23@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=alistair23@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=D+wXCB66jnKZG2cMBBezUE1NCkDNQf8ea/KR76ELM5I=;
        b=QpYIqkf5rJsSAgt4es9MjgCbyFUgMpdHXYZ2i16NCYYg2fEAofWdG0cEgbzyz4TGvh
         eXkgHVyPDwaDMtPuQyQ2d71il6LLJ3+0XblQKrEGQsf+v/mMGs9pYBBrSNDas6TNZWZD
         MTYz/Gi/T2Bov99bLr/y1wAA9QXwLgs/skKdEjk3AKEUD1gLNrHvDMfKfwSGQycrDrJk
         PlGUr2d9qZbZLEaCWfKHmlzuuaTZTs0gg4PHLxRc+nCmbXy+z/jrCt2y4Cn2XYMdXEY5
         TuRBHN09BYoItIGwSJptglpUA+rLiDtHu2uRxlM/+/2Sp84fAAW2IeQD/fQsSwsF8ZZa
         OE4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=D+wXCB66jnKZG2cMBBezUE1NCkDNQf8ea/KR76ELM5I=;
        b=ESohmc81lrGSPdc+nh5v6gIucXCguGhwYkzkrBGdogYyRZ71XGo3xaeztWym8oShor
         jyh1Oo81abngjB+yakTLS5ktn7VUaQDW76mqrGkhW8y5cHhCJKb+O4MAWdhp2fwM+WeX
         aHpbmH5AFrt3xf9xOdPKAev/DpRPa0XAA6CC9sy6kgwS62DgMR8e0ISiVbdcz2WU7m9z
         gi+4gC16A/UDz5fIRPr9kldbD3wKX2WOq7jRfyZEbIFSik5TSzi5/okMebblNIj98ygM
         L6M2Pg3V2OAMiM+UJ7rDROte1OmIwH1mgJ2zZXAxckS8eQ41LYdPKi9ks44aXoNXKG/9
         xzTw==
X-Gm-Message-State: APjAAAUuZgCdpD/MFH4a6FcqmmZvYTu8CF40HY2QurbN/nl5lDMU7I4L
	w8EgIY9DFGtjG8tQZRH6sjnXDzOfwAaH4aCSBSw=
X-Google-Smtp-Source: APXvYqwOhYlWm0RID2qAqFdtTeN5oleToKZHH2Dp2KOBCPpyPA22c/3hnw7DgUPsKpYfWe2z78asEHxQfDWhoDh7ljU=
X-Received: by 2002:a05:6512:29a:: with SMTP id j26mr5335453lfp.44.1561739733128;
 Fri, 28 Jun 2019 09:35:33 -0700 (PDT)
MIME-Version: 1.0
References: <20190627202719.17739-1-philmd@redhat.com> <20190627202719.17739-15-philmd@redhat.com>
In-Reply-To: <20190627202719.17739-15-philmd@redhat.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 28 Jun 2019 09:32:32 -0700
Message-ID: <CAKmqyKOG87K2vZHRsoGtmce6pVsJCW9yrq6WhAiKBsuBPMd4BA@mail.gmail.com>
Subject: Re: [Qemu-devel] [PATCH v5 14/28] hw/block/pflash_cfi02: Remove
 pointless local variable
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
X-TUID: uPhoaR/aMDqi

On Thu, Jun 27, 2019 at 1:59 PM Philippe Mathieu-Daud=C3=A9
<philmd@redhat.com> wrote:
>
> We can directly use pfl->total_len, remove the local 'chip_len'
> variable.
>
> Signed-off-by: Stephen Checkoway <stephen.checkoway@oberlin.edu>
> Message-Id: <20190426162624.55977-6-stephen.checkoway@oberlin.edu>
> [PMD: Extracted from bigger patch]
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/block/pflash_cfi02.c | 14 ++++++--------
>  1 file changed, 6 insertions(+), 8 deletions(-)
>
> diff --git a/hw/block/pflash_cfi02.c b/hw/block/pflash_cfi02.c
> index 4be3837be5..1a794fa83c 100644
> --- a/hw/block/pflash_cfi02.c
> +++ b/hw/block/pflash_cfi02.c
> @@ -409,7 +409,7 @@ static void pflash_write(void *opaque, hwaddr offset,=
 uint64_t value,
>              /* Chip erase */
>              DPRINTF("%s: start chip erase\n", __func__);
>              if (!pfl->ro) {
> -                memset(pfl->storage, 0xFF, pfl->chip_len);
> +                memset(pfl->storage, 0xff, pfl->chip_len);
>                  pflash_update(pfl, 0, pfl->chip_len);
>              }
>              set_dq7(pfl, 0x00);
> @@ -490,7 +490,6 @@ static const MemoryRegionOps pflash_cfi02_ops =3D {
>  static void pflash_cfi02_realize(DeviceState *dev, Error **errp)
>  {
>      PFlashCFI02 *pfl =3D PFLASH_CFI02(dev);
> -    uint32_t chip_len;
>      int ret;
>      Error *local_err =3D NULL;
>
> @@ -507,18 +506,17 @@ static void pflash_cfi02_realize(DeviceState *dev, =
Error **errp)
>          return;
>      }
>
> -    chip_len =3D pfl->sector_len * pfl->nb_blocs;
> +    pfl->chip_len =3D pfl->sector_len * pfl->nb_blocs;
>
>      memory_region_init_rom_device(&pfl->orig_mem, OBJECT(pfl),
>                                    &pflash_cfi02_ops, pfl, pfl->name,
> -                                  chip_len, &local_err);
> +                                  pfl->chip_len, &local_err);
>      if (local_err) {
>          error_propagate(errp, local_err);
>          return;
>      }
>
>      pfl->storage =3D memory_region_get_ram_ptr(&pfl->orig_mem);
> -    pfl->chip_len =3D chip_len;
>
>      if (pfl->blk) {
>          uint64_t perm;
> @@ -533,8 +531,8 @@ static void pflash_cfi02_realize(DeviceState *dev, Er=
ror **errp)
>      }
>
>      if (pfl->blk) {
> -        if (!blk_check_size_and_read_all(pfl->blk, pfl->storage, chip_le=
n,
> -                                         errp)) {
> +        if (!blk_check_size_and_read_all(pfl->blk, pfl->storage,
> +                                         pfl->chip_len, errp)) {
>              vmstate_unregister_ram(&pfl->orig_mem, DEVICE(pfl));
>              return;
>          }
> @@ -594,7 +592,7 @@ static void pflash_cfi02_realize(DeviceState *dev, Er=
ror **errp)
>      /* Max timeout for chip erase */
>      pfl->cfi_table[0x26] =3D 0x0D;
>      /* Device size */
> -    pfl->cfi_table[0x27] =3D ctz32(chip_len);
> +    pfl->cfi_table[0x27] =3D ctz32(pfl->chip_len);
>      /* Flash device interface (8 & 16 bits) */
>      pfl->cfi_table[0x28] =3D 0x02;
>      pfl->cfi_table[0x29] =3D 0x00;
> --
> 2.20.1
>
>
