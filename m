Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp1120059wrd;
        Sat, 18 Aug 2018 03:09:46 -0700 (PDT)
X-Google-Smtp-Source: AA+uWPzO2hj1aKQvPNhyAZ1yJrZIbvVQAtS2Az5Tjaqkr7MDuhNQQGhzpQw2nhozTwE9LdlYIgSW
X-Received: by 2002:a37:8287:: with SMTP id e129-v6mr35113031qkd.214.1534586986685;
        Sat, 18 Aug 2018 03:09:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1534586986; cv=none;
        d=google.com; s=arc-20160816;
        b=B3GeYO0BW+5UyXIlET4ZWqDDJrNLv+5/LDYCCLRDlnCBmWGlGWJieFBBwNSwRAJHjj
         AOS+BMnFLFT4czXRhlY4ggm4kmoHLylslhaZD1W2eHyRquudTI0o8dfTGSr+3XK6xlKa
         2DOsE9DbblImXgh8z3kvNWKRLmuWAn5k4BJuTScexxP7Jce48mSyCJQC9vqG6S7k/cBg
         ySYKliMuJwm+kBpJXyKzRlmbOMHlPVrOwZhZkUQx8dJp6w7SmVesBDvPOhFA4TvfywtA
         050Giq6aR65bg51Kvzq138bwefDATs+DPYZnjpzDmu592YmJSyrH4mFP/ok+Lvp1pySm
         FBHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=ofnglB6jafC3ZF7F+6zFdjuRtQZOGwCwfuwFkJmZ/pg=;
        b=I2AdWXKbOnTEnYosF1RRzU+rdT5ZynzFEecGtP9b7pSS5XFTVLLApfE042S4HHZNUg
         oeD2944+q+N1BWfWcsLjIWr7bxdvkHdXzxJ+rtk6DjM4p4PsK57+uBchPUDvuW61kM3K
         ifBetINxpYEflul2l2shFxrS8lO7pkM6nY3iB9rSOKZS7t7isaMSJhx7gwjw9RXjuzH8
         Jw/56BcDd1RS7g/qxQ+JDpiZeUl64VCr7O/dBD8FYJggzGy2t0Y3f1jZhYF5nnAXmpeB
         ZsnIpyICH3kKbUy8gs4hvb1lxMYWLlB7dJNeitlNqTX1CGYAKx2cTltSKUjruTkOhQoT
         YGXA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="g7mAL/xB";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j128-v6si4055122qke.154.2018.08.18.03.09.46
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 18 Aug 2018 03:09:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="g7mAL/xB";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38255 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fqyB0-0007tr-1t
	for alex.bennee@linaro.org; Sat, 18 Aug 2018 06:09:46 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40892)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fqyAi-0007V2-KE
	for qemu-arm@nongnu.org; Sat, 18 Aug 2018 06:09:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fqxxo-00064P-TF
	for qemu-arm@nongnu.org; Sat, 18 Aug 2018 05:56:10 -0400
Received: from mail-oi0-x243.google.com ([2607:f8b0:4003:c06::243]:40473)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fqxxm-000639-Vn
	for qemu-arm@nongnu.org; Sat, 18 Aug 2018 05:56:07 -0400
Received: by mail-oi0-x243.google.com with SMTP id w126-v6so18141097oie.7
	for <qemu-arm@nongnu.org>; Sat, 18 Aug 2018 02:56:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=ofnglB6jafC3ZF7F+6zFdjuRtQZOGwCwfuwFkJmZ/pg=;
	b=g7mAL/xBKD0tpmwBYhpWO1OmVXsQQqZ4mOakFWMsiWgzsd12vyNgi4LsutyXnObibR
	XUYRKKCGOQFGpr/v3YEBKdRJCt8FpQzjonW7Pi+C90LwA40EDjSW+VFbWLeIM2IfOiph
	6Q7sGZ/N8DpKh+7uBBc+KL1hZXyBJdpQI5Ork=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=ofnglB6jafC3ZF7F+6zFdjuRtQZOGwCwfuwFkJmZ/pg=;
	b=laIekmBCS0NP1oDcE1dbjcaLb6s4dodH5LMu2+hIDpJJUADULijivw1jPc981iJeAl
	S+swSVkjzIt+M4HNVhw0yJE3Da28vcEKQJ31nu0ToDuRd7Ke3FoJCBnGRkBezZg4B9cF
	dS52jkF1fq6wsodfABRiia39RxbkegTbAryOTUn+F+fQGHKJ6V96pn8iXoYNxduI04k6
	UkI4PtxGBtmIlev9sLzvsObw2ahKtKN4L8Q1p+hk/iKervV6hC2LN+BEHhdAZQ/n4kWt
	rFa4Kt3DKPyaFyy/7DClrd+0o3bncl8nqI325MEUBS+WljC04pRggOWig2zAWN/uB7xO
	mskw==
X-Gm-Message-State: AOUpUlF9W87+7sgYk8IOosFuR9dFe4dy+cCUopnSJ7ZF61kfbEOaAa5L
	ERarjXzQx4ITh5Zoseyczeso/D45LPE9ke1whMWFUQ==
X-Received: by 2002:aca:4204:: with SMTP id
	p4-v6mr5712391oia.242.1534586165620; 
	Sat, 18 Aug 2018 02:56:05 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:5c8a:0:0:0:0:0 with HTTP; Sat, 18 Aug 2018 02:55:45
	-0700 (PDT)
In-Reply-To: <39365f2c-e947-3530-ee8f-9062bbb1264f@amsat.org>
References: <20180809130115.28951-1-peter.maydell@linaro.org>
	<20180809130115.28951-7-peter.maydell@linaro.org>
	<39365f2c-e947-3530-ee8f-9062bbb1264f@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 18 Aug 2018 10:55:45 +0100
Message-ID: <CAFEAcA_ZOjNHVkqk1ww5VOLq7EhPJjAEjfHHdk2kjBGdy-MqdQ@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::243
Subject: Re: [Qemu-arm] [PATCH 06/16] hw/misc/iotkit: Wire up the system
 control element
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
X-TUID: d0V/fk2WrgQZ

On 18 August 2018 at 01:00, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> w=
rote:
> Hi Peter,
>
> On 08/09/2018 10:01 AM, Peter Maydell wrote:
>> Wire up the system control element's register banks.
>>
>> This is the last of the previously completely unimplemented
>> components in the IoTKit.
>>
>> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>> ---
>>  include/hw/arm/iotkit.h |  4 +++-
>>  hw/arm/iotkit.c         | 19 +++++++++++--------
>>  2 files changed, 14 insertions(+), 9 deletions(-)
>>
>> diff --git a/include/hw/arm/iotkit.h b/include/hw/arm/iotkit.h
>> index 0f5c5101708..1ffa31d521b 100644
>> --- a/include/hw/arm/iotkit.h
>> +++ b/include/hw/arm/iotkit.h
>> @@ -58,7 +58,7 @@
>>  #include "hw/timer/cmsdk-apb-timer.h"
>>  #include "hw/timer/cmsdk-apb-dualtimer.h"
>>  #include "hw/watchdog/cmsdk-apb-watchdog.h"
>> -#include "hw/misc/unimp.h"
>> +#include "hw/misc/iotkit-sysctl.h"
>>  #include "hw/or-irq.h"
>>  #include "hw/core/split-irq.h"
>>
>> @@ -97,6 +97,8 @@ typedef struct IoTKit {
>>      CMSDKAPBWatchdog nswatchdog;
>>      CMSDKAPBWatchdog swatchdog;
>>
>> +    IoTKitSysCtl sysctl;
>> +
>>      MemoryRegion container;
>>      MemoryRegion alias1;
>>      MemoryRegion alias2;
>> diff --git a/hw/arm/iotkit.c b/hw/arm/iotkit.c
>> index cb0ec456f39..5d59ed5489f 100644
>> --- a/hw/arm/iotkit.c
>> +++ b/hw/arm/iotkit.c
>> @@ -16,7 +16,6 @@
>>  #include "hw/sysbus.h"
>>  #include "hw/registerfields.h"
>>  #include "hw/arm/iotkit.h"
>> -#include "hw/misc/unimp.h"
>>  #include "hw/arm/arm.h"
>>
>>  /* Clock frequency in HZ of the 32KHz "slow clock" */
>> @@ -151,6 +150,8 @@ static void iotkit_init(Object *obj)
>>                            sizeof(s->nswatchdog), TYPE_CMSDK_APB_WATCHDO=
G);
>>      sysbus_init_child_obj(obj, "swatchdog", &s->swatchdog,
>>                            sizeof(s->swatchdog), TYPE_CMSDK_APB_WATCHDOG=
);
>> +    sysbus_init_child_obj(obj, "iotkit-sysctl", &s->sysctl, sizeof(s->s=
ysctl),
>> +                          TYPE_IOTKIT_SYSCTL);
>>      object_initialize_child(obj, "nmi-orgate", &s->nmi_orgate,
>>                              sizeof(s->nmi_orgate), TYPE_OR_IRQ,
>>                              &error_abort, NULL);
>> @@ -516,13 +517,15 @@ static void iotkit_realize(DeviceState *dev, Error=
 **errp)
>>                            qdev_get_gpio_in_named(dev_apb_ppc1,
>>                                                   "cfg_sec_resp", 0));
>>
>> -    /* Using create_unimplemented_device() maps the stub into the
>> -     * system address space rather than into our container, but the
>> -     * overall effect to the guest is the same.
>> -     */
>> -    create_unimplemented_device("SYSINFO", 0x40020000, 0x1000);
>> -
>> -    create_unimplemented_device("SYSCONTROL", 0x50021000, 0x1000);
>> +    object_property_set_bool(OBJECT(&s->sysctl), true, "realized", &err=
);
>> +    if (err) {
>> +        error_propagate(errp, err);
>> +        return;
>> +    }
>> +    /* System information registers */
>> +    sysbus_mmio_map(SYS_BUS_DEVICE(&s->sysctl), 0, 0x40020000);
>
> What about the Secure access?
>
>        sysbus_mmio_map(SYS_BUS_DEVICE(&s->sysctl), 0, 0x50020000);

That should be handled by the general alias set up earlier
    make_alias(s, &s->alias3, "alias 3", 0x50000000, 0x10000000, 0x40000000=
);
which maps all of the 0x5... space to 0x4... if there's nothing
higher priority mapped there.


thanks
-- PMM
