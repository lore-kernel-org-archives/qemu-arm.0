Received: by 10.103.86.15 with SMTP id k15csp1322922vsb;
        Fri, 16 Dec 2016 05:04:41 -0800 (PST)
X-Received: by 10.176.0.147 with SMTP id 19mr1943310uaj.20.1481893481767;
        Fri, 16 Dec 2016 05:04:41 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g9si2159425vkg.196.2016.12.16.05.04.41
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 16 Dec 2016 05:04:41 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60387 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cHsBj-0006kG-GV
	for alex.bennee@linaro.org; Fri, 16 Dec 2016 08:04:39 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46672)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cHsBE-0005yo-V0
	for qemu-arm@nongnu.org; Fri, 16 Dec 2016 08:04:09 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cHsB8-0000MQ-Mv
	for qemu-arm@nongnu.org; Fri, 16 Dec 2016 08:04:08 -0500
Received: from mail-vk0-x22b.google.com ([2607:f8b0:400c:c05::22b]:36834)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1cHsB8-0000M2-C4
	for qemu-arm@nongnu.org; Fri, 16 Dec 2016 08:04:02 -0500
Received: by mail-vk0-x22b.google.com with SMTP id p9so88209481vkd.3
	for <qemu-arm@nongnu.org>; Fri, 16 Dec 2016 05:04:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=jM/ggF8FGkaWrOx96jHWtot9fhwNw1HHGlu8VTspGdM=;
	b=Mp8EHRj0e8TX0QVK17aZN4pp6cBkJgWp40/TKf3SPtERwDcHUGOD0itDKSHAaIOpHX
	Ilpylp1MSQeLOpf07EhXI+PY+rL/yJaB2SzAUvZbSgft80HgUjN4BjqS/Vx+TI/Y9xn2
	/BaCv7JJDb8iDNR4QccGFKVymoFV53gJvY8NU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=jM/ggF8FGkaWrOx96jHWtot9fhwNw1HHGlu8VTspGdM=;
	b=Hecbk9SmTA5KwrFkE42DTdzHPYlGV8b2/jejGEPRLPiEc1JJODXH0wE7vZ5gUyh22s
	xApUXINjsxo7h51HMqtL5+0cXZbAYK2+2gDH20i20xxrhZt9h/ws8fb0PB83NxGprgiI
	LIxbNUTRpsaQrJ9zX9Qx5776efPem8b97A7oPRz9Ml0R0DKjRwyfobXAzdFticmz8FpD
	EoClkVuhERdcehvC3QB8zjrJ2R9diKXyrAv4+y3iW8yoxRBKMOLau8G69mtn4sfNLhf9
	F1U608ARr1poJvFghylkklgGAWV1zMMZsEk1H46WLIIFwUNCaEDnU6Rmn/usXWTJ5wGY
	JivA==
X-Gm-Message-State: AIkVDXKowYmYJ52sCafsmhnxbJGaiU2qP3MmK7YBQL0AJsNgotcNsLru/cw0ttoFpvUEFA4e5nbnfsySaMiaXQrn
X-Received: by 10.31.75.198 with SMTP id y189mr931562vka.51.1481893441747;
	Fri, 16 Dec 2016 05:04:01 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.176.14 with HTTP; Fri, 16 Dec 2016 05:03:41 -0800 (PST)
In-Reply-To: <20161215054812.12602-2-alastair@au1.ibm.com>
References: <20161215054812.12602-1-alastair@au1.ibm.com>
	<20161215054812.12602-2-alastair@au1.ibm.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 16 Dec 2016 13:03:41 +0000
Message-ID: <CAFEAcA9RpMAHTrPb2GNQYh+P-svcpHB90h0qcs27CUBDyY1=Ng@mail.gmail.com>
To: "Alastair D'Silva" <alastair@au1.ibm.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::22b
Subject: Re: [Qemu-arm] [PATCH v4 1/8] arm: Uniquely name imx25 I2C buses.
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
Cc: Andrew Jeffery <andrew@aj.id.au>, QEMU Developers <qemu-devel@nongnu.org>,
	Jean-Christophe DUBOIS <jcd@tribudubois.net>,
	qemu-arm <qemu-arm@nongnu.org>, Joel Stanley <joel@jms.id.au>,
	Alastair D'Silva <alastair@d-silva.org>,
	=?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: dZIQgzO2BRn4

On 15 December 2016 at 05:48, Alastair D'Silva <alastair@au1.ibm.com> wrote:
> From: Alastair D'Silva <alastair@d-silva.org>
>
> The imx25 chip provides 3 i2c buses, but they have all been named
> "i2c", which makes it difficult to predict which bus a device will
> be connected to when specified on the command line.
>
> This patch addresses the issue by naming the buses uniquely:
>   i2c-bus.0 i2c-bus.1 i2c-bus.2
>
> Signed-off-by: Alastair D'Silva <alastair@d-silva.org>
> ---
>  hw/arm/imx25_pdk.c | 2 +-
>  hw/i2c/imx_i2c.c   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/hw/arm/imx25_pdk.c b/hw/arm/imx25_pdk.c
> index 025b608..44e741f 100644
> --- a/hw/arm/imx25_pdk.c
> +++ b/hw/arm/imx25_pdk.c
> @@ -139,7 +139,7 @@ static void imx25_pdk_init(MachineState *machine)
>           * of simple qtest. See "make check" for details.
>           */
>          i2c_create_slave((I2CBus *)qdev_get_child_bus(DEVICE(&s->soc.i2c[0]),
> -                                                      "i2c"),
> +                                                      "i2c-bus.0"),
>                           "ds1338", 0x68);
>      }
>  }
> diff --git a/hw/i2c/imx_i2c.c b/hw/i2c/imx_i2c.c
> index 37e5a62..6c81b98 100644
> --- a/hw/i2c/imx_i2c.c
> +++ b/hw/i2c/imx_i2c.c
> @@ -310,7 +310,7 @@ static void imx_i2c_realize(DeviceState *dev, Error **errp)
>                            IMX_I2C_MEM_SIZE);
>      sysbus_init_mmio(SYS_BUS_DEVICE(dev), &s->iomem);
>      sysbus_init_irq(SYS_BUS_DEVICE(dev), &s->irq);
> -    s->bus = i2c_init_bus(DEVICE(dev), "i2c");
> +    s->bus = i2c_init_bus(DEVICE(dev), NULL);
>  }
>
>  static void imx_i2c_class_init(ObjectClass *klass, void *data)

This change looks OK to me, but it is an incompatible change to the
command line (albeit only one where you couldn't have reliably
used the command line to start with), so I'm just cc'ing
Jean-Christophe Dubois, who's been active with the iMX code in the
past, for a second opinion.

We should flag this up in 2.9's Changelog as well.

thanks
-- PMM
