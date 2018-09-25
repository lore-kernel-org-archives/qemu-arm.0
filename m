Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp496264wrt;
        Tue, 25 Sep 2018 03:28:28 -0700 (PDT)
X-Google-Smtp-Source: ACcGV62xm2NSv4pk2YqdEo8bloUtJP7UYy+qNiSv5St1iAK1vFosf4SeN8UjTYFwBAs0WJEWKi+c
X-Received: by 2002:a37:a512:: with SMTP id o18-v6mr208904qke.232.1537871308132;
        Tue, 25 Sep 2018 03:28:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1537871308; cv=none;
        d=google.com; s=arc-20160816;
        b=K+LTz1IEWvNrk1iLz68EpxlFzZGKV69MffKW5aBjs4z+XINUiMDG7B9d1+IiKQbKCt
         +cN49KwnDqUsNTeWRU1VC4NLjvxaWKvE8YKjI1Bedq60rNCa7LaTho25f+FAjUa4sNIP
         o0tYeaZ028TYojZlgOdu3LgAZZ4T7XVnLwHAVYdo0R/ekHhnZJSeQxlUu9gB3zqeaOR4
         MEX7TDJiP3tnkJDJMv+wcQ0tlV2HPwfDo5iweLfWOBBMjBXFsffkeZSAq9c2EoyHtO38
         gUtfevLQ72Ruyt3UqENCMID/0Qfh2STLOy2HiamNtaZMl8aFsj0znTjEp7PYb8Hq8kKy
         mPJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature;
        bh=sC9toFzGDTwt2Y3IMoDwvwxmLHTS5O/LCa20UkKsTHo=;
        b=R/yxc9qolJI8KDnsP+HbqhJQ5GZKtrPWAbom9rBIRPGF/MGP2CWaXsEQ2viR2p6y1M
         nZSQ4nTHSV4WA1am8/pKe1dRECuaxL5kKsIOqgZktc/yc52U3pGpJwYaxZMsWGiPRb/j
         TxnxLlQRo4Q0TfGqRarQR8oe3r2L8KKSt93VVS6D1vX+rMjgFnBryE4zc7NGDjLUvX/q
         5FCaQMG/aEqPF2bQJAmtjvVG8XmC+4eF8uZnHc2p+yTCOZ2b8kUS5xQc04tVwHun15GW
         sdYL5kekWN4IYO7lZD8ozwiav2KB8RHzU1C6I2pPPSnLcLDU7OdlWy5udggJNYAuDOFQ
         dnzg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Nm6KnM4C;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v20-v6si38747qvk.122.2018.09.25.03.28.27
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 25 Sep 2018 03:28:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Nm6KnM4C;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52028 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g4kZv-0004FV-IM
	for alex.bennee@linaro.org; Tue, 25 Sep 2018 06:28:27 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39784)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1g4kZI-00040m-Ek
	for qemu-devel@nongnu.org; Tue, 25 Sep 2018 06:27:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1g4kOJ-0006ZR-9u
	for qemu-devel@nongnu.org; Tue, 25 Sep 2018 06:16:29 -0400
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:46150)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1g4kOH-0006Nm-SI
	for qemu-devel@nongnu.org; Tue, 25 Sep 2018 06:16:27 -0400
Received: by mail-ot1-x344.google.com with SMTP id q4-v6so10661573otf.13
	for <qemu-devel@nongnu.org>; Tue, 25 Sep 2018 03:16:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=sC9toFzGDTwt2Y3IMoDwvwxmLHTS5O/LCa20UkKsTHo=;
	b=Nm6KnM4CbZRlMXSiwL+pvPsZBSRZ4byh/74pVeP+eSLvk9xFZnLIsvKq9SkC6u8qfk
	FkJtZzRmYLeG6krOwp9VuDk7Hl2Nzh0LB+d4VdzrS0TrBK9g9Khzfg1kaq1PkP0lhmDQ
	89/oY5K8+UdiYzXQl60L+SkEZblFOcq4M711A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=sC9toFzGDTwt2Y3IMoDwvwxmLHTS5O/LCa20UkKsTHo=;
	b=RnLT2mYUbvK1l1jK1Z66EIONXAupUaFQJUgkZpLm5xwWI5BZdh4xE2WmMOFDwwiEoc
	uYH79HTJUUQW5YuvmLjv9U+QLlCG4aUCj6r+8ok6dVv4u8YPHOEykj7nQXhhf2ASCWTt
	1lHB4uuDN4gVS0MMVmL7wCLn+o5kiieCrQ+sgU16CnHOLLsZWg3kIIhdrnjOQDLOzH0D
	phLIRpR7dQo5MoPpY6aO0Ftk8Ba5HscbR86gQDJKoN0y0qbXwQdbR5yInxM7oxDFPmMB
	xxfzgAYwzXrTbcWQi5+VPzdijcw1MZcedeokYfETT6AGZGM+aSbvDVeNDTo9SGBx1rpq
	44Yw==
X-Gm-Message-State: ABuFfojpxmiHEezdqwbV8cIjEx1vYAQKZq/qAb+JGtJJCh7J8Ku5Eizj
	YgwtTVzOBPFA/obv+DY92jsvJw+79mDRS8ekibxcDw==
X-Received: by 2002:a9d:1caa:: with SMTP id
	l42-v6mr216431ota.324.1537870578423; 
	Tue, 25 Sep 2018 03:16:18 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:20e3:0:0:0:0:0 with HTTP; Tue, 25 Sep 2018 03:15:57
	-0700 (PDT)
In-Reply-To: <ff6ef7d6-f41f-13df-26ce-ff7b4dad5cec@kaod.org>
References: <20180914063506.20815-1-clg@kaod.org>
	<20180914063506.20815-2-clg@kaod.org>
	<CAFEAcA8uGPPy0mr+iHiByS+HTwOKfUbSpuM6UjOG1+-uNYk0Ww@mail.gmail.com>
	<ff6ef7d6-f41f-13df-26ce-ff7b4dad5cec@kaod.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 25 Sep 2018 11:15:57 +0100
Message-ID: <CAFEAcA_S3YMpzFVZm6a7fdu67jAVXFAnawFQhWsjPG63KjgZAw@mail.gmail.com>
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::344
Subject: Re: [Qemu-devel] [PATCH 1/3] aspeed/i2c: interrupts should be
 cleared by software only
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
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Guenter Roeck <linux@roeck-us.net>, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: XWehYr9K+00W

On 25 September 2018 at 10:12, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
> On 09/25/2018 11:02 AM, Peter Maydell wrote:
>> On 14 September 2018 at 07:35, C=C3=A9dric Le Goater <clg@kaod.org> wrot=
e:
>>> and the bus interrupt should be lowered when all interrupts have been
>>> cleared. Also, the model does not implement correctly the RX_DONE bit
>>> behavior which should be cleared to allow more data to be received.
>>> Yet to be fixed.
>>>
>>> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
>>> ---
>>>  hw/i2c/aspeed_i2c.c | 21 +++++++++++++++++----
>>>  1 file changed, 17 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/hw/i2c/aspeed_i2c.c b/hw/i2c/aspeed_i2c.c
>>> index c762c7366ad9..de6b08378675 100644
>>> --- a/hw/i2c/aspeed_i2c.c
>>> +++ b/hw/i2c/aspeed_i2c.c
>>> @@ -52,6 +52,13 @@
>>>  #define I2CD_AC_TIMING_REG2     0x08       /* Clock and AC Timing Cont=
rol #1 */
>>>  #define I2CD_INTR_CTRL_REG      0x0c       /* I2CD Interrupt Control *=
/
>>>  #define I2CD_INTR_STS_REG       0x10       /* I2CD Interrupt Status */
>>> +
>>> +#define   I2CD_INTR_SLAVE_ADDR_MATCH       (0x1 << 31) /* 0: addr1 1: =
addr2 */
>>> +#define   I2CD_INTR_SLAVE_ADDR_RX_PENDING  (0x1 << 30)
>>> +/* bits[19-16] Reserved */
>>> +
>>> +/* All bits below are cleared by writing 1 */
>>> +#define   I2CD_INTR_SLAVE_INACTIVE_TIMEOUT (0x1 << 15)
>>>  #define   I2CD_INTR_SDA_DL_TIMEOUT         (0x1 << 14)
>>>  #define   I2CD_INTR_BUS_RECOVER_DONE       (0x1 << 13)
>>>  #define   I2CD_INTR_SMBUS_ALERT            (0x1 << 12) /* Bus [0-3] on=
ly */
>>> @@ -59,11 +66,16 @@
>>>  #define   I2CD_INTR_SMBUS_DEV_ALERT_ADDR   (0x1 << 10) /* Removed */
>>>  #define   I2CD_INTR_SMBUS_DEF_ADDR         (0x1 << 9)  /* Removed */
>>>  #define   I2CD_INTR_GCALL_ADDR             (0x1 << 8)  /* Removed */
>>> -#define   I2CD_INTR_SLAVE_MATCH            (0x1 << 7)  /* use RX_DONE =
*/
>>> +#define   I2CD_INTR_SLAVE_ADDR_RX_MATCH    (0x1 << 7)  /* use RX_DONE =
*/
>>>  #define   I2CD_INTR_SCL_TIMEOUT            (0x1 << 6)
>>>  #define   I2CD_INTR_ABNORMAL               (0x1 << 5)
>>>  #define   I2CD_INTR_NORMAL_STOP            (0x1 << 4)
>>>  #define   I2CD_INTR_ARBIT_LOSS             (0x1 << 3)
>>> +
>>> +/*
>>> + * TODO: handle correctly I2CD_INTR_RX_DONE which needs to be cleared
>>> + * to allow next data to be received.
>>> + */
>>>  #define   I2CD_INTR_RX_DONE                (0x1 << 2)
>>
>> Is this TODO something different from the behaviour involving
>> this RX_DONE bit which is fixed in patch 3 in this set ?
>
> no. It's the same but the TODO was not removed. I intended to do
> so after a possible merge.

OK. I'll fix up the commit message and drop the TODO message from
this patch when I put the series into target-arm.next, if that's ok.

thanks
-- PMM
