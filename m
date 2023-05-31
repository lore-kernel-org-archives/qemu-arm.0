Received: by 2002:a17:906:d7a2:b0:96f:a786:ac5c with SMTP id pk2csp2655371ejb;
        Tue, 30 May 2023 23:37:07 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5PPWCq/HF5P0H/ivCyGnxJOWex1TbWY72lu6mUV5jXOGp9dOl1SYq7Y7JQvrQ7EITcty5d
X-Received: by 2002:ac8:5dd3:0:b0:3f5:34fc:f216 with SMTP id e19-20020ac85dd3000000b003f534fcf216mr5137979qtx.54.1685515027603;
        Tue, 30 May 2023 23:37:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1685515027; cv=none;
        d=google.com; s=arc-20160816;
        b=JZp6YxOS4FRygQYeV7quqadaNiEZFAVOzu7EVPA66yo5eaw5zlu47BZ/VKpxzsLs9E
         WQkLKJ1Lg7pYHfQkYTk4mQTtMRfDcc2QCBN60PAmOT10EtQ5yySQLWVOySMrCVTL7jS0
         bg4sGhtfmNeGtKieE/ZieZDW0mLVBuIeqzIiGLkEu1BPJBK8QDB4u8JuH/GOGRQAtYUo
         brMOy+InWGa3q+tdhbYKc3k7uYFCRSn+pvnAfa3wNxfnQF5iFmHFHfFNbiCL1dx1yWZx
         hAde4ujToovanHUlo/FjkN1pdy4qwndh9+Fr/5EWo8AeiWZTCL+72XW2iL0sf2EP5r3j
         4P/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id;
        bh=3GJicA8juPEVVicIE+bB0O88c65E9LvS2SKvCMYRzD8=;
        b=NqOXc+C1OKokXzSMMhWyjYFdQtQuQd8QZ2USFFruZpuFXsZFf7GJRTmj0lclf4FLR+
         dALc83ymGQqH6pkTc0jw+UvfoHwJEgofNv/OzlgTXPUw8bQFjlYRU+AwjMHqsd/ipIgb
         uExevOy9YlHzDtgO5cCAq63D/k+LZaNfw+cQ976dZZQz5vDlq4pPy+7dN8hUpZeZhHhX
         jDJzNJ3mXWr6A8wxOFD5nmeQlY2DSWQBVGhlMMe3CbTmVvYmotmJ7KPCE16IytevTG/7
         H7H3V1u5Wm2OIochxT1XX9YsVkuE9exSSd+7SENvqob6EklT5AQRpL/ai/IOJ+ENO1CR
         X8RA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h20-20020a05622a171400b003f525044da9si7226773qtk.396.2023.05.30.23.37.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 30 May 2023 23:37:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q4FS7-0006eM-Jo; Wed, 31 May 2023 02:36:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=vahk=BU=kaod.org=clg@ozlabs.org>)
 id 1q4FS5-0006Yd-Vn; Wed, 31 May 2023 02:36:57 -0400
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3]
 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=vahk=BU=kaod.org=clg@ozlabs.org>)
 id 1q4FS3-0003UP-9l; Wed, 31 May 2023 02:36:57 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4QWKL34nKYz4x46;
 Wed, 31 May 2023 16:36:43 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4QWKKy0wc8z4x42;
 Wed, 31 May 2023 16:36:37 +1000 (AEST)
Message-ID: <54d781f8-35d0-9e68-c2ec-743dd8f6a88e@kaod.org>
Date: Wed, 31 May 2023 08:36:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 05/12] hw/ssi: Introduce a ssi_get_cs() helper
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 Alistair Francis <alistair@alistair23.me>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Eduardo Habkost <eduardo@habkost.net>, Bernhard Beschow <shentey@gmail.com>,
 Markus Armbruster <armbru@redhat.com>, Thomas Huth <thuth@redhat.com>
References: <20230508075859.3326566-1-clg@kaod.org>
 <20230508075859.3326566-6-clg@kaod.org>
 <40c8647d-201e-3ceb-97ca-ec98bdc84e88@linaro.org>
 <0d11b78e-56f7-553a-3e85-0edef9b649ac@linaro.org>
 <523179dd-7842-7f03-14d6-678ed680a017@kaod.org>
 <6bfba08e-ce3e-539b-952d-697c8791fab2@linaro.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <6bfba08e-ce3e-539b-952d-697c8791fab2@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2404:9400:2221:ea00::3;
 envelope-from=SRS0=vahk=BU=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.09,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: DkL7jrKgIQsJ

On 5/31/23 08:17, Philippe Mathieu-Daudé wrote:
> +QOM tinkerers
> 
> On 31/5/23 07:59, Cédric Le Goater wrote:
>> On 5/30/23 23:15, Philippe Mathieu-Daudé wrote:
>>> On 30/5/23 22:34, Philippe Mathieu-Daudé wrote:
>>>> On 8/5/23 09:58, Cédric Le Goater wrote:
>>>>> Simple routine to retrieve a DeviceState object on a SPI bus using its
>>>>> address/cs. It will be useful for the board to wire the CS lines.
>>>>>
>>>>> Cc: Alistair Francis <alistair@alistair23.me>
>>>>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
>>>>> ---
>>>>>   include/hw/ssi/ssi.h |  2 ++
>>>>>   hw/ssi/ssi.c         | 15 +++++++++++++++
>>>>>   2 files changed, 17 insertions(+)
>>>>>
>>>>> diff --git a/include/hw/ssi/ssi.h b/include/hw/ssi/ssi.h
>>>>> index ffd3a34ba4..c7beabdb09 100644
>>>>> --- a/include/hw/ssi/ssi.h
>>>>> +++ b/include/hw/ssi/ssi.h
>>>>> @@ -112,4 +112,6 @@ SSIBus *ssi_create_bus(DeviceState *parent, const char *name);
>>>>>   uint32_t ssi_transfer(SSIBus *bus, uint32_t val);
>>>>> +DeviceState *ssi_get_cs(SSIBus *bus, int addr);
>>>
>>> Also, this helper should (preferably) return a SSIPeripheral type.
>>
>> Well, having a DeviceState is handy for the callers (today) and
>> ssi_create_peripheral() returns a DeviceState. Let's keep it that
>> way.
> 
> Yes I know it is handy :) I'm not against your patch; besides other
> APIs do that. I'm wondering about QOM design here. Having Foo device,
> should FOO API return the common qdev abstract type (DeviceState) or
> a Foo type? Either ways we keep QOM-casting around, but I still tend
> to consider FOO API returning Foo pointer provides some type check
> safety, and also provides the API user hints about what is used.
> Need more coffee.

It is used in two code paths today:

	...
         DeviceState *dev = ssi_get_cs(bmc->soc.fmc.spi, 0);
         BlockBackend *fmc0 = dev ? m25p80_get_blk(dev) : NULL;
	...
and
	...
         DeviceState *dev = ssi_get_cs(s->spi, i);
         if (dev) {
             qemu_irq cs_line = qdev_get_gpio_in_named(dev, SSI_GPIO_CS, 0);
	...


Changing the interface is not a radical change, it will add two QOM-casts.
I can give it a try in v2.

Thanks,

C.

