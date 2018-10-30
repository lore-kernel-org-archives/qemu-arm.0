Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp5547196wro;
        Tue, 30 Oct 2018 06:02:02 -0700 (PDT)
X-Google-Smtp-Source: AJdET5f07odZkYcr1Ck2jp3eoJCJa3KqqN5Rvt0ffvdV7vIhrDLUaACkg2tMot6TD2nqqSFlD8x2
X-Received: by 2002:ae9:d801:: with SMTP id u1-v6mr15999435qkf.291.1540904521876;
        Tue, 30 Oct 2018 06:02:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1540904521; cv=none;
        d=google.com; s=arc-20160816;
        b=Dj3woHdRXbnBH3W8jgAeZy55q2Rsd/KhU6GhqRtq1emUK8uPhkRiRDGleL5sVGbbw7
         pPCB7Dl2fjGCH9QpbMDfjSZ/BGBsyn3KzIljPlKfOrU6zrOzdNalI2KCok4Buih99e/t
         DVZ6ndmCoPWH8IJ1kLQleI8KE+hvsd3ZF8UXvPikq9GS2SzsL182wgChC8kKfVRPC5vv
         2XwWCZZF+OTFpdnAodg6PioxfQYfqf0aHf3UPgnL2z0UpWj910jPq1kfX5E+zpTYWM3F
         u4Fa/hJ1casB6/Xd9UfK2poLre3/IXpw4m5kVUquF5IGmQrE81aep9WrxF1NLFO6qKjz
         5Nxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=dKDKjqjwDSmFPGcqUAnFY8hjWYTW0XPI8cDRdcBhVF4=;
        b=ljMXcm+94WoJoj/fNc53oUpa5+Sgsfg7XaGpyvysc1CyUd8kIHKalRfvcTgYox0Tni
         qlT9rpe9N5RuWBRUbTGbE5urjR7uLuCnqIXrCYyu0zjzFqvGtKggtPENaMS/Ob4jjjm4
         YGOz9V0wNjEqT0VqtLQ4xsC0mWSUr3B8lp0bTv5NEUk/0sGz1Nmv+9peAoy2A08Fdo4Z
         j4rmCKc0o10a5RhJVRMGLSt4ied23efQ91SsPObqdS+1kYdE1ordrIgLV/VhRZIIDxfo
         v2QwYiNqjNGEZyGmH9vH/PX/RPjCOKjq/fVl3vZfdaF+svtHISm/Xiom7XS+9x0z8cb3
         604w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r77-v6si2061799qkl.132.2018.10.30.06.02.01
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 30 Oct 2018 06:02:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:53134 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gHTej-0004bR-Er
	for alex.bennee@linaro.org; Tue, 30 Oct 2018 09:02:01 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41682)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gHTeV-0004Zj-R3
	for qemu-arm@nongnu.org; Tue, 30 Oct 2018 09:01:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gHTeM-0003nG-Uj
	for qemu-arm@nongnu.org; Tue, 30 Oct 2018 09:01:44 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:43149)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1gHTeM-0003kq-MC
	for qemu-arm@nongnu.org; Tue, 30 Oct 2018 09:01:38 -0400
Received: by mail-wr1-f65.google.com with SMTP id t10-v6so12479787wrn.10
	for <qemu-arm@nongnu.org>; Tue, 30 Oct 2018 06:01:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=dKDKjqjwDSmFPGcqUAnFY8hjWYTW0XPI8cDRdcBhVF4=;
	b=hWV4U9iimq/Fh4ZNU3ll8tMV9eG5cm+IR3whpa41Direslmnk1GFud5zriTGMwaTa4
	ivXz1rto0/4mseVGlydnmonaSwFCKArYjLYRb+8uj4DzGo7cEb7rpf2SR9qmvmXkr0c3
	1f5vld1p1jbsntfOiW4ofTUeKJooAQElwvs6lSAKGbfJE4U5BHSiR4+yMb9wdsJlARf8
	vxNS/HGK3MJQ8xrlV9/M2vWFTH29bzkTyQkqCmErnRP8YhzORfL5TUNz8LrrhGCHEviG
	dPg5Ubx4fpq/fhDucBnsumQezpFEVlEG84JMsZCyqwJ961VZl4ct6f1mHML3uLO/QAug
	cMOg==
X-Gm-Message-State: AGRZ1gIDH9ospTamLWOPfsMFMohrH46f2kLb0Md9GqkXXFGiUb+6Tbzl
	rpPbF9RgM86NNuh2OoWMwZ63hMRZSDY=
X-Received: by 2002:adf:800b:: with SMTP id
	11-v6mr5175333wrk.106.1540904494538; 
	Tue, 30 Oct 2018 06:01:34 -0700 (PDT)
Received: from [192.168.1.130] ([139.47.13.138])
	by smtp.gmail.com with ESMTPSA id
	w6-v6sm1256744wrk.62.2018.10.30.06.01.32
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 30 Oct 2018 06:01:33 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>
References: <20181029232100.8454-1-philmd@redhat.com>
	<20181029232100.8454-3-philmd@redhat.com>
	<CAFEAcA_yde+Ppuqet7KFE-AvZrjnrfYeY=R1aWD86cox+WYsxg@mail.gmail.com>
	<f2832be6-83ab-83ac-2063-13bf0b556d80@redhat.com>
	<CAFEAcA_6mDdxVU_TY583uOTgAX_eT-s52QRCDWTd0_uCrUTwhA@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <2aba69a5-c466-b94c-0d83-3f4fd9d1722c@redhat.com>
Date: Tue, 30 Oct 2018 14:01:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_6mDdxVU_TY583uOTgAX_eT-s52QRCDWTd0_uCrUTwhA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.221.65
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
X-TUID: S6+jpDHSPaIc

On 30/10/18 13:42, Peter Maydell wrote:
> On 30 October 2018 at 11:28, Philippe Mathieu-Daudé <philmd@redhat.com> wrote:
>> On 30/10/18 10:36, Peter Maydell wrote:
>>>
>>> On 29 October 2018 at 23:20, Philippe Mathieu-Daudé <philmd@redhat.com>
>>> wrote:
>>>>
>>>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>>>> ---
>>>>    MAINTAINERS            |  1 +
>>>>    hw/arm/xilinx_zynq.c   | 18 ++----------------
>>>>    hw/dma/pl330.c         |  2 +-
>>>>    include/hw/dma/pl330.h | 41 +++++++++++++++++++++++++++++++++++++++++
>>>>    4 files changed, 45 insertions(+), 17 deletions(-)
>>>>    create mode 100644 include/hw/dma/pl330.h
>>>
>>>
>>>> +static inline void pl330_init(uint32_t base, qemu_irq irq, int nreq)
>>>> +{
>>>> +    SysBusDevice *busdev;
>>>> +    DeviceState *dev;
>>>> +
>>>> +    dev = qdev_create(NULL, TYPE_PL330);
>>>> +    qdev_prop_set_uint8(dev, "num_chnls", 8);
>>>> +    qdev_prop_set_uint8(dev, "num_periph_req", nreq);
>>>> +    qdev_prop_set_uint8(dev, "num_events", 16);
>>>> +    qdev_prop_set_uint8(dev, "data_width", 64);
>>>> +    qdev_prop_set_uint8(dev, "wr_cap", 8);
>>>> +    qdev_prop_set_uint8(dev, "wr_q_dep", 16);
>>>> +    qdev_prop_set_uint8(dev, "rd_cap", 8);
>>>> +    qdev_prop_set_uint8(dev, "rd_q_dep", 16);
>>>> +    qdev_prop_set_uint16(dev, "data_buffer_dep", 256);
>>>> +    qdev_init_nofail(dev);
>>>
>>>
>>> These are the settings the Xilinx board uses, but are
>>> they really the settings every SoC that has a PL330 will use ?
>>
>>
>> Except "num_periph_req", all are pl330_properties defaults.
> 
> If they're all the device's defaults there's not much point
> in setting them by hand. But my point is that the reason they're
> properties is that in the real hardware these are configurable
> values in the RTL. So any given SoC model needs to be able to
> set them appropriately. Having a helper function that doesn't
> let you set them makes it too easy for people modelling SoCs
> not to think about the question, I think...

Yes, I understood and agree.

I now respined v2 without this.

Thanks for your review!

Phil.

> 
> thanks
> -- PMM
> 
