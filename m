Received: by 10.223.188.70 with SMTP id a6csp261493wrh;
        Thu, 31 Aug 2017 16:42:13 -0700 (PDT)
X-Received: by 10.55.146.195 with SMTP id u186mr213205qkd.66.1504222933085;
        Thu, 31 Aug 2017 16:42:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1504222933; cv=none;
        d=google.com; s=arc-20160816;
        b=GMUmn1TXHy5X2mx9rMnO0NENSdYf3H5A5Dlv3Z0aZFWksBIFuZNG47EwiheltQ5EiD
         5aa/H0qO4a23upALZg7LPyOKwMeatMJUFLBb/AyvR+wZorjoJ6dQhcETdti3x+rsI8Me
         tI1VUaBay4bC1TWY6yaBCWY64DgWgb2wibH9BHBEYlF9zfZRK5+Se0B2kdRl27jRWW0x
         gtsUXtko1Eg3S4Q/LChEvUoDTVEhlkCaJeF6DIZ8AGEJWJcg+klf0vWJszWzwTeoU2xD
         u7V118wAdy5YVt15/nIoqChp82D8JmG7pNl4qP0N8z78Yx7n1hwiJP06DywMUUtshXxr
         R7eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=grex/scWDItlhlGFXvO1kPgEMarCyOey7CuOC+Bd9Lw=;
        b=tELURTw82yQhQIlG6C3F4+qshdFZxP6WqX+KZ/0cOuz+VbwBT3PjQ6/4w9VHbH/Qe+
         ihUZzo9B7sRh2wvvVLIvWxDtBI9rwzlI9PPmgj7674E8McJvKsVZEYkf/5HUQ95OGgy7
         S50vfnJKDTmR9Oj1vTFu1t4old7kuoTxr/ZZUqu8BahYOzEBdA50Q8ftjQYh6afJzzSY
         BUQzFhVjfKYroXrDP97JdZ+NvaT6Ft1yD7pbXIba25wyrRJRQsx283j1gWoziAOXqluM
         jlT5RAsIxkt+InjQs8sPrerkajUIHb6mdvXRvF2Wmj8ZgPGb6msOAWrc3W5FWGBLpQzl
         iNng==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=A9Nz23oe;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a186si9363787qkg.66.2017.08.31.16.42.12
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 31 Aug 2017 16:42:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=A9Nz23oe;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:33141 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dnZ6A-0006CE-RY
	for alex.bennee@linaro.org; Thu, 31 Aug 2017 19:42:10 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46646)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dnZ4n-0005I6-3z
	for qemu-devel@nongnu.org; Thu, 31 Aug 2017 19:40:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dnZ4m-0004j4-B9
	for qemu-devel@nongnu.org; Thu, 31 Aug 2017 19:40:45 -0400
Received: from mail-qk0-x243.google.com ([2607:f8b0:400d:c09::243]:34556)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dnZ4f-0004g4-FP; Thu, 31 Aug 2017 19:40:37 -0400
Received: by mail-qk0-x243.google.com with SMTP id a77so856702qkb.1;
	Thu, 31 Aug 2017 16:40:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=grex/scWDItlhlGFXvO1kPgEMarCyOey7CuOC+Bd9Lw=;
	b=A9Nz23oejYKaUAsHYkRdekH/t6e/HwNDO/GJKGI6sj24lndXRgDpxdRMibw2Du4Q0F
	7Ux9mGGnbRJt5i3GS2Zg9SLx+sxwS1NozUfgJskwTle0pVXHEz/rM3HqwJBYO9TgRebV
	P2qYrdzk7eOoaqAy8h4VRGXjJNWqrc17MiC71LdrqoeT3tyqBwjqNt6uPhBOqVwtAUPK
	jLNiz/h3pWnuPylSN6L7l6IgxXkuaxc4jDThDqYPwdrfDy8LoS2fpJqopzIGd+Huqldv
	6Amjk5OoGsd+i09phB5dVDCxxMmTHHitV+i1kv8F6kYYAoSsoZ7VVv+h/VOC4Smz4sPQ
	YKeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=grex/scWDItlhlGFXvO1kPgEMarCyOey7CuOC+Bd9Lw=;
	b=UQeN8UeF47wm3+u9NGZcaCjWEg7WEe9nq/GSasc+YwmBR45ehtLYAFR20nfhn58+Br
	s+V+5qaA/sPG1Rnv8EH2SlWBbpLwXZYbBiTAn5NXHytoYlzCCEX69N5rSWsWM0En1DhK
	PoDbXyu0MwDR82jb6JImUI9ZqcTJilFYCaJr36gk0mjtca/i7aoDolg6FTmKZ6qVRg1L
	MxEcINBgaKtV3h2r6Lb6Oo46T6KOtfOKLpDVa4RxqrGs2QXSGZxYqfi30gjRoMxHGOcC
	LOpxCK3wxOdt0O7yF0vU2J7Wcybz5zrQPDi9UqCfPbURs2t8eGSXn/XCPq22bPq39X16
	EU5w==
X-Gm-Message-State: AHPjjUhxrYBemS9dlCaL432XmbFrf0nw2ow6QYfiV0TfH+Y99V8QBsSR
	XrGgM4alISVA+g==
X-Google-Smtp-Source: ADKCNb7FC9a5Ed3u0vuJXf7cRhmZZ6UijkaP09p5tHw+kYOwXRvyRPy8p+76sXwrhF/0xqoeu134Mw==
X-Received: by 10.55.78.140 with SMTP id c134mr165555qkb.185.1504222836660;
	Thu, 31 Aug 2017 16:40:36 -0700 (PDT)
Received: from [192.168.1.10] ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id t5sm6376025qkl.59.2017.08.31.16.40.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 31 Aug 2017 16:40:36 -0700 (PDT)
To: Alistair Francis <alistair23@gmail.com>
References: <1503938283-12404-1-git-send-email-sundeep.lkml@gmail.com>
	<1503938283-12404-5-git-send-email-sundeep.lkml@gmail.com>
	<10da5552-c90a-21e6-43ac-829932f64930@amsat.org>
	<CAFEAcA9W=YqbeYKuAxvfNyjfCWGyAXuPdxwFrpLmoezLJ4pm-A@mail.gmail.com>
	<40ca8d07-75e5-e0b3-021e-5abaffd16b78@amsat.org>
	<CAKmqyKOyw3w4gqyUmW8qWVz_TtEmbx61J5GEm3NwA75Rhy8kQg@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <c753e87e-0c71-03fc-1cc0-5b546134b2d5@amsat.org>
Date: Thu, 31 Aug 2017 20:40:32 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <CAKmqyKOyw3w4gqyUmW8qWVz_TtEmbx61J5GEm3NwA75Rhy8kQg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::243
Subject: Re: [Qemu-devel] [Qemu devel v7 PATCH 4/5] msf2: Add Smartfusion2
 SoC
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	Subbaraya Sundeep <sundeep.lkml@gmail.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: w65ubc0CTFUB

Hi Alistair,

On 08/31/2017 08:02 PM, Alistair Francis wrote:
> On Wed, Aug 30, 2017 at 7:47 AM, Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
>> On 08/30/2017 09:26 AM, Peter Maydell wrote:
>>>
>>> On 30 August 2017 at 03:45, Philippe Mathieu-Daudé <f4bug@amsat.org>
>>> wrote:
>>>>
>>>> I think they might be issues if you start QEMU without -serial and then
>>>> use
>>>> a firmware polling for an uart, the device won't be mapped and the memory
>>>> accesses are mostly ignored.
>>>>
>>>> I'd rather use:
>>>>
>>>>       for (i = 0; i < MSF2_NUM_UARTS && i < MAX_SERIAL_PORTS; i++) {
>>>>           static const char *serial[] = {"serial0", "serial1"};
>>>>
>>>>           if (!serial_hds[i]) {
>>>>               serial_hds[i] = qemu_chr_new(serial[i], "null");
>>>>
>>>>           }
>>>>
>>>>> +            serial_mm_init(get_system_memory(), uart_addr[i], 2,
>>>>> +                           qdev_get_gpio_in(armv7m, uart_irq[i]),
>>>>> +                           115200, serial_hds[i],
>>>>> DEVICE_NATIVE_ENDIAN);
>>>>> +        }
>>>>> +    }
>>>
>>>
>>> It would be better to fix serial_mm_init() to handle having
>>> a NULL chardev pointer, because we already have a lot of
>>> SoC code that just passes it serial_hds[] regardless.
>>
>>
>> clever :)
>>
>>> I'd leave this code as it is and we can fix serial_mm_init
>>> separately (somebody pointed out this issue for a xilinx
>>> board recently).
> 
> Ah, I'll look into this then.

I already sent a series to take care of this:

http://lists.nongnu.org/archive/html/qemu-devel/2017-08/msg06325.html

I'll respin a v2 shortly.
