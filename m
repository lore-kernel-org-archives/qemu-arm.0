Received: by 2002:a17:504:6454:b0:1be9:327d:8ee3 with SMTP id g20csp987223njh;
        Mon, 12 Aug 2024 18:47:56 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUqDmIAe0wGoYzNpsXLzTcZwLYLUgUp7LAqDHngB87Xcr7eM2xqiKFeOC1yd/iMKS9VJfLdvOGmTnkfvPdemA13YEIyaMhT
X-Google-Smtp-Source: AGHT+IEQl3R/fcN8RJbfutkYioc9cmA1jFWj/p58Yzrf17Lr3XiXKp2GficSmrZU1eGdtBIG+T22
X-Received: by 2002:a05:6a20:4f08:b0:1c8:d93e:3b10 with SMTP id adf61e73a8af0-1c8d93e3b34mr1849359637.1.1723513676611;
        Mon, 12 Aug 2024 18:47:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1723513676; cv=none;
        d=google.com; s=arc-20160816;
        b=RNXmL4ciAg6F4bBlDgcCKjmzU7iujxb2+PE8wxTIkPnYWVqITVRwcTDonFxHaZxb73
         XXUlZ2YFrFgqYkljAyd5PZ7I9QzTEcoocjXQie02DQMxg+TEnvH2VZ06yMUq8ITEJjna
         BLgi15K0be0qVZFJKPelfmVATUIkrkFHtVAve9NcxVwXCvA8pgBl46jj+0TQtWeot1zv
         teXWvJ6lQedENtcURJrhjpKRWWnrrUAw+s4TPE6LUxbcmXOt0/t8wdoYU5J7VKI5vKcc
         629v0EbSGAj4yRdAq76+2ei5/rZXympH6cXDAsY4hA/l/yswIofmsFxcrbwG+zO5YuFl
         q+Vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:user-agent:references:message-id:in-reply-to:subject
         :cc:to:from:date:dkim-signature;
        bh=NmxFTWV447exngDSgaF33UPGOEpuuEYXYaoW8CG3LVM=;
        fh=Ug+pXI9+HXYIt7BDs0h6rTDu/NKL8sq/RkmAlhQApNM=;
        b=Rd6cKbqmOA8xQmDpu476L8DrjB0hvv5CfSugKagD6vsgxELyPbthY38BdtcULuGR0Y
         MIUaPeLqzRIbwWqP2C+mxV/so1SzVKvPuV0is3s0Zlaf6TF+O9MFkkCPCTy7oJnz/R21
         EBUxnnJckfAMWtnJRzcdMEnUocp9z+nJTufE5gXlYKgHe8AxNbdx6IKG68MF1fRQ5Jf3
         Eq3VU00vkyoSB/73diuZ0NTQYIx116CU+tI1rYpDN/zv4JbjaghGytVTvFJ8uT9Fzh+g
         6hJaSu1QRxqTyFfS/vCKG9vtU35r7GuvxwToRhp51asqVtZ7s0PiQhM4cYHds3zb5DET
         bMpQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=G9c+B7Hn;
       spf=pass (google.com: domain of sstabellini@kernel.org designates 2604:1380:40e1:4800::1 as permitted sender) smtp.mailfrom=sstabellini@kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Return-Path: <sstabellini@kernel.org>
Received: from sin.source.kernel.org (sin.source.kernel.org. [2604:1380:40e1:4800::1])
        by mx.google.com with ESMTPS id 41be03b00d2f7-7c697ada4e6si614361a12.676.2024.08.12.18.47.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Aug 2024 18:47:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of sstabellini@kernel.org designates 2604:1380:40e1:4800::1 as permitted sender) client-ip=2604:1380:40e1:4800::1;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=G9c+B7Hn;
       spf=pass (google.com: domain of sstabellini@kernel.org designates 2604:1380:40e1:4800::1 as permitted sender) smtp.mailfrom=sstabellini@kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 1A992CE115A;
	Tue, 13 Aug 2024 01:47:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7DD5C4AF09;
	Tue, 13 Aug 2024 01:47:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723513674;
	bh=cGXnWkFSW0WUXy8FVztv+ami4miDC4PeO4UhRrHpTFU=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=G9c+B7Hny3KVMSmQWbX4ro7MwKEXDoeoyxJZFS2Ybaz1PD5zTuHz6YQfdelCExTFy
	 ZCF/3ZoXSkVIJEoJUyz+QK/yqOAxD0Vsb8dtpNOnwLliJ7RWPGehMxaao6x7P5q7MB
	 4bz/ajVT2oOFm/rgsYyFPKFikfrofp0A6YQWOFQPA2DUk4MxYOLuf2lU9eyCKxvavL
	 M+Vr5SRc4f5goyXqdKXb1LEgk+I4P3I4pGOvoSRjqwkg7ZKgZaeF/+Irc/pIp66gZQ
	 nCmDYDLIf1z8k/Uztb3vtktPKFTKhhZ4mRGm19AmxOCjd+SeISzeO5QiG70tbJQvxu
	 wQNeJQ1dV2gHQ==
Date: Mon, 12 Aug 2024 18:47:51 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
cc: qemu-devel@nongnu.org, sstabellini@kernel.org, anthony@xenproject.org, 
    paul@xen.org, peter.maydell@linaro.org, alex.bennee@linaro.org, 
    xenia.ragiadakou@amd.com, jason.andryuk@amd.com, edgar.iglesias@amd.com, 
    xen-devel@lists.xenproject.org, qemu-arm@nongnu.org
Subject: Re: [PATCH v1 05/10] hw/arm: xenpvh: Break out a common PVH module
In-Reply-To: <20240812130606.90410-6-edgar.iglesias@gmail.com>
Message-ID: <alpine.DEB.2.22.394.2408121720290.298534@ubuntu-linux-20-04-desktop>
References: <20240812130606.90410-1-edgar.iglesias@gmail.com> <20240812130606.90410-6-edgar.iglesias@gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-TUID: 7OrypU5pDHwg

On Mon, 12 Aug 2024, Edgar E. Iglesias wrote:
> From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>
> 
> Break out a common Xen PVH module in preparation for
> adding a x86 Xen PVH Machine.
> 
> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
> ---
>  hw/arm/trace-events             |   5 -
>  hw/arm/xen_arm.c                | 154 ++++++--------------------
>  hw/xen/meson.build              |   1 +
>  hw/xen/trace-events             |   4 +
>  hw/xen/xen-pvh-common.c         | 185 ++++++++++++++++++++++++++++++++
>  include/hw/xen/xen-pvh-common.h |  45 ++++++++
>  6 files changed, 269 insertions(+), 125 deletions(-)
>  create mode 100644 hw/xen/xen-pvh-common.c
>  create mode 100644 include/hw/xen/xen-pvh-common.h
> 
> diff --git a/hw/arm/trace-events b/hw/arm/trace-events
> index be6c8f720b..c64ad344bd 100644
> --- a/hw/arm/trace-events
> +++ b/hw/arm/trace-events
> @@ -68,10 +68,5 @@ z2_aer915_send_too_long(int8_t msg) "message too long (%i bytes)"
>  z2_aer915_send(uint8_t reg, uint8_t value) "reg %d value 0x%02x"
>  z2_aer915_event(int8_t event, int8_t len) "i2c event =0x%x len=%d bytes"
>  
> -# xen_arm.c
> -xen_create_virtio_mmio_devices(int i, int irq, uint64_t base) "Created virtio-mmio device %d: irq %d base 0x%"PRIx64
> -xen_init_ram(uint64_t machine_ram_size) "Initialized xen ram with size 0x%"PRIx64
> -xen_enable_tpm(uint64_t addr) "Connected tpmdev at address 0x%"PRIx64
> -
>  # bcm2838.c
>  bcm2838_gic_set_irq(int irq, int level) "gic irq:%d lvl:%d"
> diff --git a/hw/arm/xen_arm.c b/hw/arm/xen_arm.c
> index ef8315969c..b8a5c09bdf 100644
> --- a/hw/arm/xen_arm.c
> +++ b/hw/arm/xen_arm.c
> @@ -12,40 +12,25 @@
>  #include "hw/irq.h"
>  #include "hw/sysbus.h"
>  #include "sysemu/block-backend.h"
> -#include "sysemu/tpm_backend.h"
>  #include "sysemu/sysemu.h"
> -#include "hw/xen/xen-hvm-common.h"
> +#include "hw/xen/xen-pvh-common.h"
>  #include "sysemu/tpm.h"
>  #include "hw/xen/arch_hvm.h"
> -#include "trace.h"
>  
>  #define TYPE_XEN_ARM  MACHINE_TYPE_NAME("xenpvh")
>  OBJECT_DECLARE_SIMPLE_TYPE(XenArmState, XEN_ARM)
>  
> -static const MemoryListener xen_memory_listener = {
> -    .region_add = xen_region_add,
> -    .region_del = xen_region_del,
> -    .log_start = NULL,
> -    .log_stop = NULL,
> -    .log_sync = NULL,
> -    .log_global_start = NULL,
> -    .log_global_stop = NULL,
> -    .priority = MEMORY_LISTENER_PRIORITY_ACCEL,
> -};
> -
>  struct XenArmState {
>      /*< private >*/
>      MachineState parent;
>  
> -    XenIOState *state;
> +    XenPVHCommonState pvh;
>  
>      struct {
>          uint64_t tpm_base_addr;
>      } cfg;
>  };
>  
> -static MemoryRegion ram_lo, ram_hi;
> -
>  /*
>   * VIRTIO_MMIO_DEV_SIZE is imported from tools/libs/light/libxl_arm.c under Xen
>   * repository.
> @@ -57,64 +42,6 @@ static MemoryRegion ram_lo, ram_hi;
>  #define NR_VIRTIO_MMIO_DEVICES   \
>     (GUEST_VIRTIO_MMIO_SPI_LAST - GUEST_VIRTIO_MMIO_SPI_FIRST)
>  
> -static void xen_set_irq(void *opaque, int irq, int level)
> -{
> -    if (xendevicemodel_set_irq_level(xen_dmod, xen_domid, irq, level)) {
> -        error_report("xendevicemodel_set_irq_level failed");
> -    }
> -}
> -
> -static void xen_create_virtio_mmio_devices(XenArmState *xam)
> -{
> -    int i;
> -
> -    for (i = 0; i < NR_VIRTIO_MMIO_DEVICES; i++) {
> -        hwaddr base = GUEST_VIRTIO_MMIO_BASE + i * VIRTIO_MMIO_DEV_SIZE;
> -        qemu_irq irq = qemu_allocate_irq(xen_set_irq, NULL,
> -                                         GUEST_VIRTIO_MMIO_SPI_FIRST + i);
> -
> -        sysbus_create_simple("virtio-mmio", base, irq);
> -
> -        trace_xen_create_virtio_mmio_devices(i,
> -                                             GUEST_VIRTIO_MMIO_SPI_FIRST + i,
> -                                             base);
> -    }
> -}

There are 4 trivial functions in this file:

void arch_handle_ioreq(XenIOState *state, ioreq_t *req)
void arch_xen_set_memory(XenIOState *state, MemoryRegionSection *section,
                         bool add)
void xen_hvm_modified_memory(ram_addr_t start, ram_addr_t length)
void qmp_xen_set_global_dirty_log(bool enable, Error **errp)

Do you think it would make sense to move these too to xen-pvh-common.c ?


> -
> -static void xen_init_ram(MachineState *machine)
> -{
> -    MemoryRegion *sysmem = get_system_memory();
> -    ram_addr_t block_len, ram_size[GUEST_RAM_BANKS];
> -
> -    trace_xen_init_ram(machine->ram_size);
> -    if (machine->ram_size <= GUEST_RAM0_SIZE) {
> -        ram_size[0] = machine->ram_size;
> -        ram_size[1] = 0;
> -        block_len = GUEST_RAM0_BASE + ram_size[0];
> -    } else {
> -        ram_size[0] = GUEST_RAM0_SIZE;
> -        ram_size[1] = machine->ram_size - GUEST_RAM0_SIZE;
> -        block_len = GUEST_RAM1_BASE + ram_size[1];
> -    }
> -
> -    memory_region_init_ram(&xen_memory, NULL, "xen.ram", block_len,
> -                           &error_fatal);
> -
> -    memory_region_init_alias(&ram_lo, NULL, "xen.ram.lo", &xen_memory,
> -                             GUEST_RAM0_BASE, ram_size[0]);
> -    memory_region_add_subregion(sysmem, GUEST_RAM0_BASE, &ram_lo);
> -    if (ram_size[1] > 0) {
> -        memory_region_init_alias(&ram_hi, NULL, "xen.ram.hi", &xen_memory,
> -                                 GUEST_RAM1_BASE, ram_size[1]);
> -        memory_region_add_subregion(sysmem, GUEST_RAM1_BASE, &ram_hi);
> -    }
> -
> -    /* Setup support for grants.  */
> -    memory_region_init_ram(&xen_grants, NULL, "xen.grants", block_len,
> -                           &error_fatal);
> -    memory_region_add_subregion(sysmem, XEN_GRANT_ADDR_OFF, &xen_grants);
> -}
> -
>  void arch_handle_ioreq(XenIOState *state, ioreq_t *req)
>  {
>      hw_error("Invalid ioreq type 0x%x\n", req->type);
> @@ -135,55 +62,42 @@ void qmp_xen_set_global_dirty_log(bool enable, Error **errp)
>  {
>  }
>  
> -#ifdef CONFIG_TPM
> -static void xen_enable_tpm(XenArmState *xam)
> -{
> -    Error *errp = NULL;
> -    DeviceState *dev;
> -    SysBusDevice *busdev;
> -
> -    TPMBackend *be = qemu_find_tpm_be("tpm0");
> -    if (be == NULL) {
> -        error_report("Couldn't find tmp0 backend");
> -        return;
> -    }
> -    dev = qdev_new(TYPE_TPM_TIS_SYSBUS);
> -    object_property_set_link(OBJECT(dev), "tpmdev", OBJECT(be), &errp);
> -    object_property_set_str(OBJECT(dev), "tpmdev", be->id, &errp);
> -    busdev = SYS_BUS_DEVICE(dev);
> -    sysbus_realize_and_unref(busdev, &error_fatal);
> -    sysbus_mmio_map(busdev, 0, xam->cfg.tpm_base_addr);
> -
> -    trace_xen_enable_tpm(xam->cfg.tpm_base_addr);
> -}
> -#endif
> -
> -static void xen_arm_init(MachineState *machine)
> +static void xen_arm_init(MachineState *ms)
>  {
> -    XenArmState *xam = XEN_ARM(machine);
> -
> -    xam->state =  g_new0(XenIOState, 1);
> +    XenArmState *xam = XEN_ARM(ms);
> +    const struct {
> +        const char *name;
> +        MemMapEntry map;
> +    } map[] = {
> +        { "ram-low", { GUEST_RAM0_BASE, GUEST_RAM0_SIZE } },
> +        { "ram-high", { GUEST_RAM1_BASE, GUEST_RAM1_SIZE } },
> +        { "virtio-mmio", { GUEST_VIRTIO_MMIO_BASE, VIRTIO_MMIO_DEV_SIZE } },
> +        { "tpm", { xam->cfg.tpm_base_addr, 0x1000 } },
> +    };
> +    int i;
>  
> -    if (machine->ram_size == 0) {
> -        warn_report("%s non-zero ram size not specified. QEMU machine started"
> -                    " without IOREQ (no emulated devices including virtio)",
> -                    MACHINE_CLASS(object_get_class(OBJECT(machine)))->desc);
> -        return;
> +    object_initialize_child(OBJECT(ms), "pvh", &xam->pvh, TYPE_XEN_PVH_COMMON);
> +
> +    object_property_set_int(OBJECT(&xam->pvh), "max-cpus", ms->smp.max_cpus,
> +                            &error_abort);

Is ms->smp.max_cpus updated according to the QEMU command line option?
If so, that would solve the problem of the static initialization of
max_cpus to GUEST_MAX_VCPUS in xen_arm_machine_class_init.


> +    object_property_set_int(OBJECT(&xam->pvh), "ram-size", ms->ram_size,
> +                            &error_abort);
> +    object_property_set_int(OBJECT(&xam->pvh), "virtio-mmio-num",
> +                            NR_VIRTIO_MMIO_DEVICES, &error_abort);
> +    object_property_set_int(OBJECT(&xam->pvh), "virtio-mmio-irq-base",
> +                            GUEST_VIRTIO_MMIO_SPI_FIRST, &error_abort);
> +
> +    for (i = 0; i < ARRAY_SIZE(map); i++) {
> +        g_autofree char *base_name = g_strdup_printf("%s-base", map[i].name);
> +        g_autofree char *size_name = g_strdup_printf("%s-size", map[i].name);
> +
> +        object_property_set_int(OBJECT(&xam->pvh), base_name, map[i].map.base,
> +                                &error_abort);
> +        object_property_set_int(OBJECT(&xam->pvh), size_name, map[i].map.size,
> +                                &error_abort);
>      }
>  
> -    xen_init_ram(machine);
> -
> -    xen_register_ioreq(xam->state, machine->smp.max_cpus, &xen_memory_listener);
> -
> -    xen_create_virtio_mmio_devices(xam);
> -
> -#ifdef CONFIG_TPM
> -    if (xam->cfg.tpm_base_addr) {
> -        xen_enable_tpm(xam);

Do you think it makes sense also to move xen_arm_get_tpm_base_addr and
xen_arm_set_tpm_base_addr to xen-pvh-common.c ?



> -    } else {
> -        warn_report("tpm-base-addr is not provided. TPM will not be enabled");
> -    }
> -#endif
> +    sysbus_realize(SYS_BUS_DEVICE(&xam->pvh), &error_abort);
>  }
>  
>  #ifdef CONFIG_TPM
> diff --git a/hw/xen/meson.build b/hw/xen/meson.build
> index d887fa9ba4..4a486e3673 100644
> --- a/hw/xen/meson.build
> +++ b/hw/xen/meson.build
> @@ -15,6 +15,7 @@ xen_specific_ss = ss.source_set()
>  xen_specific_ss.add(files(
>    'xen-mapcache.c',
>    'xen-hvm-common.c',
> +  'xen-pvh-common.c',
>  ))
>  if have_xen_pci_passthrough
>    xen_specific_ss.add(files(
> diff --git a/hw/xen/trace-events b/hw/xen/trace-events
> index d1b27f6c11..a07fe41c6d 100644
> --- a/hw/xen/trace-events
> +++ b/hw/xen/trace-events
> @@ -64,6 +64,10 @@ destroy_hvm_domain_cannot_acquire_handle(void) "Cannot acquire xenctrl handle"
>  destroy_hvm_domain_failed_action(const char *action, int sts, char *errno_s) "xc_domain_shutdown failed to issue %s, sts %d, %s"
>  destroy_hvm_domain_action(int xen_domid, const char *action) "Issued domain %d %s"
>  
> +# xen-pvh-common.c
> +xen_create_virtio_mmio_devices(int i, int irq, uint64_t base) "Created virtio-mmio device %d: irq %d base 0x%"PRIx64
> +xen_enable_tpm(uint64_t addr) "Connected tpmdev at address 0x%"PRIx64
> +
>  # xen-mapcache.c
>  xen_map_cache(uint64_t phys_addr) "want 0x%"PRIx64
>  xen_remap_bucket(uint64_t index) "index 0x%"PRIx64
> diff --git a/hw/xen/xen-pvh-common.c b/hw/xen/xen-pvh-common.c
> new file mode 100644
> index 0000000000..0d368398d0
> --- /dev/null
> +++ b/hw/xen/xen-pvh-common.c
> @@ -0,0 +1,185 @@
> +/*
> + * Common Xen PVH code.
> + *
> + * Copyright (c) 2024 Advanced Micro Devices, Inc.
> + *
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + */
> +
> +#include "qemu/osdep.h"
> +#include "qemu/error-report.h"
> +#include "qapi/error.h"
> +#include "hw/boards.h"
> +#include "hw/irq.h"
> +#include "hw/sysbus.h"
> +#include "sysemu/sysemu.h"
> +#include "sysemu/tpm.h"
> +#include "sysemu/tpm_backend.h"
> +#include "hw/xen/xen-pvh-common.h"
> +#include "trace.h"
> +
> +static const MemoryListener xen_memory_listener = {
> +    .region_add = xen_region_add,
> +    .region_del = xen_region_del,
> +    .log_start = NULL,
> +    .log_stop = NULL,
> +    .log_sync = NULL,
> +    .log_global_start = NULL,
> +    .log_global_stop = NULL,
> +    .priority = MEMORY_LISTENER_PRIORITY_ACCEL,
> +};
> +
> +static void xen_pvh_init_ram(XenPVHCommonState *s,
> +                             MemoryRegion *sysmem)
> +{
> +    ram_addr_t block_len, ram_size[2];
> +
> +    if (s->cfg.ram_size <= s->cfg.ram_low.size) {
> +        ram_size[0] = s->cfg.ram_size;
> +        ram_size[1] = 0;
> +        block_len = s->cfg.ram_low.base + ram_size[0];
> +    } else {
> +        ram_size[0] = s->cfg.ram_low.size;
> +        ram_size[1] = s->cfg.ram_size - s->cfg.ram_low.size;
> +        block_len = s->cfg.ram_high.base + ram_size[1];
> +    }
> +
> +    memory_region_init_ram(&xen_memory, NULL, "xen.ram", block_len,
> +                           &error_fatal);
> +
> +    memory_region_init_alias(&s->ram.low, NULL, "xen.ram.lo", &xen_memory,
> +                             s->cfg.ram_low.base, ram_size[0]);
> +    memory_region_add_subregion(sysmem, s->cfg.ram_low.base, &s->ram.low);
> +    if (ram_size[1] > 0) {
> +        memory_region_init_alias(&s->ram.high, NULL, "xen.ram.hi", &xen_memory,
> +                                 s->cfg.ram_high.base, ram_size[1]);
> +        memory_region_add_subregion(sysmem, s->cfg.ram_high.base, &s->ram.high);
> +    }
> +
> +    /* Setup support for grants.  */
> +    memory_region_init_ram(&xen_grants, NULL, "xen.grants", block_len,
> +                           &error_fatal);
> +    memory_region_add_subregion(sysmem, XEN_GRANT_ADDR_OFF, &xen_grants);
> +}
> +
> +static void xen_set_irq(void *opaque, int irq, int level)
> +{
> +    if (xendevicemodel_set_irq_level(xen_dmod, xen_domid, irq, level)) {
> +        error_report("xendevicemodel_set_irq_level failed");
> +    }
> +}
> +
> +static void xen_create_virtio_mmio_devices(XenPVHCommonState *s)
> +{
> +    int i;
> +
> +    for (i = 0; i < s->cfg.virtio_mmio_num; i++) {
> +        hwaddr base = s->cfg.virtio_mmio.base + i * s->cfg.virtio_mmio.size;
> +        qemu_irq irq = qemu_allocate_irq(xen_set_irq, NULL,
> +                                         s->cfg.virtio_mmio_irq_base + i);
> +
> +        sysbus_create_simple("virtio-mmio", base, irq);
> +
> +        trace_xen_create_virtio_mmio_devices(i,
> +                                             s->cfg.virtio_mmio_irq_base + i,
> +                                             base);
> +    }
> +}
> +
> +#ifdef CONFIG_TPM
> +static void xen_enable_tpm(XenPVHCommonState *s)
> +{
> +    Error *errp = NULL;
> +    DeviceState *dev;
> +    SysBusDevice *busdev;
> +
> +    TPMBackend *be = qemu_find_tpm_be("tpm0");
> +    if (be == NULL) {
> +        error_report("Couldn't find tmp0 backend");
> +        return;
> +    }
> +    dev = qdev_new(TYPE_TPM_TIS_SYSBUS);
> +    object_property_set_link(OBJECT(dev), "tpmdev", OBJECT(be), &errp);
> +    object_property_set_str(OBJECT(dev), "tpmdev", be->id, &errp);
> +    busdev = SYS_BUS_DEVICE(dev);
> +    sysbus_realize_and_unref(busdev, &error_fatal);
> +    sysbus_mmio_map(busdev, 0, s->cfg.tpm.base);
> +
> +    trace_xen_enable_tpm(s->cfg.tpm.base);
> +}
> +#endif
> +
> +static void xen_pvh_realize(DeviceState *dev, Error **errp)
> +{
> +    XenPVHCommonState *s = XEN_PVH_COMMON(dev);
> +    MemoryRegion *sysmem = get_system_memory();
> +
> +    if (s->cfg.ram_size == 0) {
> +        /* FIXME: Prefix with object path and consider bailing out.  */

I am not sure about these two FIXME


> +        warn_report("non-zero ram size not specified. QEMU machine started"
> +                    " without IOREQ (no emulated devices including virtio)");

Also the warn message has a double negative?


> +        return;
> +    }
> +
> +    if (s->cfg.max_cpus == 0) {
> +        /* FIXME: Prefix with object path and bail out.  */
> +        warn_report("max-cpus not specified. QEMU machine started");
> +        return;
> +    }
> +
> +    xen_pvh_init_ram(s, sysmem);
> +    xen_register_ioreq(&s->ioreq, s->cfg.max_cpus, &xen_memory_listener);
> +
> +    if (s->cfg.virtio_mmio_num) {
> +        xen_create_virtio_mmio_devices(s);
> +    }
> +
> +#ifdef CONFIG_TPM
> +    if (s->cfg.tpm.base) {
> +        xen_enable_tpm(s);
> +    } else {
> +        warn_report("tpm-base-addr is not provided. TPM will not be enabled");
> +    }
> +#endif
> +}
> +
> +#define DEFINE_PROP_MEMMAP(n, f) \
> +    DEFINE_PROP_UINT64(n "-base", XenPVHCommonState, cfg.f.base, 0), \
> +    DEFINE_PROP_UINT64(n "-size", XenPVHCommonState, cfg.f.size, 0)
> +
> +static Property xen_pvh_properties[] = {
> +    DEFINE_PROP_UINT32("max-cpus", XenPVHCommonState, cfg.max_cpus, 0),
> +    DEFINE_PROP_UINT64("ram-size", XenPVHCommonState, cfg.ram_size, 0),
> +    DEFINE_PROP_MEMMAP("ram-low", ram_low),
> +    DEFINE_PROP_MEMMAP("ram-high", ram_high),
> +    DEFINE_PROP_MEMMAP("virtio-mmio", virtio_mmio),
> +    DEFINE_PROP_MEMMAP("tpm", tpm),
> +    DEFINE_PROP_UINT32("virtio-mmio-num", XenPVHCommonState,
> +                       cfg.virtio_mmio_num, 0),
> +    DEFINE_PROP_UINT32("virtio-mmio-irq-base", XenPVHCommonState,
> +                       cfg.virtio_mmio_irq_base, 0),
> +    DEFINE_PROP_END_OF_LIST()
> +};
> +
> +static void xen_pvh_class_init(ObjectClass *klass, void *data)
> +{
> +    DeviceClass *dc = DEVICE_CLASS(klass);
> +
> +    dc->realize = xen_pvh_realize;
> +    device_class_set_props(dc, xen_pvh_properties);
> +    /* No VMSD since we haven't got any top-level SoC state to save.  */
> +}
> +
> +static const TypeInfo xen_pvh_info = {
> +    .name = TYPE_XEN_PVH_COMMON,
> +    .parent = TYPE_SYS_BUS_DEVICE,
> +    .instance_size = sizeof(XenPVHCommonState),
> +    .class_init = xen_pvh_class_init,
> +};
> +
> +static void xen_pvh_register_types(void)
> +{
> +    type_register_static(&xen_pvh_info);
> +}
> +
> +type_init(xen_pvh_register_types);
> diff --git a/include/hw/xen/xen-pvh-common.h b/include/hw/xen/xen-pvh-common.h
> new file mode 100644
> index 0000000000..e958b441fd
> --- /dev/null
> +++ b/include/hw/xen/xen-pvh-common.h
> @@ -0,0 +1,45 @@
> +/*
> + * QEMU Xen PVH machine - common code.
> + *
> + * Copyright (c) 2024 Advanced Micro Devices, Inc.
> + *
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + */
> +
> +#ifndef XEN_PVH_COMMON_H__
> +#define XEN_PVH_COMMON_H__
> +
> +#include <assert.h>
> +#include "hw/sysbus.h"
> +#include "hw/hw.h"
> +#include "hw/xen/xen-hvm-common.h"
> +#include "hw/pci-host/gpex.h"
> +
> +#define TYPE_XEN_PVH_COMMON "xen-pvh-common"
> +OBJECT_DECLARE_SIMPLE_TYPE(XenPVHCommonState, XEN_PVH_COMMON)
> +
> +typedef struct XenPVHCommonState {
> +    /*< private >*/
> +    SysBusDevice parent_obj;
> +
> +    XenIOState ioreq;
> +
> +    struct {
> +        MemoryRegion low;
> +        MemoryRegion high;
> +    } ram;
> +
> +    struct {
> +        uint64_t ram_size;
> +        uint32_t max_cpus;
> +        uint32_t virtio_mmio_num;
> +        uint32_t virtio_mmio_irq_base;
> +        struct {
> +            uint64_t base;
> +            uint64_t size;
> +        } ram_low, ram_high,
> +          virtio_mmio,
> +          tpm;
> +    } cfg;
> +} XenPVHCommonState;
> +#endif
> -- 
> 2.43.0
> 
