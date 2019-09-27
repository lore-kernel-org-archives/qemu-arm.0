Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp4033131wrp;
        Fri, 27 Sep 2019 14:49:13 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxqApjeEFzSz+wWL5gfPkJaNMI2MHwNxGICsL5itwT0+/98NK3U9+SXC1jhzGXLuT3Gltg3
X-Received: by 2002:ac8:6d03:: with SMTP id o3mr12007215qtt.97.1569620953579;
        Fri, 27 Sep 2019 14:49:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1569620953; cv=none;
        d=google.com; s=arc-20160816;
        b=T/100PBKysCE/Flm7o1qJD6plll12UkE9hMzAmk3ZiIV+9Zo5YQ7ja9hNtLFRB11kP
         JaUgTiGX/m7skDGj0KZx/MZcc0ApSsutyCG2V21ZJlmX1+dFlEYMDaOM7y7VQ9yDJylv
         f0nLS2ITMr2aH1PYO5ptLt14tIokhSveaAyGmnHP/hWi/gCHj1ISlgfwQfZO6MRVqshY
         Q8wj/40FlieTJ3KuRp0guRsBcmXpifUvQ6JdNwXdIzLglWklfKAM/OWu52qv+hKZh4Fo
         bVH005ocpemn28w1rYHJBO5VON54yflf8gaktSPTuGxrXirdxHycs7//L+532PU45Xw5
         A4jA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=Z3z2HJgtQRyIS4euPZSz8ASTQEQCVryL16ycqUnflPw=;
        b=rF/JYNBEwm3yiB17vnbaoxat0wQfTC3jihgzR+XOIqKNzKPxPeYaDIFxgXovSfXHC/
         s5/7w3bab2p7ftKDDLLcrtclCq57c3Wvmo3Uk8reIcTGgqWRzGD5kTWu0VSu6EpfFAMt
         K+nT7lfilM0YZBKBJN4b2cd9TA765qL5LhyeEenm6B9SZJDA5M8RjOJi8yzZUAJhHItf
         qptLzbXDegFIsPz7HEypsBbDCFtP4fwTVQbkoVF3i8K/t8H/DP6HSLmdlcelZvldcgEa
         k4yvyp0F97cq8Gh9TpTT7ZA1XyJybYiJu3GsA1wPDxaURCcgaGxwz5jkFcPoCTkG0zkR
         vRNg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=HSCa2Zgh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6si3520270qkl.199.2019.09.27.14.49.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 27 Sep 2019 14:49:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=HSCa2Zgh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:57830 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iDy6y-0006Kf-MJ
	for alex.bennee@linaro.org; Fri, 27 Sep 2019 17:49:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34822)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alistair23@gmail.com>) id 1iDy1T-00031x-6z
 for qemu-arm@nongnu.org; Fri, 27 Sep 2019 17:43:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alistair23@gmail.com>) id 1iDy1R-00062t-92
 for qemu-arm@nongnu.org; Fri, 27 Sep 2019 17:43:30 -0400
Received: from mail-lj1-x242.google.com ([2a00:1450:4864:20::242]:33243)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alistair23@gmail.com>)
 id 1iDy1M-0005yh-NZ; Fri, 27 Sep 2019 17:43:24 -0400
Received: by mail-lj1-x242.google.com with SMTP id a22so3906633ljd.0;
 Fri, 27 Sep 2019 14:43:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Z3z2HJgtQRyIS4euPZSz8ASTQEQCVryL16ycqUnflPw=;
 b=HSCa2Zgh3JXvYXQ9jzo1JGDOnRbDrBcm6DTlsC9pHobFxgumNJOj2C2lbElJbxtMKk
 ImUjp8UgjfL8Plqn9ARocJ56YgGV81zQ01+m8CPMqIOx91EzuTF52XDdR58mZbaVv5mj
 5jHnyrdN9F6vPitNI2K3C3GEEIOW7ivb8/i/X3cNAWAdfdWUMvfq/h1VLEQiOJj/T2ic
 QYw8rBzIp1S17bssKfC4/v5cVWXQ/oDbsUxoXkNksTp6mYwELAAWQuN2dNSpXfEKj5cf
 MVVxvNn2/rN0+Ra4t8qjtZhVaz/GOQd71gYCI0eeDqxYCMSCMC8HlnLQWrYzMzwxWWq/
 Q7IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Z3z2HJgtQRyIS4euPZSz8ASTQEQCVryL16ycqUnflPw=;
 b=H0ataQ+jpJ8WzwnFxPDM04vs2tdry/DAloP44L0ewzHSntQ7UbmftuH4DkFfI5EA9n
 gKOaG9HmcZFwMFqjq/KOSykBZlbeEjVcEyIFjBuhwmOc9H0iS7Wut1iN72z2kPfUueE/
 Rjn5G4iwaHqBtGkibEAb/+BiIhqBDykbRuKcQqIQfdHwFdx2FiDxuTvFZcinTWm8+YIS
 9CBCZWFnWXeqO919l8FmoU9/S/kVufh8xyW2tkJUjCA2bjDUDsZ+/YB+GNe2QbqgDM0i
 STeOaLXJ+tw+rXTMqoyTybp1iYJov50qRFwYhVaCTXl5SwiNNQ3EBihQDhXGs8thNesS
 e8ig==
X-Gm-Message-State: APjAAAXSlDYXnIXaQqFwA7RcoxUQ0zJ0fpx761Sf0WiUkN4Ne07ZdPjp
 LN2kt7bJeL4MG3O48rdYqu06kkX6MMyj2Scpc00=
X-Received: by 2002:a2e:3902:: with SMTP id g2mr4450813lja.196.1569620603159; 
 Fri, 27 Sep 2019 14:43:23 -0700 (PDT)
MIME-Version: 1.0
References: <20190926173428.10713-1-f4bug@amsat.org>
 <20190926173428.10713-4-f4bug@amsat.org>
In-Reply-To: <20190926173428.10713-4-f4bug@amsat.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 27 Sep 2019 14:38:36 -0700
Message-ID: <CAKmqyKOOo5nRSiSHWXKUMLR_pMbZexzY_N3a014tbZNgEgoTGQ@mail.gmail.com>
Subject: Re: [PATCH 03/19] hw/arm/bcm2835_peripherals: Name various address
 spaces
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::242
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Zolt=C3=A1n_Baldaszti?= <bztemail@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Alistair Francis <alistair@alistair23.me>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Esteban Bosse <estebanbosse@gmail.com>, Cleber Rosa <crosa@redhat.com>,
 qemu-arm <qemu-arm@nongnu.org>,
 Clement Deschamps <clement.deschamps@antfield.fr>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 Laurent Bonnans <laurent.bonnans@here.com>,
 Cheng Xiang <ext-cheng.xiang@here.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 Pekka Enberg <penberg@iki.fi>, Guenter Roeck <linux@roeck-us.net>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 8TTBGWpTO1tU

On Thu, Sep 26, 2019 at 10:36 AM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.o=
rg> wrote:
>
> Various address spaces from the BCM2835 are reported as
> 'anonymous' in memory tree:
>
>   (qemu) info mtree
>
>   address-space: anonymous
>     0000000000000000-000000000000008f (prio 0, i/o): bcm2835-mbox
>       0000000000000010-000000000000001f (prio 0, i/o): bcm2835-fb
>       0000000000000080-000000000000008f (prio 0, i/o): bcm2835-property
>
>   address-space: anonymous
>     0000000000000000-00000000ffffffff (prio 0, i/o): bcm2835-gpu
>       0000000000000000-000000003fffffff (prio 0, i/o): alias bcm2835-gpu-=
ram-alias[*] @ram 0000000000000000-000000003fffffff
>       0000000040000000-000000007fffffff (prio 0, i/o): alias bcm2835-gpu-=
ram-alias[*] @ram 0000000000000000-000000003fffffff
>       000000007e000000-000000007effffff (prio 1, i/o): alias bcm2835-peri=
pherals @bcm2835-peripherals 0000000000000000-0000000000ffffff
>       0000000080000000-00000000bfffffff (prio 0, i/o): alias bcm2835-gpu-=
ram-alias[*] @ram 0000000000000000-000000003fffffff
>       00000000c0000000-00000000ffffffff (prio 0, i/o): alias bcm2835-gpu-=
ram-alias[*] @ram 0000000000000000-000000003fffffff
>
>   [...]
>
> Since the address_space_init() function takes a 'name' argument,
> set it to correctly describe each address space:
>
>   (qemu) info mtree
>
>   address-space: bcm2835-mbox-memory
>     0000000000000000-000000000000008f (prio 0, i/o): bcm2835-mbox
>       0000000000000010-000000000000001f (prio 0, i/o): bcm2835-fb
>       0000000000000080-000000000000008f (prio 0, i/o): bcm2835-property
>
>   address-space: bcm2835-fb-memory
>     0000000000000000-00000000ffffffff (prio 0, i/o): bcm2835-gpu
>       0000000000000000-000000003fffffff (prio 0, i/o): alias bcm2835-gpu-=
ram-alias[*] @ram 0000000000000000-000000003fffffff
>       0000000040000000-000000007fffffff (prio 0, i/o): alias bcm2835-gpu-=
ram-alias[*] @ram 0000000000000000-000000003fffffff
>       000000007e000000-000000007effffff (prio 1, i/o): alias bcm2835-peri=
pherals @bcm2835-peripherals 0000000000000000-0000000000ffffff
>       0000000080000000-00000000bfffffff (prio 0, i/o): alias bcm2835-gpu-=
ram-alias[*] @ram 0000000000000000-000000003fffffff
>       00000000c0000000-00000000ffffffff (prio 0, i/o): alias bcm2835-gpu-=
ram-alias[*] @ram 0000000000000000-000000003fffffff
>
>   address-space: bcm2835-property-memory
>     0000000000000000-00000000ffffffff (prio 0, i/o): bcm2835-gpu
>       0000000000000000-000000003fffffff (prio 0, i/o): alias bcm2835-gpu-=
ram-alias[*] @ram 0000000000000000-000000003fffffff
>       0000000040000000-000000007fffffff (prio 0, i/o): alias bcm2835-gpu-=
ram-alias[*] @ram 0000000000000000-000000003fffffff
>       000000007e000000-000000007effffff (prio 1, i/o): alias bcm2835-peri=
pherals @bcm2835-peripherals 0000000000000000-0000000000ffffff
>       0000000080000000-00000000bfffffff (prio 0, i/o): alias bcm2835-gpu-=
ram-alias[*] @ram 0000000000000000-000000003fffffff
>       00000000c0000000-00000000ffffffff (prio 0, i/o): alias bcm2835-gpu-=
ram-alias[*] @ram 0000000000000000-000000003fffffff
>
>   address-space: bcm2835-dma-memory
>     0000000000000000-00000000ffffffff (prio 0, i/o): bcm2835-gpu
>       0000000000000000-000000003fffffff (prio 0, i/o): alias bcm2835-gpu-=
ram-alias[*] @ram 0000000000000000-000000003fffffff
>       0000000040000000-000000007fffffff (prio 0, i/o): alias bcm2835-gpu-=
ram-alias[*] @ram 0000000000000000-000000003fffffff
>       000000007e000000-000000007effffff (prio 1, i/o): alias bcm2835-peri=
pherals @bcm2835-peripherals 0000000000000000-0000000000ffffff
>       0000000080000000-00000000bfffffff (prio 0, i/o): alias bcm2835-gpu-=
ram-alias[*] @ram 0000000000000000-000000003fffffff
>       00000000c0000000-00000000ffffffff (prio 0, i/o): alias bcm2835-gpu-=
ram-alias[*] @ram 0000000000000000-000000003fffffff
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/display/bcm2835_fb.c    | 2 +-
>  hw/dma/bcm2835_dma.c       | 2 +-
>  hw/misc/bcm2835_mbox.c     | 2 +-
>  hw/misc/bcm2835_property.c | 2 +-
>  4 files changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/hw/display/bcm2835_fb.c b/hw/display/bcm2835_fb.c
> index 8f856878cd..85aaa54330 100644
> --- a/hw/display/bcm2835_fb.c
> +++ b/hw/display/bcm2835_fb.c
> @@ -425,7 +425,7 @@ static void bcm2835_fb_realize(DeviceState *dev, Erro=
r **errp)
>      s->initial_config.base =3D s->vcram_base + BCM2835_FB_OFFSET;
>
>      s->dma_mr =3D MEMORY_REGION(obj);
> -    address_space_init(&s->dma_as, s->dma_mr, NULL);
> +    address_space_init(&s->dma_as, s->dma_mr, TYPE_BCM2835_FB "-memory")=
;
>
>      bcm2835_fb_reset(dev);
>
> diff --git a/hw/dma/bcm2835_dma.c b/hw/dma/bcm2835_dma.c
> index 6acc2b644e..1e458d7fba 100644
> --- a/hw/dma/bcm2835_dma.c
> +++ b/hw/dma/bcm2835_dma.c
> @@ -383,7 +383,7 @@ static void bcm2835_dma_realize(DeviceState *dev, Err=
or **errp)
>      }
>
>      s->dma_mr =3D MEMORY_REGION(obj);
> -    address_space_init(&s->dma_as, s->dma_mr, NULL);
> +    address_space_init(&s->dma_as, s->dma_mr, TYPE_BCM2835_DMA "-memory"=
);
>
>      bcm2835_dma_reset(dev);
>  }
> diff --git a/hw/misc/bcm2835_mbox.c b/hw/misc/bcm2835_mbox.c
> index 7690b9afaf..77285624c9 100644
> --- a/hw/misc/bcm2835_mbox.c
> +++ b/hw/misc/bcm2835_mbox.c
> @@ -311,7 +311,7 @@ static void bcm2835_mbox_realize(DeviceState *dev, Er=
ror **errp)
>      }
>
>      s->mbox_mr =3D MEMORY_REGION(obj);
> -    address_space_init(&s->mbox_as, s->mbox_mr, NULL);
> +    address_space_init(&s->mbox_as, s->mbox_mr, TYPE_BCM2835_MBOX "-memo=
ry");
>      bcm2835_mbox_reset(dev);
>  }
>
> diff --git a/hw/misc/bcm2835_property.c b/hw/misc/bcm2835_property.c
> index 0a1a3eb5d9..43a5465c5d 100644
> --- a/hw/misc/bcm2835_property.c
> +++ b/hw/misc/bcm2835_property.c
> @@ -407,7 +407,7 @@ static void bcm2835_property_realize(DeviceState *dev=
, Error **errp)
>      }
>
>      s->dma_mr =3D MEMORY_REGION(obj);
> -    address_space_init(&s->dma_as, s->dma_mr, NULL);
> +    address_space_init(&s->dma_as, s->dma_mr, TYPE_BCM2835_PROPERTY "-me=
mory");
>
>      /* TODO: connect to MAC address of USB NIC device, once we emulate i=
t */
>      qemu_macaddr_default_if_unset(&s->macaddr);
> --
> 2.20.1
>
>
