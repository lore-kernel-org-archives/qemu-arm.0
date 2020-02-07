Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp836398lfp;
        Fri, 7 Feb 2020 09:38:44 -0800 (PST)
X-Google-Smtp-Source: APXvYqz0NOZvv1L4YgICsTXyKwTGsdJqkEcGORjACRZgDAjA3294RXIJbpnq/6PhTzDsiTFxc7hh
X-Received: by 2002:a05:620a:226:: with SMTP id u6mr8032155qkm.484.1581097124448;
        Fri, 07 Feb 2020 09:38:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581097124; cv=none;
        d=google.com; s=arc-20160816;
        b=cgyeKNbiWcrqJ54l68MsPcDVGkJtpTcjXi9b9mOofCgW1L5SbOin+ISPTjaaQ4Enpe
         G/B7WlhpI9RvABUGrwt7CoYoRABcyXJ8pAtM91gBqsXybjWt/DOAn49tEgwB4h3UCf4S
         4WvSEJOaP6+eXP1F3BJpPxXMHYboHw30hSvvfst7A0doa5qVj8O/gpTqqQqMP756s5Y9
         5T9L2abl7SBr4aIsZH7ONQkEsoncm2frYaF2+vZ3SCSi8R6sdc+YzUNOgLCsB+pkLae8
         /Jj8f6ZdGC5zpDqEAzYHdD1bL+7DJLM0VNPJgGp7cQcV9kL9Ki7rW7xYPdSR6ToRrtnH
         iubA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=fGozaL5Ws+qig5Bqcmx+fSctCJLvNrlPSpH4XuZQqtQ=;
        b=zf88rDI+ypA/IuByh3cD2UI6IwUBcqHExMOOqEjb335oMf8Fb/W4T3mBta+NIeHjSE
         wyStENLTBmj6y4tLdRpRI79/iot3n/ZoIXw1JhX5//rxdJxTcWFr7gbEtIWzmeILkMH8
         7EoqXvgjWBCewoHZovqdi5EBIHDFWdvVjEqNdJXxuGgFnG+PJil5G0OO450Fe6TEESly
         7iBrJmwWEd5ETT42vdNbTNIZe3liyUv5vln0V98Ygf5QseNdFqfIjjcMUWKAHd5yS38/
         MNRtrO8jTqwWUmEBczTClivPvp8YuEIVKXOrU4OAQTyOHj/fyvX/hHPihDBs5yIq91Gg
         jg2A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i12si17824qvw.61.2020.02.07.09.38.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 07 Feb 2020 09:38:44 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:33262 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j07aV-000160-TK
	for alex.bennee@linaro.org; Fri, 07 Feb 2020 12:38:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43153)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <clg@kaod.org>) id 1j07aO-00015W-1a
 for qemu-arm@nongnu.org; Fri, 07 Feb 2020 12:38:37 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <clg@kaod.org>) id 1j07aM-0006Kc-Tm
 for qemu-arm@nongnu.org; Fri, 07 Feb 2020 12:38:35 -0500
Received: from 10.mo179.mail-out.ovh.net ([46.105.79.46]:42216)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <clg@kaod.org>) id 1j07aM-0006DI-NS
 for qemu-arm@nongnu.org; Fri, 07 Feb 2020 12:38:34 -0500
Received: from player779.ha.ovh.net (unknown [10.110.208.43])
 by mo179.mail-out.ovh.net (Postfix) with ESMTP id A63DA1594E0
 for <qemu-arm@nongnu.org>; Fri,  7 Feb 2020 18:38:32 +0100 (CET)
Received: from kaod.org (82-64-250-170.subs.proxad.net [82.64.250.170])
 (Authenticated sender: clg@kaod.org)
 by player779.ha.ovh.net (Postfix) with ESMTPSA id A648FF1A8494;
 Fri,  7 Feb 2020 17:38:24 +0000 (UTC)
Subject: Re: [PATCH] hw/arm: ast2600: Wire up EHCI controllers
To: Guenter Roeck <linux@roeck-us.net>
References: <20200207144954.13634-1-linux@roeck-us.net>
 <c0bcd37a-0745-69ec-471f-be54c8e5a54e@kaod.org>
 <20200207170726.GA24635@roeck-us.net>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <6e266552-f6e2-e335-1e78-3b037041f9b4@kaod.org>
Date: Fri, 7 Feb 2020 18:38:24 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200207170726.GA24635@roeck-us.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Ovh-Tracer-Id: 11571999244111874880
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedugedrheehgddutdefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepuffvfhfhkffffgggjggtgfesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucfkpheptddrtddrtddrtddpkedvrdeigedrvdehtddrudejtdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehplhgrhigvrhejjeelrdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepqhgvmhhuqdgrrhhmsehnohhnghhnuhdrohhrgh
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 46.105.79.46
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org, Joel Stanley <joel@jms.id.au>, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: WwjDbwolCH0j

On 2/7/20 6:07 PM, Guenter Roeck wrote:
> On Fri, Feb 07, 2020 at 04:47:09PM +0100, C=C3=A9dric Le Goater wrote:
>> On 2/7/20 3:49 PM, Guenter Roeck wrote:
>>> Initialize EHCI controllers on AST2600 using the existing
>>> TYPE_PLATFORM_EHCI. After this change, booting ast2600-evb
>>> into Linux successfully instantiates a USB interface after
>>> the necessary changes are made to its devicetree files.
>>>
>>> ehci_hcd: USB 2.0 'Enhanced' Host Controller (EHCI) Driver
>>> ehci-platform: EHCI generic platform driver
>>> ehci-platform 1e6a3000.usb: EHCI Host Controller
>>> ehci-platform 1e6a3000.usb: new USB bus registered, assigned bus numb=
er 1
>>> ehci-platform 1e6a3000.usb: irq 25, io mem 0x1e6a3000
>>> ehci-platform 1e6a3000.usb: USB 2.0 started, EHCI 1.00
>>> usb usb1: Manufacturer: Linux 5.5.0-09825-ga0802f2d0ef5-dirty ehci_hc=
d
>>> usb 1-1: new high-speed USB device number 2 using ehci-platform
>>>
>>> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
>>> ---
>>>  hw/arm/aspeed_ast2600.c | 23 +++++++++++++++++++++++
>>>  1 file changed, 23 insertions(+)
>>>
>>> diff --git a/hw/arm/aspeed_ast2600.c b/hw/arm/aspeed_ast2600.c
>>> index 931887ac68..a528251c8d 100644
>>> --- a/hw/arm/aspeed_ast2600.c
>>> +++ b/hw/arm/aspeed_ast2600.c
>>> @@ -31,6 +31,8 @@ static const hwaddr aspeed_soc_ast2600_memmap[] =3D=
 {
>>>      [ASPEED_FMC]       =3D 0x1E620000,
>>>      [ASPEED_SPI1]      =3D 0x1E630000,
>>>      [ASPEED_SPI2]      =3D 0x1E641000,
>>> +    [ASPEED_EHCI1]     =3D 0x1E6A1000,
>>> +    [ASPEED_EHCI2]     =3D 0x1E6A3000,
>>>      [ASPEED_MII1]      =3D 0x1E650000,
>>>      [ASPEED_MII2]      =3D 0x1E650008,
>>>      [ASPEED_MII3]      =3D 0x1E650010,
>>> @@ -77,6 +79,8 @@ static const int aspeed_soc_ast2600_irqmap[] =3D {
>>>      [ASPEED_ADC]       =3D 78,
>>>      [ASPEED_XDMA]      =3D 6,
>>>      [ASPEED_SDHCI]     =3D 43,
>>> +    [ASPEED_EHCI1]     =3D 5,
>>> +    [ASPEED_EHCI2]     =3D 9,
>>
>> There is a conflict here with commit a29e3e127077 ("hw/arm: ast2600: W=
ire=20
>> up the eMMC controller") which is mainline already=20
>>
> Ah, sorry, I had tested this on top of v4.2. Fortunately it is only
> a context conflict. Should I resend ?

yes. keep my S-o-b.

There are a few aspeed changes in 5.0 and some more on the list but all=20
patches apply cleanly. It will Peter's life easier. =20

Thanks,

C.=20

=20
