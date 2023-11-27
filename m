Received: by 2002:a17:906:494d:b0:a0d:e0d9:b5bf with SMTP id f13csp1467595ejt;
        Mon, 27 Nov 2023 14:58:32 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHiwlcAyTowjjwk3/O+izsmvYcsYXZm5L1BTJ7MffBzOoyHcpHh/QZacIOpyENHFOnI09Jq
X-Received: by 2002:a05:620a:6182:b0:77d:683f:27a with SMTP id or2-20020a05620a618200b0077d683f027amr23601291qkn.27.1701125912345;
        Mon, 27 Nov 2023 14:58:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1701125912; cv=none;
        d=google.com; s=arc-20160816;
        b=N3CiEm1slw98twj8xSvzDOVwZUrPUsYecaob3uaBCF7/le5wGp0PhsnI2K8ZFUWj5l
         8tFv2npqtn1L6b1w6OJxHIc6pB0oGt4RJ/7uHNEx2+WHOFKAQ5b2yjXeueuy+xSL2k6e
         2C3ldmufOEKwWwZsAjpacK+SgBV8X4HrVTBTWN9t6VfRdKC9Lg/ogsqx1HQCLuT1etMI
         u083zsUyJhwQEar+kZ2BumXOmvL4fgmwFzTza561/LIqufscWXNi7jsoOxaDE7KUNL5G
         IfyiFVcEWRQmzbX1AU7DpnwCC9XsTPlMepf4CBA3ubEYT2JCp1oXgzmWxWJMDxTKRHxO
         sKSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:cc:to:from
         :date:dkim-signature;
        bh=4OLI+Pgg2mT/MxHuN4CHsnhmzDrDJCO/gEFpWoR3qzI=;
        fh=ZftObK+2z/ll+cIQlw/fAvGNCvvxjQv77lBZlDvPVoo=;
        b=BlCuEAJKUQc/eby4lMGB45fjjZvvQuAF36qIaazafhph12xMo2Y3rq44Q3L3P8ANtu
         kS6Zq7mIv+zLooS0XFqiQgFJJV3I+6/Nw+VI0KnqiBRhJ00vMxJL5ulZlIgBUu2jKZ9D
         lzR9ljqQyj8obWWtL2zlIvuKsCtC7mBWdHSCapcdXEdd4mRHF7AnKIRqiJ9YQ1ZF3dJD
         d1+2u2RvHLibDUlW5M4mnzJq5ZEUS6ZYYHhkzQL60LDrZQ5tY9KIeTpaiy7sEmiEUdc1
         0rygmqqEFm/Vu28BZ+9MEadpNqSI3BD48gPVLhNtjVbGCfWTnmy4D7jhg5PuvMRLXgSk
         u2qA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=icRix3Pw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g15-20020a05620a40cf00b0077db75e8cf8si565421qko.189.2023.11.27.14.58.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 Nov 2023 14:58:32 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=icRix3Pw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1r7kYK-0006Cp-LV; Mon, 27 Nov 2023 17:58:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1r7kYH-0006C5-PB
 for qemu-arm@nongnu.org; Mon, 27 Nov 2023 17:58:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1r7kYF-0004pr-MS
 for qemu-arm@nongnu.org; Mon, 27 Nov 2023 17:58:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1701125882;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4OLI+Pgg2mT/MxHuN4CHsnhmzDrDJCO/gEFpWoR3qzI=;
 b=icRix3Pw4n0IfJk9JVRZeQuCN0+qalXZaeAQzcON2B+jUgjoFyUsrAjYFfqFbSjiycFaPn
 KnuVaTmr6DENjPlD2zumijiH712pfr6MQfHMxMVfBjRjahehW6q+8IasL1rhYyQZigZSBE
 2SbfwxlbtT0xZB6T0CMPQSoAE1uwHd4=
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com
 [209.85.167.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-324-YkxGTqOAOa-HdfPHljWznw-1; Mon, 27 Nov 2023 17:58:01 -0500
X-MC-Unique: YkxGTqOAOa-HdfPHljWznw-1
Received: by mail-oi1-f198.google.com with SMTP id
 5614622812f47-3b2d8caadfbso4225336b6e.0
 for <qemu-arm@nongnu.org>; Mon, 27 Nov 2023 14:58:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701125875; x=1701730675;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4OLI+Pgg2mT/MxHuN4CHsnhmzDrDJCO/gEFpWoR3qzI=;
 b=QEkNXTS2Ol8r2zGt9N8SDaCQwsDfCA0XIiV+ErnqtRXiC8hUxzqi4p9sufHcCvvB7d
 4b8565QFpzBKpLHwPR25lxFfSFih81kgOEMLEBhcZ2pqNQCur9JNCiZcWBUwWFs/RHN2
 fC5q+W/rZsfnQq4AixXAjL+cw34T9MhJ9X2oCpoKbpnhgWugnIuwMIi8G+L4ewFH7+CK
 Mbr0fM7W0z0DCvtrMY0m1BB72aTouM8rp3oQfdHQId5eUgT4M7gphjinVl1EVtFIPhte
 Ep7tP2T4d8NBfBKvpZNX6q5ilihmihykWfHRvqnspS0k1Zg86gu+c92sAK7GjwYkvRqo
 H//g==
X-Gm-Message-State: AOJu0Yz5PtGlvLWDvEUYZaArmnkuPRqWHrudRGHYK6S3w9AwRqzACkaw
 71oNOT7uqXCCzV5CM+dlNK+2lmqz/HtLz12FPAFTTy6LNZ1Oby1cLFYazwXtO3ngNLpbvz0pzWR
 Kib1TA5okcXtm
X-Received: by 2002:a05:6808:19a2:b0:3a8:f3e7:d67d with SMTP id
 bj34-20020a05680819a200b003a8f3e7d67dmr4009505oib.1.1701125875691; 
 Mon, 27 Nov 2023 14:57:55 -0800 (PST)
X-Received: by 2002:a05:6808:19a2:b0:3a8:f3e7:d67d with SMTP id
 bj34-20020a05680819a200b003a8f3e7d67dmr4009474oib.1.1701125875371; 
 Mon, 27 Nov 2023 14:57:55 -0800 (PST)
Received: from redhat.com ([38.15.60.12]) by smtp.gmail.com with ESMTPSA id
 bl14-20020a056808308e00b003b83edb8a89sm1662498oib.2.2023.11.27.14.57.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Nov 2023 14:57:54 -0800 (PST)
Date: Mon, 27 Nov 2023 15:57:52 -0700
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
Subject: Re: [PATCH v4 1/2] qom: new object to associate device to numa node
Message-ID: <20231127155752.5ddc2569.alex.williamson@redhat.com>
In-Reply-To: <20231119130111.761-2-ankita@nvidia.com>
References: <20231119130111.761-1-ankita@nvidia.com>
 <20231119130111.761-2-ankita@nvidia.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=alex.williamson@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: 31uIOMuCyIzy

On Sun, 19 Nov 2023 18:31:10 +0530
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
> Introduce a new acpi-generic-initiator object to allow host admin provide the
> device and the corresponding NUMA nodes. Qemu maintain this association and
> use this object to build the requisite GI Affinity Structure.
> 
> An admin can provide the range of nodes through a uint16 array host-nodes
> and link it to a device by providing its id. Currently, only PCI device is
> supported and an error is returned for acpi device. The following sample
> creates 8 nodes and link them to the PCI device dev0:
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
> -object acpi-generic-initiator,id=gi0,pci-dev=dev0,host-nodes=2-9 \
> 
> [1] https://www.nvidia.com/en-in/technologies/multi-instance-gpu
> 
> Signed-off-by: Ankit Agrawal <ankita@nvidia.com>
> ---
>  hw/acpi/acpi-generic-initiator.c         | 84 ++++++++++++++++++++++++
>  hw/acpi/meson.build                      |  1 +
>  include/hw/acpi/acpi-generic-initiator.h | 30 +++++++++
>  qapi/qom.json                            | 18 +++++
>  4 files changed, 133 insertions(+)
>  create mode 100644 hw/acpi/acpi-generic-initiator.c
>  create mode 100644 include/hw/acpi/acpi-generic-initiator.h
> 
> diff --git a/hw/acpi/acpi-generic-initiator.c b/hw/acpi/acpi-generic-initiator.c
> new file mode 100644
> index 0000000000..5ea51cb81e
> --- /dev/null
> +++ b/hw/acpi/acpi-generic-initiator.c
> @@ -0,0 +1,84 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2023, NVIDIA CORPORATION & AFFILIATES. All rights reserved
> + */
> +
> +#include "qemu/osdep.h"
> +#include "hw/qdev-properties.h"
> +#include "qapi/error.h"
> +#include "qapi/qapi-builtin-visit.h"
> +#include "qapi/visitor.h"
> +#include "qom/object_interfaces.h"
> +#include "qom/object.h"
> +#include "hw/qdev-core.h"
> +#include "hw/vfio/vfio-common.h"
> +#include "hw/vfio/pci.h"

There's nothing related to vfio here except for the example use case,
surely you don't need the above two headers.

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
> +static void acpi_generic_initiator_set_pci_device(Object *obj, const char *val,
> +                                                  Error **errp)
> +{
> +    AcpiGenericInitiator *gi = ACPI_GENERIC_INITIATOR(obj);
> +
> +    gi->device = g_strdup(val);
> +}
> +
> +static void acpi_generic_initiator_set_acpi_device(Object *obj, const char *val,
> +                                                   Error **errp)
> +{
> +    error_setg(errp, "Generic Initiator ACPI device not supported");
> +}
> +
> +static void
> +acpi_generic_initiator_set_host_nodes(Object *obj, Visitor *v, const char *name,
> +                                      void *opaque, Error **errp)
> +{
> +    AcpiGenericInitiator *gi = ACPI_GENERIC_INITIATOR(obj);
> +    uint16List *l;
> +
> +    visit_type_uint16List(v, name, &(gi->nodelist), errp);
> +
> +    for (l = gi->nodelist; l; l = l->next) {
> +        if (l->value >= MAX_NODES) {
> +            error_setg(errp, "Invalid host-nodes value: %d", l->value);
> +            qapi_free_uint16List(gi->nodelist);
> +            return;
> +        }
> +    }
> +}
> +
> +static void acpi_generic_initiator_class_init(ObjectClass *oc, void *data)
> +{
> +    object_class_property_add_str(oc, ACPI_GENERIC_INITIATOR_PCI_DEVICE_PROP,
> +                                  NULL, acpi_generic_initiator_set_pci_device);
> +    object_class_property_add_str(oc, ACPI_GENERIC_INITIATOR_ACPI_DEVICE_PROP,
> +                                  NULL, acpi_generic_initiator_set_acpi_device);

This doesn't allow introspection of acpi-dev support, the property
shouldn't be added until the support is available.  At least we've
thought about it now and we might use a comment to describe the
intention that ACPI devices could be supported by this option in the
future.

> +    object_class_property_add(oc, ACPI_GENERIC_INITIATOR_HOSTNODE_PROP, "int",
> +        NULL,
> +        acpi_generic_initiator_set_host_nodes,
> +        NULL, NULL);
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
> index 0000000000..db3ed02c80
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
> +#define ACPI_GENERIC_INITIATOR_PCI_DEVICE_PROP "pci-dev"
> +#define ACPI_GENERIC_INITIATOR_ACPI_DEVICE_PROP "acpi-dev"
> +#define ACPI_GENERIC_INITIATOR_HOSTNODE_PROP "host-nodes"
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
> index c53ef978ff..f726f5ea41 100644
> --- a/qapi/qom.json
> +++ b/qapi/qom.json
> @@ -794,6 +794,22 @@
>  { 'struct': 'VfioUserServerProperties',
>    'data': { 'socket': 'SocketAddress', 'device': 'str' } }
>  
> +##
> +# @AcpiGenericInitiatorProperties:
> +#
> +# Properties for acpi-generic-initiator objects.
> +#
> +# @pci-dev: PCI device ID to be associated with the node
> +#
> +# @acpi-dev: ACPI device ID to be associated with the node
> +#
> +# @host-nodes: numa node list
> +#
> +# Since: 8.2

8.2 is in freeze, this is 9.0 material.  Thanks,

Alex

> +##
> +{ 'struct': 'AcpiGenericInitiatorProperties',
> +  'data': { '*pci-dev': 'str', '*acpi-dev': 'str', 'host-nodes': ['uint16'] } }
> +
>  ##
>  # @RngProperties:
>  #
> @@ -911,6 +927,7 @@
>  ##
>  { 'enum': 'ObjectType',
>    'data': [
> +    'acpi-generic-initiator',
>      'authz-list',
>      'authz-listfile',
>      'authz-pam',
> @@ -981,6 +998,7 @@
>              'id': 'str' },
>    'discriminator': 'qom-type',
>    'data': {
> +      'acpi-generic-initiator':     'AcpiGenericInitiatorProperties',
>        'authz-list':                 'AuthZListProperties',
>        'authz-listfile':             'AuthZListFileProperties',
>        'authz-pam':                  'AuthZPAMProperties',

