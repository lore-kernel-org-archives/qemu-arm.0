Received: by 10.25.150.194 with SMTP id y185csp2514114lfd;
        Tue, 29 Nov 2016 11:17:14 -0800 (PST)
X-Received: by 10.200.54.72 with SMTP id n8mr29477095qtb.179.1480447034212;
        Tue, 29 Nov 2016 11:17:14 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f31si35620788qki.213.2016.11.29.11.17.14
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 29 Nov 2016 11:17:14 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:38908 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cBntx-0001Us-Kt
	for alex.bennee@linaro.org; Tue, 29 Nov 2016 14:17:13 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50616)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1cBntp-0001U0-PT
	for qemu-arm@nongnu.org; Tue, 29 Nov 2016 14:17:06 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1cBntm-0005hk-Ir
	for qemu-arm@nongnu.org; Tue, 29 Nov 2016 14:17:05 -0500
Received: from 9.mo69.mail-out.ovh.net ([46.105.56.78]:34674)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1cBntm-0005hB-CE
	for qemu-arm@nongnu.org; Tue, 29 Nov 2016 14:17:02 -0500
Received: from player699.ha.ovh.net (b9.ovh.net [213.186.33.59])
	by mo69.mail-out.ovh.net (Postfix) with ESMTP id CDF62C62F
	for <qemu-arm@nongnu.org>; Tue, 29 Nov 2016 20:16:59 +0100 (CET)
Received: from hermes.kaod.org (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
	[90.76.55.107]) (Authenticated sender: postmaster@kaod.org)
	by player699.ha.ovh.net (Postfix) with ESMTPSA id 5266A24006F;
	Tue, 29 Nov 2016 20:16:54 +0100 (CET)
To: qemu-devel@nongnu.org
References: <1480434248-27138-1-git-send-email-clg@kaod.org>
	<1480435656-28497-1-git-send-email-clg@kaod.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <b2a75a2d-23fd-d87c-c4b2-45987b397f26@kaod.org>
Date: Tue, 29 Nov 2016 20:16:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <1480435656-28497-1-git-send-email-clg@kaod.org>
Content-Type: text/plain; charset=utf-8
X-Ovh-Tracer-Id: 15288313362494229330
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeelfedrfeejgddvhedvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 46.105.56.78
Subject: Re: [Qemu-arm] [PATCH for-2.9 29/30] aspeed/scu: add a
 aspeed_scu_get_clk() helper
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org, Marcin Krzeminski <marcin.krzeminski@nokia.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: B/lplWeGMz+z

This is a duplicate resend. Our SMTP server had an issue and=20
the message finaly went through ...

On 11/29/2016 05:07 PM, C=C3=A9dric Le Goater wrote:
> The clock frequency is defined in the HW STRAP1 register of the SCU
> device.
>=20
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
> Reviewed-by: Joel Stanley <joel@jms.id.au>
> ---
>  hw/misc/aspeed_scu.c         | 12 ++++++++++++
>  include/hw/misc/aspeed_scu.h |  1 +
>  2 files changed, 13 insertions(+)
>=20
> diff --git a/hw/misc/aspeed_scu.c b/hw/misc/aspeed_scu.c
> index 95022d3607ad..351b8f79aca0 100644
> --- a/hw/misc/aspeed_scu.c
> +++ b/hw/misc/aspeed_scu.c
> @@ -268,6 +268,18 @@ bool is_supported_silicon_rev(uint32_t silicon_rev=
)
>      return false;
>  }
> =20
> +#define ASPEED_PLL_25MHZ    25000000
> +#define ASPEED_PLL_24MHZ    24000000
> +#define ASPEED_PLL_12MHZ    12000000
> +
> +uint32_t aspeed_scu_get_clk(AspeedSCUState *scu)
> +{
> +    if (scu->hw_strap1 & AST2400_CLK_25M_IN)
> +        return ASPEED_PLL_25MHZ;
> +    else
> +        return ASPEED_PLL_24MHZ;
> +}
> +
>  static void aspeed_scu_realize(DeviceState *dev, Error **errp)
>  {
>      SysBusDevice *sbd =3D SYS_BUS_DEVICE(dev);
> diff --git a/include/hw/misc/aspeed_scu.h b/include/hw/misc/aspeed_scu.=
h
> index bd4ac013f997..067f9f01819d 100644
> --- a/include/hw/misc/aspeed_scu.h
> +++ b/include/hw/misc/aspeed_scu.h
> @@ -37,6 +37,7 @@ typedef struct AspeedSCUState {
>  #define AST2500_A1_SILICON_REV   0x04010303U
> =20
>  extern bool is_supported_silicon_rev(uint32_t silicon_rev);
> +extern uint32_t aspeed_scu_get_clk(AspeedSCUState *scu);
> =20
>  /*
>   * Extracted from Aspeed SDK v00.03.21. Fixes and extra definitions
>=20

