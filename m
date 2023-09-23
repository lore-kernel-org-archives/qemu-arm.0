Received: by 2002:a17:906:b80d:b0:9ae:5796:d6c1 with SMTP id dv13csp90195ejb;
        Sat, 23 Sep 2023 00:11:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGvgW0ezzR2yRS5R70JwNHf36/8Meu6eBP0ZogrIqVpPDkU0eXsN7cFHZ27Jvdz3biK5w+N
X-Received: by 2002:a05:620a:4108:b0:767:c30:517 with SMTP id j8-20020a05620a410800b007670c300517mr5979964qko.3.1695453093496;
        Sat, 23 Sep 2023 00:11:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1695453093; cv=none;
        d=google.com; s=arc-20160816;
        b=A9e/63y1mU+uxHvgenFa0du3IHaGtZMFd65Mrvyvl8WBn71kK7icjJjEoMHVyCcu5H
         qJZAPD8EZSYuNCDaiIL3D9iQEAvVq0+WF81O4uhAva5mEOv5QuFpLbQQnM2/1X3u7GJm
         0R8x/aHh0+j+JOXMWiEIhmRlaDM0po/py/fMcUrj1D63BgWREM8DTv7bpRBH6M1U0qIy
         O1KcLos/b0a72hzkZ6G12tiF/gV2aoQAtxxkp6DwXEooNYNt7mY+cXXUr9E1ByR8vCkd
         EZhO44V06jY43L/H1A0Ii94ggpkknLFKUpelHnc9TIeR3l/rCOTdp+jSXvaRrrcfX3Bl
         F8EQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id;
        bh=ilI0xkuGQXBq+HfZ0wsHuLv0liTqJjf938j374jBpmA=;
        fh=lGdCMcz0xX7/D+lONksTBD3nS07ZC94j74SlJpXj4+Q=;
        b=ArXYU0dal/EmKKGLKb6sBdZFedPoi6KRsGMcQoHbNN3gAsjAMgcSRd5fWZMRvubbPY
         q6m92Jx4BumgtlBGNFE/JNoIzQG0yhL71ComIk1Y+OLVt6ATU2LGEV9nP+z+q7FAk7ad
         O7LkCqANczYl2fgvJGy/OGhv0D5Te55BoHOv3hFutQeF224Ogz1nStOYxs2zV9DV3LIb
         n+0ANeVEWGn7rJFiFVC7gzpHemsaBYLbUyk5/b130cwPvqK3qpWyArRnkCWsLcndOpve
         cmIgk2SXjFnm3NFoOJK6r7QWAKZ9yf1JcmEgfHcwNqP3AYp1tH+vE/1EdMBLSjT3S6yR
         TgbA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s9-20020a05620a29c900b0076f009e04f3si3616013qkp.407.2023.09.23.00.11.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 23 Sep 2023 00:11:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qjwnM-0001SV-40; Sat, 23 Sep 2023 03:11:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=33G5=FH=kaod.org=clg@ozlabs.org>)
 id 1qjwnK-0001SI-Qh; Sat, 23 Sep 2023 03:11:14 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=33G5=FH=kaod.org=clg@ozlabs.org>)
 id 1qjwnI-00072F-DG; Sat, 23 Sep 2023 03:11:14 -0400
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4Rt0fW5Hf9z4xPh;
 Sat, 23 Sep 2023 17:10:59 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4Rt0fT5wfmz4xPf;
 Sat, 23 Sep 2023 17:10:57 +1000 (AEST)
Message-ID: <ba96ed2a-b954-c8e4-f2dc-340bfe8d72cf@kaod.org>
Date: Sat, 23 Sep 2023 09:10:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 2/4] aspeed: Clean up local variable shadowing
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, Joel Stanley
 <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>
References: <20230922155924.1172019-1-clg@kaod.org>
 <20230922155924.1172019-3-clg@kaod.org> <87pm29mm7w.fsf@pond.sub.org>
Content-Language: en-US
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <87pm29mm7w.fsf@pond.sub.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=SRS0=33G5=FH=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-1.473, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: yvH7JdaxsoGe

On 9/23/23 08:34, Markus Armbruster wrote:
> Cédric Le Goater <clg@kaod.org> writes:
> 
>> Remove superfluous local 'irq' variables and use the one define at the
>> top of the routine. This fixes warnings in aspeed_soc_ast2600_realize()
>> such as :
>>
>>    ../hw/arm/aspeed_ast2600.c: In function ‘aspeed_soc_ast2600_realize’:
>>    ../hw/arm/aspeed_ast2600.c:420:18: warning: declaration of ‘irq’ shadows a previous local [-Wshadow=compatible-local]
>>      420 |         qemu_irq irq = aspeed_soc_get_irq(s, ASPEED_DEV_TIMER1 + i);
>>          |                  ^~~
>>    ../hw/arm/aspeed_ast2600.c:312:14: note: shadowed declaration is here
>>      312 |     qemu_irq irq;
>>          |              ^~~
>>
>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
>> ---
>>   hw/arm/aspeed_ast2600.c | 10 +++++-----
>>   1 file changed, 5 insertions(+), 5 deletions(-)
>>
>> diff --git a/hw/arm/aspeed_ast2600.c b/hw/arm/aspeed_ast2600.c
>> index a8b3a8065a11..e122e1c32d42 100644
>> --- a/hw/arm/aspeed_ast2600.c
>> +++ b/hw/arm/aspeed_ast2600.c
>> @@ -388,7 +388,7 @@ static void aspeed_soc_ast2600_realize(DeviceState *dev, Error **errp)
>>       aspeed_mmio_map(s, SYS_BUS_DEVICE(&s->timerctrl), 0,
>>                       sc->memmap[ASPEED_DEV_TIMER1]);
>>       for (i = 0; i < ASPEED_TIMER_NR_TIMERS; i++) {
>> -        qemu_irq irq = aspeed_soc_get_irq(s, ASPEED_DEV_TIMER1 + i);
>> +        irq = aspeed_soc_get_irq(s, ASPEED_DEV_TIMER1 + i);
>>           sysbus_connect_irq(SYS_BUS_DEVICE(&s->timerctrl), i, irq);
>>       }
>>   
>> @@ -413,8 +413,8 @@ static void aspeed_soc_ast2600_realize(DeviceState *dev, Error **errp)
>>       }
>>       aspeed_mmio_map(s, SYS_BUS_DEVICE(&s->i2c), 0, sc->memmap[ASPEED_DEV_I2C]);
>>       for (i = 0; i < ASPEED_I2C_GET_CLASS(&s->i2c)->num_busses; i++) {
>> -        qemu_irq irq = qdev_get_gpio_in(DEVICE(&s->a7mpcore),
>> -                                        sc->irqmap[ASPEED_DEV_I2C] + i);
>> +        irq = qdev_get_gpio_in(DEVICE(&s->a7mpcore),
>> +                               sc->irqmap[ASPEED_DEV_I2C] + i);
>>           /* The AST2600 I2C controller has one IRQ per bus. */
>>           sysbus_connect_irq(SYS_BUS_DEVICE(&s->i2c.busses[i]), 0, irq);
>>       }
>> @@ -611,8 +611,8 @@ static void aspeed_soc_ast2600_realize(DeviceState *dev, Error **errp)
>>       }
>>       aspeed_mmio_map(s, SYS_BUS_DEVICE(&s->i3c), 0, sc->memmap[ASPEED_DEV_I3C]);
>>       for (i = 0; i < ASPEED_I3C_NR_DEVICES; i++) {
>> -        qemu_irq irq = qdev_get_gpio_in(DEVICE(&s->a7mpcore),
>> -                                        sc->irqmap[ASPEED_DEV_I3C] + i);
>> +        irq = qdev_get_gpio_in(DEVICE(&s->a7mpcore),
>> +                               sc->irqmap[ASPEED_DEV_I3C] + i);
>>           /* The AST2600 I3C controller has one IRQ per bus. */
>>           sysbus_connect_irq(SYS_BUS_DEVICE(&s->i3c.devices[i]), 0, irq);
>>       }
> 
> Clashes with Philippe's
> 
>      [PATCH v2 10/22] hw/arm/aspeed: Clean up local variable shadowing
>      Message-ID: <20230904161235.84651-11-philmd@linaro.org>
> 
> The difference is a matter of taste: one @irq in function scope vs. four
> in nested scopes.  I'd prefer the former, i.e. this patch, but
> maintainers' preference matter more than mine.  If you want me to merge
> together with other shadowing patches, tell me your preference, if any.

You are the one gathering patches. Please choose. I don't mind.

Thanks,

C.

