Received: by 10.223.134.117 with SMTP id 50csp11509457wrw;
        Tue, 2 Jan 2018 20:02:32 -0800 (PST)
X-Google-Smtp-Source: ACJfBosnFTQcWvm4CDGDKIr5haIJdmzouPi2/CI9rX6boJVdf0BplDBUFg/FSb4kLFBDFxsyYVxU
X-Received: by 10.159.233.135 with SMTP id bh7mr240394plb.52.1514952152090;
        Tue, 02 Jan 2018 20:02:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1514952152; cv=none;
        d=google.com; s=arc-20160816;
        b=L1pIFKWEOJO/1a7s40qANANNUha7taAJT7ojctFcHadlLsIkZtGmyA84V2DqVxMI6l
         9bOZe6R0uKtxUw0qQgpmxvmlYqj6TLB+jeXnM7CCYmP4Cd3qYQDfaHgAeKADbunYEZZP
         XO3G7OxMHpFeiV8uo/dGUogHhy+NRo1JIMKK4akpF0b/fmwVGm987NEyNxH0r9F9xyAL
         PhGZeZQCQ9oq4ECdBldgsJgbdyrohJsH/d3HFwLVHQzjMkzhYnBhhOH3lE2hT9hlovAu
         P5YW/NDVKsKPXqmFLq3sWJfzshEOMJgDtfF+VUjNWuXLH4Qz/EwDwrgAy3pcet8yJCvC
         UxQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:cc:to:subject:arc-authentication-results;
        bh=QLTEW09hisS5HrAUs9ayICkKId46giQ0cdvPv9KlX1w=;
        b=ecWlrd29u1Ir6ImsauvsNsQNJmYmsJcGlJlLxFxiM9poRIPIK7lABywEDfBqrs0CZy
         lx1Envcgerui1Tw1b7ZILYrlLiO1GXnYBcVqeT89NABKRb0mi0hqn+CbJCdHB8pCxhJX
         bDbYoYPsOwJmcbe1d/FmwMsNqhQvoX0Xlh9HzkncgL6lcNyt9v8IeF7IMmngORnpBQz5
         oLS3vxbup/dbaPzGWeZedMws52pEkWpJW9WpBvx/GlEzWdUr2nsrIvwlJfZMrwmttuZ0
         WvANPCYWV84juYT+8V5ynjAIJldnQ5dV7KgbpLOgiyM1I9RCObO3A5Z807JFIdK5I9Ol
         kU2A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id g5si126806plo.366.2018.01.02.20.02.31;
        Tue, 02 Jan 2018 20:02:32 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751166AbeACEC2 (ORCPT <rfc822;francois.ozog@linaro.org>
        + 5 others); Tue, 2 Jan 2018 23:02:28 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:3663 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1751040AbeACEC1 (ORCPT <rfc822;kvm@vger.kernel.org>);
        Tue, 2 Jan 2018 23:02:27 -0500
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.58])
        by Forcepoint Email with ESMTP id 74A13C265F45F;
        Wed,  3 Jan 2018 12:02:14 +0800 (CST)
Received: from [127.0.0.1] (10.142.68.147) by DGGEMS414-HUB.china.huawei.com
 (10.3.19.214) with Microsoft SMTP Server id 14.3.361.1; Wed, 3 Jan 2018
 12:02:09 +0800
Subject: Re: [PATCH v14 8/9] hw/arm/virt: Add RAS platform version for
 migration
To:     Igor Mammedov <imammedo@redhat.com>
CC:     <pbonzini@redhat.com>, <mst@redhat.com>,
        <zhaoshenglong@huawei.com>, <peter.maydell@linaro.org>,
        <mtosatti@redhat.com>, <rth@twiddle.net>, <ehabkost@redhat.com>,
        <james.morse@arm.com>, <christoffer.dall@linaro.org>,
        <marc.zyngier@arm.com>, <kvm@vger.kernel.org>,
        <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>,
        <huangshaoyu@huawei.com>, <zhengqiang10@huawei.com>,
        <xuwei5@hisilicon.com>
References: <1514440458-10515-1-git-send-email-gengdongjiu@huawei.com>
 <1514440458-10515-9-git-send-email-gengdongjiu@huawei.com>
 <20171228155832.05a9966b@igors-macbook-pro.local>
From:   gengdongjiu <gengdongjiu@huawei.com>
Message-ID: <44597cd2-1f8d-387b-2565-10b4eb4c2b23@huawei.com>
Date:   Wed, 3 Jan 2018 12:02:05 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <20171228155832.05a9966b@igors-macbook-pro.local>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.142.68.147]
X-CFilter-Loop: Reflected
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: 9DuPuxiUyi9U

Igor,
   Thanks for the review and comments.

On 2017/12/28 22:58, Igor Mammedov wrote:
> On Thu, 28 Dec 2017 13:54:17 +0800
> Dongjiu Geng <gengdongjiu@huawei.com> wrote:
> 
>> Support this feature since version 2.10, disable it by
>> default in the old version.
> patch should go before acpi tables are actually added,
> otherwise it might break bisectability.
yes, it should. I will move this patch before APEI tables are added.
Thanks for the pointing out.

> 
>>
>> Signed-off-by: Dongjiu Geng <gengdongjiu@huawei.com>
>> ---
>> Address Shannon's comments to add platform version in [1].
>>
>> [1]: https://lkml.org/lkml/2017/8/25/821
>>
>> Signed-off-by: Dongjiu Geng <gengdongjiu@huawei.com>
>> ---
>>  hw/arm/virt-acpi-build.c | 14 +++++++++-----
>>  hw/arm/virt.c            |  4 ++++
>>  include/hw/arm/virt.h    |  1 +
>>  3 files changed, 14 insertions(+), 5 deletions(-)
>>
>> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
>> index 06c14b3..b6974ef 100644
>> --- a/hw/arm/virt-acpi-build.c
>> +++ b/hw/arm/virt-acpi-build.c
>> @@ -801,10 +801,11 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
>>      acpi_add_table(table_offsets, tables_blob);
>>      build_spcr(tables_blob, tables->linker, vms);
>>  
>> -    acpi_add_table(table_offsets, tables_blob);
>> -    build_hardware_error_table(tables->hardware_errors, tables->linker);
>> -    build_apei_ghes(tables_blob, tables->hardware_errors, tables->linker);
>> -
>> +    if (!vmc->no_ras) {
> 
> it's better to avoid no_foo, use something like
> 
> vmc->has_ras
> 
> instead
Ok, I will rename it.

> 
>> +        acpi_add_table(table_offsets, tables_blob);
>> +        build_hardware_error_table(tables->hardware_errors, tables->linker);
>> +        build_apei_ghes(tables_blob, tables->hardware_errors, tables->linker);
>> +    }
>>  
>>      if (nb_numa_nodes > 0) {
>>          acpi_add_table(table_offsets, tables_blob);
>> @@ -891,6 +892,7 @@ static const VMStateDescription vmstate_virt_acpi_build = {
>>  
>>  void virt_acpi_setup(VirtMachineState *vms)
>>  {
>> +    VirtMachineClass *vmc = VIRT_MACHINE_GET_CLASS(vms);
>>      AcpiBuildTables tables;
>>      AcpiBuildState *build_state;
>>  
>> @@ -922,7 +924,9 @@ void virt_acpi_setup(VirtMachineState *vms)
>>      fw_cfg_add_file(vms->fw_cfg, ACPI_BUILD_TPMLOG_FILE, tables.tcpalog->data,
>>                      acpi_data_len(tables.tcpalog));
>>  
>> -    ghes_add_fw_cfg(vms->fw_cfg, tables.hardware_errors);
>> +    if (!vmc->no_ras) {
>> +        ghes_add_fw_cfg(vms->fw_cfg, tables.hardware_errors);
>> +    }
>>  
>>      build_state->rsdp_mr = acpi_add_rom_blob(build_state, tables.rsdp,
>>                                                ACPI_BUILD_RSDP_FILE, 0);
>> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
>> index 68495c2..ab79988 100644
>> --- a/hw/arm/virt.c
>> +++ b/hw/arm/virt.c
>> @@ -1732,8 +1732,12 @@ static void virt_2_9_instance_init(Object *obj)
>>  
>>  static void virt_machine_2_9_options(MachineClass *mc)
>>  {
>> +    VirtMachineClass *vmc = VIRT_MACHINE_CLASS(OBJECT_CLASS(mc));
>> +
>>      virt_machine_2_10_options(mc);
>>      SET_MACHINE_COMPAT(mc, VIRT_COMPAT_2_9);
>> +    /* memory recovery feature was introduced with 2.10 */
>> +    vmc->no_ras = true;
>>  }
>>  DEFINE_VIRT_MACHINE(2, 9)
>>  
>> diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
>> index 33b0ff3..8fbd664 100644
>> --- a/include/hw/arm/virt.h
>> +++ b/include/hw/arm/virt.h
>> @@ -84,6 +84,7 @@ typedef struct {
>>      bool disallow_affinity_adjustment;
>>      bool no_its;
>>      bool no_pmu;
>> +    bool no_ras;
>>      bool claim_edge_triggered_timers;
>>  } VirtMachineClass;
>>  
> 
> 
> .
> 
