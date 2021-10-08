Received: by 2002:ac2:5978:0:0:0:0:0 with SMTP id h24csp2363470lfp;
        Fri, 8 Oct 2021 03:47:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzcKNkkNOVtOE4Hy/c58RuOyNwFDMA1PtRHNl7PgqPY5K2JIM2E19oscuP5B6LjhjukmB6S
X-Received: by 2002:a05:6602:490:: with SMTP id y16mr6876035iov.169.1633690053543;
        Fri, 08 Oct 2021 03:47:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1633690053; cv=none;
        d=google.com; s=arc-20160816;
        b=XbIBUdhEwim0e5FHJHBarv7+myqDwnpvXlJTnCASiqRGhhF30pJAxjtYLXCNODNFJd
         sJoLZ9pg5p27znwBes02lcsCt0RbfKv6UiKsp/tTyCsb/7YnOadviTQR1QQ3Eu0KLVqv
         J6b6kLUxWHqzo/DNF93OoHOEmlgjzViTt5oBFUaDy0SLAoFcJ0Ip0qHDcZXg7im5g/Ak
         fdPo4CG0DmLQ72IqwaPuOw5L5XAQ/6Zam5sSQNBJKaMuqt9gnFo9IAXNiuJbA/MLZume
         E3hY9o33XHYMwdGbPdTaKE61VGuzOlj3IGx4gvi4A3onUQjekBBk9SyobkB0gLoVXJVt
         T2vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=LOiGcLBeltj04P6XDFcaoN8r2OcBjm/Udb9s2rhhIBo=;
        b=nI1eMtA1kRKXIprEDtKLKkOhB5B5vLzwBQrLwg4w/Z5E9VaBk2C3deSDgijM5wAyfi
         62r75CpVe50gYN92ZbqX1RSSYcH+t20NItrLBJkfbdoQSwuH3adSPFuZhOjf2Yi2j3Bw
         D7fSqZ9ZZ/oCPLdKIYsyMSkPnreqs7Y4DqMV2VGnSyV5DFeOuz7BTw3rkMjGcW/PRHxT
         g2xK5L3luKc3/7DjALC11cJnCkcMVugOcIbTNExp6ajuedDo1DU0sLR1mOMfN9gkbSva
         CZ+TlgNARqlM1HflYC9GNkJwRW30wYmJXFk2DSDbWWQ1FktAQrV3D60pi825KVRK2mPn
         zaMA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=FIbB2xap;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p19si2570881ioj.112.2021.10.08.03.47.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 08 Oct 2021 03:47:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=FIbB2xap;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:54842 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mYnPY-0002r3-Rx
	for alex.bennee@linaro.org; Fri, 08 Oct 2021 06:47:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37722)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mYnPM-0002ow-QQ
 for qemu-arm@nongnu.org; Fri, 08 Oct 2021 06:47:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:47651)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mYnPI-0002ST-Pf
 for qemu-arm@nongnu.org; Fri, 08 Oct 2021 06:47:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633690034;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=LOiGcLBeltj04P6XDFcaoN8r2OcBjm/Udb9s2rhhIBo=;
 b=FIbB2xapebhxepk23Yf4deSbY1+CnZ63g/wWAWlIsVL+ALmCxTdMv6MYly5JX8et6vs9ka
 UjR2yFUQ08VmxYrSjmrO6x4yZEfH6mKbOFBMzlPl7Hatrqu+ClmA7ZA31aP2tnbvkWb0Hy
 hPWgSfleYdKwBxK14RMKIuzmXDquQwo=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-227-Gfdbt99LPpW3sNZANqcJMg-1; Fri, 08 Oct 2021 06:46:54 -0400
X-MC-Unique: Gfdbt99LPpW3sNZANqcJMg-1
Received: by mail-ed1-f70.google.com with SMTP id
 d11-20020a50cd4b000000b003da63711a8aso8757488edj.20
 for <qemu-arm@nongnu.org>; Fri, 08 Oct 2021 03:46:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=LOiGcLBeltj04P6XDFcaoN8r2OcBjm/Udb9s2rhhIBo=;
 b=1bxSLOmWOGjMqdpF9nbOf91KbDNXpNuzvdFFkoGmX+i5bmt6/kqmtWBSSpL6RrMuwy
 LuqkB09wNtFv56zg5hvkf8TmGYCnB0WRHCHio2kLsMhprKTXMsPH7M5BrF3RPNE11kV3
 pBIHdAPVTUz0DdHwU27+jkm88RC+AKg8P3Swn4z5AdHv7eLtrJ9JBQM09zwS/N2bZGG+
 rXdtIHMaasZztmmAmyJnLQgICSBJyiRk6YyFwDd4ll6oYZ8y/7vNTs67OYkM0f4kvbe1
 bD2zdkwWAnolOOpyZO6oRBBj2V8pK5SRC7yHG2fOqISm9pS9SwfHnM/CLsmog88Fgho4
 3O8g==
X-Gm-Message-State: AOAM531P8Wp/zQaNa/QBkCn9UdwU7qntN6t5nABI7mf4NHb57NZjgjZk
 DnPU/Jz6gFfNwOxbwi3unDxdwQjcmaCj/azjwl+pFcXrWdryrm1HP3FFEzHboBV4hwLqSKAErS0
 DHV8EVor4ZmZo
X-Received: by 2002:a17:906:a01:: with SMTP id
 w1mr3325860ejf.117.1633690013693; 
 Fri, 08 Oct 2021 03:46:53 -0700 (PDT)
X-Received: by 2002:a17:906:a01:: with SMTP id
 w1mr3325815ejf.117.1633690013324; 
 Fri, 08 Oct 2021 03:46:53 -0700 (PDT)
Received: from redhat.com ([2.55.132.170])
 by smtp.gmail.com with ESMTPSA id y22sm896960edc.76.2021.10.08.03.46.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Oct 2021 03:46:52 -0700 (PDT)
Date: Fri, 8 Oct 2021 06:46:48 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: Re: [PATCH v4 07/11] pc: Allow instantiating a virtio-iommu device
Message-ID: <20211008064559-mutt-send-email-mst@kernel.org>
References: <20211001173358.863017-1-jean-philippe@linaro.org>
 <20211001173358.863017-8-jean-philippe@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20211001173358.863017-8-jean-philippe@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -9
X-Spam_score: -1.0
X-Spam_bar: -
X-Spam_report: (-1.0 / 5.0 requ) DKIMWL_WL_HIGH=-0.05, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
 richard.henderson@linaro.org, qemu-devel@nongnu.org, eric.auger@redhat.com,
 qemu-arm@nongnu.org, marcel.apfelbaum@gmail.com, imammedo@redhat.com,
 ani@anisinha.ca, pbonzini@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: IeqqrpStvfHW

On Fri, Oct 01, 2021 at 06:33:55PM +0100, Jean-Philippe Brucker wrote:
> Allow instantiating a virtio-iommu device by adding an ACPI Virtual I/O
> Translation table (VIOT), which describes the relation between the
> virtio-iommu and the endpoints it manages.
> 
> Add a hotplug handler for virtio-iommu on x86 and set the necessary
> reserved region property. On x86, the [0xfee00000, 0xfeefffff] DMA
> region is reserved for MSIs. DMA transactions to this range either
> trigger IRQ remapping in the IOMMU or bypasses IOMMU translation.
> 
> Although virtio-iommu does not support IRQ remapping it must be informed
> of the reserved region so that it can forward DMA transactions targeting
> this region.
> 
> Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>

If you like, we can start by merging the pc bits when they are ready.
These are not widely used so have less of a chance to break someone's
setup.

> ---
>  include/hw/i386/pc.h |  2 ++
>  hw/i386/acpi-build.c |  5 +++++
>  hw/i386/pc.c         | 24 ++++++++++++++++++++++--
>  hw/i386/Kconfig      |  1 +
>  4 files changed, 30 insertions(+), 2 deletions(-)
> 
> diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
> index 82cf7b7e30..f3ba1ee4c0 100644
> --- a/include/hw/i386/pc.h
> +++ b/include/hw/i386/pc.h
> @@ -45,6 +45,8 @@ typedef struct PCMachineState {
>      bool pit_enabled;
>      bool hpet_enabled;
>      bool default_bus_bypass_iommu;
> +    bool virtio_iommu;
> +    uint16_t virtio_iommu_bdf;
>      uint64_t max_fw_size;
>  
>      /* ACPI Memory hotplug IO base address */
> diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> index d1c28440f4..4e46585709 100644
> --- a/hw/i386/acpi-build.c
> +++ b/hw/i386/acpi-build.c
> @@ -71,6 +71,7 @@
>  
>  #include "hw/acpi/ipmi.h"
>  #include "hw/acpi/hmat.h"
> +#include "hw/acpi/viot.h"
>  
>  /* These are used to size the ACPI tables for -M pc-i440fx-1.7 and
>   * -M pc-i440fx-2.0.  Even if the actual amount of AML generated grows
> @@ -2593,6 +2594,10 @@ void acpi_build(AcpiBuildTables *tables, MachineState *machine)
>              build_dmar_q35(tables_blob, tables->linker, x86ms->oem_id,
>                             x86ms->oem_table_id);
>          }
> +    } else if (pcms->virtio_iommu) {
> +        acpi_add_table(table_offsets, tables_blob);
> +        build_viot(machine, tables_blob, tables->linker, pcms->virtio_iommu_bdf,
> +                   x86ms->oem_id, x86ms->oem_table_id);
>      }
>      if (machine->nvdimms_state->is_enabled) {
>          nvdimm_build_acpi(table_offsets, tables_blob, tables->linker,
> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
> index 789ccb6ef4..31710bc4fb 100644
> --- a/hw/i386/pc.c
> +++ b/hw/i386/pc.c
> @@ -83,6 +83,7 @@
>  #include "hw/i386/intel_iommu.h"
>  #include "hw/net/ne2000-isa.h"
>  #include "standard-headers/asm-x86/bootparam.h"
> +#include "hw/virtio/virtio-iommu.h"
>  #include "hw/virtio/virtio-pmem-pci.h"
>  #include "hw/virtio/virtio-mem-pci.h"
>  #include "hw/mem/memory-device.h"
> @@ -1367,8 +1368,11 @@ static void pc_virtio_md_pci_unplug(HotplugHandler *hotplug_dev,
>  static void pc_machine_device_pre_plug_cb(HotplugHandler *hotplug_dev,
>                                            DeviceState *dev, Error **errp)
>  {
> -    if (object_dynamic_cast(OBJECT(dev), TYPE_X86_IOMMU_DEVICE) &&
> -        x86_iommu_get_default()) {
> +    PCMachineState *pcms = PC_MACHINE(hotplug_dev);
> +
> +    if ((object_dynamic_cast(OBJECT(dev), TYPE_X86_IOMMU_DEVICE) ||
> +         object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_IOMMU_PCI)) &&
> +        (x86_iommu_get_default() || pcms->virtio_iommu)) {
>          error_setg(errp, "QEMU does not support multiple vIOMMUs "
>                     "for x86 yet.");
>          return;
> @@ -1381,6 +1385,15 @@ static void pc_machine_device_pre_plug_cb(HotplugHandler *hotplug_dev,
>      } else if (object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_PMEM_PCI) ||
>                 object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_MEM_PCI)) {
>          pc_virtio_md_pci_pre_plug(hotplug_dev, dev, errp);
> +    } else if (object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_IOMMU_PCI)) {
> +        /* Declare the APIC range as the reserved MSI region */
> +        char *resv_prop_str = g_strdup_printf("0xfee00000:0xfeefffff:%d",
> +                                              VIRTIO_IOMMU_RESV_MEM_T_MSI);
> +
> +        object_property_set_uint(OBJECT(dev), "len-reserved-regions", 1, errp);
> +        object_property_set_str(OBJECT(dev), "reserved-regions[0]",
> +                                resv_prop_str, errp);
> +        g_free(resv_prop_str);
>      }
>  }
>  
> @@ -1394,6 +1407,12 @@ static void pc_machine_device_plug_cb(HotplugHandler *hotplug_dev,
>      } else if (object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_PMEM_PCI) ||
>                 object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_MEM_PCI)) {
>          pc_virtio_md_pci_plug(hotplug_dev, dev, errp);
> +    } else if (object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_IOMMU_PCI)) {
> +        PCMachineState *pcms = PC_MACHINE(hotplug_dev);
> +        PCIDevice *pdev = PCI_DEVICE(dev);
> +
> +        pcms->virtio_iommu = true;
> +        pcms->virtio_iommu_bdf = pci_get_bdf(pdev);
>      }
>  }
>  
> @@ -1436,6 +1455,7 @@ static HotplugHandler *pc_get_hotplug_handler(MachineState *machine,
>          object_dynamic_cast(OBJECT(dev), TYPE_CPU) ||
>          object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_PMEM_PCI) ||
>          object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_MEM_PCI) ||
> +        object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_IOMMU_PCI) ||
>          object_dynamic_cast(OBJECT(dev), TYPE_X86_IOMMU_DEVICE)) {
>          return HOTPLUG_HANDLER(machine);
>      }
> diff --git a/hw/i386/Kconfig b/hw/i386/Kconfig
> index ddedcef0b2..13db05d557 100644
> --- a/hw/i386/Kconfig
> +++ b/hw/i386/Kconfig
> @@ -54,6 +54,7 @@ config PC_ACPI
>      select ACPI_X86
>      select ACPI_CPU_HOTPLUG
>      select ACPI_MEMORY_HOTPLUG
> +    select ACPI_VIOT
>      select SMBUS_EEPROM
>      select PFLASH_CFI01
>      depends on ACPI_SMBUS
> -- 
> 2.33.0

