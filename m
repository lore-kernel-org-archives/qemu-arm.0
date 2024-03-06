Received: by 2002:a17:906:3588:b0:a45:b507:d90a with SMTP id o8csp509510ejb;
        Wed, 6 Mar 2024 05:49:37 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXckfBTCgtH6G51X8F8qcaHpif0/n6S1mjm5TTXkQTp+9LYq2mE3amCO5Lp0jYuxmNCGZBJC4sUfhg/0MEcybomgyxF015c
X-Google-Smtp-Source: AGHT+IGZYDGfIxrgjgbApJzbvuiJY09eKrqwXOhzlP6Thv42q88LKONmQa2hxlsq45ITob7BPn/0
X-Received: by 2002:a05:620a:4556:b0:788:22c8:1bf8 with SMTP id u22-20020a05620a455600b0078822c81bf8mr236427qkp.32.1709732977057;
        Wed, 06 Mar 2024 05:49:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1709732977; cv=none;
        d=google.com; s=arc-20160816;
        b=QOqXfF8GsiP66fAx2Vtz3NtLzbM2ldYcfdZFo7PhQ8z1BlVVuOe3X5WooYoznFndhe
         fXC5hzsto2a3mbmzhsdCCc88Xhe6gGjJu7VbiBMwKcYXbb4Gesk17ix4oQMXUQHGN+R8
         Hqt2eqUJ/gmgm+6rTPv64IIzjZM/yrcRBiHFO6f2+Ftl9bscZQnbFzTjtLJKnBfs93Aw
         favymwwbNILfPiP3EOuv7S/4lfvdU1b9jljNdeGBfS7SBVANI9Fu3Z961CiDhkozH82c
         Ew3xwIrW2Tsa1SaHD9KBdO/FwvnSm6+5Mxd5RInqTwNyCBIbwjuR02SmaQBz7BBScIW6
         gc4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:organization:references
         :in-reply-to:message-id:subject:cc:to:date;
        bh=fhbecvwkF2TVlfvtDEf0sv5k0ox9peEqRI0zYVdkAoY=;
        fh=+FD09Mxav9aL8Wjog+48Pqxc2lLOxPZpfMtjTli+kPk=;
        b=NM40+MJpyCxJvDDTjcOFfdbVOIIStu/L5Vfu2L7XwQGB7/DbBVglpyWJ5ndB8fHfjm
         RYCeI7zHwHOjVexXeY6LSl1XyuMzwbxucp2jEH2d53ZNSEjeR8UJB5Zq/ScRdPc4USsI
         ezMc0sK/jIi1rKm6XKSA35lmJlycZJwbGJ8a6zfpUIvVC9wQalvNhM1qhJCpJjzPz9Sp
         usqXwuEdoympe20m7OkYO4CaHO8sUstM0uT5Uh7LzsZH4iS+6ucmcjlbTHMe+XnkBW4D
         BTvMLvg6EH1PCCbRE97t3AqbzeSonJ5ZEMc7gYqqPlT16XGaw64bcvCvThMiENtSuTpQ
         kRcQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j29-20020a05620a0a5d00b0078825434bbfsi7584864qka.674.2024.03.06.05.49.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 06 Mar 2024 05:49:37 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rhre3-0000Kh-Pa; Wed, 06 Mar 2024 08:49:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1rhre2-0000IN-8r; Wed, 06 Mar 2024 08:49:18 -0500
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1rhrdz-00049K-CC; Wed, 06 Mar 2024 08:49:18 -0500
Received: from mail.maildlp.com (unknown [172.18.186.31])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4TqYZJ5jlxz6K66M;
 Wed,  6 Mar 2024 21:44:24 +0800 (CST)
Received: from lhrpeml500005.china.huawei.com (unknown [7.191.163.240])
 by mail.maildlp.com (Postfix) with ESMTPS id 7FE511400D4;
 Wed,  6 Mar 2024 21:49:11 +0800 (CST)
Received: from localhost (10.202.227.76) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.35; Wed, 6 Mar
 2024 13:49:10 +0000
Date: Wed, 6 Mar 2024 13:49:09 +0000
To: <ankita@nvidia.com>
CC: <jgg@nvidia.com>, <marcel.apfelbaum@gmail.com>, <philmd@linaro.org>,
 <wangyanan55@huawei.com>, <alex.williamson@redhat.com>,
 <pbonzini@redhat.com>, <clg@redhat.com>, <shannon.zhaosl@gmail.com>,
 <peter.maydell@linaro.org>, <ani@anisinha.ca>, <berrange@redhat.com>,
 <eduardo@habkost.net>, <imammedo@redhat.com>, <mst@redhat.com>,
 <eblake@redhat.com>, <armbru@redhat.com>, <david@redhat.com>,
 <gshan@redhat.com>, <aniketa@nvidia.com>, <cjia@nvidia.com>,
 <kwankhede@nvidia.com>, <targupta@nvidia.com>, <vsethi@nvidia.com>,
 <acurrid@nvidia.com>, <dnigam@nvidia.com>, <udhoke@nvidia.com>,
 <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>
Subject: Re: [PATCH v8 1/2] qom: new object to associate device to NUMA node
Message-ID: <20240306134909.00000a3a@Huawei.com>
In-Reply-To: <20240306123317.4691-2-ankita@nvidia.com>
References: <20240306123317.4691-1-ankita@nvidia.com>
 <20240306123317.4691-2-ankita@nvidia.com>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.202.227.76]
X-ClientProxiedBy: lhrpeml100002.china.huawei.com (7.191.160.241) To
 lhrpeml500005.china.huawei.com (7.191.163.240)
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=jonathan.cameron@huawei.com; helo=frasgout.his.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Reply-to:  Jonathan Cameron <Jonathan.Cameron@Huawei.com>
From:  Jonathan Cameron via <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: V1AXgY91CEnE

On Wed, 6 Mar 2024 12:33:16 +0000
<ankita@nvidia.com> wrote:

> From: Ankit Agrawal <ankita@nvidia.com>
> 
> NVIDIA GPU's support MIG (Mult-Instance GPUs) feature [1], which allows
> partitioning of the GPU device resources (including device memory) into
> several (upto 8) isolated instances. Each of the partitioned memory needs
> a dedicated NUMA node to operate. The partitions are not fixed and they
> can be created/deleted at runtime.
> 
> Unfortunately Linux OS does not provide a means to dynamically create/destroy
> NUMA nodes and such feature implementation is not expected to be trivial. The
> nodes that OS discovers at the boot time while parsing SRAT remains fixed. So
> we utilize the Generic Initiator Affinity structures that allows association
> between nodes and devices. Multiple GI structures per BDF is possible,
> allowing creation of multiple nodes by exposing unique PXM in each of these
> structures.
> 
> Implement the mechanism to build the GI affinity structures as Qemu currently
> does not. Introduce a new acpi-generic-initiator object to allow host admin
> link a device with an associated NUMA node. Qemu maintains this association
> and use this object to build the requisite GI Affinity Structure.
> 
> When multiple NUMA nodes are associated with a device, it is required to
> create those many number of acpi-generic-initiator objects, each representing
> a unique device:node association.
> 
> Following is one of a decoded GI affinity structure in VM ACPI SRAT.
> [0C8h 0200   1]                Subtable Type : 05 [Generic Initiator Affinity]
> [0C9h 0201   1]                       Length : 20
> 
> [0CAh 0202   1]                    Reserved1 : 00
> [0CBh 0203   1]           Device Handle Type : 01
> [0CCh 0204   4]             Proximity Domain : 00000007
> [0D0h 0208  16]                Device Handle : 00 00 20 00 00 00 00 00 00 00 00
> 00 00 00 00 00
> [0E0h 0224   4]        Flags (decoded below) : 00000001
>                                      Enabled : 1
> [0E4h 0228   4]                    Reserved2 : 00000000
> 
> [0E8h 0232   1]                Subtable Type : 05 [Generic Initiator Affinity]
> [0E9h 0233   1]                       Length : 20
> 
> An admin can provide a range of acpi-generic-initiator objects, each
> associating a device (by providing the id through pci-dev argument)
> to the desired NUMA node (using the node argument). Currently, only PCI
> device is supported.
> 
> For the grace hopper system, create a range of 8 nodes and associate that
> with the device using the acpi-generic-initiator object. While a configuration
> of less than 8 nodes per device is allowed, such configuration will prevent
> utilization of the feature to the fullest. The following sample creates 8
> nodes per PCI device for a VM with 2 PCI devices and link them to the
> respecitve PCI device using acpi-generic-initiator objects:
> 
> -numa node,nodeid=2 -numa node,nodeid=3 -numa node,nodeid=4 \
> -numa node,nodeid=5 -numa node,nodeid=6 -numa node,nodeid=7 \
> -numa node,nodeid=8 -numa node,nodeid=9 \
> -device vfio-pci-nohotplug,host=0009:01:00.0,bus=pcie.0,addr=04.0,rombar=0,id=dev0 \
> -object acpi-generic-initiator,id=gi0,pci-dev=dev0,node=2 \
> -object acpi-generic-initiator,id=gi1,pci-dev=dev0,node=3 \
> -object acpi-generic-initiator,id=gi2,pci-dev=dev0,node=4 \
> -object acpi-generic-initiator,id=gi3,pci-dev=dev0,node=5 \
> -object acpi-generic-initiator,id=gi4,pci-dev=dev0,node=6 \
> -object acpi-generic-initiator,id=gi5,pci-dev=dev0,node=7 \
> -object acpi-generic-initiator,id=gi6,pci-dev=dev0,node=8 \
> -object acpi-generic-initiator,id=gi7,pci-dev=dev0,node=9 \
> 
> -numa node,nodeid=10 -numa node,nodeid=11 -numa node,nodeid=12 \
> -numa node,nodeid=13 -numa node,nodeid=14 -numa node,nodeid=15 \
> -numa node,nodeid=16 -numa node,nodeid=17 \
> -device vfio-pci-nohotplug,host=0009:01:01.0,bus=pcie.0,addr=05.0,rombar=0,id=dev1 \
> -object acpi-generic-initiator,id=gi8,pci-dev=dev1,node=10 \
> -object acpi-generic-initiator,id=gi9,pci-dev=dev1,node=11 \
> -object acpi-generic-initiator,id=gi10,pci-dev=dev1,node=12 \
> -object acpi-generic-initiator,id=gi11,pci-dev=dev1,node=13 \
> -object acpi-generic-initiator,id=gi12,pci-dev=dev1,node=14 \
> -object acpi-generic-initiator,id=gi13,pci-dev=dev1,node=15 \
> -object acpi-generic-initiator,id=gi14,pci-dev=dev1,node=16 \
> -object acpi-generic-initiator,id=gi15,pci-dev=dev1,node=17 \
> 
> The performance benefits can be realized by providing the NUMA node distances
> appropriately (through libvirt tags or Qemu params). The admin can get the
> distance among nodes in hardware using `numactl -H`.

That's a lot of description when you could just have claimed you want a normal
GI node for HMAT and we'd have all believed you ;)

> 
> Link: https://www.nvidia.com/en-in/technologies/multi-instance-gpu [1]
> Cc: Jonathan Cameron <qemu-devel@nongnu.org>
> Cc: Alex Williamson <alex.williamson@redhat.com>
> Cc: Markus Armbruster <armbru@redhat.com>
> Acked-by: Markus Armbruster <armbru@redhat.com>
> Signed-off-by: Ankit Agrawal <ankita@nvidia.com>

Hi Ankit,

Some minor things inline. With the includes tidied up.
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

> diff --git a/include/hw/acpi/acpi_generic_initiator.h b/include/hw/acpi/acpi_generic_initiator.h
> new file mode 100644
> index 0000000000..23d0b591c6
> --- /dev/null
> +++ b/include/hw/acpi/acpi_generic_initiator.h
> @@ -0,0 +1,32 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2024, NVIDIA CORPORATION & AFFILIATES. All rights reserved
> + */
> +
> +#ifndef ACPI_GENERIC_INITIATOR_H
> +#define ACPI_GENERIC_INITIATOR_H
> +
> +#include "hw/mem/pc-dimm.h"

Why?

> +#include "hw/acpi/bios-linker-loader.h"
> +#include "hw/acpi/aml-build.h"
> +#include "sysemu/numa.h"

This should only include headers that it uses directly.
If they are needed down in the c files, then include them there.

Most of these are not related to what you have here.

> +#include "qemu/uuid.h"
> +#include "qom/object.h"
> +#include "qom/object_interfaces.h"
> +
> +#define TYPE_ACPI_GENERIC_INITIATOR "acpi-generic-initiator"
> +
> +typedef struct AcpiGenericInitiator {
> +    /* private */
> +    Object parent;
> +
> +    /* public */
> +    char *pci_dev;
> +    uint16_t node;
> +} AcpiGenericInitiator;
> +
> +typedef struct AcpiGenericInitiatorClass {
> +    ObjectClass parent_class;
> +} AcpiGenericInitiatorClass;

Trivial, but you could push the class definition down into the c file
given it's not accessed from anywhere else.

> +
> +#endif

