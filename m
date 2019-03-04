Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp3068569wrx;
        Sun, 3 Mar 2019 16:47:22 -0800 (PST)
X-Google-Smtp-Source: APXvYqx7rYLZbahH2RDJJdNWk9cHZkilIPPuDASlnsuXldm5la2TGPgNbBtZ7ncnmOweAOD/TgCJ
X-Received: by 2002:a25:828c:: with SMTP id r12mr13110679ybk.331.1551660442812;
        Sun, 03 Mar 2019 16:47:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1551660442; cv=none;
        d=google.com; s=arc-20160816;
        b=mnjKPptieKKMAsOpN/7nfu1rvQuHiHZudpfLS9kqUPUgcOYZe/BzJROGuIp4MjF7cC
         qj0EITVQ+p7tFiOAPPbFbZXYJfuwTIuXYDA7fIEw7vaZkV/0CSCtvOWOOwv0Fa5UKUcF
         eE90cYJ8zqMGT543cOYayO/jzQWpVPGFaGY8GoEudL3b+6vsBFje6CRD+B4zY3s7fUvB
         WdxPgTfpa9kLQyXrj5XQy0VtHOwBYKWj6K0IfKFzfqGsueY674iWCquJ3i9ak1DFpK9s
         gaHGLONcNZD0mpW9zhPbRIEwVcn+YSGspo3e9ijASwuAqDBdBztd+IGwU3qucJ12dXBX
         yLaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to;
        bh=OYP1gqyj0EtINrvYl6StEFqYpgi40a8iTwkHgoE4yQo=;
        b=MQh/bAg5daZmRt9iLe4oU55qUsToiG0gGu2L5fXd0YmQivNp2B5b8sTl9IMK53je2d
         0x+ux5i9QDIBR1L0AG9cU6MsZY83sP3UDYxPYpeDpaI/IXZnHMDTHv/odDs/fqsxR107
         0qEY4dMHgAq2H8oqVzRF2uM1oR9qW/YLAQvzEnP0LVyhiWSWWgVIZHY8dXLPtx3G55H4
         7Y1bTgp10Lz7uJW25JUGPm6zUfQRUOSaj7KMEqGH36x1yvZ0wsayBVEqRMNtNGgZb5Xz
         kUFFC9XN0lDxl7zPY39uwIpj7ENZn0ImzbNn9NR/VN/Hj8MR9MZWUO+VwK9ISfAMww2U
         ybdQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y70si2454049ywa.70.2019.03.03.16.47.22
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 03 Mar 2019 16:47:22 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:46073 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h0blK-0004hQ-9b
	for alex.bennee@linaro.org; Sun, 03 Mar 2019 19:47:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57697)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <guoheyi@huawei.com>) id 1h0bl8-0004h7-Qo
	for qemu-arm@nongnu.org; Sun, 03 Mar 2019 19:47:11 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <guoheyi@huawei.com>) id 1h0bl3-0002ym-Kx
	for qemu-arm@nongnu.org; Sun, 03 Mar 2019 19:47:09 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:2239 helo=huawei.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <guoheyi@huawei.com>)
	id 1h0bl1-0002pY-OC; Sun, 03 Mar 2019 19:47:05 -0500
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.59])
	by Forcepoint Email with ESMTP id 6AF09E4AC8C90420F931;
	Mon,  4 Mar 2019 08:46:54 +0800 (CST)
Received: from [127.0.0.1] (10.177.31.55) by DGGEMS409-HUB.china.huawei.com
	(10.3.19.209) with Microsoft SMTP Server id 14.3.408.0; Mon, 4 Mar 2019
	08:46:45 +0800
To: "Michael S. Tsirkin" <mst@redhat.com>
References: <1551407310-32413-1-git-send-email-guoheyi@huawei.com>
	<20190303183805-mutt-send-email-mst@kernel.org>
From: Heyi Guo <guoheyi@huawei.com>
Message-ID: <ca7be001-fc06-3852-cd0f-bf20eedc550d@huawei.com>
Date: Mon, 4 Mar 2019 08:46:43 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:45.0) Gecko/20100101
	Thunderbird/45.7.1
MIME-Version: 1.0
In-Reply-To: <20190303183805-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.177.31.55]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 45.249.212.191
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
X-TUID: Gych2NzFpk68



On 2019/3/4 7:38, Michael S. Tsirkin wrote:
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
> I don't think you need two Signed-off-by lines.
> Besides that:
>
> Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
>
> Pls feel free to merge through the ARM tree.
Thanks, I'll change that and add your R-b, and send a v2 for some dear maintainer to commit it :)

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


