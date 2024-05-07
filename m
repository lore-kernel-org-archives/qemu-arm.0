Received: by 2002:a05:7022:ef03:b0:7c:9548:a19d with SMTP id qy3csp2183281dlb;
        Tue, 7 May 2024 10:30:55 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVBwmV/hD8Fy3i0cdZ0hxYPdCvEbrOywsXL2HLV4qJ/Y3zrrkqWah7HkVtf1lmN0Ymneu0BEgN7gm5VUMIRzZyWG+BVd+OK
X-Google-Smtp-Source: AGHT+IFPBj8HVJZvmKcYXCz0Bdyjz2XOGGhIHj09WGUQ8zSDSnrvqYQABI7pCwIP6B5bzeiNivJ7
X-Received: by 2002:ae9:ee1a:0:b0:78e:e432:3f0f with SMTP id af79cd13be357-792b2814e65mr35328485a.72.1715103055253;
        Tue, 07 May 2024 10:30:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1715103055; cv=none;
        d=google.com; s=arc-20160816;
        b=lJGzvFfJqaIiMIZsFbR3PqaJiOMKWM3xY3XBEqg4tQ2K1kkT8gGsIYqd6NGb+Yz0JU
         xYLrNIe+8FOswnqGs1YhsPUFmKgvDP16T8h4YTHJYgh85Uj2aKHLOYNiAcVf+mUYiw9E
         6Amd9XvNe3DIvWQr0Y0QUYPtO/fxFBZjuN25gGB2A+TJpNEEjkhJLS74l3ZctH1Ve1zq
         pUujg0kMFdepQtdiDlIm0Z4GY8spaU4EEivO++z1YduSQP4l86v2xDQmJcEDrvtZAekb
         daem69euqZOKeo75M2xCQhqEIIaUy4sy9IogDgM1Ti4KGAPbR0FERdvdnJmQrE9JmzFm
         Mq3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:thread-index:thread-topic
         :content-transfer-encoding:mime-version:subject:references
         :in-reply-to:message-id:cc:to:from:date:dkim-signature:dkim-filter;
        bh=VBspK0ispGSoTOtP1gqM8CgfnYM0RKjv6t3GKcSvJmw=;
        fh=6BfdrQDA+HKUAy4em4gKapbu4BVb1/PQAYveAQapuYY=;
        b=adGlVSOqv+r0PKC/0t3aeBCVfdL77inTNcG5bG7p2ztPaisTneZiF5Gwq79saDAc/L
         v5EbqLpxND0MEgrzOiD+ayyHre5fCI8vDgoiY/V6Ev/7iSmr+SD1hi6e8+E3BxJ+eN8G
         ybxTokTQ9z9jwlnQl94ZJ5H19Bl4QCP1ca/QC3ogZLnFlvI0bZKwB4Lq8k+B2lfO3SzK
         KUhWRidIjenIEDxKTbgabl2/+wL4sCX55VXDgmntScD9Iff29CFxRfbO2QZlzt+RQrkE
         fAV/e449X/ZI3qGqpwZbvqQ9W0/YdtyzyX3kNmJZ4Gh1SbZ3oc7KTVdRcso2DPrwchGC
         GJ+g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@telecom-paris.fr header.s=A35C7578-1106-11E5-A17F-C303FDDA8F2E header.b=dmjY2hYT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=telecom-paris.fr
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id os5-20020a05620a810500b007928ef84ed5si6844324qkn.556.2024.05.07.10.30.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 07 May 2024 10:30:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@telecom-paris.fr header.s=A35C7578-1106-11E5-A17F-C303FDDA8F2E header.b=dmjY2hYT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=telecom-paris.fr
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1s4OeD-0000In-8n; Tue, 07 May 2024 13:30:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ivarhol-21@enst.fr>)
 id 1s4Oe4-0000H8-VU; Tue, 07 May 2024 13:30:29 -0400
Received: from zproxy4.enst.fr ([137.194.2.223])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ivarhol-21@enst.fr>)
 id 1s4Oe2-0007xd-S5; Tue, 07 May 2024 13:30:28 -0400
Received: from localhost (localhost [IPv6:::1])
 by zproxy4.enst.fr (Postfix) with ESMTP id C523F20733;
 Tue,  7 May 2024 19:30:23 +0200 (CEST)
Received: from zproxy4.enst.fr ([IPv6:::1])
 by localhost (zproxy4.enst.fr [IPv6:::1]) (amavis, port 10032) with ESMTP
 id 5oa0K2VQqN22; Tue,  7 May 2024 19:30:22 +0200 (CEST)
Received: from localhost (localhost [IPv6:::1])
 by zproxy4.enst.fr (Postfix) with ESMTP id 5967D20752;
 Tue,  7 May 2024 19:30:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.10.3 zproxy4.enst.fr 5967D20752
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=telecom-paris.fr;
 s=A35C7578-1106-11E5-A17F-C303FDDA8F2E; t=1715103022;
 bh=VBspK0ispGSoTOtP1gqM8CgfnYM0RKjv6t3GKcSvJmw=;
 h=Date:From:To:Message-ID:MIME-Version;
 b=dmjY2hYThChjOHAj5hR6GSg4as5925pZAfAf/VOjf+wxA/CSyK2r7MCWDbA+8W3ai
 alTfmMvWGb+ugaKkg2N+C4acRAfks8eun0Niv38cOZr+3NtJKUo0h5eWV6VGOnXSoF
 3gl3R5MtKUy4CcgazbopcTATLCe1gYDm0r3Om9MQ=
X-Virus-Scanned: amavis at enst.fr
Received: from zproxy4.enst.fr ([IPv6:::1])
 by localhost (zproxy4.enst.fr [IPv6:::1]) (amavis, port 10026) with ESMTP
 id TbI69PgpwVVC; Tue,  7 May 2024 19:30:22 +0200 (CEST)
Received: from zmail-tp2.enst.fr (zmail-tp2.enst.fr [137.194.2.199])
 by zproxy4.enst.fr (Postfix) with ESMTP id 7C51020733;
 Tue,  7 May 2024 19:30:21 +0200 (CEST)
Date: Tue, 7 May 2024 19:30:21 +0200 (CEST)
From: =?utf-8?B?SW7DqHM=?= Varhol <ines.varhol@telecom-paris.fr>
To: peter maydell <peter.maydell@linaro.org>
Cc: qemu-devel <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>, 
 Thomas Huth <thuth@redhat.com>, 
 Arnaud Minier <arnaud.minier@telecom-paris.fr>, 
 Laurent Vivier <lvivier@redhat.com>, 
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>, 
 Alistair Francis <alistair@alistair23.me>, 
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>, 
 Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <477144958.4192868.1715103021362.JavaMail.zimbra@enst.fr>
In-Reply-To: <CAFEAcA9kOhzn+9pXOTBwRdLmMcFfPQzwwX6Nv_90RLPiUH6JAA@mail.gmail.com>
References: <20240505140556.373711-1-ines.varhol@telecom-paris.fr>
 <20240505140556.373711-2-ines.varhol@telecom-paris.fr>
 <CAFEAcA9kOhzn+9pXOTBwRdLmMcFfPQzwwX6Nv_90RLPiUH6JAA@mail.gmail.com>
Subject: Re: [PATCH 1/4] hw/misc: Create STM32L4x5 SYSCFG clock
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [2a02:1808:204:9e3b:7f83:7ccf:566e:c9d1]
X-Mailer: Zimbra 9.0.0_GA_4612 (ZimbraWebClient - FF125 (Linux)/9.0.0_GA_4612)
Thread-Topic: hw/misc: Create STM32L4x5 SYSCFG clock
Thread-Index: C73i5XvdsIRigMGHZA025iNGNhrHbw==
Received-SPF: pass client-ip=137.194.2.223; envelope-from=ivarhol-21@enst.fr;
 helo=zproxy4.enst.fr
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 4jwWIkeQgrbg



----- Le 7 Mai 24, =C3=A0 11:50, peter maydell peter.maydell@linaro.org a =
=C3=A9crit :

> On Sun, 5 May 2024 at 15:06, In=C3=A8s Varhol <ines.varhol@telecom-paris.=
fr> wrote:
>>
>> Signed-off-by: In=C3=A8s Varhol <ines.varhol@telecom-paris.fr>
>=20
> In general you should try to avoid commits with no commit message.
> Sometimes there really isn't anything to say beyond what the
> subject line is, but that should be the exception rather than
> the usual thing.

Hello,

Understood, I'll add messages.

>=20
>> ---
>>  include/hw/misc/stm32l4x5_syscfg.h |  1 +
>>  hw/arm/stm32l4x5_soc.c             |  2 ++
>>  hw/misc/stm32l4x5_syscfg.c         | 26 ++++++++++++++++++++++++++
>>  3 files changed, 29 insertions(+)
>>
>> diff --git a/include/hw/misc/stm32l4x5_syscfg.h
>> b/include/hw/misc/stm32l4x5_syscfg.h
>> index 23bb564150..c450df2b9e 100644
>> --- a/include/hw/misc/stm32l4x5_syscfg.h
>> +++ b/include/hw/misc/stm32l4x5_syscfg.h
>> @@ -48,6 +48,7 @@ struct Stm32l4x5SyscfgState {
>>      uint32_t swpr2;
>>
>>      qemu_irq gpio_out[GPIO_NUM_PINS];
>> +    Clock *clk;
>>  };
>>
>>  #endif
>> diff --git a/hw/arm/stm32l4x5_soc.c b/hw/arm/stm32l4x5_soc.c
>> index 38f7a2d5d9..fb2afa6cfe 100644
>> --- a/hw/arm/stm32l4x5_soc.c
>> +++ b/hw/arm/stm32l4x5_soc.c
>> @@ -236,6 +236,8 @@ static void stm32l4x5_soc_realize(DeviceState *dev_s=
oc,
>> Error **errp)
>>
>>      /* System configuration controller */
>>      busdev =3D SYS_BUS_DEVICE(&s->syscfg);
>> +    qdev_connect_clock_in(DEVICE(&s->syscfg), "clk",
>> +        qdev_get_clock_out(DEVICE(&(s->rcc)), "syscfg-out"));
>>      if (!sysbus_realize(busdev, errp)) {
>>          return;
>>      }
>> diff --git a/hw/misc/stm32l4x5_syscfg.c b/hw/misc/stm32l4x5_syscfg.c
>> index a5a1ce2680..a82864c33d 100644
>> --- a/hw/misc/stm32l4x5_syscfg.c
>> +++ b/hw/misc/stm32l4x5_syscfg.c
>> @@ -26,6 +26,10 @@
>>  #include "trace.h"
>>  #include "hw/irq.h"
>>  #include "migration/vmstate.h"
>> +#include "hw/clock.h"
>> +#include "hw/qdev-clock.h"
>> +#include "qapi/visitor.h"
>> +#include "qapi/error.h"
>>  #include "hw/misc/stm32l4x5_syscfg.h"
>>  #include "hw/gpio/stm32l4x5_gpio.h"
>>
>> @@ -202,6 +206,14 @@ static void stm32l4x5_syscfg_write(void *opaque, hw=
addr
>> addr,
>>      }
>>  }
>>
>> +static void clock_freq_get(Object *obj, Visitor *v,
>> +    const char *name, void *opaque, Error **errp)
>> +{
>> +    Stm32l4x5SyscfgState *s =3D STM32L4X5_SYSCFG(obj);
>> +    uint32_t clock_freq_hz =3D clock_get_hz(s->clk);
>> +    visit_type_uint32(v, name, &clock_freq_hz, errp);
>> +}
>> +
>>  static const MemoryRegionOps stm32l4x5_syscfg_ops =3D {
>>      .read =3D stm32l4x5_syscfg_read,
>>      .write =3D stm32l4x5_syscfg_write,
>> @@ -225,6 +237,18 @@ static void stm32l4x5_syscfg_init(Object *obj)
>>      qdev_init_gpio_in(DEVICE(obj), stm32l4x5_syscfg_set_irq,
>>                        GPIO_NUM_PINS * NUM_GPIOS);
>>      qdev_init_gpio_out(DEVICE(obj), s->gpio_out, GPIO_NUM_PINS);
>> +    s->clk =3D qdev_init_clock_in(DEVICE(s), "clk", NULL, s, 0);
>> +    object_property_add(obj, "clock-freq-hz", "uint32", clock_freq_get,=
 NULL,
>> +                        NULL, NULL);
>=20
> Why do we need this property? The clock on this device is an input,
> so the device doesn't control its frequency.

Using a QOM property allows to read the clock frequency from a QTest.
(npcm7xx_pwm-test.c does this, I didn't find other examples of reading a
frequency)

Best regards,

In=C3=A8s Varhol

