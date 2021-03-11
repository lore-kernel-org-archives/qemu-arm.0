Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp221022lfg;
        Thu, 11 Mar 2021 04:00:24 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxPJpAFRFiKksRERZ/Y5s3mKOdQSUwR3FaXZgXOaR6ltxtg8teN3mNTcthwbTxv+fknphEF
X-Received: by 2002:a92:b70c:: with SMTP id k12mr6861913ili.60.1615464024139;
        Thu, 11 Mar 2021 04:00:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1615464024; cv=none;
        d=google.com; s=arc-20160816;
        b=hxOPUDmXUcZKsYHGdE7aAf7Kjer209RMWxgYQPKXh3W6swyOsdmYMhZoRlzhHoEG8U
         wlrSrPO02O8P8hdxc7FZIJ/1ifSXKeg/wMATVNzAKHw1PftJHvpokfCbwe9LnO7Wq7Dh
         QhqMhpJVWf3zqseA8DArEx7VGWv+gtjIf9omzm7a6OipgswN7WM3QHtHxokjs9OJ1BOJ
         5B6iQ+mnC/tpgxctIu/gqUEC9oen31jGUxVdvnn1E14h6DJxiRSFes6F3S0CcRnZDLyz
         3tC3i5JwRNBGM364D+Q5sG9zelCwTCKY0SP1a2d9TzxIu43bRq3zjRcaN2BZ33n9TCru
         pIfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=d4sqQwJSw5BlzTMkB29/+143fd2cpDmZOZUsdIY8G0Y=;
        b=pO2E+ITb5idoVUNsalSOeI1+80cBBI4eLsM26kqJJypi+aKcOClcPjC79JUJGb7wWz
         +t0T0Fi5d5DMC5j4K7Nm/wnUp/Fi4vlUmsJH/BiSEzBUyvsKY1HRmX672oVqI8zDSSov
         NcpU8Rhl5oua2rEXxfx59nQNHaVoGuRrxAyUugcByYZYJeW1zJyrSiaSvvbZbVzG/2O6
         0vgw7v4/EeXTVFxOj4sM+FOJrjtdURSx/0Ni8O1RBw+n7ijgAZAFAgUaid4m9A39CVnT
         lA+8fm3DGbLFdmNTmeFFQirnBhW8t5EJd85UtVRj7Y/xVAUCQmg6+mYShW99U74MpRm7
         uk8w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j26si2516808ioo.95.2021.03.11.04.00.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 11 Mar 2021 04:00:24 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:56882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lKJzL-0001PP-CI
	for alex.bennee@linaro.org; Thu, 11 Mar 2021 07:00:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangxingang5@huawei.com>)
 id 1lKJzB-0001Nx-BU; Thu, 11 Mar 2021 07:00:13 -0500
Received: from szxga07-in.huawei.com ([45.249.212.35]:3659)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangxingang5@huawei.com>)
 id 1lKJz9-0001AK-8f; Thu, 11 Mar 2021 07:00:13 -0500
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4Dx6sP2cfnz8thC;
 Thu, 11 Mar 2021 19:58:17 +0800 (CST)
Received: from [10.174.185.226] (10.174.185.226) by
 DGGEMS412-HUB.china.huawei.com (10.3.19.212) with Microsoft SMTP Server id
 14.3.498.0; Thu, 11 Mar 2021 19:59:59 +0800
Subject: Re: [RFC RESEND PATCH 1/4] pci: Add PCI_BUS_IOMMU property
To: Auger Eric <eric.auger@redhat.com>, <qemu-devel@nongnu.org>
References: <1614414831-39712-1-git-send-email-wangxingang5@huawei.com>
 <1614414831-39712-2-git-send-email-wangxingang5@huawei.com>
 <e5774084-5934-48ce-d902-f3be2070ec6e@redhat.com>
From: Wang Xingang <wangxingang5@huawei.com>
Message-ID: <07200298-9a71-92ca-9fed-776b78655451@huawei.com>
Date: Thu, 11 Mar 2021 19:59:59 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <e5774084-5934-48ce-d902-f3be2070ec6e@redhat.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.185.226]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.35;
 envelope-from=wangxingang5@huawei.com; helo=szxga07-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: xieyingtai@huawei.com, peter.maydell@linaro.org, cenjiahui@huawei.com,
 mst@redhat.com, shannon.zhaosl@gmail.com, qemu-arm@nongnu.org,
 imammedo@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: t0LCQfbv1sQH

Hi Eric,

On 2021/3/10 18:25, Auger Eric wrote:
> Hi Xingang,
> 
> On 2/27/21 9:33 AM, Wang Xingang wrote:
>> From: Xingang Wang <wangxingang5@huawei.com>
>>
>> This Property can be useful to check whether this bus is attached to iommu.
> 
> Strictly speaking this is not a Property (QEMU property) but a flag
>>
>> Signed-off-by: Xingang Wang <wangxingang5@huawei.com>
>> Signed-off-by: Jiahui Cen <cenjiahui@huawei.com>
>> ---
>>   include/hw/pci/pci_bus.h | 13 +++++++++++++
>>   1 file changed, 13 insertions(+)
>>
>> diff --git a/include/hw/pci/pci_bus.h b/include/hw/pci/pci_bus.h
>> index 347440d42c..42109e8a06 100644
>> --- a/include/hw/pci/pci_bus.h
>> +++ b/include/hw/pci/pci_bus.h
>> @@ -24,6 +24,8 @@ enum PCIBusFlags {
>>       PCI_BUS_IS_ROOT                                         = 0x0001,
>>       /* PCIe extended configuration space is accessible on this bus */
>>       PCI_BUS_EXTENDED_CONFIG_SPACE                           = 0x0002,
>> +    /* Iommu is enabled on this bus */
> s/Iommu/IOMMU here and elsewhere
>> +    PCI_BUS_IOMMU                                           = 0x0004,
>>   };
>>   
>>   struct PCIBus {
>> @@ -63,4 +65,15 @@ static inline bool pci_bus_allows_extended_config_space(PCIBus *bus)
>>       return !!(bus->flags & PCI_BUS_EXTENDED_CONFIG_SPACE);
>>   }
>>   
>> +static inline bool pci_bus_has_iommu(PCIBus *bus)
>> +{
>> +    PCIBus *root_bus = bus;
>> +
>> +    while (root_bus && !pci_bus_is_root(root_bus)) {
>> +        root_bus = pci_get_bus(root_bus->parent_dev);
>> +    }
>> +
>> +    return !!(root_bus->flags & PCI_BUS_IOMMU);
>> +}
>> +
>>   #endif /* QEMU_PCI_BUS_H */
>>
> Eric
> 
> .
> 

Thanks, i will fix this.

Xingang

.
