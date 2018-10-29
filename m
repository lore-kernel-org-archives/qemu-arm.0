Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp4734259wro;
        Mon, 29 Oct 2018 14:18:42 -0700 (PDT)
X-Google-Smtp-Source: AJdET5f4NgVfaZddNSsjE+1xiOPTJIStBNkUVlQLDr6eqIvV2o3cDjbkXlosyPBYzM+frOq48SDu
X-Received: by 2002:a37:7442:: with SMTP id p63-v6mr6035803qkc.297.1540847922278;
        Mon, 29 Oct 2018 14:18:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1540847922; cv=none;
        d=google.com; s=arc-20160816;
        b=Wxk/cd5ro/m0DZfaqfF/oP6CeWo1BJiKx+31O6czZrmvirqYbTqtBSfiUBrRE1n4F9
         Eheq+0HAsTxzkmKDW/vqxSWI/qxKUjsS1pMyZq7P9O88ci36deEyIWzYKOXrJ1pKSakG
         fWj+kBzb+qSmq09xqlaIfOstOf7GdUZjHka5tnARau7MJ8BsHm9B3Tuk10gDL1z6rCS+
         8aPAildE8ePfRBRxJguJiDQa9/E6yhg583KjlCwZvr4FHRJpiq3vT0xda5+Sa8ZgeXxg
         3Z0ijbB/kz68Z2JxdWXkseHLTlr7/EGQ0pHH95DMVTSmrmSSurxLMMnInU2/Dj6WNWcL
         HHNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=dT68fQn/+tEkZHlGpOaoJZEwB4uFOWFcPasSs1RBwZY=;
        b=kTUvzMX17/iR4FT3uDU5ISpYPelgCUVd2yQ93c89XOO/y22axEe5aEuK9PYnut3zd4
         AsKtcVwFJa/1LLvKiwfXe4rehe7H2Z4iy3Mnxme7JFGhhvCXCtSegR8yGWtv4jH2Kmpt
         dd+EMhMwIQf/PtWe6Zo7NzCPcEWOX3B+wf82A16M4ogkTh5fWXrrGx3hp9DXE9d2t7a3
         p7oMI0Rt71sX7A/BaqNKV4RPYz5CrE+mtegecddzyVmX87zF8Hp54fGRQC8vC1IK/oIj
         SrgPdHTjYN8HJg1hM17K1efMZmYJS5e1cxyruHgCsaYHfaVv2aPKuiLQj3qe6K4KYf7n
         HdIw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k7si16817626qvi.137.2018.10.29.14.18.42
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 29 Oct 2018 14:18:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:49036 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gHEvp-0000ll-QO
	for alex.bennee@linaro.org; Mon, 29 Oct 2018 17:18:41 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43294)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gHEvX-0000F0-UP
	for qemu-arm@nongnu.org; Mon, 29 Oct 2018 17:18:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gHEvQ-0006w2-3W
	for qemu-arm@nongnu.org; Mon, 29 Oct 2018 17:18:21 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:53569)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1gHEvO-0006vt-FE
	for qemu-arm@nongnu.org; Mon, 29 Oct 2018 17:18:15 -0400
Received: by mail-wm1-f67.google.com with SMTP id l26-v6so9717012wmh.3
	for <qemu-arm@nongnu.org>; Mon, 29 Oct 2018 14:18:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=dT68fQn/+tEkZHlGpOaoJZEwB4uFOWFcPasSs1RBwZY=;
	b=c2bJqt9JkavXWZ5ijsLoaLDJ0an21sam5RjFw/N8SkKUmUeOYWfjCLytkVXSwbQ7Ye
	tBHTsIPT1cYb92s3AIUd9y2rAA/BWYhRRRwRzvHiyP8LMcup/0573hvAJqkZMoo9WI6w
	1c7CKxi1MKw9dsscr2mRDiKWRVKwuWpbqcwPI/ctYpM4GBZMpBUcRIbLDg8uzZwyfaEk
	Wdpz0bskI/yXws/gR43GwWP5WhgbuHLr/5Uw9vb2zbaxHWzfSmaXZ/OodA/N90bjQdN7
	FDtziJ0jqRGEszspOtijB1pW+8wgAFfJ/DT+n0RufTr2STS9DPPRkMUwi4Dmn6U9iDpC
	BsIw==
X-Gm-Message-State: AGRZ1gKD8fs0kuHOx26PDN/VtQd2rt0grXEsK0f/bvQUbDaXbsXd/1dQ
	WHs8JMCgmWFOZUqFXIv+keTB7g==
X-Received: by 2002:a1c:a386:: with SMTP id
	m128-v6mr12336852wme.62.1540847893101; 
	Mon, 29 Oct 2018 14:18:13 -0700 (PDT)
Received: from [192.168.1.130] ([139.47.13.138])
	by smtp.gmail.com with ESMTPSA id
	u76-v6sm17500245wmd.10.2018.10.29.14.18.11
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 29 Oct 2018 14:18:12 -0700 (PDT)
To: Samuel Ortiz <sameo@linux.intel.com>, qemu-devel@nongnu.org
References: <20181029170159.3801-1-sameo@linux.intel.com>
	<20181029170159.3801-19-sameo@linux.intel.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <f0e52184-3bbf-98e1-260c-ad3c6d577252@redhat.com>
Date: Mon, 29 Oct 2018 22:18:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <20181029170159.3801-19-sameo@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.128.67
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v3 18/19] hw: i386: Export the
 MADT build method
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Eduardo Habkost <ehabkost@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	"open list:ARM ACPI Subsystem" <qemu-arm@nongnu.org>,
	Shannon Zhao <zhaoshenglong@huawei.com>,
	Igor Mammedov <imammedo@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: q02iIeCLP5Kt

Hi Samuel,

On 29/10/18 18:01, Samuel Ortiz wrote:
> It is going to be used by the PC machine type as the MADT table builder
> method and thus needs to be exported outside of acpi-build.c
> 
> Also, now that the generic build_madt() API is exported, we have to
> rename the ARM static one in order to avoid build time conflicts.
> 
> Signed-off-by: Samuel Ortiz <sameo@linux.intel.com>
> ---
>   hw/arm/virt-acpi-build.c |  4 ++--
>   hw/i386/acpi-build.c     |  3 ++-
>   include/hw/i386/acpi.h   | 27 +++++++++++++++++++++++++++
>   3 files changed, 31 insertions(+), 3 deletions(-)
>   create mode 100644 include/hw/i386/acpi.h
> 
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index 353aa55357..0c349e1c60 100644
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
> index 9cb739bf5c..5035dac556 100644
> --- a/hw/i386/acpi-build.c
> +++ b/hw/i386/acpi-build.c
> @@ -62,6 +62,7 @@
>   #include "qom/qom-qobject.h"
>   #include "hw/i386/amd_iommu.h"
>   #include "hw/i386/intel_iommu.h"
> +#include "hw/i386/acpi.h"
>   
>   #include "hw/acpi/ipmi.h"
>   
> @@ -281,7 +282,7 @@ void pc_madt_cpu_entry(AcpiDeviceIf *adev, int uid,
>       }
>   }
>   
> -static void
> +void
>   build_madt(GArray *table_data, BIOSLinker *linker,
>              MachineState *ms, AcpiConfiguration *conf)
>   {
> diff --git a/include/hw/i386/acpi.h b/include/hw/i386/acpi.h
> new file mode 100644
> index 0000000000..53bf94c3ca
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
> +#ifndef QEMU_I386_ACPI_H
> +#define QEMU_I386_ACPI_H

Please use HW_I386_ACPI_H.

> +
> +#include "hw/acpi/acpi.h"

Also:

  #include "hw/acpi/bios-linker-loader.h"

> +
> +/* Build methods */

  /* Build the ACPI MADT (Multiple APIC Description Table) methods */

> +void build_madt(GArray *table_data, BIOSLinker *linker,
> +                MachineState *ms, AcpiConfiguration *conf);
> +
> +#endif
> 

With changes:
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Tested-by: Philippe Mathieu-Daudé <philmd@redhat.com>
