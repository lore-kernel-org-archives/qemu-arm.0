Received: by 2002:a17:907:8744:b0:9bd:85f7:2662 with SMTP id qo4csp241891ejc;
        Wed, 11 Oct 2023 10:18:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE4Fpvw6FI1iWQ48tvmsA0RLY6vyXGtmoPnH/cOCKb7jKm2a1OuYhVxdQ0Pumlg9Rl6VQLa
X-Received: by 2002:ac8:5b96:0:b0:3f9:d1c3:cc45 with SMTP id a22-20020ac85b96000000b003f9d1c3cc45mr24604866qta.28.1697044689485;
        Wed, 11 Oct 2023 10:18:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697044689; cv=none;
        d=google.com; s=arc-20160816;
        b=TlqqUhngyIcBPGXmtE6zgQg7CD/kjVK2omuSQ1Gn80YFhzIRy+re4XvcsOMWnZUstk
         DlXFizwoh9k+UTBRcusDKivCpWml+oNpGCuNqNXuLCBMG4uK8laJAVWmdwFlszPDss28
         vMvLH2jc3RtUWrzHERICmY13tjU92/WAkMpV/B8zdPTN5FG8jcSKdbtziPtohNmf5Ubp
         GCtg25idEPcY8BDCDjsx2cgx/c8SxE9ucJLro+Xa3/PxmIMvudn9HX4oqGldOhig7QUy
         znjm72wmxG2k5szl0sFiAlOWpStVo5o2hjq/mfTp1+594VZjvYN1aL5xsZk5KsOPLPMO
         qCUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:organization:references:in-reply-to:message-id:subject
         :cc:to:from:date:dkim-signature;
        bh=AzVJtSFcUrwRuuaSMN+l9daRCiE5itM/x4u0qIAiko8=;
        fh=ZftObK+2z/ll+cIQlw/fAvGNCvvxjQv77lBZlDvPVoo=;
        b=H1uZ+2iWRLJORYU1/RGalB1i5OG+nfqdEB4P60wuTGj5DyZbCtSiYZWRvRjXWNVr2Y
         FBJpeECZSGk1ZSTXAGx3+oO+/KY2reumNTNzYh95jWyU3bQNNaQjBlRjGq5TGNHGybb/
         6EWEdhwPHohVg6YZ68+M4RHxkjQc2fOb9ujK7bZxtlN/Ia8AwPmyJAo20JP5gCeNLSwX
         iyL4rAVVQzDHe1xx7IXD+DdDupXT2T0mEucjBJDemFuzWUz8qNL/CObzioZ8tKUg2frc
         bAcoN722HUowElSQUjXuVT4fKZubVsbtS7EwWXbuS/KMar0PO+b/Bt8POwPqYO+1EZ+q
         XJYA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="UjqgEL/l";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a11-20020a05622a02cb00b004197d6f0661si9544612qtx.8.2023.10.11.10.18.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 11 Oct 2023 10:18:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="UjqgEL/l";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qqcpX-0001YP-OB; Wed, 11 Oct 2023 13:17:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1qqcpV-0001XT-R5
 for qemu-arm@nongnu.org; Wed, 11 Oct 2023 13:17:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1qqcpS-0006Mn-As
 for qemu-arm@nongnu.org; Wed, 11 Oct 2023 13:17:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1697044621;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AzVJtSFcUrwRuuaSMN+l9daRCiE5itM/x4u0qIAiko8=;
 b=UjqgEL/l7SaCOh1UvaxT76Op0ee6RqmhRb+5N+7w/LpMqe+w0yISz2I3kB7hVocVshIbC4
 BnfwMYoAgkjKkP0W9WT80h7ISXhNWF9PHdj1sdvXl2U1HWTB3hNDrgZ136SoeLjPwTQkY9
 pysyqDiAicHR9qMeY2PKtodEHGlCbmU=
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com
 [209.85.166.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-575-_tA6SBE0NJ-b9lx6VM4VHg-1; Wed, 11 Oct 2023 13:16:59 -0400
X-MC-Unique: _tA6SBE0NJ-b9lx6VM4VHg-1
Received: by mail-il1-f199.google.com with SMTP id
 e9e14a558f8ab-3574413823eso4752655ab.1
 for <qemu-arm@nongnu.org>; Wed, 11 Oct 2023 10:16:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697044618; x=1697649418;
 h=content-transfer-encoding:mime-version:organization:references
 :in-reply-to:message-id:subject:cc:to:from:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=AzVJtSFcUrwRuuaSMN+l9daRCiE5itM/x4u0qIAiko8=;
 b=Ib0637Rcth4jgIOkDVtNhqyaqloIHWcAoNQMirSp0jMvO6i+M/S06IXPbFYfvgIv1b
 VSMIFXRIkQIs3xbihy5oRLO42+/8e/QLieOva5a6HjNfV0+EECDORijUN9WoNmwM5bo+
 83vjR6/dBwvhNkcuux86VNFXUwd+YzuUwiyZBx5iIInR10qWboBOnW/jh1eHMI3K+y2W
 t9b02R+bdkn+NhA3nugc9C7zK2A9AMS2yuo8F73xt9eimDRytxG5i17xrsyV/3bf4290
 QLlyOtv8Rb306TmcxArA004A1JhGIDzWWs0CRfGCwXGBSTB8qER9+BJ/juESGAioSt+t
 Ms8Q==
X-Gm-Message-State: AOJu0YwPzWO+4GX+kDQfBt7mC1bJt+1sOow5Lcnbs7Jpg6RpEXCdgkY5
 TG42mD756bIUyF4kUdjukLOC18cpNOg1YGp48YenUwBXNoTjaJN/CxsRtmMoSkU53dvFZgR7Led
 ZETDpGatZwtzd
X-Received: by 2002:a05:6e02:1d05:b0:34f:f6d1:ef2a with SMTP id
 i5-20020a056e021d0500b0034ff6d1ef2amr16522200ila.13.1697044618465; 
 Wed, 11 Oct 2023 10:16:58 -0700 (PDT)
X-Received: by 2002:a05:6e02:1d05:b0:34f:f6d1:ef2a with SMTP id
 i5-20020a056e021d0500b0034ff6d1ef2amr16522182ila.13.1697044618181; 
 Wed, 11 Oct 2023 10:16:58 -0700 (PDT)
Received: from redhat.com ([38.15.60.12]) by smtp.gmail.com with ESMTPSA id
 a10-20020a92d58a000000b00351076c43e3sm78592iln.4.2023.10.11.10.16.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Oct 2023 10:16:56 -0700 (PDT)
Date: Mon, 9 Oct 2023 15:16:26 -0600
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
Subject: Re: [PATCH v2 2/3] hw/acpi: Implement the SRAT GI affinity structure
Message-ID: <20231009151626.28910a90.alex.williamson@redhat.com>
In-Reply-To: <20231007201740.30335-3-ankita@nvidia.com>
References: <20231007201740.30335-1-ankita@nvidia.com>
 <20231007201740.30335-3-ankita@nvidia.com>
Organization: Red Hat
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=alex.williamson@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -7
X-Spam_score: -0.8
X-Spam_bar: /
X-Spam_report: (-0.8 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_24_48=1.34,
 DKIMWL_WL_HIGH=-0.001, DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
 DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
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
X-TUID: 8zgZpGz+B4mA

On Sun, 8 Oct 2023 01:47:39 +0530
<ankita@nvidia.com> wrote:

> From: Ankit Agrawal <ankita@nvidia.com>
> 
> ACPI spec provides a scheme to associate "Generic Initiators" [1]
> (e.g. heterogeneous processors and accelerators, GPUs, and I/O devices with
> integrated compute or DMA engines GPUs) with Proximity Domains. This is
> achieved using Generic Initiator Affinity Structure in SRAT. During bootup,
> Linux kernel parse the ACPI SRAT to determine the PXM ids and create a NUMA
> node for each unique PXM ID encountered. Qemu currently do not implement
> these structures while building SRAT.
> 
> Add GI structures while building VM ACPI SRAT. The association between
> devices and PXM are stored using acpi-generic-initiator object. Lookup
> presence of all such objects and use them to build these structures.
> 
> The structure needs a PCI device handle [2] that consists of the device BDF.
> The vfio-pci-nohotplug device corresponding to the acpi-generic-initiator
> object is located to determine the BDF.
> 
> [1] ACPI Spec 6.5, Section 5.2.16.6
> [2] ACPI Spec 6.5, Table 5.66
> 
> Signed-off-by: Ankit Agrawal <ankita@nvidia.com>
> ---
>  hw/acpi/acpi-generic-initiator.c         | 78 ++++++++++++++++++++++++
>  hw/arm/virt-acpi-build.c                 |  3 +
>  hw/vfio/pci.c                            |  2 -
>  hw/vfio/pci.h                            |  2 +
>  include/hw/acpi/acpi-generic-initiator.h | 22 +++++++
>  5 files changed, 105 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/acpi/acpi-generic-initiator.c b/hw/acpi/acpi-generic-initiator.c
> index 6406736090..1ae79639be 100644
> --- a/hw/acpi/acpi-generic-initiator.c
> +++ b/hw/acpi/acpi-generic-initiator.c
> @@ -72,3 +72,81 @@ static void acpi_generic_initiator_class_init(ObjectClass *oc, void *data)
>                                NULL, acpi_generic_initiator_set_node, NULL,
>                                NULL);
>  }
> +
> +static int acpi_generic_initiator_list(Object *obj, void *opaque)
> +{
> +    GSList **list = opaque;
> +
> +    if (object_dynamic_cast(obj, TYPE_ACPI_GENERIC_INITIATOR)) {
> +        *list = g_slist_append(*list, ACPI_GENERIC_INITIATOR(obj));
> +    }
> +
> +    object_child_foreach(obj, acpi_generic_initiator_list, opaque);
> +    return 0;
> +}
> +
> +/*
> + * Identify Generic Initiator objects and link them into the list which is
> + * returned to the caller.
> + *
> + * Note: it is the caller's responsibility to free the list to avoid
> + * memory leak.
> + */
> +static GSList *acpi_generic_initiator_get_list(void)
> +{
> +    GSList *list = NULL;
> +
> +    object_child_foreach(object_get_root(), acpi_generic_initiator_list, &list);
> +    return list;
> +}
> +
> +/*
> + * ACPI spec, Revision 6.5
> + * 5.2.16.6 Generic Initiator Affinity Structure
> + */
> +static void build_srat_generic_initiator_affinity(GArray *table_data, int node,
> +                                                  PCIDeviceHandle *handle,
> +                                                  GenericAffinityFlags flags)
> +{
> +    build_append_int_noprefix(table_data, 5, 1);     /* Type */
> +    build_append_int_noprefix(table_data, 32, 1);    /* Length */
> +    build_append_int_noprefix(table_data, 0, 1);     /* Reserved */
> +    build_append_int_noprefix(table_data, 1, 1);     /* Device Handle Type */
> +    build_append_int_noprefix(table_data, node, 4);  /* Proximity Domain */
> +    build_append_int_noprefix(table_data, handle->segment, 2);
> +    build_append_int_noprefix(table_data, handle->bdf, 2);
> +    build_append_int_noprefix(table_data, handle->res0, 4);
> +    build_append_int_noprefix(table_data, handle->res1, 8);

Why are we storing reserved fields in the PCIDeviceHandle?  This
function is already specific to building a PCI Device Handle, so we
could just loop build_append_byte() with a fixed zero value here.

> +    build_append_int_noprefix(table_data, flags, 4); /* Flags */
> +    build_append_int_noprefix(table_data, 0, 4);     /* Reserved */
> +}
> +
> +void build_srat_generic_initiator(GArray *table_data)
> +{
> +    GSList *gi_list, *list = acpi_generic_initiator_get_list();
> +    for (gi_list = list; gi_list; gi_list = gi_list->next) {
> +        AcpiGenericInitiator *gi = gi_list->data;
> +        Object *o;
> +        int count;
> +
> +        if (gi->node == MAX_NODES) {
> +            continue;
> +        }

Why do we have uninitialized AcpiGenericInitiator objects lingering?

> +
> +        o = object_resolve_path_type(gi->device, TYPE_VFIO_PCI_NOHOTPLUG, NULL);

TYPE_PCI_DEVICE?  Maybe you could check hotpluggable from the device
class, but certainly the generic code should not be dependent on being
a vfio-pci-nohotplug device.  The spec also supports an ACPI object
description, so should this be build_srat_generic_pci_initiator()?


> +        if (!o) {
> +            continue;
> +        }
> +
> +        for (count = 0; count < gi->node_count; count++) {
> +            PCIDeviceHandle dev_handle = {0};
> +            PCIDevice *pci_dev = PCI_DEVICE(o);
> +
> +            dev_handle.bdf = pci_dev->devfn;

Where does the bus part of the bdf get filled in?

> +            build_srat_generic_initiator_affinity(table_data,
> +                                                  gi->node + count, &dev_handle,
> +                                                  GEN_AFFINITY_ENABLED);

Seems like the code that built the AcpiGenericInitiator object should
supply the flags.  In fact the flag GEN_AFFINITY_ENABLED might be a
better indicator to populate the SRAT with the GI than the node value.
Thanks,

Alex

> +        }
> +    }
> +    g_slist_free(list);
> +}
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index 6b674231c2..7337d8076b 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -58,6 +58,7 @@
>  #include "migration/vmstate.h"
>  #include "hw/acpi/ghes.h"
>  #include "hw/acpi/viot.h"
> +#include "hw/acpi/acpi-generic-initiator.h"
>  
>  #define ARM_SPI_BASE 32
>  
> @@ -558,6 +559,8 @@ build_srat(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>          }
>      }
>  
> +    build_srat_generic_initiator(table_data);
> +
>      if (ms->nvdimms_state->is_enabled) {
>          nvdimm_build_srat(table_data);
>      }
> diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
> index a205c6b113..5e2a7c650a 100644
> --- a/hw/vfio/pci.c
> +++ b/hw/vfio/pci.c
> @@ -43,8 +43,6 @@
>  #include "migration/blocker.h"
>  #include "migration/qemu-file.h"
>  
> -#define TYPE_VFIO_PCI_NOHOTPLUG "vfio-pci-nohotplug"
> -
>  /* Protected by BQL */
>  static KVMRouteChange vfio_route_change;
>  
> diff --git a/hw/vfio/pci.h b/hw/vfio/pci.h
> index a2771b9ff3..74ac77a260 100644
> --- a/hw/vfio/pci.h
> +++ b/hw/vfio/pci.h
> @@ -118,6 +118,8 @@ typedef struct VFIOMSIXInfo {
>  #define TYPE_VFIO_PCI "vfio-pci"
>  OBJECT_DECLARE_SIMPLE_TYPE(VFIOPCIDevice, VFIO_PCI)
>  
> +#define TYPE_VFIO_PCI_NOHOTPLUG "vfio-pci-nohotplug"
> +
>  struct VFIOPCIDevice {
>      PCIDevice pdev;
>      VFIODevice vbasedev;
> diff --git a/include/hw/acpi/acpi-generic-initiator.h b/include/hw/acpi/acpi-generic-initiator.h
> index e67e6e23b1..e8e2670309 100644
> --- a/include/hw/acpi/acpi-generic-initiator.h
> +++ b/include/hw/acpi/acpi-generic-initiator.h
> @@ -27,4 +27,26 @@ typedef struct AcpiGenericInitiatorClass {
>          ObjectClass parent_class;
>  } AcpiGenericInitiatorClass;
>  
> +/*
> + * ACPI 6.5: Table 5-68 Flags - Generic Initiator
> + */
> +typedef enum {
> +    GEN_AFFINITY_NOFLAGS = 0,
> +    GEN_AFFINITY_ENABLED = (1 << 0),
> +    GEN_AFFINITY_ARCH_TRANS = (1 << 1),
> +} GenericAffinityFlags;
> +
> +/*
> + * ACPI 6.5: Table 5-66 Device Handle - PCI
> + * Device Handle definition
> + */
> +typedef struct PCIDeviceHandle {
> +    uint16_t segment;
> +    uint16_t bdf;
> +    uint32_t res0;
> +    uint64_t res1;
> +} PCIDeviceHandle;
> +
> +void build_srat_generic_initiator(GArray *table_data);
> +
>  #endif

