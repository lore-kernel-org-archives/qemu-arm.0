Received: by 10.25.150.194 with SMTP id y185csp1152024lfd;
        Fri, 18 Nov 2016 00:52:58 -0800 (PST)
X-Received: by 10.28.52.201 with SMTP id b192mr8650309wma.118.1479459178292;
        Fri, 18 Nov 2016 00:52:58 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 125si1663658wmx.58.2016.11.18.00.52.58
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 18 Nov 2016 00:52:58 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:35203 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1c7eun-0006pk-2r
	for alex.bennee@linaro.org; Fri, 18 Nov 2016 03:52:57 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50748)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1c7euj-0006pa-Id
	for qemu-arm@nongnu.org; Fri, 18 Nov 2016 03:52:54 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1c7eug-0002lh-HV
	for qemu-arm@nongnu.org; Fri, 18 Nov 2016 03:52:53 -0500
Received: from 9.mo7.mail-out.ovh.net ([46.105.60.248]:47381)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1c7eug-0002lO-B6
	for qemu-arm@nongnu.org; Fri, 18 Nov 2016 03:52:50 -0500
Received: from player697.ha.ovh.net (b9.ovh.net [213.186.33.59])
	by mo7.mail-out.ovh.net (Postfix) with ESMTP id 4668F204C7
	for <qemu-arm@nongnu.org>; Fri, 18 Nov 2016 09:52:46 +0100 (CET)
Received: from hermes.kaod.org (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
	[90.76.55.107]) (Authenticated sender: clg@kaod.org)
	by player697.ha.ovh.net (Postfix) with ESMTPSA id 4F29348007A;
	Fri, 18 Nov 2016 09:52:38 +0100 (CET)
To: Alastair D'Silva <alastair@au1.ibm.com>, qemu-arm@nongnu.org
References: <1479357400-17441-1-git-send-email-alastair@au1.ibm.com>
	<1479357400-17441-4-git-send-email-alastair@au1.ibm.com>
	<b4c2feb1-7c5a-01de-b8c8-893d2c7785f6@kaod.org>
	<1479428358.11116.46.camel@au1.ibm.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <2d46e619-a7a2-634d-63a9-49f8833a3ab1@kaod.org>
Date: Fri, 18 Nov 2016 09:52:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <1479428358.11116.46.camel@au1.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 13933292826053675987
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeelfedrudejgddufeduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 46.105.60.248
Subject: Re: [Qemu-arm] [PATCH 3/4] hw/timer: Add Epson RX8900 RTC support
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
X-TUID: Z7CIOSkgcynu


>>> +/**
>>> + * Initialize the device
>>> + * @param i2c the i2c device instance
>>> + */
>>> +static int rx8900_init(I2CSlave *i2c)
>>> +{
>>> +    TRACE(*i2c, "Initialized");
>>> +
>>> +    return 0;
>>> +}
>>
>> you can remove this routine.
>>
> 
> I don't think I can, core.c:i2c_slave_qdev_init() calls it without a
> guard.

ah yes. So may be, we should add a test in i2c_slave_qdev_init() and
kill these :

	ds1338_init
	pxa2xx_i2c_slave_init
	aer915_init
	tosa_dac_init

it looks like a good cleanup. 

Thanks,

C.

