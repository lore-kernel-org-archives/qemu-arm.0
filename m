Received: by 10.223.188.70 with SMTP id a6csp1558998wrh;
        Fri, 25 Aug 2017 18:09:13 -0700 (PDT)
X-Received: by 10.98.208.6 with SMTP id p6mr164160pfg.69.1503709752997;
        Fri, 25 Aug 2017 18:09:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1503709752; cv=none;
        d=google.com; s=arc-20160816;
        b=PK9ZCB81X8+HRf9BZEgPWFqewl4v9rJ88iM9toaF+SdxB9FwMwtp/ZQFLewdTLT5tq
         zaCKMmxEuAGDzVEVgdBozSA77iEoC0naSplAJN4fGB240o6A5q0/6WB0sukoP3xQKZzw
         KlhQtk6iC+wMpPJldmJF6ZZaPQD3Ow6rQzp2XlVkQTTWAUp+KE/S0uVWY2toeEvL+3wY
         z0b1a2EQ1oFhJe+viyLEtQRznvGP0pizNyQlcvapz5NFvyRLuNrtt7YpOL5CUAJMgX5h
         XxdKcQ5nws+s6zCinthqq9A5R9zmADJFQrtZN3RlDAWRR7Wr6GtsYlT9bvT3A/bNHo3G
         HhPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:content-transfer-encoding:in-reply-to
         :references:subject:cc:to:mime-version:user-agent:from:date
         :message-id:arc-authentication-results;
        bh=NcVtg4zsBFKFtWuy7MnEs74Py6AHI2HQ9tQbuIC6PTU=;
        b=DniU+DaVhc3UBinx36aulbbVtuz8Jcj1xiLmE7uFRjlfThxQIlWrD4hfLFDgCGAEbf
         zwz1vTNDDvhwiiNnt66N0ybrCke8Mfo1ooZeHxyrUkiskQb2nCAw3SBIMRacJ371NNBk
         gCkmBnzHDfs1TsRCUyVPU50WbQbaNdQ7qUmWOBpJfZm1OP8zD9uMnk30mt5N4LjVxqgI
         iMyTt5CH1uSdha+OIxyQpFmaR7yKvxA9aqkMYh6HakyaZS4rxXIQSpr+kN0KQH3+0+iQ
         07u3hXgpynMacRlRDBTCztULq29t2RI8fRp5GYoF+yUpAanv/nJ2PGXsqA8rF9p2X5kL
         rRYw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of linux-kernel-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=linux-kernel-owner@vger.kernel.org
Return-Path: <linux-kernel-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id 7si5952582plc.425.2017.08.25.18.09.12;
        Fri, 25 Aug 2017 18:09:12 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of linux-kernel-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of linux-kernel-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=linux-kernel-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1754211AbdHZBJI (ORCPT <rfc822;daniel.diaz@linaro.org>
        + 26 others); Fri, 25 Aug 2017 21:09:08 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:5459 "EHLO
        szxga04-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751407AbdHZBJG (ORCPT
        <rfc822;linux-kernel@vger.kernel.org>);
        Fri, 25 Aug 2017 21:09:06 -0400
Received: from 172.30.72.60 (EHLO DGGEMS413-HUB.china.huawei.com) ([172.30.72.60])
        by dggrg04-dlp.huawei.com (MOS 4.4.6-GA FastPath queued)
        with ESMTP id DFX10032;
        Sat, 26 Aug 2017 09:08:29 +0800 (CST)
Received: from [127.0.0.1] (10.177.16.142) by DGGEMS413-HUB.china.huawei.com
 (10.3.19.213) with Microsoft SMTP Server id 14.3.301.0; Sat, 26 Aug 2017
 09:08:18 +0800
Message-ID: <59A0C9FE.5010204@huawei.com>
Date:   Sat, 26 Aug 2017 09:08:14 +0800
From:   Shannon Zhao <zhaoshenglong@huawei.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To:     gengdongjiu <gengdongjiu@huawei.com>, <lersek@redhat.com>,
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
CC:     <huangshaoyu@huawei.com>, <wuquanming@huawei.com>,
        <linuxarm@huawei.com>, <zhengqiang10@huawei.com>
Subject: Re: [PATCH v11 2/6] ACPI: Add APEI GHES Table Generation support
References: <1503066227-18251-1-git-send-email-gengdongjiu@huawei.com> <1503066227-18251-3-git-send-email-gengdongjiu@huawei.com> <599ECE95.10205@huawei.com> <9a878b42-c480-2c7b-0f04-202193d8c56b@huawei.com>
In-Reply-To: <9a878b42-c480-2c7b-0f04-202193d8c56b@huawei.com>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.177.16.142]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
        refid=str=0001.0A090204.59A0CA0D.0049,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0,
        ip=0.0.0.0,
        so=2014-11-16 11:51:01,
        dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: 72b1c22ab38c0022a5c2d9e53ed95867
Sender: linux-kernel-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kernel.vger.kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
X-TUID: 3wgWGqTr/yDB



On 2017/8/25 19:20, gengdongjiu wrote:
>>> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
>>> >> index 3d78ff6..def1ec1 100644
>>> >> --- a/hw/arm/virt-acpi-build.c
>>> >> +++ b/hw/arm/virt-acpi-build.c
>>> >> @@ -45,6 +45,7 @@
>>> >>  #include "hw/arm/virt.h"
>>> >>  #include "sysemu/numa.h"
>>> >>  #include "kvm_arm.h"
>>> >> +#include "hw/acpi/hest_ghes.h"
>>> >>  
>>> >>  #define ARM_SPI_BASE 32
>>> >>  #define ACPI_POWER_BUTTON_DEVICE "PWRB"
>>> >> @@ -771,6 +772,9 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
>>> >>      acpi_add_table(table_offsets, tables_blob);
>>> >>      build_spcr(tables_blob, tables->linker, vms);
>>> >>  
>>> >> +    acpi_add_table(table_offsets, tables_blob);
>>> >> +    ghes_build_acpi(tables_blob, tables->hardware_errors, tables->linker);
>>> >> +
>> > So we add this table unconditionally. Is there any bad impact if QEMU
>> > runs on old kvm? Does it need to check whether KVM supports RAS?
> this table is added before guest OS boot. so can not use KVM to check it.
No, we can check the RAS capability when we create vcpus like you done
in another patch ans can use that in table generation.

> if the old kvm does not support RAS, it does not have bad impact. only waste table memory.
> May be we can make it as device? if this device is enabled in the qemu
> boot parameters, then we will add this table?
> 

And you need to add a option to virt machine for (migration)
compatibility. On new virt machine it's on by default while off for old
ones.

Thanks,
-- 
Shannon
