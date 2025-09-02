Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A018CA0FFE
	for <qemu-arm@archiver.kernel.org>; Tue,  2 Sep 2025 15:46:17 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1utTCh-0002Ip-Sw; Tue, 02 Sep 2025 11:45:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1utTCZ-0002Go-74
 for qemu-arm@nongnu.org; Tue, 02 Sep 2025 11:45:44 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1utTCT-0007Ik-91
 for qemu-arm@nongnu.org; Tue, 02 Sep 2025 11:45:42 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-45b79ec2fbeso37659295e9.3
 for <qemu-arm@nongnu.org>; Tue, 02 Sep 2025 08:45:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1756827931; x=1757432731; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
 :cc:subject:date:message-id:reply-to;
 bh=NPq4s1JeZK7RKse6LCL6VyNhppMu34Ld0R+zYTIxKZc=;
 b=FuF4ZBeeSX4r/9tC7toHEznyyHueyq73xRCGSDt4lJMfmeWYbIPy9vJ+lXrJn+wBqE
 4PkUU6yDFOHxdFz+NOS+noJ3QsITFbP51gny3oFruoA297vJEtu8sRZ1dAeabTfmA++8
 6uKTWIus7D2VlQWJNhXyFBYOutqaZusdKRHk+Vs6/gndkHDn1/MdSKh1UkM+8pU1go9X
 IIdu4yVok5vjfZ5qgHyGEV/PGcWvP5Uuc7DdNkpnJTyVgbEk6Aasv9Ut9Qv7Dpl9Nif9
 2U+ylCabGsvv0+DugnNHEupx8c4OYuz5W5Co++cNofdqwRWbr3gKvkbNBphn3w29sNr4
 Rnvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756827931; x=1757432731;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=NPq4s1JeZK7RKse6LCL6VyNhppMu34Ld0R+zYTIxKZc=;
 b=sIq1w15uRAnG0EXLQIuuOeoP1cJcgrJNwz9aAeCeOULau/qAYSbgoe+U7VbsHx89kH
 esg8R+WJ0SS7Icuaa43V7f3mjcRT2ADYAwKL42J1z4kwV9Z2QXNshZmm4Tz/vOemtrUL
 Y6oDJQ6PmTDxEgvAed7jY4cvfjfuva91D7taAP95hh4Ya1iC68xVekS7eed607ZKWy2U
 pxExfpLCzYp7V4fuRvBzVhxob1Q2tPSJEiNUPBjt18LTCnN/isBCPUTfQw9HyaTjaKhA
 GXuHaEC2+djEIUtoxhLNJZ2Ka2XBGsIvjKIClcbOa/o9KtZp5BSm47jb5lLtAQx3XGOC
 9NIg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX1ZCHU2Wr4SBePTcmWVO24D+3H3BvE7IC1beS8HEml4QsSqxE7rH3Oj8/FHTeo9mYz+hT2FqfU8A==@nongnu.org
X-Gm-Message-State: AOJu0Yxx8EQLjxwJjujfen+3bin828VBRo3GAX45GmbFUvflyKXFEOun
 Ui/z708oaHtV0xJXSujGwuTkjUXHorLdrvtnZhslQ9fxlg65NfaGEiI1SaivXth+WYw=
X-Gm-Gg: ASbGncvfl0+lCc+oxTwT9MoME1W0OY+7SFpStoetWNcOrOC8fK3T2P1GpT/BHIA7gwh
 jBUbFU7PjPkuBa0GnFFR6EP8dzOVi4vJKy10R9upSVtcCtZFp+OazHnq2gFl2uY1hV5ogT65q4q
 Uwl5Qphu8Zege4VbJFKZXdLS8dX3cgXXmMErWy4UpgXzMNZ9AmuBXteJa7RZ8OloskBP6uhg0JP
 3aOeHVDJnz0gq1+RLKSVmBgCFG+GEv91YPp3IHj/0EEVob9qT9ad2iJVlY+iqkSYgt70sdMaUMW
 3/52Be2H0S6wfkRwSsv6CDHhWqmrxoG05yPPqXaPPJyjY7i0lMgUZtjvc3cOcbhRF4y3kXkV+GI
 TL9agbhLQ72UBPpRaNeCkFJLEIA0cUOEQF7BrjT/FkCG978YKtrYUPYMxoRvpZ7efxID2X8aFAf
 5C
X-Google-Smtp-Source: AGHT+IFkkEhbew3x0u3l1jzxfPP6K774etlOytw7cEdczK3LtSG43KwenN2pjQ2UTtvsY5bBPG8KzQ==
X-Received: by 2002:a05:600c:a46:b0:458:be62:dcd3 with SMTP id
 5b1f17b1804b1-45b8558a78cmr113495305e9.17.1756827931202; 
 Tue, 02 Sep 2025 08:45:31 -0700 (PDT)
Received: from [192.168.69.207] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45b7df3ff72sm127685575e9.1.2025.09.02.08.45.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Sep 2025 08:45:30 -0700 (PDT)
Message-ID: <4c039b3c-dc2c-4478-b1bb-90b925e56245@linaro.org>
Date: Tue, 2 Sep 2025 17:45:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/8] hw/sd/sdcard: Fix size check for backing block
 image
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: Jan Kiszka <jan.kiszka@siemens.com>, qemu-devel <qemu-devel@nongnu.org>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 =?UTF-8?B?SmFuIEzDvGJiZSI=?= <jlu@pengutronix.de>
Cc: Bin Meng <bmeng.cn@gmail.com>, qemu-block@nongnu.org,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 qemu-arm <qemu-arm@nongnu.org>
References: <cover.1756706188.git.jan.kiszka@siemens.com>
 <86217712232abd5152e7dfa98111f57b9b78d83b.1756706188.git.jan.kiszka@siemens.com>
 <6289fe04-82be-4a34-9fed-b0cc08e3b8f0@linaro.org>
 <a9fdf524-0ca1-45db-be39-7bfccc468f0f@siemens.com>
 <11808e86-cee0-48bf-8fbd-de13a9a25ed0@linaro.org>
Content-Language: en-US
In-Reply-To: <11808e86-cee0-48bf-8fbd-de13a9a25ed0@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

On 2/9/25 17:43, Philippe Mathieu-Daudé wrote:
> On 2/9/25 17:34, Jan Kiszka wrote:
>> On 02.09.25 17:06, Philippe Mathieu-Daudé wrote:
>>> On 1/9/25 07:56, Jan Kiszka wrote:
>>>> From: Jan Kiszka <jan.kiszka@siemens.com>
>>>>
>>>> The power-of-2 rule applies to the user data area, not the complete
>>>> block image. The latter can be concatenation of boot partition images
>>>> and the user data.
>>>>
>>>> Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
>>>> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>>>> ---
>>>>    hw/sd/sd.c | 2 +-
>>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> diff --git a/hw/sd/sd.c b/hw/sd/sd.c
>>>> index 8c290595f0..16aee210b4 100644
>>>> --- a/hw/sd/sd.c
>>>> +++ b/hw/sd/sd.c
>>>> @@ -2789,7 +2789,7 @@ static void sd_realize(DeviceState *dev, Error
>>>> **errp)
>>>>                return;
>>>>            }
>>>>    -        blk_size = blk_getlength(sd->blk);
>>>> +        blk_size = blk_getlength(sd->blk) - sd->boot_part_size * 2;
>>>>            if (blk_size > 0 && !is_power_of_2(blk_size)) {
>>>>                int64_t blk_size_aligned = pow2ceil(blk_size);
>>>>                char *blk_size_str;
>>>
>>> This seems to break the tests/functional/arm/test_aspeed_rainier.py
>>> test due to mmc-p10bmc-20240617.qcow2 size:
>>>
>>> Command: /builds/qemu-project/qemu/build/qemu-system-arm -display none -
>>> vga none -chardev socket,id=mon,fd=5 -mon chardev=mon,mode=control -
>>> machine rainier-bmc -chardev socket,id=console,fd=10 -serial
>>> chardev:console -drive file=/builds/qemu-project/qemu/functional-cache/
>>> download/
>>> d523fb478d2b84d5adc5658d08502bc64b1486955683814f89c6137518acd90b,if=sd,id=sd2,index=2 -net nic -net user -snapshot
>>> Output: qemu-system-arm: Invalid SD card size: 16 GiB
>>> SD card size has to be a power of 2, e.g. 16 GiB.
>>>
>>> https://gitlab.com/qemu-project/qemu/-/jobs/11217561316
>>>
>>
>> Hmm, then the test was always wrong as well. I suspect the aspeed is
>> enabling boot partitions by default, and the image was created to pass
>> the wrong alignment check. Where / by whom is the image maintained?
> 
> Cédric Le Goater (Cc'ed).
> 
> The test comes from:
> https://lore.kernel.org/qemu-devel/4d1777d6-0195-4ecb- 
> a85f-09964268533d@kaod.org/
> 
> Maybe also relevant to your suspicion:
> https://lore.kernel.org/qemu-devel/e401d119-402e-0edd- 
> c2bf-28950ba48ccb@kaod.org/

Digging further:
https://lore.kernel.org/qemu-devel/9046a4327336d4425f1e7e7a973edef9e9948e80.camel@pengutronix.de/


