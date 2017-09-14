Received: by 10.223.172.38 with SMTP id v35csp1173871wrc;
        Thu, 14 Sep 2017 11:08:50 -0700 (PDT)
X-Received: by 10.55.188.131 with SMTP id m125mr3444860qkf.12.1505412530472;
        Thu, 14 Sep 2017 11:08:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1505412530; cv=none;
        d=google.com; s=arc-20160816;
        b=BM6kgpr0T3jRAqBYyJfIFP/bmTcDaMg96SzleSGGR8cFQURwUXofyU9XqMzDo1aboT
         lmaPCqu1D8iChKdw1USquvlQG8/FiKcUtvOUXq7QxOQ68t/o0mrXF0/O1ZmCwF/0xxPP
         QYYij6BXTLtahTWufIRFnu3IpoCisigXDTlkF2/NzFknbl0yJxcr/IYBVYuaHZDDNn+O
         2uyfPzlY+Z7gnt+uArmxwOkc1awAzHqaRa6NgeixEfkGuFPIkAeJ0P7Brjuofrp1b3yI
         NA1Qtv0X53ZQkfnvRIlT0N++YtYdsl/PRDifmnoy/p11DT8PQklJmJ00CIkEyL/DelJS
         CEww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=YlqhK39bUbf60GcRMRcIiguN4zjCFyjMV/kXsz9BJ2Q=;
        b=wDX/GAiLLw5/sSp8xJEUDkQV2T/vz3n71ah2a/BCrlQEZ9fucNRAObcKHHXNGVqOUd
         YOaul0ggKLi8EsI3O4E1mhisO5Tvqu89cWlUHg7rNOj8kCEF2mwTUi9rGwIguiTKkjQn
         Pt/tdV3z2XKj0VnzYNa++fQcoeQ8NB2Iv1bCCo0jmfdk9aOI9PbzbjxsZ2ISZWx8geeI
         UPEwT2NMzONj4hDPVaJ7MaOb26FhoQR2WCsZlkURDNzFWwdwzBRnyaN3F0Xn2KNAc4Rj
         fgJcGiUCIlZaYk82/9v5gQgcUX/2Adp+zV+qk/BuWbi/PsR4wgcesqa2eEetDNlOGBaz
         6m2w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=eKSlhWpM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b11si1814010qte.509.2017.09.14.11.08.49
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 14 Sep 2017 11:08:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=eKSlhWpM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:49277 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dsYZE-0002gP-3e
	for alex.bennee@linaro.org; Thu, 14 Sep 2017 14:08:48 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57745)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dsYW1-000051-Va
	for qemu-arm@nongnu.org; Thu, 14 Sep 2017 14:05:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dsYVx-0007w0-VU
	for qemu-arm@nongnu.org; Thu, 14 Sep 2017 14:05:29 -0400
Received: from mail-qt0-x231.google.com ([2607:f8b0:400d:c0d::231]:46150)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dsYVx-0007ve-Qb; Thu, 14 Sep 2017 14:05:25 -0400
Received: by mail-qt0-x231.google.com with SMTP id s18so138989qta.3;
	Thu, 14 Sep 2017 11:05:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=YlqhK39bUbf60GcRMRcIiguN4zjCFyjMV/kXsz9BJ2Q=;
	b=eKSlhWpMNhZMBxbPyLpkD0xyG5K0yGOOz/JoZFliwOU8KhwE11btoXfe6hrR1iGDgj
	h3sPkKUuv2Cn6DTIZisHbTPOC7G/ODT+0A0/pWiuPc6jao/AYs8Rk9bLjSr/3t/xYAeU
	3F+KInwRBUYWMQLMX8liosgcT1L5n/V36iz2lW2oCY5+TLg2uXlgYvJIpmrm1rOeIkoZ
	k08ctJAK7JiuC0u1jQpz+MyMy6iDjWgdxIThBNWMyAxzfQv8XBA9/8lmvDEI60Y6m3AE
	QlOFIH01Nzk7O0p0EbtEDZBtKT5svnQ75MyZtEpxr6ghD7EjEympth4V4J3ekhrU+HD0
	DlJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=YlqhK39bUbf60GcRMRcIiguN4zjCFyjMV/kXsz9BJ2Q=;
	b=pwP3bjrQkMI0UbjShCwJI2F5IeqmmzlqzYPqwpDR1M1pSJ9n97k/tlN8QBETBEjU8f
	0SWP5S2PP5BmP3bNOLL+Fn8aWMzEhkBm7gxe7zQ35HnRsoY5s7k2dPZJw6EwlssYpnvD
	Jk69OLokSNoSqF51ompeP7tqM26vDuK/3YI9G5nW2hF6J68mi581sxW3xxusyLT8ZAs/
	NQGMRv+oAzmZEY4xYGtBoLsX9kjpo1aq1bcROa/V7Lc2/0Zt/NuYuFU4gQ+vwdpkuLYL
	ut4FWT07Qk5BeDZCq2OO9eGMLFlY6vg4MxV9s/rCNTV2d1GMKtQRp2f2gDx+IZ3bQfS6
	n3dQ==
X-Gm-Message-State: AHPjjUjNfjEyWORrFQBVg3m56uBuj4dTJPiieaQXfCmSHT2ORTU1XfdB
	c9C0f2qnXeaJ0Q==
X-Google-Smtp-Source: AOwi7QD2JwiDpuID3o3o40GgIqcwhNUk6IHayq6AIZiwqHiJLxoGRJLjKQmO6xyVj29QmzZMIkBt9w==
X-Received: by 10.200.5.2 with SMTP id u2mr10561645qtg.131.1505412325220;
	Thu, 14 Sep 2017 11:05:25 -0700 (PDT)
Received: from [192.168.1.10] ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id
	x189sm11182829qkd.70.2017.09.14.11.05.22
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 14 Sep 2017 11:05:24 -0700 (PDT)
To: sundeep subbaraya <sundeep.lkml@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>
References: <1504812251-23438-1-git-send-email-sundeep.lkml@gmail.com>
	<1504812251-23438-3-git-send-email-sundeep.lkml@gmail.com>
	<a9891f10-9643-96ee-7f99-7a384b9ea302@amsat.org>
	<CAFEAcA8KUtG=2Cr_PndUqOxp5PN6bTJR_t=s+Ch+Y2WVfHVjQg@mail.gmail.com>
	<CALHRZupPj2cJJAr57n+E6Q0xF1qpsewHsDzS03mQmoHfL98j6g@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <99bf0b39-f889-7873-55cf-05ac3a55a55e@amsat.org>
Date: Thu, 14 Sep 2017 15:05:21 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <CALHRZupPj2cJJAr57n+E6Q0xF1qpsewHsDzS03mQmoHfL98j6g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::231
Subject: Re: [Qemu-arm] [Qemu devel v8 PATCH 2/5] msf2: Microsemi
 Smartfusion2 System Register block
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
Cc: Alistair Francis <alistair23@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: o0DPbRxdIg3D

>>>> +static uint64_t msf2_sysreg_read(void *opaque, hwaddr offset,
>>>> +    unsigned size)
>>>> +{
>>>> +    MSF2SysregState *s = opaque;
>>>> +    uint32_t ret = 0;
>>>> +
>>>> +    offset >>= 2;
>>>> +    if (offset < ARRAY_SIZE(s->regs)) {
>>>
>>>
>>> This comment is controversial, I'll let Peter nod.
>>>
>>> The SYSREG behaves differently regarding which bus access it (CPU, AHB).
>>> You are implementing CPU access to the SYSREG, the registers have
>> different
>>> permissions when accessed by the CPU. (see the SmartFusion2 User Guide:
>>> Table 21-1 "Register Types" and Table 21-2 "Register Map").
>>
> 
> CPU is also one of the bus masters in AHB matrix (Fig 6.1 in page 248).

I was worried about Fabric access but Peter remembered me QEMU doesn't 
model it ;)

>>> I'd think of this stub:
>>>
>>> switch(reg) {
>>> case register_supported1:
>>> case register_supported2:
>>> case register_supported3:
>>>             ret = s->regs[offset];
>>>             trace_msf2_sysreg_read(offset, ret);
>>>             break;
>>> case RO-U:
>>>             qemu_log_mask(LOG_GUEST_ERROR, "Illegal AHB access 0x%08"...
>>>             break;
>>> case W1P:
>>>             qemu_log_mask(LOG_GUEST_ERROR, "Illegal read access ...
>>>             break;
>>> case RW:
>>> case RW-P:
>>> case RO:
>>> case RO-P:
>>> default:
>>>             ret = s->regs[offset];
>>>             qemu_log_mask(LOG_UNIMP, "...
>>>             break;
>>> }
>>
> 
> This sounds good to me and will fix later by rearranging registers in enum
> sorted
> based on type (RO, RW, etc.,) and use those ranges in switch case.

The Register API (hw/register.h) is helpful to check such properties but 
might turn your code harder to read.

>>
>> This doesn't look entirely right, since this is the read interface.
>> Shouldn't we be allowing pretty much all of these register types
>> except maybe W1P to do a read?
>>
> 
> Peter, some of the registers are not allowed to access by CPU and are only
> set during
> device programming. For those registers Philippe is suggesting to log
> "Illegal AHB access"
> when guest is trying to read/write.

I was worried about accessing those registers when the flash 
WriteProtect bit is set, however the eNVM flash library is not Open 
Source, it is unlikely a guest access those registers, and if it is the 
library then MicroSemi already tried it on real hardware.
There is probably no need to worry about "Illegal AHB access" :)

>> On the other hand, in the write function we should probably not allow
>> writes to registers documented as read only.

Surely.

trace_msf2_sysreg_write(offset, s->regs[offset], ret);

switch(reg) {
case register_supported1:
case register_supported2:
case register_supported3:
            s->regs[offset] = ret;
            break;
case RO:
case RO-P:
case RO-U:
            qemu_log_mask(LOG_GUEST_ERROR, "Illegal write access on RO...
            break;
default:
            qemu_log_mask(LOG_UNIMP, "...
            break;
}
