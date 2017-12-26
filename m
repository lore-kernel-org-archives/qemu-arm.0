Received: by 10.223.134.117 with SMTP id 50csp3069236wrw;
        Tue, 26 Dec 2017 03:56:26 -0800 (PST)
X-Google-Smtp-Source: ACJfBovmdSFrfD2USu804W3bUk/q/69nEdcRPuvYe+ArpW/zZQAeTuAijGNK947ibjZc34MCg+wK
X-Received: by 10.129.165.88 with SMTP id c85mr16779611ywh.171.1514289386823;
        Tue, 26 Dec 2017 03:56:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1514289386; cv=none;
        d=google.com; s=arc-20160816;
        b=r+6YurvLNOwpTbG/lcZkocEEAcXpVVbAtGzANWXyoUtISA9JrsRT0VwHcH8lZk6up8
         G85afmM1QgicT38IAnU0CGCfvXKrAUw3tnM63Hvhw18dGZabHtag7CB8U6wzr/2fsaVX
         G7m/DSgOZOuAy3BvGSDeZO/xnDg+q7PyVnm7tcMgWDQUZgztRqtNkoJLmzAICyPyQo2f
         3XnL52vJVwyRAdcOZ0ZFCultoNqqpyQ5ShskQEynGfU0squ+05L7BMO9pjS2niC/9j2P
         AE+Jx/+xTVa6aMGSOwl5FMQuq9zTXTGdqflnxkBsdE5P6u2hw/aArrOaQcYzhGkCVISu
         05lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:references:to:mime-version
         :user-agent:from:date:message-id:arc-authentication-results;
        bh=BzgQ6lZEmg+UQ01xZrc9sg53sq114636xv2DXBAqnPk=;
        b=XjhUpDtAOb07vnnSnQQ+sXS5eA/MUc/TMR1/plb9llF1NMmOrqbF+VGL7tbhDy1AX0
         r1FIPXE9bbhFzpsQM5PAdasakrDgSIDHRFVgw4jGn6ovRfcdUOIoxkzAKAf+EysiLJLF
         fd7zviMCWC+cBhNvIaStGyVeVh4Q+He73efn7ZhQjN3t6MdeVepj1at1FEGh94LRf2mR
         IRzjO5r9OVgfJAWoOu0cmAm5F5LLuFutJ/Thj8RBXGvt9GBPXvF7d/KvZUdcdyOfNbrb
         WbuatgnGmFa8sSfa83sTTG7N7NxO3WPS9a5aWMZ1yqQVEM6mrZq7HiwbXjEKf/Fm9as0
         AoGw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l199si5509728ywc.195.2017.12.26.03.56.26
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 26 Dec 2017 03:56:26 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:37934 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eTnqM-0008RL-Be
	for alex.bennee@linaro.org; Tue, 26 Dec 2017 06:56:26 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48175)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1eTnqG-0008RC-4P
	for qemu-arm@nongnu.org; Tue, 26 Dec 2017 06:56:21 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1eTnqC-00037j-7K
	for qemu-arm@nongnu.org; Tue, 26 Dec 2017 06:56:20 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:2057 helo=huawei.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <zhaoshenglong@huawei.com>)
	id 1eTnqB-00034p-Qy; Tue, 26 Dec 2017 06:56:16 -0500
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.59])
	by Forcepoint Email with ESMTP id 0B1E7A14B4D4E;
	Tue, 26 Dec 2017 19:55:57 +0800 (CST)
Received: from [127.0.0.1] (10.177.16.142) by DGGEMS408-HUB.china.huawei.com
	(10.3.19.208) with Microsoft SMTP Server id 14.3.361.1; Tue, 26 Dec 2017
	19:55:50 +0800
Message-ID: <5A423867.203@huawei.com>
Date: Tue, 26 Dec 2017 19:54:15 +0800
From: Shannon Zhao <zhaoshenglong@huawei.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: Andrew Jones <drjones@redhat.com>
References: <1513925567-5184-1-git-send-email-zhaoshenglong@huawei.com>
	<20171226114828.lz3s5qztk6rcm2vi@hawk.localdomain>
In-Reply-To: <20171226114828.lz3s5qztk6rcm2vi@hawk.localdomain>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.177.16.142]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 45.249.212.191
Subject: Re: [Qemu-arm] [PATCH] Virt: ACPI: fix qemu assert due to
 re-assigned table data address
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, lersek@redhat.com,
	qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: NlZUOMPcHrkH



On 2017/12/26 19:48, Andrew Jones wrote:
> On Fri, Dec 22, 2017 at 02:52:47PM +0800, Shannon Zhao wrote:
>> acpi_data_push uses g_array_set_size to resize the memory size. If there is no
>> enough contiguous memory, the address will be changed. If we use the old value,
>> it will assert.
>> qemu-kvm: hw/acpi/bios-linker-loader.c:214: bios_linker_loader_add_checksum:
>> Assertion `start_offset < file->blob->len' failed.`
>>
>> Signed-off-by: Shannon Zhao <zhaoshenglong@huawei.com>
>> ---
>>  hw/arm/virt-acpi-build.c | 18 +++++++++++-------
>>  1 file changed, 11 insertions(+), 7 deletions(-)
>>
>> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
>> index 3d78ff6..5901142 100644
>> --- a/hw/arm/virt-acpi-build.c
>> +++ b/hw/arm/virt-acpi-build.c
>> @@ -453,6 +453,7 @@ build_spcr(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>>      AcpiSerialPortConsoleRedirection *spcr;
>>      const MemMapEntry *uart_memmap = &vms->memmap[VIRT_UART];
>>      int irq = vms->irqmap[VIRT_UART] + ARM_SPI_BASE;
>> +    int spcr_start = table_data->len;
>>  
>>      spcr = acpi_data_push(table_data, sizeof(*spcr));
>>  
>> @@ -476,8 +477,8 @@ build_spcr(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>>      spcr->pci_device_id = 0xffff;  /* PCI Device ID: not a PCI device */
>>      spcr->pci_vendor_id = 0xffff;  /* PCI Vendor ID: not a PCI device */
>>  
>> -    build_header(linker, table_data, (void *)spcr, "SPCR", sizeof(*spcr), 2,
>> -                 NULL, NULL);
>> +    build_header(linker, table_data, (void *)(table_data->data + spcr_start),
>> +                 "SPCR", table_data->len - spcr_start, 2, NULL, NULL);
>>  }
> 
> We don't need to change build_spcr(), as acpi_data_push() is only called
> once, so spcr == new table_data->data + old table_data->len and new
> table_data->len - spcr == sizeof(*spcr) (the size used in the only
> acpi_data_push() call)
> 
>>  
>>  static void
>> @@ -512,8 +513,8 @@ build_srat(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>>          mem_base += numa_info[i].node_mem;
>>      }
>>  
>> -    build_header(linker, table_data, (void *)srat, "SRAT",
>> -                 table_data->len - srat_start, 3, NULL, NULL);
>> +    build_header(linker, table_data, (void *)(table_data->data + srat_start),
>> +                 "SRAT", table_data->len - srat_start, 3, NULL, NULL);
> 
> Yes, we need this fix, as there are many acpi_data_push() calls in this
> function. I guess this was the table that triggered the assert.
> 
>>  }
>>  
>>  static void
>> @@ -522,6 +523,7 @@ build_mcfg(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>>      AcpiTableMcfg *mcfg;
>>      const MemMapEntry *memmap = vms->memmap;
>>      int len = sizeof(*mcfg) + sizeof(mcfg->allocation[0]);
>> +    int mcfg_start = table_data->len;
>>  
>>      mcfg = acpi_data_push(table_data, len);
>>      mcfg->allocation[0].address = cpu_to_le64(memmap[VIRT_PCIE_ECAM].base);
>> @@ -532,7 +534,8 @@ build_mcfg(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>>      mcfg->allocation[0].end_bus_number = (memmap[VIRT_PCIE_ECAM].size
>>                                            / PCIE_MMCFG_SIZE_MIN) - 1;
>>  
>> -    build_header(linker, table_data, (void *)mcfg, "MCFG", len, 1, NULL, NULL);
>> +    build_header(linker, table_data, (void *)(table_data->data + mcfg_start),
>> +                 "MCFG", len, 1, NULL, NULL);
>>  }
> 
> No need to change this one.
> 
>>  
>>  /* GTDT */
>> @@ -651,6 +654,7 @@ build_madt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>>  static void build_fadt(GArray *table_data, BIOSLinker *linker,
>>                         VirtMachineState *vms, unsigned dsdt_tbl_offset)
>>  {
>> +    int fadt_start = table_data->len;
>>      AcpiFadtDescriptorRev5_1 *fadt = acpi_data_push(table_data, sizeof(*fadt));
>>      unsigned xdsdt_entry_offset = (char *)&fadt->x_dsdt - table_data->data;
>>      uint16_t bootflags;
>> @@ -681,8 +685,8 @@ static void build_fadt(GArray *table_data, BIOSLinker *linker,
>>          ACPI_BUILD_TABLE_FILE, xdsdt_entry_offset, sizeof(fadt->x_dsdt),
>>          ACPI_BUILD_TABLE_FILE, dsdt_tbl_offset);
>>  
>> -    build_header(linker, table_data,
>> -                 (void *)fadt, "FACP", sizeof(*fadt), 5, NULL, NULL);
>> +    build_header(linker, table_data, (void *)(table_data->data + fadt_start),
>> +                 "FACP", table_data->len - fadt_start, 5, NULL, NULL);
>>  }
> 
> No need to change this one either.
> 
>>  
>>  /* DSDT */
>> -- 
>> 2.0.4
>>
>>
> 
> Please respin only changing the one that needs the fix.
> 
Hi Andrew,

Thanks for your comments. What you said is right that only the
build_srat needs to be fixed but I thought we need to unify the style
and avoid new issues if add some acpi_data_push in other functions in
the future.

Thanks,
-- 
Shannon

