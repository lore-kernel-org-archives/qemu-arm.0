Received: by 10.25.159.19 with SMTP id i19csp1009481lfe;
        Fri, 29 Jan 2016 07:26:19 -0800 (PST)
X-Received: by 10.140.93.247 with SMTP id d110mr11307241qge.28.1454081179801;
        Fri, 29 Jan 2016 07:26:19 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e11si8537998qhe.88.2016.01.29.07.26.19
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 29 Jan 2016 07:26:19 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:34739 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aPAwF-0002gj-7f
	for alex.bennee@linaro.org; Fri, 29 Jan 2016 10:26:19 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39973)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1aPAw7-0002V1-Se
	for qemu-arm@nongnu.org; Fri, 29 Jan 2016 10:26:17 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1aPAw4-0003ir-L6
	for qemu-arm@nongnu.org; Fri, 29 Jan 2016 10:26:11 -0500
Received: from mx1.redhat.com ([209.132.183.28]:48146)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>)
	id 1aPAw4-0003ik-ES; Fri, 29 Jan 2016 10:26:08 -0500
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	by mx1.redhat.com (Postfix) with ESMTPS id 1DA5B2F146B;
	Fri, 29 Jan 2016 15:26:08 +0000 (UTC)
Received: from hawk.localdomain (dhcp-1-158.brq.redhat.com [10.34.1.158])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u0TFQ3IE028286
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Fri, 29 Jan 2016 10:26:06 -0500
Date: Fri, 29 Jan 2016 16:26:03 +0100
From: Andrew Jones <drjones@redhat.com>
To: Shannon Zhao <shannon.zhao@linaro.org>
Message-ID: <20160129152603.GG4340@hawk.localdomain>
References: <1454077485-242598-1-git-send-email-imammedo@redhat.com>
	<56AB7E54.4000608@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <56AB7E54.4000608@linaro.org>
User-Agent: Mutt/1.5.23.1 (2014-03-12)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: peter.maydell@linaro.org, mst@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, zhaoshenglong@huawei.com,
	Igor Mammedov <imammedo@redhat.com>
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH] arm: virt-acpi: each MADT.GICC
 entry as enabled unconditionally
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: MS5eFcbLoObK

On Fri, Jan 29, 2016 at 10:59:32PM +0800, Shannon Zhao wrote:
> 
> 
> On 2016/1/29 22:24, Igor Mammedov wrote:
> >in current impl. condition
> >
> >build_madt() {
> >   ...
> >   if (test_bit(i, cpuinfo->found_cpus))
> >
> >is always true since loop handles only present CPUs
> >in range [0..smp_cpus).
> >But to fill usless cpuinfo->found_cpus we do unnecessary
> >scan over QOM tree to find the same CPUs.
> >So mark GICC as present always and drop not needed
> >code that fills cpuinfo->found_cpus.
> >
> >Signed-off-by: Igor Mammedov<imammedo@redhat.com>
> >---
> >It's just simple cleanup but I'm trying to generalize
> >a bit CPU related ACPI tables and as part of it get rid
> >of found_cpus bitmap and if possible cpu_index usage
> >in ACPI parts of code.
> >---
> >  hw/arm/virt-acpi-build.c | 26 +++-----------------------
> >  1 file changed, 3 insertions(+), 23 deletions(-)
> >
> >diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> >index 87fbe7c..3ed39fc 100644
> >--- a/hw/arm/virt-acpi-build.c
> >+++ b/hw/arm/virt-acpi-build.c
> >@@ -46,20 +46,6 @@
> >  #define ARM_SPI_BASE 32
> >  #define ACPI_POWER_BUTTON_DEVICE "PWRB"
> >
> >-typedef struct VirtAcpiCpuInfo {
> >-    DECLARE_BITMAP(found_cpus, VIRT_ACPI_CPU_ID_LIMIT);
> >-} VirtAcpiCpuInfo;
> >-
> >-static void virt_acpi_get_cpu_info(VirtAcpiCpuInfo *cpuinfo)
> >-{
> >-    CPUState *cpu;
> >-
> >-    memset(cpuinfo->found_cpus, 0, sizeof cpuinfo->found_cpus);
> >-    CPU_FOREACH(cpu) {
> >-        set_bit(cpu->cpu_index, cpuinfo->found_cpus);
> >-    }
> >-}
> >-
> >  static void acpi_dsdt_add_cpus(Aml *scope, int smp_cpus)
> >  {
> >      uint16_t i;
> >@@ -458,8 +444,7 @@ build_gtdt(GArray *table_data, GArray *linker)
> >
> >  /* MADT */
> >  static void
> >-build_madt(GArray *table_data, GArray *linker, VirtGuestInfo *guest_info,
> >-           VirtAcpiCpuInfo *cpuinfo)
> >+build_madt(GArray *table_data, GArray *linker, VirtGuestInfo *guest_info)
> >  {
> >      int madt_start = table_data->len;
> >      const MemMapEntry *memmap = guest_info->memmap;
> >@@ -489,9 +474,7 @@ build_madt(GArray *table_data, GArray *linker, VirtGuestInfo *guest_info,
> >          gicc->cpu_interface_number = i;
> >          gicc->arm_mpidr = armcpu->mp_affinity;
> >          gicc->uid = i;
> >-        if (test_bit(i, cpuinfo->found_cpus)) {
> >-            gicc->flags = cpu_to_le32(ACPI_GICC_ENABLED);
> >-        }
> >+        gicc->flags = cpu_to_le32(ACPI_GICC_ENABLED);
> >      }
> Ah, yes, it uses smp_cpus not max_cpus. But we still needs to support
> max_cpus usage even though it doesn't support vcpu hotplug currently. So we
> may need to introduce guest_info->max_cpus and use it here.

We should leave that for when the hotplug patches come, and we should
probably leave the hotplug patches until we see what Igor plans for
sharing more ACPI code between x86 and ARM.

> And below check in virt.c is not right while it should compare the global
> max_cpus with the max_cpus GIC supports.
> 
>     if (smp_cpus > max_cpus) {
>         error_report("Number of SMP CPUs requested (%d) exceeds max CPUs "
>                      "supported by machine 'mach-virt' (%d)",
>                      smp_cpus, max_cpus);
>         exit(1);
>     }

max_cpus is getting set to the number the gic supports just above this
check. So max_cpus == gic_supported_cpus already, and this check is just
confirming the number of cpus the user has selected is OK.

drew
