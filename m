Received: by 10.25.159.131 with SMTP id i125csp616036lfe;
        Wed, 30 Nov 2016 19:11:43 -0800 (PST)
X-Received: by 10.55.40.229 with SMTP id o98mr30799260qko.260.1480561903571;
        Wed, 30 Nov 2016 19:11:43 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 19si39325627qku.8.2016.11.30.19.11.43
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 30 Nov 2016 19:11:43 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ozlabs-ru.20150623.gappssmtp.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:47796 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cCHmg-0001Vd-ST
	for alex.bennee@linaro.org; Wed, 30 Nov 2016 22:11:42 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44596)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aik@ozlabs.ru>) id 1cCHmB-0001VH-B1
	for qemu-devel@nongnu.org; Wed, 30 Nov 2016 22:11:12 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aik@ozlabs.ru>) id 1cCHm6-00018F-KO
	for qemu-devel@nongnu.org; Wed, 30 Nov 2016 22:11:11 -0500
Received: from mail-pg0-x244.google.com ([2607:f8b0:400e:c05::244]:36465)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <aik@ozlabs.ru>) id 1cCHm6-00017C-6g
	for qemu-devel@nongnu.org; Wed, 30 Nov 2016 22:11:06 -0500
Received: by mail-pg0-x244.google.com with SMTP id x23so3120089pgx.3
	for <qemu-devel@nongnu.org>; Wed, 30 Nov 2016 19:11:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ozlabs-ru.20150623.gappssmtp.com; s=20150623;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=Uo3NKh3dXMnlUgj55lxFFN7t9JRPoHGYfnKgU2nAKDM=;
	b=unrOwvjnP18Iguc/mPPPcIQuLgOo234iuu/FocB2yLyq0wVuF75nVuiYsXF+0G32I9
	pFU91I9QYn9fjmnWk0vxJkb8+s1SbUFHaKPPmipWw3ndN7uzmqXT9XB3S1vDeqY8kmnG
	LX+fqZNRH/Me7C8bcUUB/z2YXnBSfCmBOz3IQGJY91beIkPBjaLzpuqJFDVZURu7wljx
	vuxBzP8kFBUhuM5wN5YG+NvB31AC2ZTjnYKmwvgPo5oPNwV55eXicWD6kp29OeF9qyIJ
	LhxVIjPbYFS5dppIcEUYgIMp50DsdA/ZzKXH+1O/er2sEqnZEhePry20bFAIja4oQjz2
	qwxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=Uo3NKh3dXMnlUgj55lxFFN7t9JRPoHGYfnKgU2nAKDM=;
	b=bAjDYhb0KwkLN2zAjOX1THKs06BG0iQ1f313LWcsgZJG13FEZMqbQr/+a0V2P6vpxr
	Ts9hnd1fue+dWCioyjjJaRZ7nq3X+HwejREFGcDvIyU0AuPOA8nL36JLCvg4z4L/mere
	S9UHNTJ0S+qekVpvoAxBC8mu5Lny8zs6OdklpMVtbsoxnlzn4lsFPPzms3xAclsC+3lr
	umPuKuic+kdO7rpgVlmP4qkAk08kl8atgUFzQ1zgafi35NHP5wGNSxo7gsjYGQ39SCTE
	0GOMOWl/6HSZtpBah8RZ2SsyeVOBt2tffM9WjMQBmB6V4TaqkxZ0MyZunMNhGtXGCGnW
	ZqxA==
X-Gm-Message-State: AKaTC01DCWAmOtGbDJuTEm3a37q7Xu7rZeB/P9XjncMgfb2GHdwxXxnLIlsL+VaA7mHatA==
X-Received: by 10.84.215.137 with SMTP id l9mr79583088pli.21.1480561845623;
	Wed, 30 Nov 2016 19:10:45 -0800 (PST)
Received: from [10.61.2.175] ([122.99.82.10])
	by smtp.googlemail.com with ESMTPSA id
	d15sm105863884pfl.46.2016.11.30.19.10.41
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 30 Nov 2016 19:10:44 -0800 (PST)
To: Alastair D'Silva <alastair@au1.ibm.com>, =?UTF-8?Q?C=c3=a9dric_Le_Goater?=
	<clg@kaod.org>, qemu-arm@nongnu.org
References: <20161130053629.23340-1-alastair@au1.ibm.com>
	<20161130053629.23340-2-alastair@au1.ibm.com>
	<3d8a8cdf-5f33-4803-7048-203ed8195f9e@kaod.org>
	<1480552932.2452.30.camel@au1.ibm.com>
From: Alexey Kardashevskiy <aik@ozlabs.ru>
Message-ID: <0e2c21dc-2fed-0d2c-3797-8a6bc5079c43@ozlabs.ru>
Date: Thu, 1 Dec 2016 14:10:39 +1100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <1480552932.2452.30.camel@au1.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400e:c05::244
Subject: Re: [Qemu-devel] [PATCH v2 1/6] arm: Uniquely name imx25 I2C buses.
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: kL5nLDK3Kx8r

On 01/12/16 11:42, Alastair D'Silva wrote:
> On Wed, 2016-11-30 at 09:18 +0100, Cédric Le Goater wrote:
>> On 11/30/2016 06:36 AM, Alastair D'Silva wrote:
>>> From: Alastair D'Silva <alastair@d-silva.org>
>>>
>>> The imx25 chip provides 3 i2c buses, but they have all been named
>>> "i2c", which makes it difficult to predict which bus a device will
>>> be connected to when specified on the command line.
>>>
>>> This patch addresses the issue by naming the buses uniquely:
>>>   i2c.0 i2c.1 i2c.2

It is still not guaranteed that first in the command will get "i2c.0" name,
second - "i2c.1", etc.

Just pass id=i2cX via the command line explicitly when creating a i2c bus
device and use it as a bus id, and I am pretty sure QEMU will add a period
and a number itself.



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
>>>  
>>> diff --git a/hw/i2c/imx_i2c.c b/hw/i2c/imx_i2c.c
>>> index 37e5a62..7be10fb 100644
>>> --- a/hw/i2c/imx_i2c.c
>>> +++ b/hw/i2c/imx_i2c.c
>>> @@ -305,12 +305,16 @@ static const VMStateDescription
>>> imx_i2c_vmstate = {
>>>  static void imx_i2c_realize(DeviceState *dev, Error **errp)
>>>  {
>>>      IMXI2CState *s = IMX_I2C(dev);
>>> +    static int bus_count;
>>
>> hmm, the static is ugly :/ 
>>
>> Isn't there other ways to achieve this naming ? 
>>
>> Thanks,
>>
>> C.  
>>
> 
> I'm not seeing an obvious way around it. The busses are realized
> independently (so I can't implement what we do with the aspeed i2c
> busses), and it is named before fsl-imx25:fsl_imx25_realize() can apply
> specific properties to the bus.
> 
> If you have any suggestions, I'm all ears.


-- 
Alexey
