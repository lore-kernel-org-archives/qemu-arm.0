Received: by 10.223.150.237 with SMTP id u100csp452159wrb;
        Tue, 7 Nov 2017 12:16:09 -0800 (PST)
X-Google-Smtp-Source: ABhQp+Qqha854HagAQaDVKjQ43uGZyRYKyYexppMvE5zJgdSYAaLGDefuNcxBHeQOiZoAbgKRNPp
X-Received: by 10.129.84.8 with SMTP id i8mr13099316ywb.114.1510085769173;
        Tue, 07 Nov 2017 12:16:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1510085769; cv=none;
        d=google.com; s=arc-20160816;
        b=XM8V4bHY+YRH7mtVJBOMEenAk0Niy7xaMGZTrNedFExZo9w65DjhFZjIc/8M/s1wNn
         4MDibRsdf07K79a9qax/Zp+72qpqDgcPI5sor+JidHzX2zsYRyMDWcDbP5MQ9rhTShNO
         fIgWI+xI/unUblOslFBHHvSEoEldszwidPAPPSY/ByK5y4t/hhVn85wMHrXFgE9aTtZc
         mHCmKt6eSHTzhAW7gwPtpA0yZPj0QnVGGistQr+7wgg5F6PbRWnqajUNzRn2prt80NSL
         JM6ZE0PTANR7ixUTSl/0KDTCVfJOAJs254q+3LF5PtHny12EEh8DIWilmWGvRsB3h9G/
         b5RA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dmarc-filter:arc-authentication-results;
        bh=lqnDVCxnAmMznxGoBlCqnTB7yRLV97TupZECI5kbHMo=;
        b=gIKg0jfeBeikiTkCptu2Ids9obSe0P9tB3GNGA/6WXzQJ9b1IWQRrbWuUpyDuDe+Qb
         Q3qegq52QQ8ws/4lNnCKsF+pvGZ1ozHE1qK906rRW67eKhidAncoGhOEpzBSenbV2KAF
         rr2m8YOKnnV6J5OGa/YPwmVic9aLnNrAxqJSCR//zpcYBpcXaqsrECAZMXNTn4xglQeA
         Q1DY6YS9kLjRQMttj02r24FUkPJuxg8Y6s2YfhwsJtdLFJZpz+i2ZVB1zbNZSnHtMRoQ
         vGuCYCCAaDEOeQuyP+XLDsweQByqrMzjAAJScoEDYm6kYAB1rlYIm6tDdTlB2JudcI25
         9/tQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i130si462013ywg.492.2017.11.07.12.16.08
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 07 Nov 2017 12:16:09 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:55691 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eCAI4-0006Ht-K3
	for alex.bennee@linaro.org; Tue, 07 Nov 2017 15:16:08 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53758)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1eCAHt-0006G4-2f
	for qemu-arm@nongnu.org; Tue, 07 Nov 2017 15:15:58 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1eCAHo-0006Fn-Pr
	for qemu-arm@nongnu.org; Tue, 07 Nov 2017 15:15:57 -0500
Received: from mx1.redhat.com ([209.132.183.28]:52812)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1eCAHo-0006FG-Gk; Tue, 07 Nov 2017 15:15:52 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 74EE582101;
	Tue,  7 Nov 2017 20:15:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 74EE582101
Authentication-Results: ext-mx02.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx02.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=ehabkost@redhat.com
Received: from localhost (ovpn-116-35.gru2.redhat.com [10.97.116.35])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 80D706BF72;
	Tue,  7 Nov 2017 20:15:47 +0000 (UTC)
Date: Tue, 7 Nov 2017 18:15:45 -0200
From: Eduardo Habkost <ehabkost@redhat.com>
To: "Emilio G. Cota" <cota@braap.org>
Message-ID: <20171107201545.GA32606@localhost.localdomain>
References: <1509734853-3014-1-git-send-email-cota@braap.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1509734853-3014-1-git-send-email-cota@braap.org>
X-Fnord: you can see the fnord
User-Agent: Mutt/1.9.1 (2017-09-22)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Tue, 07 Nov 2017 20:15:51 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH] hw: add .min_cpus and
 .default_cpus fields to machine_class
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>,
	Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
	Alistair Francis <alistair.francis@xilinx.com>,
	qemu-arm@nongnu.org, Marcel Apfelbaum <marcel@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: RL4xatHCEf2q

On Fri, Nov 03, 2017 at 02:47:33PM -0400, Emilio G. Cota wrote:
> max_cpus needs to be an upper bound on the number of vCPUs
> initialized; otherwise TCG region initialization breaks.
> 
> Some boards initialize a hard-coded number of vCPUs, which is not
> captured by the global max_cpus. Fix it by adding the .min_cpus
> field to machine_class.
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
>  hw/arm/exynos4_boards.c | 12 ++++--------
>  hw/arm/raspi.c          |  2 ++
>  hw/arm/xlnx-zcu102.c    |  5 +++++
>  include/hw/boards.h     |  5 +++++
>  vl.c                    | 28 +++++++++++++++++++++++++---
>  5 files changed, 41 insertions(+), 11 deletions(-)
> 
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
> index e2d15a1..395d1b5 100644
> --- a/hw/arm/xlnx-zcu102.c
> +++ b/hw/arm/xlnx-zcu102.c
> @@ -185,6 +185,9 @@ static void xlnx_ep108_machine_class_init(ObjectClass *oc, void *data)
>      mc->block_default_type = IF_IDE;
>      mc->units_per_default_bus = 1;
>      mc->ignore_memory_transaction_failures = true;
> +    mc->max_cpus = XLNX_ZYNQMP_NUM_APU_CPUS + XLNX_ZYNQMP_NUM_RPU_CPUS;
> +    mc->min_cpus = XLNX_ZYNQMP_NUM_APU_CPUS;
> +    mc->default_cpus = XLNX_ZYNQMP_NUM_APU_CPUS;
>  }
>  
>  static const TypeInfo xlnx_ep108_machine_init_typeinfo = {
> @@ -241,6 +244,8 @@ static void xlnx_zcu102_machine_class_init(ObjectClass *oc, void *data)
>      mc->units_per_default_bus = 1;
>      mc->ignore_memory_transaction_failures = true;
>      mc->max_cpus = XLNX_ZYNQMP_NUM_APU_CPUS + XLNX_ZYNQMP_NUM_RPU_CPUS;
> +    mc->min_cpus = XLNX_ZYNQMP_NUM_APU_CPUS;
> +    mc->default_cpus = XLNX_ZYNQMP_NUM_APU_CPUS;
>  }
>  
>  static const TypeInfo xlnx_zcu102_machine_init_typeinfo = {
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
> diff --git a/vl.c b/vl.c
> index ec29909..3ca5ee8 100644
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
> @@ -4330,12 +4330,34 @@ int main(int argc, char **argv, char **envp)
>      smp_parse(qemu_opts_find(qemu_find_opts("smp-opts"), NULL));
>  
>      machine_class->max_cpus = machine_class->max_cpus ?: 1; /* Default to UP */
> +    machine_class->min_cpus = machine_class->min_cpus ?: 1;
> +    machine_class->default_cpus = machine_class->default_cpus ?: 1;
> +
> +    /* if -smp is not set, default to mc->default_cpus */
> +    if (!smp_cpus) {
> +        smp_cpus = machine_class->default_cpus;
> +        max_cpus = machine_class->default_cpus;
> +    }

I suggest doing this before smp_parse(), so any validation of
smp_cpus inside smp_parse will apply to the value we're setting
here (e.g. the replay_add_blocker() call in smp_parse() will
work).

> +
> +    /* sanity-check smp_cpus and max_cpus */
> +    if (smp_cpus < machine_class->min_cpus) {
> +        error_report("Invalid SMP CPUs %d. The min CPUs "
> +                     "supported by machine '%s' is %d", smp_cpus,
> +                     machine_class->name, machine_class->min_cpus);
> +        exit(1);
> +    }
>      if (max_cpus > machine_class->max_cpus) {
> -        error_report("Invalid SMP CPUs %d. The max CPUs "
> +        error_report("Invalid max SMP CPUs %d. The max CPUs "
>                       "supported by machine '%s' is %d", max_cpus,
>                       machine_class->name, machine_class->max_cpus);
>          exit(1);
>      }
> +    if (max_cpus < machine_class->min_cpus) {

smp_parse() already ensures max_cpus >= smp_cpus, and you are
already checking if smp_cpus < machine_class->min_cpus above.  Is
it really possible to trigger this error message?

Except for that, the patch looks good to me.

> +        error_report("Invalid max SMP CPUs %d. The min CPUs "
> +                     "supported by machine '%s' is %d", max_cpus,
> +                     machine_class->name, machine_class->min_cpus);
> +        exit(1);
> +    }
>  
>      /*
>       * Get the default machine options from the machine if it is not already
> -- 
> 2.7.4
> 
> 

-- 
Eduardo
