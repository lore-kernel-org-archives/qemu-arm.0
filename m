Received: by 2002:a17:504:240b:b0:1be9:327d:8ee3 with SMTP id v11csp408514njc;
        Wed, 12 Feb 2025 23:08:17 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWAum5os7nWRcCBME91HECw6WDRlToXsi1jH1GPWJZMPcv1FzQ/+2qa92ZnCLQ2jMb4tmDzFstcGWIzhA==@linaro.org
X-Google-Smtp-Source: AGHT+IFTbZZCHVGHTkztqESAhd1jYVQNqgWW8N9MkM+JB0s6PFenHS8gTjdQ7dVRE6SVE64pbdJn
X-Received: by 2002:ac8:5988:0:b0:471:bf91:816b with SMTP id d75a77b69052e-471bf9182b2mr35702681cf.32.1739430496785;
        Wed, 12 Feb 2025 23:08:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1739430496; cv=none;
        d=google.com; s=arc-20240605;
        b=dL2+sVE5q5NU9EW6WHj6we0UyivCSEgwOnQ5hoZiFUnTkExeWLeIW7HjFhM2Y9RUfC
         RbR2GRtCFs0drTxQz1mrlD91WjGZA3pVYQmgiy7BPO5q8DZbqib5AlQNfg2NNmlMZkJk
         FHbO5gpph1xDp0B+1bP7yN4xksWFxNWhm8w4bjpIhVDy6rIOzJOB4gJXqJ7LTcTyG99T
         rrGi8Zx7QKBtoUicvo+X+0amBvMZ/ci9ppKIAS3QbNlgcrWSGzGo2ETskAPSf844nHrw
         Fsnn6pYObRyM708vNeA6iJg7Uj9u4Y4+JjtVO9Upap/4riiibi6rSzEo8JXVK0xFoLSG
         T/aA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:autocrypt:from:references:cc:to
         :subject:user-agent:mime-version:date:message-id:dkim-signature;
        bh=Gr6c0Mulz2kQwhD1c0QFhnqMQNxRD+K3T+ojP99O5yE=;
        fh=26jWS5fqUgC1Pb6Ba2CtnYQ/bbw+nb1FHgc4wgvhr8E=;
        b=lGkwGJFAfTb2i1AtWH77AozkRhMZ7oqQ2mkleGct5sqOWiRMq8A3GtIeRcUQI2rTGD
         xLvAg1iaMJa0Gz/idiCxdxlRfeDmZ+WWOaUV3eOMXPX+X8VrkYd8tsxOSCMMdMDa0duy
         KWL1KI0gCjYh5N0CjIF5GqDMcQHkqhwxjMIDwQ94vi1trkaBzJeEhg3O/r5HzJgwiACK
         MhcC4QGofCbKY8+amad0Bm75ar7SQqiCqQozcsitmR5VRW+4PT/4/15ywVVS1AFyqfqI
         xC0eYo8ih3D/V8MoCltpn63F+1VutUH3nLpnoymunhIwwFgygUrEAWg5KlOp4yrFjo6X
         HjxA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=FCIK2eem;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-471c2b2b8f0si8700181cf.273.2025.02.12.23.08.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 12 Feb 2025 23:08:16 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=FCIK2eem;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tiTKJ-0003rT-VP; Thu, 13 Feb 2025 02:08:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1tiTKF-0003qy-DT
 for qemu-arm@nongnu.org; Thu, 13 Feb 2025 02:07:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1tiTKD-00054T-OQ
 for qemu-arm@nongnu.org; Thu, 13 Feb 2025 02:07:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1739430472;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=Gr6c0Mulz2kQwhD1c0QFhnqMQNxRD+K3T+ojP99O5yE=;
 b=FCIK2eem9NNLt5Q8Qwj3/8ZxrJXx68ZWjjmdGx2d6A1xdZXS7uk3+95JLKsHUV6plgc2Ue
 3cGs606vKkaJfgcdvfScSKFqdqKY23t5eOw/DOKkoRybeSmZi+dX5GFfaWsjQgUno6JbDQ
 ThTwnvhAxWueYcsYzVzF8z3vG0S3RJs=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-21-Lat6DUw_P5WvdYOdJLBdZg-1; Thu, 13 Feb 2025 02:07:49 -0500
X-MC-Unique: Lat6DUw_P5WvdYOdJLBdZg-1
X-Mimecast-MFC-AGG-ID: Lat6DUw_P5WvdYOdJLBdZg_1739430468
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-38dda790cfbso376603f8f.2
 for <qemu-arm@nongnu.org>; Wed, 12 Feb 2025 23:07:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739430468; x=1740035268;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Gr6c0Mulz2kQwhD1c0QFhnqMQNxRD+K3T+ojP99O5yE=;
 b=ZaSNdwM0F9oX5Yrd4EHOnUJkn1Kb22xDvkE9jbNm6idRa39Q3JikwrjjnAkHDx4sa9
 NXKJb5yfwa+V2VsM3aDs18F5gtj3JaUaU4zk8wyAbreXzLsdzhZ+KHAzHVaPCQo6uuOK
 3yKm1NxhnXc7z5zNDadT2ShwiwNLACHxpiCgriJJRtJF6T+bZURb2Gh/VBgzxzjDJaEF
 J49GWLWBCTYQsgk5cudTCPca1p4hKvd0Eaxgyp7fmUSZrbrI6eXXlhJ3a9hyUWSBTSEz
 m4sVF/HwDmw7P6fH95ETJ8jLPiJQupOCBI686kBqiSBmeEOnH56eEphanE8tNulVQANO
 dFEA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWh9GqctpFqDUP1OBQZYr01gJ97kTsw4z5gUu5V2xyhIrgzeqEC2ltWsI9aDcZLh2TcgLy1UcKCww==@nongnu.org
X-Gm-Message-State: AOJu0Ywy2qcxiZgMSsO2IO+93ZuVHZC7P07Lvx4vgBS5WvrrEJktpRp6
 MDbDsG523o58r4EQQPU95HctKlc3tvy36PtBpshj2w57ZANMKb8dGC7r07yysRXDiyvFRxA/KcR
 hifYiWId3SWiwc1vk6+myntS8H3ofFC6JMWh+mClMRGaZGjMtWg==
X-Gm-Gg: ASbGncvOVMed8q2QfAB3GYl1H4keiqURj5z2erx+OTgvI24xn6xWFPmfUesXQvdgrVR
 a5fdBL81muEUCr0Wj8TQdgYundn3gGdPnNafp1JWKpypii8114WRXinE1xxfeRQSrDawfqHJrZM
 1jX3KtCjPq5qlrzl7YrAohIC/jSirSBHiYaky94Uo8L0MJ3RWQVtVzj6RQnI0bUCcE5+icRCNIV
 /ZkID3oq3wmEA7BGUzQLfyn27neK4bIbXCkCV9hk5tHA/EdIR56X5n60cji5UBBrkJrX5IUI6qc
 KkY0OJtpXfQ4KDCJp6CKy9b+eE+QK1Sx/A==
X-Received: by 2002:a5d:530c:0:b0:38d:e428:7348 with SMTP id
 ffacd0b85a97d-38f244f7549mr1517876f8f.29.1739430468473; 
 Wed, 12 Feb 2025 23:07:48 -0800 (PST)
X-Received: by 2002:a5d:530c:0:b0:38d:e428:7348 with SMTP id
 ffacd0b85a97d-38f244f7549mr1517838f8f.29.1739430468081; 
 Wed, 12 Feb 2025 23:07:48 -0800 (PST)
Received: from [192.168.0.7] (ip-109-42-48-37.web.vodafone.de. [109.42.48.37])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38f259f8217sm1004336f8f.90.2025.02.12.23.07.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Feb 2025 23:07:47 -0800 (PST)
Message-ID: <0f7ea6d6-8476-4ba6-9d4f-eeb76aed04fa@redhat.com>
Date: Thu, 13 Feb 2025 08:07:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 01/11] hw/qdev-properties-system: Introduce EndianMode
 QAPI enum
To: BALATON Zoltan <balaton@eik.bme.hu>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, qemu-ppc@nongnu.org,
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
 <672045c1-9b09-4b7b-9bed-fa990129ce2c@linaro.org>
 <fb7045a4-20f6-a52d-5531-2410fc803bb4@eik.bme.hu>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <fb7045a4-20f6-a52d-5531-2410fc803bb4@eik.bme.hu>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: dKh6YtvjWpU8tEYwiwDlR6jkJjBfv3SY3xp288uhOf4_1739430468
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.495,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: MC+HCFeh+fh0

On 12/02/2025 23.34, BALATON Zoltan wrote:
> On Wed, 12 Feb 2025, Philippe Mathieu-Daudé wrote:
>> On 12/2/25 17:23, BALATON Zoltan wrote:
>>> On Wed, 12 Feb 2025, Philippe Mathieu-Daudé wrote:
>>>> On 12/2/25 14:53, Philippe Mathieu-Daudé wrote:
>>>>> On 12/2/25 13:56, BALATON Zoltan wrote:
>>>>>> On Wed, 12 Feb 2025, Philippe Mathieu-Daudé wrote:
>>>>>>> On 12/2/25 12:37, Thomas Huth wrote:
>>>>>>>> On 12/02/2025 12.24, Philippe Mathieu-Daudé wrote:
>>>>>>>>> Introduce the EndianMode type and the DEFINE_PROP_ENDIAN() macros.
>>>>>>>>> Endianness can be BIG, LITTLE or unspecified (default).
>>>>>>>>>
>>>>>>>>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>>>>>>>>> ---
>>>>>>>>>   qapi/common.json                    | 16 ++++++++++++++++
>>>>>>>>>   include/hw/qdev-properties-system.h |  7 +++++++
>>>>>>>>>   hw/core/qdev-properties-system.c    | 11 +++++++++++
>>>>>>>>>   3 files changed, 34 insertions(+)
>>
>>
>>>>>>>>> +{ 'enum': 'EndianMode',
>>>>>>>>> +  'data': [ 'little', 'big', 'unspecified' ] }
>>>>>>>>
>>>>>>>> Should 'unspecified' come first? ... so that it gets the value 0, 
>>>>>>>> i.e. when someone forgets to properly initialize a related variable, 
>>>>>>>> the chances are higher that it ends up as "unspecified" than as 
>>>>>>>> "little" ?
>>>>>>>
>>>>>>> Hmm but then in this series the dual-endianness regions are defined as:
>>>>>>>
>>>>>>> +static const MemoryRegionOps pic_ops[2] = {
>>>>>>> +    [0 ... 1] = {
>>>>>>
>>>>>> This is already confusing as you'd have to know that 0 and 1 here 
>>>>>> means ENDIAN_MODE_LITTLE and ENDIAN_MODE_BIG (using those constants 
>>>>>> here as well might be clearer). It's easy to miss what this does so 
>>>>
>>>> At this point 0 / 1 only mean "from the index #0 included to the index
>>>> #1 included", 0 being the first one and 1 the last one.
>>>>
>>>>>> maybe repeating the definitions for each case would be longer but less 
>>>>>> confusing and then it does not matter what the values are.
>>>>
>>>> This is what I tried to do with:
>>>>
>>>> +    [ENDIAN_MODE_BIG].endianness = DEVICE_BIG_ENDIAN,
>>>> +    [ENDIAN_MODE_LITTLE].endianness = DEVICE_LITTLE_ENDIAN,
>>>> };
>>>>
>>>> but in v7 we are back of picking an arbitrary value.
>>>>
>>>>>> Or what uses the ops.endianness now should look at the property 
>>>>>> introduced by this patch to avoid having to propagate it like below 
>>>>>> and drop the ops.endianness? Or it should move to the memory region 
>>>>>> and set when the ops are assigned?
>>>>>
>>>>> I'm not understanding well what you ask, but maybe the answer is in v7 :)
>>>
>>> I'm not sure I understand it well either. I think what I was asking about 
>>> is the same as what Thomas asked if this could be avoided to make it 
>>> necessary to allocate two separate ops for this. Looks like from now on 
>>> this ops struct should really loose the endianness value and this should 
>>> be assigned when the ops is added to the io region because that's where 
>>> it decides which endianness is it based on the property added in this 
>>> series. But I don't know if that could be done or would need deeper 
>>> changes as what later uses this ops struct might not have access to the 
>>> property and if we have a single ops struct it may need to be copied to 
>>> set different endianness intstead of just referencing it. So I'm not sure 
>>> there's a better way but I think this change makes an already cryptic 
>>> boiler plate even more confusing for people less knowledgeable about QEMU 
>>> and C programming so it makes even harder to write devices. But as long 
>>> as it's just a few devices that need to work with different endianness 
>>> then it might be OK. But wasn't that what NATIVE_ENDIAN was meant for? 
>>> What can't that be kept then?
>>
>> Moving toward a single binary able to run heterogeneous machines, we
>> can't rely on a particular target endianness, so we need to remove
>> DEVICE_NATIVE_ENDIAN. The endianness is a property a device / machine,
>> not of the binary.
> 
> So then can the behaviour of NATIVE_ENDIAN be changed to look at the machine 
> endianness instead of replacing it with a constant?

No, that does not work. First, the machine knows about its devices, but a 
device should not know about the wiring of the global machine (just like in 
real life). Second, imagine a board with e.g. a big endian main CPU and a 
little endian service processor - how should a device know the right 
endianness here?

  Thomas

> Or would that be too 
> much overhead? If always looking up the endianness is not wanted could the 
> ops declaration keep NATIVE_ENDIAN 

IMHO we should get rid of NATIVE_ENDIAN completely since there is no 
"native" endian in multi-CPU boards.

  Thomas

