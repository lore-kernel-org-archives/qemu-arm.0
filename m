Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp9055293wrx;
        Fri, 8 Mar 2019 18:34:22 -0800 (PST)
X-Google-Smtp-Source: APXvYqxSWe9gSTcK958yVzBn6hywFnhqWIUzq3o2UtrqPA6TZa59w/pzdAT/UEu1RoX1AHjxQeQS
X-Received: by 2002:a25:3785:: with SMTP id e127mr18908354yba.509.1552098861925;
        Fri, 08 Mar 2019 18:34:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1552098861; cv=none;
        d=google.com; s=arc-20160816;
        b=lBxuJmTreMgsmuZwwrHmgAr38GvO2t02zKWYUskdN6vIxKzYPK0fwxq1BAYrzP1Kze
         /iFlP02wsy4o2nhkSUQ8aisBOx+JqXngPYD04VAd6NIF3sHGSgp8d0YaNkmI9mDNlmFY
         lVZLi5wMxSO6XiLXsBM1zmN+rjKeBOtrEFcb42HCw7I7ECJpwqO7G98s0NYOUKg0+3gB
         GwC14kyiMEWlnrj88Y+JqMsgXyVx9qgt+lCZC4TCFbNberW685rOh0MJ8KVAyvsYYVux
         cSsyvlEeYO+LBxe8nMuPgIVqpW1H7bvh2y54fNVbkMRQWAWz1koRFts+qwX9ig9HWRx+
         nWGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to;
        bh=vRG+b8dfIFhOsh3xUSf4QsXTLVZ/48ReXLk3pkwKOjE=;
        b=OALs69Ibi9dh5XIbAUrEFM8lGMvPgZkZJtIwtLwmLLHPeGs0t5Q63pCj53WebmpgZh
         9sHIhBTnWgdnkZLHONqmXDdtj8SMcFvmJTD8zuzSe9W7o1+uuBfxsea03kyu897hNZa4
         dwFt8kSnyMFYZpOKVsSaiE1yfr0v3GaxlgAepeJfWa1g8FmA9GYKqp/rkKHMh/ih8E8a
         uqxo3n6WNZjhPr4AmYjYDPtHAWmThnN+JO8FAFbNRznrSD0dARhCGCZcdJm3Ah69ju+R
         gnvLER2N3u9P1XEhPbB92glwCbMyYgTn07sja//fL4F429hHlhvsgSzZ57MIp3SGHe38
         KClQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e144si5295170yba.178.2019.03.08.18.34.21
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 08 Mar 2019 18:34:21 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:52967 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h2Rob-0001xF-7L
	for alex.bennee@linaro.org; Fri, 08 Mar 2019 21:34:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42865)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <guoheyi@huawei.com>) id 1h2RoH-0001vJ-Sp
	for qemu-arm@nongnu.org; Fri, 08 Mar 2019 21:34:02 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <guoheyi@huawei.com>) id 1h2RoH-0006f2-2t
	for qemu-arm@nongnu.org; Fri, 08 Mar 2019 21:34:01 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:2245 helo=huawei.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <guoheyi@huawei.com>)
	id 1h2RoG-0006bz-LD; Fri, 08 Mar 2019 21:34:01 -0500
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.58])
	by Forcepoint Email with ESMTP id 85025CB63B77D349C601;
	Sat,  9 Mar 2019 10:33:57 +0800 (CST)
Received: from [127.0.0.1] (10.177.31.55) by DGGEMS404-HUB.china.huawei.com
	(10.3.19.204) with Microsoft SMTP Server id 14.3.408.0; Sat, 9 Mar 2019
	10:33:49 +0800
To: Igor Mammedov <imammedo@redhat.com>
References: <1551879417-21031-1-git-send-email-guoheyi@huawei.com>
	<1551879417-21031-2-git-send-email-guoheyi@huawei.com>
	<20190306173420.3614a38b@Igors-MacBook-Pro.local>
From: Heyi Guo <guoheyi@huawei.com>
Message-ID: <266bac89-2be1-3ee7-55c3-74053918ae66@huawei.com>
Date: Sat, 9 Mar 2019 10:33:46 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:45.0) Gecko/20100101
	Thunderbird/45.7.1
MIME-Version: 1.0
In-Reply-To: <20190306173420.3614a38b@Igors-MacBook-Pro.local>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.177.31.55]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 45.249.212.191
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v4 1/2] hw/arm/acpi: simplify
 AML bit and/or statement
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	"Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org, Shannon
	Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org,
	wanghaibin.wang@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: n+0HdTqXyT8Q



On 2019/3/7 0:34, Igor Mammedov wrote:
> On Wed, 6 Mar 2019 21:36:56 +0800
> Heyi Guo <guoheyi@huawei.com> wrote:
>
>> The last argument of AML bit and/or statement is the target variable,
>> so we don't need to use a NULL target and then an additional store
>> operation; a single bit and/or statement is enough.
> s: a single bit and/or : using just aml_and() or aml_and() "
>
> With commit message fixed up:
>
> Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Thanks; have fixed it in v5.

Heyi

>
>> Cc: Shannon Zhao <shannon.zhaosl@gmail.com>
>> Cc: Peter Maydell <peter.maydell@linaro.org>
>> Cc: "Michael S. Tsirkin" <mst@redhat.com>
>> Cc: Igor Mammedov <imammedo@redhat.com>
>> Suggested-by: Igor Mammedov <imammedo@redhat.com>
>> Signed-off-by: Heyi Guo <guoheyi@huawei.com>
>> ---
>>   hw/arm/virt-acpi-build.c | 16 ++++++++--------
>>   1 file changed, 8 insertions(+), 8 deletions(-)
>>
>> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
>> index d7e2e48..cebec4c 100644
>> --- a/hw/arm/virt-acpi-build.c
>> +++ b/hw/arm/virt-acpi-build.c
>> @@ -265,17 +265,17 @@ static void acpi_dsdt_add_pci(Aml *scope, const MemMapEntry *memmap,
>>           aml_create_dword_field(aml_arg(3), aml_int(8), "CDW3"));
>>       aml_append(ifctx, aml_store(aml_name("CDW2"), aml_name("SUPP")));
>>       aml_append(ifctx, aml_store(aml_name("CDW3"), aml_name("CTRL")));
>> -    aml_append(ifctx, aml_store(aml_and(aml_name("CTRL"), aml_int(0x1D), NULL),
>> -                                aml_name("CTRL")));
>> +    aml_append(ifctx, aml_and(aml_name("CTRL"), aml_int(0x1D),
>> +                              aml_name("CTRL")));
>>   
>>       ifctx1 = aml_if(aml_lnot(aml_equal(aml_arg(1), aml_int(0x1))));
>> -    aml_append(ifctx1, aml_store(aml_or(aml_name("CDW1"), aml_int(0x08), NULL),
>> -                                 aml_name("CDW1")));
>> +    aml_append(ifctx1, aml_or(aml_name("CDW1"), aml_int(0x08),
>> +                              aml_name("CDW1")));
>>       aml_append(ifctx, ifctx1);
>>   
>>       ifctx1 = aml_if(aml_lnot(aml_equal(aml_name("CDW3"), aml_name("CTRL"))));
>> -    aml_append(ifctx1, aml_store(aml_or(aml_name("CDW1"), aml_int(0x10), NULL),
>> -                                 aml_name("CDW1")));
>> +    aml_append(ifctx1, aml_or(aml_name("CDW1"), aml_int(0x10),
>> +                              aml_name("CDW1")));
>>       aml_append(ifctx, ifctx1);
>>   
>>       aml_append(ifctx, aml_store(aml_name("CTRL"), aml_name("CDW3")));
>> @@ -283,8 +283,8 @@ static void acpi_dsdt_add_pci(Aml *scope, const MemMapEntry *memmap,
>>       aml_append(method, ifctx);
>>   
>>       elsectx = aml_else();
>> -    aml_append(elsectx, aml_store(aml_or(aml_name("CDW1"), aml_int(4), NULL),
>> -                                  aml_name("CDW1")));
>> +    aml_append(elsectx, aml_or(aml_name("CDW1"), aml_int(4),
>> +                               aml_name("CDW1")));
>>       aml_append(elsectx, aml_return(aml_arg(3)));
>>       aml_append(method, elsectx);
>>       aml_append(dev, method);
>
> .
>


