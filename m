Received: by 2002:a05:6512:1086:0:0:0:0 with SMTP id j6csp927488lfg;
        Fri, 29 Jul 2022 06:26:54 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1ux0pqktdM/IlrBmRUySj2Jxqd/wJr9mKO9VbvUAwbULqJXMeLkyVeH1RMX6b8DAK8KzHdl
X-Received: by 2002:a05:620a:2889:b0:6b6:5410:b2c7 with SMTP id j9-20020a05620a288900b006b65410b2c7mr2650574qkp.697.1659101214426;
        Fri, 29 Jul 2022 06:26:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1659101214; cv=none;
        d=google.com; s=arc-20160816;
        b=TLJloc2KxeSCr21sB6xpV5EIxVD+c9E4rtLBKkorgeLvXEFtAmMIr03mkPXNHQj5Cp
         cp4pei8yfzEQMK6VB/6EKgKLYgUPAY3lYqs2au0bF1hSim1rZeSQCq99F6N2RAgdnIHi
         dPgPmgmEWzow2IGiTCu6vz9viwvDiGXedovWjlxMNDLQ807XNUWm8BuuB3JmrNiu+sFU
         +ovUvJ/os6vqHxTlkENY7FXuDjglfeaT1Q9Cdbw10bA4tU33j/isC/O/bWcd2htLj19j
         Xrm0pP/Dzplegl+gW61YbzX4K9M9XWD/2F33xR9nzGSBIpeGukccayhkAvyW9DK0zXjD
         887Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id;
        bh=8boo1/gws5cHJh+0gcNTaHSmuL0SnwkEQ3cXutmdx2M=;
        b=03dzwdp1XcOibrQQlR85PwtmtaypOkdkXDpZD5tsVUSm2NlAtp5waCaEJ7B04cjGWC
         kAmmWttu9wm3mxNiLty3YURdzY1M4BhzIier1airDBv1NuwyRSGT1CWt2oBOQfFC4+jX
         C+i9PLc3K/WDuDvGB8p4Ph/pHTBjUb/dtlfMSui+abxxGaUL90wDktPJopMiODz0I91B
         0w2Vjhh7XHgM3AMVEE5ek6ZcmRgzpazvcdACH0dN3ofcQqr0jXZJJ5AKsQpWYo1wXfwm
         SAGE9XztCu4PSujqNmw65pUwmWjfcxYCzY++KO6fhVR32YpsRsKdtvlQ3BiRCdCtqP7D
         9Oig==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z7-20020a05622a124700b0031eb5fa4b46si743737qtx.583.2022.07.29.06.26.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 29 Jul 2022 06:26:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:56356 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oHQ0z-0004pa-Sg
	for alex.bennee@linaro.org; Fri, 29 Jul 2022 09:26:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44436)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1oHQ0M-0004l5-K9; Fri, 29 Jul 2022 09:26:14 -0400
Received: from 7.mo552.mail-out.ovh.net ([188.165.59.253]:39175)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1oHQ0J-0005t6-RS; Fri, 29 Jul 2022 09:26:14 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.4.47])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id 5975C25E32;
 Fri, 29 Jul 2022 13:26:04 +0000 (UTC)
Received: from kaod.org (37.59.142.98) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Fri, 29 Jul
 2022 15:26:02 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-98R0024d7ded83-111b-44fb-84a5-458645ecf07d,
 FAFF5065920E43DA0D2CF6C40E58A39B80E28978) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 90.89.72.120
Message-ID: <435b3e89-f9fd-c257-b03d-a12d4b59ac6b@kaod.org>
Date: Fri, 29 Jul 2022 15:25:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [RFC 0/3] Add Generic SPI GPIO model
Content-Language: en-US
To: Iris Chen <irischenlj@fb.com>
CC: <peter@pjd.dev>, <pdel@fb.com>, <qemu-devel@nongnu.org>,
 <qemu-arm@nongnu.org>, <patrick@stwcx.xyz>, <alistair@alistair23.me>,
 <kwolf@redhat.com>, <hreitz@redhat.com>, <peter.maydell@linaro.org>,
 <andrew@aj.id.au>, <joel@jms.id.au>, <thuth@redhat.com>,
 <lvivier@redhat.com>, <pbonzini@redhat.com>, <qemu-block@nongnu.org>,
 <dz4list@gmail.com>
References: <20220728232322.2921703-1-irischenlj@fb.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220728232322.2921703-1-irischenlj@fb.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.98]
X-ClientProxiedBy: DAG5EX1.mxp5.local (172.16.2.41) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: 115b2810-ab76-4d5a-a5c9-fa41435e28fa
X-Ovh-Tracer-Id: 16135271568666430279
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrvddujedgieeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucenucfjughrpefkffggfgfuvfevfhfhjggtgfhisehtjeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepleelieeigfekfeeitddvieegteeuteekffekleehuefgteetgedvkefghefggfeknecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdelkeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopeguiieglhhishhtsehgmhgrihhlrdgtohhmpdfovfetjfhoshhtpehmohehhedv
Received-SPF: pass client-ip=188.165.59.253; envelope-from=clg@kaod.org;
 helo=7.mo552.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: EyvQd650uZoO

Hello Iris,

On 7/29/22 01:23, Iris Chen wrote:
> Hey everyone,
> 
> I have been working on a project to add support for SPI-based TPMs in QEMU.
> Currently, most of our vboot platforms using a SPI-based TPM use the Linux
> SPI-GPIO driver to "bit-bang" the SPI protocol. This is because the Aspeed
> SPI controller (modeled in QEMU under hw/ssi/aspeed_smc.c) has an implementation
> deficiency that prevents bi-directional operations. 
aspeed_smc models the Aspeed FMC/SPI controllers which have a well defined
HW interface. Your model proposal adds support for a new SPI controller
using bitbang GPIOs. These are really two differents models. I don't see
how you could reuse aspeed_smc for this purpose.

or you mean that Linux is using the SPI-GPIO driver because the Linux
Aspeed SMC driver doesn't match the need ? It is true that the Linux
driver is not generic, it deals with flash devices only. But that's
another problem.

> Thus, in order to connect
> a TPM to this bus, my patch implements a QEMU SPI-GPIO driver (as the QEMU
> counterpart of the Linux SPI-GPIO driver).
> 
> As we use SPI-based TPMs on many of our BMCs for the secure-boot implementation,
> I have already tested this implementation locally with our Yosemite-v3.5 platform
> and Facebook-OpenBMC. This model was tested by connecting a generic SPI-NOR (m25p80
> for example) to the Yosemite-v3.5 SPI bus containing the TPM.
> 
> This patch is an RFC because I have several questions about design. Although the
> model is working, I understand there are many areas where the design decision
> is not deal (ie. abstracting hard coded GPIO values). Below are some details of the
> patch and specific areas where I would appreciate feedback on how to make this better:
>   
> hw/arm/aspeed.c:
> I am not sure where the best place is to instantiate the spi_gpio besides the
> aspeed_machine_init. 

The SPI GPIO device would be a platform device and not a SoC device.
Hence, it should be instantiated at the machine level, like the I2C
device are, using properties to let the model know about the GPIOs
that should be driven to implement the SPI protocol.

Ideally, the state of the GPIO controller pins and the SPI GPIO state
should be shared. I think that's what you are trying to do that with
attribute 'controller_state' in your patch ? But, the way it is done
today, is too tightly coupled (names) with the Aspeed GPIO model to
be generic.

I think we need an intermediate QOM interface, or a base class, to
implement an abstract SPI GPIO model and an Aspeed SPI GPIO model
on top which would be linked to the Aspeed GPIO model of the SoC
in use.

Or we could introduce some kind of generic GPIO controller that
we would link the SPI GPIO model with (using a property). The
Aspeed GPIO model would be of that kind and the SPI GPIO model
would be able to drive the pins using a common interface.
That's another way to do it.

> Could we add the ability to instantiate it on the command line?

It might be complex to identify the QOM object to use as the GPIO
controller from the command line since it is on the SoC and not
a platform device. In that case, an Aspeed SPI GPIO model would
be a better approach. we  would have to peek in the machine/soc to
get a link on the Aspeed GPIO model in the realize routine of the
Aspeed SPI GPIO model.

> m25p80_transfer8_ex in hw/block/m25p80.c:
> Existing SPI model assumed that the output byte is fully formed, can be passed to
> the SPI device, and the input byte can be returned, all in one operation. With
> SPI-GPIO we don't have the input byte until all 8 bits of the output have been
> shifted out, so we have to prime the MISO with bogus values (0xFF).

That's fine I think. We do something similar for dummies.

> MOSI pin in spi_gpio: the mosi pin is not included and we poll the realtime value
> of the gpio for input bits to prevent bugs with caching the mosi value. It was discovered
> during testing that when using the mosi pin as the input pin, the mosi value was not
> being updated due to a kernel and aspeed_gpio model optimization. 

ah. We need help from Andrew ! the model should have a mosi pin .

Thanks,

C.

> Thus, here we are
> reading the value directly from the gpio controller instead of waiting for the push.
> 
> I realize there are Aspeed specifics in the spi_gpio model. To make this extensible,
> is it preferred to make this into a base class and have our Aspeed SPI GPIO extend
> this or we could set up params to pass in the constructor?
> 
> Thanks for your review and any direction here would be helpful :)
> 
> Iris Chen (3):
>    hw: m25p80: add prereading ability in transfer8
>    hw: spi_gpio: add spi gpio model
>    hw: aspeed: hook up the spi gpio model
> 
>   hw/arm/Kconfig            |   1 +
>   hw/arm/aspeed.c           |   5 ++
>   hw/block/m25p80.c         |  29 ++++++-
>   hw/ssi/Kconfig            |   4 +
>   hw/ssi/meson.build        |   1 +
>   hw/ssi/spi_gpio.c         | 166 ++++++++++++++++++++++++++++++++++++++
>   hw/ssi/ssi.c              |   4 -
>   include/hw/ssi/spi_gpio.h |  38 +++++++++
>   include/hw/ssi/ssi.h      |   5 ++
>   9 files changed, 248 insertions(+), 5 deletions(-)
>   create mode 100644 hw/ssi/spi_gpio.c
>   create mode 100644 include/hw/ssi/spi_gpio.h
> 

