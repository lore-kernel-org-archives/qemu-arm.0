Received: by 10.25.208.194 with SMTP id h185csp498550lfg;
        Sun, 24 Apr 2016 09:55:51 -0700 (PDT)
X-Received: by 10.140.98.175 with SMTP id o44mr30994461qge.46.1461516951185;
        Sun, 24 Apr 2016 09:55:51 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n141si8607182qhc.132.2016.04.24.09.55.50
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 24 Apr 2016 09:55:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:55973 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1auNK2-0006Zw-QV
	for alex.bennee@linaro.org; Sun, 24 Apr 2016 12:55:50 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38607)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1auNK0-0006Xj-Nk
	for qemu-arm@nongnu.org; Sun, 24 Apr 2016 12:55:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1auNJx-0002jt-HC
	for qemu-arm@nongnu.org; Sun, 24 Apr 2016 12:55:48 -0400
Received: from mx1.redhat.com ([209.132.183.28]:49776)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>)
	id 1auNJx-0002jp-9m; Sun, 24 Apr 2016 12:55:45 -0400
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id EFEABC0586A0;
	Sun, 24 Apr 2016 16:55:43 +0000 (UTC)
Received: from hawk.localdomain (ovpn-204-19.brq.redhat.com [10.40.204.19])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u3OGtdJO006189
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Sun, 24 Apr 2016 12:55:42 -0400
Date: Sun, 24 Apr 2016 18:55:39 +0200
From: Andrew Jones <drjones@redhat.com>
To: Shannon Zhao <zhaoshenglong@huawei.com>
Message-ID: <20160424165539.an6slm62jxyjm7py@hawk.localdomain>
References: <1461402396-11776-1-git-send-email-zhaoshenglong@huawei.com>
	<1461402396-11776-3-git-send-email-zhaoshenglong@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1461402396-11776-3-git-send-email-zhaoshenglong@huawei.com>
User-Agent: Mutt/1.5.23.1 (2014-03-12)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH v6 2/5] ARM: Add numa-node-id for /memory node
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
X-TUID: 5fjvIu4ZbEJB

On Sat, Apr 23, 2016 at 05:06:33PM +0800, Shannon Zhao wrote:
> From: Shannon Zhao <shannon.zhao@linaro.org>
> 
> When specifying NUMA for ARM machine, generate /memory node according to
> NUMA topology.
> 
> Signed-off-by: Shannon Zhao <shannon.zhao@linaro.org>
> ---
>  hw/arm/boot.c | 43 +++++++++++++++++++++++++++++++++++++------
>  1 file changed, 37 insertions(+), 6 deletions(-)

Reviewed-by: Andrew Jones <drjones@redhat.com> 

> 
> diff --git a/hw/arm/boot.c b/hw/arm/boot.c
> index 5975fbf..cbc65a7 100644
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
> @@ -456,12 +460,39 @@ static int load_dtb(hwaddr addr, const struct arm_boot_info *binfo,
>          goto fail;
>      }
>  
> -    rc = qemu_fdt_setprop_sized_cells(fdt, "/memory", "reg",
> -                                      acells, binfo->loader_start,
> -                                      scells, binfo->ram_size);
> -    if (rc < 0) {
> -        fprintf(stderr, "couldn't set /memory/reg\n");
> -        goto fail;
> +    if (nb_numa_nodes > 0) {
> +        /*
> +         * Turn the /memory node created before into a NOP node, then create
> +         * /memory@addr nodes for all numa nodes respectively.
> +         */
> +        qemu_fdt_nop_node(fdt, "/memory");
> +        mem_base = binfo->loader_start;
> +        for (i = 0; i < nb_numa_nodes; i++) {
> +            mem_len = numa_info[i].node_mem;
> +            nodename = g_strdup_printf("/memory@%" PRIx64, mem_base);
> +            qemu_fdt_add_subnode(fdt, nodename);
> +            qemu_fdt_setprop_string(fdt, nodename, "device_type", "memory");
> +            rc = qemu_fdt_setprop_sized_cells(fdt, nodename, "reg",
> +                                              acells, mem_base,
> +                                              scells, mem_len);
> +            if (rc < 0) {
> +                fprintf(stderr, "couldn't set %s/reg for node %d\n", nodename,
> +                        i);
> +                goto fail;
> +            }
> +
> +            qemu_fdt_setprop_cell(fdt, nodename, "numa-node-id", i);
> +            mem_base += mem_len;
> +            g_free(nodename);
> +        }
> +    } else {
> +        rc = qemu_fdt_setprop_sized_cells(fdt, "/memory", "reg",
> +                                          acells, binfo->loader_start,
> +                                          scells, binfo->ram_size);
> +        if (rc < 0) {
> +            fprintf(stderr, "couldn't set /memory/reg\n");
> +            goto fail;
> +        }
>      }
>  
>      if (binfo->kernel_cmdline && *binfo->kernel_cmdline) {
> -- 
> 2.0.4
> 
>
