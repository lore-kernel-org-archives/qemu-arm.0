Received: by 2002:a5d:6790:0:0:0:0:0 with SMTP id v16csp2696579wru;
        Fri, 28 Jun 2019 09:46:25 -0700 (PDT)
X-Received: by 2002:ac2:4243:: with SMTP id m3mr483295lfl.9.1561740385091;
        Fri, 28 Jun 2019 09:46:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1561740385; cv=none;
        d=google.com; s=arc-20160816;
        b=BxqHQ+R6eII2GTMK2rFz9Baa0Yl5RGb5SM4T60Ia+Hmfzb4E7nLuENBysLNRJ7VXN5
         qRIM5ZPB+CyByxozmOvA/S6CpttlE6cRPJZOaQVpzrVYdgTfIgMQE7jffX4zCBnyojUH
         S+WRAt3Zu/nKXWcxlJQxYG1Rh5m18CEYedCR9tMZL5njYmsN9Q8PeRa7i3o9BcpSfn1M
         CB1Djli5MPlmhwKCEbSipYYL/NBcp8vxJrO2PHpSxSarAiMDW0b+wtKjB8KXDJHLGnof
         HDO002++kCTlcf59qj5Ur2mbXMfqlP4tBWrk6JZu765zTr4v8WykAlHeSPkDniOpq/Uw
         jqfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lf7WOLdPUXHcz585kTad04mWr7d5k1f/cV/mp/ntXhA=;
        b=IjWFnyBpiy3tu45O4zY9UiJSx8TpnN4lTXR6jqCoaJ/YxLsPP6RgPYmqHtPUJHAEzz
         DrPI6387UmiWUlQ5mALi98EI/Kvyk3fdn5yCuKOje+mrhnDrNiFJVwGgI8iyOoe/He28
         o1vgVGnsCBTTwn0YSKqae/3IZhGHYQfDzMBRPVNB4Tszq2sGp4l+z0b9HixICd8sAUhS
         B+EJTH+ZnH4bmy49sy2j2+gIk/fste1xxoyCsI2zfy83PozY+KG8TbtHsxOj38fds3To
         Yy7P2DFpc3bIxFXxyjbxqSOKshCtx5KB0CrpNS8bURXTbJKUUXWQbT5q1zG08FzjPD73
         WIpw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=uad2o0cM;
       spf=pass (google.com: domain of alistair23@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=alistair23@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <alistair23@gmail.com>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id q21sor1891308lji.10.2019.06.28.09.46.24
        (Google Transport Security);
        Fri, 28 Jun 2019 09:46:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of alistair23@gmail.com designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=uad2o0cM;
       spf=pass (google.com: domain of alistair23@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=alistair23@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=lf7WOLdPUXHcz585kTad04mWr7d5k1f/cV/mp/ntXhA=;
        b=uad2o0cMm/v4uFExCn6GXCZ995RWWyRvMxl6iqxIvTXzKYe/qvhdarBojlmCUum6rW
         XySlyxCjKrPpetBffWG2f2H6bc94txIqTFgbBkD4d/Zs5oxjB5i+hPlanRRMSx/rTQ8F
         UImnsTwQZRHF61lu+XXJveu/lF5Zssg2Zl9Aic/LSGwBEDck7O01bcHKZLh4vSX1DdDr
         3jfQlCrwzxsJcnVNmSgIJDciRg7px29I2yKg9eu1U+wZ8JvYaFnp2BEGVL3bQRmtmcsc
         MrVJDm3FsV15tg9+lxIzs9x7fuKcY7+1ulikGwZomvNzBKqEWnZlo29h/BJYlOAlkqe2
         LDng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=lf7WOLdPUXHcz585kTad04mWr7d5k1f/cV/mp/ntXhA=;
        b=bi5Ze0Zs/ZYqwjFzpbu8LK97toM6LgxXfGrg0DknGYeSE1H1Cbh4Ez0HDxQiebEWtb
         IMMRlqj4ArAum15WJaJwR60ZHo71Vd98xPYct2tvawYdY0SiO0wjQk/f/Qpbs+514OEs
         1ExSywTHI9hOvQ0VbdoPHBBZiA6zajoRS2gSscGCNYPo/bQ7dCqb+KdF2G6JB0D5+zjI
         0GFAZQbmEDDJkXGUFjhFcwdtb2rD59/3VWtuB67C9l4oZ5HohRnIl/P5LNqz4QDeF5MU
         aHDk2D/QBPlyUIMFj9DMdSLBv8Q/1Qb4LLl3JqztX8vxGwdymveQkevLZjEBxKNddK5K
         rgag==
X-Gm-Message-State: APjAAAVCoFu3uMM2T0BURahIIHcLVCeLMNMDhNCPQa5wdhfHzW95CkNz
	Yz06nih7N/G7aSB7rS4gPrDTXnsmPesIjNS4TcQ=
X-Google-Smtp-Source: APXvYqwvWulw5oOGJ5qVLM6Ryye6q7t53F3cIdvQOqjTI3rsaABEBgkw1nQ4gRKKpCX9ZQNzsSDfSJpzspiORL+BVus=
X-Received: by 2002:a2e:5d5a:: with SMTP id r87mr6777381ljb.196.1561740384800;
 Fri, 28 Jun 2019 09:46:24 -0700 (PDT)
MIME-Version: 1.0
References: <20190627202719.17739-1-philmd@redhat.com> <20190627202719.17739-20-philmd@redhat.com>
In-Reply-To: <20190627202719.17739-20-philmd@redhat.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 28 Jun 2019 09:43:20 -0700
Message-ID: <CAKmqyKPdRe5iXDEo6EXse4s5QZ59_dWCRV07qSCOPh9rVNW2Yg@mail.gmail.com>
Subject: Re: [Qemu-devel] [PATCH v5 19/28] hw/block/pflash_cfi02: Extract pflash_regions_count()
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
X-TUID: xoVakLn1pmd3

On Thu, Jun 27, 2019 at 1:54 PM Philippe Mathieu-Daud=C3=A9
<philmd@redhat.com> wrote:
>
> Extract the pflash_regions_count() function, the code will be
> easier to review.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/block/pflash_cfi02.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/hw/block/pflash_cfi02.c b/hw/block/pflash_cfi02.c
> index 1f096ec185..a0d3bd60dc 100644
> --- a/hw/block/pflash_cfi02.c
> +++ b/hw/block/pflash_cfi02.c
> @@ -157,6 +157,11 @@ static void pflash_register_memory(PFlashCFI02 *pfl,=
 int rom_mode)
>      pfl->rom_mode =3D rom_mode;
>  }
>
> +static size_t pflash_regions_count(PFlashCFI02 *pfl)
> +{
> +    return pfl->cfi_table[0x2c];
> +}
> +
>  static void pflash_timer (void *opaque)
>  {
>      PFlashCFI02 *pfl =3D opaque;
> @@ -192,9 +197,8 @@ static uint64_t pflash_data_read(PFlashCFI02 *pfl, hw=
addr offset,
>  static uint32_t pflash_sector_len(PFlashCFI02 *pfl, hwaddr offset)
>  {
>      assert(offset < pfl->chip_len);
> -    int nb_regions =3D pfl->cfi_table[0x2C];
>      hwaddr addr =3D 0;
> -    for (int i =3D 0; i < nb_regions; ++i) {
> +    for (int i =3D 0; i < pflash_regions_count(pfl); ++i) {
>          uint64_t region_size =3D (uint64_t)pfl->nb_blocs[i] * pfl->secto=
r_len[i];
>          if (addr <=3D offset && offset < addr + region_size) {
>              return pfl->sector_len[i];
> --
> 2.20.1
>
>
