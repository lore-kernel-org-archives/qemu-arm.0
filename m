Received: by 2002:a19:4310:0:0:0:0:0 with SMTP id q16csp397353lfa;
        Wed, 2 Jun 2021 08:24:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxmYLHCU78vKHO6MsCF9BM310FYUpv08RH0yzr3yatUdVmBQ52or8HGvHewIF998MEJ8ie4
X-Received: by 2002:a05:6402:424c:: with SMTP id g12mr39402105edb.145.1622647450939;
        Wed, 02 Jun 2021 08:24:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1622647450; cv=none;
        d=google.com; s=arc-20160816;
        b=NM9eu8cqwUfE+6ISSzdLfeJ2rZ6GwgTBx33ir758iIJyFfxFSiqeETbuL6+zIbeWZt
         Sb/FOPaX8cP/a176o+1Xy4tYcnERXcSGwT3KIPZhLkl2nZ0lJuRREsHOHRx/VxT5MZ7y
         e4FevXCS6ksPEPBIQtYwjrAaiOFPxT0/xZ7mwryahHpRnq2EDye/3xPHTwcQqinX7Lfo
         ZGink5kZW290z43ZbefEkuhU1+DoTkJdhCeeeg/L2w5S7feP4iMv5yp+2rrjx99K9+PH
         Cj+bz4+K3Kb5QpaUa0sgIoHLUbGHL3F7aHSX+qLiLJeZ3BXhvWgsBgDL8mDf7chmZmfy
         GSqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=s5o686RmkEri2r7gf285iPe3njcpoJDXZPaJ0GdTG1E=;
        b=I88CnrE5yRXchyi3XLh5+F0E2HzIopAB3PfCt/keG798efbf5BY4jGP2J4OlYzIA1B
         prmv30wmLFyYamQob3zmPHthGDxPkUu4vXuBF+WEX2Ilwb60NzdgEkdEUYLpjoC/xUwh
         3SdWfFWGCsi3diZlM/JXnEX9IxI4dfZYi+rY8RkNCxCAzUJHh/FqDghNZqKtD3kxNptj
         kklfSPI2qOw3MFR3SpQj88ygpQihRu1zKDPmStVTWXkP6RAWh/Sw+QSU76G2MBdb2oMQ
         5XzaB28+LmvVp3E22D3wxugXBKJzaQ+dn0EAtv6tYT+y7TzmUY+kluuJ2TSAqwZSwtJ/
         Y4Dw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=bATeP5DP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j16si212610edj.357.2021.06.02.08.24.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 02 Jun 2021 08:24:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=bATeP5DP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:50042 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1loSj4-0005qG-34
	for alex.bennee@linaro.org; Wed, 02 Jun 2021 11:24:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45444)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1loSip-0005ni-Fz; Wed, 02 Jun 2021 11:23:55 -0400
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e]:39838)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1loSin-0002Un-SV; Wed, 02 Jun 2021 11:23:55 -0400
Received: by mail-ej1-x62e.google.com with SMTP id l1so4442492ejb.6;
 Wed, 02 Jun 2021 08:23:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=s5o686RmkEri2r7gf285iPe3njcpoJDXZPaJ0GdTG1E=;
 b=bATeP5DPp1nx6a7X3FhuRTzME1pvRGuSHPvRIAoZc9RgPDvM13ncMe7XlHCA2Ti/Aa
 nxlatgRL0GHGw+apu4ruszHQpH9s1j441kcNpyjcXxTlXha/PoElY7URm7+9+fJlHFH2
 v+slxAfNQ4cjZbWNN1yjl6KjzT5FqslCodEPVO8UD1tMRq7pqxscFlynUSWhMMCQTlcN
 j8+vMzhvStNO6OZ971A5qB29FNn9pLONo/ys59kaa1Q/WX49SlBKgVCVkObIuz+ETNHJ
 GtlgkRn1/E12vMfu/Lk8C6I4a0JipDOFQhAqkgeAVU73HZGuR4AvP4TpUr9oJUvCMhJx
 4foA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=s5o686RmkEri2r7gf285iPe3njcpoJDXZPaJ0GdTG1E=;
 b=nIDXltJQlBK6TKi4q6sUVtHl4RupdV5/hbmu8SUbW8UpckLSx6CEoQ8TRoww4nEaJ4
 sNpSYliJbLFxP/sRWs0nMNDWeylAUAVu3g5RbuuyQ18fHfUQ58x4husyd5EKHcJpOnSu
 uU2ANte9DePue5fm+ZJGD90MCnxRHDx80Ajcs7FTz1KZsHwLiB1X8C0aUlfltctNTV2o
 gOZ0cB6x2V0dhA+qgYuH4yWHi8cZyvbucjRCb/R0kRqXpZ6wWW2kJMpw8U563BgTorDU
 27q/A7uFje2H8zSdF1ScY/rL5LrO76Ize6RTU/A4B9g5pg7ep9XqXLsAEwub/ARHcics
 HcOA==
X-Gm-Message-State: AOAM532fpRqbfVbM5lTEsYd91QGABtj4bblj5qV+1MSJdVNBRxhDD3V8
 8Rt51O+wiWlByLAshmW5jbo=
X-Received: by 2002:a17:906:c791:: with SMTP id
 cw17mr19696555ejb.329.1622647431063; 
 Wed, 02 Jun 2021 08:23:51 -0700 (PDT)
Received: from [192.168.1.36] (235.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.235])
 by smtp.gmail.com with ESMTPSA id u15sm160029edy.29.2021.06.02.08.23.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Jun 2021 08:23:50 -0700 (PDT)
Subject: Re: [PATCH 1/2] hw/arm: add quanta-gbs-bmc machine
To: Patrick Venture <venture@google.com>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20210518194704.764241-1-venture@google.com>
 <20210518194704.764241-2-venture@google.com>
 <CAFEAcA-WMC4OkzkyvH-wabcLsjThjZikLMxO5O9ALGknoY3=jg@mail.gmail.com>
 <CAO=notx0WjBda6WeZmzqQG24yHuu8kQq4EZZQn=9mg67OOdW6w@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <7c3a9eb0-9b1b-b2c4-1701-ee573a07c7d6@amsat.org>
Date: Wed, 2 Jun 2021 17:23:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <CAO=notx0WjBda6WeZmzqQG24yHuu8kQq4EZZQn=9mg67OOdW6w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x62e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.613,
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
Cc: Havard Skinnemoen <hskinnemoen@google.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Hao Wu <wuhaotsh@google.com>,
 CS20 KFTing <kfting@nuvoton.com>, Brandon Kim <brandonkim@google.com>,
 qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 6OJoSO1PT8C8

On 6/2/21 4:41 PM, Patrick Venture wrote:
> On Thu, May 27, 2021 at 2:34 AM Peter Maydell <peter.maydell@linaro.org> wrote:
>>
>> On Tue, 18 May 2021 at 20:54, Patrick Venture <venture@google.com> wrote:
>>>
>>> Adds initial quanta-gbs-bmc machine support.
>>>
>>> Tested: Boots to userspace.
>>> Signed-off-by: Patrick Venture <venture@google.com>
>>> Reviewed-by: Brandon Kim <brandonkim@google.com>
>>> Reviewed-by: Hao Wu <wuhaotsh@google.com>
>>> ---
>>>  hw/arm/npcm7xx_boards.c | 33 +++++++++++++++++++++++++++++++++
>>>  1 file changed, 33 insertions(+)
>>>
>>> diff --git a/hw/arm/npcm7xx_boards.c b/hw/arm/npcm7xx_boards.c
>>> index d4553e3786..34a214fe79 100644
>>> --- a/hw/arm/npcm7xx_boards.c
>>> +++ b/hw/arm/npcm7xx_boards.c
>>> @@ -29,6 +29,7 @@
>>>
>>>  #define NPCM750_EVB_POWER_ON_STRAPS 0x00001ff7
>>>  #define QUANTA_GSJ_POWER_ON_STRAPS 0x00001fff
>>> +#define QUANTA_GBS_POWER_ON_STRAPS 0x000017ff /* TODO: Get real values. */
>>
>> Any chance you could fix this TODO ? If it's not fixed now before
>> the code goes in it seems unlikely that it'll ever be fixed -- you're
>> probably in the best position to know the right value...
> 
> I have an internal bug to find the "right" value and populate it,
> although it probably actually is that value.

Then simply remove the TODO comment and we are good :)
