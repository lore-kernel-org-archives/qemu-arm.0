Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 622A6CA1005
	for <qemu-arm@archiver.kernel.org>; Tue,  2 Sep 2025 15:43:40 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1utTAJ-0000dK-By; Tue, 02 Sep 2025 11:43:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1utTA7-0000b9-67
 for qemu-arm@nongnu.org; Tue, 02 Sep 2025 11:43:12 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1utTA2-0006qi-7z
 for qemu-arm@nongnu.org; Tue, 02 Sep 2025 11:43:10 -0400
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-3dae49b1293so535477f8f.1
 for <qemu-arm@nongnu.org>; Tue, 02 Sep 2025 08:43:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1756827782; x=1757432582; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=SZEk4ilO5qotE2GtoIspKZt9DlOJZImaOJXhEQ91E5M=;
 b=LjgcICBn4yKOhmlu6xaUUg4agjmVPQfyfBmR57yqTT3z8EI9inrucqCid9fNC1TjZl
 9mclHo5VupzAXBEHMx6tWwTJfPQbyYQWkJtLxoK5n9Et0jXI7lSHZWrKFWw9TOyXt0wu
 /LtDUs9FizHojc3NzZEqQ2/46eG0bcbktR6LKnLtYv9orrYcf6UfK18JOiqfK7Sfp0IU
 Bu305jgzolHUXiSfglMT6lI2bObnkyw6ievEaLc6bU+t34jrOv3EcDKEJWYKOERk7eAp
 CJkRxahKHpholuHsrmclys9RpTJaG62H6Xr5+wDucPLIcU4IfZgmXBgNAAgkOlvcvINq
 E8Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756827782; x=1757432582;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=SZEk4ilO5qotE2GtoIspKZt9DlOJZImaOJXhEQ91E5M=;
 b=QrAspOL/XieCdPpffhkO9mdVzYpjTd7gSLOfFczexrgUAmOck4WZrCQJaDGooeKLIs
 V//GBHsMP0f5uW9q/qai2XkXtthD3wW3AbuNnMLDXDuT0XZYwprpheQFOYQhG6MttibN
 B7d5f8zWNG4PR3hKDJzSoPprOOh6RviAR7cAadxBRsVUIiVjiRP8s38KQR7lmKa81qlP
 2bAOSmTJZP8eebOzTEroMEC4q8Zq3spoIFyfSh/ju8klt4f74ogOmtsxZqP7OEK16jBm
 NDd7u6PBPvKZEKqWcVjvUmI82Sv/lnT5+T+Nlq4ptDhJsXrWlZP79TUijUJFnFioiCU8
 O/ZQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVUG3tMDs0+jku8p0DI70N4JUydz/GHTo4REquiSnhtkJZ9QVhELjcUhE7mSn+oTlO12s9A9iVUbQ==@nongnu.org
X-Gm-Message-State: AOJu0Yy2GgCdMey5u+1C0GPv6ibjuBNC3GHihUTJCrDpQfTs9vGy6u/1
 TrY1lNnGpi3qIhxAZzlSmdLQHNgzFbg4W4YG/q1Mh95C+/2/Szo+XYrWV6yLJzx1PUY=
X-Gm-Gg: ASbGncsZ5PNQynYyNNr3HoshoT2pa2ozDIKmgO1VweVI6+lX77wMIGEX9LX09ZqdQG+
 OeA618Tjy2pCSZaqHu3La9LLcuFls0nyXlYXvw4Db3Swez0tqW0Oua5Uz5qJxNOk3WZQuJMyKjG
 hUwS0XsDUEhItMpGx9v1i3UuWxy8ecE5C/LlzBXlAPnJTmNGXp/05cLnZxbtvDL7EIsnay0+BV1
 LFXyZd+h+2RZrJWrOslcBupf7zfwo2zh8r9oX71SCI6g8yOa08hSvfMCpfALZgdw3aBel0gDrAq
 Zx//ulWlmQq8+I9UQE9yNuQfgG0ZIxfnf2X1qvr68/Cyw7EzeLCA7o96lD2oG0zqjq6TKDoxPm6
 hkjtX0klnyUmgmiRtxAmhS838WhfHwe74c3bDoQVzLsW2vS9b6VaOg3Urm+vnnX2zBtoGadrId8
 1iIUkqsGMyb2k=
X-Google-Smtp-Source: AGHT+IEam3PC4AtHPgcfDNJ+IT5Ceqp+qSQYGaWo339w/39IsP7DZe9C9LEFSdGWdkVZskajE/TEtw==
X-Received: by 2002:a05:6000:3103:b0:3d8:22c4:1baa with SMTP id
 ffacd0b85a97d-3d822c425b2mr3625656f8f.37.1756827782177; 
 Tue, 02 Sep 2025 08:43:02 -0700 (PDT)
Received: from [192.168.69.207] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3cf33add504sm19883538f8f.30.2025.09.02.08.43.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Sep 2025 08:43:01 -0700 (PDT)
Message-ID: <11808e86-cee0-48bf-8fbd-de13a9a25ed0@linaro.org>
Date: Tue, 2 Sep 2025 17:43:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/8] hw/sd/sdcard: Fix size check for backing block
 image
To: Jan Kiszka <jan.kiszka@siemens.com>, qemu-devel <qemu-devel@nongnu.org>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Cc: Bin Meng <bmeng.cn@gmail.com>, qemu-block@nongnu.org,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 qemu-arm <qemu-arm@nongnu.org>
References: <cover.1756706188.git.jan.kiszka@siemens.com>
 <86217712232abd5152e7dfa98111f57b9b78d83b.1756706188.git.jan.kiszka@siemens.com>
 <6289fe04-82be-4a34-9fed-b0cc08e3b8f0@linaro.org>
 <a9fdf524-0ca1-45db-be39-7bfccc468f0f@siemens.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <a9fdf524-0ca1-45db-be39-7bfccc468f0f@siemens.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On 2/9/25 17:34, Jan Kiszka wrote:
> On 02.09.25 17:06, Philippe Mathieu-Daudé wrote:
>> On 1/9/25 07:56, Jan Kiszka wrote:
>>> From: Jan Kiszka <jan.kiszka@siemens.com>
>>>
>>> The power-of-2 rule applies to the user data area, not the complete
>>> block image. The latter can be concatenation of boot partition images
>>> and the user data.
>>>
>>> Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
>>> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>>> ---
>>>    hw/sd/sd.c | 2 +-
>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/hw/sd/sd.c b/hw/sd/sd.c
>>> index 8c290595f0..16aee210b4 100644
>>> --- a/hw/sd/sd.c
>>> +++ b/hw/sd/sd.c
>>> @@ -2789,7 +2789,7 @@ static void sd_realize(DeviceState *dev, Error
>>> **errp)
>>>                return;
>>>            }
>>>    -        blk_size = blk_getlength(sd->blk);
>>> +        blk_size = blk_getlength(sd->blk) - sd->boot_part_size * 2;
>>>            if (blk_size > 0 && !is_power_of_2(blk_size)) {
>>>                int64_t blk_size_aligned = pow2ceil(blk_size);
>>>                char *blk_size_str;
>>
>> This seems to break the tests/functional/arm/test_aspeed_rainier.py
>> test due to mmc-p10bmc-20240617.qcow2 size:
>>
>> Command: /builds/qemu-project/qemu/build/qemu-system-arm -display none -
>> vga none -chardev socket,id=mon,fd=5 -mon chardev=mon,mode=control -
>> machine rainier-bmc -chardev socket,id=console,fd=10 -serial
>> chardev:console -drive file=/builds/qemu-project/qemu/functional-cache/
>> download/
>> d523fb478d2b84d5adc5658d08502bc64b1486955683814f89c6137518acd90b,if=sd,id=sd2,index=2 -net nic -net user -snapshot
>> Output: qemu-system-arm: Invalid SD card size: 16 GiB
>> SD card size has to be a power of 2, e.g. 16 GiB.
>>
>> https://gitlab.com/qemu-project/qemu/-/jobs/11217561316
>>
> 
> Hmm, then the test was always wrong as well. I suspect the aspeed is
> enabling boot partitions by default, and the image was created to pass
> the wrong alignment check. Where / by whom is the image maintained?

Cédric Le Goater (Cc'ed).

The test comes from:
https://lore.kernel.org/qemu-devel/4d1777d6-0195-4ecb-a85f-09964268533d@kaod.org/

Maybe also relevant to your suspicion:
https://lore.kernel.org/qemu-devel/e401d119-402e-0edd-c2bf-28950ba48ccb@kaod.org/

