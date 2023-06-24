Received: by 2002:a17:906:9417:b0:98e:baa:bd63 with SMTP id q23csp141234ejx;
        Sat, 24 Jun 2023 08:03:19 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7q3jccuLr3VWSqe+NRwjyHLFxSBCz5CmHjXYlN67YVWNT5qrmvDSTqA7HIQjbgGTeW1azZ
X-Received: by 2002:ac8:5dd0:0:b0:3f5:2d80:e5f0 with SMTP id e16-20020ac85dd0000000b003f52d80e5f0mr31568742qtx.40.1687618999104;
        Sat, 24 Jun 2023 08:03:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1687618999; cv=none;
        d=google.com; s=arc-20160816;
        b=ppZYSg6cFREYQzaUSfvyY5ylHMFkkHarp795cgvq2hLCZnjjDc4VD/mvrlbgk2HuVt
         zRz0CPWlWU2a/ncg/v2mCSN73mR49QH5SXrKqw5pg5NKwNmreLIKNr8qCLXYsmhRMn6p
         kf9ZrDt8GuJ54+d5oVbvXcv5Ybs1XZpkVrD7dagsIM4pXK7h0c6c6vs04RNZ5dUu1FrS
         DWqIVGDm2IXxP0gdM3M6SKuZXlyR0N9AUNOcGdow+K4refSSD+gb6K3dG+UA1hcUv1Cg
         ZYs0CNPhggcsxJG4bdQ6rwwv76spt0buWq+EiYdTGGXvySu7vudKvVhuMXcvjy2faTp9
         LbtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:subject:references:cc:to:from:content-language
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=VZw66G+utFzuXbKZe+w8JCQp9fe9F+d4KzQZEThpcqk=;
        fh=D0RQy0l7Idumr7zkt8R1amhp1N8s7gc0x6zl3UJXla4=;
        b=eBi0RdGrLNzVkVKcF0gzV6NffqhyHeoXhNeMmIRUd7d3ywyXw82lY+q5KAzNk0DQol
         oOY2Gi8bOWvBKB1/YEpUvqZ2YNoSGlGaREb8W8wWmH15kwJeQUWsdLvwpjqzdF6xI1st
         toRBZEvHq7p85usTsrCotGwbYHjyWh/zgSe6DKaLEts2WSoTCCqlaX47WC9dHdLH4CIl
         FO/99oW/tUrABop9NURcY7xvetW5OzjuoT+5nmeu0nTOXSUoGldwAjCovOYzAh8o69rl
         dTmez4ErYe0rnDKEIOB1QXvx0ugvf18MG+b0hJ6u3DZzesvQFQRJ/SeOA/M23qQV0Rhx
         0bTA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20221208 header.b=LkxwoLiB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e21-20020a05622a111500b003f86397ddb5si531052qty.90.2023.06.24.08.03.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 24 Jun 2023 08:03:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20221208 header.b=LkxwoLiB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qD4mG-0005SQ-BE; Sat, 24 Jun 2023 11:02:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groeck7@gmail.com>)
 id 1qD4mB-0005Qe-GU; Sat, 24 Jun 2023 11:02:14 -0400
Received: from mail-ot1-x32a.google.com ([2607:f8b0:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <groeck7@gmail.com>)
 id 1qD4m9-0003Yo-FG; Sat, 24 Jun 2023 11:02:11 -0400
Received: by mail-ot1-x32a.google.com with SMTP id
 46e09a7af769-6b5d3df92f1so1510157a34.3; 
 Sat, 24 Jun 2023 08:02:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1687618927; x=1690210927;
 h=content-transfer-encoding:in-reply-to:subject:references:cc:to:from
 :content-language:user-agent:mime-version:date:message-id:sender
 :from:to:cc:subject:date:message-id:reply-to;
 bh=VZw66G+utFzuXbKZe+w8JCQp9fe9F+d4KzQZEThpcqk=;
 b=LkxwoLiB1phbOpqL1cIKtxW8a+6uxpaWWy8BUQLH6Gr7K6ckQSB/u5Jv8ItI/M/LIv
 8GHLKYd80dmR4Vtie9xvdkOR1vwDnKN/sGMn+zczN2lujvpRTPF30koMpohP59oefEm6
 LUAUGafqw/B9bPuoyF5COCjCg4tygNRKqLTv7He4fHzCEGPihuJIxufmOOE7QvHCZNPE
 SyB4q06uGdNkCuLHMfmzbIJzyKLfVKCX1wyqkExPjLAyqIzNCcM48tIatvveeTG7Krtl
 nY1aAZCWPu8/hLTpn/wfOKypjrCPeE+5lMerjTOUYt9TW9fF3LXyMTzNHxgRXm0LZI2p
 HufA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687618927; x=1690210927;
 h=content-transfer-encoding:in-reply-to:subject:references:cc:to:from
 :content-language:user-agent:mime-version:date:message-id:sender
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=VZw66G+utFzuXbKZe+w8JCQp9fe9F+d4KzQZEThpcqk=;
 b=W/JzNTXZv/xifCtad2cuXno46s/JtgTpirP5pmrupDlrKV+YIWlGN7krk/OkA340Kn
 aLtUsTlpYu+qwd3fIciZ6I5qVn7vd8x4pF50FmOOPgnncXHvMl5wmYgPpKFnI/W4qYoo
 NfrxRdS+iXSyqkUlBw8wDf7I2bSLGk8plLZlgroe3SUs+6oa0Sy1tDlvsvWiA4HVOXmP
 OxTnKCtdJOrS2ckN6/DkliyhNiV2KB0NIxYSVtqpMDFbcbtWAPvug78FXVmCEXC3NIsu
 eeuaY2iZaan0wT6JJpcSm5v85esBXtliboNx6hhBGfBhfQBagZgjVeXveX7RSUqXWeuv
 jIaA==
X-Gm-Message-State: AC+VfDwKXD/Pry7zt6YOEXeQ/RCvjO6lY/Aaaq6/rxlOl/BA9cZlXRpf
 SC65CwE8Uhh0fKxEHjkmFYM=
X-Received: by 2002:aca:1c16:0:b0:3a0:5484:2b84 with SMTP id
 c22-20020aca1c16000000b003a054842b84mr9335348oic.52.1687618927570; 
 Sat, 24 Jun 2023 08:02:07 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c?
 ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 21-20020a17090a01d500b0025e2358f146sm3182262pjd.13.2023.06.24.08.02.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 24 Jun 2023 08:02:06 -0700 (PDT)
Message-ID: <01087628-44c0-2b15-61bc-8677b7d1b459@roeck-us.net>
Date: Sat, 24 Jun 2023 08:02:04 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qianfanguijin@163.com, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>,
 Beniamino Galvani <b.galvani@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Niek Linnenbank <nieklinnenbank@gmail.com>
References: <20230523100508.32564-1-qianfanguijin@163.com>
 <20230523100508.32564-2-qianfanguijin@163.com>
 <41e71eae-72ad-410d-9cd8-cc495c06dac4@roeck-us.net>
 <CAFEAcA8aEQWAap36CtHMrEkFQUPnDCH7=-X5+TE2GJ-qzm3Y9w@mail.gmail.com>
 <2044dc69-93de-d855-fe44-ee6f3ab3576b@roeck-us.net>
 <CAFEAcA8vtJNwbxBreDMFB6q-Z=G5FiOcWzAAz+F69A4-Er_4EA@mail.gmail.com>
 <a51c71c5-4c5e-8723-76f1-2cc9410f601b@roeck-us.net>
Subject: Re: [PATCH v5 01/11] hw: arm: Add bananapi M2-Ultra and allwinner-r40
 support
In-Reply-To: <a51c71c5-4c5e-8723-76f1-2cc9410f601b@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32a;
 envelope-from=groeck7@gmail.com; helo=mail-ot1-x32a.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_ENVFROM_END_DIGIT=0.25,
 FREEMAIL_FORGED_FROMDOMAIN=0.25, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.09,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-TUID: AXWmGbM1gt09

On 6/24/23 07:23, Guenter Roeck wrote:
> On 6/24/23 03:40, Peter Maydell wrote:
>> On Fri, 23 Jun 2023 at 20:33, Guenter Roeck <linux@roeck-us.net> wrote:
>>>
>>> On 6/23/23 10:44, Peter Maydell wrote:
>>>> On Sat, 17 Jun 2023 at 17:29, Guenter Roeck <linux@roeck-us.net> wrote:
>>>>>
>>>>> Hi,
>>>>>
>>>>> On Tue, May 23, 2023 at 06:04:58PM +0800, qianfanguijin@163.com wrote:
>>>>>> From: qianfan Zhao <qianfanguijin@163.com>
>>>>>>
>>>>>> Allwinner R40 (sun8i) SoC features a Quad-Core Cortex-A7 ARM CPU,
>>>>>> and a Mali400 MP2 GPU from ARM. It's also known as the Allwinner T3
>>>>>> for In-Car Entertainment usage, A40i and A40pro are variants that
>>>>>> differ in applicable temperatures range (industrial and military).
>>>>>>
>>>>>> Signed-off-by: qianfan Zhao <qianfanguijin@163.com>
>>>>>> Reviewed-by: Niek Linnenbank <nieklinnenbank@gmail.com>
>>>>>
>>>>> I tried this in mainline linux with the following command.
>>>>>
>>>>> qemu-system-arm -M bpim2u \
>>>>>           -kernel arch/arm/boot/zImage -no-reboot \
>>>>>           -snapshot -drive file=rootfs-armv7a.ext2,format=raw,if=sd \
>>>>>           -nic user \
>>>>>           --append "root=/dev/mmcblk0 rootwait console=ttyS0,115200" \
>>>>>           -dtb arch/arm/boot/dts/sun8i-r40-bananapi-m2-ultra.dtb \
>>>>>           -nographic -monitor null -serial stdio
>>>>>
>>>>> Main problem is that the SD card gets instantiated randomly to
>>>>> mmc0, mmc1, or mmc2, making it all but impossible to specify a
>>>>> root file system device. The non-instantiated cards are always
>>>>> reported as non-removable, including mmc0. Example:
>>>>>
>>>>> mmc0: Failed to initialize a non-removable card
>>>>
>>>> Do you mean that QEMU randomly connects the SD card to
>>>> a different MMC controller each time, or that Linux is
>>>> randomly assigning mmc0 to a different MMC controller each
>>>> time ?
>>>>
>>>
>>> Good question. Given the workaround (fix ?) I suggested is
>>> in the devicetree file, I would assume it is the latter. I suspect
>>> that Linux assigns drive names based on hardware detection order,
>>> and that this is not deterministic for some reason. It is odd
>>> because I have never experienced that with any other emulation.
>>
>> Yeah, I don't really understand why it would be non-deterministic.
>> But it does make it sound like the right thing is for the
>> device tree file to explicitly say which MMC controller is
>> which -- presumably you might get unlucky with the timing
>> on real hardware too.
>>
> 
> Agreed, only someone with real hardware would have to confirm
> that this is the case.
> 

Actually, the reason is quite simple. In the Linux kernel:

static struct platform_driver sunxi_mmc_driver = {
         .driver = {
                 .name   = "sunxi-mmc",
                 .probe_type = PROBE_PREFER_ASYNCHRONOUS,
                               ^^^^^^^^^^^^^^^^^^^^^^^^^
                 .of_match_table = sunxi_mmc_of_match,
                 .pm = &sunxi_mmc_pm_ops,
         },
         .probe          = sunxi_mmc_probe,
         .remove         = sunxi_mmc_remove,
};

All mmc devices instantiate at the same time, thus the
device name association is random. If I drop the probe_type
assignment, it becomes deterministic.

On top of that, Linux does know which drives are removable
from the devicetree file. However, since probe order is
random, the assignment of the one removable drive to device
names is random. Sometimes mmc0 shows up as removable,
sometimes it is mmc1 or mmc2.

So my conclusion is that qemu isn't doing anything wrong,
it is all happening in the Linux kernel.

Thanks, and sorry for the noise.

Guenter

