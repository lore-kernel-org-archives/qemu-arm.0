Received: by 10.25.205.13 with SMTP id d13csp125382lfg;
        Thu, 15 Dec 2016 06:32:50 -0800 (PST)
X-Received: by 10.55.176.135 with SMTP id z129mr1685835qke.52.1481812370389;
        Thu, 15 Dec 2016 06:32:50 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id r190si1147509qkd.68.2016.12.15.06.32.49
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 15 Dec 2016 06:32:50 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:54961 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cHX5T-0001VZ-LK
	for alex.bennee@linaro.org; Thu, 15 Dec 2016 09:32:47 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57664)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1cHX5O-0001Lq-0W
	for qemu-arm@nongnu.org; Thu, 15 Dec 2016 09:32:42 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1cHX5J-0000J0-Ke
	for qemu-arm@nongnu.org; Thu, 15 Dec 2016 09:32:42 -0500
Received: from mx1.redhat.com ([209.132.183.28]:59610)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1cHX5J-0000IV-FM; Thu, 15 Dec 2016 09:32:37 -0500
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5183C8FCE7;
	Thu, 15 Dec 2016 14:32:36 +0000 (UTC)
Received: from nial.brq.redhat.com (dhcp-1-118.brq.redhat.com [10.34.1.118])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id uBFEWYJa013330; Thu, 15 Dec 2016 09:32:34 -0500
Date: Thu, 15 Dec 2016 15:32:33 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Andrew Jones <drjones@redhat.com>
Message-ID: <20161215153233.301e713a@nial.brq.redhat.com>
In-Reply-To: <20161213214522.25548-7-drjones@redhat.com>
References: <20161213214522.25548-1-drjones@redhat.com>
	<20161213214522.25548-7-drjones@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Thu, 15 Dec 2016 14:32:36 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH 06/11] hw/arm/virt: move
 VirtMachineState/Class to virt.h
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
Cc: peter.maydell@linaro.org, ehabkost@redhat.com, mst@redhat.com,
	qemu-devel@nongnu.org, qemu-arm@nongnu.org, zhaoshenglong@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: R2l+evSFYa8Z

On Tue, 13 Dec 2016 22:45:17 +0100
Andrew Jones <drjones@redhat.com> wrote:

> In preparation to share more Virt machine state than just guest-info
> with other mach-virt source files, move the State and Class structures
> to virt.h
> 
> Signed-off-by: Andrew Jones <drjones@redhat.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> ---
[...]
> diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
> index c2c1f6837442..77d25dbddb62 100644
> --- a/include/hw/arm/virt.h
> +++ b/include/hw/arm/virt.h
> @@ -33,6 +33,8 @@
>  #include "qemu-common.h"
>  #include "exec/hwaddr.h"
>  #include "qemu/notify.h"
> +#include "hw/boards.h"
nit:
one won't need this header be included directly in virt.c anymore

> +#include "hw/arm/arm.h"
>  
>  #define NUM_GICV2M_SPIS       64
>  #define NUM_VIRTIO_TRANSPORTS 32
> @@ -89,6 +91,43 @@ typedef struct VirtGuestInfo {
>      bool no_its;
>  } VirtGuestInfo;
>  
> +typedef struct {
> +    MachineClass parent;
> +    bool disallow_affinity_adjustment;
> +    bool no_its;
> +    bool no_pmu;
> +    bool claim_edge_triggered_timers;
> +} VirtMachineClass;
> +
> +typedef struct {
> +    MachineState parent;
> +    VirtGuestInfo acpi_guest_info;
> +    Notifier machine_done;
> +    bool secure;
> +    bool highmem;
> +    bool virt;
> +    int32_t gic_version;
> +    struct arm_boot_info bootinfo;
> +    const MemMapEntry *memmap;
> +    const int *irqmap;
> +    int smp_cpus;
> +    void *fdt;
> +    int fdt_size;
> +    uint32_t clock_phandle;
> +    uint32_t gic_phandle;
> +    uint32_t msi_phandle;
> +    int psci_conduit;
> +} VirtMachineState;
> +
> +#define TYPE_VIRT_MACHINE   MACHINE_TYPE_NAME("virt")
> +#define VIRT_MACHINE(obj) \
> +    OBJECT_CHECK(VirtMachineState, (obj), TYPE_VIRT_MACHINE)
> +#define VIRT_MACHINE_GET_CLASS(obj) \
> +    OBJECT_GET_CLASS(VirtMachineClass, obj, TYPE_VIRT_MACHINE)
> +#define VIRT_MACHINE_CLASS(klass) \
> +    OBJECT_CLASS_CHECK(VirtMachineClass, klass, TYPE_VIRT_MACHINE)
> +
> +
>  void virt_acpi_setup(VirtGuestInfo *guest_info);
>  
>  #endif /* QEMU_ARM_VIRT_H */

