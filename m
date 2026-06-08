Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78973CD8C9D
	for <qemu-arm@archiver.kernel.org>; Mon,  8 Jun 2026 17:08:13 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wWdSC-0002q5-O2; Mon, 08 Jun 2026 13:08:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eauger@redhat.com>) id 1wWdRr-0002o0-65
 for qemu-arm@nongnu.org; Mon, 08 Jun 2026 13:07:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eauger@redhat.com>) id 1wWdRi-0003sD-SL
 for qemu-arm@nongnu.org; Mon, 08 Jun 2026 13:07:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1780938447;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FZDkanoGBeNHxRFpe38dioH94SZNXmwZ1kX5QQsmg+8=;
 b=NMYMQYD2+tNoJqgOVGZkGcVZPyfAoPw7Z6HRp9V+v5Y5rNVOQRlqglsV9tSmxZy+MV7grS
 r+unmvzpT63i5FuWbsQad6WDBWZLFEjsE7YAb9nK5/whH9baxKKWd1NCGTgwb0Bloos6ad
 cGrIqlKbKTj905VVGv8lr5Lcz6mT8+Y=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-195-tVm_894vMjO080afHcBLzA-1; Mon, 08 Jun 2026 13:07:24 -0400
X-MC-Unique: tVm_894vMjO080afHcBLzA-1
X-Mimecast-MFC-AGG-ID: tVm_894vMjO080afHcBLzA_1780938443
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-490cc1ae292so13722365e9.1
 for <qemu-arm@nongnu.org>; Mon, 08 Jun 2026 10:07:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780938443; x=1781543243;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=FZDkanoGBeNHxRFpe38dioH94SZNXmwZ1kX5QQsmg+8=;
 b=ciNUSiRJlmMB31i5nrNIrvyerslI80xqOvmtIaUG4NrITHCQpDNIxtfXIb8UKdDG0R
 nS+CT1iCO5SxoM9b1vqAOxsnKV7EpJnT19kt1qbUd2dFJjSJcqpvsfvBUx55ip6zQtQs
 CO7KNZVz43fh6NX07ncH6IXn01R0gj+IoIcC2pYq98ep+ryp+IduYgrW/kV90Srz1E9U
 KVBxWI9WSKRNhtLDVlrAeD1cFQb45bpjx8urc/wXuxZlTznMns29vyhQxx/jzKqfP1j5
 Xcqm9adRtGM5aj1tuLWsZltUWhGFFvZdP7QfeQNu5kA7U/YakB6YA/OV77JruHAISlfm
 Xing==
X-Forwarded-Encrypted: i=1;
 AFNElJ8up7fEDtHE2RLzJYk+IZjRZdwPUsHjiOhPCObeAPAa1M09hUIPhsBRYO2VXUEI/doOsgnfd3mSOA==@nongnu.org
X-Gm-Message-State: AOJu0Ywumc9/yIkDFY1cVno4+/aTxKoEgmV9LCtxeVeZSOZ3gGXJHcqz
 KHZhzq2kOBGHbcqgvwVJw0K5jx5nFFW+JWNUFzvf+ZKuay9kA34tMZtAGDoE6aCV3K8A9auuW44
 SRg4KGb1ofB5GHWsZV9ls0PwtFVTQP/IkPcHrLbqTnKpSLIkyPWBZ7Q==
X-Gm-Gg: Acq92OFXJwRNLNMRtC1dpJnRecNjsoxV5tfQWjXPIX2+2Ah5uJos29L+8frpbMEaF8F
 N55FIYSA85lKY3vW2Me9kkVg/oiWBgHImyWaL39ht/vo4sHlghKAOXai9gVrIUmdLu7R66e+Kvk
 WPOc+EQjakcdmVvFbdZ7UA5eW5ujucGGrfUzivxmPbqtfMW0WJgwcctJRQdUyJopXTp/3P4BX94
 lMXJotIJ0A8Phu51anPttWnIXvWqQULiiZcuZXW0S58TtZhrXQKLc/tm0L4vUPuIUsGBm52t0YJ
 8KYlhMqqBz41Zqb98NcHXS2Xbzku6P3wnF6qXDlM7Gh9pDnVViE5EARktg3UGhM1SWibztpcWEV
 5JHDCbjjIxX7ysVqIIvOF7+S1cW27CWcd6P9NHzlrITzjgq1PRfrrZT6IBQs1ks6U/buEaLl7nJ
 Q=
X-Received: by 2002:a05:600c:3b04:b0:490:af63:2cb1 with SMTP id
 5b1f17b1804b1-490c2cdd2bemr231506985e9.7.1780938442807; 
 Mon, 08 Jun 2026 10:07:22 -0700 (PDT)
X-Received: by 2002:a05:600c:3b04:b0:490:af63:2cb1 with SMTP id
 5b1f17b1804b1-490c2cdd2bemr231506545e9.7.1780938442344; 
 Mon, 08 Jun 2026 10:07:22 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-490bc3fcf5bsm489616705e9.9.2026.06.08.10.07.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Jun 2026 10:07:21 -0700 (PDT)
Message-ID: <94f63b27-59b2-4f65-99dc-ec3a88780e0c@redhat.com>
Date: Mon, 8 Jun 2026 19:07:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 11/21] arm: virt: add support for WDAT based watchdog
To: Igor Mammedov <imammedo@redhat.com>, qemu-devel@nongnu.org
Cc: mst@redhat.com, anisinha@redhat.com, pbonzini@redhat.com,
 peter.maydell@linaro.org, shannon.zhaosl@gmail.com, philmd@linaro.org,
 zhao1.liu@intel.com, rad@semihalf.com, leif.lindholm@oss.qualcomm.com,
 qemu-arm@nongnu.org
References: <20260303092532.2410177-1-imammedo@redhat.com>
 <20260303092532.2410177-12-imammedo@redhat.com>
From: Eric Auger <eauger@redhat.com>
In-Reply-To: <20260303092532.2410177-12-imammedo@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: nr4XvCpMO0FTLD9UqmxeOWDFx42oxx7tyOqdv5_uHYw_1780938443
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eauger@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.445,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org



On 3/3/26 10:25 AM, Igor Mammedov wrote:
> And generate WDAT table tailored for sbsa_gwdt and disable
> watchdog entry in GTDT ACPI table if WDAT is enabled,
> since they are mutualy exclusive due to different
> timer resolution of sbsa_gwdt.
> 
> To enable use "-device sbsa-gwdt,wdat=on" option
> 
> Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> ---
>  include/hw/acpi/wdat-gwdt.h | 19 ++++++++
>  hw/acpi/meson.build         |  2 +
>  hw/acpi/wdat-gwdt-stub.c    | 16 +++++++
>  hw/acpi/wdat-gwdt.c         | 92 +++++++++++++++++++++++++++++++++++++
>  hw/arm/virt-acpi-build.c    | 58 +++++++++++++++++------
>  5 files changed, 172 insertions(+), 15 deletions(-)
>  create mode 100644 include/hw/acpi/wdat-gwdt.h
>  create mode 100644 hw/acpi/wdat-gwdt-stub.c
>  create mode 100644 hw/acpi/wdat-gwdt.c
> 
> diff --git a/include/hw/acpi/wdat-gwdt.h b/include/hw/acpi/wdat-gwdt.h
> new file mode 100644
> index 0000000000..42339e031e
> --- /dev/null
> +++ b/include/hw/acpi/wdat-gwdt.h
> @@ -0,0 +1,19 @@
> +/*
> + * GWDT Watchdog Action Table (WDAT) definition
> + *
> + * Copyright Red Hat, Inc. 2026
> + * Author(s): Igor Mammedov <imammedo@redhat.com>
> + *
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + */
> +#ifndef QEMU_HW_ACPI_WDAT_GWDT_H
> +#define QEMU_HW_ACPI_WDAT_GWDT_H
> +
> +#include "hw/acpi/aml-build.h"
> +#include "hw/watchdog/sbsa_gwdt.h"
> +
> +void build_gwdt_wdat(GArray *table_data, BIOSLinker *linker, const char *oem_id,
> +                     const char *oem_table_id, uint64_t rbase, uint64_t cbase,
> +                     uint64_t freq);
> +
> +#endif /* QEMU_HW_ACPI_WDAT_GWDT_H */
> diff --git a/hw/acpi/meson.build b/hw/acpi/meson.build
> index 22290ca835..189bbb0257 100644
> --- a/hw/acpi/meson.build
> +++ b/hw/acpi/meson.build
> @@ -28,12 +28,14 @@ acpi_ss.add(when: 'CONFIG_ACPI_ICH9', if_true: files('ich9.c', 'ich9_tco.c', 'ic
>  acpi_ss.add(when: 'CONFIG_ACPI_ERST', if_true: files('erst.c'))
>  acpi_ss.add(when: 'CONFIG_IPMI', if_true: files('ipmi.c'), if_false: files('ipmi-stub.c'))
>  acpi_ss.add(when: 'CONFIG_PC', if_false: files('acpi-x86-stub.c'))
> +acpi_ss.add(when: 'CONFIG_WDT_SBSA', if_true: files('wdat-gwdt.c'))
>  if have_tpm
>    acpi_ss.add(files('tpm.c'))
>  endif
>  system_ss.add(when: 'CONFIG_ACPI', if_false: files('acpi-stub.c', 'aml-build-stub.c', 'ghes-stub.c', 'acpi_interface.c'))
>  system_ss.add(when: 'CONFIG_ACPI_PCI_BRIDGE', if_false: files('pci-bridge-stub.c'))
>  system_ss.add(when: 'CONFIG_ACPI_ICH9', if_false: files('wdat-ich9-stub.c'))
> +system_ss.add(when: 'CONFIG_WDT_SBSA', if_false: files('wdat-gwdt-stub.c'))
>  system_ss.add_all(when: 'CONFIG_ACPI', if_true: acpi_ss)
>  system_ss.add(when: 'CONFIG_GHES_CPER', if_true: files('ghes_cper.c'))
>  system_ss.add(when: 'CONFIG_GHES_CPER', if_false: files('ghes_cper_stub.c'))
> diff --git a/hw/acpi/wdat-gwdt-stub.c b/hw/acpi/wdat-gwdt-stub.c
> new file mode 100644
> index 0000000000..4d43783f70
> --- /dev/null
> +++ b/hw/acpi/wdat-gwdt-stub.c
> @@ -0,0 +1,16 @@
> +/*
> + * Copyright Red Hat, Inc. 2026
> + * Author(s): Igor Mammedov <imammedo@redhat.com>
> + *
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + */
> +
> +#include "qemu/osdep.h"
> +#include "hw/acpi/wdat-gwdt.h"
> +
> +void build_gwdt_wdat(GArray *table_data, BIOSLinker *linker, const char *oem_id,
> +                     const char *oem_table_id, uint64_t rbase, uint64_t cbase,
> +                     uint64_t freq)
> +{
> +    g_assert_not_reached();
> +}
> diff --git a/hw/acpi/wdat-gwdt.c b/hw/acpi/wdat-gwdt.c
> new file mode 100644
> index 0000000000..226ba3f01e
> --- /dev/null
> +++ b/hw/acpi/wdat-gwdt.c
> @@ -0,0 +1,92 @@
> +/*
> + * SBSA GWDT Watchdog Action Table (WDAT)
> + *
> + * Copyright Red Hat, Inc. 2026
> + * Author(s): Igor Mammedov <imammedo@redhat.com>
> + *
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + */
> +
> +#include "qemu/osdep.h"
> +#include "hw/acpi/aml-build.h"
> +#include "hw/acpi/wdat-gwdt.h"
> +#include "hw/acpi/wdat.h"
> +#include "hw/watchdog/sbsa_gwdt.h"
> +
> +#define GWDT_REG(base, reg_offset, reg_width) { \
> +                 .space_id = AML_AS_SYSTEM_MEMORY, \
> +                 .address = base + reg_offset, .bit_width = reg_width, \
> +                 .access_width = AML_DWORD_ACC };
> +
> +/*
> + *   "Hardware Watchdog Timers Design Specification"
> + *       https://uefi.org/acpi 'Watchdog Action Table (WDAT)'
> + */
> +void build_gwdt_wdat(GArray *table_data, BIOSLinker *linker, const char *oem_id,
> +                     const char *oem_table_id, uint64_t rbase, uint64_t cbase,
> +                     uint64_t freq)
> +{
> +    AcpiTable table = { .sig = "WDAT", .rev = 1, .oem_id = oem_id,
> +                        .oem_table_id = oem_table_id };
> +
> +    struct AcpiGenericAddress wrr =  GWDT_REG(rbase, 0x0, 32);
> +    struct AcpiGenericAddress wor_l =  GWDT_REG(cbase, SBSA_GWDT_WOR, 32);
> +    struct AcpiGenericAddress wcs =  GWDT_REG(cbase, SBSA_GWDT_WCS, 32);
> +
> +    acpi_table_begin(&table, table_data);
> +    build_append_int_noprefix(table_data, 0x20, 4); /* Watchdog Header Length */
you can add a comment that 0xff must be set for following 3 fields as
not a PCI device.
> +    build_append_int_noprefix(table_data, 0xff, 2); /* PCI Segment */
> +    build_append_int_noprefix(table_data, 0xff, 1); /* PCI Bus Number */
> +    build_append_int_noprefix(table_data, 0xff, 1); /* PCI Device Number */
> +    build_append_int_noprefix(table_data, 0xff, 1); /* PCI Function Number */
> +    build_append_int_noprefix(table_data, 0, 3);    /* Reserved */
> +    /*
> +     * WDAT spec suports only 1KHz or more coarse watchdog timer,
> +     * Set resolution to minimum supported 1ms.
> +     * Before starting watchdog Windows set countdown value to 5min.
> +     */
> +    g_assert(freq <= 1000);
> +    build_append_int_noprefix(table_data, 1, 4);/* Timer Period, ms */
it is a bit weird to hardcode the freq while it is passed as parameter.
Why don't you propagate it in the table?
> +    /*
> +     * Needs to be more than 4min, otherwise Windows 11 won't start watchdog.
spec says:
"
The time-out period before the WDT fires is recommended to be at least 5
minutes and is required to be less than 4,294,967,296 count intervals.
"
where does the 4 min come from?
> +     * Set max to limits to arbitrary max 10min and min to 5sec.
> +     */
> +    build_append_int_noprefix(table_data, 600 * freq, 4);/* Maximum Count */
spec says this is in count interval and not in ms, no?
> +    build_append_int_noprefix(table_data, 5 * freq, 4);  /* Minimum Count */
same
> +    /*
> +     * WATCHDOG_ENABLED
and stopped in sleep state?
> +     */
> +    build_append_int_noprefix(table_data, 0x81, 1); /* Watchdog Flags */
> +    build_append_int_noprefix(table_data, 0, 3);    /* Reserved */
> +    /*
> +     * watchdog instruction entries
> +     */
> +    build_append_int_noprefix(table_data, 8, 4);
> +    /* Action table */
> +    build_append_wdat_ins(table_data, WDAT_ACTION_QUERY_RUNNING_STATE,
> +        WDAT_INS_READ_VALUE,
> +        wcs, 0x1, 0x1);
> +    build_append_wdat_ins(table_data, WDAT_ACTION_RESET,
> +        WDAT_INS_WRITE_VALUE,
> +        wrr, 0x1, 0x7);
why 0x7? where did you get that mask value from

in DEN0094E_BSA_1.2.pdf

"0x000-0x003 WRR Watchdog refresh register. A write to this location
causes the watchdog to refresh and start a new
watch period. A read has no effect and returns 0."
> +    build_append_wdat_ins(table_data, WDAT_ACTION_SET_COUNTDOWN_PERIOD,
> +        WDAT_INS_WRITE_COUNTDOWN,
> +        wor_l, 0, 0xffffffff);
How does the above intrustuction work? How the countdown period is
passed? what does the 0 mean in that case?

I would rather group instructions on wcs and then instructions using wor
or wrr
> +    build_append_wdat_ins(table_data, WDAT_ACTION_SET_RUNNING_STATE,
> +        WDAT_INS_WRITE_VALUE | WDAT_INS_PRESERVE_REGISTER,
> +        wcs, 1, 0x00000001);
> +    build_append_wdat_ins(table_data, WDAT_ACTION_QUERY_STOPPED_STATE,
> +        WDAT_INS_READ_VALUE,
> +        wcs, 0x0, 0x00000001);
> +    build_append_wdat_ins(table_data, WDAT_ACTION_SET_STOPPED_STATE,
> +        WDAT_INS_WRITE_VALUE | WDAT_INS_PRESERVE_REGISTER,
> +        wcs, 0x0, 0x00000001);
> +    build_append_wdat_ins(table_data, WDAT_ACTION_QUERY_WATCHDOG_STATUS,
> +        WDAT_INS_READ_VALUE,
> +        wcs, 0x4, 0x00000004);
reflects the status of WS1 only (and not WS0). Can you explain why this
is what we want?
> +    build_append_wdat_ins(table_data, WDAT_ACTION_SET_WATCHDOG_STATUS,
> +        WDAT_INS_WRITE_VALUE | WDAT_INS_PRESERVE_REGISTER,
> +        wrr, 0x4, 0x4);

> +
> +    acpi_table_end(linker, &table);
> +}
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index 9c14b1d4d5..e9670b1a2b 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -65,6 +65,7 @@
>  #include "target/arm/cpu.h"
>  #include "target/arm/multiprocessing.h"
>  #include "hw/watchdog/sbsa_gwdt.h"
> +#include "hw/acpi/wdat-gwdt.h"
>  
>  #define ARM_SPI_BASE 32
>  
> @@ -849,12 +850,25 @@ build_srat(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>      acpi_table_end(linker, &table);
>  }
>  
> +static void virt_get_wdt_options(VirtMachineState *vms, Object *wdt,
> +                                 hwaddr *rbase, hwaddr *cbase, int *irq)
> +{
> +    PlatformBusDevice *pbus = PLATFORM_BUS_DEVICE(vms->platform_bus_dev);
> +    SysBusDevice *sd = SYS_BUS_DEVICE(wdt);
> +    hwaddr mmio_base = vms->memmap[VIRT_PLATFORM_BUS].base;
> +    *rbase = mmio_base + platform_bus_get_mmio_addr(pbus, sd, 0);
> +    *cbase = mmio_base + platform_bus_get_mmio_addr(pbus, sd, 1);
> +    *irq = ARM_SPI_BASE + vms->irqmap[VIRT_PLATFORM_BUS] +
> +           platform_bus_get_irqn(pbus, sd, 0);
> +}
> +
>  /*
>   * ACPI spec, Revision 6.5
>   * 5.2.25 Generic Timer Description Table (GTDT)
>   */
>  static void
> -build_gtdt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
> +build_gtdt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms,
> +           Object *wdt, bool add_watchdog)
>  {
>      /*
>       * Table 5-117 Flag Definitions
> @@ -865,7 +879,6 @@ build_gtdt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>      AcpiTable table = { .sig = "GTDT", .rev = 3, .oem_id = vms->oem_id,
>                          .oem_table_id = vms->oem_table_id };
>      uint32_t gtdt_start = table_data->len;
> -    Object *wdt = object_resolve_type_unambiguous(TYPE_WDT_SBSA, NULL);
>  
>      acpi_table_begin(&table, table_data);
>  
> @@ -898,12 +911,12 @@ build_gtdt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>      build_append_int_noprefix(table_data, 0xFFFFFFFFFFFFFFFF, 8);
>  
>      /* Platform Timer Count */
> -    build_append_int_noprefix(table_data,  wdt ? 1 : 0, 4);
> +    build_append_int_noprefix(table_data,  add_watchdog ? 1 : 0, 4);
>      /* Platform Timer Offset */
>      build_append_int_noprefix(table_data,
> -        wdt ? (table_data->len - gtdt_start) +
> -              4 + 4 + 4 /* len of this & following 2 fields to skip */
> -            : 0, 4);
> +        add_watchdog ? (table_data->len - gtdt_start) +
this patch is big. You could easily move the add_wathdog +
virt_get_wdt_options() helper in a different patch
> +                       4 + 4 + 4 /* len of this & following 2 fields to skip */
> +                     : 0, 4);
>  
>      if (vms->ns_el2_virt_timer_irq) {
>          /* Virtual EL2 Timer GSIV */
> @@ -916,14 +929,10 @@ build_gtdt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>      }
>  
>      /* ACPI 6.5 spec: 5.2.25.2 ARM Generic Watchdog Structure (Table 5-124) */
> -    if (wdt) {
> -        PlatformBusDevice *pbus = PLATFORM_BUS_DEVICE(vms->platform_bus_dev);
> -        SysBusDevice *sd = SYS_BUS_DEVICE(wdt);
> -        hwaddr mmio_base = vms->memmap[VIRT_PLATFORM_BUS].base;
> -        hwaddr rbase = mmio_base + platform_bus_get_mmio_addr(pbus, sd, 0);
> -        hwaddr cbase = mmio_base + platform_bus_get_mmio_addr(pbus, sd, 1);
> -        int irq = ARM_SPI_BASE + vms->irqmap[VIRT_PLATFORM_BUS] +
> -                  platform_bus_get_irqn(pbus, sd, 0);
> +    if (add_watchdog) {
> +        int irq;
> +        hwaddr rbase, cbase;
> +        virt_get_wdt_options(vms, wdt, &rbase, &cbase, &irq);
>  
>          build_append_int_noprefix(table_data, 1 /* Type: Watchdog GT */, 1);
>          build_append_int_noprefix(table_data, 28 /* Length */, 2);
> @@ -1282,8 +1291,14 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
>      VirtMachineClass *vmc = VIRT_MACHINE_GET_CLASS(vms);
>      GArray *table_offsets;
>      unsigned dsdt, xsdt;
> +    bool has_wdat = false;
>      GArray *tables_blob = tables->table_data;
>      MachineState *ms = MACHINE(vms);
> +    Object *wdt = object_resolve_type_unambiguous(TYPE_WDT_SBSA, NULL);
> +
> +    if (wdt) {
> +        has_wdat = object_property_get_bool(wdt, "wdat", &error_abort);
> +    }
>  
>      table_offsets = g_array_new(false, true /* clear */,
>                                          sizeof(uint32_t));
> @@ -1303,6 +1318,19 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
>      acpi_add_table(table_offsets, tables_blob);
>      build_madt(tables_blob, tables->linker, vms);
>  
> +    acpi_add_table(table_offsets, tables_blob);
> +    if (wdt && has_wdat) {
> +        int irq;
> +        hwaddr rbase, cbase;
> +        uint64_t freq = object_property_get_uint(wdt, "clock-frequency",
> +                                                 &error_abort);
> +        virt_get_wdt_options(vms, wdt, &rbase, &cbase, &irq);
> +
> +        build_gwdt_wdat(tables_blob, tables->linker,
> +                        vms->oem_id, vms->oem_table_id,
> +                        rbase, cbase, freq);
> +    }
> +
>      if (!vmc->no_cpu_topology) {
>          acpi_add_table(table_offsets, tables_blob);
>          build_pptt(tables_blob, tables->linker, ms,
> @@ -1310,7 +1338,7 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
>      }
>  
>      acpi_add_table(table_offsets, tables_blob);
> -    build_gtdt(tables_blob, tables->linker, vms);
> +    build_gtdt(tables_blob, tables->linker, vms, wdt, wdt && !has_wdat);
>  
>      acpi_add_table(table_offsets, tables_blob);
>      {
Thanks

Eric


