Received: by 10.223.188.70 with SMTP id a6csp1638242wrh;
        Fri, 25 Aug 2017 19:50:39 -0700 (PDT)
X-Received: by 10.84.238.2 with SMTP id u2mr581642plk.169.1503715839824;
        Fri, 25 Aug 2017 19:50:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1503715839; cv=none;
        d=google.com; s=arc-20160816;
        b=os61vIHZWHJ7vVwyknXTvDQYNJaO0B5eVhz2nbw3GeEE1MQRgv80qqXVPef8RMCUjS
         o8cOqNMbahWxO8Go3I4X3VC4Jw8umhyMuZ8Ky3B9nHH0UYoEg25+g1vdQvVXmxEdf7Wp
         crUzT23C6mPWfiS6nsUGvMH8IRCqetDCBP87Xg6ZskuQlDlMs5ONiEhBKA7MY70F3TPq
         UkcGGJR8IuEOEXfrYJu9l7+T8dHSwSzrm1o+WWVpOK+hQuqzgoBIbvrnaycWYRkPrBAE
         ZAxQRmF4g4pg/FaSZslWCtMyo8jnSE+Ml6Ce8Uu9Bul4ZxGsmiDIetrIdw3uxgbfoaOU
         utAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:content-transfer-encoding:in-reply-to
         :mime-version:user-agent:date:message-id:from:cc:references:to
         :subject:arc-authentication-results;
        bh=O5ieenRCxc1cPIRPdck2YNbBWz8zx/bVHOpmwzajuz4=;
        b=r0t7CsTO8NaAX3ugwosf+dySbXDK1Suj1/T8rv7h12ZztiK/wbi1hBj8x28eOtrGBT
         cbiTcqxXvWTPiJbaoDU99SZMXcbAbc8eAVB1n9nQH1nsbfcnQUd6CQRUvKrS9aHF4VI0
         JG3PWQFJ85UvdPe1KV1vocOxRrboNWRe1/9RBw9IIrvLHwbyZeIgJTwA+SpesHPt+HUH
         UcBcbyS1koj7IExcD4/5bDaZuddktXVjbvTGtSzbbJbekkcXGIdX/YB0hyaJwaqUb0lp
         tiQR4um/1CANuVvDIMIH9ZBg4OExImi32Q1fDh9dcQ7jxwLBk4HQPAs6JlLU6IjquAWJ
         T5rg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of linux-kernel-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=linux-kernel-owner@vger.kernel.org
Return-Path: <linux-kernel-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id g33si6066662plb.812.2017.08.25.19.50.38;
        Fri, 25 Aug 2017 19:50:39 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of linux-kernel-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of linux-kernel-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=linux-kernel-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1754300AbdHZCuc (ORCPT <rfc822;daniel.diaz@linaro.org>
        + 26 others); Fri, 25 Aug 2017 22:50:32 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:4579 "EHLO
        szxga05-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754066AbdHZCub (ORCPT
        <rfc822;linux-kernel@vger.kernel.org>);
        Fri, 25 Aug 2017 22:50:31 -0400
Received: from 172.30.72.60 (EHLO DGGEMS408-HUB.china.huawei.com) ([172.30.72.60])
        by dggrg05-dlp.huawei.com (MOS 4.4.6-GA FastPath queued)
        with ESMTP id DFZ24726;
        Sat, 26 Aug 2017 10:50:06 +0800 (CST)
Received: from [127.0.0.1] (10.142.68.147) by DGGEMS408-HUB.china.huawei.com
 (10.3.19.208) with Microsoft SMTP Server id 14.3.301.0; Sat, 26 Aug 2017
 10:49:51 +0800
Subject: Re: [PATCH v11 2/6] ACPI: Add APEI GHES Table Generation support
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
 <1503066227-18251-3-git-send-email-gengdongjiu@huawei.com>
 <599ECE95.10205@huawei.com> <9a878b42-c480-2c7b-0f04-202193d8c56b@huawei.com>
 <59A0C9FE.5010204@huawei.com>
CC:     <huangshaoyu@huawei.com>, <wuquanming@huawei.com>,
        <linuxarm@huawei.com>, <zhengqiang10@huawei.com>
From:   gengdongjiu <gengdongjiu@huawei.com>
Message-ID: <27894653-ff09-7839-a46d-b41b9ee8ae48@huawei.com>
Date:   Sat, 26 Aug 2017 10:49:44 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.7.1
MIME-Version: 1.0
In-Reply-To: <59A0C9FE.5010204@huawei.com>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.142.68.147]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
        refid=str=0001.0A090203.59A0E1DF.001C,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0,
        ip=0.0.0.0,
        so=2014-11-16 11:51:01,
        dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: c402118da617b6014ffafdba62dacbd2
Sender: linux-kernel-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kernel.vger.kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
X-TUID: ndct0NLgh/mq

Hi Shannon,

On 2017/8/26 9:08, Shannon Zhao wrote:
> 
> 
> On 2017/8/25 19:20, gengdongjiu wrote:
>>>> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
>>>>>> index 3d78ff6..def1ec1 100644
>>>>>> --- a/hw/arm/virt-acpi-build.c
>>>>>> +++ b/hw/arm/virt-acpi-build.c
>>>>>> @@ -45,6 +45,7 @@
>>>>>>  #include "hw/arm/virt.h"
>>>>>>  #include "sysemu/numa.h"
>>>>>>  #include "kvm_arm.h"
>>>>>> +#include "hw/acpi/hest_ghes.h"
>>>>>>  
>>>>>>  #define ARM_SPI_BASE 32
>>>>>>  #define ACPI_POWER_BUTTON_DEVICE "PWRB"
>>>>>> @@ -771,6 +772,9 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
>>>>>>      acpi_add_table(table_offsets, tables_blob);
>>>>>>      build_spcr(tables_blob, tables->linker, vms);
>>>>>>  
>>>>>> +    acpi_add_table(table_offsets, tables_blob);
>>>>>> +    ghes_build_acpi(tables_blob, tables->hardware_errors, tables->linker);
>>>>>> +
>>>> So we add this table unconditionally. Is there any bad impact if QEMU
>>>> runs on old kvm? Does it need to check whether KVM supports RAS?
>> this table is added before guest OS boot. so can not use KVM to check it.
> No, we can check the RAS capability when we create vcpus like you done
> in another patch ans can use that in table generation.
understand your meaning.

ARM James ever have below comments about the table generation.
----------------------------------------------------------------------------------
But you can use APEI in a guest on CPUs without the RAS extensions: the host may
signal memory errors to Qemu for any number of reasons, user-space shouldn't
care how it knows. Examples are PCI-AER, any APEI event notified by polling or
one of the flavours of irq.

I would expect Qemu to generate a HEST based on its abilities, i.e. if it
supports any mechanism of notifying the guest about errors. Choosing the
mechanism then depends on the type of error.

Ideally the Qemu code for HEST/GHES/CPER generation code using some of the irqs
and polling could be shared with x86, as these should be possible using common
KVM APIs.
-----------------------------------------------------------------------------------

He means we can use APEI on CPUs without RAS and may be share this code with x86,
if Qemu can support any mechanism of notifying the guest about errors, it should be
generate the table.
Now we depend on the macro KVM_HAVE_MCE_INJECTION to decide whether Qemu can support
notifying the guest.

what do you think which we should be dependent on to generate the table?

> 
>> if the old kvm does not support RAS, it does not have bad impact. only waste table memory.
>> May be we can make it as device? if this device is enabled in the qemu
>> boot parameters, then we will add this table?
>>
> 
> And you need to add a option to virt machine for (migration)
> compatibility. On new virt machine it's on by default while off for old
> ones.
ok.

> 
> Thanks,
> 
