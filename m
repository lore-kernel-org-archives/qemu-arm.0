Received: by 10.25.159.131 with SMTP id i125csp165525lfe;
        Wed, 30 Nov 2016 00:18:48 -0800 (PST)
X-Received: by 10.200.49.33 with SMTP id g30mr27799326qtb.184.1480493928091;
        Wed, 30 Nov 2016 00:18:48 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g46si29670734qtg.137.2016.11.30.00.18.47
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 30 Nov 2016 00:18:48 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:41904 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cC06J-0005dd-Hp
	for alex.bennee@linaro.org; Wed, 30 Nov 2016 03:18:47 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35972)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1cC06D-0005cX-Ok
	for qemu-arm@nongnu.org; Wed, 30 Nov 2016 03:18:42 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1cC06A-0003w7-Jl
	for qemu-arm@nongnu.org; Wed, 30 Nov 2016 03:18:41 -0500
Received: from 3.mo69.mail-out.ovh.net ([188.165.52.203]:43530)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1cC06A-0003vP-EO
	for qemu-arm@nongnu.org; Wed, 30 Nov 2016 03:18:38 -0500
Received: from player699.ha.ovh.net (b9.ovh.net [213.186.33.59])
	by mo69.mail-out.ovh.net (Postfix) with ESMTP id 21CB1D15F
	for <qemu-arm@nongnu.org>; Wed, 30 Nov 2016 09:18:37 +0100 (CET)
Received: from hermes.kaod.org (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
	[90.76.55.107]) (Authenticated sender: postmaster@kaod.org)
	by player699.ha.ovh.net (Postfix) with ESMTPSA id BBD6D240088;
	Wed, 30 Nov 2016 09:18:30 +0100 (CET)
To: Alastair D'Silva <alastair@au1.ibm.com>, qemu-arm@nongnu.org
References: <20161130053629.23340-1-alastair@au1.ibm.com>
	<20161130053629.23340-2-alastair@au1.ibm.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <3d8a8cdf-5f33-4803-7048-203ed8195f9e@kaod.org>
Date: Wed, 30 Nov 2016 09:18:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <20161130053629.23340-2-alastair@au1.ibm.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 10042182747249609495
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeelfedrfeekgdduudejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 188.165.52.203
Subject: Re: [Qemu-arm] [PATCH v2 1/6] arm: Uniquely name imx25 I2C buses.
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Peter Maydell <peter.maydell@linaro.org>,
	Alastair D'Silva <alastair@d-silva.org>, qemu-devel@nongnu.org,
	Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: DLkFBK90yx7O

On 11/30/2016 06:36 AM, Alastair D'Silva wrote:
> From: Alastair D'Silva <alastair@d-silva.org>
> 
> The imx25 chip provides 3 i2c buses, but they have all been named
> "i2c", which makes it difficult to predict which bus a device will
> be connected to when specified on the command line.
> 
> This patch addresses the issue by naming the buses uniquely:
>   i2c.0 i2c.1 i2c.2
> 
> Signed-off-by: Alastair D'Silva <alastair@d-silva.org>
> ---
>  hw/arm/imx25_pdk.c | 4 +---
>  hw/i2c/imx_i2c.c   | 6 +++++-
>  2 files changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/hw/arm/imx25_pdk.c b/hw/arm/imx25_pdk.c
> index 025b608..c6f04d3 100644
> --- a/hw/arm/imx25_pdk.c
> +++ b/hw/arm/imx25_pdk.c
> @@ -138,9 +138,7 @@ static void imx25_pdk_init(MachineState *machine)
>           * We add it here (only on qtest usage) to be able to do a bit
>           * of simple qtest. See "make check" for details.
>           */
> -        i2c_create_slave((I2CBus *)qdev_get_child_bus(DEVICE(&s->soc.i2c[0]),
> -                                                      "i2c"),
> -                         "ds1338", 0x68);
> +        i2c_create_slave(s->soc.i2c[0].bus, "ds1338", 0x68);
>      }
>  }
>  
> diff --git a/hw/i2c/imx_i2c.c b/hw/i2c/imx_i2c.c
> index 37e5a62..7be10fb 100644
> --- a/hw/i2c/imx_i2c.c
> +++ b/hw/i2c/imx_i2c.c
> @@ -305,12 +305,16 @@ static const VMStateDescription imx_i2c_vmstate = {
>  static void imx_i2c_realize(DeviceState *dev, Error **errp)
>  {
>      IMXI2CState *s = IMX_I2C(dev);
> +    static int bus_count;

hmm, the static is ugly :/ 

Isn't there other ways to achieve this naming ? 

Thanks,

C.  

> +    char name[16];
> +
> +    snprintf(name, sizeof(name), "i2c.%d", bus_count++);
>  
>      memory_region_init_io(&s->iomem, OBJECT(s), &imx_i2c_ops, s, TYPE_IMX_I2C,
>                            IMX_I2C_MEM_SIZE);
>      sysbus_init_mmio(SYS_BUS_DEVICE(dev), &s->iomem);
>      sysbus_init_irq(SYS_BUS_DEVICE(dev), &s->irq);
> -    s->bus = i2c_init_bus(DEVICE(dev), "i2c");
> +    s->bus = i2c_init_bus(DEVICE(dev), name);
>  }
>  
>  static void imx_i2c_class_init(ObjectClass *klass, void *data)
> 

