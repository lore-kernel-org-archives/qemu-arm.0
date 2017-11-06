Received: by 10.223.150.237 with SMTP id u100csp3130212wrb;
        Mon, 6 Nov 2017 14:33:28 -0800 (PST)
X-Google-Smtp-Source: ABhQp+THrPGK8EAofP/IEq2jUQNn5L0dm9PLBgfplWZHXutT8mwdTlfZVeVPhGhB4ykgIq148nFO
X-Received: by 10.13.228.198 with SMTP id n189mr11096834ywe.499.1510007608244;
        Mon, 06 Nov 2017 14:33:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1510007608; cv=none;
        d=google.com; s=arc-20160816;
        b=JkwmRTnWjHdQoxsiokNxl9RHURPZ98EpleH7G0B6/zDdBKVejaJ+LawSHcmIDRWh8L
         hjB62UZ43V/D8AYQ873B5cLuPlr9a7GmgdKSvn5vrFcQATWA61vU2hdL1XCY4cuFH3lm
         kIToQBE3qLkLdtCVNw4hQcCzhyk5k55m5s+SluX3Yvdf+z0izt4N6nxKo0okSs2mpgmj
         /G0opPHbd7ir2MhRjRIDEcbJ0DHbnJ8q9eRroBL99LI+S2ETUY1W6xUF9AQcpNmVb7JP
         x1B9I6XfnLDGfAYLyS8/YadN3fyS85zI5EemaL7IFVF+GTV3gWQ8+CeE4NgyHVhyC/wZ
         dXig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=awaO5NQ9n6PDKfIiGqI2Qt/lGeceaH+V8/ZD2QQCRao=;
        b=tILmbI2cBN3LA+5SSWnQrJVbv5m1rZ+7Cm2gDrKVmXr5YNZj0N+7yifxx+746kl66P
         zvQ+QIaP0ZVeFbC0/t//Oa7aFDy5OpphdSrz/brY5z4Y3BX6L1LCdPmfaYqerXpHi3d5
         0omrg8huLuptlfkHvLa140yQdv74WBHfe1KzaxifW2P0JpZRvk7AMpyfC8G88JstV7XI
         1lavi9WJ3BlsVle3foMGkIRzWvrz8aRRbcqjRQM1ZnVIIMEKfeWpdQIhDh6V1MH4Dsea
         dGolL8swUAvbpNvxQ+X+IfNdv09MbEAaLE74Oua0yaXcA4A6pGBlLSCD3dNDE5C7MNqd
         QgTw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Gfx6gCs9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h68si2751671yba.202.2017.11.06.14.33.28
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 06 Nov 2017 14:33:28 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Gfx6gCs9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:50524 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eBpxP-0006tW-L9
	for alex.bennee@linaro.org; Mon, 06 Nov 2017 17:33:27 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36143)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1eBpxE-0006sH-5G
	for qemu-arm@nongnu.org; Mon, 06 Nov 2017 17:33:18 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1eBpxA-0000SY-W9
	for qemu-arm@nongnu.org; Mon, 06 Nov 2017 17:33:15 -0500
Received: from mail-wr0-x242.google.com ([2a00:1450:400c:c0c::242]:45717)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1eBpx5-0000QS-Pj; Mon, 06 Nov 2017 17:33:08 -0500
Received: by mail-wr0-x242.google.com with SMTP id y9so10115487wrb.2;
	Mon, 06 Nov 2017 14:33:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=awaO5NQ9n6PDKfIiGqI2Qt/lGeceaH+V8/ZD2QQCRao=;
	b=Gfx6gCs9BN+pIs3tXQoZHCeRNfUBbT0aNWmrDQ0pF+wIY2jM9sgAp3D43LFERlZie1
	bpbQ3/A4U5hnm/Wir+UXDvK/wVWysXIIGYCPcrHebUkoWE8helZAEsy2Wm9ZJJ9cu8PS
	lIE8RAcM42g/O8/cS8YAlGfh8x8uWXiAyPYzbx9x0YoGuK54sUkstYA8lDdGw6+6SnwB
	tzFcBmlZautIPh4pXh+HzuJpvZ1J8f/2utcSPEloEvUETAeG+ugaYoCVYKTTneUBkjBY
	8Bzs8Wv/nVxzhHXvcXVGHLCx0dG06h+sxaHEYVuo4JzVK2OJl7x12SdjdJOGo1TEHmxe
	ObiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=awaO5NQ9n6PDKfIiGqI2Qt/lGeceaH+V8/ZD2QQCRao=;
	b=kb4lT6aBI7eT7tTiQGf2gj7ZRlm2bde0adwE55U8r1oRZS8D0qCGiui197aQu8ZuRy
	cek5HuNrg+HV7k1U4LTJHtf9V4P+UIF2EcTVCxyPzkCSllNMoxpP6gTGhjCVKfME9Ky+
	+kXEMZwRtl2C1St7yyt2foTCiJr8IC0o9TTkWXQd2b6IrKzWwVLiZHlXd+YOtJw5YtQI
	5yaGp8U5h2OAKWKG+IuJGOR+GcqxuHao/YhhfBtWK05/kZGc/ABPh3/vnembVlJS1g38
	ttoqPTvy/UKN4UC4huHI6wq390yXCViWJ9xK5iZzjwYGq3FvcLAjN9LKk2zMYq/FNfxT
	MNZg==
X-Gm-Message-State: AJaThX59sXqa7BnIVbDaCv+Bbw/3f9S7+sRrx+BC1hiWWHg8HBXON+mB
	aMMNZrrvaM+FBJcctJK21SVdAjDzxZXcg3c4tA8=
X-Received: by 10.223.132.163 with SMTP id 32mr542748wrg.66.1510007586226;
	Mon, 06 Nov 2017 14:33:06 -0800 (PST)
MIME-Version: 1.0
Received: by 10.28.147.11 with HTTP; Mon, 6 Nov 2017 14:32:35 -0800 (PST)
In-Reply-To: <20171106215454.GB2152@flamenco>
References: <1509734853-3014-1-git-send-email-cota@braap.org>
	<20171103185610.GA3907@flamenco>
	<20171103200233.GI3111@localhost.localdomain>
	<20171103222407.GA22411@flamenco>
	<20171106141022.GO3111@localhost.localdomain>
	<20171106215454.GB2152@flamenco>
From: Alistair Francis <alistair.francis@xilinx.com>
Date: Mon, 6 Nov 2017 14:32:35 -0800
X-Google-Sender-Auth: t983G535phfSRLkihBzpBYfC3UU
Message-ID: <CAKmqyKOSOHdpzfu_WMPWo6Mh_kfmYhem0nR=BD3_hUws0tGEww@mail.gmail.com>
To: "Emilio G. Cota" <cota@braap.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::242
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
	Eduardo Habkost <ehabkost@redhat.com>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	qemu-arm <qemu-arm@nongnu.org>, Marcel Apfelbaum <marcel@redhat.com>,
	Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: AlEC/irv9srS

On Mon, Nov 6, 2017 at 1:54 PM, Emilio G. Cota <cota@braap.org> wrote:
> On Mon, Nov 06, 2017 at 12:10:22 -0200, Eduardo Habkost wrote:
>> On Fri, Nov 03, 2017 at 06:24:07PM -0400, Emilio G. Cota wrote:
>> >  /**
>> >   * MachineClass:
>> >   * @max_cpus: maximum number of CPUs supported. Default: 1
>> > + * @force_max_cpus: if set, force the global max_cpus to match @max_cpus
>> >   * @min_cpus: minimum number of CPUs supported. Default: 1
>> >   * @default_cpus: number of CPUs instantiated if none are specified. Default: 1
>> >   * @get_hotplug_handler: this function is called during bus-less
>>
>> If we have a field containing the default value for smp_cpus
>> (default_cpus), what about a default_max_cpus field for the
>> default value of max_cpus?  This could make the rules a bit
>> easier to follow.
>>
>> (But I wonder if there's a way we can do this without introducing
>> another MachineClass field and making the initialization code
>> more complex.)
>
> I don't think the rules are too hard to follow, since they're trivial
> for most machines because the defaults are reasonable (i.e. they
> only set max_cpus, and everything else is set to 1). Some machines
> though are tricky in what can and cannot support, e.g. the Xilinx
> ones we've been dealing with in this thread.
>
> wrt .default_max_cpus instead of .force_max_cpus: it lets users
> shoot themselves in the foot, so I wouldn't go this route.
> For instance, what do we do if the user passes maxcpus < default_max_cpus?
> max_cpus would be set to maxcpus, yet they could still pass the
> -global override that instantiates two extra CPUs, and at that point
> we'd fail (in TCG) without providing a meaningful error.
>
> We could increase maxcpus to default_max_cpus, but at that point
> default_max_cpus becomes the same thing as force_max_cpus (!).
>
> An alternative I've come up with is to have a field that specifies how
> many CPUs could be created in addition to those specified in max_cpus
> (in the Xilinx case these would be the RPUs). Patch below.
>
>> The fact that MachineClass::max_cpus and the 'max_cpus' globals
>> have completely different meanings makes this confusing enough.
>> Maybe we should rename the 'max_cpus' global variable to
>> 'max_hotplug_cpus'.
>
> I have no trouble with their different meanings, although I admit
> I am now quite well acquainted with this code so my bias is strong :-)
>
> Thanks,
>
>                 Emilio
>
> ---8<---
>
> Subject: [PATCH] hw: add .{additional_max,min,default}_cpus fields to
>  machine_class
>
> max_cpus needs to be an upper bound on the number of vCPUs
> initialized; otherwise TCG region initialization breaks.
>
> Some boards initialize a hard-coded number of vCPUs, which is not
> captured by the global max_cpus. Fix it by adding the .min_cpus
> field to machine_class.
>
> A subset of those boards can also instantiate additional vCPUs
> beyond what is specified in -smp, e.g. via -global overrides. To
> ensure that max_cpus remains an upper bound on the number of vCPUs
> that can be instantiated, we also add the .additional_max_cpus field
> to machine_class.
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

Sorry for the silence here, I noticed these were broken just before I
went on holidays but didn't get a chance to fix anything.

For the Xilinx case I was thinking of patching the machine code to
sanely follow the -smp option.

-smp 1 -> Only create 1 A53
-smp 4 -> Create 4 A53s
-smp 6 -> Create all the CPUs

I see a lot of advantages in not forcing the smallest number of CPUs
to be 4 unless we really have to.

I do see a nice advantage in being able to set the default smp option
to something not 1 so the default closely matches hardware, but users
can override that if they want to.

So for the patch below I like the default_cpus option, but for Xilinx
at least I would like to patch the logic to follow the -smp option
instead of force a minimum.

Thanks,
Alistair

>
> Fixes: 3468b59e18b179bc63c7ce934de912dfa9596122
> Reported-by: Thomas Huth <thuth@redhat.com>
> Suggested-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Emilio G. Cota <cota@braap.org>
> ---
>  hw/arm/exynos4_boards.c | 12 ++++--------
>  hw/arm/raspi.c          |  2 ++
>  hw/arm/xlnx-zcu102.c    |  9 ++++++++-
>  include/hw/boards.h     | 10 ++++++++++
>  vl.c                    | 38 +++++++++++++++++++++++++++++++++++---
>  5 files changed, 59 insertions(+), 12 deletions(-)
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
> index e2d15a1..0f1837e 100644
> --- a/hw/arm/xlnx-zcu102.c
> +++ b/hw/arm/xlnx-zcu102.c
> @@ -185,6 +185,10 @@ static void xlnx_ep108_machine_class_init(ObjectClass *oc, void *data)
>      mc->block_default_type = IF_IDE;
>      mc->units_per_default_bus = 1;
>      mc->ignore_memory_transaction_failures = true;
> +    mc->max_cpus = XLNX_ZYNQMP_NUM_APU_CPUS;
> +    mc->max_additional_cpus = XLNX_ZYNQMP_NUM_RPU_CPUS;
> +    mc->min_cpus = XLNX_ZYNQMP_NUM_APU_CPUS;
> +    mc->default_cpus = XLNX_ZYNQMP_NUM_APU_CPUS;
>  }
>
>  static const TypeInfo xlnx_ep108_machine_init_typeinfo = {
> @@ -240,7 +244,10 @@ static void xlnx_zcu102_machine_class_init(ObjectClass *oc, void *data)
>      mc->block_default_type = IF_IDE;
>      mc->units_per_default_bus = 1;
>      mc->ignore_memory_transaction_failures = true;
> -    mc->max_cpus = XLNX_ZYNQMP_NUM_APU_CPUS + XLNX_ZYNQMP_NUM_RPU_CPUS;
> +    mc->max_cpus = XLNX_ZYNQMP_NUM_APU_CPUS;
> +    mc->max_additional_cpus = XLNX_ZYNQMP_NUM_RPU_CPUS;
> +    mc->min_cpus = XLNX_ZYNQMP_NUM_APU_CPUS;
> +    mc->default_cpus = XLNX_ZYNQMP_NUM_APU_CPUS;
>  }
>
>  static const TypeInfo xlnx_zcu102_machine_init_typeinfo = {
> diff --git a/include/hw/boards.h b/include/hw/boards.h
> index 191a5b3..be582dd 100644
> --- a/include/hw/boards.h
> +++ b/include/hw/boards.h
> @@ -102,6 +102,13 @@ typedef struct {
>
>  /**
>   * MachineClass:
> + * @max_cpus: maximum number of CPUs supported. Default: 1
> + * @max_additional_cpus: # of CPUs that can be instantiated in addition to those
> + *    instantiated with -smp. For instance, if a machine has 4 main CPUs and 2
> + *    optional CPUs (e.g. instantiated via -global overrides), then @max_cpus
> + *    and @max_additional_cpus will be set to 4 and 2, respectively. Default: 0
> + * @min_cpus: minimum number of CPUs supported. Default: 1
> + * @default_cpus: number of CPUs instantiated if none are specified. Default: 1
>   * @get_hotplug_handler: this function is called during bus-less
>   *    device hotplug. If defined it returns pointer to an instance
>   *    of HotplugHandler object, which handles hotplug operation
> @@ -167,6 +174,9 @@ struct MachineClass {
>      BlockInterfaceType block_default_type;
>      int units_per_default_bus;
>      int max_cpus;
> +    int max_additional_cpus;
> +    int min_cpus;
> +    int default_cpus;
>      unsigned int no_serial:1,
>          no_parallel:1,
>          use_virtcon:1,
> diff --git a/vl.c b/vl.c
> index ec29909..e3ee36e 100644
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
> @@ -4330,12 +4330,44 @@ int main(int argc, char **argv, char **envp)
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
> +        error_report("Invalid max SMP CPUs %d. The min CPUs "
> +                     "supported by machine '%s' is %d", max_cpus,
> +                     machine_class->name, machine_class->min_cpus);
> +        exit(1);
> +    }
> +
> +    /*
> +     * Some boards can instantiate additional CPUs, e.g. by overriding
> +     * device params via -global arguments. Update max_cpus so that
> +     * we are sure to have an upper bound on the maximum number of
> +     * vCPUs that might be instantiated.
> +     */
> +    if (machine_class->max_additional_cpus) {
> +        max_cpus += machine_class->max_additional_cpus;
> +    }
>
>      /*
>       * Get the default machine options from the machine if it is not already
> --
> 2.7.4
>
>
