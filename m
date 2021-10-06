Received: by 2002:ac2:5978:0:0:0:0:0 with SMTP id h24csp58601lfp;
        Wed, 6 Oct 2021 01:16:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzfw/X9IbS/fwxk2ED4IHzEyW5zSG9rA3zquTfid3zpMN2TgtOWz0tnZbcTUEYfAIChsQ1P
X-Received: by 2002:a25:3212:: with SMTP id y18mr23830304yby.308.1633508173608;
        Wed, 06 Oct 2021 01:16:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1633508173; cv=none;
        d=google.com; s=arc-20160816;
        b=x2h4WOYR7gwZz1piqnXKGxSb556ItSBXoXVBX4BoiGy1c9e9o3h3wGAyr40ndN0FkP
         o5hhHcoJl4wX53VOhk7W1FsiHVe0NUfFYXCgp+/XzKPAA321xXG9Z/XLbPuSp+nLaUYW
         LVy+GEH3re4xvkmki+2bQOS6QjxisSCeBzMn132kLrAALoY/rFJ/PGiS+O/XNJrLbRy7
         8lhqRf70fvLrezI13a4/2da9QtbzyHLaDYQa1LRkZmiJH2DrqW5qibYRqopGV0FRNTEm
         c8JEvRt5pljc2iB3qv+UPL3ZgPKL4fGjOIlgc5yc87tNyS/dr+py9h84Xvp/BEJj3otk
         LbNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:to:from:date
         :dkim-signature;
        bh=/wGePxJjKsTF83i15XAt8Kjg3a+B/IS9Hw6Z8RvGlxk=;
        b=rppjUt5SziuVtNJnpCqAckV64ixCkWa7pwcQYK8EVTWKDkYItmvd2dPMhvqFbtxWF6
         Qw+1ZT3eUZckhBiTjDBmaRa2LHUFJjEXztdzswBmAcCuO83D4pm2gNuep8zj6u0pIVFZ
         baj3RjaNt1ojG85/cOgIUfUNi4fVCpIsyTW50gfTqicBswcVAjyUySDGBH3PzaXErxSd
         5PYNSpvjisCebVwpLBozwuAVQxlNOh4WxwdvyxiwCSlVcvhyq9Fl+4eAPynYEJmodHWl
         j3K9kCVQ9cKqOvTicORvhW0vIZUzugHBAixfxVdRRtEdzTQ3fTwH0dhLGW+WS3OHAVs9
         cZqg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=ApP+dpib;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i9si24033578ybi.131.2021.10.06.01.16.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 06 Oct 2021 01:16:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=ApP+dpib;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:39660 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mY260-0001MD-US
	for alex.bennee@linaro.org; Wed, 06 Oct 2021 04:16:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54806)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mY1zx-0004Cv-F0
 for qemu-arm@nongnu.org; Wed, 06 Oct 2021 04:09:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20048)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mY1zv-0007zF-C9
 for qemu-arm@nongnu.org; Wed, 06 Oct 2021 04:09:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633507794;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/wGePxJjKsTF83i15XAt8Kjg3a+B/IS9Hw6Z8RvGlxk=;
 b=ApP+dpibT9GoU7WZbZAC0OMTZU636ULhWIIRYQCUH+wxHN5XuLgS2+cl0NjVDBUuA/3QK1
 seI/o81ENagHRYxzYGDDsS6fk2Rzjq39OtNZotEGYtgOQIat66ZgmrJ1iDCDgW/hO1jZ3K
 lRofvcTzfVt7II4zuqunZXdAcBCA59E=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-260-dOpse-j3OFWW_VTqrYSdaA-1; Wed, 06 Oct 2021 04:09:53 -0400
X-MC-Unique: dOpse-j3OFWW_VTqrYSdaA-1
Received: by mail-wr1-f71.google.com with SMTP id
 75-20020adf82d1000000b00160cbb0f800so569839wrc.22
 for <qemu-arm@nongnu.org>; Wed, 06 Oct 2021 01:09:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/wGePxJjKsTF83i15XAt8Kjg3a+B/IS9Hw6Z8RvGlxk=;
 b=PonIUZ36YxFgW5F8zZWoWBVRHtz/WWJ2uTCTs1eGqqT7DpeoAXy1J7PnoO4CvmsINZ
 VYEQaodW2Wa4YHn8uh+Jq/KrtwKIhNuFytrSZLbtm8vwgQ7JiAyTbFw6uI6zf4HqWKjM
 8rxsWEx0QNaIxQ6jrgL2DR4WXT9whoEg+Mn02dmNSlqQvgVz4Lq/t+e3s4Pupf67vzjM
 smNW1g9ko2F8UEF4Yuz6qoIQM+KWYR3xxHoZLKTgd3YF2OosFQqb4h+OQLrJG0aFoa/m
 ihw7ptdNt7HKFzIMXTc1FuHsqsY2k1+MX45CbD2UStEv6V/gGqutkQzae1Zadoa+ulkE
 7ORw==
X-Gm-Message-State: AOAM532PFT8Kab2+zS6L6hUROb6fg364JFvu1eQzZN/8n3kjelXj1WnT
 8O3GMmgCXeOA9ei/bUgKOu3CDkAr+rFY9bqky6UnU4K8HdUbfAHDbuR4smdgtthsFq5a0ndA45o
 Atwgh91JFhAvm
X-Received: by 2002:a05:600c:1c07:: with SMTP id
 j7mr8447712wms.28.1633507792207; 
 Wed, 06 Oct 2021 01:09:52 -0700 (PDT)
X-Received: by 2002:a05:600c:1c07:: with SMTP id
 j7mr8447692wms.28.1633507791938; 
 Wed, 06 Oct 2021 01:09:51 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id n186sm4482859wme.31.2021.10.06.01.09.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Oct 2021 01:09:51 -0700 (PDT)
Date: Wed, 6 Oct 2021 10:09:50 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: Re: [PATCH v4 01/11] hw/acpi: Add VIOT table
Message-ID: <20211006100950.12798a07@redhat.com>
In-Reply-To: <20211001173358.863017-2-jean-philippe@linaro.org>
References: <20211001173358.863017-1-jean-philippe@linaro.org>
 <20211001173358.863017-2-jean-philippe@linaro.org>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.066,
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
Cc: peter.maydell@linaro.org, Cornelia Huck <cohuck@redhat.com>,
 ehabkost@redhat.com, shannon.zhaosl@gmail.com, mst@redhat.com,
 richard.henderson@linaro.org, qemu-devel@nongnu.org, eric.auger@redhat.com,
 qemu-arm@nongnu.org, marcel.apfelbaum@gmail.com, ani@anisinha.ca,
 pbonzini@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: q+ne+kx3UOee

On Fri,  1 Oct 2021 18:33:49 +0100
Jean-Philippe Brucker <jean-philippe@linaro.org> wrote:

> Add a function that generates a Virtual I/O Translation table (VIOT),
> describing the topology of paravirtual IOMMUs. The table is created when
> instantiating a virtio-iommu device. It contains a virtio-iommu node and

perhaps
s/when instantiating ... ./if a virtio-iommu device present/

> PCI Range nodes for endpoints managed by the IOMMU. By default, a single
> node describes all PCI devices. When passing the "default_bus_bypass_iommu"
> machine option and "bypass_iommu" PXB option, only buses that do not
> bypass the IOMMU are described by PCI Range nodes.


modulo comments, patch looks fine to me from ACPI point of view.

but I don't know if values used for describing PCI structures
make any sense so this might need an ACK from a person who knows
PCI innards better.

> Reviewed-by: Eric Auger <eric.auger@redhat.com>
> Tested-by: Eric Auger <eric.auger@redhat.com>
> Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
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
> index 0000000000..9fe565bb87
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
> +void build_viot(MachineState *ms, GArray *table_data, BIOSLinker *linker,
> +                uint16_t virtio_iommu_bdf, const char *oem_id,
> +                const char *oem_table_id);
> +
> +#endif /* VIOT_H */
> diff --git a/hw/acpi/viot.c b/hw/acpi/viot.c
> new file mode 100644
> index 0000000000..e33d468e11
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
> +static int build_pci_range_node(Object *obj, void *opaque)
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
see [1] below

> +            build_append_int_noprefix(blob, 1, 1);
> +            /* Reserved */
> +            build_append_int_noprefix(blob, 0, 1);
> +            /* Length */
> +            build_append_int_noprefix(blob, 24, 2);

spec should be fixed to state length value for fixed length structures
like it's done in ACPI specs, I who we should poke at to make this happen.

zzzz
> +            /* Endpoint start */
> +            build_append_int_noprefix(blob, PCI_BUILD_BDF(min_bus, 0), 4);
> +            /* PCI Segment start */
> +            build_append_int_noprefix(blob, 0, 2);
> +            /* PCI Segment end */
> +            build_append_int_noprefix(blob, 0, 2);
zzzz
see comment [2]

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
> + */

this comment needs to state spec name/version, otherwise it's not clear
what code below is based on (example: build_dmar_q35).

Also since there is no final spec yet and spec doesn't have permanent
hosting place (i.e. hosted by one of specs org), I'd consider
link in cover letter 'dead' and not suitable for long term use.
So we should shovel spec docs/specs and point to it in this comment

> +void build_viot(MachineState *ms, GArray *table_data, BIOSLinker *linker,
> +                uint16_t virtio_iommu_bdf, const char *oem_id,
> +                const char *oem_table_id)
> +{
> +    /* The virtio-iommu node follows the 48-bytes header */
> +    int viommu_off = 48;
> +    AcpiTable table = { .sig = "VIOT", .rev = 0,
> +                        .oem_id = oem_id, .oem_table_id = oem_table_id };
> +    struct viot_pci_ranges pci_ranges = {
> +        .output_node = viommu_off,
> +        .blob = g_array_new(false, true /* clear */, 1),
> +    };
> +
> +    /* Build the list of PCI ranges that this viommu manages */
> +    object_child_foreach_recursive(OBJECT(ms), build_pci_range_node,
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

(1)
/* Type */
> +    build_append_int_noprefix(table_data, 3, 1);
  s:3,:3 /* virtio-pci IOMMU */,:

check-patch will spit out warning but that kind comment
is common practice with ACPI code

> +    /* Reserved */
> +    build_append_int_noprefix(table_data, 0, 1);
> +    /* Length */
> +    build_append_int_noprefix(table_data, 16, 2);
> +    /* PCI Segment */
> +    build_append_int_noprefix(table_data, 0, 2);
(2)
can we fetch _SEG value from device instead of hard-codding value here?

I might be obvious to PCI folks,
but it would be better have at least a comment explaining
where these values come from

Michael,
what do you think?

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

