Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp331355wrm;
        Tue, 8 Oct 2019 18:49:10 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwZpha8aGF3qLhPmHJZnm1lRSvSk8J0S4QkGCNhIaHiq+Xu97I9OcH9rJeTTCGvXPgqtCsO
X-Received: by 2002:a50:d083:: with SMTP id v3mr849020edd.51.1570585749956;
        Tue, 08 Oct 2019 18:49:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1570585749; cv=none;
        d=google.com; s=arc-20160816;
        b=qpc9lqM55R1lI1pIjaz+DLqnQ1wxKMdhRxNEkmAryuPthT4tlmaKaxidbTqBxJFdvU
         A6MQtFMlu8ZL8hDX+6+MtQbZBmP740fZMD8+ZDVqhDF/DK74xrjWo1aoEPDjLzM7a8hQ
         KTZN1CS/MPpnEZ7jHDCjyjKGfiJY3bC7sLBHfo2beem3GY2VDq8JsOyFbDc4izwUWfrL
         Q3DPxB1YzAz+Q0ciGU6szIZT/7SZeyzbajz706rIsgzBeJVnQGZZ8/OgQwlG4s6WRq86
         79w+hDD1PzUfUKVEd3w9sMB/pXw6cxEIJ6IdgYRGp6mibAT44BWM5hm8xnJ2/yH05kDf
         BhOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:to:from:date;
        bh=Xqo3C3hsuJ/blBv4tAezYJKwE1X5PjxQEJx76yp+ZgM=;
        b=ED5Em5j+qrcbbsxNpzKBR4W2vr79i8MfND8XpuRW7yG3Yg4ja/w4toK9egAzL5W90l
         GHS+SxlTuplPhMTssRJrU8QIqc5NV1hFvFugT11XkHlI/jIpyEtSg3BMTfQCcXf1Ci/o
         vPuzHxCTl6klznmH6KYgVL0+VK1xwQdMnuCZlprFb36JeIa+0M0cJJeS5PZWw9jPUeEe
         oKX3Zf6uqqENUTohVK/uV4xG4TwIPhwUVzGyfwyyZjtCa+zFWWtuN+9bUU8rYMEkQeQF
         BSu0ozJyn7Cyd/rdZfa0/aDLVx1tyJuhaxIkOcMWAE9MgeqWDwsPm3x7naQLpVEe2jtM
         KyPQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p9si488439edc.96.2019.10.08.18.49.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 08 Oct 2019 18:49:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:38716 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iI16C-0008FF-3e
	for alex.bennee@linaro.org; Tue, 08 Oct 2019 21:49:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42403)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <crosa@redhat.com>) id 1iI15t-0008Bd-G9
 for qemu-arm@nongnu.org; Tue, 08 Oct 2019 21:48:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <crosa@redhat.com>) id 1iI15q-0007fp-Ru
 for qemu-arm@nongnu.org; Tue, 08 Oct 2019 21:48:48 -0400
Received: from mx1.redhat.com ([209.132.183.28]:36484)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <crosa@redhat.com>)
 id 1iI15q-0007fD-IG; Tue, 08 Oct 2019 21:48:46 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 5D68818C892C;
 Wed,  9 Oct 2019 01:48:45 +0000 (UTC)
Received: from localhost.localdomain (ovpn-122-151.rdu2.redhat.com
 [10.10.122.151])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8582160C05;
 Wed,  9 Oct 2019 01:48:38 +0000 (UTC)
Date: Tue, 8 Oct 2019 21:48:36 -0400
From: Cleber Rosa <crosa@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Subject: Re: [PATCH 03/19] hw/arm/bcm2835_peripherals: Name various address
 spaces
Message-ID: <20191009014836.GB22824@localhost.localdomain>
References: <20190926173428.10713-1-f4bug@amsat.org>
 <20190926173428.10713-4-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <20190926173428.10713-4-f4bug@amsat.org>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.70]); Wed, 09 Oct 2019 01:48:45 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
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
 =?iso-8859-1?Q?Zolt=E1n?= Baldaszti <bztemail@gmail.com>,
 Laurent Bonnans <laurent.bonnans@here.com>,
 Alistair Francis <alistair@alistair23.me>, qemu-devel@nongnu.org,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 BALATON Zoltan <balaton@eik.bme.hu>, Esteban Bosse <estebanbosse@gmail.com>,
 qemu-arm@nongnu.org, Clement Deschamps <clement.deschamps@antfield.fr>,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Cheng Xiang <ext-cheng.xiang@here.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 Pekka Enberg <penberg@iki.fi>, Guenter Roeck <linux@roeck-us.net>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: j4b0kMvLnaVo

On Thu, Sep 26, 2019 at 07:34:11PM +0200, Philippe Mathieu-Daud=E9 wrote:
> Various address spaces from the BCM2835 are reported as
> 'anonymous' in memory tree:
>=20
>   (qemu) info mtree
>=20
>   address-space: anonymous
>     0000000000000000-000000000000008f (prio 0, i/o): bcm2835-mbox
>       0000000000000010-000000000000001f (prio 0, i/o): bcm2835-fb
>       0000000000000080-000000000000008f (prio 0, i/o): bcm2835-property
>=20
>   address-space: anonymous
>     0000000000000000-00000000ffffffff (prio 0, i/o): bcm2835-gpu
>       0000000000000000-000000003fffffff (prio 0, i/o): alias bcm2835-gp=
u-ram-alias[*] @ram 0000000000000000-000000003fffffff
>       0000000040000000-000000007fffffff (prio 0, i/o): alias bcm2835-gp=
u-ram-alias[*] @ram 0000000000000000-000000003fffffff
>       000000007e000000-000000007effffff (prio 1, i/o): alias bcm2835-pe=
ripherals @bcm2835-peripherals 0000000000000000-0000000000ffffff
>       0000000080000000-00000000bfffffff (prio 0, i/o): alias bcm2835-gp=
u-ram-alias[*] @ram 0000000000000000-000000003fffffff
>       00000000c0000000-00000000ffffffff (prio 0, i/o): alias bcm2835-gp=
u-ram-alias[*] @ram 0000000000000000-000000003fffffff
>=20
>   [...]
>=20
> Since the address_space_init() function takes a 'name' argument,
> set it to correctly describe each address space:
>=20
>   (qemu) info mtree
>=20
>   address-space: bcm2835-mbox-memory
>     0000000000000000-000000000000008f (prio 0, i/o): bcm2835-mbox
>       0000000000000010-000000000000001f (prio 0, i/o): bcm2835-fb
>       0000000000000080-000000000000008f (prio 0, i/o): bcm2835-property
>=20
>   address-space: bcm2835-fb-memory
>     0000000000000000-00000000ffffffff (prio 0, i/o): bcm2835-gpu
>       0000000000000000-000000003fffffff (prio 0, i/o): alias bcm2835-gp=
u-ram-alias[*] @ram 0000000000000000-000000003fffffff
>       0000000040000000-000000007fffffff (prio 0, i/o): alias bcm2835-gp=
u-ram-alias[*] @ram 0000000000000000-000000003fffffff
>       000000007e000000-000000007effffff (prio 1, i/o): alias bcm2835-pe=
ripherals @bcm2835-peripherals 0000000000000000-0000000000ffffff
>       0000000080000000-00000000bfffffff (prio 0, i/o): alias bcm2835-gp=
u-ram-alias[*] @ram 0000000000000000-000000003fffffff
>       00000000c0000000-00000000ffffffff (prio 0, i/o): alias bcm2835-gp=
u-ram-alias[*] @ram 0000000000000000-000000003fffffff
>=20
>   address-space: bcm2835-property-memory
>     0000000000000000-00000000ffffffff (prio 0, i/o): bcm2835-gpu
>       0000000000000000-000000003fffffff (prio 0, i/o): alias bcm2835-gp=
u-ram-alias[*] @ram 0000000000000000-000000003fffffff
>       0000000040000000-000000007fffffff (prio 0, i/o): alias bcm2835-gp=
u-ram-alias[*] @ram 0000000000000000-000000003fffffff
>       000000007e000000-000000007effffff (prio 1, i/o): alias bcm2835-pe=
ripherals @bcm2835-peripherals 0000000000000000-0000000000ffffff
>       0000000080000000-00000000bfffffff (prio 0, i/o): alias bcm2835-gp=
u-ram-alias[*] @ram 0000000000000000-000000003fffffff
>       00000000c0000000-00000000ffffffff (prio 0, i/o): alias bcm2835-gp=
u-ram-alias[*] @ram 0000000000000000-000000003fffffff
>=20
>   address-space: bcm2835-dma-memory
>     0000000000000000-00000000ffffffff (prio 0, i/o): bcm2835-gpu
>       0000000000000000-000000003fffffff (prio 0, i/o): alias bcm2835-gp=
u-ram-alias[*] @ram 0000000000000000-000000003fffffff
>       0000000040000000-000000007fffffff (prio 0, i/o): alias bcm2835-gp=
u-ram-alias[*] @ram 0000000000000000-000000003fffffff
>       000000007e000000-000000007effffff (prio 1, i/o): alias bcm2835-pe=
ripherals @bcm2835-peripherals 0000000000000000-0000000000ffffff
>       0000000080000000-00000000bfffffff (prio 0, i/o): alias bcm2835-gp=
u-ram-alias[*] @ram 0000000000000000-000000003fffffff
>       00000000c0000000-00000000ffffffff (prio 0, i/o): alias bcm2835-gp=
u-ram-alias[*] @ram 0000000000000000-000000003fffffff
>=20
> Signed-off-by: Philippe Mathieu-Daud=E9 <f4bug@amsat.org>
> ---
>  hw/display/bcm2835_fb.c    | 2 +-
>  hw/dma/bcm2835_dma.c       | 2 +-
>  hw/misc/bcm2835_mbox.c     | 2 +-
>  hw/misc/bcm2835_property.c | 2 +-
>  4 files changed, 4 insertions(+), 4 deletions(-)
>=20
> diff --git a/hw/display/bcm2835_fb.c b/hw/display/bcm2835_fb.c
> index 8f856878cd..85aaa54330 100644
> --- a/hw/display/bcm2835_fb.c
> +++ b/hw/display/bcm2835_fb.c
> @@ -425,7 +425,7 @@ static void bcm2835_fb_realize(DeviceState *dev, Er=
ror **errp)
>      s->initial_config.base =3D s->vcram_base + BCM2835_FB_OFFSET;
> =20
>      s->dma_mr =3D MEMORY_REGION(obj);
> -    address_space_init(&s->dma_as, s->dma_mr, NULL);
> +    address_space_init(&s->dma_as, s->dma_mr, TYPE_BCM2835_FB "-memory=
");
> =20
>      bcm2835_fb_reset(dev);
> =20
> diff --git a/hw/dma/bcm2835_dma.c b/hw/dma/bcm2835_dma.c
> index 6acc2b644e..1e458d7fba 100644
> --- a/hw/dma/bcm2835_dma.c
> +++ b/hw/dma/bcm2835_dma.c
> @@ -383,7 +383,7 @@ static void bcm2835_dma_realize(DeviceState *dev, E=
rror **errp)
>      }
> =20
>      s->dma_mr =3D MEMORY_REGION(obj);
> -    address_space_init(&s->dma_as, s->dma_mr, NULL);
> +    address_space_init(&s->dma_as, s->dma_mr, TYPE_BCM2835_DMA "-memor=
y");
> =20
>      bcm2835_dma_reset(dev);
>  }
> diff --git a/hw/misc/bcm2835_mbox.c b/hw/misc/bcm2835_mbox.c
> index 7690b9afaf..77285624c9 100644
> --- a/hw/misc/bcm2835_mbox.c
> +++ b/hw/misc/bcm2835_mbox.c
> @@ -311,7 +311,7 @@ static void bcm2835_mbox_realize(DeviceState *dev, =
Error **errp)
>      }
> =20
>      s->mbox_mr =3D MEMORY_REGION(obj);
> -    address_space_init(&s->mbox_as, s->mbox_mr, NULL);
> +    address_space_init(&s->mbox_as, s->mbox_mr, TYPE_BCM2835_MBOX "-me=
mory");
>      bcm2835_mbox_reset(dev);
>  }
> =20
> diff --git a/hw/misc/bcm2835_property.c b/hw/misc/bcm2835_property.c
> index 0a1a3eb5d9..43a5465c5d 100644
> --- a/hw/misc/bcm2835_property.c
> +++ b/hw/misc/bcm2835_property.c
> @@ -407,7 +407,7 @@ static void bcm2835_property_realize(DeviceState *d=
ev, Error **errp)
>      }
> =20
>      s->dma_mr =3D MEMORY_REGION(obj);
> -    address_space_init(&s->dma_as, s->dma_mr, NULL);
> +    address_space_init(&s->dma_as, s->dma_mr, TYPE_BCM2835_PROPERTY "-=
memory");
> =20
>      /* TODO: connect to MAC address of USB NIC device, once we emulate=
 it */
>      qemu_macaddr_default_if_unset(&s->macaddr);
> --=20
> 2.20.1
>=20

The names you're giving are much more detailed than most other
examples I found for address_space_init(), and I like that approach a
lot.

Reviewed-by: Cleber Rosa <crosa@redhat.com>
