Received: by 10.223.150.237 with SMTP id u100csp73828wrb;
        Fri, 10 Nov 2017 15:22:56 -0800 (PST)
X-Google-Smtp-Source: AGs4zMYSYX7OxIoUylp6p/YNJ5TyuJTGZ7kHCeX8V3pFY2vbZv8dNTPpnJBbGOE4/Tl4Bw/G788/
X-Received: by 10.37.29.193 with SMTP id d184mr1400505ybd.188.1510356176001;
        Fri, 10 Nov 2017 15:22:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1510356175; cv=none;
        d=google.com; s=arc-20160816;
        b=ar/2QFL+JT5qIh7wSI9DtIIvseVjpg2WVaK3aLGzzqCAIjX+UyR5UjEKd/xzo1Sr1j
         mA+7GOtTf/wtz/bHoVfe1/dE8X7wFTIy/UogyH+TFdB+0a6Y5ch2isReiCjt5CwdOnc7
         jUV3O6M9zd2DEiJ0/RmNQzR3yMZVv+IElgJhcyJvPa5yLlQTai1WeeEAa8oqUftqmgda
         I88efE8eiNEJedOyf8hel1SqWSHVrOv3yAmh03uX3N8ks7qJ8yalEFam4/5EcGS2bWF2
         2QnWfdrmwetGAXckcrYZtwDtQdumv0nUIvYfCco35k/lriXeXcXGjl3MXVxbOxsRUoLS
         JFsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=pgoRebMkAGvFtuurTuUDiekVneQmEw/ZjQWt7/7lKB0=;
        b=XeoQo+fBmBO0CJ6+CjTjRBZL6OyRjC3WgdrL2b+MBiBAvbScxrOBQ2AFmSJaUq3WDz
         UpIziI9zMtEkmppUsfvTjhnU6di8KReJaUnWTgWNMTVdyloqdDukBH4dSfSGreIUL2U0
         gvmqRexaIwEulSGY66YgGxAVJVLfQ+CXBvgjYitkuRBmfezWoCAnHvRewG8HgwFYXPHs
         2PeHB9Xasp1meHa2VjmTsJjswrlzi3m4mMpxVulFJiLaHSMkZwEIQZ7BxJTZyk+WVX5V
         ZbkIk8lSTZLaiS//CDGUr9Gg5Or9M92Ks9PMPTuRq5MTGAPoQv+RXSSZUv6IyMS2oDRa
         8Q0A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=oBC/oZPp;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v132si620035ybv.376.2017.11.10.15.22.55
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 10 Nov 2017 15:22:55 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=oBC/oZPp;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:43866 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eDIdT-0000hd-Ez
	for alex.bennee@linaro.org; Fri, 10 Nov 2017 18:22:55 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59723)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1eDIcX-0000Ov-IK
	for qemu-devel@nongnu.org; Fri, 10 Nov 2017 18:21:58 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1eDIcW-0000Iw-6s
	for qemu-devel@nongnu.org; Fri, 10 Nov 2017 18:21:57 -0500
Received: from mail-wr0-x241.google.com ([2a00:1450:400c:c0c::241]:45544)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1eDIcV-0000Ib-Ka; Fri, 10 Nov 2017 18:21:56 -0500
Received: by mail-wr0-x241.google.com with SMTP id y9so9852696wrb.2;
	Fri, 10 Nov 2017 15:21:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=pgoRebMkAGvFtuurTuUDiekVneQmEw/ZjQWt7/7lKB0=;
	b=oBC/oZPpmpnSc5Pcz3mY9tNZGw1XngelN0EoTHlzvPhSBXmKWy8oZiYMk7emuY/Ejk
	2BfNSjxVScCcdjDTTfPobjuOh8Tvx66TQSyAArq/HdfvncB9RERNhvr+H5lzxFOMU3jJ
	sp4xFZdN4sGV+DfJGgM5dEQzG9LlwTNH5wbPsan/eZKPzdpryUYbLpw9Fg6fky3dN7sp
	x+UqfKA4bXWnKnkoal6xViiS/WO9ss79za7xeK1tGiq20xLpiZx57q91C91UR7i9goFf
	fc6ACszJ/bjK5sHKA86BeU4oqrygtyKS4pmLrIlmb5s3M5CSqKF43TCiKqHjq0RJ1tJr
	h8UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=pgoRebMkAGvFtuurTuUDiekVneQmEw/ZjQWt7/7lKB0=;
	b=bOEEyjILR0npwGz/piEdGDrJSF4F0VfzYuxyAz4Zig0MUG1NMnBZBk9yALtYW5zGXr
	fYOyYCWpO9IuZFihYSxlToKn4Fmdxit4/dGozxYmWRAL9iA8aawLJRuS6TNprBauVjOs
	SEwQXhmirrQh+K8fsvd4bR1Rjk+WQU3RlMaKxsqHGyL2gyQ971R2mS0+aKztkPX4wDYv
	+sPVLQiI0uVSg1oDbu8REh4UjnWNLblYKYVlmeDXM+fsd/b4ftJV9OkNCVrWBB+ALvtx
	8GX73vmlwuH/376zq0lPj7LunSReWyjvn6SjfXqL3CfIWP0p2cm3kWNQ5myOkoitnryc
	xrEw==
X-Gm-Message-State: AJaThX5hoi58fH378hLX0IMccvHQ8WX9qIJWZ+IBFZTxGZfaAUKk9qCq
	23DB0O5rfPQUmsH/kUDkfTR6Jx4q0e0+yJNszcU=
X-Received: by 10.223.132.129 with SMTP id 1mr1481051wrg.136.1510356114526;
	Fri, 10 Nov 2017 15:21:54 -0800 (PST)
MIME-Version: 1.0
Received: by 10.28.147.11 with HTTP; Fri, 10 Nov 2017 15:21:23 -0800 (PST)
In-Reply-To: <1510343626-25861-6-git-send-email-cota@braap.org>
References: <1510343626-25861-1-git-send-email-cota@braap.org>
	<1510343626-25861-6-git-send-email-cota@braap.org>
From: Alistair Francis <alistair.francis@xilinx.com>
Date: Fri, 10 Nov 2017 15:21:23 -0800
X-Google-Sender-Auth: Y8Wvd7BTQcBBxUkJ-7iBq7-EpAs
Message-ID: <CAKmqyKMsj5OcZiQDTsBZP-4-GK-+PuNrHvHtfo0yDy0J-8Moqw@mail.gmail.com>
To: "Emilio G. Cota" <cota@braap.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::241
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
	Eduardo Habkost <ehabkost@redhat.com>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	qemu-arm <qemu-arm@nongnu.org>, Marcel Apfelbaum <marcel@redhat.com>,
	"Edgar E . Iglesias" <edgar.iglesias@gmail.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: qtcB4VpVru22

On Fri, Nov 10, 2017 at 11:53 AM, Emilio G. Cota <cota@braap.org> wrote:
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

Reviewed-by: Alistair Francis <alistair.francis@xilinx.com>

Alistair

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
> --
> 2.7.4
>
>
