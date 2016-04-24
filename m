Received: by 10.25.208.194 with SMTP id h185csp500128lfg;
        Sun, 24 Apr 2016 10:01:01 -0700 (PDT)
X-Received: by 10.55.20.193 with SMTP id 62mr2467981qku.34.1461517261032;
        Sun, 24 Apr 2016 10:01:01 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h50si8640002qge.104.2016.04.24.10.01.00
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 24 Apr 2016 10:01:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:55993 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1auNP2-00056q-Kv
	for alex.bennee@linaro.org; Sun, 24 Apr 2016 13:01:00 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39269)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1auNP0-00054w-N8
	for qemu-arm@nongnu.org; Sun, 24 Apr 2016 13:00:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1auNOx-0003J5-H8
	for qemu-arm@nongnu.org; Sun, 24 Apr 2016 13:00:58 -0400
Received: from mx1.redhat.com ([209.132.183.28]:49970)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>)
	id 1auNOx-0003Iz-A1; Sun, 24 Apr 2016 13:00:55 -0400
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9A2C7C049D58;
	Sun, 24 Apr 2016 17:00:54 +0000 (UTC)
Received: from hawk.localdomain (ovpn-204-19.brq.redhat.com [10.40.204.19])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u3OH0o3U007748
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Sun, 24 Apr 2016 13:00:52 -0400
Date: Sun, 24 Apr 2016 19:00:49 +0200
From: Andrew Jones <drjones@redhat.com>
To: Shannon Zhao <zhaoshenglong@huawei.com>
Message-ID: <20160424170049.mxfial3f5xbmfmxs@hawk.localdomain>
References: <1461402396-11776-1-git-send-email-zhaoshenglong@huawei.com>
	<1461402396-11776-5-git-send-email-zhaoshenglong@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1461402396-11776-5-git-send-email-zhaoshenglong@huawei.com>
User-Agent: Mutt/1.5.23.1 (2014-03-12)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v6 4/5] ACPI: move
 acpi_build_srat_memory to common place
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
	"Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
	peter.huangpeng@huawei.com, qemu-arm@nongnu.org,
	shannon.zhao@linaro.org, Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: c6YOK9SbWmPu

On Sat, Apr 23, 2016 at 05:06:35PM +0800, Shannon Zhao wrote:
> From: Shannon Zhao <shannon.zhao@linaro.org>
> 
> Move acpi_build_srat_memory to common place so that it could be reused
> by ARM.
> 
> Cc: Michael S. Tsirkin <mst@redhat.com>
> Cc: Igor Mammedov <imammedo@redhat.com>
> Signed-off-by: Shannon Zhao <shannon.zhao@linaro.org>
> ---
>  hw/acpi/aml-build.c         | 12 ++++++++++++
>  hw/i386/acpi-build.c        | 20 --------------------
>  include/hw/acpi/aml-build.h | 10 ++++++++++
>  3 files changed, 22 insertions(+), 20 deletions(-)
> 
> diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
> index ab89ca6..d167003 100644
> --- a/hw/acpi/aml-build.c
> +++ b/hw/acpi/aml-build.c
> @@ -1563,3 +1563,15 @@ build_rsdt(GArray *table_data, GArray *linker, GArray *table_offsets,
>      build_header(linker, table_data,
>                   (void *)rsdt, "RSDT", rsdt_len, 1, oem_id, oem_table_id);
>  }
> +
> +void acpi_build_srat_memory(AcpiSratMemoryAffinity *numamem, uint64_t base,
> +                            uint64_t len, int node, MemoryAffinityFlags flags)

It looks like functions like these in hw/acpi/aml-build.c usually start
with 'build_' not 'acpi_'

> +{
> +    numamem->type = ACPI_SRAT_MEMORY;
> +    numamem->length = sizeof(*numamem);
> +    memset(numamem->proximity, 0, 4);

This memset thing is still weird...

> +    numamem->proximity[0] = node;
> +    numamem->flags = cpu_to_le32(flags);
> +    numamem->base_addr = cpu_to_le64(base);
> +    numamem->range_length = cpu_to_le64(len);
> +}
> diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> index 9ae4c0d..cd93825 100644
> --- a/hw/i386/acpi-build.c
> +++ b/hw/i386/acpi-build.c
> @@ -2427,26 +2427,6 @@ build_tpm2(GArray *table_data, GArray *linker)
>                   (void *)tpm2_ptr, "TPM2", sizeof(*tpm2_ptr), 4, NULL, NULL);
>  }
>  
> -typedef enum {
> -    MEM_AFFINITY_NOFLAGS      = 0,
> -    MEM_AFFINITY_ENABLED      = (1 << 0),
> -    MEM_AFFINITY_HOTPLUGGABLE = (1 << 1),
> -    MEM_AFFINITY_NON_VOLATILE = (1 << 2),
> -} MemoryAffinityFlags;
> -
> -static void
> -acpi_build_srat_memory(AcpiSratMemoryAffinity *numamem, uint64_t base,
> -                       uint64_t len, int node, MemoryAffinityFlags flags)
> -{
> -    numamem->type = ACPI_SRAT_MEMORY;
> -    numamem->length = sizeof(*numamem);
> -    memset(numamem->proximity, 0, 4);
> -    numamem->proximity[0] = node;
> -    numamem->flags = cpu_to_le32(flags);
> -    numamem->base_addr = cpu_to_le64(base);
> -    numamem->range_length = cpu_to_le64(len);
> -}
> -
>  static void
>  build_srat(GArray *table_data, GArray *linker, MachineState *machine)
>  {
> diff --git a/include/hw/acpi/aml-build.h b/include/hw/acpi/aml-build.h
> index 2c994b3..d8f9fca 100644
> --- a/include/hw/acpi/aml-build.h
> +++ b/include/hw/acpi/aml-build.h
> @@ -198,6 +198,13 @@ typedef enum {
>      AML_PULL_NONE = 3,
>  } AmlPinConfig;
>  
> +typedef enum {
> +    MEM_AFFINITY_NOFLAGS      = 0,
> +    MEM_AFFINITY_ENABLED      = (1 << 0),
> +    MEM_AFFINITY_HOTPLUGGABLE = (1 << 1),
> +    MEM_AFFINITY_NON_VOLATILE = (1 << 2),
> +} MemoryAffinityFlags;
> +
>  typedef
>  struct AcpiBuildTables {
>      GArray *table_data;
> @@ -372,4 +379,7 @@ int
>  build_append_named_dword(GArray *array, const char *name_format, ...)
>  GCC_FMT_ATTR(2, 3);
>  
> +void acpi_build_srat_memory(AcpiSratMemoryAffinity *numamem, uint64_t base,
> +                            uint64_t len, int node, MemoryAffinityFlags flags);
> +
>  #endif
> -- 
> 2.0.4
> 
> 
>

Otherwise looks good to me.

drew 
