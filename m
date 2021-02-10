Received: by 2002:a19:690d:0:0:0:0:0 with SMTP id e13csp1701819lfc;
        Wed, 10 Feb 2021 14:20:04 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyXm+9Q9G1pKfpSa/+l2jqoP6dUrc3Vzy6kLOLr+Vt3b2bxZSQ9PHnPE09iBcOzQdSYUOWj
X-Received: by 2002:a25:1002:: with SMTP id 2mr7877558ybq.410.1612995603901;
        Wed, 10 Feb 2021 14:20:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1612995603; cv=none;
        d=google.com; s=arc-20160816;
        b=OuAhO1vs3MxrYNZ7WAipvh4+NZJ+myiYzYLwrA8cZLa++wdVrGV1eVYJluOTU+3TAD
         0vWfr0gPT5zGqoUT6Qj7tiJ3V/xkNVdoz4JWZxDFTHmRZzhAxHlw3Z+tAc3gTOcqZYZK
         qsjjT7YaNlSomrxvX66V1bwGk2phw5GPm3bhgQNvIsQVJnXk4aWaHGbTpaAMm0nFoNo1
         rNQOqI7+Zwxz2NF2YIiDg3vLYQcJul9XhN9dmWuIWWG5s7eIZ2HFLArL1bZezA1UpWkU
         HrxQmNAPQiq7SNW/+7yR/Vi+cHVz5US3CFllM9Ig/fAfTU9KzN6j1VaRkEB7UJvc4C9t
         GrNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/qB1a01mxozqLOliwo6Nil14ds+AWRj3ZOOOmMFAdos=;
        b=xYxofPrd52hPrbCHVf+O9opm5hn4LWa4hNmCztqDeGaa+DoYtQ+FuRgHlsFwF4Tb53
         Ta6rzrlvChZCx18c7/PHXIJPUm0Qcn7ooezKk6o7W/4RPEgA1oRG28YEi9aaIZ1JtT6o
         yFf926tDYG8FAgpHcpHtDP07aSYrt3NqIRxg/MI/uaheycWk+9384gm09Sv+hfG+EhCI
         IMslobprs0vl7uOTsxVQvFTOh/btLQFHDp+1LFjCclaCR+Kcat72E18dxuQMIwlGvmTu
         /PfYlDW0pdSUve+JiU8uzRurEngbO6pDNWWORbfXRBD3tWO9SjGqZ1pkB9pI+0mhxkGH
         E39Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=BzbGkeoc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k7si3276631ybb.209.2021.02.10.14.20.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 10 Feb 2021 14:20:03 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=BzbGkeoc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40394 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l9xq7-0006Fa-72
	for alex.bennee@linaro.org; Wed, 10 Feb 2021 17:20:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58552)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l9xpU-0005YH-TO
 for qemu-arm@nongnu.org; Wed, 10 Feb 2021 17:19:24 -0500
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535]:39422)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l9xpT-0006Va-9g
 for qemu-arm@nongnu.org; Wed, 10 Feb 2021 17:19:24 -0500
Received: by mail-ed1-x535.google.com with SMTP id y8so4878481ede.6
 for <qemu-arm@nongnu.org>; Wed, 10 Feb 2021 14:19:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/qB1a01mxozqLOliwo6Nil14ds+AWRj3ZOOOmMFAdos=;
 b=BzbGkeoc5cEbcx5xWy0HLw3e3Da8mMoJOnM0NVMZOIysrn1tMNeSDZbVawb+sV8QLj
 nRl0SsYGx64IXhxpHWwffndUNOpaIVwwF6FEVO9NpHhfDSyNMbb1j02K5LrgRsbFjI1B
 K8vcZMCnwtriB5leAvGZPBe08RSdp6eEF3hB4tVseSpMJlQ226iSX70bs/eZZRu/3pRx
 iMNfxQ1FWxN/HdNy28c/S5Cr7bza1WlAjdvUvHQiyFE7Inxu+g8jmHF3VZc7+67wbSJR
 qoUa5TQdrOSZBJ8tA5Ibm8lq56Gaq+sLwr1GRGUC5SqjJRrdBNWKKerkXNEbz5yaSan8
 IiFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/qB1a01mxozqLOliwo6Nil14ds+AWRj3ZOOOmMFAdos=;
 b=kOEt7Wvm6Kf9tHJU3QfUDGdYtLO7nt48nItIlwL2rlVZj6u3G+Cm6VMVFVraYsmIQa
 6hWe2YQ/7kGcxX2B/N25+7exnycmtIeEWkPYy978tnqXaWHYTdwbww5JqRLp5RsbGzJ8
 sJ+B8AX27IAXYQB+PL19jeR0nSYW2N6ZCQczfPZjTmEC0FCYuB8sq8vnUgG89paUNtH0
 gIcr6QFn24GyAH84T4A2IYoF5ci5vvnX69esoXBU7rucM0rBHjdsicNMcuGAXcaQBwP9
 Xnz0IJ1+iSPKCpMeuEoHlSWAUU/JPn4Oz6Keqny0fpYyo6W/mBb3xfctRxX39PJRXQp9
 mcKA==
X-Gm-Message-State: AOAM530pXRBWpobfLvSFu7mIDj6L8twvGQFT6lPcMvv2R5S1Qd4pV9dz
 rOQvfHjiSD7/v0rKyfDeL/h5cPR10FLCbNH5Hs0Sig==
X-Received: by 2002:a05:6402:3514:: with SMTP id
 b20mr5246290edd.100.1612995561558; 
 Wed, 10 Feb 2021 14:19:21 -0800 (PST)
MIME-Version: 1.0
References: <20210209132040.5091-1-peter.maydell@linaro.org>
 <20210209132040.5091-2-peter.maydell@linaro.org>
 <CAGcCb13Jsfk=pqbCZBwrBgi7dv3QQQJ6Mb8ZVPJ0OCgvxxzQtA@mail.gmail.com>
In-Reply-To: <CAGcCb13Jsfk=pqbCZBwrBgi7dv3QQQJ6Mb8ZVPJ0OCgvxxzQtA@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 10 Feb 2021 22:19:10 +0000
Message-ID: <CAFEAcA-wwH5KNK1zMJVc-UL8oXnEeRg2kuOjjL8PasK59SQsAA@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] clock: Add ClockEvent parameter to callbacks
To: Hao Wu <wuhaotsh@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x535.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Luc Michel <luc@lmichel.fr>, Havard Skinnemoen <hskinnemoen@google.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Tyrone Ting <kfting@nuvoton.com>,
 qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ntm7bFkNiaRH

On Wed, 10 Feb 2021 at 20:53, Hao Wu <wuhaotsh@google.com> wrote:
>
>
>
> On Tue, Feb 9, 2021 at 5:24 AM Peter Maydell <peter.maydell@linaro.org> wrote:
>> diff --git a/hw/adc/npcm7xx_adc.c b/hw/adc/npcm7xx_adc.c
>> index 870a6d50c27..573f4876dc6 100644
>> --- a/hw/adc/npcm7xx_adc.c
>> +++ b/hw/adc/npcm7xx_adc.c
>> @@ -238,7 +238,7 @@ static void npcm7xx_adc_init(Object *obj)
>>      memory_region_init_io(&s->iomem, obj, &npcm7xx_adc_ops, s,
>>                            TYPE_NPCM7XX_ADC, 4 * KiB);
>>      sysbus_init_mmio(sbd, &s->iomem);
>> -    s->clock = qdev_init_clock_in(DEVICE(s), "clock", NULL, NULL);
>> +    s->clock = qdev_init_clock_in(DEVICE(s), "clock", NULL, NULL, ClockUpdate);
>
> Since there's no callback here should it be
>  s->clock = qdev_init_clock_in(DEVICE(s), "clock", NULL, NULL, 0);
> ?

Yes; thanks for the catch. (The function ignores the events argument
if there's no callback function specified, but 0 makes more sense.)

-- PMM
