Received: by 2002:a17:505:4688:b0:1be9:327d:8ee3 with SMTP id cb8csp1017440njb;
        Wed, 12 Feb 2025 06:04:30 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVoRDkrXKFvUuQPSZ081e77S3Tqoo0T08PzQYAhu/l3DiB3J/muE5gnnKz4GFzJuuIbeH5HHMXwnSi/KA==@linaro.org
X-Google-Smtp-Source: AGHT+IFq0hgojTkchTfl2mv6MaEjHskCtP3moLYyxosbc0dmXEd/eEUskm7Z7WuosZLPIlW4EcaM
X-Received: by 2002:a05:620a:2955:b0:7c0:6ae3:884c with SMTP id af79cd13be357-7c06fc57a06mr360525185a.3.1739369070488;
        Wed, 12 Feb 2025 06:04:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1739369070; cv=none;
        d=google.com; s=arc-20240605;
        b=UhZOYwXZCmudNYYrIW1fSBu0eCamAUo+uavxxPZBhc+NU8yn8YX8qNMMioN5mpUvi/
         5ekJCgiWkhi58RDCJhnrW9GwKMnLo4sM3cO4aQmZPnvoek/JvoW+bgx5s/wcCrVxlm4g
         gMeHXkSR/pPOT08ae5eTreFTZRLEMy3xcdWzlV6IYEuLwGCifevJARAxvT8IaqjCFRK5
         0RbhTY9yBl8bWE9SxuT9Y0PiP+9QeSrZICTp0DuBDpc1rCnzy9SpiLNlYc7ldQJvShRP
         ioWUK5CN2Wkw1b4mmywQFdbc1ZKL1HsuZ8NdJ5spyp7QCQeBeG2zO5fDxuGKtJlie60b
         DjPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:content-language:references:cc:to:from:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=kAH2qclmGgBA3ka8vJzUEw7N4C7mBg3fIza94AFCUGI=;
        fh=3xjc2/6p0FBV614NeldhGxTsWZeYNZf6ZD+i/vkk2wA=;
        b=bkEwPDKcgRE43ocMP966NTfKGMcn0v58ql7J4SLlgqXkW+dpbC/Lu1Ly3ufK2T59OY
         fZHid+9GivJsGebz/BTYBi6Qu5ZI3FqUlp5vbbLQHSdJkBTXZ3GJKmmCWM4SOVRz8foC
         +HgqAoQGVtY4SrM+zS/4iBBKPM6T8GDPxFGklB8z7kDgyLkl3veWlkmKUCaHbM7g3/fB
         3tfG3NVKFHtWoE/ublU4Wu7SihIrC7QDa8DwOGce9hIHjoCGOnRhZ8PVAdBI1WJfph4k
         kMYyB3M4p42B2f9j3VjQIHdvEqpH4SyEdzBuwJeqgA6v+QBOEK8h5dPVPq1X1rG09cY7
         7rJg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UbkiZW39;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c041ee50f6si1329310885a.609.2025.02.12.06.04.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 12 Feb 2025 06:04:30 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UbkiZW39;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tiDLA-0006pI-9N; Wed, 12 Feb 2025 09:03:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tiDL7-0006oY-Fo
 for qemu-arm@nongnu.org; Wed, 12 Feb 2025 09:03:46 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tiDL5-0006XR-FS
 for qemu-arm@nongnu.org; Wed, 12 Feb 2025 09:03:45 -0500
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-38dd011ff8bso4082393f8f.0
 for <qemu-arm@nongnu.org>; Wed, 12 Feb 2025 06:03:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739369022; x=1739973822; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
 :cc:subject:date:message-id:reply-to;
 bh=kAH2qclmGgBA3ka8vJzUEw7N4C7mBg3fIza94AFCUGI=;
 b=UbkiZW39MrY0A/jnjsPCqfVFfhFXyM/hjOB2w+7c1WQwVm5ege+38p3A+SdVKNrb0n
 uH5fSq7LITLpNbWOA8vPFX638penPK1iqJKhSlXK8qvfTwmiWSVrdyHcaL2mGtjUonZs
 jAlveIy8l+mXrbWmjqw4iqCERwRRzzwXbtvz9iLIrk2c0JxOxJUXEaOJwor9SlCH8FTM
 fKanWyyGwKqAnnZlgzEob7SZXVWavRz1EBGr3ffzfJawPJF7+hy6w6vRPfIsvr9nYgvf
 fDqWfKwTm+X7c2ErvpDW1/rjPIyqAVLa/m2mkbINjxA1bO2PKMT1vajm5vzMabEDSNfD
 5tqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739369022; x=1739973822;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kAH2qclmGgBA3ka8vJzUEw7N4C7mBg3fIza94AFCUGI=;
 b=vRIO8JkiQ9/Idvcgl1LIvLnXOuCicsEfYT6O90CgNFw06ACdsvKtzvvADPDBmhZCB+
 wOxkZkMa2xWaKePORwIGeyQwmDIagF+ZN8VnN9h77bZHY3J50FGt8dwXgFQ6FVaLhXzl
 nPaIZK71N8HyASocF9v/Q0vFuqD/p0o0oVIxNMHouT2S8/XmpjQrc3+fQOs1A1UpDi7e
 EA89m5ggvpGI7LJK99Kv/4oMXQyLGwCnpKvhV+r1e+m3zI75Y+BjkDGEbt2AZOdAxtdp
 k/P0deslq5fgdozMB8SEUkb8BbfdETY3Y/iPTnu6GTX8Ql43oHguRzGdSXlYLSTCBT5p
 dXOA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVmo4IOXWTASE0nZCdrS44fZjZirv3/ql80Suyi1fBhINS4OlzElx49gW5U0dHd9/nlq5IHusa3MA==@nongnu.org
X-Gm-Message-State: AOJu0YxGu/6Hfu5uTlwHbHjnOLdbCJANtZrQPJAWfrIv3ms67XA0ZLRP
 nJc6P7HJAvjAj+CGZra9b4psxAxTBso8xEIF53gPZewVzzIWsRsst3rEB8iV24Y=
X-Gm-Gg: ASbGnctOlythNs/aKdmeyi043NhYfWmJvFZCfQnkBQqaFyChrpBxrnFKMxzJSFWHRqw
 axd2fAgFyuV1q/I9Bfr2SE2V0mxq0TXJ9JVLuImdF9I5xoO0A3qbZ4SNW25g3CXOPICDRcIiIwX
 1GcqbmSjjoNRRfotD77bthZwcvZoC7u3BwP9IipCTCRfaJjDc2fjyIJZ4JPch6c7pdj72TpSVpR
 aC0mWLpamW1SmtH8HGjyu63Zz0A1PbP8DFFhmXKLFCmr/lPPqsff8ur4BVVVgyW4P+Seh6orE+a
 1h93Ty7eJN5rdeWOlM2Q/tWu7oceqDSc8LIOzYvo80M6TegRT4mIkyqZNaU=
X-Received: by 2002:a05:6000:184:b0:38d:b448:8ffc with SMTP id
 ffacd0b85a97d-38dea28eb1cmr2337831f8f.27.1739369021551; 
 Wed, 12 Feb 2025 06:03:41 -0800 (PST)
Received: from [192.168.69.198] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4395a1b84bcsm21489225e9.40.2025.02.12.06.03.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Feb 2025 06:03:40 -0800 (PST)
Message-ID: <a3608e43-79ce-403d-8ba7-6735fde66759@linaro.org>
Date: Wed, 12 Feb 2025 15:03:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 01/11] hw/qdev-properties-system: Introduce EndianMode
 QAPI enum
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
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
Content-Language: en-US
In-Reply-To: <6e707c7f-b94c-47ef-83ab-795605e27963@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x436.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: WAAzsFGVeP+I

On 12/2/25 14:53, Philippe Mathieu-Daudé wrote:
> On 12/2/25 13:56, BALATON Zoltan wrote:
>> On Wed, 12 Feb 2025, Philippe Mathieu-Daudé wrote:
>>> On 12/2/25 12:37, Thomas Huth wrote:
>>>> On 12/02/2025 12.24, Philippe Mathieu-Daudé wrote:
>>>>> Introduce the EndianMode type and the DEFINE_PROP_ENDIAN() macros.
>>>>> Endianness can be BIG, LITTLE or unspecified (default).
>>>>>
>>>>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>>>>> ---
>>>>>   qapi/common.json                    | 16 ++++++++++++++++
>>>>>   include/hw/qdev-properties-system.h |  7 +++++++
>>>>>   hw/core/qdev-properties-system.c    | 11 +++++++++++
>>>>>   3 files changed, 34 insertions(+)
>>>>>
>>>>> diff --git a/qapi/common.json b/qapi/common.json
>>>>> index 6ffc7a37890..217feaaf683 100644
>>>>> --- a/qapi/common.json
>>>>> +++ b/qapi/common.json
>>>>> @@ -212,3 +212,19 @@
>>>>>   ##
>>>>>   { 'struct': 'HumanReadableText',
>>>>>     'data': { 'human-readable-text': 'str' } }
>>>>> +
>>>>> +##
>>>>> +# @EndianMode:
>>>>> +#
>>>>> +# An enumeration of three options: little, big, and unspecified
>>>>> +#
>>>>> +# @little: Little endianness
>>>>> +#
>>>>> +# @big: Big endianness
>>>>> +#
>>>>> +# @unspecified: Endianness not specified
>>>>> +#
>>>>> +# Since: 10.0
>>>>> +##
>>>>> +{ 'enum': 'EndianMode',
>>>>> +  'data': [ 'little', 'big', 'unspecified' ] }
>>>>
>>>> Should 'unspecified' come first? ... so that it gets the value 0, 
>>>> i.e. when someone forgets to properly initialize a related variable, 
>>>> the chances are higher that it ends up as "unspecified" than as 
>>>> "little" ?
>>>
>>> Hmm but then in this series the dual-endianness regions are defined as:
>>>
>>> +static const MemoryRegionOps pic_ops[2] = {
>>> +    [0 ... 1] = {
>>
>> This is already confusing as you'd have to know that 0 and 1 here 
>> means ENDIAN_MODE_LITTLE and ENDIAN_MODE_BIG (using those constants 
>> here as well might be clearer). It's easy to miss what this does so 

At this point 0 / 1 only mean "from the index #0 included to the index
#1 included", 0 being the first one and 1 the last one.

>> maybe repeating the definitions for each case would be longer but less 
>> confusing and then it does not matter what the values are.

This is what I tried to do with:

+    [ENDIAN_MODE_BIG].endianness = DEVICE_BIG_ENDIAN,
+    [ENDIAN_MODE_LITTLE].endianness = DEVICE_LITTLE_ENDIAN,
};

but in v7 we are back of picking an arbitrary value.

>> Or what uses the ops.endianness now should look at the property 
>> introduced by this patch to avoid having to propagate it like below 
>> and drop the ops.endianness? Or it should move to the memory region 
>> and set when the ops are assigned?
> 
> I'm not understanding well what you ask, but maybe the answer is in v7 :)

