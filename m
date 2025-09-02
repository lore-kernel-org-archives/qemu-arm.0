Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83ADBCA1005
	for <qemu-arm@archiver.kernel.org>; Tue,  2 Sep 2025 15:48:40 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1utTEx-0003xC-B4; Tue, 02 Sep 2025 11:48:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1utTEI-0003md-77
 for qemu-arm@nongnu.org; Tue, 02 Sep 2025 11:47:32 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1utTE9-0007oP-Vw
 for qemu-arm@nongnu.org; Tue, 02 Sep 2025 11:47:29 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-45b7da4101fso15881935e9.3
 for <qemu-arm@nongnu.org>; Tue, 02 Sep 2025 08:47:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1756828037; x=1757432837; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=sTM46ao6ynk4mSbGzM22Z5Hiz37rvdD+zVE6c1JwrVI=;
 b=qjzmi6f3Mnvf/YCjo7H2yMdZBEwDbqXvn28MBWNiQGUtkdDIH29ABg+sjI4msEeIdi
 fbxKTUGss+5WQtO68qy+YClDWPct6xdkex7mwy3T2qNduIJJoYG9CidJmiYNMP2CVEAv
 I0kiPrHgYZ6qhWEOzmSev7I3LWVH61HWgGG/CIc0/BnAoyjPz+rsb/cIr7SByfkjpxqU
 IyL0mog+uEzcZ+7Sw/QTw3BytROTxLI1XCyQcvCXSkvEyUli84NW4Zf2WxRShLHYqvkS
 AstNf+6pRXapuQWrS8U4BI6AfFcMTbUtpvZoxaNzq5bwmxUNw4ivxg4Mr1SABGWyjMnm
 GVng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756828037; x=1757432837;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=sTM46ao6ynk4mSbGzM22Z5Hiz37rvdD+zVE6c1JwrVI=;
 b=N6iWYmlusAd/BLwDA3y0q0l1XewtCOUB7OwNsGl+TSkslxGERb1PYmc2/1UNjlUKLH
 haQqwl07550YIhR862ySPGEOrIFXjKQRZeh2r1RiDba3x+q2NZNV8fpF8DvjiTs6aM8D
 w1OM0wTK7BDHJ7ZmPxoYcZmCN0bs6eozMDjxGDGi1YVax8l4KKSMYC/Joe80N3OORI7p
 w6EmkJrQlmra6Mjzj8a7Hd8fZv+u5vUQq7RFxp5pFTloZbgJ+m8hQ+8RG4wHukP24Bhd
 toIg3l6BTpUsiAbfYOFfXskLji9Sw6xpQKA9CIniMinMOuh6bPlV5tO0UdFHw6leOtRz
 BRbQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUWy2eCjigav8cKAXfEO6YayaizKeAUY5yyAu+tYAARn6F8tjHkMKabKSHEIL7IgjYIZDAEoZgLYw==@nongnu.org
X-Gm-Message-State: AOJu0Yzipd9QubRCMLIaQxHZX8buaOszxIQ9tKz0UOCEzDeGHYthLnQ0
 HP6+JWfchjm9FyOj7GOmYpWqvFXmLTvxOcC5CJ0zSZitShS57GxwuwCffONMqOVGYU2KvXr/srM
 aHVra
X-Gm-Gg: ASbGncsiJQTIjXzKVIY3TZHNe0Unkdxw5qbxLB0v6niOMav0kPOUQYDVuG9T6kJznQ1
 hjpl0qi5psXWV04RqYRaUwzc839r80Q6K5vm5/4ITnwLEzFBthqYR5RTYq/sbxhtIv43UYjk7yZ
 o/2IHsO1XLakLVqnnw3RACOr3GatJpvgg7qu3VhmfizWoAkKaYfj3Kv54eXd0P7AELuQ6yqFbp2
 savuFupsbZoyVlRe2lpyIo3T/AKfYr0a7jXqeOYLwBm6bNvFI1cI6y4hc7fHmPUalwT1LyxP3gH
 qfxgCK5YU5Z7ZXizJdEkTG6Ww+f5kHORwVhbeyQoSPUc6PBCVPQH88mF0gD8K3j9qbpDrfnIlDc
 TRVLVpfHvIslbjlSa00AQ49SThNK6pmv+DUv5TyRsVyj7t6NKTJ4RMkxxeG4F0+MWN9BvUuEOCT
 vytE6D4UuSTVg=
X-Google-Smtp-Source: AGHT+IEiGn6kmDkTczmbMQJK8cZf1NELKyUfElW722/KBkzM8eqqGmZK/g6b2FGBr7KeOY7jP4vsPA==
X-Received: by 2002:a05:600c:3111:b0:45b:8c5e:5f8 with SMTP id
 5b1f17b1804b1-45b8f43c876mr49451535e9.28.1756828037000; 
 Tue, 02 Sep 2025 08:47:17 -0700 (PDT)
Received: from [192.168.69.207] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45b990acebesm18531275e9.3.2025.09.02.08.47.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Sep 2025 08:47:16 -0700 (PDT)
Message-ID: <93f7b9d8-8849-4a0b-8f92-c5774c3cb586@linaro.org>
Date: Tue, 2 Sep 2025 17:47:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/8] hw/sd/sdcard: Fix size check for backing block
 image
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Jan Kiszka <jan.kiszka@siemens.com>, qemu-devel <qemu-devel@nongnu.org>
Cc: Bin Meng <bmeng.cn@gmail.com>, qemu-block@nongnu.org,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 qemu-arm <qemu-arm@nongnu.org>
References: <cover.1756706188.git.jan.kiszka@siemens.com>
 <86217712232abd5152e7dfa98111f57b9b78d83b.1756706188.git.jan.kiszka@siemens.com>
 <6289fe04-82be-4a34-9fed-b0cc08e3b8f0@linaro.org>
 <a9fdf524-0ca1-45db-be39-7bfccc468f0f@siemens.com>
 <84e1300b-aa1f-4fbc-809e-e1fe0e2c624e@kaod.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <84e1300b-aa1f-4fbc-809e-e1fe0e2c624e@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x331.google.com
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

On 2/9/25 17:43, Cédric Le Goater wrote:
> On 9/2/25 17:34, Jan Kiszka wrote:
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
> See this commit to know how it is constructed :
> 
>    https://gitlab.com/qemu-project/qemu/-/commit/c8cb19876d3e

Hmm now I remember. I wasn't enthusiastic about that approach and
suggested to use block drive for each partition, but it was not
well received as too complex on the command line.

