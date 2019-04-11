Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp7329825wrx;
        Thu, 11 Apr 2019 08:40:26 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyjrjysL8wLXZCPGB/k93b8sfF3L4a7Ory++q+r73bd84xlU7vH3AsJrBX8GRkpF6jOV47N
X-Received: by 2002:a1c:6502:: with SMTP id z2mr6803302wmb.119.1554997226498;
        Thu, 11 Apr 2019 08:40:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1554997226; cv=none;
        d=google.com; s=arc-20160816;
        b=nz+yqx9fpIFQb+QvFFTfHbvxrH2EC3/8yG2QXmr1CYdXDj9nqJwnPHbXFZtNao7UfY
         PX812vneTGsxPsXjjK/uYbJ9ccF6CQL/DHwlpEjjlB757pwfiS686zLCWXBj2fntEqgX
         tmUjHpejJ00eQW8h3D4quTEWvTdmm75FJ3+m8OW8+5s/posrr0VE/pHoc+mUSDogYv4C
         qDIjcQRHoygKQuVOUX9p8Y+B3C/HiRTS3Ch70FWAckhtaSpbLpjayIAclZFPhe7NWHeS
         VWEYjh04kjUZ4GmNClmBXTQQl21e/Icp1nSBDmvoFVBG5Sa8jrIGrFKmW3CSMuojmefm
         SuMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=AVckQj23UyjIZ5zScSB2Yy3Qj99hQ7HOToyxAcpUSEg=;
        b=BlA0RZ3Q3q1E9se18aurC0Ucn8njZ2KkId/7kEisdJp/L6yN4N0+I8NsaoQX4F9hsi
         ksFuu+BsCAfKNTScqVHizLvmXQPXcZ5gEmDtCg46fRYFfFAkW5q0R9zC0kSSKNb3WgL2
         jEv0TCHBCY7QQGE/o/PgvsUMAr2k8aVcVsi2bt90HwI46VP8Gtq02Rj3UBej6ORxhhZz
         iEN6OWfFwyUcxmSlOzQDaDeCp0SuZeKH6pZRUl67KXtBXARqRrmkAJIWaEWwPt9gUbwk
         yy5/Mvse4c4YGp9JldLcqGrJmJRBHy0hkLusr6BPBfr8VI20RUtCPKPCk6OENgpjZhTO
         uK3Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u2si25398308wrm.203.2019.04.11.08.40.26
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 11 Apr 2019 08:40:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:50897 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hEboP-00016W-Im
	for alex.bennee@linaro.org; Thu, 11 Apr 2019 11:40:25 -0400
Received: from eggs.gnu.org ([209.51.188.92]:50212)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1hEbfr-00037D-8n
	for qemu-devel@nongnu.org; Thu, 11 Apr 2019 11:31:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1hEbfn-0002xX-Od
	for qemu-devel@nongnu.org; Thu, 11 Apr 2019 11:31:34 -0400
Received: from 8.mo69.mail-out.ovh.net ([46.105.56.233]:36381)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1hEbfm-0002tO-C5
	for qemu-devel@nongnu.org; Thu, 11 Apr 2019 11:31:30 -0400
Received: from player711.ha.ovh.net (unknown [10.109.146.1])
	by mo69.mail-out.ovh.net (Postfix) with ESMTP id E1FEF4E6B0
	for <qemu-devel@nongnu.org>; Thu, 11 Apr 2019 17:31:26 +0200 (CEST)
Received: from kaod.org (lfbn-tou-1-40-22.w86-201.abo.wanadoo.fr
	[86.201.133.22]) (Authenticated sender: clg@kaod.org)
	by player711.ha.ovh.net (Postfix) with ESMTPSA id D560649B314B;
	Thu, 11 Apr 2019 15:31:21 +0000 (UTC)
To: Peter Maydell <peter.maydell@linaro.org>, Joel Stanley <joel@jms.id.au>
References: <20190328062222.8409-1-joel@jms.id.au>
	<20190328062222.8409-3-joel@jms.id.au>
	<CAFEAcA9G9Xrt5nDRJrSCC1SdeR987YzK+etRLTSyokLE+yyJSw@mail.gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <feaa1cc3-6bc1-555b-15e1-9c485c0157cb@kaod.org>
Date: Thu, 11 Apr 2019 17:31:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9G9Xrt5nDRJrSCC1SdeR987YzK+etRLTSyokLE+yyJSw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Ovh-Tracer-Id: 6759340092250295104
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduuddrudelgdeltdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 46.105.56.233
Subject: Re: [Qemu-devel] [PATCH 2/2] hw/arm/aspeed: Add RTC to SoC
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
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Y3dC9Tw3VlOA

On 4/11/19 5:28 PM, Peter Maydell wrote:
> On Thu, 28 Mar 2019 at 06:22, Joel Stanley <joel@jms.id.au> wrote:
>>
>> Signed-off-by: Joel Stanley <joel@jms.id.au>
>> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
>> ---
>>  hw/arm/aspeed_soc.c         | 15 +++++++++++++++
>>  include/hw/arm/aspeed_soc.h |  2 ++
>>  2 files changed, 17 insertions(+)
>>
>> diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c
>> index a27233d4876b..628ec633c91a 100644
>> --- a/hw/arm/aspeed_soc.c
>> +++ b/hw/arm/aspeed_soc.c
>> @@ -32,6 +32,7 @@
>>  #define ASPEED_SOC_SDMC_BASE        0x1E6E0000
>>  #define ASPEED_SOC_SCU_BASE         0x1E6E2000
>>  #define ASPEED_SOC_SRAM_BASE        0x1E720000
>> +#define ASPEED_SOC_RTC_BASE         0x1E781000
>>  #define ASPEED_SOC_TIMER_BASE       0x1E782000
>>  #define ASPEED_SOC_WDT_BASE         0x1E785000
>>  #define ASPEED_SOC_I2C_BASE         0x1E78A000
>> @@ -135,6 +136,10 @@ static void aspeed_soc_init(Object *obj)
>>      object_property_add_child(obj, "i2c", OBJECT(&s->i2c), NULL);
>>      qdev_set_parent_bus(DEVICE(&s->i2c), sysbus_get_default());
>>
>> +    object_initialize(&s->rtc, sizeof(s->rtc), TYPE_ASPEED_RTC);
>> +    object_property_add_child(obj, "rtc", OBJECT(&s->rtc), NULL);
>> +    qdev_set_parent_bus(DEVICE(&s->rtc), sysbus_get_default());
>=20
> These three lines should be written
>        sysbus_init_child_obj(obj, "rtc", &s->rtc, sizeof(s->rtc),
>                              TYPE_ASPEED_RTC);
>=20
> which is both shorter and also avoids leaking a reference to
> the child object.
>=20
> (We should also at some point fix the existing uses of this
> pattern in this file.)

yes. and there are a few. I will do that.

Thanks,=20

C.=20
