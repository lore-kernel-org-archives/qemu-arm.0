Received: by 2002:ac2:5978:0:0:0:0:0 with SMTP id h24csp22834lfp;
        Wed, 6 Oct 2021 00:20:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxLUIhl9gQbPpiu5wVLKTTmGXwTwcQso/JTxW1r5vTMGgDfVIAMbt6VcN2x5RPwTZlQNhz5
X-Received: by 2002:a5e:c701:: with SMTP id f1mr5209278iop.185.1633504830923;
        Wed, 06 Oct 2021 00:20:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1633504830; cv=none;
        d=google.com; s=arc-20160816;
        b=jBmzOz9G793Kpm1rXZ+vkesNSeRx2Lyth0pTYcR9gJ06R3AhvHirAq8iNZNw5DIXJy
         TnXwAsnRXJ+ovv6p51j15DN/06XK2DeQ6gmisOz62qEjltVO4joblR7H/HT+IxAotUtM
         MR6zQQHMGYeXgi06AuS6Ok3lMk9jdSJjUMXZZUr55Td1ga063YOoHfvROBphwch2sCSF
         O5FBCL32p3CMMO04WR6y85Nzr2Oo/sx4flUucdYALZcltIYxJsrwTmfXVZ63AkJiL8u/
         s1OaBYVFHnGIcVSqZIqy7+6LzpvSkW8/cSxCQKnpr/dLDBVQU6/Co19HvfGRdkr0aPg2
         RYIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:to:from:date
         :dkim-signature;
        bh=6ZZ2h0iPrzfJBHIpihTgNbWuUDfm3yIdfpScTfpp7G4=;
        b=HqQYQwCWaPQMtwsV1Wm8yM0zyp63WSuDZ8PkQUNJggfiGAEOyGlz48KrVRrgL5vWmi
         cM8C21oJwqCUS6cJapYrgtAzuijHIl9oSMaRWphrRJzTtpihLXsiIi8RFw6Hmsf8vVQE
         OaRentDlHP4uu3E69tCFCWDGAzvKQ7MpZwZyEH9fLP71C9L1yixxzaS5Ab60WVucmGqr
         J50FFzzzEBs9bIozF64/2xI5VoKB6RL+zdTomOazwMSqkUid0iluKj7rMDCiH8sX6g7X
         Hwc76C94pLui2p2d3dVRJu51QlCQDxLFAvtnQCSJvYZygtO/qBEOHx6mQekneEGF0olc
         3XCg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Pff1LMAn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w62si6141630jaw.68.2021.10.06.00.20.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 06 Oct 2021 00:20:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Pff1LMAn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:38704 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mY1E6-0004i1-5E
	for alex.bennee@linaro.org; Wed, 06 Oct 2021 03:20:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44548)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mY1De-0004hh-Lt
 for qemu-arm@nongnu.org; Wed, 06 Oct 2021 03:20:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46763)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mY1Db-0001W7-Sr
 for qemu-arm@nongnu.org; Wed, 06 Oct 2021 03:20:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633504798;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6ZZ2h0iPrzfJBHIpihTgNbWuUDfm3yIdfpScTfpp7G4=;
 b=Pff1LMAnSSyyMX9bxJCd9wC5BWCqzlJifclh/JpHh3NCCSVLnl1UG267raFSl5jnDrZM0H
 CcbRYG022SSMnwlEAk9WovuVwNJTbW8jncN2HfW1uJn5rC5YLHhIP35aAHKuUuRcw6+Xys
 82RGSxCLm98BwtZPKK4JWZP6KcNmiog=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-453-s7lGFJcaO_OnMR8jIk288A-1; Wed, 06 Oct 2021 03:19:57 -0400
X-MC-Unique: s7lGFJcaO_OnMR8jIk288A-1
Received: by mail-wr1-f72.google.com with SMTP id
 r21-20020adfa155000000b001608162e16dso1240069wrr.15
 for <qemu-arm@nongnu.org>; Wed, 06 Oct 2021 00:19:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6ZZ2h0iPrzfJBHIpihTgNbWuUDfm3yIdfpScTfpp7G4=;
 b=oVG8V0qrNrc8TY/SdLexUwoFY+/MAxR36UgUhV1V28wK82p/J8rUlAN+8+ooDIFkE7
 Kpc7P4TPKj/yn3+zbHQOq25yNAdx054uIelwegO1Z5+4019ECO9mCHCc4V/FrTcbmhFV
 F3+nDrj2v4rS5BknxWIHZ+8fat3Dx9Aa0P2VzXgJ//nFKTTbg3y+MMgpzf5qI1uBDanV
 VUvtUH+cVNXi4MOSSu3+mwew5yRsInMZkag304DKL45vlV0orF0+IBsDPDioCpy1fLcC
 yMsA1yDNJY+dKRQ46IS698aqjq9RCeGemo8xhTtGCDjMFN/5cbqZxCVX+1yGhYmRCEno
 F8+A==
X-Gm-Message-State: AOAM530Qv3P/juMyEeP957K9SbGEbiBdSwIpyvUQi3RQO9jxnYTtLOQ8
 O8EgjeO+fowYXkuQA5zZjvuOdch1OHwtjJced2vogr0BNsm0ytZ4JfVGFU+P/ArH7NIuImrOd88
 rvw7V66ocemea
X-Received: by 2002:a05:600c:c3:: with SMTP id
 u3mr8037082wmm.137.1633504796702; 
 Wed, 06 Oct 2021 00:19:56 -0700 (PDT)
X-Received: by 2002:a05:600c:c3:: with SMTP id
 u3mr8037040wmm.137.1633504796379; 
 Wed, 06 Oct 2021 00:19:56 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id n11sm4601771wmq.19.2021.10.06.00.19.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Oct 2021 00:19:56 -0700 (PDT)
Date: Wed, 6 Oct 2021 09:19:54 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: Re: [PATCH v4 07/11] pc: Allow instantiating a virtio-iommu device
Message-ID: <20211006091954.79fd0a8d@redhat.com>
In-Reply-To: <20211001173358.863017-8-jean-philippe@linaro.org>
References: <20211001173358.863017-1-jean-philippe@linaro.org>
 <20211001173358.863017-8-jean-philippe@linaro.org>
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
Cc: peter.maydell@linaro.org, ehabkost@redhat.com, shannon.zhaosl@gmail.com,
 mst@redhat.com, richard.henderson@linaro.org, qemu-devel@nongnu.org,
 eric.auger@redhat.com, qemu-arm@nongnu.org, marcel.apfelbaum@gmail.com,
 ani@anisinha.ca, pbonzini@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ocuzkCys1CtW

On Fri,  1 Oct 2021 18:33:55 +0100
Jean-Philippe Brucker <jean-philippe@linaro.org> wrote:

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
I'd drop PCMachineState::virtio_iommu_bdf and s/pcms->virtio_iommu_bdf/pci_get_bdf(iommu)/

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

this check is getting uglier,
may be instead of introducing pcms->virtio_iommu boolean, better approach
would be adding 'Device* PCMachineState::iommu' and setting it to IOMMU
so the check would reduce to:
      if ((object_dynamic_cast(OBJECT(dev), TYPE_X86_IOMMU_DEVICE) ||
           object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_IOMMU_PCI)))
      {
          if (pcms->iommu)
            err
          else set pcms->iommu in plug handler or here
      }
      
that also will let to cleanup/get rid of x86_iommu_[s|g]et_default()
and x86_iommu_default 'global'.
Maybe replace previous patch with one that would remove
x86_iommu_[s|g]et_default().

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

