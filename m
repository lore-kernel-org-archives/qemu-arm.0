Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp5459435wro;
        Tue, 30 Oct 2018 04:43:34 -0700 (PDT)
X-Google-Smtp-Source: AJdET5ca2/59FcoC3G4SJ8jdi8yt9yiNYKWGGjQtYO67Ol5X+Ylfk5+Ft8NMhI4YiQJGYqHmJo3F
X-Received: by 2002:a0c:d44e:: with SMTP id r14mr16649795qvh.117.1540899814104;
        Tue, 30 Oct 2018 04:43:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1540899814; cv=none;
        d=google.com; s=arc-20160816;
        b=wVDSU5aoR26MfWBB092geg+A2S9evXTy8ihfOa9aRnQN2CoCmEHxZPtHHnIsIPEi16
         UFMymR+xFJSVI090RBX2BaMlQvkftzB9wUFRbv2obWEftz+Ld/SmjbnC3IhlIkqSKSKe
         VCUQVg4xpkuLJIG0zNeolrHoOigX7A+CmSc72GuDs+JoW4UBPnBxlCJ2NXFUxcqsaRb9
         /5rTJHU66AJN0PrnoKPYZLsNLUPk3Bq64cfc7LYlMYarPSI+xyl1o3iMXVCUPjhcD9YS
         tQwG7hkvUPERLT2XMNYh9v7D1HhfXo+qvO9fqNTIfg2CsOd0rSjDzGKj84hrtdb8pYfo
         48cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=YEoma7co09vRdTErfWo3dimQnQVHJMuDszZVg0Wn8vM=;
        b=WP4uwVUeuqYbL2RqpRPJbuI0UcQcNs6v0Q4pXG/YF6xy7wDb0Cmpb8BTKqpzlCRnxq
         IIpC5FMdjrXoOqQwNfu8mjdSoDSVku6fK4hYkolYnp4zRv87dD0fZ8L8vC343XmEKvWI
         qqbSIW0kZsa5ScYtKLBU12oPFiRdj3EAYUj973dJ6fzPi634ebcrfwLRMv6/8et/6W6g
         ha5Q+rKNeoZSFvqNv+QP+XFRkExPV+cNmh5Rh/mxGzHIP/857GlytQ+7NUN1pcKxktLX
         4w5q6t3u4YbddYr5BaNwsRkdmPDy4X/EK5Kc1LUx6Ym5zWAzM1fxVTnOPBiuVrQHKSx4
         zcXA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b67si5110043qkj.34.2018.10.30.04.43.33
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 30 Oct 2018 04:43:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:52378 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gHSQm-0003qa-0t
	for alex.bennee@linaro.org; Tue, 30 Oct 2018 07:43:32 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59600)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gHSBy-0005XM-OE
	for qemu-arm@nongnu.org; Tue, 30 Oct 2018 07:28:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gHSBt-00016h-Pm
	for qemu-arm@nongnu.org; Tue, 30 Oct 2018 07:28:14 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:44997)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1gHSBt-000159-JM
	for qemu-arm@nongnu.org; Tue, 30 Oct 2018 07:28:09 -0400
Received: by mail-wr1-f67.google.com with SMTP id d17-v6so11859192wre.11
	for <qemu-arm@nongnu.org>; Tue, 30 Oct 2018 04:28:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=YEoma7co09vRdTErfWo3dimQnQVHJMuDszZVg0Wn8vM=;
	b=lDZT5j6rTf/3UkLZLyZdoLzcJjlY0Gx9FLkpEja9NM+qb3sUV24Q23AIxSpssvIXXY
	XgInF2b7lxXzSdd88QIbwieLujSq7r9CEpEGo7Fh4UkRpqSimHos4MOZG1eW+4h0YcDs
	UNMPR9BE8haWLrlPp8ZE0udEsABRbUfDQ2Xl1GoVXa46IJwayy+auBIiRqu3HVmFndhT
	DSN/OzGFKz3Y2dyGXBEOy0OailQKv6csQuHPiXvEr+htinHayLQ3VA6dpShaMBHbDYHu
	Mt1bsVjI9w0MLB2v88wVX52mD8Jpucqf2mpfCpqt5bbBgZss5wuaFt1BHNibKlqFVNWc
	i/mw==
X-Gm-Message-State: AGRZ1gIeJGYkeWddDJTIsxwZNOnj/dSC0rBMClDypxeKI/NMpz7zFxVM
	TLf3oiVY/9dcwPaC/zfHo2sFgLC5pyY=
X-Received: by 2002:adf:c7d1:: with SMTP id
	y17-v6mr10258608wrg.230.1540898888467; 
	Tue, 30 Oct 2018 04:28:08 -0700 (PDT)
Received: from [192.168.1.130] ([139.47.13.138])
	by smtp.gmail.com with ESMTPSA id
	l140-v6sm31676304wmb.24.2018.10.30.04.28.06
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 30 Oct 2018 04:28:07 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>
References: <20181029232100.8454-1-philmd@redhat.com>
	<20181029232100.8454-3-philmd@redhat.com>
	<CAFEAcA_yde+Ppuqet7KFE-AvZrjnrfYeY=R1aWD86cox+WYsxg@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <f2832be6-83ab-83ac-2063-13bf0b556d80@redhat.com>
Date: Tue, 30 Oct 2018 12:28:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_yde+Ppuqet7KFE-AvZrjnrfYeY=R1aWD86cox+WYsxg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.221.67
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
X-TUID: S73wi5ko70Xr

On 30/10/18 10:36, Peter Maydell wrote:
> On 29 October 2018 at 23:20, Philippe Mathieu-Daudé <philmd@redhat.com> wrote:
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> ---
>>   MAINTAINERS            |  1 +
>>   hw/arm/xilinx_zynq.c   | 18 ++----------------
>>   hw/dma/pl330.c         |  2 +-
>>   include/hw/dma/pl330.h | 41 +++++++++++++++++++++++++++++++++++++++++
>>   4 files changed, 45 insertions(+), 17 deletions(-)
>>   create mode 100644 include/hw/dma/pl330.h
> 
>> +static inline void pl330_init(uint32_t base, qemu_irq irq, int nreq)
>> +{
>> +    SysBusDevice *busdev;
>> +    DeviceState *dev;
>> +
>> +    dev = qdev_create(NULL, TYPE_PL330);
>> +    qdev_prop_set_uint8(dev, "num_chnls", 8);
>> +    qdev_prop_set_uint8(dev, "num_periph_req", nreq);
>> +    qdev_prop_set_uint8(dev, "num_events", 16);
>> +    qdev_prop_set_uint8(dev, "data_width", 64);
>> +    qdev_prop_set_uint8(dev, "wr_cap", 8);
>> +    qdev_prop_set_uint8(dev, "wr_q_dep", 16);
>> +    qdev_prop_set_uint8(dev, "rd_cap", 8);
>> +    qdev_prop_set_uint8(dev, "rd_q_dep", 16);
>> +    qdev_prop_set_uint16(dev, "data_buffer_dep", 256);
>> +    qdev_init_nofail(dev);
> 
> These are the settings the Xilinx board uses, but are
> they really the settings every SoC that has a PL330 will use ?

Except "num_periph_req", all are pl330_properties defaults.

> 
> thanks
> -- PMM
> 
