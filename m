Received: by 2002:a19:4310:0:0:0:0:0 with SMTP id q16csp196943lfa;
        Thu, 3 Jun 2021 05:47:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxR62YAieiiLU2xZDeOhSp2iCj5KdLokIgHx90YUNjaZIBsKFl0e/vvmJ+T5LSFPCzONA7l
X-Received: by 2002:a92:c26f:: with SMTP id h15mr7817083ild.281.1622724476063;
        Thu, 03 Jun 2021 05:47:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1622724476; cv=none;
        d=google.com; s=arc-20160816;
        b=IfzRa1rqTeA6bfRNq9C+Pex5jYBphj+V7i+vRRljZYUkUaqjJ5qALRxUv9HZiZspS8
         EuIO0CXuojMJ1xOC2ytou+zm3e4kmjkUJSQHHpqrwU11o1PELDQWaAi75u8+I+hhxxD1
         j2GhhF+6EznSuo0m2V5MNkDNpy5y3xVAfLA0zKz9SKhRyqHsHx08B9uVVB3xNnYiwCox
         IvxScn/zU34hBgWZHd7RR0iHzmzfWl5HONHjeZ4MIlpHyuo0d0Pf0LK/yycadTWi4VYZ
         1/A1kTsdS1wDTsVFOyYvsWK3cXjvwIpPmJLjOknMM0CivMFgyL8mB9LFvZ42ByvCn8/7
         PmRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:subject:from:references:to;
        bh=l6ShDJPgs4HC5pzMSbFB8vJUREg7EJ9hCEgBcN01gvI=;
        b=tJ6sh9ye+bADkq/2hAmwPwNTDjr+0mxo4Y96uv9afk1YkCxXqbfp6+3aeupBBfW0WO
         Qj9yCfMjayvG6RLiP9mlDlar6P5H2bjm2BMj+u3aiBSPmQ5bbrjUI9ANCVhfdY4uYpJt
         fBSXs9MgoXL4/1mGyrv7q2rhxj60T+YnXOdBUV+aO3KYUZPU+F61F51/ugdUyvueISVW
         7iY6zYfBnIwXcpgHOI98k+BCfh7JF6fWgb/yUXnhDJFG9T0r3tGRAs1V00aMablt9d9I
         niS+9sB1tY+uPv+68xZVf+9OCqsWY9HfmcS/m3VSZ+FA9bewHlpYsP2T6Z/NmkTiw6Eq
         PGyQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e1si2926672jap.46.2021.06.03.05.47.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 03 Jun 2021 05:47:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Received: from localhost ([::1]:58548 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lomlP-00064V-8c
	for alex.bennee@linaro.org; Thu, 03 Jun 2021 08:47:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36266)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangxingang5@huawei.com>)
 id 1lomlG-00063i-Fl; Thu, 03 Jun 2021 08:47:46 -0400
Received: from szxga02-in.huawei.com ([45.249.212.188]:2146)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangxingang5@huawei.com>)
 id 1lomlD-0007LP-Ut; Thu, 03 Jun 2021 08:47:46 -0400
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.54])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4Fwlw56p5Bz6tys;
 Thu,  3 Jun 2021 20:44:37 +0800 (CST)
Received: from dggpemm500009.china.huawei.com (7.185.36.225) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Thu, 3 Jun 2021 20:47:36 +0800
Received: from [10.174.185.226] (10.174.185.226) by
 dggpemm500009.china.huawei.com (7.185.36.225) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Thu, 3 Jun 2021 20:47:35 +0800
To: <eric.auger@redhat.com>, <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>,
 <shannon.zhaosl@gmail.com>, <imammedo@redhat.com>, <mst@redhat.com>,
 <marcel.apfelbaum@gmail.com>, <peter.maydell@linaro.org>,
 <ehabkost@redhat.com>, <richard.henderson@linaro.org>, <pbonzini@redhat.com>
References: <1621914605-14724-1-git-send-email-wangxingang5@huawei.com>
 <1621914605-14724-4-git-send-email-wangxingang5@huawei.com>
 <b1f26e3a-d678-aa50-4e82-71c76c9775b8@redhat.com>
From: Xingang Wang <wangxingang5@huawei.com>
Subject: Re: [PATCH v4 3/8] hw/arm/virt: Add a machine option to bypass iommu
 for primary bus
Message-ID: <104b0951-87de-c880-0ff9-e8bbbc19b72d@huawei.com>
Date: Thu, 3 Jun 2021 20:47:34 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <b1f26e3a-d678-aa50-4e82-71c76c9775b8@redhat.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.185.226]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 dggpemm500009.china.huawei.com (7.185.36.225)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.188;
 envelope-from=wangxingang5@huawei.com; helo=szxga02-in.huawei.com
X-Spam_score_int: -47
X-Spam_score: -4.8
X-Spam_bar: ----
X-Spam_report: (-4.8 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.603,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: xieyingtai@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: K86bN7bJRvhp

Hi Eric,

On 2021/6/2 20:25, Eric Auger wrote:
> Hi Xingang,
> 
> On 5/25/21 5:50 AM, Wang Xingang wrote:
>> From: Xingang Wang <wangxingang5@huawei.com>
>>
>> This add a bypass_iommu option for arm virt machine,
>> the option can be used in this manner:
>> qemu -machine virt,iommu=smmuv3,bypass_iommu=true
> This still looks confusing to me. On one hand we say that for the virt
> machine the iommu is set to smmuv3 and we say bypass_iommu=true on the
> virt machine option line
> It is not straightforward that the bypass_iommu only relates to devices
> plugged onto the "default" root bus.
> 
> At least the name of the property should reflect that I think
> 

Thanks, maybe I should replace the name to "default_rootbus_bypass_iommu".
I just considered that the name might be too long,
anyway, explicitness is important, I will fix this.


>> Signed-off-by: Xingang Wang <wangxingang5@huawei.com>
>> ---
>>   hw/arm/virt.c         | 26 ++++++++++++++++++++++++++
>>   include/hw/arm/virt.h |  1 +
>>   2 files changed, 27 insertions(+)
>>
>> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
>> index 840758666d..49d8a801ed 100644
>> --- a/hw/arm/virt.c
>> +++ b/hw/arm/virt.c
>> @@ -1364,6 +1364,7 @@ static void create_pcie(VirtMachineState *vms)
>>       }
>>   
>>       pci = PCI_HOST_BRIDGE(dev);
>> +    pci->bypass_iommu = vms->bypass_iommu;
>>       vms->bus = pci->bus;
>>       if (vms->bus) {
>>           for (i = 0; i < nb_nics; i++) {
>> @@ -2319,6 +2320,21 @@ static void virt_set_iommu(Object *obj, const char *value, Error **errp)
>>       }
>>   }
>>   
>> +static bool virt_get_bypass_iommu(Object *obj, Error **errp)
>> +{
>> +    VirtMachineState *vms = VIRT_MACHINE(obj);
>> +
>> +    return vms->bypass_iommu;
>> +}
>> +
>> +static void virt_set_bypass_iommu(Object *obj, bool value,
>> +                                              Error **errp)
>> +{
>> +    VirtMachineState *vms = VIRT_MACHINE(obj);
>> +
>> +    vms->bypass_iommu = value;
>> +}
>> +
>>   static CpuInstanceProperties
>>   virt_cpu_index_to_props(MachineState *ms, unsigned cpu_index)
>>   {
>> @@ -2656,6 +2672,13 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
>>                                             "Set the IOMMU type. "
>>                                             "Valid values are none and smmuv3");
>>   
>> +    object_class_property_add_bool(oc, "bypass_iommu",
>> +                                   virt_get_bypass_iommu,
>> +                                   virt_set_bypass_iommu);
>> +    object_class_property_set_description(oc, "bypass_iommu",
>> +                                          "Set on/off to enable/disable "
>> +                                          "bypass_iommu for primary bus");
>> +
>>       object_class_property_add_bool(oc, "ras", virt_get_ras,
>>                                      virt_set_ras);
>>       object_class_property_set_description(oc, "ras",
>> @@ -2723,6 +2746,9 @@ static void virt_instance_init(Object *obj)
>>       /* Default disallows iommu instantiation */
>>       vms->iommu = VIRT_IOMMU_NONE;
>>   
>> +    /* The primary bus is attached to iommu by default */
>> +    vms->bypass_iommu = false;
> I don't fully master the PCI topology but I think you should clarify
> which primary bus we talk about. AFAIU PXB's bus also is a primary bus.
> 
> Thanks
> 
> Eric

Thanks, I will make this annotation clearer.

>> +
>>       /* Default disallows RAS instantiation */
>>       vms->ras = false;
>>   
>> diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
>> index 921416f918..82bceadb82 100644
>> --- a/include/hw/arm/virt.h
>> +++ b/include/hw/arm/virt.h
>> @@ -147,6 +147,7 @@ struct VirtMachineState {
>>       OnOffAuto acpi;
>>       VirtGICType gic_version;
>>       VirtIOMMUType iommu;
>> +    bool bypass_iommu;
>>       VirtMSIControllerType msi_controller;
>>       uint16_t virtio_iommu_bdf;
>>       struct arm_boot_info bootinfo;
> 
> .
> 

Xingang

.
