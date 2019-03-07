Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp6563775wrx;
        Wed, 6 Mar 2019 17:07:52 -0800 (PST)
X-Google-Smtp-Source: APXvYqxT8nK3BOpGG+mDdse5g1N/JfoqOJoFsKH8rxXrP+k0vNre+mxHrNCX9XWTaI/gUWwf8FKQ
X-Received: by 2002:a25:6c43:: with SMTP id h64mr9463891ybc.422.1551920872691;
        Wed, 06 Mar 2019 17:07:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1551920872; cv=none;
        d=google.com; s=arc-20160816;
        b=QdIlnmLoeL1kIO0a3EC7ng/VzO9hQJxDUU5DYOx2pjk0cF2yXimsyrES3hsTwAZc0O
         dMSlNRRPHeN9A5BoMeFbaJzhMEMmKT9hOcJHlBvMvJhF799X+RJZlqhIcrsCCvk1yDs2
         rTQZ/UB3ZHtbG0NNPAivA3uKhveOJwvBNLZt4LxMphpagFWD3ndj+8aS3wVm+Q3KAdq1
         toT1ph2XF0HB63SJRlORCLTu4fXFhm+/qV7XWc+0+b+/8ReUXt8chgoZe2Nq9SCewmiI
         2uuZkhlrIJX6WY3H8mArxKx1AqstNv47jntJ4qCNmEmAlkBDUrJT4cBUJrGIjS09uis6
         OY8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to;
        bh=MDqF42G3682gm5ZkAD3O8tCvnBT4WgXtWLnrcmZ+3xc=;
        b=VxdXc5tYnZNJKwLcWjx3w+S0WKGjUNc07kc/QzxWl8EXz9LigJhI500KJb9XETV2UG
         trVx/sQQdL+FAMASV27ljo6EAn7P/f0IB5ex+xXdEAU6r2FCYzfrUP6Yi3eo1WD+BLTo
         SgMMukDpjd7Ncmqc65v8kV6yzoTCbt8vQ2wKP9ZDLxSO5cGtw+9efqUg0PCo4o1cET6f
         OEy+C0JjB6YteJCAqdNmYz9OizLOVVB3yvGw7WgpBwVSbyTEcQ+7eiqQ5VhQr/dVVc84
         dNFT0siW/PMebbgOfHpcS2nM3EXjlPco47xowkaVVl6gmim6GNLgwIxl2vsz2Q5RVugk
         nuDw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x4si2058209ybf.236.2019.03.06.17.07.52
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 06 Mar 2019 17:07:52 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:42239 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h1hVo-0000DI-5E
	for alex.bennee@linaro.org; Wed, 06 Mar 2019 20:07:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60348)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <guoheyi@huawei.com>) id 1h1hVd-0000Cv-5A
	for qemu-arm@nongnu.org; Wed, 06 Mar 2019 20:07:42 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <guoheyi@huawei.com>) id 1h1hVc-0007P0-6X
	for qemu-arm@nongnu.org; Wed, 06 Mar 2019 20:07:41 -0500
Received: from szxga06-in.huawei.com ([45.249.212.32]:49338 helo=huawei.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <guoheyi@huawei.com>)
	id 1h1hVb-0007Oh-PJ; Wed, 06 Mar 2019 20:07:40 -0500
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.58])
	by Forcepoint Email with ESMTP id 449DAEB42358C9B78714;
	Thu,  7 Mar 2019 09:07:35 +0800 (CST)
Received: from [127.0.0.1] (10.177.31.55) by DGGEMS412-HUB.china.huawei.com
	(10.3.19.212) with Microsoft SMTP Server id 14.3.408.0; Thu, 7 Mar 2019
	09:07:27 +0800
To: Igor Mammedov <imammedo@redhat.com>
References: <1551823429-1440-1-git-send-email-guoheyi@huawei.com>
	<20190306113354.5a98654b@redhat.com>
	<b904272b-9eca-36e7-d24b-4c84b6c4f4af@huawei.com>
	<20190306172045.14a58996@Igors-MacBook-Pro.local>
From: Heyi Guo <guoheyi@huawei.com>
Message-ID: <28709fc5-5a34-0f26-ad81-db2baa6a0b53@huawei.com>
Date: Thu, 7 Mar 2019 09:07:26 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:45.0) Gecko/20100101
	Thunderbird/45.7.1
MIME-Version: 1.0
In-Reply-To: <20190306172045.14a58996@Igors-MacBook-Pro.local>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.177.31.55]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 45.249.212.32
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v3 1/2] hw/arm/acpi: simplify
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
	"Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
	Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org,
	wanghaibin.wang@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 0Hcsx2Bv95TK

Got it; thanks.

Heyi

On 2019/3/7 0:20, Igor Mammedov wrote:
> On Wed, 6 Mar 2019 21:09:11 +0800
> Heyi Guo <guoheyi@huawei.com> wrote:
>
>> Sorry, I didn't know the indention policy of qemu code. So we need to indent the 2nd line just after the parentheses it belongs to?
> See "[PATCH v6 0/2] CODING_STYLE: trivial update" for clarification
>
>> Will change that and send next version.
>>
>> Thanks,
>>
>> Heyi
>>
>>
>> On 2019/3/6 18:33, Igor Mammedov wrote:
>>> On Wed, 6 Mar 2019 06:03:48 +0800
>>> Heyi Guo <guoheyi@huawei.com> wrote:
>>>
>>>> The last argument of AML bit and/or statement is the target variable,
>>>> so we don't need to use a NULL target and then an additional store
>>>> operation; a single bit and/or statement is enough.
>>>>
>>>> Cc: Shannon Zhao <shannon.zhaosl@gmail.com>
>>>> Cc: Peter Maydell <peter.maydell@linaro.org>
>>>> Cc: "Michael S. Tsirkin" <mst@redhat.com>
>>>> Cc: Igor Mammedov <imammedo@redhat.com>
>>>> Suggested-by: Igor Mammedov <imammedo@redhat.com>
>>>> Signed-off-by: Heyi Guo <guoheyi@huawei.com>
>>>> ---
>>>>    hw/arm/virt-acpi-build.c | 8 ++++----
>>>>    1 file changed, 4 insertions(+), 4 deletions(-)
>>>>
>>>> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
>>>> index 04b62c7..1c84e87 100644
>>>> --- a/hw/arm/virt-acpi-build.c
>>>> +++ b/hw/arm/virt-acpi-build.c
>>>> @@ -265,16 +265,16 @@ static void acpi_dsdt_add_pci(Aml *scope, const MemMapEntry *memmap,
>>>>            aml_create_dword_field(aml_arg(3), aml_int(8), "CDW3"));
>>>>        aml_append(ifctx, aml_store(aml_name("CDW2"), aml_name("SUPP")));
>>>>        aml_append(ifctx, aml_store(aml_name("CDW3"), aml_name("CTRL")));
>>>> -    aml_append(ifctx, aml_store(aml_and(aml_name("CTRL"), aml_int(0x1D), NULL),
>>>> +    aml_append(ifctx, aml_and(aml_name("CTRL"), aml_int(0x1D),
>>>>                                    aml_name("CTRL")));
>>> pls fix indent in all such cases. I'd align it like this:
>>>      aml_append(ifctx,
>>>                 aml_and(aml_name("CTRL"), aml_int(0x1D), aml_name("CTRL")));
>>>
>>> or
>>>      aml_append(ifctx, aml_and(aml_name("CTRL"), aml_int(0x1D),
>>>                                aml_name("CTRL")));
>>>
>>>
>>> PS:
>>> When making multi-patch series use --cover-letter git option
>>>
>>>>    
>>>>        ifctx1 = aml_if(aml_lnot(aml_equal(aml_arg(1), aml_int(0x1))));
>>>> -    aml_append(ifctx1, aml_store(aml_or(aml_name("CDW1"), aml_int(0x08), NULL),
>>>> +    aml_append(ifctx1, aml_or(aml_name("CDW1"), aml_int(0x08),
>>>>                                     aml_name("CDW1")));
>>>>        aml_append(ifctx, ifctx1);
>>>>    
>>>>        ifctx1 = aml_if(aml_lnot(aml_equal(aml_name("CDW3"), aml_name("CTRL"))));
>>>> -    aml_append(ifctx1, aml_store(aml_or(aml_name("CDW1"), aml_int(0x10), NULL),
>>>> +    aml_append(ifctx1, aml_or(aml_name("CDW1"), aml_int(0x10),
>>>>                                     aml_name("CDW1")));
>>>>        aml_append(ifctx, ifctx1);
>>>>    
>>>> @@ -283,7 +283,7 @@ static void acpi_dsdt_add_pci(Aml *scope, const MemMapEntry *memmap,
>>>>        aml_append(method, ifctx);
>>>>    
>>>>        elsectx = aml_else();
>>>> -    aml_append(elsectx, aml_store(aml_or(aml_name("CDW1"), aml_int(4), NULL),
>>>> +    aml_append(elsectx, aml_or(aml_name("CDW1"), aml_int(4),
>>>>                                      aml_name("CDW1")));
>>>>        aml_append(elsectx, aml_return(aml_arg(3)));
>>>>        aml_append(method, elsectx);
>>> .
>>>
>>
>>
>
> .
>


