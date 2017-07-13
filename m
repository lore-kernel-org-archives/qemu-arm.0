Received: by 10.25.44.15 with SMTP id s15csp2320432lfs;
        Thu, 13 Jul 2017 08:36:58 -0700 (PDT)
X-Received: by 10.237.60.189 with SMTP id d58mr6108145qtf.126.1499960218410;
        Thu, 13 Jul 2017 08:36:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1499960218; cv=none;
        d=google.com; s=arc-20160816;
        b=vx4sGEqupMoA7vQ+obJ3xmxCWoKg7fQIygL0bhAOtTu5rxt6xeGtQgiVaXRhKIX3Y+
         Yj49SYa91/n9qmcUDhEOPdeJ0G8QkMjzS7L+/12LFRS1F61F1Y0YSQ7bAvCUlKTJDTJV
         P4f0Bio4CzP2d3L+ns7ECgB18PG9LYT5NVRGwogSG5V1iP+54T8abJ54GwI2hTlZ7R3t
         sLi+qgXQEnJFGHSesjn20bnLAbeZirXajh/dTMTkXgBCUHoxHt1m8r6BMaYNrJy5hdCo
         u6qtrPJJJlBstDco5G2lGpz3Kje8CBpzhaVcFRXeJ4yLZCrVutXwLlT3MlLvIyibpiMr
         pE9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-filter
         :dmarc-filter:arc-authentication-results;
        bh=uU8XQPSBkbBh1W+2nLpPLHIHTvZf7l4+1t6QkNHSfnY=;
        b=kfkG3/L+fDNnrmdVWub+2HSDJKaqWXWLhQyRdcp8flT0mLVt1K+tGiMp6UD1MlF9+9
         hwqgHRi3tmo8UFlGK7vV2iO+g6k2pjl+/1jPwqJVGOvXiCdG25O+CtOFZXSAoqZJssvO
         MAZbCpbJLe0MJtlafWtMAZcu1b9bKWQTirY9sHewFPSdOAHwJ8iY0YN3DDFEndfEfJtk
         2Nxj0qpr9s33ICnzgGksAXaghUvkn6ql0zAc7hEkzCwcTThjWzuMbGlBiZWjWs8ErM8u
         oiA1pWQ+5WgKwpZbm8HJ3muZyU64epOa7zPiUjjfxTMkhz4Z5T3TTG/YW9Obr3akz9x7
         9lTA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id i22si5438234qtc.237.2017.07.13.08.36.57
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 13 Jul 2017 08:36:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:60735 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dVgAh-0007RD-G8
	for alex.bennee@linaro.org; Thu, 13 Jul 2017 11:36:55 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48554)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lersek@redhat.com>) id 1dVg7e-0004jC-AA
	for qemu-arm@nongnu.org; Thu, 13 Jul 2017 11:33:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lersek@redhat.com>) id 1dVg7d-0007hU-7o
	for qemu-arm@nongnu.org; Thu, 13 Jul 2017 11:33:46 -0400
Received: from mx1.redhat.com ([209.132.183.28]:60304)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <lersek@redhat.com>)
	id 1dVg7c-0007gy-VX; Thu, 13 Jul 2017 11:33:45 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A7F4F5114A;
	Thu, 13 Jul 2017 15:33:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com A7F4F5114A
Authentication-Results: ext-mx10.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx10.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=lersek@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com A7F4F5114A
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-116-47.phx2.redhat.com
	[10.3.116.47])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1B638709F3;
	Thu, 13 Jul 2017 15:33:31 +0000 (UTC)
To: gengdongjiu <gengdongjiu@huawei.com>, mst@redhat.com,
	imammedo@redhat.com, famz@redhat.com, qemu-devel@nongnu.org,
	zhaoshenglong@huawei.com, peter.maydell@linaro.org, qemu-arm@nongnu.org,
	james.morse@arm.com, zhengqiang10@huawei.com, huangshaoyu@huawei.com,
	wuquanming@huawei.com, Gaozhihui <zhihui.gao@huawei.com>
References: <1499825297-20335-1-git-send-email-gengdongjiu@huawei.com>
	<1499825297-20335-2-git-send-email-gengdongjiu@huawei.com>
	<74ac9b79-0225-0cab-559f-6204754de5f0@redhat.com>
	<47cc803a-d1d9-da3b-43f9-31a54ce290e2@huawei.com>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <ca0eaafd-21b7-9cf8-91aa-8c4e2c5d95e3@redhat.com>
Date: Thu, 13 Jul 2017 17:33:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <47cc803a-d1d9-da3b-43f9-31a54ce290e2@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Thu, 13 Jul 2017 15:33:43 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /pcNI7csSVii

On 07/13/17 14:00, gengdongjiu wrote:
> Laszlo,
>   Thank you for your review and comments.
> 
> 
> On 2017/7/13 18:33, Laszlo Ersek wrote:
>> On 07/12/17 04:08, Dongjiu Geng wrote:

[snip]

>>> --- a/include/qemu/uuid.h
>>> +++ b/include/qemu/uuid.h
>>> @@ -44,6 +44,17 @@ typedef struct {
>>>  
>>>  #define UUID_NONE "00000000-0000-0000-0000-000000000000"
>>>  
>>> +#define UUID_BE(a, b, c, d0, d1, d2, d3, d4, d5, d6, d7)        \
>>> +{{{ ((a) >> 24) & 0xff, ((a) >> 16) & 0xff, ((a) >> 8) & 0xff, (a) & 0xff, \
>>> +   ((b) >> 8) & 0xff, (b) & 0xff,                   \
>>> +    ((c) >> 8) & 0xff, (c) & 0xff,                    \
>>> +    (d0), (d1), (d2), (d3), (d4), (d5), (d6), (d7) } } }
>>> +
>>> +/* Platform Memory, this is from UEFI 2.6 N.2.2 Section Descriptor */
>>> +#define UEFI_CPER_SEC_PLATFORM_MEM                   \
>>> +    UUID_BE(0xA5BC1114, 0x6F64, 0x4EDE, 0xB8, 0x63, 0x3E, 0x83, \
>>> +    0xED, 0x7C, 0x83, 0xB1)
>>> +
>>>  void qemu_uuid_generate(QemuUUID *out);
>>>  
>>>  int qemu_uuid_is_null(const QemuUUID *uu);
>>>
>>
>> (e) I think the addition of UUID_BE should be split out to a separate
>> patch; it adds a general facility. It should likely be the very first
>> patch in the series.
>   Ok.
> 
>>
>> (f) While I think it is justified to have UUID_BE() in "qemu/uuid.h", I
>> think UEFI_CPER_SEC_PLATFORM_MEM is too specific to have here.
>>
>> If UEFI_CPER_SEC_PLATFORM_MEM were *not* a standardized UUID, I would
>> suggest moving it to the implementation ("include/hw/acpi/hest_ghes.h"
>> -- which in turn should be moved to patch #2, see my remark (d)), *plus*
>> I would suggest eliminating the new #include from "acpi-defs.h", see my
>> remark (b).
>   understand your idea.
> 
>>
>> However, given that this UUID *is* standard, I suggest keeping the (b)
>> #include as you currently propose, and to move the definition of
>> UEFI_CPER_SEC_PLATFORM_MEM to "acpi-defs.h".
>   I agree with you.
> 
>>
>> I vaguely recall that Michael commented on this previously, but I don't
>> remember what he said. Michael, are you OK with my suggestion?
>    Laszlo, I pasted Michael's comments here, as shown below. Michael said the definition
> should use build_append_int_noprefix to add data. but I think it may not good, becuase
> the section "UEFI_CPER_SEC_PLATFORM_MEM" is runtime recorded as CPER, not a ACPI/HEST
> table member, so it is not generated when system boot up.

I agree: the UUID in question is not placed into the ACPI payload /
fw_cfg blobs, it is written into guest memory at runtime, into the
firmware-allocated area, if and when there is a hardware error to report.

Thanks
Laszlo

> On the other hand,UEFI_CPER_SEC_PLATFORM_MEM
> definition is from UEFI spec 2.6, N.2.2 Section Descriptor: {0xA5BC1114, 0x6F64, 0x4EDE, {0xB8, 0x63, 0x3E, 0x83, 0xED, 0x7C, 0x83, 0xB1}}.
> if use  build_append_int_noprefix to add, may confuse others.
> 
> -----------------------------------------------------------------
> -----------------------------------------------------------------
> There's no reason to define these messy one-time use macros.
> They just make it hard to look things up in the spec.
> 
> 
> You can use build_append_int_noprefix to add data of
> any length in LE format.
> -----------------------------------------------------------------
> -----------------------------------------------------------------
> 
> Hi  Michael,
>   what is your suggestion about it? do you agree with Laszlo?
