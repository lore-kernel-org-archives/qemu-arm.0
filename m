Received: by 10.25.159.131 with SMTP id i125csp1101479lfe;
        Thu, 1 Dec 2016 15:35:16 -0800 (PST)
X-Received: by 10.55.151.199 with SMTP id z190mr38833128qkd.166.1480635316091;
        Thu, 01 Dec 2016 15:35:16 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b14si1446225qtb.152.2016.12.01.15.35.15
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 01 Dec 2016 15:35:16 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@ozlabs-ru.20150623.gappssmtp.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:59410 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cCasl-0007GL-HJ
	for alex.bennee@linaro.org; Thu, 01 Dec 2016 18:35:15 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45247)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aik@ozlabs.ru>) id 1cCasf-0007DH-Gi
	for qemu-arm@nongnu.org; Thu, 01 Dec 2016 18:35:10 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aik@ozlabs.ru>) id 1cCasa-0001c2-QQ
	for qemu-arm@nongnu.org; Thu, 01 Dec 2016 18:35:09 -0500
Received: from mail-pf0-x244.google.com ([2607:f8b0:400e:c00::244]:35749)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <aik@ozlabs.ru>) id 1cCasa-0001bf-Id
	for qemu-arm@nongnu.org; Thu, 01 Dec 2016 18:35:04 -0500
Received: by mail-pf0-x244.google.com with SMTP id i88so3136503pfk.2
	for <qemu-arm@nongnu.org>; Thu, 01 Dec 2016 15:35:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ozlabs-ru.20150623.gappssmtp.com; s=20150623;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=ave4KuStgYGTCp9U6yeTDJeNBDDROCH0VGE/K9lpk3E=;
	b=Ahu6EAh19ejKfIvkEBWQVxovqaa9SKKpGab6VkvexBnRGHUpq05hPrF/AMTRX9eCr/
	BHb3NKIH88eZQjQiXEwSixsm313uX3QMLQ28Qi2rybwKkSS1lmU1parQaFAGevqnckK7
	E8usg89ttSwhIzBut+yWxCfTY8tGsWnokOgeH56KBeHq3Fpb4xfuOkPQDM52bNbua7b0
	m3J499wzrG3/dW8+Nb4rO8wrJraopND3GviaY359hwC8M8c4FQ7dyWKgTzrwVIMmf3PD
	BpwL/4XWeBNSX6Nzx8NbQA84/omYgu649jglIcGlQqpy8tG2gWaBowo7IByXntzVkTNU
	nsnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=ave4KuStgYGTCp9U6yeTDJeNBDDROCH0VGE/K9lpk3E=;
	b=jbxGPxAiIzPl03b7yFNn1bkqNn1ngFrCYiVjCfBaHW5hyADI9XeSyFcvOPscrQxr+7
	8bRlZC93YA7nF56MEd+OpAVKpOePXXXTCbyM6NdwaAl9h4bZG9WSgrDgx8MticnpuV1b
	UGAIGtyZs6Wnb/2xNNf8RGBFAibvr1muscrpkqKEv7u7y2N4izZYs4MuH5X6BUnqzfk6
	+vH2MDOo5Y7X7f2PyZN98MlFJH5WlRr/kqniY6U5jHcKJi7UvY16qqtE9HlnfQ4JQa08
	P37srYZ8PLCzN5/HxIBYORCwZtafLUQma3YMddd4pqoKWe48R9jO1R84dEQSdIweBN2A
	qyEg==
X-Gm-Message-State: AKaTC01cdG6qSlYfXGNNWHjWH/IR6P8IzkXmc2ybbVQ5S/0JOYHCx2bK+nnBPXG14185PA==
X-Received: by 10.99.146.13 with SMTP id o13mr12415440pgd.3.1480635303304;
	Thu, 01 Dec 2016 15:35:03 -0800 (PST)
Received: from [10.61.2.175] ([122.99.82.10])
	by smtp.googlemail.com with ESMTPSA id
	a11sm2453918pfe.96.2016.12.01.15.34.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 01 Dec 2016 15:35:02 -0800 (PST)
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
	Alastair D'Silva <alastair@au1.ibm.com>, qemu-arm@nongnu.org
References: <20161130053629.23340-1-alastair@au1.ibm.com>
	<20161130053629.23340-2-alastair@au1.ibm.com>
	<3d8a8cdf-5f33-4803-7048-203ed8195f9e@kaod.org>
	<1480552932.2452.30.camel@au1.ibm.com>
	<bc1eab8e-4cc2-1b4f-134f-650716a3796b@kaod.org>
From: Alexey Kardashevskiy <aik@ozlabs.ru>
Message-ID: <88ffba74-69c0-2779-0e1b-c05ab253e60d@ozlabs.ru>
Date: Fri, 2 Dec 2016 10:34:56 +1100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <bc1eab8e-4cc2-1b4f-134f-650716a3796b@kaod.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400e:c00::244
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
X-TUID: p6tkkoLWEv+v

On 01/12/16 23:31, Cédric Le Goater wrote:
> On 12/01/2016 01:42 AM, Alastair D'Silva wrote:
>> On Wed, 2016-11-30 at 09:18 +0100, Cédric Le Goater wrote:
>>> On 11/30/2016 06:36 AM, Alastair D'Silva wrote:
>>>> From: Alastair D'Silva <alastair@d-silva.org>
>>>>
>>>> The imx25 chip provides 3 i2c buses, but they have all been named
>>>> "i2c", which makes it difficult to predict which bus a device will
>>>> be connected to when specified on the command line.
>>>>
>>>> This patch addresses the issue by naming the buses uniquely:
>>>>   i2c.0 i2c.1 i2c.2
>>>>
>>>> Signed-off-by: Alastair D'Silva <alastair@d-silva.org>
>>>> ---
>>>>  hw/arm/imx25_pdk.c | 4 +---
>>>>  hw/i2c/imx_i2c.c   | 6 +++++-
>>>>  2 files changed, 6 insertions(+), 4 deletions(-)
>>>>
>>>> diff --git a/hw/arm/imx25_pdk.c b/hw/arm/imx25_pdk.c
>>>> index 025b608..c6f04d3 100644
>>>> --- a/hw/arm/imx25_pdk.c
>>>> +++ b/hw/arm/imx25_pdk.c
>>>> @@ -138,9 +138,7 @@ static void imx25_pdk_init(MachineState
>>>> *machine)
>>>>           * We add it here (only on qtest usage) to be able to do a
>>>> bit
>>>>           * of simple qtest. See "make check" for details.
>>>>           */
>>>> -        i2c_create_slave((I2CBus *)qdev_get_child_bus(DEVICE(&s-
>>>>> soc.i2c[0]),
>>>> -                                                      "i2c"),
>>>> -                         "ds1338", 0x68);
>>>> +        i2c_create_slave(s->soc.i2c[0].bus, "ds1338", 0x68);
>>>>      }
>>>>  }
>>>>  
>>>> diff --git a/hw/i2c/imx_i2c.c b/hw/i2c/imx_i2c.c
>>>> index 37e5a62..7be10fb 100644
>>>> --- a/hw/i2c/imx_i2c.c
>>>> +++ b/hw/i2c/imx_i2c.c
>>>> @@ -305,12 +305,16 @@ static const VMStateDescription
>>>> imx_i2c_vmstate = {
>>>>  static void imx_i2c_realize(DeviceState *dev, Error **errp)
>>>>  {
>>>>      IMXI2CState *s = IMX_I2C(dev);
>>>> +    static int bus_count;
>>>
>>> hmm, the static is ugly :/ 
>>>
>>> Isn't there other ways to achieve this naming ? 
>>>
>>> Thanks,
>>>
>>> C.  
>>>
>>
>> I'm not seeing an obvious way around it. The busses are realized
>> independently (so I can't implement what we do with the aspeed i2c
>> busses), and it is named before fsl-imx25:fsl_imx25_realize() can apply
>> specific properties to the bus.
>>
>> If you have any suggestions, I'm all ears.
> 
> What about that ? 
> 
> 	@@ -310,7 +310,7 @@ static void imx_i2c_realize(DeviceState
> 	                           IMX_I2C_MEM_SIZE);
> 	     sysbus_init_mmio(SYS_BUS_DEVICE(dev), &s->iomem);
> 	     sysbus_init_irq(SYS_BUS_DEVICE(dev), &s->irq);
> 	-    s->bus = i2c_init_bus(DEVICE(dev), "i2c");
> 	+    s->bus = i2c_init_bus(DEVICE(dev), NULL);
> 	 }
>  
>  static void imx_i2c_class_init(ObjectClass *klass, void *data)
> 
> Which should name automatically the I2C objects :


If you ever do migration, you'll have to specify "id" in the command line
anyway. Even in the example below the buses are numbered in messed order,
is that desired effect (may be it is, just asking :) )?

> 
> 	(qemu) info qom-tree 
> 	/machine (imx25-pdk-machine)
> 	  /peripheral (container)
> 	  /soc (fsl,imx25)
> 	  /peripheral-anon (container)
> 	  /unattached (container)
> 	    /device[0] (arm926-arm-cpu)
> 	      /unnamed-gpio-in[1] (irq)
> 	      /unnamed-gpio-in[3] (irq)
> 	      /unnamed-gpio-in[2] (irq)
> 	      /unnamed-gpio-in[0] (irq)
> 
> 	    /device[15] (imx.i2c)
> 	      /imx.i2c[0] (qemu:memory-region)
> 	      /i2c-bus.0 (i2c-bus)
> 	    /device[17] (imx.i2c)
> 	      /imx.i2c[0] (qemu:memory-region)
> 	      /i2c-bus.2 (i2c-bus)
> 	    /device[16] (imx.i2c)
> 	      /imx.i2c[0] (qemu:memory-region)
> 	      /i2c-bus.1 (i2c-bus)
> 	   ....
> 
> 
> Cheers,
> 
> C. 
> 


-- 
Alexey
