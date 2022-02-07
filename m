Received: by 2002:ac2:54ba:0:0:0:0:0 with SMTP id w26csp39106lfk;
        Mon, 7 Feb 2022 08:12:30 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwDOPGcsemV1EJ9tWjWdLKxtM4h27kJmXbib4Hf5NQbmFsX9PCsAeTFuCBsbCtJztC4gUIJ
X-Received: by 2002:a25:1106:: with SMTP id 6mr371726ybr.459.1644250350749;
        Mon, 07 Feb 2022 08:12:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1644250350; cv=none;
        d=google.com; s=arc-20160816;
        b=J7HHcUOSW5kCj0YMFfm4haLzdajohtvvH9E/XjM6O4PzMDBfJXFsUeC9wcrX1v6ymz
         FSwsDYaT+qkhAoV81LEvtLhcZuUjw5JzlWhurN5STLf5U4Zc1/TFfX2N4IYwVWljY45g
         lX2wMrFO5dPPvGpAi7RPuaJHH6d6uKM4iTu/NUQiONSgvPugFjp0dNYkWMsRXEI3nX0f
         4Zk5zr+bI1WDVC4br8BdMsbym50cL1Br/l/GFvdC2mB16rT7R8/XiIwt/60yW44e7Heb
         2/EPi37WTg1FlV0bYdHaQoeicTcBI39zJQ2qiEm4QO0m0iS2UqvnP3HTJvIjumPrGmmA
         vaNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=from:reply-to:sender:errors-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:in-reply-to:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=qJ/GakoKhkSqpKMIem6tPqLETidwhvfmDZeaIsRNjpM=;
        b=PDvJrnGFFslMUlCp6ej0DVCDWrBuGVVpgUsPRZQKD98lXwM2ncbYuAv74D5YUawAoa
         MjOyT05t4SmKwXCHPB9HqOIqUykSGp2cqr8vMD8BWyUSHW/xIZzN2Ue9z8oFFM6ARZpY
         vcfi5TkuCCCRLeDwAkGpJ8JxokqA3Q84R7ThMNeXjiFBuwEqMD9fB4qisprDIgfavnUL
         pz3I5P9So+sL7Md2FTSmHKLykAYjNYy5gIbrkTGKmIvgWKYPGEmDK5vlZYOwuX41JojF
         vxZ+DWixAgBQ4w9BfOZ37PE3e/n1STZVUnUhWkyjPL19p8IeA+s2LMedAiqYgg54pGT5
         /bvQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b=ZnKYf6Nf;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y7si2153111ybe.281.2022.02.07.08.12.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 07 Feb 2022 08:12:30 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b=ZnKYf6Nf;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1]:50634 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nH6cw-00019j-6Y
	for alex.bennee@linaro.org; Mon, 07 Feb 2022 11:12:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nH6X0-0004Dg-7W; Mon, 07 Feb 2022 11:06:22 -0500
Received: from [2607:f8b0:4864:20::436] (port=41644
 helo=mail-pf1-x436.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nH6Wx-0007YW-WF; Mon, 07 Feb 2022 11:06:21 -0500
Received: by mail-pf1-x436.google.com with SMTP id i30so13715098pfk.8;
 Mon, 07 Feb 2022 08:06:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=qJ/GakoKhkSqpKMIem6tPqLETidwhvfmDZeaIsRNjpM=;
 b=ZnKYf6NffylCiV9ou4MYukvcUmf3dgS2T0uIiT7bYkON1PXvXBuEs/hWbEAlaDHSPz
 KuXEQtt1+NH0U6zCEXpw3++GS/P1QH+z2rsX65w1twlN19yqd+LYnmZC29d/Bg+SO+5p
 J9Me20AlyoQmTWxNt3jCA4c/byX8FzEOgHJZl4qUmPY9M6/mVK96b+JZOUs+mZLl9Srm
 9bvqVfRsZx7/6o58jSBov2SDV9yxYB4vktE0XXKd7luCqXe1DOzXo0HxYTWYKJNeo4tK
 mSmmQxF7OiVz/iFwyevX+pAxsgmcqWodm2utphIqItSMqG9UQSVRP29Cpgvg2P9L5qhm
 mP1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=qJ/GakoKhkSqpKMIem6tPqLETidwhvfmDZeaIsRNjpM=;
 b=QZwlDtd2XG9GIP623x4yygxeUhwjX6Zd5PNczIz0kj4OTrIxTs/r/ZMKwu5A4QiOS8
 TLgiG9oJWbLhnR9M0p05OcQaLKvH2Efxnou66XTiT60pehZfA96oudEyzM1jah/aSjp4
 YI6qZ0jTBurire2D4apSUGZ7wMbraIdWE8W41VikY3RW77XfUOTy0cfw9hStSUuhaOj4
 QwsMPPmstqdmYlJ/dD0xZSZU+fgowVySJtmqvy+Qylvp8HotQqq5F/2UmCdFnXdLsjDb
 302xF54U1hKPHsxcb7ixWT3G7FBvQOZ0nW4n5rNk2zcNVNx1ABrea07Dvrl4ae8/eyth
 opNQ==
X-Gm-Message-State: AOAM532H13OdB+bNF+sfY7ufu3aX14N08MP1SbClF+8arjpCcFuNJ1xC
 mNT6fDgPh1jY/fmU9XT1nuU=
X-Received: by 2002:a63:96:: with SMTP id 144mr71909pga.19.1644249974881;
 Mon, 07 Feb 2022 08:06:14 -0800 (PST)
Received: from [192.168.1.33] (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id pf4sm24884455pjb.35.2022.02.07.08.06.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Feb 2022 08:06:14 -0800 (PST)
Message-ID: <cc73e2f0-97e1-f9c5-1a89-45ff2b0a2aeb@amsat.org>
Date: Mon, 7 Feb 2022 17:06:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.1
Subject: Re: [PATCH 06/16] hw/arm/xlnx-zcu102: Don't enable PSCI conduit when
 booting guest in EL3
Content-Language: en-US
To: Alexander Graf <agraf@csgraf.de>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm <qemu-arm@nongnu.org>, 
 qemu-devel <qemu-devel@nongnu.org>, Eduardo Habkost <eduardo@habkost.net>, 
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>,
 Beniamino Galvani <b.galvani@gmail.com>, =?UTF-8?Q?C=c3=a9dric_Le_Goater?=
 <clg@kaod.org>, Andrew Jeffery <andrew@aj.id.au>,
 Joel Stanley <joel@jms.id.au>, Igor Mitsyanko <i.mitsyanko@gmail.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Andrey Smirnov <andrew.smirnov@gmail.com>, Rob Herring <robh@kernel.org>,
 Havard Skinnemoen <hskinnemoen@google.com>, Tyrone Ting
 <kfting@nuvoton.com>, Alistair Francis <alistair@alistair23.me>,
 Andre Przywara <andre.przywara@arm.com>,
 Michal Simek <michal.simek@xilinx.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20220127154639.2090164-1-peter.maydell@linaro.org>
 <20220127154639.2090164-7-peter.maydell@linaro.org>
 <2c67bde5-65b2-0af0-afde-7353a4fe2a1b@csgraf.de>
 <CAFEAcA9DcHXRkA7gCihU6LrOc40EOHnVnTeEcf4+xSfG22eJ-g@mail.gmail.com>
 <44ec9504-a7ef-6805-ae94-4435e5a37735@csgraf.de>
 <CAJy5ezqUtLphzH_WKmW8dR34=k-g5dmuevuZY42GfnD-R-uCqg@mail.gmail.com>
 <a6caa3b0-89ae-d482-62f5-2cada740a60e@csgraf.de>
In-Reply-To: <a6caa3b0-89ae-d482-62f5-2cada740a60e@csgraf.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::436
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pf1-x436.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>
X-TUID: uH8Y1xzqGc1p

On 7/2/22 16:59, Alexander Graf wrote:
> 
> On 07.02.22 16:52, Edgar E. Iglesias wrote:

>> Both Versal and ZynqMP require MicroBlaze firmware to run the 
>> reference implementations of Trusted Firmware. We never supported this 
>> in upstream QEMU but we do support it with our fork (by running 
>> multiple QEMU instances co-simulating).
>>
>> Having said that, we do have tons of EL3 test-cases that we use to 
>> validate QEMU that run with EL3 enabled in upstream.
>>
>> So there's two user flows:
>> 1. Direct boots using QEMUs builtin PSCI (Most users use this to run 
>> Linux, Xen, U-boot, etc)
>> 2. Firmware boot at EL3 without QEMUs builtin PSCI (Mostly used by 
>> test-code)
>>
>> Number #2 is the one affected here and that by accident used to have 
>> the builtin PSCI support enabled but now requires more power control 
>> modelling to keep working.
>> Unless I'm missing something, the -kernel boots will continue to use 
>> the builtin PSCI implementation.
> 
> 
> So nobody is using upstream QEMU to validate and prototype ATF/EL1s/EL0s 
> code? That's a shame :). I suppose there is little value without the 
> bitstream emulation and R cluster. Do you have plans to bring multi 
> process emulation upstream some day to enable these there?

The R cluster is already in mainstream, isn't it?
