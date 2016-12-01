Received: by 10.25.159.131 with SMTP id i125csp807709lfe;
        Thu, 1 Dec 2016 04:32:35 -0800 (PST)
X-Received: by 10.55.153.4 with SMTP id b4mr37201614qke.163.1480595555473;
        Thu, 01 Dec 2016 04:32:35 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u16si25357qka.100.2016.12.01.04.32.35
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 01 Dec 2016 04:32:35 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:55840 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cCQXS-0006nV-T7
	for alex.bennee@linaro.org; Thu, 01 Dec 2016 07:32:34 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42388)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1cCQWj-0006Ku-OW
	for qemu-arm@nongnu.org; Thu, 01 Dec 2016 07:31:53 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1cCQWe-0003mU-NL
	for qemu-arm@nongnu.org; Thu, 01 Dec 2016 07:31:49 -0500
Received: from 17.mo1.mail-out.ovh.net ([87.98.179.142]:50013)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1cCQWe-0003lV-HA
	for qemu-arm@nongnu.org; Thu, 01 Dec 2016 07:31:44 -0500
Received: from player726.ha.ovh.net (b7.ovh.net [213.186.33.57])
	by mo1.mail-out.ovh.net (Postfix) with ESMTP id 0081420B56
	for <qemu-arm@nongnu.org>; Thu,  1 Dec 2016 13:31:42 +0100 (CET)
Received: from hermes.kaod.org (alter.tetaneutral.net [91.224.149.189])
	(Authenticated sender: postmaster@kaod.org)
	by player726.ha.ovh.net (Postfix) with ESMTPSA id 4E94E2A007E;
	Thu,  1 Dec 2016 13:31:35 +0100 (CET)
To: Alastair D'Silva <alastair@au1.ibm.com>, qemu-arm@nongnu.org
References: <20161130053629.23340-1-alastair@au1.ibm.com>
	<20161130053629.23340-2-alastair@au1.ibm.com>
	<3d8a8cdf-5f33-4803-7048-203ed8195f9e@kaod.org>
	<1480552932.2452.30.camel@au1.ibm.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <bc1eab8e-4cc2-1b4f-134f-650716a3796b@kaod.org>
Date: Thu, 1 Dec 2016 13:31:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <1480552932.2452.30.camel@au1.ibm.com>
Content-Type: text/plain; charset=utf-8
X-Ovh-Tracer-Id: 1742048632433052627
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeelfedrgedugddvvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 87.98.179.142
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
	qemu-devel@nongnu.org, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: apqNXtgfkR89

On 12/01/2016 01:42 AM, Alastair D'Silva wrote:
> On Wed, 2016-11-30 at 09:18 +0100, C=C3=A9dric Le Goater wrote:
>> On 11/30/2016 06:36 AM, Alastair D'Silva wrote:
>>> From: Alastair D'Silva <alastair@d-silva.org>
>>>
>>> The imx25 chip provides 3 i2c buses, but they have all been named
>>> "i2c", which makes it difficult to predict which bus a device will
>>> be connected to when specified on the command line.
>>>
>>> This patch addresses the issue by naming the buses uniquely:
>>>   i2c.0 i2c.1 i2c.2
>>>
>>> Signed-off-by: Alastair D'Silva <alastair@d-silva.org>
>>> ---
>>>  hw/arm/imx25_pdk.c | 4 +---
>>>  hw/i2c/imx_i2c.c   | 6 +++++-
>>>  2 files changed, 6 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/hw/arm/imx25_pdk.c b/hw/arm/imx25_pdk.c
>>> index 025b608..c6f04d3 100644
>>> --- a/hw/arm/imx25_pdk.c
>>> +++ b/hw/arm/imx25_pdk.c
>>> @@ -138,9 +138,7 @@ static void imx25_pdk_init(MachineState
>>> *machine)
>>>           * We add it here (only on qtest usage) to be able to do a
>>> bit
>>>           * of simple qtest. See "make check" for details.
>>>           */
>>> -        i2c_create_slave((I2CBus *)qdev_get_child_bus(DEVICE(&s-
>>>> soc.i2c[0]),
>>> -                                                      "i2c"),
>>> -                         "ds1338", 0x68);
>>> +        i2c_create_slave(s->soc.i2c[0].bus, "ds1338", 0x68);
>>>      }
>>>  }
>>> =20
>>> diff --git a/hw/i2c/imx_i2c.c b/hw/i2c/imx_i2c.c
>>> index 37e5a62..7be10fb 100644
>>> --- a/hw/i2c/imx_i2c.c
>>> +++ b/hw/i2c/imx_i2c.c
>>> @@ -305,12 +305,16 @@ static const VMStateDescription
>>> imx_i2c_vmstate =3D {
>>>  static void imx_i2c_realize(DeviceState *dev, Error **errp)
>>>  {
>>>      IMXI2CState *s =3D IMX_I2C(dev);
>>> +    static int bus_count;
>>
>> hmm, the static is ugly :/=20
>>
>> Isn't there other ways to achieve this naming ?=20
>>
>> Thanks,
>>
>> C. =20
>>
>=20
> I'm not seeing an obvious way around it. The busses are realized
> independently (so I can't implement what we do with the aspeed i2c
> busses), and it is named before fsl-imx25:fsl_imx25_realize() can apply
> specific properties to the bus.
>=20
> If you have any suggestions, I'm all ears.

What about that ?=20

	@@ -310,7 +310,7 @@ static void imx_i2c_realize(DeviceState
	                           IMX_I2C_MEM_SIZE);
	     sysbus_init_mmio(SYS_BUS_DEVICE(dev), &s->iomem);
	     sysbus_init_irq(SYS_BUS_DEVICE(dev), &s->irq);
	-    s->bus =3D i2c_init_bus(DEVICE(dev), "i2c");
	+    s->bus =3D i2c_init_bus(DEVICE(dev), NULL);
	 }
=20
 static void imx_i2c_class_init(ObjectClass *klass, void *data)

Which should name automatically the I2C objects :

	(qemu) info qom-tree=20
	/machine (imx25-pdk-machine)
	  /peripheral (container)
	  /soc (fsl,imx25)
	  /peripheral-anon (container)
	  /unattached (container)
	    /device[0] (arm926-arm-cpu)
	      /unnamed-gpio-in[1] (irq)
	      /unnamed-gpio-in[3] (irq)
	      /unnamed-gpio-in[2] (irq)
	      /unnamed-gpio-in[0] (irq)

	    /device[15] (imx.i2c)
	      /imx.i2c[0] (qemu:memory-region)
	      /i2c-bus.0 (i2c-bus)
	    /device[17] (imx.i2c)
	      /imx.i2c[0] (qemu:memory-region)
	      /i2c-bus.2 (i2c-bus)
	    /device[16] (imx.i2c)
	      /imx.i2c[0] (qemu:memory-region)
	      /i2c-bus.1 (i2c-bus)
	   ....


Cheers,

C.=20
