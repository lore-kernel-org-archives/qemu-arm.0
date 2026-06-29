Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8082C43458
	for <qemu-arm@archiver.kernel.org>; Mon, 29 Jun 2026 12:12:04 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1weAmg-0001EF-GF; Mon, 29 Jun 2026 08:08:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eauger@redhat.com>) id 1weAm1-0000bm-6l
 for qemu-arm@nongnu.org; Mon, 29 Jun 2026 08:07:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eauger@redhat.com>) id 1weAlz-0002us-8L
 for qemu-arm@nongnu.org; Mon, 29 Jun 2026 08:07:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1782734852;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ezUFCbGzc3lk4+mFKS+bGA0pzqv/MmFJyII6s6pxVBA=;
 b=EQdtADZcj8Cb8TfYvI+b0vlCt2vV4QAWxkOdbuODE/NF+ItFQbbOt1CHPYYTb38R6UpfS5
 7+jO4qbfyzYd63pT0NTYzlZo487t/gI700bmCVHtIqd6TnsN+3eQ9wjFjqhVREig/V+Z6v
 3Ta3IO7/4U0SkePi1oH08r7k/Zif5zk=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-538-OmpV8DEoMpKQndfyX5v7-A-1; Mon, 29 Jun 2026 08:07:29 -0400
X-MC-Unique: OmpV8DEoMpKQndfyX5v7-A-1
X-Mimecast-MFC-AGG-ID: OmpV8DEoMpKQndfyX5v7-A_1782734848
Received: by mail-ej1-f69.google.com with SMTP id
 a640c23a62f3a-bf481a6e4e6so215024466b.3
 for <qemu-arm@nongnu.org>; Mon, 29 Jun 2026 05:07:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782734848; x=1783339648;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ezUFCbGzc3lk4+mFKS+bGA0pzqv/MmFJyII6s6pxVBA=;
 b=Iq1hA1a3cnHCgKeZ8+xNXMvDrUDzhlnLYlJ7R0OIj9ZeU2ZBt6XySNbbK/8EQE82yk
 or1HoJbc+PER3cUqF41uIp2duAoBmoEXzM6M6vy9mPPBgeoEa/0x4MZJCwFrOv67ejtl
 KV64urAheQNt4qnk2xLJUNThuG+TfqWEmTKcZ5whDY2gOy4WrdrHQ7M5jilrIS2VimAu
 IRNZnd1XvTGY4om+jAFUWJgan0jq5eXE6NNvF8hu8AGYLpLPyf9R6L6SGtTyOjcG+c7i
 TgyjhLmglwsyGyBaS1hK0RPuN2SOOOg41WGSNrq3YodRTHcJqBJnaSNffbuVN7EmPFQ8
 7IYw==
X-Forwarded-Encrypted: i=1;
 AHgh+Rq0RuO3XXKpPslUvM4MiOlJCUNaBrFdNfMPFNY12JxyEDadn3G3XdX43zV+Ur7bH7pUkQ43U3XHAQ==@nongnu.org
X-Gm-Message-State: AOJu0YyFY0z4YWjPxSmttMBvar5dAFB6ReAzgUbTzD99rd+yWLRO+zgd
 YmdGPlKWyNhSiQABGvOyuRAwbEEzBAn1JPpzR833mNE/CoO9of5oa5oO1JKPC124MzcbnpcnkD9
 UvOlrIsM2PPIHTLMkLm4AdigAOvVgLEMjw/tVBdBa+Df0m5sg4Vyvjw==
X-Gm-Gg: AfdE7cmyOQnjMEtEXEnwKGBHhITySGqimMlmz0vCJuh9fnr3d3/zr4NcI5GN04DpOf5
 OGh4aeBU6CuJUsZe8DdAdo+h6kVVKpzZWd1NpOgNJOoLxtF8Dqj2EnSE+2WmxCKZ78TJYLn23o0
 642kwF6ArM0mfYVwmQN/En0ggJk3BCRKTe3/MgNRnbzPI8o2/cCHj9Thfr3HMr6v1vwWACs/pbl
 qvhf5Tj3WxKiBRXS69/R44wr/ukcEKeOf+0IDDV511fSoaNa8eMDXFPUzrqoEdVSIPz79spLzdc
 zXnZdXIlyHaWH37XXB+g7bI8/dY1ykV4BWrdqtOWDjHSJfJ1VEp3/Cw07dFOdvv3zEXjcIOlnlq
 MTvUnkEmzPMk7VvoZmLIRXuvqfwSaNnS/ZNb71eT0N7ZpAIEAFshe7Q==
X-Received: by 2002:a17:907:72d2:b0:c12:77ee:4416 with SMTP id
 a640c23a62f3a-c1277ee4a9cmr75512166b.43.1782734847969; 
 Mon, 29 Jun 2026 05:07:27 -0700 (PDT)
X-Received: by 2002:a17:907:72d2:b0:c12:77ee:4416 with SMTP id
 a640c23a62f3a-c1277ee4a9cmr75510966b.43.1782734847454; 
 Mon, 29 Jun 2026 05:07:27 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c1252b4e6e0sm249885766b.2.2026.06.29.05.07.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Jun 2026 05:07:26 -0700 (PDT)
Message-ID: <ee804443-50ec-4384-8b05-478d4946d4eb@redhat.com>
Date: Mon, 29 Jun 2026 14:07:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 06/17] acpi: introduce WDAT table for GWDT
To: Igor Mammedov <imammedo@redhat.com>, qemu-devel@nongnu.org
Cc: mst@redhat.com, peter.maydell@linaro.org, shannon.zhaosl@gmail.com,
 rad@semihalf.com, leif.lindholm@oss.qualcomm.com, qemu-arm@nongnu.org
References: <20260624102830.1355552-1-imammedo@redhat.com>
 <20260624102830.1355552-7-imammedo@redhat.com>
From: Eric Auger <eauger@redhat.com>
In-Reply-To: <20260624102830.1355552-7-imammedo@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: PmvX0dqBC_8Ujk9AN_3NRhyvI_X5rPPXbDd3i7Xpn0A_1782734848
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
> Add build_gwdt_wdat() to generate a Watchdog Action Table
> tailored for the SBSA Generic Watchdog Timer.
> 
> Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> ---
> v3:
>   (Eric)
>     - split '[PATCH v2 11/21] arm: virt: add support for WDAT based watchdog'
>       on smaller chunks.
>     - add/improve  comments where requested
>     - actualy use 'freq' argument passed down by caller
>     - simplify magic val on WRR write and add comment
>     - group table records by used register
> ---
>  include/hw/acpi/wdat-gwdt.h | 19 +++++++
>  hw/acpi/meson.build         |  2 +
>  hw/acpi/wdat-gwdt-stub.c    | 16 ++++++
>  hw/acpi/wdat-gwdt.c         | 99 +++++++++++++++++++++++++++++++++++++
>  4 files changed, 136 insertions(+)
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
> index 0c7bfb278a..09ad488a04 100644
> --- a/hw/acpi/meson.build
> +++ b/hw/acpi/meson.build
> @@ -31,11 +31,13 @@ acpi_ss.add(when: 'CONFIG_ACPI_ERST', if_true: files('erst.c'))
>  acpi_ss.add(when: 'CONFIG_IPMI', if_true: files('ipmi.c'))
>  stub_ss.add(files('ipmi-stub.c'))
>  stub_ss.add(files('acpi-x86-stub.c'))
> +acpi_ss.add(when: 'CONFIG_WDT_SBSA', if_true: files('wdat-gwdt.c'))
>  if have_tpm
>    acpi_ss.add(files('tpm.c'))
>  endif
>  stub_ss.add(files('acpi-stub.c', 'aml-build-stub.c', 'ghes-stub.c'))
>  stub_ss.add(files('pci-bridge-stub.c'))
> +stub_ss.add(files('wdat-gwdt-stub.c'))
>  system_ss.add_all(when: 'CONFIG_ACPI', if_true: acpi_ss)
>  system_ss.add(when: 'CONFIG_GHES_CPER', if_true: files('ghes_cper.c'))
>  stub_ss.add(files('ghes_cper_stub.c'))
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
> index 0000000000..b30566ef6a
> --- /dev/null
> +++ b/hw/acpi/wdat-gwdt.c
> @@ -0,0 +1,99 @@
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
nit: alignment is a bit strange + leading blanks
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
> +    /*
> +     * PCI location fields are set to 0xff to indicate
> +     * that the watchdog is not a PCI device.
> +     */
> +    build_append_int_noprefix(table_data, 0xff, 2); /* PCI Segment */
> +    build_append_int_noprefix(table_data, 0xff, 1); /* PCI Bus Number */
> +    build_append_int_noprefix(table_data, 0xff, 1); /* PCI Device Number */
> +    build_append_int_noprefix(table_data, 0xff, 1); /* PCI Function Number */
> +    build_append_int_noprefix(table_data, 0, 3);    /* Reserved */
> +    /*
> +     * WDAT spec: "The clock interval that the WDT uses must be
> +     * greater than or equal to 1 millisecond."
> +     */
> +    g_assert(freq <= 1000);
> +    /* Timer Period, ms */
> +    build_append_int_noprefix(table_data, 1000 / freq, 4);
> +    /*
> +     * WDAT spec: "The time-out period before the WDT fires is recommended
> +     * to be at least 5 minutes."
> +     * Set max count to 10min and min count to 5sec.
> +     */
> +    build_append_int_noprefix(table_data, 600 * freq, 4); /* Maximum Count */
> +    build_append_int_noprefix(table_data, 5 * freq, 4);   /* Minimum Count */
> +    /*
> +     * WATCHDOG_ENABLED | WATCHDOG_STOPPED_IN_SLEEP_STATE
> +     */
> +    build_append_int_noprefix(table_data, 0x81, 1); /* Watchdog Flags */
> +    build_append_int_noprefix(table_data, 0, 3);    /* Reserved */
> +    /*
> +     * watchdog instruction entries
> +     */
> +    build_append_int_noprefix(table_data, 8, 4);
> +    /* Action table: WCS (control/status) register actions */
> +    build_append_wdat_ins(table_data, WDAT_ACTION_QUERY_RUNNING_STATE,
> +        WDAT_INS_READ_VALUE,
> +        wcs, 0x1, 0x1);
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
> +    /* WOR (offset) and WRR (refresh) register actions */
> +    build_append_wdat_ins(table_data, WDAT_ACTION_SET_COUNTDOWN_PERIOD,
> +        WDAT_INS_WRITE_COUNTDOWN,
> +        wor_l, 0, 0xffffffff);
> +    /* WRR: any write refreshes the watchdog, value is ignored */
> +    build_append_wdat_ins(table_data, WDAT_ACTION_RESET,
> +        WDAT_INS_WRITE_VALUE,
> +        wrr, 0x1, 0x1);
> +    build_append_wdat_ins(table_data, WDAT_ACTION_SET_WATCHDOG_STATUS,
> +        WDAT_INS_WRITE_VALUE | WDAT_INS_PRESERVE_REGISTER,
> +        wrr, 0x4, 0x4);
> +
> +    acpi_table_end(linker, &table);
> +}

Besides, looks good to me after your additional information on my
comments/questions on v2

Reviewed-by: Eric Auger <eric.auger@redhat.com>

Thanks

Eric


