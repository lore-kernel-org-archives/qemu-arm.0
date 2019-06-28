Received: by 2002:a5d:6790:0:0:0:0:0 with SMTP id v16csp2659613wru;
        Fri, 28 Jun 2019 09:06:43 -0700 (PDT)
X-Received: by 2002:a2e:8396:: with SMTP id x22mr6849073ljg.135.1561738003777;
        Fri, 28 Jun 2019 09:06:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1561738003; cv=none;
        d=google.com; s=arc-20160816;
        b=NrNiJRVrSk3dsJK5a6pWNUO2i81BFqGumKNd9AnD+R+bO/bXFCQjGfgOB26I8unn9F
         wG50UqwPuikmKE2Izq1s8eq0QVUF3E0BQB3TF+w4Lb87+d69X/AkEXHodUEdFo/H74r7
         beW62A/L6cpi9WITDMVtNIM6XvXtorkzl/mUI5vKlO80ZIAZkbIVVntWyZn30pSd0KIT
         WRUY+9P1kYfYLCwAeInSQjChTIxZiW7rx6jwV0PkKSOXUGQzAIJEERGaDDbSPrbpuuxW
         GP21HDwVkOm0MXC1IoPo25yoxwseOMSgUTf/xmDKvR1ULOQsDs4xHx0SDWBGNYYeg75g
         RiTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nYXIz97V9wvyZolGcpgiftQcXo0IIhYnZQZXcYls+Wk=;
        b=GntyQ5JIP0Ic4RRlWRdiQb1FJcihgXf6RN6kgvAy+Js/uQG5Nluv8uXaifrNVJyskI
         YMEQprjZz56IVzdBAtUlr7zTaR0AHbPCiqEOy2X+j6F/9i/TzAASmmGu/5MAkFiovRHv
         lLXpmEbi2fzYL5I6YZS1SGJtMY2mPMSI5uR+UoPKRpWvu8av8t4bzsM2qUzvpXKR5lcF
         I4Zw2MSKFgEYX5j0cGrY1XvbaMZchwD98AapBpvkaFvzSVKuuCSDtilT/AVh+VeeQhvE
         p+l3V4r30Z0Y6QK0yZhypKJeyis9Tf88sFAJbcTC38i2j5aA1JhI5BP2VZQ/IgYFA83q
         j2gg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=LtTjyv2s;
       spf=pass (google.com: domain of alistair23@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=alistair23@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <alistair23@gmail.com>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id b20sor1811419ljj.6.2019.06.28.09.06.43
        (Google Transport Security);
        Fri, 28 Jun 2019 09:06:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of alistair23@gmail.com designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=LtTjyv2s;
       spf=pass (google.com: domain of alistair23@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=alistair23@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=nYXIz97V9wvyZolGcpgiftQcXo0IIhYnZQZXcYls+Wk=;
        b=LtTjyv2s1AzNOXanwZ7cPO08G2WmEXFUMsztACAyJcaOR5+VVESAdpHUOWzyvhPekm
         2PLg8h56+XiRAi7V287QL/YHB23PiMXwqh7ZjiiXFI9W0xoCsYpvLRIdvjTHpYr+nv0i
         /FKKo/LFk1odd1P3AIbLMXqEzG2g+srHuQB6I/g8lZeLrFqsQ8vjEfmt+tzILxEURpYQ
         7KWsBYJnDhHplcorSE4zvQYzhPAk62wdEZsavoiZWMPHocqSrxd7vd1zQpVHnBagPp1Z
         2icDBupsjcvKVL2LRMF0/u0aZNV8gNHwWEkSQI4sQeAQ+w7ovmEE/ot16CSlhkkzNyu/
         jOlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=nYXIz97V9wvyZolGcpgiftQcXo0IIhYnZQZXcYls+Wk=;
        b=p6D3tFbn5imX+Pl/UXSrQltCsuEe52UTNKKlPNcYAKyKWQ8TqynM1oRnKJpY+/oYhs
         phVJ8u2lYfI3SM4iUIpJOhNMbhmyrLipmSwjcVRRKZGMPQa3B52Vdk9XsDyJB7bPkIay
         Gyx88D0lcRmPSHFmOIXDk2gLRXfM9TO9ThMNJT0eNYy/FQhHbZmqlM/z8fth1Wy3XB2t
         jm9EWrLMH5rMrqviLPkXwGjyWekV6K2dSGE5mGvqtJ2gyvUWG+Uvx54UHwp1Ik27X4Ac
         2U/ZFLtJHcTzlAgkI6G3LBM99KZ0ah26KtnZpSiH458Yz+7s0jh3rXrfNXKespcQ5Q2T
         3vDw==
X-Gm-Message-State: APjAAAV8Lr2JPlg3Cv2Ag26sSyqAbz8gkRJlZZ3gNm32ZCzXjjPylMjK
	bPJQtVpa2MwAULoROWqgjMR3j3Y1ZOvPUqhdD1A=
X-Google-Smtp-Source: APXvYqzHrsJd+2ScdTmlLRrBFt/qLfl2nvIpO8vTR+U0MiCa/+E041wDNLMwqSIP8lgBYBAniy5f151RdEzgTr4g+e0=
X-Received: by 2002:a2e:9158:: with SMTP id q24mr6779251ljg.119.1561738003485;
 Fri, 28 Jun 2019 09:06:43 -0700 (PDT)
MIME-Version: 1.0
References: <20190627202719.17739-1-philmd@redhat.com> <20190627202719.17739-10-philmd@redhat.com>
In-Reply-To: <20190627202719.17739-10-philmd@redhat.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 28 Jun 2019 09:03:43 -0700
Message-ID: <CAKmqyKPt+LwXVPDJEDJOX2kH50hZc5sGhi528VW91u5Po=VYww@mail.gmail.com>
Subject: Re: [Qemu-devel] [PATCH v5 09/28] hw/block/pflash_cfi02: Use the ldst
 API in pflash_read()
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
X-TUID: 38C0Nit6Y35Z

On Thu, Jun 27, 2019 at 1:54 PM Philippe Mathieu-Daud=C3=A9
<philmd@redhat.com> wrote:
>
> The load/store API eases code review.
>
> Signed-off-by: Stephen Checkoway <stephen.checkoway@oberlin.edu>
> Message-Id: <20190426162624.55977-3-stephen.checkoway@oberlin.edu>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> Tested-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> [PMD: Extracted from bigger patch, simplified tracing]
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/block/pflash_cfi02.c | 32 +++++---------------------------
>  1 file changed, 5 insertions(+), 27 deletions(-)
>
> diff --git a/hw/block/pflash_cfi02.c b/hw/block/pflash_cfi02.c
> index ae38ed0bae..49afecb921 100644
> --- a/hw/block/pflash_cfi02.c
> +++ b/hw/block/pflash_cfi02.c
> @@ -196,33 +196,11 @@ static uint32_t pflash_read(PFlashCFI02 *pfl, hwadd=
r offset,
>      case 0x00:
>      flash_read:
>          /* Flash area read */
> -        p =3D pfl->storage;
> -        switch (width) {
> -        case 1:
> -            ret =3D p[offset];
> -            break;
> -        case 2:
> -            if (be) {
> -                ret =3D p[offset] << 8;
> -                ret |=3D p[offset + 1];
> -            } else {
> -                ret =3D p[offset];
> -                ret |=3D p[offset + 1] << 8;
> -            }
> -            break;
> -        case 4:
> -            if (be) {
> -                ret =3D p[offset] << 24;
> -                ret |=3D p[offset + 1] << 16;
> -                ret |=3D p[offset + 2] << 8;
> -                ret |=3D p[offset + 3];
> -            } else {
> -                ret =3D p[offset];
> -                ret |=3D p[offset + 1] << 8;
> -                ret |=3D p[offset + 2] << 16;
> -                ret |=3D p[offset + 3] << 24;
> -            }
> -            break;
> +        p =3D (uint8_t *)pfl->storage + offset;
> +        if (pfl->be) {
> +            ret =3D ldn_be_p(p, width);
> +        } else {
> +            ret =3D ldn_le_p(p, width);
>          }
>          trace_pflash_data_read(offset, width << 1, ret);
>          break;
> --
> 2.20.1
>
>
