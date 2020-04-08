Received: by 2002:ac2:5937:0:0:0:0:0 with SMTP id v23csp381163lfi;
        Wed, 8 Apr 2020 03:06:48 -0700 (PDT)
X-Google-Smtp-Source: APiQypIukNlF1uJCV6GTiMVAx3m+AiNkRQWcaRXEAN93TuYnUof/05S6V7VGTAg4Qb7mGjze2fLq
X-Received: by 2002:a37:2d83:: with SMTP id t125mr6886747qkh.359.1586340408221;
        Wed, 08 Apr 2020 03:06:48 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n202si3501151qka.151.2020.04.08.03.06.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 08 Apr 2020 03:06:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=wQMoaWiD;
       arc=fail (signature failed);
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:33850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jM7bb-0008Ge-Gy
	for alex.bennee@linaro.org; Wed, 08 Apr 2020 06:06:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46613)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <damien.hedde@greensocs.com>) id 1jM7b8-0008Ay-AS
 for qemu-arm@nongnu.org; Wed, 08 Apr 2020 06:06:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <damien.hedde@greensocs.com>) id 1jM7b5-0005th-T4
 for qemu-arm@nongnu.org; Wed, 08 Apr 2020 06:06:16 -0400
Received: from beetle.greensocs.com ([5.135.226.135]:42038)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <damien.hedde@greensocs.com>)
 id 1jM7b5-0005oU-BB; Wed, 08 Apr 2020 06:06:15 -0400
Received: from [192.168.1.12] (lfbn-gre-1-344-171.w90-112.abo.wanadoo.fr
 [90.112.62.171])
 by beetle.greensocs.com (Postfix) with ESMTPSA id 950B296EF0;
 Wed,  8 Apr 2020 10:06:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1586340372;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7nyR2oWPAYjjoaK8JAIKLS4NWzG69MYCwGOPrLLhRGk=;
 b=wQMoaWiDUn1xIQyWfSNc72ls8KWKXHNY/fA/pHhaRcUlAWIhZskaOrJyzbn/9YPfpZbW0d
 BSY3QmGmFesEIrYbser5aviAdBdXJj5z5YzPuJLpYnG3kN/8z5kdKZLlGsub9zB9WmRVpg
 /P1piKgLoRea64d/SkUoRn3qW/V0n+0=
Subject: Re: [PATCH v9 5/9] docs/clocks: add device's clock documentation
To: Markus Armbruster <armbru@redhat.com>
References: <20200406135251.157596-1-damien.hedde@greensocs.com>
 <20200406135251.157596-6-damien.hedde@greensocs.com>
 <87pncjzxwc.fsf@dusky.pond.sub.org>
From: Damien Hedde <damien.hedde@greensocs.com>
Message-ID: <f5556e5f-ee75-10cb-53f3-b249de8a5147@greensocs.com>
Date: Wed, 8 Apr 2020 12:06:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <87pncjzxwc.fsf@dusky.pond.sub.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US-large
Content-Transfer-Encoding: 7bit
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com; 
 s=mail; t=1586340372;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7nyR2oWPAYjjoaK8JAIKLS4NWzG69MYCwGOPrLLhRGk=;
 b=ETNnm7aRrIsp1HhK1Wl/Z54wrwLnnfeKtKeBqIgiknSIcIZ1k/g3/mKyj5/RrFPo12DhOl
 iJPfpixkpTgLpQKjWnzIzA8YEjRkRcR7AyPrZYb33Zc+/Rq08T8LhlPGKPcGy+F2jcB2BE
 s8O+AM2PaY2jUe4OasaX8rIFPgoR8gs=
ARC-Seal: i=1; s=mail; d=greensocs.com; t=1586340372; a=rsa-sha256; cv=none;
 b=fMYiC06BLS8w1tl5dt6t6SvlJe7g+12fvoRi39ppnyHQvO+fTVt3QibTaqQ06+Vx02w5C5
 k18o1QT3bzkNI1QTq0Wbltorrxk/+KkERTmqS+T71gEpAtmvVYLSDCGsWEZo8oymwLnVOK
 e2L85yoNUvI9CtsK+FVSef+tC+uFATU=
ARC-Authentication-Results: i=1; ORIGINATING;
 auth=pass smtp.auth=damien smtp.mailfrom=damien.hedde@greensocs.com
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 5.135.226.135
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>, peter.maydell@linaro.org,
 berrange@redhat.com, ehabkost@redhat.com, alistair@alistair23.me,
 mark.burton@greensocs.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>, marcandre.lureau@redhat.com,
 pbonzini@redhat.com, philmd@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 2X2QA7+2ewdF



On 4/7/20 7:07 AM, Markus Armbruster wrote:
> Damien Hedde <damien.hedde@greensocs.com> writes:
> 
>> Add the documentation about the clock inputs and outputs in devices.
>>
>> This is based on the original work of Frederic Konrad.
>>
>> Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
>> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
>> Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
>> ---
>> v9:
>>  + fix a few typos (Alistair)
>>
>> v8:
>>  + fix list indentation
>>  + reduce title size
>>
>> v7:
>>  + update ClockIn/Out types
>>  + switch to rst format
>> ---
>>  docs/devel/clocks.rst | 360 ++++++++++++++++++++++++++++++++++++++++++
>>  docs/devel/index.rst  |   1 +
>>  2 files changed, 361 insertions(+)
>>  create mode 100644 docs/devel/clocks.rst
>>
>> diff --git a/docs/devel/clocks.rst b/docs/devel/clocks.rst
>> new file mode 100644
>> index 0000000000..ead9f55561
>> --- /dev/null
>> +++ b/docs/devel/clocks.rst
>> @@ -0,0 +1,360 @@
>> +Modeling a clock tree in QEMU
>> +=============================
>> +
>> +What are clocks
>> +---------------
>> +
>> +Clocks are QOM objects developed for the purpose of modeling the
>> +distribution of clocks in QEMU.
>> +
>> +They allow us to model the clock distribution of a platform and detect
>> +configuration errors in the clock tree such as badly configured PLL, clock
>> +source selection or disabled clock.
>> +
>> +The object is *Clock* and its QOM name is ``CLOCK``.
> 
> PATCH 1 has
> 
>     #define TYPE_CLOCK "clock"
> 
> Ignorant question: how is this related to *Clock* and ``CLOCK``?
> 
> [...]
> 

Hi Markus,


*Clock* refer to the C type
> typedef struct Clock Clock;

I think I've put ``CLOCK`` in uppercase because, in practical, we only
use the upper case macro.
> #define TYPE_CLOCK "clock"
> #define CLOCK(obj) OBJECT_CHECK(Clock, (obj), TYPE_CLOCK)

I'm not sure what is the right terminology here. Maybe I can replace by
the following:

> The QOM name of a clock is ``"clock"`` (or the macro ``TYPE_CLOCK``).
The C type object is *Clock*.

Thanks,
Damien

