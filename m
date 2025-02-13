Received: by 2002:a17:504:240b:b0:1be9:327d:8ee3 with SMTP id v11csp614741njc;
        Thu, 13 Feb 2025 06:25:08 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCX627YztHCvHtXE4Z9LvFwguYvhvhx0dVkE4c+O723BV2LTy2B2Z2l1+R2Qrx1iT23RmNyWWYblZypC/g==@linaro.org
X-Google-Smtp-Source: AGHT+IFGRWGuPr3ZflitLxpn8b4/NLt9FeQKdKJ60DNKe7i/+IBjb73Iq4cRZPVOpCTk6oJIXckR
X-Received: by 2002:a05:620a:488b:b0:7c0:7df3:3095 with SMTP id af79cd13be357-7c07df33254mr270042985a.30.1739456708652;
        Thu, 13 Feb 2025 06:25:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1739456708; cv=none;
        d=google.com; s=arc-20240605;
        b=WX0xSottYuVhzdwSYP8n2Op0kHYk3N56HNnZSfS5AVgX6HUyl/cyXXZMeuUtHBdwfr
         wCJTyFN2oQYPSVlbaegdX5sAcJCCiU48zVPNmYjh7Rf8f9a6sesshCpcEW5YqmlRQsZg
         v+l1gvkVHwXGCEmdEBnbYGWHE69KKK9dksXdjGqRlHhj3cr4Ysqkwocd1nK02SO6ThS6
         ccOh6sFH7CARtwwrlb3gXwoU3bf4cHTSOFboUkvxP2ky3hqg8IuJ4otk/OPce+TWQ1Hj
         vONWyx4m4VV1gQB/OPIJgKYJzXBGWpVoZWXKGZeGkC3FlIEyuITZQtfDA7XL8YsA4Q3O
         APJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=BdcRnIDri58EWnsM3G/mJv98CRyFGaRm8Bh0qFanUAc=;
        fh=PmP6eVzG0X+wCmzj25JvS1mvhWfJR0UvdNSXtYhCSWw=;
        b=QQBANBxmJ9k3YeHRKMG1LNPJ9e0ipf3hibadpPrkt3s5/CgGzPR6aLXWA3yf2RNMjx
         mqbJz54T/frNPB8ZChEbTXqA+ix2/ctpk+yT+lMNT/fZm83zTPkSTkVNr5DS4D/mNaby
         HDVhqvwImWYpt6GnAW4IMA8B95IQAz7fWvO2x/lUxcMzdG1jOah4vHvX1pry0/f57/wq
         9HVdZS6VNP4mF3S0MPqG8+5o1h2PpvLd80iDknHZFlnDoKfVTcttQ4eNOQvSF5cRjegZ
         RhZdKz0r/VP+4ItnZxRiTczFSyBzoiyaIdmpAQxru5rQP4G7XVau373nCP+pjTOuweOl
         iApw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Fktp+Pkr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c07c623238si136567185a.33.2025.02.13.06.25.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 13 Feb 2025 06:25:08 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Fktp+Pkr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tia9A-0003cG-Ga; Thu, 13 Feb 2025 09:24:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tia8p-0003bp-Gp
 for qemu-arm@nongnu.org; Thu, 13 Feb 2025 09:24:35 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tia8n-0006QE-0V
 for qemu-arm@nongnu.org; Thu, 13 Feb 2025 09:24:35 -0500
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-38dd93a4e8eso743077f8f.1
 for <qemu-arm@nongnu.org>; Thu, 13 Feb 2025 06:24:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739456671; x=1740061471; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=BdcRnIDri58EWnsM3G/mJv98CRyFGaRm8Bh0qFanUAc=;
 b=Fktp+PkrAax+edpPfp/uDjGo8QXoKNnKXwiLDgnE4eeqTCzrT3gqjdegJC1yfxTyH0
 RdcXlxfqsCQ5PLGjgf6qwBVsynTFb9CqDhcdvCC4eIJvfqaXQJ7hdcIJqHuV2ZkAHfXT
 YiE6Saa+X7Wgul8Wlrn2xbJmUHp25yx+im/VqVQ5UDjLzerTp21H70i+eCZ+lUpREEad
 oXCYpSX5qur2TirfQ/4WetuO2CA9nR3neXPGi/Y8Gl8bgl8qbY813oo8l0O8dDw4CdNZ
 OwBPVlPMRxYK86WvDcszNR0EkDBQzkwPqpY5VdMSV2lO4N6qou0AuwtLiENtVXgn9QqH
 KL7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739456671; x=1740061471;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=BdcRnIDri58EWnsM3G/mJv98CRyFGaRm8Bh0qFanUAc=;
 b=KLeKEVIABTVGRwXr6zv5J0uRfw0paQ1WChPXwVx1SQjbGZf99pGBKGoVUsMBNKaeM8
 7norPnjKr2GpXoNzAOxvsB+VQY+Grj4lICndJwx+jpExmooTJTPemtVUh2Wb5jKIUCA1
 /rF8FRNZe2Cxcr6y4XuBAeU4t6SVqRXg/TJt6goNP4r4RZA2qmdAH6aGicWcfM33rorZ
 utHAc2Xk92vlWjyUOz4JD2I1EB3eepKr9MDZ1WA2uSeLFQeZBglkHzpUjns07GSth5Kl
 fosigtGqPlTDegkg59nVNd2RA7W5NAasS6e4qsiqt3KdQ7LyhDjUwWjuC+gevgh6QLdg
 sV+w==
X-Forwarded-Encrypted: i=1;
 AJvYcCV+HRlW/lLQj6Mk8gQWKtyFiDTCGXlh7jlMtEgoklAgyQc2DRxpgPrjjXKIXkU567QtkpHiGRCOuw==@nongnu.org
X-Gm-Message-State: AOJu0YxSchQFVugh6GU6wYQEE3lUd1Fhk4tkUNCQXBVgG/Rxb856xFg+
 RUC0q4APs+rslECGTPy8xJ8MRWdti1UPZNrlALxxWGwKsz7I/YnIXWV3odI7Y30=
X-Gm-Gg: ASbGncs0Cn25pMxm0uJZ3Y+yAip+Km1EhsXZ9YMm2WzSyeslbR5gsiB/hlnSFpo+jLr
 ClN4po7UGqdAuvCQOOsZcswMUeL9ZVRb2BoiPkEAwBqQCnPgE9KRyO0qTZlB/29H1dgWcq9igrL
 Od/b4fulYiWxB8LlPvovXJf+yFnQzsQUO3l4x4R3pluv+JnaayQFI9hYgP5j42a5/BdJ0aw2cNm
 tJjIRwNMkODvFPLNST0g/bVpm/WivTKctc1YVALtx+WN2x8uRMorIWUIQEVmdFgv9E/rjtkpdOb
 g2yRzxfIl1gHm401AXR4YGhby2PIa1tAffeW364cU4pUiuW2l4l1WNFTZ3+udSqZ4m1NzzTGLg=
 =
X-Received: by 2002:a05:6000:1f8b:b0:38d:dd43:8be5 with SMTP id
 ffacd0b85a97d-38f244e4a6cmr3957796f8f.15.1739456671185; 
 Thu, 13 Feb 2025 06:24:31 -0800 (PST)
Received: from [192.168.1.20] (lfbn-bay-1-170-196.w83-193.abo.wanadoo.fr.
 [83.193.250.196]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38f258b41b5sm2076545f8f.14.2025.02.13.06.24.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Feb 2025 06:24:30 -0800 (PST)
Message-ID: <cc18c5c6-1a93-4a42-b6b4-ca5f13718906@linaro.org>
Date: Thu, 13 Feb 2025 15:24:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 01/11] hw/qdev-properties-system: Introduce EndianMode
 QAPI enum
To: BALATON Zoltan <balaton@eik.bme.hu>, Thomas Huth <thuth@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, qemu-ppc@nongnu.org,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, qemu-arm@nongnu.org,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
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
 <0f7ea6d6-8476-4ba6-9d4f-eeb76aed04fa@redhat.com>
 <9e121e62-8e6e-61d6-dbfb-4dfda469acc5@eik.bme.hu>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <9e121e62-8e6e-61d6-dbfb-4dfda469acc5@eik.bme.hu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42b.google.com
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
X-TUID: gG1q5kp032zg

On 13/2/25 14:59, BALATON Zoltan wrote:
> On Thu, 13 Feb 2025, Thomas Huth wrote:
>> On 12/02/2025 23.34, BALATON Zoltan wrote:
>>> On Wed, 12 Feb 2025, Philippe Mathieu-Daudé wrote:
>>>> On 12/2/25 17:23, BALATON Zoltan wrote:
>>>>> On Wed, 12 Feb 2025, Philippe Mathieu-Daudé wrote:
>>>>>> On 12/2/25 14:53, Philippe Mathieu-Daudé wrote:
>>>>>>> On 12/2/25 13:56, BALATON Zoltan wrote:
>>>>>>>> On Wed, 12 Feb 2025, Philippe Mathieu-Daudé wrote:
>>>>>>>>> On 12/2/25 12:37, Thomas Huth wrote:
>>>>>>>>>> On 12/02/2025 12.24, Philippe Mathieu-Daudé wrote:
>>>>>>>>>>> Introduce the EndianMode type and the DEFINE_PROP_ENDIAN() 
>>>>>>>>>>> macros.
>>>>>>>>>>> Endianness can be BIG, LITTLE or unspecified (default).
>>>>>>>>>>>
>>>>>>>>>>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>>>>>>>>>>> ---
>>>>>>>>>>>   qapi/common.json                    | 16 ++++++++++++++++
>>>>>>>>>>>   include/hw/qdev-properties-system.h |  7 +++++++
>>>>>>>>>>>   hw/core/qdev-properties-system.c    | 11 +++++++++++
>>>>>>>>>>>   3 files changed, 34 insertions(+)
>>>>
>>>>
>>>>>>>>>>> +{ 'enum': 'EndianMode',
>>>>>>>>>>> +  'data': [ 'little', 'big', 'unspecified' ] }
>>>>>>>>>>
>>>>>>>>>> Should 'unspecified' come first? ... so that it gets the value 
>>>>>>>>>> 0, i.e. when someone forgets to properly initialize a related 
>>>>>>>>>> variable, the chances are higher that it ends up as 
>>>>>>>>>> "unspecified" than as "little" ?
>>>>>>>>>
>>>>>>>>> Hmm but then in this series the dual-endianness regions are 
>>>>>>>>> defined as:
>>>>>>>>>
>>>>>>>>> +static const MemoryRegionOps pic_ops[2] = {
>>>>>>>>> +    [0 ... 1] = {
>>>>>>>>
>>>>>>>> This is already confusing as you'd have to know that 0 and 1 
>>>>>>>> here means ENDIAN_MODE_LITTLE and ENDIAN_MODE_BIG (using those 
>>>>>>>> constants here as well might be clearer). It's easy to miss what 
>>>>>>>> this does so 
>>>>>>
>>>>>> At this point 0 / 1 only mean "from the index #0 included to the 
>>>>>> index
>>>>>> #1 included", 0 being the first one and 1 the last one.
>>>>>>
>>>>>>>> maybe repeating the definitions for each case would be longer 
>>>>>>>> but less confusing and then it does not matter what the values are.
>>>>>>
>>>>>> This is what I tried to do with:
>>>>>>
>>>>>> +    [ENDIAN_MODE_BIG].endianness = DEVICE_BIG_ENDIAN,
>>>>>> +    [ENDIAN_MODE_LITTLE].endianness = DEVICE_LITTLE_ENDIAN,
>>>>>> };
>>>>>>
>>>>>> but in v7 we are back of picking an arbitrary value.
>>>>>>
>>>>>>>> Or what uses the ops.endianness now should look at the property 
>>>>>>>> introduced by this patch to avoid having to propagate it like 
>>>>>>>> below and drop the ops.endianness? Or it should move to the 
>>>>>>>> memory region and set when the ops are assigned?
>>>>>>>
>>>>>>> I'm not understanding well what you ask, but maybe the answer is 
>>>>>>> in v7 :)
>>>>>
>>>>> I'm not sure I understand it well either. I think what I was asking 
>>>>> about is the same as what Thomas asked if this could be avoided to 
>>>>> make it necessary to allocate two separate ops for this. Looks like 
>>>>> from now on this ops struct should really loose the endianness 
>>>>> value and this should be assigned when the ops is added to the io 
>>>>> region because that's where it decides which endianness is it based 
>>>>> on the property added in this series. But I don't know if that 
>>>>> could be done or would need deeper changes as what later uses this 
>>>>> ops struct might not have access to the property and if we have a 
>>>>> single ops struct it may need to be copied to set different 
>>>>> endianness intstead of just referencing it. So I'm not sure there's 
>>>>> a better way but I think this change makes an already cryptic 
>>>>> boiler plate even more confusing for people less knowledgeable 
>>>>> about QEMU and C programming so it makes even harder to write 
>>>>> devices. But as long as it's just a few devices that need to work 
>>>>> with different endianness then it might be OK. But wasn't that what 
>>>>> NATIVE_ENDIAN was meant for? What can't that be kept then?
>>>>
>>>> Moving toward a single binary able to run heterogeneous machines, we
>>>> can't rely on a particular target endianness, so we need to remove
>>>> DEVICE_NATIVE_ENDIAN. The endianness is a property a device / machine,
>>>> not of the binary.
>>>
>>> So then can the behaviour of NATIVE_ENDIAN be changed to look at the 
>>> machine endianness instead of replacing it with a constant?
>>
>> No, that does not work. First, the machine knows about its devices, 
>> but a device should not know about the wiring of the global machine 
>> (just like in real life).
> 
> That means all devices should be either big or little endian and there 
> should be no native endian ones. Why do we have those then? That's why 
> this endianness property should either be removed from ops and only 
> attached to it when added to a machine if needed or kept to show which 
> machines it can be attached to: only big, little or both endian which is 
> what it seems to be doing now.

Well, devices don't have endianness, endianness is more a property of
the bus [*] between cpu <-> devices, how the bytes are serialized.

QEMU devices have an endianness property so the core memory can access
them using the proper ordering, see:

$ git grep -wW memory_region_big_endian
system/memory.c:356:static bool memory_region_big_endian(MemoryRegion *mr)
system/memory.c-357-{
system/memory.c-358-#if TARGET_BIG_ENDIAN
system/memory.c-359-    return mr->ops->endianness != DEVICE_LITTLE_ENDIAN;
system/memory.c-360-#else
system/memory.c-361-    return mr->ops->endianness == DEVICE_BIG_ENDIAN;
system/memory.c-362-#endif
system/memory.c-363-}
--
system/memory.c=521=static MemTxResult access_with_adjusted_size(hwaddr 
addr,
system/memory.c-522-                                      uint64_t *value,
system/memory.c-523-                                      unsigned size,
system/memory.c-524-                                      unsigned 
access_size_min,
system/memory.c-525-                                      unsigned 
access_size_max,
system/memory.c-526-                                      MemTxResult 
(*access_fn)
system/memory.c-527- 
(MemoryRegion *mr,
system/memory.c-528- 
hwaddr addr,
system/memory.c-529- 
uint64_t *value,
system/memory.c-530- 
unsigned size,
system/memory.c-531- 
signed shift,
system/memory.c-532- 
uint64_t mask,
system/memory.c-533- 
MemTxAttrs attrs),
system/memory.c-534-                                      MemoryRegion *mr,
system/memory.c-535-                                      MemTxAttrs attrs)
system/memory.c-536-{
system/memory.c-537-    uint64_t access_mask;
system/memory.c-538-    unsigned access_size;
system/memory.c-539-    unsigned i;
system/memory.c-540-    MemTxResult r = MEMTX_OK;
system/memory.c-541-    bool reentrancy_guard_applied = false;
system/memory.c-542-
system/memory.c-543-    if (!access_size_min) {
system/memory.c-544-        access_size_min = 1;
system/memory.c-545-    }
system/memory.c-546-    if (!access_size_max) {
system/memory.c-547-        access_size_max = 4;
system/memory.c-548-    }
system/memory.c-549-
system/memory.c-550-    /* Do not allow more than one simultaneous 
access to a device's IO Regions */
system/memory.c-551-    if (mr->dev && !mr->disable_reentrancy_guard &&
system/memory.c-552-        !mr->ram_device && !mr->ram && 
!mr->rom_device && !mr->readonly) {
system/memory.c-553-        if 
(mr->dev->mem_reentrancy_guard.engaged_in_io) {
system/memory.c-554-            warn_report_once("Blocked re-entrant IO 
on MemoryRegion: "
system/memory.c-555-                             "%s at addr: 0x%" 
HWADDR_PRIX,
system/memory.c-556-                             memory_region_name(mr), 
addr);
system/memory.c-557-            return MEMTX_ACCESS_ERROR;
system/memory.c-558-        }
system/memory.c-559-        mr->dev->mem_reentrancy_guard.engaged_in_io 
= true;
system/memory.c-560-        reentrancy_guard_applied = true;
system/memory.c-561-    }
system/memory.c-562-
system/memory.c-563-    /* FIXME: support unaligned access? */
system/memory.c-564-    access_size = MAX(MIN(size, access_size_max), 
access_size_min);
system/memory.c-565-    access_mask = MAKE_64BIT_MASK(0, access_size * 8);
system/memory.c:566:    if (memory_region_big_endian(mr)) {
system/memory.c-567-        for (i = 0; i < size; i += access_size) {
system/memory.c-568-            r |= access_fn(mr, addr + i, value, 
access_size,
system/memory.c-569-                        (size - access_size - i) * 
8, access_mask, attrs);
system/memory.c-570-        }
system/memory.c-571-    } else {
system/memory.c-572-        for (i = 0; i < size; i += access_size) {
system/memory.c-573-            r |= access_fn(mr, addr + i, value, 
access_size, i * 8,
system/memory.c-574-                        access_mask, attrs);
system/memory.c-575-        }
system/memory.c-576-    }
system/memory.c-577-    if (mr->dev && reentrancy_guard_applied) {
system/memory.c-578-        mr->dev->mem_reentrancy_guard.engaged_in_io 
= false;
system/memory.c-579-    }
system/memory.c-580-    return r;
system/memory.c-581-}

[*] See chapter 2 "The Basics of Endianness", in particular section
2.2 'Endianness Definition by Bus Specification':
https://www.intel.com/content/dam/www/public/us/en/documents/application-notes/ixp4xx-ixc1100-big-endian-little-endian-modes-note.pdf

>> Second, imagine a board with e.g. a big endian main CPU and a little 
>> endian service processor - how should a device know the right 
>> endianness here?
> 
> How would that work with this series? So the proposed solution is to 
> double the devices now marked as NATIVE_ENDIAN to have a big and a 
> little endian variant for them so the board can choose? That does not 
> exist in real as you wrote, there's only one device so then this is 
> probably not the right way to model it.
> 
>>> Or would that be too much overhead? If always looking up the 
>>> endianness is not wanted could the ops declaration keep NATIVE_ENDIAN 
>>
>> IMHO we should get rid of NATIVE_ENDIAN completely since there is no 
>> "native" endian in multi-CPU boards.
> 
> If we say NATIVE_ENDIAN means that the device can be attached to either 
> big or little endian machine then we can keep this constant but when 
> adding the ops to a memory region the board has to then decide which 
> endianness it is and replace it with either big or little. Then we don't 
> need two versions of the same device and NATIVE_ENDIAN means that the 
> device can be used in both machines.
> 
> In real life probably all devices can be used with either CPU and if 
> they are accessed in little or big endian is only determinded by how 
> they are wired on the board. So the device endianness only means what 
> endianness the device expects for something (what exactly? e.g. a video 
> chip may have a frame buffer and a registers area with different 
> endianness). So this should be the board that decides this not the 
> device. Therefore it may not need to be defined when MemoryRegionOps is 
> defined at all (or only as a hint to show what the device expects 
> normally) and then memory_region_init_io which takes the MemoryRegionOps 
> should also take an endianness corresponding the board and set it at 
> that point. It can warn if the device endianness does not match what the 
> board sets but you can still connect a big endian device to a little 
> endian CPU as long as the drivers write the right values or the data 
> lines are connected the right way, the latter of which corresponds to 
> NATIVE_ENDIAN now as the conversion is done by the wiring so drivers 
> don't need to care.
> 
> But if it's simpler to just double the few devices that need to be used 
> this way then it's a possible solution but if there's a cleaner one with 
> not much more complexity then maybe that should be considered, because 
> the way to define these doubled devices is a bit confusing for new 
> people (on top of that defining devices is already confusing with the 
> lot of boiler plate code needed). So if this could be kept simpler that 
> would be a good thing IMO.
> 
> Regards,
> BALATON Zoltan

