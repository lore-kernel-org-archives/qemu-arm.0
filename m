Received: by 10.223.150.237 with SMTP id u100csp425892wrb;
        Tue, 7 Nov 2017 11:49:04 -0800 (PST)
X-Google-Smtp-Source: ABhQp+RmzguDsnHSRpejdC+sA5MaXeZd23YN2cz3EZZX3u+j6u6ZiYBnVBheYJuMlpKCROTdAVdQ
X-Received: by 10.129.137.2 with SMTP id z2mr12509253ywf.159.1510084144555;
        Tue, 07 Nov 2017 11:49:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1510084144; cv=none;
        d=google.com; s=arc-20160816;
        b=tiVxYe5KYPNhp8OkGjNPojiM0d4avC/FgKJtf1tp5WixuiHPyJLprhV2WdlIoTcgLW
         DikijW0clFlWULtUlplMITAwuh9ctrO4STPwyq5oYpBpCXlfI0TyzVEzStxHd5Za3RRW
         fjZTaFzhZ+fwe8alqxQktTK2pFzDzAp1KKbgh90tfHDtiTpDOM5LD6GrF3NBocxu56ym
         CO2focEjVA6Gkf0Ffnd06V1iYsU41HmIe+9cZJHiORmvd16W4A4S9jrOdNja28Zqowwq
         GfUf53/wrTKgziGOvufm6YJTfF2mbd8Ej4CQt9L5/syOGsjP0TDxQqWjX+Wxs/kUUmZX
         uWHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=ZgHQlW7RT3fWubKzaa+1vCyBe9w0/XnYAPzyO73OUi4=;
        b=w+8u/1GFg1CbV2olI/1t5kfMHH+vWBWf3onzvXMtFnljacpPk7Ge2YlSYZOmVPtX+C
         G2/rm00qsAbiglUf1Of0ke7iZ+tNMS7Qx7GHj31//xzgGevDzkX0jzX1ylnrPbR0Pqhf
         JDfMijAArUaAD4d9+hXsrGThft++KORQgjgQBpKislejS5cRQfuiH4VFLL2nsvTwgoTw
         yVqQ5zYu5AgSg7SCt/zqF3eWdWemU/zf6mJTmBvaukyWTBHWU8Mv5kZYkuL5alxdVgrk
         hA0JOJqMr69Wjg6e4D3hHVkc2m6gtDODfXEcVgtdRv70di10S6HOsYUtkcRDQJ7bpMpq
         yo0Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=RAiIvx59;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c9si428128ybk.216.2017.11.07.11.49.04
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 07 Nov 2017 11:49:04 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=RAiIvx59;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:55588 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eC9rs-0005Hi-0h
	for alex.bennee@linaro.org; Tue, 07 Nov 2017 14:49:04 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46719)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1eC9rf-0005Ec-Ha
	for qemu-arm@nongnu.org; Tue, 07 Nov 2017 14:48:53 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1eC9rd-00032X-P9
	for qemu-arm@nongnu.org; Tue, 07 Nov 2017 14:48:51 -0500
Received: from mail-wm0-x241.google.com ([2a00:1450:400c:c09::241]:53953)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1eC9rZ-00031G-FG; Tue, 07 Nov 2017 14:48:45 -0500
Received: by mail-wm0-x241.google.com with SMTP id r196so6365270wmf.2;
	Tue, 07 Nov 2017 11:48:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=ZgHQlW7RT3fWubKzaa+1vCyBe9w0/XnYAPzyO73OUi4=;
	b=RAiIvx59ZmSYohh+WX5oaW7vxtpbgR0kR+SE8Z3tB3zG8oQqglVbfQ2qB2/pBTzj7c
	Wrju0AtK2RjIEOZoaTcBzkAbvVg4JfsmUl+LvLJU3n1/iHLhjsiFKNqRCeeF29Im0BEh
	xci7WhgtGpo8Tx3Pg4PEgUwm97eZEv/P/lgp7AzawwzIkxsB3YQ/EZn3/OVFAczMPKVi
	io4TYsS1R2M+r+NjGoPJpNEpREGcX79EG5ZVDebop2uVMHJi1BcZf5q2hSqOZOY1be3f
	L8/+jgAeDxhPBZSmGq7iEhLJnb2JSh+Y2dueFCwlTuc7X6Wb3e3jU37ZP8GWSCwrVKoC
	t46Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=ZgHQlW7RT3fWubKzaa+1vCyBe9w0/XnYAPzyO73OUi4=;
	b=A/Ts53CwEDSznqvrDEmCPoNHshYaE5Pi8DuMj4eVwDYfHcJ3NBiIERBLEeHgmqDarc
	hXYlE1SxmNMivrrpFDzueLlKHL6BO5pqu8I+OurDlyAWGgK89FskgCkxC2N4A0kkGhgb
	zZDmzNcJwux4QqrqU4uBNmceUKzLSlk/we7wX/QuHRfOlfyGCmvWC9HvPBFqufI5Cq6I
	cYrxMvsa/UWBvDmtignsMAMJHFP+ai9rMURt25RicYY6GcJtpPyNk7OSpNpfApUzK1Ta
	fdbbUlqtalu2dH9e/yUyIyLGhqCEzf2OsGq0JV+oFuf+r75Ajulk3vEKWaVTx2V2QDo1
	WjIw==
X-Gm-Message-State: AJaThX53gtijO2dVf1eyQT85U0CMT3H9G0DgFUYNTFUoR95troKZticn
	N60GMPzUQjuELhUlXl78XvQgTV/Tt0Uhkiyv7V8=
X-Received: by 10.28.54.133 with SMTP id y5mr219845wmh.6.1510084124002; Tue,
	07 Nov 2017 11:48:44 -0800 (PST)
MIME-Version: 1.0
Received: by 10.28.147.11 with HTTP; Tue, 7 Nov 2017 11:48:13 -0800 (PST)
In-Reply-To: <20171107193251.GD3111@localhost.localdomain>
References: <1509734853-3014-1-git-send-email-cota@braap.org>
	<20171103185610.GA3907@flamenco>
	<20171103200233.GI3111@localhost.localdomain>
	<20171103222407.GA22411@flamenco>
	<20171106141022.GO3111@localhost.localdomain>
	<20171106215454.GB2152@flamenco>
	<20171107193251.GD3111@localhost.localdomain>
From: Alistair Francis <alistair.francis@xilinx.com>
Date: Tue, 7 Nov 2017 11:48:13 -0800
X-Google-Sender-Auth: TwKo6Yop-SpXoVUePMGxfd0ef74
Message-ID: <CAKmqyKPOjUVV2nk7rtTudQRT=j7YGbNROoob1eALr7KJ29CCdQ@mail.gmail.com>
To: Eduardo Habkost <ehabkost@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::241
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
	Richard Henderson <richard.henderson@linaro.org>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	"Emilio G. Cota" <cota@braap.org>, qemu-arm <qemu-arm@nongnu.org>,
	Marcel Apfelbaum <marcel@redhat.com>, Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 8HksVKAzWdOY

On Tue, Nov 7, 2017 at 11:32 AM, Eduardo Habkost <ehabkost@redhat.com> wrote:
> On Mon, Nov 06, 2017 at 04:54:54PM -0500, Emilio G. Cota wrote:
>> On Mon, Nov 06, 2017 at 12:10:22 -0200, Eduardo Habkost wrote:
>> > On Fri, Nov 03, 2017 at 06:24:07PM -0400, Emilio G. Cota wrote:
>> > >  /**
>> > >   * MachineClass:
>> > >   * @max_cpus: maximum number of CPUs supported. Default: 1
>> > > + * @force_max_cpus: if set, force the global max_cpus to match @max_cpus
>> > >   * @min_cpus: minimum number of CPUs supported. Default: 1
>> > >   * @default_cpus: number of CPUs instantiated if none are specified. Default: 1
>> > >   * @get_hotplug_handler: this function is called during bus-less
>> >
>> > If we have a field containing the default value for smp_cpus
>> > (default_cpus), what about a default_max_cpus field for the
>> > default value of max_cpus?  This could make the rules a bit
>> > easier to follow.
>> >
>> > (But I wonder if there's a way we can do this without introducing
>> > another MachineClass field and making the initialization code
>> > more complex.)
>>
>> I don't think the rules are too hard to follow, since they're trivial
>> for most machines because the defaults are reasonable (i.e. they
>> only set max_cpus, and everything else is set to 1). Some machines
>> though are tricky in what can and cannot support, e.g. the Xilinx
>> ones we've been dealing with in this thread.
>>
>> wrt .default_max_cpus instead of .force_max_cpus: it lets users
>> shoot themselves in the foot, so I wouldn't go this route.
>> For instance, what do we do if the user passes maxcpus < default_max_cpus?
>> max_cpus would be set to maxcpus, yet they could still pass the
>> -global override that instantiates two extra CPUs, and at that point
>> we'd fail (in TCG) without providing a meaningful error.
>>
>> We could increase maxcpus to default_max_cpus, but at that point
>> default_max_cpus becomes the same thing as force_max_cpus (!).
>>
>> An alternative I've come up with is to have a field that specifies how
>> many CPUs could be created in addition to those specified in max_cpus
>> (in the Xilinx case these would be the RPUs). Patch below.
>>
>> > The fact that MachineClass::max_cpus and the 'max_cpus' globals
>> > have completely different meanings makes this confusing enough.
>> > Maybe we should rename the 'max_cpus' global variable to
>> > 'max_hotplug_cpus'.
>>
>> I have no trouble with their different meanings, although I admit
>> I am now quite well acquainted with this code so my bias is strong :-)
>>
>> Thanks,
>>
>>               Emilio
>>
>> ---8<---
>>
>> Subject: [PATCH] hw: add .{additional_max,min,default}_cpus fields to
>>  machine_class
>>
>> max_cpus needs to be an upper bound on the number of vCPUs
>> initialized; otherwise TCG region initialization breaks.
>>
>> Some boards initialize a hard-coded number of vCPUs, which is not
>> captured by the global max_cpus. Fix it by adding the .min_cpus
>> field to machine_class.
>>
>> A subset of those boards can also instantiate additional vCPUs
>> beyond what is specified in -smp, e.g. via -global overrides. To
>> ensure that max_cpus remains an upper bound on the number of vCPUs
>> that can be instantiated, we also add the .additional_max_cpus field
>> to machine_class.
>
> Setting max_cpus > smp_cpus is supposed to be useful only for CPU
> hotplug, and this doesn't seem to be the case here.  I would
> prefer to make the CPU creation code not care about max_cpus at
> all unless it is dealing with CPU hotplug, but this would require
> auditing existing code that could be allocating data structures
> based on max_cpus.
>
> In either case, it looks like the series sent by Alistair:
>   Subject: [PATCH v1 0/2]  Xilinx ZCU102 fixes for 2.11
> makes max_additional_cpus unnecessary, doesn't it?

Yes, it doesn't need the max_additional_cpus at all.

I would still like to see the default_cpus in, as I think that is
really useful. Otherwise 2.10 has 4 A53s and 2.11 has 1 A53 by default
which I think is confusing.

Thanks,
Alistair

>
>
>>
>> This commit also changes some user-facing behaviour: we now die if
>> -smp is below this hard-coded vCPU minimum instead of silently
>> ignoring the passed -smp value (sometimes announcing this by printing
>> a warning). However, the introduction of .default_cpus lessens the
>> likelihood that users will notice this: if -smp isn't set, we now
>> assign the value in .default_cpus to both smp_cpus and max_cpus. IOW,
>> if a user does not set -smp, they always get a correct number of vCPUs.
>>
>> This change fixes 3468b59 ("tcg: enable multiple TCG contexts in
>> softmmu", 2017-10-24), which broke TCG initialization for some
>> ARM boards.
>>
>> Fixes: 3468b59e18b179bc63c7ce934de912dfa9596122
>> Reported-by: Thomas Huth <thuth@redhat.com>
>> Suggested-by: Peter Maydell <peter.maydell@linaro.org>
>> Signed-off-by: Emilio G. Cota <cota@braap.org>
>> ---
>>  hw/arm/exynos4_boards.c | 12 ++++--------
>>  hw/arm/raspi.c          |  2 ++
>>  hw/arm/xlnx-zcu102.c    |  9 ++++++++-
>>  include/hw/boards.h     | 10 ++++++++++
>>  vl.c                    | 38 +++++++++++++++++++++++++++++++++++---
>>  5 files changed, 59 insertions(+), 12 deletions(-)
>>
>> diff --git a/hw/arm/exynos4_boards.c b/hw/arm/exynos4_boards.c
>> index f1441ec..750162c 100644
>> --- a/hw/arm/exynos4_boards.c
>> +++ b/hw/arm/exynos4_boards.c
>> @@ -27,7 +27,6 @@
>>  #include "qemu-common.h"
>>  #include "cpu.h"
>>  #include "sysemu/sysemu.h"
>> -#include "sysemu/qtest.h"
>>  #include "hw/sysbus.h"
>>  #include "net/net.h"
>>  #include "hw/arm/arm.h"
>> @@ -129,13 +128,6 @@ exynos4_boards_init_common(MachineState *machine,
>>                             Exynos4BoardType board_type)
>>  {
>>      Exynos4BoardState *s = g_new(Exynos4BoardState, 1);
>> -    MachineClass *mc = MACHINE_GET_CLASS(machine);
>> -
>> -    if (smp_cpus != EXYNOS4210_NCPUS && !qtest_enabled()) {
>> -        error_report("%s board supports only %d CPU cores, ignoring smp_cpus"
>> -                     " value",
>> -                     mc->name, EXYNOS4210_NCPUS);
>> -    }
>>
>>      exynos4_board_binfo.ram_size = exynos4_board_ram_size[board_type];
>>      exynos4_board_binfo.board_id = exynos4_board_id[board_type];
>> @@ -189,6 +181,8 @@ static void nuri_class_init(ObjectClass *oc, void *data)
>>      mc->desc = "Samsung NURI board (Exynos4210)";
>>      mc->init = nuri_init;
>>      mc->max_cpus = EXYNOS4210_NCPUS;
>> +    mc->min_cpus = EXYNOS4210_NCPUS;
>> +    mc->default_cpus = EXYNOS4210_NCPUS;
>>      mc->ignore_memory_transaction_failures = true;
>>  }
>>
>> @@ -205,6 +199,8 @@ static void smdkc210_class_init(ObjectClass *oc, void *data)
>>      mc->desc = "Samsung SMDKC210 board (Exynos4210)";
>>      mc->init = smdkc210_init;
>>      mc->max_cpus = EXYNOS4210_NCPUS;
>> +    mc->min_cpus = EXYNOS4210_NCPUS;
>> +    mc->default_cpus = EXYNOS4210_NCPUS;
>>      mc->ignore_memory_transaction_failures = true;
>>  }
>>
>> diff --git a/hw/arm/raspi.c b/hw/arm/raspi.c
>> index 5941c9f..cd5fa8c 100644
>> --- a/hw/arm/raspi.c
>> +++ b/hw/arm/raspi.c
>> @@ -167,6 +167,8 @@ static void raspi2_machine_init(MachineClass *mc)
>>      mc->no_floppy = 1;
>>      mc->no_cdrom = 1;
>>      mc->max_cpus = BCM2836_NCPUS;
>> +    mc->min_cpus = BCM2836_NCPUS;
>> +    mc->default_cpus = BCM2836_NCPUS;
>>      mc->default_ram_size = 1024 * 1024 * 1024;
>>      mc->ignore_memory_transaction_failures = true;
>>  };
>> diff --git a/hw/arm/xlnx-zcu102.c b/hw/arm/xlnx-zcu102.c
>> index e2d15a1..0f1837e 100644
>> --- a/hw/arm/xlnx-zcu102.c
>> +++ b/hw/arm/xlnx-zcu102.c
>> @@ -185,6 +185,10 @@ static void xlnx_ep108_machine_class_init(ObjectClass *oc, void *data)
>>      mc->block_default_type = IF_IDE;
>>      mc->units_per_default_bus = 1;
>>      mc->ignore_memory_transaction_failures = true;
>> +    mc->max_cpus = XLNX_ZYNQMP_NUM_APU_CPUS;
>> +    mc->max_additional_cpus = XLNX_ZYNQMP_NUM_RPU_CPUS;
>> +    mc->min_cpus = XLNX_ZYNQMP_NUM_APU_CPUS;
>> +    mc->default_cpus = XLNX_ZYNQMP_NUM_APU_CPUS;
>>  }
>>
>>  static const TypeInfo xlnx_ep108_machine_init_typeinfo = {
>> @@ -240,7 +244,10 @@ static void xlnx_zcu102_machine_class_init(ObjectClass *oc, void *data)
>>      mc->block_default_type = IF_IDE;
>>      mc->units_per_default_bus = 1;
>>      mc->ignore_memory_transaction_failures = true;
>> -    mc->max_cpus = XLNX_ZYNQMP_NUM_APU_CPUS + XLNX_ZYNQMP_NUM_RPU_CPUS;
>> +    mc->max_cpus = XLNX_ZYNQMP_NUM_APU_CPUS;
>> +    mc->max_additional_cpus = XLNX_ZYNQMP_NUM_RPU_CPUS;
>> +    mc->min_cpus = XLNX_ZYNQMP_NUM_APU_CPUS;
>> +    mc->default_cpus = XLNX_ZYNQMP_NUM_APU_CPUS;
>>  }
>>
>>  static const TypeInfo xlnx_zcu102_machine_init_typeinfo = {
>> diff --git a/include/hw/boards.h b/include/hw/boards.h
>> index 191a5b3..be582dd 100644
>> --- a/include/hw/boards.h
>> +++ b/include/hw/boards.h
>> @@ -102,6 +102,13 @@ typedef struct {
>>
>>  /**
>>   * MachineClass:
>> + * @max_cpus: maximum number of CPUs supported. Default: 1
>> + * @max_additional_cpus: # of CPUs that can be instantiated in addition to those
>> + *    instantiated with -smp. For instance, if a machine has 4 main CPUs and 2
>> + *    optional CPUs (e.g. instantiated via -global overrides), then @max_cpus
>> + *    and @max_additional_cpus will be set to 4 and 2, respectively. Default: 0
>> + * @min_cpus: minimum number of CPUs supported. Default: 1
>> + * @default_cpus: number of CPUs instantiated if none are specified. Default: 1
>>   * @get_hotplug_handler: this function is called during bus-less
>>   *    device hotplug. If defined it returns pointer to an instance
>>   *    of HotplugHandler object, which handles hotplug operation
>> @@ -167,6 +174,9 @@ struct MachineClass {
>>      BlockInterfaceType block_default_type;
>>      int units_per_default_bus;
>>      int max_cpus;
>> +    int max_additional_cpus;
>> +    int min_cpus;
>> +    int default_cpus;
>>      unsigned int no_serial:1,
>>          no_parallel:1,
>>          use_virtcon:1,
>> diff --git a/vl.c b/vl.c
>> index ec29909..e3ee36e 100644
>> --- a/vl.c
>> +++ b/vl.c
>> @@ -160,8 +160,8 @@ Chardev *virtcon_hds[MAX_VIRTIO_CONSOLES];
>>  Chardev *sclp_hds[MAX_SCLP_CONSOLES];
>>  int win2k_install_hack = 0;
>>  int singlestep = 0;
>> -int smp_cpus = 1;
>> -unsigned int max_cpus = 1;
>> +int smp_cpus;
>> +unsigned int max_cpus;
>>  int smp_cores = 1;
>>  int smp_threads = 1;
>>  int acpi_enabled = 1;
>> @@ -4330,12 +4330,44 @@ int main(int argc, char **argv, char **envp)
>>      smp_parse(qemu_opts_find(qemu_find_opts("smp-opts"), NULL));
>>
>>      machine_class->max_cpus = machine_class->max_cpus ?: 1; /* Default to UP */
>> +    machine_class->min_cpus = machine_class->min_cpus ?: 1;
>> +    machine_class->default_cpus = machine_class->default_cpus ?: 1;
>> +
>> +    /* if -smp is not set, default to mc->default_cpus */
>> +    if (!smp_cpus) {
>> +        smp_cpus = machine_class->default_cpus;
>> +        max_cpus = machine_class->default_cpus;
>> +    }
>> +
>> +    /* sanity-check smp_cpus and max_cpus */
>> +    if (smp_cpus < machine_class->min_cpus) {
>> +        error_report("Invalid SMP CPUs %d. The min CPUs "
>> +                     "supported by machine '%s' is %d", smp_cpus,
>> +                     machine_class->name, machine_class->min_cpus);
>> +        exit(1);
>> +    }
>>      if (max_cpus > machine_class->max_cpus) {
>> -        error_report("Invalid SMP CPUs %d. The max CPUs "
>> +        error_report("Invalid max SMP CPUs %d. The max CPUs "
>>                       "supported by machine '%s' is %d", max_cpus,
>>                       machine_class->name, machine_class->max_cpus);
>>          exit(1);
>>      }
>> +    if (max_cpus < machine_class->min_cpus) {
>> +        error_report("Invalid max SMP CPUs %d. The min CPUs "
>> +                     "supported by machine '%s' is %d", max_cpus,
>> +                     machine_class->name, machine_class->min_cpus);
>> +        exit(1);
>> +    }
>> +
>> +    /*
>> +     * Some boards can instantiate additional CPUs, e.g. by overriding
>> +     * device params via -global arguments. Update max_cpus so that
>> +     * we are sure to have an upper bound on the maximum number of
>> +     * vCPUs that might be instantiated.
>> +     */
>> +    if (machine_class->max_additional_cpus) {
>> +        max_cpus += machine_class->max_additional_cpus;
>> +    }
>>
>>      /*
>>       * Get the default machine options from the machine if it is not already
>> --
>> 2.7.4
>>
>
> --
> Eduardo
>
