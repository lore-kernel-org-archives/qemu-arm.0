Received: by 10.28.71.27 with SMTP id u27csp1109905wma;
        Tue, 20 Feb 2018 05:58:05 -0800 (PST)
X-Google-Smtp-Source: AH8x225G/7NZ7Mm0K3OuXBi4Yvk/7jQ4g0+RvmP0tYWmKhU8OpFSKebypO1ggEden6at0kVRjNhd
X-Received: by 10.129.169.70 with SMTP id g67mr13136788ywh.511.1519135085544;
        Tue, 20 Feb 2018 05:58:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1519135085; cv=none;
        d=google.com; s=arc-20160816;
        b=G5i/nMfikRDWXJegYO4puCjJDWgxjze/B1uRbY6ijK8mS4D3r6frjUUq2hvj+3Zt0H
         0KQm7bCGUnTPg2jRbXNHuv5anRz8xFdxsXR3TB/VCojYLhEcSRcp460qHR5ZsHqJOaF9
         JeD9cEErgmTef0kokbMWtClXPE4ibiI2kngyFbvLKXnRpkQ7kDHbtsLxXnYeT7ACb6cD
         SWNpDTrmpppOkSk/64OixmxCY7fAsYa+dc4BZjgRztcM0kCxOH6nh1mtvjjh5F2gnUvB
         Ybw3oyBIBQ6e2c8VVltz7HD+0hqt/Y+UzsdKQS1Cfqvg0AfvYH+LkxNRI0AZonP71zOQ
         gaQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to
         :arc-authentication-results;
        bh=75pGOZKjArY0XOQdOJHQq/1lVALlhjYGbQCLR6c6LZM=;
        b=L0LnRDIETatQ4aLMLuhGh5AFd9rRJu5WmOZw+L6B+uNAN6sCtYE3oup2FIs/Evlqnb
         M4rNnhondyXLhctatmLLpNijPrABBByHHZ6dIHjlgxm1IgeGhsR4N56AmWxZkBo8Z7i4
         lkcy8WkDhNOzOYaFWcoyRqfHa6W+NAr2azuK5DS67j9q4rN/yYECGFZKHLXBi/7kXUJP
         Fkr/FwR+Z28QUE511F+Z1InLXxhJph4H6jtaAp74lb00ewAoqkI3DydAnlGahpeJ5vZe
         PzXY+mRcd8KYVrzh4sh4s1GuD5kl7ibOIXrOhpXy4zTeNQEjzaVC3gMivzJjQu5gyVxJ
         TYLA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g132si2032955ywb.554.2018.02.20.05.58.05
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 20 Feb 2018 05:58:05 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:55682 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eo8Qm-00051l-Td
	for alex.bennee@linaro.org; Tue, 20 Feb 2018 08:58:04 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50571)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1eo8QX-0004xR-Vv
	for qemu-arm@nongnu.org; Tue, 20 Feb 2018 08:57:53 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1eo8QU-0007Sz-Hq
	for qemu-arm@nongnu.org; Tue, 20 Feb 2018 08:57:49 -0500
Received: from 6.mo7.mail-out.ovh.net ([188.165.39.218]:39877)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1eo8QU-0007Lu-Al
	for qemu-arm@nongnu.org; Tue, 20 Feb 2018 08:57:46 -0500
Received: from player788.ha.ovh.net (b7.ovh.net [213.186.33.57])
	by mo7.mail-out.ovh.net (Postfix) with ESMTP id 7DBAC8FDBE
	for <qemu-arm@nongnu.org>; Tue, 20 Feb 2018 14:57:35 +0100 (CET)
Received: from zorba.kaod.org (LFbn-TOU-1-358-204.w86-206.abo.wanadoo.fr
	[86.206.19.204]) (Authenticated sender: postmaster@kaod.org)
	by player788.ha.ovh.net (Postfix) with ESMTPSA id AEA3F180098;
	Tue, 20 Feb 2018 14:57:29 +0100 (CET)
To: Hugo Landau <hlandau@devever.net>, qemu-devel@nongnu.org
References: <20180220132627.4163-1-hlandau@devever.net>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <e13f6f08-c29a-2202-014c-1911181671e2@kaod.org>
Date: Tue, 20 Feb 2018 14:57:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <20180220132627.4163-1-hlandau@devever.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Ovh-Tracer-Id: 2976316406315781035
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedtfedrgeejgdehhecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 188.165.39.218
Subject: Re: [Qemu-arm] [PATCH] Fix ast2500 protection register emulation
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
	qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: or5dBSVyyHHo

On 02/20/2018 02:26 PM, Hugo Landau wrote:
> Some register blocks of the ast2500 are protected by protection key
> registers which require the right magic value to be written to those
> registers to allow those registers to be mutated.
>=20
> Register manuals indicate that writing the correct magic value to these
> registers should cause subsequent reads from those values to return 1,
> and writing any other value should cause subsequent reads to return 0.

Yes indeed.

OpenBMC has a similar patch in its QEMU tree :=20

	https://github.com/openbmc/qemu/commit/0529fa5e5947

but this one is better.

> Previously, qemu implemented these registers incorrectly: the registers
> were handled as simple memory, meaning that writing some value x to a
> protection key register would result in subsequent reads from that
> register returning the same value x. The protection was implemented by
> ensuring that the current value of that register equaled the magic
> value.
>=20
> This modifies qemu to have the correct behaviour: attempts to write to =
a
> ast2500 protection register results in a transition to 1 or 0 depending
> on whether the written value is the correct magic. The protection logic
> is updated to ensure that the value of the register is nonzero.
>=20
> This bug caused deadlocks with u-boot HEAD: when u-boot is done with a
> protectable register block, it attempts to lock it by writing the
> bitwise inverse of the correct magic value, and then spinning forever
> until the register reads as zero. Since qemu implemented writes to thes=
e
> registers as ordinary memory writes, writing the inverse of the magic
> value resulted in subsequent reads returning that value, leading to
> u-boot spinning forever.
>=20
> Signed-off-by: Hugo Landau <hlandau@devever.net>

With a minor comment below,=20

Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>=20

I also gave it a test on an OpenBMC romulus image. Looks fine, but that's=
=20
an old custom U-Boot. Which defconfig did you use for U-Boot HEAD ?=20

> ---
>  hw/misc/aspeed_scu.c  | 6 +++++-
>  hw/misc/aspeed_sdmc.c | 8 +++++++-
>  2 files changed, 12 insertions(+), 2 deletions(-)
>=20
> diff --git a/hw/misc/aspeed_scu.c b/hw/misc/aspeed_scu.c
> index 74537ce975..5e6d5744ee 100644
> --- a/hw/misc/aspeed_scu.c
> +++ b/hw/misc/aspeed_scu.c
> @@ -191,7 +191,7 @@ static void aspeed_scu_write(void *opaque, hwaddr o=
ffset, uint64_t data,
>      }
> =20
>      if (reg > PROT_KEY && reg < CPU2_BASE_SEG1 &&
> -            s->regs[PROT_KEY] !=3D ASPEED_SCU_PROT_KEY) {
> +            !s->regs[PROT_KEY]) {
>          qemu_log_mask(LOG_GUEST_ERROR, "%s: SCU is locked!\n", __func_=
_);
>          return;
>      }
> @@ -199,6 +199,10 @@ static void aspeed_scu_write(void *opaque, hwaddr =
offset, uint64_t data,
>      trace_aspeed_scu_write(offset, size, data);
> =20
>      switch (reg) {
> +    case PROT_KEY:
> +        s->regs[reg] =3D (data =3D=3D ASPEED_SCU_PROT_KEY) ? 1 : 0;
> +        return;
> +
>      case FREQ_CNTR_EVAL:
>      case VGA_SCRATCH1 ... VGA_SCRATCH8:
>      case RNG_DATA:
> diff --git a/hw/misc/aspeed_sdmc.c b/hw/misc/aspeed_sdmc.c
> index f0b3053fae..265171ee42 100644
> --- a/hw/misc/aspeed_sdmc.c
> +++ b/hw/misc/aspeed_sdmc.c
> @@ -110,7 +110,12 @@ static void aspeed_sdmc_write(void *opaque, hwaddr=
 addr, uint64_t data,
>          return;
>      }
> =20
> -    if (addr !=3D R_PROT && s->regs[R_PROT] !=3D PROT_KEY_UNLOCK) {
> +    if (addr =3D=3D R_PROT) {
> +      s->regs[addr] =3D (data =3D=3D PROT_KEY_UNLOCK) ? 1 : 0;
> +      return;
> +    }
> +
> +    if (!s->regs[R_PROT]) {
>          qemu_log_mask(LOG_GUEST_ERROR, "%s: SDMC is locked!\n", __func=
__);
>          return;
>      }
> @@ -123,6 +128,7 @@ static void aspeed_sdmc_write(void *opaque, hwaddr =
addr, uint64_t data,
>              data &=3D ~ASPEED_SDMC_READONLY_MASK;
>              break;
>          case AST2500_A0_SILICON_REV:
> +        case AST2500_A1_SILICON_REV:

That's unrelated to the commit log, but I don't think you need to=20
resend for that.

Thanks,

C.
=20
>              data &=3D ~ASPEED_SDMC_AST2500_READONLY_MASK;
>              break;
>          default:
>=20

