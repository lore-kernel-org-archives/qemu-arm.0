Received: by 2002:ac2:5f6a:0:0:0:0:0 with SMTP id c10csp345005lfc;
        Thu, 21 Oct 2021 06:48:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxYs+Qrtbtzz2kL+MRjB+9xC7MaTiWlGpMOW+NC3GL0wlTP9+EaiOCcKc8mpJ1Ti8f9NhIE
X-Received: by 2002:a05:6808:218a:: with SMTP id be10mr5048968oib.115.1634824109377;
        Thu, 21 Oct 2021 06:48:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1634824109; cv=none;
        d=google.com; s=arc-20160816;
        b=FsDCBZpUxlp5zCFg7hCDnVOelVlC20HaM+6NPQefyPlUyff4PcprVQj3HIQTi6bPk5
         BZ/h91ZsU5Yb5yzRBXx8c1vuKQURdvV17tC5xdhx6KgnsyhZASeyJs3R0WRw2HGYy/0i
         th7gTRFUtxo06mUR76n3W2PlgcEpfoRsFXCiOqX4tSODDB+i3f3KI2FHZUjWFL6hbpFs
         ogkmus+3wFHukTPDFDXU5VhZhim72h3XkjnSC4QTUkvqX+NFyBZv0AE+fv4yAR8GzTVe
         0F4yCck5ksiwbwR8lbJsGGDU7/RKHJPp0R8s1/TjX6lN9ntVRnl7midMcWc12uozrLgK
         Oikg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:to:from:date
         :dkim-signature;
        bh=ErccmfExOOgV7y9zZuajekuLorIpdz8C+JOEycVOtSs=;
        b=ERrynCMH51ZNJeQkkaQYu1ttCT/D1yK66h8Yp7UNWqkZSkY8K7LVGnQLKyxlTr9DW3
         dAo0UL2ttGSIWq/UPcnb4c+qEvUwxZTRZXLjVYM2r7BepHq2M3hJacf/VH9yxDbb4LSe
         Wbx5bAu19ICPkYg+ss1SIvKkFaXazPuYNHa09Drp6ZG37Huea/6fpZSd4dWlbfY0+P1M
         QJizsBTPupM+8PFJeiDt30QV8E+gt9KjKFs08YHpWQSFRtvUh4loMN2pO2OwXwYZQ4x2
         CiEHVncPr1ztBCfLkOoRTCIw7XHPj/TVNoq13H7VAAT8Dn6GMIO97aISXofxRRi3/Miu
         2ShQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=OECfYVYE;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b1si9814948ots.298.2021.10.21.06.48.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 21 Oct 2021 06:48:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=OECfYVYE;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:56168 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mdYQm-0005Tn-Hf
	for alex.bennee@linaro.org; Thu, 21 Oct 2021 09:48:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51850)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mdYPc-00046r-Dk
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 09:47:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:36322)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mdYPa-00015T-12
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 09:47:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634824033;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ErccmfExOOgV7y9zZuajekuLorIpdz8C+JOEycVOtSs=;
 b=OECfYVYE2VZNkR3x1ERXIEyE98VxsP9P7+emV96dJsf1KE9IqZy90r3CmPP1cYHc28iHAv
 eb0uuBgPSevL83yA4HztqkdcVXPtPS7PIoMDB74TDc16hAr1kSOISwVNJxIfEd9Yhin20u
 JWyeYaqNu36S4R6XqcVr6oyK/cAGjrY=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-19-xw9012d4OSi0KrQpNEeUnA-1; Thu, 21 Oct 2021 09:47:12 -0400
X-MC-Unique: xw9012d4OSi0KrQpNEeUnA-1
Received: by mail-ed1-f70.google.com with SMTP id
 c30-20020a50f61e000000b003daf3955d5aso410358edn.4
 for <qemu-devel@nongnu.org>; Thu, 21 Oct 2021 06:47:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ErccmfExOOgV7y9zZuajekuLorIpdz8C+JOEycVOtSs=;
 b=bo2x9u+evyErmzEftUkXFy30V9n2rOC1dac2R4iZ8vh0S85sHsfYVjRB6euOq/w93v
 5oeu5uxLtpm2U/1MzUTdu+QUeeTMfjlk597JEZnYhCQZubL6e+Ah7M+TRvRoaHQLswrV
 hcZvOwzYwu+oiAR7T15ciaTPpXKMv3TgVdMmJb3F3uCtw0f/om10TGvgSlI96lVNAeRx
 /y+YrYaM8TexHReLttYCyYdRmJed1dyX6eld6IHeNW4yYeUXtGDqPFyb5eHRAzpjLiPi
 ErMH5/FVFJycyugUDDlcUSuuB5a0ZXe9kXrMhYTflm2scoArx9+ZHwlxp2WxZXENy3lA
 LRoQ==
X-Gm-Message-State: AOAM533AyUfY76ejx2kFtCKuC/ji1g2oj3va39ZjyXtiFRUxeNXseWuN
 xJcZAFCM21qSL3M6KYxoVODcifUHct4HsWyhRo8iTbpeL3bOCerhIfNnwTzDtjbByQWuBlWZB8C
 4t2nWBSn4RCUHuBE=
X-Received: by 2002:a05:6402:781:: with SMTP id
 d1mr7642468edy.313.1634824030961; 
 Thu, 21 Oct 2021 06:47:10 -0700 (PDT)
X-Received: by 2002:a05:6402:781:: with SMTP id
 d1mr7642438edy.313.1634824030745; 
 Thu, 21 Oct 2021 06:47:10 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id f12sm3124023edx.90.2021.10.21.06.47.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Oct 2021 06:47:10 -0700 (PDT)
Date: Thu, 21 Oct 2021 15:47:09 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: Re: [PATCH v5 04/12] hw/i386/pc: Allow instantiating a virtio-iommu
 device
Message-ID: <20211021154709.14da294a@redhat.com>
In-Reply-To: <20211020172745.620101-5-jean-philippe@linaro.org>
References: <20211020172745.620101-1-jean-philippe@linaro.org>
 <20211020172745.620101-5-jean-philippe@linaro.org>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, ehabkost@redhat.com, mst@redhat.com,
 jasowang@redhat.com, richard.henderson@linaro.org, qemu-devel@nongnu.org,
 peterx@redhat.com, shannon.zhaosl@gmail.com, qemu-arm@nongnu.org,
 ani@anisinha.ca, pbonzini@redhat.com, eric.auger@redhat.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: LCSNMhdjeaXV

On Wed, 20 Oct 2021 18:27:38 +0100
Jean-Philippe Brucker <jean-philippe@linaro.org> wrote:

> Allow instantiating a virtio-iommu device by adding an ACPI Virtual I/O
> Translation table (VIOT), which describes the relation between the
> virtio-iommu and the endpoints it manages.
> 
> Add a hotplug handler for virtio-iommu on x86 and set the necessary
> reserved region property. On x86, the [0xfee00000, 0xfeefffff] DMA
> region is reserved for MSIs. DMA transactions to this range either
> trigger IRQ remapping in the IOMMU or bypasses IOMMU translation.

shouldn't above be "IO remapping"?

> Although virtio-iommu does not support IRQ remapping it must be informed
> of the reserved region so that it can forward DMA transactions targeting
> this region.
> 
> Reviewed-by: Eric Auger <eric.auger@redhat.com>
> Tested-by: Eric Auger <eric.auger@redhat.com>
> Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>

Reviewed-by: Igor Mammedov <imammedo@redhat.com>
> ---
>  hw/i386/acpi-build.c | 10 +++++++++-
>  hw/i386/pc.c         | 16 +++++++++++++++-
>  hw/i386/Kconfig      |  1 +
>  3 files changed, 25 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> index ab49e799ff..3ca6cc8118 100644
> --- a/hw/i386/acpi-build.c
> +++ b/hw/i386/acpi-build.c
> @@ -68,9 +68,11 @@
>  #include "qom/qom-qobject.h"
>  #include "hw/i386/amd_iommu.h"
>  #include "hw/i386/intel_iommu.h"
> +#include "hw/virtio/virtio-iommu.h"
>  
>  #include "hw/acpi/ipmi.h"
>  #include "hw/acpi/hmat.h"
> +#include "hw/acpi/viot.h"
>  
>  /* These are used to size the ACPI tables for -M pc-i440fx-1.7 and
>   * -M pc-i440fx-2.0.  Even if the actual amount of AML generated grows
> @@ -2488,7 +2490,7 @@ void acpi_build(AcpiBuildTables *tables, MachineState *machine)
>      PCMachineState *pcms = PC_MACHINE(machine);
>      PCMachineClass *pcmc = PC_MACHINE_GET_CLASS(pcms);
>      X86MachineState *x86ms = X86_MACHINE(machine);
> -    X86IOMMUState *iommu = x86_iommu_get_default();
> +    DeviceState *iommu = pcms->iommu;
>      GArray *table_offsets;
>      unsigned facs, dsdt, rsdt, fadt;
>      AcpiPmInfo pm;
> @@ -2613,6 +2615,12 @@ void acpi_build(AcpiBuildTables *tables, MachineState *machine)
>          acpi_add_table(table_offsets, tables_blob);
>          build_dmar_q35(tables_blob, tables->linker, x86ms->oem_id,
>                         x86ms->oem_table_id);
> +    } else if (object_dynamic_cast(OBJECT(iommu), TYPE_VIRTIO_IOMMU_PCI)) {
> +        PCIDevice *pdev = PCI_DEVICE(iommu);
> +
> +        acpi_add_table(table_offsets, tables_blob);
> +        build_viot(machine, tables_blob, tables->linker, pci_get_bdf(pdev),
> +                   x86ms->oem_id, x86ms->oem_table_id);
>      }
>      if (machine->nvdimms_state->is_enabled) {
>          nvdimm_build_acpi(table_offsets, tables_blob, tables->linker,
> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
> index fcbf328e8d..f47f7866c7 100644
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
> @@ -1330,7 +1331,19 @@ static void pc_machine_device_pre_plug_cb(HotplugHandler *hotplug_dev,
>      } else if (object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_PMEM_PCI) ||
>                 object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_MEM_PCI)) {
>          pc_virtio_md_pci_pre_plug(hotplug_dev, dev, errp);
> -    } else if (object_dynamic_cast(OBJECT(dev), TYPE_X86_IOMMU_DEVICE)) {
> +    } else if (object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_IOMMU_PCI)) {
> +        /* Declare the APIC range as the reserved MSI region */
> +        char *resv_prop_str = g_strdup_printf("0xfee00000:0xfeefffff:%d",
> +                                              VIRTIO_IOMMU_RESV_MEM_T_MSI);
> +
> +        object_property_set_uint(OBJECT(dev), "len-reserved-regions", 1, errp);
> +        object_property_set_str(OBJECT(dev), "reserved-regions[0]",
> +                                resv_prop_str, errp);
> +        g_free(resv_prop_str);
> +    }
> +
> +    if (object_dynamic_cast(OBJECT(dev), TYPE_X86_IOMMU_DEVICE) ||
> +        object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_IOMMU_PCI)) {
>          PCMachineState *pcms = PC_MACHINE(hotplug_dev);
>  
>          if (pcms->iommu) {
> @@ -1394,6 +1407,7 @@ static HotplugHandler *pc_get_hotplug_handler(MachineState *machine,
>          object_dynamic_cast(OBJECT(dev), TYPE_CPU) ||
>          object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_PMEM_PCI) ||
>          object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_MEM_PCI) ||
> +        object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_IOMMU_PCI) ||
>          object_dynamic_cast(OBJECT(dev), TYPE_X86_IOMMU_DEVICE)) {
>          return HOTPLUG_HANDLER(machine);
>      }
> diff --git a/hw/i386/Kconfig b/hw/i386/Kconfig
> index 962d2c981b..d22ac4a4b9 100644
> --- a/hw/i386/Kconfig
> +++ b/hw/i386/Kconfig
> @@ -59,6 +59,7 @@ config PC_ACPI
>      select ACPI_X86
>      select ACPI_CPU_HOTPLUG
>      select ACPI_MEMORY_HOTPLUG
> +    select ACPI_VIOT
>      select SMBUS_EEPROM
>      select PFLASH_CFI01
>      depends on ACPI_SMBUS

