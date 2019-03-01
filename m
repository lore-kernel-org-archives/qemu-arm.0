Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp664185wrx;
        Fri, 1 Mar 2019 06:07:33 -0800 (PST)
X-Google-Smtp-Source: APXvYqywLEYCF3q8xac5SlvmlaJ5K40W8xasS6z921Q9bn38o4QuLdA0B8bbBW6ndbc0Q+6EuIYR
X-Received: by 2002:a25:e68d:: with SMTP id d135mr4095399ybh.334.1551449253127;
        Fri, 01 Mar 2019 06:07:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1551449253; cv=none;
        d=google.com; s=arc-20160816;
        b=k3Dn2KzUu6/5skhqyZI/yyw+YTf+mG/HaPcW8Szgq81DcV7zYfFTmH/2bEEYiueo0G
         o5gDxUw7YQVKmCpcwsTd1G7GMfRU99Nm5ImUFKDCFi08LND0cPZY7nmFcY1EMlx7SX0s
         GUYLKBgmCctt3aUo052vkb6Q9TtQM6bZ768S9NlAGUv6y84h8iMqWhHp3jcZZygoomsn
         rl+rG0QfuDVMIKt3WOdzJv5VpwNB3NDvItKoj0pf6EozB8yNMrxI/0YfZnJo+zeE8wyi
         /pLl6KNqPodMxup32wyRHRTskKMUGOb28whnyIGwlfzTrFltLk6Xal7+gpHjWLkdzws2
         6UWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to;
        bh=OJiy+maD+LYgIZQHMTZW7hnuIEAy+aBSPCXqwH3iUSY=;
        b=ArdbUEzIW0liznQb0CkUYYH/QZ2NHQuhhDKvio9mc17RAGxDHFUdfJwtnVHqaxI8Li
         GgUM25gQKDwtvs3QjOqo1YJmNroB1qSMEZSFJmb4YyO0knFL8+xzp7u+DrtrTSSs1egN
         5Ou0e0MXCLfKW0pr6FfPzdijzSmf5w60uOZ5h0bHdF7vYLB3VX+LLmPQP/FePNHfVr7p
         2YjvVJEleMMUfhkhGg/CGbZ+NNCIcJOeJJCa9ULIH5IShIfDo23m/4XbfY6Za43JfveE
         2PyHPnqgDTntbgiv4auUsZrF+eMs2h6w48SROn4uCVtkwqTQ+ee8a3ExYk3kybYeqB3k
         SdbQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f186si4156382ybb.75.2019.03.01.06.07.32
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 01 Mar 2019 06:07:33 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:38487 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gzip2-0001aW-If
	for alex.bennee@linaro.org; Fri, 01 Mar 2019 09:07:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34824)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <guoheyi@huawei.com>) id 1gzima-0008N3-MK
	for qemu-arm@nongnu.org; Fri, 01 Mar 2019 09:05:01 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <guoheyi@huawei.com>) id 1gzimY-0003hf-Nz
	for qemu-arm@nongnu.org; Fri, 01 Mar 2019 09:05:00 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:2179 helo=huawei.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <guoheyi@huawei.com>)
	id 1gzimX-0003dp-54; Fri, 01 Mar 2019 09:04:58 -0500
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.58])
	by Forcepoint Email with ESMTP id BF1EE5F5405BD6E6389B;
	Fri,  1 Mar 2019 22:04:50 +0800 (CST)
Received: from [127.0.0.1] (10.177.31.55) by DGGEMS405-HUB.china.huawei.com
	(10.3.19.205) with Microsoft SMTP Server id 14.3.408.0; Fri, 1 Mar 2019
	22:04:40 +0800
To: "Michael S. Tsirkin" <mst@redhat.com>
References: <1551407310-32413-1-git-send-email-guoheyi@huawei.com>
	<20190301084619-mutt-send-email-mst@kernel.org>
From: Heyi Guo <guoheyi@huawei.com>
Message-ID: <cc3c8e42-0632-0c90-41cc-27bfdcaef11d@huawei.com>
Date: Fri, 1 Mar 2019 22:04:38 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:45.0) Gecko/20100101
	Thunderbird/45.7.1
MIME-Version: 1.0
In-Reply-To: <20190301084619-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.177.31.55]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 45.249.212.190
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
	Igor Mammedov <imammedo@redhat.com>, wanghaibin.wang@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: LqQchbdd8xbe



On 2019/3/1 21:47, Michael S. Tsirkin wrote:
> On Fri, Mar 01, 2019 at 10:28:30AM +0800, Heyi Guo wrote:
>> After the introduction of generic PCIe root port and PCIe-PCI bridge,
>> we will also have SHPC controller on ARM, so just enalbe SHPC native
>> hot plug.
>>
>> Cc: Shannon Zhao <shannon.zhaosl@gmail.com>
>> Cc: Peter Maydell <peter.maydell@linaro.org>
>> Cc: "Michael S. Tsirkin" <mst@redhat.com>
>> Cc: Igor Mammedov <imammedo@redhat.com>
>> Signed-off-by: Heyi Guo <guoheyi@huawei.com>
>> Signed-off-by: Heyi Guo <heyi.guo@linaro.org>
>
> So when OS enables SHPC, should we block ACPI hotplug events?
I supposed we don't support ACPI hotplug events on ARM virt; do we have any currently?

Thanks,
Heyi
>
>> ---
>>   hw/arm/virt-acpi-build.c | 7 ++++++-
>>   1 file changed, 6 insertions(+), 1 deletion(-)
>>
>> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
>> index 04b62c7..7849ec5 100644
>> --- a/hw/arm/virt-acpi-build.c
>> +++ b/hw/arm/virt-acpi-build.c
>> @@ -265,7 +265,12 @@ static void acpi_dsdt_add_pci(Aml *scope, const MemMapEntry *memmap,
>>           aml_create_dword_field(aml_arg(3), aml_int(8), "CDW3"));
>>       aml_append(ifctx, aml_store(aml_name("CDW2"), aml_name("SUPP")));
>>       aml_append(ifctx, aml_store(aml_name("CDW3"), aml_name("CTRL")));
>> -    aml_append(ifctx, aml_store(aml_and(aml_name("CTRL"), aml_int(0x1D), NULL),
>> +
>> +    /*
>> +     * Allow OS control for all 5 features:
>> +     * PCIeHotplug SHPCHotplug PME AER PCIeCapability.
>> +     */
>> +    aml_append(ifctx, aml_store(aml_and(aml_name("CTRL"), aml_int(0x1F), NULL),
>>                                   aml_name("CTRL")));
>>   
>>       ifctx1 = aml_if(aml_lnot(aml_equal(aml_arg(1), aml_int(0x1))));
>> -- 
>> 1.8.3.1
> .
>


