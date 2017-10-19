Received: by 10.223.197.9 with SMTP id q9csp6950385wrf;
        Thu, 19 Oct 2017 08:45:16 -0700 (PDT)
X-Received: by 10.237.42.97 with SMTP id k30mr2791903qtf.184.1508427916090;
        Thu, 19 Oct 2017 08:45:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1508427916; cv=none;
        d=google.com; s=arc-20160816;
        b=bdDbN8l7bFN5QNIXcnQnRir5ff3CvyfZd/OktLDfqZrMPAgHBg4W7KokysvT2BvLSE
         UnbD4TQMA6Jf0NUsXapAObUebWFoGEz3caQPuP4RSgAcWh+D7xOQ62+MfQjZS0HfYCJZ
         0EQJYgdbDk/9AxAiwaTM1lF7rr8OO3lI5UfjeqjZkujlwoLHggrpa/0Nf3DiqP4w6xvt
         06iPcJGsmId6j8Yi+xk6cPelEHtb+rIUea6t3ypVoR+0UEHXzxulCxrleEIbwGk/7mYT
         6IIO4IT4KMNyuAyixaF6YfWniIbgJZaDW/1/CNBcny0a4ejbnDqrZfjOEm+7wc/kvYsy
         W54w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=6KLXQa0yT4Ixe5hdbMAmkxTOsSUhk+4zDuaOR/O9qTo=;
        b=PPXIkKfnsxv/PVT8FDLy9X/y6qvYXxa22qjncJ6Vm0/AfxK0dR/mTA+He+6MOSopxf
         gixpUD1Btom+l1m+sNp8WSvmk4RFoHMkoGNs5QdA4fS2rXnedjBoGT8WsZgToWN1b+Gg
         myAJGbclrBQccatDDrAiHIpf8emKQjiD5OX1mcr55D+5Dn9SU+uwBGgPucB11ayBV8tY
         gG8ktI16LhpqT4u/+P1O5sbS80gKuFnwsepPimTmvqfBEPb7NIzgqbAQZnx9/UvNlcbA
         jdpldJGsJN27LPSRKSxZsUmyQKAQJo2G8YTtgyXP0lsPEa3EsGXWmxRRh8eSEoD6JZyO
         diwQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=fdQUisEH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f33si1686318qtd.288.2017.10.19.08.45.15
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 19 Oct 2017 08:45:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=fdQUisEH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:49788 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e5D0T-0002v0-G9
	for alex.bennee@linaro.org; Thu, 19 Oct 2017 11:45:13 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45487)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1e5D0L-0002ui-3C
	for qemu-arm@nongnu.org; Thu, 19 Oct 2017 11:45:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1e5D0K-0004Sp-5H
	for qemu-arm@nongnu.org; Thu, 19 Oct 2017 11:45:05 -0400
Received: from mail-wm0-x242.google.com ([2a00:1450:400c:c09::242]:53235)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1e5D0J-0004SF-UQ
	for qemu-arm@nongnu.org; Thu, 19 Oct 2017 11:45:04 -0400
Received: by mail-wm0-x242.google.com with SMTP id k4so17272492wmc.1
	for <qemu-arm@nongnu.org>; Thu, 19 Oct 2017 08:45:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=6KLXQa0yT4Ixe5hdbMAmkxTOsSUhk+4zDuaOR/O9qTo=;
	b=fdQUisEHDDVtY2VkMWvOB4lz6/l6/OIB6pdQKfewM/xzsOU6BqIKdvNExN9C+Fua2j
	ZHFtcDTcuJ43/7wyWYsXP5VcFbV0xLejd9Tm/AX9eitQ63HY7uiAE+GaqTw67Xa9q7rv
	yboFuhu3+OLnJUeO4JOvjWH8lwZ0RjWFmbuOY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=6KLXQa0yT4Ixe5hdbMAmkxTOsSUhk+4zDuaOR/O9qTo=;
	b=GbUyH0gUnubFfmuss0+F6G2ZbHOiZb1artGWfm5yB+KwB3Zs+H5/afBICIFTw5OO5r
	ITqCM8jXmn5bfubsH/AEiW+fWyoQ+JuLAVSzbsOGvctlpilayfvzHc5Ros/rYD1ad6X5
	voE9qZ9S3Dv/bgohiSoTrFZ/KkZXjrN3tnpSeX4P5zJx729dCP/9oOghERMVdJh1DTFP
	4na85DPe+nwyck8HvS60pj5jspYzlO93MmL6GHFP1J7jB8jC5eaXIxWMy42DX/jLpJpm
	cVImV+BDcFE/jRq0yf1WHmkBmD2vQ1Kv9Ppq4d9+5nR0BfHOEsPicYKNMmyK0MPHUZ1D
	iFCg==
X-Gm-Message-State: AMCzsaViNJhQxsPuyV66wxHuuQCDs9Gm+D3Y8oxZRUuT6SkXKNyUL6CC
	teWN8WgMREclxzx4+xvwzHwKcdgAuEgF9+WDQPa1hA==
X-Google-Smtp-Source: ABhQp+TjzrUFA20C3EEpX1lZXj7wep4VHPPIg6y5GZhGdRnLlWwaP+3wpj8Llb9pyU8IxGs/gM1/6gweD+7VkK9I7Rs=
X-Received: by 10.28.36.212 with SMTP id k203mr1873778wmk.127.1508427902693;
	Thu, 19 Oct 2017 08:45:02 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.161.5 with HTTP; Thu, 19 Oct 2017 08:44:42 -0700 (PDT)
In-Reply-To: <20171019151249.13663-2-clg@kaod.org>
References: <20171019151249.13663-1-clg@kaod.org>
	<20171019151249.13663-2-clg@kaod.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 19 Oct 2017 16:44:42 +0100
Message-ID: <CAFEAcA-6gXF9skgYRTke5-0Ds_SLceAgX-Dz6WyyuiYJSz7afw@mail.gmail.com>
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::242
Subject: Re: [Qemu-arm] [PATCH v5 1/8] aspeed: use a ROM memory region to
 catch invalid writes
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
Cc: Andrew Jeffery <andrew@aj.id.au>,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
	qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: y1PqIsz1NOI/

On 19 October 2017 at 16:12, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
> Some legacy firmwares access unimplemented addresses on the Aspeed SoC
> (old U-Boot code using variables in the bss when it shouldn't do).
> Let's use a ROM memory region to catch the invalid writes and support
> new boards without using the 'ignore_memory_transaction_failures'
> flag.
>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
> ---
>
>  Changes since v4 :
>
>  - use a ROM memory region

Probably worth mentioning in the commit message that this
is a migration compatibility break for these boards.

>  hw/arm/aspeed.c | 22 ++++++++++++++++++++--
>  1 file changed, 20 insertions(+), 2 deletions(-)
>
> diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
> index ab895ad490af..d88a8b5120b6 100644
> --- a/hw/arm/aspeed.c
> +++ b/hw/arm/aspeed.c
> @@ -166,6 +166,23 @@ static void aspeed_board_init_flashes(AspeedSMCState=
 *s, const char *flashtype,
>      }
>  }
>
> +/*
> + * This is to track invalid writes done in the ROM by some legacy
> + * firmwares
> + */
> +static void boot_rom_write(void *opaque, hwaddr offset, uint64_t value,
> +                           unsigned size)
> +{
> +    qemu_log_mask(LOG_GUEST_ERROR,
> +                  "%s: 0x%" HWADDR_PRIx " <- 0x%" PRIx64 " [%u]\n",
> +                  __func__, offset, value, size);
> +}
> +
> +static const MemoryRegionOps boot_rom_ops =3D {
> +    .write =3D boot_rom_write,
> +    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +};
> +
>  static void aspeed_board_init(MachineState *machine,
>                                const AspeedBoardConfig *cfg)
>  {
> @@ -216,8 +233,9 @@ static void aspeed_board_init(MachineState *machine,
>           * SoC and 128MB for the AST2500 SoC, which is twice as big as
>           * needed by the flash modules of the Aspeed machines.
>           */
> -        memory_region_init_rom_nomigrate(boot_rom, OBJECT(bmc), "aspeed.=
boot_rom",
> -                               fl->size, &error_abort);
> +        memory_region_init_rom_device(boot_rom, OBJECT(bmc), &boot_rom_o=
ps,
> +                                      NULL, "aspeed.boot_rom", fl->size,
> +                                      &error_abort);
>          memory_region_add_subregion(get_system_memory(), FIRMWARE_ADDR,
>                                      boot_rom);
>          write_boot_rom(drive0, FIRMWARE_ADDR, fl->size, &error_abort);
> --

Don't you want to create the ROM device even if there happens
not to be any contents specified by the user? The thing is still
there in the SoC even if it's empty...

thanks
-- PMM
