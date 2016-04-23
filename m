Received: by 10.25.208.194 with SMTP id h185csp1048479lfg;
        Fri, 22 Apr 2016 18:16:57 -0700 (PDT)
X-Received: by 10.55.212.202 with SMTP id s71mr11817568qks.27.1461374217045;
        Fri, 22 Apr 2016 18:16:57 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m134si4827995qhb.91.2016.04.22.18.16.56
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 22 Apr 2016 18:16:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:43181 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1atmBs-00059z-FT
	for alex.bennee@linaro.org; Fri, 22 Apr 2016 21:16:56 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57083)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1atmBa-0004YK-7k
	for qemu-arm@nongnu.org; Fri, 22 Apr 2016 21:16:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1atmBX-0001hX-0w
	for qemu-arm@nongnu.org; Fri, 22 Apr 2016 21:16:38 -0400
Received: from szxga03-in.huawei.com ([119.145.14.66]:13017)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>)
	id 1atmBW-0001fs-88; Fri, 22 Apr 2016 21:16:34 -0400
Received: from 172.24.1.51 (EHLO szxeml425-hub.china.huawei.com)
	([172.24.1.51])
	by szxrg03-dlp.huawei.com (MOS 4.4.3-GA FastPath queued)
	with ESMTP id CAK60028; Sat, 23 Apr 2016 09:16:22 +0800 (CST)
Received: from [127.0.0.1] (10.177.16.142) by szxeml425-hub.china.huawei.com
	(10.82.67.180) with Microsoft SMTP Server id 14.3.235.1;
	Sat, 23 Apr 2016 09:16:14 +0800
Message-ID: <571ACCDB.20800@huawei.com>
Date: Sat, 23 Apr 2016 09:16:11 +0800
From: Shannon Zhao <zhaoshenglong@huawei.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: Andrew Jones <drjones@redhat.com>
References: <1461219834-10416-1-git-send-email-zhaoshenglong@huawei.com>
	<1461219834-10416-4-git-send-email-zhaoshenglong@huawei.com>
	<20160422124842.uhskszmlsn6v53c5@hawk.localdomain>
In-Reply-To: <20160422124842.uhskszmlsn6v53c5@hawk.localdomain>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.177.16.142]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
	refid=str=0001.0A020202.571ACCE8.00CE, ss=1, re=0.000, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0, ip=0.0.0.0,
	so=2013-05-26 15:14:31, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: d525d51adae0c40dbc85876ae84a89e1
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.66
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v5 3/5] ARM: Add numa-node-id
 for /memory node
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
Cc: peter.maydell@linaro.org, david.daney@cavium.com, qemu-devel@nongnu.org,
	peter.huangpeng@huawei.com, qemu-arm@nongnu.org, shannon.zhao@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: nSmIKEcfLhe7



On 2016/4/22 20:48, Andrew Jones wrote:
> On Thu, Apr 21, 2016 at 02:23:52PM +0800, Shannon Zhao wrote:
>> From: Shannon Zhao <shannon.zhao@linaro.org>
>>
>> When specifying NUMA for ARM machine, generate /memory node according to
>> NUMA topology.
>>
>> Signed-off-by: Shannon Zhao <shannon.zhao@linaro.org>
>> ---
>>  hw/arm/boot.c | 31 ++++++++++++++++++++++++++++++-
>>  1 file changed, 30 insertions(+), 1 deletion(-)
>>
>> diff --git a/hw/arm/boot.c b/hw/arm/boot.c
>> index 5975fbf..3770235 100644
>> --- a/hw/arm/boot.c
>> +++ b/hw/arm/boot.c
>> @@ -14,6 +14,7 @@
>>  #include "hw/arm/linux-boot-if.h"
>>  #include "sysemu/kvm.h"
>>  #include "sysemu/sysemu.h"
>> +#include "sysemu/numa.h"
>>  #include "hw/boards.h"
>>  #include "hw/loader.h"
>>  #include "elf.h"
>> @@ -405,6 +406,9 @@ static int load_dtb(hwaddr addr, const struct arm_boot_info *binfo,
>>      void *fdt = NULL;
>>      int size, rc;
>>      uint32_t acells, scells;
>> +    char *nodename;
>> +    unsigned int i;
>> +    hwaddr mem_base, mem_len;
>>  
>>      if (binfo->dtb_filename) {
>>          char *filename;
>> @@ -456,14 +460,39 @@ static int load_dtb(hwaddr addr, const struct arm_boot_info *binfo,
>>          goto fail;
>>      }
>>  
>> +    mem_len = (nb_numa_nodes > 0) ? numa_info[0].node_mem : binfo->ram_size;
>>      rc = qemu_fdt_setprop_sized_cells(fdt, "/memory", "reg",
> 
> So node0's memory node will still be called '/memory' instead of
> '/memory@addr' like the other nodes? Shouldn't we change it too?
> 
Previously I deleted the /memory node creation codes in virt.c and
create here, but that will cause other boards booting fail since
load_dtb() is a common function. So to avoid more changes to other
files, I just use current way. So is there any way to change the node
name after it's created in qemu?

>>                                        acells, binfo->loader_start,
>> -                                      scells, binfo->ram_size);
>> +                                      scells, mem_len);
>>      if (rc < 0) {
>>          fprintf(stderr, "couldn't set /memory/reg\n");
>>          goto fail;
>>      }
>>  
>> +    if (nb_numa_nodes > 0) {
>> +        /* Set the numa-node-id for the first /memory node. */
>> +        qemu_fdt_setprop_cell(fdt, "/memory", "numa-node-id", 0);
>> +        /* create /memory node and set properties for other memory numa nodes */
>> +        mem_base = binfo->loader_start + mem_len;
>> +        for (i = 1; i < nb_numa_nodes; i++) {
>> +            mem_len = numa_info[i].node_mem;
>> +            nodename = g_strdup_printf("/memory@%" PRIx64, mem_base);
>> +            qemu_fdt_add_subnode(fdt, nodename);
>> +            qemu_fdt_setprop_string(fdt, nodename, "device_type", "memory");
>> +            rc = qemu_fdt_setprop_sized_cells(fdt, nodename, "reg",
>> +                                              acells, mem_base,
>> +                                              scells, mem_len);
>> +            if (rc < 0) {
>> +                fprintf(stderr, "couldn't set /memory/reg\n");
> 
> I'd extend this error message with either the full memory node name,
> i.e. '@addr', or something like "couldn't set... for node %d\n"
> 
Sure. Thanks.

-- 
Shannon

