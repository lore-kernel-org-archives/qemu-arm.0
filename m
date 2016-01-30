Received: by 10.25.159.19 with SMTP id i19csp1258270lfe;
        Fri, 29 Jan 2016 17:51:28 -0800 (PST)
X-Received: by 10.140.31.197 with SMTP id f63mr14618485qgf.12.1454118688672;
        Fri, 29 Jan 2016 17:51:28 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r5si17981073qkr.18.2016.01.29.17.51.28
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 29 Jan 2016 17:51:28 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:37342 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aPKhE-0003mD-B9
	for alex.bennee@linaro.org; Fri, 29 Jan 2016 20:51:28 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46647)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1aPKgu-0003VL-5T
	for qemu-devel@nongnu.org; Fri, 29 Jan 2016 20:51:09 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1aPKgp-0007L5-BI
	for qemu-devel@nongnu.org; Fri, 29 Jan 2016 20:51:08 -0500
Received: from szxga03-in.huawei.com ([119.145.14.66]:7957)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>)
	id 1aPKgo-0007Kz-OP; Fri, 29 Jan 2016 20:51:03 -0500
Received: from 172.24.1.49 (EHLO szxeml433-hub.china.huawei.com)
	([172.24.1.49])
	by szxrg03-dlp.huawei.com (MOS 4.4.3-GA FastPath queued)
	with ESMTP id BVL54001; Sat, 30 Jan 2016 09:50:51 +0800 (CST)
Received: from [127.0.0.1] (10.177.16.142) by szxeml433-hub.china.huawei.com
	(10.82.67.210) with Microsoft SMTP Server id 14.3.235.1;
	Sat, 30 Jan 2016 09:50:41 +0800
Message-ID: <56AC16E6.8010300@huawei.com>
Date: Sat, 30 Jan 2016 09:50:30 +0800
From: Shannon Zhao <zhaoshenglong@huawei.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: Igor Mammedov <imammedo@redhat.com>, <qemu-devel@nongnu.org>
References: <1454077485-242598-1-git-send-email-imammedo@redhat.com>
In-Reply-To: <1454077485-242598-1-git-send-email-imammedo@redhat.com>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.177.16.142]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
	refid=str=0001.0A020202.56AC16FC.008A, ss=1, re=0.000, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0, ip=0.0.0.0,
	so=2013-05-26 15:14:31, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: 1f183f8375c8bba60d365bde028d2c87
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.66
Cc: wei@redhat.com, peter.maydell@linaro.org, drjones@redhat.com,
	qemu-arm@nongnu.org, mst@redhat.com
Subject: Re: [Qemu-devel] [PATCH] arm: virt-acpi: each MADT.GICC entry as
	enabled unconditionally
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: Di4XrLzYzP9O



On 2016/1/29 22:24, Igor Mammedov wrote:
> in current impl. condition
> 
> build_madt() {
>   ...
>   if (test_bit(i, cpuinfo->found_cpus))
> 
> is always true since loop handles only present CPUs
> in range [0..smp_cpus).
> But to fill usless cpuinfo->found_cpus we do unnecessary
> scan over QOM tree to find the same CPUs.
> So mark GICC as present always and drop not needed
> code that fills cpuinfo->found_cpus.
> 
> Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> ---
> It's just simple cleanup but I'm trying to generalize
> a bit CPU related ACPI tables and as part of it get rid
> of found_cpus bitmap and if possible cpu_index usage
> in ACPI parts of code.
> ---
>  hw/arm/virt-acpi-build.c | 26 +++-----------------------
>  1 file changed, 3 insertions(+), 23 deletions(-)
> 
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index 87fbe7c..3ed39fc 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -46,20 +46,6 @@
>  #define ARM_SPI_BASE 32
>  #define ACPI_POWER_BUTTON_DEVICE "PWRB"
>  
> -typedef struct VirtAcpiCpuInfo {
> -    DECLARE_BITMAP(found_cpus, VIRT_ACPI_CPU_ID_LIMIT);
The definition of VIRT_ACPI_CPU_ID_LIMIT should be removed as well.

Otherwise:

Reviewed-by: Shannon Zhao <shannon.zhao@linaro.org>

> -} VirtAcpiCpuInfo;
> -
> -static void virt_acpi_get_cpu_info(VirtAcpiCpuInfo *cpuinfo)
> -{
> -    CPUState *cpu;
> -
> -    memset(cpuinfo->found_cpus, 0, sizeof cpuinfo->found_cpus);
> -    CPU_FOREACH(cpu) {
> -        set_bit(cpu->cpu_index, cpuinfo->found_cpus);
> -    }
> -}
> -
>  static void acpi_dsdt_add_cpus(Aml *scope, int smp_cpus)
>  {
>      uint16_t i;
> @@ -458,8 +444,7 @@ build_gtdt(GArray *table_data, GArray *linker)
>  
>  /* MADT */
>  static void
> -build_madt(GArray *table_data, GArray *linker, VirtGuestInfo *guest_info,
> -           VirtAcpiCpuInfo *cpuinfo)
> +build_madt(GArray *table_data, GArray *linker, VirtGuestInfo *guest_info)
>  {
>      int madt_start = table_data->len;
>      const MemMapEntry *memmap = guest_info->memmap;
> @@ -489,9 +474,7 @@ build_madt(GArray *table_data, GArray *linker, VirtGuestInfo *guest_info,
>          gicc->cpu_interface_number = i;
>          gicc->arm_mpidr = armcpu->mp_affinity;
>          gicc->uid = i;
> -        if (test_bit(i, cpuinfo->found_cpus)) {
> -            gicc->flags = cpu_to_le32(ACPI_GICC_ENABLED);
> -        }
> +        gicc->flags = cpu_to_le32(ACPI_GICC_ENABLED);
>      }
>  
>      if (guest_info->gic_version == 3) {
> @@ -599,11 +582,8 @@ void virt_acpi_build(VirtGuestInfo *guest_info, AcpiBuildTables *tables)
>  {
>      GArray *table_offsets;
>      unsigned dsdt, rsdt;
> -    VirtAcpiCpuInfo cpuinfo;
>      GArray *tables_blob = tables->table_data;
>  
> -    virt_acpi_get_cpu_info(&cpuinfo);
> -
>      table_offsets = g_array_new(false, true /* clear */,
>                                          sizeof(uint32_t));
>  
> @@ -630,7 +610,7 @@ void virt_acpi_build(VirtGuestInfo *guest_info, AcpiBuildTables *tables)
>      build_fadt(tables_blob, tables->linker, dsdt);
>  
>      acpi_add_table(table_offsets, tables_blob);
> -    build_madt(tables_blob, tables->linker, guest_info, &cpuinfo);
> +    build_madt(tables_blob, tables->linker, guest_info);
>  
>      acpi_add_table(table_offsets, tables_blob);
>      build_gtdt(tables_blob, tables->linker);

-- 
Shannon

