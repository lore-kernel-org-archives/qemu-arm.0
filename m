Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp4694866wrw;
        Tue, 13 Nov 2018 10:16:39 -0800 (PST)
X-Google-Smtp-Source: AJdET5diupxIMy6urakvbl3j5kQs9GQ57rjgRz/WvHZN1JqYlDwsKRWY4rvio6n6W2srIvX/aboy
X-Received: by 2002:ac8:274a:: with SMTP id h10mr6069276qth.189.1542132999909;
        Tue, 13 Nov 2018 10:16:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542132999; cv=none;
        d=google.com; s=arc-20160816;
        b=wjQNzNED8QgpFF2pCpZzIaOdK4qcuqqb6WX+c9WZvvBQZ+Ehumd1PcHNcQfMCWsRRI
         aAUSJQ32dnUIYdTsc5K2cNroQRUSsYk34JKdyF/C6Ehn/xpKx7SVuRHO4pALVytjmVoR
         JvjgH358otJ76msvnv2j2jJkMrsINScFPQFuSdsh8J4agNFMitYj3sSmo7iai9qBWW+h
         6f31b1gMtCaNjschtsLvIRfXHbdkfls0f8/7ZXGxwv45WpWrvggqVW+DU8vIggqRNHvo
         OEfqwlNvFzzf7m2Kqwo5SlBWIOmu1rQTitthsZVyXPc6yG/zTW1saY3i/KkWonF0gIPY
         Hr1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=8Ujp6vkMR4Wdzf4G4qAa0KajRlUTAvobiL9LBpvgWxg=;
        b=DJH2NhxnjAVUErJ3m1zferExtE6UlcrK3j5oLQo6sEXYieRjaurDCfEYdBHVUHUMLs
         +SYV/3Dd25z0Iat1ddfCnubXKazmd8J0KMnQlD/aM5y1EZxlSmsmoFLysUEENTgFJcyI
         qKMhaBWdvir3E7D7c2fMeVewivTk6v4Q3xDztvIEz5l8uGCvDoGiT4mvTEi8di3Iunle
         xrZF3uUC9o/engujn7a5b1dYejoF24zYDYQ0rqkfsqJxBkeoHy8xhS+Nkg970oC0Ch2L
         tUjT1MXOs/RlSNLg9VHEir6UPVeDzKTeilgyr+gXmxnhvZqLeZB64tpGI2MsVtjOmHx3
         0Bfg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m20-v6si4924395qtq.273.2018.11.13.10.16.39
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 13 Nov 2018 10:16:39 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:55567 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gMdEt-0004Fu-43
	for alex.bennee@linaro.org; Tue, 13 Nov 2018 13:16:39 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57957)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gMdE9-0003DU-2M
	for qemu-arm@nongnu.org; Tue, 13 Nov 2018 13:15:58 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gMd1g-00084P-NV
	for qemu-arm@nongnu.org; Tue, 13 Nov 2018 13:03:03 -0500
Received: from mail-wm1-f66.google.com ([209.85.128.66]:34979)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1gMd1g-00083t-Ge
	for qemu-arm@nongnu.org; Tue, 13 Nov 2018 13:03:00 -0500
Received: by mail-wm1-f66.google.com with SMTP id t15-v6so12380041wmt.0
	for <qemu-arm@nongnu.org>; Tue, 13 Nov 2018 10:03:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=8Ujp6vkMR4Wdzf4G4qAa0KajRlUTAvobiL9LBpvgWxg=;
	b=kYTdyjkknemJfm3naQwZG5Z1fI9eTwlYrtynHBFH9xnITUFuXAV8VQNmMr/BEL6zIl
	ah+CpQ/byAygYbBSeBbmsvyK0Zlv9b9UwBn92vuz8Dt7uLqcZwzr4crMJyMLbcMcyslp
	6whruTOcGKtNCbvUmOV1GIaeAGkI8h1NoZRf/Z9T5O9RRxzAZycy+3zl6LWWcEq/Bzl4
	VRwCe0jdFkHpFhxe3In/Xs0rFNtZndqNI97dwCGFfK/REhsg6MNOztCvCsgN1K3EUfoL
	P2xx1Yi1cyEL5HcJKgoRrLbVVRKzUQI39v0H9WNQtdtbkes0RESQ/CSEiJUli+FQAK6O
	xQMg==
X-Gm-Message-State: AGRZ1gKccl78dSwBTghqdqtZGsaPKFXVmIV63COzYIb0WeLGStx3RFFp
	GN7Yv4H66J2GAFbFGiwH2OHrKsUD8io=
X-Received: by 2002:a1c:eed3:: with SMTP id j80mr4014870wmi.58.1542132179284; 
	Tue, 13 Nov 2018 10:02:59 -0800 (PST)
Received: from [192.168.1.36] (2.red-83-59-163.dynamicip.rima-tde.net.
	[83.59.163.2]) by smtp.gmail.com with ESMTPSA id
	x142-v6sm36887890wmd.20.2018.11.13.10.02.58
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 13 Nov 2018 10:02:58 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>,
	Samuel Ortiz <sameo@linux.intel.com>
References: <20181113165247.4806-1-sameo@linux.intel.com>
	<20181113165247.4806-3-sameo@linux.intel.com>
	<CAFEAcA-R51dyV7gtS+q-eLNn5LBJbSMKtQu4-N3p0c4mJrU8DA@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <37b5f17e-50cd-6980-2d42-4e7f4ede2597@redhat.com>
Date: Tue, 13 Nov 2018 19:02:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.3.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-R51dyV7gtS+q-eLNn5LBJbSMKtQu4-N3p0c4mJrU8DA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.128.66
Subject: Re: [Qemu-arm] [PATCH 02/13] target: arm: Remove unused headers
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
Cc: qemu-arm <qemu-arm@nongnu.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Pv7FbKez968P

On 13/11/18 18:01, Peter Maydell wrote:
> On 13 November 2018 at 16:52, Samuel Ortiz <sameo@linux.intel.com> wrote:
>> From: Philippe Mathieu-Daudé <philmd@redhat.com>
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> Reviewed-by: Robert Bradford <robert.bradford@intel.com>
>> Reviewed-by: Samuel Ortiz <sameo@linux.intel.com>
>> ---
>>   target/arm/helper.c | 3 ---
>>   1 file changed, 3 deletions(-)
>>
>> diff --git a/target/arm/helper.c b/target/arm/helper.c
>> index 3d4e9c5c8a..27d9285e1e 100644
>> --- a/target/arm/helper.c
>> +++ b/target/arm/helper.c
>> @@ -12,13 +12,10 @@
>>   #include "internals.h"
>>   #include "exec/gdbstub.h"
>>   #include "exec/helper-proto.h"
>> -#include "qemu/host-utils.h"
> 
> This is for muldiv64().

But it is already included by "cpu.h" -> "exec/cpu-defs.h"

> 
>>   #include "sysemu/arch_init.h"
>>   #include "sysemu/sysemu.h"
>> -#include "qemu/bitops.h"

"cpu.h" -> "cpu-qom.h" -> "qom/cpu.h" -> "qemu/bitmap.h"

> 
> This is for extract32() and friends.
> 
>>   #include "qemu/crc32c.h"
>>   #include "exec/exec-all.h"
>> -#include "exec/cpu_ldst.h"
> 
> This is for cpu_stl_data().

Included by "arm_ldst.h"

> 
>>   #include "arm_ldst.h"
>>   #include <zlib.h> /* For crc32 */
>>   #include "exec/semihost.h"

So they are not "unused" but "unnecessary".

I thought this would be better to clean this once, before Samuel split.

Samuel: please drop this patch from your series.

Thanks,

Phil.
