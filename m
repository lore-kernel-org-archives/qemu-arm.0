Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp1562079wrx;
        Sat, 2 Mar 2019 01:56:51 -0800 (PST)
X-Google-Smtp-Source: APXvYqxunEw79pJv+DWIKQeuhVEkjk+vXyp4oS4uA13wFVIx6X1cu0tlDFmv4GnFPWZ0WTMGSYV0
X-Received: by 2002:a25:7ac7:: with SMTP id v190mr7629704ybc.36.1551520611869;
        Sat, 02 Mar 2019 01:56:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1551520611; cv=none;
        d=google.com; s=arc-20160816;
        b=Hkt6+6cAjltP8ZAcBAHRkD4LMA2JSO3puyGQfubMmq7oKZlBLELzGR2rg6NlLgmlfB
         LI5vjbEw6RZpA0kT4G6LXpljBCaeS4QHC/0SOboz9xzXD4sAKkEN/S1EVD/rWNUraK41
         D5b9QuFMKKx8eIUORHEYjnIn07nWQc+cJJMVrEyk29h3TiOJ8r0QNQlWDQPYt49/k4Vz
         LOg7CMDy7QcPZSqsQTHtvF5fmB5kRYGuRGCp+BuqbY3I3f0swxkRrdVgO+1V0HRHmnoa
         ktZ3rZ5JFHt1c/SbkKF2UiQ7X5mow3XEtaFGzM0qRmz7TIf1kAuXmibCuwtdY6XfnI/w
         uVBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to;
        bh=ObOY/iHu0fZAUdMT0krXWI+qKiGxXN0vxi1axHI9r+Q=;
        b=uSmVn5H0irB8eHwbBRWYsp9pDgmwehQJfn7JWzGgFpRKEdldKu+fvdpwZBtUgrY8ei
         jfvcch/n6IkazrFfeLrTRaRol8DIfAFxxt+n9p3OdP8vQLYXwj8A+VwPT7qzZb+T268N
         XiMUfTCH1FBmUXxGyilthN9E1qtxZkWwCZKuZmF1/6QdUQJyiCqIXNmblDVotTXR/daJ
         +7dhd9GvyklM4l/4UafpqB7dkdjOaRbBZODvi3bg04sVYbF0+MeIapodHf3+w20aSyJ3
         pvQe2moJD+rsbeYp4NG7IrWB8592QU9JkjGCR49vAr1BILJq6JtzNleXCS3ovcWW0EKi
         A8CA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y10si208187ybg.351.2019.03.02.01.56.51
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 02 Mar 2019 01:56:51 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:50861 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h01Nz-0004ZB-Dx
	for alex.bennee@linaro.org; Sat, 02 Mar 2019 04:56:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52244)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <guoheyi@huawei.com>) id 1h01Nr-0004Z2-Ti
	for qemu-arm@nongnu.org; Sat, 02 Mar 2019 04:56:44 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <guoheyi@huawei.com>) id 1h01Nn-0000MY-Ns
	for qemu-arm@nongnu.org; Sat, 02 Mar 2019 04:56:41 -0500
Received: from szxga06-in.huawei.com ([45.249.212.32]:37474 helo=huawei.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <guoheyi@huawei.com>)
	id 1h01Nj-0007zE-J2; Sat, 02 Mar 2019 04:56:38 -0500
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.60])
	by Forcepoint Email with ESMTP id AEBF7ECC9F8D51EE6370;
	Sat,  2 Mar 2019 17:56:10 +0800 (CST)
Received: from [127.0.0.1] (10.177.31.55) by DGGEMS413-HUB.china.huawei.com
	(10.3.19.213) with Microsoft SMTP Server id 14.3.408.0; Sat, 2 Mar 2019
	17:56:03 +0800
To: "Michael S. Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>
References: <1551407310-32413-1-git-send-email-guoheyi@huawei.com>
	<20190301084619-mutt-send-email-mst@kernel.org>
	<cc3c8e42-0632-0c90-41cc-27bfdcaef11d@huawei.com>
	<20190301091214-mutt-send-email-mst@kernel.org>
	<20190301153311.79c0d287@redhat.com>
	<20190301104928-mutt-send-email-mst@kernel.org>
From: Heyi Guo <guoheyi@huawei.com>
Message-ID: <a80e6101-00c6-e414-4d4b-764f05386100@huawei.com>
Date: Sat, 2 Mar 2019 17:56:00 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:45.0) Gecko/20100101
	Thunderbird/45.7.1
MIME-Version: 1.0
In-Reply-To: <20190301104928-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.177.31.55]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 45.249.212.32
Subject: Re: [Qemu-arm] [PATCH] hw/arm/acpi: enable SHPC native hot plug
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
	Shannon Zhao <shannon.zhaosl@gmail.com>,
	Heyi Guo <heyi.guo@linaro.org>, qemu-arm@nongnu.org,
	wanghaibin.wang@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: l0ShrlL2dyh3



On 2019/3/1 23:49, Michael S. Tsirkin wrote:
> On Fri, Mar 01, 2019 at 03:33:11PM +0100, Igor Mammedov wrote:
>> On Fri, 1 Mar 2019 09:12:33 -0500
>> "Michael S. Tsirkin" <mst@redhat.com> wrote:
>>
>>> On Fri, Mar 01, 2019 at 10:04:38PM +0800, Heyi Guo wrote:
>>>>
>>>> On 2019/3/1 21:47, Michael S. Tsirkin wrote:
>>>>> On Fri, Mar 01, 2019 at 10:28:30AM +0800, Heyi Guo wrote:
>>>>>> After the introduction of generic PCIe root port and PCIe-PCI bridge,
>>>>>> we will also have SHPC controller on ARM, so just enalbe SHPC native
>>>>>> hot plug.
>>>>>>
>>>>>> Cc: Shannon Zhao <shannon.zhaosl@gmail.com>
>>>>>> Cc: Peter Maydell <peter.maydell@linaro.org>
>>>>>> Cc: "Michael S. Tsirkin" <mst@redhat.com>
>>>>>> Cc: Igor Mammedov <imammedo@redhat.com>
>>>>>> Signed-off-by: Heyi Guo <guoheyi@huawei.com>
>>>>>> Signed-off-by: Heyi Guo <heyi.guo@linaro.org>
>>>>> So when OS enables SHPC, should we block ACPI hotplug events?
>>>> I supposed we don't support ACPI hotplug events on ARM virt; do we have any currently?
>>>>
>>>> Thanks,
>>>> Heyi
>>> Oh I didn't realise. That explains it sorry about the noise.
>> And I thought we did not support them on PCIe completely (I mean q35/ich9).
>> (Or did I miss something)?
> True for PCIe.
So may I consider your comments as ACK for this patch :)

Thanks,
Heyi

>>>>>    
>>>>>> ---
>>>>>>    hw/arm/virt-acpi-build.c | 7 ++++++-
>>>>>>    1 file changed, 6 insertions(+), 1 deletion(-)
>>>>>>
>>>>>> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
>>>>>> index 04b62c7..7849ec5 100644
>>>>>> --- a/hw/arm/virt-acpi-build.c
>>>>>> +++ b/hw/arm/virt-acpi-build.c
>>>>>> @@ -265,7 +265,12 @@ static void acpi_dsdt_add_pci(Aml *scope, const MemMapEntry *memmap,
>>>>>>            aml_create_dword_field(aml_arg(3), aml_int(8), "CDW3"));
>>>>>>        aml_append(ifctx, aml_store(aml_name("CDW2"), aml_name("SUPP")));
>>>>>>        aml_append(ifctx, aml_store(aml_name("CDW3"), aml_name("CTRL")));
>>>>>> -    aml_append(ifctx, aml_store(aml_and(aml_name("CTRL"), aml_int(0x1D), NULL),
>>>>>> +
>>>>>> +    /*
>>>>>> +     * Allow OS control for all 5 features:
>>>>>> +     * PCIeHotplug SHPCHotplug PME AER PCIeCapability.
>>>>>> +     */
>>>>>> +    aml_append(ifctx, aml_store(aml_and(aml_name("CTRL"), aml_int(0x1F), NULL),
>>>>>>                                    aml_name("CTRL")));
>>>>>>        ifctx1 = aml_if(aml_lnot(aml_equal(aml_arg(1), aml_int(0x1))));
>>>>>> -- 
>>>>>> 1.8.3.1
>>>>> .
>>>>>    
>>>>    
> .
>


