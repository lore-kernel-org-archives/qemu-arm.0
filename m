Received: by 10.28.4.212 with SMTP id 203csp1692691wme;
        Thu, 3 May 2018 02:47:51 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZpGCj+BfuJvmJMolScS9M4ugTEdPlALw9Z4FDumRTbebGBd9QYEWj4PBuvVvncTBtmHOw3F
X-Received: by 2002:a0c:f742:: with SMTP id e2-v6mr16439882qvo.174.1525340871330;
        Thu, 03 May 2018 02:47:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1525340871; cv=none;
        d=google.com; s=arc-20160816;
        b=fSrjx8e27VFgkpaXUzVsnEwXioj2CU3Qg2ZXpseJN3TpO2U6WuaC39y3x65MyHYI8u
         6rHaWuslkeh+wwQjFqfP5OXm7pCC/jMz8n6SDPRQ5WJao6IUZnVhsVdHXn4pCiD3/1GM
         6W3MthC1Q7ggIZiO61NoeHtEqq5LPkeYdsXvfkRg2g+x9V+n7CoiQlbzy0ZiwKIonD/J
         u3RIo9YfR1i0Wwyrt22UPJy28NW3aSMGulspWIzeP+L2ofTRUs8eP4dZZUic3/7u7VLh
         xCB5anfykPiPXbJJ/DlwkzNWyAnK5y7ooh1atWzrOzqXLlQ7PFKvC/QRAF+BvkOmLkkw
         ghZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=EdQD4TzDNvq/UiCmTm2PkxFdT38l2KUu3iQtN7V+7A0=;
        b=EMMJv2G6E4XjlsIba9fJ5VJrt4NF5dLsfIZe54Cz//SxJ44mqYd7XFRTVqUEife2P0
         Kg2V5CDQ+o/da764GMcyeRTyawkyTwC2P/3p0keJE/MfMLAc9uXiUuubRu/UWEGBEumr
         xcTXSqkmt77dMNxjmxLdNc76WWgK366gm0f3hBaaEx518i4xhEj0a36F2Q7kjG2X+obF
         fkjaYIzdsQgHt7s6SxNwmQyZbN2B4BmAJ8bI3SapT+sasdJskA8FtaN3W0JQ4AuLSyJC
         9h8q4uRWmqrDEbCI1vwGJBXHchk1Bzb0U418iVzJERWAn0AFuZqL3XYF1CGyPrtdymLO
         OUkQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=GOsEjfE1;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x128si11535385qkc.83.2018.05.03.02.47.51
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 03 May 2018 02:47:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=GOsEjfE1;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:55003 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fEAq6-0007HI-QZ
	for alex.bennee@linaro.org; Thu, 03 May 2018 05:47:50 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55820)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fEAQd-0002Pe-Ff
	for qemu-devel@nongnu.org; Thu, 03 May 2018 05:21:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fEAQY-0005ny-HI
	for qemu-devel@nongnu.org; Thu, 03 May 2018 05:21:31 -0400
Received: from mail-oi0-x242.google.com ([2607:f8b0:4003:c06::242]:41336)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fEAQY-0005nf-CF
	for qemu-devel@nongnu.org; Thu, 03 May 2018 05:21:26 -0400
Received: by mail-oi0-x242.google.com with SMTP id 11-v6so15456660ois.8
	for <qemu-devel@nongnu.org>; Thu, 03 May 2018 02:21:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=EdQD4TzDNvq/UiCmTm2PkxFdT38l2KUu3iQtN7V+7A0=;
	b=GOsEjfE1K1+2miVtbXbX7BHcXv7roofAKMg6Spub4TRi+xQVGZA5XlBEAjTb3ntmB5
	uegoV9Y3PGuN81ih3sfPK1Y+61WsBx7l8PUjxqZmUKlJPppaxA12pNshCcKMUGdkUgFW
	qohKojZP9z+MAjNkx9pcKEKCoRwYA+Yj7zUBY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=EdQD4TzDNvq/UiCmTm2PkxFdT38l2KUu3iQtN7V+7A0=;
	b=S1GSUn0lBYCA00ziK9HhN6zuUPx3Gqso23XCqRsZT1+ArpesXRlXaGMR7ARTAph4tC
	yAENfX41FF4YFCJ7yqFnhG+rtqUZR21WIW2TJPOoDECc2ZYzrnUbIHUmX4h1xLzoVtPW
	kGY8AkUCzJfttjlfFynpXjOIDuM52eSFIo//8j2ts9f2mtmE7TxsRbWU7ZyClzwEk1EZ
	vzBmWikHoMmgioogys85DjdefDg8dXxd+p1mU78QSUznSM6YkjuuA2Dyh5UMr9rQaVNn
	TJ2LaOAbdDzbT16x1EEM4xJ+GUoJJZ8C/ZKqh0zEoS88f4iQVhlsH+6S+J8DgMrvfm3x
	cgeQ==
X-Gm-Message-State: ALQs6tC1br7p3gMNdsvveEu8v81JMudBUBuJIR6CFJRICfSqWZtXCjEf
	NhAGO9ujV9bfPBQUVpzbcupqUhi5a2o1KMvEK3fvVA==
X-Received: by 2002:aca:f141:: with SMTP id
	p62-v6mr11902187oih.80.1525339285559; 
	Thu, 03 May 2018 02:21:25 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:40fb:0:0:0:0:0 with HTTP;
	Thu, 3 May 2018 02:21:04 -0700 (PDT)
In-Reply-To: <20180503090532.3113-3-joel@jms.id.au>
References: <20180503090532.3113-1-joel@jms.id.au>
	<20180503090532.3113-3-joel@jms.id.au>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 3 May 2018 10:21:04 +0100
Message-ID: <CAFEAcA_mwf5VtQiH1UKXJyWd78wdm4=DCCGRB4t8db-QsgOAiA@mail.gmail.com>
To: Joel Stanley <joel@jms.id.au>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::242
Subject: Re: [Qemu-devel] [PATCH 2/2] arm: Add BBC micro:bit machine
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Stefan Hajnoczi <stefanha@gmail.com>,
	qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	Jim Mussared <jim.mussared@gmail.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: X+yw88dtAJHv

On 3 May 2018 at 10:05, Joel Stanley <joel@jms.id.au> wrote:
> This adds the base for a machine model of the BBC micro:bit:
>
>   https://en.wikipedia.org/wiki/Micro_Bit
>
> This is a system with a nRF51 SoC containing the main processor, with
> various peripherals on board.
>
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
>  hw/arm/Makefile.objs |  2 +-
>  hw/arm/microbit.c    | 33 +++++++++++++++++++++++++++++++++
>  2 files changed, 34 insertions(+), 1 deletion(-)
>  create mode 100644 hw/arm/microbit.c
>
> diff --git a/hw/arm/Makefile.objs b/hw/arm/Makefile.objs
> index 1d7211850454..c01e7a1e39fb 100644
> --- a/hw/arm/Makefile.objs
> +++ b/hw/arm/Makefile.objs
> @@ -35,4 +35,4 @@ obj-$(CONFIG_MPS2) += mps2-tz.o
>  obj-$(CONFIG_MSF2) += msf2-soc.o msf2-som.o
>  obj-$(CONFIG_IOTKIT) += iotkit.o
>  obj-$(CONFIG_FSL_IMX7) += fsl-imx7.o mcimx7d-sabre.o
> -obj-$(CONFIG_NRF51_SOC) += nrf51_soc.o
> +obj-$(CONFIG_NRF51_SOC) += nrf51_soc.o microbit.o
> diff --git a/hw/arm/microbit.c b/hw/arm/microbit.c
> new file mode 100644
> index 000000000000..b61d0747fe56
> --- /dev/null
> +++ b/hw/arm/microbit.c
> @@ -0,0 +1,33 @@
> +/*
> + * BBC micro:bit machine
> + *
> + * Copyright 2018 Joel Stanley <joel@jms.id.au>
> + *
> + * This code is licensed under the GPL version 2 or later.  See
> + * the COPYING file in the top-level directory.

Is there a datasheet URL? If so this is a good place to give it.

> + */
> +
> +#include "qemu/osdep.h"
> +#include "qapi/error.h"
> +#include "hw/boards.h"
> +
> +#include "hw/arm/nrf51_soc.h"
> +
> +static void microbit_init(MachineState *machine)
> +{
> +    DeviceState *dev;
> +
> +    dev = qdev_create(NULL, TYPE_NRF51_SOC);
> +    if (machine->kernel_filename) {
> +        qdev_prop_set_string(dev, "kernel-filename", machine->kernel_filename);
> +    }
> +    object_property_set_bool(OBJECT(dev), true, "realized", &error_fatal);
> +}
> +
> +static void microbit_machine_init(MachineClass *mc)
> +{
> +    mc->desc = "BBC micro:bit";
> +    mc->init = microbit_init;
> +    mc->ignore_memory_transaction_failures = true;

ignore_memory_transaction_failures is a flag for legacy machine
models only; please don't set it for a new board model.
(Instead, just provide stubs via unimplemented_device for
any devices or areas of memory that need to exist for
guest code to run.)

thanks
-- PMM
