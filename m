Received: by 10.25.208.194 with SMTP id h185csp900693lfg;
        Mon, 25 Apr 2016 05:59:10 -0700 (PDT)
X-Received: by 10.55.79.79 with SMTP id d76mr38117275qkb.76.1461589150257;
        Mon, 25 Apr 2016 05:59:10 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g52si10676478qge.28.2016.04.25.05.59.10
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 25 Apr 2016 05:59:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:59778 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aug6X-0000JG-P4
	for alex.bennee@linaro.org; Mon, 25 Apr 2016 08:59:09 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51185)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <marcel.apfelbaum@gmail.com>) id 1aug6U-0000E6-To
	for qemu-arm@nongnu.org; Mon, 25 Apr 2016 08:59:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <marcel.apfelbaum@gmail.com>) id 1aug6T-0003Md-Mr
	for qemu-arm@nongnu.org; Mon, 25 Apr 2016 08:59:06 -0400
Received: from mail-wm0-x243.google.com ([2a00:1450:400c:c09::243]:36348)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <marcel.apfelbaum@gmail.com>)
	id 1aug6N-0003LD-8q; Mon, 25 Apr 2016 08:58:59 -0400
Received: by mail-wm0-x243.google.com with SMTP id w143so20803466wmw.3;
	Mon, 25 Apr 2016 05:58:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=reply-to:subject:references:to:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=hUVY9Uul1bzRs0uYp3u6kUvLYRvJmLjYi6nBdsnyr7M=;
	b=tvV/BHri009NkKI2TvMZeRRVHeand1pl5hEPj+AGqyPULJlAyNRuL2GjgRXMs81/Ah
	YFEO+elvomQN/tmcwlOQd2uRwfpCM0sepE0TgrJXOcTzzPrDmSk6Fk35spemm8zh3I93
	BGjvtXlvPbi65Lrqfrj7frn6IND1um4RjEhdT04BfiicDVMs89OMtFbRYu6Px3U+TU+v
	AbPvcZE7WSvyRoeHhIN5WCcfUALeYL9U9qnAjUGEaAIisl/VuP8rK/OUO6zvyu9sTWjZ
	VkX0ibnrglrVm+e2lx/zpHtrczGOsuYZYl6yPy84kg1/V+HSpQMx47zrCYZxxLesqT77
	AQgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:reply-to:subject:references:to:cc:from
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding;
	bh=hUVY9Uul1bzRs0uYp3u6kUvLYRvJmLjYi6nBdsnyr7M=;
	b=RxdKMqjxeCI3QiHVGYFm4pwvdShrfsbeslr21qmEWy5U12Dn9B/y/AqJL3rwdXwwac
	wnYVb2URvF7EuYS2PSCTkYFEMkjd6ePcPOw8i3SYzRM/bPUw6H/hq3F+b1qaacSc60kj
	x0Pk5MDJEb2f0MJb3Q6bl/VzCbXz3Gm+G9mxoRigtvZVUoIDOabreJulJMunezltXwGy
	awfiaB6VV8POdVhEqMiSg5MvgIkiqUDiUlLdh8GnIPXSJ6zAfDN4zhctE4RFvfsFBYmz
	siXBeJBoGcW8rXHlMwjZ/HtzfQ+Wn8VF7Sq8dgljqqiYIU8Zbcs5IELqPMmL4IEhyG0E
	31GQ==
X-Gm-Message-State: AOPr4FX5v7jlWqp/N7g2Hdm87jYeBNVzrCxgzW7DAH+TtFRtFHpWGp3wbFvqPXM1msxYpg==
X-Received: by 10.28.97.9 with SMTP id v9mr11400780wmb.45.1461589138198;
	Mon, 25 Apr 2016 05:58:58 -0700 (PDT)
Received: from [192.168.1.115] ([46.120.6.143])
	by smtp.googlemail.com with ESMTPSA id
	n3sm23516215wja.6.2016.04.25.05.58.55
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 25 Apr 2016 05:58:57 -0700 (PDT)
References: <1461571547-13132-1-git-send-email-zhaoshenglong@huawei.com>
	<1461571547-13132-5-git-send-email-zhaoshenglong@huawei.com>
To: Shannon Zhao <zhaoshenglong@huawei.com>, qemu-arm@nongnu.org,
	peter.maydell@linaro.org
From: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Message-ID: <571E148E.3070508@gmail.com>
Date: Mon, 25 Apr 2016 15:58:54 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.0
MIME-Version: 1.0
In-Reply-To: <1461571547-13132-5-git-send-email-zhaoshenglong@huawei.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::243
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
Reply-To: marcel@redhat.com
Cc: drjones@redhat.com, david.daney@cavium.com,
	"Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
	peter.huangpeng@huawei.com, shannon.zhao@linaro.org,
	Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 1XYAhH/Pv+0l

On 04/25/2016 11:05 AM, Shannon Zhao wrote:
> From: Shannon Zhao <shannon.zhao@linaro.org>
>
> Move acpi_build_srat_memory to common place so that it could be reused
> by ARM. Rename it to build_acpi_srat_memory.
>
> Cc: Michael S. Tsirkin <mst@redhat.com>
> Cc: Igor Mammedov <imammedo@redhat.com>
> Signed-off-by: Shannon Zhao <shannon.zhao@linaro.org>
> ---
>   hw/acpi/aml-build.c         | 11 +++++++++++
>   hw/i386/acpi-build.c        | 29 +++++------------------------
>   include/hw/acpi/aml-build.h | 10 ++++++++++
>   3 files changed, 26 insertions(+), 24 deletions(-)
>
> diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
> index ab89ca6..f945524 100644
> --- a/hw/acpi/aml-build.c
> +++ b/hw/acpi/aml-build.c
> @@ -1563,3 +1563,14 @@ build_rsdt(GArray *table_data, GArray *linker, GArray *table_offsets,
>       build_header(linker, table_data,
>                    (void *)rsdt, "RSDT", rsdt_len, 1, oem_id, oem_table_id);
>   }
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
>                    (void *)tpm2_ptr, "TPM2", sizeof(*tpm2_ptr), 4, NULL, NULL);
>   }
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
>   static void
>   build_srat(GArray *table_data, GArray *linker, MachineState *machine)
>   {
> @@ -2491,7 +2472,7 @@ build_srat(GArray *table_data, GArray *linker, MachineState *machine)
>       numa_start = table_data->len;
>
>       numamem = acpi_data_push(table_data, sizeof *numamem);
> -    acpi_build_srat_memory(numamem, 0, 640*1024, 0, MEM_AFFINITY_ENABLED);
> +    build_acpi_srat_memory(numamem, 0, 640*1024, 0, MEM_AFFINITY_ENABLED);

Please run checkpatch before submitting. It will help getting it in sooner :)
In this case the ERROR was here before your code, but you have chance to fix it.

Thanks,
Marcel

>       next_base = 1024 * 1024;
>       for (i = 1; i < pcms->numa_nodes + 1; ++i) {
>           mem_base = next_base;
> @@ -2507,7 +2488,7 @@ build_srat(GArray *table_data, GArray *linker, MachineState *machine)
>               mem_len -= next_base - pcms->below_4g_mem_size;
>               if (mem_len > 0) {
>                   numamem = acpi_data_push(table_data, sizeof *numamem);
> -                acpi_build_srat_memory(numamem, mem_base, mem_len, i - 1,
> +                build_acpi_srat_memory(numamem, mem_base, mem_len, i - 1,
>                                          MEM_AFFINITY_ENABLED);
>               }
>               mem_base = 1ULL << 32;
> @@ -2515,13 +2496,13 @@ build_srat(GArray *table_data, GArray *linker, MachineState *machine)
>               next_base += (1ULL << 32) - pcms->below_4g_mem_size;
>           }
>           numamem = acpi_data_push(table_data, sizeof *numamem);
> -        acpi_build_srat_memory(numamem, mem_base, mem_len, i - 1,
> +        build_acpi_srat_memory(numamem, mem_base, mem_len, i - 1,
>                                  MEM_AFFINITY_ENABLED);
>       }
>       slots = (table_data->len - numa_start) / sizeof *numamem;
>       for (; slots < pcms->numa_nodes + 2; slots++) {
>           numamem = acpi_data_push(table_data, sizeof *numamem);
> -        acpi_build_srat_memory(numamem, 0, 0, 0, MEM_AFFINITY_NOFLAGS);
> +        build_acpi_srat_memory(numamem, 0, 0, 0, MEM_AFFINITY_NOFLAGS);
>       }
>
>       /*
> @@ -2531,7 +2512,7 @@ build_srat(GArray *table_data, GArray *linker, MachineState *machine)
>        */
>       if (hotplugabble_address_space_size) {
>           numamem = acpi_data_push(table_data, sizeof *numamem);
> -        acpi_build_srat_memory(numamem, pcms->hotplug_memory.base,
> +        build_acpi_srat_memory(numamem, pcms->hotplug_memory.base,
>                                  hotplugabble_address_space_size, 0,
>                                  MEM_AFFINITY_HOTPLUGGABLE |
>                                  MEM_AFFINITY_ENABLED);
> diff --git a/include/hw/acpi/aml-build.h b/include/hw/acpi/aml-build.h
> index 2c994b3..a9e8a04 100644
> --- a/include/hw/acpi/aml-build.h
> +++ b/include/hw/acpi/aml-build.h
> @@ -198,6 +198,13 @@ typedef enum {
>       AML_PULL_NONE = 3,
>   } AmlPinConfig;
>
> +typedef enum {
> +    MEM_AFFINITY_NOFLAGS      = 0,
> +    MEM_AFFINITY_ENABLED      = (1 << 0),
> +    MEM_AFFINITY_HOTPLUGGABLE = (1 << 1),
> +    MEM_AFFINITY_NON_VOLATILE = (1 << 2),
> +} MemoryAffinityFlags;
> +
>   typedef
>   struct AcpiBuildTables {
>       GArray *table_data;
> @@ -372,4 +379,7 @@ int
>   build_append_named_dword(GArray *array, const char *name_format, ...)
>   GCC_FMT_ATTR(2, 3);
>
> +void build_acpi_srat_memory(AcpiSratMemoryAffinity *numamem, uint64_t base,
> +                            uint64_t len, int node, MemoryAffinityFlags flags);
> +
>   #endif
>

