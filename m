Received: by 2002:a17:906:5a52:b0:9d0:bf65:29fa with SMTP id my18csp2786895ejc;
        Wed, 15 Nov 2023 06:00:11 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGT0kusvXB29H+cxsDoqBbhLLuWcSePskkqaAtpJZ0v5EPmhYTZZUVAcCSzrhXDcb6ugWNC
X-Received: by 2002:a0c:ee8e:0:b0:64f:6199:a8e with SMTP id u14-20020a0cee8e000000b0064f61990a8emr6074483qvr.23.1700056811159;
        Wed, 15 Nov 2023 06:00:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1700056811; cv=none;
        d=google.com; s=arc-20160816;
        b=aZg223DjQ010beqNQ/Fg0WXQR3ehRADTMVZl+b8pyd7HF1tblsxVVqEgm1D4rgU9uS
         WAP7xNgfQYKA4+JAmnHDJdnhL3Jfy+IEUB1RxUZN3sv1zqQkO8ZEzNW5hAqX2fSsmHOU
         aVDsy1yXT7DF27e/YFvyE03OARyA+57FEvklXknRFEP7d8yEmTJwCq2F30DKPB0YbGY3
         wqRq8S2jId9qXY3+HOZcFoGRjvO2qTN2ABg1r/I7exHuCJbblVgf6QvqiTpbyXWS5rDb
         Iml0F+1L+GAFUwQKFcDvoLAZsm9nLszt94ksDfqUvRNdZ5BNWnb3jtjd06foMTe21Q25
         1VCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:user-agent
         :message-id:in-reply-to:date:references:subject:cc:to:from
         :dkim-signature;
        bh=dJPMsw1zuLSzI4ZUVYc2YYmiLrvV0DrBl/hmqNpU8G0=;
        fh=yb4b79XAGCI30noH8GSpCr9rwvQW/pGoAYpupm/Cfyc=;
        b=h0fmuj/+odgoYhlD8QOz4VI6bodWZ4NmxqK62c48jclxtQ8WN3826yeZOGBmSWB0UV
         RHAvOR3Rn0/oeH4OAEuMxHnOPIHzuW24rX0gP1gz2pvaK9OHgkIQY8QKdbM5IHv5aroa
         x1DS7cfz9BxwpnfJ886fjaHQgZBRzrfmBWDBABkRChf3yitg1OQUnzmPiVxX254Bu/fe
         P5lO5WXpRA3GrmEXQe6KI5TbxJ2Xa5yLIa6lUXWJld2quhTBMWRU9vUoOiXGmK0CudHM
         YEfVOE4sbC8z4PN7nvkVBQWTaZEIXZG98p6EmAYch/H81f9k5NHzuS0cs4C5yGcQfv3q
         HLqA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=FGMN7bTP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p18-20020a0cfad2000000b0065cffe26762si8490519qvo.319.2023.11.15.06.00.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 15 Nov 2023 06:00:11 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=FGMN7bTP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1r3GQi-0003Ug-6u; Wed, 15 Nov 2023 08:59:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1r3GQe-0003Sg-La
 for qemu-arm@nongnu.org; Wed, 15 Nov 2023 08:59:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1r3GQc-00028X-Fc
 for qemu-arm@nongnu.org; Wed, 15 Nov 2023 08:59:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1700056777;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=dJPMsw1zuLSzI4ZUVYc2YYmiLrvV0DrBl/hmqNpU8G0=;
 b=FGMN7bTPSUux0W5C08tGR2q9zGRVcoECTfoyaTTIwQvNIr4ng/vJuYQvtAX6TYjlpVWTIY
 2goMFLdmJlYm4pwtQJNQwp00EbU0L3Jmxm0KK/2XNYo+akl6zRryNx3sTUtoe/ODTLa01/
 /Qk1bhVvA+x/OHQNErirHejUW7K0q5E=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-584-oeQpcfg0Otm1kDWlbahd7w-1; Wed, 15 Nov 2023 08:59:34 -0500
X-MC-Unique: oeQpcfg0Otm1kDWlbahd7w-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C21A3101A53B;
 Wed, 15 Nov 2023 13:59:33 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.91])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6100EC1596F;
 Wed, 15 Nov 2023 13:59:33 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 6945821E6A1F; Wed, 15 Nov 2023 14:59:32 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: <ankita@nvidia.com>
Cc: <jgg@nvidia.com>,  <alex.williamson@redhat.com>,  <clg@redhat.com>,
 <shannon.zhaosl@gmail.com>,  <peter.maydell@linaro.org>,
 <ani@anisinha.ca>,  <berrange@redhat.com>,  <eduardo@habkost.net>,
 <imammedo@redhat.com>,  <mst@redhat.com>,  <eblake@redhat.com>,
 <david@redhat.com>,  <gshan@redhat.com>,  <Jonathan.Cameron@huawei.com>,
 <aniketa@nvidia.com>,  <cjia@nvidia.com>,  <kwankhede@nvidia.com>,
 <targupta@nvidia.com>,  <vsethi@nvidia.com>,  <acurrid@nvidia.com>,
 <dnigam@nvidia.com>,  <udhoke@nvidia.com>,  <qemu-arm@nongnu.org>,
 <qemu-devel@nongnu.org>
Subject: Re: [PATCH v3 1/2] qom: new object to associate device to numa node
References: <20231107190039.19434-1-ankita@nvidia.com>
 <20231107190039.19434-2-ankita@nvidia.com>
Date: Wed, 15 Nov 2023 14:59:32 +0100
In-Reply-To: <20231107190039.19434-2-ankita@nvidia.com> (ankita@nvidia.com's
 message of "Wed, 8 Nov 2023 00:30:38 +0530")
Message-ID: <87leaznmm3.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.099,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: W6HtGs+q7Vqz

<ankita@nvidia.com> writes:

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
> Introduce a new acpi-generic-initiator object to allow host admin provide the
> device and the corresponding NUMA nodes. Qemu maintain this association and
> use this object to build the requisite GI Affinity Structure.
>
> An admin can provide the range of nodes using a ':' delimited numalist and

Please don't create special-purpose syntax, use existing general-purpose
syntax.  See also review of qom.json below.

> link it to a device by providing its id. The node ids are extracted from
> numalist and stores as a uint16List. The following sample creates 8 nodes
> and link them to the device dev0:
>
> -numa node,nodeid=2 \
> -numa node,nodeid=3 \
> -numa node,nodeid=4 \
> -numa node,nodeid=5 \
> -numa node,nodeid=6 \
> -numa node,nodeid=7 \
> -numa node,nodeid=8 \
> -numa node,nodeid=9 \
> -device vfio-pci-nohotplug,host=0009:01:00.0,bus=pcie.0,addr=04.0,rombar=0,id=dev0 \
> -object acpi-generic-initiator,id=gi0,device=dev0,numalist=2:3:4:5:6:7:8:9 \
>
> [1] https://www.nvidia.com/en-in/technologies/multi-instance-gpu
>
> Signed-off-by: Ankit Agrawal <ankita@nvidia.com>
> ---
>  hw/acpi/acpi-generic-initiator.c         | 80 ++++++++++++++++++++++++
>  hw/acpi/meson.build                      |  1 +
>  include/hw/acpi/acpi-generic-initiator.h | 29 +++++++++
>  qapi/qom.json                            | 16 +++++
>  4 files changed, 126 insertions(+)
>  create mode 100644 hw/acpi/acpi-generic-initiator.c
>  create mode 100644 include/hw/acpi/acpi-generic-initiator.h
>
> diff --git a/hw/acpi/acpi-generic-initiator.c b/hw/acpi/acpi-generic-initiator.c
> new file mode 100644
> index 0000000000..0699c878e2
> --- /dev/null
> +++ b/hw/acpi/acpi-generic-initiator.c
> @@ -0,0 +1,80 @@
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
> +    gi->nodelist = NULL;
> +}
> +
> +static void acpi_generic_initiator_finalize(Object *obj)
> +{
> +    AcpiGenericInitiator *gi = ACPI_GENERIC_INITIATOR(obj);
> +
> +    g_free(gi->device);
> +    qapi_free_uint16List(gi->nodelist);
> +}
> +
> +static void acpi_generic_initiator_set_device(Object *obj, const char *val,
> +                                              Error **errp)
> +{
> +    AcpiGenericInitiator *gi = ACPI_GENERIC_INITIATOR(obj);
> +
> +    gi->device = g_strdup(val);
> +}
> +
> +static void acpi_generic_initiator_set_nodelist(Object *obj, const char *val,
> +                                            Error **errp)
> +{
> +    AcpiGenericInitiator *gi = ACPI_GENERIC_INITIATOR(obj);
> +    char *value = g_strdup(val);
> +    uint16_t node;
> +    uint16List **tail = &(gi->nodelist);
> +    char *nodestr = value ? strtok(value, ":") : NULL;
> +
> +    while (nodestr) {
> +        if (sscanf(nodestr, "%hu", &node) != 1) {
> +            error_setg(errp, "failed to read node-id");
> +            return;
> +        }
> +
> +        if (node >= MAX_NODES) {
> +            error_setg(errp, "invalid node-id");
> +            return;
> +        }
> +
> +        QAPI_LIST_APPEND(tail, node);
> +        nodestr = strtok(NULL, ":");
> +    }
> +}
> +
> +static void acpi_generic_initiator_class_init(ObjectClass *oc, void *data)
> +{
> +    object_class_property_add_str(oc, ACPI_GENERIC_INITIATOR_DEVICE_PROP, NULL,
> +                                  acpi_generic_initiator_set_device);
> +    object_class_property_add_str(oc, ACPI_GENERIC_INITIATOR_NODELIST_PROP,
> +                                  NULL, acpi_generic_initiator_set_nodelist);
> +}
> diff --git a/hw/acpi/meson.build b/hw/acpi/meson.build
> index fc1b952379..2268589519 100644
> --- a/hw/acpi/meson.build
> +++ b/hw/acpi/meson.build
> @@ -1,5 +1,6 @@
>  acpi_ss = ss.source_set()
>  acpi_ss.add(files(
> +  'acpi-generic-initiator.c',
>    'acpi_interface.c',
>    'aml-build.c',
>    'bios-linker-loader.c',
> diff --git a/include/hw/acpi/acpi-generic-initiator.h b/include/hw/acpi/acpi-generic-initiator.h
> new file mode 100644
> index 0000000000..bb127b2541
> --- /dev/null
> +++ b/include/hw/acpi/acpi-generic-initiator.h
> @@ -0,0 +1,29 @@
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
> +#define ACPI_GENERIC_INITIATOR_NODELIST_PROP "nodelist"
> +
> +typedef struct AcpiGenericInitiator {
> +    /* private */
> +    Object parent;
> +
> +    /* public */
> +    char *device;
> +    uint16List *nodelist;
> +} AcpiGenericInitiator;
> +
> +typedef struct AcpiGenericInitiatorClass {
> +        ObjectClass parent_class;
> +} AcpiGenericInitiatorClass;
> +
> +#endif
> diff --git a/qapi/qom.json b/qapi/qom.json
> index fa3e88c8e6..66d2bffdcc 100644
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
> +# @nodelist: delimited numa node list
> +#
> +# Since: 8.2
> +##
> +{ 'struct': 'AcpiGenericInitiatorProperties',
> +  'data': { 'device': 'str', 'nodelist': 'str' } }

Do not encode structured data in strings.  Instead:

    'nodes': ['uint16']

This matches MemoryBackendProperties member @host-nodes.

Check out host_memory_backend_get_host_nodes() and
host_memory_backend_set_host_nodes() to see how to work with such a
member.

> +
>  ##
>  # @RngProperties:
>  #
> @@ -896,6 +910,7 @@
>  ##
>  { 'enum': 'ObjectType',
>    'data': [
> +    'acpi-generic-initiator',
>      'authz-list',
>      'authz-listfile',
>      'authz-pam',
> @@ -966,6 +981,7 @@
>              'id': 'str' },
>    'discriminator': 'qom-type',
>    'data': {
> +      'acpi-generic-initiator':     'AcpiGenericInitiatorProperties',
>        'authz-list':                 'AuthZListProperties',
>        'authz-listfile':             'AuthZListFileProperties',
>        'authz-pam':                  'AuthZPAMProperties',

