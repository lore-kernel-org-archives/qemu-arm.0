Received: by 2002:a17:907:8744:b0:9bd:85f7:2662 with SMTP id qo4csp241933ejc;
        Wed, 11 Oct 2023 10:18:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFj2HlUAQ0PZk3OMOuhaVkWOWkASWbivCQ9DyPTXQIlUN2jABZS8dZY3dKQ0R5evGcG16Nd
X-Received: by 2002:a54:4811:0:b0:3ae:5c36:99b2 with SMTP id j17-20020a544811000000b003ae5c3699b2mr23401130oij.55.1697044693547;
        Wed, 11 Oct 2023 10:18:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697044693; cv=none;
        d=google.com; s=arc-20160816;
        b=y29rKWQrRnG5y+2q/GrAYJuMTIv8qxBJcDYDJkGvoxMjEhWcFO3WgTjnENBoWjtzMA
         0jHnb7Fon/JMVtaneKwwwegCC8HNhvBf3AmAEJuL2ZSFChAD7SU0+6SdLBus41ewZPwq
         qq3jeuIKc9bFL+HEN3TG855twYn3caKBmmQJIpiHuGvYIO11fG81HEcmrCPj41aJ8hKa
         SXVHOUtDA9Q23iiBD0ByFE0u8z5fINkpoY4bkDvjOTQfxc3ha9+gqDOdZL7q0nIdN55G
         RH7+vTi7D4MhpeUNMGeiVV0ftcGr0Mfcru9aD+eqEnArlvnaoxAPeHBXBXVIu2lUKS1y
         WhHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:organization:references:in-reply-to:message-id:subject
         :cc:to:from:date:dkim-signature;
        bh=GR1qn4ucznk0UrlzcreKFkECAHv7g19nzPf0ibZnwPI=;
        fh=ZftObK+2z/ll+cIQlw/fAvGNCvvxjQv77lBZlDvPVoo=;
        b=xrTUgZ135rZs5qvjSjshYmoPrwRxhZ02MnRDPRlqiXg8MrFHgMhcl9xEbiHASJbqAz
         S2R9JIgI8XatFfRUb6w+rLrjDFOV8uCqFucRcnMmVQTM20FBMmC7QaGYn+obGlwusn+2
         l4nrL+MnQtL6XnTY71D7mmCvrwqjh4g9xCewLVD7tU+Sn+zSzZgrUe8p04000eA3pLrZ
         s4CZDj+tuDQrgO+BvTenpyOXkA+b+duwhJLZc8OIRD6ACYACZyl0hsTq/sBacuzMFP15
         liX5L5QHTZ5pUdSM9ahQq2XGtdIC+32xuLe74OHbUq2xVIs7Nq9mj+XJ8AMS5/ezjifR
         UFDw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=QihSpOrB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e15-20020a0caa4f000000b0065b15942647si9570877qvb.164.2023.10.11.10.18.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 11 Oct 2023 10:18:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=QihSpOrB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qqcpl-0001o6-AP; Wed, 11 Oct 2023 13:17:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1qqcpj-0001ld-PD
 for qemu-arm@nongnu.org; Wed, 11 Oct 2023 13:17:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1qqcph-0006Pq-4w
 for qemu-arm@nongnu.org; Wed, 11 Oct 2023 13:17:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1697044636;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GR1qn4ucznk0UrlzcreKFkECAHv7g19nzPf0ibZnwPI=;
 b=QihSpOrBjYDNxPJQzINi9t9b2PcMWgDcKDF24OFHaVLzksnIJqIKR53irSpZsOG7hZn+9i
 JR9BFUSphthNpWiwZoJdgc6kP/xdCeaSjSHNAmTqakRjdwIMwD4V0ye9Ii01El5ueZM8tt
 FnhH9SrdSbPWvxOl9x0YcJE4dOWPY0I=
Received: from mail-io1-f69.google.com (mail-io1-f69.google.com
 [209.85.166.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-76-HZw_UqkMO36avbqZRFj5KQ-1; Wed, 11 Oct 2023 13:17:15 -0400
X-MC-Unique: HZw_UqkMO36avbqZRFj5KQ-1
Received: by mail-io1-f69.google.com with SMTP id
 ca18e2360f4ac-7a2576bdcb7so9594639f.0
 for <qemu-arm@nongnu.org>; Wed, 11 Oct 2023 10:17:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697044631; x=1697649431;
 h=content-transfer-encoding:mime-version:organization:references
 :in-reply-to:message-id:subject:cc:to:from:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=GR1qn4ucznk0UrlzcreKFkECAHv7g19nzPf0ibZnwPI=;
 b=fa1vH15U+vJsb2SVRs1cJKZF5HJAL/8mTCNy6IBCuQqjwoAC3y29H+8VcD/tUJJih8
 DC0TEG4vod5mmAnd9w0iA+orMFnDGiLtZ5iIBQbig8BNJZPEPMcwnLoyMMQfFmpmRMV7
 pjSX93ISPdkV2257iLwuauK7umV7K3gcP5lWhV1aapq+DMXsLm1kQP3+VY3PuTUWvtq9
 isnNh4+jGGUHhNlq6w8rjlEvwWd98oNIH1JQYplAJij/6BpOdEIFYFGYaTv2J/5CZatb
 rTIELxYlPHq6jSWFcdQw3NEnskKlY07ONtrOjRvmSmsETPHUx4omGClcasnKnpdc+ReU
 nqRQ==
X-Gm-Message-State: AOJu0YxPUrw/xTzY+X3zvh53fUoZ5lp5fBlE29c3cc41JpygKytZEePI
 PI35NKzvBD7hM8tHDuK/hIze6+SFB7ouyXmsL5HvLy1IUrdtBh9pqj/3oFBo7eGSfcQErcjExnV
 RLSxSXs+BGMxZ
X-Received: by 2002:a6b:90b:0:b0:79f:e707:8813 with SMTP id
 t11-20020a6b090b000000b0079fe7078813mr23217273ioi.4.1697044630707; 
 Wed, 11 Oct 2023 10:17:10 -0700 (PDT)
X-Received: by 2002:a6b:90b:0:b0:79f:e707:8813 with SMTP id
 t11-20020a6b090b000000b0079fe7078813mr23217239ioi.4.1697044630443; 
 Wed, 11 Oct 2023 10:17:10 -0700 (PDT)
Received: from redhat.com ([38.15.60.12]) by smtp.gmail.com with ESMTPSA id
 gj12-20020a0566386a0c00b0043193e32c78sm3400795jab.152.2023.10.11.10.17.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Oct 2023 10:17:08 -0700 (PDT)
Date: Mon, 9 Oct 2023 15:16:16 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: <ankita@nvidia.com>
Cc: <jgg@nvidia.com>, <clg@redhat.com>, <shannon.zhaosl@gmail.com>,
 <peter.maydell@linaro.org>, <ani@anisinha.ca>, <berrange@redhat.com>,
 <eduardo@habkost.net>, <imammedo@redhat.com>, <mst@redhat.com>,
 <eblake@redhat.com>, <armbru@redhat.com>, <david@redhat.com>,
 <gshan@redhat.com>, <Jonathan.Cameron@huawei.com>, <aniketa@nvidia.com>,
 <cjia@nvidia.com>, <kwankhede@nvidia.com>, <targupta@nvidia.com>,
 <vsethi@nvidia.com>, <acurrid@nvidia.com>, <dnigam@nvidia.com>,
 <udhoke@nvidia.com>, <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>
Subject: Re: [PATCH v2 1/3] qom: new object to associate device to numa node
Message-ID: <20231009151616.0119b03d.alex.williamson@redhat.com>
In-Reply-To: <20231007201740.30335-2-ankita@nvidia.com>
References: <20231007201740.30335-1-ankita@nvidia.com>
 <20231007201740.30335-2-ankita@nvidia.com>
Organization: Red Hat
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=alex.williamson@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -7
X-Spam_score: -0.8
X-Spam_bar: /
X-Spam_report: (-0.8 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_24_48=1.34,
 DKIMWL_WL_HIGH=-0.001, DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
 DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-TUID: wOWKztoU70M3

On Sun, 8 Oct 2023 01:47:38 +0530
<ankita@nvidia.com> wrote:

> From: Ankit Agrawal <ankita@nvidia.com>
> 
> The CPU cache coherent device memory can be added as NUMA nodes
> distinct from the system memory nodes. These nodes are associated
> with the device and Qemu needs a way to maintain this link.
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

error_setg() here?  Thanks,

Alex

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

