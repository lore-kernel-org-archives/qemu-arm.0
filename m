Received: by 10.25.159.131 with SMTP id i125csp373987lfe;
        Wed, 30 Nov 2016 08:27:00 -0800 (PST)
X-Received: by 10.55.156.81 with SMTP id f78mr32236266qke.123.1480523220160;
        Wed, 30 Nov 2016 08:27:00 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s28si30615644qte.238.2016.11.30.08.26.59
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 30 Nov 2016 08:27:00 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:44953 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cC7ik-00027P-Vy
	for alex.bennee@linaro.org; Wed, 30 Nov 2016 11:26:59 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57949)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1cC7i2-00025i-P4
	for qemu-devel@nongnu.org; Wed, 30 Nov 2016 11:26:15 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1cC7hz-00085O-JX
	for qemu-devel@nongnu.org; Wed, 30 Nov 2016 11:26:14 -0500
Received: from 9.mo69.mail-out.ovh.net ([46.105.56.78]:38516)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1cC7hz-00084V-D8
	for qemu-devel@nongnu.org; Wed, 30 Nov 2016 11:26:11 -0500
Received: from player699.ha.ovh.net (b9.ovh.net [213.186.33.59])
	by mo69.mail-out.ovh.net (Postfix) with ESMTP id 5A6C0D224
	for <qemu-devel@nongnu.org>; Wed, 30 Nov 2016 17:26:09 +0100 (CET)
Received: from hermes.kaod.org (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
	[90.76.55.107]) (Authenticated sender: postmaster@kaod.org)
	by player699.ha.ovh.net (Postfix) with ESMTPSA id B3A7724007C;
	Wed, 30 Nov 2016 17:26:02 +0100 (CET)
To: Peter Maydell <peter.maydell@linaro.org>
References: <1480434248-27138-1-git-send-email-clg@kaod.org>
	<1480434248-27138-27-git-send-email-clg@kaod.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <afa578a1-f20f-f406-d707-eb8e66f094c9@kaod.org>
Date: Wed, 30 Nov 2016 17:26:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <1480434248-27138-27-git-send-email-clg@kaod.org>
Content-Type: text/plain; charset=utf-8
X-Ovh-Tracer-Id: 18275888763171670866
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeelfedrfeelgdekjecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 46.105.56.78
Subject: Re: [Qemu-devel] [PATCH for-2.9 26/30] aspeed/smc: use flash model
 option
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Andrew Jeffery <andrew@aj.id.au>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	qemu-arm@nongnu.org, qemu-devel@nongnu.org,
	Marcin Krzeminski <marcin.krzeminski@nokia.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: QwcOnUj+LRb1

On 11/29/2016 04:44 PM, C=C3=A9dric Le Goater wrote:
> so that we can change the flash model from the command line.

After kevin input on this topic, we should drop patch 25 and 26.

Thanks,

C.=20

> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
> Reviewed-by: Joel Stanley <joel@jms.id.au>
> ---
>  hw/arm/aspeed.c | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
> index a92c2f1c362b..f4232ce42cd0 100644
> --- a/hw/arm/aspeed.c
> +++ b/hw/arm/aspeed.c
> @@ -138,6 +138,8 @@ static void aspeed_board_init_flashes(AspeedSMCStat=
e *s, const char *flashtype,
>          DriveInfo *dinfo =3D drive_get_next(IF_MTD);
>          qemu_irq cs_line;
> =20
> +        flashtype =3D dinfo && dinfo->model ? dinfo->model : flashtype=
;
> +
>          /*
>           * FIXME: check that we are not using a flash module exceeding
>           * the controller segment size
>=20

