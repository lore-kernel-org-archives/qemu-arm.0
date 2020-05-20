Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp586190lfb;
        Wed, 20 May 2020 06:35:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzhoUjaXbAEtBz/vf5Cs3N9boaG92rR86lqS0tEFkARXplR6zGrJBhT2HBKOLTfRGLSgFhf
X-Received: by 2002:a0c:e806:: with SMTP id y6mr5027574qvn.177.1589981721032;
        Wed, 20 May 2020 06:35:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1589981721; cv=none;
        d=google.com; s=arc-20160816;
        b=075SvTwCtatWm1kifpwK4q6o65plPZFoOwFqy3KzezOmvVusvzC7rfOzFee43Te5ZK
         AfYOTvfK8lwxpCMtkiMyfwBgajNkflW3wqjuJJVKvDmJ9KXb7mpRiAsSS+0sSA/yBTYb
         3ZH3m4xJ1+Q5tswJeMVyQZoWdObrpJcgZwj5WMkIQvm3DyvNLkBRNfEZmTYegYqcXF5M
         NYzoC+J6i6b6A3sfyuLHDMMVGp6dtKPIA39Fj1f6flQcvU7OaXfY86/zrvH6VfGnUEb9
         eYuwQYfC+gvAW6CrNiajAQW9QS+QM4x5B6FAc5j3rvEYVebszW01KTziFZhOVdZ+kvMi
         Nk/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=259SQf8MsHPnu7kDI97KADrK0adDLm45df22i1hlbp8=;
        b=Ny51ClYMIHuxSnn6zd4/pMmhDYnE5/sPPjJiDGN4j0UpECYtjLeMKGJ9HUFr/3jkQ1
         A1rBLZVnW7HvdV+OZrWEB/oXz4BRazIeNi8fg/l/ryAuG1vcYio8/Txt19dA0kiiTmiC
         Rdgi00GGsZN45kUQ3zdKyd7otUwbi0s4u9ADexm/8otDeeZtTssGgBjGrPyCyjv7aB9P
         cOqa0Sl3aYC1zvOtVlJdGBxu4i4fmaTOa3687AwhKW91stsVbO69pYH/hMElHb3DTlXU
         Bx4Y+ZnL3i3/4hKumU1CFRSfm8uNetz4Tux+lUH1luEbDv+qWcvDP3SXUYmiOM5ni4ms
         F00w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Q0c9QEd2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q41si1517867qtb.266.2020.05.20.06.35.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 20 May 2020 06:35:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Q0c9QEd2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:37782 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jbOsR-0007WW-Ak
	for alex.bennee@linaro.org; Wed, 20 May 2020 09:35:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49408)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jbOoz-0008Pg-Hz
 for qemu-arm@nongnu.org; Wed, 20 May 2020 09:31:45 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:33284
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jbOox-0002Ur-GS
 for qemu-arm@nongnu.org; Wed, 20 May 2020 09:31:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589981502;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=259SQf8MsHPnu7kDI97KADrK0adDLm45df22i1hlbp8=;
 b=Q0c9QEd2i6zgdFnEMq6PZ+qXpjGjvEOhQhjyiyEJAHbv8bY88E77hke+TkU75bejGgUWBn
 9r3mc93GPHbZx+s1LE1v6zH/JLdDMfH9+vdrgejk+OOA/9RGF6Q+fRJOTCw1iXVUGISbFr
 mAJKQmua/1w1Zt48yt3JwmMgaBtp51M=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-197-_A_XPXLXMpabRhPxqt_wjw-1; Wed, 20 May 2020 09:31:40 -0400
X-MC-Unique: _A_XPXLXMpabRhPxqt_wjw-1
Received: by mail-wr1-f71.google.com with SMTP id x8so1411688wrl.16
 for <qemu-arm@nongnu.org>; Wed, 20 May 2020 06:31:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=259SQf8MsHPnu7kDI97KADrK0adDLm45df22i1hlbp8=;
 b=NjYCQ7TYwHCcPHMEwnn3usc/1SX8k1qOyvT9nWRop6iufTKcr+vRMHKxRI7ZN5h1iM
 jn5fAzxzZhHtxt2N4sIzJhw62f4Ozohk/s+d+GsvdABAvpeXoTijQXrPvYtdtAwKDLUH
 MGgc8MFvRZDJwtROkxyWaMqLF+HCRRR6DVcDYEGhRXoeHCfROq6aayWwUOyQLYs07l9R
 vLm5g/FhRo16/xYRMDlq+8SPsWfYuhqfXaU/yG0MWjIncNXxl+MBcVMHIzmzpV28moFV
 ZB76B4Po4h2kAhMYYP8jv+cY4K4tczrSt0EteiHTKqiPLdN7GvxqUFKCHuNdGg1dCMDB
 SzAQ==
X-Gm-Message-State: AOAM530J4nzIIt7A5hOQ0TUE56l9fxCtKHUQKUR/lXqUSGf0gik76DwE
 U7hPJlJyPadz2d0v6pfRn07B7GOJlox+EST76mtAo512plb4gYMJ8WW2EKFgTWs8D4dWCsk+Nf9
 Hs8B1HVk5wja2
X-Received: by 2002:a5d:4484:: with SMTP id j4mr4145319wrq.325.1589981499330; 
 Wed, 20 May 2020 06:31:39 -0700 (PDT)
X-Received: by 2002:a5d:4484:: with SMTP id j4mr4145289wrq.325.1589981498973; 
 Wed, 20 May 2020 06:31:38 -0700 (PDT)
Received: from [192.168.1.38] (17.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.17])
 by smtp.gmail.com with ESMTPSA id n7sm1748446wrj.39.2020.05.20.06.31.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 May 2020 06:31:38 -0700 (PDT)
Subject: Re: [PATCH v3 06/22] acpi: create acpi-common.c and move madt code
To: Gerd Hoffmann <kraxel@redhat.com>, qemu-devel@nongnu.org
References: <20200520132003.9492-1-kraxel@redhat.com>
 <20200520132003.9492-7-kraxel@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <4aac4bfc-1701-d181-ba21-ba0cafd12adb@redhat.com>
Date: Wed, 20 May 2020 15:31:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200520132003.9492-7-kraxel@redhat.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/20 04:09:34
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Sergio Lopez <slp@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Shannon Zhao <shannon.zhaosl@gmail.com>,
 qemu-arm@nongnu.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: i+V+1hV+7J+Y

On 5/20/20 3:19 PM, Gerd Hoffmann wrote:
> We'll need madt support for microvm.
> 
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> Reviewed-by: Igor Mammedov <imammedo@redhat.com>
> ---
>   hw/i386/acpi-common.h |  14 ++++
>   hw/i386/acpi-build.c  | 126 +---------------------------------
>   hw/i386/acpi-common.c | 152 ++++++++++++++++++++++++++++++++++++++++++
>   hw/i386/Makefile.objs |   1 +
>   4 files changed, 170 insertions(+), 123 deletions(-)
>   create mode 100644 hw/i386/acpi-common.h
>   create mode 100644 hw/i386/acpi-common.c
> 
> diff --git a/hw/i386/acpi-common.h b/hw/i386/acpi-common.h
> new file mode 100644
> index 000000000000..c30e461f1854
> --- /dev/null
> +++ b/hw/i386/acpi-common.h
> @@ -0,0 +1,14 @@
> +#ifndef HW_I386_ACPI_COMMON_H
> +#define HW_I386_ACPI_COMMON_H
> +#include "include/hw/acpi/acpi_dev_interface.h"
> +
> +#include "include/hw/acpi/bios-linker-loader.h"
> +#include "include/hw/i386/x86.h"
> +
> +/* Default IOAPIC ID */
> +#define ACPI_BUILD_IOAPIC_ID 0x0
> +
> +void acpi_build_madt(GArray *table_data, BIOSLinker *linker,
> +                     X86MachineState *x86ms, AcpiDeviceIf *adev);
> +
> +#endif
> diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> index 4f6418d60b05..c0fdd539a640 100644
> --- a/hw/i386/acpi-build.c
> +++ b/hw/i386/acpi-build.c
> @@ -24,6 +24,7 @@
>   #include "qapi/error.h"
>   #include "qapi/qmp/qnum.h"
>   #include "acpi-build.h"
> +#include "acpi-common.h"
>   #include "qemu/bitmap.h"
>   #include "qemu/error-report.h"
>   #include "hw/pci/pci.h"
> @@ -89,9 +90,6 @@
>   #define ACPI_BUILD_DPRINTF(fmt, ...)
>   #endif
>   
> -/* Default IOAPIC ID */
> -#define ACPI_BUILD_IOAPIC_ID 0x0
> -
>   typedef struct AcpiPmInfo {
>       bool s3_disabled;
>       bool s4_disabled;
> @@ -327,124 +325,6 @@ build_facs(GArray *table_data)
>       facs->length = cpu_to_le32(sizeof(*facs));
>   }
>   
> -void pc_madt_cpu_entry(AcpiDeviceIf *adev, int uid,
> -                       const CPUArchIdList *apic_ids, GArray *entry)
> -{
> -    uint32_t apic_id = apic_ids->cpus[uid].arch_id;
> -
> -    /* ACPI spec says that LAPIC entry for non present
> -     * CPU may be omitted from MADT or it must be marked
> -     * as disabled. However omitting non present CPU from
> -     * MADT breaks hotplug on linux. So possible CPUs
> -     * should be put in MADT but kept disabled.
> -     */
> -    if (apic_id < 255) {
> -        AcpiMadtProcessorApic *apic = acpi_data_push(entry, sizeof *apic);
> -
> -        apic->type = ACPI_APIC_PROCESSOR;
> -        apic->length = sizeof(*apic);
> -        apic->processor_id = uid;
> -        apic->local_apic_id = apic_id;
> -        if (apic_ids->cpus[uid].cpu != NULL) {
> -            apic->flags = cpu_to_le32(1);
> -        } else {
> -            apic->flags = cpu_to_le32(0);
> -        }
> -    } else {
> -        AcpiMadtProcessorX2Apic *apic = acpi_data_push(entry, sizeof *apic);
> -
> -        apic->type = ACPI_APIC_LOCAL_X2APIC;
> -        apic->length = sizeof(*apic);
> -        apic->uid = cpu_to_le32(uid);
> -        apic->x2apic_id = cpu_to_le32(apic_id);
> -        if (apic_ids->cpus[uid].cpu != NULL) {
> -            apic->flags = cpu_to_le32(1);
> -        } else {
> -            apic->flags = cpu_to_le32(0);
> -        }
> -    }
> -}
> -
> -static void
> -build_madt(GArray *table_data, BIOSLinker *linker,
> -           X86MachineState *x86ms, AcpiDeviceIf *adev)
> -{
> -    MachineClass *mc = MACHINE_GET_CLASS(x86ms);
> -    const CPUArchIdList *apic_ids = mc->possible_cpu_arch_ids(MACHINE(x86ms));
> -    int madt_start = table_data->len;
> -    AcpiDeviceIfClass *adevc = ACPI_DEVICE_IF_GET_CLASS(adev);
> -    bool x2apic_mode = false;
> -
> -    AcpiMultipleApicTable *madt;
> -    AcpiMadtIoApic *io_apic;
> -    AcpiMadtIntsrcovr *intsrcovr;
> -    int i;
> -
> -    madt = acpi_data_push(table_data, sizeof *madt);
> -    madt->local_apic_address = cpu_to_le32(APIC_DEFAULT_ADDRESS);
> -    madt->flags = cpu_to_le32(1);
> -
> -    for (i = 0; i < apic_ids->len; i++) {
> -        adevc->madt_cpu(adev, i, apic_ids, table_data);
> -        if (apic_ids->cpus[i].arch_id > 254) {
> -            x2apic_mode = true;
> -        }
> -    }
> -
> -    io_apic = acpi_data_push(table_data, sizeof *io_apic);
> -    io_apic->type = ACPI_APIC_IO;
> -    io_apic->length = sizeof(*io_apic);
> -    io_apic->io_apic_id = ACPI_BUILD_IOAPIC_ID;
> -    io_apic->address = cpu_to_le32(IO_APIC_DEFAULT_ADDRESS);
> -    io_apic->interrupt = cpu_to_le32(0);
> -
> -    if (x86ms->apic_xrupt_override) {
> -        intsrcovr = acpi_data_push(table_data, sizeof *intsrcovr);
> -        intsrcovr->type   = ACPI_APIC_XRUPT_OVERRIDE;
> -        intsrcovr->length = sizeof(*intsrcovr);
> -        intsrcovr->source = 0;
> -        intsrcovr->gsi    = cpu_to_le32(2);
> -        intsrcovr->flags  = cpu_to_le16(0); /* conforms to bus specifications */
> -    }
> -    for (i = 1; i < 16; i++) {
> -#define ACPI_BUILD_PCI_IRQS ((1<<5) | (1<<9) | (1<<10) | (1<<11))
> -        if (!(ACPI_BUILD_PCI_IRQS & (1 << i))) {
> -            /* No need for a INT source override structure. */
> -            continue;
> -        }
> -        intsrcovr = acpi_data_push(table_data, sizeof *intsrcovr);
> -        intsrcovr->type   = ACPI_APIC_XRUPT_OVERRIDE;
> -        intsrcovr->length = sizeof(*intsrcovr);
> -        intsrcovr->source = i;
> -        intsrcovr->gsi    = cpu_to_le32(i);
> -        intsrcovr->flags  = cpu_to_le16(0xd); /* active high, level triggered */
> -    }
> -
> -    if (x2apic_mode) {
> -        AcpiMadtLocalX2ApicNmi *local_nmi;
> -
> -        local_nmi = acpi_data_push(table_data, sizeof *local_nmi);
> -        local_nmi->type   = ACPI_APIC_LOCAL_X2APIC_NMI;
> -        local_nmi->length = sizeof(*local_nmi);
> -        local_nmi->uid    = 0xFFFFFFFF; /* all processors */
> -        local_nmi->flags  = cpu_to_le16(0);
> -        local_nmi->lint   = 1; /* ACPI_LINT1 */
> -    } else {
> -        AcpiMadtLocalNmi *local_nmi;
> -
> -        local_nmi = acpi_data_push(table_data, sizeof *local_nmi);
> -        local_nmi->type         = ACPI_APIC_LOCAL_NMI;
> -        local_nmi->length       = sizeof(*local_nmi);
> -        local_nmi->processor_id = 0xff; /* all processors */
> -        local_nmi->flags        = cpu_to_le16(0);
> -        local_nmi->lint         = 1; /* ACPI_LINT1 */
> -    }
> -
> -    build_header(linker, table_data,
> -                 (void *)(table_data->data + madt_start), "APIC",
> -                 table_data->len - madt_start, 1, NULL, NULL);
> -}
> -
>   static void build_append_pcihp_notify_entry(Aml *method, int slot)
>   {
>       Aml *if_ctx;
> @@ -2533,8 +2413,8 @@ void acpi_build(AcpiBuildTables *tables, MachineState *machine)
>       aml_len += tables_blob->len - fadt;
>   
>       acpi_add_table(table_offsets, tables_blob);
> -    build_madt(tables_blob, tables->linker, x86ms,
> -               ACPI_DEVICE_IF(pcms->acpi_dev));
> +    acpi_build_madt(tables_blob, tables->linker, x86ms,
> +                    ACPI_DEVICE_IF(pcms->acpi_dev));
>   
>       vmgenid_dev = find_vmgenid_dev();
>       if (vmgenid_dev) {
> diff --git a/hw/i386/acpi-common.c b/hw/i386/acpi-common.c
> new file mode 100644
> index 000000000000..5caca16a0b59
> --- /dev/null
> +++ b/hw/i386/acpi-common.c
> @@ -0,0 +1,152 @@
> +/* Support for generating ACPI tables and passing them to Guests
> + *
> + * Copyright (C) 2008-2010  Kevin O'Connor <kevin@koconnor.net>
> + * Copyright (C) 2006 Fabrice Bellard
> + * Copyright (C) 2013 Red Hat Inc
> + *
> + * Author: Michael S. Tsirkin <mst@redhat.com>
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License as published by
> + * the Free Software Foundation; either version 2 of the License, or
> + * (at your option) any later version.
> +
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> +
> + * You should have received a copy of the GNU General Public License along
> + * with this program; if not, see <http://www.gnu.org/licenses/>.
> + */
> +
> +#include "qemu/osdep.h"
> +#include "qapi/error.h"
> +
> +#include "exec/memory.h"
> +#include "hw/acpi/acpi.h"
> +#include "hw/acpi/aml-build.h"
> +#include "hw/acpi/utils.h"
> +#include "hw/i386/pc.h"
> +#include "target/i386/cpu.h"
> +
> +#include "acpi-build.h"
> +#include "acpi-common.h"
> +
> +void pc_madt_cpu_entry(AcpiDeviceIf *adev, int uid,
> +                       const CPUArchIdList *apic_ids, GArray *entry)
> +{
> +    uint32_t apic_id = apic_ids->cpus[uid].arch_id;
> +
> +    /* ACPI spec says that LAPIC entry for non present
> +     * CPU may be omitted from MADT or it must be marked
> +     * as disabled. However omitting non present CPU from
> +     * MADT breaks hotplug on linux. So possible CPUs
> +     * should be put in MADT but kept disabled.
> +     */
> +    if (apic_id < 255) {
> +        AcpiMadtProcessorApic *apic = acpi_data_push(entry, sizeof *apic);
> +
> +        apic->type = ACPI_APIC_PROCESSOR;
> +        apic->length = sizeof(*apic);
> +        apic->processor_id = uid;
> +        apic->local_apic_id = apic_id;
> +        if (apic_ids->cpus[uid].cpu != NULL) {
> +            apic->flags = cpu_to_le32(1);
> +        } else {
> +            apic->flags = cpu_to_le32(0);
> +        }
> +    } else {
> +        AcpiMadtProcessorX2Apic *apic = acpi_data_push(entry, sizeof *apic);
> +
> +        apic->type = ACPI_APIC_LOCAL_X2APIC;
> +        apic->length = sizeof(*apic);
> +        apic->uid = cpu_to_le32(uid);
> +        apic->x2apic_id = cpu_to_le32(apic_id);
> +        if (apic_ids->cpus[uid].cpu != NULL) {
> +            apic->flags = cpu_to_le32(1);
> +        } else {
> +            apic->flags = cpu_to_le32(0);
> +        }
> +    }
> +}
> +
> +void acpi_build_madt(GArray *table_data, BIOSLinker *linker,
> +                     X86MachineState *x86ms, AcpiDeviceIf *adev)
> +{
> +    MachineClass *mc = MACHINE_GET_CLASS(x86ms);
> +    const CPUArchIdList *apic_ids = mc->possible_cpu_arch_ids(MACHINE(x86ms));
> +    int madt_start = table_data->len;
> +    AcpiDeviceIfClass *adevc = ACPI_DEVICE_IF_GET_CLASS(adev);
> +    bool x2apic_mode = false;
> +
> +    AcpiMultipleApicTable *madt;
> +    AcpiMadtIoApic *io_apic;
> +    AcpiMadtIntsrcovr *intsrcovr;
> +    int i;
> +
> +    madt = acpi_data_push(table_data, sizeof *madt);
> +    madt->local_apic_address = cpu_to_le32(APIC_DEFAULT_ADDRESS);
> +    madt->flags = cpu_to_le32(1);
> +
> +    for (i = 0; i < apic_ids->len; i++) {
> +        adevc->madt_cpu(adev, i, apic_ids, table_data);
> +        if (apic_ids->cpus[i].arch_id > 254) {
> +            x2apic_mode = true;
> +        }
> +    }
> +
> +    io_apic = acpi_data_push(table_data, sizeof *io_apic);
> +    io_apic->type = ACPI_APIC_IO;
> +    io_apic->length = sizeof(*io_apic);
> +    io_apic->io_apic_id = ACPI_BUILD_IOAPIC_ID;
> +    io_apic->address = cpu_to_le32(IO_APIC_DEFAULT_ADDRESS);
> +    io_apic->interrupt = cpu_to_le32(0);
> +
> +    if (x86ms->apic_xrupt_override) {
> +        intsrcovr = acpi_data_push(table_data, sizeof *intsrcovr);
> +        intsrcovr->type   = ACPI_APIC_XRUPT_OVERRIDE;
> +        intsrcovr->length = sizeof(*intsrcovr);
> +        intsrcovr->source = 0;
> +        intsrcovr->gsi    = cpu_to_le32(2);
> +        intsrcovr->flags  = cpu_to_le16(0); /* conforms to bus specifications */
> +    }
> +    for (i = 1; i < 16; i++) {
> +#define ACPI_BUILD_PCI_IRQS ((1<<5) | (1<<9) | (1<<10) | (1<<11))
> +        if (!(ACPI_BUILD_PCI_IRQS & (1 << i))) {
> +            /* No need for a INT source override structure. */
> +            continue;
> +        }
> +        intsrcovr = acpi_data_push(table_data, sizeof *intsrcovr);
> +        intsrcovr->type   = ACPI_APIC_XRUPT_OVERRIDE;
> +        intsrcovr->length = sizeof(*intsrcovr);
> +        intsrcovr->source = i;
> +        intsrcovr->gsi    = cpu_to_le32(i);
> +        intsrcovr->flags  = cpu_to_le16(0xd); /* active high, level triggered */
> +    }
> +
> +    if (x2apic_mode) {
> +        AcpiMadtLocalX2ApicNmi *local_nmi;
> +
> +        local_nmi = acpi_data_push(table_data, sizeof *local_nmi);
> +        local_nmi->type   = ACPI_APIC_LOCAL_X2APIC_NMI;
> +        local_nmi->length = sizeof(*local_nmi);
> +        local_nmi->uid    = 0xFFFFFFFF; /* all processors */
> +        local_nmi->flags  = cpu_to_le16(0);
> +        local_nmi->lint   = 1; /* ACPI_LINT1 */
> +    } else {
> +        AcpiMadtLocalNmi *local_nmi;
> +
> +        local_nmi = acpi_data_push(table_data, sizeof *local_nmi);
> +        local_nmi->type         = ACPI_APIC_LOCAL_NMI;
> +        local_nmi->length       = sizeof(*local_nmi);
> +        local_nmi->processor_id = 0xff; /* all processors */
> +        local_nmi->flags        = cpu_to_le16(0);
> +        local_nmi->lint         = 1; /* ACPI_LINT1 */
> +    }
> +
> +    build_header(linker, table_data,
> +                 (void *)(table_data->data + madt_start), "APIC",
> +                 table_data->len - madt_start, 1, NULL, NULL);
> +}
> +
> diff --git a/hw/i386/Makefile.objs b/hw/i386/Makefile.objs
> index 8ce1b265335b..6abc74551a72 100644
> --- a/hw/i386/Makefile.objs
> +++ b/hw/i386/Makefile.objs
> @@ -16,4 +16,5 @@ obj-$(CONFIG_VMMOUSE) += vmmouse.o
>   obj-$(CONFIG_PC) += port92.o
>   
>   obj-y += kvmvapic.o
> +obj-$(CONFIG_ACPI) += acpi-common.o
>   obj-$(CONFIG_PC) += acpi-build.o
> 

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

