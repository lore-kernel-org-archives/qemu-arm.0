Received: by 10.25.208.194 with SMTP id h185csp703013lfg;
        Fri, 22 Apr 2016 04:22:55 -0700 (PDT)
X-Received: by 10.140.105.182 with SMTP id c51mr992255qgf.78.1461324175158;
        Fri, 22 Apr 2016 04:22:55 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j40si3187488qkh.218.2016.04.22.04.22.54
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 22 Apr 2016 04:22:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@microsoft.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=microsoft.com
Received: from localhost ([::1]:59517 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1atZAk-0006ch-Id
	for alex.bennee@linaro.org; Fri, 22 Apr 2016 07:22:54 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57498)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>) id 1atZAh-0006a3-Iu
	for qemu-arm@nongnu.org; Fri, 22 Apr 2016 07:22:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>) id 1atZAd-0003gM-Hm
	for qemu-arm@nongnu.org; Fri, 22 Apr 2016 07:22:51 -0400
Received: from mail-bn1bon0142.outbound.protection.outlook.com
	([157.56.111.142]:44000
	helo=na01-bn1-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>)
	id 1atZAd-0003gH-BF; Fri, 22 Apr 2016 07:22:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
	s=selector1; h=From:To:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=chFRjkHAq36GNTOcU4NlZMGjmHJUUUAcsg+LYRjqbmk=;
	b=j0Rcf2TINnBSxxtGTMRH7qtP5NIYApb0llHcvEoHd74hH+AOEEtLd9L74lMYSd2bs1Y9kRp9hRx3b2lWI0vS82A+KEMQFXa/FuRofPrkzyCWa2tyu55/CY7uv1xZOz9fIRqTnStk08wWjqs3g2Nkk7MBRRNnuLkxShk6MQ8nIhg=
Received: from BLUPR0301MB2034.namprd03.prod.outlook.com (10.164.22.24) by
	BLUPR0301MB2034.namprd03.prod.outlook.com (10.164.22.24) with Microsoft
	SMTP Server (TLS) id 15.1.466.19; Fri, 22 Apr 2016 11:22:44 +0000
Received: from BLUPR0301MB2034.namprd03.prod.outlook.com ([10.164.22.24]) by
	BLUPR0301MB2034.namprd03.prod.outlook.com ([10.164.22.24]) with mapi id
	15.01.0466.023; Fri, 22 Apr 2016 11:22:44 +0000
From: Andrew Baumann <Andrew.Baumann@microsoft.com>
To: Sylvain Garrigues <sylvain@sylvaingarrigues.com>, Peter Maydell
	<peter.maydell@linaro.org>, Eric Blake <eblake@redhat.com>,
	Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>
Thread-Topic: [Qemu-devel] [PATCH] bcm2835_property: use cached values when
	querying framebuffer
Thread-Index: AQHRm7rAwTQCsYYe8ka5xOiKXwkpeJ+V2eUQ
Date: Fri, 22 Apr 2016 11:22:44 +0000
Message-ID: <BLUPR0301MB20342C97DD66FA58E3462B889E6F0@BLUPR0301MB2034.namprd03.prod.outlook.com>
References: <1461235306-3393-1-git-send-email-sylvain@sylvaingarrigues.com>
In-Reply-To: <1461235306-3393-1-git-send-email-sylvain@sylvaingarrigues.com>
Accept-Language: en-AU, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: sylvaingarrigues.com; dkim=none (message not signed)
	header.d=none;sylvaingarrigues.com; dmarc=none action=none
	header.from=microsoft.com;
x-originating-ip: [82.50.189.71]
x-ms-office365-filtering-correlation-id: c2c3aed6-5f24-4bc3-003c-08d36aa06d13
x-microsoft-exchange-diagnostics: 1; BLUPR0301MB2034;
	5:gaAJvzOBhmJDOdt+1r9G8jfktjara9wV08fI1hhNSLbuJgag/ufGmoxOEfMJpcez05KROi980XJvSrFAG+07UfHFTNlw6u3suuzOJ2jCj7+uUA8jCZDLle1ijGUOhOEQsOn7o+qozVEi9YlYcGXO+Gn1QpR8CtDKiRxetGfUyXjDKCGvzT+APgJVRYGjniAY;
	24:nyKqlW2N0CKAWUQ0lESyTvjixEowauVvvmClvJkZ/XvFZlTzteKcKrK5Vzq/q0Jr28qq4Lrt0yTbhdQIfyh2HoArTl31V8oA3cwpD3ayqFU=;
	7:XsQVc5fhwJ5nhiARi02nUbrKTSpWgzgd/OP1tzWOh1h+p0pE23v81Y8KImw41CohMLp12pj9RTVJn9VfnMaxtx4xpk8dGFkUkjDNbJRStn6lAbMOwQDrnKuYfhd5mZ3DjZrad6CzVjQraN8Rc7M/LQNPyDSk4MtkNuXuC3Ow4wHxltlK6YeLJSJ2GKrKRCK/g+bGM7GYYsVllqkxa2cF1vnX77Z6YgtAOWZOiHwW070v2YeQdjMFN3dDS1zBdS0d
x-microsoft-antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:BLUPR0301MB2034;
x-microsoft-antispam-prvs: <BLUPR0301MB2034AA67E185839D4806C00D9E6F0@BLUPR0301MB2034.namprd03.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:;
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(9101521026)(61425038)(601004)(2401047)(8121501046)(5005006)(3002001)(10201501046)(6055026)(61426038)(61427038);
	SRVR:BLUPR0301MB2034; BCL:0; PCL:0; RULEID:;
	SRVR:BLUPR0301MB2034; 
x-forefront-prvs: 0920602B08
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(6009001)(4326007)(5002640100001)(81166005)(2501003)(77096005)(87936001)(189998001)(5001770100001)(1220700001)(74316001)(1096002)(5003600100002)(5004730100002)(122556002)(50986999)(86362001)(86612001)(10400500002)(11100500001)(92566002)(3280700002)(3660700001)(5005710100001)(10290500002)(2900100001)(2950100001)(10090500001)(76176999)(54356999)(33656002)(66066001)(5008740100001)(9686002)(106116001)(3846002)(2906002)(19580395003)(102836003)(586003)(19580405001)(6116002)(15760500001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BLUPR0301MB2034;
	H:BLUPR0301MB2034.namprd03.prod.outlook.com; FPR:; SPF:None;
	MLV:sfv; LANG:en; 
spamdiagnosticoutput: 1:23
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Apr 2016 11:22:44.5239 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLUPR0301MB2034
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8
X-Received-From: 157.56.111.142
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH] bcm2835_property: use cached
 values when querying framebuffer
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
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: u2WxH6ZzKWdv

> From: Qemu-devel [mailto:qemu-devel-
> bounces+andrew.baumann=3Dmicrosoft.com@nongnu.org] On Behalf Of Sylvain
> Garrigues
> Sent: Thursday, 21 April 2016 12:42
>=20
> As the framebuffer settings are copied into the result message before it =
is
> reconfigured, inconsistent behavior can happen when, for instance, you se=
t
> with a sinle message the width, height, and depth, and ask at the same ti=
me to
> allocate the buffer and get the pitch and the size.
>=20
> In this case, the reported pitch and size would be incorrect as they were
> computed with the initial values of width, height and depth, not the ones=
 the
> client requested.
>=20
> Signed-off-by: Sylvain Garrigues <sylvain@sylvaingarrigues.com>
> ---
>  hw/misc/bcm2835_property.c | 31 ++++++++++++++++++++++---------
>  1 file changed, 22 insertions(+), 9 deletions(-)
>=20
> diff --git a/hw/misc/bcm2835_property.c b/hw/misc/bcm2835_property.c
> index 530411f..0102144 100644
> --- a/hw/misc/bcm2835_property.c
> +++ b/hw/misc/bcm2835_property.c
> @@ -21,6 +21,7 @@ static void
> bcm2835_property_mbox_push(BCM2835PropertyState *s, uint32_t value)
>      int n;
>      uint32_t offset, length, color;
>      uint32_t xres, yres, xoffset, yoffset, bpp, pixo, alpha;
> +    uint32_t tmp_xres, tmp_yres, tmp_xoffset, tmp_yoffset, tmp_bpp,
> + tmp_pixo, tmp_alpha;
>      uint32_t *newxres =3D NULL, *newyres =3D NULL, *newxoffset =3D NULL,
>          *newyoffset =3D NULL, *newbpp =3D NULL, *newpixo =3D NULL, *newa=
lpha =3D
> NULL;
>=20
> @@ -139,7 +140,10 @@ static void
> bcm2835_property_mbox_push(BCM2835PropertyState *s, uint32_t value)
>=20
>          case 0x00040001: /* Allocate buffer */
>              stl_le_phys(&s->dma_as, value + 12, s->fbdev->base);
> -            stl_le_phys(&s->dma_as, value + 16, s->fbdev->size);
> +            tmp_xres =3D newxres !=3D NULL ? *newxres : s->fbdev->xres;
> +            tmp_yres =3D newyres !=3D NULL ? *newyres : s->fbdev->yres;
> +            tmp_bpp =3D newbpp !=3D NULL ? *newbpp : s->fbdev->bpp;
> +            stl_le_phys(&s->dma_as, value + 16, tmp_xres * tmp_yres *
> + (tmp_bpp >> 3));

Personal style nit: I prefer * 8 rather than >> 3, because it's more immedi=
ately obvious what you're computing, a trivial optimisation for the compile=
r, and in this specific example wouldn't need the brackets to ensure the co=
rrect operator precedence.

But in any case,
Reviewed-by: Andrew Baumann <Andrew.Baumann@microsoft.com>

Thanks,
Andrew
