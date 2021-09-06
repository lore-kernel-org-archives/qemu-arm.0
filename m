Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp3871398lfb;
        Mon, 6 Sep 2021 08:02:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxlXgIhXlsMYIKQSqahAZd/9aWdcBNp6rcG6UlEcBKg3REGr1SkB0ncpDmCciC4OIN4lPrJ
X-Received: by 2002:a2e:8547:: with SMTP id u7mr11117326ljj.188.1630940557497;
        Mon, 06 Sep 2021 08:02:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630940557; cv=none;
        d=google.com; s=arc-20160816;
        b=RSCHWuGHIaZKZJgZMl1h15JP/pEvFN2E9/LJAkWnxMk3A1nV1CWh37SjcZwXHujW/V
         ySEhIpni1QhCU8oCDz3BSTDJPpHVeQrkxzoeVykMhAQlqR9lDfI2iXjgolxyWvUlkb7s
         Vxg5EpxIlW9j/3oQ1PjThhBDF5WTAuT1a3o4Nkt7Cmu47YDe/PLtm/AgCZki8EARNEyS
         CGLp/DJR3xuBCjJiISiI9mVOMDzwshzlgfnyr2rlT0Wh9Ln0XihyV+ucEvgyjCAJqvCo
         1eewN6oIh0TLiajYcedbFrHMuUL+7w6sh84Gn0sJwcEJnyxcV9ZUQ3JjZBsFvIV8Kby6
         dTTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:content-language
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=R7WPX0OmfOgwoG7AZPG9biEWXCby193AXR4gFCNchv0=;
        b=fQLcNMRXhGg5SwrIVNrlihk7Qx1IEMyVMBPQD5K/6oz9yo9F/iw7KkGAKCtTRrkowS
         wx/K0zQy0lhsseLsrSrs2zDe24GPFtSYJh5LgiIb69+i3ziXKILdPj+8+LV659KMjocQ
         DrWWUA6L/arWfsFmO63CE6OLlt/5X7F1pQb8pIftcubf/vs9wzEUdSxe4kHUhNGh6mPQ
         FueterSx+aokgCXhGozCacKLIGwzICbqLZzljG+BxHJ6k7aEX+Wt9+gcX2+MtcmE4Bvp
         bLE7EpRTH5qRRM7ULw2i2zB8mBV2OSVeBM5rPkQscKUvjzT+6TdrMNZxzvoFqkXiKCi4
         pujw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=eM55lEJV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p12si9860180ejy.596.2021.09.06.08.02.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 Sep 2021 08:02:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=eM55lEJV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:45340 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mNG8q-0004aF-HM
	for alex.bennee@linaro.org; Mon, 06 Sep 2021 11:02:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53580)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1mNG8W-0004Ys-5s
 for qemu-arm@nongnu.org; Mon, 06 Sep 2021 11:02:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20702)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1mNG8Q-0001Xp-UX
 for qemu-arm@nongnu.org; Mon, 06 Sep 2021 11:02:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630940530;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=R7WPX0OmfOgwoG7AZPG9biEWXCby193AXR4gFCNchv0=;
 b=eM55lEJVRAnovwwD69gujDaUblEzPxOP7fpIWQi3DZeQzvfsfJ0XpbIQ1O2XG87RxARq1j
 kJqz4hrbyym5lEv5UO1xi1iYQhoyOe+plmVqFLAU3IPAUj9NLAJILpnwA7sF8BqFfnFXw7
 Na2acyn3RmViME4tBSOVtFU7vfuEwS8=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-344-qJW4qXJQMAKCbCLExWKikA-1; Mon, 06 Sep 2021 11:02:09 -0400
X-MC-Unique: qJW4qXJQMAKCbCLExWKikA-1
Received: by mail-wr1-f70.google.com with SMTP id
 h15-20020adff18f000000b001574654fbc2so1266282wro.10
 for <qemu-arm@nongnu.org>; Mon, 06 Sep 2021 08:02:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=R7WPX0OmfOgwoG7AZPG9biEWXCby193AXR4gFCNchv0=;
 b=dcvNEaErzrnrXhWVe5YQKu4+b9xQYL+lj+BNsUqg6YT3VJi3U9IQ5p2ihtbH+bhzB0
 vppfxcJre1GskfYpShPyKfPP0v6rV2jF/+iQWmrUJ9QWyZ084dgbYMc34yFaTEdrj8aQ
 lu0/KU4k+G3qohOSbua+Qk4mXwxaiHdkv+Ay5bbCUd+LENh7UKox40L92r7ynoPNTEgL
 qpe0K5+Be77MBn90vXkJp5iH2xuNdptzNRqt+GjE1j9KfNbhJ7reAEzu6ZFK0EExI2PX
 HCg3knKElJY14yl5CIPjZXwotxyzPpl5Moa2/HMlRb+pqWo+Ac7KItKj1YC1jeRwcOlY
 yjRg==
X-Gm-Message-State: AOAM5331qbv72ZA8+o7qKQ4s+fwGEIFzpU+fFN9vgwzq0zwMCT1hr6wz
 v8DRijrXiakVsDC594Yinlkkn6oYUH/Bsbn9b4NoqIqFQuNs8C088bK5UkfIK9PilIFzYGpHtL7
 4b17BX0S2dn108NRDCi4ud2lhEguf6mFhCFcod/dcKEDiMZ/r49dk2HjY4olo3ejmCjI=
X-Received: by 2002:adf:f645:: with SMTP id x5mr13663907wrp.353.1630940527702; 
 Mon, 06 Sep 2021 08:02:07 -0700 (PDT)
X-Received: by 2002:adf:f645:: with SMTP id x5mr13663861wrp.353.1630940527379; 
 Mon, 06 Sep 2021 08:02:07 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id f17sm7453043wmf.4.2021.09.06.08.02.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Sep 2021 08:02:06 -0700 (PDT)
Subject: Re: [PATCH v2 6/8] pc: Add VIOT table for virtio-iommu
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
References: <20210903143208.2434284-1-jean-philippe@linaro.org>
 <20210903143208.2434284-7-jean-philippe@linaro.org>
From: Eric Auger <eric.auger@redhat.com>
Message-ID: <6b142f58-fa70-2ec9-0df5-9217fa275922@redhat.com>
Date: Mon, 6 Sep 2021 17:02:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210903143208.2434284-7-jean-philippe@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -54
X-Spam_score: -5.5
X-Spam_bar: -----
X-Spam_report: (-5.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.332, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-To: eric.auger@redhat.com
Cc: peter.maydell@linaro.org, ehabkost@redhat.com, mst@redhat.com,
 richard.henderson@linaro.org, qemu-devel@nongnu.org, shannon.zhaosl@gmail.com,
 qemu-arm@nongnu.org, marcel.apfelbaum@gmail.com, pbonzini@redhat.com,
 imammedo@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: X8Q0L8isqc/+

Hi jean,

On 9/3/21 4:32 PM, Jean-Philippe Brucker wrote:
> The ACPI Virtual I/O Translation table (VIOT) describes the relation
> between a virtio-iommu and the endpoints it manages. When a virtio-iommu
> device is instantiated, add a VIOT table.

As there is no used of pcms->virtio_iommu and virtio_iommu_bdf yet, maybe squash this into next patch?

Thanks

Eric

>
> Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> ---
>  hw/i386/Kconfig      | 1 +
>  include/hw/i386/pc.h | 2 ++
>  hw/i386/acpi-build.c | 5 +++++
>  hw/i386/pc.c         | 7 +++++++
>  4 files changed, 15 insertions(+)
>
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
> diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
> index 88dffe7517..979b8d0b7c 100644
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
>      /* NUMA information: */
> diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> index a33ac8b91e..078b7f5c6f 100644
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
> @@ -2559,6 +2560,10 @@ void acpi_build(AcpiBuildTables *tables, MachineState *machine)
>              build_dmar_q35(tables_blob, tables->linker, x86ms->oem_id,
>                             x86ms->oem_table_id);
>          }
> +    } else if (pcms->virtio_iommu) {
> +        acpi_add_table(table_offsets, tables_blob);
> +        build_viot(tables_blob, tables->linker, pcms->virtio_iommu_bdf,
> +                   x86ms->oem_id, x86ms->oem_table_id);
>      }
>      if (machine->nvdimms_state->is_enabled) {
>          nvdimm_build_acpi(table_offsets, tables_blob, tables->linker,
> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
> index c2b9d62a35..694fc9ce07 100644
> --- a/hw/i386/pc.c
> +++ b/hw/i386/pc.c
> @@ -84,6 +84,7 @@
>  #include "hw/i386/intel_iommu.h"
>  #include "hw/net/ne2000-isa.h"
>  #include "standard-headers/asm-x86/bootparam.h"
> +#include "hw/virtio/virtio-iommu.h"
>  #include "hw/virtio/virtio-pmem-pci.h"
>  #include "hw/virtio/virtio-mem-pci.h"
>  #include "hw/mem/memory-device.h"
> @@ -1388,6 +1389,12 @@ static void pc_machine_device_plug_cb(HotplugHandler *hotplug_dev,
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

