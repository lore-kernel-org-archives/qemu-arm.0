Received: by 10.25.159.19 with SMTP id i19csp1018442lfe;
        Fri, 29 Jan 2016 07:44:11 -0800 (PST)
X-Received: by 10.55.51.203 with SMTP id z194mr11575073qkz.21.1454082251505;
        Fri, 29 Jan 2016 07:44:11 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z18si17580994qhb.117.2016.01.29.07.44.11
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 29 Jan 2016 07:44:11 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro.org
Received: from localhost ([::1]:34894 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aPBDX-0007Ih-10
	for alex.bennee@linaro.org; Fri, 29 Jan 2016 10:44:11 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45360)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <shannon.zhao@linaro.org>) id 1aPBDT-0007DK-JU
	for qemu-arm@nongnu.org; Fri, 29 Jan 2016 10:44:08 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <shannon.zhao@linaro.org>) id 1aPBDP-0000hm-CZ
	for qemu-arm@nongnu.org; Fri, 29 Jan 2016 10:44:07 -0500
Received: from mail-pf0-x22f.google.com ([2607:f8b0:400e:c00::22f]:32850)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <shannon.zhao@linaro.org>) id 1aPBDN-0000hT-VD
	for qemu-arm@nongnu.org; Fri, 29 Jan 2016 10:44:03 -0500
Received: by mail-pf0-x22f.google.com with SMTP id x125so44226972pfb.0
	for <qemu-arm@nongnu.org>; Fri, 29 Jan 2016 07:44:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=CTe5xp05A8PQddnHAIdqEnMLQZJj/zYFlT8r6h8NqkI=;
	b=epQf4ffx+koJlrw47Gh+q0rDbwE1uhQaFWAMgTCnmLy+K5dMENYHCpiab1/5oTx7zy
	9V6ubZCRM04fwK29akwBk8H3ERjB3sffjxiv7kjM4v8PxgMhIC1mm/7Axpg2g5t5AQOE
	n69Gl7LnxwuAjQmB17LPb1FaEtKucoV7t5dXU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:date:from:user-agent:mime-version:to
	:cc:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=CTe5xp05A8PQddnHAIdqEnMLQZJj/zYFlT8r6h8NqkI=;
	b=gFDtqYEB2jIDGJY64LtzeJu6Uz7IHp8bbyt1J7rmmfvoLuWmOL/2zzLz9e9F7eYQDx
	EXQ116jTUTdE1URwn8bK+JHDpwk/iZTR7N3lDjG16l28N075Cdu5k6DJhShFM3B5MyW3
	htlqw7wYLP2+ZVpjMeWzLkw8kDXpLGVQYDjoXFrgFmRfwXRHW01V8t9R059nH7wVrBHP
	ZKwGnidacYkBq72n/Y4LUxte+eBWdc4fQQM1eIsHHanOGRbYPGTV9pWyMF/KmhDf8E/n
	r1seoE1I9JzBEMQqFNmlMSkHYt0JkSptMCJ4mxV/Z/lpfNmdpRBLyyZ4hSSguL3Ae6t6
	YcgQ==
X-Gm-Message-State: AG10YOS1GPaq0hWPM9xYNIt6oRbcptpiLKME8K2z7+Xv8wuvUrEBn/WTTnQXhSbkZ3YPTFDp
X-Received: by 10.98.87.81 with SMTP id l78mr14395947pfb.101.1454082241010;
	Fri, 29 Jan 2016 07:44:01 -0800 (PST)
Received: from [10.15.245.110] ([167.160.116.223])
	by smtp.googlemail.com with ESMTPSA id
	t87sm5796270pfa.14.2016.01.29.07.43.56
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 29 Jan 2016 07:44:00 -0800 (PST)
Message-ID: <56AB88D8.1020907@linaro.org>
Date: Fri, 29 Jan 2016 23:44:24 +0800
From: Shannon Zhao <shannon.zhao@linaro.org>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: Andrew Jones <drjones@redhat.com>
References: <1454077485-242598-1-git-send-email-imammedo@redhat.com>
	<56AB7E54.4000608@linaro.org>
	<20160129152603.GG4340@hawk.localdomain>
In-Reply-To: <20160129152603.GG4340@hawk.localdomain>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400e:c00::22f
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
X-TUID: 5Qe5sK2WYL4g



On 2016/1/29 23:26, Andrew Jones wrote:
> On Fri, Jan 29, 2016 at 10:59:32PM +0800, Shannon Zhao wrote:
>> >
>> >
>> >On 2016/1/29 22:24, Igor Mammedov wrote:
>>> > >in current impl. condition
>>> > >
>>> > >build_madt() {
>>> > >   ...
>>> > >   if (test_bit(i, cpuinfo->found_cpus))
>>> > >
>>> > >is always true since loop handles only present CPUs
>>> > >in range [0..smp_cpus).
>>> > >But to fill usless cpuinfo->found_cpus we do unnecessary
>>> > >scan over QOM tree to find the same CPUs.
>>> > >So mark GICC as present always and drop not needed
>>> > >code that fills cpuinfo->found_cpus.
>>> > >
>>> > >Signed-off-by: Igor Mammedov<imammedo@redhat.com>
>>> > >---
>>> > >It's just simple cleanup but I'm trying to generalize
>>> > >a bit CPU related ACPI tables and as part of it get rid
>>> > >of found_cpus bitmap and if possible cpu_index usage
>>> > >in ACPI parts of code.
>>> > >---
>>> > >  hw/arm/virt-acpi-build.c | 26 +++-----------------------
>>> > >  1 file changed, 3 insertions(+), 23 deletions(-)
>>> > >
>>> > >diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
>>> > >index 87fbe7c..3ed39fc 100644
>>> > >--- a/hw/arm/virt-acpi-build.c
>>> > >+++ b/hw/arm/virt-acpi-build.c
>>> > >@@ -46,20 +46,6 @@
>>> > >  #define ARM_SPI_BASE 32
>>> > >  #define ACPI_POWER_BUTTON_DEVICE "PWRB"
>>> > >
>>> > >-typedef struct VirtAcpiCpuInfo {
>>> > >-    DECLARE_BITMAP(found_cpus, VIRT_ACPI_CPU_ID_LIMIT);
>>> > >-} VirtAcpiCpuInfo;
>>> > >-
>>> > >-static void virt_acpi_get_cpu_info(VirtAcpiCpuInfo *cpuinfo)
>>> > >-{
>>> > >-    CPUState *cpu;
>>> > >-
>>> > >-    memset(cpuinfo->found_cpus, 0, sizeof cpuinfo->found_cpus);
>>> > >-    CPU_FOREACH(cpu) {
>>> > >-        set_bit(cpu->cpu_index, cpuinfo->found_cpus);
>>> > >-    }
>>> > >-}
>>> > >-
>>> > >  static void acpi_dsdt_add_cpus(Aml *scope, int smp_cpus)
>>> > >  {
>>> > >      uint16_t i;
>>> > >@@ -458,8 +444,7 @@ build_gtdt(GArray *table_data, GArray *linker)
>>> > >
>>> > >  /* MADT */
>>> > >  static void
>>> > >-build_madt(GArray *table_data, GArray *linker, VirtGuestInfo *guest_info,
>>> > >-           VirtAcpiCpuInfo *cpuinfo)
>>> > >+build_madt(GArray *table_data, GArray *linker, VirtGuestInfo *guest_info)
>>> > >  {
>>> > >      int madt_start = table_data->len;
>>> > >      const MemMapEntry *memmap = guest_info->memmap;
>>> > >@@ -489,9 +474,7 @@ build_madt(GArray *table_data, GArray *linker, VirtGuestInfo *guest_info,
>>> > >          gicc->cpu_interface_number = i;
>>> > >          gicc->arm_mpidr = armcpu->mp_affinity;
>>> > >          gicc->uid = i;
>>> > >-        if (test_bit(i, cpuinfo->found_cpus)) {
>>> > >-            gicc->flags = cpu_to_le32(ACPI_GICC_ENABLED);
>>> > >-        }
>>> > >+        gicc->flags = cpu_to_le32(ACPI_GICC_ENABLED);
>>> > >      }
>> >Ah, yes, it uses smp_cpus not max_cpus. But we still needs to support
>> >max_cpus usage even though it doesn't support vcpu hotplug currently. So we
>> >may need to introduce guest_info->max_cpus and use it here.
> We should leave that for when the hotplug patches come, and we should
> probably leave the hotplug patches until we see what Igor plans for
> sharing more ACPI code between x86 and ARM.
>
Even if ignoring the vcpu hotplug, we still need to support max_cpus and 
smp_cpus usage like -smp 1,maxcpus=4.

>> >And below check in virt.c is not right while it should compare the global
>> >max_cpus with the max_cpus GIC supports.
>> >
>> >     if (smp_cpus > max_cpus) {
>> >         error_report("Number of SMP CPUs requested (%d) exceeds max CPUs "
>> >                      "supported by machine 'mach-virt' (%d)",
>> >                      smp_cpus, max_cpus);
>> >         exit(1);
>> >     }
> max_cpus is getting set to the number the gic supports just above this
> check. So max_cpus == gic_supported_cpus already, and this check is just
> confirming the number of cpus the user has selected is OK.
No, the global max_cpus (which is defined in vl.c and exported in 
sysemu/sysemu.h) is not the local variable max_cpus.

-- 
Shannon
