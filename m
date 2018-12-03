Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp6663811wrt;
        Mon, 3 Dec 2018 03:22:23 -0800 (PST)
X-Google-Smtp-Source: AFSGD/Vn8sV3fIJXYrvGwuTRqW2PHvnkp0vHjKhRohKXLS3QezvqfPrUxJhX4zbjwOg/NyMMnqER
X-Received: by 2002:aed:3263:: with SMTP id y90mr14421134qtd.269.1543836143248;
        Mon, 03 Dec 2018 03:22:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1543836143; cv=none;
        d=google.com; s=arc-20160816;
        b=Zs/NOBRqVsSlGX8tzlBK0etTVFSUZfAeiu0NqYEz38EooKlW4DDrOo9Ngb+f1SWcJz
         /QalSn4UDlNepbUpQQ7XeboVAjVGVa4peZB2OPzl3QMZmd/lwBPGzXHDKHMHhU/NMmPC
         PEfjGTFeFDkfvaUSQg6szFogQZYYuz4ne7IxrKqR7k9vGdFdbhOFrX7ADmi1EQwubpqd
         0Qz+kQEVLQSpUy+led2b40+3/8Q6w5OlQFss8OJVW/8Wkz/66ki7cwkG9CvGJiHO/5fX
         SQJn/STofi03djK+1tOftjJlFKpKyP5gOZw/S43GZAWkLAhhyR2n30/qbwGiLVXzbthv
         hLIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date;
        bh=vCF6hnW5fPWdSZkoI2CT9UDop+pMRkkGnZyET+BCPys=;
        b=O8E1bjU27nuk9PoMwo3jce9PXZBsXfaQaRrVfUU507WGO8IBc2p+cvtkgoLv6UcXvk
         ulZ/FP0eNYoq2vl5z/w2o05kcG12bmVmlZEmKdxGs1Rf/wv3vuNZnW7WhVhC2gG9b+D1
         c6P0vxjmuK+p1WXVJVADpPPsGfMPDM2bI9toDbbnuRCS60oerR9QMWIrbnDOIqZpTw6Q
         9YtrldlFqxHAeMDoXRE33yjlXLUJ9MfyR+xqgE9zwNsbX9crR3OPYZWBUZDRgi4fVG5a
         rClZ7+hN0nmkFD0gr0qLujrijs5pNt0wq6+t4f3fvX0A3Rg0mfq1DDAKIpkb1Oe3fmsA
         oduQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o14si405636qtb.200.2018.12.03.03.22.23
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 03 Dec 2018 03:22:23 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:48020 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gTmIw-0004Q7-Nt
	for alex.bennee@linaro.org; Mon, 03 Dec 2018 06:22:22 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56032)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1gTmIj-0004Ov-BJ
	for qemu-arm@nongnu.org; Mon, 03 Dec 2018 06:22:10 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1gTmIg-0006Jo-5U
	for qemu-arm@nongnu.org; Mon, 03 Dec 2018 06:22:09 -0500
Received: from mx1.redhat.com ([209.132.183.28]:43684)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <drjones@redhat.com>)
	id 1gTmIf-0006JW-UW; Mon, 03 Dec 2018 06:22:06 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 494BE308A958;
	Mon,  3 Dec 2018 11:22:05 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.43.2.160])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AD38BBABE;
	Mon,  3 Dec 2018 11:22:01 +0000 (UTC)
Date: Mon, 3 Dec 2018 12:21:59 +0100
From: Andrew Jones <drjones@redhat.com>
To: Peng Hao <peng.hao2@zte.com.cn>
Message-ID: <20181203112159.64zzv33vhqnswa4z@kamzik.brq.redhat.com>
References: <1543865209-50994-1-git-send-email-peng.hao2@zte.com.cn>
	<1543865209-50994-5-git-send-email-peng.hao2@zte.com.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1543865209-50994-5-git-send-email-peng.hao2@zte.com.cn>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.41]);
	Mon, 03 Dec 2018 11:22:05 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH V11 4/8] hw/arm/virt: Use the pvpanic device
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, philmd@redhat.com,
	qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: LeCL1UkwHmUU

On Tue, Dec 04, 2018 at 03:26:45AM +0800, Peng Hao wrote:
> Add pvpanic device in arm virt machine.
> 
> Signed-off-by: Peng Hao <peng.hao2@zte.com.cn>
> ---
>  default-configs/arm-softmmu.mak |  1 +
>  hw/arm/virt.c                   | 22 ++++++++++++++++++++++
>  include/hw/arm/virt.h           |  1 +
>  3 files changed, 24 insertions(+)
> 
> diff --git a/default-configs/arm-softmmu.mak b/default-configs/arm-softmmu.mak
> index 2420491..50345df 100644
> --- a/default-configs/arm-softmmu.mak
> +++ b/default-configs/arm-softmmu.mak
> @@ -159,3 +159,4 @@ CONFIG_PCI_DESIGNWARE=y
>  CONFIG_STRONGARM=y
>  CONFIG_HIGHBANK=y
>  CONFIG_MUSICPAL=y
> +CONFIG_PVPANIC=y
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index a2b8d8f..a4541fa 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -59,6 +59,7 @@
>  #include "qapi/visitor.h"
>  #include "standard-headers/linux/input.h"
>  #include "hw/arm/smmuv3.h"
> +#include "hw/misc/pvpanic.h"
>  
>  #define DEFINE_VIRT_MACHINE_LATEST(major, minor, latest) \
>      static void virt_##major##_##minor##_class_init(ObjectClass *oc, \
> @@ -143,6 +144,7 @@ static const MemMapEntry a15memmap[] = {
>      [VIRT_GPIO] =               { 0x09030000, 0x00001000 },
>      [VIRT_SECURE_UART] =        { 0x09040000, 0x00001000 },
>      [VIRT_SMMU] =               { 0x09050000, 0x00020000 },
> +    [VIRT_PVPANIC] =            { 0x09070000, 0x00000002 },
>      [VIRT_MMIO] =               { 0x0a000000, 0x00000200 },
>      /* ...repeating for a total of NUM_VIRTIO_TRANSPORTS, each of that size */
>      [VIRT_PLATFORM_BUS] =       { 0x0c000000, 0x02000000 },
> @@ -190,6 +192,24 @@ static bool cpu_type_valid(const char *cpu)
>      return false;
>  }
>  
> +static void create_pvpanic_device(const VirtMachineState *vms)
> +{
> +    char *nodename;
> +    hwaddr base = vms->memmap[VIRT_PVPANIC].base;
> +    hwaddr size = vms->memmap[VIRT_PVPANIC].size;
> +
> +    sysbus_create_simple(TYPE_PVPANIC_MMIO, base, NULL);
> +
> +    nodename = g_strdup_printf("/pvpanic-mmio@%" PRIx64, base);
> +    qemu_fdt_add_subnode(vms->fdt, nodename);
> +    qemu_fdt_setprop_string(vms->fdt, nodename,
> +                            "compatible", "qemu,pvpanic-mmio");
> +    qemu_fdt_setprop_sized_cells(vms->fdt, nodename, "reg",
> +                                 2, base, 2, size);
> +
> +    g_free(nodename);
> +}
> +
>  static void create_fdt(VirtMachineState *vms)
>  {
>      void *fdt = create_device_tree(&vms->fdt_size);
> @@ -1531,6 +1551,8 @@ static void machvirt_init(MachineState *machine)
>  
>      create_flash(vms, sysmem, secure_sysmem ? secure_sysmem : sysmem);
>  
> +    create_pvpanic_device(vms);
> +
>      create_gic(vms, pic);
>  
>      fdt_add_pmu_nodes(vms);
> diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
> index 4cc57a7..937c124 100644
> --- a/include/hw/arm/virt.h
> +++ b/include/hw/arm/virt.h
> @@ -66,6 +66,7 @@ enum {
>      VIRT_GIC_REDIST,
>      VIRT_GIC_REDIST2,
>      VIRT_SMMU,
> +    VIRT_PVPANIC,
>      VIRT_UART,
>      VIRT_MMIO,
>      VIRT_RTC,
> -- 
> 1.8.3.1
>

With the change pointed out in 6/8

Reviewed-by: Andrew Jones <drjones@redhat.com>
