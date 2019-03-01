Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp402805wrx;
        Fri, 1 Mar 2019 01:12:30 -0800 (PST)
X-Google-Smtp-Source: APXvYqynw3PF2djpcLBVorfrcZ17rF56TzeQ3AG14hsqGPKYIJZNR+Xvz+Cd23RmZjIOUWtxw55u
X-Received: by 2002:a25:18b:: with SMTP id 133mr3104070ybb.295.1551431550711;
        Fri, 01 Mar 2019 01:12:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1551431550; cv=none;
        d=google.com; s=arc-20160816;
        b=OlqFjR4qilS9PV4OW9+WBwqyAVUh9/fNzih4eBFhf/e66wB34E95HZNdHzYaZLYaPv
         OU8pmCt0XZnPEmXKgaC+g0tYk9/7qw8FIjyYi3hoMzg4ZYt1zGeVGMEEzVUp0YbUmGU7
         uNoJ1swFfujD6Db9B4A623vm21GWV6+w1dPrAv27JgRJRstHKgvYMn5dfKLYdPp6jJn8
         x7oVJimtb4YVbxgy2qtt4hOyCbZaP70TTtJ8fVr6ntleLgst9LwzEzrqOuWr8pd1ZU9t
         E4QHJrGElW0BwwfxE0UG1NCQjj/yoBWdd5uNQipCbGMk6uuF8mDeHjw0A+lzI36bj8Jj
         ENhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:to:from:date;
        bh=mcLar6Wd6K4NXubWC/LbgPdR6HbdguOwX5ha/h5jwyg=;
        b=0NFCf2cxkQ7hB3PkhB5sdGvpRnBgBCYAjLShCXu5xEdSPCHqqc8QZ6MEVbqU5mi4Mm
         jIjF1/Q2LpNsP0oxuoTKMXbIdM6KBsX/ABMIhDMEA92PJFtWRXJnFdvBanooTi91wS8N
         6rklsxlLvp1F4mggSaQSQ/Y/MSTKCVF/JaOerRNWlNBz3bR4P9675VUbZvafXPoJD7s8
         +OU5F5qqeaoLBdxJgTzYBZS2w/Irjy/xTVY2jXRNUDo/ZSy0I+k1S1J8Egi9V0v8mcYL
         gHQU8jtfnFO17tdh3/Gfy0BRK7HO31ZZYGKxWWiCuvdTGKMVwzIiOfMbiiM4XkR3n+Yz
         Vk0g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z18si857500ybj.154.2019.03.01.01.12.30
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 01 Mar 2019 01:12:30 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:53241 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gzeDW-0003pX-5Q
	for alex.bennee@linaro.org; Fri, 01 Mar 2019 04:12:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33819)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1gzeDI-0003pD-4i
	for qemu-arm@nongnu.org; Fri, 01 Mar 2019 04:12:17 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1gzeDH-0002Gv-CM
	for qemu-arm@nongnu.org; Fri, 01 Mar 2019 04:12:16 -0500
Received: from mx1.redhat.com ([209.132.183.28]:24725)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1gzeDH-0002Du-61; Fri, 01 Mar 2019 04:12:15 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 95A411244F8;
	Fri,  1 Mar 2019 09:12:12 +0000 (UTC)
Received: from localhost (unknown [10.43.2.182])
	by smtp.corp.redhat.com (Postfix) with ESMTP id AAC42620D2;
	Fri,  1 Mar 2019 09:12:08 +0000 (UTC)
Date: Fri, 1 Mar 2019 10:12:04 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
Message-ID: <20190301101204.361adfb6@redhat.com>
In-Reply-To: <20190128110545.20644-4-shameerali.kolothum.thodi@huawei.com>
References: <20190128110545.20644-1-shameerali.kolothum.thodi@huawei.com>
	<20190128110545.20644-4-shameerali.kolothum.thodi@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Fri, 01 Mar 2019 09:12:12 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [RFC PATCH 3/4] hw/arm/virt: Enable
 pc-dimm hotplug support
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
Cc: peter.maydell@linaro.org, shannon.zhaosl@gmail.com, linuxarm@huawei.com,
	qemu-devel@nongnu.org, eric.auger@redhat.com,
	qemu-arm@nongnu.org, xuwei5@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: NbMbbddqpee1

On Mon, 28 Jan 2019 11:05:45 +0000
Shameer Kolothum <shameerali.kolothum.thodi@huawei.com> wrote:

> pc-dimm memory hotplug is enabled using GPIO(Pin 2) based ACPI
> event. Hot removal functionality is not yet supported.
> 
> Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
> ---
>  hw/arm/virt.c | 57 +++++++++++++++++++++++++++++++++++++++++++++++++++++++--
>  1 file changed, 55 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 884960d..cf64554 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -62,6 +62,7 @@
>  #include "hw/mem/pc-dimm.h"
>  #include "hw/mem/nvdimm.h"
>  #include "hw/acpi/acpi.h"
> +#include "hw/acpi/pc-hotplug.h"
it looks like x86 specific file, what is this here for?

>  
>  #define DEFINE_VIRT_MACHINE_LATEST(major, minor, latest) \
>      static void virt_##major##_##minor##_class_init(ObjectClass *oc, \
> @@ -1651,7 +1652,14 @@ static void machvirt_init(MachineState *machine)
>          nvdimm_init_acpi_state(acpi_nvdimm_state, sysmem,
>                                 vms->fw_cfg, OBJECT(vms));
>      }
> +    if (vms->acpi_memhp_state.is_enabled) {
> +        MemHotplugState *state =  &vms->acpi_memhp_state;
> +        hwaddr base;
>  
> +        state->hw_reduced_acpi = true;
> +        base = vms->memmap[VIRT_ACPI_IO].base + ACPI_MEMORY_HOTPLUG_BASE;
> +        acpi_memory_hotplug_init(sysmem, OBJECT(vms), state, base);
> +    }
>      vms->bootinfo.ram_size = machine->ram_size;
>      vms->bootinfo.kernel_filename = machine->kernel_filename;
>      vms->bootinfo.kernel_cmdline = machine->kernel_cmdline;
[...]
