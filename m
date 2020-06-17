Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp237112lfm;
        Tue, 16 Jun 2020 20:29:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxkYTjU5+uIta6p7xnQuWQeFd7G0WoxRx5tDtpoQDy276/xdjJvsD8BKJjB2NYiuEgrduJR
X-Received: by 2002:a25:ae8c:: with SMTP id b12mr8472054ybj.502.1592364539957;
        Tue, 16 Jun 2020 20:28:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592364539; cv=none;
        d=google.com; s=arc-20160816;
        b=TkVA3cWa65tk5Hxuf5D0KE5OyLAyleXtTUaq12W860fTKDSsXc+2KQ4hi+y2jJN8vy
         jKCOGTFOxlegmgzgrko6WN2x8+m2WQcWrv6qS/Sgoi0wTXYbMYVbDm7OKho6+pkkKpKn
         gqUxeUDLsO8z0fe69sCJey7NTCnCoB3W391xf96jBfNsCS7n6dgyiBxUu31SAtBs7brx
         yp5SvqIF//Zmjbzh391O3KZLjR1J53MI1mJuwa5a58SIgLpb3Z+ahBAJh4duqsLbirc+
         Bu/BbKNZQFzuroDCkbEvwovXZklf4v12obFb6TrMcsbs8Ts33+jDCsM5arwSp0eYfJe7
         Q/fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=LOFgVBFhfhcUfdP2v8fgyP0Id9bpdxJ7tlyH5MF9WAE=;
        b=HpJGgC5hMtTOPkDG9hZ8Pcct9EIZ/x9KxjyggyuKU05VgJX5oIpLLVO0eXTnXn4Niz
         c6cz5mkeNzhXyEaJV/wNt7Gm5/aR30VsgpRYKGmNHXDPPk1Fde+XZWmIRNDt049xEJI0
         5pLgHAmQ7MI9AKxcqqKtLXF/6B3k5pOo3v9ys3CYnuXNddfGG1IRYPy6GisxKzWsxgt0
         O8AmESjnjlRYTuroAL14eUmo5lznZBBBIb2YcxGMvu33aAOF/x88xitRaJlvOjqCYgsQ
         xTHNb3gwaqSEH0RafqgAVZVwsTpiVx7sGuIm6u5WWbXObwDutjARLegvQPtX19EUFhrq
         cdNg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=EPrYrZY7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b204si16514444yba.489.2020.06.16.20.28.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 16 Jun 2020 20:28:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=EPrYrZY7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:40266 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jlOl1-0001kj-AJ
	for alex.bennee@linaro.org; Tue, 16 Jun 2020 23:28:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53470)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jlOkt-0001kW-6V; Tue, 16 Jun 2020 23:28:51 -0400
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:35456)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jlOkr-0007Ze-OA; Tue, 16 Jun 2020 23:28:50 -0400
Received: by mail-wr1-x441.google.com with SMTP id x14so727884wrp.2;
 Tue, 16 Jun 2020 20:28:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=LOFgVBFhfhcUfdP2v8fgyP0Id9bpdxJ7tlyH5MF9WAE=;
 b=EPrYrZY7S/gVI2LQWsLXJvXp82XtPbdnlHPrB3zKmveO7WC+KeDSiLiRsyUdohgdyF
 tRnac62bsMTfJk1KwrzubDXSRtOCYgw59azhxzMm5nqzPeszLb/lTWseDn0pj3XFjfmA
 rMqrNqJzoL1MTo6imwtSJZqBnGwuTJVJxWC3rUi7tnnJOW5TO2oMorHrK6jNdI8CnR/U
 6YN1TRxZkjik3OTbrXRhJCdu3WG25FXzExlORDA1cIOPYcC6HVsPT0omZHPiJodXAS5i
 l1Z3y+nV5TdYJI7ErI8KWxPol5f7mTkxgEzapkGjl0vCSqXy8oWtw0ZJit09EjoNr+Tm
 Iy0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=LOFgVBFhfhcUfdP2v8fgyP0Id9bpdxJ7tlyH5MF9WAE=;
 b=BXC0xEopodZEuXcjIceuFihN0dCrv9E/Qq92niQEUnmHuUg2PIo8FdNJVvNSCpn9RW
 1484XhDUL04tyLagjJALRSEOoaY4BwnAcveClHzd9qSlW0tT86VBg7P5A/W+lnElA6wc
 9urpVRXgApmQKNTXyPGkutEEjiOVNkyLrM0A1TZKSTHZZ6dMet6Vg/1CXdR/w6RqC18+
 T8yqynheLgD/87qbjeurEbS529NcJUFR15UyAteUCCQryrhQt+RcbYFg1soXFo4wpQ3V
 ZcfRqYGcQGv6nqPujm0i8/SgzF5BniTlL2v4eAF7cmVZaUu6JppXu3XVXIQen4dWw81K
 SoTw==
X-Gm-Message-State: AOAM533UjVPOVdKXNR5mu7XibMRCABJRo31airULS3kMOzNmi24LnoL+
 XTYlxNEh9b6BeZ34NKvRQFWFRAc5
X-Received: by 2002:adf:f2c2:: with SMTP id d2mr5853483wrp.424.1592364527469; 
 Tue, 16 Jun 2020 20:28:47 -0700 (PDT)
Received: from [192.168.1.37] (93.red-83-59-160.dynamicip.rima-tde.net.
 [83.59.160.93])
 by smtp.gmail.com with ESMTPSA id u130sm6714418wmg.32.2020.06.16.20.28.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Jun 2020 20:28:46 -0700 (PDT)
Subject: Re: [PATCH 5/7] hw/arm/mps2: Add I2C busses on FPGA APB
To: Peter Maydell <peter.maydell@linaro.org>
References: <20200616063157.16389-1-f4bug@amsat.org>
 <20200616063157.16389-6-f4bug@amsat.org>
 <CAFEAcA9oruR9iXVwPxDMxdGe+Nv8zS9DZ=g3ta96_sSz3-rumg@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <f0f8f63f-2466-cd18-94aa-3486581eab14@amsat.org>
Date: Wed, 17 Jun 2020 05:28:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9oruR9iXVwPxDMxdGe+Nv8zS9DZ=g3ta96_sSz3-rumg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::441;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x441.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=1, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Esteban Bosse <estebanbosse@gmail.com>,
 Joaquin de Andres <me@xcancerberox.com.ar>, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: B3fEX4YH2Nie

On 6/16/20 12:21 PM, Peter Maydell wrote:
> On Tue, 16 Jun 2020 at 07:32, Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
>>
>> There are 4 different I2C peripherals on the FPGA APB.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> ---
>>  hw/arm/mps2.c | 7 +++++++
>>  1 file changed, 7 insertions(+)
>>
>> diff --git a/hw/arm/mps2.c b/hw/arm/mps2.c
>> index 4a49bfa9b9..6224d7a63c 100644
>> --- a/hw/arm/mps2.c
>> +++ b/hw/arm/mps2.c
>> @@ -321,6 +321,7 @@ static void mps2_common_init(MachineState *machine)
>>          create_unimplemented_device("cmsdk-ahb-gpio", gpiobase[i], 0x1000);
>>      }
>>
>> +    /* FPGA APB */
>>      sysbus_init_child_obj(OBJECT(mms), "scc", &mms->scc,
>>                            sizeof(mms->scc), TYPE_MPS2_SCC);
>>      sccdev = DEVICE(&mms->scc);
>> @@ -330,6 +331,12 @@ static void mps2_common_init(MachineState *machine)
>>      object_property_set_bool(OBJECT(&mms->scc), true, "realized",
>>                               &error_fatal);
>>      sysbus_mmio_map(SYS_BUS_DEVICE(sccdev), 0, 0x4002f000);
>> +    for (i = 0; i < 4; i++) {
>> +        static const hwaddr i2cbase[] = {0x40022000, 0x40023000,
>> +                                         0x40029000, 0x4002a000};
>> +
>> +        sysbus_create_simple("versatile_i2c", i2cbase[i], NULL);
>> +    }
> 
> Is this device really the same as the I2C controller h/w
> on the versatile board ?

It seems the opposite way around, the I2C controller modeled as
'versatile_i2c' is the real 'ARM SBCon two-wire serial bus interface'
bitbanging I2C. IIUC the name 'ARM SBCon two-wire serial bus interface'
became official /after/ the versatile was released, so 'versatile-i2c'
is the popular name.

Yes, the MPS2(+) implement the ARM SBCon two-wire serial bus interface.

I'll see to add a TYPE_SBCON_I2C alias, it might be easier.

> 
> thanks
> -- PMM
> 
