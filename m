Received: by 2002:ac2:54ba:0:0:0:0:0 with SMTP id w26csp55887lfk;
        Mon, 7 Feb 2022 08:39:20 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzN9fpjFH//xdwm9dZ4XTIr2eo4R0XjIxHpwaOIST6hROhiuolWF1/91LdHPHykQWz4NcDO
X-Received: by 2002:a25:251:: with SMTP id 78mr501504ybc.730.1644251959933;
        Mon, 07 Feb 2022 08:39:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1644251959; cv=none;
        d=google.com; s=arc-20160816;
        b=ymcQR+ygqvL5gG+oTvXbqveF+vEXDk2CEbPwNT6iq/UF/p6nTUxzlJbVoHGwNGtG/O
         bFY928wKOG8G9pRwtbr+1RGPbxopirvTauYW4h/RH0qraU/maX3JlvND18CNHYw13z+4
         BoYrzYuHt2Utj7lXOapU19LURsymENMOTjtqcPmX26lvDW2abnpJOhuFDL53zUP92OXB
         wD0BLkdkH8SXCSB7R3B7YqYq55sueQVDdOFq6cHPskHSVQOF2XPU5L+Vf+fdnjAnyTz/
         hbGibveeIbFSwruHC8mF0fI1qtpOwnRHllqUv4TXdbQcr1eUfoKUHtXEs0tWa1ACtBly
         dK+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:subject:user-agent:mime-version:date
         :message-id;
        bh=gXfEM6m1nNEy7FU0CUU3FofvKOMSWiCOQZXmMiMZUa0=;
        b=GV4MfysLwVYW73WqVZR1NVurc3QswgnPSqWKS9n5dVSxbmSmPVoV2ekcJ0ijPhgBy/
         2s3HF4g5zHDv0aufCf/CZRW7H4s0g2tbgabS+f1Buo4jcCa6b1PJK/Y13ehS+0cX/fba
         hNF1KFtvaAmJ/W/B6vIL+56jv9FD7hISpfd51XfTuM7thJLE19UqBrubv9w/liumsHIy
         iQqNoQP5aT+KgwbCCzcd1QdO8q32CM0gGFlv7SnP0wVvH0md6j1miWdNsBkiEAqtEXqv
         BS0ryhuTlZcyDbEPSrLwVTZW0+evAxr+uG+EAKrixXFlE8JnKba0HWA6CjkQLa4RgFlx
         Dxww==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m2si7057811ybo.165.2022.02.07.08.39.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 07 Feb 2022 08:39:19 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:45778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nH72s-0002Qd-8d
	for alex.bennee@linaro.org; Mon, 07 Feb 2022 11:39:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41208)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <agraf@csgraf.de>)
 id 1nH6ok-0002tB-P7; Mon, 07 Feb 2022 11:24:43 -0500
Received: from mail.csgraf.de ([85.25.223.15]:33962 helo=zulu616.server4you.de)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <agraf@csgraf.de>)
 id 1nH6oh-0002i3-Rw; Mon, 07 Feb 2022 11:24:42 -0500
Received: from [0.0.0.0] (ec2-3-122-114-9.eu-central-1.compute.amazonaws.com
 [3.122.114.9]) by csgraf.de (Postfix) with ESMTPSA id 6B273608119E;
 Mon,  7 Feb 2022 17:24:36 +0100 (CET)
Message-ID: <0da64aa5-97b3-540b-0fc9-cb9bf670d487@csgraf.de>
Date: Mon, 7 Feb 2022 17:24:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.1
Subject: Re: [PATCH 06/16] hw/arm/xlnx-zcu102: Don't enable PSCI conduit when
 booting guest in EL3
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
From: Alexander Graf <agraf@csgraf.de>
In-Reply-To: <cc73e2f0-97e1-f9c5-1a89-45ff2b0a2aeb@amsat.org>
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
X-TUID: ickbayR40l2r


On 07.02.22 17:06, Philippe Mathieu-Daudé wrote:
> On 7/2/22 16:59, Alexander Graf wrote:
>>
>> On 07.02.22 16:52, Edgar E. Iglesias wrote:
>
>>> Both Versal and ZynqMP require MicroBlaze firmware to run the 
>>> reference implementations of Trusted Firmware. We never supported 
>>> this in upstream QEMU but we do support it with our fork (by running 
>>> multiple QEMU instances co-simulating).
>>>
>>> Having said that, we do have tons of EL3 test-cases that we use to 
>>> validate QEMU that run with EL3 enabled in upstream.
>>>
>>> So there's two user flows:
>>> 1. Direct boots using QEMUs builtin PSCI (Most users use this to run 
>>> Linux, Xen, U-boot, etc)
>>> 2. Firmware boot at EL3 without QEMUs builtin PSCI (Mostly used by 
>>> test-code)
>>>
>>> Number #2 is the one affected here and that by accident used to have 
>>> the builtin PSCI support enabled but now requires more power control 
>>> modelling to keep working.
>>> Unless I'm missing something, the -kernel boots will continue to use 
>>> the builtin PSCI implementation.
>>
>>
>> So nobody is using upstream QEMU to validate and prototype 
>> ATF/EL1s/EL0s code? That's a shame :). I suppose there is little 
>> value without the bitstream emulation and R cluster. Do you have 
>> plans to bring multi process emulation upstream some day to enable 
>> these there?
>
> The R cluster is already in mainstream, isn't it?


In that case, wouldn't it make sense to build an emulation model of the 
PMU behavior so that normal ATF works out of the box?


Thanks,

Alex

