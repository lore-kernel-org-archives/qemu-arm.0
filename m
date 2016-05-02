Received: by 10.25.208.137 with SMTP id h131csp1366696lfg;
        Mon, 2 May 2016 16:46:07 -0700 (PDT)
X-Received: by 10.140.237.79 with SMTP id i76mr21718005qhc.43.1462232766902;
        Mon, 02 May 2016 16:46:06 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r84si330184qhr.96.2016.05.02.16.46.06
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 02 May 2016 16:46:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:39062 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1axNXC-0004uA-A6
	for alex.bennee@linaro.org; Mon, 02 May 2016 19:45:50 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39606)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sylgar@gmail.com>) id 1axLIN-0005u3-6T
	for qemu-arm@nongnu.org; Mon, 02 May 2016 17:22:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sylgar@gmail.com>) id 1axLIB-0002wI-39
	for qemu-arm@nongnu.org; Mon, 02 May 2016 17:22:17 -0400
Received: from mail-wm0-x232.google.com ([2a00:1450:400c:c09::232]:35895)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sylgar@gmail.com>)
	id 1axLI9-0002mo-N2; Mon, 02 May 2016 17:22:11 -0400
Received: by mail-wm0-x232.google.com with SMTP id n129so123236882wmn.1;
	Mon, 02 May 2016 14:21:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=N3VGTRJndXWZJvD26IaGhk1D71F70v3RhQlSAa+n2E8=;
	b=tY8sIqTJyyoUrLEq6legJ0wfug4MoJhWJ9jhfevMOZ56wBSZP80UAue1J7Atk1Kapd
	OleP6q6xotrhD3eZMfXhoT5Wm+i+3Pkpg3yJB1E1JI1aocn0dUN2TkTv/vHlZqBIP8rB
	Dr7f/QpsyXhY14l9nsaXaKjW+EREwsBzi8iIfZ5TCc1dCyXiShrggB9qmiSI95CyIV7A
	IjCJbPjWuyQNNDRXHaJ7ecZ8RDL1fCV+wgyWZbGOvcRFw9K6eQzA/9jCqI7vmsQj+cil
	JykjAhHGbF31xqOeUmSYgG7FT8IHS5OjW6MDOCbr1m+dR5jK4ugdY9OQt/ztS1sv7vw7
	P9jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=N3VGTRJndXWZJvD26IaGhk1D71F70v3RhQlSAa+n2E8=;
	b=KDoo0cjaBkp+69r9s5nmHU59ZbLX6NvwKpjgiB3N6BvugWg5YWvXasXyTpZsOHKd1h
	pDO1an0RhkWkAS83cocjisuJsUamHKV7PrRvXqK0OrsYTfAOLP+GqXOjnbf/eypiegJQ
	6dedHuRSx90ytuR0/06Y+ehSLoFTVxHUrLOHC7/IUjTh0Fmwjm0GzaUXn+EEZaykuG4l
	k//m1aUOjAdgDad1ArSm+y4BK2WxAK/KWFXM3X8ElwOnxZJABFmWecQpziKUvgd0KLMI
	0zh9tpVaFx+HS/KTi74M40vmp/j1SZt3EqKvSFEN0P/leH2qj82cNeZo/PC5Vp6Bql6r
	G8eA==
X-Gm-Message-State: AOPr4FXzfTg/iyK28ohbaw/OvseO46Td5N/eZY3/pSwAkmrMMWxiAjGlw02zPzrD/T3QaQ==
X-Received: by 10.28.47.206 with SMTP id v197mr21484558wmv.87.1462224094223;
	Mon, 02 May 2016 14:21:34 -0700 (PDT)
Received: from [192.168.0.103] (31-13-84.netrun.cytanet.com.cy. [31.153.13.84])
	by smtp.gmail.com with ESMTPSA id s10sm146711wjp.3.2016.05.02.14.21.32
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 02 May 2016 14:21:32 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (1.0)
From: Sylvain Garrigues <sylgar@gmail.com>
X-Mailer: iPad Mail (13E238)
In-Reply-To: <1461325343-24995-1-git-send-email-sylvain@sylvaingarrigues.com>
Date: Tue, 3 May 2016 00:21:31 +0300
Content-Transfer-Encoding: quoted-printable
Message-Id: <1B088DF8-FDE6-49AE-8C12-BA60B4D20BF6@gmail.com>
References: <1461325343-24995-1-git-send-email-sylvain@sylvaingarrigues.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::232
X-Mailman-Approved-At: Mon, 02 May 2016 19:45:49 -0400
Subject: Re: [Qemu-arm] [PATCH] bcm2835_property: use cached values when
 querying framebuffer
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	Eric Blake <eblake@redhat.com>,
	Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Mrh4hxQHSbaK

Hello,

Shall we commit this patch?

Very best,
Sylvain


> Le 22 avr. 2016 =C3=A0 14:42, Sylvain Garrigues <sylvain@sylvaingarrigues.=
com> a =C3=A9crit :
>=20
> As the framebuffer settings are copied into the result message before it i=
s
> reconfigured, inconsistent behavior can happen when, for instance, you set=
 with
> a single message the width, height, and depth, and ask at the same time to=

> allocate the buffer and get the pitch and the size.
>=20
> In this case, the reported pitch and size would be incorrect as they were
> computed with the initial values of width, height and depth, not the ones t=
he
> client requested.
>=20
> Signed-off-by: Sylvain Garrigues <sylvain@sylvaingarrigues.com>
> Reviewed-by: Andrew Baumann <Andrew.Baumann@microsoft.com>
> ---
> hw/misc/bcm2835_property.c | 31 ++++++++++++++++++++++---------
> 1 file changed, 22 insertions(+), 9 deletions(-)
>=20
> diff --git a/hw/misc/bcm2835_property.c b/hw/misc/bcm2835_property.c
> index 530411f..96e3b8f 100644
> --- a/hw/misc/bcm2835_property.c
> +++ b/hw/misc/bcm2835_property.c
> @@ -21,6 +21,7 @@ static void bcm2835_property_mbox_push(BCM2835PropertySt=
ate *s, uint32_t value)
>     int n;
>     uint32_t offset, length, color;
>     uint32_t xres, yres, xoffset, yoffset, bpp, pixo, alpha;
> +    uint32_t tmp_xres, tmp_yres, tmp_xoffset, tmp_yoffset, tmp_bpp, tmp_p=
ixo, tmp_alpha;
>     uint32_t *newxres =3D NULL, *newyres =3D NULL, *newxoffset =3D NULL,
>         *newyoffset =3D NULL, *newbpp =3D NULL, *newpixo =3D NULL, *newalp=
ha =3D NULL;
>=20
> @@ -139,7 +140,10 @@ static void bcm2835_property_mbox_push(BCM2835Propert=
yState *s, uint32_t value)
>=20
>         case 0x00040001: /* Allocate buffer */
>             stl_le_phys(&s->dma_as, value + 12, s->fbdev->base);
> -            stl_le_phys(&s->dma_as, value + 16, s->fbdev->size);
> +            tmp_xres =3D newxres !=3D NULL ? *newxres : s->fbdev->xres;
> +            tmp_yres =3D newyres !=3D NULL ? *newyres : s->fbdev->yres;
> +            tmp_bpp =3D newbpp !=3D NULL ? *newbpp : s->fbdev->bpp;
> +            stl_le_phys(&s->dma_as, value + 16, tmp_xres * tmp_yres * tmp=
_bpp / 8);
>             resplen =3D 8;
>             break;
>         case 0x00048001: /* Release buffer */
> @@ -150,8 +154,10 @@ static void bcm2835_property_mbox_push(BCM2835Propert=
yState *s, uint32_t value)
>             break;
>         case 0x00040003: /* Get display width/height */
>         case 0x00040004:
> -            stl_le_phys(&s->dma_as, value + 12, s->fbdev->xres);
> -            stl_le_phys(&s->dma_as, value + 16, s->fbdev->yres);
> +            tmp_xres =3D newxres !=3D NULL ? *newxres : s->fbdev->xres;
> +            tmp_yres =3D newyres !=3D NULL ? *newyres : s->fbdev->yres;
> +            stl_le_phys(&s->dma_as, value + 12, tmp_xres);
> +            stl_le_phys(&s->dma_as, value + 16, tmp_yres);
>             resplen =3D 8;
>             break;
>         case 0x00044003: /* Test display width/height */
> @@ -167,7 +173,8 @@ static void bcm2835_property_mbox_push(BCM2835Property=
State *s, uint32_t value)
>             resplen =3D 8;
>             break;
>         case 0x00040005: /* Get depth */
> -            stl_le_phys(&s->dma_as, value + 12, s->fbdev->bpp);
> +            tmp_bpp =3D newbpp !=3D NULL ? *newbpp : s->fbdev->bpp;
> +            stl_le_phys(&s->dma_as, value + 12, tmp_bpp);
>             resplen =3D 4;
>             break;
>         case 0x00044005: /* Test depth */
> @@ -179,7 +186,8 @@ static void bcm2835_property_mbox_push(BCM2835Property=
State *s, uint32_t value)
>             resplen =3D 4;
>             break;
>         case 0x00040006: /* Get pixel order */
> -            stl_le_phys(&s->dma_as, value + 12, s->fbdev->pixo);
> +            tmp_pixo =3D newpixo !=3D NULL ? *newpixo : s->fbdev->pixo;
> +            stl_le_phys(&s->dma_as, value + 12, tmp_pixo);
>             resplen =3D 4;
>             break;
>         case 0x00044006: /* Test pixel order */
> @@ -191,7 +199,8 @@ static void bcm2835_property_mbox_push(BCM2835Property=
State *s, uint32_t value)
>             resplen =3D 4;
>             break;
>         case 0x00040007: /* Get alpha */
> -            stl_le_phys(&s->dma_as, value + 12, s->fbdev->alpha);
> +            tmp_alpha =3D newalpha !=3D NULL ? *newalpha : s->fbdev->alph=
a;
> +            stl_le_phys(&s->dma_as, value + 12, tmp_alpha);
>             resplen =3D 4;
>             break;
>         case 0x00044007: /* Test pixel alpha */
> @@ -203,12 +212,16 @@ static void bcm2835_property_mbox_push(BCM2835Proper=
tyState *s, uint32_t value)
>             resplen =3D 4;
>             break;
>         case 0x00040008: /* Get pitch */
> -            stl_le_phys(&s->dma_as, value + 12, s->fbdev->pitch);
> +            tmp_xres =3D newxres !=3D NULL ? *newxres : s->fbdev->xres;
> +            tmp_bpp =3D newbpp !=3D NULL ? *newbpp : s->fbdev->bpp;
> +            stl_le_phys(&s->dma_as, value + 12, tmp_xres * tmp_bpp / 8);
>             resplen =3D 4;
>             break;
>         case 0x00040009: /* Get virtual offset */
> -            stl_le_phys(&s->dma_as, value + 12, s->fbdev->xoffset);
> -            stl_le_phys(&s->dma_as, value + 16, s->fbdev->yoffset);
> +            tmp_xoffset =3D newxoffset !=3D NULL ? *newxoffset : s->fbdev=
->xoffset;
> +            tmp_yoffset =3D newyoffset !=3D NULL ? *newyoffset : s->fbdev=
->yoffset;
> +            stl_le_phys(&s->dma_as, value + 12, tmp_xoffset);
> +            stl_le_phys(&s->dma_as, value + 16, tmp_yoffset);
>             resplen =3D 8;
>             break;
>         case 0x00044009: /* Test virtual offset */
> --=20
> 2.8.1
>=20
