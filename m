Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp5285699wro;
        Tue, 30 Oct 2018 01:36:00 -0700 (PDT)
X-Google-Smtp-Source: AJdET5fkRX+XgY5T2BW16N0glSpwFJwFCEVLuDmk+rJuxYdiAj3gZOvjwAaDotcQM4bNd3HJxiZE
X-Received: by 2002:aed:2e65:: with SMTP id j92-v6mr1409925qtd.339.1540888560476;
        Tue, 30 Oct 2018 01:36:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1540888560; cv=none;
        d=google.com; s=arc-20160816;
        b=ZsQjxvP7fBr4PdghKvgbv4m04piPg1d+DLfqywCW9E0wVaIc8YAqqUQTrJnuuW0Pgq
         GI2qU1T7Xenp6mhR7E1e+KMjzLEHfQsTyzPPoKXbHSaLnCby+fdOOnUvYGpHlWVZvrUU
         0wpoJ/XRyAFoii2zi6Qn4QoNzCdbBJV7vEVLtv71F/i4bODP9bC+OznC/pKV6xLtChhv
         O5SDlnZkk4G9Rtuk97KrieLmy5mVMe5mg25IKlgWFMxbfJR+MEbln2pcK2swvB83qC38
         spKrInOg5puh6BnWLJZIVA/Sk8BkGJxM7a8uoLgFDAnK6p+UHyOpcXjqh/jWLV3brLEd
         qg/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=cG7X1KCby9obfCLmCin7FAVF0emMb2kU4tUlgh+pM/w=;
        b=lktP/5gOk1nzNJCGiYdCjXy+ipxDb1/YY6nbSUVvuQHavUqA+dKy94fi1MLsl5gDhI
         X/6XJK8pWQCtoAw9yle0tuGvC3gDBHVnO40SNzcqtyi+mHHFxzlPESCxL+DS7mvfnX/o
         gOpJdbJS5QU0t039jGDJtZxh6Nyehrke7nI2ALubS/zGxqiogFri0eGYmOG3KAhcoNrL
         1bQr1nAvCr7nRbaK9CQQiGAd+T093LGL1hqtwvKS2PNtIazopHZ/DfxQeoOWEdp4fdP0
         s5QC9ZmuFpPNj7ilVOaGAjG3VBgfCaYd668Qy83QD4+r7RhRdA+KIJo7E5topNOmR+V4
         lqKQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c3-v6si3399531qva.25.2018.10.30.01.36.00
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 30 Oct 2018 01:36:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:51586 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gHPVI-0007Da-1a
	for alex.bennee@linaro.org; Tue, 30 Oct 2018 04:36:00 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36906)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gHPV4-0007DN-Nz
	for qemu-arm@nongnu.org; Tue, 30 Oct 2018 04:35:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gHPUy-00070n-Bc
	for qemu-arm@nongnu.org; Tue, 30 Oct 2018 04:35:46 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:39442)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1gHPUw-0006tL-3M
	for qemu-arm@nongnu.org; Tue, 30 Oct 2018 04:35:38 -0400
Received: by mail-wr1-f67.google.com with SMTP id r10-v6so11553285wrv.6
	for <qemu-arm@nongnu.org>; Tue, 30 Oct 2018 01:35:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=cG7X1KCby9obfCLmCin7FAVF0emMb2kU4tUlgh+pM/w=;
	b=Cax57ZjfFAXZEEOyMZmB7amJV3XZo7r7QqYkcVJj3t9QUSKR8H9TLBQZkTWXbrh0r4
	Hcqhd4KmIMDvSVq4VZ6aeOcJSmJSTRMS3fF0mbrAKHAEd2S7fwdiy1nGRj8jHk/OLymS
	Wzw5DwJ5cMkF7qzanRe/srgzBGcreeOT7XqYufrArw+nfluMqNYeQ5+1h5zoY7p1q3qf
	C0QA/3spiTaM7x+43wxvbf4SM8TmQnb128BsmNXsUKGfelNX+GkPJBjJMtS1mxu/auBQ
	hNRnH0Q01SLkcICDua468xMToPQEYk/JpxuGr3hVHQVSjsLKPoQ5vCOwqNEOyTIVNgIG
	swMg==
X-Gm-Message-State: AGRZ1gKKTzytFbLiB+6+WmeBPCjEuUQyU47wQ/GIie/Lr0ELYFvtAAJR
	+Lee3Wu+l2Vqkt/OQ9JaFfm8Jw==
X-Received: by 2002:adf:c709:: with SMTP id
	k9-v6mr11114084wrg.197.1540888528266; 
	Tue, 30 Oct 2018 01:35:28 -0700 (PDT)
Received: from [192.168.1.130] ([139.47.13.138])
	by smtp.gmail.com with ESMTPSA id
	140-v6sm15776776wmx.34.2018.10.30.01.35.26
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 30 Oct 2018 01:35:27 -0700 (PDT)
To: Richard Henderson <richard.henderson@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>, Guenter Roeck
	<linux@roeck-us.net>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>,
	Alistair Francis <alistair@alistair23.me>
References: <20181029232100.8454-1-philmd@redhat.com>
	<20181029232100.8454-3-philmd@redhat.com>
	<d3a957a8-754a-5d25-b776-d1ab9583c93a@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <e0ce22e6-7a71-98f2-abbc-ec430fda5178@redhat.com>
Date: Tue, 30 Oct 2018 09:35:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <d3a957a8-754a-5d25-b776-d1ab9583c93a@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.221.67
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 2/3] hw/dma/pl330: Factor out
 pl330_init() from hw/arm/xilinx_zynq.c
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: FsU8l2NhgAZE

On 30/10/18 9:18, Richard Henderson wrote:
> On 10/29/18 11:20 PM, Philippe Mathieu-Daudé wrote:
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
>> +
>> +    busdev = SYS_BUS_DEVICE(dev);
>> +    sysbus_mmio_map(busdev, 0, base);
>> +    sysbus_connect_irq(busdev, 0, irq);
>> +}
> 
> Why is this inline instead of in hw/dma/pl300.c?
> There should be nothing performance sensative here...

Yeah I didn't like it much neither and wondered the same :)
I was looking a examples in hw/char:

[phil@x1w qemu]$ git grep -hA 2 'static inline' include/hw/char/
52:static inline DeviceState *cadence_uart_create(hwaddr addr,
53-                                        qemu_irq irq,
54-                                        Chardev *chr)
--
52:static inline DeviceState *cmsdk_apb_uart_create(hwaddr addr,
53-                                                 qemu_irq txint,
54-                                                 qemu_irq rxint,
--
18:static inline DeviceState *pl011_create(hwaddr addr,
19-                                        qemu_irq irq,
20-                                        Chardev *chr)
--
35:static inline DeviceState *pl011_luminary_create(hwaddr addr,
36-                                                 qemu_irq irq,
37-                                                 Chardev *chr)
--
18:static inline DeviceState *xilinx_uartlite_create(hwaddr addr,
19-                                        qemu_irq irq,
20-                                        Chardev *chr)

I'll clean it and add a docstring.

Thanks for the review,

Phil.
