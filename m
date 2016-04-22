Received: by 10.25.208.194 with SMTP id h185csp768906lfg;
        Fri, 22 Apr 2016 06:27:11 -0700 (PDT)
X-Received: by 10.140.101.81 with SMTP id t75mr21682092qge.24.1461331630039;
        Fri, 22 Apr 2016 06:27:10 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y133si3627207qha.49.2016.04.22.06.27.09
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 22 Apr 2016 06:27:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:33148 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1atb6z-0004Ha-Fy
	for alex.bennee@linaro.org; Fri, 22 Apr 2016 09:27:09 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55700)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1atb6w-0004Dc-Ex
	for qemu-arm@nongnu.org; Fri, 22 Apr 2016 09:27:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1atb6t-0003c8-8L
	for qemu-arm@nongnu.org; Fri, 22 Apr 2016 09:27:06 -0400
Received: from mx1.redhat.com ([209.132.183.28]:51216)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>)
	id 1atb6s-0003c2-Sg; Fri, 22 Apr 2016 09:27:03 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 74EE27F370;
	Fri, 22 Apr 2016 13:27:02 +0000 (UTC)
Received: from hawk.localdomain (dhcp-1-112.brq.redhat.com [10.34.1.112])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u3MDQwoH032455
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Fri, 22 Apr 2016 09:27:00 -0400
Date: Fri, 22 Apr 2016 15:26:58 +0200
From: Andrew Jones <drjones@redhat.com>
To: Shannon Zhao <zhaoshenglong@huawei.com>
Message-ID: <20160422132658.6we65zf2jxxrapxa@hawk.localdomain>
References: <1461219834-10416-1-git-send-email-zhaoshenglong@huawei.com>
	<1461219834-10416-5-git-send-email-zhaoshenglong@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1461219834-10416-5-git-send-email-zhaoshenglong@huawei.com>
User-Agent: Mutt/1.5.23.1 (2014-03-12)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH v5 4/5] include/hw/acpi/acpi-defs: Add GICC
 Affinity Structure
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
Cc: peter.maydell@linaro.org, david.daney@cavium.com,
	peter.huangpeng@huawei.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, shannon.zhao@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: s8jSfkMm9rVE

On Thu, Apr 21, 2016 at 02:23:53PM +0800, Shannon Zhao wrote:
> From: Shannon Zhao <shannon.zhao@linaro.org>
> 
> Signed-off-by: Shannon Zhao <shannon.zhao@linaro.org>
> ---
>  hw/i386/acpi-build.c        |  2 +-
>  include/hw/acpi/acpi-defs.h | 15 ++++++++++++++-
>  2 files changed, 15 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> index 6477003..9ae4c0d 100644
> --- a/hw/i386/acpi-build.c
> +++ b/hw/i386/acpi-build.c
> @@ -2474,7 +2474,7 @@ build_srat(GArray *table_data, GArray *linker, MachineState *machine)
>          int apic_id = apic_ids->cpus[i].arch_id;
>  
>          core = acpi_data_push(table_data, sizeof *core);
> -        core->type = ACPI_SRAT_PROCESSOR;
> +        core->type = ACPI_SRAT_PROCESSOR_APIC;
>          core->length = sizeof(*core);
>          core->local_apic_id = apic_id;
>          curnode = pcms->node_cpu[apic_id];
> diff --git a/include/hw/acpi/acpi-defs.h b/include/hw/acpi/acpi-defs.h
> index c7a03d4..bcf5c3f 100644
> --- a/include/hw/acpi/acpi-defs.h
> +++ b/include/hw/acpi/acpi-defs.h
> @@ -455,8 +455,10 @@ struct AcpiSystemResourceAffinityTable
>  } QEMU_PACKED;
>  typedef struct AcpiSystemResourceAffinityTable AcpiSystemResourceAffinityTable;
>  
> -#define ACPI_SRAT_PROCESSOR          0
> +#define ACPI_SRAT_PROCESSOR_APIC     0
>  #define ACPI_SRAT_MEMORY             1
> +#define ACPI_SRAT_PROCESSOR_x2APIC   2
> +#define ACPI_SRAT_PROCESSOR_GICC     3
>  
>  struct AcpiSratProcessorAffinity
>  {
> @@ -483,6 +485,17 @@ struct AcpiSratMemoryAffinity
>  } QEMU_PACKED;
>  typedef struct AcpiSratMemoryAffinity AcpiSratMemoryAffinity;
>  
> +struct AcpiSratProcessorGiccAffinity
> +{
> +    ACPI_SUB_HEADER_DEF
> +    uint32_t    proximity;
> +    uint32_t    acpi_processor_uid;
> +    uint32_t    flags;
> +    uint32_t    clock_domain;
> +} QEMU_PACKED;
> +
> +typedef struct AcpiSratProcessorGiccAffinity AcpiSratProcessorGiccAffinity;
> +
>  /* PCI fw r3.0 MCFG table. */
>  /* Subtable */
>  struct AcpiMcfgAllocation {
> -- 
> 2.0.4
> 
>

Reviewed-by: Andrew Jones <drjones@redhat.com> 
