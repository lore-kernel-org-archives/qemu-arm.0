Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp429279wrt;
        Tue, 25 Sep 2018 02:13:22 -0700 (PDT)
X-Google-Smtp-Source: ACcGV63tLEOizn+nZCe7G+oOcre1zl5K2g2j5lIb14GlDWCULZpeUOeZxJ/ZZL3sI2kw5RBaKsg4
X-Received: by 2002:a0c:c686:: with SMTP id d6-v6mr33367qvj.67.1537866802548;
        Tue, 25 Sep 2018 02:13:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1537866802; cv=none;
        d=google.com; s=arc-20160816;
        b=Pa09FzpMHgC34wO1/1CL2TRMC7Be8DJHwhIeUzHcuCcIVSf1uwjSQ6+SY6XbBaPw8J
         YBXT4tal64yMDq8D8zFYTc/2eLiggLh1QEzNPZvwy2VL8YzxHJq8+asvDF7wilFgbU+I
         zcOXcKFzjWcubBX/D4Kl1nqhvdd2ixTRWjyNCz3bHmrjcvefdvhqgdVU8QxSqLppJze+
         mJbmUUF3AYpDcPIzbDul5s0Vj5KTh65lmMpXR5P73adgYORbZpUKBSj/qsm7w+ycGQbJ
         7U54kzlccEJNQpNDqOAMMRj40nd8RxLqvx94hfft8hoZtnlMundqBV+k+1KMOqtipPRl
         zuSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=RVxq8h9yVXlQ+Bzp8okYiKr4rLk30vC/iQSGv/np6Yc=;
        b=Riov3YEOM/0bdCgQs3mY+YN4A9/ybs8hm8zHBsqTGfCwV+X96fg8IuTFDF3nuAQbmG
         ErQoqtDvA6A25qD3/yNBbrc9VmCYH11U6kpSK0T1MnkTy5vQiOE+hBwZuG3/U+Sooxi1
         mIjIar4pUq9wsOK4UDZCs/I0+O4Sbw9DLfYq0K3n/vqzahsQ3J9iWT3+p50cspKeMtio
         uH8OaN/ZJv5EpAL/wP5hvmbHlll1xj4BmGKQ5gJT3+e53t4cUJG2fFEFQIIuT6RX8n9u
         J9ZaFl84bveTeeGCpIho4LUxzQYjrNR2k3wBNbZ+nDLXDBfetO42t/JoBD0BK4cD2hC/
         Rs1Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e7-v6si1410263qvb.153.2018.09.25.02.13.22
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 25 Sep 2018 02:13:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:51777 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g4jPF-0003P5-VR
	for alex.bennee@linaro.org; Tue, 25 Sep 2018 05:13:21 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51385)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1g4jP4-0003N4-4T
	for qemu-arm@nongnu.org; Tue, 25 Sep 2018 05:13:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1g4jOy-0003rp-TU
	for qemu-arm@nongnu.org; Tue, 25 Sep 2018 05:13:10 -0400
Received: from 3.mo69.mail-out.ovh.net ([188.165.52.203]:59555)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1g4jOy-0003qe-HD
	for qemu-arm@nongnu.org; Tue, 25 Sep 2018 05:13:04 -0400
Received: from player746.ha.ovh.net (unknown [10.109.160.62])
	by mo69.mail-out.ovh.net (Postfix) with ESMTP id 489182DE4F
	for <qemu-arm@nongnu.org>; Tue, 25 Sep 2018 11:13:02 +0200 (CEST)
Received: from zorba.kaod.org (deibp9eh1--blueice1n0.emea.ibm.com
	[195.212.29.162]) (Authenticated sender: postmaster@kaod.org)
	by player746.ha.ovh.net (Postfix) with ESMTPSA id 8FBC85000DD;
	Tue, 25 Sep 2018 11:12:52 +0200 (CEST)
To: Peter Maydell <peter.maydell@linaro.org>
References: <20180914063506.20815-1-clg@kaod.org>
	<20180914063506.20815-2-clg@kaod.org>
	<CAFEAcA8uGPPy0mr+iHiByS+HTwOKfUbSpuM6UjOG1+-uNYk0Ww@mail.gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <ff6ef7d6-f41f-13df-26ce-ff7b4dad5cec@kaod.org>
Date: Tue, 25 Sep 2018 11:12:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8uGPPy0mr+iHiByS+HTwOKfUbSpuM6UjOG1+-uNYk0Ww@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Ovh-Tracer-Id: 18166957948065385387
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedtjedruddttddgudefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 188.165.52.203
Subject: Re: [Qemu-arm] [PATCH 1/3] aspeed/i2c: interrupts should be cleared
 by software only
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
	QEMU Developers <qemu-devel@nongnu.org>,
	Guenter Roeck <linux@roeck-us.net>, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 2ns+nMDESW0R

On 09/25/2018 11:02 AM, Peter Maydell wrote:
> On 14 September 2018 at 07:35, C=C3=A9dric Le Goater <clg@kaod.org> wro=
te:
>> and the bus interrupt should be lowered when all interrupts have been
>> cleared. Also, the model does not implement correctly the RX_DONE bit
>> behavior which should be cleared to allow more data to be received.
>> Yet to be fixed.
>>
>> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
>> ---
>>  hw/i2c/aspeed_i2c.c | 21 +++++++++++++++++----
>>  1 file changed, 17 insertions(+), 4 deletions(-)
>>
>> diff --git a/hw/i2c/aspeed_i2c.c b/hw/i2c/aspeed_i2c.c
>> index c762c7366ad9..de6b08378675 100644
>> --- a/hw/i2c/aspeed_i2c.c
>> +++ b/hw/i2c/aspeed_i2c.c
>> @@ -52,6 +52,13 @@
>>  #define I2CD_AC_TIMING_REG2     0x08       /* Clock and AC Timing Con=
trol #1 */
>>  #define I2CD_INTR_CTRL_REG      0x0c       /* I2CD Interrupt Control =
*/
>>  #define I2CD_INTR_STS_REG       0x10       /* I2CD Interrupt Status *=
/
>> +
>> +#define   I2CD_INTR_SLAVE_ADDR_MATCH       (0x1 << 31) /* 0: addr1 1:=
 addr2 */
>> +#define   I2CD_INTR_SLAVE_ADDR_RX_PENDING  (0x1 << 30)
>> +/* bits[19-16] Reserved */
>> +
>> +/* All bits below are cleared by writing 1 */
>> +#define   I2CD_INTR_SLAVE_INACTIVE_TIMEOUT (0x1 << 15)
>>  #define   I2CD_INTR_SDA_DL_TIMEOUT         (0x1 << 14)
>>  #define   I2CD_INTR_BUS_RECOVER_DONE       (0x1 << 13)
>>  #define   I2CD_INTR_SMBUS_ALERT            (0x1 << 12) /* Bus [0-3] o=
nly */
>> @@ -59,11 +66,16 @@
>>  #define   I2CD_INTR_SMBUS_DEV_ALERT_ADDR   (0x1 << 10) /* Removed */
>>  #define   I2CD_INTR_SMBUS_DEF_ADDR         (0x1 << 9)  /* Removed */
>>  #define   I2CD_INTR_GCALL_ADDR             (0x1 << 8)  /* Removed */
>> -#define   I2CD_INTR_SLAVE_MATCH            (0x1 << 7)  /* use RX_DONE=
 */
>> +#define   I2CD_INTR_SLAVE_ADDR_RX_MATCH    (0x1 << 7)  /* use RX_DONE=
 */
>>  #define   I2CD_INTR_SCL_TIMEOUT            (0x1 << 6)
>>  #define   I2CD_INTR_ABNORMAL               (0x1 << 5)
>>  #define   I2CD_INTR_NORMAL_STOP            (0x1 << 4)
>>  #define   I2CD_INTR_ARBIT_LOSS             (0x1 << 3)
>> +
>> +/*
>> + * TODO: handle correctly I2CD_INTR_RX_DONE which needs to be cleared
>> + * to allow next data to be received.
>> + */
>>  #define   I2CD_INTR_RX_DONE                (0x1 << 2)
>=20
> Is this TODO something different from the behaviour involving
> this RX_DONE bit which is fixed in patch 3 in this set ?

no. It's the same but the TODO was not removed. I intended to do
so after a possible merge.

Thanks,

C.=20
