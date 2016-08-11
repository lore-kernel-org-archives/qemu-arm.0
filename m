Received: by 10.25.21.156 with SMTP id 28csp46436lfv;
        Thu, 11 Aug 2016 03:16:12 -0700 (PDT)
X-Received: by 10.55.89.197 with SMTP id n188mr9718715qkb.60.1470910572107;
        Thu, 11 Aug 2016 03:16:12 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i200si1130408qke.191.2016.08.11.03.16.11
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 11 Aug 2016 03:16:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47301 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bXn23-0002zw-Dv
	for alex.bennee@linaro.org; Thu, 11 Aug 2016 06:16:11 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34695)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bXn0p-00027J-D8
	for qemu-arm@nongnu.org; Thu, 11 Aug 2016 06:14:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bXn0n-0004ia-6O
	for qemu-arm@nongnu.org; Thu, 11 Aug 2016 06:14:54 -0400
Received: from mail-ua0-x22c.google.com ([2607:f8b0:400c:c08::22c]:33537)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bXn0n-0004iP-2Y
	for qemu-arm@nongnu.org; Thu, 11 Aug 2016 06:14:53 -0400
Received: by mail-ua0-x22c.google.com with SMTP id 74so112545742uau.0
	for <qemu-arm@nongnu.org>; Thu, 11 Aug 2016 03:14:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=q0bl7MTRTm1MeIKDY5kxaEkrrcDdHEMMqsTyj6doV7o=;
	b=eA6H37tJZoPRU9w/9e0zfFueKZc2lsZt8Og4UEqHQDypJ/J/nuNal3wD2usOqappvC
	8ggHOP62k4mrPx1BES8C/8t0XfWUreQOpy1/AIV6Iob5y0wnJEcxHW7dm8NWA/V8Gtvo
	7aBTnW6QUzsMboY6TSzZLzhro3avk+ZlR2TJ0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=q0bl7MTRTm1MeIKDY5kxaEkrrcDdHEMMqsTyj6doV7o=;
	b=eYRPbu8Ds2qolKQAskaqJ1Gwj3M9h4rEwetV/A5DB47WcGt7xsViiITjBJoPy7CeBq
	UWCNrN5fFguTaijPp9CyDXJb3MiiVEd1i5nbR2BnAUKXP1j5n8L2KmOdT10K/LOwtIQL
	Pimwq8zZCfa+YgpGZzpvhR11MAyAELZy7qtuzMOUp2IZk2H08IqH2phHs1T4Kkuxxezw
	TZPUh3vWDsjBAAqpu6GTB7AmM64GIk2m5+5oPOpgffWhizsoPPc5Pb1L/dXO/OEkz7ko
	qYRPa8PQovW8izS8sux0PoW5mi6yJLCK9xhMtzclhNsgxL2G51A7mCvAfeH24c+1bIP2
	kLmA==
X-Gm-Message-State: AEkoous3x2sBPjCS79j5OE3866HBxEhifZJbfnuaPPU2u3m6JBQhtb9/kb3Rct9gkgW3oX4mt4j2N/d15pzXrvT5
X-Received: by 10.31.89.134 with SMTP id n128mr3492947vkb.83.1470910490290;
	Thu, 11 Aug 2016 03:14:50 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.150.17 with HTTP; Thu, 11 Aug 2016 03:14:29 -0700 (PDT)
In-Reply-To: <1470158147-16378-4-git-send-email-clg@kaod.org>
References: <1470158147-16378-1-git-send-email-clg@kaod.org>
	<1470158147-16378-4-git-send-email-clg@kaod.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 11 Aug 2016 11:14:29 +0100
Message-ID: <CAFEAcA9xrwghN6FMRsbHAMrTfSLv3K+iVAJEA-8p-NQ+s-bfxw@mail.gmail.com>
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c08::22c
Subject: Re: [Qemu-arm] [PATCH v3 03/10] aspeed-soc: provide a framework to
 add new SoCs
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
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 8MNe+1pTKRKF

On 2 August 2016 at 18:15, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
> Let's define an object class for each Aspeed SoC we support. A
> AspeedSoCInfo struct gathers the SoC specifications which can later be
> used by an instance of the class or by a board using the SoC.
>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>

> diff --git a/hw/arm/palmetto-bmc.c b/hw/arm/palmetto-bmc.c
> index 4d11905cfb18..531c266d9449 100644
> --- a/hw/arm/palmetto-bmc.c
> +++ b/hw/arm/palmetto-bmc.c
> @@ -22,8 +22,6 @@
>  #include "sysemu/blockdev.h"
>
>  static struct arm_boot_info palmetto_bmc_binfo =3D {
> -    .loader_start =3D AST2400_SDRAM_BASE,
> -    .board_id =3D 0,
>      .nb_cpus =3D 1,
>  };
>
> @@ -61,14 +59,17 @@ static void palmetto_bmc_init_flashes(AspeedSMCState =
*s, const char *flashtype,
>  static void palmetto_bmc_init(MachineState *machine)
>  {
>      PalmettoBMCState *bmc;
> +    AspeedSoCClass *sc;
>
>      bmc =3D g_new0(PalmettoBMCState, 1);
> -    object_initialize(&bmc->soc, (sizeof(bmc->soc)), TYPE_ASPEED_SOC);
> +    object_initialize(&bmc->soc, (sizeof(bmc->soc)), "ast2400-a0");
>      object_property_add_child(OBJECT(machine), "soc", OBJECT(&bmc->soc),
>                                &error_abort);
>
> +    sc =3D ASPEED_SOC_GET_CLASS(&bmc->soc);
> +
>      memory_region_allocate_system_memory(&bmc->ram, NULL, "ram", ram_siz=
e);
> -    memory_region_add_subregion(get_system_memory(), AST2400_SDRAM_BASE,
> +    memory_region_add_subregion(get_system_memory(), sc->info->sdram_bas=
e,
>                                  &bmc->ram);
>      object_property_add_const_link(OBJECT(&bmc->soc), "ram", OBJECT(&bmc=
->ram),
>                                     &error_abort);
> @@ -84,6 +85,9 @@ static void palmetto_bmc_init(MachineState *machine)
>      palmetto_bmc_binfo.initrd_filename =3D machine->initrd_filename;
>      palmetto_bmc_binfo.kernel_cmdline =3D machine->kernel_cmdline;
>      palmetto_bmc_binfo.ram_size =3D ram_size;
> +    palmetto_bmc_binfo.board_id =3D sc->info->silicon_rev;
> +    palmetto_bmc_binfo.loader_start =3D sc->info->sdram_base;
> +

This changes the behaviour from passing in the board_id
as 0 to passing in the silicon rev. Neither of those
things is actually a valid board ID value, which must
be one of:
(a) for legacy pre-device-tree boards, a value listed in
the official database at:
http://www.arm.linux.org.uk/developer/machines/download.php
(b) for device-tree-only boards, -1

board_id 0 means "I am an EBSA110", which this isn't,
and your silicon rev values are completely out of range.

thanks
-- PMM
