Received: by 2002:a05:6512:1086:0:0:0:0 with SMTP id j6csp1671100lfg;
        Sat, 30 Jul 2022 14:19:31 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uzHK3nibRpiRnklHc3egzJZv8upjGpcmIQl5MYPFAB+jA5zCjpCwBEIAmted5B3Cyr64Yl
X-Received: by 2002:a05:622a:44e:b0:31f:4cf7:3abc with SMTP id o14-20020a05622a044e00b0031f4cf73abcmr8506318qtx.124.1659215971502;
        Sat, 30 Jul 2022 14:19:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1659215971; cv=none;
        d=google.com; s=arc-20160816;
        b=C9E5lgXKq47GwtQ6fR3pZCJiuPsIwxIWeg9qO6ofyMlOYuZgkhlfpRFhjpn+I2Bhqj
         vPXQ7K1XXTyJS52hn7Z0sT1hGrjgAygFFJ3uPWxdTjt24fmLYZymNVSXY62sMy+tfRcX
         ceGArI83ElgUzCQnwXnkmG9gIGbubzWt6M1+8pOn7Pl+uHIkOzi/T3R2ChiAbQ+bVVU6
         vBaAtjWpkmuDtLbuvwTqWVZkrt10flUQhY6/jUbpTKVGaov0vWqi1466nBjpGvBKuJ4g
         ZEcI4Ekl4KMUVwq2EyR0hNGBvdeBkPcd/NUdSXLxbVOQIV2QxzTjnOhafkhERDFaLtxy
         DeGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id;
        bh=T+3B0A/qvQksMPaJGK/1epEe6HjI9GwRAmKG9Z3oC+E=;
        b=IMTmnJhvQCST7StK07iaVxvReWzw/FjjEE1IKI9/1jS472+Yv5BlQJoIyRmikjMnWe
         YqNHdAlD5uZxJxE0NYzuuKd8RYuhfodqoI/OqPugOFbTs6GEwrmy3jOljzhdPRdEqcR6
         iJ2yxAqZRChhT31zzq+8XpfrJdf9Z5JbcyDPIL0lh0wo6sSjasMQIRl70+iEv0HmfEos
         VfUN8iDGocfkcTYErUVHrNs5ZESm7xeVesqEtn6eSjk2O5iaib6BPSRvF8VX6dKHQ9Ji
         9eENMJV6S6mmzvh0Ldn6FhQ+XVRrQL0ECwMtCB09+7h9LBQdqRehl2qddp+kiWkO/0KJ
         2Tag==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id dv13-20020ad44eed000000b00474247be353si4791121qvb.25.2022.07.30.14.19.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 30 Jul 2022 14:19:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:51126 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oHtru-0004dI-Tz
	for alex.bennee@linaro.org; Sat, 30 Jul 2022 17:19:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43640)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1oHtrZ-0004cB-01
 for qemu-arm@nongnu.org; Sat, 30 Jul 2022 17:19:09 -0400
Received: from 5.mo548.mail-out.ovh.net ([188.165.49.213]:57631)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1oHtrU-0001OL-QT
 for qemu-arm@nongnu.org; Sat, 30 Jul 2022 17:19:08 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.4.188])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 999C42072B;
 Sat, 30 Jul 2022 21:18:40 +0000 (UTC)
Received: from kaod.org (37.59.142.110) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Sat, 30 Jul
 2022 23:18:38 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-110S00468272437-31db-435d-8460-cd29045c3893,
 1DC0F860CB010FCE1C63BA575B84B2D58309CB31) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 90.89.72.120
Message-ID: <6d4a3912-a386-a784-8db4-7743bb1f1063@kaod.org>
Date: Sat, 30 Jul 2022 23:18:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [RFC 0/3] Add Generic SPI GPIO model
Content-Language: en-US
To: Peter Delevoryas <peter@pjd.dev>
CC: Iris Chen <irischenlj@fb.com>, <pdel@fb.com>, <qemu-devel@nongnu.org>,
 <qemu-arm@nongnu.org>, <patrick@stwcx.xyz>, <alistair@alistair23.me>,
 <kwolf@redhat.com>, <hreitz@redhat.com>, <peter.maydell@linaro.org>,
 <andrew@aj.id.au>, <joel@jms.id.au>, <thuth@redhat.com>,
 <lvivier@redhat.com>, <pbonzini@redhat.com>, <qemu-block@nongnu.org>,
 <dz4list@gmail.com>
References: <20220728232322.2921703-1-irischenlj@fb.com>
 <435b3e89-f9fd-c257-b03d-a12d4b59ac6b@kaod.org>
 <YuQZP4xkkU2R9VmO@pdel-mbp.dhcp.thefacebook.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <YuQZP4xkkU2R9VmO@pdel-mbp.dhcp.thefacebook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.110]
X-ClientProxiedBy: DAG3EX2.mxp5.local (172.16.2.22) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: f8b352f8-55d9-4b14-b3b3-89cc81239196
X-Ovh-Tracer-Id: 11542725848591600455
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrvdduledgudeivdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepkeetjedtleekjedvveffudfhteetleeifeegfeffuefghfefkeehffeufeeludejnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdduuddtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtohepugiigehlihhsthesghhmrghilhdrtghomhdpoffvtefjohhsthepmhhoheegke
Received-SPF: pass client-ip=188.165.49.213; envelope-from=clg@kaod.org;
 helo=5.mo548.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: FQiPhQx1+AKS

On 7/29/22 19:30, Peter Delevoryas wrote:
> On Fri, Jul 29, 2022 at 03:25:55PM +0200, Cédric Le Goater wrote:
>> Hello Iris,
>>
>> On 7/29/22 01:23, Iris Chen wrote:
>>> Hey everyone,
>>>
>>> I have been working on a project to add support for SPI-based TPMs in QEMU.
>>> Currently, most of our vboot platforms using a SPI-based TPM use the Linux
>>> SPI-GPIO driver to "bit-bang" the SPI protocol. This is because the Aspeed
>>> SPI controller (modeled in QEMU under hw/ssi/aspeed_smc.c) has an implementation
>>> deficiency that prevents bi-directional operations.
>> aspeed_smc models the Aspeed FMC/SPI controllers which have a well defined
>> HW interface. Your model proposal adds support for a new SPI controller
>> using bitbang GPIOs. These are really two differents models. I don't see
>> how you could reuse aspeed_smc for this purpose.
>>
>> or you mean that Linux is using the SPI-GPIO driver because the Linux
>> Aspeed SMC driver doesn't match the need ? It is true that the Linux
>> driver is not generic, it deals with flash devices only. But that's
>> another problem.
>>
>>> Thus, in order to connect
>>> a TPM to this bus, my patch implements a QEMU SPI-GPIO driver (as the QEMU
>>> counterpart of the Linux SPI-GPIO driver).
>>>
>>> As we use SPI-based TPMs on many of our BMCs for the secure-boot implementation,
>>> I have already tested this implementation locally with our Yosemite-v3.5 platform
>>> and Facebook-OpenBMC. This model was tested by connecting a generic SPI-NOR (m25p80
>>> for example) to the Yosemite-v3.5 SPI bus containing the TPM.
>>>
>>> This patch is an RFC because I have several questions about design. Although the
>>> model is working, I understand there are many areas where the design decision
>>> is not deal (ie. abstracting hard coded GPIO values). Below are some details of the
>>> patch and specific areas where I would appreciate feedback on how to make this better:
>>> hw/arm/aspeed.c:
>>> I am not sure where the best place is to instantiate the spi_gpio besides the
>>> aspeed_machine_init.
>>
>> The SPI GPIO device would be a platform device and not a SoC device.
>> Hence, it should be instantiated at the machine level, like the I2C
>> device are, using properties to let the model know about the GPIOs
>> that should be driven to implement the SPI protocol.
> 
> Agreed, should be like an I2C device.
> 
>>
>> Ideally, the state of the GPIO controller pins and the SPI GPIO state
>> should be shared. I think that's what you are trying to do that with
>> attribute 'controller_state' in your patch ? But, the way it is done
>> today, is too tightly coupled (names) with the Aspeed GPIO model to
>> be generic.
>>
>> I think we need an intermediate QOM interface, or a base class, to
>> implement an abstract SPI GPIO model and an Aspeed SPI GPIO model
>> on top which would be linked to the Aspeed GPIO model of the SoC
>> in use.
> 
> Disagree, I feel like we can accomplish this without inheritance.
> 
>>
>> Or we could introduce some kind of generic GPIO controller that
>> we would link the SPI GPIO model with (using a property). The
>> Aspeed GPIO model would be of that kind and the SPI GPIO model
>> would be able to drive the pins using a common interface.
>> That's another way to do it.
> 
> Agree, I would like to go in this direction if at all possible.
Let's give it a try then. I would introduce a new QOM interface,
something like  :

     #define TYPE_GPIO_INTERFACE "gpio-interface"
     #define GPIO_INTERFACE(obj)                                     \
         INTERFACE_CHECK(GpioInterface, (obj), TYPE_GPIO_INTERFACE)
     typedef struct GpioInterfaceClass GpioInterfaceClass;
     DECLARE_CLASS_CHECKERS(GpioInterfaceClass, GPIO_INTERFACE,
                            TYPE_GPIO_INTERFACE)
     
     struct GpioInterfaceClass {
         InterfaceClass parent;
         int (*get)(GpioInterface *gi, ...);
         int (*set)(GpioInterface *gi, ...);
         ...
     };

and implement the interface handlers under the AspeedGPIO model.
The SPI GPIO model would have a link to such an interface to drive
the GPIO pins.

See IPMI and XIVE for some more complete models.

>>> Could we add the ability to instantiate it on the command line?
>>
>> It might be complex to identify the QOM object to use as the GPIO
>> controller from the command line since it is on the SoC and not
>> a platform device. In that case, an Aspeed SPI GPIO model would
>> be a better approach. we  would have to peek in the machine/soc to
>> get a link on the Aspeed GPIO model in the realize routine of the
>> Aspeed SPI GPIO model.
> 
> Hrrrm perhaps, I feel like it shouldn't be that hard though.
> 
> - Get a pointer to the QOM object that holds the GPIO's using object
>    path or ID. Something similar to '-device ftgmac100,netdev=<id>'
>    right?

yes. something like that.

> - Get the GPIO's by name from the QOM object.

yes.

> In this situation, I think we should be able to get the GPIO controller
> object, and then get the IRQ's by the "sysbus-irq[126]"/etc name.
> 
> We could refactor the aspeed_gpio.c model to name the IRQ's like the
> properties,.  to use "gpioX4" instead of "sysbus-irq[*]".

we could use qdev_init_gpio_out_named() instead of sysbus_init_irq()
to name them.

>>> m25p80_transfer8_ex in hw/block/m25p80.c:
>>> Existing SPI model assumed that the output byte is fully formed, can be passed to
>>> the SPI device, and the input byte can be returned, all in one operation. With
>>> SPI-GPIO we don't have the input byte until all 8 bits of the output have been
>>> shifted out, so we have to prime the MISO with bogus values (0xFF).
>>
>> That's fine I think. We do something similar for dummies.
>>
>>> MOSI pin in spi_gpio: the mosi pin is not included and we poll the realtime value
>>> of the gpio for input bits to prevent bugs with caching the mosi value. It was discovered
>>> during testing that when using the mosi pin as the input pin, the mosi value was not
>>> being updated due to a kernel and aspeed_gpio model optimization.
>>
>> ah. We need help from Andrew ! the model should have a mosi pin .
> 
> Not sure if this was clear, but Iris is just saying that she used object
> properties to read and write the mosi, miso, and clk pins, rather than
> the IRQ's.

The IRQ line is not raised ?

> Certainly we'd like to use IRQ's instead, but she ran into correctness
> problems. Maybe we can investigate that further and fix it.

So much is happening in that mode. We need more trace events in the Aspeed
GPIO model at least an extra in aspeed_gpio_update()

Thanks,

C.

> 
>>
>> Thanks,
>>
>> C.
>>
>>> Thus, here we are
>>> reading the value directly from the gpio controller instead of waiting for the push.
>>>
>>> I realize there are Aspeed specifics in the spi_gpio model. To make this extensible,
>>> is it preferred to make this into a base class and have our Aspeed SPI GPIO extend
>>> this or we could set up params to pass in the constructor?
>>>
>>> Thanks for your review and any direction here would be helpful :)
>>>
>>> Iris Chen (3):
>>>     hw: m25p80: add prereading ability in transfer8
>>>     hw: spi_gpio: add spi gpio model
>>>     hw: aspeed: hook up the spi gpio model
>>>
>>>    hw/arm/Kconfig            |   1 +
>>>    hw/arm/aspeed.c           |   5 ++
>>>    hw/block/m25p80.c         |  29 ++++++-
>>>    hw/ssi/Kconfig            |   4 +
>>>    hw/ssi/meson.build        |   1 +
>>>    hw/ssi/spi_gpio.c         | 166 ++++++++++++++++++++++++++++++++++++++
>>>    hw/ssi/ssi.c              |   4 -
>>>    include/hw/ssi/spi_gpio.h |  38 +++++++++
>>>    include/hw/ssi/ssi.h      |   5 ++
>>>    9 files changed, 248 insertions(+), 5 deletions(-)
>>>    create mode 100644 hw/ssi/spi_gpio.c
>>>    create mode 100644 include/hw/ssi/spi_gpio.h
>>>
>>

