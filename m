Received: by 10.28.71.27 with SMTP id u27csp3812190wma;
        Tue, 6 Feb 2018 06:00:02 -0800 (PST)
X-Google-Smtp-Source: AH8x225Ynrh+6niqNtQfac8m4TRp458eL5k9u/qSe1CyUgQ/QWY92K+NLktSBdNZkr/UGFRjKauZ
X-Received: by 10.37.14.2 with SMTP id 2mr1388233ybo.311.1517925602011;
        Tue, 06 Feb 2018 06:00:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1517925602; cv=none;
        d=google.com; s=arc-20160816;
        b=qdqfkxV7euOdluUTFM1djROoMeCo1O7AyUcsXJWf5/B42huRuyN4B04zmQdVoYvKs3
         6fejihCxWn1bD3H9dbn0re/qwQBLRzLQfqcFT7wUf0dSRq5kXDRs3IgZf2LmvTIPRUHi
         ODgE9qL5A6brGacF9A9JMIDiq0ZciRegu952QS+FTfDewVPz8C036geLRxDkolSVO8H4
         v3N52q1+QPhSp7OVhhgiZZFkoR1b4VT3YdMdijOM9LbqgR7d8XOnelrl9lhGY/R8vPq5
         dATUNvO0JKzNK1oxpFlGrVNo4uLBD1WuK5P5kORk7fABdrAtYaODYEztzdbmtEMORdMl
         KJgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=MSnwRAYiXTuiNmcpR6WZjChCfOjW4a/CRBLNWv2kms4=;
        b=nxWKwsWIT/OwC1RjueYCblwyTASgnuDIYQPNkmfat3MnlJvwKicusFIcY13OzyHjxQ
         LAkO2SoFXz6dfbi/Doo/HM/MvzOCYAd69zJ3quFKyIsaZyVEdH3h5Zdf3QBUA0hOUVGX
         D6PJX+jb+3mMdvlkuIoJFrRODGVOuFfK9CvLvTXq2UPqQSZ3Rhx46KNi/QmNsWWT1s14
         bA/T4WcLkwwYq5a+C447dwbJXZovCU38Tjk6m3gGxAKWHMnY7gp7JYLqwh/H+VeSjt6a
         coRG8Ob2HYjGpJMs+IoJ+gO2qzQLjzW8YA++Y9h+uR1Law15656dCp0nZJfqdkqvPHrF
         nOrA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=U0yEbEAp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k2si1814258ywb.136.2018.02.06.06.00.01
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 06 Feb 2018 06:00:01 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=U0yEbEAp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47011 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ej3mz-00064O-B7
	for alex.bennee@linaro.org; Tue, 06 Feb 2018 09:00:01 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42131)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ej3mp-00062f-2g
	for qemu-arm@nongnu.org; Tue, 06 Feb 2018 08:59:51 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ej3mo-0007ar-Ao
	for qemu-arm@nongnu.org; Tue, 06 Feb 2018 08:59:51 -0500
Received: from mail-oi0-x244.google.com ([2607:f8b0:4003:c06::244]:35937)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1ej3mo-0007aN-4F
	for qemu-arm@nongnu.org; Tue, 06 Feb 2018 08:59:50 -0500
Received: by mail-oi0-x244.google.com with SMTP id 24so1384840oij.3
	for <qemu-arm@nongnu.org>; Tue, 06 Feb 2018 05:59:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=MSnwRAYiXTuiNmcpR6WZjChCfOjW4a/CRBLNWv2kms4=;
	b=U0yEbEApimZ33aIHLjv1JyDMciu5XBJSWKkTEMqYjqYe5DOW/K6VWxSxp4YlzUcFQn
	SpPlK5TbmZ79ep+0pLFHBQfEa5fhQCjNONF5IowrHa864YcpR5NZmH5rJAeGs2UBbVS0
	aVIG8feWLtlvpR9ZlFoKBXDMpz4rO/jEiRaKU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=MSnwRAYiXTuiNmcpR6WZjChCfOjW4a/CRBLNWv2kms4=;
	b=P09UQiBwt/9NXirxOcZEO9Sxl3M18dUVfVzGlS8ZFKQVYatMnX9R+Ob3BLrTI/yHNH
	uEpqqbKz9A9shft7T8n6x1tRUfyqBonlgSUjfZwQ8KOs7o2keiF8Rryr5g6y6ka79WeW
	htgk9TkBHFFnCJ4E/3QuEo5tXGSqCLFFIvWweXZVKmUByCNHE0FFoKPMEVme1AyRkgAl
	KDZT0QioHHkL1XnlfGfn4fweExywzmpPH+9atV9rCFx5D6gnMr5cLDIBBZNNMWoSZoCG
	53pnpkna24Cb705UJiG3Xttadpt226ycHNFB71tgLbb5wjf0lgvlTY7SRZlSYAl8TI08
	yrQA==
X-Gm-Message-State: APf1xPCUk73wl6txw6tNe+iWHLu6R1s2PTz7G5PMhFTqEhNPGl2YcGC9
	8mATsZBPMYiEjkVVTNLC1frihAkZm4LRkDergegxUQ==
X-Received: by 10.202.252.68 with SMTP id a65mr1531096oii.256.1517925589301;
	Tue, 06 Feb 2018 05:59:49 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.34.163 with HTTP; Tue, 6 Feb 2018 05:59:28 -0800 (PST)
In-Reply-To: <f10dd700-68c9-ec0a-461c-38ad757102c6@amsat.org>
References: <20180123035837.16578-1-f4bug@amsat.org>
	<20180123035837.16578-5-f4bug@amsat.org>
	<CAKmqyKMoUcPhkr8bM1DU1QeBaRbJ9kAfOp_j-vFxf1y8p=1AbA@mail.gmail.com>
	<5a373a1f-6289-a216-cd02-254402069c12@amsat.org>
	<CAFEAcA8UzFXVyWKHKdOtjtoPjKCJ-dxu_MSZD4_1i3Hoge7eKw@mail.gmail.com>
	<f10dd700-68c9-ec0a-461c-38ad757102c6@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 6 Feb 2018 13:59:28 +0000
Message-ID: <CAFEAcA8fAC-uPcuEdCyzjdaqQx8B0JVi1U8j-882zU78ch-XKw@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::244
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2 4/6] hw/sd/pl181: expose a
 SDBus and connect the SDCard to it
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
Cc: "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
	Stefan Weil <sw@weilnetz.de>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	Michael Walle <michael@walle.cc>,
	"open list:ARM PrimeCell and..." <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: j6YYBJwCIAb7

On 6 February 2018 at 13:53, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> =
wrote:
> On 02/06/2018 10:06 AM, Peter Maydell wrote:
>> How do you manage to get rid of sdbus_reparent_card()? Raspi
>> needs it for its weirdo multiplexed SD controller setup, and
>> AFAIK we don't have a way to say "this thing is hotpluggable
>> but not by the user" yet...
>
> The card is hotpluggable, the bus isn't.
>
> An unique SDBus is created in the bcm2835_peripherals object (model
> closer than hardware), sdhci/sdhost/gpio controllers use it via property
> links.
> What I don't do is checking the gpio selector (sd_fsel), hoping the
> guest isn't nasty enough to use both SD controllers at once...

We do need to honour the sd_fsel -- otherwise newer Linux rpi
kernels don't boot, because they want to use the non-default
SD controller and they select it accordingly. At the moment
this works using sdbus_reparent_card(). (I do vaguely recall
looking at whether this could be done using hotplug but I
forget why I decided it was a bad idea.)

thanks
-- PMM
