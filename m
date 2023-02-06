Received: by 2002:a17:906:dac7:b0:886:babc:7eeb with SMTP id xi7csp4606597ejb;
        Mon, 6 Feb 2023 13:55:13 -0800 (PST)
X-Google-Smtp-Source: AK7set/qASBNXb5uY1HQQWPc2OJybWPOHOdnO3KcDDp4x+ZaxdAPVpJlYt1zHYav2yniZj3FOWwD
X-Received: by 2002:ad4:5ba7:0:b0:538:861f:cff1 with SMTP id 7-20020ad45ba7000000b00538861fcff1mr691809qvq.48.1675720513712;
        Mon, 06 Feb 2023 13:55:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1675720513; cv=none;
        d=google.com; s=arc-20160816;
        b=Ec6cgQQwkZS8kBCrd8BMWWuH93iHbdBlxq55DuPR5TPOmNbqB0JbXqPoZgBrV1oQoY
         YUvAmn3bMn36Pe1Ugr6zvzOKu4OIs7tcEwd1NoBEIb+YB52S4j4QWHoJV214RmKHSMbq
         /+qU3n1vtFz385wLYiCC/a7hybfhRP/PF37l+SrExGHJ0I85SS3qjQebHOuJ5Ihvqeqo
         nUTUmtMU/OeQrn7pUdYDy0gzJE2upk1+gvEoT11ZizFCyodyTOz99+6OEzL2KzhNmaE2
         iqgl1bYL1WFp2Xczn6zUFP+9L/OdDnCRg6cyOsIkjcIz2A1MEGWb3gNEi5Kd3arkV6Fy
         xIjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=ow7po2z9ElD+3JPhAM/K8HeZBhqp6LKr7z+KmBl5HUg=;
        b=YaIRNi8zFm6yV2U1PFkvzl4DJMIlb258ejpu/4+yPTZ94/WfSBsV/p9VFXkgu4rdHm
         xvqoS8UhqKSbTpoYz6vXXxbt92h4afPBUR9S8tEBiDx4HLwfGytJEK1oYUamiAwoatkk
         RHvlB506pSiziT/AmLFVVFwM+zCF2Ho9ywnIWSWBZqFdIXJlU1i86PnKwe5VpzLYUfIb
         oRSBqtDEw8axZ1FCDIDD00mYw9uufx81UG6Ue9rsDiqX+ZcdC/lvzgqKAxVy6jA8R9Ie
         i9iNIxWc3AJD8mHEhstVCHrbEOSzHe0K7l+X8Ud20wZKFd4d5tQqnPGMjjOVQ8lRiXzx
         C11g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@ilande.co.uk header.s=20220518 header.b=BcdJS5Li;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ilande.co.uk
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u13-20020a0c8dcd000000b0056c00ac422csi1672130qvb.166.2023.02.06.13.55.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 Feb 2023 13:55:13 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@ilande.co.uk header.s=20220518 header.b=BcdJS5Li;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ilande.co.uk
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pP9Ri-0000yz-T9; Mon, 06 Feb 2023 16:54:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pP9Rf-0000xJ-Jw; Mon, 06 Feb 2023 16:54:40 -0500
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pP9Rc-0004eC-PE; Mon, 06 Feb 2023 16:54:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:MIME-Version:Date:Message-ID:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ow7po2z9ElD+3JPhAM/K8HeZBhqp6LKr7z+KmBl5HUg=; b=BcdJS5LiGPDK5tnB4baqjgYbHb
 xIO+DvdqBMK+JiUTmrCHKFVA8XJma9v0FBl7Eg5qA1m7HS8kG/olPe5OfB/X6iKMLT044dXZif8J+
 yanamyS1HJPlu0FcPhidpIFK6xvR1G6PieqT8Uq2U4hFhzJ1ljOif+MU80otXSbc1oiusgU+3308j
 hu61tcTzR2aVUClvUUlgR0mU228u4KP0h1uZObiJhnW0rq0WW7FL35a8PsbvOZ84LIOsk4xkJDAlY
 roVnId2jgO+sOafudFh6MsEZYi648eATo+D80qf+3azKjilzUUQioFiktjTYyrDY3b7lBexGlslmD
 nN2KYE6JYX37xZldm+xAGuCYSRwG+6/zPTfyvPFMpBsgNePmfoF4gvfHhPeXWlnQ3r4LePAb3fO8X
 83v8nqCZ6NslHyWaQb9TMERjSQR9S6qecIJGzoDK3mRCTkoyMOrvIlXD085PzaivqCNoCQfGOQcwr
 C8SwVBB8W5heZJLK0/fqlM+JVQZxg/bnvxI177MvuPB7FKXfEIBTSSAvcdQi5O3Lq55ISs1ZNLdqJ
 VJdvTdnI/s29WEUYS9xUb325jyCQm434Fp9s/6jdIl2Cnx0wVxN02ncnGdtnZHDrRNn5wr6oPeu4R
 ySntHGWPgjbG5JP7f51lHcs973YjLFjHVukDXREp4=;
Received: from [2a00:23c4:8baa:d400:877:cbd2:6fe8:34fc]
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pP9R4-00035a-4Q; Mon, 06 Feb 2023 21:54:02 +0000
Message-ID: <8c7cfd90-e2aa-a6ff-506d-f3a5d24622b6@ilande.co.uk>
Date: Mon, 6 Feb 2023 21:54:26 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Eduardo Habkost
 <eduardo@habkost.net>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
References: <20230203113650.78146-1-philmd@linaro.org>
 <e30899d3-06b5-645e-3f42-c99631b5a53a@ilande.co.uk>
 <46f52043-368c-e153-2d02-ba30220685dd@linaro.org>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <46f52043-368c-e153-2d02-ba30220685dd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8baa:d400:877:cbd2:6fe8:34fc
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH 0/9] hw: Use QOM alias properties and few QOM/QDev cleanups
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: PYanISTKXzD8

On 06/02/2023 15:27, Philippe Mathieu-Daudé wrote:

> On 6/2/23 00:29, Mark Cave-Ayland wrote:
>> On 03/02/2023 11:36, Philippe Mathieu-Daudé wrote:
>>
>>> These patches are extracted from a QOM/QDev refactor series,
>>> so they are preliminary cleanups noticed while working on it:
>>>
>>> - Use correct type when calling qdev_prop_set_xxx()
>>> - Unify some qdev properties in MIPS models
>>> - Replace intermediate properties by link properties
>>> - Remove DEFINE_PROP_DMAADDR() macro which is used one time
>>> - Use qdev_realize_and_unref() instead of open-coding it
>>>
>>> Philippe Mathieu-Daudé (9):
>>>    hw/i386/sgx: Do not open-code qdev_realize_and_unref()
>>>    hw/ppc/sam460ex: Correctly set MAL properties
>>>    hw/arm/nrf51: QOM-alias 'flash-size' property in SoC object
>>>    hw/arm/fsl-imx: QOM-alias 'phy-num' property in SoC object
>>>    hw/usb/hcd-ohci: Include missing 'sysbus.h' header
>>>    hw/display/sm501: QOM-alias 'dma-offset' property in chipset object
>>>    hw/qdev: Remove DEFINE_PROP_DMAADDR() and 'hw/qdev-dma.h'
>>>    hw/mips: Declare all length properties as unsigned
>>>    hw/mips/itu: Pass SAAR using QOM link property
>>>
>>>   hw/arm/fsl-imx25.c           |  3 +--
>>>   hw/arm/fsl-imx6.c            |  3 +--
>>>   hw/arm/fsl-imx6ul.c          |  8 ++++----
>>>   hw/arm/fsl-imx7.c            | 12 ++++++------
>>>   hw/arm/microbit.c            |  5 ++++-
>>>   hw/arm/nrf51_soc.c           | 10 +---------
>>>   hw/display/sm501.c           | 22 +++++++++++-----------
>>>   hw/i386/sgx.c                |  5 ++---
>>>   hw/intc/mips_gic.c           |  4 ++--
>>>   hw/mips/boston.c             |  2 +-
>>>   hw/mips/cps.c                | 35 ++++++++++++-----------------------
>>>   hw/mips/malta.c              |  2 +-
>>>   hw/misc/mips_cmgcr.c         |  2 +-
>>>   hw/misc/mips_itu.c           | 30 ++++++++++++++++++++----------
>>>   hw/nvram/nrf51_nvm.c         |  6 +++++-
>>>   hw/ppc/sam460ex.c            |  4 ++--
>>>   hw/sh4/r2d.c                 |  2 +-
>>>   hw/usb/hcd-ohci-pci.c        |  1 -
>>>   hw/usb/hcd-ohci.c            |  3 +--
>>>   hw/usb/hcd-ohci.h            |  1 +
>>>   include/hw/arm/fsl-imx25.h   |  1 -
>>>   include/hw/arm/fsl-imx6.h    |  1 -
>>>   include/hw/arm/fsl-imx6ul.h  |  2 --
>>>   include/hw/arm/fsl-imx7.h    |  1 -
>>>   include/hw/arm/nrf51_soc.h   |  1 -
>>>   include/hw/intc/mips_gic.h   |  4 ++--
>>>   include/hw/misc/mips_cmgcr.h |  2 +-
>>>   include/hw/misc/mips_itu.h   |  9 ++++-----
>>>   include/hw/qdev-dma.h        | 16 ----------------
>>>   29 files changed, 84 insertions(+), 113 deletions(-)
>>>   delete mode 100644 include/hw/qdev-dma.h
>>
>> I must admit to being slightly nervous about using QOM alias properties in this 
>> way, simply because you start creating implicit dependencies between QOM objects. 
>> How would this work when trying to build machines from configuration files and/or 
>> the monitor? Or are the changes restricted to container devices i.e. those which 
>> consist of in-built child devices?
> 
> The latter. All parents forward a property to a contained child.
> 
> The parent forwarding property is replaced by a link into the child,
> so accessing the parent property transparently access the child one.
> 
> The dependencies are already explicit. We can not create a parent
> without its children (the children creation is implicit when we
> create the parent object).
> 
> I thought this was the canonical QOM alias properties use. What is
> the normal use then?

The problem I've found with this approach in the past is that it fails when you have 
more than one child device of the same type.

For example imagine the scenario where there is a QEMU device that contains 2 child 
UARTs and each UART has a property to disable hardware handshaking: if you add a 
property alias to the container device, it can only map to a single child UART. 
Furthermore if you then try to alias the UART IRQs onto the container device using 
qdev_pass_gpios(), then that also fails with 2 UARTs because the gpios from each UART 
have the same property name.

You could then think about solving that problem by using object_property_add_alias() 
directly to specify a different property name for each UART's mapped property on the 
container device, but then you end up accessing the child UART properties with 
different names, but only when using that particular parent container device(!).

For this reason I've tended to avoid aliases and setup child objects from the 
container like this:

    static void container_init(Object *obj)
    {
        object_initialize_child(obj, "uart0", &s->uart0, TYPE_UART);
        object_initialize_child(obj, "uart1", &s->uart1, TYPE_UART);
    }

And then when configuring the board it is possible to obtain the UART references like 
this:

    uart0 = UART(object_resolve_path_component(OBJECT(container), "uart0"));
    irq0 = qdev_connect_gpio_out(DEVICE(uart0), 0, ... );

    uart1 = UART(object_resolve_path_component(OBJECT(container), "uart1"));
    irq1 = qdev_connect_gpio_out(DEVICE(uart1), 0, ... );

This allows all UART configuration to be done in the same way regardless of the 
parent container device and number of child devices, and without having to think 
about using different property names depending upon the container device.

One place where it could conceivably be useful is where you have a chip modelled as a 
device and you want to expose the memory regions and IRQs to an interface such as 
ISA, but often even that doesn't work (think PCI IRQs for example).

The only valid use cases I can think of are the /rtc property (which is an alias to 
the RTC device, regardless of where it exists in the QOM tree) and perhaps in future 
adding similar array aliases to the root of the machine that can point to things like 
block devices, network devices, chardevs and audio devices (i.e. anything that has a 
corresponding QEMU backend).


ATB,

Mark.
