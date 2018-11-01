Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp929678wro;
        Thu, 1 Nov 2018 08:13:04 -0700 (PDT)
X-Google-Smtp-Source: AJdET5fWbRP/LgsaLeP6Cxj6rqSE6Optk3KGctTg5EQjF/1sehhJ6lOUm7Av+Tbl0O/RscFoWAIE
X-Received: by 2002:ac8:6104:: with SMTP id a4-v6mr1552637qtm.350.1541085184260;
        Thu, 01 Nov 2018 08:13:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1541085184; cv=none;
        d=google.com; s=arc-20160816;
        b=D5zVymezN3zDge0P9PTZhRinH9XCMqFvaUtBr1qMmP49hQ4oYuHB4S5lg3RJLQOCDX
         8IV0b4rX8nFVj37cYLUZCTyRMUpaTsBYNBwC7yA/aGkf8Kw1orxkMMZH24RD/vN8IWJI
         EjLmnYm5lydUNk82KKK+k2GUGiVbperrPUadESEo0Q6Z+tRoEO5i2E+cLOdndlFuM36C
         7mMdrleL8h708HVRch/y7J2nD34tK2nX9ltVOUp2iQC0OQ9JoNSKdwOZvAi0WCjpwNe6
         f4LiVZycosqaYveh4dMNJIsH9q2IBA6o6wMb974Mjh4RPlJ8NrKJWhUJIWdNGkJR+Z1k
         YboQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=uhMosjCWJZXjpP1nXP8py6bJRIWi2SzGa0tFwPAm03k=;
        b=sQxtijfjYTKfbFEclKC/7ApZICoMMubsHilYs3Ms+5COh8J7QnWDu7UPnyW3BtzVnv
         HSPJk8G3zrszu1P6cp3htF6FLqtbYGeMUB2YYwLNuP5tY/wt3gQNIQLBGHsCac0rymqG
         UPxagfhSlD9yfPFmXWMfyCwhfkgTzh87rLf0A1yFQ9zBW6QkHze7Ugb720tk5MLPnaZI
         RYNk0cb/Y0mCQUTDdW9WT1aJqEL1CqQWHTfruUzHQ8g55a13Km8qvQUX/6OXMjS7qpjT
         Wu5nDk4FsAYguls68Vj4oz+CYSzXgR5YKfEvdHwo/wgtRlEQldTA0jwvKxcm6cJDbHIJ
         IVZg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e24si496592qtg.241.2018.11.01.08.13.04
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 01 Nov 2018 08:13:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:42540 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gIEed-0005eV-Jd
	for alex.bennee@linaro.org; Thu, 01 Nov 2018 11:13:03 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55925)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gIEdz-0005d6-QC
	for qemu-devel@nongnu.org; Thu, 01 Nov 2018 11:12:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gIEdr-00065S-MK
	for qemu-devel@nongnu.org; Thu, 01 Nov 2018 11:12:21 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:50976)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1gIEdr-000643-4K
	for qemu-devel@nongnu.org; Thu, 01 Nov 2018 11:12:15 -0400
Received: by mail-wm1-f67.google.com with SMTP id h2-v6so1691041wmb.0
	for <qemu-devel@nongnu.org>; Thu, 01 Nov 2018 08:12:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=uhMosjCWJZXjpP1nXP8py6bJRIWi2SzGa0tFwPAm03k=;
	b=AcI8yHIxxEWUKwhsBd2tAt1Okap/Iim0TMhZvNg6S2uCqeOeirAiFoSGEd2kjpAblN
	KKL5NF6Gj0cwUQ79Do6y2TEPB4XYziu9g12PbFPBWszfYQxD/aUO2dhSJjg0PULP3JOA
	pvNeiAHzjPKUhkv0j0Rxbl1dRLZiHxklgA3b0xDYEPjw/KRxaQQNqZQwHPeoOLy36Cuu
	iIQJWiliM7zgNt2TXxJY6zUe1cI9L6FTcwqr4cJZnyev71NDp0H9E6SQfI0dCbeo2uk4
	IJCbu3Bpn2pd2XbMHxE74vT3QxvRcYglvY3IvsmPWiQSzmftG2Bxv+WjaPVhN8AlNjhb
	rZiA==
X-Gm-Message-State: AGRZ1gIjYQHEAG0PaLAIIt6/s6x3ws2w+cEuGi5oKm9Dgawy35QcQpg9
	v/aPi+KhXh5DIJjlKdg3FWRt+w==
X-Received: by 2002:a1c:c701:: with SMTP id
	x1-v6mr5921713wmf.116.1541085132593; 
	Thu, 01 Nov 2018 08:12:12 -0700 (PDT)
Received: from [192.168.1.130] ([139.47.31.199])
	by smtp.gmail.com with ESMTPSA id
	l67-v6sm55817929wma.20.2018.11.01.08.12.10
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 01 Nov 2018 08:12:11 -0700 (PDT)
To: Samuel Ortiz <sameo@linux.intel.com>, qemu-devel@nongnu.org
References: <20181101102303.16439-1-sameo@linux.intel.com>
	<20181101102303.16439-18-sameo@linux.intel.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <68eae1f8-ca6a-d096-c9ac-d492e4523c7c@redhat.com>
Date: Thu, 1 Nov 2018 16:12:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <20181101102303.16439-18-sameo@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.128.67
Subject: Re: [Qemu-devel] [PATCH v4 17/23] hw: i386: Export the MADT build
 method
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Eduardo Habkost <ehabkost@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
	"open list:ARM ACPI Subsystem" <qemu-arm@nongnu.org>,
	Shannon Zhao <zhaoshenglong@huawei.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: R5x84sFtpvGJ

Hi Samuel,

On 1/11/18 11:22, Samuel Ortiz wrote:
> It is going to be used by the PC machine type as the MADT table builder
> method and thus needs to be exported outside of acpi-build.c
> 
> Also, now that the generic build_madt() API is exported, we have to
> rename the ARM static one in order to avoid build time conflicts.
> 
> Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> Tested-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> Signed-off-by: Samuel Ortiz <sameo@linux.intel.com>
> ---
>   hw/arm/virt-acpi-build.c |  4 ++--
>   hw/i386/acpi-build.c     |  3 ++-
>   include/hw/i386/acpi.h   | 27 +++++++++++++++++++++++++++
>   3 files changed, 31 insertions(+), 3 deletions(-)
>   create mode 100644 include/hw/i386/acpi.h
> 
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index f9a60907f1..4a37c5997c 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -565,7 +565,7 @@ build_gtdt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>   
>   /* MADT */
>   static void
> -build_madt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
> +virt_build_madt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>   {
>       VirtMachineClass *vmc = VIRT_MACHINE_GET_CLASS(vms);
>       int madt_start = table_data->len;
> @@ -746,7 +746,7 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
>       build_fadt_rev5(tables_blob, tables->linker, vms, dsdt);
>   
>       acpi_add_table(table_offsets, tables_blob);
> -    build_madt(tables_blob, tables->linker, vms);
> +    virt_build_madt(tables_blob, tables->linker, vms);
>   
>       acpi_add_table(table_offsets, tables_blob);
>       build_gtdt(tables_blob, tables->linker, vms);
> diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> index 6c9b61cea2..f4afdbcd1a 100644
> --- a/hw/i386/acpi-build.c
> +++ b/hw/i386/acpi-build.c
> @@ -60,6 +60,7 @@
>   #include "qom/qom-qobject.h"
>   #include "hw/i386/amd_iommu.h"
>   #include "hw/i386/intel_iommu.h"
> +#include "hw/i386/acpi.h"
>   
>   #include "hw/acpi/ipmi.h"
>   
> @@ -279,7 +280,7 @@ void pc_madt_cpu_entry(AcpiDeviceIf *adev, int uid,
>       }
>   }
>   
> -static void
> +void
>   build_madt(GArray *table_data, BIOSLinker *linker,
>              MachineState *ms, AcpiConfiguration *acpi_conf)
>   {
> diff --git a/include/hw/i386/acpi.h b/include/hw/i386/acpi.h
> new file mode 100644
> index 0000000000..ee1203914a
> --- /dev/null
> +++ b/include/hw/i386/acpi.h
> @@ -0,0 +1,27 @@
> +/*
> + *
> + * Copyright (c) 2018 Intel Corportation
> + *
> + * This program is free software; you can redistribute it and/or modify it
> + * under the terms and conditions of the GNU General Public License,
> + * version 2 or later, as published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope it will be useful, but WITHOUT
> + * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
> + * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
> + * more details.
> + *
> + * You should have received a copy of the GNU General Public License along with
> + * this program.  If not, see <http://www.gnu.org/licenses/>.
> + */
> +
> +#ifndef HW_I386_ACPI_H
> +#define HW_I386_ACPI_H
> +
> +#include "hw/acpi/acpi.h"

You forgot the following header:

#include "hw/acpi/bios-linker-loader.h"

The BIOSLinker is not provided by "acpi/acpi.h", which results in a 
failure when trying to precompile this header.

> +
> +/* ACPI MADT (Multiple APIC Description Table) build method */
> +void build_madt(GArray *table_data, BIOSLinker *linker,
> +                MachineState *ms, AcpiConfiguration *conf);
> +
> +#endif
> 
