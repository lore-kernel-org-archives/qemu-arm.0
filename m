Received: by 10.223.153.116 with SMTP id x107csp374685wrb;
        Mon, 20 Nov 2017 01:27:33 -0800 (PST)
X-Google-Smtp-Source: AGs4zMY1ZR2Qymne3zhdmjpzQac3eSsc12igttUCpBQQFwv1HL2P2Ztwuu2RFV0E2XroG0sgTVDl
X-Received: by 10.37.89.67 with SMTP id n64mr7760531ybb.149.1511170053752;
        Mon, 20 Nov 2017 01:27:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1511170053; cv=none;
        d=google.com; s=arc-20160816;
        b=ScvutOvzIpEKbIbTzDCdEhg+zoiKuFDfGwR4XX6ftyfXIbZyoMn9Crx+ShgovxhsYM
         AupstzBTbSZJDJNMFuxbwhSmohrIOTUsdBa5nYl7eV43B7FwZm+6hmsL8ZyQhkrse7ON
         Cky4nbUx2iMZSoRlnFSQ7EO6xgDsrd5xRF8zc9QiiFiPc0ENRSux8A/7Wn+3jxrkSH3S
         ZQp9RDTiRdGJPqHDfeo9y16S00fJzys+ZlyEQJpJy86TRMUCT06ETG7+8bRnNUTuxnQA
         InJ4EJ/4+Iq8NdHWjB0d/aSb2rEuoyi/q/qJjzCfqi1fyrBuNwFr2SGZsolNjprei6TO
         0qOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:references:to:mime-version
         :user-agent:from:date:message-id:arc-authentication-results;
        bh=Zbd4VpSWmJY3366ctJLrefZdkgCa+f+Ia/SkxEj0UiI=;
        b=kCgOEvljGcEFQ27iVM3Bp+bh69O8ThGikf+MlwBhV9Rn8v75KfqL1r2bM20PAzTZHd
         a7Ss/XuPgHGPgn+taXHHhWy4fL9z/itFn5A1zxPTfXOf3pg/wQYdOFTN4SU1BgYwTyZd
         R/wRwVMt9ZvUObD813nn7xHAaGRohEo/gozUIzgx0FleBSMCh91jw6rohd0D1UpU7KF9
         DK7GwhKc2EPmsMGj7HOkk6h6sIhmQ0tVZZvIxYV6ZkvrS92ZpLHuLjsEXV/5yQ7zXKR7
         9vRtu05nVA9rfO4fnvCLwcPnM+hVx2A0oGn8IJB+7ZE6UY1UZDbqFbXAPfsaadTttQ12
         1Gag==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n6si1954886ybd.402.2017.11.20.01.27.33
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 20 Nov 2017 01:27:33 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:56253 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eGiMX-0001v1-3l
	for alex.bennee@linaro.org; Mon, 20 Nov 2017 04:27:33 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33371)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhuyijun@huawei.com>) id 1eGiMF-0001qb-98
	for qemu-arm@nongnu.org; Mon, 20 Nov 2017 04:27:21 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhuyijun@huawei.com>) id 1eGiME-0000Gs-21
	for qemu-arm@nongnu.org; Mon, 20 Nov 2017 04:27:15 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:2793)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_ARCFOUR_SHA1:16) (Exim 4.71)
	(envelope-from <zhuyijun@huawei.com>)
	id 1eGiM9-0000Bt-1X; Mon, 20 Nov 2017 04:27:09 -0500
Received: from 172.30.72.58 (EHLO DGGEMS407-HUB.china.huawei.com)
	([172.30.72.58])
	by dggrg04-dlp.huawei.com (MOS 4.4.6-GA FastPath queued)
	with ESMTP id DLE69746; Mon, 20 Nov 2017 17:23:44 +0800 (CST)
Received: from [127.0.0.1] (10.177.27.25) by DGGEMS407-HUB.china.huawei.com
	(10.3.19.207) with Microsoft SMTP Server id 14.3.361.1; Mon, 20 Nov 2017
	17:23:05 +0800
Message-ID: <5A129EE4.2090704@huawei.com>
Date: Mon, 20 Nov 2017 17:22:44 +0800
From: Zhu Yijun <zhuyijun@huawei.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:11.0) Gecko/20120327 Thunderbird/11.0.1
MIME-Version: 1.0
To: Andrew Jones <drjones@redhat.com>
References: <1510622154-17224-1-git-send-email-zhuyijun@huawei.com>
	<1510622154-17224-3-git-send-email-zhuyijun@huawei.com>
	<20171114144708.uzh6mkmjygojfpbu@kamzik.brq.redhat.com>
In-Reply-To: <20171114144708.uzh6mkmjygojfpbu@kamzik.brq.redhat.com>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.177.27.25]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
	refid=str=0001.0A020203.5A129F21.0002, ss=1, re=0.000, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0, ip=0.0.0.0,
	so=2014-11-16 11:51:01, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: 960717034aa2fc40f765b183d0d23254
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
	[fuzzy]
X-Received-From: 45.249.212.190
Subject: Re: [Qemu-arm] [Qemu-devel] [RFC 2/5] hw/arm/virt: Enable dynamic
 generation of guest RAM memory regions
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
Cc: peter.maydell@linaro.org, qemu-devel@nongnu.org,
	shameerali.kolothum.thodi@huawei.com, eric.auger@redhat.com,
	qemu-arm@nongnu.org, zhaoshenglong@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: kPC+Dx1vyTsL

Hi Andrew,

Thanks for your review!

On 2017/11/14 22:47, Andrew Jones wrote:
> On Tue, Nov 14, 2017 at 09:15:51AM +0800, zhuyijun@huawei.com wrote:
>> From: Zhu Yijun <zhuyijun@huawei.com>
>>
>> Register a ram_memory_region_init notify to allocate memory region
>> from system memory and add them as subregions.
>>
>> Signed-off-by: Zhu Yijun <zhuyijun@huawei.com>
>> ---
>>  hw/arm/virt.c         | 21 ++++++++++++++++-----
>>  include/hw/arm/virt.h |  1 +
>>  2 files changed, 17 insertions(+), 5 deletions(-)
>>
>> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
>> index 9e18b41..ddde5e1 100644
>> --- a/hw/arm/virt.c
>> +++ b/hw/arm/virt.c
>> @@ -1225,6 +1225,19 @@ void virt_machine_done(Notifier *notifier, void *data)
>>      virt_build_smbios(vms);
>>  }
>>  
>> +static void virt_ram_memory_region_init(Notifier *notifier, void *data)
>> +{
>> +    MachineState *machine = MACHINE(qdev_get_machine());
> No need to use qdev_get_machine(), you can get it with MACHINE(vms).
OK
>> +    MemoryRegion *sysmem = get_system_memory();
>> +    MemoryRegion *ram = g_new(MemoryRegion, 1);
>> +    VirtMachineState *vms = container_of(notifier, VirtMachineState,
>> +                                         ram_memory_region_init);
>> +
>> +    memory_region_allocate_system_memory(ram, NULL, "mach-virt.ram",
>> +                                         machine->ram_size);
>> +    memory_region_add_subregion(sysmem, vms->memmap[VIRT_MEM].base, ram);
>> +}
>> +
>>  static uint64_t virt_cpu_mp_affinity(VirtMachineState *vms, int idx)
>>  {
>>      uint8_t clustersz = ARM_DEFAULT_CPUS_PER_CLUSTER;
>> @@ -1258,7 +1271,6 @@ static void machvirt_init(MachineState *machine)
>>      MemoryRegion *sysmem = get_system_memory();
>>      MemoryRegion *secure_sysmem = NULL;
>>      int n, virt_max_cpus;
>> -    MemoryRegion *ram = g_new(MemoryRegion, 1);
>>      bool firmware_loaded = bios_name || drive_get(IF_PFLASH, 0, 0);
>>  
>>      /* We can probe only here because during property set
>> @@ -1409,10 +1421,6 @@ static void machvirt_init(MachineState *machine)
>>      fdt_add_cpu_nodes(vms);
>>      fdt_add_psci_node(vms);
>>  
>> -    memory_region_allocate_system_memory(ram, NULL, "mach-virt.ram",
>> -                                         machine->ram_size);
>> -    memory_region_add_subregion(sysmem, vms->memmap[VIRT_MEM].base, ram);
>> -
>>      create_flash(vms, sysmem, secure_sysmem ? secure_sysmem : sysmem);
>>  
>>      create_gic(vms, pic);
>> @@ -1462,6 +1470,9 @@ static void machvirt_init(MachineState *machine)
>>       * Notifiers are executed in registration reverse order.
>>       */
>>      create_platform_bus(vms, pic);
>> +
>> +    vms->ram_memory_region_init.notify = virt_ram_memory_region_init;
>> +    qemu_add_machine_init_done_notifier(&vms->ram_memory_region_init);
> Does this notifier need to be the first one executed? If so, then a
> comment should be added to state that. Actually the comment above
> create_platform_bus() could be replaced with a comment above the first
> notifier that states all notifier dependencies.
Yes, it should be the first notifier, because reserved memory regions must get before memory node created in arm_load_kernel_notify.
>>  }
>>  
>>  static bool virt_get_secure(Object *obj, Error **errp)
>> diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
>> index 33b0ff3..38906b8 100644
>> --- a/include/hw/arm/virt.h
>> +++ b/include/hw/arm/virt.h
>> @@ -90,6 +90,7 @@ typedef struct {
>>  typedef struct {
>>      MachineState parent;
>>      Notifier machine_done;
>> +    Notifier ram_memory_region_init;
>>      FWCfgState *fw_cfg;
>>      bool secure;
>>      bool highmem;
>> -- 
>> 1.8.3.1
>>
>>
>>
> Thanks,
> drew 
>
> .
>


