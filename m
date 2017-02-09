Received: by 10.25.77.65 with SMTP id a62csp188761lfb;
        Thu, 9 Feb 2017 13:49:16 -0800 (PST)
X-Received: by 10.55.195.148 with SMTP id r20mr5176236qkl.45.1486676956217;
        Thu, 09 Feb 2017 13:49:16 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 10si9006776qty.300.2017.02.09.13.49.15
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 09 Feb 2017 13:49:16 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:40367 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cbwaX-0007UB-K4
	for alex.bennee@linaro.org; Thu, 09 Feb 2017 16:49:13 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59647)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1cbwYz-0006Rm-2K
	for qemu-devel@nongnu.org; Thu, 09 Feb 2017 16:47:38 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1cbwYu-0001Ei-6L
	for qemu-devel@nongnu.org; Thu, 09 Feb 2017 16:47:37 -0500
Received: from mail-qt0-x244.google.com ([2607:f8b0:400d:c0d::244]:36851)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1cbwYu-0001EK-2w; Thu, 09 Feb 2017 16:47:32 -0500
Received: by mail-qt0-x244.google.com with SMTP id h53so2300609qth.3;
	Thu, 09 Feb 2017 13:47:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=eSpHKDYhdUZx4ccScaY8tmb7tboMmeXu1wdFEJL0FQc=;
	b=Tq/pxclvuUE9DEY32wwwBjOA2/xK9PeZ7Q4GP/NgnhM2aWWDQts8O30I9NxFVz1elT
	q6NrBFyu2GEbzUW1tRNmBL8JC4L8ycR7hzQAaP7EsmQ73FftpCzc93ns8+5CyXikAhDz
	u0kBSYq2CzVuu4It3cPdUF+8CQCY9+OAFh9AZIBQ5hA1HKocQExh8q8KimPkT6JVmvWh
	oBWpAzUUvKrqRuY6jVSeFOjFWzXW21h49oYLyTFJj2r4W6V3PG1tk4GAUt7heeqhuCV6
	yUb96mz+G3UBMVQjKmVL8av4I5SVtdGqPPCnlivMxuK1cDKL+xCTwP69OSDdu9yqQ67a
	vRXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:references:cc:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=eSpHKDYhdUZx4ccScaY8tmb7tboMmeXu1wdFEJL0FQc=;
	b=hX02vT1sFfMPP2wcNb5aV+d3/LQ3j2bLDUt8l9eWrjfaoSwu3U7k5E6SO8jqjT1Oe6
	JiyNef9ttO57HclzcW1V7Wu0OEq324bM5m9zEEXkJiQX6S6fTV35gmkvxcInLPF6uBKz
	MumU/51ihkZZOH7ilC1j/urrKOlatmOah02PHT5+vXnZ+JZQ2pebu/qqPxs8P2w6qLBC
	C9BcPhVFcvULQM3/nFIjQr/KHaHgEjbaPg+R3e4Y5OvObMdQXEPUVxILzU9LhnOukFgw
	igqkn8IEgx3t+RqUojJ7jmkw53+WAbjg+9OayYKnZUqErWMobkQXONyrFUhjKlOijOAY
	xBvw==
X-Gm-Message-State: AMke39kGFsY2w1rX3nhqcfDi7bUbEEjmMZOP/sRn4yCw/gblM1yh5Wr0BfCsWGwJ/iLX+g==
X-Received: by 10.237.59.213 with SMTP id s21mr4901251qte.146.1486676848746;
	Thu, 09 Feb 2017 13:47:28 -0800 (PST)
Received: from [192.168.1.10] ([138.117.48.226])
	by smtp.gmail.com with ESMTPSA id
	w44sm10337478qta.4.2017.02.09.13.47.26
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 09 Feb 2017 13:47:27 -0800 (PST)
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <1486648058-520-1-git-send-email-clg@kaod.org>
	<1486648058-520-3-git-send-email-clg@kaod.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <4fcd2d72-e970-8e03-4741-52a5e9ed2af0@amsat.org>
Date: Thu, 9 Feb 2017 18:47:24 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.6.0
MIME-Version: 1.0
In-Reply-To: <1486648058-520-3-git-send-email-clg@kaod.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400d:c0d::244
Subject: Re: [Qemu-devel] [PATCH 2/4] aspeed: remove useless comment on
 controller segment size
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: bCLitcIzN2bq



On 02/09/2017 10:47 AM, Cédric Le Goater wrote:
> The flash devices used for the FMC controller (BMC firmware) are well
> defined for each Aspeed machine and are all smaller than the default
> mapping window size, at least for CE0 which is the chip the SoC boots
> from.
>
> Signed-off-by: Cédric Le Goater <clg@kaod.org>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> ---
>  hw/arm/aspeed.c | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
>
> diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
> index ac9cbd66b72a..283c03881493 100644
> --- a/hw/arm/aspeed.c
> +++ b/hw/arm/aspeed.c
> @@ -148,10 +148,6 @@ static void aspeed_board_init_flashes(AspeedSMCState *s, const char *flashtype,
>          DriveInfo *dinfo = drive_get_next(IF_MTD);
>          qemu_irq cs_line;
>
> -        /*
> -         * FIXME: check that we are not using a flash module exceeding
> -         * the controller segment size
> -         */
>          fl->flash = ssi_create_slave_no_init(s->spi, flashtype);
>          if (dinfo) {
>              qdev_prop_set_drive(fl->flash, "drive", blk_by_legacy_dinfo(dinfo),
> @@ -210,7 +206,9 @@ static void aspeed_board_init(MachineState *machine,
>
>          /*
>           * create a ROM region using the default mapping window size of
> -         * the flash module.
> +         * the flash module. The window size is 64MB for the AST2400
> +         * SoC and 128MB for the AST2500 SoC, which is twice as big as
> +         * needed by the flash modules of the Aspeed machines.
>           */
>          memory_region_init_rom(boot_rom, OBJECT(bmc), "aspeed.boot_rom",
>                                 fl->size, &error_abort);
>
