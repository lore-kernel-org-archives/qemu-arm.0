Received: by 10.223.188.70 with SMTP id a6csp673509wrh;
        Fri, 25 Aug 2017 04:21:29 -0700 (PDT)
X-Received: by 10.99.95.197 with SMTP id t188mr9318960pgb.169.1503660089348;
        Fri, 25 Aug 2017 04:21:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1503660089; cv=none;
        d=google.com; s=arc-20160816;
        b=h6bqP9qD8W9BrQhpcXOcXpA9K207QSH+vzmt61lmPDba16O3pk4LI2PG34cezWxPH0
         Bfsw1h/eSlTmvpQ7G0O5fBCUp63SBmdj9emgOTjAFSfhxd8DMdnUb/FTM4q8Q6cS+oej
         lFoEqBRUcnnI5R3r6iqgFBznVaYaBdwidXcSqx9fWCIqzUR1CpR6hAXtMquJqmdIs/Od
         tuLiBz+4DmJKZiMxbDUj23IJ9mszdkK68LhIRHUyQ44BisJVyzw5cgUhtXK9qLNvROsK
         pUtyhcMHbjDi9EQRN8QdIbNKTz9vnF0xzspOEuOCqxSzblHqDMWv/Ph8XlE9lGStD0YQ
         kJ6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:content-transfer-encoding:in-reply-to
         :mime-version:user-agent:date:message-id:from:cc:references:to
         :subject:arc-authentication-results;
        bh=7ZJW3BCKf+/IaCN/COHVc9UndUNyC4ycybvs6Sd/mqE=;
        b=MMdTWEyD88UxQQYXYPW5Vj490Uc1AeyGYg4LRrWt5/hJl3ur4YL+iD9/olm8g75sjZ
         suXZlVOgBm0Pf6PPRGxFZabsHN93Rh1Qp8C+FNy4og47jfnHod0zTNuWykMxKSeT6Spd
         iY82UYZH/pczx+x3VYc1amTY0YyIhTiWkq3l02c6ZXqEQ+JPfh/cVENPr4UCMxQPkwAQ
         wpwYpH/Chva8NTvoTYXKDYo1CIhDp4q2XQHOKjsXJk806guMXI7flzYiUbS13Rz/U0R7
         LwH1pWz280L2l56cmE62Qr1fh64bnZNkrCt3eMjTKNuSbx/XDb+MJoycYLOH/yCljr6H
         ez+A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of linux-kernel-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=linux-kernel-owner@vger.kernel.org
Return-Path: <linux-kernel-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id t77si4578434pfi.40.2017.08.25.04.21.29;
        Fri, 25 Aug 2017 04:21:29 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of linux-kernel-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of linux-kernel-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=linux-kernel-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S932348AbdHYLV1 (ORCPT <rfc822;daniel.diaz@linaro.org>
        + 26 others); Fri, 25 Aug 2017 07:21:27 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:4574 "EHLO
        szxga05-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755023AbdHYLVY (ORCPT
        <rfc822;linux-kernel@vger.kernel.org>);
        Fri, 25 Aug 2017 07:21:24 -0400
Received: from 172.30.72.60 (EHLO DGGEMS405-HUB.china.huawei.com) ([172.30.72.60])
        by dggrg05-dlp.huawei.com (MOS 4.4.6-GA FastPath queued)
        with ESMTP id DFY15883;
        Fri, 25 Aug 2017 19:21:08 +0800 (CST)
Received: from [127.0.0.1] (10.142.68.147) by DGGEMS405-HUB.china.huawei.com
 (10.3.19.205) with Microsoft SMTP Server id 14.3.301.0; Fri, 25 Aug 2017
 19:21:02 +0800
Subject: Re: [PATCH v11 3/6] ACPI: build and enable APEI GHES in the Makefile
 and configuration
To:     Shannon Zhao <zhaoshenglong@huawei.com>, <lersek@redhat.com>,
        <mst@redhat.com>, <imammedo@redhat.com>,
        <peter.maydell@linaro.org>, <pbonzini@redhat.com>,
        <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>,
        <kvm@vger.kernel.org>, <edk2-devel@lists.01.org>,
        <christoffer.dall@linaro.org>, <marc.zyngier@arm.com>,
        <will.deacon@arm.com>, <james.morse@arm.com>,
        <tbaicar@codeaurora.org>, <ard.biesheuvel@linaro.org>,
        <mingo@kernel.org>, <bp@suse.de>, <shiju.jose@huawei.com>,
        <zjzhang@codeaurora.org>, <linux-arm-kernel@lists.infradead.org>,
        <kvmarm@lists.cs.columbia.edu>, <linux-kernel@vger.kernel.org>,
        <linux-acpi@vger.kernel.org>, <devel@acpica.org>,
        <john.garry@huawei.com>, <jonathan.cameron@huawei.com>,
        <shameerali.kolothum.thodi@huawei.com>, <huangdaode@hisilicon.com>,
        <wangzhou1@hisilicon.com>
References: <1503066227-18251-1-git-send-email-gengdongjiu@huawei.com>
 <1503066227-18251-4-git-send-email-gengdongjiu@huawei.com>
 <599ECEF3.80001@huawei.com>
CC:     <huangshaoyu@huawei.com>, <wuquanming@huawei.com>,
        <linuxarm@huawei.com>, <zhengqiang10@huawei.com>
From:   gengdongjiu <gengdongjiu@huawei.com>
Message-ID: <6afc4dfa-5ad1-8df1-7dce-4704a796d8aa@huawei.com>
Date:   Fri, 25 Aug 2017 19:20:57 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.7.1
MIME-Version: 1.0
In-Reply-To: <599ECEF3.80001@huawei.com>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.142.68.147]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
        refid=str=0001.0A090203.59A00825.0081,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0,
        ip=0.0.0.0,
        so=2014-11-16 11:51:01,
        dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: 7e0f88feab02fe4188c23b25bdb7134b
Sender: linux-kernel-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kernel.vger.kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
X-TUID: ehURxIeWFOll



On 2017/8/24 21:04, Shannon Zhao wrote:
> 
> 
> On 2017/8/18 22:23, Dongjiu Geng wrote:
>> Add CONFIG_ACPI_APEI configuration in the Makefile and
>> enable it in the arm-softmmu.mak
>>
>> Signed-off-by: Dongjiu Geng <gengdongjiu@huawei.com>
>> ---
>>  default-configs/arm-softmmu.mak | 1 +
>>  hw/acpi/Makefile.objs           | 1 +
>>  2 files changed, 2 insertions(+)
>>
>> diff --git a/default-configs/arm-softmmu.mak b/default-configs/arm-softmmu.mak
>> index bbdd3c1..c362113 100644
>> --- a/default-configs/arm-softmmu.mak
>> +++ b/default-configs/arm-softmmu.mak
>> @@ -129,3 +129,4 @@ CONFIG_ACPI=y
>>  CONFIG_SMBIOS=y
>>  CONFIG_ASPEED_SOC=y
>>  CONFIG_GPIO_KEY=y
>> +CONFIG_ACPI_APEI=y
>> diff --git a/hw/acpi/Makefile.objs b/hw/acpi/Makefile.objs
>> index 11c35bc..bafb148 100644
>> --- a/hw/acpi/Makefile.objs
>> +++ b/hw/acpi/Makefile.objs
>> @@ -6,6 +6,7 @@ common-obj-$(CONFIG_ACPI_MEMORY_HOTPLUG) += memory_hotplug.o
>>  common-obj-$(CONFIG_ACPI_CPU_HOTPLUG) += cpu.o
>>  common-obj-$(CONFIG_ACPI_NVDIMM) += nvdimm.o
>>  common-obj-$(CONFIG_ACPI_VMGENID) += vmgenid.o
>> +common-obj-$(CONFIG_ACPI_APEI) += hest_ghes.o
>>  common-obj-$(call lnot,$(CONFIG_ACPI_X86)) += acpi-stub.o
>>  
>>  common-obj-y += acpi_interface.o
>>
> Fold this patch into previous one.
Ok, thanks

> 
> Thanks,
> 
