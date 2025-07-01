Received: by 2002:a05:7300:232a:b0:178:84eb:402c with SMTP id r42csp3158769dye;
        Tue, 1 Jul 2025 06:26:32 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWY6VQsZ7XCB6sVJUYnR3erUeQrQSU53oyiSaO4uxboZmvTWfl4B3N/HxlC7v3/OtdXXbCFP0g4upFBuw==@linaro.org
X-Google-Smtp-Source: AGHT+IFOS8CuoplJkUukXDtwjTafTpXQCw5uiK5dHbm+pV5kpm8ETlvrzIKIFuBSbWXWel0pQPW/
X-Received: by 2002:ac8:5f8f:0:b0:4a5:912a:7697 with SMTP id d75a77b69052e-4a7fcbf3f96mr289012411cf.47.1751376391723;
        Tue, 01 Jul 2025 06:26:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751376391; cv=none;
        d=google.com; s=arc-20240605;
        b=Rlj4z7eigpe3I4HDRhw7/wIGbnUFBH1kLJ1xTGPueUR9cAuazqK7834ahCZxz1ZALw
         VcWjkn1ZOvzTkUJzBJGpKW/FlO0jw/ykRYtkDaerWU0QC/Gfhf1QSgCv5g5IyvvOi+Rl
         0gMOWmHAM5Akncixp5mlXVAAUgn1d5Dm6Bobqw5xoKPUDW1FJsYC4XQvBbOBw0ocGf18
         34RFbvD2jbODtJGYD8Z8lSdiJ3kk1EAA4/Us/4KI/8whqYL1Fe92L+n60hYHLYncg6OM
         a4BBb86pDAGI2WeJ2jN2u0tGXLYaHwlhEsAoTQIaEz5i7mQ7Tn+RS/I8eHxDm6B2x3Il
         alvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:reply-to:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=bou7FKm/m/RGyqtwnJb91mXKHDSa7A/zUMQL2caUxSU=;
        fh=zRnhLzItg7TNAxSkLbLd8aSninANnH3CLPrHh12Trqo=;
        b=MjBKfCXk6SqBCKIgyerkqSAvAx8gaQi9jAvFbbTAgelKRH3A2IEKAR4YufF/z0Oorw
         Ehqs20SP2kSogMeqpGWmtfjd2UZ5LVTj2zypQDEd3XbCyzcvkTFrpr+9HchY3me/wcZJ
         oh8slbIGsc8HRYuGpidJVyWpFL9rSbkdTAiFVkXE1QU1TkEiuK9dULgTHUleoZJXqD7F
         eHrABZU184XqW9D7Wz/Cbyv11uhz0+X9xb1ZUHiVPJD2gSn0t5oQ6oMEI1OAj6TQ7jpv
         FqUqtXqnU6Q+oC3ELem5XXvzCzUfrMIVUUgW8MF8JxmIry3XLludWRlsjpKOKH4Gll+i
         8VFQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=IE0iOoQI;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id d75a77b69052e-4a7fc238f0asi105722391cf.308.2025.07.01.06.26.31
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 06:26:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=IE0iOoQI;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751376391;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bou7FKm/m/RGyqtwnJb91mXKHDSa7A/zUMQL2caUxSU=;
	b=IE0iOoQIEHlmfo0s7HKpYLoRs7/VsbJObzzVYhY11nOfHvma1H/0kLnFYyuRuYqGdg1P6U
	EFbKdOGLJPbebeGxO6e4V/Fe2hdXPy/fuZ5UlX13tWBPtbG7S7dHbVQzsUDjR6MPB7quKG
	t7P8uRQQiE1ZzjfrBb4TGY/zoOzIK6M=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-479-rWRrobJDP7-OjuhrRAEKrg-1; Tue, 01 Jul 2025 09:26:30 -0400
X-MC-Unique: rWRrobJDP7-OjuhrRAEKrg-1
X-Mimecast-MFC-AGG-ID: rWRrobJDP7-OjuhrRAEKrg_1751376389
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-450d64026baso29725105e9.1
        for <alex.bennee@linaro.org>; Tue, 01 Jul 2025 06:26:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751376389; x=1751981189;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bou7FKm/m/RGyqtwnJb91mXKHDSa7A/zUMQL2caUxSU=;
        b=YXkAZiVbdoGrnAt0S/ud/HsRgPX+C+DbjChO7YTCX+FzCzs0syy0TsghtABN4yFuSx
         Of1sjdrJIsd+PHRATJ9RU/PcI2PVwUlC+O/Q/OeLL4oHaPi9UFSvZHxWkpBGotLREQBR
         OPFJ9D+qmm1JfSY8BRXnNIdYpxWxkmqwhxHBt0iVPlrz4nuF3Iz89zOd+SnhG39zINI3
         0hr0ab5A6E3l+oho4tpI6tTyDaY92e0WYdp2mYFXkjJO5MoZfU1OashYUgH1c0MLoOUT
         ukyI+oP8GgIJzwD8tUC63Tq4Q1aPDnfXSRQe0Oc1PKjUg4F+pwBe5D1O4MEo1z5JEmnj
         a/Fw==
X-Forwarded-Encrypted: i=1; AJvYcCUccQog0Ft7rHPGOIX73V+Mf7Zss8zUIR/00W7Cpw0Uu4H9rl/xeh9pz6OtKF5g0HpKnk/s2mNyOo33tQ==@linaro.org
X-Gm-Message-State: AOJu0Yz9CnC1GMQyUBoxPHeQNSNaR5DbnBRTHcYb8VtKFNN6PA0QSCAv
	rI5jE+JTYJpU9/QViB0KXuLw8N0FvHM0OK4hR4Ouv9brHF8SLAH6VTDQjqiDGRxJxwK8/VRtclf
	H3E3CbvkdZ/N0Izdy7Exoie9UnE8ptg6wZpWpuSUr0xEvQ2N6QmqauxYL6w==
X-Gm-Gg: ASbGncv0Vf7Hmb50st8/sUnAB2M6ycTGLKeLMO2W2jLUN1c+1NInCNMW8IUSKP9aJW2
	fvK9+SzzJUEAYaR6XDhjdQdtr+n1/6Xb4gQ5ul5K87voGkXfJugNUE1N/OFUlStIiubv9jrVf9w
	4hl3TOZVUcwEXSZdA/apKgzyr0jstt8+zRve+6ErM1pUp3cBEwnDR0VR5WVdmdnAg+jb1HY6Lro
	Kew36r6NIfaHB8TV7MuNyrG8YVlN79Dz7SuPoVKE+GctynjPyZktvy/UIRSSfi1TV6ZCBZxFSQJ
	ClNfrVTvIUhQ588/U7GYO2hcyhGlCCYLEgQdVoCeWlmKekgxcl7helHHeeNd4yvIvEPBYQ==
X-Received: by 2002:a5d:5050:0:b0:3a5:8a68:b836 with SMTP id ffacd0b85a97d-3a90075ffa3mr12468182f8f.44.1751376388811;
        Tue, 01 Jul 2025 06:26:28 -0700 (PDT)
X-Received: by 2002:a5d:5050:0:b0:3a5:8a68:b836 with SMTP id ffacd0b85a97d-3a90075ffa3mr12468141f8f.44.1751376388185;
        Tue, 01 Jul 2025 06:26:28 -0700 (PDT)
Return-Path: <eric.auger@redhat.com>
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874? ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4538233c5fasm199975025e9.8.2025.07.01.06.26.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Jul 2025 06:26:27 -0700 (PDT)
Message-ID: <4ceea721-b633-499e-9fcd-735990ee0704@redhat.com>
Date: Tue, 1 Jul 2025 15:26:26 +0200
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
X-Mimecast-MFC-PROC-ID: _ANsfl3GqiizWyhyMBTcvhZOyZM6_jlRM7_WFQK1eW8_1751376389
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TUID: 8kC/c1en8vVA

Hi Jonathan,

On 6/25/25 6:19 PM, Jonathan Cameron via wrote:
> Code based on i386/pc enablement.
> The memory layout places space for 16 host bridge register regions after
> the GIC_REDIST2 in the extended memmap. This is a hole in the current
> map so adding them here has no impact on placement of other memory regions
> (tested with enough CPUs for GIC_REDIST2 to be in use.)

Doesn't it depend on the init RAM size setting.
if the init RAM top + REDIST2 aligns to a 256MB boundary (size of the
PCI ECAM) aren't you likely to have no hole?


>
> The CFMWs are placed above the extended memmap.  Note the confusing
> existing variable highest_gpa is the highest_gpa that has been allocated
> at a particular point in setting up the memory map.
what kind of improvement would you foresee wrt highest_gpa?

Thanks

Eric
>
> The cxl_devices_state.host_mr is provides a small space in which to place
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
