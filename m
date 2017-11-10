Received: by 10.223.150.237 with SMTP id u100csp4179762wrb;
        Fri, 10 Nov 2017 12:36:06 -0800 (PST)
X-Google-Smtp-Source: AGs4zMbnF7e0co0Tj8ikcBI0rxUVk8YuvSXal/hze4MFbWSyWuim3D8k6Gk9DQaKhjSl6X96i/ZG
X-Received: by 10.37.246.39 with SMTP id t39mr1118798ybd.497.1510346166270;
        Fri, 10 Nov 2017 12:36:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1510346166; cv=none;
        d=google.com; s=arc-20160816;
        b=nthuEPPdFr90zO/KLYsQmwOoOWdFcNaCJXnD35JAybsGiKPEnY2tQt5k3Yv7u+Ky5Q
         8guAvBI8AEsAW3QVw3LhHGRLtRswMKkubMcXXhsZRWgcyZ4LqoRyWdvIeTjRv+VTOBC7
         94+QDvNMwJXcU6fn6/O6xFo/FM2ptx6AjVMk8h2l45YVnuza8F5VLS90l4jFcytQCqKl
         KyBgGZ4uptN++T+LHVii6Wgm0M8qxaqiBcuWnPeQ6klna/H9EHI9pPTyBSgwvB/iKP0A
         7sNUC/5rgitzSdwf2qmKUA6SVnR9Qb+dPD3REnuZpPIdM2B+dZXAinp/oM9j5lfVdybK
         ZDUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :arc-authentication-results;
        bh=jgR33sBC12iWDHP+KGbQvHwVMt/s7eW5M4BTn//KW8U=;
        b=h30oyMblpC5fUH/2dIJibkHfO8LALFKHeeuMVTwi0KNpha0Nr/I/OuUoEQjG54fRI2
         gv4eOh1AYExGu3D+ilSKJWiTl9oEIthh1csl2xLbgHdQRUMwQZBVG9QXWt1HsSShQ+p/
         ULIBCHq4nlxqCgiuKtULr+K4aOdLIEXWIevAQNXUrtwKnzB0O8CzIpeQz+jzAXxNNHEW
         4FIefFNyG/girdvgA8eHQDXLVY2e6X5DnVfgtM82dbU1A6GSpDnDkBUkWR7cppyao/WV
         vrtC39sk44htvZO3bLzIdiy7RQgCMh4GpkTnC+Hiw0qL73UxM1mzDu3qDiZ3DdeIcSKE
         sHeA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v17si2499918ywh.539.2017.11.10.12.36.06
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 10 Nov 2017 12:36:06 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:43402 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eDG21-0004jp-NO
	for alex.bennee@linaro.org; Fri, 10 Nov 2017 15:36:05 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55244)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1eDFyW-00025P-Ry
	for qemu-devel@nongnu.org; Fri, 10 Nov 2017 15:32:30 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1eDFyV-0004eL-F1
	for qemu-devel@nongnu.org; Fri, 10 Nov 2017 15:32:28 -0500
Received: from mx1.redhat.com ([209.132.183.28]:53990)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1eDFyQ-0004bg-3A; Fri, 10 Nov 2017 15:32:22 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2114980C1E;
	Fri, 10 Nov 2017 20:32:21 +0000 (UTC)
Received: from localhost (ovpn-116-2.gru2.redhat.com [10.97.116.2])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 89140171E2;
	Fri, 10 Nov 2017 20:32:15 +0000 (UTC)
Date: Fri, 10 Nov 2017 18:32:13 -0200
From: Eduardo Habkost <ehabkost@redhat.com>
To: "Emilio G. Cota" <cota@braap.org>
Message-ID: <20171110203213.GV3111@localhost.localdomain>
References: <1510343626-25861-1-git-send-email-cota@braap.org>
	<1510343626-25861-6-git-send-email-cota@braap.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1510343626-25861-6-git-send-email-cota@braap.org>
X-Fnord: you can see the fnord
User-Agent: Mutt/1.9.1 (2017-09-22)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Fri, 10 Nov 2017 20:32:21 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH for 2.11 5/5] hw: add .min_cpus and
 .default_cpus fields to machine_class
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>,
	Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
	Alistair Francis <alistair.francis@xilinx.com>,
	qemu-arm@nongnu.org, Marcel Apfelbaum <marcel@redhat.com>,
	"Edgar E . Iglesias" <edgar.iglesias@gmail.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: f9LwdvP1pKMF

On Fri, Nov 10, 2017 at 02:53:46PM -0500, Emilio G. Cota wrote:
> max_cpus needs to be an upper bound on the number of vCPUs
> initialized; otherwise TCG region initialization breaks.
> 
> Some boards initialize a hard-coded number of vCPUs, which is not
> captured by the global max_cpus and therefore breaks TCG initialization.
> Fix it by adding the .min_cpus field to machine_class.
> 
> This commit also changes some user-facing behaviour: we now die if
> -smp is below this hard-coded vCPU minimum instead of silently
> ignoring the passed -smp value (sometimes announcing this by printing
> a warning). However, the introduction of .default_cpus lessens the
> likelihood that users will notice this: if -smp isn't set, we now
> assign the value in .default_cpus to both smp_cpus and max_cpus. IOW,
> if a user does not set -smp, they always get a correct number of vCPUs.
> 
> This change fixes 3468b59 ("tcg: enable multiple TCG contexts in
> softmmu", 2017-10-24), which broke TCG initialization for some
> ARM boards.
> 
> Fixes: 3468b59e18b179bc63c7ce934de912dfa9596122
> Reported-by: Thomas Huth <thuth@redhat.com>
> Suggested-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Emilio G. Cota <cota@braap.org>
> ---
>  include/hw/boards.h     |  5 +++++
>  hw/arm/exynos4_boards.c | 12 ++++--------
>  hw/arm/raspi.c          |  2 ++
>  hw/arm/xlnx-zcu102.c    |  2 ++
>  vl.c                    | 21 ++++++++++++++++++---
>  5 files changed, 31 insertions(+), 11 deletions(-)
> 
> diff --git a/include/hw/boards.h b/include/hw/boards.h
> index 191a5b3..62f160e 100644
> --- a/include/hw/boards.h
> +++ b/include/hw/boards.h
> @@ -102,6 +102,9 @@ typedef struct {
>  
>  /**
>   * MachineClass:
> + * @max_cpus: maximum number of CPUs supported. Default: 1
> + * @min_cpus: minimum number of CPUs supported. Default: 1
> + * @default_cpus: number of CPUs instantiated if none are specified. Default: 1
>   * @get_hotplug_handler: this function is called during bus-less
>   *    device hotplug. If defined it returns pointer to an instance
>   *    of HotplugHandler object, which handles hotplug operation
> @@ -167,6 +170,8 @@ struct MachineClass {
>      BlockInterfaceType block_default_type;
>      int units_per_default_bus;
>      int max_cpus;
> +    int min_cpus;
> +    int default_cpus;
>      unsigned int no_serial:1,
>          no_parallel:1,
>          use_virtcon:1,
> diff --git a/hw/arm/exynos4_boards.c b/hw/arm/exynos4_boards.c
> index f1441ec..750162c 100644
> --- a/hw/arm/exynos4_boards.c
> +++ b/hw/arm/exynos4_boards.c
> @@ -27,7 +27,6 @@
>  #include "qemu-common.h"
>  #include "cpu.h"
>  #include "sysemu/sysemu.h"
> -#include "sysemu/qtest.h"
>  #include "hw/sysbus.h"
>  #include "net/net.h"
>  #include "hw/arm/arm.h"
> @@ -129,13 +128,6 @@ exynos4_boards_init_common(MachineState *machine,
>                             Exynos4BoardType board_type)
>  {
>      Exynos4BoardState *s = g_new(Exynos4BoardState, 1);
> -    MachineClass *mc = MACHINE_GET_CLASS(machine);
> -
> -    if (smp_cpus != EXYNOS4210_NCPUS && !qtest_enabled()) {
> -        error_report("%s board supports only %d CPU cores, ignoring smp_cpus"
> -                     " value",
> -                     mc->name, EXYNOS4210_NCPUS);
> -    }
>  
>      exynos4_board_binfo.ram_size = exynos4_board_ram_size[board_type];
>      exynos4_board_binfo.board_id = exynos4_board_id[board_type];
> @@ -189,6 +181,8 @@ static void nuri_class_init(ObjectClass *oc, void *data)
>      mc->desc = "Samsung NURI board (Exynos4210)";
>      mc->init = nuri_init;
>      mc->max_cpus = EXYNOS4210_NCPUS;
> +    mc->min_cpus = EXYNOS4210_NCPUS;
> +    mc->default_cpus = EXYNOS4210_NCPUS;
>      mc->ignore_memory_transaction_failures = true;
>  }
>  
> @@ -205,6 +199,8 @@ static void smdkc210_class_init(ObjectClass *oc, void *data)
>      mc->desc = "Samsung SMDKC210 board (Exynos4210)";
>      mc->init = smdkc210_init;
>      mc->max_cpus = EXYNOS4210_NCPUS;
> +    mc->min_cpus = EXYNOS4210_NCPUS;
> +    mc->default_cpus = EXYNOS4210_NCPUS;
>      mc->ignore_memory_transaction_failures = true;
>  }
>  
> diff --git a/hw/arm/raspi.c b/hw/arm/raspi.c
> index 5941c9f..cd5fa8c 100644
> --- a/hw/arm/raspi.c
> +++ b/hw/arm/raspi.c
> @@ -167,6 +167,8 @@ static void raspi2_machine_init(MachineClass *mc)
>      mc->no_floppy = 1;
>      mc->no_cdrom = 1;
>      mc->max_cpus = BCM2836_NCPUS;
> +    mc->min_cpus = BCM2836_NCPUS;
> +    mc->default_cpus = BCM2836_NCPUS;
>      mc->default_ram_size = 1024 * 1024 * 1024;
>      mc->ignore_memory_transaction_failures = true;
>  };
> diff --git a/hw/arm/xlnx-zcu102.c b/hw/arm/xlnx-zcu102.c
> index 190eb69..9631a53 100644
> --- a/hw/arm/xlnx-zcu102.c
> +++ b/hw/arm/xlnx-zcu102.c
> @@ -189,6 +189,7 @@ static void xlnx_ep108_machine_class_init(ObjectClass *oc, void *data)
>      mc->units_per_default_bus = 1;
>      mc->ignore_memory_transaction_failures = true;
>      mc->max_cpus = XLNX_ZYNQMP_NUM_APU_CPUS + XLNX_ZYNQMP_NUM_RPU_CPUS;
> +    mc->default_cpus = XLNX_ZYNQMP_NUM_APU_CPUS;
>  }
>  
>  static const TypeInfo xlnx_ep108_machine_init_typeinfo = {
> @@ -246,6 +247,7 @@ static void xlnx_zcu102_machine_class_init(ObjectClass *oc, void *data)
>      mc->units_per_default_bus = 1;
>      mc->ignore_memory_transaction_failures = true;
>      mc->max_cpus = XLNX_ZYNQMP_NUM_APU_CPUS + XLNX_ZYNQMP_NUM_RPU_CPUS;
> +    mc->default_cpus = XLNX_ZYNQMP_NUM_APU_CPUS;
>  }
>  
>  static const TypeInfo xlnx_zcu102_machine_init_typeinfo = {
> diff --git a/vl.c b/vl.c
> index ec29909..7372424 100644
> --- a/vl.c
> +++ b/vl.c
> @@ -160,8 +160,8 @@ Chardev *virtcon_hds[MAX_VIRTIO_CONSOLES];
>  Chardev *sclp_hds[MAX_SCLP_CONSOLES];
>  int win2k_install_hack = 0;
>  int singlestep = 0;
> -int smp_cpus = 1;
> -unsigned int max_cpus = 1;
> +int smp_cpus;
> +unsigned int max_cpus;
>  int smp_cores = 1;
>  int smp_threads = 1;
>  int acpi_enabled = 1;
> @@ -4327,9 +4327,24 @@ int main(int argc, char **argv, char **envp)
>          exit(0);
>      }
>  
> +    /* machine_class: default to UP */
> +    machine_class->max_cpus = machine_class->max_cpus ?: 1;
> +    machine_class->min_cpus = machine_class->min_cpus ?: 1;
> +    machine_class->default_cpus = machine_class->default_cpus ?: 1;

This is consistent with the existing code that initialized
max_cpus, but I'd prefer to initialize these defaults inside
hw/core/machine.c:machine_class_init().  It can be done in a
follow-up patch after 2.11, though.

> +
> +    /* default to machine_class->default_cpus */
> +    smp_cpus = machine_class->default_cpus;
> +    max_cpus = machine_class->default_cpus;
> +
>      smp_parse(qemu_opts_find(qemu_find_opts("smp-opts"), NULL));
>  
> -    machine_class->max_cpus = machine_class->max_cpus ?: 1; /* Default to UP */
> +    /* sanity-check smp_cpus and max_cpus against machine_class */
> +    if (smp_cpus < machine_class->min_cpus) {
> +        error_report("Invalid SMP CPUs %d. The min CPUs "
> +                     "supported by machine '%s' is %d", smp_cpus,
> +                     machine_class->name, machine_class->min_cpus);
> +        exit(1);
> +    }
>      if (max_cpus > machine_class->max_cpus) {
>          error_report("Invalid SMP CPUs %d. The max CPUs "
>                       "supported by machine '%s' is %d", max_cpus,

Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>

-- 
Eduardo
