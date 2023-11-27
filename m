Received: by 2002:a17:906:494d:b0:a0d:e0d9:b5bf with SMTP id f13csp1467497ejt;
        Mon, 27 Nov 2023 14:58:19 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGZqi3HOriOJ1TVpPmybdlah+GPSmJPhEpnEf1G/4Yas3l8Q7IjFkuy3LP0DrT+l0A0/m1+
X-Received: by 2002:a05:6214:558b:b0:67a:590a:10d8 with SMTP id mi11-20020a056214558b00b0067a590a10d8mr11092qvb.52.1701125899472;
        Mon, 27 Nov 2023 14:58:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1701125899; cv=none;
        d=google.com; s=arc-20160816;
        b=mxpKhew83jbW3UiJ1XeFeFT1Id8mC3MYoWkFZ6NG3/sPTaqBZLsQsBaa2gREnvM32h
         EpjPVKdi55WsQFxXq4MXbLEhe6XdWlaZUp1hKkxheFCdGs4Z1Ligahqthv8irPRCeUlE
         iLYoyL/cXj6tChS+/wFQ6gl/yB4cyri2OurdIkHXUG+XiV+g5qjUNGt9BtSJAyy3o+wb
         u1D+TnlI6CvS0iQghjDOdlV6cBAEAN7WitOtIQv6MBhjbDQttdrvVYDNYWyfqgGIIwBY
         /OBUw6eFrrV2A65kbL/Wqsjjf8TLR722eHR+fp1H0mFYAoE2fUb5W13FKtH4SSGbO4H6
         vk2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:cc:to:from
         :date:dkim-signature;
        bh=gTlu0aOGE1bV6w881vRHPnLuuvyOM4DDe/rTu2ULrOk=;
        fh=ZftObK+2z/ll+cIQlw/fAvGNCvvxjQv77lBZlDvPVoo=;
        b=dfw0TsMXp4pGNF2kgwZE8jpM2EWB7VmbPCxvqZHchJeAot1WYjukTiEaY9O0dqUr7d
         aXqH3DiVacreeP4kjyyz/PEgMmDGBEhU6+63P0+fIoZa1NvDjIjKRlgr6PPp1tjV7KiL
         /eSqDryz7mtOhbR+WU8pDXt74vqiyNrxi3eucxs06Bo5Xfg6/vko+cpAvFdeWGZW6ij0
         1lnZp1i23cHsVl82D1tRkuVFBg0IAs28xOSoonSRTMhdJbfR3cHXARWI47ydqU0btdIx
         DC3d2M6uj+luUu0xap4lv6aCrNram89Bglgmy6n5GUTiLh9uDai+c0eOiAwT3MbWXeVG
         Y7wA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ZrAz8ma3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id eu13-20020ad44f4d000000b00677ae6209afsi9932212qvb.437.2023.11.27.14.58.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 Nov 2023 14:58:19 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ZrAz8ma3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1r7kYK-0006Ct-Td; Mon, 27 Nov 2023 17:58:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1r7kYJ-0006CS-PG
 for qemu-arm@nongnu.org; Mon, 27 Nov 2023 17:58:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1r7kYF-0004pw-SE
 for qemu-arm@nongnu.org; Mon, 27 Nov 2023 17:58:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1701125883;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gTlu0aOGE1bV6w881vRHPnLuuvyOM4DDe/rTu2ULrOk=;
 b=ZrAz8ma3AN1ngXYQ4jlXRtuQDa0aaresemgM6iHMluwLHAoAZ63VE49tIc6xUbhCW9YS81
 CVQygm5SRhqG7OadBCxCvvOLmeOddDp+wqwvoJH+/vH0Kf3Qr0g4+lmJgZDs7yySKY2yyN
 Rvf/zT8wzf21KT9WQlPcqvdsAObiI78=
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com
 [209.85.210.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-529-bddrmOVNMnSwMTvNI6Hfzw-1; Mon, 27 Nov 2023 17:58:01 -0500
X-MC-Unique: bddrmOVNMnSwMTvNI6Hfzw-1
Received: by mail-ot1-f72.google.com with SMTP id
 46e09a7af769-6ce0c99f117so5166762a34.2
 for <qemu-arm@nongnu.org>; Mon, 27 Nov 2023 14:58:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701125881; x=1701730681;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gTlu0aOGE1bV6w881vRHPnLuuvyOM4DDe/rTu2ULrOk=;
 b=KNnChBtPuALl+Rn30gKXguG+ulRH62+10IS+Qu2Cog2NZu8+AtdRymeKTu85/kiJiG
 bG0L5VPiT64IvnGT0gWvVBuI26P1pbttWX2ANaZkX8AoXQHw1/DbHVi13SgrGVVZTGgK
 hfRmRVjm/mE78Q1BNCzIP0URWdJJ1qfD0TK+SV0N7U6VyNcj4Jv6JW7p+SAeIsi5lR2d
 qJgbM1U+OnZlLlcMIn4KrF140FykG7upBHUP77DyM7AUYKnkfXt5NmmxFSipy5emmP0A
 gTinA1jHaC5hD5PoJeAnc4rc6ME8EoiRDjY1OKQwM505j8wIFhNhP5BylUgofdidu0l0
 7lmg==
X-Gm-Message-State: AOJu0YyyEOEzDUbxRnJbXfv7RioM2iL0Id54kfmhXuu6n/Ytp4+j3y1/
 GCT1eTiO04riZrk+QI1TrtYdaiZI4Zl8k5RC6BKhmGs/Il6ngt4pWXxjGb6AfknHpXplwwej5SB
 VNE3fknQAGwx8
X-Received: by 2002:a05:6830:4390:b0:6d8:1889:72af with SMTP id
 s16-20020a056830439000b006d8188972afmr8056033otv.2.1701125880889; 
 Mon, 27 Nov 2023 14:58:00 -0800 (PST)
X-Received: by 2002:a05:6830:4390:b0:6d8:1889:72af with SMTP id
 s16-20020a056830439000b006d8188972afmr8055995otv.2.1701125880587; 
 Mon, 27 Nov 2023 14:58:00 -0800 (PST)
Received: from redhat.com ([38.15.60.12]) by smtp.gmail.com with ESMTPSA id
 v10-20020a056830140a00b006d834fd3399sm199108otp.59.2023.11.27.14.57.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Nov 2023 14:58:00 -0800 (PST)
Date: Mon, 27 Nov 2023 15:57:58 -0700
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
Subject: Re: [PATCH v4 2/2] hw/acpi: Implement the SRAT GI affinity structure
Message-ID: <20231127155758.54066105.alex.williamson@redhat.com>
In-Reply-To: <20231119130111.761-3-ankita@nvidia.com>
References: <20231119130111.761-1-ankita@nvidia.com>
 <20231119130111.761-3-ankita@nvidia.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=alex.williamson@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -5
X-Spam_score: -0.6
X-Spam_bar: /
X-Spam_report: (-0.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_SORBS_WEB=1.5, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-TUID: XQlmtWhLEIrC

On Sun, 19 Nov 2023 18:31:11 +0530
<ankita@nvidia.com> wrote:

> From: Ankit Agrawal <ankita@nvidia.com>
>=20
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
>=20
> Add GI structures while building VM ACPI SRAT. The association between
> devices and nodes are stored using acpi-generic-initiator object. Lookup
> presence of all such objects and use them to build these structures.
>=20
> The structure needs a PCI device handle [2] that consists of the device B=
DF.
> The vfio-pci device corresponding to the acpi-generic-initiator object is
> located to determine the BDF.
>=20
> [1] ACPI Spec 6.3, Section 5.2.16.6
> [2] ACPI Spec 6.3, Table 5.80
>=20
> Signed-off-by: Ankit Agrawal <ankita@nvidia.com>
> ---
>  hw/acpi/acpi-generic-initiator.c         | 100 +++++++++++++++++++++++
>  hw/arm/virt-acpi-build.c                 |   3 +
>  include/hw/acpi/acpi-generic-initiator.h |  26 ++++++
>  3 files changed, 129 insertions(+)
>=20
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
> =20
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
> +
> +        o =3D object_resolve_path_type(gi->device, TYPE_PCI_DEVICE, NULL=
);
> +        if (!o) {
> +            error_printf("Specified device must be a PCI device.\n");
> +            g_assert(o);
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

No such option, -nodelist?

> +            g_assert(node_specified);

I won't claim expertise in QEMU error handling, but an assert is a
pretty harsh way to handle failures.  Thanks,

Alex


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
> =20
>  #define ARM_SPI_BASE 32
> =20
> @@ -558,6 +559,8 @@ build_srat(GArray *table_data, BIOSLinker *linker, Vi=
rtMachineState *vms)
>          }
>      }
> =20
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
> =20
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

