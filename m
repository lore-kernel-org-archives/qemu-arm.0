Received: by 2002:a17:906:3657:b0:a0d:e0d9:b5bf with SMTP id r23csp254784ejb;
        Thu, 30 Nov 2023 06:13:14 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEe5c+5dRXczZY9ahVjvObKmYYmr96e6cA9qVo6YJpbd4cDg4tbtDIyrCMqcyhjHy3Hudi1
X-Received: by 2002:a05:6870:2b1c:b0:1d5:a72e:154e with SMTP id ld28-20020a0568702b1c00b001d5a72e154emr27464170oab.36.1701353593970;
        Thu, 30 Nov 2023 06:13:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1701353593; cv=none;
        d=google.com; s=arc-20160816;
        b=H/oRm36FrtSGx1VwMU9ECD6yXZgZTZZvxyCn9pDaOvFtiAbK/zIP3Lr5K7ovSVe3Dj
         tOt79hXz/j5toree3OLsOGVfcLg+hCPh303nzjvnFttl4Wb6nki5AtIKGZaVtjLnSMzF
         CnDsdOpFgYv/6pZtDHCSjr22VR3HKRsRKyuYlACIQur/gGSz62/9m3fANtwCqj7Ir2ll
         UcPdcmcr5LP6BktbuxzTUFPIiTqARvxc7TlYIxH6mX+5m34ZZITr4Xv2kLoLCe17IOUt
         OxFjAY6iM/L4cbolek/pncBamBk3oAFQ8ipLxt7fSWtv8G4HL2ICURaEfweXzbVys6Iv
         /n7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:user-agent:message-id:in-reply-to:date:references
         :subject:cc:to:from:dkim-signature;
        bh=w3fdkzfweZTD6YGstxa31NKA8kNnBNCgcS0bXodlPXU=;
        fh=yb4b79XAGCI30noH8GSpCr9rwvQW/pGoAYpupm/Cfyc=;
        b=HsgZX5qKHR0OrU/dYhc7smsf2/fOb0ceyb9d7SEOQCj9Mum+7E3EZTveg+TiyWDzA+
         91o6JWRWCSA63K0xFEFipDXJCS9rqO6hNIbv/OxRnQHr4yAchDkLfU0fkY+MBUvujn8q
         JXXA4uGL/AZnII0Swzj7Nb8rDtEyVx2eCNQve8NuYFQ0XPsZgwRf6KAC8H24k4hkldaD
         OoE/z54bWMlvJBMrq7rFCSkSWwnvPAawVpT9sckunmWW0sy3uswl3jKBqXvMXIFVLtS9
         PHi0d18Q19ONE1Tw+0PtxzdWLxM9UrwDR2+nhdnBFrZaTQBtX9Y8xoDBkEZLVk/3ax3b
         kLlw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=FFbA06lN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q11-20020a67f04b000000b004608806ee18si165264vsm.646.2023.11.30.06.13.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 30 Nov 2023 06:13:13 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=FFbA06lN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1r8hmv-0006pv-4X; Thu, 30 Nov 2023 09:13:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1r8hmn-0006iO-Ti
 for qemu-arm@nongnu.org; Thu, 30 Nov 2023 09:13:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1r8hmi-0005br-3b
 for qemu-arm@nongnu.org; Thu, 30 Nov 2023 09:12:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1701353570;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=w3fdkzfweZTD6YGstxa31NKA8kNnBNCgcS0bXodlPXU=;
 b=FFbA06lNLgYaYM3OTXNO5s4DUsOnHy1J5Zx1M948/UM1S5U4rrAChUMZTT72QyWkLmkL14
 1/ak8uftnPAazbdqauGTQZgwHxtOGGI9+LoPlgwkOW3CmATMDo+5U6UF3y7ZD19uS4yJS+
 ATaZLbcMmB2uv0sbinwBzueZKHHXvnE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-320-jYuJgzNPOuGn4TkwvVr93g-1; Thu, 30 Nov 2023 09:12:43 -0500
X-MC-Unique: jYuJgzNPOuGn4TkwvVr93g-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 662928007B3;
 Thu, 30 Nov 2023 14:12:42 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.148])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2574410EA1;
 Thu, 30 Nov 2023 14:12:42 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 27CED21E6A1F; Thu, 30 Nov 2023 15:12:41 +0100 (CET)
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
Subject: Re: [PATCH v4 2/2] hw/acpi: Implement the SRAT GI affinity structure
References: <20231119130111.761-1-ankita@nvidia.com>
 <20231119130111.761-3-ankita@nvidia.com>
Date: Thu, 30 Nov 2023 15:12:41 +0100
In-Reply-To: <20231119130111.761-3-ankita@nvidia.com> (ankita@nvidia.com's
 message of "Sun, 19 Nov 2023 18:31:11 +0530")
Message-ID: <87o7fb72jq.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
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
X-TUID: y9uOIBC01cpV

<ankita@nvidia.com> writes:

> From: Ankit Agrawal <ankita@nvidia.com>
>
> ACPI spec provides a scheme to associate "Generic Initiators" [1]
> (e.g. heterogeneous processors and accelerators, GPUs, and I/O devices wi=
th
> integrated compute or DMA engines GPUs) with Proximity Domains. This is
> achieved using Generic Initiator Affinity Structure in SRAT. During bootu=
p,
> Linux kernel parse the ACPI SRAT to determine the PXM ids and create a NU=
MA
> node for each unique PXM ID encountered. Qemu currently do not implement
> these structures while building SRAT.
>
> Add GI structures while building VM ACPI SRAT. The association between
> devices and nodes are stored using acpi-generic-initiator object. Lookup
> presence of all such objects and use them to build these structures.
>
> The structure needs a PCI device handle [2] that consists of the device B=
DF.
> The vfio-pci device corresponding to the acpi-generic-initiator object is
> located to determine the BDF.
>
> [1] ACPI Spec 6.3, Section 5.2.16.6
> [2] ACPI Spec 6.3, Table 5.80
>
> Signed-off-by: Ankit Agrawal <ankita@nvidia.com>
> ---
>  hw/acpi/acpi-generic-initiator.c         | 100 +++++++++++++++++++++++
>  hw/arm/virt-acpi-build.c                 |   3 +
>  include/hw/acpi/acpi-generic-initiator.h |  26 ++++++
>  3 files changed, 129 insertions(+)
>
> diff --git a/hw/acpi/acpi-generic-initiator.c b/hw/acpi/acpi-generic-init=
iator.c
> index 5ea51cb81e..a9222438ec 100644
> --- a/hw/acpi/acpi-generic-initiator.c
> +++ b/hw/acpi/acpi-generic-initiator.c
> @@ -16,6 +16,7 @@
>  #include "hw/pci/pci_device.h"
>  #include "sysemu/numa.h"
>  #include "hw/acpi/acpi-generic-initiator.h"
> +#include "qemu/error-report.h"
>=20=20
>  OBJECT_DEFINE_TYPE_WITH_INTERFACES(AcpiGenericInitiator, acpi_generic_in=
itiator,
>                     ACPI_GENERIC_INITIATOR, OBJECT,
> @@ -82,3 +83,102 @@ static void acpi_generic_initiator_class_init(ObjectC=
lass *oc, void *data)
>          acpi_generic_initiator_set_host_nodes,
>          NULL, NULL);
>  }
> +
> +static int acpi_generic_initiator_list(Object *obj, void *opaque)
> +{
> +    GSList **list =3D opaque;
> +
> +    if (object_dynamic_cast(obj, TYPE_ACPI_GENERIC_INITIATOR)) {
> +        *list =3D g_slist_append(*list, ACPI_GENERIC_INITIATOR(obj));
> +    }
> +
> +    object_child_foreach(obj, acpi_generic_initiator_list, opaque);
> +    return 0;
> +}
> +
> +/*
> + * Identify Generic Initiator objects and link them into the list which =
is
> + * returned to the caller.
> + *
> + * Note: it is the caller's responsibility to free the list to avoid
> + * memory leak.
> + */
> +static GSList *acpi_generic_initiator_get_list(void)
> +{
> +    GSList *list =3D NULL;
> +
> +    object_child_foreach(object_get_root(), acpi_generic_initiator_list,=
 &list);

Long line.

> +    return list;
> +}
> +
> +/*
> + * ACPI 6.3:
> + * Table 5-78 Generic Initiator Affinity Structure
> + */
> +static
> +void build_srat_generic_pci_initiator_affinity(GArray *table_data, int n=
ode,
> +                                               PCIDeviceHandle *handle)

Style nitpick: bad line break.

We traditionally format like

   static void build_srat_generic_pci_initiator_affinity(GArray *table_data,
                                                         int node,
                                                         PCIDeviceHandle *h=
andle)

or, to avoid the long line

   static void build_srat_generic_pci_initiator_affinity(GArray *table_data,
                                   int node, PCIDeviceHandle *handle)

but there's also precedence for

   static void
   build_srat_generic_pci_initiator_affinity(GArray *table_data, int node,
                                             PCIDeviceHandle *handle)

> +{
> +    uint8_t index;
> +
> +    build_append_int_noprefix(table_data, 5, 1);  /* Type */
> +    build_append_int_noprefix(table_data, 32, 1); /* Length */
> +    build_append_int_noprefix(table_data, 0, 1);  /* Reserved */
> +    build_append_int_noprefix(table_data, 1, 1);  /* Device Handle Type:=
 PCI */
> +    build_append_int_noprefix(table_data, node, 4);  /* Proximity Domain=
 */
> +
> +    /* Device Handle - PCI */
> +    build_append_int_noprefix(table_data, handle->segment, 2);
> +    build_append_int_noprefix(table_data, handle->bdf, 2);
> +    for (index =3D 0; index < 12; index++) {
> +        build_append_int_noprefix(table_data, 0, 1);
> +    }
> +
> +    build_append_int_noprefix(table_data, GEN_AFFINITY_ENABLED, 4); /* F=
lags */
> +    build_append_int_noprefix(table_data, 0, 4);     /* Reserved */
> +}
> +
> +void build_srat_generic_pci_initiator(GArray *table_data)
> +{
> +    GSList *gi_list, *list =3D acpi_generic_initiator_get_list();
> +    AcpiGenericInitiator *gi;
> +
> +    for (gi_list =3D list; gi_list; gi_list =3D gi_list->next) {
> +        Object *o;
> +        uint16List *l;
> +        PCIDevice *pci_dev;
> +        bool node_specified =3D false;
> +
> +        gi =3D gi_list->data;
> +
> +        /* User fails to provide a device. */
> +        g_assert(gi->device);

Assertions are for programming errors, not for diagnosing or reporting
user errors.  Instead

           if (!gi->device) {
               error_report(...);
               exit(1);
           }

This assumes the function can only ever run duting initial startup.  If
that's not ensured, exit(1) is wrong, and you need to return failure
instead, so the callers can do the right thing.

> +
> +        o =3D object_resolve_path_type(gi->device, TYPE_PCI_DEVICE, NULL=
);
> +        if (!o) {
> +            error_printf("Specified device must be a PCI device.\n");
> +            g_assert(o);

Likewise.

> +        }
> +        pci_dev =3D PCI_DEVICE(o);
> +
> +        for (l =3D gi->nodelist; l; l =3D l->next) {
> +            PCIDeviceHandle dev_handle;
> +            dev_handle.segment =3D 0;
> +            dev_handle.bdf =3D PCI_BUILD_BDF(pci_bus_num(pci_get_bus(pci=
_dev)),
> +                                                       pci_dev->devfn);
> +            build_srat_generic_pci_initiator_affinity(table_data,
> +                                                      l->value, &dev_han=
dle);
> +            node_specified =3D true;
> +        }
> +
> +        if (!node_specified) {
> +            error_report("Generic Initiator device 0:%x:%x.%x has no ass=
ociated"
> +                         " NUMA node.", pci_bus_num(pci_get_bus(pci_dev)=
),
> +                         PCI_SLOT(pci_dev->devfn), PCI_FUNC(pci_dev->dev=
fn));
> +            error_printf("Specify NUMA node with -nodelist option.\n");
> +            g_assert(node_specified);

Likewise.

> +        }
> +    }
> +
> +    g_slist_free(list);
> +}
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index 8bc35a483c..00d77327e0 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -58,6 +58,7 @@
>  #include "migration/vmstate.h"
>  #include "hw/acpi/ghes.h"
>  #include "hw/acpi/viot.h"
> +#include "hw/acpi/acpi-generic-initiator.h"
>=20=20
>  #define ARM_SPI_BASE 32
>=20=20
> @@ -558,6 +559,8 @@ build_srat(GArray *table_data, BIOSLinker *linker, Vi=
rtMachineState *vms)
>          }
>      }
>=20=20
> +    build_srat_generic_pci_initiator(table_data);
> +
>      if (ms->nvdimms_state->is_enabled) {
>          nvdimm_build_srat(table_data);
>      }
> diff --git a/include/hw/acpi/acpi-generic-initiator.h b/include/hw/acpi/a=
cpi-generic-initiator.h
> index db3ed02c80..6fdaf887cd 100644
> --- a/include/hw/acpi/acpi-generic-initiator.h
> +++ b/include/hw/acpi/acpi-generic-initiator.h
> @@ -27,4 +27,30 @@ typedef struct AcpiGenericInitiatorClass {
>          ObjectClass parent_class;
>  } AcpiGenericInitiatorClass;
>=20=20
> +/*
> + * ACPI 6.3:
> + * Table 5-81 Flags =E2=80=93 Generic Initiator Affinity Structure
> + */
> +typedef enum {
> +    GEN_AFFINITY_ENABLED =3D (1 << 0), /*
> +                                      * If clear, the OSPM ignores the c=
ontents
> +                                      * of the Generic Initiator/Port Af=
finity
> +                                      * Structure. This allows system fi=
rmware
> +                                      * to populate the SRAT with a stat=
ic
> +                                      * number of structures, but only e=
nable
> +                                      * them as necessary.
> +                                      */
> +} GenericAffinityFlags;
> +
> +/*
> + * ACPI 6.3:
> + * Table 5-80 Device Handle - PCI
> + */
> +typedef struct PCIDeviceHandle {
> +    uint16_t segment;
> +    uint16_t bdf;
> +} PCIDeviceHandle;
> +
> +void build_srat_generic_pci_initiator(GArray *table_data);
> +
>  #endif

