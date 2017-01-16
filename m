Received: by 10.25.205.13 with SMTP id d13csp63137lfg;
        Mon, 16 Jan 2017 07:03:48 -0800 (PST)
X-Received: by 10.55.71.74 with SMTP id u71mr34248526qka.251.1484579028736;
        Mon, 16 Jan 2017 07:03:48 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z198si11737858qka.302.2017.01.16.07.03.48
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 16 Jan 2017 07:03:48 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57628 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cT8p0-0004Uu-56
	for alex.bennee@linaro.org; Mon, 16 Jan 2017 10:03:46 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60623)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cT8kH-0000Yq-9Q
	for qemu-arm@nongnu.org; Mon, 16 Jan 2017 09:58:54 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cT8kG-0003AW-Ao
	for qemu-arm@nongnu.org; Mon, 16 Jan 2017 09:58:53 -0500
Received: from mail-ua0-x22f.google.com ([2607:f8b0:400c:c08::22f]:34045)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1cT8kG-0003AN-6V
	for qemu-arm@nongnu.org; Mon, 16 Jan 2017 09:58:52 -0500
Received: by mail-ua0-x22f.google.com with SMTP id 35so82882343uak.1
	for <qemu-arm@nongnu.org>; Mon, 16 Jan 2017 06:58:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=bUGuw3Ct3BtD37gWabK+6SzavEzHG0JFeHdW7nxJvJI=;
	b=UuT+fz0zEjdVjtAyudJDYtvYw2Yk1Fa7eatoytdwBkAOR2jWrYy3ul06dnxijOwmaT
	MG0UOMdIqUcJLJbNrXCDQtTySHxdr+Z0bjLZJwRFALjEeGFmh3cdAFGiFF12BGeXOcp9
	D4Ss0Mt+ZyBaCh91AYVbWj0KOhWJ1HxPl9flE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=bUGuw3Ct3BtD37gWabK+6SzavEzHG0JFeHdW7nxJvJI=;
	b=UM4H/2sAlMAynNtk9bTtzWevPGbtqSd/cx7WvaiDPQUJ8ejAsAUNsutVa0dHpZZae2
	QWb3YNe+YHfoGp71e/dO6rd6hCEF8Csui/i68d8inFmGB4IauOofJ/vFbJRCv4OmQyqJ
	e4u3CzqYq+8lJmRE5qolzTezko5Q0L5GYvfoqDbT9Hl4hXFGUWqyJhWv46e55jQJhrHo
	3V+VJlx8zYBSCs5QqhjL8ytfJeGloBkxT9fTC5u3lxrWVOpGgGV4V2FxouLLQ+sGsUyz
	/RqOUgNJpTVLvNFqeVAiWNbK28zpL0ipiIkOBlo070jTYpxGtzSLVO2OLycVdgm0/GoD
	NMWA==
X-Gm-Message-State: AIkVDXK2N8YDpFvcnz89sL4nEpwVbBBSo6u3jGRqNIfwS9UYHece/g9BoVZINzwUBXpYXcMtScBcc13/AgUgK2oH
X-Received: by 10.176.80.11 with SMTP id b11mr14703608uaa.140.1484578731484;
	Mon, 16 Jan 2017 06:58:51 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.176.14 with HTTP; Mon, 16 Jan 2017 06:58:31 -0800 (PST)
In-Reply-To: <20170105043430.3176-2-alastair@au1.ibm.com>
References: <20170105043430.3176-1-alastair@au1.ibm.com>
	<20170105043430.3176-2-alastair@au1.ibm.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 16 Jan 2017 14:58:31 +0000
Message-ID: <CAFEAcA-8XvxRtfd=r3gmmsCgNQEQz5LEmN2J6KS5+=iNt0UZrg@mail.gmail.com>
To: "Alastair D'Silva" <alastair@au1.ibm.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c08::22f
Subject: Re: [Qemu-arm] [PATCH v5 1/7] arm: Uniquely name imx25 I2C buses.
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
	qemu-arm <qemu-arm@nongnu.org>, Joel Stanley <joel@jms.id.au>,
	Alastair D'Silva <alastair@d-silva.org>,
	=?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: xzcOBGHd9yXD

On 5 January 2017 at 04:34, Alastair D'Silva <alastair@au1.ibm.com> wrote:
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

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

and applied to target-arm.next.

thanks
-- PMM
