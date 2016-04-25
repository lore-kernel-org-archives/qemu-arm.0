Received: by 10.25.208.194 with SMTP id h185csp798080lfg;
        Mon, 25 Apr 2016 02:28:56 -0700 (PDT)
X-Received: by 10.140.170.132 with SMTP id q126mr29172796qhq.103.1461576536609;
        Mon, 25 Apr 2016 02:28:56 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 6si10012000qkd.182.2016.04.25.02.28.56
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 25 Apr 2016 02:28:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:58695 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aucp4-0003Is-P0
	for alex.bennee@linaro.org; Mon, 25 Apr 2016 05:28:54 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36137)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1aucox-0003AO-RD
	for qemu-arm@nongnu.org; Mon, 25 Apr 2016 05:28:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1aucot-0006Bs-QT
	for qemu-arm@nongnu.org; Mon, 25 Apr 2016 05:28:47 -0400
Received: from mx1.redhat.com ([209.132.183.28]:42976)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>)
	id 1aucot-00069a-Ij; Mon, 25 Apr 2016 05:28:43 -0400
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4F0CE62644;
	Mon, 25 Apr 2016 09:28:42 +0000 (UTC)
Received: from hawk.localdomain (dhcp-1-112.brq.redhat.com [10.34.1.112])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u3P9ScKZ018069
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Mon, 25 Apr 2016 05:28:40 -0400
Date: Mon, 25 Apr 2016 11:28:37 +0200
From: Andrew Jones <drjones@redhat.com>
To: Shannon Zhao <zhaoshenglong@huawei.com>
Message-ID: <20160425092837.6twpvwmohjjzjaim@hawk.localdomain>
References: <1461571547-13132-1-git-send-email-zhaoshenglong@huawei.com>
	<1461571547-13132-5-git-send-email-zhaoshenglong@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1461571547-13132-5-git-send-email-zhaoshenglong@huawei.com>
User-Agent: Mutt/1.5.23.1 (2014-03-12)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Mon, 25 Apr 2016 09:28:42 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v7 4/5] ACPI: move
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
X-TUID: OnE61NKvyHfQ

On Mon, Apr 25, 2016 at 04:05:46PM +0800, Shannon Zhao wrote:
> From: Shannon Zhao <shannon.zhao@linaro.org>
> 
> Move acpi_build_srat_memory to common place so that it could be reused
> by ARM. Rename it to build_acpi_srat_memory.
> 
> Cc: Michael S. Tsirkin <mst@redhat.com>
> Cc: Igor Mammedov <imammedo@redhat.com>
> Signed-off-by: Shannon Zhao <shannon.zhao@linaro.org>
> ---
>  hw/acpi/aml-build.c         | 11 +++++++++++
>  hw/i386/acpi-build.c        | 29 +++++------------------------
>  include/hw/acpi/aml-build.h | 10 ++++++++++
>  3 files changed, 26 insertions(+), 24 deletions(-)
> 
> diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
> index ab89ca6..f945524 100644
> --- a/hw/acpi/aml-build.c
> +++ b/hw/acpi/aml-build.c
> @@ -1563,3 +1563,14 @@ build_rsdt(GArray *table_data, GArray *linker, GArray *table_offsets,
>      build_header(linker, table_data,
>                   (void *)rsdt, "RSDT", rsdt_len, 1, oem_id, oem_table_id);
>  }
> +
> +void build_acpi_srat_memory(AcpiSratMemoryAffinity *numamem, uint64_t base,
> +                            uint64_t len, int node, MemoryAffinityFlags flags)
> +{
> +    numamem->type = ACPI_SRAT_MEMORY;
> +    numamem->length = sizeof(*numamem);
> +    numamem->proximity = cpu_to_le32(node);
> +    numamem->flags = cpu_to_le32(flags);
> +    numamem->base_addr = cpu_to_le64(base);
> +    numamem->range_length = cpu_to_le64(len);
> +}
> diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> index 3c031aa..f939191 100644
> --- a/hw/i386/acpi-build.c
> +++ b/hw/i386/acpi-build.c
> @@ -2427,25 +2427,6 @@ build_tpm2(GArray *table_data, GArray *linker)
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
> -    numamem->proximity = cpu_to_le32(node);
> -    numamem->flags = cpu_to_le32(flags);
> -    numamem->base_addr = cpu_to_le64(base);
> -    numamem->range_length = cpu_to_le64(len);
> -}
> -
>  static void
>  build_srat(GArray *table_data, GArray *linker, MachineState *machine)
>  {
> @@ -2491,7 +2472,7 @@ build_srat(GArray *table_data, GArray *linker, MachineState *machine)
>      numa_start = table_data->len;
>  
>      numamem = acpi_data_push(table_data, sizeof *numamem);
> -    acpi_build_srat_memory(numamem, 0, 640*1024, 0, MEM_AFFINITY_ENABLED);
> +    build_acpi_srat_memory(numamem, 0, 640*1024, 0, MEM_AFFINITY_ENABLED);
>      next_base = 1024 * 1024;
>      for (i = 1; i < pcms->numa_nodes + 1; ++i) {
>          mem_base = next_base;
> @@ -2507,7 +2488,7 @@ build_srat(GArray *table_data, GArray *linker, MachineState *machine)
>              mem_len -= next_base - pcms->below_4g_mem_size;
>              if (mem_len > 0) {
>                  numamem = acpi_data_push(table_data, sizeof *numamem);
> -                acpi_build_srat_memory(numamem, mem_base, mem_len, i - 1,
> +                build_acpi_srat_memory(numamem, mem_base, mem_len, i - 1,
>                                         MEM_AFFINITY_ENABLED);
>              }
>              mem_base = 1ULL << 32;
> @@ -2515,13 +2496,13 @@ build_srat(GArray *table_data, GArray *linker, MachineState *machine)
>              next_base += (1ULL << 32) - pcms->below_4g_mem_size;
>          }
>          numamem = acpi_data_push(table_data, sizeof *numamem);
> -        acpi_build_srat_memory(numamem, mem_base, mem_len, i - 1,
> +        build_acpi_srat_memory(numamem, mem_base, mem_len, i - 1,
>                                 MEM_AFFINITY_ENABLED);
>      }
>      slots = (table_data->len - numa_start) / sizeof *numamem;
>      for (; slots < pcms->numa_nodes + 2; slots++) {
>          numamem = acpi_data_push(table_data, sizeof *numamem);
> -        acpi_build_srat_memory(numamem, 0, 0, 0, MEM_AFFINITY_NOFLAGS);
> +        build_acpi_srat_memory(numamem, 0, 0, 0, MEM_AFFINITY_NOFLAGS);
>      }
>  
>      /*
> @@ -2531,7 +2512,7 @@ build_srat(GArray *table_data, GArray *linker, MachineState *machine)
>       */
>      if (hotplugabble_address_space_size) {
>          numamem = acpi_data_push(table_data, sizeof *numamem);
> -        acpi_build_srat_memory(numamem, pcms->hotplug_memory.base,
> +        build_acpi_srat_memory(numamem, pcms->hotplug_memory.base,
>                                 hotplugabble_address_space_size, 0,
>                                 MEM_AFFINITY_HOTPLUGGABLE |
>                                 MEM_AFFINITY_ENABLED);
> diff --git a/include/hw/acpi/aml-build.h b/include/hw/acpi/aml-build.h
> index 2c994b3..a9e8a04 100644
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
> +void build_acpi_srat_memory(AcpiSratMemoryAffinity *numamem, uint64_t base,
> +                            uint64_t len, int node, MemoryAffinityFlags flags);
> +
>  #endif
> -- 
> 2.0.4
> 
> 
>

I probably would have just called it 'build_srat_memory', but anyway

Reviewed-by: Andrew Jones <drjones@redhat.com>
 
