Received: by 10.25.21.96 with SMTP id l93csp642730lfi;
        Thu, 23 Jun 2016 10:41:30 -0700 (PDT)
X-Received: by 10.55.191.129 with SMTP id p123mr11949920qkf.1.1466703690723;
        Thu, 23 Jun 2016 10:41:30 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q63si1169399qki.144.2016.06.23.10.41.30
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 23 Jun 2016 10:41:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38356 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bG8d8-0000tX-2m
	for alex.bennee@linaro.org; Thu, 23 Jun 2016 13:41:30 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33404)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bG8bR-0007NU-7C
	for qemu-devel@nongnu.org; Thu, 23 Jun 2016 13:39:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bG8bP-00020O-7q
	for qemu-devel@nongnu.org; Thu, 23 Jun 2016 13:39:44 -0400
Received: from mail-vk0-x229.google.com ([2607:f8b0:400c:c05::229]:35338)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bG8bP-00020I-3F
	for qemu-devel@nongnu.org; Thu, 23 Jun 2016 13:39:43 -0400
Received: by mail-vk0-x229.google.com with SMTP id j2so116721966vkg.2
	for <qemu-devel@nongnu.org>; Thu, 23 Jun 2016 10:39:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=kdDOrbvhD4/M8CQD+wJkcnWI17Jk4aFiSF7IaMW5y8w=;
	b=HpwD+JYcxkxpPQ863MRX2snZK8qDermmXz3r0Uw4OpS2JNn3+j4LnEXd9qBOBdZZAa
	lQ9l/SwOWbiUzA41XEQ5sOcVzvs32hD9w0UUaW/0IcGaVvxWWUMyTexbJMQhZmGJea9O
	1nxenuTk6mSI5TLfDpot8Ujfth+/sQOhVEpuE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=kdDOrbvhD4/M8CQD+wJkcnWI17Jk4aFiSF7IaMW5y8w=;
	b=WSdoZzh23KMUaGhRZVjP7w4LjDC1a16vt9tNrKgkuoP1AaspBTSMeQpSWWNFFLplP6
	Xv765mXOsw6Th3TR5I8A6CPrhw5Geh9GCLVHTZj2HgLt1UuW9Jhsonu7Yow9H3SZZEaW
	5cSqMbEIYVn6E1kATv55wkfxL4Lg3DWfNTEKAad72KC5Gr2IS5b7Fu+eq/CFEZ7pfuqT
	tMcoy0I6LLfW8l2VcdBNASBaXW5ldE8x85+/u3adlLIayjjTDhMC3wliVRWbuC+dFmm9
	SJzIbWqa/ez6JPD+5CEcsxLZGEHVnERdbOF+ZIvNaY+1Z5itnQljW9sYbvRSzPS1oDvB
	6FHw==
X-Gm-Message-State: ALyK8tIoLzZwB+n82YP9j21T1veoykwVHfw6w2pmX5AxTuLGNpKSLgboGhWwMczzgOdF6PEedwtecZDOXm28f/Ak
X-Received: by 10.176.69.138 with SMTP id u10mr16249641uau.24.1466703582629;
	Thu, 23 Jun 2016 10:39:42 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.157.141 with HTTP; Thu, 23 Jun 2016 10:39:23 -0700 (PDT)
In-Reply-To: <1466648115-17015-4-git-send-email-andrew@aj.id.au>
References: <1466648115-17015-1-git-send-email-andrew@aj.id.au>
	<1466648115-17015-4-git-send-email-andrew@aj.id.au>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 23 Jun 2016 18:39:23 +0100
Message-ID: <CAFEAcA94oy9Bw=1trtn1rnbobMQwpRg-8oOgf1G_1rbhaZH-7w@mail.gmail.com>
To: Andrew Jeffery <andrew@aj.id.au>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::229
Subject: Re: [Qemu-devel] [PATCH v2 3/3] palmetto-bmc: Configure the SCU's
 hardware strapping register
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
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
	=?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
	Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ohP6xigsF8Jz

On 23 June 2016 at 03:15, Andrew Jeffery <andrew@aj.id.au> wrote:
> The magic constant configures the following options:
>
> * 28:27: Configure DRAM size as 256MB
> * 26:24: DDR3 SDRAM with CL = 6, CWL = 5
> * 23: Configure 24/48MHz CLKIN
> * 22: Disable GPIOE pass-through mode
> * 21: Disable GPIOD pass-through mode
> * 20: Enable LPC decode of SuperIO 0x2E/0x4E addresses
> * 19: Disable ACPI
> * 18: Configure 48MHz CLKIN
> * 17: Disable BMC 2nd boot watchdog timer
> * 16: Decode SuperIO address 0x2E
> * 15: VGA Class Code
> * 14: Enable LPC dedicated reset pin
> * 13:12: Enable SPI Master and SPI Slave to AHB Bridge
> * 11:10: Select CPU:AHB ratio = 2:1
> * 9:8: Select 384MHz H-PLL
> * 7: Configure MAC#2 for RMII/NCSI
> * 6: Configure MAC#1 for RMII/NCSI
> * 5: No VGA BIOS ROM
> * 4: Boot using 32bit SPI address mode
> * 3:2: Select 16MB VGA memory
> * 1:0: Boot from SPI flash memory

Maybe we should say this in a comment in the code?

> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> ---
>  hw/arm/palmetto-bmc.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/hw/arm/palmetto-bmc.c b/hw/arm/palmetto-bmc.c
> index a51d960510ee..b8eed21348d8 100644
> --- a/hw/arm/palmetto-bmc.c
> +++ b/hw/arm/palmetto-bmc.c
> @@ -44,6 +44,8 @@ static void palmetto_bmc_init(MachineState *machine)
>                                  &bmc->ram);
>      object_property_add_const_link(OBJECT(&bmc->soc), "ram", OBJECT(&bmc->ram),
>                                     &error_abort);
> +    object_property_set_int(OBJECT(&bmc->soc), 0x120CE416, "hw-strap1",
> +                            &error_abort);
>      object_property_set_bool(OBJECT(&bmc->soc), true, "realized",
>                               &error_abort);

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
