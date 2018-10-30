Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp5526766wro;
        Tue, 30 Oct 2018 05:42:53 -0700 (PDT)
X-Google-Smtp-Source: AJdET5cGDH5yKbc+Ah1Kb5JajqpcLjuhK7OpHNPQKQm1bl3Palz+x7Ggtpx3c6DmYwcQYho6rE0i
X-Received: by 2002:a37:6b42:: with SMTP id g63mr537404qkc.297.1540903373023;
        Tue, 30 Oct 2018 05:42:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1540903373; cv=none;
        d=google.com; s=arc-20160816;
        b=VQwRYXCSx8iliPMt/zBkPzvrmU5C7ARSMmLo9hS2aI911Ie57BZUZAA3PtWMAzJ/IX
         ZOgdy6yVK41/oUZgRp+yQO7H4NUD63pqX2S+QodKQA/Xn/BHBeMlpr3Fk68GcFZgPnO3
         sxnuJ6fEzt1j45TIv6bw3Lj8/I2iHkdnfoKVeiZq2Hd9SVgULRFTQlJu427bCQYXQkPF
         qEWomAy/RCP+iPiGRzoXrUqRXEydBYurQRfnqgcrGUU9EK+v6gfa8N2vF4ufYWSBXabJ
         Qw/tiXBaTZNgWIgyR7dK4LOjs+etXitmG23XdR4PXwzcCm78O4y9B4r5mCAwOTrwmvQQ
         YxPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature;
        bh=ExXzQ9D22+pYhF3B0PM1EV26oE62QSVqeSGe5U9GuvU=;
        b=GaQHFgcvJe79ydTcJ7CrgVQxhPhh+sCMJRpguR0cf+1tB0GbdEtB/FAILXMsZv6n1w
         JKcyW1IO5P1mpIe+sXWmFJCdCWF+w740mYlbtGQsjmuftJeHVhVeitdUz+RXr2+hbLED
         OpvwdpPfzTIAEQiZOeDD9Cw9kkBGz7yw25KYoue7AXNRzdd+0KkJJYLmRk9CzpNzeV6A
         ZjbzUDTn45KMmaJyqxft2ifbhRRZoDpLp3iMKD1Xus3TYCI6R78Bk3ZoGVwwFadAANbM
         eLxCRc1IhH5w7pZi4J9hHXfYN1Yx4+/G2WMbFZ4Psqrd+R2m6qi6L6Rn4fe6Rkj04UaV
         t3wQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=cC81tAWx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u28si1690777qtj.69.2018.10.30.05.42.52
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 30 Oct 2018 05:42:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=cC81tAWx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52986 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gHTMC-00044j-Kb
	for alex.bennee@linaro.org; Tue, 30 Oct 2018 08:42:52 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34839)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gHTM5-00042d-Pl
	for qemu-arm@nongnu.org; Tue, 30 Oct 2018 08:42:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gHTM3-0002yq-GO
	for qemu-arm@nongnu.org; Tue, 30 Oct 2018 08:42:45 -0400
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:46635)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gHTLy-0002gR-21
	for qemu-arm@nongnu.org; Tue, 30 Oct 2018 08:42:41 -0400
Received: by mail-ot1-x343.google.com with SMTP id q5so5450266otl.13
	for <qemu-arm@nongnu.org>; Tue, 30 Oct 2018 05:42:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=ExXzQ9D22+pYhF3B0PM1EV26oE62QSVqeSGe5U9GuvU=;
	b=cC81tAWx79qRqBkqutXy/HZLWOkq+ZyxPXMK5rChmMMgV9Hw+CvMRnU63Ms3CsJlqo
	Q09tPUlyIn1WYBwjxQBLAsfJIfD3IBr/+DD7Va1SDjb01/wyk71AfIoxH6hGqn8s/nI/
	dgR9NMdR88Y6W0/eNoksMqJ+Xd4MI1UeuZubI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=ExXzQ9D22+pYhF3B0PM1EV26oE62QSVqeSGe5U9GuvU=;
	b=BMPVf11V+kwthvykkY+XOPfbVTGrCYjwwA8fn+5LqaTui7asScb7YFnTFlF6+pTd1E
	Yh1ia9uXMh9UdmcM4ac+Eh9Xw5KnxvQ1JwUdcJyw2vvtAl6rpyD0WGouLkabgBpM5Raq
	Tp1+3910XRhXcqUk4jTAkAwumuK+OmmL5GduYz3CKkXtdGIICRlZTtLyMaccio3PFXYQ
	8sXzoL/yMdO6tV+gHAIH04yFyNpa4aGgb00H3VJq2oEaGFVzlhJ0ISz/4tetvB0gHzRT
	Lyva2sDMnn1oaFA5RV+2dUtMWW5CuVK2WSxMcvWphdXTsPXIhmF2xH8JVkNlcJx3Og1E
	cTdQ==
X-Gm-Message-State: AGRZ1gKbwXhngH0SGiYXbaETu1eiia+9HRGHHAoL5BbNswk1wJCUFitS
	HKrjuTzLUke63UyZFjG95IPunreUqCgjDZkczUnv5g==
X-Received: by 2002:a9d:5f81:: with SMTP id g1mr11755182oti.317.1540903347020; 
	Tue, 30 Oct 2018 05:42:27 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:7c90:0:0:0:0:0 with HTTP; Tue, 30 Oct 2018 05:42:06
	-0700 (PDT)
In-Reply-To: <f2832be6-83ab-83ac-2063-13bf0b556d80@redhat.com>
References: <20181029232100.8454-1-philmd@redhat.com>
	<20181029232100.8454-3-philmd@redhat.com>
	<CAFEAcA_yde+Ppuqet7KFE-AvZrjnrfYeY=R1aWD86cox+WYsxg@mail.gmail.com>
	<f2832be6-83ab-83ac-2063-13bf0b556d80@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 30 Oct 2018 12:42:06 +0000
Message-ID: <CAFEAcA_6mDdxVU_TY583uOTgAX_eT-s52QRCDWTd0_uCrUTwhA@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::343
Subject: Re: [Qemu-arm] [PATCH 2/3] hw/dma/pl330: Factor out pl330_init()
 from hw/arm/xilinx_zynq.c
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
Cc: Igor Mitsyanko <i.mitsyanko@gmail.com>,
	Alistair Francis <alistair@alistair23.me>,
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
	Guenter Roeck <linux@roeck-us.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ZngUDs4qXmS1

On 30 October 2018 at 11:28, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com=
> wrote:
> On 30/10/18 10:36, Peter Maydell wrote:
>>
>> On 29 October 2018 at 23:20, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.=
com>
>> wrote:
>>>
>>> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
>>> ---
>>>   MAINTAINERS            |  1 +
>>>   hw/arm/xilinx_zynq.c   | 18 ++----------------
>>>   hw/dma/pl330.c         |  2 +-
>>>   include/hw/dma/pl330.h | 41 +++++++++++++++++++++++++++++++++++++++++
>>>   4 files changed, 45 insertions(+), 17 deletions(-)
>>>   create mode 100644 include/hw/dma/pl330.h
>>
>>
>>> +static inline void pl330_init(uint32_t base, qemu_irq irq, int nreq)
>>> +{
>>> +    SysBusDevice *busdev;
>>> +    DeviceState *dev;
>>> +
>>> +    dev =3D qdev_create(NULL, TYPE_PL330);
>>> +    qdev_prop_set_uint8(dev, "num_chnls", 8);
>>> +    qdev_prop_set_uint8(dev, "num_periph_req", nreq);
>>> +    qdev_prop_set_uint8(dev, "num_events", 16);
>>> +    qdev_prop_set_uint8(dev, "data_width", 64);
>>> +    qdev_prop_set_uint8(dev, "wr_cap", 8);
>>> +    qdev_prop_set_uint8(dev, "wr_q_dep", 16);
>>> +    qdev_prop_set_uint8(dev, "rd_cap", 8);
>>> +    qdev_prop_set_uint8(dev, "rd_q_dep", 16);
>>> +    qdev_prop_set_uint16(dev, "data_buffer_dep", 256);
>>> +    qdev_init_nofail(dev);
>>
>>
>> These are the settings the Xilinx board uses, but are
>> they really the settings every SoC that has a PL330 will use ?
>
>
> Except "num_periph_req", all are pl330_properties defaults.

If they're all the device's defaults there's not much point
in setting them by hand. But my point is that the reason they're
properties is that in the real hardware these are configurable
values in the RTL. So any given SoC model needs to be able to
set them appropriately. Having a helper function that doesn't
let you set them makes it too easy for people modelling SoCs
not to think about the question, I think...

thanks
-- PMM
