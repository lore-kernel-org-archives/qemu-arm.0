Received: by 10.223.197.9 with SMTP id q9csp6680896wrf;
        Thu, 19 Oct 2017 04:07:24 -0700 (PDT)
X-Received: by 10.55.25.164 with SMTP id 36mr1226989qkz.221.1508411244808;
        Thu, 19 Oct 2017 04:07:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1508411244; cv=none;
        d=google.com; s=arc-20160816;
        b=D+VjUfB4acEp81cWkt0inasfi25E+wS1fPyXHRjS4hCTomHHJ/9kNvZic87W21ztys
         noJPsHMn36fUM9QTG9elzxFtFgzkD9JMaGVBpEDv6744u23Kwa7kdRNzQ8jQSMazgAiG
         UpwVEI1u7yLEX+b0nX0fat6p8hHgt317zbl3uRqOG71PW9rHKECAxmlDbbGH/uOe8XYn
         2c/2FsZxocyQd8sLcCYMTpoVv2klaea+x3JEUPeBqXa8/6fT+7Gu9JkzaYTJ2TkQyY1c
         ZpJfq2ELb6ZSltydxA6xr3E3rTBDREgPvWTrpu7GJLr71bJjoGmIpsbhf+iUR77oGtZ7
         EbYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=cpkMTdJTLU0CWaeaw6f2wPOBtCWlk98vjtZ3Uvugcro=;
        b=H948h0idZ/Lt2Dmxsts9VuqaFSUqAzpbuy6oGIPfe+9c7n5PWUT+HSHH8psASUrpuh
         yzzmqdzcuaoHfvpViwT7YAr+ho2cR4KbvqoDbnLamNWK1t54pTx/+V6S5HkGxOQhFKXC
         9BWQxOMLWQYkV8F8+bmYakynG9hCNK7mCgZzCdStTnesFcHfeAHo19uiUoO3PmO6m1hv
         pjGb0IJDmnolyi4c3k8dQLKYBP3dk0GfXSMdoYLnKlnFc3C6mM32I0A9MB7DZvx0Lacs
         NIhf+zjPb+eEJ9jspfWaULpIQ7lR2zofRs53jfWm7l59WzhfVC06EGNU4DeQ4AkU8Xxa
         +mOg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=SlkjvsvW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v18si6809242qtf.36.2017.10.19.04.07.24
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 19 Oct 2017 04:07:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=SlkjvsvW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48675 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e58fa-0004Os-Iy
	for alex.bennee@linaro.org; Thu, 19 Oct 2017 07:07:22 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60393)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1e58fO-0004Nn-Cv
	for qemu-arm@nongnu.org; Thu, 19 Oct 2017 07:07:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1e58fN-0002mX-9f
	for qemu-arm@nongnu.org; Thu, 19 Oct 2017 07:07:10 -0400
Received: from mail-wm0-x241.google.com ([2a00:1450:400c:c09::241]:45511)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1e58fN-0002m1-3N
	for qemu-arm@nongnu.org; Thu, 19 Oct 2017 07:07:09 -0400
Received: by mail-wm0-x241.google.com with SMTP id q124so15253419wmb.0
	for <qemu-arm@nongnu.org>; Thu, 19 Oct 2017 04:07:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=cpkMTdJTLU0CWaeaw6f2wPOBtCWlk98vjtZ3Uvugcro=;
	b=SlkjvsvWSsbg41Kj7V7FutOQVrfMK1Js1C6DIrX13x9lvPgW8qGQotk81nc0xDv6/y
	7HeTWF5IPO/qR4a0lEeandcDEoLXkCy2fVlZPAjnJd4f5DOll1uys9fyVkzBZslXF5Ay
	Rv6gLVIZMfh8a79GWjwWUTllb1hgN0nI0NEj0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=cpkMTdJTLU0CWaeaw6f2wPOBtCWlk98vjtZ3Uvugcro=;
	b=DjAoEX+IWLxAbE/cXhDAokT1RsmdOiixlYLoOZcA7F2OMKHQcqCiiGD/9QOEEIRlsy
	aG5gWZkcP//B+TnZJEnEDhcf3VOz4ftANEKvdITyKs9olIVm0yeQLIAIJJxs3n6nOH/v
	ubWiBpuAj4dET3RvWTiePSiJN8dMP8WuO7uYcfN6OwFTptUWVKXT+KbGjAnsRqO03zI1
	YKq+55CMUUYxmMVO5p//s11fMcpTxLs5sQq4pezYQIPWR5QJu6NGCwBfoRrPDY7yQUCE
	+acVuwOo5AeeF502FQqQIlnp+Pd/T+VRLzBHd63JcKkkO4+uy5Jb+PC0zDlh7k/RRW/W
	DWMQ==
X-Gm-Message-State: AMCzsaXwh2/tUVec+lxB8fXkQkldLIdHkeJHBGbkoxYpVAE3LodiwuV1
	dukiSlfP9swxq3wlSJ96+dnPX0q3QAPBh1woQ8eHZQ==
X-Google-Smtp-Source: ABhQp+QvzDMcyIXs5wW7qVwQAdJbPEeTXMQeXGXkC+FXe0hEZcoVBFiVEft7FNUlBz73scx382i8ZKdVYS4RBS/FjtE=
X-Received: by 10.28.145.197 with SMTP id t188mr1268928wmd.136.1508411227934; 
	Thu, 19 Oct 2017 04:07:07 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.161.5 with HTTP; Thu, 19 Oct 2017 04:06:47 -0700 (PDT)
In-Reply-To: <20171019100410.26239-2-clg@kaod.org>
References: <20171019100410.26239-1-clg@kaod.org>
	<20171019100410.26239-2-clg@kaod.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 19 Oct 2017 12:06:47 +0100
Message-ID: <CAFEAcA_xM93zxp-QqwXd+Fxj9LE6sPn+9zWbiL4tK1GZOqKNYw@mail.gmail.com>
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::241
Subject: Re: [Qemu-arm] [PATCH v4 1/8] aspeed: introduce a dummy ROM device
 to catch invalid writes
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
X-TUID: /UNo6aRb0ek0

On 19 October 2017 at 11:04, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
> Some legacy firmwares access unimplemented addresses on the Aspeed SoC
> (old U-Boot code using variables in the bss when it shouldn't do).
> Let's add a dummy ROM device to catch the invalid writes and support
> new board without using the 'ignore_memory_transaction_failures' flags.
>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
> ---
>  hw/arm/aspeed.c | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
>
> diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
> index ab895ad490af..e44733153819 100644
> --- a/hw/arm/aspeed.c
> +++ b/hw/arm/aspeed.c
> @@ -166,6 +166,19 @@ static void aspeed_board_init_flashes(AspeedSMCState=
 *s, const char *flashtype,
>      }
>  }
>
> +static void boot_rom_rw_flash_write(void *opaque, hwaddr offset, uint64_=
t value,
> +                              unsigned size)
> +{
> +    qemu_log_mask(LOG_GUEST_ERROR,
> +                  "%s: 0x%" HWADDR_PRIx " <- 0x%" PRIx64 " [%u]\n",
> +                  __func__, offset, value, size);
> +}
> +
> +static const MemoryRegionOps boot_rom_rw_flash_ops =3D {
> +    .write =3D boot_rom_rw_flash_write,
> +    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +};
> +
>  static void aspeed_board_init(MachineState *machine,
>                                const AspeedBoardConfig *cfg)
>  {
> @@ -209,6 +222,7 @@ static void aspeed_board_init(MachineState *machine,
>      if (drive0) {
>          AspeedSMCFlash *fl =3D &bmc->soc.fmc.flashes[0];
>          MemoryRegion *boot_rom =3D g_new(MemoryRegion, 1);
> +        MemoryRegion *boot_rom_rw =3D  g_new(MemoryRegion, 1);
>
>          /*
>           * create a ROM region using the default mapping window size of
> @@ -221,6 +235,16 @@ static void aspeed_board_init(MachineState *machine,
>          memory_region_add_subregion(get_system_memory(), FIRMWARE_ADDR,
>                                      boot_rom);
>          write_boot_rom(drive0, FIRMWARE_ADDR, fl->size, &error_abort);
> +
> +        /*
> +         * Create a fake ROM region to track invalid writes done by
> +         * some legacy firmwares
> +         */
> +        memory_region_init_rom_device(boot_rom_rw, NULL, &boot_rom_rw_fl=
ash_ops,
> +                                      NULL, "aspeed.boot_rom_rw", fl->si=
ze,
> +                                      &error_abort);
> +        memory_region_add_subregion_overlap(get_system_memory(), FIRMWAR=
E_ADDR,
> +                                            boot_rom_rw, 0);
>      }

You're already (in some conditions) adding a memory region at this
address -- you can see it just above. I think you probably want
to be always creating this region in the same way, whether you
need to do a write_boot_rom() to it or not, rather than creating
two things at the same address.

I think that currently memory_region_init_rom() regions will
MEMTX_DECODE_ERROR on attempts to write to them -- that's really
a bug, which we might be able to fix, but for now you can do
this with the init_rom_device() and a comment about why we
can't just use memory_region_init_rom().

thanks
-- PMM
