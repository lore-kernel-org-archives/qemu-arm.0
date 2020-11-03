Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp4441758lfa;
        Mon, 2 Nov 2020 18:52:14 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxUpU8rUhxrUkSv4OIBLyon6EuCeK7hx0Xz0/iTgd8zhdK1RcnRpfIoS2lRlsC2zQJqWqs0
X-Received: by 2002:a37:a34a:: with SMTP id m71mr18226497qke.81.1604371934629;
        Mon, 02 Nov 2020 18:52:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1604371934; cv=none;
        d=google.com; s=arc-20160816;
        b=WRJqb6C4e0atQwNau/IkyjY3AgS+XxP374M350P7/LFeVuS+FVBIuW4kkOAOt2OIoJ
         KkAsYhNaZqoHcOfgqBzwUG3Wac2RFdUGyDmQ7RKVS7fBuFWHtzdLnAhurQoP8JgCAoVO
         TUxVX3KfAior88E04A94AmlIj9s19DJgpZkl8FKmazymbYgVuvNVeqqAn65zHEFzD9QX
         GAf2032NcVZ+RgqAZ0QHVSuDX0UdWDiYj45I5lOw3aypyYK2UdECNfQOkb0s4p3WQYV0
         eF789tClzLDAvvQIXra+oLGyrFn2WRxOxPMu6BrD75Oh9VmgqSgCoP09MsKQ7Abja0oR
         W7BQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=e1GZ6gaAO8Z7MDhYgf8Ptyn4FTAdVjC1Tq1WTQTU6HE=;
        b=uPyRFL82jw1SXn1lLm7w6phte+GTFpLtaSQ2lxA+ptSPeIXRLNk1XCay4Ax61Jqlzt
         Wv/psm8kEDVQwhv9xp+eaHu5XlXQqmMBGnwBeQobnNlWiGtA0WVOYAuM9UVslOxWdHPF
         LyFCcaJk57NwOD1EE9kW4+lQdT+LuA0ptsb2R2z+VprkIMiGrGJtFrK1KYlmvVNpESn9
         kCM4YqVe2KqC/MULioZpr8sZBZZ2qtq0jwmxpvoE99aWglQ5OAZmQOpypsenml3RBsJH
         Zn5irhE5u6aRAMr9BPJwg4l+Aa6SeecdIcYGGacBX7ROfIYedxKPX0gJczW2FC5bZASC
         Q0kQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 192si10346681qke.12.2020.11.02.18.52.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 02 Nov 2020 18:52:14 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:49522 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kZmQg-0006Jf-42
	for alex.bennee@linaro.org; Mon, 02 Nov 2020 21:52:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48472)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fangying1@huawei.com>)
 id 1kZmLQ-0002Wv-8S; Mon, 02 Nov 2020 21:46:48 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:2429)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fangying1@huawei.com>)
 id 1kZmLN-00084j-36; Mon, 02 Nov 2020 21:46:47 -0500
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4CQDgv1bdNzLsMF;
 Tue,  3 Nov 2020 10:46:35 +0800 (CST)
Received: from [10.174.186.67] (10.174.186.67) by
 DGGEMS414-HUB.china.huawei.com (10.3.19.214) with Microsoft SMTP Server id
 14.3.487.0; Tue, 3 Nov 2020 10:46:29 +0800
Subject: Re: [RFC PATCH v2 07/13] hw/arm/virt-acpi-build: distinguish possible
 and present cpus Message
To: Andrew Jones <drjones@redhat.com>
References: <20201020131440.1090-1-fangying1@huawei.com>
 <20201020131440.1090-8-fangying1@huawei.com>
 <20201029172016.rsgo4stjrkdr7j2r@kamzik.brq.redhat.com>
From: Ying Fang <fangying1@huawei.com>
Message-ID: <18445803-aee7-ed77-8d9b-15df64221ab1@huawei.com>
Date: Tue, 3 Nov 2020 10:46:28 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20201029172016.rsgo4stjrkdr7j2r@kamzik.brq.redhat.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.186.67]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.191; envelope-from=fangying1@huawei.com;
 helo=szxga05-in.huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/02 20:52:53
X-ACL-Warn: Detected OS   = Linux 3.1-3.10 [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: peter.maydell@linaro.org, zhang.zhanghailiang@huawei.com,
 qemu-devel@nongnu.org, alex.chen@huawei.com, shannon.zhaosl@gmail.com,
 qemu-arm@nongnu.org, alistair.francis@wdc.com, imammedo@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: KyAWdvYc+ZrC



On 10/30/2020 1:20 AM, Andrew Jones wrote:
> 
> You need to remove 'Message' from the summary.
> 
> On Tue, Oct 20, 2020 at 09:14:34PM +0800, Ying Fang wrote:
>> When building ACPI tables regarding CPUs we should always build
>> them for the number of possible CPUs, not the number of present
>> CPUs. We then ensure only the present CPUs are enabled.
>>
>> Signed-off-by: Andrew Jones <drjones@redhat.com>
> 
> I guess my s-o-b is here because this is a rework of
> 
> https://github.com/rhdrjones/qemu/commit/b18d7a889f424b8a8679c43d7f4804fdeeeaf3fd
> 
> I think it changed enough you could just drop my authorship. A
> based-on comment in the commit message would be more than enough.
> 
> Comment on the patch below.
> 
>> Signed-off-by: Ying Fang <fangying1@huawei.com>
>> ---
>>   hw/arm/virt-acpi-build.c | 17 ++++++++++++-----
>>   1 file changed, 12 insertions(+), 5 deletions(-)
>>
>> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
>> index a222981737..fae5a26741 100644
>> --- a/hw/arm/virt-acpi-build.c
>> +++ b/hw/arm/virt-acpi-build.c
>> @@ -57,14 +57,18 @@
>>   
>>   #define ARM_SPI_BASE 32
>>   
>> -static void acpi_dsdt_add_cpus(Aml *scope, int cpus)
>> +static void acpi_dsdt_add_cpus(Aml *scope, VirtMachineState *vms)
>>   {
>>       uint16_t i;
>> +    CPUArchIdList *possible_cpus = MACHINE(vms)->possible_cpus;
>>   
>> -    for (i = 0; i < cpus; i++) {
>> +    for (i = 0; i < possible_cpus->len; i++) {
>>           Aml *dev = aml_device("C%.03X", i);
>>           aml_append(dev, aml_name_decl("_HID", aml_string("ACPI0007")));
>>           aml_append(dev, aml_name_decl("_UID", aml_int(i)));
>> +        if (possible_cpus->cpus[i].cpu == NULL) {
>> +            aml_append(dev, aml_name_decl("_STA", aml_int(0)));
>> +        }
>>           aml_append(scope, dev);
>>       }
>>   }
>> @@ -470,6 +474,7 @@ build_madt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>>       const int *irqmap = vms->irqmap;
>>       AcpiMadtGenericDistributor *gicd;
>>       AcpiMadtGenericMsiFrame *gic_msi;
>> +    int possible_cpus = MACHINE(vms)->possible_cpus->len;
>>       int i;
>>   
>>       acpi_data_push(table_data, sizeof(AcpiMultipleApicTable));
>> @@ -480,7 +485,7 @@ build_madt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>>       gicd->base_address = cpu_to_le64(memmap[VIRT_GIC_DIST].base);
>>       gicd->version = vms->gic_version;
>>   
>> -    for (i = 0; i < MACHINE(vms)->smp.cpus; i++) {
>> +    for (i = 0; i < possible_cpus; i++) {
>>           AcpiMadtGenericCpuInterface *gicc = acpi_data_push(table_data,
>>                                                              sizeof(*gicc));
>>           ARMCPU *armcpu = ARM_CPU(qemu_get_cpu(i));
>> @@ -495,7 +500,9 @@ build_madt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>>           gicc->cpu_interface_number = cpu_to_le32(i);
>>           gicc->arm_mpidr = cpu_to_le64(armcpu->mp_affinity);
>>           gicc->uid = cpu_to_le32(i);
>> -        gicc->flags = cpu_to_le32(ACPI_MADT_GICC_ENABLED);
>> +        if (i < MACHINE(vms)->smp.cpus) {
> 
> Shouldn't this be
> 
>          if (possible_cpus->cpus[i].cpu != NULL) {
> 
>> +            gicc->flags = cpu_to_le32(ACPI_MADT_GICC_ENABLED);
>> +        }

I now realized that I switched to use current cpu number as the limit to
make GIC flags enabled here.
However to judge NULL is much more suitable here.

Thanks,
Ying.

>>   
>>           if (arm_feature(&armcpu->env, ARM_FEATURE_PMU)) {
>>               gicc->performance_interrupt = cpu_to_le32(PPI(VIRTUAL_PMU_IRQ));
>> @@ -599,7 +606,7 @@ build_dsdt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>>        * the RTC ACPI device at all when using UEFI.
>>        */
>>       scope = aml_scope("\\_SB");
>> -    acpi_dsdt_add_cpus(scope, ms->smp.cpus);
>> +    acpi_dsdt_add_cpus(scope, vms);
>>       acpi_dsdt_add_uart(scope, &memmap[VIRT_UART],
>>                          (irqmap[VIRT_UART] + ARM_SPI_BASE));
>>       if (vmc->acpi_expose_flash) {
>> -- 
>> 2.23.0
>>
>>
> 
> Thanks,
> drew
> 
> .
> 
