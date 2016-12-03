Received: by 10.25.159.131 with SMTP id i125csp628018lfe;
        Fri, 2 Dec 2016 23:16:27 -0800 (PST)
X-Received: by 10.55.19.102 with SMTP id d99mr12446797qkh.205.1480749387567;
        Fri, 02 Dec 2016 23:16:27 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n12si4757833qtn.239.2016.12.02.23.16.27
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 02 Dec 2016 23:16:27 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@ozlabs-ru.20150623.gappssmtp.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:38076 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cD4Yc-0005GU-8t
	for alex.bennee@linaro.org; Sat, 03 Dec 2016 02:16:26 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49228)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aik@ozlabs.ru>) id 1cD4YX-0005GI-LL
	for qemu-arm@nongnu.org; Sat, 03 Dec 2016 02:16:23 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aik@ozlabs.ru>) id 1cD4YT-00006z-Gv
	for qemu-arm@nongnu.org; Sat, 03 Dec 2016 02:16:21 -0500
Received: from mail-pg0-x241.google.com ([2607:f8b0:400e:c05::241]:34984)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <aik@ozlabs.ru>) id 1cD4YT-00006E-7s
	for qemu-arm@nongnu.org; Sat, 03 Dec 2016 02:16:17 -0500
Received: by mail-pg0-x241.google.com with SMTP id p66so10125750pga.2
	for <qemu-arm@nongnu.org>; Fri, 02 Dec 2016 23:16:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ozlabs-ru.20150623.gappssmtp.com; s=20150623;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=ya3JQSk19FKXiOw0rrVDQ8egbk9l9GeEfp7xP5wVT1A=;
	b=SHKkWDT2PQMwfyt+pqBIAY0O05Z7px+K5sHX2nKd55G5YRnmR8haUlaxU6t9DMDq2H
	d7tKSzuG6wmpzhSsBLUyPB5ACcuLnZTM9FObgnHZ8suLtYD4AND/GFQXF+gOXINtpBB8
	1Z6DoZzmrfSSkuAvCFMr+oOroWbAMMNt2wzFTQm5Y5JbdGHQut00+noLdlzWgeGkBl85
	lM3ntcTQ4r70hEsd9tU0FQ4JFgYY0ZDxpxX/Ff+tZk0cOuJzOFOKQTQVQD5gGczoPkQW
	ApyurXNQw0SofLJVxV/y8T9Sj17h4urbao24vTVcjr8VK/VliOY9rYsg4Oiw3Scy7/t3
	n6sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=ya3JQSk19FKXiOw0rrVDQ8egbk9l9GeEfp7xP5wVT1A=;
	b=UypcR4hVpuAIawqnmj+Xj0Ijb15c5l+DOTL/HSuPqRYS2+q6XNtqnTq+lV2PS0BXxp
	s+QIeVF8gCyXTamfU0gf0KZO8IA3tutu9Xa6PR7YjMoGfSggP0Jf3j8elY6nva9lO1oH
	5O71aAaa6ujhK8MwTP5oazd44Db1tITJ4a57HonKuMUAPI70qpHAxVuPmWTS7BpcPrLL
	fXtk6skpcijTvEMBeHlABti1yY3QRuwkbuMVRP1sd+sb/aXKD1K0/ggq5mKpjGdsBBcg
	tD4TxTHOvf2l3bGhxu7c6+B0V9o56nXSLD5z17i5p6AM9jD4VsrroRz0LwwQSZCkr2Qu
	/j0Q==
X-Gm-Message-State: AKaTC006tQXpkKYEWbMorF7w1kXHRRx9enz5QFFJIjJOHCi7Ga+ZbaUuNvvH+fufM/5zgg==
X-Received: by 10.99.189.26 with SMTP id a26mr13776790pgf.67.1480749374662;
	Fri, 02 Dec 2016 23:16:14 -0800 (PST)
Received: from [192.168.1.21] (124-171-71-189.dyn.iinet.net.au.
	[124.171.71.189]) by smtp.googlemail.com with ESMTPSA id
	k25sm12229327pfg.84.2016.12.02.23.16.09
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 02 Dec 2016 23:16:13 -0800 (PST)
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
	Alastair D'Silva <alastair@au1.ibm.com>, qemu-arm@nongnu.org
References: <20161130053629.23340-1-alastair@au1.ibm.com>
	<20161130053629.23340-2-alastair@au1.ibm.com>
	<3d8a8cdf-5f33-4803-7048-203ed8195f9e@kaod.org>
	<1480552932.2452.30.camel@au1.ibm.com>
	<bc1eab8e-4cc2-1b4f-134f-650716a3796b@kaod.org>
	<88ffba74-69c0-2779-0e1b-c05ab253e60d@ozlabs.ru>
	<6b98cfc0-bd2a-81d8-7222-51ba4171ba73@kaod.org>
From: Alexey Kardashevskiy <aik@ozlabs.ru>
Message-ID: <f186365b-2f37-2ccf-ee46-03285a503880@ozlabs.ru>
Date: Sat, 3 Dec 2016 18:16:06 +1100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <6b98cfc0-bd2a-81d8-7222-51ba4171ba73@kaod.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400e:c05::241
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2 1/6] arm: Uniquely name imx25
 I2C buses.
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
X-TUID: pihv7THJypqZ

On 02/12/16 18:55, Cédric Le Goater wrote:
> On 12/02/2016 12:34 AM, Alexey Kardashevskiy wrote:
>> On 01/12/16 23:31, Cédric Le Goater wrote:
>>> On 12/01/2016 01:42 AM, Alastair D'Silva wrote:
>>>> On Wed, 2016-11-30 at 09:18 +0100, Cédric Le Goater wrote:
>>>>> On 11/30/2016 06:36 AM, Alastair D'Silva wrote:
>>>>>> From: Alastair D'Silva <alastair@d-silva.org>
>>>>>>
>>>>>> The imx25 chip provides 3 i2c buses, but they have all been named
>>>>>> "i2c", which makes it difficult to predict which bus a device will
>>>>>> be connected to when specified on the command line.
>>>>>>
>>>>>> This patch addresses the issue by naming the buses uniquely:
>>>>>>   i2c.0 i2c.1 i2c.2
>>>>>>
>>>>>> Signed-off-by: Alastair D'Silva <alastair@d-silva.org>
>>>>>> ---
>>>>>>  hw/arm/imx25_pdk.c | 4 +---
>>>>>>  hw/i2c/imx_i2c.c   | 6 +++++-
>>>>>>  2 files changed, 6 insertions(+), 4 deletions(-)
>>>>>>
>>>>>> diff --git a/hw/arm/imx25_pdk.c b/hw/arm/imx25_pdk.c
>>>>>> index 025b608..c6f04d3 100644
>>>>>> --- a/hw/arm/imx25_pdk.c
>>>>>> +++ b/hw/arm/imx25_pdk.c
>>>>>> @@ -138,9 +138,7 @@ static void imx25_pdk_init(MachineState
>>>>>> *machine)
>>>>>>           * We add it here (only on qtest usage) to be able to do a
>>>>>> bit
>>>>>>           * of simple qtest. See "make check" for details.
>>>>>>           */
>>>>>> -        i2c_create_slave((I2CBus *)qdev_get_child_bus(DEVICE(&s-
>>>>>>> soc.i2c[0]),
>>>>>> -                                                      "i2c"),
>>>>>> -                         "ds1338", 0x68);
>>>>>> +        i2c_create_slave(s->soc.i2c[0].bus, "ds1338", 0x68);
>>>>>>      }
>>>>>>  }
>>>>>>  
>>>>>> diff --git a/hw/i2c/imx_i2c.c b/hw/i2c/imx_i2c.c
>>>>>> index 37e5a62..7be10fb 100644
>>>>>> --- a/hw/i2c/imx_i2c.c
>>>>>> +++ b/hw/i2c/imx_i2c.c
>>>>>> @@ -305,12 +305,16 @@ static const VMStateDescription
>>>>>> imx_i2c_vmstate = {
>>>>>>  static void imx_i2c_realize(DeviceState *dev, Error **errp)
>>>>>>  {
>>>>>>      IMXI2CState *s = IMX_I2C(dev);
>>>>>> +    static int bus_count;
>>>>>
>>>>> hmm, the static is ugly :/ 
>>>>>
>>>>> Isn't there other ways to achieve this naming ? 
>>>>>
>>>>> Thanks,
>>>>>
>>>>> C.  
>>>>>
>>>>
>>>> I'm not seeing an obvious way around it. The busses are realized
>>>> independently (so I can't implement what we do with the aspeed i2c
>>>> busses), and it is named before fsl-imx25:fsl_imx25_realize() can apply
>>>> specific properties to the bus.
>>>>
>>>> If you have any suggestions, I'm all ears.
>>>
>>> What about that ? 
>>>
>>> 	@@ -310,7 +310,7 @@ static void imx_i2c_realize(DeviceState
>>> 	                           IMX_I2C_MEM_SIZE);
>>> 	     sysbus_init_mmio(SYS_BUS_DEVICE(dev), &s->iomem);
>>> 	     sysbus_init_irq(SYS_BUS_DEVICE(dev), &s->irq);
>>> 	-    s->bus = i2c_init_bus(DEVICE(dev), "i2c");
>>> 	+    s->bus = i2c_init_bus(DEVICE(dev), NULL);
>>> 	 }
>>>  
>>>  static void imx_i2c_class_init(ObjectClass *klass, void *data)
>>>
>>> Which should name automatically the I2C objects :
>>
>>
>> If you ever do migration, you'll have to specify "id" in the command line
>> anyway. Even in the example below the buses are numbered in messed order,
>> is that desired effect (may be it is, just asking :) )?
> 
> That's how it comes out with qom-tree. I haven't dug deeper to see 
> how this was implemented.

That's fine, your approach will give unique names, it is just hard to
predict what i2c device will end up connected to which i2c bus, and I
usually want to control this instead of guessing (which will work till some
nonobvious change in QOM :) ).


> 
> C.
> 
>>>
>>> 	(qemu) info qom-tree 
>>> 	/machine (imx25-pdk-machine)
>>> 	  /peripheral (container)
>>> 	  /soc (fsl,imx25)
>>> 	  /peripheral-anon (container)
>>> 	  /unattached (container)
>>> 	    /device[0] (arm926-arm-cpu)
>>> 	      /unnamed-gpio-in[1] (irq)
>>> 	      /unnamed-gpio-in[3] (irq)
>>> 	      /unnamed-gpio-in[2] (irq)
>>> 	      /unnamed-gpio-in[0] (irq)
>>>
>>> 	    /device[15] (imx.i2c)
>>> 	      /imx.i2c[0] (qemu:memory-region)
>>> 	      /i2c-bus.0 (i2c-bus)
>>> 	    /device[17] (imx.i2c)
>>> 	      /imx.i2c[0] (qemu:memory-region)
>>> 	      /i2c-bus.2 (i2c-bus)
>>> 	    /device[16] (imx.i2c)
>>> 	      /imx.i2c[0] (qemu:memory-region)
>>> 	      /i2c-bus.1 (i2c-bus)
>>> 	   ....
>>>
>>>
>>> Cheers,
>>>
>>> C. 
>>>
>>
>>
> 


-- 
Alexey
