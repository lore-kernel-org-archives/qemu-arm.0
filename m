Received: by 2002:a17:907:20b4:b0:9a1:fa4e:495e with SMTP id pw20csp1284942ejb;
        Fri, 15 Sep 2023 07:38:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEuU/p3VIgCp9Fjt+vRQf6zEPzFGOjtf5a0UzTFLrzToc81Y9LEKI1pDGg1Fo1bwNUxdGiT
X-Received: by 2002:ac8:7f46:0:b0:412:d0b:12c0 with SMTP id g6-20020ac87f46000000b004120d0b12c0mr2337814qtk.22.1694788701459;
        Fri, 15 Sep 2023 07:38:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1694788701; cv=none;
        d=google.com; s=arc-20160816;
        b=AQp6aA0vm/XH0FNN6DN1KCV2KUN2cqfrQKmZiN371wtG92zy9llXT/YuPB6OtS/S+9
         t4yvMPSZre32SnLTWbpnFpJhhQgaj2HPoV65LkvoLmCrRZfc9uNpvbMdIElsp7zHP2oR
         ic3Jdqmi+z2g4xC5Sq8iQTiVjksJBa1bMweA9vOgOZN+bx7TG/93CdKABT3f0rF63mFK
         QXeGDaetfJ48R+6KitrpYBmVJnLLHSesOiaLzhGNQd3nKu0EAkeqXyIYIIynRfwYdUqy
         1gXwkAaOsc89s+WOG9wqLtL7AqNSxbt3C5WKSQBJkASGas3eR7rH0F0l4gewbKJ/akuw
         xB8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:organization:references
         :in-reply-to:message-id:subject:cc:to:date;
        bh=Px9UOgnikeFdr5r1jsRCJTgL1kG/k5HgZO5zD1KDKOc=;
        fh=UyxF3ErB8HWkAb0wPwWtezp7aNFUT4I24HPLI2nza84=;
        b=GhHjcCMNEbF8CUHQCwPHCQkbjzSurk3X5tkhn6j56IHuK0IzK8xr718eIqgxWMeqFJ
         j5hm16xWLav7rnLSQWv2ag/ZKuJMg3/A2hnWhCByKWp4pZ9NsEAiT/oUZjqxYP9Kcqxg
         v4s7oXkBL35RCepS4i2pc8BcksUVUR/1OCaIEIQvYcYRhwSZY4lCVhcWeD0/3WYfzsfx
         ihrrKQmjU1nbmRMaF5KiJ+EGhJBHqFVwtpSZRV+oIF+hQM+IgX3CdFo/n7nCduZJKC/S
         tafwjNmPpFzVSD2hgmtj7haRLh9AqFCe0A1lOoSqmWR5rb82bl+KFF9whxRgJRENUwX/
         mX2Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j9-20020ac85c49000000b00403ed9ef130si2488888qtj.516.2023.09.15.07.38.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 15 Sep 2023 07:38:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qh9xB-0003mo-SK; Fri, 15 Sep 2023 10:37:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1qh9x8-0003lj-6r; Fri, 15 Sep 2023 10:37:50 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1qh9x4-0003wm-Pr; Fri, 15 Sep 2023 10:37:49 -0400
Received: from lhrpeml500005.china.huawei.com (unknown [172.18.147.206])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4RnGvZ04Dmz6HJ4Y;
 Fri, 15 Sep 2023 22:35:53 +0800 (CST)
Received: from localhost (10.202.227.76) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.31; Fri, 15 Sep
 2023 15:37:41 +0100
Date: Fri, 15 Sep 2023 15:37:40 +0100
To: <ankita@nvidia.com>
CC: <jgg@nvidia.com>, <alex.williamson@redhat.com>, <clg@redhat.com>,
 <shannon.zhaosl@gmail.com>, <peter.maydell@linaro.org>, <ani@anisinha.ca>,
 <aniketa@nvidia.com>, <cjia@nvidia.com>, <kwankhede@nvidia.com>,
 <targupta@nvidia.com>, <vsethi@nvidia.com>, <acurrid@nvidia.com>,
 <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>
Subject: Re: [PATCH v1 3/4] hw/arm/virt-acpi-build: patch guest SRAT for
 NUMA nodes
Message-ID: <20230915153740.00006185@Huawei.com>
In-Reply-To: <20230915024559.6565-4-ankita@nvidia.com>
References: <20230915024559.6565-1-ankita@nvidia.com>
 <20230915024559.6565-4-ankita@nvidia.com>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.202.227.76]
X-ClientProxiedBy: lhrpeml500002.china.huawei.com (7.191.160.78) To
 lhrpeml500005.china.huawei.com (7.191.163.240)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=jonathan.cameron@huawei.com; helo=frasgout.his.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-to:  Jonathan Cameron <Jonathan.Cameron@Huawei.com>
From:  Jonathan Cameron via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: ZoZ2xF/tt5sB

On Thu, 14 Sep 2023 19:45:58 -0700
<ankita@nvidia.com> wrote:

> From: Ankit Agrawal <ankita@nvidia.com>
> 
> During bootup, Linux kernel parse the ACPI SRAT to determine the PXM ids.
> This allows for the creation of NUMA nodes for each unique id.
> 
> Insert a series of the unique PXM ids in the VM SRAT ACPI table. The
> range of nodes can be determined from the "dev_mem_pxm_start" and
> "dev_mem_pxm_count" object properties associated with the device. These
> nodes as made MEM_AFFINITY_HOTPLUGGABLE. This allows the kernel to create
> memory-less NUMA nodes on bootup to which a subrange (or entire range) of
> device memory can be added/removed.
> 
> Signed-off-by: Ankit Agrawal <ankita@nvidia.com>
> ---
>  hw/arm/virt-acpi-build.c | 54 ++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 54 insertions(+)
> 
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index 6b674231c2..6d1e3b6b8a 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -46,6 +46,7 @@
>  #include "hw/acpi/hmat.h"
>  #include "hw/pci/pcie_host.h"
>  #include "hw/pci/pci.h"
> +#include "hw/vfio/pci.h"
>  #include "hw/pci/pci_bus.h"
>  #include "hw/pci-host/gpex.h"
>  #include "hw/arm/virt.h"
> @@ -515,6 +516,57 @@ build_spcr(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>      acpi_table_end(linker, &table);
>  }
>  
> +static int devmem_device_list(Object *obj, void *opaque)
> +{
> +    GSList **list = opaque;
> +
> +    if (object_dynamic_cast(obj, TYPE_VFIO_PCI)) {
> +        *list = g_slist_append(*list, DEVICE(obj));
> +    }
> +
> +    object_child_foreach(obj, devmem_device_list, opaque);
> +    return 0;
> +}
> +
> +static GSList *devmem_get_device_list(void)
> +{
> +    GSList *list = NULL;
> +
> +    object_child_foreach(qdev_get_machine(), devmem_device_list, &list);
> +    return list;
> +}
> +
> +static void build_srat_devmem(GArray *table_data)
> +{
> +    GSList *device_list, *list = devmem_get_device_list();

Why build a list for this purpose?  Easier to just do all this handling in the
callback.

	object_child_foreach_recursive(qdev_get_machine(), add_devmem_srat, table);
All the code below goes in the callback.

Though if you follow the suggestion I made in patch 1 this code all changes anyway
as the linkage is the other way.


> +
> +    for (device_list = list; device_list; device_list = device_list->next) {
> +        DeviceState *dev = device_list->data;
> +        Object *obj = OBJECT(dev);
> +        VFIOPCIDevice *pcidev
> +            = ((VFIOPCIDevice *)object_dynamic_cast(OBJECT(obj),
> +               TYPE_VFIO_PCI));
> +
> +        if (pcidev->pdev.has_coherent_memory) {
> +            uint64_t start_node = object_property_get_uint(obj,
> +                                  "dev_mem_pxm_start", &error_abort);
> +            uint64_t node_count = object_property_get_uint(obj,
> +                                  "dev_mem_pxm_count", &error_abort);
> +            uint64_t node_index;
> +
> +            /*
> +             * Add the node_count PXM domains starting from start_node as
> +             * hot pluggable. The VM kernel parse the PXM domains and
> +             * creates NUMA nodes.
> +             */
> +            for (node_index = 0; node_index < node_count; node_index++)
> +                build_srat_memory(table_data, 0, 0, start_node + node_index,
> +                    MEM_AFFINITY_ENABLED | MEM_AFFINITY_HOTPLUGGABLE);

0 size SRAT entries for memory? That's not valid.

Seems like you've run into the same issue CXL has with dynamic addition of
nodes to the kernel and all you want to do here is make sure it thinks there
are enough nodes so initializes various structures large enough.

I don't like the CXL solution (add one per CFWMS) either and think this needs
fixing in Linux.  This doesn't feel like a valid way to do that to me.

You 'could' let EDK2 or whatever you are running finish enumerating
all the PCI bus - at which point I'm guessing your coherent ranges are
visible?  At that point, if the description provided to QEMU is sufficiently
detailed (which BAR etc) then in the rebuild of tables that occurs via
virt_acpi_build_update()

I'll add that as you are want this in Virt, chances are Peter is going to
ask for DT support (welcome to my world of pain as I have no idea what
that would look like :)  I've still not figure out how to fixup the misisng
DT support for PXBs.

> +        }
> +    }
> +    g_slist_free(list);
> +}
> +
>  /*
>   * ACPI spec, Revision 5.1
>   * 5.2.16 System Resource Affinity Table (SRAT)
> @@ -569,6 +621,8 @@ build_srat(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>                            MEM_AFFINITY_HOTPLUGGABLE | MEM_AFFINITY_ENABLED);
>      }
>  
> +    build_srat_devmem(table_data);
> +
>      acpi_table_end(linker, &table);
>  }
>  

