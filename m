Received: by 10.103.86.15 with SMTP id k15csp1549248vsb;
        Fri, 16 Dec 2016 12:17:28 -0800 (PST)
X-Received: by 10.200.41.100 with SMTP id z33mr4312983qtz.154.1481919448295;
        Fri, 16 Dec 2016 12:17:28 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 23si4068877qkd.84.2016.12.16.12.17.27
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 16 Dec 2016 12:17:28 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:34158 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cHywX-0006nA-Sg
	for alex.bennee@linaro.org; Fri, 16 Dec 2016 15:17:25 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53390)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jcd@tribudubois.net>) id 1cHywR-0006iT-5x
	for qemu-arm@nongnu.org; Fri, 16 Dec 2016 15:17:20 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jcd@tribudubois.net>) id 1cHywM-0005GW-6v
	for qemu-arm@nongnu.org; Fri, 16 Dec 2016 15:17:19 -0500
Received: from relay3-d.mail.gandi.net ([217.70.183.195]:43642)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <jcd@tribudubois.net>)
	id 1cHywL-0005EZ-WC; Fri, 16 Dec 2016 15:17:14 -0500
Received: from mfilter45-d.gandi.net (mfilter45-d.gandi.net [217.70.178.176])
	by relay3-d.mail.gandi.net (Postfix) with ESMTP id CD473A80BE;
	Fri, 16 Dec 2016 21:17:10 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at mfilter45-d.gandi.net
Received: from relay3-d.mail.gandi.net ([IPv6:::ffff:217.70.183.195])
	by mfilter45-d.gandi.net (mfilter45-d.gandi.net [::ffff:10.0.15.180])
	(amavisd-new, port 10024)
	with ESMTP id FjWuoHz3oM8H; Fri, 16 Dec 2016 21:17:09 +0100 (CET)
X-Originating-IP: 78.235.240.156
Received: from [192.168.1.155] (smm49-1-78-235-240-156.fbx.proxad.net
	[78.235.240.156]) (Authenticated sender: jcd@tribudubois.net)
	by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 90820A80D8;
	Fri, 16 Dec 2016 21:17:04 +0100 (CET)
To: Peter Maydell <peter.maydell@linaro.org>,
	Alastair D'Silva <alastair@au1.ibm.com>
References: <20161215054812.12602-1-alastair@au1.ibm.com>
	<20161215054812.12602-2-alastair@au1.ibm.com>
	<CAFEAcA9RpMAHTrPb2GNQYh+P-svcpHB90h0qcs27CUBDyY1=Ng@mail.gmail.com>
From: Jean-Christophe DUBOIS <jcd@tribudubois.net>
Message-ID: <f85d31c0-8cc2-611d-0058-2db4d0d8e943@tribudubois.net>
Date: Fri, 16 Dec 2016 21:17:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.5.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9RpMAHTrPb2GNQYh+P-svcpHB90h0qcs27CUBDyY1=Ng@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 217.70.183.195
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
	qemu-arm <qemu-arm@nongnu.org>, Joel Stanley <joel@jms.id.au>,
	Alastair D'Silva <alastair@d-silva.org>,
	=?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: WIJjmP/aypUs

Le 16/12/2016 à 14:03, Peter Maydell a écrit :
> On 15 December 2016 at 05:48, Alastair D'Silva <alastair@au1.ibm.com> wrote:
>> From: Alastair D'Silva <alastair@d-silva.org>
>>
>> The imx25 chip provides 3 i2c buses, but they have all been named
>> "i2c", which makes it difficult to predict which bus a device will
>> be connected to when specified on the command line.
>>
>> This patch addresses the issue by naming the buses uniquely:
>>    i2c-bus.0 i2c-bus.1 i2c-bus.2
>>
>> Signed-off-by: Alastair D'Silva <alastair@d-silva.org>
>> ---
>>   hw/arm/imx25_pdk.c | 2 +-
>>   hw/i2c/imx_i2c.c   | 2 +-
>>   2 files changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/hw/arm/imx25_pdk.c b/hw/arm/imx25_pdk.c
>> index 025b608..44e741f 100644
>> --- a/hw/arm/imx25_pdk.c
>> +++ b/hw/arm/imx25_pdk.c
>> @@ -139,7 +139,7 @@ static void imx25_pdk_init(MachineState *machine)
>>            * of simple qtest. See "make check" for details.
>>            */
>>           i2c_create_slave((I2CBus *)qdev_get_child_bus(DEVICE(&s->soc.i2c[0]),
>> -                                                      "i2c"),
>> +                                                      "i2c-bus.0"),
>>                            "ds1338", 0x68);
>>       }
>>   }
>> diff --git a/hw/i2c/imx_i2c.c b/hw/i2c/imx_i2c.c
>> index 37e5a62..6c81b98 100644
>> --- a/hw/i2c/imx_i2c.c
>> +++ b/hw/i2c/imx_i2c.c
>> @@ -310,7 +310,7 @@ static void imx_i2c_realize(DeviceState *dev, Error **errp)
>>                             IMX_I2C_MEM_SIZE);
>>       sysbus_init_mmio(SYS_BUS_DEVICE(dev), &s->iomem);
>>       sysbus_init_irq(SYS_BUS_DEVICE(dev), &s->irq);
>> -    s->bus = i2c_init_bus(DEVICE(dev), "i2c");
>> +    s->bus = i2c_init_bus(DEVICE(dev), NULL);
>>   }
>>
>>   static void imx_i2c_class_init(ObjectClass *klass, void *data)
> This change looks OK to me, but it is an incompatible change to the
> command line (albeit only one where you couldn't have reliably
> used the command line to start with), so I'm just cc'ing
> Jean-Christophe Dubois, who's been active with the iMX code in the
> past, for a second opinion.

This change seems fine to me too.

JC

>
> We should flag this up in 2.9's Changelog as well.
>
> thanks
> -- PMM
>

