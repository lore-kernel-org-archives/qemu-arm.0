Received: by 2002:a17:504:5d2c:b0:1be9:327d:8ee3 with SMTP id et12csp233078njc;
        Fri, 13 Jun 2025 05:57:51 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUS7W4S1eLqaE/pQjOI1rEJeCXWXyYfJoTZAygcfz+Ac4ViHK5/MIfDCk83qundfiDE1mzFF7xDKcctRg==@linaro.org
X-Received: by 2002:a05:690c:6186:b0:708:cd31:88a9 with SMTP id 00721157ae682-7116377cef0mr46135787b3.37.1749819471201;
        Fri, 13 Jun 2025 05:57:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1749819471; cv=none;
        d=google.com; s=arc-20240605;
        b=JG6kWwdnk2dKWGcV/85dtyWsR/iFzD+3jLsAw0EY+xCzgNoFruEXMiaBgpdxMH/3mc
         mNUBq4Zuy9Zxl/JvGJMP9ZoCe0xcNbM7nA6hjjLgK6xumui1Ow45qzMZ5v8K3bsxmelO
         PtS2D20pLIEBFCeXsVegzTgjCp7JUVpdy7muEHFuvSv4jfm2yu2pTnXFUN+UPARu79gt
         SH4miqbq06dU+lyyKJhQ4M5i0U+KYvkHFDCKgMpjZcQiuLT4xDX2YNdW+DYXIfVRrfI+
         Fj0MLY5pnoXyEFIs6NvcpQbkLFP3FDe5FWpAascxJHQWkturUD3+36rbWvmTySEsAMHA
         LX1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=5e5DLwd9hQN7WIN5NYjTG58rp8CGAwEIUDrxIuaZN+E=;
        fh=Vt5Jj/YH6J9ee+aFNmLIjzdJNtwu2gFbS6gzpfH+Ktg=;
        b=gqgxu1ak6gz/AVQ96oTxYemxtg6EtrWc7Q0mLn7+m2zHkZBtosG0XOzGTkXIQ32W4q
         /Jk6s8sIIojJGIWU2HWj7ppq43ZbKK3oPpFMbl905YE6s2xDPPfWAjEl39N8YlcwdE6j
         PxeZswXVXoJGz7vcdGcK9JBRlP2ecwv2kneKwXXm5wcmwvBlPrxD6PGP4GqX+vRkYReC
         ZwpltlF7kzGPKScTZiQ5mnL2MvL5oN39bfXfHFN3OGT7WSzdqOt2jZWLbg5RcRL1rAOb
         TAV3uLTEHiY1i5EwMJFEBEWoMPpDZ1OkxJnU6v/JnhCWVwu93Rhx4ls/kWffiY8bN8zx
         3O7A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bNObVpqR;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 00721157ae682-711513eb02esor23046527b3.0.2025.06.13.05.57.51
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 13 Jun 2025 05:57:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bNObVpqR;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749819471; x=1750424271; darn=linaro.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=5e5DLwd9hQN7WIN5NYjTG58rp8CGAwEIUDrxIuaZN+E=;
        b=bNObVpqRapy+joDng8pLQxlZPbPNu3Ve1TBHtONXIgd5Jozaj6pkRdchlXpwr6tTvl
         rnMAwfq8GZUUouzUSj20NSElJYmMUuizP4FQdZicTG3zs7CneXjsrEczfdNL5V4r/lIh
         sPoXjFwOqmck8lm4M/q9eZTPGPZXI6xUu23AWuKfp+GIiWCmIu18DRdeeLxousSpvVvw
         nkXZcisJ1MCmw0RG0tDtRCH65wOY1LN+FRgc3CgEB2BdJwBeDYLQsI7ps85ECJ8RrinV
         kBVWxi6lU5QkC46hZgB9yHoYQcpYIkVUdr6e+FXVmH/5YmEU41lXhvctzeYDIfej2IPo
         FpJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749819471; x=1750424271;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5e5DLwd9hQN7WIN5NYjTG58rp8CGAwEIUDrxIuaZN+E=;
        b=eMRaJFFUjM5AzMevJvMPF7sjW+DjGkJGVbjh/Dbl8l4qIXsHryxBHQOAPrkSdtN1Pt
         ah8X2ILXB8tg2bYYadI4JxaKxebOpH/3AMkjFPJPxhTBjdv5+/ii3ghjsdQFz4puL3j4
         MTR49UwqPsftH46dh0hXrI0KslVLi3d7uj1MZS6wuFT58TlluiPjQ50q2gmPeGASZRlz
         LTFBTt/kPwKSwDGlLGkWXSedH3ZWEWPxcEmRT1Y0zIVHA0qQBkEqMrKYs7VhlytJ4EzR
         I7MBLrbmciKIl2Vlo5k7TPtFYyOn8FrWoBDmbGXcOVv6q83eXhPO64Jiracid3IAU3nL
         +8Lw==
X-Forwarded-Encrypted: i=1; AJvYcCVGeVNf1IfYYINWmH+ltfPhUKU2ea3JJjPiHC1TSTZGYfbQ8bb2VFfd3GPVKEfMC6M66I8o0INpeND6qQ==@linaro.org
X-Gm-Message-State: AOJu0YxCFZmpokAetvmT85FTCuFgVvk0jnrxnbjMfHorfNZXk/TAI5r6
	zNeTFrDsPX5RB6wyG44+QRb4yfgfhEzQqfvpnP/RRd8hYYoigWI9y47D1uuAoH31JzASJF7Qkru
	cF7WhK6DdhJmkIyaLMO6m/aLvlRrYmqvhbVGJgOML3UOovvFrlmCCYJQ=
X-Gm-Gg: ASbGncuqGdV9zHOBlcb+8EujQNd3KksRoCpiDkpZLcIMqo79I396Pycwjyv5MKN4cHP
	YviwnYBhBx8fnXZPvWo0uM/mRIq3k0W/QPOhL/C8lQN08Xh61/W7+/N+UxMtINUXdUWkRQIkBHV
	8cD3K9XDncpESlUcYeOODn92uIWx4kes2ZMkvpbYlEuAGi
X-Google-Smtp-Source: AGHT+IGOqdMgK2uR5dYMh+4m6yWvXA5HHWIhp0IPRI9GXw8RTzt2MNwCVJQ74vJuTdZKitYKMfh0RBIxhRkxEj0eMow=
X-Received: by 2002:a05:690c:d1c:b0:70c:a854:8384 with SMTP id
 00721157ae682-71163645c81mr50388717b3.11.1749819470736; Fri, 13 Jun 2025
 05:57:50 -0700 (PDT)
MIME-Version: 1.0
References: <20250612134338.1871023-1-Jonathan.Cameron@huawei.com> <20250612134338.1871023-4-Jonathan.Cameron@huawei.com>
In-Reply-To: <20250612134338.1871023-4-Jonathan.Cameron@huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 13 Jun 2025 13:57:39 +0100
X-Gm-Features: AX0GCFv5MSwU1aQDZ69b1dKRTca84UO3VVXOn0u2BXHQNHBteShBJRs4HFTae4I
Message-ID: <CAFEAcA-J+vAGfEV67PezA72rUiqpuqTBT=8hJLc1sw+xo3XHWQ@mail.gmail.com>
Subject: Re: [PATCH v15 3/4] hw/arm/virt: Basic CXL enablement on
 pci_expander_bridge instances pxb-cxl
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: qemu-devel@nongnu.org, Fan Ni <fan.ni@samsung.com>, mst@redhat.com, 
	Zhijian Li <lizhijian@fujitsu.com>, Itaru Kitayama <itaru.kitayama@linux.dev>, linuxarm@huawei.com, 
	linux-cxl@vger.kernel.org, qemu-arm@nongnu.org, 
	Yuquan Wang <wangyuquan1236@phytium.com.cn>, 
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
	Alireza Sanaee <alireza.sanaee@huawei.com>, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-TUID: aE1CVvzrqlBR

On Thu, 12 Jun 2025 at 14:45, Jonathan Cameron
<Jonathan.Cameron@huawei.com> wrote:
>
> Code based on i386/pc enablement. The memory layout places space for 16
> host bridge register regions after the GIC_REDIST2 in the extended memmap.
> The CFMWs are placed above the extended memmap.
>
> Only create the CEDT table if cxl=on set for the machine.
>
> Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
>
> ---
> v15: No changes.
> ---
>  include/hw/arm/virt.h    |  4 ++++
>  hw/arm/virt-acpi-build.c | 34 ++++++++++++++++++++++++++++++++++
>  hw/arm/virt.c            | 29 +++++++++++++++++++++++++++++
>  3 files changed, 67 insertions(+)

Can we have some user-facing documentation, please?
(docs/system/arm/virt.rst -- can just be a brief mention
and link to docs/system/devices/cxl.rst if you want to put the
examples of aarch64 use in there.)

> @@ -220,6 +223,7 @@ static const MemMapEntry base_memmap[] = {
>  static MemMapEntry extended_memmap[] = {
>      /* Additional 64 MB redist region (can contain up to 512 redistributors) */
>      [VIRT_HIGH_GIC_REDIST2] =   { 0x0, 64 * MiB },
> +    [VIRT_CXL_HOST] =           { 0x0, 64 * KiB * 16 }, /* 16 UID */

This is going to shuffle the memory map around, even if CXL
isn't enabled, which will break migration compatibility.
You need to do something to ensure that the CXL region isn't
included in the calculations of the base addresses for these
regions if CXL isn't enabled.

>      [VIRT_HIGH_PCIE_ECAM] =     { 0x0, 256 * MiB },
>      /* Second PCIe window */
>      [VIRT_HIGH_PCIE_MMIO] =     { 0x0, DEFAULT_HIGH_PCIE_MMIO_SIZE },

If you're OK with having the CXL host region at the end of the
list then that's a simpler way to avoid its presence disturbing
the layout of the existing regions, but you might not like it
being at such a high physaddr.

> @@ -1621,6 +1625,17 @@ static void create_pcie(VirtMachineState *vms)
>      }
>  }
>
> +static void create_cxl_host_reg_region(VirtMachineState *vms)
> +{
> +    MemoryRegion *sysmem = get_system_memory();
> +    MemoryRegion *mr = &vms->cxl_devices_state.host_mr;

This looks odd -- why are we reaching directly into the cxl_devices_state
to fish out a MemoryRegion and init it?

> +    memory_region_init(mr, OBJECT(vms), "cxl_host_reg",
> +                       vms->memmap[VIRT_CXL_HOST].size);
> +    memory_region_add_subregion(sysmem, vms->memmap[VIRT_CXL_HOST].base, mr);
> +    vms->highmem_cxl = true;
> +}
> +
>  static void create_platform_bus(VirtMachineState *vms)
>  {
>      DeviceState *dev;
> @@ -1737,6 +1752,12 @@ void virt_machine_done(Notifier *notifier, void *data)
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
> @@ -1783,6 +1804,7 @@ static inline bool *virt_get_high_memmap_enabled(VirtMachineState *vms,
>  {
>      bool *enabled_array[] = {
>          &vms->highmem_redists,
> +        &vms->highmem_cxl,
>          &vms->highmem_ecam,
>          &vms->highmem_mmio,
>      };
> @@ -1890,6 +1912,9 @@ static void virt_set_memmap(VirtMachineState *vms, int pa_bits)
>      if (device_memory_size > 0) {
>          machine_memory_devices_init(ms, device_memory_base, device_memory_size);
>      }
> +
> +    cxl_fmws_set_memmap(ROUND_UP(vms->highest_gpa + 1, 256 * MiB),
> +                        BIT_ULL(pa_bits));

Isn't this stomping over the HIGH_PCIE memory window (or
whatever else happens to be at the top end of memory) ?

Also taking highest_gpa and then rounding it up looks suspicious:
if it's the highest GPA then anything larger than that is off
the end of the physical address space.

Plus cxl_fmws_set_memmap() names its arguments base, max_addr:
"highest gpa, rounded up" doesn't sound like a base address.

(Looking at our current code that sets and adjusts highest_gpa,
it looks a bit weird: maybe we're setting it to values that aren't
what the variable name claims it's doing, and that's why this
code happens to work ?)

>  }
>
>  static VirtGICType finalize_gic_version_do(const char *accel_name,
> @@ -2340,6 +2365,8 @@ static void machvirt_init(MachineState *machine)
>      memory_region_add_subregion(sysmem, vms->memmap[VIRT_MEM].base,
>                                  machine->ram);
>
> +    cxl_fmws_update_mmio();
> +
>      virt_flash_fdt(vms, sysmem, secure_sysmem ?: sysmem);
>
>      create_gic(vms, sysmem);
> @@ -2395,6 +2422,7 @@ static void machvirt_init(MachineState *machine)
>      create_rtc(vms);
>
>      create_pcie(vms);
> +    create_cxl_host_reg_region(vms);
>
>      if (has_ged && aarch64 && firmware_loaded && virt_is_acpi_enabled(vms)) {
>          vms->acpi_dev = create_acpi_ged(vms);
> @@ -3365,6 +3393,7 @@ static void virt_instance_init(Object *obj)
>
>      vms->oem_id = g_strndup(ACPI_BUILD_APPNAME6, 6);
>      vms->oem_table_id = g_strndup(ACPI_BUILD_APPNAME8, 8);
> +    cxl_machine_init(obj, &vms->cxl_devices_state);
>  }

cxl defaults to disabled, right? (i.e. we don't need the
machine-version specific stuff to keep it from being enabled
on old versioned machine types).

thanks
-- PMM
