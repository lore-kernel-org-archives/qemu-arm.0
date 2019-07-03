Received: by 2002:a5d:6790:0:0:0:0:0 with SMTP id v16csp540354wru;
        Wed, 3 Jul 2019 02:03:49 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwBWVQqbIO5OlaqzH28vZ/AFKesCWUzwnH6CkXx6V5G94P++BBhsSm0c5h7+D+xJYX9qr+2
X-Received: by 2002:a17:906:6c7:: with SMTP id v7mr32669468ejb.19.1562144628981;
        Wed, 03 Jul 2019 02:03:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562144628; cv=none;
        d=google.com; s=arc-20160816;
        b=w0g5fEnQqzZkfGC+48W/iYs82ibm4or9NksCa2r/nzti3hNZcebL88pVcj7H4UCV0Q
         5KaomDUymfez1dinPHcFuDUYh2AkkQ+wB6Se99YROMJV1LJnOmD2vdYc3PD+r3UXLLr9
         RJybXdoxuS6y2P4CA2CTUMhNK+9OK7do6ujoVvNHUERy3u2WGIsWiXYxLSd8bTiP0CdZ
         qE7cZNqwuE0A89wPMhYGbB3BZDF18tzoTMvmxqu2tKLcC74/iF4D3Yjq1/HfT3GIhVtP
         monGU6dfzjCZlf4Ijy9FyabXMkKlDSQKcnSsa7TGYyfiGI1QATstNeN4v1Id/VpCDxvj
         Dqvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=ESxCydPkFoZtq6iyFPptIkLUnGe0PeX3QfrIKM7OpEU=;
        b=ADTCY0aSdcoXGpp0/NL6HeitpZRRh0pXicdHtOml58XUHINJLCO+cN/P9SozTL9h1W
         d7Q0FpbX4Cjrt/IyC7ZTHKtZn6KoYOxBB65L7awroVuWXvAG6lxxboXgVZnGu9r+l+5f
         LswdxAMMceYDRyHs5+Tp273mzht3eUZ/UxZl4/VND3ex8uwivF3/L+Co9Vw3NR/HWk5v
         KkLgiP/d/XBjx9wBkafJbTBe5oSDLOxCMGVnNVBFMVlZuPTh3R3HBm/SRUBrNCHdx6u7
         7jT7lWLkm3+KG/YqiBOjBmgneJV8cadN2TEAJ7QceOPylM9HK1cQ4xJe8Z8Wrsljl7D/
         56Ew==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h52si1392966edh.123.2019.07.03.02.03.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 03 Jul 2019 02:03:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:33876 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hibB6-0001Vo-2F
	for alex.bennee@linaro.org; Wed, 03 Jul 2019 05:03:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54801)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <clg@kaod.org>) id 1hib1Z-0001oI-V4
 for qemu-arm@nongnu.org; Wed, 03 Jul 2019 04:53:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <clg@kaod.org>) id 1hib1Y-000231-N6
 for qemu-arm@nongnu.org; Wed, 03 Jul 2019 04:53:57 -0400
Received: from 14.mo4.mail-out.ovh.net ([46.105.40.29]:41676)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <clg@kaod.org>) id 1hib1Y-0001Pr-Fj
 for qemu-arm@nongnu.org; Wed, 03 Jul 2019 04:53:56 -0400
Received: from player772.ha.ovh.net (unknown [10.109.160.5])
 by mo4.mail-out.ovh.net (Postfix) with ESMTP id B31B61F3A21
 for <qemu-arm@nongnu.org>; Wed,  3 Jul 2019 10:53:36 +0200 (CEST)
Received: from kaod.org (lfbn-1-2240-157.w90-76.abo.wanadoo.fr [90.76.60.157])
 (Authenticated sender: clg@kaod.org)
 by player772.ha.ovh.net (Postfix) with ESMTPSA id A610C77E3311;
 Wed,  3 Jul 2019 08:53:29 +0000 (UTC)
To: Peter Maydell <peter.maydell@linaro.org>
References: <20190618165311.27066-1-clg@kaod.org>
 <20190618165311.27066-11-clg@kaod.org>
 <CAFEAcA_4E7b6qpHEaZaQRQO3TB5BJCLCRJ7jROAr7CeQsJ5wcw@mail.gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <b88cc8cf-6cf0-6611-28a9-64372eccbeef@kaod.org>
Date: Wed, 3 Jul 2019 10:53:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_4E7b6qpHEaZaQRQO3TB5BJCLCRJ7jROAr7CeQsJ5wcw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Ovh-Tracer-Id: 7858781350846237611
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduvddrfedtgddtlecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 46.105.40.29
Subject: Re: [Qemu-arm] [PATCH v2 10/21] aspeed/timer: Provide back-pressure
 information for short periods
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
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 47ile5p9fZ6i

On 01/07/2019 14:59, Peter Maydell wrote:
> On Tue, 18 Jun 2019 at 17:54, C=C3=A9dric Le Goater <clg@kaod.org> wrot=
e:
>>
>> From: Andrew Jeffery <andrew@aj.id.au>
>>
>> First up: This is not the way the hardware behaves.
>>
>> However, it helps resolve real-world problems with short periods being
>> used under Linux. Commit 4451d3f59f2a ("clocksource/drivers/fttmr010:
>> Fix set_next_event handler") in Linux fixed the timer driver to
>> correctly schedule the next event for the Aspeed controller, and in
>> combination with 5daa8212c08e ("ARM: dts: aspeed: Describe random numb=
er
>> device") Linux will now set a timer with a period as low as 1us.
>>
>> Configuring a qemu timer with such a short period results in spending
>> time handling the interrupt in the model rather than executing guest
>> code, leading to noticeable "sticky" behaviour in the guest.
>>
>> The behaviour of Linux is correct with respect to the hardware, so we
>> need to improve our handling under emulation. The approach chosen is t=
o
>> provide back-pressure information by calculating an acceptable minimum
>> number of ticks to be set on the model. Under Linux an additional read
>> is added in the timer configuration path to detect back-pressure, whic=
h
>> will never occur on hardware. However if back-pressure is observed, th=
e
>> driver alerts the clock event subsystem, which then performs its own
>> next event dilation via a config option - d1748302f70b ("clockevents:
>> Make minimum delay adjustments configurable")
>>
>> A minimum period of 5us was experimentally determined on a Lenovo
>> T480s, which I've increased to 20us for "safety".
>>
>> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
>> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
>=20
>> --- a/hw/misc/aspeed_scu.c
>> +++ b/hw/misc/aspeed_scu.c
>> @@ -423,6 +423,12 @@ static void aspeed_scu_realize(DeviceState *dev, =
Error **errp)
>>                            TYPE_ASPEED_SCU, SCU_IO_REGION_SIZE);
>>
>>      sysbus_init_mmio(sbd, &s->iomem);
>> +
>> +    /*
>> +     * Reset on realize to ensure the APB clock value is calculated i=
n time for
>> +     * use by the timer model, which is reset before the SCU.
>> +     */
>> +    aspeed_scu_reset(dev);
>=20
> This looks wrong. QEMU should always be resetting devices
> after realize and before actually running anything.

We have something better for this patch (getting rid of the reset=20
ordering issue). Can we still send you the fix this week ?

Thanks,

C.
