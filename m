Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp221247lft;
        Fri, 24 Jun 2022 03:49:25 -0700 (PDT)
X-Received: by 2002:a81:1e04:0:b0:317:81ee:4b29 with SMTP id e4-20020a811e04000000b0031781ee4b29mr16190569ywe.436.1656067765752;
        Fri, 24 Jun 2022 03:49:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656067765; cv=none;
        d=google.com; s=arc-20160816;
        b=h48A+DzcfhDwgtAeKvt+NJpkx817mBb0uF4/4HnaF2WtF7u20u7l9PBkVbFHaIEwDV
         MFG5P18aU6UK5lXsqXBrOJmWdl+qq1vNTpJiqsAuQrBClWaT2CBBBZN6wPu2CPPxAMFg
         Qq2wkLXIqg/Wcb4a5aUWIi3RDHlJLH3ZnU+1XQuSOBwb3IEYrJn3AyzhnHV2xKRCMQ9p
         eSqz+ETEtI/HVtKe85ERfc+M0o/waNtSHTjMVBD1Y0rHXGj0OHLfan18befhJw6ArMkv
         8X6k9vM6a9XSGt1AGlkmXOrgPZwOk19zXjrvjQ97zmGfhlnsZZRt0K7yTynKerEP9kzW
         +/TQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=tTgxQSojsqqrecCrzUc0iEgcyiEfOCu5J3t+FfJocXE=;
        b=dbmY8W+Bvf60ggtNPt9Dh1ZuSje8OdFBtsc2iiPeXV7qr9XZ3LJcRQ5qkDZUO0orqh
         d14mnjLGFN7KP47Kbt0+HltTjvkCMaUFtCgU93x0Gq6Uc6iK0vpYKZcacCagv0ZZOsBK
         77/yBngAp2HfzYqhuPM9h5fzSvgzgmx0qqOwB1CnMQ10wbPGtPly94kNaHej7R0sSkUD
         FrRx1RFgEZI+IlHnzBrJGhdpi7SqoUMDyXSWxSQdqO4EJITywUxbX21eJ3O3HA1uG82D
         PN+z7ZtWgwWmeTv4Pqph8rKWWtHI2e1g+r5vZEKe5ufz9GJQOkULXkLtA9tXkyXIMdyh
         Oc5Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=AxSGl1jh;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id e4-20020a255004000000b0066489241ecesor942743ybb.61.2022.06.24.03.49.25
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 24 Jun 2022 03:49:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=AxSGl1jh;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tTgxQSojsqqrecCrzUc0iEgcyiEfOCu5J3t+FfJocXE=;
        b=AxSGl1jhhnE+CUotMbw1YWPaRtN1y08fwVy5YuZs4B6B9ekEHJ4husIFzjM8Xcxba7
         wvIz79fGifofTQyiIDQILEkXjCFdFN32MkGvQYXmS2izGb75HTMwnHHTIn/aBG8rNXwi
         e+PO4eO7sADQgwtTO22aaG8DlT+tnGG3uRJ91434DgDdYLEUgg+P4ULSJJbfqTz6F/7d
         XuUXgw2yIH/EhjoPUAqgfN7oO1aAk1/4itwyQyaBoe8cogESYOUvrwN2o2FSJ02BsA+G
         Uf3mTQCw7BQdomDmDlzPhUCmBismVhKUkoL3dQyiEyOpq8acqTb+ynfJaJF19LowvKWx
         /c2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tTgxQSojsqqrecCrzUc0iEgcyiEfOCu5J3t+FfJocXE=;
        b=qyesyHQmNdbTnuMEhrCrueJylrYLIMQ4dMDfm0+IugrYRxEi+/aXMDD0dil+WY9w2L
         BKov8AZ+IH8gmKVG8pXria/RNicZzImUq0WtebRQnS1pnAzsRnfuy2i6sVZ38W83TaT+
         dVdF9aPmEXaeNFPLBFIecvXqapBB7YgTE1T+uRa1tu2c8fchxY+8GpyIq1O9pmclL9RB
         wz/lPiiYaBXr5MfYyBhhfzswqlrTCGWvpBi/2fZfOr569wvoIFEmnFgYZwajHvOT18Rm
         Nnpvuoxeyv4sszhIxFA+WqYh/Cgiz2vJTOwvzboFt4GgYLwHhMr9/99EGpZE477lgbTu
         1WmQ==
X-Gm-Message-State: AJIora8XflH4s8qL8tQwCIIHA4Shdku+aAeshv/vPuFqPn4pGHI1gI9z
	srWKv5XZdNKKkppEjofKDTROlH1NQ9wbGHjc/7kzEc6b
X-Google-Smtp-Source: AGRyM1sUYkiGBpPdotZZsIU3TJPBkL2b1bO6wO7dkIBG9Xxvx5QFf+s/z8JmKjt1EmutWdqd7ugUvWhsQ7wI2g2TOVc=
X-Received: by 2002:a25:810a:0:b0:669:9f30:7f1e with SMTP id
 o10-20020a25810a000000b006699f307f1emr11404152ybk.479.1656067765358; Fri, 24
 Jun 2022 03:49:25 -0700 (PDT)
MIME-Version: 1.0
References: <20220616141950.23374-1-Jonathan.Cameron@huawei.com> <20220616141950.23374-2-Jonathan.Cameron@huawei.com>
In-Reply-To: <20220616141950.23374-2-Jonathan.Cameron@huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 24 Jun 2022 11:48:47 +0100
Message-ID: <CAFEAcA8U9oNDStfLpxOwodGm9MCTdLrt-WV+x_-rTGw9UpBGvA@mail.gmail.com>
Subject: Re: [PATCH v11 1/2] hw/arm/virt: Basic CXL enablement on
 pci_expander_bridge instances pxb-cxl
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: qemu-devel@nongnu.org, alex.bennee@linaro.org, qemu-arm@nongnu.org, 
	"Michael S . Tsirkin" <mst@redhat.com>, Ben Widawsky <bwidawsk@kernel.org>, 
	Paolo Bonzini <pbonzini@redhat.com>, linux-cxl@vger.kernel.org, linuxarm@huawei.com, 
	Marcel Apfelbaum <marcel@redhat.com>, Igor Mammedov <imammedo@redhat.com>, 
	Markus Armbruster <armbru@redhat.com>, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, 
	Adam Manzanares <a.manzanares@samsung.com>, Tong Zhang <ztong0001@gmail.com>, 
	Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
Content-Type: text/plain; charset="UTF-8"
X-TUID: w2GLkyIXfHR9

On Thu, 16 Jun 2022 at 15:20, Jonathan Cameron
<Jonathan.Cameron@huawei.com> wrote:
>
> Code based on i386/pc enablement.
> The memory layout places space for 16 host bridge register regions after
> the GIC_REDIST2 in the extended memmap.
> The CFMWs are placed above the extended memmap.
>
> Only create the CEDT table if cxl=on set for the machine.
>
> Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

This seems to be missing code to advertise the new devices in the
device tree.

Somebody else had better review the ACPI changes :-)

>  #define DEFINE_VIRT_MACHINE_LATEST(major, minor, latest) \
> @@ -178,6 +181,7 @@ static const MemMapEntry base_memmap[] = {
>  static MemMapEntry extended_memmap[] = {
>      /* Additional 64 MB redist region (can contain up to 512 redistributors) */
>      [VIRT_HIGH_GIC_REDIST2] =   { 0x0, 64 * MiB },
> +    [VIRT_CXL_HOST] =           { 0x0, 64 * KiB * 16 }, /* 16 UID */

Does this reshuffle the memory layout so that all the stuff after it
moves up ? If so, that's an incompatible change and would need
versioning somehow.

More generally, should this new addition to the machine be
versioned? What did we do for the pc machine types?

>      [VIRT_HIGH_PCIE_ECAM] =     { 0x0, 256 * MiB },
>      /* Second PCIe window */
>      [VIRT_HIGH_PCIE_MMIO] =     { 0x0, 512 * GiB },
> @@ -1525,6 +1529,16 @@ static void create_pcie(VirtMachineState *vms)
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
> +}

> @@ -1779,6 +1799,20 @@ static void virt_set_memmap(VirtMachineState *vms, int pa_bits)
>          memory_region_init(&ms->device_memory->mr, OBJECT(vms),
>                             "device-memory", device_memory_size);
>      }
> +
> +    if (vms->cxl_devices_state.fixed_windows) {
> +        GList *it;
> +
> +        base = ROUND_UP(base, 256 * MiB);
> +        for (it = vms->cxl_devices_state.fixed_windows; it; it = it->next) {
> +            CXLFixedWindow *fw = it->data;
> +
> +            fw->base = base;
> +            memory_region_init_io(&fw->mr, OBJECT(vms), &cfmws_ops, fw,
> +                                  "cxl-fixed-memory-region", fw->size);

Why is board model code having to init memory regions for this
device? Shouldn't the device be creating the memory regions itself
and then exposing them for the board code to map them ?

> +            base += fw->size;
> +        }
> +    }
>  }
>
>  /*
> @@ -2215,6 +2249,14 @@ static void machvirt_init(MachineState *machine)
>          memory_region_add_subregion(sysmem, machine->device_memory->base,
>                                      &machine->device_memory->mr);
>      }
> +    if (vms->cxl_devices_state.fixed_windows) {
> +        GList *it;
> +        for (it = vms->cxl_devices_state.fixed_windows; it; it = it->next) {
> +            CXLFixedWindow *fw = it->data;
> +
> +            memory_region_add_subregion(sysmem, fw->base, &fw->mr);
> +        }
> +    }
>
>      virt_flash_fdt(vms, sysmem, secure_sysmem ?: sysmem);
>
> @@ -2241,6 +2283,7 @@ static void machvirt_init(MachineState *machine)
>      create_rtc(vms);
>
>      create_pcie(vms);
> +    create_cxl_host_reg_region(vms);
>
>      if (has_ged && aarch64 && firmware_loaded && virt_is_acpi_enabled(vms)) {
>          vms->acpi_dev = create_acpi_ged(vms);
> @@ -3070,6 +3113,7 @@ static void virt_instance_init(Object *obj)
>
>      vms->oem_id = g_strndup(ACPI_BUILD_APPNAME6, 6);
>      vms->oem_table_id = g_strndup(ACPI_BUILD_APPNAME8, 8);
> +    cxl_machine_init(obj, &vms->cxl_devices_state);
>  }
>
>  static const TypeInfo virt_machine_info = {
> diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
> index 15feabac63..403c9107e5 100644
> --- a/include/hw/arm/virt.h
> +++ b/include/hw/arm/virt.h
> @@ -35,6 +35,7 @@
>  #include "hw/boards.h"
>  #include "hw/arm/boot.h"
>  #include "hw/block/flash.h"
> +#include "hw/cxl/cxl.h"
>  #include "sysemu/kvm.h"
>  #include "hw/intc/arm_gicv3_common.h"
>  #include "qom/object.h"
> @@ -92,6 +93,7 @@ enum {
>  /* indices of IO regions located after the RAM */
>  enum {
>      VIRT_HIGH_GIC_REDIST2 =  VIRT_LOWMEMMAP_LAST,
> +    VIRT_CXL_HOST,
>      VIRT_HIGH_PCIE_ECAM,
>      VIRT_HIGH_PCIE_MMIO,
>  };
> @@ -176,6 +178,7 @@ struct VirtMachineState {
>      PCIBus *bus;
>      char *oem_id;
>      char *oem_table_id;
> +    CXLState cxl_devices_state;
>  };

I just looked at the CXLState struct. Why isn't this a device object ?

thanks
-- PMM
