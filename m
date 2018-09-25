Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp510992wrt;
        Tue, 25 Sep 2018 03:45:13 -0700 (PDT)
X-Google-Smtp-Source: ACcGV62plS3Yx0SBbJJEOip9euPX5CeqpLmP6ylIi2VpSIwus/ZkwbCsQcFgJ7C1p55O0j54TnTn
X-Received: by 2002:a0c:ae71:: with SMTP id z46-v6mr277466qvc.108.1537872313190;
        Tue, 25 Sep 2018 03:45:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1537872313; cv=none;
        d=google.com; s=arc-20160816;
        b=JxAqRQWeLQ0mNffCPQyFyVCFJ3wO3Wd/5cglYuuvnvp21F0pqt+pCEfNbqKkTRWBJ/
         POm96fljuCSlCL7UTaUaOcjClyQ4zuDEeZPuB3C5RNaEHOrY5BMMJhYfclRoT730hSfV
         e8hRuuMCWki/z0JeXfp/cN0iD2GAPAq9s7S7C4TwhjTngzakjglRIpnUucDODRObGEDs
         I3BYO7+mVtH62djaySLtDEGL4vfzuEDKopGAP79cepBXIvJvgqqdkp5g2n18oZHCJ2Pg
         UULBMiFrL/fPF1bE9Kwiy4FH7Qew05BVOdC0va2SPCZuUJPcC/39ZkGXnZAA5thxAIxX
         tPUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=hLDyeyswFOB3T7yfdh0eKckS6IwKN1YlrjNX5HkQp5s=;
        b=RcL1o+72wb8I6Wh4PcM2HjgtbMZ2rAO8dI0q6Ul9s34+yqavbcZL5P9LhRE+HqLBil
         emCFKABkBPGQ3B/NQqq2yXgod1w3mmPb41KImXaUwias1AnzJi/Jq3UtxXf638WjVE3T
         MVD0Pi04FcSwZRzequkp/YlwLYaHrlUDF9dgj3SvQXFWSTkq1GppeLUeJZUU4P1KSUwJ
         TcTquXy7UZBd6HmMGJQZ22FSKKVmGFLn5wY6SeZ/8vC/5t+11r3+QBQZ7vKpWvSGMlNw
         R19n0xh+PkxF43azV5itjlaZGl2rBlJ0RgJPCCtUVUSsUxKcEaVSIHKBXI3kFzghJNto
         kP7A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i93-v6si1586995qtb.266.2018.09.25.03.45.13
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 25 Sep 2018 03:45:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:52141 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g4kq8-0008Qw-Pu
	for alex.bennee@linaro.org; Tue, 25 Sep 2018 06:45:12 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45484)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1g4kpy-0008QZ-54
	for qemu-arm@nongnu.org; Tue, 25 Sep 2018 06:45:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1g4kpu-00006D-21
	for qemu-arm@nongnu.org; Tue, 25 Sep 2018 06:45:02 -0400
Received: from 5.mo179.mail-out.ovh.net ([46.105.43.140]:41368)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1g4kpt-000058-Pj
	for qemu-arm@nongnu.org; Tue, 25 Sep 2018 06:44:57 -0400
Received: from player761.ha.ovh.net (unknown [10.109.146.32])
	by mo179.mail-out.ovh.net (Postfix) with ESMTP id 60D5B100A9B
	for <qemu-arm@nongnu.org>; Tue, 25 Sep 2018 12:44:56 +0200 (CEST)
Received: from zorba.kaod.org (deibp9eh1--blueice1n0.emea.ibm.com
	[195.212.29.162]) (Authenticated sender: postmaster@kaod.org)
	by player761.ha.ovh.net (Postfix) with ESMTPSA id B55DE4800BC;
	Tue, 25 Sep 2018 12:44:48 +0200 (CEST)
To: Peter Maydell <peter.maydell@linaro.org>
References: <20180914063506.20815-1-clg@kaod.org>
	<20180914063506.20815-2-clg@kaod.org>
	<CAFEAcA8uGPPy0mr+iHiByS+HTwOKfUbSpuM6UjOG1+-uNYk0Ww@mail.gmail.com>
	<ff6ef7d6-f41f-13df-26ce-ff7b4dad5cec@kaod.org>
	<CAFEAcA_S3YMpzFVZm6a7fdu67jAVXFAnawFQhWsjPG63KjgZAw@mail.gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <74b0ec3f-b2ae-161a-1446-af2a90a8d520@kaod.org>
Date: Tue, 25 Sep 2018 12:44:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_S3YMpzFVZm6a7fdu67jAVXFAnawFQhWsjPG63KjgZAw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Ovh-Tracer-Id: 1272266897398664107
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedtjedruddtuddgudduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 46.105.43.140
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
X-TUID: sntQpZeyzK/a

On 09/25/2018 12:15 PM, Peter Maydell wrote:
> On 25 September 2018 at 10:12, C=C3=A9dric Le Goater <clg@kaod.org> wro=
te:
>> On 09/25/2018 11:02 AM, Peter Maydell wrote:
>>> On 14 September 2018 at 07:35, C=C3=A9dric Le Goater <clg@kaod.org> w=
rote:
>>>> and the bus interrupt should be lowered when all interrupts have bee=
n
>>>> cleared. Also, the model does not implement correctly the RX_DONE bi=
t
>>>> behavior which should be cleared to allow more data to be received.
>>>> Yet to be fixed.
>>>>
>>>> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
>>>> ---
>>>>  hw/i2c/aspeed_i2c.c | 21 +++++++++++++++++----
>>>>  1 file changed, 17 insertions(+), 4 deletions(-)
>>>>
>>>> diff --git a/hw/i2c/aspeed_i2c.c b/hw/i2c/aspeed_i2c.c
>>>> index c762c7366ad9..de6b08378675 100644
>>>> --- a/hw/i2c/aspeed_i2c.c
>>>> +++ b/hw/i2c/aspeed_i2c.c
>>>> @@ -52,6 +52,13 @@
>>>>  #define I2CD_AC_TIMING_REG2     0x08       /* Clock and AC Timing C=
ontrol #1 */
>>>>  #define I2CD_INTR_CTRL_REG      0x0c       /* I2CD Interrupt Contro=
l */
>>>>  #define I2CD_INTR_STS_REG       0x10       /* I2CD Interrupt Status=
 */
>>>> +
>>>> +#define   I2CD_INTR_SLAVE_ADDR_MATCH       (0x1 << 31) /* 0: addr1 =
1: addr2 */
>>>> +#define   I2CD_INTR_SLAVE_ADDR_RX_PENDING  (0x1 << 30)
>>>> +/* bits[19-16] Reserved */
>>>> +
>>>> +/* All bits below are cleared by writing 1 */
>>>> +#define   I2CD_INTR_SLAVE_INACTIVE_TIMEOUT (0x1 << 15)
>>>>  #define   I2CD_INTR_SDA_DL_TIMEOUT         (0x1 << 14)
>>>>  #define   I2CD_INTR_BUS_RECOVER_DONE       (0x1 << 13)
>>>>  #define   I2CD_INTR_SMBUS_ALERT            (0x1 << 12) /* Bus [0-3]=
 only */
>>>> @@ -59,11 +66,16 @@
>>>>  #define   I2CD_INTR_SMBUS_DEV_ALERT_ADDR   (0x1 << 10) /* Removed *=
/
>>>>  #define   I2CD_INTR_SMBUS_DEF_ADDR         (0x1 << 9)  /* Removed *=
/
>>>>  #define   I2CD_INTR_GCALL_ADDR             (0x1 << 8)  /* Removed *=
/
>>>> -#define   I2CD_INTR_SLAVE_MATCH            (0x1 << 7)  /* use RX_DO=
NE */
>>>> +#define   I2CD_INTR_SLAVE_ADDR_RX_MATCH    (0x1 << 7)  /* use RX_DO=
NE */
>>>>  #define   I2CD_INTR_SCL_TIMEOUT            (0x1 << 6)
>>>>  #define   I2CD_INTR_ABNORMAL               (0x1 << 5)
>>>>  #define   I2CD_INTR_NORMAL_STOP            (0x1 << 4)
>>>>  #define   I2CD_INTR_ARBIT_LOSS             (0x1 << 3)
>>>> +
>>>> +/*
>>>> + * TODO: handle correctly I2CD_INTR_RX_DONE which needs to be clear=
ed
>>>> + * to allow next data to be received.
>>>> + */
>>>>  #define   I2CD_INTR_RX_DONE                (0x1 << 2)
>>>
>>> Is this TODO something different from the behaviour involving
>>> this RX_DONE bit which is fixed in patch 3 in this set ?
>>
>> no. It's the same but the TODO was not removed. I intended to do
>> so after a possible merge.
>=20
> OK. I'll fix up the commit message and drop the TODO message from
> this patch when I put the series into target-arm.next, if that's ok.

Sure.=20

Thanks,

C.

