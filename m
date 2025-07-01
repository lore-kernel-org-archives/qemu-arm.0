Received: by 2002:a05:7300:232a:b0:178:84eb:402c with SMTP id r42csp3244654dye;
        Tue, 1 Jul 2025 08:34:44 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUkXI+iFLDOXX7Opwt5vHr9v7iiKKi3VkwCBpxwhY4oPky85ypyU6iJjx3ht0HUWqDnZ4aBicJm9+drpA==@linaro.org
X-Google-Smtp-Source: AGHT+IFlhU0ZiZ+EQyV78+e4UjNWBhRQJ6GRph46fbzMzJo0sYWlC/HWibQYwPAuB2S1Ce/Ox/zl
X-Received: by 2002:a17:90b:4f85:b0:311:f99e:7f57 with SMTP id 98e67ed59e1d1-318c92ee425mr22392696a91.23.1751384083589;
        Tue, 01 Jul 2025 08:34:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751384083; cv=none;
        d=google.com; s=arc-20240605;
        b=GIdVjXjY15QGG3j+NSpBnHdYlxu8PtGZ3ejuxpJicLiYmJUATeJzhgIIEwpRD4X0LU
         PjwLEzXQsmLCb3Z6Lb0KnDCK1mIj4EXQ43TqBg4o5t0XeGsx3zZMcfi/qMESYvDx39u8
         pRi5V8xjOHq2nczRgQWv3TLVtHM3FputzCAscsTyFqaTdQA6V/A2SCXHBSfDUxM579Dk
         oDOoRjprNeK9X1SNWV9FwP2Jw7RMI7rhSOfbboVrr7iU/2vuYA/D5pmKZmzzr72WzzD5
         3V08BnH5CwD22z29KZ3PPBWb+01FV+J/UpXqsdh21wf7eQTDh+FhT3yXxgDk6vDwR6G3
         GE0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:reply-to:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=EfBBIeuv3a9WR82SRLGbt1tmYuPjxunQ5KspGGsoBAY=;
        fh=EL4f5Ry9y+EJWL5RFzaYPnzicUF+siKkbCNHcl9rq2w=;
        b=OyPEpQI7a5+Qx6E16kPm4aPojaAwnE9N2GWPr6o1tmMGhL5hn5mhwOBJaop1Z8994W
         F8aqSSSegPZOeV7JUD+zhXRBerznM/6EZRpkiCLRUZOMKggsFRQM3RmEAAq2gO6z5ey6
         5Lbp8Xsr/ihWAjxOCHkC86D4O3sackO9nqUlmTTkXAsyWIBbmgKiirAKSKhM7fgncc7E
         bRKrQ2IOFBh4B5WkThtNxQzRaetXISCu9Pv21KUXmqVeNBsqDloLoHV1tgwnRtL7dSe5
         lZOPc5tY+qHcJpX0bpmtzo75jMZsdprtGrfe0Ztb/Y7u4HihX/jcTlOeSWh41sQhEbNZ
         eIbQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Tzcw8XV1;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id 98e67ed59e1d1-315f5386e81si20954974a91.2.2025.07.01.08.34.43
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 08:34:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Tzcw8XV1;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751384082;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EfBBIeuv3a9WR82SRLGbt1tmYuPjxunQ5KspGGsoBAY=;
	b=Tzcw8XV1Op25TWapCpZWmcaGYRyTh3OGBb25fM83b6miwi8znR1RzVy1VKAzj3l3OYjSYY
	AaSkUZVfL0qYcSp1cncXzXtnKp1Owz+1LosffaJ9kqKBu1rOee1Ljuix8A7KHmW9hlRVTN
	XA6cfJSF+PNG/Hj0jXdTZ/SlbwUp/FI=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-62-Q1sVVoY-MT6nhDozqOz-gg-1; Tue, 01 Jul 2025 11:34:40 -0400
X-MC-Unique: Q1sVVoY-MT6nhDozqOz-gg-1
X-Mimecast-MFC-AGG-ID: Q1sVVoY-MT6nhDozqOz-gg_1751384079
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-3a4eb6fcd88so2614910f8f.1
        for <alex.bennee@linaro.org>; Tue, 01 Jul 2025 08:34:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751384079; x=1751988879;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EfBBIeuv3a9WR82SRLGbt1tmYuPjxunQ5KspGGsoBAY=;
        b=ZbjmCoem9uqanvWHeUBCFUHy3ioCyg9AiimPYOVqMIFMBHOf8Yll2nuZge/Ns6kYN3
         guDwUBkMluI5QAMPvIhczJI46C9ATsjiF1DkDopJMHxdtIQqs4ewhjrnvVnIvRqnDWwh
         /2iXcpkC4SkjLYFRdCtHaOo/NKFjKaP8OcQntaTbOv7I5FRoLNf2OnIcl6UQH4sTIdWo
         hMI+lMJiUGtJCva2UVdAu1nDKeI422eoULMyVm+qkSqbXN77DuAgLC6u2kFJIUfwsTOh
         wdbmiOlzxadDeB7Zm9XuVYT/p/WfjLyUzAO2GD2E4ZaHahxn+A78f9SV54Y3bnzGKZRn
         bxoQ==
X-Forwarded-Encrypted: i=1; AJvYcCUA4W6R3SxgThMwFAomD2Esqcb0+V9qji32VeJeSivU7jFZzdJruL6Qv3g8VQdWiujB5Y6mA9eW5911nQ==@linaro.org
X-Gm-Message-State: AOJu0YwbWjiVUEUcamraejrf0lPqL+Agty6gTPpRxOyCg4OsGfQ43zED
	DitKvCY3d0mhAXYGB0wwmyQ08lGSMy5OxCP/yDZloCRsoS/3Kr3zPlUUzJ0BBcTDjMaGx91iHz2
	sZCR4O64Wrp2yUrTCEubs3EGnTxw0ZQuf92w06LA8CRw7oRgBRHlrdqfHdQ==
X-Gm-Gg: ASbGncuRVulNp58OY3eWcwR0nPK9gLCxgoUlW+yNrFv1i8sBtyMi7mcdNIlpBUQ5Oac
	ixJrSxowbEb3gW6rzZmcAdZkMY1AcXE5u6Lz3KtFSLcewnIzbv0HXcrBmjk4dq3lr21E71WmpuS
	EDShT6UTf2oZvW3SiuYuR3YFwaD8rRoKIHrv9S20LzyGINKMydCp+KjKKN5U/MRfXMQGd/vUpdW
	ZlIfy+QD9mvxeu645O+eMnMJS6eWd0cPTA2tWvnzvA6q4d7Pf9v6nC6CgRoz/nWf4vAXesLZJBi
	EhnFlQko62HvDy5rfHbYLIg7VG6xgMp1TmcVmrywiTIcv/r7JXUni1j95qW/vTXT1OdNMg==
X-Received: by 2002:a05:6000:1804:b0:3a4:f379:65b6 with SMTP id ffacd0b85a97d-3a8fe79bb4bmr12013381f8f.46.1751384078891;
        Tue, 01 Jul 2025 08:34:38 -0700 (PDT)
X-Received: by 2002:a05:6000:1804:b0:3a4:f379:65b6 with SMTP id ffacd0b85a97d-3a8fe79bb4bmr12013350f8f.46.1751384078273;
        Tue, 01 Jul 2025 08:34:38 -0700 (PDT)
Return-Path: <eric.auger@redhat.com>
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874? ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453823ad0fesm204716915e9.25.2025.07.01.08.34.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Jul 2025 08:34:37 -0700 (PDT)
Message-ID: <128e59be-4038-4a19-8cca-3be3d6446e0e@redhat.com>
Date: Tue, 1 Jul 2025 17:34:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: eric.auger@redhat.com
Subject: Re: [PATCH qemu v16 3/5] hw/arm/virt: Basic CXL enablement on
 pci_expander_bridge instances pxb-cxl
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>, qemu-devel@nongnu.org,
 Fan Ni <fan.ni@samsung.com>, Peter Maydell <peter.maydell@linaro.org>,
 mst@redhat.com, Zhijian Li <lizhijian@fujitsu.com>,
 Itaru Kitayama <itaru.kitayama@linux.dev>
Cc: linuxarm@huawei.com, linux-cxl@vger.kernel.org, qemu-arm@nongnu.org,
 Yuquan Wang <wangyuquan1236@phytium.com.cn>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
References: <20250625161926.549812-1-Jonathan.Cameron@huawei.com>
 <20250625161926.549812-4-Jonathan.Cameron@huawei.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20250625161926.549812-4-Jonathan.Cameron@huawei.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: PlKap5DJdcTv38uNTWZefkHycmhR6b8sWz_oWAHdOs4_1751384079
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TUID: tpDgoc/niMWq

Hi Jonathan,

On 6/25/25 6:19 PM, Jonathan Cameron via wrote:
> Code based on i386/pc enablement.
> The memory layout places space for 16 host bridge register regions after
> the GIC_REDIST2 in the extended memmap. This is a hole in the current
> map so adding them here has no impact on placement of other memory regions
> (tested with enough CPUs for GIC_REDIST2 to be in use.)
>
> The CFMWs are placed above the extended memmap.  Note the confusing
> existing variable highest_gpa is the highest_gpa that has been allocated
> at a particular point in setting up the memory map.
>
> The cxl_devices_state.host_mr is provides a small space in which to place
s/is//
> the individual host bridge register regions for whatever host bridges are
> allocated via -device pxb-cxl on the command line. The existing dynamic
> sysbus infrastructure is not reused because pxb-cxl is a PCI device not
> a sysbus one but these registers are directly in the main memory map,
> not the PCI address space.
>
> Only create the CEDT table if cxl=on set for the machine. Default to off.
>
> Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> ---
> v16: Some additional comments on the memory map in the patch description.
>      Added an 'off by default' statement to he patch description.
>      Update highest_gpa to include CXL Fixed Memory Windows. It is not
>      used after this point but cleaner to set it anyway.
>
> Perhaps unresolved feedback.  Peter raised a concern about the direct
> initialization of vms->cxl_devices_state.host_mr. I've added more
> commentary about that to the patch description. Whilst it seems
> unnecessary I could wrap the relevant 3 lines of code up in a utility
> function rather than open coding them here and in i386/pc.
> ---
>  docs/system/arm/virt.rst |  9 +++++++++
>  include/hw/arm/virt.h    |  4 ++++
>  hw/arm/virt-acpi-build.c | 34 ++++++++++++++++++++++++++++++++++
>  hw/arm/virt.c            | 29 +++++++++++++++++++++++++++++
>  4 files changed, 76 insertions(+)
>
> diff --git a/docs/system/arm/virt.rst b/docs/system/arm/virt.rst
> index 6a719b9586..10cbffc8a7 100644
> --- a/docs/system/arm/virt.rst
> +++ b/docs/system/arm/virt.rst
> @@ -31,6 +31,7 @@ Supported devices
>  The virt board supports:
>  
>  - PCI/PCIe devices
> +- CXL Fixed memory windows, root bridges and devices.
>  - Flash memory
>  - Either one or two PL011 UARTs for the NonSecure World
>  - An RTC
> @@ -189,6 +190,14 @@ ras
>  acpi
>    Set ``on``/``off``/``auto`` to enable/disable ACPI.
>  
> +cxl
> +  Set  ``on``/``off`` to enable/disable CXL. More details in
> +  :doc:`../devices/cxl`. The default is off.
> +
> +cxl-fmw
> +  Array of CXL fixed memory windows describing fixed address routing to
> +  target CXL host bridges. See :doc:`../devices/cxl`.
> +
>  dtb-randomness
>    Set ``on``/``off`` to pass random seeds via the guest DTB
>    rng-seed and kaslr-seed nodes (in both "/chosen" and
> diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
> index 9a1b0f53d2..4375819ea0 100644
> --- a/include/hw/arm/virt.h
> +++ b/include/hw/arm/virt.h
> @@ -36,6 +36,7 @@
>  #include "hw/arm/boot.h"
>  #include "hw/arm/bsa.h"
>  #include "hw/block/flash.h"
> +#include "hw/cxl/cxl.h"
>  #include "system/kvm.h"
>  #include "hw/intc/arm_gicv3_common.h"
>  #include "qom/object.h"
> @@ -85,6 +86,7 @@ enum {
>  /* indices of IO regions located after the RAM */
>  enum {
>      VIRT_HIGH_GIC_REDIST2 =  VIRT_LOWMEMMAP_LAST,
> +    VIRT_CXL_HOST,
>      VIRT_HIGH_PCIE_ECAM,
>      VIRT_HIGH_PCIE_MMIO,
>  };
> @@ -140,6 +142,7 @@ struct VirtMachineState {
>      bool secure;
>      bool highmem;
>      bool highmem_compact;
> +    bool highmem_cxl;
>      bool highmem_ecam;
>      bool highmem_mmio;
>      bool highmem_redists;
> @@ -174,6 +177,7 @@ struct VirtMachineState {
>      char *oem_id;
>      char *oem_table_id;
>      bool ns_el2_virt_timer_irq;
> +    CXLState cxl_devices_state;
>  };
>  
>  #define VIRT_ECAM_ID(high) (high ? VIRT_HIGH_PCIE_ECAM : VIRT_PCIE_ECAM)
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index 7e8e0f0298..589e221b89 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -39,10 +39,12 @@
>  #include "hw/acpi/aml-build.h"
>  #include "hw/acpi/utils.h"
>  #include "hw/acpi/pci.h"
> +#include "hw/acpi/cxl.h"
>  #include "hw/acpi/memory_hotplug.h"
>  #include "hw/acpi/generic_event_device.h"
>  #include "hw/acpi/tpm.h"
>  #include "hw/acpi/hmat.h"
> +#include "hw/cxl/cxl.h"
>  #include "hw/pci/pcie_host.h"
>  #include "hw/pci/pci.h"
>  #include "hw/pci/pci_bus.h"
> @@ -119,10 +121,29 @@ static void acpi_dsdt_add_flash(Aml *scope, const MemMapEntry *flash_memmap)
>      aml_append(scope, dev);
>  }
>  
> +static void build_acpi0017(Aml *table)
> +{
> +    Aml *dev, *scope, *method;
> +
> +    scope =  aml_scope("_SB");
> +    dev = aml_device("CXLM");
> +    aml_append(dev, aml_name_decl("_HID", aml_string("ACPI0017")));
> +
> +    method = aml_method("_STA", 0, AML_NOTSERIALIZED);
> +    aml_append(method, aml_return(aml_int(0x0B)));
> +    aml_append(dev, method);
> +    build_cxl_dsm_method(dev);
> +
> +    aml_append(scope, dev);
> +    aml_append(table, scope);
> +}
> +
>  static void acpi_dsdt_add_pci(Aml *scope, const MemMapEntry *memmap,
>                                uint32_t irq, VirtMachineState *vms)
>  {
>      int ecam_id = VIRT_ECAM_ID(vms->highmem_ecam);
> +    bool cxl_present = false;
> +    PCIBus *bus = vms->bus;
>      struct GPEXConfig cfg = {
>          .mmio32 = memmap[VIRT_PCIE_MMIO],
>          .pio    = memmap[VIRT_PCIE_PIO],
> @@ -136,6 +157,14 @@ static void acpi_dsdt_add_pci(Aml *scope, const MemMapEntry *memmap,
>      }
>  
>      acpi_dsdt_add_gpex(scope, &cfg);
> +    QLIST_FOREACH(bus, &vms->bus->child, sibling) {
> +        if (pci_bus_is_cxl(bus)) {
> +            cxl_present = true;
> +        }
> +    }
> +    if (cxl_present) {
> +        build_acpi0017(scope);
> +    }
>  }
>  
>  static void acpi_dsdt_add_gpio(Aml *scope, const MemMapEntry *gpio_memmap,
> @@ -963,6 +992,11 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
>          }
>      }
>  
> +    if (vms->cxl_devices_state.is_enabled) {
> +        cxl_build_cedt(table_offsets, tables_blob, tables->linker,
> +                       vms->oem_id, vms->oem_table_id, &vms->cxl_devices_state);
> +    }
> +
>      if (ms->nvdimms_state->is_enabled) {
>          nvdimm_build_acpi(table_offsets, tables_blob, tables->linker,
>                            ms->nvdimms_state, ms->ram_slots, vms->oem_id,
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 99fde5836c..025b4cdc54 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -57,6 +57,7 @@
>  #include "qemu/error-report.h"
>  #include "qemu/module.h"
>  #include "hw/pci-host/gpex.h"
> +#include "hw/pci-bridge/pci_expander_bridge.h"
>  #include "hw/virtio/virtio-pci.h"
>  #include "hw/core/sysbus-fdt.h"
>  #include "hw/platform-bus.h"
> @@ -86,6 +87,8 @@
>  #include "hw/virtio/virtio-md-pci.h"
>  #include "hw/virtio/virtio-iommu.h"
>  #include "hw/char/pl011.h"
> +#include "hw/cxl/cxl.h"
> +#include "hw/cxl/cxl_host.h"
>  #include "qemu/guest-random.h"
>  
>  static GlobalProperty arm_virt_compat[] = {
> @@ -220,6 +223,7 @@ static const MemMapEntry base_memmap[] = {
>  static MemMapEntry extended_memmap[] = {
>      /* Additional 64 MB redist region (can contain up to 512 redistributors) */
>      [VIRT_HIGH_GIC_REDIST2] =   { 0x0, 64 * MiB },
> +    [VIRT_CXL_HOST] =           { 0x0, 64 * KiB * 16 }, /* 16 UID */
>      [VIRT_HIGH_PCIE_ECAM] =     { 0x0, 256 * MiB },
>      /* Second PCIe window */
>      [VIRT_HIGH_PCIE_MMIO] =     { 0x0, DEFAULT_HIGH_PCIE_MMIO_SIZE },
> @@ -1626,6 +1630,17 @@ static void create_pcie(VirtMachineState *vms)
>      }
>  }
>  
> +static void create_cxl_host_reg_region(VirtMachineState *vms)
> +{
> +    MemoryRegion *sysmem = get_system_memory();
> +    MemoryRegion *mr = &vms->cxl_devices_state.host_mr;
> +
> +    memory_region_init(mr, OBJECT(vms), "cxl_host_reg",
> +                       vms->memmap[VIRT_CXL_HOST].size);
> +    memory_region_add_subregion(sysmem, vms->memmap[VIRT_CXL_HOST].base, mr);
> +    vms->highmem_cxl = true;
> +}
> +
>  static void create_platform_bus(VirtMachineState *vms)
>  {
>      DeviceState *dev;
> @@ -1742,6 +1757,12 @@ void virt_machine_done(Notifier *notifier, void *data)
>      struct arm_boot_info *info = &vms->bootinfo;
>      AddressSpace *as = arm_boot_address_space(cpu, info);
>  
> +    cxl_hook_up_pxb_registers(vms->bus, &vms->cxl_devices_state,
> +                              &error_fatal);
> +
> +    if (vms->cxl_devices_state.is_enabled) {
> +        cxl_fmws_link_targets(&error_fatal);
> +    }
>      /*
>       * If the user provided a dtb, we assume the dynamic sysbus nodes
>       * already are integrated there. This corresponds to a use case where
> @@ -1788,6 +1809,7 @@ static inline bool *virt_get_high_memmap_enabled(VirtMachineState *vms,
>  {
>      bool *enabled_array[] = {
>          &vms->highmem_redists,
> +        &vms->highmem_cxl,
>          &vms->highmem_ecam,
>          &vms->highmem_mmio,
>      };
> @@ -1895,6 +1917,9 @@ static void virt_set_memmap(VirtMachineState *vms, int pa_bits)
>      if (device_memory_size > 0) {
>          machine_memory_devices_init(ms, device_memory_base, device_memory_size);
>      }
> +    vms->highest_gpa = cxl_fmws_set_memmap(ROUND_UP(vms->highest_gpa + 1,
> +                                                    256 * MiB),
> +                                           BIT_ULL(pa_bits)) - 1;
in hw/cxl/cxl-host.c, there seems to be a loop on fw windows? I guess
those windows only exist if cxl option is set. In the positive,
highest_gpa will be changed only if the option is set, which is fine.
Indeed we have requested_ipa_size = 64 - clz64(vms->highest_gpa). So we
shall not modify this if cxl is not set.

What I am a bit concerned with is that it"consumes" some high memory
without making it explicit in extended_memmap. Shouldn't we book some
dedicated space there? Sorry I am jumping very late in the review, maybe
turning things worse & noisy :-( Eric
>  }
>  
>  static VirtGICType finalize_gic_version_do(const char *accel_name,
> @@ -2345,6 +2370,8 @@ static void machvirt_init(MachineState *machine)
>      memory_region_add_subregion(sysmem, vms->memmap[VIRT_MEM].base,
>                                  machine->ram);
>  
> +    cxl_fmws_update_mmio();
> +
>      virt_flash_fdt(vms, sysmem, secure_sysmem ?: sysmem);
>  
>      create_gic(vms, sysmem);
> @@ -2400,6 +2427,7 @@ static void machvirt_init(MachineState *machine)
>      create_rtc(vms);
>  
>      create_pcie(vms);
> +    create_cxl_host_reg_region(vms);
>  
>      if (has_ged && aarch64 && firmware_loaded && virt_is_acpi_enabled(vms)) {
>          vms->acpi_dev = create_acpi_ged(vms);
> @@ -3370,6 +3398,7 @@ static void virt_instance_init(Object *obj)
>  
>      vms->oem_id = g_strndup(ACPI_BUILD_APPNAME6, 6);
>      vms->oem_table_id = g_strndup(ACPI_BUILD_APPNAME8, 8);
> +    cxl_machine_init(obj, &vms->cxl_devices_state);
>  }
>  
>  static const TypeInfo virt_machine_info = {
