Received: by 10.25.205.13 with SMTP id d13csp334084lfg;
        Wed, 14 Dec 2016 09:55:07 -0800 (PST)
X-Received: by 10.55.122.197 with SMTP id v188mr81827700qkc.120.1481738107105;
        Wed, 14 Dec 2016 09:55:07 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id y45si30447863qtc.34.2016.12.14.09.55.06
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 14 Dec 2016 09:55:07 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:49339 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cHDlg-0003Nn-Ms
	for alex.bennee@linaro.org; Wed, 14 Dec 2016 12:55:04 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46269)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1cHDlc-0003Gv-9y
	for qemu-arm@nongnu.org; Wed, 14 Dec 2016 12:55:01 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1cHDlZ-0005Rq-8E
	for qemu-arm@nongnu.org; Wed, 14 Dec 2016 12:55:00 -0500
Received: from 8.mo178.mail-out.ovh.net ([46.105.74.227]:44874)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1cHDlZ-0005Re-21
	for qemu-arm@nongnu.org; Wed, 14 Dec 2016 12:54:57 -0500
Received: from player793.ha.ovh.net (b9.ovh.net [213.186.33.59])
	by mo178.mail-out.ovh.net (Postfix) with ESMTP id DBA6BB2C3
	for <qemu-arm@nongnu.org>; Wed, 14 Dec 2016 18:54:55 +0100 (CET)
Received: from hermes.kaod.org (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
	[90.76.55.107]) (Authenticated sender: postmaster@kaod.org)
	by player793.ha.ovh.net (Postfix) with ESMTPSA id 6802D4009D;
	Wed, 14 Dec 2016 18:54:48 +0100 (CET)
To: Peter Maydell <peter.maydell@linaro.org>,
	Alastair D'Silva <alastair@au1.ibm.com>
References: <20161202054617.6749-1-alastair@au1.ibm.com>
	<20161202054617.6749-2-alastair@au1.ibm.com>
	<CAFEAcA8nge_DCESG-4XLzKQG_K0AGjh8RBBMbekSOj7O8KB0ng@mail.gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <61d98d1b-3b9a-78a4-4e8a-5eca250eed5f@kaod.org>
Date: Wed, 14 Dec 2016 18:54:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.5.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8nge_DCESG-4XLzKQG_K0AGjh8RBBMbekSOj7O8KB0ng@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 9759018918483102487
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeelfedrieeigdegkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 46.105.74.227
Subject: Re: [Qemu-arm] [PATCH v3 1/7] arm: Uniquely name imx25 I2C buses.
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
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-arm <qemu-arm@nongnu.org>,
	Alastair D'Silva <alastair@d-silva.org>,
	QEMU Developers <qemu-devel@nongnu.org>, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: z+EbNbs8m2oI

On 12/14/2016 06:41 PM, Peter Maydell wrote:
> On 2 December 2016 at 05:46, Alastair D'Silva <alastair@au1.ibm.com> wrote:
>> From: Alastair D'Silva <alastair@d-silva.org>
>>
>> The imx25 chip provides 3 i2c buses, but they have all been named
>> "i2c", which makes it difficult to predict which bus a device will
>> be connected to when specified on the command line.
>>
>> This patch addresses the issue by naming the buses uniquely:
>>   i2c-bus.0 i2c-bus.1 i2c-bus.2
>>
>> Signed-off-by: Alastair D'Silva <alastair@d-silva.org>
>> ---
>>  hw/arm/imx25_pdk.c | 4 +---
>>  hw/i2c/imx_i2c.c   | 2 +-
>>  2 files changed, 2 insertions(+), 4 deletions(-)
>>
>> diff --git a/hw/arm/imx25_pdk.c b/hw/arm/imx25_pdk.c
>> index 025b608..c6f04d3 100644
>> --- a/hw/arm/imx25_pdk.c
>> +++ b/hw/arm/imx25_pdk.c
>> @@ -138,9 +138,7 @@ static void imx25_pdk_init(MachineState *machine)
>>           * We add it here (only on qtest usage) to be able to do a bit
>>           * of simple qtest. See "make check" for details.
>>           */
>> -        i2c_create_slave((I2CBus *)qdev_get_child_bus(DEVICE(&s->soc.i2c[0]),
>> -                                                      "i2c"),
>> -                         "ds1338", 0x68);
>> +        i2c_create_slave(s->soc.i2c[0].bus, "ds1338", 0x68);
> 
> This bit doesn't look right. The board level code shouldn't be
> poking around inside the IMXI2CState struct, as that is private
> to the device implementation. That's why we're calling
> qdev_get_child_bus().

That was my suggestion. Sorry about that. 

May be, we could use "i2c.0", now that we have numbered the I2C bus 
names ? 

Thanks,

C.


