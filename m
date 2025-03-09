Received: by 2002:a17:505:8f44:b0:1be9:327d:8ee3 with SMTP id jy4csp622511njc;
        Sun, 9 Mar 2025 07:21:13 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWUVrDa/UX9OK4hG8F8vNhiE9VVqnqBfKYIc3NnIRV6Rn+EqC6Dm//9ge/hZc0uP6W8mssCY4QVd5P2GQ==@linaro.org
X-Google-Smtp-Source: AGHT+IE6TFM8qV+SSlQcY9rnv1ETxHsY3rpGxyPzVyDwmMDyd++zinKdKwuP8/WCMHVYSwlE0BAJ
X-Received: by 2002:a05:622a:199e:b0:476:86bc:8b41 with SMTP id d75a77b69052e-47686bc8e7emr14217311cf.52.1741530073429;
        Sun, 09 Mar 2025 07:21:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1741530073; cv=none;
        d=google.com; s=arc-20240605;
        b=BOz7uoz2JunnxBAbRSaFBa/tATO+yyk5CBb1BN4UcNT4HghYYhOiyDGgpOsJddJCa3
         75drE/kWd+0lJrCZFR606M+NPPRDRX/2TbYqr0woHzWbxfPfr5PqXq+B8dSvgqpUTONw
         IOAjSLUbcQFKY1zdgekEwYib3sP+Jo1IzwzBNFOC6jrR26lAWwlAiJ4C6In/oJzsqVFn
         /V7XTz3P/k/EpC+KiyGZYCslYuvdPoQXWfulikP1oWnB9XpTBnrS1+FAEa35ofz4ag0q
         V/autfMTLEm7qPo57dV4aAzAYDyxE9va3C+PiRWvFEcp2zI3QUeZ5nTZ+BeiUYCPSJd5
         4P3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=3D+54oeVa7Fu6Truwxl080HVFieDV+B30R54rKr/+W4=;
        fh=5gHzqdwjri3xWn6PUmKo6yT4i24kOuT/zHBCSejBx+0=;
        b=eBJiQCdRTjI6a6PtxG9NiGPN+d0norj5pIKqp+wxPHGMY9w7TMde69CY7WjKsHpQJS
         g7+ExTPickj3lvST8ENofK5mhDsslvTn0iyIpfe7955csy8ABK5+EKtcJx6xuhT7RGF1
         TIYNcIZ3rjVO0Q6+BeFWQ4FmOnykslrb0+oZ/Ay6JIgAKvBx6s84dg25y+cd3+8Oo3MS
         3PcAYx2hAt5t4FL4FlOUgqFO0rspxqHLio/yjGqZFM3ZWxuSXcuQaXNncMYXmMgvYbVN
         qR+30S5mfZtGJaWNXrh+oij0PQGqXmiwW0XlVwEEyAiZESsxMb+DAcv9nbctD5Szbgqo
         v/+A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=a9Yz3cy4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4768a0aa6d0si1496511cf.438.2025.03.09.07.21.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 09 Mar 2025 07:21:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=a9Yz3cy4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1trHWB-0002lx-JP; Sun, 09 Mar 2025 10:20:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1trHW9-0002kD-2R
 for qemu-arm@nongnu.org; Sun, 09 Mar 2025 10:20:37 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1trHW6-0002bN-Dm
 for qemu-arm@nongnu.org; Sun, 09 Mar 2025 10:20:36 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-43cebe06e9eso4664635e9.3
 for <qemu-arm@nongnu.org>; Sun, 09 Mar 2025 07:20:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741530032; x=1742134832; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=3D+54oeVa7Fu6Truwxl080HVFieDV+B30R54rKr/+W4=;
 b=a9Yz3cy4yZ902pGjaiITV2icFnbS/CMgzU9q9eVnCfueyqXypGN8L2jJfCQ9vTSjOT
 U9YH6lm8iQ1cRxwRoUFhBNmj521rikksggwSam/VeR8DZs7yps/2uAONv7qnRCaCBSu2
 6S3upfjbVOkuyRZ4UbBQjlEVDBJThoDOMWYqfblv3YsMbblcKJisNdTyTFtyqV1M7qgE
 ebuq8JRNNbjHaERoOCXfmR03hdCwgD74d924kJrR2JvfOh4Q9zNwG4BXAVYSv6wtuqzu
 YnO5M0H+mr9oPuH7QDBp17ZO1DHHLuTU2EXo4Ybdt+ydKMOQjPjn8aOf9FbU0mDyMoQm
 yd6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741530032; x=1742134832;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3D+54oeVa7Fu6Truwxl080HVFieDV+B30R54rKr/+W4=;
 b=w0WsNm1K7CoXsrt2IQE2CfT/kggPDCYCXYodxoMHC4jDCdYgNaF9RtcNI8efVvSzeo
 19VNaI7b5B2tRQEFup9x5N3lOOXF/SthiWQgiLRGCGib8OGqxErKipEiHRj1Sx5vmuOu
 syhjZgpbwFk7P1qzCeDWMqYVWPrO/6CsTs49xDo5xRZ7jDxibZ5X2BtM0/j4/HkXc02s
 VU4wj0CBXC0OOp3qsQEpwlihj+RNOi8mgfpCzMnxQafHpz3Wi5TcSlQ5EIQNCT8kWHjt
 hplBRa71HsOU6AMj/tkCYSu17W8sC5VjpCmVOlpS3bWdC3xCJ6o9JAZEKW9UM0sqqO7W
 EhDQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWJAN0wbd541t+4F8LOLtkPHQ3+LJCpROwEupnekb/2v9CAJgeixW01ZOXS++geaT2rt6rp2TTc3A==@nongnu.org
X-Gm-Message-State: AOJu0YyzKl/p1QVoW4esPjOffP/0agx2WManceTtEqyffu1el02/dDm0
 9i5FfBLfn0sNGld5OGePyPsvYrbu0D+seWW5Y7IcL6MtzgriDNAFNZm/7XMp+LI=
X-Gm-Gg: ASbGncun+cgzslRs9t9E8uiitso9SZcznbseXaZDz4jTCUeUzxhvbdR4F4aPX8HsKJb
 LMUHpl7IZdCcqV4G+md2wJcInNroklpB+PZY+lqhWwUxiAxn85IRTzvmedVHxpQfeQg11cz88AV
 qMLoixoBW/sgIt+LUKP749RWXZP21otyLr8MTeCFcMAc15X/ExnDpOfp5vEb31+jCz6VTovFgwZ
 tevSPwyfKSt9K3gHEy/8FMhgUX7eF1jZNBJVo/Yc2qBIRjWVKTonRftUBpShAfCoUJ1IfELtX4A
 vJi15d1puqn7vxfeyfxw9OSa1rOMqBtp+BXrGcpjjsbIh13LfyTqovj0+LAGjOtpYC9eBE6E0rC
 28ZyiC/iNhZQa
X-Received: by 2002:a05:6000:1fab:b0:390:f476:81c3 with SMTP id
 ffacd0b85a97d-39132d51364mr5599054f8f.20.1741530032141; 
 Sun, 09 Mar 2025 07:20:32 -0700 (PDT)
Received: from [192.168.69.199] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43cf1b36d14sm22790515e9.37.2025.03.09.07.20.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 09 Mar 2025 07:20:31 -0700 (PDT)
Message-ID: <33b01373-6046-4b96-9407-66966c5b7f36@linaro.org>
Date: Sun, 9 Mar 2025 15:20:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 03/14] hw/sd/sdhci: Introduce SDHCIClass stub
To: BALATON Zoltan <balaton@eik.bme.hu>
Cc: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org, Eduardo Habkost <eduardo@habkost.net>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Andrey Smirnov <andrew.smirnov@gmail.com>,
 Bernhard Beschow <shentey@gmail.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Guenter Roeck <linux@roeck-us.net>, qemu-block@nongnu.org,
 Bin Meng <bmeng.cn@gmail.com>, qemu-arm@nongnu.org
References: <20250308213640.13138-1-philmd@linaro.org>
 <20250308213640.13138-4-philmd@linaro.org>
 <1839f9de-2370-50bd-7003-ade92707f137@eik.bme.hu>
 <142807a2-9536-4483-80ab-5f24793c841f@linaro.org>
 <670a5a3c-3476-5b8d-775a-ebff83acc33d@eik.bme.hu>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <670a5a3c-3476-5b8d-775a-ebff83acc33d@eik.bme.hu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32d.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: KDmnTzPXe5TK

On 9/3/25 01:08, BALATON Zoltan wrote:
> On Sun, 9 Mar 2025, Philippe Mathieu-Daudé wrote:
>> On 8/3/25 23:34, BALATON Zoltan wrote:
>>> On Sat, 8 Mar 2025, Philippe Mathieu-Daudé wrote:
>>>> TYPE_SYSBUS_SDHCI is a bit odd because it uses an union
>>>> to work with both SysBus / PCI parent. As this is not a
>>>> normal use, introduce SDHCIClass in its own commit.
>>>>
>>>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>>>> ---
>>>> include/hw/sd/sdhci.h | 9 +++++++++
>>>> hw/sd/sdhci.c         | 1 +
>>>> 2 files changed, 10 insertions(+)
>>>>
>>>> diff --git a/include/hw/sd/sdhci.h b/include/hw/sd/sdhci.h
>>>> index 48247e9a20f..c4b20db3877 100644
>>>> --- a/include/hw/sd/sdhci.h
>>>> +++ b/include/hw/sd/sdhci.h
>>>> @@ -107,6 +107,13 @@ struct SDHCIState {
>>>> };
>>>> typedef struct SDHCIState SDHCIState;
>>>>
>>>> +typedef struct SDHCIClass {
>>>> +    union {
>>>> +        PCIDeviceClass pci_parent_class;
>>>> +        SysBusDeviceClass sbd_parent_class;
>>>> +    };
>>>> +} SDHCIClass;
>>>> +
>>>> /*
>>>>  * Controller does not provide transfer-complete interrupt when not
>>>>  * busy.
>>>> @@ -123,6 +130,8 @@ DECLARE_INSTANCE_CHECKER(SDHCIState, PCI_SDHCI,
>>>> #define TYPE_SYSBUS_SDHCI "generic-sdhci"
>>>> DECLARE_INSTANCE_CHECKER(SDHCIState, SYSBUS_SDHCI,
>>>>                          TYPE_SYSBUS_SDHCI)
>>>> +DECLARE_CLASS_CHECKERS(SDHCIClass, SYSBUS_SDHCI,
>>>> +                       TYPE_SYSBUS_SDHCI)
>>>
>>> Are these two together just OBJECT_DECLARE_TYPE? Then the above 
>>> typedefs are also not needed just the struct definitions.
>>
>> I'd like to but it isn't possible because the same object state/class is
>> used by distinct types (PCI & SysBus).
>>
>> The following (expected to be correct) change ...:
>> -- >8 --
>> diff --git a/include/hw/sd/sdhci.h b/include/hw/sd/sdhci.h
>> index 966a1751f50..341b130995b 100644
>> --- a/include/hw/sd/sdhci.h
>> +++ b/include/hw/sd/sdhci.h
>> @@ -155,10 +155,6 @@ typedef struct SDHCIClass {
>> #define TYPE_PCI_SDHCI "sdhci-pci"
>> -DECLARE_INSTANCE_CHECKER(SDHCIState, PCI_SDHCI,
>> -                         TYPE_PCI_SDHCI)
>> +OBJECT_DECLARE_TYPE(SDHCIState, SDHCIClass, PCI_SDHCI)
> 
> It would be same as the original patch if you omit this one and only use 
> OBJECT_DECLARE_TYPE below.

Indeed that works. Kind of a kludge. Not worth than what we have, so
I'll take it.

> You didn't add CLASS_CHECKER to the PCI 
> version in the original patch either. But I see now it's more complex 
> and so maybe it's not so easy.

Yeah, I'll postpone the QOM parentship cleanup for later.

> 
>> #define TYPE_SYSBUS_SDHCI "generic-sdhci"
>> -DECLARE_INSTANCE_CHECKER(SDHCIState, SYSBUS_SDHCI,
>> -                         TYPE_SYSBUS_SDHCI)
>> -DECLARE_CLASS_CHECKERS(SDHCIClass, SYSBUS_SDHCI,
>> -                       TYPE_SYSBUS_SDHCI)
>> +OBJECT_DECLARE_TYPE(SDHCIState, SDHCIClass, SYSBUS_SDHCI)
>> ---
> 
> [...]
> 
>> Meanwhile the current legacy macros seems good enough for soft freeze ;)
> 
> Good enough for me. I was also happy with my way simpler solution. This 
> is much more clean up already.
> 
> Regards,
> BALATON Zoltan

