Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp791635wrx;
        Fri, 1 Mar 2019 08:08:01 -0800 (PST)
X-Google-Smtp-Source: APXvYqyYudfM5vhh63TonWAx8LtdH1ayGka4wKCgvGydk8c02fMzvv6jSN3UkGZgmC1T1zSpxoge
X-Received: by 2002:a81:8455:: with SMTP id u82mr4256033ywf.415.1551456481338;
        Fri, 01 Mar 2019 08:08:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1551456481; cv=none;
        d=google.com; s=arc-20160816;
        b=m8LK3/Ywlzoz+cP8kT2A2SbtogCpx+fTQYc0WTeaE3AIisR0cL05FFP725rTr/DoIC
         hjJOgDHHrql8p7LosbASLn65LmglIvPXxv95ubXS4GeVDvvkAuvV9DF1m3Xt9lF6Yaks
         jX5XtL2QiQCqSNJilahNH4WKnKeLcmC7h7hHTk/nUt5f9Vwi9nC7pWuivsex7p7pYHda
         VMGVWEWz+JSDcpDiGMr8QrGMfWGxXeEW9V7q62EDGOKgzCJY2FLiT16NE9bbXmqWU7L1
         5scylvOToOF9KQ39FKQYnHyCQvn6qxIo5BxHxy1LyLt8JZRxSco8dVwuw/0uG61prYih
         +ILQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:to:from:date;
        bh=SyBHjlPE8VRbwjp6YnoxlK2msdbgao2sS5+NcnekdEE=;
        b=gzHXn+JZ1l21L/tZ8/J6ATjHQKtw1CqfbKVs2Z02xgGikvC2pCESe6XdGd96u5vytg
         xPzMuOR+CFZ37779lrFfVBDaBML4fawJbTdCjOtUEt9DiypN16Q3ecxyrQSWlgBjTJHG
         wApNsx7yh8OVm/0B62931WY/kYWxeHqGR197BfoEZz680ffpIDmymMjaObelhZRwMkwq
         SGDmmnjfd+P65RNCinYL6N09qinEVOLf0ovDQxJowSMXalVeAwPIgRFHDi1d+OMs/wj9
         I3O8oIhNlKllFdER3PGZAmADm68tPHVykSYSo9YjCFiBHZLxG98NQEFgMTRsSpJGpw+U
         pS9A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 84si12577704ywm.387.2019.03.01.08.08.01
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 01 Mar 2019 08:08:01 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:39870 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gzkhc-0004Zr-Nq
	for alex.bennee@linaro.org; Fri, 01 Mar 2019 11:08:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56250)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1gzkf6-0003B8-Iz
	for qemu-devel@nongnu.org; Fri, 01 Mar 2019 11:05:25 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1gzkf4-0008VD-J1
	for qemu-devel@nongnu.org; Fri, 01 Mar 2019 11:05:23 -0500
Received: from mx1.redhat.com ([209.132.183.28]:40748)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1gzkf0-0008PV-Dx; Fri, 01 Mar 2019 11:05:18 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8A36D30D78A5;
	Fri,  1 Mar 2019 16:05:17 +0000 (UTC)
Received: from localhost (unknown [10.43.2.182])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4E1C11018A03;
	Fri,  1 Mar 2019 16:04:52 +0000 (UTC)
Date: Fri, 1 Mar 2019 17:04:51 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Message-ID: <20190301170451.7bc5504a@redhat.com>
In-Reply-To: <20190301134709.4695-10-eric.auger@redhat.com>
References: <20190301134709.4695-1-eric.auger@redhat.com>
	<20190301134709.4695-10-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.47]);
	Fri, 01 Mar 2019 16:05:17 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v11 09/10] hw/arm/virt: Check the VCPU PA
 range in TCG mode
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, drjones@redhat.com, david@redhat.com,
	qemu-devel@nongnu.org, shameerali.kolothum.thodi@huawei.com,
	dgilbert@redhat.com, qemu-arm@nongnu.org, pbonzini@redhat.com,
	david@gibson.dropbear.id.au, eric.auger.pro@gmail.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: PQHGmDlaE0XE

On Fri,  1 Mar 2019 14:47:08 +0100
Eric Auger <eric.auger@redhat.com> wrote:

> We are about to allow the memory map to grow beyond 1TB and
> potentially overshoot the VCPU AA64MMFR0.PARANGE.
> 
> In aarch64 mode and when highmem is set, let's check the VCPU
> PA range is sufficient to address the highest GPA of the memory
> map.
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>

Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> ---
>  hw/arm/virt.c | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
> 
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 300eaae26f..ab70e4a657 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -60,6 +60,7 @@
>  #include "standard-headers/linux/input.h"
>  #include "hw/arm/smmuv3.h"
>  #include "hw/acpi/acpi.h"
> +#include "target/arm/internals.h"
>  
>  #define DEFINE_VIRT_MACHINE_LATEST(major, minor, latest) \
>      static void virt_##major##_##minor##_class_init(ObjectClass *oc, \
> @@ -1608,6 +1609,22 @@ static void machvirt_init(MachineState *machine)
>      fdt_add_timer_nodes(vms);
>      fdt_add_cpu_nodes(vms);
>  
> +   if (!kvm_enabled()) {
> +        ARMCPU *cpu = ARM_CPU(first_cpu);
> +        bool aarch64 = object_property_get_bool(OBJECT(cpu), "aarch64", NULL);
> +
> +        if (aarch64 && vms->highmem) {
> +            int requested_pa_size, pamax = arm_pamax(cpu);
> +
> +            requested_pa_size = 64 - clz64(vms->highest_gpa);
> +            if (pamax < requested_pa_size) {
> +                error_report("VCPU supports less PA bits (%d) than requested "
> +                            "by the memory map (%d)", pamax, requested_pa_size);
> +                exit(1);
> +            }
> +        }
> +    }
> +
>      memory_region_allocate_system_memory(ram, NULL, "mach-virt.ram",
>                                           machine->ram_size);
>      memory_region_add_subregion(sysmem, vms->memmap[VIRT_MEM].base, ram);

