Received: by 10.25.205.13 with SMTP id d13csp122070lfg;
        Thu, 15 Dec 2016 06:26:36 -0800 (PST)
X-Received: by 10.200.40.66 with SMTP id 2mr1306437qtr.287.1481811996782;
        Thu, 15 Dec 2016 06:26:36 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id b203si1134666qkc.127.2016.12.15.06.26.36
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 15 Dec 2016 06:26:36 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:54934 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cHWzS-0001lx-0F
	for alex.bennee@linaro.org; Thu, 15 Dec 2016 09:26:34 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55933)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1cHWzM-0001WI-3F
	for qemu-arm@nongnu.org; Thu, 15 Dec 2016 09:26:29 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1cHWzI-0005vh-W2
	for qemu-arm@nongnu.org; Thu, 15 Dec 2016 09:26:28 -0500
Received: from mx1.redhat.com ([209.132.183.28]:60708)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1cHWzI-0005vO-Nx; Thu, 15 Dec 2016 09:26:24 -0500
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 807FE804FA;
	Thu, 15 Dec 2016 14:26:23 +0000 (UTC)
Received: from nial.brq.redhat.com (dhcp-1-118.brq.redhat.com [10.34.1.118])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id uBFEQLPM029603; Thu, 15 Dec 2016 09:26:21 -0500
Date: Thu, 15 Dec 2016 15:26:20 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Andrew Jones <drjones@redhat.com>
Message-ID: <20161215152620.0c39467b@nial.brq.redhat.com>
In-Reply-To: <20161213214522.25548-6-drjones@redhat.com>
References: <20161213214522.25548-1-drjones@redhat.com>
	<20161213214522.25548-6-drjones@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Thu, 15 Dec 2016 14:26:23 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 05/11] hw/arm/virt: remove
 include/hw/arm/virt-acpi-build.h
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
X-TUID: UOlfnwZSRxte

On Tue, 13 Dec 2016 22:45:16 +0100
Andrew Jones <drjones@redhat.com> wrote:

> include/hw/arm/virt-acpi-build.h is only used for VirtGuestInfo,
> which doesn't even necessarily have to be ACPI specific. Move
> VirtGuestInfo to include/hw/arm/virt.h, allowing us to remove
> include/hw/arm/virt-acpi-build.h, and to prepare for even more
> code motion.
> 
> Signed-off-by: Andrew Jones <drjones@redhat.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> ---
>  MAINTAINERS                      |  2 --
>  hw/arm/virt-acpi-build.c         |  2 +-
>  hw/arm/virt.c                    |  1 -
>  include/hw/arm/virt-acpi-build.h | 41 ----------------------------------------
>  include/hw/arm/virt.h            | 16 +++++++++++++++-
>  5 files changed, 16 insertions(+), 46 deletions(-)
>  delete mode 100644 include/hw/arm/virt-acpi-build.h
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 4a605791fc98..465b9f0f8440 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -508,7 +508,6 @@ M: Shannon Zhao <shannon.zhao@linaro.org>
>  L: qemu-arm@nongnu.org
>  S: Maintained
>  F: hw/arm/virt-acpi-build.c
> -F: include/hw/arm/virt-acpi-build.h
>  
>  STM32F205
>  M: Alistair Francis <alistair@alistair23.me>
> @@ -885,7 +884,6 @@ F: hw/acpi/*
>  F: hw/smbios/*
>  F: hw/i386/acpi-build.[hc]
>  F: hw/arm/virt-acpi-build.c
> -F: include/hw/arm/virt-acpi-build.h
>  
>  ppc4xx
>  M: Alexander Graf <agraf@suse.de>
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index d4160dfa7d34..db44e2dd5f12 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -29,7 +29,6 @@
>  #include "qemu/osdep.h"
>  #include "qapi/error.h"
>  #include "qemu-common.h"
> -#include "hw/arm/virt-acpi-build.h"
>  #include "qemu/bitmap.h"
>  #include "trace.h"
>  #include "qom/cpu.h"
> @@ -43,6 +42,7 @@
>  #include "hw/acpi/aml-build.h"
>  #include "hw/pci/pcie_host.h"
>  #include "hw/pci/pci.h"
> +#include "hw/arm/virt.h"
>  #include "sysemu/numa.h"
>  #include "kvm_arm.h"
>  
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 0657f9ae8722..b137d9bbb689 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -48,7 +48,6 @@
>  #include "qemu/bitops.h"
>  #include "qemu/error-report.h"
>  #include "hw/pci-host/gpex.h"
> -#include "hw/arm/virt-acpi-build.h"
>  #include "hw/arm/sysbus-fdt.h"
>  #include "hw/platform-bus.h"
>  #include "hw/arm/fdt.h"
> diff --git a/include/hw/arm/virt-acpi-build.h b/include/hw/arm/virt-acpi-build.h
> deleted file mode 100644
> index d74d7a1af650..000000000000
> --- a/include/hw/arm/virt-acpi-build.h
> +++ /dev/null
> @@ -1,41 +0,0 @@
> -/*
> - *
> - * Copyright (c) 2015 HUAWEI TECHNOLOGIES CO.,LTD.
> - *
> - * Author: Shannon Zhao <zhaoshenglong@huawei.com>
> - *
> - * This program is free software; you can redistribute it and/or modify it
> - * under the terms and conditions of the GNU General Public License,
> - * version 2 or later, as published by the Free Software Foundation.
> - *
> - * This program is distributed in the hope it will be useful, but WITHOUT
> - * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
> - * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
> - * more details.
> - *
> - * You should have received a copy of the GNU General Public License along with
> - * this program.  If not, see <http://www.gnu.org/licenses/>.
> - */
> -
> -#ifndef QEMU_VIRT_ACPI_BUILD_H
> -#define QEMU_VIRT_ACPI_BUILD_H
> -
> -#include "qemu-common.h"
> -#include "hw/arm/virt.h"
> -#include "qemu/notify.h"
> -
> -#define ACPI_GICC_ENABLED 1
> -
> -typedef struct VirtGuestInfo {
> -    int smp_cpus;
> -    FWCfgState *fw_cfg;
> -    const MemMapEntry *memmap;
> -    const int *irqmap;
> -    bool use_highmem;
> -    int gic_version;
> -    bool no_its;
> -} VirtGuestInfo;
> -
> -void virt_acpi_setup(VirtGuestInfo *guest_info);
> -
> -#endif
> diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
> index b805b7622834..c2c1f6837442 100644
> --- a/include/hw/arm/virt.h
> +++ b/include/hw/arm/virt.h
> @@ -32,6 +32,7 @@
>  
>  #include "qemu-common.h"
>  #include "exec/hwaddr.h"
> +#include "qemu/notify.h"
>  
>  #define NUM_GICV2M_SPIS       64
>  #define NUM_VIRTIO_TRANSPORTS 32
> @@ -47,6 +48,8 @@
>  
>  #define PPI(irq) ((irq) + 16)
>  
> +#define ACPI_GICC_ENABLED 1
> +
>  enum {
>      VIRT_FLASH,
>      VIRT_MEM,
> @@ -76,5 +79,16 @@ typedef struct MemMapEntry {
>      hwaddr size;
>  } MemMapEntry;
>  
> +typedef struct VirtGuestInfo {
> +    int smp_cpus;
> +    FWCfgState *fw_cfg;
> +    const MemMapEntry *memmap;
> +    const int *irqmap;
> +    bool use_highmem;
> +    int gic_version;
> +    bool no_its;
> +} VirtGuestInfo;
> +
> +void virt_acpi_setup(VirtGuestInfo *guest_info);
>  
> -#endif
> +#endif /* QEMU_ARM_VIRT_H */

