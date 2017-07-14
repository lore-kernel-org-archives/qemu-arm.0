Received: by 10.25.44.15 with SMTP id s15csp620615lfs;
        Fri, 14 Jul 2017 01:25:56 -0700 (PDT)
X-Received: by 10.55.220.193 with SMTP id v184mr8178800qki.74.1500020756146;
        Fri, 14 Jul 2017 01:25:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1500020756; cv=none;
        d=google.com; s=arc-20160816;
        b=y3sOAroQaNbgqnQ4UMNprOsXPHRWFWEpxGnaSMZtX4mTAaTL44fqvC5FS1lpABTZ5M
         8ZmF6wJqu17EjfwkoSl1LxgoMB1cpc8OqQLWFIS34bSq7D+baHfejn96xlIbcxWEIu1i
         Juy38Y5/JmmggcI7Ukl2qBn3U3aIKav6Ifsk0ZIW0UWPLj3FklyZ1/6o3jq27hs1gW9D
         LRkA04MlYL4BW7OvRLfv45ieXcMsKl4TtHEpx0ckTMKF6Km3YCdebA7yGFnPY1CtMimL
         HxnsBOSjpTB/dy1SwRhas8FAVWceegwZbnjUTZn5yF8QJPfRgydt9Y77RLlg54Xh2J7p
         RiYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:arc-authentication-results;
        bh=34bktuXyGL10xxod5dza4ACYhmmBDv0KhN58SKc7VkQ=;
        b=uJvpAaQ7KfCSdcscBx/7zg0zc9fiieaKPsBh3QIFvv/Oa+7mbSIwyVkpi5pORFHpue
         2NFldoCSzrYrwcRO3yCrkinbHDNnj5gtXWcErj7v5s1xq7mNHQ9kBQc8A5wd7ImTByqM
         QGGe1SmyRUVFZ7EIoDVsZxgdNVECKWpKz/m84HqRqv8rfU6L4Ydz4pr8LAagO/spKlhs
         4g6ODbRBJpzSVkJpZWnbNeQ+l4tbuPH9YhnUqmynyr81v1cv5Zni3+GBM5MaGEFBZfHx
         JydrHnieBFTxXTxAtRLidWeyvcnpPhXQ1NX4hoWYV8tlmxQzE/CiIwlVIdyWVQqlqq7u
         TGZQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i128si7147010qkd.299.2017.07.14.01.25.55
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 14 Jul 2017 01:25:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:36142 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dVvv7-0005Tb-Dn
	for alex.bennee@linaro.org; Fri, 14 Jul 2017 04:25:53 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43344)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gengdongjiu@huawei.com>) id 1dVvv1-0005SQ-1b
	for qemu-arm@nongnu.org; Fri, 14 Jul 2017 04:25:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <gengdongjiu@huawei.com>) id 1dVvux-0003rJ-Rm
	for qemu-arm@nongnu.org; Fri, 14 Jul 2017 04:25:47 -0400
Received: from szxga02-in.huawei.com ([45.249.212.188]:3966)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_ARCFOUR_SHA1:16) (Exim 4.71)
	(envelope-from <gengdongjiu@huawei.com>)
	id 1dVvuw-0003nC-Td; Fri, 14 Jul 2017 04:25:43 -0400
Received: from 172.30.72.57 (EHLO DGGEML404-HUB.china.huawei.com)
	([172.30.72.57])
	by dggrg02-dlp.huawei.com (MOS 4.4.6-GA FastPath queued)
	with ESMTP id ARA32523; Fri, 14 Jul 2017 16:25:13 +0800 (CST)
Received: from [127.0.0.1] (10.142.68.147) by DGGEML404-HUB.china.huawei.com
	(10.3.17.39) with Microsoft SMTP Server id 14.3.301.0; Fri, 14 Jul 2017
	16:25:07 +0800
To: "Michael S. Tsirkin" <mst@redhat.com>, Laszlo Ersek <lersek@redhat.com>
References: <1499825297-20335-1-git-send-email-gengdongjiu@huawei.com>
	<1499825297-20335-2-git-send-email-gengdongjiu@huawei.com>
	<74ac9b79-0225-0cab-559f-6204754de5f0@redhat.com>
	<47cc803a-d1d9-da3b-43f9-31a54ce290e2@huawei.com>
	<ca0eaafd-21b7-9cf8-91aa-8c4e2c5d95e3@redhat.com>
	<20170713201112-mutt-send-email-mst@kernel.org>
From: gengdongjiu <gengdongjiu@huawei.com>
Message-ID: <c990e825-c05d-0aa6-da36-02e72adbfa9b@huawei.com>
Date: Fri, 14 Jul 2017 16:25:02 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:45.0) Gecko/20100101
	Thunderbird/45.7.1
MIME-Version: 1.0
In-Reply-To: <20170713201112-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.142.68.147]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
	refid=str=0001.0A0B0207.59687FE9.0187, ss=1, re=0.000, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0, ip=0.0.0.0,
	so=2014-11-16 11:51:01, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: b80903ea5934f136513a00e45c5cabfd
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
	[fuzzy]
X-Received-From: 45.249.212.188
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v5 1/3] ACPI: Add new ACPI
 structures and macros
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, wuquanming@huawei.com, famz@redhat.com,
	qemu-devel@nongnu.org, Gaozhihui <zhihui.gao@huawei.com>,
	qemu-arm@nongnu.org, james.morse@arm.com, huangshaoyu@huawei.com,
	zhaoshenglong@huawei.com, imammedo@redhat.com, zhengqiang10@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: T/oEu86c5f42

Dear Michael,

On 2017/7/14 1:13, Michael S. Tsirkin wrote:
> On Thu, Jul 13, 2017 at 05:33:30PM +0200, Laszlo Ersek wrote:
>> On 07/13/17 14:00, gengdongjiu wrote:
>>> Laszlo,
>>>   Thank you for your review and comments.
>>>
>>>
>>> On 2017/7/13 18:33, Laszlo Ersek wrote:
>>>> On 07/12/17 04:08, Dongjiu Geng wrote:
>>
>> [snip]
>>
>>>>> --- a/include/qemu/uuid.h
>>>>> +++ b/include/qemu/uuid.h
>>>>> @@ -44,6 +44,17 @@ typedef struct {
>>>>>  
>>>>>  #define UUID_NONE "00000000-0000-0000-0000-000000000000"
>>>>>  
>>>>> +#define UUID_BE(a, b, c, d0, d1, d2, d3, d4, d5, d6, d7)        \
>>>>> +{{{ ((a) >> 24) & 0xff, ((a) >> 16) & 0xff, ((a) >> 8) & 0xff, (a) & 0xff, \
>>>>> +   ((b) >> 8) & 0xff, (b) & 0xff,                   \
>>>>> +    ((c) >> 8) & 0xff, (c) & 0xff,                    \
>>>>> +    (d0), (d1), (d2), (d3), (d4), (d5), (d6), (d7) } } }
>>>>> +
>>>>> +/* Platform Memory, this is from UEFI 2.6 N.2.2 Section Descriptor */
>>>>> +#define UEFI_CPER_SEC_PLATFORM_MEM                   \
>>>>> +    UUID_BE(0xA5BC1114, 0x6F64, 0x4EDE, 0xB8, 0x63, 0x3E, 0x83, \
>>>>> +    0xED, 0x7C, 0x83, 0xB1)
>>>>> +
>>>>>  void qemu_uuid_generate(QemuUUID *out);
>>>>>  
>>>>>  int qemu_uuid_is_null(const QemuUUID *uu);
>>>>>
>>>>
>>>> (e) I think the addition of UUID_BE should be split out to a separate
>>>> patch; it adds a general facility. It should likely be the very first
>>>> patch in the series.
>>>   Ok.
>>>
>>>>
>>>> (f) While I think it is justified to have UUID_BE() in "qemu/uuid.h", I
>>>> think UEFI_CPER_SEC_PLATFORM_MEM is too specific to have here.
>>>>
>>>> If UEFI_CPER_SEC_PLATFORM_MEM were *not* a standardized UUID, I would
>>>> suggest moving it to the implementation ("include/hw/acpi/hest_ghes.h"
>>>> -- which in turn should be moved to patch #2, see my remark (d)), *plus*
>>>> I would suggest eliminating the new #include from "acpi-defs.h", see my
>>>> remark (b).
>>>   understand your idea.
>>>
>>>>
>>>> However, given that this UUID *is* standard, I suggest keeping the (b)
>>>> #include as you currently propose, and to move the definition of
>>>> UEFI_CPER_SEC_PLATFORM_MEM to "acpi-defs.h".
>>>   I agree with you.
>>>
>>>>
>>>> I vaguely recall that Michael commented on this previously, but I don't
>>>> remember what he said. Michael, are you OK with my suggestion?
>>>    Laszlo, I pasted Michael's comments here, as shown below. Michael said the definition
>>> should use build_append_int_noprefix to add data. but I think it may not good, becuase
>>> the section "UEFI_CPER_SEC_PLATFORM_MEM" is runtime recorded as CPER, not a ACPI/HEST
>>> table member, so it is not generated when system boot up.
>>
>> I agree: the UUID in question is not placed into the ACPI payload /
>> fw_cfg blobs, it is written into guest memory at runtime, into the
>> firmware-allocated area, if and when there is a hardware error to report.
>>
>> Thanks
>> Laszlo
> 
> The main point is that wrapping it up in a macro with an
> unreadable name is not really helpful when it's only
> used in a single place.

 As I said in another mail, I will move it to the place where it is used
 with the comment. thanks

> 
> 
>>> On the other hand,UEFI_CPER_SEC_PLATFORM_MEM
>>> definition is from UEFI spec 2.6, N.2.2 Section Descriptor: {0xA5BC1114, 0x6F64, 0x4EDE, {0xB8, 0x63, 0x3E, 0x83, 0xED, 0x7C, 0x83, 0xB1}}.
>>> if use  build_append_int_noprefix to add, may confuse others.
>>>
>>> -----------------------------------------------------------------
>>> -----------------------------------------------------------------
>>> There's no reason to define these messy one-time use macros.
>>> They just make it hard to look things up in the spec.
>>>
>>>
>>> You can use build_append_int_noprefix to add data of
>>> any length in LE format.
>>> -----------------------------------------------------------------
>>> -----------------------------------------------------------------
>>>
>>> Hi  Michael,
>>>   what is your suggestion about it? do you agree with Laszlo?
> 
> My main point is that the macros do not seem helpful.
> 
> 
> 
> .
> 

