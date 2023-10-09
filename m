Received: by 2002:a17:906:cd17:b0:9b2:89ee:1eb8 with SMTP id oz23csp1928818ejb;
        Mon, 9 Oct 2023 05:27:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFWRrAweBsWtY74zlLWXs58q6uhxKjg6sxMarFw2l+FTHLrXbPBiLSYVgeRE5x1hY3+Iqkt
X-Received: by 2002:a05:6870:b622:b0:1dd:651a:74ac with SMTP id cm34-20020a056870b62200b001dd651a74acmr19089681oab.45.1696854442231;
        Mon, 09 Oct 2023 05:27:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1696854442; cv=none;
        d=google.com; s=arc-20160816;
        b=S9tGGNqD0rPQNYtQdLgHU7fHr5dW7e7GObxBFkRYfx3LBOo36tHVOWRgPTpn4UNtyj
         rVHMlLxUWv5xa95UVAUNKsXTERSkJym+8/xZ6pHqgPoXZFSghLNYNAnmSnXbC+cTjj8s
         tA3cPGrE2foT1qZVE6z8FjIA8W4NuZJrKETipoWsttIHScLt1dBw9q8d3ejVK8HSCSMF
         kB32XlxnZu5RifhK+/Iz5dMPBwn7MBMmkpuab24rjIloSMdMJndP8m7fj8OGcpgrHaHk
         xdTCPclgoAusduMcuEorsptJawH20Qx7wj2pUVgUyQ+N0vSFZUb7xh41J8KbWrHgDoXC
         6syQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:organization:references
         :in-reply-to:message-id:subject:cc:to:date;
        bh=P3DPKkJWCAKSf1dqhG58AK2DkylRAl1ZIhCEoEebNF4=;
        fh=JQk2vNpb64EpsIa3tIpK8qQ4qHKnvxDtvIji6VG9qtM=;
        b=PLWN38sqkLW/rlQ8BBBPsAq3Glm/QAxJGSeOmNiRTu7aS5UhphZCZ/MPHu890iSnpP
         PkpYYqUXxJz8UbjJ5oaJgOBqB+bHKkFOgvL57xvYetQaLlqqDePkrg+nlAkTKHRlZDwk
         Y8qtMkHM+adUM03n07PAigNMio/VeN9ejYEuqUVWCGc807QRgEf7OXlm38t52bs4GxKy
         o0pQpkvszhC9NJYVRlJmwBoxQFVFrRRVT9RASUnyesHebbiWdrwpSx3G7NHeg4CfKIrh
         aONqmRXrSPMuLYHKEG1jrYnFa9ShdAWPFOCxDt8Vr/isdzvYIo2RhbnpFdaBrDTWRbxP
         L0RA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g17-20020a0caad1000000b0065af2f79da7si5951620qvb.114.2023.10.09.05.27.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 09 Oct 2023 05:27:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qppLk-00089O-9R; Mon, 09 Oct 2023 08:27:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1qppLe-00088c-Jb; Mon, 09 Oct 2023 08:27:00 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1qppLb-0003Vn-TV; Mon, 09 Oct 2023 08:26:58 -0400
Received: from lhrpeml500005.china.huawei.com (unknown [172.18.147.206])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4S3yr30VByz6HJld;
 Mon,  9 Oct 2023 20:23:47 +0800 (CST)
Received: from localhost (10.202.227.76) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.31; Mon, 9 Oct
 2023 13:26:43 +0100
Date: Mon, 9 Oct 2023 13:26:42 +0100
To: <ankita@nvidia.com>
CC: <jgg@nvidia.com>, <alex.williamson@redhat.com>, <clg@redhat.com>,
 <shannon.zhaosl@gmail.com>, <peter.maydell@linaro.org>, <ani@anisinha.ca>,
 <berrange@redhat.com>, <eduardo@habkost.net>, <imammedo@redhat.com>,
 <mst@redhat.com>, <eblake@redhat.com>, <armbru@redhat.com>,
 <david@redhat.com>, <gshan@redhat.com>, <aniketa@nvidia.com>,
 <cjia@nvidia.com>, <kwankhede@nvidia.com>, <targupta@nvidia.com>,
 <vsethi@nvidia.com>, <acurrid@nvidia.com>, <dnigam@nvidia.com>,
 <udhoke@nvidia.com>, <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>, "Dave
 Jiang" <dave.jiang@intel.com>
Subject: Re: [PATCH v2 1/3] qom: new object to associate device to numa node
Message-ID: <20231009132642.00002c8d@Huawei.com>
In-Reply-To: <20231007201740.30335-2-ankita@nvidia.com>
References: <20231007201740.30335-1-ankita@nvidia.com>
 <20231007201740.30335-2-ankita@nvidia.com>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.202.227.76]
X-ClientProxiedBy: lhrpeml500006.china.huawei.com (7.191.161.198) To
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
X-TUID: gmYnWLJyhID3

On Sun, 8 Oct 2023 01:47:38 +0530
<ankita@nvidia.com> wrote:

> From: Ankit Agrawal <ankita@nvidia.com>
> 
> The CPU cache coherent device memory can be added as NUMA nodes
> distinct from the system memory nodes. These nodes are associated
> with the device and Qemu needs a way to maintain this link.

Hi Ankit,

I'm not sure I'm convinced of the approach to creating nodes for memory
usage (or whether that works in Linux on all NUMA ACPI archs), but I
am keen to see Generic Initiator support in QEMU. I'd also
like to see it done in a way that naturally extends to Generic Ports
which are very similar (but don't hang memory off them! :)
Dave Jiang posted a PoC a while back for generic ports.
https://lore.kernel.org/qemu-devel/168185633821.899932.322047053764766056.stgit@djiang5-mobl3/

My concern with this approach is that it is using a side effect
of a Linux implementation detail that the infra structure to bring up
coherent memory is all present even for a GI only node (if it is
which I can't recall)
I'm also fairly sure we never tidied up the detail of going from the
GI to the device in Linux (because it's harder than a _PXM entry
for the device).  It requires stashing a better description than the BDF
before potentially doing reenumeration so that we can rebuild the
association after that is done.

> 
> Introduce a new acpi-generic-initiator object to allow host admin
> provide the device and the corresponding NUMA node. Qemu maintain
> this association and use this object to build the requisite GI
> Affinity Structure.
> 
> The admin provides the id of the device and the NUMA node id such
> as in the following example.
> -device vfio-pci-nohotplug,host=<bdf>,bus=pcie.0,addr=04.0,rombar=0,id=dev0 \
> -object acpi-generic-initiator,id=gi0,device=dev0,node=2 \

This seems more different to existing numa configuration than necessary.
The corner you have here of multiple GIs per PCI device is I hope the
corner case so I'd like to see something that is really simple for
single device, single node.  Note that, whilst we don't do CXL 1.1 etc
in QEMU yet, all CXL accelerators before CXL 2.0 are pretty much expected
to present a GI SRAT entry + SRAT memory entry if appropriate.
For CXL 2.0 and later everything can be left to be discovered by the OS
but those Generic Ports I mentioned are an important part of that.

Why not something like
-numa node,gi=dev0 \
-numa node,gi=dev0 \
etc or maybe even the slightly weird
-numa node,gi=dev0,gi=dev0,gi=dev0...

?

> 
> Signed-off-by: Ankit Agrawal <ankita@nvidia.com>
> ---
>  hw/acpi/acpi-generic-initiator.c         | 74 ++++++++++++++++++++++++
>  hw/acpi/meson.build                      |  1 +
>  include/hw/acpi/acpi-generic-initiator.h | 30 ++++++++++
>  qapi/qom.json                            | 20 ++++++-
>  4 files changed, 123 insertions(+), 2 deletions(-)
>  create mode 100644 hw/acpi/acpi-generic-initiator.c
>  create mode 100644 include/hw/acpi/acpi-generic-initiator.h
> 
> diff --git a/hw/acpi/acpi-generic-initiator.c b/hw/acpi/acpi-generic-initiator.c
> new file mode 100644
> index 0000000000..6406736090
> --- /dev/null
> +++ b/hw/acpi/acpi-generic-initiator.c
> @@ -0,0 +1,74 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2023, NVIDIA CORPORATION & AFFILIATES. All rights reserved
> + */
> +
> +#include "qemu/osdep.h"
> +#include "hw/qdev-properties.h"
> +#include "qapi/error.h"
> +#include "qapi/visitor.h"
> +#include "qom/object_interfaces.h"
> +#include "qom/object.h"
> +#include "hw/qdev-core.h"
> +#include "hw/vfio/vfio-common.h"
> +#include "hw/vfio/pci.h"
> +#include "hw/pci/pci_device.h"
> +#include "sysemu/numa.h"
> +#include "hw/acpi/acpi-generic-initiator.h"
> +
> +OBJECT_DEFINE_TYPE_WITH_INTERFACES(AcpiGenericInitiator, acpi_generic_initiator,
> +                   ACPI_GENERIC_INITIATOR, OBJECT,
> +                   { TYPE_USER_CREATABLE },
> +                   { NULL })
> +
> +OBJECT_DECLARE_SIMPLE_TYPE(AcpiGenericInitiator, ACPI_GENERIC_INITIATOR)
> +
> +static void acpi_generic_initiator_init(Object *obj)
> +{
> +    AcpiGenericInitiator *gi = ACPI_GENERIC_INITIATOR(obj);
> +    gi->device = NULL;
> +    gi->node = MAX_NODES;
> +    gi->node_count = 1;
> +}
> +
> +static void acpi_generic_initiator_finalize(Object *obj)
> +{
> +    AcpiGenericInitiator *gi = ACPI_GENERIC_INITIATOR(obj);
> +
> +    g_free(gi->device);
> +}
> +
> +static void acpi_generic_initiator_set_device(Object *obj, const char *value,
> +                                              Error **errp)
> +{
> +    AcpiGenericInitiator *gi = ACPI_GENERIC_INITIATOR(obj);
> +
> +    gi->device = g_strdup(value);
> +}
> +
> +static void acpi_generic_initiator_set_node(Object *obj, Visitor *v,
> +                                            const char *name, void *opaque,
> +                                            Error **errp)
> +{
> +    AcpiGenericInitiator *gi = ACPI_GENERIC_INITIATOR(obj);
> +    uint32_t value;
> +
> +    if (!visit_type_uint32(v, name, &value, errp)) {
> +        return;
> +    }
> +
> +    if (value >= MAX_NODES) {
> +        return;
> +    }
> +
> +    gi->node = value;
> +}
> +
> +static void acpi_generic_initiator_class_init(ObjectClass *oc, void *data)
> +{
> +    object_class_property_add_str(oc, ACPI_GENERIC_INITIATOR_DEVICE_PROP, NULL,
> +                                  acpi_generic_initiator_set_device);
> +    object_class_property_add(oc, ACPI_GENERIC_INITIATOR_NODE_PROP, "uint32",
> +                              NULL, acpi_generic_initiator_set_node, NULL,
> +                              NULL);
> +}
> diff --git a/hw/acpi/meson.build b/hw/acpi/meson.build
> index fc1b952379..22252836ed 100644
> --- a/hw/acpi/meson.build
> +++ b/hw/acpi/meson.build
> @@ -5,6 +5,7 @@ acpi_ss.add(files(
>    'bios-linker-loader.c',
>    'core.c',
>    'utils.c',
> +  'acpi-generic-initiator.c',
>  ))
>  acpi_ss.add(when: 'CONFIG_ACPI_CPU_HOTPLUG', if_true: files('cpu.c', 'cpu_hotplug.c'))
>  acpi_ss.add(when: 'CONFIG_ACPI_CPU_HOTPLUG', if_false: files('acpi-cpu-hotplug-stub.c'))
> diff --git a/include/hw/acpi/acpi-generic-initiator.h b/include/hw/acpi/acpi-generic-initiator.h
> new file mode 100644
> index 0000000000..e67e6e23b1
> --- /dev/null
> +++ b/include/hw/acpi/acpi-generic-initiator.h
> @@ -0,0 +1,30 @@
> +#ifndef ACPI_GENERIC_INITIATOR_H
> +#define ACPI_GENERIC_INITIATOR_H
> +
> +#include "hw/mem/pc-dimm.h"
> +#include "hw/acpi/bios-linker-loader.h"
> +#include "qemu/uuid.h"
> +#include "hw/acpi/aml-build.h"
> +#include "qom/object.h"
> +#include "qom/object_interfaces.h"
> +
> +#define TYPE_ACPI_GENERIC_INITIATOR "acpi-generic-initiator"
> +
> +#define ACPI_GENERIC_INITIATOR_DEVICE_PROP "device"
> +#define ACPI_GENERIC_INITIATOR_NODE_PROP "node"
> +
> +typedef struct AcpiGenericInitiator {
> +    /* private */
> +    Object parent;
> +
> +    /* public */
> +    char *device;
> +    uint32_t node;
> +    uint32_t node_count;
> +} AcpiGenericInitiator;
> +
> +typedef struct AcpiGenericInitiatorClass {
> +        ObjectClass parent_class;
> +} AcpiGenericInitiatorClass;
> +
> +#endif
> diff --git a/qapi/qom.json b/qapi/qom.json
> index fa3e88c8e6..86c87a161c 100644
> --- a/qapi/qom.json
> +++ b/qapi/qom.json
> @@ -779,6 +779,20 @@
>  { 'struct': 'VfioUserServerProperties',
>    'data': { 'socket': 'SocketAddress', 'device': 'str' } }
>  
> +##
> +# @AcpiGenericInitiatorProperties:
> +#
> +# Properties for acpi-generic-initiator objects.
> +#
> +# @device: the ID of the device to be associated with the node
> +#
> +# @node: the ID of the numa node
> +#
> +# Since: 8.0
> +##
> +{ 'struct': 'AcpiGenericInitiatorProperties',
> +  'data': { 'device': 'str', 'node': 'uint32' } }
> +
>  ##
>  # @RngProperties:
>  #
> @@ -947,7 +961,8 @@
>      'tls-creds-x509',
>      'tls-cipher-suites',
>      { 'name': 'x-remote-object', 'features': [ 'unstable' ] },
> -    { 'name': 'x-vfio-user-server', 'features': [ 'unstable' ] }
> +    { 'name': 'x-vfio-user-server', 'features': [ 'unstable' ] },
> +    'acpi-generic-initiator'
>    ] }
>  
>  ##
> @@ -1014,7 +1029,8 @@
>        'tls-creds-x509':             'TlsCredsX509Properties',
>        'tls-cipher-suites':          'TlsCredsProperties',
>        'x-remote-object':            'RemoteObjectProperties',
> -      'x-vfio-user-server':         'VfioUserServerProperties'
> +      'x-vfio-user-server':         'VfioUserServerProperties',
> +      'acpi-generic-initiator':     'AcpiGenericInitiatorProperties'
>    } }
>  
>  ##

