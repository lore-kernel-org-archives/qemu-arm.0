Received: by 10.25.208.194 with SMTP id h185csp736139lfg;
        Fri, 22 Apr 2016 05:25:38 -0700 (PDT)
X-Received: by 10.140.239.137 with SMTP id k131mr8045669qhc.11.1461327938123;
        Fri, 22 Apr 2016 05:25:38 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f26si3313278qki.12.2016.04.22.05.25.37
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 22 Apr 2016 05:25:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:60536 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ata9R-0008Vq-Il
	for alex.bennee@linaro.org; Fri, 22 Apr 2016 08:25:37 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43013)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1ata9O-0008Qe-0q
	for qemu-arm@nongnu.org; Fri, 22 Apr 2016 08:25:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1ata9J-0004NL-Om
	for qemu-arm@nongnu.org; Fri, 22 Apr 2016 08:25:33 -0400
Received: from mx1.redhat.com ([209.132.183.28]:49006)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>)
	id 1ata9J-0004NF-HQ; Fri, 22 Apr 2016 08:25:29 -0400
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 25B1D81137;
	Fri, 22 Apr 2016 12:25:29 +0000 (UTC)
Received: from hawk.localdomain (dhcp-1-112.brq.redhat.com [10.34.1.112])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u3MCPOeu017845
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Fri, 22 Apr 2016 08:25:27 -0400
Date: Fri, 22 Apr 2016 14:25:24 +0200
From: Andrew Jones <drjones@redhat.com>
To: Shannon Zhao <zhaoshenglong@huawei.com>
Message-ID: <20160422122524.ajlzftqa3mtvm6dd@hawk.localdomain>
References: <1461219834-10416-1-git-send-email-zhaoshenglong@huawei.com>
	<1461219834-10416-2-git-send-email-zhaoshenglong@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1461219834-10416-2-git-send-email-zhaoshenglong@huawei.com>
User-Agent: Mutt/1.5.23.1 (2014-03-12)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
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
Cc: peter.maydell@linaro.org, david.daney@cavium.com, qemu-devel@nongnu.org,
	peter.huangpeng@huawei.com, qemu-arm@nongnu.org, shannon.zhao@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: EGITrOlcTLAi

On Thu, Apr 21, 2016 at 02:23:50PM +0800, Shannon Zhao wrote:
> From: Shannon Zhao <shannon.zhao@linaro.org>
> 
> This /distance-map node is used to describe the accessing distance
> between NUMA nodes.
> 
> Signed-off-by: Shannon Zhao <shannon.zhao@linaro.org>
> ---
>  hw/arm/virt.c | 30 ++++++++++++++++++++++++++++++
>  1 file changed, 30 insertions(+)
> 
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 56d35c7..814a1eb 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -40,6 +40,7 @@
>  #include "sysemu/device_tree.h"
>  #include "sysemu/sysemu.h"
>  #include "sysemu/kvm.h"
> +#include "sysemu/numa.h"
>  #include "hw/boards.h"
>  #include "hw/loader.h"
>  #include "exec/address-spaces.h"
> @@ -203,6 +204,9 @@ static VirtBoardInfo *find_machine_info(const char *cpu)
>  
>  static void create_fdt(VirtBoardInfo *vbi)
>  {
> +    unsigned int i, j, number, count;

s/count/index/ ?

> +    uint64_t *matrix;
> +
>      void *fdt = create_device_tree(&vbi->fdt_size);
>  
>      if (!fdt) {
> @@ -239,6 +243,32 @@ static void create_fdt(VirtBoardInfo *vbi)
>                                  "clk24mhz");
>      qemu_fdt_setprop_cell(fdt, "/apb-pclk", "phandle", vbi->clock_phandle);
>  
> +    if (nb_numa_nodes <= 0) {
> +        return;
> +    }
> +
> +    /* Add /distance-map node for NUMA */
> +    qemu_fdt_add_subnode(fdt, "/distance-map");
> +    qemu_fdt_setprop_string(fdt, "/distance-map", "compatible",
> +                            "numa-distance-map-v1");
> +
> +    number = nb_numa_nodes * nb_numa_nodes * 6;
> +    matrix = g_malloc0(number * sizeof(uint64_t));
> +    for (i = 0; i < nb_numa_nodes; i++) {
> +        for (j = 0; j < nb_numa_nodes; j++) {
> +            count = (i * nb_numa_nodes + j) * 6;
> +            matrix[count++] = 1;
> +            matrix[count++] = i;
> +            matrix[count++] = 1;
> +            matrix[count++] = j;
> +            matrix[count++] = 1;
> +            matrix[count++] = (i == j) ? 10 : 20;
> +        }
> +    }
> +    qemu_fdt_setprop_sized_cells_from_array(fdt, "/distance-map",
> +                                            "distance-matrix", number / 2,
> +                                            matrix);

I had to read qemu_fdt_setprop_sized_cells_from_array to understand why
above we're using 6 instead of 3, and then placing all the 1's in every
other slot, and then dividing number by 2 here. Is using this function
worth the confusion?

I think the following would greatly improve reviewability, and shave off
a bit of boot time (by not having to alloc more mem and copy the matrix).

    uint32_t *matrix;

    number = nb_numa_nodes * nb_numa_nodes * 3;
    matrix = g_malloc0(number * sizeof(uint32_t));
    for (i = 0; i < nb_numa_nodes; i++) {
        for (j = 0; j < nb_numa_nodes; j++) {
            count = (i * nb_numa_nodes + j) * 3;
            matrix[count++] = cpu_to_be32(i);
            matrix[count++] = cpu_to_be32(j);
            matrix[count++] = cpu_to_be32(i == j ? 10 : 20);
        }
    }
    qemu_fdt_setprop(fdt, "/distance-map", "distance-matrix",
                     matrix, number * sizeof(uint32_t));


> +    g_free(matrix);

Also, I think it would nicer if all this was put in its own function, and
then just add the following to create_fdt.

  if (nb_numa_nodes) {
      virt_fdt_create_distance_map(fdt);
  }

>  }
>  
>  static void fdt_add_psci_node(const VirtBoardInfo *vbi)
> -- 
> 2.0.4

Otherwise per https://lkml.org/lkml/2016/4/8/572 it looks good.

Thanks,
drew
