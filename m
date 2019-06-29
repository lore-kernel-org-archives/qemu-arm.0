Received: by 2002:a5d:6790:0:0:0:0:0 with SMTP id v16csp380749wru;
        Fri, 28 Jun 2019 22:22:51 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxvAASVJteUD0IrWOY2vf6jAfS1s7cuz3HN5xI6fJ4RKtSE93q8Huw//4yVkN1yWMiZRmRZ
X-Received: by 2002:a17:906:2289:: with SMTP id p9mr12080120eja.249.1561785771003;
        Fri, 28 Jun 2019 22:22:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1561785770; cv=none;
        d=google.com; s=arc-20160816;
        b=VewEaQ+VDXbpKG7CyH4wulrGxYQhTpqzdbST/vhx2SS0WZhS5bLSiDPTr16QB9nqnb
         oGoL6MZK7MqP2eQzYfkMxtiysNzH+KZ5Q/bLbWMJP1HkQVXNrOeG76j2ZeChsDmrGyBM
         8MjGghr+EByTwKhBJxbMemjvtnAiug7VfA+ye3RUc+rK/xJMcEuVnQy/Kk56EdHtxh7M
         /W/WqDPryCxLHOw/Cs/FAqk1QrQ1/vN6BzVex016xBu7hLd4w3NNMnfF6GtIUHYlyMwV
         kXnv9XFGf4ZyoUYWLTeqzSEvIwYoHtkhyv50fLHZjguxpVh2Lu7kNc3ZU9yvXUpa5rx7
         9BNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dkim-signature;
        bh=QCtBh6ya8J3oqMRnOd0C1YsWNm3oFLSy5g2m8bnx9tQ=;
        b=n9OL6olwEvg/oKOqXUuMWVgN7ki5ihZjTwZHZL+zBuh/Dbcu/de0T6KUNK7Ge3aO3S
         D7XExi9VsUXXadMEEScBafykXutCI0rf9zXeJg3GHWK0Eq60OpFY+51IX/ytJwRisZv2
         DaLHd07Pd+/r5HoZuXELueGvo6+zrk0CTB2oqIx8W1hRy79vT8e49qQX49P3vlwDLmp8
         FBGSLelHSscWmK7ozRg4tVw7f53CM30iW5yb/GQNOpgbMIPgT6hJV2x4/tQnrMcbi14U
         5QC+DVBabuMbQDawihtckp96cvdmSmJWsWwKA+fVzhugJeJPHFg0P5jsHUZ2Yuq/v2V3
         YlhA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gibson.dropbear.id.au header.s=201602 header.b=nXFimMhe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s22si61154edm.437.2019.06.28.22.22.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 28 Jun 2019 22:22:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gibson.dropbear.id.au header.s=201602 header.b=nXFimMhe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:37728 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hh5p4-0007p0-4V
	for alex.bennee@linaro.org; Sat, 29 Jun 2019 01:22:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51618)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <dgibson@ozlabs.org>) id 1hh5ou-0007ot-Ty
 for qemu-arm@nongnu.org; Sat, 29 Jun 2019 01:22:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgibson@ozlabs.org>) id 1hh5or-0002l1-GH
 for qemu-arm@nongnu.org; Sat, 29 Jun 2019 01:22:40 -0400
Received: from ozlabs.org ([203.11.71.1]:39691)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
 id 1hh5oq-0002hk-23; Sat, 29 Jun 2019 01:22:37 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 45bMTJ5Ns3z9s5c; Sat, 29 Jun 2019 15:22:28 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1561785748;
 bh=k5AhlNxHYcLwY3zZPHfUaPJmPgFgdqenxiICViKi8cA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=nXFimMhe2seWVC4kXAuxBqGm8S7rXh1BlKE/T3maZ2oVPp7oCU5TAueQaJz4LZOyX
 +LZF7exjT8Hp7nxiHt1Mqb20G7HdQFu1wZt4EU0LM2n6hS97pN/TnNLQppCpl0X9Gl
 h32rAje7HEYv5BnGTmAnZpAk8RQd/d7zWrtWOuPs=
Date: Sat, 29 Jun 2019 15:02:32 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Gerd Hoffmann <kraxel@redhat.com>
Message-ID: <20190629050232.GA1870@umbus.fritz.box>
References: <20190628103957.9504-1-kraxel@redhat.com>
 <20190628103957.9504-2-kraxel@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="CE+1k2dSO48ffgeK"
Content-Disposition: inline
In-Reply-To: <20190628103957.9504-2-kraxel@redhat.com>
User-Agent: Mutt/1.12.0 (2019-05-25)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 203.11.71.1
Subject: Re: [Qemu-arm] [PULL 1/6] i2c: Move bitbang_i2c.h to include/hw/i2c/
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
 Corey Minyard <cminyard@mvista.com>, qemu-devel@nongnu.org,
 BALATON Zoltan <balaton@eik.bme.hu>, qemu-arm@nongnu.org, qemu-ppc@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Hj7JEDp+wFiZ


--CE+1k2dSO48ffgeK
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 28, 2019 at 12:39:52PM +0200, Gerd Hoffmann wrote:
> From: BALATON Zoltan <balaton@eik.bme.hu>
>=20
> The bitbang i2c implementation is also useful for other device models
> such as DDC in display controllers. Move the header to include/hw/i2c/
> to allow it to be used from other device models and adjust users of
> this include. This also reverts commit 2b4c1125ac which is no longer
> needed.
>=20
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> Reviewed-by: Philippe Mathieu-Daud=E9 <philmd@redhat.com>
> Tested-by: Philippe Mathieu-Daud=E9 <philmd@redhat.com>
> Acked-by: Corey Minyard <cminyard@mvista.com>
> Message-id: 5d1fe4db846ab9be4b77ddb0d43cc74cd200a003.1561028123.git.balat=
on@eik.bme.hu
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>

ppc parts
Acked-by: David Gibson <david@gibson.dropbear.id.au>

> ---
>  {hw =3D> include/hw}/i2c/bitbang_i2c.h | 2 ++
>  include/hw/i2c/i2c.h                 | 2 --
>  include/hw/i2c/ppc4xx_i2c.h          | 2 +-
>  hw/i2c/bitbang_i2c.c                 | 2 +-
>  hw/i2c/ppc4xx_i2c.c                  | 1 -
>  hw/i2c/versatile_i2c.c               | 2 +-
>  6 files changed, 5 insertions(+), 6 deletions(-)
>  rename {hw =3D> include/hw}/i2c/bitbang_i2c.h (80%)
>=20
> diff --git a/hw/i2c/bitbang_i2c.h b/include/hw/i2c/bitbang_i2c.h
> similarity index 80%
> rename from hw/i2c/bitbang_i2c.h
> rename to include/hw/i2c/bitbang_i2c.h
> index 9443021710d7..3a7126d5dee8 100644
> --- a/hw/i2c/bitbang_i2c.h
> +++ b/include/hw/i2c/bitbang_i2c.h
> @@ -3,6 +3,8 @@
> =20
>  #include "hw/i2c/i2c.h"
> =20
> +typedef struct bitbang_i2c_interface bitbang_i2c_interface;
> +
>  #define BITBANG_I2C_SDA 0
>  #define BITBANG_I2C_SCL 1
> =20
> diff --git a/include/hw/i2c/i2c.h b/include/hw/i2c/i2c.h
> index 8e236f7bb428..75c5bd638bb9 100644
> --- a/include/hw/i2c/i2c.h
> +++ b/include/hw/i2c/i2c.h
> @@ -81,8 +81,6 @@ uint8_t i2c_recv(I2CBus *bus);
> =20
>  DeviceState *i2c_create_slave(I2CBus *bus, const char *name, uint8_t add=
r);
> =20
> -typedef struct bitbang_i2c_interface bitbang_i2c_interface;
> -
>  /* lm832x.c */
>  void lm832x_key_event(DeviceState *dev, int key, int state);
> =20
> diff --git a/include/hw/i2c/ppc4xx_i2c.h b/include/hw/i2c/ppc4xx_i2c.h
> index aa2a2bf9dec2..8437bf070b8b 100644
> --- a/include/hw/i2c/ppc4xx_i2c.h
> +++ b/include/hw/i2c/ppc4xx_i2c.h
> @@ -28,7 +28,7 @@
>  #define PPC4XX_I2C_H
> =20
>  #include "hw/sysbus.h"
> -#include "hw/i2c/i2c.h"
> +#include "hw/i2c/bitbang_i2c.h"
> =20
>  #define TYPE_PPC4xx_I2C "ppc4xx-i2c"
>  #define PPC4xx_I2C(obj) OBJECT_CHECK(PPC4xxI2CState, (obj), TYPE_PPC4xx_=
I2C)
> diff --git a/hw/i2c/bitbang_i2c.c b/hw/i2c/bitbang_i2c.c
> index 5dfc72d9d7b7..3cb0509b0200 100644
> --- a/hw/i2c/bitbang_i2c.c
> +++ b/hw/i2c/bitbang_i2c.c
> @@ -12,7 +12,7 @@
> =20
>  #include "qemu/osdep.h"
>  #include "hw/hw.h"
> -#include "bitbang_i2c.h"
> +#include "hw/i2c/bitbang_i2c.h"
>  #include "hw/sysbus.h"
>  #include "qemu/module.h"
> =20
> diff --git a/hw/i2c/ppc4xx_i2c.c b/hw/i2c/ppc4xx_i2c.c
> index d606d3dbeb81..5fb4f86c38f1 100644
> --- a/hw/i2c/ppc4xx_i2c.c
> +++ b/hw/i2c/ppc4xx_i2c.c
> @@ -30,7 +30,6 @@
>  #include "cpu.h"
>  #include "hw/hw.h"
>  #include "hw/i2c/ppc4xx_i2c.h"
> -#include "bitbang_i2c.h"
> =20
>  #define PPC4xx_I2C_MEM_SIZE 18
> =20
> diff --git a/hw/i2c/versatile_i2c.c b/hw/i2c/versatile_i2c.c
> index e07be9890c8a..24b6e36b6d52 100644
> --- a/hw/i2c/versatile_i2c.c
> +++ b/hw/i2c/versatile_i2c.c
> @@ -23,7 +23,7 @@
> =20
>  #include "qemu/osdep.h"
>  #include "hw/sysbus.h"
> -#include "bitbang_i2c.h"
> +#include "hw/i2c/bitbang_i2c.h"
>  #include "qemu/log.h"
>  #include "qemu/module.h"
> =20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--CE+1k2dSO48ffgeK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl0W8OcACgkQbDjKyiDZ
s5KPdQ/+PhIbfw8GOOh0Q6UFozYqYBCMLZGbryX+C1c39HPc9R7F+AnYLAkiZFkD
GYM4HR26SBVu/VsjSQwNX3iOcNj4QYNXigcHdZJEqBIHl8iwyEWYFAjN5vACyGm8
9cs/jxKr6qWezO+3tYtZYLX34bqHw2jIIIE7p9MuXhLpzljZiIsZ+byFh+Y0pOca
Zx3d8XZ0IGuqCm87QFhrbgk7qmUB/mtDYfHekbDQ1OxBx5h27ZUJ0Su2ljCk8RWF
w3qqetZA80gsOMbTLLycixLesZucjyU2+Ga8PDnf+r0ZflGQaICzH46KOJzI0r8/
fU0xvX5xjMDvvvFgC/4kia1hgzj9TyvibsMJxNiUJH9GIF8Y9Voawvzetj4U3uzx
6Oc6KPqN2WVun1fzZ/RKeupHUc9ETs4SRPrmUG30OFIAeCGOxD3/+R3wF/lbzsR8
I+McRBawFWcw0YuzDfU2XfSj/uMSTrVqkMi0+toZ6HrKDsYAxiFdA2uqbUkSu7zW
+ZQIAtp0qtM27PMPDqhycyWYD6FwqPfeZPXF/ugZ8jklJUF6EhXxtTYsXzR5Co/R
in6pGqT7CNgyCul0eEq23qR08h93qjNb5nr8yIKCLFUekr4gcLRmbGZOTHDKshY5
u/JGMbUyBbNKRJMDdSbUnQyyXuqlOj8dKAnsZxMxNpfXlZZ7mXc=
=4k/l
-----END PGP SIGNATURE-----

--CE+1k2dSO48ffgeK--
