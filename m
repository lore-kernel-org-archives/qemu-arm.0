Received: by 2002:a17:504:240b:b0:1be9:327d:8ee3 with SMTP id v11csp100825njc;
        Wed, 12 Feb 2025 10:18:04 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWIyJ0nLTEHDEuI06Mkpdm7mGEohxah1KIk4ExfpEwA9ix7k08b7EhWm5BJFdBRKCf7F7HaUm0x78pZCQ==@linaro.org
X-Google-Smtp-Source: AGHT+IEgRc5DYh1Lm1Yx3rJ8UFmW1ED4Pt1BTLMug0L83mt1w1+7uZiN9HX6Imf/QGPv7NbtmKw4
X-Received: by 2002:a05:6102:b07:b0:4bb:d962:61f with SMTP id ada2fe7eead31-4bc037e74acmr901167137.24.1739384284385;
        Wed, 12 Feb 2025 10:18:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1739384284; cv=none;
        d=google.com; s=arc-20240605;
        b=VFNT10VO0cD3EqX2tUKHJu5jNoKA8lT2e5FHO+6UegY95Ygt/GP8uJr6GzzjDwMNBt
         mMGzsNj8U9hXmWD8K701E4Jge7jK13nGAiDwOT+CigCDMAva8rp08T8MRe1GWLz20wtz
         3Q6WRBF5RWOB1hkwQSrFVSdE4NJHAqJch56TiRJ8R8DN4QvhFTEKNFkkC+qVtzF8LctG
         urbk96q5tpO67XnjcTKPqKCj2WWrz78jqOXXmpaXZBYiJ7Xcyoj6u4e9AGTdx58xbO68
         2aEM0aZdhCogJVdWH3Se4GV6JzLoIS6/xjdy4ZRvAmNOJWXtNbDKta7ljmOhxujup0r1
         P3kA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=8Ea/unt4MhP0f/terIThLxNfYeVG+ijIsONPszpxo8g=;
        fh=l8cbhJktKl+7DF0nlqVogYe4xq4+r2oX/kSwK2F+bUg=;
        b=DaYE3Wi2iXHFreTpFi0IoF+/d1zaTocfvpRzv3ODn4EmTjyoRKdQUaNRTZJ1gwUePH
         ZOPZbt/LFo5uhzoEAbpr+z+NW4T11pgvBjE/129swkmLkL4lL9cUX/y9kYp6/rLiq7Op
         4/UtT0F9/4Ksq8/sE1AdR/JiQswx82Sdog2wixiLPSt9n4O8m631suNZgRKupxoHpspJ
         isgsCjdoTqC3iK54ai37h81F4UbeDTWUJbHvrtb+0tUJoBllQ4WQ9YgQXv9ogj8C9uEC
         0ZcxEEDKkWy+1vIJdj65/ThPZGTCmLyw4IL9jHpZVUZIEn3Ek+T/nPXk7mBEg9L6M3ag
         hKAw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=AUdbiubX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-4bbd99d355bsi1411396137.29.2025.02.12.10.18.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 12 Feb 2025 10:18:04 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=AUdbiubX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tiHIv-0007Wc-G2; Wed, 12 Feb 2025 13:17:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tiHIt-0007WI-I2
 for qemu-arm@nongnu.org; Wed, 12 Feb 2025 13:17:43 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tiHIo-0004JF-OM
 for qemu-arm@nongnu.org; Wed, 12 Feb 2025 13:17:43 -0500
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-43957634473so524745e9.0
 for <qemu-arm@nongnu.org>; Wed, 12 Feb 2025 10:17:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739384257; x=1739989057; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=8Ea/unt4MhP0f/terIThLxNfYeVG+ijIsONPszpxo8g=;
 b=AUdbiubXbPyEcboVM+q+q5Dsi8v3ISTYnpqnb3yEznC5hWlzQlgZyomiyBD6ow69p7
 Ylt9/d5r4p3PweqSoAVo7RyMsnB4PrfdGqzGaZy1OBeAidEUKNWAxAhXMKXWIaeocvmv
 f4uQN+j2RkakwJpSqw/y/CZyINgNrq5VvAYUGI4KP/chK/7TpmZuwxvcM622ov8TcNgp
 ixQkiljZSOBOPvCZOm6FMuErYWPwBOA6YWxFDoiitYFpSMOlZPxKuaSHdC975P3hsV4B
 GnJBTzh6I+HNsCxkgoXYlX+wuuQUlZYaiXoHqoPO/3cEFVgcy9xD+D7TH67NJ2RFFVYz
 pHkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739384257; x=1739989057;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8Ea/unt4MhP0f/terIThLxNfYeVG+ijIsONPszpxo8g=;
 b=ffITyqs5zoSagLLQVwf+EbbEP27MHJeMlM+EI+FkmaU0Vnch5KS8/kttp6kTUj3b7F
 WUMLqu1mI8OSF63x1w9vSPYiWN/Fwi5QFldzR47XI01Apo1asQeb78gH4itfXyRCnwME
 2tyv4P4QfUC2iGJVbY+MgGa9ptffWFVwqyZ11v06cQj5c/57YtLBqKR5D5BWkGMQMmST
 UfV/AXJEce7B52bNWG9TKvRfx1hVgYtoWv9RL+IY7sKvtbJ/OtA/PJkvZeCJw6ggX7oW
 YnZPoJxOX1FNGzpF0XyDwRQCLw3wjiwcX2BtuYmrMQgSGIS91F1wnPKEm70Dd8rG2RNi
 gUpA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX5aa0WaYm8Qg7zEbtWjJGYxe+lOJ71CS/H/CR8P3Nc6lcI35fk76Ax0qY8J4xEutuRPqwfrToN6A==@nongnu.org
X-Gm-Message-State: AOJu0Yz6MAnCnZ68AtlAtzVsQ65eNCWYCGWy3tUrudA2XriOYCtwkrHX
 jQwkqnkC704kcu0LNgJXn5q+W3AJrz3B+OGAkjHyMVmIC1HW4KZnzGYnSgeQDII=
X-Gm-Gg: ASbGncvTzlqMvZ8c6yUp0PmuvZ7srMvaNXFUPgjNfp1sBSna4MDpgE8WVuD29LyuQAK
 8LzFvVuB8K8s9LvvpVtIPRrf3J400fV9cCN9OZ+bX2IBH2RXuapOMLVml3yW9Q+ol1hnT3Jbuiq
 V2GKRZekn/s71r5HELN4jZN8uP7DOag03qzUGPhnEPObWJL3VO+lqIOsedjUPDTQfZAPxUQclD+
 J/0KdV6PZogxtMMRGIGPGzozdnmwUH5H73IEbV2brtYrvdtbGvG1Ro3UFLDfEOR+ya5yGFtDHz7
 PlDEO0wsQThYsk/dMj0Su/QuSJ5grh/Hg6dz/jZIBRGtFvkNOX5xktPHfUtbscao
X-Received: by 2002:a5d:5f51:0:b0:38d:d969:39c1 with SMTP id
 ffacd0b85a97d-38dea25279bmr3560595f8f.5.1739384256931; 
 Wed, 12 Feb 2025 10:17:36 -0800 (PST)
Received: from [192.168.69.196] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38f227325bcsm980168f8f.50.2025.02.12.10.17.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Feb 2025 10:17:35 -0800 (PST)
Message-ID: <672045c1-9b09-4b7b-9bed-fa990129ce2c@linaro.org>
Date: Wed, 12 Feb 2025 19:17:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 01/11] hw/qdev-properties-system: Introduce EndianMode
 QAPI enum
To: BALATON Zoltan <balaton@eik.bme.hu>
Cc: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org, qemu-ppc@nongnu.org,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, qemu-arm@nongnu.org,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
References: <20250212112413.37553-1-philmd@linaro.org>
 <20250212112413.37553-2-philmd@linaro.org>
 <cb828dd8-25f6-47c6-9ac7-cae5b0d0932e@redhat.com>
 <50ba4e4b-4124-46bb-bb84-4758ce9c5e66@linaro.org>
 <3b3baed4-0d79-3a28-40cd-e1835e078863@eik.bme.hu>
 <6e707c7f-b94c-47ef-83ab-795605e27963@linaro.org>
 <a3608e43-79ce-403d-8ba7-6735fde66759@linaro.org>
 <e1436061-a840-0942-2c2c-4f49bfb932b8@eik.bme.hu>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <e1436061-a840-0942-2c2c-4f49bfb932b8@eik.bme.hu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x331.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-TUID: Vj+Lea8XOhh1

On 12/2/25 17:23, BALATON Zoltan wrote:
> On Wed, 12 Feb 2025, Philippe Mathieu-Daudé wrote:
>> On 12/2/25 14:53, Philippe Mathieu-Daudé wrote:
>>> On 12/2/25 13:56, BALATON Zoltan wrote:
>>>> On Wed, 12 Feb 2025, Philippe Mathieu-Daudé wrote:
>>>>> On 12/2/25 12:37, Thomas Huth wrote:
>>>>>> On 12/02/2025 12.24, Philippe Mathieu-Daudé wrote:
>>>>>>> Introduce the EndianMode type and the DEFINE_PROP_ENDIAN() macros.
>>>>>>> Endianness can be BIG, LITTLE or unspecified (default).
>>>>>>>
>>>>>>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>>>>>>> ---
>>>>>>>   qapi/common.json                    | 16 ++++++++++++++++
>>>>>>>   include/hw/qdev-properties-system.h |  7 +++++++
>>>>>>>   hw/core/qdev-properties-system.c    | 11 +++++++++++
>>>>>>>   3 files changed, 34 insertions(+)


>>>>>>> +{ 'enum': 'EndianMode',
>>>>>>> +  'data': [ 'little', 'big', 'unspecified' ] }
>>>>>>
>>>>>> Should 'unspecified' come first? ... so that it gets the value 0, 
>>>>>> i.e. when someone forgets to properly initialize a related 
>>>>>> variable, the chances are higher that it ends up as "unspecified" 
>>>>>> than as "little" ?
>>>>>
>>>>> Hmm but then in this series the dual-endianness regions are defined 
>>>>> as:
>>>>>
>>>>> +static const MemoryRegionOps pic_ops[2] = {
>>>>> +    [0 ... 1] = {
>>>>
>>>> This is already confusing as you'd have to know that 0 and 1 here 
>>>> means ENDIAN_MODE_LITTLE and ENDIAN_MODE_BIG (using those constants 
>>>> here as well might be clearer). It's easy to miss what this does so 
>>
>> At this point 0 / 1 only mean "from the index #0 included to the index
>> #1 included", 0 being the first one and 1 the last one.
>>
>>>> maybe repeating the definitions for each case would be longer but 
>>>> less confusing and then it does not matter what the values are.
>>
>> This is what I tried to do with:
>>
>> +    [ENDIAN_MODE_BIG].endianness = DEVICE_BIG_ENDIAN,
>> +    [ENDIAN_MODE_LITTLE].endianness = DEVICE_LITTLE_ENDIAN,
>> };
>>
>> but in v7 we are back of picking an arbitrary value.
>>
>>>> Or what uses the ops.endianness now should look at the property 
>>>> introduced by this patch to avoid having to propagate it like below 
>>>> and drop the ops.endianness? Or it should move to the memory region 
>>>> and set when the ops are assigned?
>>>
>>> I'm not understanding well what you ask, but maybe the answer is in 
>>> v7 :)
> 
> I'm not sure I understand it well either. I think what I was asking 
> about is the same as what Thomas asked if this could be avoided to make 
> it necessary to allocate two separate ops for this. Looks like from now 
> on this ops struct should really loose the endianness value and this 
> should be assigned when the ops is added to the io region because that's 
> where it decides which endianness is it based on the property added in 
> this series. But I don't know if that could be done or would need deeper 
> changes as what later uses this ops struct might not have access to the 
> property and if we have a single ops struct it may need to be copied to 
> set different endianness intstead of just referencing it. So I'm not 
> sure there's a better way but I think this change makes an already 
> cryptic boiler plate even more confusing for people less knowledgeable 
> about QEMU and C programming so it makes even harder to write devices. 
> But as long as it's just a few devices that need to work with different 
> endianness then it might be OK. But wasn't that what NATIVE_ENDIAN was 
> meant for? What can't that be kept then?

Moving toward a single binary able to run heterogeneous machines, we
can't rely on a particular target endianness, so we need to remove
DEVICE_NATIVE_ENDIAN. The endianness is a property a device / machine,
not of the binary.
