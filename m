Received: by 10.25.208.194 with SMTP id h185csp1154739lfg;
        Sat, 23 Apr 2016 00:27:42 -0700 (PDT)
X-Received: by 10.55.33.92 with SMTP id h89mr8235828qkh.143.1461396462399;
        Sat, 23 Apr 2016 00:27:42 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m9si5337040qgd.48.2016.04.23.00.27.42
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 23 Apr 2016 00:27:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:48638 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1atryf-000459-NK
	for alex.bennee@linaro.org; Sat, 23 Apr 2016 03:27:41 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54332)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1atryc-0003pa-0H
	for qemu-arm@nongnu.org; Sat, 23 Apr 2016 03:27:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1atrya-0001Wh-UZ
	for qemu-arm@nongnu.org; Sat, 23 Apr 2016 03:27:37 -0400
Received: from szxga02-in.huawei.com ([119.145.14.65]:2964)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>)
	id 1atryV-0001V4-Up; Sat, 23 Apr 2016 03:27:32 -0400
Received: from 172.24.1.50 (EHLO szxeml433-hub.china.huawei.com)
	([172.24.1.50])
	by szxrg02-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id DFW49581; Sat, 23 Apr 2016 15:27:23 +0800 (CST)
Received: from [127.0.0.1] (10.177.16.142) by szxeml433-hub.china.huawei.com
	(10.82.67.210) with Microsoft SMTP Server id 14.3.235.1;
	Sat, 23 Apr 2016 15:27:13 +0800
Message-ID: <571B23CA.5000306@huawei.com>
Date: Sat, 23 Apr 2016 15:27:06 +0800
From: Shannon Zhao <zhaoshenglong@huawei.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: Andrew Jones <drjones@redhat.com>
References: <1461219834-10416-1-git-send-email-zhaoshenglong@huawei.com>
	<1461219834-10416-2-git-send-email-zhaoshenglong@huawei.com>
	<20160422122524.ajlzftqa3mtvm6dd@hawk.localdomain>
	<571ACD25.9070707@huawei.com>
	<20160423070337.pkifpvpyheftycdz@hawk.localdomain>
In-Reply-To: <20160423070337.pkifpvpyheftycdz@hawk.localdomain>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.177.16.142]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
	refid=str=0001.0A020204.571B23DD.0045, ss=1, re=0.000, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0, ip=0.0.0.0,
	so=2013-06-18 04:22:30, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: 191a876254f3ef3280579ef42c6e4e41
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.65
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v5 1/5] ARM: Virt: Add
 /distance-map node for NUMA
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
Cc: peter.maydell@linaro.org, david.daney@cavium.com,
	peter.huangpeng@huawei.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, shannon.zhao@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: YWv1qxfkIAcr



On 2016/4/23 15:03, Andrew Jones wrote:
> On Sat, Apr 23, 2016 at 09:17:25AM +0800, Shannon Zhao wrote:
>> > 
>> > 
>> > On 2016/4/22 20:25, Andrew Jones wrote:
>>> > > On Thu, Apr 21, 2016 at 02:23:50PM +0800, Shannon Zhao wrote:
>>>>> > >> > From: Shannon Zhao <shannon.zhao@linaro.org>
>>>>> > >> > 
>>>>> > >> > This /distance-map node is used to describe the accessing distance
>>>>> > >> > between NUMA nodes.
>>>>> > >> > 
>>>>> > >> > Signed-off-by: Shannon Zhao <shannon.zhao@linaro.org>
>>>>> > >> > ---
>>>>> > >> >  hw/arm/virt.c | 30 ++++++++++++++++++++++++++++++
>>>>> > >> >  1 file changed, 30 insertions(+)
>>>>> > >> > 
>>>>> > >> > diff --git a/hw/arm/virt.c b/hw/arm/virt.c
>>>>> > >> > index 56d35c7..814a1eb 100644
>>>>> > >> > --- a/hw/arm/virt.c
>>>>> > >> > +++ b/hw/arm/virt.c
>>>>> > >> > @@ -40,6 +40,7 @@
>>>>> > >> >  #include "sysemu/device_tree.h"
>>>>> > >> >  #include "sysemu/sysemu.h"
>>>>> > >> >  #include "sysemu/kvm.h"
>>>>> > >> > +#include "sysemu/numa.h"
>>>>> > >> >  #include "hw/boards.h"
>>>>> > >> >  #include "hw/loader.h"
>>>>> > >> >  #include "exec/address-spaces.h"
>>>>> > >> > @@ -203,6 +204,9 @@ static VirtBoardInfo *find_machine_info(const char *cpu)
>>>>> > >> >  
>>>>> > >> >  static void create_fdt(VirtBoardInfo *vbi)
>>>>> > >> >  {
>>>>> > >> > +    unsigned int i, j, number, count;
>>> > > s/count/index/ ?
>>> > > 
>>>>> > >> > +    uint64_t *matrix;
>>>>> > >> > +
>>>>> > >> >      void *fdt = create_device_tree(&vbi->fdt_size);
>>>>> > >> >  
>>>>> > >> >      if (!fdt) {
>>>>> > >> > @@ -239,6 +243,32 @@ static void create_fdt(VirtBoardInfo *vbi)
>>>>> > >> >                                  "clk24mhz");
>>>>> > >> >      qemu_fdt_setprop_cell(fdt, "/apb-pclk", "phandle", vbi->clock_phandle);
>>>>> > >> >  
>>>>> > >> > +    if (nb_numa_nodes <= 0) {
>>>>> > >> > +        return;
>>>>> > >> > +    }
>>>>> > >> > +
>>>>> > >> > +    /* Add /distance-map node for NUMA */
>>>>> > >> > +    qemu_fdt_add_subnode(fdt, "/distance-map");
>>>>> > >> > +    qemu_fdt_setprop_string(fdt, "/distance-map", "compatible",
>>>>> > >> > +                            "numa-distance-map-v1");
>>>>> > >> > +
>>>>> > >> > +    number = nb_numa_nodes * nb_numa_nodes * 6;
>>>>> > >> > +    matrix = g_malloc0(number * sizeof(uint64_t));
>>>>> > >> > +    for (i = 0; i < nb_numa_nodes; i++) {
>>>>> > >> > +        for (j = 0; j < nb_numa_nodes; j++) {
>>>>> > >> > +            count = (i * nb_numa_nodes + j) * 6;
>>>>> > >> > +            matrix[count++] = 1;
>>>>> > >> > +            matrix[count++] = i;
>>>>> > >> > +            matrix[count++] = 1;
>>>>> > >> > +            matrix[count++] = j;
>>>>> > >> > +            matrix[count++] = 1;
>>>>> > >> > +            matrix[count++] = (i == j) ? 10 : 20;
>>>>> > >> > +        }
>>>>> > >> > +    }
>>>>> > >> > +    qemu_fdt_setprop_sized_cells_from_array(fdt, "/distance-map",
>>>>> > >> > +                                            "distance-matrix", number / 2,
>>>>> > >> > +                                            matrix);
>>> > > I had to read qemu_fdt_setprop_sized_cells_from_array to understand why
>>> > > above we're using 6 instead of 3, and then placing all the 1's in every
>>> > > other slot, and then dividing number by 2 here. Is using this function
>>> > > worth the confusion?
>>> > > 
>>> > > I think the following would greatly improve reviewability, and shave off
>>> > > a bit of boot time (by not having to alloc more mem and copy the matrix).
>>> > > 
>>> > >     uint32_t *matrix;
>>> > > 
>>> > >     number = nb_numa_nodes * nb_numa_nodes * 3;
>>> > >     matrix = g_malloc0(number * sizeof(uint32_t));
>>> > >     for (i = 0; i < nb_numa_nodes; i++) {
>>> > >         for (j = 0; j < nb_numa_nodes; j++) {
>>> > >             count = (i * nb_numa_nodes + j) * 3;
>>> > >             matrix[count++] = cpu_to_be32(i);
>>> > >             matrix[count++] = cpu_to_be32(j);
>>> > >             matrix[count++] = cpu_to_be32(i == j ? 10 : 20);
> I noticed that /distance-map is an optional node by the latest version
> of the spec. In its absence default values will be used. Do we plan on
> putting anything other then the 10s and 20s here? If not, then we can
> leave it to Linux to determine what the defaults should be, and it'll
> use them by itself if we leave this node out.
> 
Agree. I thought this before. It could not provide this /distance-map
node as well as it doesn't provide SLIT table for ACPI. So I'll drop
this patch.

Thanks,
-- 
Shannon

