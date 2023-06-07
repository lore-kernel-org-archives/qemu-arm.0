Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp401484ejb;
        Wed, 7 Jun 2023 10:06:04 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4/yq3XNfKZfNYAUxX8cwuToypxJnPJ0a/yyBePltuPpFZN9AcGxTFjzutJ7npNAYouNnH8
X-Received: by 2002:a05:6214:c8c:b0:625:aa1a:b6d8 with SMTP id r12-20020a0562140c8c00b00625aa1ab6d8mr3348358qvr.58.1686157564432;
        Wed, 07 Jun 2023 10:06:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1686157564; cv=none;
        d=google.com; s=arc-20160816;
        b=td+8TdJu5ROt0KI4FLxS7pf1Rq+Cbd3YN10PdEl0qdC7ry9/XQ2fC30Eb+D+b1uOSd
         ga3aecBHHruKtUE1GHWJQU8qrwSLLrU1bJQnkHHhap7pV5koxd0QAsqLK+CslBeHwrk0
         qJURo0lpvTZdp6KgjQKwVhFgpPAEDBmArYgkHM+0XTUoOm9rUYYyGtt9E18Zwp+oM4xL
         XwC8VE8WC3hlPLcRd+eFLcRRLbHu1ZCw5YRQQ7F/shrcS0/OagtoExPn+69sKGWsvJ66
         ZeV7Z06pMVDfG2Mad/ft9f2z6HdH2LzSbSOxCPlZ0KIG//zHWnO4AE9p262XxsVsLE3w
         kqiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id;
        bh=shFW0Pndqi3EpbN8JVEvAIY0SBqDKf0axGMgdCZftl8=;
        b=TLC0mfdyOAwH35t/sUmhdx+vobusyVtExKbhc48o8uusPs6yDYjFAnZah3EUsPx8TI
         ZptVnfH6JAQYkRdSjMe/CmmAn7FLtcxCzRt6lD/zWbORIB4ccjnIGoLe4N/iN2HkLkAJ
         C4XfRBSk1O3K5bJmyyKoWsXkTE7izOPRA33AD5w04+nRWSDNiRQuAxTOcUNMmwJBmmph
         oTNqtMJGgvKX8lvxg/s4zPSHoU7OjGcVq4R9B7CXZ+XcKLl98EpwaoTNH2SFkvqBsmpT
         G2dKc60QHTAEB70hrx4wF1ee6baY+sV1Nl9k4w5dc8AJwuJgb9i/s3ThzwErO+tN0pJW
         PlDQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f11-20020a0561020c8b00b004395b5b1143si16976vst.575.2023.06.07.10.06.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 07 Jun 2023 10:06:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q6wbR-0006AC-Rq; Wed, 07 Jun 2023 13:05:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=5JAy=B3=kaod.org=clg@ozlabs.org>)
 id 1q6wbL-00068z-IJ; Wed, 07 Jun 2023 13:05:43 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=5JAy=B3=kaod.org=clg@ozlabs.org>)
 id 1q6wbI-0003YF-6i; Wed, 07 Jun 2023 13:05:39 -0400
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4QbtyK6Kv2z4x4S;
 Thu,  8 Jun 2023 03:05:29 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4QbtyH1WYtz4x4H;
 Thu,  8 Jun 2023 03:05:26 +1000 (AEST)
Message-ID: <696fd39c-cdf1-1ea7-a551-7fa013e27665@kaod.org>
Date: Wed, 7 Jun 2023 19:05:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2 06/12] aspeed/smc: Wire CS lines at reset
Content-Language: en-US
To: Joel Stanley <joel@jms.id.au>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
References: <20230607043943.1837186-1-clg@kaod.org>
 <20230607043943.1837186-7-clg@kaod.org>
 <CACPK8XfRyLqNrTtKBp+dh44-6KF14ovorU=Tz0tUuLtEj0y=DQ@mail.gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <CACPK8XfRyLqNrTtKBp+dh44-6KF14ovorU=Tz0tUuLtEj0y=DQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=SRS0=5JAy=B3=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.091, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-TUID: hBvjpv51rD0L

On 6/7/23 12:49, Joel Stanley wrote:
> On Wed, 7 Jun 2023 at 04:40, Cédric Le Goater <clg@kaod.org> wrote:
>>
>> Currently, a set of default flash devices is created at machine init
>> and drives defined on the QEMU command line are associated to the FMC
>> and SPI controllers in sequence :
>>
>>     -drive file<file>,format=raw,if=mtd
>>     -drive file<file1>,format=raw,if=mtd
>>
>> The CS lines are wired in the same creation loop. This makes a strong
>> assumption on the ordering and is not very flexible since only a
>> limited set of flash devices can be defined : 1 FMC + 1 or 2 SPI,
>> which is less than what the SoC really supports.
>>
>> A better alternative would be to define the flash devices on the
>> command line using a blockdev attached to a CS line of a SSI bus :
>>
>>      -blockdev node-name=fmc0,driver=file,filename=./flash.img
>>      -device mx66u51235f,addr=0x0,bus=ssi.0,drive=fmc0
> 
> I don't like the idea of making the command line more complicated
There are benefits to this change and patch 8 :

  - it is possible to define block backends out of order
  - it is possible to define *all* devices backends. Some machines support
    up to 8.
  - it is possible to use different flash models without adding new boards
  - as a consequence, the machine options "spi-model" and "fmc-model" can
    be deprecated. These were a clumsy interface.
  - with -nodefaults, the machine starts running by fetching instructions
    from the FMC0 device, which is what HW does.
  - and the machine option "execute-in-place" can be deprecated.

> That is not a comment on this patch though, but it would be nice if we
> could head towards decreasing the complexity.

Describing the devices on various buses comes at a cost.

Using -drive is still possible. It should be considered an optimization
loading the FMC0 contents as a ROM to speedup boot.

Thanks,

C.


> 
>> However, user created flash devices are not correctly wired to their
>> SPI controller and consequently can not be used by the machine. Fix
>> that and wire the CS lines of all available devices when the SSI bus
>> is reset.
>>
>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> 
> Reviewed-by: Joel Stanley <joel@jms.id.au>
> 
> 
>> ---
>>   hw/arm/aspeed.c     | 5 +----
>>   hw/ssi/aspeed_smc.c | 8 ++++++++
>>   2 files changed, 9 insertions(+), 4 deletions(-)
>>
>> diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
>> index 76a1e7303de1..e5a49bb0b1a7 100644
>> --- a/hw/arm/aspeed.c
>> +++ b/hw/arm/aspeed.c
>> @@ -299,17 +299,14 @@ void aspeed_board_init_flashes(AspeedSMCState *s, const char *flashtype,
>>
>>       for (i = 0; i < count; ++i) {
>>           DriveInfo *dinfo = drive_get(IF_MTD, 0, unit0 + i);
>> -        qemu_irq cs_line;
>>           DeviceState *dev;
>>
>>           dev = qdev_new(flashtype);
>>           if (dinfo) {
>>               qdev_prop_set_drive(dev, "drive", blk_by_legacy_dinfo(dinfo));
>>           }
>> +        qdev_prop_set_uint8(dev, "addr", i);
>>           qdev_realize_and_unref(dev, BUS(s->spi), &error_fatal);
>> -
>> -        cs_line = qdev_get_gpio_in_named(dev, SSI_GPIO_CS, 0);
>> -        qdev_connect_gpio_out_named(DEVICE(s), "cs", i, cs_line);
>>       }
>>   }
>>
>> diff --git a/hw/ssi/aspeed_smc.c b/hw/ssi/aspeed_smc.c
>> index 72811693224d..2a4001b774a2 100644
>> --- a/hw/ssi/aspeed_smc.c
>> +++ b/hw/ssi/aspeed_smc.c
>> @@ -692,6 +692,14 @@ static void aspeed_smc_reset(DeviceState *d)
>>           memset(s->regs, 0, sizeof s->regs);
>>       }
>>
>> +    for (i = 0; i < asc->cs_num_max; i++) {
>> +        DeviceState *dev = ssi_get_cs(s->spi, i);
>> +        if (dev) {
>> +            qemu_irq cs_line = qdev_get_gpio_in_named(dev, SSI_GPIO_CS, 0);
>> +            qdev_connect_gpio_out_named(DEVICE(s), "cs", i, cs_line);
>> +        }
>> +    }
>> +
>>       /* Unselect all peripherals */
>>       for (i = 0; i < asc->cs_num_max; ++i) {
>>           s->regs[s->r_ctrl0 + i] |= CTRL_CE_STOP_ACTIVE;
>> --
>> 2.40.1
>>

