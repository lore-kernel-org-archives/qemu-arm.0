Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp5690566wru;
        Mon, 23 Jul 2018 07:01:27 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpeKhVCpCTfyV/RODX7oMLEzmzrEb1SdV5RdL4TbSs9I4FZfZHBa3TcOhu87aqT2HUYZUQXp
X-Received: by 2002:ac8:3579:: with SMTP id z54-v6mr11709519qtb.161.1532354487759;
        Mon, 23 Jul 2018 07:01:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1532354487; cv=none;
        d=google.com; s=arc-20160816;
        b=yh87v2wOpefTKvH9SGXdBGkuDq61DFB3SRh2ia+Ht0SyGwoR7BxYqkPAziaD/H9Xw/
         44J7bTCat3sxqkPU3hTyjEUAIaxayzLAxOQISmN6jdO6U+uyS9Gh4dbu3DHQLfdwFfWR
         PzAE2HNO2C43Zqvr+zeypTlR/0xNrcQW/1lM8wrPyDR9/AiGYFJisj8asXDyAj/iH7QU
         r7oaCRoejAS7lUdYSZoRkAFmhy5rUpskY106puktofrXss63g4mMKROXX25nz4EO4TpP
         hnXYPoxXwWUxVXqiooG0IZHDBYMLGVfYUeV0NXmadHFIj2p+Hg16UE+lbrOuEAY+IqXk
         OsHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:to:from:date:arc-authentication-results;
        bh=eDgYZgmpbD4SjNthyzgyhDR/ws/y/Zw0KFajNJiFhII=;
        b=Hbhuhud1aYCXgbddwMiuxJYApCHWffR57MR544Wg2lMOhHkkv9+KFoZyGJBhqpOFSm
         zmDNa4vIDhAsoHXeikHnq1YZPGManhtMJGuBzCCK2A9bF22ZhApc+yUhhn2ed29F8VQm
         tff5eQr9SXCi2Y6Exj9dtdmZ0occ/eM6O8dySHF0IIWRyOorB2D4j+ic5gChjKCMpoFh
         rbDEzm7iO8BNuGr8a1DbnGyy1dhQbgnEkul+Dvm6m7Cxi2xpsdd2xe9bQ9ynzYDxtzNS
         O++M5G2vTb18bA482EBwK47UZ0KvOWAy2yla060d0fugjCdprETzYecVAns/w1rWGYmI
         tEWw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k1-v6si4972893qvf.138.2018.07.23.07.01.27
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 23 Jul 2018 07:01:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:34793 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fhbOx-0003YT-CH
	for alex.bennee@linaro.org; Mon, 23 Jul 2018 10:01:27 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60243)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1fhbOk-0003WJ-Ty
	for qemu-arm@nongnu.org; Mon, 23 Jul 2018 10:01:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1fhbOe-0004FV-Ia
	for qemu-arm@nongnu.org; Mon, 23 Jul 2018 10:01:14 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:56856 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1fhbOe-0004FH-Cj; Mon, 23 Jul 2018 10:01:08 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B146A7C6A9;
	Mon, 23 Jul 2018 14:01:07 +0000 (UTC)
Received: from localhost (unknown [10.43.2.182])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D2D31111CB8C;
	Mon, 23 Jul 2018 14:00:59 +0000 (UTC)
Date: Mon, 23 Jul 2018 16:00:58 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Andrew Jones <drjones@redhat.com>
Message-ID: <20180723160058.42db6bdb@redhat.com>
In-Reply-To: <20180704124923.32483-6-drjones@redhat.com>
References: <20180704124923.32483-1-drjones@redhat.com>
	<20180704124923.32483-6-drjones@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.2]);
	Mon, 23 Jul 2018 14:01:07 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.2]);
	Mon, 23 Jul 2018 14:01:07 +0000 (UTC) for IP:'10.11.54.3'
	DOMAIN:'int-mx03.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'imammedo@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-arm] [RFC PATCH 5/6] virt-acpi-build: add PPTT table
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
Cc: peter.maydell@linaro.org, "Michael S. Tsirkin" <mst@redhat.com>,
	qemu-devel@nongnu.org, eric.auger@redhat.com,
	qemu-arm@nongnu.org, Shannon Zhao <zhaoshenglong@huawei.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: enRAa/2c8BcO

On Wed,  4 Jul 2018 14:49:22 +0200
Andrew Jones <drjones@redhat.com> wrote:

> The ACPI PPTT table supports topology descriptions for ACPI
> guests. Note, while a DT boot Linux guest with a non-flat CPU
> topology will see socket and core IDs being sequential integers
> starting from zero, e.g. with -smp 4,sockets=2,cores=2,threads=1
> 
> a DT boot produces
> 
>  cpu:  0 package_id:  0 core_id:  0
>  cpu:  1 package_id:  0 core_id:  1
>  cpu:  2 package_id:  1 core_id:  0
>  cpu:  3 package_id:  1 core_id:  1
> 
> an ACPI boot produces
> 
>  cpu:  0 package_id: 36 core_id:  0
>  cpu:  1 package_id: 36 core_id:  1
>  cpu:  2 package_id: 96 core_id:  2
>  cpu:  3 package_id: 96 core_id:  3
> 
> This is due to several reasons:
> 
>  1) DT cpu nodes do not have an equivalent field to what the PPTT
>     ACPI Processor ID must be, i.e. something equal to the MADT CPU
>     UID or equal to the UID of an ACPI processor container. In both
>     ACPI cases those are platform dependant IDs assigned by the
>     vendor.
> 
>  2) While QEMU is the vendor for a guest, if the topology specifies
>     SMT (> 1 thread), then, with ACPI, it is impossible to assign a
>     core-id the same value as a package-id, thus it is not possible
>     to have package-id=0 and core-id=0. This is because package and
>     core containers must be in the same ACPI namespace and therefore
>     must have unique UIDs.
> 
>  3) ACPI processor containers are not required for PPTT tables to
>     be used and, due to the limitations of which IDs are selected
>     described above in (2), they are not helpful for QEMU, so we
>     don't build them with this patch. In the absence of them, Linux
>     assigns its own unique IDs. The maintainers have chosen not to use
>     counters from zero, but rather ACPI table offsets, which explains
>     why the numbers are so much larger than with DT.
> 
>  4) When there is no SMT (threads=1) the core IDs for ACPI boot guests
>     match the logical CPU IDs, because these IDs must be equal to the
>     MADT CPU UID (as no processor containers are present), and QEMU
>     uses the logical CPU ID for these MADT IDs.
> 
> Cc: Igor Mammedov <imammedo@redhat.com>
> Cc: Shannon Zhao <zhaoshenglong@huawei.com>
> Cc: "Michael S. Tsirkin" <mst@redhat.com>
> Signed-off-by: Andrew Jones <drjones@redhat.com>
> ---
>  hw/acpi/aml-build.c         | 50 +++++++++++++++++++++++++++++++++++++
>  hw/arm/virt-acpi-build.c    |  5 ++++
>  include/hw/acpi/aml-build.h |  2 ++
>  3 files changed, 57 insertions(+)
> 
> diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
> index 1e43cd736de9..37e8f5182ae9 100644
> --- a/hw/acpi/aml-build.c
> +++ b/hw/acpi/aml-build.c
> @@ -24,6 +24,7 @@
>  #include "hw/acpi/aml-build.h"
>  #include "qemu/bswap.h"
>  #include "qemu/bitops.h"
> +#include "sysemu/cpus.h"
>  #include "sysemu/numa.h"
>  
>  static GArray *build_alloc_array(void)
> @@ -1679,6 +1680,55 @@ void build_slit(GArray *table_data, BIOSLinker *linker)
>                   table_data->len - slit_start, 1, NULL, NULL);
>  }
>  
> +/*
> + * ACPI 6.2 Processor Properties Topology Table (PPTT)
ACPI 6.2: 5.2.29.1 Processor hierarchy node structure (Type 0)

> + */
> +static void build_cpu_hierarchy(GArray *tbl, uint32_t flags,
> +                                uint32_t parent, uint32_t id)
build_processor_hierarchy_node()

> +{
> +    build_append_byte(tbl, 0);  /* Type 0 - processor */
> +    build_append_byte(tbl, 20); /* Length, no private resources */
> +    build_append_int_noprefix(tbl, 0, 2);           /* Reserved */
> +    build_append_int_noprefix(tbl, flags, 4); 
just being pedantic, even for obvious fields add a comment that matches
field name in spec, like:

  build_append_int_noprefix(tbl, flags, 4); /* Parent */


> +    build_append_int_noprefix(tbl, parent, 4);
> +    build_append_int_noprefix(tbl, id, 4);
> +    build_append_int_noprefix(tbl, 0, 4); /* Num private resources */
put comment on new line if it doesn't fit into 80limit but use full
field name from spec

> +}
> +
> +void build_pptt(GArray *table_data, BIOSLinker *linker, int possible_cpus)
> +{
> +    int pptt_start = table_data->len;
> +    int uid = 0, cpus = 0, socket;
> +
> +    acpi_data_push(table_data, sizeof(AcpiTableHeader));
> +
> +    for (socket = 0; cpus < possible_cpus; socket++) {
probably should use possible_cpus->cpus[] here to iterate over
cpus and maybe socket_id... from there as well

> +        uint32_t socket_offset = table_data->len - pptt_start;
> +        int core;
> +
> +        build_cpu_hierarchy(table_data, 1, 0, socket);

build_cpu_hierarchy(table_data, ACPI_PROC_HEIRARHY_PACKAGE, 0 /* no parent */ , socket);
> +
> +        for (core = 0; core < smp_cores; core++) {
> +            uint32_t core_offset = table_data->len - pptt_start;
> +            int thread;
> +
> +            if (smp_threads > 1) {
> +                build_cpu_hierarchy(table_data, 0, socket_offset, core);
> +                for (thread = 0; thread < smp_threads; thread++) {
maybe set/use core_id and thread_id from possible_cpus instead of
making up ID numbers here?

> +                    build_cpu_hierarchy(table_data, 2, core_offset, uid++);
> +                }
> +             } else {
> +                build_cpu_hierarchy(table_data, 2, socket_offset, uid++);
> +             }
> +        }
> +        cpus += smp_cores * smp_threads;
> +    }
> +
> +    build_header(linker, table_data,
> +                 (void *)(table_data->data + pptt_start), "PPTT",
> +                 table_data->len - pptt_start, 1, NULL, NULL);
> +}
> +
>  /* build rev1/rev3/rev5.1 FADT */
>  void build_fadt(GArray *tbl, BIOSLinker *linker, const AcpiFadtData *f,
>                  const char *oem_id, const char *oem_table_id)
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index 1d1fc824da6f..aa77e1f018d9 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -832,6 +832,11 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
>      acpi_add_table(table_offsets, tables_blob);
>      build_madt(tables_blob, tables->linker, vms);
>  
> +    if (!vmc->ignore_cpu_topology) {
> +        acpi_add_table(table_offsets, tables_blob);
> +        build_pptt(tables_blob, tables->linker, possible_cpus(vms));
> +    }
> +
>      acpi_add_table(table_offsets, tables_blob);
>      build_gtdt(tables_blob, tables->linker, vms);
>  
> diff --git a/include/hw/acpi/aml-build.h b/include/hw/acpi/aml-build.h
> index 6c36903c0a5d..2b0fde6bd417 100644
> --- a/include/hw/acpi/aml-build.h
> +++ b/include/hw/acpi/aml-build.h
> @@ -414,6 +414,8 @@ void build_srat_memory(AcpiSratMemoryAffinity *numamem, uint64_t base,
>  
>  void build_slit(GArray *table_data, BIOSLinker *linker);
>  
> +void build_pptt(GArray *table_data, BIOSLinker *linker, int possible_cpus);
> +
>  void build_fadt(GArray *tbl, BIOSLinker *linker, const AcpiFadtData *f,
>                  const char *oem_id, const char *oem_table_id);
>  #endif

