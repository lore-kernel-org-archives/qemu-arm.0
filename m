Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28BC7C43602
	for <qemu-arm@archiver.kernel.org>; Mon, 29 Jun 2026 12:15:42 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1weAtX-0004uc-Ko; Mon, 29 Jun 2026 08:15:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eauger@redhat.com>) id 1weAtW-0004sf-Ie
 for qemu-arm@nongnu.org; Mon, 29 Jun 2026 08:15:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eauger@redhat.com>) id 1weAtU-0006KW-Gc
 for qemu-arm@nongnu.org; Mon, 29 Jun 2026 08:15:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1782735319;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NpQPJOYlbKsGqmZzUDVtJ1mJHqH+cuJnb9/K+tTKSsM=;
 b=NDBSju1BLnEyYQIe0UoCIQul+yjyw4i9o45ch7iCPwejiD8SnayGlKvmMFX10+Q/l4Mbfx
 TAj5qaz9kBgSTyCTnzBSMJgAtjW91yrEU7Wyss9tfhvipxBqwyQqHDiy4HhOzDmXt7z+az
 aKxOA9Gvym9irDgvyRFAqRXLwF58Ubo=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-232-dQXzFcgnMDCryN6srA896g-1; Mon, 29 Jun 2026 08:15:16 -0400
X-MC-Unique: dQXzFcgnMDCryN6srA896g-1
X-Mimecast-MFC-AGG-ID: dQXzFcgnMDCryN6srA896g_1782735315
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-47485fde05aso278103f8f.0
 for <qemu-arm@nongnu.org>; Mon, 29 Jun 2026 05:15:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782735315; x=1783340115;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NpQPJOYlbKsGqmZzUDVtJ1mJHqH+cuJnb9/K+tTKSsM=;
 b=P/9membuuvO9Fqa9thnH66t85MVIBWWOF8uMW6GqEjOM7LQIn+tJnR+apXAxChtAK2
 OmPcs0AsInzvau0BGlrQEVwwNSuF9dFMMnatGSVnf4Iff11fu+W6eB+BlsBGPPP5KbFB
 Ow4U5wIdVAoTuNaS728KJWXZ2nA5WejpeyOHQqXiOvtbNIlCwZgRx2xQM777LL1KfF0z
 vjfTrqGHpxJnZsRLMWF3gVqjOoku7/tF6EpJgtI3RK7qVfTrCnYrtAgP1iPbydB05MLr
 ehRmBuyLsz01CTRp0RKVsaT2/DiuWwzCr20vZo3T1uNH2SniY46jmXeT9cd4iAi7MGZo
 E2Bg==
X-Forwarded-Encrypted: i=1;
 AHgh+Rpnl/ESxtNqWLbto7bLOg6QqFHRPQ0cODpM84qeC4bHt/O1/hWESNm1e9SGLc6QJLCkvPQUrl64bQ==@nongnu.org
X-Gm-Message-State: AOJu0YyIrG6ojOZCnRr2Ca82S2MLGi5KR+bQM/r23rcPcyml+s76y+Ky
 zSh0oYnnRRc1cGLiDnZc8iPBBtrOaJf6Bk3693pndpf4mfWbtPFN1G3UcTCDyoaw3yGZF2mOAUp
 VT2Jnc9maMN2NfnkbUd9yDBcJJDvrKeVGjFviDxrqtvDdWwiaMwsuZtFkRDmAUw==
X-Gm-Gg: AfdE7ck1NoDVnIKHWEkgEq2zDe/PKNaK3UzelAbXIX5g0InbrPEg35AOUcwJGisdV1x
 tXyrNTv0p778n9rbiUG3hEhvWy/x+7uJ3w5X8gZCAR+Ak0S/uROK0+2Jcv6hELGk9HLYdWSWatQ
 8k4Iia0FGJZZSxP14C4YrpCVH8v1WHT1zdkI4adPCjHu3PTu4PzgAy4QXxguJgUXcnRWugs3Inu
 FKbZGQpMtq9Yrf3Jpi94cXjSv9Wo5Bch12f5qat6JiCW2/gsAetex+zzIDbrwbc+BhA26AOp+1p
 rnhRGUF+uGQYUBRjtGrCnzg6n9rapp5OR2JZwLse0HfmchDKPZSnpWIY9gplkCBN3mfrehYF464
 PU3b1u7u5sQVVYMBQ6gMNbJM+yTqxI9FKENLhBHi1tFZeyfVa3WJ0Lw==
X-Received: by 2002:a05:6000:29db:b0:45d:3aa3:7f76 with SMTP id
 ffacd0b85a97d-46dc14cbf6emr19408244f8f.33.1782735315413; 
 Mon, 29 Jun 2026 05:15:15 -0700 (PDT)
X-Received: by 2002:a05:6000:29db:b0:45d:3aa3:7f76 with SMTP id
 ffacd0b85a97d-46dc14cbf6emr19408204f8f.33.1782735314996; 
 Mon, 29 Jun 2026 05:15:14 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-46f9db29a94sm28598349f8f.22.2026.06.29.05.15.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Jun 2026 05:15:14 -0700 (PDT)
Message-ID: <50466e87-36f6-4462-ac01-dbdcb2745891@redhat.com>
Date: Mon, 29 Jun 2026 14:15:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 07/17] arm: virt: add support for WDAT based watchdog
To: Igor Mammedov <imammedo@redhat.com>, qemu-devel@nongnu.org
Cc: mst@redhat.com, peter.maydell@linaro.org, shannon.zhaosl@gmail.com,
 rad@semihalf.com, leif.lindholm@oss.qualcomm.com, qemu-arm@nongnu.org
References: <20260624102830.1355552-1-imammedo@redhat.com>
 <20260624102830.1355552-8-imammedo@redhat.com>
From: Eric Auger <eauger@redhat.com>
In-Reply-To: <20260624102830.1355552-8-imammedo@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: MbVUc6b7j6PgDN7aL_Kz8IEHX0vn-6sPhRonaZOejNw_1782735315
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eauger@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.445,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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



On 6/24/26 12:28 PM, Igor Mammedov wrote:
> Add WDAT handling for sbsa-gwdt on arm/virt machine.
> 
> WDAT mode is enabled by 'wdat' option: ex: "-device sbsa-gwdt,wdat=on"
> 
> When WDAT is enabled:
>  - Build the WDAT ACPI table instead of the GTDT watchdog entry,
>    since they are mutually exclusive due to different timer
>    resolution (WDAT uses 1 kHz vs GTDT's system counter frequency).
>  - Skip FDT watchdog node creation, as the DT-based Linux driver
>    would use the system counter frequency which doesn't match the
>    WDAT-mode 1 kHz clock.
> 
> Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> ---
> v3:
>    - Skip FDT watchdog node creation in wdat mode
>    (Eric)
>      - wiring part of larger '[PATCH v2 11/21] arm: virt: add support for WDAT based watchdog'
> ---
>  hw/arm/virt-acpi-build.c | 34 ++++++++++++++++++++++++++--------
>  hw/arm/virt.c            | 10 ++++++----
>  2 files changed, 32 insertions(+), 12 deletions(-)
> 
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index f5b3b4ce48..71706b98e6 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -65,6 +65,7 @@
>  #include "target/arm/cpu.h"
>  #include "target/arm/multiprocessing.h"
>  #include "hw/watchdog/sbsa_gwdt.h"
> +#include "hw/acpi/wdat-gwdt.h"
>  
>  #include "smmuv3-accel.h"
>  #include "tegra241-cmdqv.h"
> @@ -859,7 +860,8 @@ build_srat(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>   * 5.2.25 Generic Timer Description Table (GTDT)
>   */
>  static void
> -build_gtdt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
> +build_gtdt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms,
> +           Object *wdt, bool add_watchdog)
wdt is not used anymore

With that fixed
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Thanks

Eric


>  {
>      /*
>       * Table 5-117 Flag Definitions
> @@ -870,7 +872,6 @@ build_gtdt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>      AcpiTable table = { .sig = "GTDT", .rev = 3, .oem_id = vms->oem_id,
>                          .oem_table_id = vms->oem_table_id };
>      uint32_t gtdt_start = table_data->len;
> -    Object *wdt = object_resolve_type_unambiguous(TYPE_WDT_SBSA, NULL);
>  
>      acpi_table_begin(&table, table_data);
>  
> @@ -903,12 +904,12 @@ build_gtdt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
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
> +                       4 + 4 + 4 /* len of this & following 2 fields to skip */
> +                     : 0, 4);
>  
>      if (vms->ns_el2_virt_timer_irq) {
>          /* Virtual EL2 Timer GSIV */
> @@ -921,7 +922,7 @@ build_gtdt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>      }
>  
>      /* ACPI 6.5 spec: 5.2.25.2 ARM Generic Watchdog Structure (Table 5-124) */
> -    if (wdt) {
> +    if (add_watchdog) {
>          hwaddr rbase = vms->memmap[VIRT_GWDT_REFRESH].base;
>          hwaddr cbase = vms->memmap[VIRT_GWDT_CONTROL].base;
>          int irq = ARM_SPI_BASE + vms->irqmap[VIRT_GWDT_WS0];
> @@ -1332,13 +1333,19 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
>      VirtMachineClass *vmc = VIRT_MACHINE_GET_CLASS(vms);
>      GArray *table_offsets;
>      unsigned dsdt, xsdt;
> +    bool has_wdat = false;
>      GArray *tables_blob = tables->table_data;
>      MachineState *ms = MACHINE(vms);
>      CPUCoreCaches caches[CPU_MAX_CACHES];
>      unsigned int num_caches;
> +    Object *wdt = object_resolve_type_unambiguous(TYPE_WDT_SBSA, NULL);
>  
>      num_caches = virt_get_caches(vms, caches);
>  
> +    if (wdt) {
> +        has_wdat = object_property_get_bool(wdt, "wdat", &error_abort);
> +    }
> +
>      table_offsets = g_array_new(false, true /* clear */,
>                                          sizeof(uint32_t));
>  
> @@ -1357,6 +1364,17 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
>      acpi_add_table(table_offsets, tables_blob);
>      build_madt(tables_blob, tables->linker, vms);
>  
> +    acpi_add_table(table_offsets, tables_blob);
> +    if (wdt && has_wdat) {
> +        uint64_t freq = object_property_get_uint(wdt, "clock-frequency",
> +                                                 &error_abort);
> +        build_gwdt_wdat(tables_blob, tables->linker,
> +                        vms->oem_id, vms->oem_table_id,
> +                        vms->memmap[VIRT_GWDT_REFRESH].base,
> +                        vms->memmap[VIRT_GWDT_CONTROL].base,
> +                        freq);
> +    }
> +
>      if (!vmc->no_cpu_topology) {
>          acpi_add_table(table_offsets, tables_blob);
>          build_pptt(tables_blob, tables->linker, ms, vms->oem_id,
> @@ -1364,7 +1382,7 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
>      }
>  
>      acpi_add_table(table_offsets, tables_blob);
> -    build_gtdt(tables_blob, tables->linker, vms);
> +    build_gtdt(tables_blob, tables->linker, vms, wdt, wdt && !has_wdat);
>  
>      acpi_add_table(table_offsets, tables_blob);
>      {
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index aacf9b7251..35ded6d1d4 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -3825,9 +3825,11 @@ static void virt_machine_device_pre_plug_cb(HotplugHandler *hotplug_dev,
>          qdev_prop_set_array(dev, "reserved-regions", reserved_regions);
>          g_free(resv_prop_str);
>      } else if (object_dynamic_cast(OBJECT(dev), TYPE_WDT_SBSA)) {
> -        uint64_t cntfrq = object_property_get_int(OBJECT(qemu_get_cpu(0)),
> -                                                  "cntfrq", &error_abort);
> -        qdev_prop_set_uint64(dev, "clock-frequency", cntfrq);
> +        if (!object_property_get_bool(OBJECT(dev), "wdat", &error_abort)) {
> +            uint64_t cntfrq = object_property_get_int(OBJECT(qemu_get_cpu(0)),
> +                                                      "cntfrq", &error_abort);
> +            qdev_prop_set_uint64(dev, "clock-frequency", cntfrq);
> +        }
>      } else if (object_dynamic_cast(OBJECT(dev), TYPE_ARM_SMMUV3)) {
>          if (vms->legacy_smmuv3_present || vms->iommu == VIRT_IOMMU_VIRTIO) {
>              error_setg(errp, "virt machine already has %s set. "
> @@ -3890,7 +3892,7 @@ static void virt_machine_device_plug_cb(HotplugHandler *hotplug_dev,
>          sysbus_mmio_map(s, 1, cbase);
>          sysbus_connect_irq(s, 0, qdev_get_gpio_in(vms->gic, irq));
>  
> -        {
> +        if (!object_property_get_bool(OBJECT(dev), "wdat", &error_abort)) {
>              char *nodename = g_strdup_printf("/watchdog@%" PRIx64, cbase);
>  
>              qemu_fdt_add_subnode(ms->fdt, nodename);


