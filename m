Received: by 2002:a17:906:cd17:b0:9b2:89ee:1eb8 with SMTP id oz23csp1930951ejb;
        Mon, 9 Oct 2023 05:31:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEqFJ6BM+Xxs15oq0EB+/zMrsvvVR5gKzFLgcuyHgNtpCDkBfptYmrmWQpLRt/NGFRMRXmc
X-Received: by 2002:a37:ac01:0:b0:774:1641:d60f with SMTP id e1-20020a37ac01000000b007741641d60fmr16515060qkm.41.1696854670604;
        Mon, 09 Oct 2023 05:31:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1696854670; cv=none;
        d=google.com; s=arc-20160816;
        b=zDbz5C4HEpSc0Zt0YqXN0WWTvQi+/iwlcQT7aRfMhmuP1Sjcoski3yorsdwqvjGTED
         /gYJ6xIPcoKGjzvD8VPEoFnNkut2Exq8gXaqGFMaktTJE3w7PyyOmE1FfFMwf65gjtZY
         DWbiGRg8VvS/Eu+ztMDqezykoc7DlgLiu3T2xpndoV+fB92R5xvAuH2tT0AtoHcLkzHd
         s1EC9jz9XyJPA8baRZoECWQXD6i7wZyziw6F2wwRSQDyiovzgNN1FVazAEbmzRz3ibET
         F1YviQMSXI3o1k02yER9f1M4nPMWNgZg+eHiifmh3H9wX6PK8SNgEKSb6fmc2/tR0Uzl
         iqiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:organization:references
         :in-reply-to:message-id:subject:cc:to:date;
        bh=84LVgayCUlcciWR5Fp7hfCl24uhRz423PEGUJ66Pj8Q=;
        fh=DatRyqcc4vnlO5WuI3KCxbBmFk6W5gIOnuYG26IdcZo=;
        b=T7eN2gOzDuBw8bh3pwTYg/llovBLR96C/QDwPbqpZN2YfYTcyJIh1Y1N5d9ykikaml
         kfD39zZ9cDR85JnVTKSTNhZbNnBg0Acp3dx8DT0Ft16ZdjjqQ2gVEzs02PXtBlXyO6mn
         P8X0lvekWq/B7DhFI03y891iWEqfwHu8n0Kqvu5CLew/c+MBAe18NQ6MYEJ7q8f7vd/2
         ZESUbcHyLNNcqN26DLVPjVlbZV4J4J7QspZyH2so4llCJqsZukI00m3g7uTwlro10Xc0
         +jBkVUC+nkmle6DTRWfG0iDyHnurSD3K/1/BqA8SpZ1+0eQfUkLJg/0r1E5Sl/Q8lFx0
         /xGA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id br42-20020a05620a462a00b00775cf5f88a2si6280204qkb.526.2023.10.09.05.31.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 09 Oct 2023 05:31:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qppPc-0002Ur-F2; Mon, 09 Oct 2023 08:31:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1qppPY-0002Rw-HB; Mon, 09 Oct 2023 08:31:00 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1qppPT-0004Cy-IO; Mon, 09 Oct 2023 08:30:58 -0400
Received: from lhrpeml500005.china.huawei.com (unknown [172.18.147.206])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4S3yzr5FtNz6K92j;
 Mon,  9 Oct 2023 20:30:32 +0800 (CST)
Received: from localhost (10.202.227.76) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.31; Mon, 9 Oct
 2023 13:30:49 +0100
Date: Mon, 9 Oct 2023 13:30:48 +0100
To: <ankita@nvidia.com>
CC: <jgg@nvidia.com>, <alex.williamson@redhat.com>, <clg@redhat.com>,
 <shannon.zhaosl@gmail.com>, <peter.maydell@linaro.org>, <ani@anisinha.ca>,
 <berrange@redhat.com>, <eduardo@habkost.net>, <imammedo@redhat.com>,
 <mst@redhat.com>, <eblake@redhat.com>, <armbru@redhat.com>,
 <david@redhat.com>, <gshan@redhat.com>, <aniketa@nvidia.com>,
 <cjia@nvidia.com>, <kwankhede@nvidia.com>, <targupta@nvidia.com>,
 <vsethi@nvidia.com>, <acurrid@nvidia.com>, <dnigam@nvidia.com>,
 <udhoke@nvidia.com>, <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>
Subject: Re: [PATCH v2 3/3] qom: Link multiple numa nodes to device using a
 new object
Message-ID: <20231009133048.00003535@Huawei.com>
In-Reply-To: <20231007201740.30335-4-ankita@nvidia.com>
References: <20231007201740.30335-1-ankita@nvidia.com>
 <20231007201740.30335-4-ankita@nvidia.com>
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
X-TUID: eaypfOdJNAmO

On Sun, 8 Oct 2023 01:47:40 +0530
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
> we utilize the GI Affinity structures that allows association between nodes
> and devices. Multiple GI structures per BDF is possible, allowing creation of
> multiple nodes by exposing unique PXM in each of these structures.
> 
> Introducing a new nvidia-acpi-generic-initiator object, which inherits from
> the generic acpi-generic-initiator object to allow a BDF to be associated with
> more than 1 nodes.
> 
> An admin can provide the range of nodes using numa-node-start and
> numa-node-count and link it to a device by providing its id. The following
> sample creates 8 nodes and link them to the device dev0:
> 
>         -numa node,nodeid=2 \
>         -numa node,nodeid=3 \
>         -numa node,nodeid=4 \
>         -numa node,nodeid=5 \
>         -numa node,nodeid=6 \
>         -numa node,nodeid=7 \
>         -numa node,nodeid=8 \
>         -numa node,nodeid=9 \
>         -device vfio-pci-nohotplug,host=0009:01:00.0,bus=pcie.0,addr=04.0,rombar=0,id=dev0 \
>         -object nvidia-acpi-generic-initiator,id=gi0,device=dev0,numa-node-start=2,numa-node-count=8 \

If you go this way, use an array of references to the numa nodes instead of a start and number.
There is no obvious reason why they should be contiguous that I can see.

I think it is simpler the other way around though - so have the numa nodes point at the
vfio-pci-nohotplug device. 

I've not looked closely at implementation as I think we want to address the fundamental
approach first.

Jonathan


> 
> [1] https://www.nvidia.com/en-in/technologies/multi-instance-gpu
> 
> Signed-off-by: Ankit Agrawal <ankita@nvidia.com>
> ---
>  hw/acpi/acpi-generic-initiator.c         | 61 ++++++++++++++++++++++++
>  include/hw/acpi/acpi-generic-initiator.h | 12 +++++
>  qapi/qom.json                            | 24 +++++++++-
>  3 files changed, 95 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/acpi/acpi-generic-initiator.c b/hw/acpi/acpi-generic-initiator.c
> index 1ae79639be..8ef887c3a4 100644
> --- a/hw/acpi/acpi-generic-initiator.c
> +++ b/hw/acpi/acpi-generic-initiator.c
> @@ -150,3 +150,64 @@ void build_srat_generic_initiator(GArray *table_data)
>      }
>      g_slist_free(list);
>  }
> +
> +static void
> +nvidia_acpi_generic_initiator_set_node_start(Object *obj, Visitor *v,
> +                                             const char *name, void *opaque,
> +                                             Error **errp)
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
> +static void
> +nvidia_acpi_generic_initiator_set_node_count(Object *obj, Visitor *v,
> +                                             const char *name, void *opaque,
> +                                             Error **errp)
> +{
> +    AcpiGenericInitiator *gi = ACPI_GENERIC_INITIATOR(obj);
> +    uint32_t value;
> +
> +    if (!visit_type_uint32(v, name, &value, errp)) {
> +        return;
> +    }
> +
> +    gi->node_count = value;
> +}
> +
> +static void nvidia_acpi_generic_initiator_class_init(ObjectClass *oc, void *data)
> +{
> +    object_class_property_add(oc, NVIDIA_ACPI_GENERIC_INITIATOR_NODE_START_PROP,
> +                              "uint32", NULL,
> +                              nvidia_acpi_generic_initiator_set_node_start,
> +                              NULL, NULL);
> +    object_class_property_add(oc, NVIDIA_ACPI_GENERIC_INITIATOR_NODE_COUNT_PROP,
> +                              "uint32", NULL,
> +                              nvidia_acpi_generic_initiator_set_node_count,
> +                              NULL, NULL);
> +}
> +
> +static const TypeInfo nvidia_acpi_generic_initiator_info = {
> +    .parent = TYPE_ACPI_GENERIC_INITIATOR,
> +    .name = TYPE_NVIDIA_ACPI_GENERIC_INITIATOR,
> +    .instance_size = sizeof(NvidiaAcpiGenericInitiator),
> +    .class_size = sizeof(NvidiaAcpiGenericInitiatorClass),
> +    .class_init = nvidia_acpi_generic_initiator_class_init,
> +};
> +
> +static void
> +nvidia_acpi_generic_initiator_register_types(void)
> +{
> +    type_register_static(&nvidia_acpi_generic_initiator_info);
> +}
> +type_init(nvidia_acpi_generic_initiator_register_types);
> diff --git a/include/hw/acpi/acpi-generic-initiator.h b/include/hw/acpi/acpi-generic-initiator.h
> index e8e2670309..3e4cf42064 100644
> --- a/include/hw/acpi/acpi-generic-initiator.h
> +++ b/include/hw/acpi/acpi-generic-initiator.h
> @@ -9,10 +9,14 @@
>  #include "qom/object_interfaces.h"
>  
>  #define TYPE_ACPI_GENERIC_INITIATOR "acpi-generic-initiator"
> +#define TYPE_NVIDIA_ACPI_GENERIC_INITIATOR "nvidia-acpi-generic-initiator"
>  
>  #define ACPI_GENERIC_INITIATOR_DEVICE_PROP "device"
>  #define ACPI_GENERIC_INITIATOR_NODE_PROP "node"
>  
> +#define NVIDIA_ACPI_GENERIC_INITIATOR_NODE_START_PROP "numa-node-start"
> +#define NVIDIA_ACPI_GENERIC_INITIATOR_NODE_COUNT_PROP "numa-node-count"
> +
>  typedef struct AcpiGenericInitiator {
>      /* private */
>      Object parent;
> @@ -47,6 +51,14 @@ typedef struct PCIDeviceHandle {
>      uint64_t res1;
>  } PCIDeviceHandle;
>  
> +typedef struct NvidiaAcpiGenericInitiator {
> +    AcpiGenericInitiator parent;
> +} NvidiaAcpiGenericInitiator;
> +
> +typedef struct NvidiaAcpiGenericInitiatorClass {
> +        AcpiGenericInitiatorClass parent_class;
> +} NvidiaAcpiGenericInitiatorClass;
> +
>  void build_srat_generic_initiator(GArray *table_data);
>  
>  #endif
> diff --git a/qapi/qom.json b/qapi/qom.json
> index 86c87a161c..c29ad1388d 100644
> --- a/qapi/qom.json
> +++ b/qapi/qom.json
> @@ -793,6 +793,24 @@
>  { 'struct': 'AcpiGenericInitiatorProperties',
>    'data': { 'device': 'str', 'node': 'uint32' } }
>  
> +##
> +# @NvidiaAcpiGenericInitiatorProperties:
> +#
> +# Properties for nvidia-acpi-generic-initiator objects.
> +#
> +# @device: the ID of the device to be associated with the nodes
> +#
> +# @numa-node-start: the ID of the numa node
> +#
> +# @numa-node-count: count of the numa nodes assocuated with the device
> +#
> +# Since: 8.0
> +##
> +{ 'struct': 'NvidiaAcpiGenericInitiatorProperties',
> +  'data': { 'device': 'str',
> +            'numa-node-start': 'uint32',
> +            'numa-node-count': 'uint32' } }
> +
>  ##
>  # @RngProperties:
>  #
> @@ -962,7 +980,8 @@
>      'tls-cipher-suites',
>      { 'name': 'x-remote-object', 'features': [ 'unstable' ] },
>      { 'name': 'x-vfio-user-server', 'features': [ 'unstable' ] },
> -    'acpi-generic-initiator'
> +    'acpi-generic-initiator',
> +    'nvidia-acpi-generic-initiator'
>    ] }
>  
>  ##
> @@ -1030,7 +1049,8 @@
>        'tls-cipher-suites':          'TlsCredsProperties',
>        'x-remote-object':            'RemoteObjectProperties',
>        'x-vfio-user-server':         'VfioUserServerProperties',
> -      'acpi-generic-initiator':     'AcpiGenericInitiatorProperties'
> +      'acpi-generic-initiator':     'AcpiGenericInitiatorProperties',
> +      'nvidia-acpi-generic-initiator':     'NvidiaAcpiGenericInitiatorProperties'
>    } }
>  
>  ##

