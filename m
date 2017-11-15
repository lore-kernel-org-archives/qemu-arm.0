Received: by 10.223.150.237 with SMTP id u100csp4531045wrb;
        Wed, 15 Nov 2017 00:18:30 -0800 (PST)
X-Google-Smtp-Source: AGs4zMaAtj2sLILDgjoV80jvE38WVr0NwXQQ8L0n4cZ5ULS1iLUD61XROg/m4451QTVe0gX1EEmM
X-Received: by 10.37.28.84 with SMTP id c81mr9090383ybc.164.1510733910625;
        Wed, 15 Nov 2017 00:18:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1510733910; cv=none;
        d=google.com; s=arc-20160816;
        b=F+qZMPEQBP6phKXevQshBcp4gzS1O6G3M4r41+0fd+O4lb6G/iz3tbKu3jipn6FJJl
         rjJ/xdS6qCa1DNNJL2oCXp7fj2aaxnZolq35nuOuq90b844L1qn5kA0mRS0DJ6RK2rUD
         KK2d5rty/wwFd/rDZHN0l4A4IaC3vVN7eMbNoZsi0sXQhgwehDoOL4BM2jJuy3WvGtCW
         0JeBpLXnihzMxRW9nAXLwJ+KDZxKIqtDZZ2DrSqMsh0TUwpkqheMiqjf43JUao6LW+R1
         UmGfxUYv4njKUdUhdavClTe9oGjNkGGdUBC7dYxQJG8jluYr1zLuHBXO81O7074nYum0
         m5Qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to
         :arc-authentication-results;
        bh=ioFCqzcRT+VgZ9yjr7V1WHV5Ln4czM3dsY6qQhKXfU0=;
        b=vxWWMl1/qWBeEnQq20LniTHT1iHsXGfArYBtKy79c6qsODNSXr4dhW8kmr8YkbjcjW
         Fa/gd5RmeQuXV/9SyevHu3Ey9vKWTRxkRna7krmJY3EiS8TRAtU436aiM1rWmPMSCWQz
         cWZm3MnUfTAWJLdpg+YV/8uvy//2wwCeHvR6mSiocV2O7dcLTS/ToLg/AmPDv5RPt+BH
         8LpvTRKEL9hOmcYaMltHj/ju5P7psk3fn9tdjW0LWhfzdoPPSO5M1TD70Ngd0F6yX+CD
         nh2GrsxiLdGlq6Aif9p30zL1hkaqu7sWu3l+vbVNJo2sNe9nXdX+afB+tyvz6yIjNhnX
         NRpA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 8si511619ybn.622.2017.11.15.00.18.30
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 15 Nov 2017 00:18:30 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:35064 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eEsty-0002I3-1v
	for alex.bennee@linaro.org; Wed, 15 Nov 2017 03:18:30 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48387)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1eEsto-0002Ht-Ph
	for qemu-arm@nongnu.org; Wed, 15 Nov 2017 03:18:22 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1eEstj-0006Uc-R4
	for qemu-arm@nongnu.org; Wed, 15 Nov 2017 03:18:20 -0500
Received: from 8.mo173.mail-out.ovh.net ([46.105.46.122]:34304)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1eEstj-0006Tr-HU
	for qemu-arm@nongnu.org; Wed, 15 Nov 2017 03:18:15 -0500
Received: from player739.ha.ovh.net (b9.ovh.net [213.186.33.59])
	by mo173.mail-out.ovh.net (Postfix) with ESMTP id 117AF8685C
	for <qemu-arm@nongnu.org>; Wed, 15 Nov 2017 09:18:13 +0100 (CET)
Received: from zorba.kaod.org (LFbn-1-2231-173.w90-76.abo.wanadoo.fr
	[90.76.52.173]) (Authenticated sender: postmaster@kaod.org)
	by player739.ha.ovh.net (Postfix) with ESMTPSA id 955E04A0073;
	Wed, 15 Nov 2017 09:18:06 +0100 (CET)
To: Joel Stanley <joel@jms.id.au>, Peter Maydell <peter.maydell@linaro.org>
References: <20171114122018.12204-1-joel@jms.id.au>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <27983ce7-8de1-620f-ca06-ee4f92dab180@kaod.org>
Date: Wed, 15 Nov 2017 09:18:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <20171114122018.12204-1-joel@jms.id.au>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Ovh-Tracer-Id: 17889423621438671787
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedttddrjedvgdduvddtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 46.105.46.122
Subject: Re: [Qemu-arm] [PATCH v3] hw/arm/aspeed: Unlock SCU when running
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
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: bPL1ylVMRzju

On 11/14/2017 01:20 PM, Joel Stanley wrote:
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
> Change behaviour so that when a kernel is passed to the machine, set th=
e
> reset value of the SCU to be unlocked.
>=20
> Signed-off-by: Joel Stanley <joel@jms.id.au>

Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>

Thanks,

C.


> ---
> v3:
>  - remove unused member from AspeedBoardConfig
> v2:
>  - use the correct value for the key
>  - rename it ASPEED_SCU_PROT_KEY
> ---
>  hw/arm/aspeed.c              | 9 +++++++++
>  hw/arm/aspeed_soc.c          | 2 ++
>  hw/misc/aspeed_scu.c         | 5 +++--
>  include/hw/misc/aspeed_scu.h | 3 +++
>  4 files changed, 17 insertions(+), 2 deletions(-)
>=20
> diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
> index ab895ad490af..7088c907bd23 100644
> --- a/hw/arm/aspeed.c
> +++ b/hw/arm/aspeed.c
> @@ -186,6 +186,15 @@ static void aspeed_board_init(MachineState *machin=
e,
>                              &error_abort);
>      object_property_set_int(OBJECT(&bmc->soc), cfg->num_cs, "num-cs",
>                              &error_abort);
> +    if (machine->kernel_filename) {
> +        /*
> +         * When booting with a -kernel command line there is no u-boot
> +         * that runs to unlock the SCU. In this case set the default t=
o
> +         * be unlocked as the kernel expects
> +         */
> +        object_property_set_int(OBJECT(&bmc->soc), ASPEED_SCU_PROT_KEY=
,
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
>      object_initialize(&s->fmc, sizeof(s->fmc), sc->info->fmc_typename)=
;
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
> @@ -192,7 +191,7 @@ static void aspeed_scu_write(void *opaque, hwaddr o=
ffset, uint64_t data,
>      }
> =20
>      if (reg > PROT_KEY && reg < CPU2_BASE_SEG1 &&
> -            s->regs[PROT_KEY] !=3D PROT_KEY_UNLOCK) {
> +            s->regs[PROT_KEY] !=3D ASPEED_SCU_PROT_KEY) {
>          qemu_log_mask(LOG_GUEST_ERROR, "%s: SCU is locked!\n", __func_=
_);
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
> diff --git a/include/hw/misc/aspeed_scu.h b/include/hw/misc/aspeed_scu.=
h
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
>=20

