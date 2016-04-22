Received: by 10.25.208.194 with SMTP id h185csp747622lfg;
        Fri, 22 Apr 2016 05:48:54 -0700 (PDT)
X-Received: by 10.55.19.75 with SMTP id d72mr4658619qkh.117.1461329334495;
        Fri, 22 Apr 2016 05:48:54 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s22si3573698qge.14.2016.04.22.05.48.54
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 22 Apr 2016 05:48:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:60889 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ataVy-0005gO-3v
	for alex.bennee@linaro.org; Fri, 22 Apr 2016 08:48:54 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47713)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1ataVw-0005et-Dq
	for qemu-arm@nongnu.org; Fri, 22 Apr 2016 08:48:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1ataVr-0002TY-KT
	for qemu-arm@nongnu.org; Fri, 22 Apr 2016 08:48:52 -0400
Received: from mx1.redhat.com ([209.132.183.28]:36509)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>)
	id 1ataVr-0002Sx-Cq; Fri, 22 Apr 2016 08:48:47 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B6A0662654;
	Fri, 22 Apr 2016 12:48:46 +0000 (UTC)
Received: from hawk.localdomain (dhcp-1-112.brq.redhat.com [10.34.1.112])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u3MCmgL6000740
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Fri, 22 Apr 2016 08:48:44 -0400
Date: Fri, 22 Apr 2016 14:48:42 +0200
From: Andrew Jones <drjones@redhat.com>
To: Shannon Zhao <zhaoshenglong@huawei.com>
Message-ID: <20160422124842.uhskszmlsn6v53c5@hawk.localdomain>
References: <1461219834-10416-1-git-send-email-zhaoshenglong@huawei.com>
	<1461219834-10416-4-git-send-email-zhaoshenglong@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1461219834-10416-4-git-send-email-zhaoshenglong@huawei.com>
User-Agent: Mutt/1.5.23.1 (2014-03-12)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Fri, 22 Apr 2016 12:48:46 +0000 (UTC)
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
Cc: peter.maydell@linaro.org, david.daney@cavium.com, qemu-devel@nongnu.org,
	peter.huangpeng@huawei.com, qemu-arm@nongnu.org, shannon.zhao@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 1mxkcWcIsUzp

On Thu, Apr 21, 2016 at 02:23:52PM +0800, Shannon Zhao wrote:
> From: Shannon Zhao <shannon.zhao@linaro.org>
> 
> When specifying NUMA for ARM machine, generate /memory node according to
> NUMA topology.
> 
> Signed-off-by: Shannon Zhao <shannon.zhao@linaro.org>
> ---
>  hw/arm/boot.c | 31 ++++++++++++++++++++++++++++++-
>  1 file changed, 30 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/arm/boot.c b/hw/arm/boot.c
> index 5975fbf..3770235 100644
> --- a/hw/arm/boot.c
> +++ b/hw/arm/boot.c
> @@ -14,6 +14,7 @@
>  #include "hw/arm/linux-boot-if.h"
>  #include "sysemu/kvm.h"
>  #include "sysemu/sysemu.h"
> +#include "sysemu/numa.h"
>  #include "hw/boards.h"
>  #include "hw/loader.h"
>  #include "elf.h"
> @@ -405,6 +406,9 @@ static int load_dtb(hwaddr addr, const struct arm_boot_info *binfo,
>      void *fdt = NULL;
>      int size, rc;
>      uint32_t acells, scells;
> +    char *nodename;
> +    unsigned int i;
> +    hwaddr mem_base, mem_len;
>  
>      if (binfo->dtb_filename) {
>          char *filename;
> @@ -456,14 +460,39 @@ static int load_dtb(hwaddr addr, const struct arm_boot_info *binfo,
>          goto fail;
>      }
>  
> +    mem_len = (nb_numa_nodes > 0) ? numa_info[0].node_mem : binfo->ram_size;
>      rc = qemu_fdt_setprop_sized_cells(fdt, "/memory", "reg",

So node0's memory node will still be called '/memory' instead of
'/memory@addr' like the other nodes? Shouldn't we change it too?

>                                        acells, binfo->loader_start,
> -                                      scells, binfo->ram_size);
> +                                      scells, mem_len);
>      if (rc < 0) {
>          fprintf(stderr, "couldn't set /memory/reg\n");
>          goto fail;
>      }
>  
> +    if (nb_numa_nodes > 0) {
> +        /* Set the numa-node-id for the first /memory node. */
> +        qemu_fdt_setprop_cell(fdt, "/memory", "numa-node-id", 0);
> +        /* create /memory node and set properties for other memory numa nodes */
> +        mem_base = binfo->loader_start + mem_len;
> +        for (i = 1; i < nb_numa_nodes; i++) {
> +            mem_len = numa_info[i].node_mem;
> +            nodename = g_strdup_printf("/memory@%" PRIx64, mem_base);
> +            qemu_fdt_add_subnode(fdt, nodename);
> +            qemu_fdt_setprop_string(fdt, nodename, "device_type", "memory");
> +            rc = qemu_fdt_setprop_sized_cells(fdt, nodename, "reg",
> +                                              acells, mem_base,
> +                                              scells, mem_len);
> +            if (rc < 0) {
> +                fprintf(stderr, "couldn't set /memory/reg\n");

I'd extend this error message with either the full memory node name,
i.e. '@addr', or something like "couldn't set... for node %d\n"

> +                goto fail;
> +            }
> +
> +            qemu_fdt_setprop_cell(fdt, nodename, "numa-node-id", i);
> +            mem_base += mem_len;
> +            g_free(nodename);
> +        }
> +    }
> +
>      if (binfo->kernel_cmdline && *binfo->kernel_cmdline) {
>          rc = qemu_fdt_setprop_string(fdt, "/chosen", "bootargs",
>                                       binfo->kernel_cmdline);
> -- 
> 2.0.4

Thanks,
drew
