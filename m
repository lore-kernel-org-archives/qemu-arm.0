Received: by 2002:ac2:5978:0:0:0:0:0 with SMTP id h24csp1854359lfp;
        Mon, 20 Sep 2021 01:06:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJycxVFsZ2AePY6A1X0fSOJROfKE3B7KPxTXLxOFOHVfpkDlKa3OcJtpEApksMcj0hE23HuT
X-Received: by 2002:a25:1584:: with SMTP id 126mr30744500ybv.126.1632125214792;
        Mon, 20 Sep 2021 01:06:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1632125214; cv=none;
        d=google.com; s=arc-20160816;
        b=qY4P5a1HjbsKbSybK+P9bm2EB6Cul/jTLStgQ6w83tJqvp+h2RW6tIaoP/bDChY7eU
         mozUggRxotiXmRJyitDxTFT24A4pUr48tMNL7QDfWkgaZQtGS0xL4zAJ/WJqP8I+oIn7
         DciwpfMQVQEJ7NdPLxH2E4FV5c/fEcaO2DCeW6YHtNoOp5VC0EN/EKCi0oomNY6lOWGN
         eFAzr22DUYR9//PW5fBt41eRCcdyvUQvxGz61NA/GtXirU2JAnKYSE4txrMU98Nal7sd
         wabF3soT7OF16OaETu4Qv1IW2fiiigQ2++dFxVzTeSP6eD7V63sfLNgE7sEMk9EmuCBz
         FK4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:to:from:date
         :dkim-signature;
        bh=qFQ+ncOgAHbhSL7R4A2+R0najQGxzs7uOrshfM0Nf/o=;
        b=zJJpi1emLrijfVRSY3iLP4WMb2RL0Y0g4REwG6ow9AtF9zlaYWSRcvAJ17SKvD4/mw
         suRIb0NhCbhfk3Krtd2xmLKhXivoQXi/z/T7OS82CnnXiACLU17bnoCbql7TRW0R9bfC
         X4h3bearYVCE4NN8tgvgiSK0c5cnt2kGHK6LueyzF+bf80Wgu0xkQ904zB+T2UUMOMO6
         zjojneycn5x0W2z39Bc72Oek9jkj1yjk+LhSq0ECKUP7yBFC5kV6lUOQmwqaR7C1S1Dr
         H4njnrI8aTUeA/hR+F2NUBCw3lx4GmIW1hQAcHFM2sXSudxar2exu4qPlBb64zevQWse
         EoOw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=dEyyw8Pr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b203si14480006ybc.505.2021.09.20.01.06.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 Sep 2021 01:06:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=dEyyw8Pr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:37220 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mSEKD-0001B8-4a
	for alex.bennee@linaro.org; Mon, 20 Sep 2021 04:06:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48144)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mSEJh-0001A4-MB
 for qemu-arm@nongnu.org; Mon, 20 Sep 2021 04:06:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43481)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mSEJd-00010Y-Bi
 for qemu-arm@nongnu.org; Mon, 20 Sep 2021 04:06:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632125175;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qFQ+ncOgAHbhSL7R4A2+R0najQGxzs7uOrshfM0Nf/o=;
 b=dEyyw8PrCizooDMzNEIc5No4NmaZ7D9hNQ0Z+Ed7zGXIF2UZWxNApnAY7HMtqWDzJKflGI
 RW4Q/1bjrqIGKG9PJR1t0jBAoWT3rrTm1SkqxNH60oqVHHmll0K+U5B228/UmLbXRfhRMV
 AM/0vSfWlSP0fTQTRBSKeUJenZ38+UQ=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-101-JPnrdX_GME-7KGLxQ5Yo9g-1; Mon, 20 Sep 2021 04:06:13 -0400
X-MC-Unique: JPnrdX_GME-7KGLxQ5Yo9g-1
Received: by mail-ed1-f71.google.com with SMTP id
 o23-20020a509b17000000b003d739e2931dso13193261edi.4
 for <qemu-arm@nongnu.org>; Mon, 20 Sep 2021 01:06:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qFQ+ncOgAHbhSL7R4A2+R0najQGxzs7uOrshfM0Nf/o=;
 b=xSlAONXz3jsegLithpc788RwtRz4pBvYMpzHEpqVacgJiYBNiu1N+iUcwshqbWU4zR
 edq03+uai0AA907KsGSg/BeW2LImKsNpz0qnAoMmohTCFOCYkk5GD8BHELarxUKXQRN6
 jwyaMVCPn2t9LmqspintLjlE3Z/s9NTv4m+SD3ofj9uANJ+RESD+M/1EHXAXI51Trfez
 SNhXYH3Ukg7HKErHAe1ebPAq69Z5gMREpussTjvLmbXgP16SbD18x/RA8ztOZuC5bTeL
 BHGQ452oo8N5dek9nMCGWsE1IrpB3GOYBn4K5uCSS4JBID5rqKeU539U6ehwy3AKfjxy
 OGJg==
X-Gm-Message-State: AOAM5335vfoadxR5Bhq9JRBlY18W6UVJuIjFG5T+XelFmrHBeI68Zz5k
 ljPpy3P2HC9EDqzys8H+ICS1nohlLZqMRu17shjfrLo6QAm0lV+wEtTBc4KlHQCAdoVNnZegQcf
 aCv8tpSla6RYj
X-Received: by 2002:a17:906:8608:: with SMTP id
 o8mr27005017ejx.470.1632125171790; 
 Mon, 20 Sep 2021 01:06:11 -0700 (PDT)
X-Received: by 2002:a17:906:8608:: with SMTP id
 o8mr27004993ejx.470.1632125171446; 
 Mon, 20 Sep 2021 01:06:11 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id l11sm6576907edv.67.2021.09.20.01.06.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Sep 2021 01:06:10 -0700 (PDT)
Date: Mon, 20 Sep 2021 10:06:09 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: Re: [PATCH v3 01/10] hw/acpi: Add VIOT table
Message-ID: <20210920100609.301b6be2@redhat.com>
In-Reply-To: <20210914142004.2433568-2-jean-philippe@linaro.org>
References: <20210914142004.2433568-1-jean-philippe@linaro.org>
 <20210914142004.2433568-2-jean-philippe@linaro.org>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.476,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, ehabkost@redhat.com, shannon.zhaosl@gmail.com,
 mst@redhat.com, richard.henderson@linaro.org, qemu-devel@nongnu.org,
 eric.auger@redhat.com, qemu-arm@nongnu.org, marcel.apfelbaum@gmail.com,
 ani@anisinha.ca, pbonzini@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: HUT4DFH/T6Lp

On Tue, 14 Sep 2021 15:19:56 +0100
Jean-Philippe Brucker <jean-philippe@linaro.org> wrote:

> Add a function that generates a Virtual I/O Translation table (VIOT),
> describing the topology of paravirtual IOMMUs. The table is created when
> instantiating a virtio-iommu device. It contains a virtio-iommu node and
> PCI Range nodes for endpoints managed by the IOMMU. By default, a single
> node describes all PCI devices. When passing the "default_bus_bypass_iommu"
> machine option and "bypass_iommu" PXB option, only buses that do not
> bypass the IOMMU are described by PCI Range nodes.
> 
> Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> ---
> Sizes and types are hardcoded because it will now be the default style
> https://lore.kernel.org/qemu-devel/20210708154617.1538485-1-imammedo@redhat.com/
> ---
>  hw/acpi/viot.h      |  13 +++++
>  hw/acpi/viot.c      | 112 ++++++++++++++++++++++++++++++++++++++++++++
>  hw/acpi/Kconfig     |   4 ++
>  hw/acpi/meson.build |   1 +
>  4 files changed, 130 insertions(+)
>  create mode 100644 hw/acpi/viot.h
>  create mode 100644 hw/acpi/viot.c
> 
> diff --git a/hw/acpi/viot.h b/hw/acpi/viot.h
> new file mode 100644
> index 0000000000..4cef29a640
> --- /dev/null
> +++ b/hw/acpi/viot.h
> @@ -0,0 +1,13 @@
> +/*
> + * ACPI Virtual I/O Translation Table implementation
> + *
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + */
> +#ifndef VIOT_H
> +#define VIOT_H
> +
> +void build_viot(GArray *table_data, BIOSLinker *linker,
> +                uint16_t virtio_iommu_bdf, const char *oem_id,
> +                const char *oem_table_id);
> +
> +#endif /* VIOT_H */
> diff --git a/hw/acpi/viot.c b/hw/acpi/viot.c
> new file mode 100644
> index 0000000000..e7f7605119
> --- /dev/null
> +++ b/hw/acpi/viot.c
> @@ -0,0 +1,112 @@
> +/*
> + * ACPI Virtual I/O Translation table implementation
> + *
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + */
> +#include "qemu/osdep.h"
> +#include "hw/acpi/acpi.h"
> +#include "hw/acpi/aml-build.h"
> +#include "hw/acpi/viot.h"
> +#include "hw/pci/pci.h"
> +#include "hw/pci/pci_host.h"
> +
> +struct viot_pci_ranges {
> +    GArray *blob;
> +    size_t count;
> +    uint16_t output_node;
> +};
> +
> +/* Build PCI range for a given PCI host bridge */
> +static int viot_host_bridges(Object *obj, void *opaque)
> +{
> +    struct viot_pci_ranges *pci_ranges = opaque;
> +    GArray *blob = pci_ranges->blob;
> +
> +    if (object_dynamic_cast(obj, TYPE_PCI_HOST_BRIDGE)) {
> +        PCIBus *bus = PCI_HOST_BRIDGE(obj)->bus;
> +
> +        if (bus && !pci_bus_bypass_iommu(bus)) {
> +            int min_bus, max_bus;
> +
> +            pci_bus_range(bus, &min_bus, &max_bus);
> +
> +            /* Type (PCI range) */
> +            build_append_int_noprefix(blob, 1, 1);
> +            /* Reserved */
> +            build_append_int_noprefix(blob, 0, 1);
> +            /* Length */
> +            build_append_int_noprefix(blob, 24, 2);
> +            /* Endpoint start */
> +            build_append_int_noprefix(blob, PCI_BUILD_BDF(min_bus, 0), 4);
> +            /* PCI Segment start */
> +            build_append_int_noprefix(blob, 0, 2);
> +            /* PCI Segment end */
> +            build_append_int_noprefix(blob, 0, 2);
> +            /* PCI BDF start */
> +            build_append_int_noprefix(blob, PCI_BUILD_BDF(min_bus, 0), 2);
> +            /* PCI BDF end */
> +            build_append_int_noprefix(blob, PCI_BUILD_BDF(max_bus, 0xff), 2);
> +            /* Output node */
> +            build_append_int_noprefix(blob, pci_ranges->output_node, 2);
> +            /* Reserved */
> +            build_append_int_noprefix(blob, 0, 6);
> +
> +            pci_ranges->count++;
> +        }
> +    }
> +
> +    return 0;
> +}
> +
> +/*
> + * Generate a VIOT table with one PCI-based virtio-iommu that manages PCI
> + * endpoints.

We usually put a pointer to spec/revision and chapter in it
that describes being implemented table, so reviewer would
have a reference to compare code with. Otherwise I have no
idea if implementation is correct or not.

ex: build_hmat_mpda

the same applies to viot_host_bridges

> + */
> +void build_viot(GArray *table_data, BIOSLinker *linker,
> +                uint16_t virtio_iommu_bdf, const char *oem_id,
> +                const char *oem_table_id)
> +{
> +    /* The virtio-iommu node follows the 48-bytes header */
> +    int viommu_off = 48;
> +    AcpiTable table = { .sig = "VIOT", .rev = 0,
> +                        .oem_id = oem_id, .oem_table_id = oem_table_id };
> +    struct viot_pci_ranges pci_ranges = {
> +        .output_node = viommu_off,
> +        .blob = g_array_new(false, true, 1),
> +    };
> +
> +    /* Build the list of PCI ranges that this viommu manages */
> +    object_child_foreach_recursive(object_get_root(), viot_host_bridges,
> +                                   &pci_ranges);
> +
> +    /* ACPI table header */
> +    acpi_table_begin(&table, table_data);
> +    /* Node count */
> +    build_append_int_noprefix(table_data, pci_ranges.count + 1, 2);
> +    /* Node offset */
> +    build_append_int_noprefix(table_data, viommu_off, 2);
> +    /* Reserved */
> +    build_append_int_noprefix(table_data, 0, 8);
> +
> +    /* Virtio-iommu node */
> +    /* Type (virtio-pci IOMMU)  */
> +    build_append_int_noprefix(table_data, 3, 1);
> +    /* Reserved */
> +    build_append_int_noprefix(table_data, 0, 1);
> +    /* Length */
> +    build_append_int_noprefix(table_data, 16, 2);
> +    /* PCI Segment */
> +    build_append_int_noprefix(table_data, 0, 2);
> +    /* PCI BDF number */
> +    build_append_int_noprefix(table_data, virtio_iommu_bdf, 2);
> +    /* Reserved */
> +    build_append_int_noprefix(table_data, 0, 8);
> +
> +    /* PCI ranges found above */
> +    g_array_append_vals(table_data, pci_ranges.blob->data,
> +                        pci_ranges.blob->len);
> +    g_array_free(pci_ranges.blob, true);
> +
> +    acpi_table_end(linker, &table);
> +}
> +
> diff --git a/hw/acpi/Kconfig b/hw/acpi/Kconfig
> index 3b5e118c54..622b0b50b7 100644
> --- a/hw/acpi/Kconfig
> +++ b/hw/acpi/Kconfig
> @@ -51,6 +51,10 @@ config ACPI_VMGENID
>      default y
>      depends on PC
>  
> +config ACPI_VIOT
> +    bool
> +    depends on ACPI
> +
>  config ACPI_HW_REDUCED
>      bool
>      select ACPI
> diff --git a/hw/acpi/meson.build b/hw/acpi/meson.build
> index 7d8c0eb43e..adf6347bc4 100644
> --- a/hw/acpi/meson.build
> +++ b/hw/acpi/meson.build
> @@ -20,6 +20,7 @@ acpi_ss.add(when: 'CONFIG_ACPI_APEI', if_true: files('ghes.c'), if_false: files(
>  acpi_ss.add(when: 'CONFIG_ACPI_PIIX4', if_true: files('piix4.c'))
>  acpi_ss.add(when: 'CONFIG_ACPI_PCIHP', if_true: files('pcihp.c'))
>  acpi_ss.add(when: 'CONFIG_ACPI_PCIHP', if_false: files('acpi-pci-hotplug-stub.c'))
> +acpi_ss.add(when: 'CONFIG_ACPI_VIOT', if_true: files('viot.c'))
>  acpi_ss.add(when: 'CONFIG_ACPI_X86_ICH', if_true: files('ich9.c', 'tco.c'))
>  acpi_ss.add(when: 'CONFIG_IPMI', if_true: files('ipmi.c'), if_false: files('ipmi-stub.c'))
>  acpi_ss.add(when: 'CONFIG_PC', if_false: files('acpi-x86-stub.c'))

