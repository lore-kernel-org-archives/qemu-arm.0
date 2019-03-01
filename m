Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp521318wrx;
        Fri, 1 Mar 2019 03:38:13 -0800 (PST)
X-Google-Smtp-Source: APXvYqweyqeDEn8RbXEVoE+38Y9WgYunLornGM3AZgaQ1sBiTLnimRuAVUmTQE87JgL3x7/agX/2
X-Received: by 2002:a25:d1c2:: with SMTP id i185mr3683078ybg.108.1551440293507;
        Fri, 01 Mar 2019 03:38:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1551440293; cv=none;
        d=google.com; s=arc-20160816;
        b=lwrRYvsmSJO0sUBIyixVMSs6niInVYGfLEPYPC0A3h7l2Xa6mVvH6RV1163mA9E95i
         fwi3csv0TgcEKZdLNCV56G5IsGOu9G4Bko8cyit1DOyYBja0heMK2aAozTZUh7CKaO3c
         gBngKOLHESiqvScxPREw+J/5aQVhPeogUFeLzXSssX5X8Fi1wMOxcLEwc/Ls8JKWYHyQ
         REdyGPjzMkH+VtHFTx/vcS5Cr2RhyK3YEYCSKg4FixGpzzJZoGJVagCBGjRS6hos69Zg
         2pRaknqWikAkDZM9rEGCeTCDEyIr8IS8PmcxQbSKnOFXiFM++hnKZe3mNwUycbILLxWQ
         RFTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to;
        bh=70OG/XoHCcvwsKhHIDbK6lXos4kfFNCXsMPXgX+FKhs=;
        b=iL8QOwTA2M0Ock78NPvk0nmUhiop3PtbGvGS4fBvyRi4hy3LspOVu95MPvPLKK6yTG
         fiH6fQ6f33TW13T18Aktfrfn0YGdkPh6aHONfBJDQa7AK7m02KXwPdbxOW1gh8QC+HVs
         lH1cVaA6BnxTlFDQtArV3GxcrttIDTEf2BewOrcFeWUAMN58tSnJ4twtLErQDhUAPhaD
         73nyGPjfrcG/OIfKI0e4CKLvnoM4qVMJEv9prIudpYwxYpytM/EUCg7oheFh90QmwZEs
         legRtD07b/lQ+3roAUjAvi+2Xoy9xGSs9K1Me5wb4c376/UV14HG2E95cHt3W4kg31Te
         r0uQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f16si8718767ybn.24.2019.03.01.03.38.13
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 01 Mar 2019 03:38:13 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:36000 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gzgUW-0006rn-W8
	for alex.bennee@linaro.org; Fri, 01 Mar 2019 06:38:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36366)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <guoheyi@huawei.com>) id 1gzgUK-0006qC-0I
	for qemu-arm@nongnu.org; Fri, 01 Mar 2019 06:38:01 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <guoheyi@huawei.com>) id 1gzgUH-0004T8-S3
	for qemu-arm@nongnu.org; Fri, 01 Mar 2019 06:37:58 -0500
Received: from szxga06-in.huawei.com ([45.249.212.32]:41182 helo=huawei.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <guoheyi@huawei.com>)
	id 1gzgUH-0004II-Fx; Fri, 01 Mar 2019 06:37:57 -0500
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.60])
	by Forcepoint Email with ESMTP id C245D9B052FD44480B8B;
	Fri,  1 Mar 2019 19:37:51 +0800 (CST)
Received: from [127.0.0.1] (10.177.31.55) by DGGEMS412-HUB.china.huawei.com
	(10.3.19.212) with Microsoft SMTP Server id 14.3.408.0; Fri, 1 Mar 2019
	19:37:42 +0800
To: Igor Mammedov <imammedo@redhat.com>
References: <1551407310-32413-1-git-send-email-guoheyi@huawei.com>
	<20190301114403.1e8324f4@redhat.com>
From: Heyi Guo <guoheyi@huawei.com>
Message-ID: <86b71e1e-2e4d-a3f0-dff0-750662be2af8@huawei.com>
Date: Fri, 1 Mar 2019 19:37:40 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:45.0) Gecko/20100101
	Thunderbird/45.7.1
MIME-Version: 1.0
In-Reply-To: <20190301114403.1e8324f4@redhat.com>
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	"Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
	Shannon Zhao <shannon.zhaosl@gmail.com>,
	Heyi Guo <heyi.guo@linaro.org>, qemu-arm@nongnu.org,
	wanghaibin.wang@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: TUCQRNE9ntsO



On 2019/3/1 18:44, Igor Mammedov wrote:
> On Fri, 1 Mar 2019 10:28:30 +0800
> Heyi Guo <guoheyi@huawei.com> wrote:
>
>> After the introduction of generic PCIe root port and PCIe-PCI bridge,
>> we will also have SHPC controller on ARM, so just enalbe SHPC native
>> hot plug.
> Just out of curiosity,
> An understand the need for SHPC on plain PCI but in case of PCIe
> why native PCIe hotplug isn't sufficient?
For future extension and completeness:
1. PCI is sometimes more flexible than PCIe, for it can have up to 32 devices in virtual world. The shortage for PCIe hot plug is that the number of PCIe root ports is fixed.
2. We have SHPC when booting through device tree mode, but don't have it through ACPI mode.

If I missed something, please let me know.

Thanks,
Heyi

>
>> Cc: Shannon Zhao <shannon.zhaosl@gmail.com>
>> Cc: Peter Maydell <peter.maydell@linaro.org>
>> Cc: "Michael S. Tsirkin" <mst@redhat.com>
>> Cc: Igor Mammedov <imammedo@redhat.com>
>> Signed-off-by: Heyi Guo <guoheyi@huawei.com>
>> Signed-off-by: Heyi Guo <heyi.guo@linaro.org>
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
>
> .
>


