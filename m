Received: by 2002:ac2:54ba:0:0:0:0:0 with SMTP id w26csp263491lfk;
        Mon, 7 Feb 2022 15:21:12 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwLwmM3412DQScBSXp42EIXAs+fXPsFNZjGVp7Wc1GqlpmTDxA3DsCvTxSp9ZKTGwxx4jbS
X-Received: by 2002:a81:b148:: with SMTP id p69mr2379152ywh.402.1644276072730;
        Mon, 07 Feb 2022 15:21:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1644276072; cv=none;
        d=google.com; s=arc-20160816;
        b=iilPTyaH8VAQipiEFUupaC0Jj5CMyA87RVa/6/4VJGvomr39jShkEHa7gxHUq0mvTE
         Rbry3d2I6uCLLswHDYbSpW5TZ//LjVIHL/suYYCa2B+ELC3hQiaosrYGK6N56VIGaYQc
         anO382WgGXn+iIWI0tfKgGB+2AbIFFd7XdxXwx9vv+ZqiER57uIZu5MeoJwRP8qaS7/r
         fHAYOiyxlWg9zfTw38UrMO+xCD75XVBPwIPjciX2zEAE7Vls5HazGNP2Ovp+uVIV6XLB
         IoGiHneZCGEBj8Ls858ZNqfmrwrkU9/xqFPd8nsIAVQ44kqyXMXLWCakaEuVhikPF0QJ
         jiLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id;
        bh=i3s23o1QN1MYxVk9S1FehwdbM3Qvh9km8chQ1vw95mM=;
        b=GXCNr+95pMmViAbgvoY8/JMZflSYB3da4xu2dlhb3i4IXX/a29lsZIjItVC0gPMOCP
         ZRYGgmntCbg98YHHnIa9i8gHWhJUU5o1p01A3iV3yAmyFKKqw0jNbWOieq/IksZOpRM+
         Ow/dRrB+Z4DgHeRqm7iBUAA6xX8Rg/MR9u9g2UhMZ9Oqd2lEFhd7xoxqlQbf2o7WkweH
         cIskMzzP8opZZpwFy8KMnyLyPtH49LIqUBa0P50c31gtlUG+bLIKg4g2e/ZI97Ooc8y0
         +cXZUlNa75MI+BhfV6Viy4sRa77plr+2bqaD/70b/BkncMA/waaLYji6R+gSUADQK+xa
         FU3w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u17si2844726ybm.489.2022.02.07.15.21.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 07 Feb 2022 15:21:12 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:39388 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nHDJo-0006bZ-6A
	for alex.bennee@linaro.org; Mon, 07 Feb 2022 18:21:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40410)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <agraf@csgraf.de>)
 id 1nHDIy-0006al-Gm; Mon, 07 Feb 2022 18:20:20 -0500
Received: from mail.csgraf.de ([85.25.223.15]:34204 helo=zulu616.server4you.de)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <agraf@csgraf.de>)
 id 1nHDIv-00038O-2r; Mon, 07 Feb 2022 18:20:19 -0500
Received: from [192.168.106.118]
 (dynamic-077-009-016-031.77.9.pool.telefonica.de [77.9.16.31])
 by csgraf.de (Postfix) with ESMTPSA id 9F39860803FE;
 Tue,  8 Feb 2022 00:20:13 +0100 (CET)
Message-ID: <e331de80-0548-7bbd-b459-239d14b7b327@csgraf.de>
Date: Tue, 8 Feb 2022 00:20:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.1
Subject: Re: [PATCH 06/16] hw/arm/xlnx-zcu102: Don't enable PSCI conduit when
 booting guest in EL3
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
References: <20220127154639.2090164-1-peter.maydell@linaro.org>
 <20220127154639.2090164-7-peter.maydell@linaro.org>
 <2c67bde5-65b2-0af0-afde-7353a4fe2a1b@csgraf.de>
 <CAFEAcA9DcHXRkA7gCihU6LrOc40EOHnVnTeEcf4+xSfG22eJ-g@mail.gmail.com>
 <44ec9504-a7ef-6805-ae94-4435e5a37735@csgraf.de>
 <CAJy5ezqUtLphzH_WKmW8dR34=k-g5dmuevuZY42GfnD-R-uCqg@mail.gmail.com>
 <a6caa3b0-89ae-d482-62f5-2cada740a60e@csgraf.de>
 <cc73e2f0-97e1-f9c5-1a89-45ff2b0a2aeb@amsat.org>
 <0da64aa5-97b3-540b-0fc9-cb9bf670d487@csgraf.de>
 <CAJy5ezrEFifPUWUmSmEmqqUsSdeQpEG+KjyCDJFJROFSKGFDVA@mail.gmail.com>
 <1d1cf0b8-d827-3d68-6b81-f334020d7606@amsat.org>
From: Alexander Graf <agraf@csgraf.de>
In-Reply-To: <1d1cf0b8-d827-3d68-6b81-f334020d7606@amsat.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=85.25.223.15; envelope-from=agraf@csgraf.de;
 helo=zulu616.server4you.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Eduardo Habkost <eduardo@habkost.net>,
 Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <alistair@alistair23.me>,
 Stefano Stabellini <sstabellini@kernel.org>, Rob Herring <robh@kernel.org>,
 Beniamino Galvani <b.galvani@gmail.com>,
 Andre Przywara <andre.przywara@arm.com>, Tyrone Ting <kfting@nuvoton.com>,
 qemu-devel <qemu-devel@nongnu.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Yanan Wang <wangyanan55@huawei.com>, Andrew Jeffery <andrew@aj.id.au>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Havard Skinnemoen <hskinnemoen@google.com>,
 Andrey Smirnov <andrew.smirnov@gmail.com>,
 Michal Simek <michal.simek@xilinx.com>, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: pGGUfxTEmnhY


On 07.02.22 19:59, Philippe Mathieu-Daudé wrote:
> On 7/2/22 19:13, Edgar E. Iglesias wrote:
>>
>> On Mon, Feb 7, 2022 at 5:24 PM Alexander Graf <agraf@csgraf.de 
>> <mailto:agraf@csgraf.de>> wrote:
>>
>>
>>     On 07.02.22 17:06, Philippe Mathieu-Daudé wrote:
>>      > On 7/2/22 16:59, Alexander Graf wrote:
>>      >>
>>      >> On 07.02.22 16:52, Edgar E. Iglesias wrote:
>>      >
>>      >>> Both Versal and ZynqMP require MicroBlaze firmware to run the
>>      >>> reference implementations of Trusted Firmware. We never 
>> supported
>>      >>> this in upstream QEMU but we do support it with our fork (by
>>     running
>>      >>> multiple QEMU instances co-simulating).
>>      >>>
>>      >>> Having said that, we do have tons of EL3 test-cases that we 
>> use to
>>      >>> validate QEMU that run with EL3 enabled in upstream.
>>      >>>
>>      >>> So there's two user flows:
>>      >>> 1. Direct boots using QEMUs builtin PSCI (Most users use this
>>     to run
>>      >>> Linux, Xen, U-boot, etc)
>>      >>> 2. Firmware boot at EL3 without QEMUs builtin PSCI (Mostly 
>> used by
>>      >>> test-code)
>>      >>>
>>      >>> Number #2 is the one affected here and that by accident used to
>>     have
>>      >>> the builtin PSCI support enabled but now requires more power
>>     control
>>      >>> modelling to keep working.
>>      >>> Unless I'm missing something, the -kernel boots will continue
>>     to use
>>      >>> the builtin PSCI implementation.
>>      >>
>>      >>
>>      >> So nobody is using upstream QEMU to validate and prototype
>>      >> ATF/EL1s/EL0s code? That's a shame :). I suppose there is little
>>      >> value without the bitstream emulation and R cluster. Do you have
>>      >> plans to bring multi process emulation upstream some day to 
>> enable
>>      >> these there?
>>      >
>>      > The R cluster is already in mainstream, isn't it?
>>
>>
>>     In that case, wouldn't it make sense to build an emulation model 
>> of the
>>     PMU behavior so that normal ATF works out of the box?
>>
>>
>>     Thanks,
>>
>>     Alex
>>
>>
>> Yes, that makes sense and there are several ways to implement it. To 
>> fully support the programmability of the PMU we'd need to model the 
>> MicroBlazes together with the ARM cores.
>>
>> But PMU support does not really conflict with this patch series, or 
>> is there something I'm missing?
>
> My understanding is Alex generically wonders about code coverage, not
> about the ZynqMP in particular :)


I'm more curious what the purpose of zynqmp / versal simulation in QEMU 
is. What we're saying here is that we only care about "Linux at EL2 and 
below" plus a Xilinx validation test suite. I understand how multi-QEMU 
emulation may be difficult, but EL3 simulation with Cortex-A plus 
Cortex-R clusters and a simulated PMU sounds like it would get you a 
very long way on simulation coverage.

That said, Xilinx probably knows their user base the best, so if they 
decide that the ability to run TrustZone code is not something they 
believe their users need in QEMU, I'm definitely happy with that stance.


Alex

