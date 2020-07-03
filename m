Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp2856753lfm;
        Fri, 3 Jul 2020 15:27:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzKQc+Zpv8QNkgCY4/E7+KeXN5y3elkL8j9UyeVwP3aH9Sh+mmxYQkaR+VtS1OqmpXKQmgx
X-Received: by 2002:a5b:648:: with SMTP id o8mr60692450ybq.511.1593815276814;
        Fri, 03 Jul 2020 15:27:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593815276; cv=none;
        d=google.com; s=arc-20160816;
        b=q7jxp1UADFBS75DQSjPlHMr3g5m/UHoOXJu5Qrauo5m0tRlru1FGbJ30ukqGt6M5GJ
         dX+fVBON/HW7f11Qwa4dOwkBuuoDM6zIDKcZ6gfKoSkiHw0HtCQsdtaqB5jLCdiz6wpV
         jo3cZsullaqWwPptm7VW2eXu8XSTw39GtnBJkOLzbihUEaxIWCoK3g3tMFUGUJ39xuEO
         mgd+fpXGcxezUmomepm3+P1Nogb9TXJkHZSmzbavL4tS9HyXBY0SNZUzuRK2UGliRIcG
         EtevU2NiOlPewcvhoVZUeVtzq/tyalmd5GoCBffJ8Anh18LQrnMCDdK28C61oSz2rfDd
         5H5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=1Uxf9r+2bC7J2Vc23SeJCvAfK9lxFQpbRypcySEtKo4=;
        b=LOtxVVWJ0uNRLtsJf1icdjrjwwROwyRkQtR/5Rn3EwDizPFJ2j+4JO/Dil+DTRLXT3
         wupM7LceWv7pv6hg9i6y8Yzn1TIOxvDY7vXjRQrNhr/r7yerAgFyShC5V3pY6YLGuLbg
         NH6hNeSfOABYgAlGgLkGi8Upny+WhPOIVAp4e4VZaBZ0wMBGpX8rioO6ZWjMs/ZK7MEC
         AkYE1ijdBo0YgC2GUE4mpLdKvTVf/xevmeVUATACYokUDrpWpTdwPxyN6sqkx3TYfaz6
         /kkyixBpRfUhj/gCbxUix6hLW5lwe79VoQ8yq0RwOmkbbXrTJZpzywl6Mn+9ctGOUfd+
         Ir/g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=FMW7YjNH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f15si12755934ybq.437.2020.07.03.15.27.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 03 Jul 2020 15:27:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=FMW7YjNH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:49160 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jrUA0-0000cg-4W
	for alex.bennee@linaro.org; Fri, 03 Jul 2020 18:27:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60686)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jrU9s-0000bZ-95; Fri, 03 Jul 2020 18:27:48 -0400
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:41034)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jrU9q-0003qL-Lz; Fri, 03 Jul 2020 18:27:48 -0400
Received: by mail-wr1-x442.google.com with SMTP id z15so22919541wrl.8;
 Fri, 03 Jul 2020 15:27:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=1Uxf9r+2bC7J2Vc23SeJCvAfK9lxFQpbRypcySEtKo4=;
 b=FMW7YjNHgU9HtH+fktgJl8YTMKR+ZE9g7KD2JiShsZu1j9WnNvMeJ8yWAqZoLE+Pke
 QQEz5XPwcZ8N1Vy8USFcU7ZOy2286mc+I1JM6SgqF1QPUhy1kd6XDozKkDLPk0NIdTe4
 lFeE2jA/KgCmW3ELqkwF97AY2yzovp34nz7yhej79mjrjhoqShHZG01exq3rcTw1fsvu
 uFCzqCF/ZcC3tVwfAcWUAWeDhkZMAYfDRy8p7p3OS4ugqSeX7xaJlagsrkeCswudE1kD
 ojI4/5Ak2Hqm1ab6Ynuhe69jXOASQuS7NPN8Y79y46XVjzDcNwsDZ90z/9Rm0XBfZLr/
 qRXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=1Uxf9r+2bC7J2Vc23SeJCvAfK9lxFQpbRypcySEtKo4=;
 b=tCEljd7IhfVr3Tp7YmrXY5PYMnT1uXZ/iAJvL3tcMhgo7/Y32ZCrIyRrPXa1ufxZaE
 keXbh/zyvUhNWcg7oWshRUGtabmZ/Jy3wQ32FUlXK/tT1y1S8OAlS7TDD4E82G/+dDgG
 hWXRKeezUC4gS2f3n1wa5bhlyg/xQgviwPr3QQNw2Eqyvr0VvOb4UtZ/RYCsuSJkAsgr
 7F24to1k7iTn5qK6/FKVrMT4tRZDKBAkbPScBRy0KdOxnXHH9J7QU2JhXV5WvDgyYicW
 w9GhBPoxSCz078wBGZLuTOpTkuBu2LsqZugkSUkNHbXR8zacHGnTJIFFbAv3Q3CO7L8z
 /cww==
X-Gm-Message-State: AOAM530kv5L8bsHdnPwD3jacCRJtTCrHldCJZOX2ZTr2aKwe7gL42Vhi
 n/dw8BuaCqHwdBwGMKer7Uw=
X-Received: by 2002:a5d:6342:: with SMTP id b2mr38238593wrw.262.1593815264646; 
 Fri, 03 Jul 2020 15:27:44 -0700 (PDT)
Received: from [192.168.1.39] (1.red-83-51-162.dynamicip.rima-tde.net.
 [83.51.162.1])
 by smtp.gmail.com with ESMTPSA id y77sm4730301wmd.36.2020.07.03.15.27.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Jul 2020 15:27:44 -0700 (PDT)
Subject: Re: [PATCH v3 05/12] hw/arm: Add NPCM730 and NPCM750 SoC models
To: Havard Skinnemoen <hskinnemoen@google.com>
References: <20200626235519.591734-1-hskinnemoen@google.com>
 <20200626235519.591734-6-hskinnemoen@google.com>
 <001d2d27-dfe2-b03b-9996-ca69ba81a542@amsat.org>
 <CAFQmdRZ4o9hs57kGU6WWHuBw4X+F55WyEsrhqiDTnSb3iftxTA@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <3b35fff3-6b4c-42ef-5a3a-0f67eb055fb2@amsat.org>
Date: Sat, 4 Jul 2020 00:27:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <CAFQmdRZ4o9hs57kGU6WWHuBw4X+F55WyEsrhqiDTnSb3iftxTA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::442;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x442.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=1, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Joel Stanley <joel@jms.id.au>,
 CS20 KFTing <kfting@nuvoton.com>, qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goate?= =?UTF-8?Q?r?= <clg@kaod.org>,
 IS20 Avi Fishman <Avi.Fishman@nuvoton.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: tMD1UYgrSwHl

On 7/3/20 10:56 PM, Havard Skinnemoen wrote:
> On Fri, Jul 3, 2020 at 6:32 AM Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
>>
>> On 6/27/20 1:55 AM, Havard Skinnemoen wrote:
>>> +/*
>>> + * This covers the whole MMIO space. We'll use this to catch any MMIO accesses
>>> + * that aren't handled by any device.
>>> + */
>>> +#define NPCM7XX_MMIO_BA         (0x80000000)
>>> +#define NPCM7XX_MMIO_SZ         (0x7FFD0000)
>>
>> Could be 0x80000000 since UNIMP_DEVICE is created with low
>> priority.
> 
> Good point, I'll do that.
> 
>>> +    /* I/O space -- unimplemented unless overridden below. */
>>> +    create_unimplemented_device("npcm7xx.io", NPCM7XX_MMIO_BA, NPCM7XX_MMIO_SZ);
>>
>> Note by doing that you won't get transaction failures when accessing
>> unassigned regions. This not incorrect, but a bit overkill (this covers
>> almost 2GiB...).
> 
> A lot of that 2GiB space is used by six 128 MiB flash memory
> apertures. But there are some holes that probably should generate
> transaction failures instead of a default response.

See commit 529fc5fd3e ("hw/arm: Add the STM32F4xx SoC") for the
recommended verbose way.

> 
> Would it be OK if I send a patch to tighten up the unimplemented space
> once a few more of the peripherals have been implemented?

Fine by me, this is not a blocker. Joel reviewed your patch anyway,
I trust him :)

Regards,

Phil.
