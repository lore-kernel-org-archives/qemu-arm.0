Received: by 10.25.159.19 with SMTP id i19csp994279lfe;
        Fri, 29 Jan 2016 06:59:15 -0800 (PST)
X-Received: by 10.140.224.137 with SMTP id u131mr12081498qhb.58.1454079555838;
        Fri, 29 Jan 2016 06:59:15 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l14si17424634qhl.37.2016.01.29.06.59.15
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 29 Jan 2016 06:59:15 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro.org
Received: from localhost ([::1]:34643 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aPAW3-0002IA-FB
	for alex.bennee@linaro.org; Fri, 29 Jan 2016 09:59:15 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34411)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <shannon.zhao@linaro.org>) id 1aPAW1-0002GY-0X
	for qemu-arm@nongnu.org; Fri, 29 Jan 2016 09:59:14 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <shannon.zhao@linaro.org>) id 1aPAVy-0005YB-Og
	for qemu-arm@nongnu.org; Fri, 29 Jan 2016 09:59:12 -0500
Received: from mail-pf0-x233.google.com ([2607:f8b0:400e:c00::233]:35451)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <shannon.zhao@linaro.org>) id 1aPAVx-0005X1-CR
	for qemu-arm@nongnu.org; Fri, 29 Jan 2016 09:59:10 -0500
Received: by mail-pf0-x233.google.com with SMTP id 65so43378119pfd.2
	for <qemu-arm@nongnu.org>; Fri, 29 Jan 2016 06:59:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=mSn7KVtpKIl1miDxJm7tlisW+6dOBLf3Bi3ebg6ZbK0=;
	b=RFry8rKIGhB6uz/uHvcQ47PYkNOneMBh9w4GdaHMVJCemPPVi76AqQqqGP46itX1hQ
	3wDdlNZCELE/34qXvlNI/EumpIIu0ZPlmaAHlazhwE0mLG0J386im88JZaDsvU+Pn7GS
	xS2iElTQmBJMzk6dhXUojrWKbD2i0YF/ynwGA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:date:from:user-agent:mime-version:to
	:cc:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=mSn7KVtpKIl1miDxJm7tlisW+6dOBLf3Bi3ebg6ZbK0=;
	b=jSu3+MMlnBXAwyHXOE/PMhf3f09Wrlj3/wv/M+yI6XblxrY3m0gl38nm+SzeQF9ovs
	KY1PaVcLzBq7OnpgzjvXUGKiftx9PVV1trDZsMycZVTWB1L+uc/vtWYZDZ2cY7L67j0I
	CrIeJSEYR5OiCn0y/ogWVd19lrQiu5qvDTMuVO+DQYgndqp2gwfI8H9l+KxsQu0UDEgl
	dJy63hTUWfYW39GVX7C8YAxpvQs9LjUOM4XPq79BIPgWoZp7UyiQhCdZpJtz+Lc1a2Mb
	/X9adpGkimE9nEhsVkXJToKKAIn/NZyObCs/iT1FmG9M9Y8mDW4Kylca3XdrInbKk+NN
	O0wQ==
X-Gm-Message-State: AG10YOQwP1MN8ukqmJxC9j7LvnTXc/vJHHLXWGxKpgKk0Kog1SwZT4mLaF3882fQ9pHg+pCa
X-Received: by 10.98.71.147 with SMTP id p19mr11135358pfi.165.1454079548445;
	Fri, 29 Jan 2016 06:59:08 -0800 (PST)
Received: from [10.15.245.110] ([167.160.116.223])
	by smtp.googlemail.com with ESMTPSA id
	h66sm24178744pfj.52.2016.01.29.06.59.03
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 29 Jan 2016 06:59:07 -0800 (PST)
Message-ID: <56AB7E54.4000608@linaro.org>
Date: Fri, 29 Jan 2016 22:59:32 +0800
From: Shannon Zhao <shannon.zhao@linaro.org>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: Igor Mammedov <imammedo@redhat.com>, qemu-devel@nongnu.org
References: <1454077485-242598-1-git-send-email-imammedo@redhat.com>
In-Reply-To: <1454077485-242598-1-git-send-email-imammedo@redhat.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400e:c00::233
Cc: peter.maydell@linaro.org, drjones@redhat.com, mst@redhat.com,
	qemu-arm@nongnu.org, zhaoshenglong@huawei.com
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
X-TUID: 9c0ha2XIIdP+



On 2016/1/29 22:24, Igor Mammedov wrote:
> in current impl. condition
>
> build_madt() {
>    ...
>    if (test_bit(i, cpuinfo->found_cpus))
>
> is always true since loop handles only present CPUs
> in range [0..smp_cpus).
> But to fill usless cpuinfo->found_cpus we do unnecessary
> scan over QOM tree to find the same CPUs.
> So mark GICC as present always and drop not needed
> code that fills cpuinfo->found_cpus.
>
> Signed-off-by: Igor Mammedov<imammedo@redhat.com>
> ---
> It's just simple cleanup but I'm trying to generalize
> a bit CPU related ACPI tables and as part of it get rid
> of found_cpus bitmap and if possible cpu_index usage
> in ACPI parts of code.
> ---
>   hw/arm/virt-acpi-build.c | 26 +++-----------------------
>   1 file changed, 3 insertions(+), 23 deletions(-)
>
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index 87fbe7c..3ed39fc 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -46,20 +46,6 @@
>   #define ARM_SPI_BASE 32
>   #define ACPI_POWER_BUTTON_DEVICE "PWRB"
>
> -typedef struct VirtAcpiCpuInfo {
> -    DECLARE_BITMAP(found_cpus, VIRT_ACPI_CPU_ID_LIMIT);
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
>   static void acpi_dsdt_add_cpus(Aml *scope, int smp_cpus)
>   {
>       uint16_t i;
> @@ -458,8 +444,7 @@ build_gtdt(GArray *table_data, GArray *linker)
>
>   /* MADT */
>   static void
> -build_madt(GArray *table_data, GArray *linker, VirtGuestInfo *guest_info,
> -           VirtAcpiCpuInfo *cpuinfo)
> +build_madt(GArray *table_data, GArray *linker, VirtGuestInfo *guest_info)
>   {
>       int madt_start = table_data->len;
>       const MemMapEntry *memmap = guest_info->memmap;
> @@ -489,9 +474,7 @@ build_madt(GArray *table_data, GArray *linker, VirtGuestInfo *guest_info,
>           gicc->cpu_interface_number = i;
>           gicc->arm_mpidr = armcpu->mp_affinity;
>           gicc->uid = i;
> -        if (test_bit(i, cpuinfo->found_cpus)) {
> -            gicc->flags = cpu_to_le32(ACPI_GICC_ENABLED);
> -        }
> +        gicc->flags = cpu_to_le32(ACPI_GICC_ENABLED);
>       }
Ah, yes, it uses smp_cpus not max_cpus. But we still needs to support 
max_cpus usage even though it doesn't support vcpu hotplug currently. So 
we may need to introduce guest_info->max_cpus and use it here.
And below check in virt.c is not right while it should compare the 
global max_cpus with the max_cpus GIC supports.

     if (smp_cpus > max_cpus) {
         error_report("Number of SMP CPUs requested (%d) exceeds max CPUs "
                      "supported by machine 'mach-virt' (%d)",
                      smp_cpus, max_cpus);
         exit(1);
     }

Thanks,
-- 
Shannon
