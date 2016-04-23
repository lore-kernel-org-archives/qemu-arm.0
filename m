Received: by 10.25.208.194 with SMTP id h185csp1161077lfg;
        Sat, 23 Apr 2016 00:45:54 -0700 (PDT)
X-Received: by 10.140.18.114 with SMTP id 105mr24708100qge.41.1461397554549;
        Sat, 23 Apr 2016 00:45:54 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o189si5104288qkc.240.2016.04.23.00.45.54
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 23 Apr 2016 00:45:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:48868 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1atsGI-0007QB-2W
	for alex.bennee@linaro.org; Sat, 23 Apr 2016 03:45:54 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56389)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1atsGF-0007Ng-C2
	for qemu-arm@nongnu.org; Sat, 23 Apr 2016 03:45:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1atsGC-0005sv-4t
	for qemu-arm@nongnu.org; Sat, 23 Apr 2016 03:45:51 -0400
Received: from mx1.redhat.com ([209.132.183.28]:55592)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>)
	id 1atsGB-0005sl-Vi; Sat, 23 Apr 2016 03:45:48 -0400
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 37E02627CF;
	Sat, 23 Apr 2016 07:45:47 +0000 (UTC)
Received: from hawk.localdomain (ovpn-204-18.brq.redhat.com [10.40.204.18])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u3N7jgJi020690
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Sat, 23 Apr 2016 03:45:45 -0400
Date: Sat, 23 Apr 2016 09:45:42 +0200
From: Andrew Jones <drjones@redhat.com>
To: Shannon Zhao <zhaoshenglong@huawei.com>
Message-ID: <20160423074542.xhwqjwfaq74kt7br@hawk.localdomain>
References: <1461219834-10416-1-git-send-email-zhaoshenglong@huawei.com>
	<1461219834-10416-4-git-send-email-zhaoshenglong@huawei.com>
	<20160422124842.uhskszmlsn6v53c5@hawk.localdomain>
	<571ACCDB.20800@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <571ACCDB.20800@huawei.com>
User-Agent: Mutt/1.5.23.1 (2014-03-12)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Sat, 23 Apr 2016 07:45:47 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
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
Cc: peter.maydell@linaro.org, david.daney@cavium.com,
	peter.huangpeng@huawei.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, shannon.zhao@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 34DAeDYNBj7c

On Sat, Apr 23, 2016 at 09:16:11AM +0800, Shannon Zhao wrote:
> 
> 
> On 2016/4/22 20:48, Andrew Jones wrote:
> > On Thu, Apr 21, 2016 at 02:23:52PM +0800, Shannon Zhao wrote:
> >> From: Shannon Zhao <shannon.zhao@linaro.org>
> >>
> >> When specifying NUMA for ARM machine, generate /memory node according to
> >> NUMA topology.
> >>
> >> Signed-off-by: Shannon Zhao <shannon.zhao@linaro.org>
> >> ---
> >>  hw/arm/boot.c | 31 ++++++++++++++++++++++++++++++-
> >>  1 file changed, 30 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/hw/arm/boot.c b/hw/arm/boot.c
> >> index 5975fbf..3770235 100644
> >> --- a/hw/arm/boot.c
> >> +++ b/hw/arm/boot.c
> >> @@ -14,6 +14,7 @@
> >>  #include "hw/arm/linux-boot-if.h"
> >>  #include "sysemu/kvm.h"
> >>  #include "sysemu/sysemu.h"
> >> +#include "sysemu/numa.h"
> >>  #include "hw/boards.h"
> >>  #include "hw/loader.h"
> >>  #include "elf.h"
> >> @@ -405,6 +406,9 @@ static int load_dtb(hwaddr addr, const struct arm_boot_info *binfo,
> >>      void *fdt = NULL;
> >>      int size, rc;
> >>      uint32_t acells, scells;
> >> +    char *nodename;
> >> +    unsigned int i;
> >> +    hwaddr mem_base, mem_len;
> >>  
> >>      if (binfo->dtb_filename) {
> >>          char *filename;
> >> @@ -456,14 +460,39 @@ static int load_dtb(hwaddr addr, const struct arm_boot_info *binfo,
> >>          goto fail;
> >>      }
> >>  
> >> +    mem_len = (nb_numa_nodes > 0) ? numa_info[0].node_mem : binfo->ram_size;
> >>      rc = qemu_fdt_setprop_sized_cells(fdt, "/memory", "reg",
> > 
> > So node0's memory node will still be called '/memory' instead of
> > '/memory@addr' like the other nodes? Shouldn't we change it too?
> > 
> Previously I deleted the /memory node creation codes in virt.c and
> create here, but that will cause other boards booting fail since
> load_dtb() is a common function. So to avoid more changes to other
> files, I just use current way. So is there any way to change the node
> name after it's created in qemu?

I'm not sure if that's possible, but we could maybe use qemu_fdt_nop_node
to turn /memory into a NOP node, and then add a new one?

drew
