Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp1119181wrd;
        Sat, 18 Aug 2018 03:08:38 -0700 (PDT)
X-Google-Smtp-Source: AA+uWPyFDCOC1eTW2oJKC9JzrRQdiyIwt5QVe1Vwml5N2o8nAiKXQLe8PbOKVgLfZ+5BxBTQc58F
X-Received: by 2002:ac8:530d:: with SMTP id t13-v6mr35771494qtn.396.1534586918046;
        Sat, 18 Aug 2018 03:08:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1534586918; cv=none;
        d=google.com; s=arc-20160816;
        b=m4ANCzk+HWXZczXcKW9JpnLQ8eKnihuAcv7ZGCP6r9DmBuIloFQJXSU0nyPTB74IMF
         j3rvuzyI4ZHOLBGLfBXxQyqDP9Dzc0MQtDkQDCMbgOytKKk7Iub47peEfPDDonAOgV4P
         q3wD/AXD6SPy42Yo2KFwz8uYUdwJDwu1ugTCw1DDvv6DGvvhtNfi/PdSlKlrz9yhcyBw
         UAFX/TphUKJEWTwh7xNrSk3Ymy95FnIgRasJ28WQJrk1AeyNh6FknnD27DdgPa8djtpJ
         Ranh/xZZmQ8C2ctn/sQB7tPJ8czzTg8kZxwIqqwTqwDL1Zbbfy/uBVb7h4B3Id4ichG4
         wJHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=m9L1NbTwvCOiel66mJKdFYru8JEr4wK/q0cazQVHfD4=;
        b=EeYp2yaud6GHLVG4t9jIth9TVAy9qvt6fGhrMsNlvULbuilhG7pdV9RoURSQVw+nqO
         s6OHIlorUoj/qVxARXa69szseVSkvTM643yG4HosHwucyGt/14fZjwyl2PhDT85oUiGK
         8sVMaap1niyOZy3Mw+UG2Gu+DPpzKwwvLcB+LSbOINpueGmhC4JjhEAJDUPz4ce3zQlg
         YAI/LgSTTeqNqnKsB7PhXeKb/DtdtkaOfhQD0XOS3ypjV7DjE4R3fV37Abn2ljkZCz37
         lT7ScRN9u2gU6ES5rxi1DjSbKG7UAMwWhI2HW5OhDNYIgdTx692Ae42Cg2IKureKKzSH
         vhoQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MVJaGC5V;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g188-v6si569658qkf.363.2018.08.18.03.08.37
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 18 Aug 2018 03:08:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MVJaGC5V;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38248 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fqy9t-0007Ha-Ge
	for alex.bennee@linaro.org; Sat, 18 Aug 2018 06:08:37 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40786)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fqy9f-0007H0-RF
	for qemu-arm@nongnu.org; Sat, 18 Aug 2018 06:08:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fqy8x-0000xe-Lj
	for qemu-arm@nongnu.org; Sat, 18 Aug 2018 06:07:40 -0400
Received: from mail-oi0-x241.google.com ([2607:f8b0:4003:c06::241]:46112)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fqy8x-0000wS-Dy
	for qemu-arm@nongnu.org; Sat, 18 Aug 2018 06:07:39 -0400
Received: by mail-oi0-x241.google.com with SMTP id y207-v6so18137448oie.13
	for <qemu-arm@nongnu.org>; Sat, 18 Aug 2018 03:07:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=m9L1NbTwvCOiel66mJKdFYru8JEr4wK/q0cazQVHfD4=;
	b=MVJaGC5VFcrm50ugK/2F6mG2/5kRRlVvjUG0Qok+vzB2CaIcO8uBnFdwt832DCi4EO
	lm4n+DhUtaQOaz0OCG1Pr0HAjmKv1PGnPJ1n4R+wzrgc/xXPBag3y2qjdTg1EhMtcSAr
	FBFHFjsUWiDuWGmHwsleJLNK/vpniHVpEgoEg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=m9L1NbTwvCOiel66mJKdFYru8JEr4wK/q0cazQVHfD4=;
	b=tAbFTUNzBSq8GYQtON2SlLmLtCMmld7M6ZNuylydtLrymK7BW0LkqML+SP1uX7Tggt
	JcGJfirhONNVlJ8UXDNAG5Qy5FeSUoVxJkNG6iHvVhZXZbZZwB+YDHJQkoHtIRfvbHrn
	1JNC/VpxSsqwhfvb3zysX5xSAAhrWpaLJofxsi/SBOfza85SOsnrGKXbV3BUIwzJHg9H
	b6Z97FAjfoyQf0iwFQTcRpOz0+oV5WO7cJ+jdOu1wG2QR2ymUwbqSV7619jFlHYQiEkP
	AmOcg5o2k/ED5JbzToIK7PD6FhKrdtqkp1ZGWxfUvvcgT/eiXcQ+sL07bdn+6Ki1XB62
	hETw==
X-Gm-Message-State: AOUpUlFoqd/HqUM8jkeA3OCpnh94vxOrtnr76MQDjHBzLK78XCSX0C4z
	zTnt9cbKSaMz97DmnthLgQhCkI1CWniyg7msSZsTqA==
X-Received: by 2002:aca:b9c2:: with SMTP id
	j185-v6mr5713475oif.212.1534586858794; 
	Sat, 18 Aug 2018 03:07:38 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:5c8a:0:0:0:0:0 with HTTP; Sat, 18 Aug 2018 03:07:18
	-0700 (PDT)
In-Reply-To: <e65ebee0-33bf-3bb5-fc9a-2a60532af74e@amsat.org>
References: <20180809130115.28951-1-peter.maydell@linaro.org>
	<20180809130115.28951-17-peter.maydell@linaro.org>
	<e65ebee0-33bf-3bb5-fc9a-2a60532af74e@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 18 Aug 2018 11:07:18 +0100
Message-ID: <CAFEAcA8==GqUH4mOc0ne9iCvUCpsqQmkRw8cYpu+GqM7Akd0Kw@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::241
Subject: Re: [Qemu-arm] [PATCH 16/16] hw/arm/mps2-tz: Create PL081s and MSCs
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	"patches@linaro.org" <patches@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: VC4kwj8k4G9j

On 18 August 2018 at 02:09, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> w=
rote:
> On 08/09/2018 10:01 AM, Peter Maydell wrote:
>> The AN505 FPGA image includes four PL081 DMA controllers, each
>> of which is gated by a Master Security Controller that allows
>> the guest to prevent a non-secure DMA controller from accessing
>> memory that is used by secure guest code. Create and wire
>> up these devices.
>>
>> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>> ---
>>  hw/arm/mps2-tz.c | 101 +++++++++++++++++++++++++++++++++++++++++++----
>>  1 file changed, 94 insertions(+), 7 deletions(-)
>>
>> diff --git a/hw/arm/mps2-tz.c b/hw/arm/mps2-tz.c
>> index 22180c56fb7..7d92bc5fe1c 100644
>> --- a/hw/arm/mps2-tz.c
>> +++ b/hw/arm/mps2-tz.c
>> @@ -45,7 +45,9 @@
>>  #include "hw/misc/mps2-scc.h"
>>  #include "hw/misc/mps2-fpgaio.h"
>>  #include "hw/misc/tz-mpc.h"
>> +#include "hw/misc/tz-msc.h"
>>  #include "hw/arm/iotkit.h"
>> +#include "hw/dma/pl080.h"
>>  #include "hw/devices.h"
>>  #include "net/net.h"
>>  #include "hw/core/split-irq.h"
>> @@ -75,8 +77,9 @@ typedef struct {
>>      UnimplementedDeviceState i2c[4];
>>      UnimplementedDeviceState i2s_audio;
>>      UnimplementedDeviceState gpio[4];
>> -    UnimplementedDeviceState dma[4];
>>      UnimplementedDeviceState gfx;
>> +    PL080State dma[4];
>> +    TZMSC msc[4];
>>      CMSDKAPBUART uart[5];
>>      SplitIRQ sec_resp_splitter;
>>      qemu_or_irq uart_irq_orgate;
>> @@ -273,6 +276,65 @@ static MemoryRegion *make_mpc(MPS2TZMachineState *m=
ms, void *opaque,
>>      return sysbus_mmio_get_region(SYS_BUS_DEVICE(mpc), 0);
>>  }
>>
>> +static MemoryRegion *make_dma(MPS2TZMachineState *mms, void *opaque,
>> +                              const char *name, hwaddr size)
>> +{
>> +    PL080State *dma =3D opaque;
>> +    int i =3D dma - &mms->dma[0];
>
> This line is not trivial to read. I wondered "isn't this ptrdiff_t? why
> not divide by sizeof(dma)...

It's following the same approach as the other existing
make_*() functions in this file, though.


>> +    SysBusDevice *s;
>> +    char *mscname =3D g_strdup_printf("%s-msc", name);
>> +    TZMSC *msc =3D &mms->msc[i];
>> +    DeviceState *iotkitdev =3D DEVICE(&mms->iotkit);
>> +    MemoryRegion *msc_upstream;
>> +    MemoryRegion *msc_downstream;
>> +
>> +    /*
>> +     * Each DMA device is a PL081 whose transaction master interface
>> +     * is guarded by a Master Security Controller. The downstream end o=
f
>> +     * the MSC connects to the IoTKit AHB Slave Expansion port, so the
>> +     * DMA devices can see all devices and memory that the CPU does.
>> +     */
>> +    init_sysbus_child(OBJECT(mms), mscname, msc, sizeof(mms->msc[0]),
>
> sizeof(*msc) easier to read?

That would work and probably is better; again I was just following
the same thing I'd done in other make_*() functions earlier.

thanks
-- PMM
