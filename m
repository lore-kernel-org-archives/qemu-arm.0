Received: by 10.28.173.206 with SMTP id w197csp4838215wme;
        Wed, 10 Jan 2018 04:21:21 -0800 (PST)
X-Google-Smtp-Source: ACJfBot23goHeX2D2HOKKmq6bpR6FV+mwwePy9EccQw/UgZF9FJ5agDrxWBDpsj3pY3zijV/EcC3
X-Received: by 10.101.100.204 with SMTP id t12mr14967053pgv.135.1515586881402;
        Wed, 10 Jan 2018 04:21:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1515586881; cv=none;
        d=google.com; s=arc-20160816;
        b=CwgokjVTDcRfp8EnJwLBiZ6Wj5j7CkIVRaDUherOup1j5eOijbAJcKF4eBoZ1pF82z
         bn9M4EGtD0cZ4kYjeskczxdLS+jyN6GKChGezkqrWXKcPlriKO4TQhx3cO/oX1bSpozM
         aiWFkDRDwvhNemMeivxR7EDsyZaLU8gMyXoRzJ73RdnfR02d3El6EkrTNmDM1Q/rAnJ/
         Q6ooNvuaNTxJEylK8bjS4IDgILb1gQ1lpJaUu85TThoroKra9lLoQsx83NE1nBUY+dwl
         OYExX2qQZ5haOcloiBP77Rq4BSXMyNzTPpp8QIF4NtpAskPuG2apUVQlyksbondONd6m
         DiAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:cc:to:subject:arc-authentication-results;
        bh=PNvst86pU0kmH6xnrTLz9+mtJOGlx71WTWNCtRbfvrU=;
        b=l6LxDJci2Egsnut9Xhy48ZmdXWJV+rfMhbZllSuoad/RMEimHJgRkHIilHY2Rf0ey9
         iuditPmje+NEE9OvK4gHFM9xcse4kyHqZFEkPg3FwjvUfpcQTYLJFZdRX+9TKKdS/JjW
         NAIa6v5AhMCNjTocEecLEboogTZyJhIYiX0TwoyjL/26PTehAjN9UqMHE0Wk2yW09UCO
         qWBREig9R5neUgu96XoYiQaQRE0q/fxPHvyZxM0I9aQdlkB/aqEqdLUtsfOPUF5sQlZn
         Q7D2hZ+zPo3sZJEmInsnxabblBH2rvEn1wWeQcoMTH/FVB0XeSCHp38L2YPZnsEHAtJn
         tgZw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id k20si11870081pll.182.2018.01.10.04.21.21;
        Wed, 10 Jan 2018 04:21:21 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1755464AbeAJMVT (ORCPT <rfc822;francois.ozog@linaro.org>
        + 5 others); Wed, 10 Jan 2018 07:21:19 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:4157 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1754252AbeAJMVS (ORCPT <rfc822;kvm@vger.kernel.org>);
        Wed, 10 Jan 2018 07:21:18 -0500
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.59])
        by Forcepoint Email with ESMTP id 22E61AD2B9EA0;
        Wed, 10 Jan 2018 20:21:03 +0800 (CST)
Received: from [127.0.0.1] (10.142.68.147) by DGGEMS406-HUB.china.huawei.com
 (10.3.19.206) with Microsoft SMTP Server id 14.3.361.1; Wed, 10 Jan 2018
 20:20:58 +0800
Subject: Re: [PATCH v14 4/9] ACPI: enable APEI GHES in the configure file
To:     Peter Maydell <peter.maydell@linaro.org>
CC:     Paolo Bonzini <pbonzini@redhat.com>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Igor Mammedov <imammedo@redhat.com>,
        Shannon Zhao <zhaoshenglong@huawei.com>,
        Marcelo Tosatti <mtosatti@redhat.com>,
        "Richard Henderson" <rth@twiddle.net>,
        Eduardo Habkost <ehabkost@redhat.com>,
        "James Morse" <james.morse@arm.com>,
        Christoffer Dall <christoffer.dall@linaro.org>,
        Marc Zyngier <marc.zyngier@arm.com>,
        kvm-devel <kvm@vger.kernel.org>,
        "QEMU Developers" <qemu-devel@nongnu.org>,
        qemu-arm <qemu-arm@nongnu.org>,
        Huangshaoyu <huangshaoyu@huawei.com>,
        "Zhengqiang (turing)" <zhengqiang10@huawei.com>,
        Xu Wei <xuwei5@hisilicon.com>
References: <1514440458-10515-1-git-send-email-gengdongjiu@huawei.com>
 <1514440458-10515-5-git-send-email-gengdongjiu@huawei.com>
 <CAFEAcA-sZrr71e0KtTYXao7WQzDoAGtdDqVL1Swjqqs2jUWtWw@mail.gmail.com>
From:   gengdongjiu <gengdongjiu@huawei.com>
Message-ID: <fc41a8ab-3e94-8c8d-6c46-219f1dff82d3@huawei.com>
Date:   Wed, 10 Jan 2018 20:20:45 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-sZrr71e0KtTYXao7WQzDoAGtdDqVL1Swjqqs2jUWtWw@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.142.68.147]
X-CFilter-Loop: Reflected
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: ltuxIIYwFmBg

On 2018/1/10 1:16, Peter Maydell wrote:
> On 28 December 2017 at 05:54, Dongjiu Geng <gengdongjiu@huawei.com> wrote:
>> Add CONFIG_ACPI_APEI configuration in the arm-softmmu.mak
>> and add build choice in the Makefile.objs.
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
> 
> You should include this in the patch which first adds the
> new host_ghes.c file. Otherwise that patch won't compile.

sure, will modify it.

> 
> thanks
> -- PMM
> 
> .
> 
