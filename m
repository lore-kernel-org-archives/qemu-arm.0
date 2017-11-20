Received: by 10.223.153.116 with SMTP id x107csp385855wrb;
        Mon, 20 Nov 2017 01:40:37 -0800 (PST)
X-Google-Smtp-Source: AGs4zMbjWddOWnrPyDAOZYkbxH8/PTOabQvHebJF05s+/LQo6qjiZ45/MF18W0bJFHhRy0ttc/74
X-Received: by 10.37.45.98 with SMTP id s34mr7830609ybe.39.1511170837838;
        Mon, 20 Nov 2017 01:40:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1511170837; cv=none;
        d=google.com; s=arc-20160816;
        b=wyXW4OIvZRttB1yH8hN+K9ZAZiCtl8XbjWPleKF2g4p9QHwUzV5PJ9oxXGZT5BnAm0
         ZkOnXslOoReu58gVlPe6gnZQOvxFw283NOl1UgXhQflcJfnxJuUhw7F2HePI5GptvDSL
         5+n0C9BGdH0FK1qot1zAm9aZHNqzpS1dRDf0+X6xM6hxNWL9zxbvEyxRGviExHSmxVTO
         mjSp36X5ttKoahgmBUf+nadnHeZE+moco+LKr32bltnh6h1CveAq1+44/P1UegLDRnVe
         ZRHIxjMr6IQdTs2q+sR4gMkxbgrnw/MyBfuf3kYYW/eMQeAb854Qlan8ijGHJXgYzSav
         td1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:references:to:mime-version
         :user-agent:from:date:message-id:arc-authentication-results;
        bh=d4wYywAPVKtCzJN4ELvSKQnNkQZULRUJN9xbc+fGy0U=;
        b=HwL7QnIjKquc4p8WOC+IPzb44YNAcriU6ZqSss6TDX3IBq982Ickvw//WGOGBNiS/b
         pEIamrfrcCkdzbZfjodNfHzS/9OSb6i4ip9bpeLKltjihX9sT3vWoehQub5JV4bxGy7U
         rt0Nrz2OZfKloMhyXfgHewmgE3c5H6L41yyc4ex9jH9aqsPeN/4/fDLI1awkA2fQudq+
         gYXREHRiouxWV1jvbi5WPuIRi1vGHG8WHvIKv5UqiDggkV4oeWEOSTT3bD7Jbme7vlPI
         t6SLtaI+y6m63L9Fk8W+7KM4JJaYsYNTU3c3esggjRzAH8If/0DmqqL1nF1Tkcd8y9Ob
         N73Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 22si2027639ybc.729.2017.11.20.01.40.37
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 20 Nov 2017 01:40:37 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:56317 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eGiZB-0006eD-7l
	for alex.bennee@linaro.org; Mon, 20 Nov 2017 04:40:37 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37450)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhuyijun@huawei.com>) id 1eGiYr-0006b1-QW
	for qemu-arm@nongnu.org; Mon, 20 Nov 2017 04:40:22 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhuyijun@huawei.com>) id 1eGiYl-0006Dg-KZ
	for qemu-arm@nongnu.org; Mon, 20 Nov 2017 04:40:17 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:2794)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_ARCFOUR_SHA1:16) (Exim 4.71)
	(envelope-from <zhuyijun@huawei.com>)
	id 1eGiYV-0005zj-V3; Mon, 20 Nov 2017 04:39:56 -0500
Received: from 172.30.72.58 (EHLO DGGEMS405-HUB.china.huawei.com)
	([172.30.72.58])
	by dggrg04-dlp.huawei.com (MOS 4.4.6-GA FastPath queued)
	with ESMTP id DLE72073; Mon, 20 Nov 2017 17:39:41 +0800 (CST)
Received: from [127.0.0.1] (10.177.27.25) by DGGEMS405-HUB.china.huawei.com
	(10.3.19.205) with Microsoft SMTP Server id 14.3.361.1; Mon, 20 Nov 2017
	17:38:57 +0800
Message-ID: <5A12A2A9.4010007@huawei.com>
Date: Mon, 20 Nov 2017 17:38:49 +0800
From: Zhu Yijun <zhuyijun@huawei.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:11.0) Gecko/20120327 Thunderbird/11.0.1
MIME-Version: 1.0
To: Andrew Jones <drjones@redhat.com>
References: <1510622154-17224-1-git-send-email-zhuyijun@huawei.com>
	<1510622154-17224-5-git-send-email-zhuyijun@huawei.com>
	<20171114145101.sjol4obuna4kcmkp@kamzik.brq.redhat.com>
In-Reply-To: <20171114145101.sjol4obuna4kcmkp@kamzik.brq.redhat.com>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.177.27.25]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
	refid=str=0001.0A090202.5A12A2DE.00EF, ss=1, re=0.000, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0, ip=0.0.0.0,
	so=2014-11-16 11:51:01, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: 38dded2874d973f425dadfce9343fd14
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
	[fuzzy]
X-Received-From: 45.249.212.190
Subject: Re: [Qemu-arm] [Qemu-devel] [RFC 4/5] hw/arm/boot: set fdt size
 cell of memory node from mem_list
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
X-TUID: aMlYWwu6iRGa

On 2017/11/14 22:51, Andrew Jones wrote:
> On Tue, Nov 14, 2017 at 09:15:53AM +0800, zhuyijun@huawei.com wrote:
>> From: Zhu Yijun <zhuyijun@huawei.com>
>>
>> In case of accessing memory holes, we create memory fdt node by
>> traversing mem_list and adjust memory address if the addr is not
>> belong to RAM memory region.
>>
>> Signed-off-by: Zhu Yijun <zhuyijun@huawei.com>
>> ---
>>  hw/arm/boot.c | 151 ++++++++++++++++++++++++++++++++++++++++++----------------
>>  1 file changed, 109 insertions(+), 42 deletions(-)
>>
>> diff --git a/hw/arm/boot.c b/hw/arm/boot.c
>> index 30438f4..f4ca599 100644
>> --- a/hw/arm/boot.c
>> +++ b/hw/arm/boot.c
>> @@ -384,6 +384,25 @@ static void set_kernel_args_old(const struct arm_boot_info *info)
>>      }
>>  }
>>  
>> +static char *create_memory_fdt(void *fdt, uint32_t acells, hwaddr mem_base,
>> +                                          uint32_t scells, hwaddr mem_len)
>> +{
>> +    char *nodename = NULL;
>> +    int rc;
>> +
>> +    nodename = g_strdup_printf("/memory@%" PRIx64, mem_base);
>> +    qemu_fdt_add_subnode(fdt, nodename);
>> +    qemu_fdt_setprop_string(fdt, nodename, "device_type", "memory");
>> +    rc = qemu_fdt_setprop_sized_cells(fdt, nodename, "reg", acells, mem_base,
>> +                                      scells, mem_len);
>> +    if (rc < 0) {
>> +        fprintf(stderr, "couldn't set %s/reg\n", nodename);
>> +        g_free(nodename);
>> +    }
>> +
>> +    return nodename;
>> +}
>> +
>>  /**
>>   * load_dtb() - load a device tree binary image into memory
>>   * @addr:       the address to load the image at
>> @@ -412,7 +431,7 @@ static int load_dtb(hwaddr addr, const struct arm_boot_info *binfo,
>>      uint32_t acells, scells;
>>      char *nodename;
>>      unsigned int i;
>> -    hwaddr mem_base, mem_len;
>> +    RAMRegion *reg;
>>  
>>      if (binfo->dtb_filename) {
>>          char *filename;
>> @@ -464,49 +483,65 @@ static int load_dtb(hwaddr addr, const struct arm_boot_info *binfo,
>>          goto fail;
>>      }
>>  
>> +    /*
>> +     * Turn the /memory node created before into a NOP node, then create
>> +     * /memory@addr nodes for all numa nodes respectively.
>> +     */
>> +    qemu_fdt_nop_node(fdt, "/memory");
>> +
>>      if (nb_numa_nodes > 0) {
>> -        /*
>> -         * Turn the /memory node created before into a NOP node, then create
>> -         * /memory@addr nodes for all numa nodes respectively.
>> -         */
>> -        qemu_fdt_nop_node(fdt, "/memory");
>> -        mem_base = binfo->loader_start;
>> +        hwaddr reg_offset = 0; /* region base addr offset */
>> +        hwaddr reg_alloc_size = 0; /* region consumed size */
>> +        hwaddr node_mem_size = 0;
>> +        RAMRegion *tmp_reg = QLIST_FIRST(&binfo->mem_list);
>> +
>>          for (i = 0; i < nb_numa_nodes; i++) {
>> -            mem_len = numa_info[i].node_mem;
>> -            nodename = g_strdup_printf("/memory@%" PRIx64, mem_base);
>> -            qemu_fdt_add_subnode(fdt, nodename);
>> -            qemu_fdt_setprop_string(fdt, nodename, "device_type", "memory");
>> -            rc = qemu_fdt_setprop_sized_cells(fdt, nodename, "reg",
>> -                                              acells, mem_base,
>> -                                              scells, mem_len);
>> -            if (rc < 0) {
>> -                fprintf(stderr, "couldn't set %s/reg for node %d\n", nodename,
>> -                        i);
>> -                goto fail;
>> -            }
>> +            node_mem_size = numa_info[i].node_mem;
>> +            QLIST_FOREACH(reg, &binfo->mem_list, next) {
>> +                if (reg->base != tmp_reg->base) {
>> +                    continue;
>> +                }
>>  
>> -            qemu_fdt_setprop_cell(fdt, nodename, "numa-node-id", i);
>> -            mem_base += mem_len;
>> -            g_free(nodename);
>> -        }
>> -    } else {
>> -        Error *err = NULL;
>> +                if (node_mem_size >= (reg->size - reg_offset)) {
>> +                    reg_alloc_size = reg->size - reg_offset;
>> +                } else {
>> +                    reg_alloc_size = node_mem_size;
>> +                }
>>  
>> -        rc = fdt_path_offset(fdt, "/memory");
>> -        if (rc < 0) {
>> -            qemu_fdt_add_subnode(fdt, "/memory");
>> -        }
>> +                nodename = create_memory_fdt(fdt, acells,
>> +                                             reg->base + reg_offset,
>> +                                             scells, reg_alloc_size);
>> +                if (!nodename) {
>> +                    goto fail;
>> +                }
>> +
>> +                qemu_fdt_setprop_cell(fdt, nodename, "numa-node-id", i);
>> +                g_free(nodename);
>>  
>> -        if (!qemu_fdt_getprop(fdt, "/memory", "device_type", NULL, &err)) {
>> -            qemu_fdt_setprop_string(fdt, "/memory", "device_type", "memory");
>> +                node_mem_size -= reg_alloc_size;
>> +                reg_offset += reg_alloc_size;
>> +                tmp_reg = reg;
>> +
>> +                /* The region is depleted */
>> +                if (reg->size == reg_offset) {
>> +                    reg_offset = 0;
>> +                    tmp_reg = QLIST_NEXT(reg, next);
>> +                }
>> +
>> +                if (node_mem_size == 0) {
>> +                    break;
>> +                }
>> +            }
>>          }
>> +    } else {
>> +        QLIST_FOREACH(reg, &binfo->mem_list, next) {
>> +            nodename = create_memory_fdt(fdt, acells, reg->base,
>> +                                         scells, reg->size);
>> +            if (!nodename) {
>> +                goto fail;
>> +            }
>>  
>> -        rc = qemu_fdt_setprop_sized_cells(fdt, "/memory", "reg",
>> -                                          acells, binfo->loader_start,
>> -                                          scells, binfo->ram_size);
>> -        if (rc < 0) {
>> -            fprintf(stderr, "couldn't set /memory/reg\n");
>> -            goto fail;
>> +            g_free(nodename);
>>          }
>>      }
> I think we should move the numa allocation into board specific code,
> mach-virt, and we should also map dimms to numa nodes, rather than
> just dividing memory up.

OK, I will reconsider it.
>>  
>> @@ -814,6 +849,35 @@ static uint64_t load_aarch64_image(const char *filename, hwaddr mem_base,
>>      return size;
>>  }
>>  
>> +/* Find the max size memory region after info->initrd_start.
>> + * TODO: we may have a corner case where the memory node size may not correctly
>> + * fit into kernel/initrd/dtb Image sizes.
>> + * */
>> +static RAMRegion *find_initrd_memregion(const struct arm_boot_info *info,
>> +                                        hwaddr *initrd_start)
>> +{
>> +    RAMRegion *reg, *initrd_reg = NULL;
>> +    hwaddr max_size = 0;
>> +    hwaddr addr = *initrd_start;
>> +
>> +    QLIST_FOREACH(reg, &info->mem_list, next) {
>> +        if (addr < reg->base) {
>> +            if (max_size < reg->size) {
>> +                max_size = reg->size;
>> +                *initrd_start = reg->base;
>> +                initrd_reg = reg;
>> +            }
>> +        } else if (addr >= reg->base && addr < (reg->base + reg->size)) {
>> +            if (max_size < reg->base + reg->size - addr) {
>> +                max_size = reg->base + reg->size - addr;
>> +                initrd_reg = reg;
>> +            }
>> +        }
>> +    }
>> +
>> +    return initrd_reg;
>> +}
>> +
>>  static void arm_load_kernel_notify(Notifier *notifier, void *data)
>>  {
>>      CPUState *cs;
>> @@ -837,11 +901,11 @@ static void arm_load_kernel_notify(Notifier *notifier, void *data)
>>      assert(!(info->secure_board_setup && kvm_enabled()));
>>  
>>      /* If machine is not virt, the mem_list will empty. */
>> -    if (QLIST_EMPTY(&vms->bootinfo.mem_list)) {
>> +    if (QLIST_EMPTY(&info->mem_list)) {
>>          RAMRegion *new = g_new(RAMRegion, 1);
>>          new->base = info->loader_start;
>>          new->size = info->ram_size;
>> -        QLIST_INSERT_HEAD(&vms->bootinfo.mem_list, new, next);
>> +        QLIST_INSERT_HEAD(&info->mem_list, new, next);
>>      }
>>  
>>      info->dtb_filename = qemu_opt_get(qemu_get_machine_opts(), "dtb");
>> @@ -973,14 +1037,16 @@ static void arm_load_kernel_notify(Notifier *notifier, void *data)
>>          uint32_t fixupcontext[FIXUP_MAX];
>>  
>>          if (info->initrd_filename) {
>> +            RAMRegion *reg = find_initrd_memregion(info, &info->initrd_start);
>> +
>>              initrd_size = load_ramdisk(info->initrd_filename,
>>                                         info->initrd_start,
>> -                                       info->ram_size -
>> +                                       reg->base + reg->size -
>>                                         info->initrd_start);
>>              if (initrd_size < 0) {
>>                  initrd_size = load_image_targphys(info->initrd_filename,
>>                                                    info->initrd_start,
>> -                                                  info->ram_size -
>> +                                                  reg->base + reg->size -
>>                                                    info->initrd_start);
>>              }
>>              if (initrd_size < 0) {
>> @@ -1027,7 +1093,8 @@ static void arm_load_kernel_notify(Notifier *notifier, void *data)
>>              }
>>              fixupcontext[FIXUP_ARGPTR] = dtb_start;
>>          } else {
>> -            fixupcontext[FIXUP_ARGPTR] = info->loader_start + KERNEL_ARGS_ADDR;
>> +            hwaddr kernel_args_addr = info->loader_start + KERNEL_ARGS_ADDR;
>> +            fixupcontext[FIXUP_ARGPTR] = kernel_args_addr;
> What's this unrelated change for?

Sorry, it makes no sense.
>>              if (info->ram_size >= (1ULL << 32)) {
>>                  fprintf(stderr, "qemu: RAM size must be less than 4GB to boot"
>>                          " Linux kernel using ATAGS (try passing a device tree"
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


