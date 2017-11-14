Received: by 10.223.150.237 with SMTP id u100csp3026455wrb;
        Mon, 13 Nov 2017 16:34:56 -0800 (PST)
X-Google-Smtp-Source: AGs4zMYyiQsidGYIfN7PrLl3dOh7o6Tphh694xu3mFMxUfjqcD3HO0aZagcIIcF+sWa72E0n7QNe
X-Received: by 10.129.155.130 with SMTP id s124mr7503061ywg.302.1510619696735;
        Mon, 13 Nov 2017 16:34:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1510619696; cv=none;
        d=google.com; s=arc-20160816;
        b=QZ6VAYPMErMMJp5zKdVWfmJy4LeITxUq+xhOSPGM/bYKkRWQoSD+cBx7ytXvH/8y5a
         S9XMxG1eTSvClUClVGg7OrOZwXwyYxYCeZLzvDYhticXF3iMXOfSno4NXqs01vnx63EO
         dK/muc8xufJKarxwnjNSRZEUw/9Zi8QrpoQ2sQBEHRlIKx0hFb0o8JCcdq+eDwQbZMsb
         3hCE+UMQ5dAA/yu/CzvjXlg+ZMTJ5sFaXLuUZs8xFyC47AGmvO1IsyzqPhjCQQ+XeVNS
         VpjbYbTKewI/6TID0SYetT8hv0E+a8HmusH/btrCy7SVvtbM3mHTefZM2uvEQzkF6T8U
         N7JQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version:references
         :in-reply-to:date:to:from:message-id:dkim-signature:dkim-signature
         :arc-authentication-results;
        bh=eE1Nt6bZPwp57wx6oSPTXnMLWGzCop2jWYp1SkkWe0U=;
        b=UWwKrKxqMIl89afQ/yy+Olsp+Qg9gS/Hq2MnsQZAidp+8PJMfATYdZlglNG9WcbyFv
         sbrbLY1xMo4m54bHwBcOxOwzOLiQRDKcFvj1e4hnQddLMxn9qWBYpUzf8Dksfe7g6Uy4
         bh+CqQsK+uEU8Lnam3TXqt6bqagL8pjf4rMlS/UYtV5xzse9E/4G44MisUMjWT0HWe6S
         1it3uGYR9TEunr0GGBH+KhiZB5cZGTZ+xpDEk+YUyuY8ctlEgQCpB6WGBkyKE0Y72dyo
         97YWgt5SCZou6ym3WAr9c17cF9MIAJjJgmSz1Y4FEuHU6ajezyejR1S4nHrkJOPSOOPG
         vXHg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@aj.id.au header.s=fm1 header.b=X/srdm3c;
       dkim=fail header.i=@messagingengine.com header.s=fm1 header.b=TX0fCGPB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e11si3663474ybe.244.2017.11.13.16.34.56
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 13 Nov 2017 16:34:56 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@aj.id.au header.s=fm1 header.b=X/srdm3c;
       dkim=fail header.i=@messagingengine.com header.s=fm1 header.b=TX0fCGPB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:57064 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eEPBo-0002df-5M
	for alex.bennee@linaro.org; Mon, 13 Nov 2017 19:34:56 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45789)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew@aj.id.au>) id 1eEPBe-0002cK-D2
	for qemu-arm@nongnu.org; Mon, 13 Nov 2017 19:34:48 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andrew@aj.id.au>) id 1eEPBZ-0003vT-Ei
	for qemu-arm@nongnu.org; Mon, 13 Nov 2017 19:34:46 -0500
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:41607)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <andrew@aj.id.au>)
	id 1eEPBZ-0003u8-1l; Mon, 13 Nov 2017 19:34:41 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id 3E1B020A83;
	Mon, 13 Nov 2017 19:34:39 -0500 (EST)
Received: from frontend2 ([10.202.2.161])
	by compute4.internal (MEProxy); Mon, 13 Nov 2017 19:34:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; bh=eE1Nt6bZPwp57wx6oSPTXnMLWGzCop2jWYp1SkkWe0U=; b=X/srdm3c
	E+W2rL+Wz/ZDU8+fgmFAiyim6N25KSHPXIxDYb8eoOOjTAtPy90ADx4PW2u49tu1
	Xv4gZhPk271DbouoKtKGnuiXOTnEtyzuwybKXmeCT5os5MaIaYzH8J1psNzNIni9
	0ogAu8KxuvUEJw3GWwVHp2i9uqAI67+hdtAqSuQ2Ajc+b7MG8pNoDKSGOzpMn6nx
	f462H6mdstEXnidxcy7L1c1Kb3oob3UXtmn9Biih94jim6MhzLus09fVQchqOlbj
	UBMqm+RLtQmTECsrVCNIjCiSm5gX6ZizqGwQY0+HN9/EjbpuR5YFaCxcsH3vOR3A
	8I/jEs22UC9JPQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm1; bh=eE1Nt6bZPwp57wx6oSPTXnMLWGzCo
	p2jWYp1SkkWe0U=; b=TX0fCGPBT72kCaB4py+5uF5hhA+x/LOdRjtHghC1HD/Dj
	FmXysPPF3AdcqK38/DErC5AelmcqQRkplQUIS3JLqHW5X8IelbSaHxYLSZ+IpVSS
	ecyB7dDloD5X77ldmp1OMM2xPgJCE5CzquwQcsP620h/PDoZkqNECD1aNPffYyNY
	6mVn7tfX7+s+o8c6RbmW283CLL9/Q6Z27ukJd6r8QNoY7+zNF5h4cUHgDzpLNzUq
	/9hlkk+cPbdX1kebr42xlmfPZOWkLmGpZgl5fm8+aFHk9x7PR9L/KeQ+lO/q7Dtk
	dcIO9w5o1vbfXEIlPwt0kqqH1IyRpkkTbOLeSOBDg==
X-ME-Sender: <xms:HzoKWqfdrAu-0v9JLZ3GGVDyjWB5YxETxwtG8YMWSjprABJU-iCJKA>
Received: from dave (unknown [203.0.153.9])
	by mail.messagingengine.com (Postfix) with ESMTPA id EA0CB241BE;
	Mon, 13 Nov 2017 19:34:36 -0500 (EST)
Message-ID: <1510619669.4287.82.camel@aj.id.au>
From: Andrew Jeffery <andrew@aj.id.au>
To: Joel Stanley <joel@jms.id.au>, Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 14 Nov 2017 11:04:29 +1030
In-Reply-To: <20171113132801.8562-1-joel@jms.id.au>
References: <20171113132801.8562-1-joel@jms.id.au>
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-5ZHCzvozudbOoeAxO8cJ"
X-Mailer: Evolution 3.26.1-1 
Mime-Version: 1.0
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.111.4.28
Subject: Re: [Qemu-arm] [PATCH v2] hw/arm/aspeed: Unlock SCU when running
 kernel
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org,
	=?ISO-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: VvKWLbu1aEap


--=-5ZHCzvozudbOoeAxO8cJ
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2017-11-13 at 23:58 +1030, Joel Stanley wrote:
> The ASPEED hardware contains a lock register for the SCU that disables
> any writes to the SCU when it is locked. The machine comes up with the
> lock enabled, but on all known hardware u-boot will unlock it and leave
> it unlocked when loading the kernel.
>=20
> This means the kernel expects the SCU to be unlocked. When booting from
> an emulated ROM the normal u-boot unlock path is executed. Things don't
> go well when booting using the -kernel command line, as u-boot does not
> run first.
>=20
> Change behaviour so that when a kernel is passed to the machine, set the
> reset value of the SCU to be unlocked.
>=20
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
> v2:
>  - use the correct value for the key
>  - rename it ASPEED_SCU_PROT_KEY
> ---
>  hw/arm/aspeed.c              | 10 ++++++++++
>  hw/arm/aspeed_soc.c          |  2 ++
>  hw/misc/aspeed_scu.c         |  5 +++--
>  include/hw/misc/aspeed_scu.h |  3 +++
>  4 files changed, 18 insertions(+), 2 deletions(-)
>=20
> diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
> index ab895ad490af..754df8403273 100644
> --- a/hw/arm/aspeed.c
> +++ b/hw/arm/aspeed.c
> @@ -36,6 +36,7 @@ typedef struct AspeedBoardState {
>  typedef struct AspeedBoardConfig {
>      const char *soc_name;
>      uint32_t hw_strap1;
> +    uint32_t hw_prot_key;

It doesn't seem like this member is used?

With respect to the patch as a whole, I was planning to implement a
small kernel driver for the SCU to unlock it on probe but never got
around to it. However, this seems reasonable; I always worked around it
locally in a much more hacky fashion. It would be handy to have an
upstream solution.

Andrew

>      const char *fmc_model;
>      const char *spi_model;
>      uint32_t num_cs;
> @@ -186,6 +187,15 @@ static void aspeed_board_init(MachineState *machine,
>                              &error_abort);
>      object_property_set_int(OBJECT(&bmc->soc), cfg->num_cs, "num-cs",
>                              &error_abort);
> +    if (machine->kernel_filename) {
> +        /*
> +         * When booting with a -kernel command line there is no u-boot
> +         * that runs to unlock the SCU. In this case set the default to
> +         * be unlocked as the kernel expects
> +         */
> +        object_property_set_int(OBJECT(&bmc->soc), ASPEED_SCU_PROT_KEY,
> +                                "hw-prot-key", &error_abort);
> +    }
>      object_property_set_bool(OBJECT(&bmc->soc), true, "realized",
>                               &error_abort);
> =20
> diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c
> index 5aa3d2ddd9cd..c83b7e207b86 100644
> --- a/hw/arm/aspeed_soc.c
> +++ b/hw/arm/aspeed_soc.c
> @@ -154,6 +154,8 @@ static void aspeed_soc_init(Object *obj)
>                                "hw-strap1", &error_abort);
>      object_property_add_alias(obj, "hw-strap2", OBJECT(&s->scu),
>                                "hw-strap2", &error_abort);
> +    object_property_add_alias(obj, "hw-prot-key", OBJECT(&s->scu),
> +                              "hw-prot-key", &error_abort);
> =20
>      object_initialize(&s->fmc, sizeof(s->fmc), sc->info->fmc_typename);
>      object_property_add_child(obj, "fmc", OBJECT(&s->fmc), NULL);
> diff --git a/hw/misc/aspeed_scu.c b/hw/misc/aspeed_scu.c
> index 95022d3607ad..74537ce9755d 100644
> --- a/hw/misc/aspeed_scu.c
> +++ b/hw/misc/aspeed_scu.c
> @@ -85,7 +85,6 @@
>  #define BMC_REV              TO_REG(0x19C)
>  #define BMC_DEV_ID           TO_REG(0x1A4)
> =20
> -#define PROT_KEY_UNLOCK 0x1688A8A8
>  #define SCU_IO_REGION_SIZE 0x1000
> =20
>  static const uint32_t ast2400_a0_resets[ASPEED_SCU_NR_REGS] =3D {
> @@ -192,7 +191,7 @@ static void aspeed_scu_write(void *opaque, hwaddr off=
set, uint64_t data,
>      }
> =20
>      if (reg > PROT_KEY && reg < CPU2_BASE_SEG1 &&
> -            s->regs[PROT_KEY] !=3D PROT_KEY_UNLOCK) {
> +            s->regs[PROT_KEY] !=3D ASPEED_SCU_PROT_KEY) {
>          qemu_log_mask(LOG_GUEST_ERROR, "%s: SCU is locked!\n", __func__)=
;
>          return;
>      }
> @@ -246,6 +245,7 @@ static void aspeed_scu_reset(DeviceState *dev)
>      s->regs[SILICON_REV] =3D s->silicon_rev;
>      s->regs[HW_STRAP1] =3D s->hw_strap1;
>      s->regs[HW_STRAP2] =3D s->hw_strap2;
> +    s->regs[PROT_KEY] =3D s->hw_prot_key;
>  }
> =20
>  static uint32_t aspeed_silicon_revs[] =3D {
> @@ -299,6 +299,7 @@ static Property aspeed_scu_properties[] =3D {
>      DEFINE_PROP_UINT32("silicon-rev", AspeedSCUState, silicon_rev, 0),
>      DEFINE_PROP_UINT32("hw-strap1", AspeedSCUState, hw_strap1, 0),
>      DEFINE_PROP_UINT32("hw-strap2", AspeedSCUState, hw_strap2, 0),
> +    DEFINE_PROP_UINT32("hw-prot-key", AspeedSCUState, hw_prot_key, 0),
>      DEFINE_PROP_END_OF_LIST(),
>  };
> =20
> diff --git a/include/hw/misc/aspeed_scu.h b/include/hw/misc/aspeed_scu.h
> index bd4ac013f997..d70cc0aeca61 100644
> --- a/include/hw/misc/aspeed_scu.h
> +++ b/include/hw/misc/aspeed_scu.h
> @@ -29,6 +29,7 @@ typedef struct AspeedSCUState {
>      uint32_t silicon_rev;
>      uint32_t hw_strap1;
>      uint32_t hw_strap2;
> +    uint32_t hw_prot_key;
>  } AspeedSCUState;
> =20
>  #define AST2400_A0_SILICON_REV   0x02000303U
> @@ -38,6 +39,8 @@ typedef struct AspeedSCUState {
> =20
>  extern bool is_supported_silicon_rev(uint32_t silicon_rev);
> =20
> +#define ASPEED_SCU_PROT_KEY      0x1688A8A8
> +
>  /*
>   * Extracted from Aspeed SDK v00.03.21. Fixes and extra definitions
>   * were added.
--=-5ZHCzvozudbOoeAxO8cJ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJaCjoVAAoJEJ0dnzgO5LT5+DIP/11mzFbN5rP6szkwl+V9jR/I
8HtF+PkLshbGm67+lB8HFv0D5SsoPKjp3J6KT784VLWd5jyIWmP3U0KSIFOKDwY/
B4cvPuzbx4Hf4jt9HGj9VNWiw+BGoW9Xkqc4+d2MWkfZioOraXt4btvHxjP3Dg8t
cdfMytXN1bTC0sPo2IX3+kh+KE4l2RZ+OENOSlPp4JC7yi8kl1cuB5/4EFUuRDvT
0VDjhzb/1MhfKnufDvk0uzeSoaX42DWV5TjM417KLutHooe3XyDGZ55cbJY+8qc2
71P4saKpjxPolidoo7UOF9Wwx6zDbTR+iPqyKPgz8cL7yzaKX5/toC7ouAbvHsGn
LbCQbMUC0ka7HJweKlk604sqjr+GSOibS+vnI/4gN2rB4gejdJ3SSuCLOmCHscxM
HzRs1OjALX8kShWxdTuTBiFHCqa8xVEpEMGUmw3TwZIQcfZHnXNLGSRu0xt7HWKo
Yfu6h7ICa0qqZkXWaq8rzsUxvdCqT9vxWOYxU5yzCxBkDzjLfhAu+k4/jdJSB5jQ
KaeBNBaAZc/Om+uqKuevWE1a3ignSbKtUNvbAM7bv+vsQmkomdjL9hf29hN8SEhZ
EajHuu+LQ56Z51kDkWCs7s+R0VN0DLkmZVtp2V9qP3PV1rmuNii6R2+jI4TxHve0
RDmwI+a5BgdVhN+HCWmX
=ZSX+
-----END PGP SIGNATURE-----

--=-5ZHCzvozudbOoeAxO8cJ--

